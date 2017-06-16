Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46A6C78444
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:42:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8gVY8022964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:42:32 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLmpr-0000PT-MJ; Fri, 16 Jun 2017 09:42:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:42:29 +0100
Message-Id: <1497602550-1491-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:42:32 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/4] kconfig-frontends: Remove as only needed for eglibc
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
X-List-Received-Date: Fri, 16 Jun 2017 08:42:35 -0000

This was only added for eglibc. That is gone so we can drop this too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 .../kconfig-frontends_4.10.0.1.bb                  | 42 ----------------------
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 489f5ea..bbeb105 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -153,7 +153,6 @@ DISTRO_PN_ALIAS_pn-inputproto = "Meego=xorg-x11-proto-inputproto"
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
 DISTRO_PN_ALIAS_pn-jpeg = "OpenSuSE=libjpeg Ubuntu=libjpeg62"
 DISTRO_PN_ALIAS_pn-kbproto = "Meego=xorg-x11-proto-kbproto Ubuntu=x11proto-kb-dev Debian=x11proto-kb-dev"
-DISTRO_PN_ALIAS_pn-kconfig-frontends = "OSPDT"
 DISTRO_PN_ALIAS_pn-kernel-devsrc = "Debian=linux-base Ubuntu=linux"
 DISTRO_PN_ALIAS_pn-kernelshark = "Mandriva=kernelshark Ubuntu=kernelshark"
 DISTRO_PN_ALIAS_pn-kern-tools-native = "Windriver"
diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
deleted file mode 100644
index d427e98..0000000
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_4.10.0.1.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Linux kernel style configuration framework for other projects"
-DESCRIPTION = "The kconfig-frontends project aims at centralising \
-the effort of keeping an up-to-date, out-of-tree, packaging of the \
-kconfig infrastructure, ready for use by third-party projects. \
-The kconfig-frontends package provides the kconfig parser, as well as all \
-the frontends"
-HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
-SECTION = "devel"
-DEPENDS += "ncurses flex bison gperf-native"
-RDEPENDS_${PN} += "python3 bash"
-SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.10.x \
-           file://0001-Fix-installation-of-.pc-files.patch \
-           file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch \
-           file://missing-mkdir.patch"
-
-SRCREV = "f8ffe5e1c6f183cb7d5d515aa9381b7557de654e"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-do_configure_prepend () {
-	mkdir -p ${S}/scripts/.autostuff/m4
-}
-
-do_install_append() {
-	ln -s kconfig-conf ${D}${bindir}/conf
-	ln -s kconfig-mconf ${D}${bindir}/mconf
-}
-
-EXTRA_OECONF += "--disable-gconf --disable-qconf"
-
-# Some packages have the version preceeding the .so instead properly
-# versioned .so.<version>, so we need to reorder and repackage.
-SOLIBS = "-${@d.getVar('PV')[:-2]}.so"
-FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
-
-BBCLASSEXTEND = "native"
-- 
2.7.4


