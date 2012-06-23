Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiHx3-0001Zc-Qt
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 06:28:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2012 21:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161552727"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2012 21:17:11 -0700
Message-ID: <4FE54346.5080401@linux.intel.com>
Date: Fri, 22 Jun 2012 21:17:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340120601-23917-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1340120601-23917-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc-4.7: Update to tip of gcc-4_7-branch since 4.7.1 has been out
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
X-List-Received-Date: Sat, 23 Jun 2012 04:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 08:43 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.7.inc |   12 ++++++------
>   1 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 34a73b1..25a1088 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -3,12 +3,12 @@ require gcc-common.inc
>   PR = "r2"
>
>   # Third digit in PV should be incremented after a minor release
> -# happens from this branch on gcc e.g. currently its 4.7.0
> -# when 4.7.1 is releases and we bump SRCREV beyond the release
> -# on branch then PV should be incremented to 4.7.1+svnr${SRCPV}
> +# happens from this branch on gcc e.g. currently its 4.7.1
> +# when 4.7.2 is releases and we bump SRCREV beyond the release
> +# on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>   # to reflect that change
>
> -PV = "4.7.0+svnr${SRCPV}"
> +PV = "4.7.1+svnr${SRCPV}"
>
>   # BINV should be incremented after updating to a revision
>   # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
> @@ -16,9 +16,9 @@ PV = "4.7.0+svnr${SRCPV}"
>   # 4.7.1 then the value below will have 2 which will mean 4.7.2
>   # which will be next minor release and so on.
>
> -BINV = "4.7.1"
> +BINV = "4.7.2"
>
I merged this and had tested it on the Autobuilder, but I just tried 
another build locally and got a grouping of failures that may have used 
sstate because they failed do_compile:
   /srv/ssd/sgw_ab/poky/meta/recipes-extended/newt/libnewt_0.52.14.bb, 
do_compile
   /srv/ssd/sgw_ab/poky/meta/recipes-graphics/mesa/mesa-dri_7.11.bb, 
do_compile
   /srv/ssd/sgw_ab/poky/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb, 
do_compile
 
/srv/ssd/sgw_ab/poky/meta/recipes-extended/logrotate/logrotate_3.8.1.bb, 
do_compile
   /srv/ssd/sgw_ab/poky/meta/recipes-kernel/kexec/kexec-tools_2.0.3.bb, 
do_compile
 
/srv/ssd/sgw_ab/poky/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb, 
do_compile
 
/srv/ssd/sgw_ab/poky/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb, 
do_compile
   /srv/ssd/sgw_ab/poky/meta/recipes-devtools/apt/apt_0.7.14.bb, do_compile


The failure was:
| make: *** No rule to make target 
`/srv/ssd/sgw_ab/builds/repack/tmp/sysroots/x86_64-linux/usr/lib/i586-poky-linux/gcc/i586-poky-linux/4.7.1/include/stddef.h', 
needed by `logrotate.o'.  Stop.

Note the 4.7.1!

A clean solved the issue, so I am not sure where it's picking up the 
4.7.1 from during the do_configure.

More investigation is required!

Sau!




> -SRCREV = "186651"
> +SRCREV = "188658"
>   BRANCH = "gcc-4_7-branch"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"
>


