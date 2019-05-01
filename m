Return-Path: <tom.rini@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5D0B7D458
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 12:51:16 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id o25so7034004wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 05:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2hcPp5NgmE17jcYZue/hoECXIV6414LHDvwLI8Xoxys=;
	b=BK02/LfO1PCTjVfIovmBdN7vPiqdQpRHarmiWOOQWbaql5kdPYraudkJzLPnCZqgJH
	/6aMZI+wXbMjgFY6wO4qwcvN0BE6y9YUTjUl4RoXsmSq55uDuLMTZgl4v4QjohRT5q/5
	4auaTMC1sEQox4tDhmSqFxhg69xAXi+Epa0su0dSHKIX7o7zee/XHJr5aPfY0Q+9T9Be
	YbSByJNxv2qPf1Fpw48DRAvv1NP09LZdyt+Esynnt1PzKFuILRlTbUjf/fSJV8oO3xFu
	4V/BDP8rWIk4CraGcyhuoLAihdzIBSs1FqVimIRBaf8aNqL5Pn2uNKn+YMKTIukJzkDU
	5TdQ==
X-Gm-Message-State: APjAAAUFKB+pYj/4EWgWWgFin1iS0bBU8yggoNehFCA9YMv9kIxIaixt
	E698ZJGsLaP8S7nh17RvXHVakVs=
X-Google-Smtp-Source: APXvYqxHq1WFtM28EwqDZ4ty2XU0++DrEJflbeVa6LxYRs11gpIQRu0xSvwKzxTSAK6Yu+ni9xQpuw==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr6492545wmg.132.1556715077060; 
	Wed, 01 May 2019 05:51:17 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id n6sm5677646wmn.48.2019.05.01.05.51.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 05:51:16 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 08:51:09 -0400
Message-Id: <1556715069-14366-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556715069-14366-1-git-send-email-trini@konsulko.com>
References: <1556715069-14366-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 2/2] vim: Update to 8.1.1240
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
X-List-Received-Date: Wed, 01 May 2019 12:51:17 -0000

