Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCCD079510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:15:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7N8FajJ010647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 23 Aug 2018 09:15:37 +0100
Message-ID: <eafbe2693401ebc8616f45970924141394b491da.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 09:15:36 +0100
In-Reply-To: <1534900232-59325-1-git-send-email-changqing.li@windriver.com>
References: <1534900232-59325-1-git-send-email-changqing.li@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] freetype: Upgrade 2.9 -> 2.9.1
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
X-List-Received-Date: Thu, 23 Aug 2018 08:15:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 09:10 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../freetype/fix-potential-numeric-overflow.patch  | 28 ------------
> ----------
>  .../{freetype_2.9.bb => freetype_2.9.1.bb}         | 10 ++++----
>  2 files changed, 4 insertions(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-graphics/freetype/freetype/fix-
> potential-numeric-overflow.patch
>  rename meta/recipes-graphics/freetype/{freetype_2.9.bb =>
> freetype_2.9.1.bb} (85%)
> 
> diff --git a/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch b/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch
> deleted file mode 100644
> index 0b5b3c6..0000000
> --- a/meta/recipes-graphics/freetype/freetype/fix-potential-numeric-overflow.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -freetype-2.9: Fix potential numeric overflow
> -
> -[No upstream tracking] -- https://savannah.nongnu.org/bugs/index.php?54023
> -
> -ttcmap: (tt_cmap2_validate): Fix potential numeric overflow
> -
> -The dead loop appears in the function tt_cmap2_char_next()
> -in "src\sfnt\ttcmap.c" in version 2.9 when "charcode == 256".
> -According to the notes, is seems that "subheader" should
> -not be NULL when "charcode == 256".
> -
> -Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/src/sfnt/ttcmap.c?id=5bd76524ef786d942b28dc52618aeda3aebfa3d6]
> -bug: 54023
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff --git a/src/sfnt/ttcmap.c b/src/sfnt/ttcmap.c
> -index 5afa6ae..8fb9542 100644
> ---- a/src/sfnt/ttcmap.c
> -+++ b/src/sfnt/ttcmap.c
> -@@ -358,7 +358,7 @@
> -       /* check range within 0..255 */
> -       if ( valid->level >= FT_VALIDATE_PARANOID )
> -       {
> --        if ( first_code >= 256 || first_code + code_count > 256 )
> -+        if ( first_code >= 256 || code_count > 256 - first_code )
> -           FT_INVALID_DATA;
> -       }
> - 
> diff --git a/meta/recipes-graphics/freetype/freetype_2.9.bb b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
> similarity index 85%
> rename from meta/recipes-graphics/freetype/freetype_2.9.bb
> rename to meta/recipes-graphics/freetype/freetype_2.9.1.bb
> index 216ecf3..1e6f66e 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.9.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
> @@ -14,16 +14,15 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>             file://use-right-libtool.patch \
> -           file://fix-potential-numeric-overflow.patch \
>            "
>  
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
>  UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
>  
> -SRC_URI[md5sum] = "513c403c110016fdc7e537216a642b1d"
> -SRC_URI[sha256sum] = "e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a"
> +SRC_URI[md5sum] = "60ef7d8160cd4bf8cb118ee9d65367ca"
> +SRC_URI[sha256sum] = "db8d87ea720ea9d5edc5388fc7a0497bb11ba9fe972245e0f7f4c7e8b1e1e84d"
>  
> -inherit autotools pkgconfig binconfig-disabled multilib_header
> +inherit autotools pkgconfig multilib_header
>  
>  # Adapt autotools to work with the minimal autoconf usage in freetype
>  AUTOTOOLS_SCRIPT_PATH = "${S}/builds/unix"
> @@ -37,6 +36,7 @@ PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
>  PACKAGECONFIG[harfbuzz] = "--with-harfbuzz,--without-harfbuzz,harfbuzz"
>  PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
>  PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> +PACKAGECONFIG[freetypeconfig] = "--enable-freetype-config=yes,--enable-freetype-config=no,"
>  
>  EXTRA_OECONF = "CC_BUILD='${BUILD_CC}'"
>  
> @@ -46,6 +46,4 @@ do_install_append() {
>  	oe_multilib_header freetype2/freetype/config/ftconfig.h
>  }
>  
> -BINCONFIG = "${bindir}/freetype-config"
> -
>  BBCLASSEXTEND = "native nativesdk"

The commit message makes no mention of the removal/disabling of the
config script or the removal of the patch. You need to explain why
these changes were made.

In this case I fixed the commit message when merging.

Cheers,

Richard


