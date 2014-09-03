Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBA6713DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:10 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id z10so11541346pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=x2gvnAsvoeQ3tY4JReunGI55XLZIeB3d5ra+45TCGW4=;
	b=FsNQ3icH9xl9UDZtS9EQxjDeX0ZIWQrAPL4taw5bXZYATpKhNxEyfsl46hWUd+GpG/
	znzQPJfx6OMV63GHhBeal8zwXRz8ibdJyf7DyZ4J13TNA/wlJsIvYVVE49cJn7NoSHHo
	emRWVvWWuQ3Bcupa0LK05p+TquNbgYz5Tsc5fJLNbXbzZZ++0MLFVFBJALtGcSsQnKSx
	6z5PPev4JQsxe2y574oBb3iL8HVm28w0CYo46g/6tNG6W13RmNzCIcifdjNE1We5wAni
	GswOSDarzKHcywgV54o8vQ3fzGhPhzrxoW93MelqkC28cMRXGdub1PbBTjLJzJAze5kq
	zAtQ==
X-Received: by 10.66.193.37 with SMTP id hl5mr24851211pac.135.1409765286459;
	Wed, 03 Sep 2014 10:28:06 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.28.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:05 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:41 -0700
Message-Id: <b653dd83769374a634ea182d428b752ae5b54b9a.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/8] gdbm-1.8.3: obey LDFLAGS
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
X-List-Received-Date: Wed, 03 Sep 2014 17:28:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch | 22 ++++++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch

diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
new file mode 100644
index 0000000..2fafbc4
--- /dev/null
+++ b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
@@ -0,0 +1,22 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-status: Inappropriate [old version]
+
+--- gdbm-1.8.3.orig/Makefile.in
++++ gdbm-1.8.3/Makefile.in
+@@ -156,12 +156,12 @@ install-compat:
+ 
+ libgdbm.la: $(LOBJS) gdbm.h
+ 	rm -f libgdbm.la
+-	$(LIBTOOL) --mode=link $(CC) -o libgdbm.la -rpath $(libdir) \
++	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o libgdbm.la -rpath $(libdir) \
+ 		-version-info $(SHLIB_VER) $(LOBJS)
+ 
+ libgdbm_compat.la: $(C_LOBJS) gdbm.h
+ 	rm -f libgdbm_compat.la
+-	$(LIBTOOL) --mode=link $(CC) -o libgdbm_compat.la -rpath $(libdir) \
++	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o libgdbm_compat.la -rpath $(libdir) \
+ 		-version-info $(SHLIB_VER) $(C_LOBJS)
+ 
+ gdbm.h:	gdbm.proto gdbmerrno.h gdbm.proto2
diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index aecf47a..2331d1d 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -8,7 +8,8 @@ PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 	   file://makefile.patch \
-           file://libtool-mode.patch"
+           file://libtool-mode.patch \
+           file://ldflags.patch"
 
 SRC_URI[md5sum] = "1d1b1d5c0245b1c00aff92da751e9aa1"
 SRC_URI[sha256sum] = "cc340338a2e28b40058ab9eb5354a21d53f88a1582ea21ba0bb185c37a281dc9"
-- 
1.8.3.4