This brings us to the current version of vim.  As part of this we need
to work-around a locale issue that upstream has exposed.  We do not
support fully / correctly the certain locales.  Attempting to use these
with msgfmt in order to update the ".desktop" files exposes this problem
and leads to the compile failing.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/vim-tiny_8.1.1017.bb |  15 ---
 meta/recipes-support/vim/vim-tiny_8.1.1240.bb |  15 +++
 meta/recipes-support/vim/vim_8.1.1017.bb      | 131 ------------------------
 meta/recipes-support/vim/vim_8.1.1240.bb      | 141 ++++++++++++++++++++++++++
 4 files changed, 156 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1017.bb
 create mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1240.bb
 delete mode 100644 meta/recipes-support/vim/vim_8.1.1017.bb
 create mode 100644 meta/recipes-support/vim/vim_8.1.1240.bb

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
deleted file mode 100644
index 74464833adb5..000000000000
--- a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require vim_${PV}.bb
-
-SUMMARY += " (with tiny features)"
-
-PROVIDES_remove = "xxd"
-ALTERNATIVE_${PN}_remove = "xxd"
-
-PACKAGECONFIG += "tiny"
-
-do_install() {
-    install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
new file mode 100644
index 000000000000..74464833adb5
--- /dev/null
+++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
@@ -0,0 +1,15 @@
+require vim_${PV}.bb
+
+SUMMARY += " (with tiny features)"
+
+PROVIDES_remove = "xxd"
+ALTERNATIVE_${PN}_remove = "xxd"
+
+PACKAGECONFIG += "tiny"
+
+do_install() {
+    install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
+}
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1017.bb
deleted file mode 100644
index 4e3e663c5429..000000000000
--- a/meta/recipes-support/vim/vim_8.1.1017.bb
+++ /dev/null
@@ -1,131 +0,0 @@
-SUMMARY = "Vi IMproved - enhanced vi editor"
-SECTION = "console/utils"
-
-PROVIDES = "xxd"
-DEPENDS = "ncurses gettext-native"
-# vimdiff doesn't like busybox diff
-RSUGGESTS_${PN} = "diffutils"
-LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
-
-SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch \
-           file://vim-add-knob-whether-elf.h-are-checked.patch \
-           file://0001-src-Makefile-improve-reproducibility.patch \
-"
-SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
-
-S = "${WORKDIR}/git"
-
-VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-
-inherit autotools-brokensep update-alternatives
-
-CLEANBROKEN = "1"
-
-# vim configure.in contains functions which got 'dropped' by autotools.bbclass
-do_configure () {
-    cd src
-    rm -f auto/*
-    touch auto/config.mk
-    aclocal
-    autoconf
-    cd ..
-    oe_runconf
-    touch src/auto/configure
-    touch src/auto/config.mk src/auto/config.h
-}
-
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
-"
-PACKAGECONFIG_class-native = ""
-
-PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
-PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
-PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
-
-EXTRA_OECONF = " \
-    --disable-gpm \
-    --disable-gtktest \
-    --disable-xim \
-    --disable-netbeans \
-    --with-tlib=ncurses \
-    ac_cv_small_wchar_t=no \
-    vim_cv_getcwd_broken=no \
-    vim_cv_memmove_handles_overlap=yes \
-    vim_cv_stat_ignores_slash=no \
-    vim_cv_terminfo=yes \
-    vim_cv_tgetent=non-zero \
-    vim_cv_toupper_broken=no \
-    vim_cv_tty_group=world \
-    STRIP=/bin/true \
-"
-
-do_install() {
-    autotools_do_install
-
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
-    # Install example vimrc from runtime files
-    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-
-    # we use --with-features=big as default
-    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
-	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
-	# drag make vim go into visual mode and there is no right click menu),
-	# delete the block.
-	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
-    fi
-}
-
-PARALLEL_MAKEINST = ""
-
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
-FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
-FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
-FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
-FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
-FILES_${PN}-data = "${datadir}/${BPN}"
-FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-FILES_${PN}-common = " \
-    ${datadir}/${BPN}/${VIMDIR}/*.vim \
-    ${datadir}/${BPN}/${VIMDIR}/autoload \
-    ${datadir}/${BPN}/${VIMDIR}/colors \
-    ${datadir}/${BPN}/${VIMDIR}/compiler \
-    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
-    ${datadir}/${BPN}/${VIMDIR}/indent \
-    ${datadir}/${BPN}/${VIMDIR}/keymap \
-    ${datadir}/${BPN}/${VIMDIR}/lang \
-    ${datadir}/${BPN}/${VIMDIR}/macros \
-    ${datadir}/${BPN}/${VIMDIR}/plugin \
-    ${datadir}/${BPN}/${VIMDIR}/print \
-    ${datadir}/${BPN}/${VIMDIR}/spell \
-    ${datadir}/icons \
-"
-
-RDEPENDS_${BPN} = "ncurses-terminfo-base"
-# Recommend that runtime data is installed along with vim
-RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
-
-ALTERNATIVE_${PN} = "vi vim xxd"
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-support/vim/vim_8.1.1240.bb
new file mode 100644
index 000000000000..f5c74684bfa7
--- /dev/null
+++ b/meta/recipes-support/vim/vim_8.1.1240.bb
@@ -0,0 +1,141 @@
+SUMMARY = "Vi IMproved - enhanced vi editor"
+SECTION = "console/utils"
+
+PROVIDES = "xxd"
+DEPENDS = "ncurses gettext-native"
+# vimdiff doesn't like busybox diff
+RSUGGESTS_${PN} = "diffutils"
+LICENSE = "vim"
+LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
+
+SRC_URI = "git://github.com/vim/vim.git \
+           file://disable_acl_header_check.patch \
+           file://vim-add-knob-whether-elf.h-are-checked.patch \
+           file://0001-src-Makefile-improve-reproducibility.patch \
+"
+SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
+
+S = "${WORKDIR}/git"
+
+VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
+
+inherit autotools-brokensep update-alternatives
+
+CLEANBROKEN = "1"
+
+# vim configure.in contains functions which got 'dropped' by autotools.bbclass
+do_configure () {
+    cd src
+    rm -f auto/*
+    touch auto/config.mk
+    aclocal
+    autoconf
+    cd ..
+    oe_runconf
+    touch src/auto/configure
+    touch src/auto/config.mk src/auto/config.h
+}
+
+do_compile() {
+    # We do not support fully / correctly the following locales.  Attempting
+    # to use these with msgfmt in order to update the ".desktop" files exposes
+    # this problem and leads to the compile failing.
+    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
+        echo -n > src/po/${LOCALE}.po
+    done
+    autotools_do_compile
+}
+
+#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
+"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
+PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
+PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
+
+EXTRA_OECONF = " \
+    --disable-gpm \
+    --disable-gtktest \
+    --disable-xim \
+    --disable-netbeans \
+    --with-tlib=ncurses \
+    ac_cv_small_wchar_t=no \
+    vim_cv_getcwd_broken=no \
+    vim_cv_memmove_handles_overlap=yes \
+    vim_cv_stat_ignores_slash=no \
+    vim_cv_terminfo=yes \
+    vim_cv_tgetent=non-zero \
+    vim_cv_toupper_broken=no \
+    vim_cv_tty_group=world \
+    STRIP=/bin/true \
+"
+
+do_install() {
+    autotools_do_install
+
+    # Work around file-rdeps picking up csh, awk, perl or python as a dep
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
+    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
+
+    # Install example vimrc from runtime files
+    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
+
+    # we use --with-features=big as default
+    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
+	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
+	# drag make vim go into visual mode and there is no right click menu),
+	# delete the block.
+	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
+    fi
+}
+
+PARALLEL_MAKEINST = ""
+
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
+FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
+FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
+FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
+FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
+FILES_${PN}-data = "${datadir}/${BPN}"
+FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
+FILES_${PN}-common = " \
+    ${datadir}/${BPN}/${VIMDIR}/*.vim \
+    ${datadir}/${BPN}/${VIMDIR}/autoload \
+    ${datadir}/${BPN}/${VIMDIR}/colors \
+    ${datadir}/${BPN}/${VIMDIR}/compiler \
+    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
+    ${datadir}/${BPN}/${VIMDIR}/indent \
+    ${datadir}/${BPN}/${VIMDIR}/keymap \
+    ${datadir}/${BPN}/${VIMDIR}/lang \
+    ${datadir}/${BPN}/${VIMDIR}/macros \
+    ${datadir}/${BPN}/${VIMDIR}/plugin \
+    ${datadir}/${BPN}/${VIMDIR}/print \
+    ${datadir}/${BPN}/${VIMDIR}/spell \
+    ${datadir}/icons \
+"
+
+RDEPENDS_${BPN} = "ncurses-terminfo-base"
+# Recommend that runtime data is installed along with vim
+RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
+
+ALTERNATIVE_${PN} = "vi vim xxd"
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
+ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
+ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


