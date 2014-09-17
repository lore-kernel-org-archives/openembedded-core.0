Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBF165E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:16 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w61so654553wes.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=jD3uL15aamuPRIMsypBuqDwSom9vttGuH0zlLOXSbLM=;
	b=lYGu3KKdk31smq73Jl7uHcW0CgLwcpw07oDF/URP3GOTRowA38rQhF+ci0Nk2IT2uT
	clu9KEwiMADfN7IpmsNzlTNpcJtJU4Ad0r226ltYVM3m95S3d79p77dKi6Mwy+Uta2kb
	I9Nq27OMFzGykT9/XovIs4k+C19NwT/QmPYrr1CleI9TqA4q1WOv9YU391ljSTOumZwk
	KC7lsi/lRq1rgcwdmmHhDh/yG7CAloHzV5vZYN4UyQuOQFc9s5mMos9oK04cUhdi42bm
	oPdxeZYPOgHkDn0/+A26Xbx8gPtzehX/qj/7hVFL80b7JjFLk8464yjtd6xFkKtBfUgw
	aafg==
X-Received: by 10.181.13.14 with SMTP id eu14mr1831096wid.43.1410916638017;
	Tue, 16 Sep 2014 18:17:18 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:55 -0700
Message-Id: <1410916622-26204-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Subject: [PATCH v2 1/8] zlib: obey LDFLAGS for tests
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:19 -0000

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../zlib/zlib-1.2.8/ldflags-tests.patch            | 45 ++++++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch

diff --git a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch b/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
new file mode 100644
index 0000000..650794f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
@@ -0,0 +1,45 @@
+Obey LDFLAGS for tests
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Pending
+
+--- zlib-1.2.8.orig/Makefile.in
++++ zlib-1.2.8/Makefile.in
+@@ -26,7 +26,7 @@ CFLAGS=-O
+
+ SFLAGS=-O
+ LDFLAGS=
+-TEST_LDFLAGS=-L. libz.a
++TEST_LDFLAGS=-L. $(LDFLAGS)
+ LDSHARED=$(CC)
+ CPP=$(CC) -E
+
+@@ -176,22 +176,22 @@ placebo $(SHAREDLIBV): $(PIC_OBJS) libz.
+	-@rmdir objs
+
+ example$(EXE): example.o $(STATICLIB)
+-	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS)
++	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(STATICLIB)
+
+ minigzip$(EXE): minigzip.o $(STATICLIB)
+-	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS)
++	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(STATICLIB)
+
+ examplesh$(EXE): example.o $(SHAREDLIBV)
+-	$(CC) $(CFLAGS) -o $@ example.o -L. $(SHAREDLIBV)
++	$(CC) $(CFLAGS) -o $@ example.o $(TEST_LDFLAGS) $(SHAREDLIBV)
+
+ minigzipsh$(EXE): minigzip.o $(SHAREDLIBV)
+-	$(CC) $(CFLAGS) -o $@ minigzip.o -L. $(SHAREDLIBV)
++	$(CC) $(CFLAGS) -o $@ minigzip.o $(TEST_LDFLAGS) $(SHAREDLIBV)
+
+ example64$(EXE): example64.o $(STATICLIB)
+-	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS)
++	$(CC) $(CFLAGS) -o $@ example64.o $(TEST_LDFLAGS) $(STATICLIB)
+
+ minigzip64$(EXE): minigzip64.o $(STATICLIB)
+-	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS)
++	$(CC) $(CFLAGS) -o $@ minigzip64.o $(TEST_LDFLAGS) $(STATICLIB)
+
+ install-libs: $(LIBS)
+	-@if [ ! -d $(DESTDIR)$(exec_prefix)  ]; then mkdir -p $(DESTDIR)$(exec_prefix); fi
diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index bdfa045..ca0ba3f 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
+           file://ldflags-tests.patch \
            file://run-ptest \
            "
 
-- 
1.8.3.4


