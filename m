Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26CD1785CB;
	Thu, 14 Sep 2017 20:39:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8EKdlaH008897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Sep 2017 13:39:47 -0700
Received: from server.local (128.224.21.239) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 13:39:46 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <150514745160.18411.12374724192281962975@git.openembedded.org>
	<CA+chaQcO6meQ4kwAdz4sN46=NEY9QrmAUN5pCFbC=hji74tisw@mail.gmail.com>
	<CAC+thW3b_Q8fzxzyAQbVYuD-ESF+9vdARRhw5OqRJeaQW_MYtQ@mail.gmail.com>
	<cf38090a-8608-f44c-132a-4bfaaaf26dd8@windriver.com>
	<CA+chaQcOcdkbzxAM13ykZY5Hrm0mBkGCXm=C02hpdSAAcCmvTA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <42dca0c1-c0ab-919f-14a0-26d99a286986@windriver.com>
Date: Thu, 14 Sep 2017 16:39:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcOcdkbzxAM13ykZY5Hrm0mBkGCXm=C02hpdSAAcCmvTA@mail.gmail.com>
Cc: Paul Barker <paul@paulbarker.me.uk>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated (cc319b6 -> 2ebbeb6)
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
X-List-Received-Date: Thu, 14 Sep 2017 20:39:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2017-09-14 1:25 PM, Martin Jansa wrote:
> Today I've created backup of this broken state with:
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ mkdir 
> kernel-bad
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cp -ra 
> work-shared/raspberrypi3-64/ 
> work/raspberrypi3_64-webos-linux/linux-raspberrypi/ kernel-bad
> 
> then cleansstate:
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ bitbake 
> -c cleansstate virtual/kernel;
> 
> and now kernel_configme
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ bitbake 
> -c kernel_configme virtual/kernel;
> 
>   was successful, create new copy of current state:
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ mkdir 
> kernel-ok
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cp -ra 
> work-shared/raspberrypi3-64/ 
> work/raspberrypi3_64-webos-linux/linux-raspberrypi/ kernel-ok
> 
> I'm not trying to understand what kern-tools do here and what the
> ERROR: [ERROR]: no configuration queue found in outdir (.kernel-meta)
> actually meant, but .kernel-meta directories are a bit different:
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ ls -lah 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta:
> total 28K
> drwxr-xr-x  4 bitbake bitbake 4.0K Sep 13 13:27 .
> drwxr-xr-x 26 bitbake bitbake 4.0K Sep 13 13:27 ..
> -rw-r--r--  1 bitbake bitbake    1 Sep 13 13:27 bsp_definition
> drwxr-xr-x  3 bitbake bitbake 4.0K Sep 13 13:27 cfg
> -rw-r--r--  1 bitbake bitbake  217 Sep 13 13:27 meta-series
> drwxr-xr-x  2 bitbake bitbake 4.0K Sep 13 13:27 patches
> -rw-r--r--  1 bitbake bitbake   33 Sep 13 13:27 patch.queue
> lrwxrwxrwx  1 bitbake bitbake   11 Sep 13 13:27 series -> patch.queue
> 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta:
> total 40K
> drwxr-xr-x  5 bitbake bitbake 4.0K Sep 14 19:05 .
> drwxr-xr-x 26 bitbake bitbake 4.0K Sep 14 19:06 ..
> -rw-r--r--  1 bitbake bitbake    1 Sep 14 19:05 bsp_definition
> drwxr-xr-x  3 bitbake bitbake 4.0K Sep 14 19:05 cfg
> -rw-r--r--  1 bitbake bitbake   36 Sep 14 19:05 config.queue
> drwxr-xr-x  2 bitbake bitbake 4.0K Sep 14 19:05 configs
> -rw-r--r--  1 bitbake bitbake  471 Sep 14 19:05 meta-series
> -rw-r--r--  1 bitbake bitbake  113 Sep 14 19:05 non-hardware_frags.txt
> drwxr-xr-x  2 bitbake bitbake 4.0K Sep 14 19:05 patches
> -rw-r--r--  1 bitbake bitbake   33 Sep 14 19:05 patch.queue
> lrwxrwxrwx  1 bitbake bitbake   11 Sep 14 19:05 series -> patch.queue
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -rq 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta
> Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg: 
> merge_config_build.log
> Files 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh and 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh 
> differ
> Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: config.queue
> Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: configs
> Files kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series 
> and kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series differ
> Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: 
> non-hardware_frags.txt
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -uNr 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
> --- 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh  
>   2017-09-13 13:27:07.190918161 +0200
> +++ 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh    
> 2017-09-14 19:05:51.837031790 +0200
> @@ -1 +1 @@
> -.kernel-meta//patches//./001-luneos-logo.patch 
> 17358b825642f04fbd408395ab844567c2f147ff
> +.kernel-meta//patches//./001-luneos-logo.patch 
> 690e156b362c77518ad8e269ccaafa83f9631913
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -uNr 
> kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series
> --- kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series  
>   2017-09-13 13:27:01.331918171 +0200
> +++ kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series    
> 2017-09-14 19:05:50.522031885 +0200
> @@ -1,8 +1,10 @@
>   #
>   # scc v0.8
> -# processed: Wed Sep 13 13:27:01 CEST 2017
> +# processed: Thu Sep 14 19:05:50 CEST 2017
>   #
>   # This is a scc output file, do not edit
>   #
> +# _reloc_dir 
> /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi
>   # _reloc_dir 
> /OE/build/owpb/webos-ports/meta-rpi-luneos/recipes-kernel/linux
> +kconf 
> /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/defconfig 
> # non-hardware
>   patch patches//./001-luneos-logo.patch
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cat 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/config.queue
> configs//./defconfig # non-hardware
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cat 
> kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/non-hardware_frags.txt
> /OE/build/owpb/webos-ports/tmp-glibc/work-shared/raspberrypi3-64/kernel-source/.kernel-meta/configs//./defconfig
> 
> OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ du -hs 
> kernel-*
> 2.4G    kernel-bad
> 793M    kernel-ok
> 
> 
> I don't know if it makes any sense to you.

