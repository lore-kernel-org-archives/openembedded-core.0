Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 925A27DE3E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:32 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t5so11860949wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sHRznqRFWBzYUGYeUyeuqQuN7iErdOmA9DgudfGMIiE=;
	b=NA38vHF68ma8+2rkq7bu+TCzXYEDa8xTlBbo/c5UGhpgsAQiSHIgA5i/MvfOrLH8Fk
	jp1feAv5nspjrX+jrFSrp+9BUXmx37V9pcSWkc6VO8vnpqLuUsvydm26KCPYZhkXl4r3
	1OVnbi5RJfYVSd6ToGwQuSUxVzEhNByBkGj8tuwDKBfgELJSlj6EbFNwBTOHgouU+HKF
	oKcAv7qGIz82hXVKhIWgyCNT3XhNxi2fxB+AAIi76Q8Pj8nf5CNua0mu3rFkYXJmq7ds
	CJfWR0VLz6jDwMEsU1hSYMIDSaKTMqYQxJajjMQJCrCHcng5x5ed5ivbBWoQ/6LJ7ldM
	nbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sHRznqRFWBzYUGYeUyeuqQuN7iErdOmA9DgudfGMIiE=;
	b=Zl8V0qNfI08n3Zek0iZq8ntI2yWGgsj0yrj9kRspLpJinZGRyo9bkBnv1s/Blp1/Tb
	I1IIF+rK37BYJAX4e6urMRCLpfZn5mjgq0q73qeFB1sOzfQ7/jVIqpf0SzVQQHrAJaZy
	qit8UUgAPzQLf+GGRUJbEyk6BDlxluN3P9exl6ouTTUdAz9qGfRfcNKRTD9amqAur4aH
	3iAjHq+48Kt3cSvIJMZ68lCG3id+VLQrGBqMeH58Ue85VbpHjCFksiqzDMKq5Bt5K0T7
	+sVMWekH0hhvk8jxEEqWbhdvyHKzBTYrVKrnCFxW/492+BaWVfx2Cpf7V/L6DX7neKlB
	wnAQ==
X-Gm-Message-State: APjAAAUpCSXK7D0jeru++dTtP9ebrFgKdEYMfJVeoaGsCZ4sKyFHzSgd
	ZkTDDYxB65+RBagULf28x32LptVA
X-Google-Smtp-Source: APXvYqym+H3KCoZDfiCjyRGDcRZBe1WLOEXeIBbFxwl1RIe27d/XmXTOdxM99jbEonQYfkZ0rxvJYA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr34553966wmk.78.1558361492673; 
	Mon, 20 May 2019 07:11:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:44 +0200
Message-Id: <20190520141125.10805-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/42] vim: split the common part into vim.inc
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
X-List-Received-Date: Mon, 20 May 2019 14:11:32 -0000

Previously vim-tiny would include the vim recipe wholesale;
this meant that they had to be upgraded in a single transaction
which devtool cannot cope with. This thwarted the latest AUH
run in particular.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vim/vim-tiny_8.1.1240.bb |   2 +-
 meta/recipes-support/vim/vim.inc              | 141 +++++++++++++++++
 meta/recipes-support/vim/vim_8.1.1240.bb      | 142 +-----------------
 3 files changed, 143 insertions(+), 142 deletions(-)
 create mode 100644 meta/recipes-support/vim/vim.inc

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
index 74464833adb..139e626e444 100644
--- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
+++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
@@ -1,4 +1,4 @@
-require vim_${PV}.bb
+require vim.inc
 
 SUMMARY += " (with tiny features)"
 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
new file mode 100644
index 00000000000..f5c74684bfa
--- /dev/null
+++ b/meta/recipes-support/vim/vim.inc
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
diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-support/vim/vim_8.1.1240.bb
index f5c74684bfa..baaaacc0b77 100644
--- a/meta/recipes-support/vim/vim_8.1.1240.bb
+++ b/meta/recipes-support/vim/vim_8.1.1240.bb
@@ -1,141 +1 @@
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
-SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
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
-do_compile() {
-    # We do not support fully / correctly the following locales.  Attempting
-    # to use these with msgfmt in order to update the ".desktop" files exposes
-    # this problem and leads to the compile failing.
-    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
-        echo -n > src/po/${LOCALE}.po
-    done
-    autotools_do_compile
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
+require vim.inc
-- 
2.17.1


