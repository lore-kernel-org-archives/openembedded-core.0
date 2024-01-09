Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCACDC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:32:30 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.16810.1704807144291069283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout01.t-online.de (Postfix) with SMTP id 8B22F30166
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jan 2024 14:32:21 +0100 (CET)
Received: from [192.168.178.67] ([84.154.162.27]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNCDL-0M58Vc0; Tue, 9 Jan 2024 14:32:19 +0100
Date: Tue, 09 Jan 2024 14:32:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: openembedded-core@lists.openembedded.org
Message-Id: <PLXZ6S.UNFZMOJ43CYT3@t-online.de>
In-Reply-To: <17A8B0DD7AD4D31C.21327@lists.openembedded.org>
References: <17A8B0DD7AD4D31C.21327@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-O0QWk2GCB1CVUgaT5Ucn"
X-TOI-EXPURGATEID: 150726::1704807139-FB7FD850-30BB11D6/0/0 CLEAN NORMAL
X-TOI-MSGID: b8d1d810-7321-4edf-bd33-72f93ae0c6e1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 13:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193457

--=-O0QWk2GCB1CVUgaT5Ucn
Content-Type: text/plain; charset=us-ascii; format=flowed

Tested this to be working with just oe-core layers (poky and nodistro) 
with glibc and musl for x86_64, aarch64 rpi and qemuarm.
Still this is quite invasive and one can have strong opinions about 
cmake, so i marked it RFC

On Tue, Jan 9 2024 at 02:28:26 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Besides the improvements that cmake offers compared to autotools,
> the advantage would be that cmake config files get created.
> This is useful so that other projects can find webp using cmake.
> 
> Remove EXTRA_OECONF settings because all of them are set like this
> by default.
> 
> CMakeLists.txt doesn't provide an option for selecting neon but from
> what I have tested it gets selected properly.
> 
> Downside is that there is no way to deactivate gif,jpeg,tiff,png or
> opengl. The libraries are used whenever they are pulled into the 
> sysroot.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-multimedia/webp/libwebp_1.3.2.bb | 35 
> +++++--------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb 
> b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> index 63b0fd9a6c..c6a4b97884 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> @@ -18,40 +18,23 @@ SRC_URI[sha256sum] = 
> "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562
> 
>  UPSTREAM_CHECK_URI = 
> "<http://downloads.webmproject.org/releases/webp/index.html>"
> 
> -EXTRA_OECONF = " \
> -    --disable-wic \
> -    --enable-libwebpmux \
> -    --enable-libwebpdemux \
> -    --enable-threading \
> -"
> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
> 
> -# Do not trust configure to determine if neon is available.
> -#
> -EXTRA_OECONF_ARM = " \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)} 
> \
> -"
> -EXTRA_OECONF:append:arm = " ${EXTRA_OECONF_ARM}"
> -EXTRA_OECONF:append:armeb = " ${EXTRA_OECONF_ARM}"
> -
> -inherit autotools lib_package
> -
> -PACKAGECONFIG ??= ""
> -
> -# libwebpdecoder is a subset of libwebp, don't build it unless 
> requested
> -PACKAGECONFIG[decoder] = 
> "--enable-libwebpdecoder,--disable-libwebpdecoder"
> +inherit cmake lib_package
> 
> +PACKAGECONFIG ?= ""
>  # Apply for examples programs: cwebp and dwebp
> -PACKAGECONFIG[gif] = "--enable-gif,--disable-gif,giflib"
> -PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
> -PACKAGECONFIG[png] = "--enable-png,--disable-png,,libpng"
> -PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
> -
> +PACKAGECONFIG[gif] = ",,giflib"
> +PACKAGECONFIG[jpeg] = ",,jpeg"
> +PACKAGECONFIG[png] = ",,libpng"
> +PACKAGECONFIG[tiff] = ",,tiff"
>  # Apply only for example program vwebp
> -PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,mesa-glut"
> +PACKAGECONFIG[opengl] = ",,mesa-glut"
> 
>  PACKAGES =+ "${PN}-gif2webp"
> 
>  DESCRIPTION:${PN}-gif2webp = "Simple tool to convert animated GIFs 
> to WebP"
>  FILES:${PN}-gif2webp = "${bindir}/gif2webp"
> 
> +FILES:${PN} += "${datadir}"
>  BBCLASSEXTEND += "native nativesdk"
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193456): 
> <https://lists.openembedded.org/g/openembedded-core/message/193456>
> Mute This Topic: <https://lists.openembedded.org/mt/103619059/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-O0QWk2GCB1CVUgaT5Ucn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Tested this to be working with just oe-core layers (poky and nodistro) with glibc and musl for x86_64, aarch64 rpi and qemuarm.</div><div>Still this is quite invasive and one can have strong opinions about cmake, so i marked it RFC</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 9 2024 at 02:28:26 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Besides the improvements that cmake offers compared to autotools,
the advantage would be that cmake config files get created.
This is useful so that other projects can find webp using cmake.

Remove EXTRA_OECONF settings because all of them are set like this
by default.

CMakeLists.txt doesn't provide an option for selecting neon but from
what I have tested it gets selected properly.

Downside is that there is no way to deactivate gif,jpeg,tiff,png or
opengl. The libraries are used whenever they are pulled into the sysroot.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-multimedia/webp/libwebp_1.3.2.bb | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
index 63b0fd9a6c..c6a4b97884 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
@@ -18,40 +18,23 @@ SRC_URI[sha256sum] = "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562
 
 UPSTREAM_CHECK_URI = "<a href="http://downloads.webmproject.org/releases/webp/index.html">http://downloads.webmproject.org/releases/webp/index.html</a>"
 
-EXTRA_OECONF = " \
-    --disable-wic \
-    --enable-libwebpmux \
-    --enable-libwebpdemux \
-    --enable-threading \
-"
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
 
-# Do not trust configure to determine if neon is available.
-#
-EXTRA_OECONF_ARM = " \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)} \
-"
-EXTRA_OECONF:append:arm = " ${EXTRA_OECONF_ARM}"
-EXTRA_OECONF:append:armeb = " ${EXTRA_OECONF_ARM}"
-
-inherit autotools lib_package
-
-PACKAGECONFIG ??= ""
-
-# libwebpdecoder is a subset of libwebp, don't build it unless requested
-PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
+inherit cmake lib_package
 
+PACKAGECONFIG ?= ""
 # Apply for examples programs: cwebp and dwebp
-PACKAGECONFIG[gif] = "--enable-gif,--disable-gif,giflib"
-PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[png] = "--enable-png,--disable-png,,libpng"
-PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
-
+PACKAGECONFIG[gif] = ",,giflib"
+PACKAGECONFIG[jpeg] = ",,jpeg"
+PACKAGECONFIG[png] = ",,libpng"
+PACKAGECONFIG[tiff] = ",,tiff"
 # Apply only for example program vwebp
-PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,mesa-glut"
+PACKAGECONFIG[opengl] = ",,mesa-glut"
 
 PACKAGES =+ "${PN}-gif2webp"
 
 DESCRIPTION:${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
 FILES:${PN}-gif2webp = "${bindir}/gif2webp"
 
+FILES:${PN} += "${datadir}"
 BBCLASSEXTEND += "native nativesdk"
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#193456): <a href="https://lists.openembedded.org/g/openembedded-core/message/193456">https://lists.openembedded.org/g/openembedded-core/message/193456</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/103619059/3618223">https://lists.openembedded.org/mt/103619059/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-O0QWk2GCB1CVUgaT5Ucn--


