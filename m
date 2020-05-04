Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.9734.1588609253109018932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 09:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LznXpkHs;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3167; q=dns/txt; s=axis-central1;
  t=1588609253; x=1620145253;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=71lnov2gsYar4XsdCuwobRPEqjP8ow/pgE177/0WWgA=;
  b=LznXpkHskRdd15VLaCV2G6DowcI+byAwPwammh/yxXTJSgospNMk8ECE
   45Pu4JFpKd/u7IU8shYEfCfDvO+FW+OhIu5Os5DQy4paaXIXkhIL43IlY
   yqrWdfDIBBxuZnLUtGKwwtWjZmsP4i+akNjaQaKyK9LcLwQEiR3GbC5m1
   WIztO1inLcerjGcDLxJ6LDQm4cwk2yhPvOnvtD5dMLCN47y+eOXpN2ozq
   hZB9zpvsQR3SwPL1NvUN4SaabcYK4vuF+ffMQfHNgKAXsQCVJKgRn4xpp
   qc40UHYeWk778jnFzOSPws6icTQ7dbBfDR7nQnl1DmFfeoTDv1veEFh4I
   A==;
IronPort-SDR: yz5m7hNRmZVZuszRI0NH+5Dz3+c+yunIEZ2CQP1C+k2IReUmPsYdVesGzXcSpwaV8vYaKx+hiH
 zkTconj4A4gMoeLFC+jqVnYVvFl2oh0KctNiZGCtUvXdyEaGk4oE0NMDHE9lYv0hik2xtPKMr7
 RD5Vr3NJE7rWSseO2YyEGUveArp5p87Ooj2XdbQ8Oy6wmMPR/Oe70kVw2AyBiDqIl+YZpRpo3P
 WijNoWoBav7ovrwecKWChNyjKnXuE5Q/2nf+hCRtLNM/djKf1/DS/rVbeLrPB4u3a69Blp+AF5
 r9A=
X-IronPort-AV: E=Sophos;i="5.73,352,1583190000"; 
   d="scan'208";a="8133649"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] libdnf: Use single-quotes around string literals used in SQL statements
Date: Mon, 4 May 2020 18:20:43 +0200
Message-ID: <20200504162043.1137-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If sqlite is built with -DSQLITE_DQS=0 in accordance with
https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of the
history database would fail with:

  History database cannot be created: .../var/lib/dnf/history.sqlite.
  Error: SQLite error on ":memory:": Executing an SQL statement failed:
  no such column: 1.2

Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
---

PATCH v2: Updated the Upstream-Status to Accepted.

 ...s-around-string-literals-used-in-SQL.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.47.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
new file mode 100644
index 0000000000..293bdcdd24
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
@@ -0,0 +1,36 @@
+From 96ca7d0049461df2293dd0000edcbc69b64255e0 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sun, 3 May 2020 22:40:39 +0200
+Subject: [PATCH] Use single-quotes around string literals used in SQL
+ statements
+
+If sqlite is built with -DSQLITE_DQS=0 in accordance with
+https://sqlite.org/quirks.html#dblquote, migration to version 1.2 of the
+history database would fail with:
+
+  History database cannot be created: /var/lib/dnf/history.sqlite.
+  Error: SQLite error on ":memory:": Executing an SQL statement failed:
+  no such column: 1.2
+
+Upstream-Status: Accepted [https://github.com/rpm-software-management/libdnf/pull/951]
+Signed-off-by: Peter Kjellerstedt <pkj@axis.com>
+---
+ libdnf/transaction/sql/migrate_tables_1_2.sql | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libdnf/transaction/sql/migrate_tables_1_2.sql b/libdnf/transaction/sql/migrate_tables_1_2.sql
+index 49b75315..f80ad1c4 100644
+--- a/libdnf/transaction/sql/migrate_tables_1_2.sql
++++ b/libdnf/transaction/sql/migrate_tables_1_2.sql
+@@ -1,9 +1,9 @@
+ R"**(
+ BEGIN TRANSACTION;
+     ALTER TABLE trans
+-        ADD comment TEXT DEFAULT "";
++        ADD comment TEXT DEFAULT '';
+     UPDATE config
+-        SET value = "1.2"
++        SET value = '1.2'
+         WHERE key = 'version';
+ COMMIT;
+ )**"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
index 1b4b7e4233..1b06d66b19 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
+           file://0001-Use-single-quotes-around-string-literals-used-in-SQL.patch \
            "
 
 SRCREV = "8330eea6985c4e4b53796f858de5b6b38b1ddf5c"
-- 
2.21.1

