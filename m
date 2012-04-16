Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJbjq-0001s7-4c
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 04:32:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3G2Mvxd001884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 19:22:57 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 15 Apr 2012 19:22:57 -0700
Message-ID: <4F8B827F.2090701@windriver.com>
Date: Mon, 16 Apr 2012 10:22:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1334502042.16992.29.camel@ted>
In-Reply-To: <1334502042.16992.29.camel@ted>
Subject: Re: [PATCH] pseudo: Ensure the correct libraries are used at runtime
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
X-List-Received-Date: Mon, 16 Apr 2012 02:32:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Tested, all of the following commands worked well:

1) runqemu qemux86 bzImage-qemux86.bin core-image-sato-qemux86.ext3
2) pseduo ls
3) runqemu-extract-sdk core-image-sato-sdk-qemuarm-20120412211904.rootfs.tar.bz2 
rootfs_dir

// Robert

On 04/15/2012 11:00 PM, Richard Purdie wrote:
> There can be a conflict between the nativesdk libc and the host system's
> libc. It is assumed the nativesdk version is of an equal or higher version.
> This is a particular issue for pseudo if its loading a system binary
> since the system's libc might be used of an older verison which would
> then confuse libpseudo.so when loaded as a preload.
>
> To avoid this, set LD_LIBRARY_PATH so the nativesdk libc is always
> used.
>
> Since we now use --without-rpath, we can remove the MAKEOPTS RPATH workaround.
>
> [YOCTO #2299]
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index d710058..6ac1301 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -13,10 +13,7 @@ FILES_${PN} = "${libdir}/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/p
>   FILES_${PN}-dbg += "${libdir}/pseudo/lib*/.debug"
>   PROVIDES += "virtual/fakeroot"
>
> -# In the nativesdk case, we'll already search the searchpaths
> -# pseudo tries to build in so override RPATH
>   MAKEOPTS = ""
> -MAKEOPTS_virtclass-nativesdk = "'RPATH='"
>
>   inherit siteinfo
>
> @@ -78,6 +75,8 @@ do_install_append_virtclass-nativesdk () {
>   		mkdir -p ${D}${prefix}/lib/pseudo/lib
>   		cp lib/pseudo/lib/libpseudo.so ${D}${prefix}/lib/pseudo/lib/.
>   	fi
> +
> +	create_wrapper ${D}${bindir}/pseudo LD_LIBRARY_PATH=${base_libdir}:${libdir}
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> index 080b739..b16b2d9 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.3.bb
> @@ -1,6 +1,6 @@
>   require pseudo.inc
>
> -PR = "r8"
> +PR = "r9"
>
>   SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 7857275..5771295 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,7 +2,7 @@ require pseudo.inc
>
>   SRCREV = "f0375c9aaefbccfd41aebbf6d332bb4d9e8f980c"
>   PV = "1.3+git${SRCPV}"
> -PR = "r23"
> +PR = "r24"
>
>   DEFAULT_PREFERENCE = "-1"
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


