Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.37355.1614009665427621233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ioy1yXuWix9RksVlIZRG7DbsMJ/PD61gWeluh4oJYfRGa8PNdioGhIH7ZOtfheytBxVSVRfoop
 owJHWoSq5mQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706026"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:05 -0800
IronPort-SDR: 3IQOPjJ08biP7I5JO2Dlebcw++ImTjd9A2neY+SYbGb49vLfYJ3Y9OvLqEoIFSjNylCzvpc2NU
 DD1LIzgzEjnw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301967"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/30] vim: Fix a race over creation of the desktop files
Date: Tue, 23 Feb 2021 00:00:20 +0800
Message-Id: <29286073251847eb9931e232b8ff5e4a71f5de5f.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The LINGUAS file can be written by two different Makefile targets
and if they race, the desktop file contents isn't deterministic.

Fix the makfile to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 416bc7b697764075fbf73683cd8bddf36d839244)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/files/racefix.patch | 33 ++++++++++++++++++++
 meta/recipes-support/vim/vim.inc             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
new file mode 100644
index 0000000000..48dca44cad
--- /dev/null
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -0,0 +1,33 @@
+The creation of the LINGUAS file is duplicated for each desktop file
+which can lead the commands to race against each other. Rework
+the makefile to avoid this as the expense of leaving the file on disk.
+
+Upstream-Status: Pending
+RP 2021/2/15
+
+Index: git/src/po/Makefile
+===================================================================
+--- git.orig/src/po/Makefile
++++ git/src/po/Makefile
+@@ -165,17 +165,16 @@ $(PACKAGE).pot: ../*.c ../if_perl.xs ../
+ 		po/gvim.desktop.in po/vim.desktop.in
+ 	mv -f ../$(PACKAGE).po $(PACKAGE).pot
+ 
+-vim.desktop: vim.desktop.in $(POFILES)
++LINGUAS:
+ 	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++
++vim.desktop: vim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template vim.desktop.in -o tmp_vim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_vim.desktop; fi
+ 	mv tmp_vim.desktop vim.desktop
+ 
+-gvim.desktop: gvim.desktop.in $(POFILES)
+-	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
++gvim.desktop: gvim.desktop.in $(POFILES) LINGUAS
+ 	$(MSGFMT) --desktop -d . --template gvim.desktop.in -o tmp_gvim.desktop
+-	rm -f LINGUAS
+ 	if command -v desktop-file-validate; then desktop-file-validate tmp_gvim.desktop; fi
+ 	mv tmp_gvim.desktop gvim.desktop
+ 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1ea40e5e7f..d57f784da5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
+           file://racefix.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.29.2

