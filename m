Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 47437607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 21:18:01 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so68126121wgm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ePIxCzzUZtKMizWkH6HVdqkRfYrBVKY/eYHptALPLaM=;
	b=ku14OKTxY4HqAklrfPFBcD98H3fdyXrR6SBbphGVSx7mpB8NtsG6cvl4UNrjyLsNe8
	BCr4xR/92SXYcsjBtqu6PAFX+38QMIijmDKGcUQLPW0EWeHqS0RjRPO9B+4ell0osjiX
	JIUoUru2BOqEu5anxVEAU9Srl146TwgK6MwNejz3bW4vezd2Ez6TLM7tHjVdgaCxcnl+
	oZGTlRcByJvTTAgItr9dIRy9A1flte6cuTCuVOsqh5Ndz7XVJAuOWsJ3WO78XiUiwrD+
	ntK8d+3gp82SuNIJ3omgYd1QEZlIIdECZVdxT8sNTEYL+w4z//Aev4M7ubrBivxzJXdT
	Oisg==
X-Gm-Message-State: ALoCoQkgD+NcopbwOeOJBUi9Y9h0wK67Kj9TcYCClKnujXtI0Zckak+h2ETq1LyyxBFsPRMHBzJd
X-Received: by 10.194.109.229 with SMTP id hv5mr24089807wjb.119.1437081481438; 
	Thu, 16 Jul 2015 14:18:01 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	uc16sm5171413wib.8.2015.07.16.14.18.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 14:18:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 22:12:17 +0100
Message-Id: <1437081137-23604-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pseudo: upgrade to 1.6.6
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
X-List-Received-Date: Thu, 16 Jul 2015 21:18:03 -0000

Fixes include proper support for creating FIFOs (remove redundant patch), and
bug fixes regarding xattrs.

[ YOCTO #7990 ]
[ YOCTO #7993 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/files/fifofix.patch   | 52 ----------------------
 .../pseudo/{pseudo_1.6.5.bb => pseudo_1.6.6.bb}    |  5 +--
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/fifofix.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.5.bb => pseudo_1.6.6.bb} (74%)

diff --git a/meta/recipes-devtools/pseudo/files/fifofix.patch b/meta/recipes-devtools/pseudo/files/fifofix.patch
deleted file mode 100644
index 44a79cd..0000000
--- a/meta/recipes-devtools/pseudo/files/fifofix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Allow mkfifo to create a real fifo.
-
-Index: pseudo-1.6.5/ports/unix/guts/mknodat.c
-===================================================================
---- pseudo-1.6.5.orig/ports/unix/guts/mknodat.c
-+++ pseudo-1.6.5/ports/unix/guts/mknodat.c
-@@ -27,22 +27,33 @@
- 		errno = EEXIST;
- 		return -1;
- 	}
-+	if (mode & S_IFIFO) {
- #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
--	rc = real_open(path, O_CREAT | O_WRONLY | O_EXCL,
--		PSEUDO_FS_MODE(mode, 0));
-+		rc = real_mkfifo(path, PSEUDO_FS_MODE(mode, 0));
- #else
--	rc = real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
--		PSEUDO_FS_MODE(mode, 0));
-+		rc = real_mkfifoat(dirfd, path, PSEUDO_FS_MODE(mode, 0));
- #endif
--	if (rc == -1) {
--		return -1;
-+		if (rc == -1) {
-+			return -1;
-+		}
-+	} else {
-+#ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
-+		rc = real_open(path, O_CREAT | O_WRONLY | O_EXCL,
-+			PSEUDO_FS_MODE(mode, 0));
-+#else
-+		rc = real_openat(dirfd, path, O_CREAT | O_WRONLY | O_EXCL,
-+			PSEUDO_FS_MODE(mode, 0));
-+#endif
-+		if (rc == -1) {
-+			return -1;
-+		}
-+		base_fstat(rc, &buf);
-+		/* mknod does not really open the file.  We don't have
-+		 * to use wrap_close because we've never exposed this file
-+		 * descriptor to the client code.
-+		 */
-+		real_close(rc);
- 	}
--	base_fstat(rc, &buf);
--	/* mknod does not really open the file.  We don't have
--	 * to use wrap_close because we've never exposed this file
--	 * descriptor to the client code.
--	 */
--	real_close(rc);
- 
- 	/* mask in the mode type bits again */
- 	buf.st_mode = (PSEUDO_DB_MODE(buf.st_mode, mode) & 07777) |
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
similarity index 74%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
index bf14c7d..1946021 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
@@ -4,11 +4,10 @@ SRC_URI = " \
     http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://fallback-passwd \
     file://fallback-group \
-    file://fifofix.patch \
 "
 
-SRC_URI[md5sum] = "a5545ff365e243193c81981df98e870b"
-SRC_URI[sha256sum] = "f5a0af976c958915503f516dd02097ab6a64c98a3c0cb4ceb0ce8b1ef8e38b3c"
+SRC_URI[md5sum] = "6a7c01a1780350a695bc0f4939b58626"
+SRC_URI[sha256sum] = "1512b91d62739ff8d266e161e27f6da29c3012f4a1e77100021808d4173c0740"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
-- 
2.1.4


