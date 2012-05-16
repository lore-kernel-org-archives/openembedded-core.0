Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUjUQ-0005QC-Tf
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 21:02:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 11:52:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141389221"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 11:52:23 -0700
Message-ID: <4FB3F766.3080400@linux.intel.com>
Date: Wed, 16 May 2012 21:52:22 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <95a4d7c127f39cac6fc7d60e8b4081ae774cd745.1337191798.git.nitin.a.kamble@intel.com>
	<d5ffec3f9f188123a6afd282109f33417994b8d9.1337191798.git.nitin.a.kamble@intel.com>
In-Reply-To: <d5ffec3f9f188123a6afd282109f33417994b8d9.1337191798.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 2/2] gcc: fix DEPENDS to avoid a build issue
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
X-List-Received-Date: Wed, 16 May 2012 19:02:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2012 09:11 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> this commits avoids this issue:
>
> | 4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/. -I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gc
> c-4_7-branch/libgcc/../gcc -I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc
> /../include -I/home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/config/libbid
> -DENABLE_DECIMAL_BID_FORMAT -DHAVE_CC_TLS  -DUSE_TLS -o _fixdfdi_s.o -MT _fixdfdi_s.o -MD -MP -MF _fixdfdi_s.dep -DS
> HARED -DL_fixdfdi -c /home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/libgcc2
> .c
> | /home/nitin/builds/build0/tmp/work-shared/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/libgcc/unwind-dw2.c:42:21: fatal
> error: sys/sdt.h: No such file or directory
> | compilation terminated.
> | make[2]: *** [unwind-dw2.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/home/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux/i586-poky-linux/libgcc'
> | make[1]: *** [all-target-libgcc] Error 2
> | make[1]: Leaving directory `/home/nitin/builds/build0/tmp/work/i586-poky-linux/gcc-4.7.0+svnr186651-r1/gcc-4_7-branch/build.i586-poky-linux.i586-poky-linux'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> NOTE: package gcc-4.7.0+svnr186651-r1: task do_compile: Failed
> ERROR: Task 8 (/home/nitin/prj/poky.git/meta/recipes-devtools/gcc/gcc_4.7.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 808 tasks of which 801 didn't need to be rerun and 1 failed.
>
> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.7.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 8adeb8d..9c73235 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.7.0
> @@ -22,7 +22,7 @@ SRCREV = "186651"
>   BRANCH = "gcc-4_7-branch"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>
> -DEPENDS =+ "mpfr gmp libmpc"
> +DEPENDS =+ "mpfr gmp libmpc systemtap"

Nitin,

I am not sure this is the right way to do this, first it's bringing in 
another dependency into gcc, it also will cause a mips failure as 
systemtap does not build with mips.

It might be better to modify the configuration to ensure that system tap 
is always disabled.  This will ensure a deterministic build.

Sau!
>   NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>
>   LICENSE="GPL-3.0-with-GCC-exception&  GPLv3"


