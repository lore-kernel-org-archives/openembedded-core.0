Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1E5EB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 06:59:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.21828.1688367555821990311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 23:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=DqebxUHs;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688367555; x=1719903555;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8RozGMyPO8xlJkcC5QLym2c/GCFTsyakL6wGOveCXeY=;
  b=DqebxUHsJAKYE8Pj6xOe32aCtVEwlcDtumjRap5KNZiUqNXjCCQTdOjf
   siAjDK0KfYksxhd2VAV+9J1JyQuh+ALc+zWSbkjJOuQ6G7lZJTCEzTT8P
   Yx2ogzyRmKojKLNFQtP+ZIoxZujyaFwsBypXQQgi3orHlWn8EjoTmNWj+
   lhQP8w1+SCO84rYz72jLGv8HHwpoCMt4+BDuGKpdzUODlwC7NzToKJoCL
   A/AK1G8YXA+iV2Vd4RCf+aYtbdwlRz0eGO6oIKiQRidk1lmagNejFIG1/
   WOi2/4On7Xwtun7ryffuVxhumgMnVsj1qoP5dxohhsqbPfrtcYge1a/Nf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="366292411"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="366292411"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 23:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="695713955"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="695713955"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 23:59:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rpm: backport fix to prevent crashes with latest sqlite
Date: Mon,  3 Jul 2023 14:59:08 +0800
Message-ID: <20230703065909.45555-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 06:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183795

SQLite 3.42.0 causes crashes when installing RPM packages at rootfs
creation time. Backport an upstream fix to resolve the issue.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...87cfcf9cac87e5bc5e7db79b0338da9e355e.patch | 51 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch

diff --git a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch b/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch
new file mode 100644
index 0000000000..470dda1dcf
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch
@@ -0,0 +1,51 @@
+From ea3187cfcf9cac87e5bc5e7db79b0338da9e355e Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Mon, 26 Jun 2023 12:45:09 +0300
+Subject: [PATCH] Don't muck with per-process global sqlite configuration from
+ the db backend
+
+sqlite3_config() affects all in-process uses of sqlite. librpm being a
+low-level library, it has no business whatsoever making such decisions
+for the applications running on top of it. Besides that, the callback can
+easily end up pointing to an already closed database, causing an
+innocent API user to crash in librpm on an entirely unrelated error on
+some other database. "Oops."
+
+The sqlite API doesn't seem to provide any per-db or non-global context
+for logging errors, thus we can only remove the call and let sqlite output
+errors the way it pleases (print through stderr, presumably).
+
+Thanks to Jan Palus for spotting and reporting!
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ lib/backend/sqlite.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/lib/backend/sqlite.c b/lib/backend/sqlite.c
+index 5a029d575a..b612732267 100644
+--- a/lib/backend/sqlite.c
++++ b/lib/backend/sqlite.c
+@@ -44,13 +44,6 @@ static void rpm_match3(sqlite3_context *sctx, int argc, sqlite3_value **argv)
+     sqlite3_result_int(sctx, match);
+ }
+ 
+-static void errCb(void *data, int err, const char *msg)
+-{
+-    rpmdb rdb = data;
+-    rpmlog(RPMLOG_WARNING, "%s: %s: %s\n",
+-		rdb->db_descr, sqlite3_errstr(err), msg);
+-}
+-
+ static int dbiCursorReset(dbiCursor dbc)
+ {
+     if (dbc->stmt) {
+@@ -170,7 +163,6 @@ static int sqlite_init(rpmdb rdb, const char * dbhome)
+ 	 * the "database is locked" errors at every cost
+ 	 */
+ 	sqlite3_busy_timeout(sdb, 10000);
+-	sqlite3_config(SQLITE_CONFIG_LOG, errCb, rdb);
+ 
+ 	sqlexec(sdb, "PRAGMA secure_delete = OFF");
+ 	sqlexec(sdb, "PRAGMA case_sensitive_like = ON");
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 83537d4761..95a9e92f96 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            file://fix-declaration.patch \
+           file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
            "
 
 PE = "1"
-- 
2.41.0


