Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnEdl-0000oO-Nx
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 20:52:01 +0200
Received: by iyj12 with SMTP id 12so5759465iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=5/n4556oGpzxk0aDXjdqagdr0Wi2vjTrGnng6VHlhgo=;
	b=P5zoV8sr7CuEVJP9nu2FxkQbTeeRr7Y1IX/r65cpITXL5uxwyOvn79nxyAxuDJGvXy
	RP6CQ2fHeQrtWy2rF1gEIpB3Cispu69FwyAkT0Pt0ysgDOztJUExljRoaT4sMErFdQcN
	F7/KlYEVElFuyFO3OEBY+u2T9lJKCxmb9J5U8=
Received: by 10.142.177.1 with SMTP id z1mr672292wfe.174.1312051661988;
	Sat, 30 Jul 2011 11:47:41 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t20sm1973109wff.18.2011.07.30.11.47.41
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 11:47:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 11:47:39 -0700
Message-ID: <1762625.M9azkoXr3D@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <b5416aada1f601affe6bd00a1058a130218392df.1311858056.git.edwin.zhai@intel.com>
References: <cover.1311858056.git.edwin.zhai@intel.com>
	<b5416aada1f601affe6bd00a1058a130218392df.1311858056.git.edwin.zhai@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] apr: Upgrade to 1.4.5
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
X-List-Received-Date: Sat, 30 Jul 2011 18:52:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, July 28, 2011 09:03:05 PM edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> Remove buildconf_fix.patch as already in upstream.
> 
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
>  meta/recipes-support/apr/apr/buildconf_fix.patch   |   27
> -------------------- .../apr/{apr_1.4.2.bb => apr_1.4.5.bb}             |  
>  9 +++---
>  2 files changed, 5 insertions(+), 31 deletions(-)
>  delete mode 100644 meta/recipes-support/apr/apr/buildconf_fix.patch
>  rename meta/recipes-support/apr/{apr_1.4.2.bb => apr_1.4.5.bb} (85%)
> 
> diff --git a/meta/recipes-support/apr/apr/buildconf_fix.patch
> b/meta/recipes-support/apr/apr/buildconf_fix.patch deleted file mode 100644
> index 2c9d62e..0000000
> --- a/meta/recipes-support/apr/apr/buildconf_fix.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Remove the new libtool detection method to avoid config failure. Poky's
> libtool -has different format for "aclocaldir", and there is no elegant
> parsing method, -so fall back to old detection.
> -
> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Index: apr-1.4.2/buildconf
> -===================================================================
> ---- apr-1.4.2.orig/buildconf	2009-11-13 06:19:49.000000000 +0800
> -+++ apr-1.4.2/buildconf	2010-11-29 14:39:19.000000000 +0800
> -@@ -50,14 +50,6 @@
> -
> - if [ -f libtool.m4 ]; then
> -    ltfile=`pwd`/libtool.m4
> --elif grep all_pkgmacro_files $libtoolize > /dev/null; then
> --    # libtool 2.x
> --   aclocal_dir=`sed -n '/^aclocaldir=/{s/.*=//;p;q;}' < $libtoolize`
> --   ltfiles=`sed -n '/^all_pkgmacro_files=/{s/.*=//;;s/"//;p;q;}' <
> $libtoolize` --   for f in $ltfiles; do
> --       test -f "$aclocal_dir/$f" && cp "$aclocal_dir/$f" build
> --   done
> --   ltfile=$aclocal_dir/libtool.m4
> - else
> -    ltfindcmd="`sed -n \"/=[^\\\`]/p;/libtool_m4=/{s/.*=/echo /p;q;}\" \
> -                    < $libtoolize`"
> diff --git a/meta/recipes-support/apr/apr_1.4.2.bb
> b/meta/recipes-support/apr/apr_1.4.5.bb similarity index 85%
> rename from meta/recipes-support/apr/apr_1.4.2.bb
> rename to meta/recipes-support/apr/apr_1.4.5.bb
> index 89bdadf..26a1818 100644
> --- a/meta/recipes-support/apr/apr_1.4.2.bb
> +++ b/meta/recipes-support/apr/apr_1.4.5.bb
> @@ -11,11 +11,10 @@ PR = "r0"
>  SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
>             file://configure_fixes.patch;patch=1 \
>  	   file://cleanup.patch;patch=1 \
> -           file://configfix.patch;patch=1 \
> -           file://buildconf_fix.patch;patch=1"
> +           file://configfix.patch;patch=1"

while you are at it get rid of patch=1 from SRC_URI its default in bitbake and 
redundant to use

> 
> -SRC_URI[md5sum] = "4b00e8f70c067893d075577962656b35"
> -SRC_URI[sha256sum] =
> "2017ca700694d09d2b0b21dd7c4d195e43a48735aac88526160c6195ee8f5391"
> +SRC_URI[md5sum] = "8b53f5a5669d0597f2da889a2f576eb6"
> +SRC_URI[sha256sum] =
> "38c61cacb39be649411cdab212979c71ce29495549c249c2e9a1b0d12480c93e"
> 
>  inherit autotools lib_package binconfig
> 
> @@ -26,6 +25,8 @@ do_configure_prepend() {
>  	./buildconf
>  }
> 
> +FILES_${PN}-dev += "${libdir}/apr.exp ${datadir}/build-1/*"
> +
>  #for some reason, build/libtool.m4 handled by buildconf still be
> overwritten #when autoconf, so handle it again.
>  do_configure_append() {
-- 
Khem Raj


