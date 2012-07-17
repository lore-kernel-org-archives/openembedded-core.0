Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrBPP-0003LX-9c
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:18:03 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so511967bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=4y0qMWEyQQTZo/17iaXro6sFU+miUDNkuvfl44sn+mM=;
	b=oqP7BcvmNyXb2sh7gZObe7e/8oWqKrynQzXbHkFrH2GwDlFkEqRAuhWRAdcki2MHds
	K4ngh1J8EKAR4jv6wuDaVUam4o6une1x9MeTf99+xJyZPh8lGTbg6DXBj4g400nyEKiC
	dr/4vQjGdLiwCl5xyGm3mzpK/QJ7wUM2Iq4R6p90xfKfPLBlZw8lkVXxr72zyZOC/OUs
	s/WgJ6QRkGu0lhnxLeYwXqfqqmoEkIvsa+7COLJGynitU/Zo3FP+Ct2bg+xktnUXHhQy
	AP08IpowuLKmgM6VNir7SM17U/gA7dTcUwtPkCxoUbGO++jhx6fUu2O6QitzqvgWBwFh
	UCrA==
Received: by 10.204.152.207 with SMTP id h15mr1767491bkw.5.1342544805810;
	Tue, 17 Jul 2012 10:06:45 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id t23sm10438506bks.4.2012.07.17.10.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 10:06:45 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:06:32 +0300
Message-Id: <3d20c37040fb3d1a88003ff5e5d71e1b1e14e553.1342544558.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
References: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342544558.git.andrei@gherzan.ro>
References: <cover.1342544558.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnT3x/t9jK6nwi07io8MQIa/F5ST7zPoKdzcC1tW+zxEWCgSUC5tYi4XOgFk7IAJrT7iIYM
Subject: [PATCH V4 4/4] connman: fix crashes on startup on PPC/MIPS
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
X-List-Received-Date: Tue, 17 Jul 2012 17:18:03 -0000

From: Ross Burton <ross.burton@intel.com>

It appears that when there is no existing connman state there is memory
corruption which causes free() on MIPS/PPC to abort.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.3.bb   |    5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
new file mode 100644
index 0000000..c92b586
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
@@ -0,0 +1,37 @@
+From ea8c7b3efce4c1762411e073893e948de5d552d6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 17 Jul 2012 16:04:12 +0100
+Subject: [PATCH] storage: check that the string isn't empty before splitting
+
+If the string was non-NULL but empty (str="\0"), the following \0 assignment
+would write to str[-1] and thus cause memory corruption.
+
+On PPC and MIPS, this was causing crashes in glibc.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Submitted
+ 
+---
+ src/storage.c |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/storage.c b/src/storage.c
+index 47bd0cb..20766a3 100644
+--- a/src/storage.c
++++ b/src/storage.c
+@@ -212,7 +212,11 @@ gchar **connman_storage_get_services()
+ 	closedir(dir);
+ 
+ 	str = g_string_free(result, FALSE);
+-	if (str) {
++	if (str && str[0] != '\0') {
++		/*
++		 * Remove the trailing separator so that services doesn't end up
++		 * with an empty element.
++		 */
+ 		str[strlen(str) - 1] = '\0';
+ 		services = g_strsplit(str, "/", -1);
+ 	}
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
index a98b46c..1e3ee56 100644
--- a/meta/recipes-connectivity/connman/connman_1.3.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -7,6 +7,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
+            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch \
+            file://storage-check-that-the-string-isn-t-empty-before-spl.patch"
 S = "${WORKDIR}/git"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.9.5



