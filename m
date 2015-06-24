Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 879B275A20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:42:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O1gBkD028473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jun 2015 18:42:11 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 23 Jun 2015 18:42:11 -0700
Message-ID: <558A0AF1.8060204@windriver.com>
Date: Wed, 24 Jun 2015 09:42:09 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Wed, 24 Jun 2015 01:42:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月23日 19:23, Burton, Ross wrote:
>
> On 3 June 2015 at 02:24, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +CFLAGS += "-U_FORTIFY_SOURCE"
>
>
> So Richard made the valid point that this is disabling the security
> flags in mmc-utils globally to fix builds in the very few cases when
> DEBUG_BUILD is enabled.
>
> Would it be sensible to have an include file that enables DEBUG_BUILD
> and also tweaks CFLAGS where required?  I'd also like to see what the
> error is, and if it can be fixed in the code for good instead.
>
> Ross

1. configuration

rli2@pek-hostel-deb02:/buildarea1/lirq/Yocto/poky/build$ tail -n1 
conf/local.conf
SELECTED_OPTIMIZATION = " -O0 "
rli2@pek-hostel-deb02:/buildarea1/lirq/Yocto/poky/build$

2. the error

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (log file is located at 
/buildarea1/lirq/Yocto/poky/build/tmp/work/armv5e-poky-linux-gnueabi/mmc-utils/0.1-r0/temp/log.do_compile.30117)
ERROR: Logfile of failure stored in: 
/buildarea1/lirq/Yocto/poky/build/tmp/work/armv5e-poky-linux-gnueabi/mmc-utils/0.1-r0/temp/log.do_compile.30117
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 24 -e MAKEFLAGS=
| arm-poky-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork 
--sysroot=/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm  -Wall 
-Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 
-D_FORTIFY_SOURCE=2   -O0  -Wp,-MMD,./.mmc.o.d,-MT,mmc.o -c mmc.c -o mmc.o
| arm-poky-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork 
--sysroot=/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm  -Wall 
-Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 
-D_FORTIFY_SOURCE=2   -O0  -Wp,-MMD,./.mmc_cmds.o.d,-MT,mmc_cmds.o -c 
mmc_cmds.c -o mmc_cmds.o
| arm-poky-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork 
--sysroot=/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm  -Wall 
-Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 
-D_FORTIFY_SOURCE=2   -O0 
-Wp,-MMD,3rdparty/hmac_sha/.hmac_sha2.o.d,-MT,3rdparty/hmac_sha/hmac_sha2.o 
-c 3rdparty/hmac_sha/hmac_sha2.c -o 3rdparty/hmac_sha/hmac_sha2.o
| arm-poky-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork 
--sysroot=/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm  -Wall 
-Werror -Wuninitialized -Wundef -D_FILE_OFFSET_BITS=64 
-D_FORTIFY_SOURCE=2   -O0 
-Wp,-MMD,3rdparty/hmac_sha/.sha2.o.d,-MT,3rdparty/hmac_sha/sha2.o -c 
3rdparty/hmac_sha/sha2.c -o 3rdparty/hmac_sha/sha2.o
| make -C man
| make[1]: Entering directory 
`/buildarea1/lirq/Yocto/poky/build/tmp/work/armv5e-poky-linux-gnueabi/mmc-utils/0.1-r0/git/man'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory 
`/buildarea1/lirq/Yocto/poky/build/tmp/work/armv5e-poky-linux-gnueabi/mmc-utils/0.1-r0/git/man'
| In file included from 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/stdio.h:27:0,
|                  from mmc.c:20:
| 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/features.h:328:4: 
error: #warning _FORTIFY_SOURCE requires compiling with optimization 
(-O) [-Werror=cpp]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
|     ^
| In file included from 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/string.h:25:0,
|                  from 3rdparty/hmac_sha/hmac_sha2.c:38:
| 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/features.h:328:4: 
error: #warning _FORTIFY_SOURCE requires compiling with optimization 
(-O) [-Werror=cpp]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
|     ^
| In file included from 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/stdio.h:27:0,
|                  from mmc_cmds.c:17:
| 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/features.h:328:4: 
error: #warning _FORTIFY_SOURCE requires compiling with optimization 
(-O) [-Werror=cpp]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
|     ^
| In file included from 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/string.h:25:0,
|                  from 3rdparty/hmac_sha/sha2.c:42:
| 
/buildarea1/lirq/Yocto/poky/build/tmp/sysroots/qemuarm/usr/include/features.h:328:4: 
error: #warning _FORTIFY_SOURCE requires compiling with optimization 
(-O) [-Werror=cpp]
|  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
|     ^
| cc1: all warnings being treated as errors
| make: *** [3rdparty/hmac_sha/hmac_sha2.o] Error 1
| make: *** Waiting for unfinished jobs....
| cc1: all warnings being treated as errors
| make: *** [mmc.o] Error 1
| cc1: all warnings being treated as errors
| make: *** [3rdparty/hmac_sha/sha2.o] Error 1
| cc1: all warnings being treated as errors
| make: *** [mmc_cmds.o] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at 
/buildarea1/lirq/Yocto/poky/build/tmp/work/armv5e-poky-linux-gnueabi/mmc-utils/0.1-r0/temp/log.do_compile.30117)
ERROR: Task 6 
(/buildarea1/lirq/Yocto/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 362 tasks of which 294 didn't need to be 
rerun and 1 failed.
Waiting for 0 running tasks to finish:


-R

