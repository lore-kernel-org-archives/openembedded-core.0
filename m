Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DEFC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 04:09:31 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.27324.1641787762773038697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 20:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GCfgJbMI;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641787771; x=1673323771;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=i993f1LCWK9JpQymtSn+mlilhbfymvqceoHSbG2Zg6M=;
  b=GCfgJbMIiFdk8cPGHhV0V9GF3lqwNoSpTbypOp7BUqip9mLg7JTpy3go
   Va/2GBvL4zKt1xVhwIZd7InUQ6cUFHPq42kTESfQpYm0kchHbZPgPZsX9
   KyenMxnRKa2ciD3j6ONBWTW3yOL9OrScTVs+Rd5QeYazeU84meaYiRJnj
   ig/e0N20XjBJyaXQ0r04Gaqf4lJZU554VPmAOVFUI8tWjTlhbnlIptgJd
   Ntyq/dljUyLaEkNhZlwbm95U0oYhm/wnllD8WvPCU+c95+JwNGfY1r6eP
   qKOOqkte092/nu80fDaUv8PDBoHyJTtefpoz49+TRFeuNopTnFN+T6c4a
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243347368"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="243347368"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600";
   d="scan'208";a="764402231"
Received: from bboox-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.135.82])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2022 20:09:29 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/10] openssl: Add reproducibility fix
Date: Mon, 10 Jan 2022 12:09:10 +0800
Message-Id: 
 <1c3da0f11491c50ec3ee82f10d393e4f89edb7e8.1641787452.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641787452.git.anuj.mittal@intel.com>
References: <cover.1641787452.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 04:09:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160327

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When the date rolled from one year to another, it highlighted a reproducibility
issue in openssl. Patch a workaround for this to avoid autobuilder failures. Help
submitting upstream welcome.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8281e290737dba16a46d7ae937c66b3266e0fe8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/openssl/reproducibility.patch     | 22 +++++++++++++++++++
 .../openssl/openssl_1.1.1l.bb                 |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/reproducibility.patch b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
new file mode 100644
index 0000000000..8accbc9df2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/reproducibility.patch
@@ -0,0 +1,22 @@
+Using localtime() means the output can depend on the timezone of the build machine.
+Using gmtime() is safer. For complete reproducibility use SOURCE_DATE_EPOCH if set.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending [should be suitable]
+
+Index: openssl-3.0.1/apps/progs.pl
+===================================================================
+--- openssl-3.0.1.orig/apps/progs.pl
++++ openssl-3.0.1/apps/progs.pl
+@@ -21,7 +21,10 @@ die "Unrecognised option, must be -C or
+ my %commands     = ();
+ my $cmdre        = qr/^\s*int\s+([a-z_][a-z0-9_]*)_main\(\s*int\s+argc\s*,/;
+ my $apps_openssl = shift @ARGV;
+-my $YEAR         = [localtime()]->[5] + 1900;
++my $YEAR         = [gmtime()]->[5] + 1900;
++if (defined($ENV{SOURCE_DATE_EPOCH}) && $ENV{SOURCE_DATE_EPOCH} !~ /\D/) {
++    $YEAR = [gmtime($ENV{SOURCE_DATE_EPOCH})]->[5] + 1900;
++}
+ 
+ # because the program apps/openssl has object files as sources, and
+ # they then have the corresponding C files as source, we need to chain
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index b241ba78bc..17c769bb56 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://reproducible.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.33.1


