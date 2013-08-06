Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3FA6B53B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 22:07:26 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so490922eek.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 15:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B2GcT9UCn4pPcYgPVYGv7V8V19XQomMpI8fNcG6gj14=;
	b=b9WK1HU/83DEA8cKk7CYJxbRYnS1jMytj8Ratkhh418ujfmqPIHvKa7bO5d9AXUNu6
	l4tV75ZZIVgMMD5N8D8J7fzJZmMgbPZLU55rchrYrwi3DUH5IszJDtKgbCuM4YRHJm/D
	Sn3bWg1yGMOwRiLxkFOBItS6DaupO3Tir8s4cy1qYv+Zyzooim0TTJX2wfYx2cjs+nWc
	oJ3RsO0Cx0MTy/MplgQLt3Ffs6S+/u6ZaxjCxfqZq2Y74zBwX5ANWOhPFzqFr9ZKMR0G
	kphxQ45xgpQsTdH8MMsTjMy3OqIpfH06VYU3c7bpyF/xKUD/ibjwVFiwOQr/XD/ri8R6
	Hp7g==
X-Received: by 10.15.90.139 with SMTP id q11mr135619eez.137.1375826846364;
	Tue, 06 Aug 2013 15:07:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm5046810eel.12.2013.08.06.15.07.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 15:07:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2013 00:08:08 +0200
Message-Id: <1375826888-23527-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] buildhistory: use package_qa_handle_error for version-going-backwards
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
X-List-Received-Date: Tue, 06 Aug 2013 22:07:26 -0000

* this way it's easier for distro to select if such issue should be
  error, warning or ignored and also it gets recorded in qa.log

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 18 +++++++++---------
 meta/classes/insane.bbclass       |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 33b670d..8154b1c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -201,15 +201,15 @@ python buildhistory_emit_pkghistory() {
         # Find out what the last version was
         # Make sure the version did not decrease
         #
-        if d.getVar("BUILDHISTORY_CHECKVERBACKWARDS", True) == "1":
-            lastversion = getlastpkgversion(pkg)
-            if lastversion:
-                last_pkge = lastversion.pkge
-                last_pkgv = lastversion.pkgv
-                last_pkgr = lastversion.pkgr
-                r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
-                if r < 0:
-                    bb.error("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr))
+        lastversion = getlastpkgversion(pkg)
+        if lastversion:
+            last_pkge = lastversion.pkge
+            last_pkgv = lastversion.pkgv
+            last_pkgr = lastversion.pkgr
+            r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
+            if r < 0:
+                msg = "Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
+                package_qa_handle_error("version-going-backwards", msg, d)
 
         pkginfo = PackageInfo(pkg)
         # Apparently the version can be different on a per-package basis (see Python)
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 75bd2e2..aa02985 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -37,6 +37,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
+            version-going-backwards \
             "
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
-- 
1.8.3.2


