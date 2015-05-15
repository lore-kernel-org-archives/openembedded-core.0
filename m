Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 399F8609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 15:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1E05A3154634
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 17:50:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id muqiyky3qcE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 17:50:34 +0200 (CEST)
Received: from [172.22.22.61] (55d41029.access.ecotel.net [85.212.16.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E610131545FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 17:50:33 +0200 (CEST)
Message-ID: <555615C9.3030503@opendreambox.org>
Date: Fri, 15 May 2015 17:50:33 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1431696945.git.joshua.lock@collabora.co.uk>
	<a77975067764b47f3e9cf28b3de7ecfbfe5b2342.1431696945.git.joshua.lock@collabora.co.uk>
In-Reply-To: <a77975067764b47f3e9cf28b3de7ecfbfe5b2342.1431696945.git.joshua.lock@collabora.co.uk>
Subject: Re: [PATCH 1/1] cairo: make xlib and libxcb dependencies explicit
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
X-List-Received-Date: Fri, 15 May 2015 15:50:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Joshua,

On 15.05.2015 15:37, Joshua Lock wrote:
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>  meta/recipes-graphics/cairo/cairo.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 98add5a..1e45318 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -17,9 +17,11 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>  
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
> -PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
> +
> +PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
> +PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"

your patch adds a dependency on xcb by default, which you didn't
mention.

Cairo has more floating dependencies. I have a similar but more
complete patch which I haven't tested on master yet. See below.

Regards,
Andreas

From 1a1057b89c7c7d5ebd7087ac9a2cba98bb183ec0 Mon Sep 17 00:00:00 2001
From: Andreas Oberritter <obi@opendreambox.org>
Date: Fri, 27 Mar 2015 23:23:01 +0100
Subject: [PATCH] cairo: improve packageconfig options

Fixes floating dependencies on various x11 libs and directfb.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cairo/cairo.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index cd37559..fd217e6 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,16 +10,19 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
-X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xlib xlib-xrender', '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
-PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
-PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
+PACKAGECONFIG[directfb] = "--enable-directfb,--disable-directfb,directfb"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
+PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
+PACKAGECONFIG[xcb-shm] = "--enable-xcb-shm,--disable-xcb-shm,libxcb"
+PACKAGECONFIG[xlib-xcb] = "--enable-xlib-xcb,--disable-xlib-xcb,virtual/libx11"
+PACKAGECONFIG[xlib] = "--enable-xlib,--disable-xlib,virtual/libx11 libxext"
+PACKAGECONFIG[xlib-xrender] = "--enable-xlib-xrender,--disable-xlib-xrender,libxrender"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-- 
1.9.1



