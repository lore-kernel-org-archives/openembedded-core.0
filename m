Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6C660CEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 02:59:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0M2x8gY027970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jan 2014 18:59:08 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 21 Jan 2014 18:59:07 -0800
Message-ID: <52DF33F9.60202@windriver.com>
Date: Wed, 22 Jan 2014 10:59:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140115165513.GB3742@jama> <52D74086.4030602@windriver.com>
	<20140116092556.GD3742@jama> <52D7A760.4040804@windriver.com>
	<20140118122657.GU3742@jama> <52DE4EC0.0@windriver.com>
	<20140121123748.GB4100@jama>
In-Reply-To: <20140121123748.GB4100@jama>
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>, Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Wed, 22 Jan 2014 02:59:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/21/2014 08:37 PM, Martin Jansa wrote:
> On Tue, Jan 21, 2014 at 06:41:04PM +0800, Robert Yang wrote:
>>
>> Hi Martin,
>>
>> I've tested the archiver.bbclass with rm_work.bbclasss again, it works for me,
>> it seems that you only downloaded the archiver.bbclass was not enough, would
>> you please try this PULL? It is based on oe-core and on oe-core-contrib now:-)
>> And if the error occurs, would you please show the configuration and error
>> logs ?
>
> I've tried to enable "everything" to test it properly, so my config
> looks like this (BTW: it would be nice to show in local.conf.sample
> what are the default values):
>
> # Create source archive for complience with the licenses
> # Enable all to properly test newer archiver backported from oe-core/master
> INHERIT_DISTRO += "archiver"

I changed it to INHERIT += "archiver" since the INHERIT_DISTRO will override
this:

meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?= "debian devshell sstate 
license"

Everything works fine to me, I'm afraid that set INHERIT_DISTRO += "archiver"
may override other INHERIT_DISTRO's settings.

I also added INHERIT += "rm_work"

And please see my comments below.

> ARCHIVER_MODE[src] = "prepatch"
> ARCHIVER_MODE[diff] = "1"
> ARCHIVER_MODE[diff-exclude] ?= ".pc autom4te.cache patches"
> ARCHIVER_MODE[dumpdata] = "1"
> ARCHIVER_MODE[recipe] = "1"
> ARCHIVER_MODE[log] = "1"
>
> And error in do_patch:
>
> NOTE: recipe perf-1.0-r8: task do_patch: Started
> ERROR: Error executing a python function in /OE/openembedded-core/meta/recipes-kernel/perf/perf.bb:
> OSError: [Errno 2] No such file or directory: '/OE/tmp-eglibc/sysroots/qemux86/usr/src'

The perf's ${S} is sysroots/qemux86/usr/src/kernel, but the problem is that why
the /OE/tmp-eglibc/sysroots/qemux86/usr/src doesn't exist ? The rm_work doesn't
remove it, no matter how many times I tried, it still works.

So, please:

1) Check whether your other INHERIT_DISTRO settings have been overrided or not,
    and try to use INHERIT rather than INHERIT_DISTRO ?

2) If it still fails, would you please provide more info ? For example, how to
    reproduce it, exactly ?

3) It would be great if we can talk oneline, how about gtalk ? I will try to
    reach you there.

4) It would be great if others can help me to test it.

// Robert

