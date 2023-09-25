Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73502CE79A7
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 22:03:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.5245.1695679388694067212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 15:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XyZCMEyE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6F101BF206;
	Mon, 25 Sep 2023 22:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695679386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFYC7CX5O2ZzZMdM1VeMr3mKumqg9DeszGrW5QBO+u0=;
	b=XyZCMEyEbwz3BOBWLMQOSXAPFpyJrhWieWTP1jFFmXQ3GMQR/jTYy5B1aAheG/WacOrs20
	iDxyOlRqdZCQC/PPscmihzrv3dgtLpxW5OQF4HGnRkO3Lb2D0Tzkjf0ABLuBFrKTcjWW7e
	+7IpwJ82jr2g/uPCwHTKVnUms0XIRsFRWM6dM+9cq4i6PSypd5idSx8uisoeHCRmJuE2+t
	p2M4sM2pyn3/dN+xwjTH0+9GGVDiAlrDBGmfYeg6u5hLFD85Rpjc/UfZqih7eWH/Cri3+4
	xhbznedDAByCI7i4687W8SFkdNAd8EdAiolrif5evnack8kcrBObvIQmZX6XRg==
Date: Tue, 26 Sep 2023 00:03:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv7] vte: upgrade 2.72.2 -> 2.74.0
Message-ID: <202309252203050a51bfa1@mail.local>
References: <20230922103954.1738810-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922103954.1738810-1-f_l_k@t-online.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 22:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188212

Hello,

It was not clear to me but I'm fairly sure this is what causes this
failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/7719/steps/12/logs/stdio

On 22/09/2023 12:39:51+0200, Markus Volk wrote:
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
> ---
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
>  .../vte/{vte_0.72.2.bb => vte_0.74.0.bb}      | 29 ++++++---------
>  2 files changed, 25 insertions(+), 39 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb => vte_0.74.0.bb} (67%)
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
> similarity index 67%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..aeaf088598 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -17,32 +17,27 @@ GNOMEBASEBUILDCLASS = "meson"
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
> @@ -50,5 +45,3 @@ FILES:${PN}-prompt = " \
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
> View/Reply Online (#188095): https://lists.openembedded.org/g/openembedded-core/message/188095
> Mute This Topic: https://lists.openembedded.org/mt/101518552/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

