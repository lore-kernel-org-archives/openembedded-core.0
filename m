Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.31677.1588540523260062223
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 14:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=P6aoQVFm;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3112; q=dns/txt; s=axis-central1;
  t=1588540523; x=1620076523;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DY82Met4zZhMOD9xD0hyIdr4MQQYT8kAEbNtTETaDRg=;
  b=P6aoQVFmSdGkP7EdBrKnv3Zo8qP6AreWWKzyCEoUZbXi5OEbpPEQGw4e
   aR/JBDNPF+/zbIZkIe4dXwspHI3JAwjLzByiiMs55Nn4EwsOp2uWO6xf1
   Kxvy9sVujp6KwbKAyKraYJOrSMMW8lBS1BTmvGDykDaylk4DZeWR+8kcc
   Sotbzoq0admwQuaLYV5KmdVIniLCgaWEKTk13HNuD1mR4zNtZR0nKxDpt
   DJamQTppbwxJnC7ANZdv+L0qEvowMfTe2aiMtqsw1tBscYgq3gY6K4NGN
   Q6UhlE6B6IrmW5t8+XfBn0J4Mmc/sQWE+7Z/O5n2COxtuOG4qIytuCTys
   Q==;
IronPort-SDR: JCe7Apz2bqc5yp4BbxqmcZJjdzG0OlCvf9micRCHKTXNTYJpEJd96px2Bmqd3cn98k/BorYMHh
 DE4FEXAXk4VaP45L8JBunAo83SOEMy1houhQE2mniF5XB7sKaKnBXDTmoBnyqaXWAmr8jh7edK
 tdyvNiCQ51cH/mg14KbfmHGP7tZJ4iATMsxexX+l60ziEx/o0TuGhFSlpeu3h8hvV2/aONV0WN
 C12xHLN5DWTWn8PHEOO5/oQCOVH7aInx/B7X4qWbWgVBbZN3CgitxGCJatCxuEfTTiiioaDq2k
 qXE=
X-IronPort-AV: E=Sophos;i="5.73,349,1583190000"; 
   d="scan'208";a="8102885"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libdnf: Use single-quotes around string literals used in SQL statements
Date: Sun, 3 May 2020 23:15:15 +0200
Message-ID: <20200503211515.21083-1-pkj@axis.com>
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
 ...s-around-string-literals-used-in-SQL.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.47.0.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Use-single-quotes-around-string-literals-used-in-SQL.patch
new file mode 100644
index 0000000000..6be484fea3
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
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/951]
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

