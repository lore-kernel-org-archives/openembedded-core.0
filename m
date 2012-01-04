Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiFE1-0004Mu-Ba
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:01:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 16:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92668498"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 16:53:42 -0800
Message-ID: <4F03A316.2070305@linux.intel.com>
Date: Tue, 03 Jan 2012 16:53:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1325634627.24646.0.camel@lenny>
In-Reply-To: <1325634627.24646.0.camel@lenny>
X-Mailman-Approved-At: Thu, 05 Jan 2012 11:54:29 +0100
Cc: poky <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH] flex/bison: Don't hardcode M4 path
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
X-List-Received-Date: Wed, 04 Jan 2012 01:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

> The flex and bison configure scripts use AC_PATH_PROG to get a
> full path to m4 and embed this in config.h (and then to the
> generated binary), but this blows up when the m4 binary is in a
> temporary staging directory.
>
> Since we are always shipping GNU m4, just set M4=m4 at configure
> time so we don't use a hardcoded path.
>
> This is an equivalent to what already exists in autoconf.bb.
>
>
This should really be posted to openembedded-core@lists.openembedded.org.

Sau!

>
> 0001-flex-bison-Don-t-hardcode-M4-path.patch
>
>>From d33924d0de58e25bce73e5b4d61983fe0c1d0119 Mon Sep 17 00:00:00 2001
> From: Colin Walters <walters@verbum.org>
> Date: Tue, 3 Jan 2012 18:47:32 -0500
> Subject: [PATCH] flex/bison: Don't hardcode M4 path
>
> The flex and bison configure scripts use AC_PATH_PROG to get a full
> path to m4 and embed this in config.h (and then to the generated
> binary), but this blows up when the m4 binary is in a temporary
> staging directory.
>
> Since we are always shipping GNU m4, just set M4=m4 at configure time
> so we don't use a hardcoded path.
>
> This is an equivalent to what already exists in autoconf.bb.
> ---
>  meta/recipes-devtools/bison/bison_2.5.bb |   10 ++++------
>  meta/recipes-devtools/flex/flex.inc      |    7 ++++---
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/bison/bison_2.5.bb b/meta/recipes-devtools/bison/bison_2.5.bb
> index c5113cd..0536dd4 100644
> --- a/meta/recipes-devtools/bison/bison_2.5.bb
> +++ b/meta/recipes-devtools/bison/bison_2.5.bb
> @@ -21,16 +21,14 @@ SRC_URI = "${BASE_SRC_URI} \
>  SRC_URI[md5sum] = "687e1dcd29452789d34eaeea4c25abe4"
>  SRC_URI[sha256sum] = "722def46e4a19a5b7a579ef30db1965f86c37c1a20a5f0113743a2e4399f7c99"
>
> +# We don't want to hardcode the m4 path since it will be found
> +# in the staging directory.
> +EXTRA_OECONF = " M4=m4"
> +
>  DEPENDS_virtclass-native = "gettext-minimal-native"
>  SRC_URI_virtclass-native = "${BASE_SRC_URI}"
>
>  inherit autotools gettext
>  acpaths = "-I ${S}/m4"
>
> -do_install_append_virtclass-native() {
> -	create_wrapper ${D}/${bindir}/bison \
> -		M4=${STAGING_BINDIR_NATIVE}/m4 \
> -		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
> -}
Don't you loose the setting of BISON_PKGDATADIR in this case?  Does that 
need to be poart of the EXTRA_OECONF?

Sau!

> -#bison-native encodes the staging M4 path
>  BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 01f7571..a913d21 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -10,6 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
>
>  inherit autotools gettext
>
> -do_install_append_virtclass-native() {
> -	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
> -}
> +# We don't want to hardcode the m4 path since it will be found
> +# in the staging directory.
> +EXTRA_OECONF = " M4=m4"
> +
> -- 1.7.6.4
>
>
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>



