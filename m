Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0076B50B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 17:57:12 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k92so7931671edc.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 10:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F9pBsDHQRD+SDZKuXqPGuiN6BMGjMADN3CN/xQO3HEg=;
	b=n8V7WaV+WbRO0gfbuUdXreloZ7ZVlF3oAYdfHzImt7ABGTVsRCxfhsUThmkdT2S3Uu
	o+rptdPSPiCyIkBCAnFKwcl+ZzPRvye8CsCDt/VwVko3MxYkfl+uEPCbFTwW69bjURpL
	PGBsxrwaEUsjAP4zsuAWPaPlO9F69T4kaBzfiZ4/uA0NPNjBNdom9yJ9KtEoYetuY2q8
	6IiZtvlwu13WWsB6gi/H2sXdbmhwf69KPZjr3o27hgnV+DewZa4ej1v08cxRDMCrA/Gc
	8c7YKiOLBRkJ2RV41IKpDBfZyV+tpwOPSFxfmhL7TKQNqI6KjILpaGcHvUj0EkgiznzP
	K7FA==
X-Gm-Message-State: APjAAAXoWolLIgSH7VMQwuTXLk3sWiFym6FtQB8Iw5Sd18BbQ/Lt8uOu
	iBHmDResNWwChpqa76yzTjK6LQs=
X-Google-Smtp-Source: APXvYqyVCzsRogbudAH0NL8oCfcBFnHl6dW1P5H5J6jEQ0daFnim+pZ2JmKZTTKaa+/3WxOugHz31Q==
X-Received: by 2002:a50:f78b:: with SMTP id h11mr5454140edn.143.1555869432499; 
	Sun, 21 Apr 2019 10:57:12 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id b42sm755559edd.83.2019.04.21.10.57.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Apr 2019 10:57:11 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Apr 2019 13:57:04 -0400
Message-Id: <1555869425-7613-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] vim: Rework to not rely on relative directories
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
X-List-Received-Date: Sun, 21 Apr 2019 17:57:12 -0000

The vim recipe has all of the code inside the "src" subdirectory but
other things we rely on, such as the license file in a subdirectory
relative to the src.  However, as there is a top-level "configure"
script that moves us down to the src directory, we can rework the recipe
to be overall more simple and regularly laid out if we use that.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/vim-tiny_8.1.1017.bb |  2 +-
 meta/recipes-support/vim/vim_8.1.1017.bb      | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
index 8b1fb7b1158d..74464833adb5 100644
--- a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
+++ b/meta/recipes-support/vim/vim-tiny_8.1.1017.bb
@@ -8,7 +8,7 @@ ALTERNATIVE_${PN}_remove = "xxd"
 PACKAGECONFIG += "tiny"
 
 do_install() {
-    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
+    install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
 }
 
 ALTERNATIVE_PRIORITY = "90"
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1017.bb
index 7627d2844b79..4e3e663c5429 100644
--- a/meta/recipes-support/vim/vim_8.1.1017.bb
+++ b/meta/recipes-support/vim/vim_8.1.1017.bb
@@ -6,16 +6,16 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
+LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
 
 SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch;patchdir=.. \
-           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
+           file://disable_acl_header_check.patch \
+           file://vim-add-knob-whether-elf.h-are-checked.patch \
+           file://0001-src-Makefile-improve-reproducibility.patch \
 "
 SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
 
-S = "${WORKDIR}/git/src"
+S = "${WORKDIR}/git"
 
 VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
 
@@ -25,13 +25,15 @@ CLEANBROKEN = "1"
 
 # vim configure.in contains functions which got 'dropped' by autotools.bbclass
 do_configure () {
+    cd src
     rm -f auto/*
     touch auto/config.mk
     aclocal
     autoconf
+    cd ..
     oe_runconf
-    touch auto/configure
-    touch auto/config.mk auto/config.h
+    touch src/auto/configure
+    touch src/auto/config.mk src/auto/config.h
 }
 
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
@@ -76,7 +78,7 @@ do_install() {
     chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
 
     # Install example vimrc from runtime files
-    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
+    install -m 0644 runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
 
     # we use --with-features=big as default
     mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
-- 
2.7.4


