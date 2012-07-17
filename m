Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrBEX-0003At-Aw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:06:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 09:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="173263301"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2012 09:55:28 -0700
Message-ID: <50059900.6050608@linux.intel.com>
Date: Tue, 17 Jul 2012 09:55:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342156465-15052-1-git-send-email-b28495@freescale.com>
In-Reply-To: <1342156465-15052-1-git-send-email-b28495@freescale.com>
Cc: b29882@freescale.com
Subject: Re: [PATCH v2] lsof: define linux C library type when using eglibc
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
X-List-Received-Date: Tue, 17 Jul 2012 17:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2012 10:14 PM, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>
> lsof tries to compile a temp c source file and execute the binary to
> determine linux C library type (file Configure, line 2689-2717).
> It is inpracticable for cross-compilation and may have build issue on
> some distros since it depends on host settings.
>
> Fix below error when building for 64bit target on 64bit host:
> [...]
> | dsock.c:481:44: error: 'TCP_LISTEN' undeclared (first use in this function)
> | dsock.c:482:45: error: 'TCP_CLOSING' undeclared (first use in this function)
> [...]
> | make: *** [dsock.o] Error 1
>
> The actual issue exists in do_configure:
> [...]
> Testing C library type with cc ... done
> Cannot determine C library type; assuming it is not glibc.
>
> Which is in turn caused by missing 'gnu/stubs-32.h" when compiling
> the temp c source file on host:
> [...]
> fatal error: gnu/stubs-32.h: No such file or directory compilation terminated.
>
> file gnu/stubs-32.h is provided by 32bit glibc.
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>   meta/recipes-extended/lsof/lsof_4.85.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/lsof/lsof_4.85.bb b/meta/recipes-extended/lsof/lsof_4.85.bb
> index 5823725..de7ff68 100644
> --- a/meta/recipes-extended/lsof/lsof_4.85.bb
> +++ b/meta/recipes-extended/lsof/lsof_4.85.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
>   Its name stands for LiSt Open Files, and it does just that."
>   SECTION = "devel"
>   LICENSE = "BSD"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
>
> @@ -31,6 +31,11 @@ export LSOF_INCLUDE = "${STAGING_INCDIR}"
>   do_configure () {
>   	export LSOF_AR="${AR} cr"
>   	export LSOF_RANLIB="${RANLIB}"
> +        if [ "x${EGLIBCVERSION}" != "x" ];then
> +                LINUX_CLIB=`echo ${EGLIBCVERSION} |sed -e 's,\.,,g'`
> +                LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
> +                export LINUX_CLIB
> +        fi
>   	yes | ./Configure ${LSOF_OS}
>   }
>
>
Merged into OE-Core

Thanks
	Sau!




