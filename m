Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050D7CDD1B4
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 14:27:35 +0000 (UTC)
Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
 by mx.groups.io with SMTP id smtpd.web11.70475.1727447251700538937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 07:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: electromag.com.au, ip: 203.30.46.146, mailfrom: preid@electromag.com.au)
Received: (qmail 28260 invoked by uid 5089); 27 Sep 2024 14:27:29 -0000
Received: by simscan 1.2.0 ppid: 28029, pid: 28030, t: 1.1362s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
Received: from unknown (HELO ?10.1.1.107?) (preid@electromag.com.au@203.221.104.202)
  by anchovy3.45ru.net.au with ESMTPA; 27 Sep 2024 14:27:27 -0000
Message-ID: <69f13a36-b90f-4488-ba0b-0e3bade0c7cb@electromag.com.au>
Date: Fri, 27 Sep 2024 22:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] Re: [OE-core] scarthgap: kernel build failure
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
 <CANPvuRmnake=1PpTVhmuJBV0euZSCfPy1vS=Q7t4cCgo91qTsQ@mail.gmail.com>
Content-Language: en-AU
From: Phil Reid <preid@electromag.com.au>
In-Reply-To: <CANPvuRmnake=1PpTVhmuJBV0euZSCfPy1vS=Q7t4cCgo91qTsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 14:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205027

G'day José,

On 27/09/2024 16:51, Jose Quaresma wrote:
> 
> 
> Phil Reid via lists.openembedded.org <http://lists.openembedded.org> <preid=electromag.com.au@lists.openembedded.org <mailto:electromag.com.au@lists.openembedded.org>> escreveu (sexta, 27/09/2024 à(s) 01:59):
> 
>     G'day All,
> 
> 
>     Just started migrating our layer to scarthgap and ran into an issue building the kernel.
>     We maintian a local git repo with a custom branch with all our patches and build from that.
>     So no KMETA layer. In addition we're building a couple of kernels and packaging them into the image.
>     We're using linux-dummy kernel for the image and then building the kernel using bitbake.
>     Possibly the problem is we're doing something the wrong(tm) way.
> 
> 
>     Anyway after migrating we get the following when building a kernel.
> 
>     ================================
>     NOTE: Executing Tasks
>     ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme: A KBUILD_DEFCONFIG 'socfpga_defconfig' was specified, but not present in the source tree (/home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux-tst/6.6.52+git/kernel-source/arch/arm/configs/)
>     ERROR: linux-tst-6.6.52+git-r0 do_kernel_configme: ExecutionError('/home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux-tst/6.6.52+git/temp/run.do_kernel_configme.8888', 1, None, None)
>     ERROR: Logfile of failure stored in: /home/preid/dev/v2024.09/tmp-glibc/work/cyclone5-emit-linux-gnueabi/linux-tst/6.6.52+git/temp/log.do_kernel_configme.8888
>     ERROR: Task (/home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/linux-tst_6.6.bb:do_kernel_configme) failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 989 tasks of which 973 didn't need to be rerun and 1 failed.
>     NOTE: Writing buildhistory
>     NOTE: Writing buildhistory took: 1 seconds
> 
>     Summary: 1 task failed:
>         /home/preid/dev/v2024.09/layers/meta-emit/recipes/emit-linux/linux-tst_6.6.bb:do_kernel_configme
>     ================================
> 
> 
>     I've managed to trace the change in behaviour to a change in archiver.bbclass.
>     Reverting the change to is_work_shared and everything is happy.
> 
>     ================================
>     diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
>     index 9d286224d6..9bac870449 100644
>     --- a/meta/classes/archiver.bbclass
>     +++ b/meta/classes/archiver.bbclass
>     @@ -472,9 +472,10 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
>                os.chdir(cwd)
> 
>        def is_work_shared(d):
>     -    sharedworkdir = os.path.join(d.getVar('TMPDIR'), 'work-shared')
>     -    sourcedir = os.path.realpath(d.getVar('S'))
>     -    return sourcedir.startswith(sharedworkdir)
>     +    pn = d.getVar('PN')
>     +    return pn.startswith('gcc-source') or \
>     +        bb.data.inherits_class('kernel', d) or \
>     +        (bb.data.inherits_class('kernelsrc', d) and d.expand("${TMPDIR}/work-shared") in d.getVar('S'))
> 
> 
> Looks like the issue comes from the archiver.bbclass but you may be misled by that very fact.
> Can you try to build the kernel without the archiver?
> 
> INHERIT:remove = "archiver"

This didn't seem to do anything when I put it in the bb file

But removing archiver from the local / site conf file and the problem has gone away.
So I guess that narrows it down a little.

I'll try and track down the history of the change to is_work_shared next week to see if that enlightens me.
It allows me to progress with testing other parts of the update as well.

THanks
Phil



> 
> This just confirms if there are no more problems.
> If everything is fine, the problem is really with the archiver.bbclass.
> However, I use the archiver.bbclass daily with several bsp in my distro and I have no problems.
> 
> Jose
> 
> 
>        # Run do_unpack and do_patch
>        python do_unpack_and_patch() {
>     ================================
> 
> 
> 
> 
>     And here's a small reproducer kernel bb.
>     I've tested this with cyclone5 machine.
> 
>     ================================
>     KBRANCH ?= "v6.6/standard/base"
> 
>     require recipes-kernel/linux/linux-yocto.inc
> 
>     # CVE exclusions
>     include recipes-kernel/linux/cve-exclusion.inc
>     include recipes-kernel/linux/cve-exclusion_6.6.inc
> 
>     # board specific branches
>     SRCREV_machine ?= "561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2"
> 
>     SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRANCH%7D;protocol=https>"
> 
>     LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>     LINUX_VERSION ?= "6.6.52"
> 
>     PV = "${LINUX_VERSION}+git"
> 
>     KCONF_BSP_AUDIT_LEVEL = "1"
> 
>     COMPATIBLE_MACHINE = "^(qemux86-64|cyclone5)$"
> 
>     # Functionality flags
>     KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> 
>     KERNEL_PACKAGE_NAME          = "kernel-tst"
> 
>     KBUILD_DEFCONFIG:qemux86-64  = "x86_64_defconfig"
>     KCONFIG_MODE:qemux86-64      = "--alldefconfig"
> 
>     KBUILD_DEFCONFIG:cyclone5    = "socfpga_defconfig"
>     KCONFIG_MODE:cyclone5        = "--alldefconfig"
> 
>     =========================
> 
> 
>     The key trigger here I think is:
>     - PREFERRED_PROVIDER_virtual/kernel is not equal to the kernel package.
>     - KERNEL_PACKAGE_NAME is not equal to kernel
> 
>     And therefore the source doesn't end up in work-shared.
>     But something somewhere expects the kernel-source folder to be in work-shared
>     and ends up deleting the kernel-source folder
> 
>     After do_patch the kernel-source still contains the source files.
>     The git checkout folder has gone by this step.
> 
>     Then during do_unpack_and_patch the kernel-source folder is cleaned of all files.
>     They've been moved to archiver-work/git
> 
>     And after that kernel-source is empty.
> 
> 
>     So is the method we're using to build the kernel still supported?
>     Or are we doing something wrong...
> 
> 
> 
>     -- 
>     Regards
>     Phil Reid
> 
> 
> -- 
> Best regards,
> 
> José Quaresma

-- 
Regards
Phil Reid
  

