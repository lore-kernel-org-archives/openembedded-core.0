Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1S8Z4t-00078V-4p
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 16:28:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2GFJcV7004958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 08:19:38 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 16 Mar 2012 08:19:38 -0700
Message-ID: <4F635A09.2020900@windriver.com>
Date: Fri, 16 Mar 2012 10:19:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <840A81C1B782724A8EB52725BD519EFF33809F54@MBX20.4emm.local>
	<1798766.ZRL8z9Exog@helios>
	<CABcZANnAXXBa-UQYiMijWVvX7ggGEGh65bzQaFPNq-nFt4KbYQ@mail.gmail.com>
In-Reply-To: <CABcZANnAXXBa-UQYiMijWVvX7ggGEGh65bzQaFPNq-nFt4KbYQ@mail.gmail.com>
Subject: Re: race condition... in cp?
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
X-List-Received-Date: Fri, 16 Mar 2012 15:28:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/12 9:59 AM, Chris Larson wrote:
> On Fri, Mar 16, 2012 at 4:35 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com>  wrote:
>> On Friday 16 March 2012 06:58:40 James Limbouris wrote:
>>> Hi,
>>>
>>> I got a strange error when bitbaking two images after removing some files in
>>> the deploy/images folder. It looks a whole lot like the cp's from the
>>> individual tasks were racing... I didn't know this sort of thing could
>>> happen.
>>>
>>> bitbake rica-dev-image rica-release-example-image
>>> <...>
>>> NOTE: Resolving any missing task queue dependencies
>>> NOTE: multiple providers are available for runtime libssl
>>> (openssl-nativesdk, openssl) NOTE: consider defining a PREFERRED_PROVIDER
>>> entry to match libssl NOTE: Preparing runqueue
>>> NOTE: Executing SetScene Tasks
>>> NOTE: Executing RunQueue Tasks
>>> NOTE: Running task 3673 of 3692 (ID: 23,
>>> /home/james/oe/meta-rica5/recipes/images/rica-release-example-image.bb,
>>> do_rootfs) NOTE: Running task 3685 of 3692 (ID: 8,
>>> /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs)
>>> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Started
>>> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Started
>>> ERROR: Function failed: do_rootfs (see
>>> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-imag
>>> e-1.0-r0/temp/log.do_rootfs.4011 for further information) ERROR: Logfile of
>>> failure stored in:
>>> /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-imag
>>> e-1.0-r0/temp/log.do_rootfs.4011
>>> Log data follows:
>>> | ERROR: Function failed: do_rootfs (see
>>> | /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rica-dev-im
>>> | age-1.0-r0/temp/log.do_rootfs.4011 for further information) cp: cannot
>>> | create regular file
>>> | `/home/james/oe/build/tmp-eglibc/deploy/images/rica5/README_-_DO_NOT_DELE
>>> | TE_FILES_IN_THIS_DIRECTORY.txt': File exists
>>> NOTE: package rica-dev-image-1.0-r0: task do_rootfs: Failed
>>> ERROR: Task 8 (/home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb,
>>> do_rootfs) failed with exit code '1' Waiting for 1 active tasks to finish:
>>> 0: rica-release-example-image-1.0-r0 do_rootfs (pid 4008)
>>> NOTE: package rica-release-example-image-1.0-r0: task do_rootfs: Succeeded
>>> NOTE: Tasks Summary: Attempted 3685 tasks of which 3683 didn't need to be
>>> rerun and 1 failed. pseudo: You must set the PSEUDO_PREFIX environment
>>> variable to run pseudo. pseudo: You must set the PSEUDO_PREFIX environment
>>> variable to run pseudo.
>>>
>>> Summary: 1 task failed:
>>>    /home/james/oe/meta-rica5/recipes/images/rica-dev-image.bb, do_rootfs
>>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>>>
>>> Perhaps we should be using cp -f, or discarding the result?
>>
>> I tried to use -n originally, but apparently that's not a standard option we
>> can expect to be available everywhere so it had to be removed. I think in this
>> case the easiest thing to do is just ignore the failure since if it's genuine
>> it's not catastrophic and also it's highly unlikely you won't get a subsequent
>> failure elsewhere. I'll prepare a fix.
>
> I had a fix for this, but apparently I never got it merged. As you
> say, the easiest way is to ignore failure. You can't use -f, because
> of how cp does its checking - the failure still occurs. And of course
> you can't check for existence first, as that's a race. The fix I had
> just used shell redirections (>) instead of cp, as they don't care if
> the file already exists.

Shell redirect has it's own race issues.  If two processes happen to redirect at 
the same time, then you can get the contents mixed together.

The way I've always addressed this is replace a "cp" or "cp -f" with a:

tmpfile=`mktemp dest.XXXXX`
cp source $tmpfile (or use a shell redirect here)
mv $tmpfile dest

The 'mv' operation is atomic, all other operations are not guaranteed to be...

--Mark