>
> ERROR: The stack trace of python calls that resulted in this exception/failure was:
> ERROR:   File "do_ar_prepatch", line 6, in <module>
> ERROR:
> ERROR:   File "do_ar_prepatch", line 3, in do_ar_prepatch
> ERROR:
> ERROR:   File "archiver.bbclass", line 17, in create_tarball
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0002:def do_ar_prepatch(d):
> ERROR:      0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
> ERROR:      0004:
> ERROR:      0005:
> ERROR:  *** 0006:do_ar_prepatch(d)
> ERROR:      0007:
> ERROR: [From file: 'do_ar_prepatch', lineno: 6, function: <module>]
> ERROR:      0001:
> ERROR:      0002:def do_ar_prepatch(d):
> ERROR:  *** 0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
> ERROR:      0004:
> ERROR:      0005:
> ERROR:      0006:do_ar_prepatch(d)
> ERROR:      0007:
> ERROR: [From file: 'do_ar_prepatch', lineno: 3, function: do_ar_prepatch]
> ERROR:      0013:    srcdir = srcdir.rstrip('/')
> ERROR:      0014:    dirname = os.path.dirname(srcdir)
> ERROR:      0015:    basename = os.path.basename(srcdir)
> ERROR:      0016:    olddir = os.getcwd()
> ERROR:  *** 0017:    os.chdir(dirname)
> ERROR:      0018:    bb.note("Creating %s" % tarname)
> ERROR:      0019:    if (len(os.listdir(basename))) != 0:
> ERROR:      0020:        tar = tarfile.open(tarname, "w:gz")
> ERROR:      0021:        tar.add(basename)
> ERROR: [From file: 'archiver.bbclass', lineno: 17, function: create_tarball]
> ERROR: Function failed: do_ar_prepatch
> ERROR: Logfile of failure stored in: /OE/tmp-eglibc/work/i586-oe-linux/perf/1.0-r8/temp/log.do_patch.28364
> NOTE: recipe perf-1.0-r8: task do_patch: Failed
> ERROR: Task 20159 (/OE/openembedded-core/meta/recipes-kernel/perf/perf.bb, do_patch) failed with exit code '1'
>
>> git://git.openembedded.org/openembedded-core-contrib rbt/archiver
>>
>> // Robert
>>
>> On 01/18/2014 08:26 PM, Martin Jansa wrote:
>>> On Thu, Jan 16, 2014 at 05:33:20PM +0800, Robert Yang wrote:
>>>>
>>>>
>>>> On 01/16/2014 05:25 PM, Martin Jansa wrote:
>>>>> On Thu, Jan 16, 2014 at 10:14:30AM +0800, Robert Yang wrote:
>>>>>>
>>>>>>
>>>>>> On 01/16/2014 12:55 AM, Martin Jansa wrote:
>>>>>>> On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
>>>>>>>> * The archive*.bbclass didn't work, and there were a few problems, for
>>>>>>>>       example:
>>>>>>>>       1) There were a few duplicated code
>>>>>>>>       2) There was no src_dir.org (or orig), but the diff command still use
>>>>>>>>          it, and it is not easy to fix this issue if we don't change a lot
>>>>>>>>          of the code.
>>>>>>>>       3) It didn't archive the source for the native or gcc
>>>>>>>>       4) The work flow is not very well
>>>>>>>>       5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>>>>>>>>       6) And others ...
>>>>>>>>
>>>>>>>> * So that we have to refactor it, the benefits are:
>>>>>>>>       1) Fix the problems and make it work well.
>>>>>>>>       2) Reduce more than 400 lines in total.
>>>>>>>>       3) Make it easy to use.
>>>>>>>>
>>>>>>>> // Robert
>>>>>>>>
>>>>>>>> The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189fa674:
>>>>>>>>
>>>>>>>>       bitbake: toaster: Toaster GUI, generic search, filter and order (2014-01-10 15:20:26 +0000)
>>>>>>>>
>>>>>>>> are available in the git repository at:
>>>>>>>>
>>>>>>>>       git://git.pokylinux.org/poky-contrib rbt/archiver
>>>>>>>>       http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/archiver
>>>>>>>
>>>>>>> Can you send pull-request for oe-core?
>>>>>>>
>>>>>>
>>>>>> Here it is:
>>>>>> git://git.pokylinux.org/poky-contrib rbt/ar_oe
>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rbt/ar_oe
>>>>>
>>>>> This still looks like poky-contrib (so it will download whole
>>>>> poky-contrib when I add it as remote to oe-core repo).
>>>>>
>>>>
>>>> Sorry, I can't create repo on oe-contrib, seems that I lost my key.
>>>
>>> That's sad, you should send new one to khem to replace it, before
>>> someone else finds your old key.
>>>
>>>> How about:
>>>>
>>>> git fetch git://git.pokylinux.org/poky-contrib rbt/ar_oe
>>>
>>> That still fetches whole poky repo I'm not interested in.
>>>
>>> So I've downloaded just archiver.bbclass manually and tested it on my
>>> use-case, I can confirm that it doesn't remove required file anymore,
>>> but it seems that there is something terribly broken when used in
>>> combination with rm_work or multimachine builds.
>>>
>>> I haven't debugged it yet, but 2nd build (in the same directory) with
>>> this new archiver included almost every recipe failed in do_patch task.
>>>
>>>>>> // Robert
>>>>>>
>>>>>>>> Robert Yang (5):
>>>>>>>>       classes/archive*.bbclass: remove archive-*-source.bbclass
>>>>>>>>       archiver.bbclass: refactor it
>>>>>>>>       package_rpm.bbclass: archive the source to srpm package
>>>>>>>>       archiver.bbclass: move a few code to copyleft_compliance.bbclass
>>>>>>>>       local.conf.sample.extended: update for the archiver
>>>>>>>>
>>>>>>>>      meta-yocto/conf/local.conf.sample.extended     |  72 +--
>>>>>>>>      meta/classes/archive-configured-source.bbclass |  65 ---
>>>>>>>>      meta/classes/archive-original-source.bbclass   |  65 ---
>>>>>>>>      meta/classes/archive-patched-source.bbclass    |  65 ---
>>>>>>>>      meta/classes/archiver.bbclass                  | 723 ++++++++-----------------
>>>>>>>>      meta/classes/copyleft_compliance.bbclass       |  55 +-
>>>>>>>>      meta/classes/package_rpm.bbclass               |  31 +-
>>>>>>>>      7 files changed, 316 insertions(+), 760 deletions(-)
>>>>>>>>      delete mode 100644 meta/classes/archive-configured-source.bbclass
>>>>>>>>      delete mode 100644 meta/classes/archive-original-source.bbclass
>>>>>>>>      delete mode 100644 meta/classes/archive-patched-source.bbclass
>>>>>>>>
>>>>>>>> --
>>>>>>>> 1.8.3.1
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-core mailing list
>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>
>>>>>
>>>
>

