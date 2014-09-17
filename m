Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CD746714E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:19 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so637649wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BZHmZyW52xXnG+z3Jwimto9wKM2xnz7W2RRIeZzt1cM=;
	b=gC4Sr76SUtmj3puYnMOuluOxbVv4t0xFGmJ6XPfagNOKnYX8E/JX6tv9Y5TVtpkvDr
	zmXSVd/H1n86PrFltaQ2lKEKhlSf20lotUy+OTPzD+m9+7rYhkHRGelisgQidzcHaKtn
	mnlx9uyfHjRTJQtPbNvNPHgjorifSbS9UVxI+kx7uJTRNAAe6yIOQwAGK4GpNjVhdfoV
	0PzIShPBgKPi7WBt9OCX2HzTLF9dAKGwrnbduGndbkJJ1y4pZb+MEZLsmLvSjqPaIc8v
	OESbaWvwqEBjaF0cx6ShMegad9LtqNDmqQoM8Fd+k3+ewfj6ofzj8td3dS5Y9FymEbIc
	xs/g==
X-Received: by 10.180.221.107 with SMTP id qd11mr1801880wic.61.1410916639999; 
	Tue, 16 Sep 2014 18:17:19 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:19 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:56 -0700
Message-Id: <1410916622-26204-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 2/8] gdbm-1.8.3: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch | 22 ++++++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch

diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
new file mode 100644
index 0000000..770d8f6
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
+	rm -f libgdbm.la
+-	$(LIBTOOL) --mode=link $(CC) -o libgdbm.la -rpath $(libdir) \
++	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o libgdbm.la -rpath $(libdir) \
+		-version-info $(SHLIB_VER) $(LOBJS)
+
+ libgdbm_compat.la: $(C_LOBJS) gdbm.h
+	rm -f libgdbm_compat.la
+-	$(LIBTOOL) --mode=link $(CC) -o libgdbm_compat.la -rpath $(libdir) \
++	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o libgdbm_compat.la -rpath $(libdir) \
+		-version-info $(SHLIB_VER) $(C_LOBJS)
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


