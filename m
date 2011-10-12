Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RE04h-0002j3-Jm
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 16:46:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9CEefsR024933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 07:40:42 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 12 Oct 2011 07:40:39 -0700
Message-ID: <4E95A6E5.6090402@windriver.com>
Date: Wed, 12 Oct 2011 09:40:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1318279539.23801.68.camel@ted> <1318332940.23801.90.camel@ted>
In-Reply-To: <1318332940.23801.90.camel@ted>
Subject: Re: Some further build dependency timings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 14:46:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 10/11/11 6:35 AM, Richard Purdie wrote:
> On Mon, 2011-10-10 at 21:45 +0100, Richard Purdie wrote:
>> Just for reference, with a base configuration, sato image:
>>
>> real	50m8.223s
>> user	298m41.450s
>> sys	52m42.200s
>>
>> adding:
>>
>> ASSUME_PROVIDED =+ "bison-native flex-native sqlite3-native git-native"
>>
>> (and hacking the pseudo recipe to use a sqlite3-native):
>>
>> real	42m6.740s
>> user	296m21.940s
>> sys	52m25.220s
>>
>> We continue to have real dependency issues around gettext in both the
>> native and target builds...
> 
> So to continue the story, adding:
> 
> DEBUG_FLAGS = ""
> INHERIT_INSANE = ""
> PACKAGE_CLASSES = "package_ipk"
> USER_CLASSES = ""
> 
> Results in:
> 
> real	38m23.053s
> user	237m7.430s
> sys	39m3.720s
> 
> Then adding PSEUDO_RELOADED=yes to the environment of tasks not needing
> pseudo (hack patch below):
> 
> real	36m20.683s
> user	236m19.580s
> sys	37m54.450s
> 
> Finally, adding:
> 
> DISABLESTATIC = "--disable-static"
> DISABLESTATIC_pn-qemu = ""
> DISABLESTATIC_pn-qemu-native = ""
> DISABLESTATIC_pn-openssl = ""
> DISABLESTATIC_pn-openssl-native = ""
> EXTRA_OECONF += "${DISABLESTATIC}"
> 
> real	34m53.877s
> user	233m34.780s
> sys	38m50.190s
> 
> Cheers,
> 
> Richard
> 
> 
> --- a/bitbake/lib/bb/runqueue.py
> +++ b/bitbake/lib/bb/runqueue.py
> @@ -1096,6 +1096,10 @@ class RunQueueExecute:
>  
>              logger.debug(2, 'Running %s:%s under fakeroot, fakedirs: %s' %
>                              (fn, taskname, ', '.join(fakedirs)))
> +        else:
> +            envbackup["PSEUDO_RELOADED"] = os.environ.get("PSEUDO_RELOADED")
> +            os.environ["PSEUDO_RELOADED"] = "yes"
> +            fakeenv["PSEUDO_RELOADED"] = "yes"

PSEUDO_RELOADED was intended to only be used internally by pseudo.  Specifically
to signify to fork/exec that we're about to run the pseudo server process and to
remove PSEUDO from the LD_PRELOAD on the next fork/exec.

The system simply checks the environment on the fork-exec and doesn't check the
value on pseudo-load.  This is why it works.

That side effect means that any subsequent calls can NOT re-enable pseudo as
it's no longer in memory at all.

So what you are seeing at best is the time difference from avoiding the
LD_PRELOAD and the jump table setup.  (Even when pseudo is disabled, we need to
enable the jump table, we just pass the call to the original function.)

But more then likely because pseudo is no longer memory resident for the called
processes and it's sub-processes.. there is likely some place in the system that
uses pseudo functionality that is no longer functioning properly.

It would be interesting to determine first off, if there is anywhere pseudo
should be running that it currently isn't.  And second if this is simply due to
LD_PRELOAD time, or if enabling the jump table is the culprit.

One potential optimization, when PSEUDO_DISABLE=1 is to only setup the jump
table entries for fork/exec items.

Also if it is desired to unload pseudo, I'd suggest we add a new environment
variable to pseudo that is specific about unloading pseudo, instead of using the
existing PSEUDO_RELOADED.  Not only is the name confusing, but since it's an
internal item it's behavior may change or go away in the future.

(Below is from the pseudo man page:

      PSEUDO_RELOADED
               This purely internal variable is used to track state while try-
               ing to re-execute to get  rid  of  the  LD_PRELOAD  value  when
               spawning  a  server.  (The pseudo server itself cannot function
               running in the pseudo environment.)
)

>  
>          sys.stdout.flush()
>          sys.stderr.flush()
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



