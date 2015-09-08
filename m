Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1CA60053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:03 +0000 (UTC)
Received: by qgt47 with SMTP id 47so96483932qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4upp/04epqIzUypnzLyIOlCJ85zu3dNdMhmAwDJzEaY=;
	b=ghgCQ7jxXB3KVU/st5MI60vopehaS6qlwP7/gsim4FkTwJRT+T0XWIG5MY9vHmGm/W
	P/I++epahLQ0GAZ/LMBNV838UjFRkhOAXRy4CiuhyYIarQNqFLyBCdyJHeW2Tiq8vxho
	MwVCWvDyMx5jHlNMNMwx8XyPyqLGUc3Pb2FH1rK7p2HJddgL55N4WYqSBX1FYpozpVFd
	YgPz5imhyejaXeBvuiqu30iLQl8YfHUdO0MOQr20Mx6NDi1GxqVdjiGQOewQCUpspLRr
	uJH2Ijj2qycIIlU9EA4fw7iSh83Jt+XigyG9q5869S8jNWMmgEL9OlpF04sMyocC/EWt
	QQEQ==
X-Received: by 10.140.132.133 with SMTP id 127mr41610923qhe.6.1441753683304;
	Tue, 08 Sep 2015 16:08:03 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:42 +0000
Message-Id: <0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:03 -0000

Fixes errors like

|
/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/core2-64-oe-linux-musl/slang/2.2.4-r12/slang-2.2.4/src/slpo
sio.c:366:12: error: conflicting types for 'posix_close'
|  static int posix_close (SLFile_FD_Type *f)
|             ^
| In file included from
/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/core2-64-oe-linux-musl/slang/2.2.4-r1
2/slang-2.2.4/src/slinclud.h:20:0,
|                  from
/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/core2-64-oe-linux-musl/slang/2.2.4-r1
2/slang-2.2.4/src/slposio.c:24:
|
/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86-64/usr/include/unistd.h:38:5:
note: previous de
claration of 'posix_close' was here
|  int posix_close(int, int);
|      ^
| make[1]: ***
[/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/core2-64-oe-linux-musl/slang/2.2.4-r12/slang-
2.2.4/src/elfobjs/slposio.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-error-conflicting-types-for-posix_close.patch | 39 ++++++++++++++++++++++
 meta/recipes-extended/slang/slang_2.2.4.bb         |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch

diff --git a/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch b/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
new file mode 100644
index 0000000..57ebfe4
--- /dev/null
+++ b/meta/recipes-extended/slang/slang/0001-Fix-error-conflicting-types-for-posix_close.patch
@@ -0,0 +1,39 @@
+From 96eb7e29822151823a66a1eb59f1fa4aead5ae08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 Aug 2015 06:33:21 +0000
+Subject: [PATCH] Fix  error: conflicting types for 'posix_close'
+
+Exposed while compiling on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/slposio.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/slposio.c b/src/slposio.c
+index 9ce9697..9ff9bfe 100644
+--- a/src/slposio.c
++++ b/src/slposio.c
+@@ -363,7 +363,7 @@ static int posix_close_fd (int *fd)
+    return 0;
+ }
+ 
+-static int posix_close (SLFile_FD_Type *f)
++static int posix_closex (SLFile_FD_Type *f)
+ {
+    int status = do_close (f);
+ 
+@@ -1001,7 +1001,7 @@ static SLang_Intrin_Fun_Type Fd_Name_Table [] =
+    MAKE_INTRINSIC_2("write", posix_write, V, F, B),
+    MAKE_INTRINSIC_1("dup_fd", posix_dup, V, F),
+    MAKE_INTRINSIC_2("dup2_fd", posix_dup2, I, F, I),
+-   MAKE_INTRINSIC_1("close", posix_close, I, F),
++   MAKE_INTRINSIC_1("close", posix_closex, I, F),
+    MAKE_INTRINSIC_1("_close", posix_close_fd, I, I),
+ #if defined(TTYNAME_R)
+    MAKE_INTRINSIC_0("ttyname", posix_ttyname, V),
+-- 
+2.5.1
+
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index 25f1b0c..5122f53 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
            file://change-char-type-to-signed-char-in-macros.patch \
            file://sprintf-bug-concerning-8-bit-characters.patch \
            file://slang-fix-the-iconv-existence-checking.patch \
+           file://0001-Fix-error-conflicting-types-for-posix_close.patch \
           "
 
 inherit autotools-brokensep
-- 
2.5.1


