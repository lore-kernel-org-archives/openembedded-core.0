Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id BDF326FFCC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 01:42:08 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id 74so27029101qgh.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 17:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Yf5yBK1MZszgHuc9aX1P9JbMa9fWFucEdKTcbdEXQBA=;
	b=fzK5erxUMXANtw7+QS9ltF1FdkfzqxWykPXfxlYR+A0m9tY/Arlh5FSzjYhYHniRR6
	w8n7fuSNErYcvoQiI551EeeeAORF2CO2ZTR8igw74J1t47ilWECOsYrQedy2nBD6pnEm
	u72WZOJyc/gFbE+fgKhq2UcC73dmfpSUf+VDDpstTy9JojLpcbgkAWTu6E/K98HFU5Y1
	ei3RicDXvZhAaklCPQWNwJRm527PWVtBhZ7j9w270pn4nIY5lY9JFKaeSxUA+Z7gB1+n
	FGsrEt36iln44dJxfYA38/9Zb41LA+fVW652DOm1doScTaUXAPYbeK3GxsXU5907iZp/
	DeJA==
X-Received: by 10.140.109.100 with SMTP id k91mr21682380qgf.23.1450662129043; 
	Sun, 20 Dec 2015 17:42:09 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c3sm11739925qge.12.2015.12.20.17.42.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 Dec 2015 17:42:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Dec 2015 01:42:02 +0000
Message-Id: <1450662122-121762-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [master/jethro][PATCH] libxcb: Add a workaround for gcc5 bug on mips
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
X-List-Received-Date: Mon, 21 Dec 2015 01:42:10 -0000

This fixes build failure for libxcb on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxcb/gcc-mips-pr68302-mips-workaround.patch  | 22 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb    |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
new file mode 100644
index 0000000..698d038
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
@@ -0,0 +1,22 @@
+Reduce debug info for xcb.c since on mips we run into a gcc5 bug
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68302
+
+This patch is a workaround to get past the gcc bug until its resolved.
+it should have minimal impact on libxcb while make it work.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libxcb-1.11.1/src/Makefile.am
+===================================================================
+--- libxcb-1.11.1.orig/src/Makefile.am
++++ libxcb-1.11.1/src/Makefile.am
+@@ -188,6 +188,7 @@ EXTSOURCES += xkb.c
+ if BUILD_XKB
+ lib_LTLIBRARIES += libxcb-xkb.la
+ libxcb_xkb_la_LDFLAGS = -version-info 1:0:0 -no-undefined
++CFLAGS += -g1
+ libxcb_xkb_la_LIBADD = $(XCB_LIBS)
+ nodist_libxcb_xkb_la_SOURCES = xkb.c xkb.h
+ endif
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
index 1f4852d..6b944c9 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
-           file://disable-check.patch"
+           file://disable-check.patch \
+           file://gcc-mips-pr68302-mips-workaround.patch \
+          "
 SRC_URI[md5sum] = "f97a65e6158775de518ac391935634c2"
 SRC_URI[sha256sum] = "b720fd6c7d200e5371affdb3f049cc8f88cff9aed942ff1b824d95eedbf69d30"
 
-- 
2.6.4


