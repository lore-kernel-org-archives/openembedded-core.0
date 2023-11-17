Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9065BC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 11:06:43 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.9344.1700219192760839337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 03:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pbjZ/SOq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6998A2000A;
	Fri, 17 Nov 2023 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700219190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYUp50gNJO9S+yb4+wMCU6kFt4K2hKc13le2Bu8WHyc=;
	b=pbjZ/SOq/WW87+imNqL7FN4i2JlLSOSWZm1PAlwJgK+nyojmLAwZYgxQqXJTSe1mkXeOIZ
	ZlCcGbIqGaRaxr2ISn6X9EwYXjB4PUQ3ktNuQNgyd6DaQvp0Rc3ubOHwdr76s9cYz1CUaG
	oqhk2/lgclUrOAbe4DIznDHF8BXY1yFA8rotgNubhckW+tkb323YnYu4xnCXR0zyWZap46
	A3hryeCL/3gPPGoYTjynucNYKaCUX1XbFkzDnAUdZlxEP88r0PBb36RoX7w15ZFmfDjoqj
	qtztgnar1dhyuAja38t8birq5BWvpRy2dzP794P1nREgluYVYSTXeKr021Dd9Q==
Date: Fri, 17 Nov 2023 12:06:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v8 1/2] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <20231117110630da1a7c99@mail.local>
References: <20231115182417.415940-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115182417.415940-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190835

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8176/steps/21/logs/stdio

ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: duplicate files /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/multilib/lib32/usr/share/glib-2.0/schemas/gschemas.compiled /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/usr/share/glib-2.0/schemas/gschemas.compiled is not the same


On 15/11/2023 10:24:15-0800, Khem Raj wrote:
> From: Markus Volk <f_l_k@t-online.de>
> 
> Rework recipe
> 
> - remove legacy of the autotools buildsystem
> - remove BBCLASSEXTEND
> - build	vapi dependent on gi-data
> - docs require gir, add	a EXTRA_OEMESON:append to avoid	fail in
>   a combination	where docs=true	and gir=false
> - gtk+3 and gtk4 are requested by default-> add gtk4 depending
>   on DISTRO_FEATURE
> - install systemd support files	depending on DISTRO_FEATURE
> - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v8: Rebased on latest tip of trunk
> 
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
>  .../vte/{vte_0.72.2.bb => vte_0.74.0.bb}      | 29 ++++++---------
>  2 files changed, 25 insertions(+), 39 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.0.bb} (66%)
> 
> diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> index b4100fc381e..8934d5f80a6 100644
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
> similarity index 66%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 44e71491f62..21203adcf79 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -16,32 +16,27 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
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
> +PACKAGECONFIG ??= " \
> +	gnutls \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
> +"
> +PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
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
> @@ -49,5 +44,3 @@ FILES:${PN}-prompt = " \
>  "
>  
>  FILES:${PN}-dev += "${datadir}/glade/"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.42.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190739): https://lists.openembedded.org/g/openembedded-core/message/190739
> Mute This Topic: https://lists.openembedded.org/mt/102611065/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

