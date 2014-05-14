Return-Path: <sstncr@gmail.com>
X-Greylist: delayed 1221 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 13:40:31 UTC
Received: from mail-wg0-f51.google.com (unknown [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8F39865F09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:40:31 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x13so1946044wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R3jARiYGGCifcN+YF6Tzxc5MB8LJeAt9Rqne6yJVg2o=;
	b=W2cDWQpBwrIimP4torzlCZKBmpHUo0kam5Raglp5Gh8bPY28+KBq2EBxCrIGM8MxsA
	9QrOpvP7ZJormp5R1yZFuQlfwT8W5zU9VXitXgry692WMmQUhhsOXBJy/oE3ox5IhOe8
	6we+YPESqDvGVDekVAJR/SqSSJHfOLjbcCSToLN7v0T1stdlqrPsqhNkN1USWccIa+E6
	U1KRmFwQGp39VN3ItXSfs0dgoOEHbaadhJHIj4WPyT0aMxd14I7lmZvN08NIlMXK2Uva
	aCJnmvtiBjPOngWseaZqskPx612xTDOooBudwwzSG4L8LKWgy9RuC5VxEhYH/iUcSKqm
	51ag==
MIME-Version: 1.0
X-Received: by 10.180.80.232 with SMTP id u8mr26165935wix.13.1400073179887;
	Wed, 14 May 2014 06:12:59 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Wed, 14 May 2014 06:12:59 -0700 (PDT)
In-Reply-To: <1399981408-11719-1-git-send-email-georgex.l.musat@intel.com>
References: <1399981408-11719-1-git-send-email-georgex.l.musat@intel.com>
Date: Wed, 14 May 2014 16:12:59 +0300
Message-ID: <CANr+NRuFD=WMLgqjE2pXUkFBixaa3AAgKk2agm31jf_zgAJkTw@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/runtime: Update test names with testopia tc numbers.
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
X-List-Received-Date: Wed, 14 May 2014 13:40:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi Lucian,

I'm afraid that you added some lines in the smart.py module, that
shouldn't be there. Also a patch description would be nice, explaining
why this is needed.

On Tue, May 13, 2014 at 2:43 PM, Lucian Musat <georgex.l.musat@intel.com> wrote:
> diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
> index 195f117..735cbca 100644
> --- a/meta/lib/oeqa/runtime/smart.py
> +++ b/meta/lib/oeqa/runtime/smart.py
> @@ -14,7 +14,7 @@ def setUpModule():
>
>  class SmartRepoTest(SmartTest):
> @@ -54,11 +54,13 @@ class SmartRepoTest(SmartTest):
>      @classmethod
>      def tearDownClass(self):
>          self.repo_server.stop()
> +       smartsRepo = SmartRepoTest
> +       smartsRepo.cleanup()
>

Those two lines shouldn't be here  and they don't seem to be correct anyway.

>
>  class SyslogTest(oeRuntimeTest):
>
> -    @skipUnlessPassed("test_ssh")
> -    def test_syslog_help(self):
> -        (status,output) = self.target.run('/sbin/syslogd --help')
> -        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
> -
> -    @skipUnlessPassed("test_syslog_help")
> -    def test_syslog_running(self):
> +    @skipUnlessPassed("test_ssh_tc_224")
> +    def test_syslog_help_tc_202(self):
> +        (status,output) = self.target.run('ls -l /sbin/syslogd')
> +        if ('busybox' in output):
> +               pass
> +       else:
> +               (status,output) = self.target.run('/sbin/syslogd --help')
> +               self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
> +
> +    @skipUnlessPassed("test_syslog_help_tc_202")
> +    def test_syslog_running_tc_202(self):
>          (status,output) = self.target.run(oeRuntimeTest.pscmd + ' | grep -i [s]yslogd')
>          self.assertEqual(status, 0, msg="no syslogd process, ps output: %s" % self.target.run(oeRuntimeTest.pscmd)[1])

Again you are doing more changes that the summary of the patch
suggests, you are more than renaming methods here... And why is that
needed? Why did it worked until now and what triggered this change for
this test?


Cheers,
Stefan