Why it actually failed makes sense, the defconfig wasn't detected
in the input configuration chunks and what is on disk shows that
as well. Checking for some sort of config as an input is a sanity check,
and that's the error message that triggered here.

When you first reported this, I changed the message a bit and moved
the processing around, so if this happens again the message should be
more clear.

As to how that is possible (defconfig not being present), I can't
explain, the error message is thrown by a check on a variable that is
created by checking the SRC_URI in anonymous python. It looks for
.cfg and defconfig files, and returns them to the routine.

If no .cfg or defconfigs are found, it throws that error. But yet, if
the same layers were used, how could the defconfig not be in the
SRC_URI variable when it was processed ? .. some sort of variable
finalization quirk ...

Thanks for the extra info on this, it was very useful and I'll keep
looking from my end.

Bruce

> 
> Let me know if you want me to check something or to share both these 
> directories.
> 
> I'm ready to give up and leave this as one-of weirdness in kernel-yocto.
> 
> On Wed, Sep 13, 2017 at 2:24 PM, Bruce Ashfield 
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     On 09/13/2017 02:23 AM, Andrea Galbusera wrote:
> 
>         Hi!
> 
> 
>         On Tue, Sep 12, 2017 at 12:58 PM, Martin Jansa
>         <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>
>         <mailto:martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>>>
>         wrote:
> 
>              Hi,
> 
>              I don't see any obvious change in this update which should
>         cause
>              this, but rebuilding my image for raspberrypi3-64 after
>         this update
>              (the previous image was built without errors) shows:
> 
>              NOTE: Running task 417 of 6399
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_validate_branches)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_validate_branches: Started
>              ....
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_validate_branches: Succeeded
>              NOTE: Running task 434 of 6399
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_metadata)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_metadata: Started
>              ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>              do_kernel_metadata: Could not locate BSP definition for
>              raspberrypi3-64/standard and no defconfig was provided
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_metadata: Succeeded
>              ...
>              NOTE: Running task 454 of 6399
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_patch)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_patch: Started
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_patch: Succeeded
>              NOTE: Running task 491 of 6399
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_configme)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_configme: Started
>              ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>              do_kernel_configme: [ERROR]: no configuration queue found
>         in outdir
>              (.kernel-meta)
> 
>                scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma
>              separated list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>]
>              [-I<path>] [-v] infiles
> 
>                     --help:      This message
>                     --force:     force overwrite output file if it
>         already exists
>                     --cmds:      list of supported commands. If not
>         passed, all
>              found commands are loaded,
>                                  valid commands are: patch, kconf,
>         branch, define
>                     --configs:   Output the list of compiled configuration
>              fragments (if available), -o <outdir> is
>                                  used to locate the configuration options
>                     -D:          define <var> to <value> which will be
>         available
>              to sub scripts
>                     -I:          include path <path> will be searched
>         for files
>                     -i:          leave intermediate files on failure
>                     -w:          only warn on missing files
>                     -v:          verbose output
>                     -o:          output directory and artifacts.
>         artifacts follow
>              the colon and ar a comma
>                                  separated list of:
>                                      meta:  full meta-series (patches,
>         config,
>              branches, etc)
>                                      cfg:   configure fragment queue
>                                      patch: patch queue
> 
>                     infiles      files to preprocess, and output into
>         outfile or
>              stdout
>              ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>              do_kernel_configme: Could not find configuration queue
>              (.kernel-meta/config.queue)
>              ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>              do_kernel_configme: Function failed: do_kernel_configme
>         (log file is
>              located at
>             
>         /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498)
>              ERROR: Logfile of failure stored in:
>             
>         /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498
>              Log data follows:
>              | DEBUG: Executing shell function do_kernel_configme
>              | ERROR: [ERROR]: no configuration queue found in outdir
>         (.kernel-meta)
>              |
>              |  scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma
>              separated list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>]
>              [-I<path>] [-v] infiles
>              |
>              |       --help:      This message
>              |       --force:     force overwrite output file if it
>         already exists
>              |       --cmds:      list of supported commands. If not
>         passed, all
>              found commands are loaded,
>              |                    valid commands are: patch, kconf,
>         branch, define
>              |       --configs:   Output the list of compiled configuration
>              fragments (if available), -o <outdir> is
>              |                    used to locate the configuration options
>              |       -D:          define <var> to <value> which will be
>         available
>              to sub scripts
>              |       -I:          include path <path> will be searched
>         for files
>              |       -i:          leave intermediate files on failure
>              |       -w:          only warn on missing files
>              |       -v:          verbose output
>              |       -o:          output directory and artifacts. artifacts
>              follow the colon and ar a comma
>              |                    separated list of:
>              |                        meta:  full meta-series (patches,
>         config,
>              branches, etc)
>              |                        cfg:   configure fragment queue
>              |                        patch: patch queue
>              |
>              |       infiles      files to preprocess, and output into
>         outfile or
>              stdout
>              | ERROR: Could not find configuration queue
>         (.kernel-meta/config.queue)
>              | WARNING:
>             
>         /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/run.do_kernel_configme.19498:1
>              exit 1 from 'exit 1'
>              | ERROR: Function failed: do_kernel_configme (log file is
>         located at
>             
>         /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_configme: Failed
>              ERROR: Task
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_configme)
>              failed with exit code '1'
>              NOTE: Running task 530 of 6399
>             
>         (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_version_sanity_check)
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_version_sanity_check: Started
>              NOTE: recipe
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>              task do_kernel_version_sanity_check: Succeeded
> 
>              I don't know if this is some new regression (the included
>         changes in
>              last upgrade doesn't look suspicious much) or something
>         which was
>              already there like race condition in kernel build or bad
>         interaction
>              between linux-yocto and rm_work.
> 
>              I'll try to rebuild it after cleansstate after current build is
>              finished.
> 
>              +Paul +Andrei if they have seen it with meta-raspberrypi
>         and maybe
>              it's specific to raspberrypi3-64 or last linux-raspberrypi
>         upgrade.
> 
>              Looks a bit similar to discussion in:
>         http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141097.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141097.html>
>             
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141097.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141097.html>>
>         http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141304.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141304.html>
>             
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141304.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141304.html>>
>         http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html>
>             
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html>>
>         http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141329.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141329.html>
>             
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141329.html
>         <http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141329.html>>
> 
>              Regards,
> 
>              On Mon, Sep 11, 2017 at 6:30 PM, <git@git.openembedded.org
>         <mailto:git@git.openembedded.org>
>              <mailto:git@git.openembedded.org
>         <mailto:git@git.openembedded.org>>> wrote:
> 
>                  This is an automated email from the git
>         hooks/post-receive script.
> 
>                  rpurdie pushed a change to branch master
>                  in repository openembedded-core.
> 
>                       from cc319b6  mesa-gl: Fix build after recent mesa
>                  PACKAGECONFIG changes
>                        add 9099cec  oeqa/qemurunner: Improve logging
>                        add 67612dc  qemurunner.py: refactor searching
>         for QEMU PID
>                        add ff98085  pulseaudio: Backport a patch to
>         replace use
>                  of VLAIS
>                        add aa5b9ed  oeqa/selftest: Add missing IDs to
>         various
>                  test cases
>                        add cdb4316  oeqa/selftest/case: Add recipeinc method
>                        new 0a43727  alsa-utils: Do not hardcode path to
>         /lib/udev
>                        new 43b1475  psplash: upgrade to latest git revision
>                        new e4cc1a2  initramfs-framework: split
>         setup-live and
>                  install-efi into separate recipes
>                        new 0fae16b  oeqa: Replace "append +=" with
>         normal "append
>                  =" in layerappend.py
>                        new 87110e9  rootfs: improve postinst intercept
>         logging
>                        new 35ab2c7  insane.bbclass: write QA issues to
>         log file
>                  only when they are in ERROR_QA or WARN_QA
>                        new 40e8a15  gtk-doc.bbclass: add all directories
>         where
>                  .so files are found to library search path
>                        new d0a123e  devtool: status: Sort entries before
>         printing
>                        new 9ff023f  package_deb, ipk: improve subprocess
>         output
>                  on package manager command
>                        new 11350a6  package_[deb|ipk]: improve
>         multiprocess logic
>                  when creating deb/ipk packages
>                        new f2e586e  glibc: add ld.so locks in _libc_fork
>                        new 10a1b29  kernel: Stop using update-alternatives
>                        new 32c9b3d  yocto-compat-layer.py: Fix trace
>         when layers
>                  can't be processed
>                        new 2348dda  psplash: Initialize psplash only if a
>                  framebuffer exists
>                        new ff9f629  sysstat: Add ability to enable
>         lm-sensors
>                        new b591ba6  wic: implement ext fs support for
>         'wic ls'
>                        new 1a2bc70  wic: implement ext fs support for
>         'wic cp'
>                        new be530b7  wic: implement ext fs support for
>         'wic rm'
>                        new fcff05d  wic: update help content
>                        new 6ae3ff9  wic: selftest: add test_wic_ls_ext
>         test case
>                        new 7970907  wic: selftest: add test_wic_cp_ext
>         test case
>                        new 693b555  wic: selftest: add test_wic_rm_ext
>         test case
>                        new 7d2d73b  shared-mime-info: enable nativesdk
>         builds
>                        new 51e4f9c  glib-2.0: recommend shared-mime-info
>                        new 026403c  systemtap: Bump SRCREV for 4.12
>         Linux kernel
>                  support
>                        new 31f1e5f  python3-pip: extend to nativesdk
>                        new b9f0c54  python3-setuptools: extend to nativesdk
>                        new 1f8dae4  xdg-utils: Add HOMEPAGE info into
>         recipe file.
>                        new 024caf6  bootchart2: update python interpreter
>                        new acc9994  cve-check-tool: change BB_NO_NETWORK
>         error to
>                  a warning
>                        new fa36678  bmap-tools: upgrade to v3.4
>                        new 0d6130b  bmap-tools: switch to Python 3
>                        new 7fca44e  wic: run bmaptool with native Python3
>                        new 1585ed0  texinfo-dummy-native: port to Python 3
>                        new 3014099  glibc: do the multilib_header magic
>         also for
>                  bits/pthreadtypes-arch.h
>                        new 56cf3a0  util-linux: Add HOMEPAGE info into
>         recipe file.
>                        new 818d4a9  iputils: backport patch to fix
>         arping hang
>                  problem
>                        new 1d0c86a  diffutils: Add HOMEPAGE info into
>         recipe file.
>                        new 34cde8e  foomatic: Add HOMEPAGE info into
>         recipe file.
>                        new 6e1f800  subversion: fix CVE-2017-9800
>                        new 1ca7d8d  libfm: remove file which conflicts with
>                  libfm-extra
>                        new e67b40c  scripts/buildhistory-diff: use of
>         argparse
>                  instead of optparse
>                        new b6e72d0  linux-yocto: Make
>         LINUX_VERSION_EXTENSION weaker
>                        new 1a5026d  goarch.bbclass: Stop passing True as
>         second
>                  argument of d.getVar
>                        new 56ce355  go.bbclass: Fix binary installation path
>                  detection
>                        new 26abbf1  go: Remove Go 1.6 and 1.7 releases
>                        new 07b60c1  goarch.bbclass: Replace logic for
>         setting GOARM
>                        new e242e7c  goarch.bbclass: Add support for ARMv5
>                        new d6b8e7e  go.bbclass: Use a global Go build flags
>                        new 7a40ea8  go.bbclass: Enable parallel build
>                        new 0369a99  go.bbclass: exported function cleanup
>                        new 4971362  go.bbclass: Use an auxiliary
>         variable to add
>                  the build dependencies
>                        new c62a083  go.bbclass: separate ${S} and ${B}
>                        new efcf651  go.bbclass: add do_unpack function
>         to handle
>                  common cases
>                        new 9819353  go.bbclass: add GO_INSTALL_FILTEROUT
>         variable
>                        new 79e0401  go-dep: Add 0.3.0 release
>                        new 116d2ea  go-helloworld: Use the Golang
>         examples repository
>                        new 802829f  devtool: upgrade: check that user has
>                  configured git properly
>                        new 2ebbeb6  staging: gracefully abort if two recipes
>                  conflict in the sysroot
> 
>                  The 59 revisions listed above as "new" are entirely new
>         to this
>                  repository and will be described in separate emails. 
>         The revisions
>                  listed as "add" were already present in the repository
>         and have only
>                  been added to this reference.
> 
> 
>                  Summary of changes:
>                    meta/classes/go.bbclass                            |
>         110 ++++---
>                    meta/classes/goarch.bbclass                        | 
>         27 +-
>                    meta/classes/gtk-doc.bbclass                       | 
>           1 +
>                    meta/classes/insane.bbclass                        | 
>           3 +-
>                    meta/classes/kernel.bbclass                        | 
>         16 +-
>                    meta/classes/package_deb.bbclass                   | 
>         40 ++-
>                    meta/classes/package_ipk.bbclass                   | 
>         40 ++-
>                    meta/classes/staging.bbclass                       | 
>         18 +-
>                    meta/lib/oe/rootfs.py                              | 
>           7 +-
>                    meta/lib/oeqa/selftest/case.py                     | 
>         20 +-
>                    meta/lib/oeqa/selftest/cases/archiver.py           | 
>           3 +-
>                    meta/lib/oeqa/selftest/cases/distrodata.py         | 
>           2 +
>                    meta/lib/oeqa/selftest/cases/imagefeatures.py      | 
>           3 +
>                    meta/lib/oeqa/selftest/cases/layerappend.py        | 
>           2 +-
>                    meta/lib/oeqa/selftest/cases/runcmd.py             | 
>         17 +
>                    meta/lib/oeqa/selftest/cases/wic.py                | 
>         70 ++++
>                    meta/lib/oeqa/utils/qemurunner.py                  | 351
>                  ++++++++++-----------
>                    meta/recipes-core/glib-2.0/glib.inc                | 
>           2 +
>                    meta/recipes-core/glibc/glibc-package.inc          | 
>           2 +-
>                    ...bc-reset-dl-load-write-lock-after-forking.patch | 
>         37 +++
>                    .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  | 
>         57 ++++
>                    meta/recipes-core/glibc/glibc_2.26.bb
>         <http://glibc_2.26.bb> <http://glibc_2.26.bb>                   
>            |   2 +
>                    .../initrdscripts/initramfs-framework_1.0.bb
>         <http://initramfs-framework_1.0.bb>
>                  <http://initramfs-framework_1.0.bb
>         <http://initramfs-framework_1.0.bb>>       |  20 +-
>                    .../initramfs-module-install-efi_1.0.bb
>         <http://initramfs-module-install-efi_1.0.bb>
>                  <http://initramfs-module-install-efi_1.0.bb
>         <http://initramfs-module-install-efi_1.0.bb>>            |  18 ++
>                    .../initramfs-module-setup-live_1.0.bb
>         <http://initramfs-module-setup-live_1.0.bb>
>                  <http://initramfs-module-setup-live_1.0.bb
>         <http://initramfs-module-setup-live_1.0.bb>>             |  18 ++
>                    meta/recipes-core/psplash/files/psplash-init       | 
>           6 +
>                    meta/recipes-core/psplash/psplash_git.bb
>         <http://psplash_git.bb>
>                  <http://psplash_git.bb>           |   2 +-
>                    meta/recipes-core/util-linux/util-linux.inc        | 
>           1 +
>                    .../bootchart2/bootchart2_0.14.8.bb
>         <http://bootchart2_0.14.8.bb>
>                  <http://bootchart2_0.14.8.bb>                |   2 +-
>                    .../cve-check-tool/cve-check-tool_5.6.4.bb
>         <http://cve-check-tool_5.6.4.bb>
>                  <http://cve-check-tool_5.6.4.bb
>         <http://cve-check-tool_5.6.4.bb>>         |   2 +-
>                    meta/recipes-devtools/go/go-1.6.inc                | 
>         19 --
>                    .../go/go-1.6/armhf-elf-header.patch               | 
>         23 --
>                    .../go/go-1.6/fix-cc-handling.patch                | 
>         50 ---
>                    .../go/go-1.6/fix-target-cc-for-build.patch        | 
>         17 -
>                    meta/recipes-devtools/go/go-1.6/gotooldir.patch    | 
>         30 --
>                    .../go/go-1.6/split-host-and-target-build.patch    | 
>         63 ----
>                    meta/recipes-devtools/go/go-1.6/syslog.patch       | 
>         62 ----
>                    meta/recipes-devtools/go/go-1.7.inc                | 
>         19 --
>                    .../go/go-1.7/armhf-elf-header.patch               | 
>         23 --
>                    .../go/go-1.7/fix-cc-handling.patch                | 
>         50 ---
>                    .../go/go-1.7/fix-target-cc-for-build.patch        | 
>         17 -
>                    meta/recipes-devtools/go/go-1.7/gotooldir.patch    | 
>         30 --
>                    .../go/go-1.7/split-host-and-target-build.patch    | 
>         62 ----
>                    meta/recipes-devtools/go/go-1.7/syslog.patch       | 
>         62 ----
>                    meta/recipes-devtools/go/go-cross_1.7.bb
>         <http://go-cross_1.7.bb>
>                  <http://go-cross_1.7.bb>           |   5 -
>                    meta/recipes-devtools/go/go-dep_0.3.0.bb
>         <http://go-dep_0.3.0.bb>
>                  <http://go-dep_0.3.0.bb>           |  18 ++
>                    meta/recipes-devtools/go/go_1.6.bb <http://go_1.6.bb>
>         <http://go_1.6.bb>                         |   4 -
>                    meta/recipes-devtools/go/go_1.7.bb <http://go_1.7.bb>
>         <http://go_1.7.bb>                         |   2 -
>                    meta/recipes-devtools/python/python3-pip_9.0.1.bb
>         <http://python3-pip_9.0.1.bb>
>                  <http://python3-pip_9.0.1.bb>  |   2 +-
>                    .../python/python3-setuptools_36.2.7.bb
>         <http://python3-setuptools_36.2.7.bb>
>                  <http://python3-setuptools_36.2.7.bb
>         <http://python3-setuptools_36.2.7.bb>>            |   7 +-
>                    .../subversion/subversion/CVE-2017-9800.patch      |
>         136 ++++++++
>                    .../subversion/subversion_1.9.6.bb
>         <http://subversion_1.9.6.bb>
>                  <http://subversion_1.9.6.bb>                 |   1 +
>                    meta/recipes-extended/diffutils/diffutils.inc      | 
>           1 +
>                    .../foomatic/foomatic-filters_4.0.17.bb
>         <http://foomatic-filters_4.0.17.bb>
>                  <http://foomatic-filters_4.0.17.bb
>         <http://foomatic-filters_4.0.17.bb>>            |   1 +
>                    .../go-examples/files/helloworld.go                | 
>         10 -
>                    meta/recipes-extended/go-examples/go-examples.inc  | 
>         10 -
>                    .../go-examples/go-helloworld_0.1.bb
>         <http://go-helloworld_0.1.bb>
>                  <http://go-helloworld_0.1.bb>               |  24 +-
>                    ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 
>         44 +++
>                    meta/recipes-extended/iputils/iputils_s20151218.bb
>         <http://iputils_s20151218.bb>
>                  <http://iputils_s20151218.bb> |   1 +
>                    meta/recipes-extended/sysstat/sysstat.inc          | 
>           6 +-
>                    .../texinfo-dummy-native/texinfo-dummy/template.py | 
>           4 +-
>                    meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
>         <http://xdg-utils_1.1.1.bb>
>                  <http://xdg-utils_1.1.1.bb> |   2 +-
>                    meta/recipes-kernel/linux/linux-dtb.inc            | 
>         36 +--
>                    meta/recipes-kernel/linux/linux-yocto.inc          | 
>           2 +-
>                    ...apbpf-don-t-support-installing-a-non-root.patch | 
>         62 ++++
>                    meta/recipes-kernel/systemtap/systemtap_git.inc    | 
>           5 +-
>                    meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
>         <http://alsa-utils_1.1.4.bb>
>                  <http://alsa-utils_1.1.4.bb>   |   4 +-
>                    ...-don-t-use-variable-length-array-in-union.patch | 
>         59 ++++
>                    .../pulseaudio/pulseaudio_10.0.bb
>         <http://pulseaudio_10.0.bb> <http://pulseaudio_10.0.bb>         
>                          |   1 +
>                    .../{bmap-tools_3.2.bb <http://bmap-tools_3.2.bb>
>         <http://bmap-tools_3.2.bb> =>
>         bmap-tools_3.4.bb <http://bmap-tools_3.4.bb>
>         <http://bmap-tools_3.4.bb>}       |   9 +-
>                    meta/recipes-support/libfm/libfm_1.2.5.bb
>         <http://libfm_1.2.5.bb>
>                  <http://libfm_1.2.5.bb>          |   1 +
>                    .../shared-mime-info/shared-mime-info.inc          | 
>           3 +-
>                    scripts/buildhistory-diff                          |
>         125 ++++----
>                    scripts/lib/devtool/standard.py                    | 
>           2 +-
>                    scripts/lib/devtool/upgrade.py                     | 
>         27 +-
>                    scripts/lib/wic/engine.py                          | 
>         55 ++--
>                    scripts/lib/wic/help.py                            | 
>         64 ++--
>                    scripts/lib/wic/plugins/imager/direct.py           | 
>           6 +-
>                    scripts/yocto-compat-layer.py                      | 
>           2 +-
>                    79 files changed, 1137 insertions(+), 1030 deletions(-)
>                    create mode 100644
>                 
>         meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
>                    create mode 100644
>                 
>         meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
>                    create mode 100644
>                 
>         meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
>         <http://initramfs-module-install-efi_1.0.bb>
>                  <http://initramfs-module-install-efi_1.0.bb
>         <http://initramfs-module-install-efi_1.0.bb>>
>                    create mode 100644
>                 
>         meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
>         <http://initramfs-module-setup-live_1.0.bb>
>                  <http://initramfs-module-setup-live_1.0.bb
>         <http://initramfs-module-setup-live_1.0.bb>>
>                    delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>                    delete mode 100644
>                  meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>                    delete mode 100644
>                  meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>                    delete mode 100644
>                 
>         meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>                    delete mode 100644
>         meta/recipes-devtools/go/go-1.6/gotooldir.patch
>                    delete mode 100644
>                 
>         meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
>                    delete mode 100644
>         meta/recipes-devtools/go/go-1.6/syslog.patch
>                    delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>                    delete mode 100644
>                  meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>                    delete mode 100644
>                  meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>                    delete mode 100644
>                 
>         meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>                    delete mode 100644
>         meta/recipes-devtools/go/go-1.7/gotooldir.patch
>                    delete mode 100644
>                 
>         meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
>                    delete mode 100644
>         meta/recipes-devtools/go/go-1.7/syslog.patch
>                    delete mode 100644
>         meta/recipes-devtools/go/go-cross_1.7.bb <http://go-cross_1.7.bb>
>                  <http://go-cross_1.7.bb>
>                    create mode 100644
>         meta/recipes-devtools/go/go-dep_0.3.0.bb <http://go-dep_0.3.0.bb>
>                  <http://go-dep_0.3.0.bb>
>                    delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>         <http://go_1.6.bb>
>                  <http://go_1.6.bb>
>                    delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>         <http://go_1.7.bb>
>                  <http://go_1.7.bb>
>                    create mode 100644
>                 
>         meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch
>                    delete mode 100644
>                  meta/recipes-extended/go-examples/files/helloworld.go
>                    delete mode 100644
>                  meta/recipes-extended/go-examples/go-examples.inc
>                    create mode 100644
>                 
>         meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
>                    create mode 100644
>                 
>         meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
>                    create mode 100644
>                 
>         meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
>                    rename
>         meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb
>         <http://bmap-tools_3.2.bb>
>                  <http://bmap-tools_3.2.bb> => bmap-tools_3.4.bb
>         <http://bmap-tools_3.4.bb>
>                  <http://bmap-tools_3.4.bb>} (79%)
> 
>                  --
>                  To stop receiving notification emails like this one,
>         please contact
>                  the administrator of this repository.
>                  --
>                  _______________________________________________
>                  Openembedded-commits mailing list
>         Openembedded-commits@lists.openembedded.org
>         <mailto:Openembedded-commits@lists.openembedded.org>
>                  <mailto:Openembedded-commits@lists.openembedded.org
>         <mailto:Openembedded-commits@lists.openembedded.org>>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-commits>
>                 
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-commits>>
> 
> 
> 
>              --
>              _______________________________________________
>              Openembedded-core mailing list
>         Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>
>              <mailto:Openembedded-core@lists.openembedded.org
>         <mailto:Openembedded-core@lists.openembedded.org>>
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>             
>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>>
> 
> 
>         Across a similar update on master I noticed a possibly related
>         glitch while building config attached below. Here
>         linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4 complained with:
> 
>         ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>         do_kernel_metadata: Could not locate BSP definition for
>         raspberrypi3-64/standard and no defconfig was provided
> 
>         Surprisingly enough this wasn't marked as a failed build indeed.
>         Next builds did not trigger any error either. Not tried yet any
>         sort of cleaning for the recipe. Didn't report it immediately
>         since, as you can see from my layers revisions, I was meantime
>         upgrading to latest master and testing Paul's work for fixing
>         build for 64bit kernel when u-boot is used to boot the RPi. FWIW
>         I don't have rm_work enabled on these builds.
> 
> 
>     Interesting.
> 
>     It definitely sounds like something is racing, that previously
>     didn't .. or was much better hidden.
> 
>     I had the rpi3 on a continuous build loop yesterday and didn't
>     trigger the error here.
> 
>     I'll continue my builds and have another look to see what could
>     possibly be racing in the tasks.
> 
>     If anyone does make this happen reproducibly, let me know and
>     I'll switch my config to debug.
> 
>     Bruce
> 
> 
> 
>         I'm aware that the same error was triggered by a recent issue
>         that prevented the build to continue and was fixed by poky
>         commit fa664b1bba3ef8256083f4e52cafd0985d924586 (From OE-Core
>         rev: 156cf9e25f875a50f907e570d9b62cbc2c051133).
> 
>         Here is the configuration that "sort of" failed:
> 
>         Build Configuration:
>         BB_VERSION        = "1.35.0"
>         BUILD_SYS         = "x86_64-linux"
>         NATIVELSBSTRING   = "universal"
>         TARGET_SYS        = "aarch64-poky-linux"
>         MACHINE           = "raspberrypi3-64"
>         DISTRO            = "poky"
>         DISTRO_VERSION    = "2.3+snapshot-20170912"
>         TUNE_FEATURES     = "aarch64"
>         TARGET_FPU        = ""
>         meta
>         meta-poky
>         meta-yocto-bsp    = "HEAD:e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa"
>         meta-oe
>         meta-python
>         meta-networking   = "HEAD:d9f7ef40d74659a0348248841efadaf120d52c30"
>         meta-raspberrypi  =
>         "pbarker/kernel:a01be8b3cf4af9bcd0c01a5b0af3b9c7a2c2b756"
> 
>         Initialising tasks: 100%
>         |#################################################################|
>         Time: 0:00:12
>         NOTE: Executing SetScene Tasks
>         NOTE: Executing RunQueue Tasks
>         ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>         do_kernel_metadata: Could not locate BSP definition for
>         raspberrypi3-64/standard and no defconfig was provided
>         NOTE: Tasks Summary: Attempted 4887 tasks of which 2194 didn't
>         need to be rerun and all succeeded.
>         NOTE: Writing buildhistory
> 
> 
> 


