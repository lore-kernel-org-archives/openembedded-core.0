Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6D6C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 07:16:37 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.56637.1710141393066962613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 00:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout02.t-online.de (Postfix) with SMTP id F15A71DB0C;
	Mon, 11 Mar 2024 08:16:30 +0100 (CET)
Received: from [192.168.178.67] ([84.154.172.233]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjZte-1xNAOm0; Mon, 11 Mar 2024 08:16:30 +0100
Date: Mon, 11 Mar 2024 08:16:51 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] vala: fix for gtk4 prior to 4.14
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Message-Id: <3K96AS.03P2TZ4J026C3@t-online.de>
In-Reply-To: <17BBA43635C7AF1B.17779@lists.openembedded.org>
References: <17BBA43635C7AF1B.17779@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tDhV8XUdXUMUZIl15uqD"
X-TOI-EXPURGATEID: 150726::1710141390-F9FF8850-994EF923/0/0 CLEAN NORMAL
X-TOI-MSGID: da5fea17-51f8-4175-9fae-0fda6b6572f2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196916

--=-tDhV8XUdXUMUZIl15uqD
Content-Type: text/plain; charset=us-ascii; format=flowed

I simply dropped the part that patched gtk-4.0.metadata. The problem is 
fixed without it
and I dont really have an idea what this file is used for. So I dislike 
adding it

