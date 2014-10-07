Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1A7236FC68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 15:50:36 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id cc10so8320976wib.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=TUEE9iE2QjkRCcbqkcnIx2+CYF/he5Q7qmjyvJq6iz0=;
	b=iSuUfQyo6HPtZOE2thp7RBhYLYASYplqiFph0gPXaRYVF0P5izIiWCi3dPkFNghnRW
	jrQLBTJ6WKmLFekGUB9g3vhsFxnCIKMvWTaYOX1UtH3HbJ7reLY5X4nhAEftuQAtK2IY
	gX1G8yI2P7a8B10xAHOgSwDvUif/93gMvXoj0cNKuzugM3pCyrrRSz3yeQ8t5Q1XR3UN
	TmOghIV2DXSkY6gitj2lJ5+HCc/6ZVjmybiA6P9E3z5nGCqxsFPN9ybLFZzBfvnXEX3M
	9xpU5akLd3Z61SD4DKzvNepMQW/fpVhkGiGkSJkKzwjBi/m1hnrcoRq8JN6r7S9sx79r
	T6ig==
X-Received: by 10.180.104.7 with SMTP id ga7mr5517217wib.36.1412697037555;
	Tue, 07 Oct 2014 08:50:37 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id
	ky3sm21196463wjb.39.2014.10.07.08.50.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 08:50:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 17:50:30 +0200
Message-Id: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] gdb-cross: build with python support
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
X-List-Received-Date: Tue, 07 Oct 2014 15:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

variable contents are displayed properly when debugging qt applications remotely

see [1] for further details

[1] http://qt-project.org/doc/qtcreator-2.6/creator-debugging-helpers.html#debugging-helpers-based-on-python

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index cb99b06..6e44778 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -1,8 +1,17 @@
 require gdb-common.inc
 
-DEPENDS = "expat-native ncurses-native readline-native"
+DEPENDS = "expat-native ncurses-native readline-native python-native"
 
-EXTRA_OECONF += "--without-python"
+inherit pythonnative
+
+EXTRA_OECONF += "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
+
+do_compile_prepend() {
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+    export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"
+    export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"
+}
 
 #EXTRA_OEMAKE += "LDFLAGS='${BUILD_LDFLAGS}'"
 
-- 
1.8.3.1


