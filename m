Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sx1l3-00027I-N5
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 22:12:33 +0200
Received: by wgbdr1 with SMTP id dr1so7453142wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 13:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=A4FrQJacbQzB8YcnaAi5OHBPwwjg4vhWfq2v08A0bJM=;
	b=CPvcOL88oWjHlIXVJLMFaZjNZRJrblRCsY1XF1y65UGYRYfrNFcxAV+q9nYntkfBPN
	pVtdWvtZSOIVSCmRzxWEfRKisgIUCS3lyUjnkyTpk04iBGphJYZMsWO0Ii8H4ukD1Get
	rCBz+8jvjw+mctAcoIYl3/Ns4MtKN8z3Bm/KgIEpvZMhILR2cciq0CdMPVx1AqujIOHD
	/UpRGrqVCPBiC+UkM9VNtw4AzL1NUep3HA5qjNH6BRL8+XOWkmtj9uyk18OpBaKqBQTl
	SNs9ESKAJccg3JCMSWkBMEhrmZLmoueArw/l5kF6svUN4vmqHCDFPHQAV7NVb2Zh+5v+
	0HQg==
Received: by 10.180.98.200 with SMTP id ek8mr7362920wib.0.1343937653915;
	Thu, 02 Aug 2012 13:00:53 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id el6sm35378605wib.8.2012.08.02.13.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 13:00:52 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 23:00:44 +0300
Message-Id: <fe3056c0364345c518f66266a7f92c1116763156.1343937363.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343937363.git.andrei@gherzan.ro>
References: <cover.1343937363.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmwRrS3W4gxbCvbtrvLPBPl9lwtA5WqRXjgjQaq5b/wXgvwCGuw8KDuw/h96TfRWpk+HAbR
Subject: [PATCH 1/1] pseudo: Use fxstatat64 in unlinkat
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 20:12:33 -0000

This is done to avoid "Value too large for defined data type" error while trying to
remove a file > 2GB.

[Yocto #2881]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../pseudo/files/unlinkat-use-fxstatat64.patch     |   30 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.4.bb         |    5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch

diff --git a/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch b/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch
new file mode 100644
index 0000000..987c4c8
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/unlinkat-use-fxstatat64.patch
@@ -0,0 +1,30 @@
+pseudo: Use fxstatat64 in unlinkat
+
+This is done to avoid "Value too large for defined data type" error while trying to
+remove a file > 2GB.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: pseudo-1.4/ports/unix/guts/unlinkat.c
+===================================================================
+--- pseudo-1.4.orig/ports/unix/guts/unlinkat.c	2012-07-27 23:30:37.000000000 +0300
++++ pseudo-1.4/ports/unix/guts/unlinkat.c	2012-08-02 22:43:26.826645748 +0300
+@@ -8,7 +8,7 @@
+  */
+ 	pseudo_msg_t *msg;
+ 	int save_errno;
+-	struct stat buf;
++	struct stat64 buf;
+ 	int old_db_entry;
+ 
+ #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+@@ -31,7 +31,7 @@
+ #ifdef PSEUDO_NO_REAL_AT_FUNCTIONS
+ 	rc = real_lstat(path, &buf);
+ #else
+-	rc = real___fxstatat(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
++	rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);
+ #endif
+ 	if (rc == -1) {
+ 		return rc;
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
index e1e1f6f..4c21172 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.bb
@@ -1,8 +1,9 @@
 require pseudo.inc
 
-PR = "r12"
+PR = "r13"
 
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://unlinkat-use-fxstatat64.patch"
 
 SRC_URI[md5sum] = "bc04c6c9d13cfdb789ffc2f3cca9ab08"
 SRC_URI[sha256sum] = "147fa7b177061a145d330b9e159529a185be94550f123c6acb0d3b75d480c5b4"
-- 
1.7.9.5