On Mon, Mar 11 2024 at 12:10:36 AM -07:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - add a backport patch to fix compatibility with older gtk4 versions
> - merge .bb and .inc
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-devtools/vala/vala.inc           | 71 -----------------
>  ...tk4-Preserve-compatibility-with-4.14.patch | 37 +++++++++
>  meta/recipes-devtools/vala/vala_0.56.15.bb    | 76 
> ++++++++++++++++++-
>  3 files changed, 112 insertions(+), 72 deletions(-)
>  delete mode 100644 meta/recipes-devtools/vala/vala.inc
>  create mode 100644 
> meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
> 
> diff --git a/meta/recipes-devtools/vala/vala.inc 
> b/meta/recipes-devtools/vala/vala.inc
> deleted file mode 100644
> index 0177e86240..0000000000
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -SUMMARY = "C#-like programming language for easing GObject 
> programming"
> -HOMEPAGE = "http://vala-project.org <http://vala-project.org/>"
> -DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject 
> programming. \
> -Vala compiles to plain C and has no runtime environment nor 
> penalities whatsoever."
> -SECTION = "devel"
> -DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
> -
> -# Appending libxslt-native to dependencies has an effect
> -# of rebuilding the manual, which is very slow. Let's do this
> -# only when api-documentation distro feature is enabled.
> -DEPENDS:append:class-target = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'api-documentation', 
> 'libxslt-native', '', d)}"
> -
> -# vala-native contains a native version of vapigen, which we use 
> instead of the target one
> -DEPENDS:append:class-target = " vala-native"
> -BBCLASSEXTEND = "native"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" 
> <file://copying;md5=fbc093901857fcd118f065f900982c24/>
> -
> -SHRT_VER = "${@d.getVar 
> <mailto:${@d.getVar>('PV').split('.')[0]}.${@d.getVar 
> <mailto:}.${@d.getVar>('PV').split('.')[1]}"
> -
> -SRC_URI = 
> "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz 
> <http://ftp.gnome.org/pub/GNOME/sources/$%7BBPN%7D/$%7BSHRT_VER%7D/$%7BBP%7D.tar.xz>"
> -inherit autotools pkgconfig upstream-version-is-even
> -
> -FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi 
> ${libdir}/${BPN}-${SHRT_VER}/"
> -FILES:${PN}-doc += "${datadir}/devhelp"
> -
> -# .gir files from gobject-introspection are installed to ${libdir} 
> when multilib is enabled
> -GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if 
> d.getVar('MULTILIBS') else ''}"
> -
> -do_configure:prepend:class-target() {
> -        # Write out a vapigen wrapper that will be provided by 
> pkg-config file installed in target sysroot
> -        # The wrapper will call a native vapigen
> -        cat > ${B}/vapigen-wrapper << EOF
> -#!/bin/sh
> -vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
> -EOF
> -        chmod +x ${B}/vapigen-wrapper
> -}
> -
> -EXTRA_OECONF += " --disable-valadoc"
> -
> -# Vapigen wrapper needs to be available system-wide, because it will 
> be used
> -# to build vapi files from all other packages with vala support
> -do_install:append:class-target() {
> -        install -d ${D}${bindir_crossscripts}/
> -        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
> -}
> -
> -# Put vapigen wrapper into target sysroot so that it can be used 
> when building
> -# vapi files.
> -SYSROOT_DIRS += "${bindir_crossscripts}"
> -
> -inherit multilib_script
> -MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
> -
> -SYSROOT_PREPROCESS_FUNCS:append:class-target = " 
> vapigen_sysroot_preprocess"
> -vapigen_sysroot_preprocess() {
> -        # Tweak the vapigen name in the vapigen pkgconfig file, so 
> that it picks
> -        # up our wrapper.
> -        sed -i \
> -           -e 
> "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
> -           
> ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
> -}
> -
> -SSTATE_SCAN_FILES += "vapigen-wrapper"
> -
> -PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
> -
> -vala_package_preprocess () {
> -	rm -rf ${PKGD}${bindir_crossscripts}
> -}
> diff --git 
> a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch 
> b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
> new file mode 100644
> index 0000000000..e33b0bb36b
> --- /dev/null
> +++ 
> b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
> @@ -0,0 +1,37 @@
> +From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 
> 2001
> +From: Rico Tzschichholz <ricotz@ubuntu.com 
> <mailto:ricotz@ubuntu.com>>
> +Date: Thu, 7 Mar 2024 17:56:05 +0100
> +Subject: [PATCH] gtk4: Preserve compatibility with < 4.14
> +
> +Don't prefer new accessor methods for Calendar.day/month/year
> +
> +Fixes <https://gitlab.gnome.org/GNOME/vala/issues/1531>
> +
> +Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e>]
> +---
> + vapi/gtk4.vapi                 | 3 +++
> + vapi/metadata/Gtk-4.0.metadata | 5 +++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
> +index 49f8b2078..51ecea27d 100644
> +--- a/vapi/gtk4.vapi
> ++++ b/vapi/gtk4.vapi
> +@@ -7350,11 +7350,14 @@ namespace Gtk {
> + 		[Version (since = "4.14")]
> + 		public void set_year (int year);
> + 		public void unmark_day (uint day);
> ++		[NoAccessorMethod]
> + 		public int day { get; set; }
> ++		[NoAccessorMethod]
> + 		public int month { get; set; }
> + 		public bool show_day_names { get; set; }
> + 		public bool show_heading { get; set; }
> + 		public bool show_week_numbers { get; set; }
> ++		[NoAccessorMethod]
> + 		public int year { get; set; }
> + 		public signal void day_selected ();
> + 		public signal void next_month ();
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb 
> b/meta/recipes-devtools/vala/vala_0.56.15.bb
> index dc483b12ba..1f55689c45 100644
> --- a/meta/recipes-devtools/vala/vala_0.56.15.bb
> +++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
> @@ -1,3 +1,77 @@
> -require ${BPN}.inc
> +SUMMARY = "C#-like programming language for easing GObject 
> programming"
> +HOMEPAGE = "http://vala-project.org <http://vala-project.org/>"
> +DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject 
> programming. \
> +Vala compiles to plain C and has no runtime environment nor 
> penalities whatsoever."
> +SECTION = "devel"
> +DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
> 
> +# Appending libxslt-native to dependencies has an effect
> +# of rebuilding the manual, which is very slow. Let's do this
> +# only when api-documentation distro feature is enabled.
> +DEPENDS:append:class-target = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'api-documentation', 
> 'libxslt-native', '', d)}"
> +
> +# vala-native contains a native version of vapigen, which we use 
> instead of the target one
> +DEPENDS:append:class-target = " vala-native"
> +BBCLASSEXTEND = "native"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" 
> <file://copying;md5=fbc093901857fcd118f065f900982c24/>
> +
> +SHRT_VER = "${@d.getVar 
> <mailto:${@d.getVar>('PV').split('.')[0]}.${@d.getVar 
> <mailto:}.${@d.getVar>('PV').split('.')[1]}"
> +
> +SRC_URI = " \
> +	http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz 
> <http://ftp.gnome.org/pub/GNOME/sources/$%7BBPN%7D/$%7BSHRT_VER%7D/$%7BBP%7D.tar.xz> 
> \
> +	file://0001-gtk4-Preserve-compatibility-with-4.14.patch 
> <file://0001-gtk4-preserve-compatibility-with-4.14.patch/> \
> +"
>  SRC_URI[sha256sum] = 
> "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
> +
> +inherit autotools pkgconfig upstream-version-is-even
> +
> +FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi 
> ${libdir}/${BPN}-${SHRT_VER}/"
> +FILES:${PN}-doc += "${datadir}/devhelp"
> +
> +# .gir files from gobject-introspection are installed to ${libdir} 
> when multilib is enabled
> +GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if 
> d.getVar('MULTILIBS') else ''}"
> +
> +do_configure:prepend:class-target() {
> +        # Write out a vapigen wrapper that will be provided by 
> pkg-config file installed in target sysroot
> +        # The wrapper will call a native vapigen
> +        cat > ${B}/vapigen-wrapper << EOF
> +#!/bin/sh
> +vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
> +EOF
> +        chmod +x ${B}/vapigen-wrapper
> +}
> +
> +EXTRA_OECONF += " --disable-valadoc"
> +
> +# Vapigen wrapper needs to be available system-wide, because it will 
> be used
> +# to build vapi files from all other packages with vala support
> +do_install:append:class-target() {
> +        install -d ${D}${bindir_crossscripts}/
> +        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
> +}
> +
> +# Put vapigen wrapper into target sysroot so that it can be used 
> when building
> +# vapi files.
> +SYSROOT_DIRS += "${bindir_crossscripts}"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
> +
> +SYSROOT_PREPROCESS_FUNCS:append:class-target = " 
> vapigen_sysroot_preprocess"
> +vapigen_sysroot_preprocess() {
> +        # Tweak the vapigen name in the vapigen pkgconfig file, so 
> that it picks
> +        # up our wrapper.
> +        sed -i \
> +           -e 
> "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
> +           
> ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
> +}
> +
> +SSTATE_SCAN_FILES += "vapigen-wrapper"
> +
> +PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
> +
> +vala_package_preprocess () {
> +	rm -rf ${PKGD}${bindir_crossscripts}
> +}
> +
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196915): 
> <https://lists.openembedded.org/g/openembedded-core/message/196915>
> Mute This Topic: <https://lists.openembedded.org/mt/104858822/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-tDhV8XUdXUMUZIl15uqD
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I simply dropped the part that patched gtk-4.0.metadata. The problem is fixed without it</div><div>and I dont really have an idea what this file is used for. So I dislike adding it</div><div class="layout-page page-with-super-sidebar"><div class="content-wrapper"><div class=" project-highlight-puc"><main class="content" id="content-body" itemscope="" itemtype="http://schema.org/SoftwareSourceCode"><div class="container-fluid container-limited"><div class="limited-width-notes">

