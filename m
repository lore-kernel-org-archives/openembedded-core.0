Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AE5E71082
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:42:33 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.19590.1695307345678743796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FVQBXGe3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BBF94000F;
	Thu, 21 Sep 2023 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695307343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NK++m3iUw+gMVWagQWuK4SYNP/9nlRz42ctXKj4yGY=;
	b=FVQBXGe3RJEI5R1xXUzJluuRmOg4XYaEldlND6n1VpEcTTrD631NSblaW13JxgMua9f4PX
	lXf29v20esang9vGP9AQyOntFXTJzCNj/FhQFNDx4s+TwM59YsKoIdhPaXmKy0MdH2zm8c
	BspqHMMVyPDuB94tGZngtbFZM/om6O/vBq9Quz6cin5Wb72ct/0gROxg1AY/P7Vo8DUtCx
	OhJb/HFUSkcj4nc9zSWZ4tEuM8Lfa9L4Yd17QeZTFXYoE9ogP9HWtbpum4/MNlwdfM015n
	RbBhe/W8tTB2jIQTVcorjM3WyMVjXIIXI9Z10S7FOSuzoa3U9qIRslTxLVYBvg==
Date: Thu, 21 Sep 2023 16:42:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <2023092114422322cfc0b0@mail.local>
References: <20230920181526.386874-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230920181526.386874-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188009

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7816/steps/12/logs/stdio

ERROR: Nothing PROVIDES 'vte' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb DEPENDS on or otherwise requires it)
vte was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['matchbox-terminal', 'vte']
NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
NOTE: Runtime target 'packagegroup-core-x11-sato' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato', 'matchbox-terminal', 'vte']
NOTE: Runtime target 'packagegroup-core-x11-sato-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-base', 'matchbox-terminal', 'vte']
NOTE: Runtime target 'packagegroup-core-x11-sato-games' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-games', 'matchbox-terminal', 'vte']
NOTE: Runtime target 'packagegroup-core-x11-sato-apps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-apps', 'matchbox-terminal', 'vte']
ERROR: Nothing RPROVIDES 'matchbox-terminal-dev' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb RDEPENDS on or otherwise requires it)

On 20/09/2023 20:15:18+0200, Markus Volk wrote:
> Rework recipe
> 
> - remove legacy of the autotools buildsystem
> - remove BBCLASSEXTEND
> - build	vapi dependent on gi-data
> - docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
>   a combination	where docs=true	and gir=false
> - gtk+3 and gtk4 are requested by default-> add gtk4 dependency
> - install systemd support files	depending on DISTRO_FEATURE
> - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
>  .../vte/{vte_0.72.2.bb => vte_0.74.0.bb}      | 27 +++++---------
>  2 files changed, 22 insertions(+), 40 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.0.bb} (62%)
> 
> diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> index b4100fc381..8934d5f80a 100644
> --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> @@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
>  Signed-off-by: Andreas M�ller <schnitzeltony@gmail.com>
>  
>  [1] https://gitlab.gnome.org/GNOME/vte/issues/72
> -
>  ---
> - src/missing.hh | 4 ++++
> - src/widget.cc  | 1 +
> - 2 files changed, 5 insertions(+)
> + src/widget.cc  | 4 +++
> + 1 files changed, 4 insertions(+)
>  
> ---- a/src/missing.hh
> -+++ b/src/missing.hh
> -@@ -24,6 +24,10 @@
> - #define NSIG (8 * sizeof(sigset_t))
> - #endif
> +diff --git a/src/widget.cc b/src/widget.cc
> +index 07f7cabf..31a77f68 100644
> +--- a/src/widget.cc
> ++++ b/src/widget.cc
> +@@ -16,6 +16,10 @@
> +  * along with this library.  If not, see <https://www.gnu.org/licenses/>.
> +  */
>   
>  +#ifndef W_EXITCODE
>  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
>  +#endif
>  +
> - #ifndef HAVE_FDWALK
> - int fdwalk(int (*cb)(void* data, int fd),
> -            void* data);
> ---- a/src/widget.cc
> -+++ b/src/widget.cc
> -@@ -21,6 +21,7 @@
> - #include "widget.hh"
> - 
> - #include <sys/wait.h> // for W_EXITCODE
> -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> + #include "config.h"
>   
> - #include <exception>
> - #include <new>
> + #include "widget.hh"
> +-- 
> +2.42.0
> +
> diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-support/vte/vte_0.74.0.bb
> similarity index 62%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..4d91636a33 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -11,38 +11,29 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
>  "
>  
> -DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
> +DEPENDS = "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native gperf-native icu"
>  
>  GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_OPTION = 'gir'
>  GIDOCGEN_MESON_OPTION = "docs"
>  
> -inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
>  
> -# vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
> +SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
>  
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
>  
> -# Help g-ir-scanner find the .so for linking
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
> -}
> +EXTRA_OEMESON += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)}"
> +EXTRA_OEMESON:append = " ${@bb.utils.contains('GI_DATA_ENABLED', 'False', '-Ddocs=false', '', d)}"
>  
> -# Package additional files
> -FILES:${PN}-dev += "${datadir}/vala/vapi/*"
> -
> -PACKAGECONFIG ??= "gnutls"
> -PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
> +PACKAGECONFIG ??= "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
> -# vala requires gir
> -PACKAGECONFIG:remove:class-native = "vala"
> -
> -CFLAGS += "-D_GNU_SOURCE"
>  
>  PACKAGES =+ "libvte ${PN}-prompt"
> +FILES:${PN} +="${systemd_user_unitdir}"
>  FILES:libvte = "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt = " \
>      ${sysconfdir}/profile.d \
> @@ -50,5 +41,3 @@ FILES:${PN}-prompt = " \
>  "
>  
>  FILES:${PN}-dev += "${datadir}/glade/"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187940): https://lists.openembedded.org/g/openembedded-core/message/187940
> Mute This Topic: https://lists.openembedded.org/mt/101484377/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

