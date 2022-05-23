Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA96C433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 02:20:41 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.23143.1653272436943032120
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 19:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CYYH8BOn;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653272438; x=1684808438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MdSB7MilRmHeKK/RGzji+YWZvAYSJnAIuZS4x0OH5ac=;
  b=CYYH8BOnPLlf/0cQqItKEwKWVBd4U8cEhXtK1RZ35k4lB47FezPzv0pN
   crAMIfdFiLyAxDmoUz0GllGDqgKovwG5qE9EZxaklfbetwEHGy8DqY/zb
   r9ysY/h544iLbHVdj9u1rckvXPeKr555WigPBWa5EVEkZGYntDUTzJPlF
   FpIPsQ9JRg9Mpn4p2u/d6Jpph0eH/BEPrxAa4G4rDXT5b8XCVEynS4CX0
   GeI4+nMUkPTs0xzc4VBhtDgQ8BrtUWk0GMgyL42Qnu2X8To57ykQOQUwp
   VKKYs+tlmvvD/O+An6r1Qk8BXw84zeMlb74SmjFPIqrRLT/Puq5lthDVg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="260680231"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="260680231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600";
   d="scan'208";a="600397369"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:20:36 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH v2 4/4] systemd: Correct path returned in
 sd_path_lookup()
Date: Mon, 23 May 2022 10:20:14 +0800
Message-Id: <20220523022014.1203675-5-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
References: <20220523022014.1203675-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 02:20:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165992

In oe-core, sysusers.d/sysctl.d/binfmt.d/modules-load.d are still kept
under /usr/lib instead of /lib changed in systemd v246. This patch
corrects the SD_PATH_{SYSUSERS,SYSCTL,BINFMT,MODULES_LOAD} returned
in sd_path_lookup() back to the /usr/lib ones.

Also updates the patch description and upstream status.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 +++++++++++++++++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch | 42 -----------
 meta/recipes-core/systemd/systemd_250.5.bb    |  2 +-
 3 files changed, 74 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
new file mode 100644
index 0000000000..31efc4cc4b
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
@@ -0,0 +1,73 @@
+From beb0219b71510bc63aed81d2a970a04349d6c616 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Sep 2020 18:01:41 -0700
+Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
+
+These directories are moved to /lib since systemd v246, commit
+4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
+the old /usr/lib is still being used.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
+---
+ src/core/systemd.pc.in           | 8 ++++----
+ src/libsystemd/sd-path/sd-path.c | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
+index fc0f8c34fa..65996bbed8 100644
+--- a/src/core/systemd.pc.in
++++ b/src/core/systemd.pc.in
+@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
+ tmpfiles_dir=${prefix}/lib/tmpfiles.d
+ tmpfilesdir=${tmpfiles_dir}
+ 
+-sysusers_dir=${rootprefix}/lib/sysusers.d
++sysusers_dir=${prefix}/lib/sysusers.d
+ sysusersdir=${sysusers_dir}
+ 
+-sysctl_dir=${rootprefix}/lib/sysctl.d
++sysctl_dir=${prefix}/lib/sysctl.d
+ sysctldir=${sysctl_dir}
+ 
+-binfmt_dir=${rootprefix}/lib/binfmt.d
++binfmt_dir=${prefix}/lib/binfmt.d
+ binfmtdir=${binfmt_dir}
+ 
+-modules_load_dir=${rootprefix}/lib/modules-load.d
++modules_load_dir=${prefix}/lib/modules-load.d
+ modulesloaddir=${modules_load_dir}
+ 
+ catalog_dir=${prefix}/lib/systemd/catalog
+diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
+index ff1e0d5f8e..19a001f47e 100644
+--- a/src/libsystemd/sd-path/sd-path.c
++++ b/src/libsystemd/sd-path/sd-path.c
+@@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
+                 return 0;
+ 
+         case SD_PATH_SYSUSERS:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
++                *ret = "/usr/lib/sysusers.d";
+                 return 0;
+ 
+         case SD_PATH_SYSCTL:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
++                *ret = "/usr/lib/sysctl.d";
+                 return 0;
+ 
+         case SD_PATH_BINFMT:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
++                *ret = "/usr/lib/binfmt.d";
+                 return 0;
+ 
+         case SD_PATH_MODULES_LOAD:
+-                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
++                *ret = "/usr/lib/modules-load.d";
+                 return 0;
+ 
+         case SD_PATH_CATALOG:
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch b/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
deleted file mode 100644
index 752824688f..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 58860e0f248576a80ff2af256ba42713c186ae93 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 29 Sep 2020 18:01:41 -0700
-Subject: [PATCH] systemd.pc.in: use ROOTPREFIX without suffixed slash
-
-This complements the commit
-https://github.com/poettering/systemd/commit/b612c26ceb9f56af0271fc9f07c1724d2d260a8a
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/core/systemd.pc.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index b5cc8f9..21dbf30 100644
---- a/src/core/systemd.pc.in
-+++ b/src/core/systemd.pc.in
-@@ -65,16 +65,16 @@ systemdshutdowndir=${systemd_shutdown_dir}
- tmpfiles_dir=${prefix}/lib/tmpfiles.d
- tmpfilesdir=${tmpfiles_dir}
- 
--sysusers_dir=${rootprefix}/lib/sysusers.d
-+sysusers_dir=${prefix}/lib/sysusers.d
- sysusersdir=${sysusers_dir}
- 
--sysctl_dir=${rootprefix}/lib/sysctl.d
-+sysctl_dir=${prefix}/lib/sysctl.d
- sysctldir=${sysctl_dir}
- 
--binfmt_dir=${rootprefix}/lib/binfmt.d
-+binfmt_dir=${prefix}/lib/binfmt.d
- binfmtdir=${binfmt_dir}
- 
--modules_load_dir=${rootprefix}/lib/modules-load.d
-+modules_load_dir=${prefix}/lib/modules-load.d
- modulesloaddir=${modules_load_dir}
- 
- catalog_dir=${prefix}/lib/systemd/catalog
--- 
-2.25.1
-
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 81fe0c88e0..006b2f86ea 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -23,7 +23,7 @@ SRC_URI += "file://touchscreen.rules \
            file://systemd-pager.sh \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
+           file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
-- 
2.34.1