<div id="js-report-abuse-drawer"></div>

</div>
</div>

</main>
</div>


</div>
</div>








<div></div><div></div></div><div id="geary-quote" dir="auto"><br>On Mon, Mar 11 2024 at 12:10:36 AM -07:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- add a backport patch to fix compatibility with older gtk4 versions
- merge .bb and .inc

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-devtools/vala/vala.inc           | 71 -----------------
 ...tk4-Preserve-compatibility-with-4.14.patch | 37 +++++++++
 meta/recipes-devtools/vala/vala_0.56.15.bb    | 76 ++++++++++++++++++-
 3 files changed, 112 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala.inc
 create mode 100644 meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
deleted file mode 100644
index 0177e86240..0000000000
--- a/meta/recipes-devtools/vala/vala.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "C#-like programming language for easing GObject programming"
-HOMEPAGE = "<a href="http://vala-project.org">http://vala-project.org</a>"
-DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
-Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
-SECTION = "devel"
-DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
-
-# Appending libxslt-native to dependencies has an effect
-# of rebuilding the manual, which is very slow. Let's do this
-# only when api-documentation distro feature is enabled.
-DEPENDS:append:class-target = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'api-documentation', 'libxslt-native', '', d)}"
-
-# vala-native contains a native version of vapigen, which we use instead of the target one
-DEPENDS:append:class-target = " vala-native"
-BBCLASSEXTEND = "native"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=fbc093901857fcd118f065f900982c24" "="">file://COPYING;md5=fbc093901857fcd118f065f900982c24"</a>
-
-SHRT_VER = "<a href="mailto:${@d.getVar">${@d.getVar</a>('PV').split('.')[0]<a href="mailto:}.${@d.getVar">}.${@d.getVar</a>('PV').split('.')[1]}"
-
-SRC_URI = "<a href="http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz">http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz</a>"
-inherit autotools pkgconfig upstream-version-is-even
-
-FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
-FILES:${PN}-doc += "${datadir}/devhelp"
-
-# .gir files from gobject-introspection are installed to ${libdir} when multilib is enabled
-GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if d.getVar('MULTILIBS') else ''}"
-
-do_configure:prepend:class-target() {
-        # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
-        # The wrapper will call a native vapigen
-        cat &gt; ${B}/vapigen-wrapper &lt;&lt; EOF
-#!/bin/sh
-vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
-EOF
-        chmod +x ${B}/vapigen-wrapper
-}
-
-EXTRA_OECONF += " --disable-valadoc"
-
-# Vapigen wrapper needs to be available system-wide, because it will be used
-# to build vapi files from all other packages with vala support
-do_install:append:class-target() {
-        install -d ${D}${bindir_crossscripts}/
-        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
-}
-
-# Put vapigen wrapper into target sysroot so that it can be used when building
-# vapi files.
-SYSROOT_DIRS += "${bindir_crossscripts}"
-
-inherit multilib_script
-MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
-
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
-vapigen_sysroot_preprocess() {
-        # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
-        # up our wrapper.
-        sed -i \
-           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
-           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
-}
-
-SSTATE_SCAN_FILES += "vapigen-wrapper"
-
-PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
-
-vala_package_preprocess () {
-	rm -rf ${PKGD}${bindir_crossscripts}
-}
diff --git a/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
new file mode 100644
index 0000000000..e33b0bb36b
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala/0001-gtk4-Preserve-compatibility-with-4.14.patch
@@ -0,0 +1,37 @@
+From 17349020fb95454d06f827fd555b05248f10a370 Mon Sep 17 00:00:00 2001
+From: Rico Tzschichholz &lt;<a href="mailto:ricotz@ubuntu.com">ricotz@ubuntu.com</a>&gt;
+Date: Thu, 7 Mar 2024 17:56:05 +0100
+Subject: [PATCH] gtk4: Preserve compatibility with &lt; 4.14
+
+Don't prefer new accessor methods for Calendar.day/month/year
+
+Fixes <a href="https://gitlab.gnome.org/GNOME/vala/issues/1531">https://gitlab.gnome.org/GNOME/vala/issues/1531</a>
+
+Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e">https://gitlab.gnome.org/GNOME/vala/-/commit/e0c4ea8c4a0bbf859b5341a7465b395892789d9e</a>]
+---
+ vapi/gtk4.vapi                 | 3 +++
+ vapi/metadata/Gtk-4.0.metadata | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/vapi/gtk4.vapi b/vapi/gtk4.vapi
+index 49f8b2078..51ecea27d 100644
+--- a/vapi/gtk4.vapi
++++ b/vapi/gtk4.vapi
+@@ -7350,11 +7350,14 @@ namespace Gtk {
+ 		[Version (since = "4.14")]
+ 		public void set_year (int year);
+ 		public void unmark_day (uint day);
++		[NoAccessorMethod]
+ 		public int day { get; set; }
++		[NoAccessorMethod]
+ 		public int month { get; set; }
+ 		public bool show_day_names { get; set; }
+ 		public bool show_heading { get; set; }
+ 		public bool show_week_numbers { get; set; }
++		[NoAccessorMethod]
+ 		public int year { get; set; }
+ 		public signal void day_selected ();
+ 		public signal void next_month ();
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/vala/vala_0.56.15.bb b/meta/recipes-devtools/vala/vala_0.56.15.bb
index dc483b12ba..1f55689c45 100644
--- a/meta/recipes-devtools/vala/vala_0.56.15.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.15.bb
@@ -1,3 +1,77 @@
-require ${BPN}.inc
+SUMMARY = "C#-like programming language for easing GObject programming"
+HOMEPAGE = "<a href="http://vala-project.org">http://vala-project.org</a>"
+DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
+Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
+SECTION = "devel"
+DEPENDS = "bison-native flex-native glib-2.0 gobject-introspection"
 
+# Appending libxslt-native to dependencies has an effect
+# of rebuilding the manual, which is very slow. Let's do this
+# only when api-documentation distro feature is enabled.
+DEPENDS:append:class-target = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'api-documentation', 'libxslt-native', '', d)}"
+
+# vala-native contains a native version of vapigen, which we use instead of the target one
+DEPENDS:append:class-target = " vala-native"
+BBCLASSEXTEND = "native"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=fbc093901857fcd118f065f900982c24" "="">file://COPYING;md5=fbc093901857fcd118f065f900982c24"</a>
+
+SHRT_VER = "<a href="mailto:${@d.getVar">${@d.getVar</a>('PV').split('.')[0]<a href="mailto:}.${@d.getVar">}.${@d.getVar</a>('PV').split('.')[1]}"
+
+SRC_URI = " \
+	<a href="http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz">http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz</a> \
+	<a href="file://0001-gtk4-Preserve-compatibility-with-4.14.patch">file://0001-gtk4-Preserve-compatibility-with-4.14.patch</a> \
+"
 SRC_URI[sha256sum] = "535b6452ed310fd5fb5c7dd6794b6213dac3b48e645e5bff3173741ec2cb3f2b"
+
+inherit autotools pkgconfig upstream-version-is-even
+
+FILES:${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
+FILES:${PN}-doc += "${datadir}/devhelp"
+
+# .gir files from gobject-introspection are installed to ${libdir} when multilib is enabled
+GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if d.getVar('MULTILIBS') else ''}"
+
+do_configure:prepend:class-target() {
+        # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
+        # The wrapper will call a native vapigen
+        cat &gt; ${B}/vapigen-wrapper &lt;&lt; EOF
+#!/bin/sh
+vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
+EOF
+        chmod +x ${B}/vapigen-wrapper
+}
+
+EXTRA_OECONF += " --disable-valadoc"
+
+# Vapigen wrapper needs to be available system-wide, because it will be used
+# to build vapi files from all other packages with vala support
+do_install:append:class-target() {
+        install -d ${D}${bindir_crossscripts}/
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
+}
+
+# Put vapigen wrapper into target sysroot so that it can be used when building
+# vapi files.
+SYSROOT_DIRS += "${bindir_crossscripts}"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
+vapigen_sysroot_preprocess() {
+        # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
+        # up our wrapper.
+        sed -i \
+           -e "s|vapigen=.*|vapigen=${bindir_crossscripts}/vapigen-wrapper|" \
+           ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
+}
+
+SSTATE_SCAN_FILES += "vapigen-wrapper"
+
+PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
+
+vala_package_preprocess () {
+	rm -rf ${PKGD}${bindir_crossscripts}
+}
+
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#196915): <a href="https://lists.openembedded.org/g/openembedded-core/message/196915">https://lists.openembedded.org/g/openembedded-core/message/196915</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/104858822/3618223">https://lists.openembedded.org/mt/104858822/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-tDhV8XUdXUMUZIl15uqD--


