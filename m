Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEB47D691
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 13:53:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so7193193wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=sHRznqRFWBzYUGYeUyeuqQuN7iErdOmA9DgudfGMIiE=;
	b=pVPyL1tW4qWOb19qMsoXygF2YfbfGYRllubE4gupAAj5ZmtsrukJddFLDKNrnWrCc4
	3FyP//ep2dzHtyoTlx2YEFuM8+byeZkBgg0vaicTuH9jL5XP8vNqlPQhKwdUU1/lHF9x
	rfDPudct1o2sBJA0phcMrOsP5WLIUB1fmgWVMJRmjfzC5LKeP3E9ZKqN8vkp+yoFjEGx
	JD6ligLWUsuklUHh4gPgN9sm95aW0R79/3Tu49p7XtILkx2jyKKJzaR00iYXA8Dd2seg
	GaoJdTqbKfk2J/d1++klZ2aVqIuxGoUBM2+4bManQirnd+Ii39oaAPlAo1uJTCYnCZTL
	Xsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sHRznqRFWBzYUGYeUyeuqQuN7iErdOmA9DgudfGMIiE=;
	b=D6arllNrWkh3F1dbzj9e0T9pP7lJ97V6LJuJGmdqUclwJCYZQqp/wWqbm4mHwFH9rH
	ofQqrALogpqVB0kV8gMloJ/erEzY+z9BcNVujpP0w7XnfiPal2mGMCFrjN7y9+Q+udh8
	ZB8CrtdY+st/ivVFSHK4/4apI7nxTPX4FEZfqtOTGuyYAW6FJ02/QqF4DaxQVZdxZ8Al
	SdRCc3i1tdC+oYd5uNhW4DNA2JWabDD1WNETcZ6RJAVraeUpu9tK/MqfdPk8NWeeRV29
	PmruMbGzUX3ie8Xb5jBaVoSBniPcb4WXDg0MsJmOXsocC4wUkeXuGCU+Ovxb+LsH8qAt
	RjZw==
X-Gm-Message-State: APjAAAXP0fUgcKz7Q5kyd8v5C8L7Ndeweb3srIlhmf9ZtwfO6fwH++6e
	BUXAfxM8KqsQSHaSoyVFrBRhNsHy
X-Google-Smtp-Source: APXvYqxMVOnMbPviuxqxM5NWZhAKrInuKEyRTY0+Xzx9qKCoSJuHYPpF3A8KSTeBi/IT99EoALMsBQ==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr5729587wrw.105.1558101196764; 
	Fri, 17 May 2019 06:53:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	w185sm12075174wma.39.2019.05.17.06.53.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 06:53:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 15:53:09 +0200
Message-Id: <20190517135309.116495-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] vim: split the common part into vim.inc
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
X-List-Received-Date: Fri, 17 May 2019 13:53:16 -0000

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


