Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5CBCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 07:50:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.31749.1695196229016114249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 00:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DhxQ4H6X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB1ED1BF210;
	Wed, 20 Sep 2023 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695196227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hDAjCj6qaPGAIIk8K53LGQlDhHoRpErLWRM34Ve/5l4=;
	b=DhxQ4H6XrO1w40Seirjg8rexlHxu+yyLfHGpZ8kJp+LtxC6ra48NhPqmIbYU78k2mk9Fep
	pwhSwGyvEjrxgu+QsqW4kIN6eQqaH/TIk61THPTsN0BouG1ZiwhR3XySHlMkjD3jRFqjTH
	ASrUs9uAkr5i7OSypphlfWRn279XqDre5Olx8mwCfRDYE4WlIM/BNB3cmtpk91cR0nFxUO
	TDKHshR825KTPJhQ9Bf41GbPR3+oyX41VuyBgxSkZMiLMzvB9IQRcGACV4g4lp6HIiPTgB
	x1cLLvKk311bTxshUHTWhJMx0BIg/PuHr4sotx1l+2dIgIsAffPsLfAU4fK9iQ==
Date: Wed, 20 Sep 2023 09:50:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <2023092007502630214fb4@mail.local>
References: <20230919133427.2319190-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919133427.2319190-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187897

This caused:

stdio: WARNING: Nothing PROVIDES 'nativesdk-gtk4' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support/vte/vte_0.74.0.bb DEPENDS on or otherwise requires it). Close matches:
stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support/vte/vte_0.74.0.bb RDEPENDS on or otherwise requires it)
stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support/vte/vte_0.74.0.bb RDEPENDS on or otherwise requires it)

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8147/steps/12/logs/stdio



On 19/09/2023 15:33:56+0200, Markus Volk wrote:
> Rework recipe
> 
> - remove legacy of the autotools buildsystem
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
>  .../vte/{vte_0.72.2.bb => vte_0.74.0.bb}      | 24 ++++---------
>  2 files changed, 21 insertions(+), 38 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.0.bb} (64%)
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
> similarity index 64%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..74574d3684 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -11,38 +11,28 @@ LIC_FILES_CHKSUM = " \
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
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187870): https://lists.openembedded.org/g/openembedded-core/message/187870
> Mute This Topic: https://lists.openembedded.org/mt/101455999/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

