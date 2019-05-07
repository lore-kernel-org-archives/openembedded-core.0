Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 234467D86E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PS1RcPz63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234716;
	bh=V6aTdaB2KW3ucxJnC7y58CtXcrmtPS3v1h5ZZ9F49lY=;
	h=From:To:Subject:Date:From;
	b=LsjHc9o6/X0QP0tz9PUREXYPvMZsdooDrf01IpGrpIrsclO4F7XJru11A5TWJqZDc
	cYwirx8CwJ123nO+wSXymDPHTQJoJq2qtuZ37UD50CRZeyWhd5gbEVuqQxLj6j37bI
	ImJna1oVCkHs0NOIhBDuDzp7w/H9SplGLanQlfsyukf1KKe5Y9+dr9tTQD/noTNJ8h
	H8NGrvWMNMfioHFmT5Xphg1XsIPcGyTcN4MnzvYaEg/tozvaM5n1knFXuhdjxN1KFZ
	/Xzr3YA7u5nslFZffrKK/D89inG0OEQkZIbMGkeYw6nXkexA7cKFIJiaDcRp8pTZ5Y
	Ko2LsWjnObc0ieF+WZxooLQ52uoYoFkZYXuj4i5iI3BxRMueQk9BCmfqropA8eRZVj
	Oucci5qMls0m87CEz2Q66Zll9PucKe20XHvNecvWloypPw0MUvlaGIMVXx1269VWpj
	oZ6IIkw1G745rLu43v7GhSAxMX8VqKO+P+scbhPR0H9D7617cJL8g7Uqr54v//1AuQ
	5yfIQD9MYR4FeOiDXfs6MZUjBbEvxVHKXpB0zpjCvsC3/hrp6vrYHh+NoRH6rWTMYW
	0xMHCe+8r8U9saIYnemoZ8lmg0iqX43KANNMXPcr/nc2OMNPOR/goSOBWEkFzU6pkx
	27Q0CtEYlJZP3hWLQcN7Xzhs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:50 +0300
Message-Id: <20190507131151.31070-11-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libxcb: remove workaround patch for a bug that was fixed in gcc 5 in 2015
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
X-List-Received-Date: Tue, 07 May 2019 13:11:55 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gcc-mips-pr68302-mips-workaround.patch    | 22 -------------------
 .../xorg-lib/libxcb_1.13.1.bb                 |  1 -
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch b/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
deleted file mode 100644
index 698d038f90..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Reduce debug info for xcb.c since on mips we run into a gcc5 bug
-
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68302
-
-This patch is a workaround to get past the gcc bug until its resolved.
-it should have minimal impact on libxcb while make it work.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libxcb-1.11.1/src/Makefile.am
-===================================================================
---- libxcb-1.11.1.orig/src/Makefile.am
-+++ libxcb-1.11.1/src/Makefile.am
-@@ -188,6 +188,7 @@ EXTSOURCES += xkb.c
- if BUILD_XKB
- lib_LTLIBRARIES += libxcb-xkb.la
- libxcb_xkb_la_LDFLAGS = -version-info 1:0:0 -no-undefined
-+CFLAGS += -g1
- libxcb_xkb_la_LIBADD = $(XCB_LIBS)
- nodist_libxcb_xkb_la_SOURCES = xkb.c xkb.h
- endif
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
index 84303e6246..42b0951479 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
            file://xcbincludedir.patch \
            file://disable-check.patch \
-           file://gcc-mips-pr68302-mips-workaround.patch \
           "
 
 SRC_URI[md5sum] = "f33cdfc67346f7217a9326c0d8679975"
-- 
2.17.1


