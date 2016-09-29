Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 149A36E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:31:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8T2VoVT011114
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Sep 2016 19:31:53 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 19:31:49 -0700
To: Seebs <seebs@seebs.net>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
	<CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <23b689b2-d61f-d6db-f49d-86682c9f84fc@windriver.com>
Date: Thu, 29 Sep 2016 10:31:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Sep 2016 02:31:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Peter,

Thanks for the reply, I tested your patch from git repo, it doesn't work,
the message goes to the terminal:
Child process exit status 4: lock_held

diff --git a/pseudo_server.c b/pseudo_server.c
index 8731d20..7c2db2f 100644
--- a/pseudo_server.c
+++ b/pseudo_server.c
@@ -162,6 +162,9 @@ pseudo_server_start(int daemonize) {
          * SIGUSR1, or until too much time has passed. */
         if (daemonize) {
                 int child;
+
+               /* make startup messages go away when invoked-as-daemon */
+               pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
                 child = fork();
                 if (child == -1) {
                         pseudo_diag("Couldn't fork child process: %s\n",
@@ -231,7 +234,6 @@ pseudo_server_start(int daemonize) {
                         setsid();
                         fclose(stdin);
                         fclose(stdout);
-                       pseudo_debug_logfile(PSEUDO_LOGFILE, 2);
                         /* and then just execute the server code normally.  */
                         /* Any logging will presumably go to logfile, but
                          * exit status will make it back to the parent for


the reproducer is:

$ kill -9 `ps aux | grep /usr/bin/pseud | awk '{print $2}'` ; 
/buildarea/lyang1/test_gen/tmp/sysroots/x86_64-linux/usr/bin/pseudo & 
/buildarea/lyang1/test_gen/tmp/sysroots/x86_64-linux/usr/bin/pseudo


And please see my reply inline.

On 09/28/2016 09:25 PM, Seebs wrote:
> On 28 Sep 2016, at 1:22, Robert Yang wrote:
>>
>> meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-log-and-make-log-cons.patch
>>
>
> I don't think this produces desireable behavior in the command-line use case; so
> far as I can tell, this would result in getting no messages at all now.
>
> We definitely don't want to unconditionally prepend "pseudo:" to absolutely all
> log messages, that'd be gigabytes of data in a lot of cases. Furthermore,

If there are gigabytes log messages, will 8 characters prefix "pseudo: "
contributes a lot to that ? And I didn't see many log messages when no
errors happen in a normal case (less than 10 lines or 0). "pseudo -x flags"
can produce more, but that is for debugging. I prefer adding prefix to all
the log messages based on the following reasons:
1) Make the log messages unify.
2) It is good for debugging when log messages print on terminal, just like what
    we saw this time (Child process exit status 4: lock_held"
3) How to figure out which one should add prefix, and which one should not ?
    It may cost a lot, but the gain is only for saving 8 characters in a line,
    is it worth ?

// Robert

> pseudo_diag() is sometimes used to produce partial lines. So
>     pseudo_diag("foo: ");
>     pseudo_diag("bar\n");

Should pseudo_diag() be used in this way ? I think no according to other log
utils such as python's logging module.

> would now produce
>     pseudo: foo: pseudo: bar
> which is not desireable. It would make more sense to add the prefix to the
> specific things you're likely to see during startup, of which there's only a few.
>
> I think the right answer probably involves distinguishing between cases where
> we're spawning a daemon because a client has requested one, and command-line
> invocation. This can be partially fixed by moving the pseudo_debug_logfile()
> call up, and making it conditional on opt_d, but then pseudo should also
> probably start a daemon directly (without that) rather than relying
> on the client spawning code when execing something. I can probably fix this
> soonish.
>
> -s
>

