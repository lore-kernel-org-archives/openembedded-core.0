Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC25C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 09:52:02 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.9974.1679305918949769557
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 02:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=iaSBEV50;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679305918; x=1710841918;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2UB8eNsofhkh7DJNbOS2vuU9JC8a5n18lxFr/QED80E=;
  b=iaSBEV50V+Gzict45adejVMfnXAQvNwSIrMvDDlgKCAezgWh668EWXq7
   ELh7dDTwQhM4KF0zXC2vlnDdP3d2oG1MnebM3iIGTT3RUkeZm3V4YB2z1
   8z27SfAVWjk/tZsUcfNkgRR6GuZYONTsk97N3hiNB0a1Pt9GWCFTdo1KG
   oTVTandVi3aCL9umCVyUH3i7plPzWkWjIdnVOtH9YpvT9UXVX9Hxqj9Z6
   8lbIMQCtwFJ7zTrHabqQpKWslgIJfgdYiz+DaA91bAqG90aBwZwe7Zeaf
   AwhXzZ73RTQG37/foePKnUu/lw26kRjbF6BjLyv9Est726ofqQ3Voff9R
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="337336635"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337336635"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 02:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804847199"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804847199"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 02:51:31 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][patch 3/3] libksba: fix CVE-2022-3515
Date: Mon, 20 Mar 2023 17:51:19 +0800
Message-Id: <20230320095119.2655965-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230320095119.2655965-1-chee.yang.lee@intel.com>
References: <20230320095119.2655965-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 09:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178808

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../libksba/libksba/CVE-2022-3515.patch       | 47 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-3515.patch

diff --git a/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch b/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch
new file mode 100644
index 0000000000..ff9f2f9275
--- /dev/null
+++ b/meta/recipes-support/libksba/libksba/CVE-2022-3515.patch
@@ -0,0 +1,47 @@
+From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
+From: Werner Koch <wk@gnupg.org>
+Date: Wed, 5 Oct 2022 14:19:06 +0200
+Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
+
+* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
+used sum.
+--
+
+It is quite common to have checks like
+
+    if (ti.nhdr + ti.length >= DIM(tmpbuf))
+       return gpg_error (GPG_ERR_TOO_LARGE);
+
+This patch detects possible integer overflows immmediately when
+creating the TI object.
+
+Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
+
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libksba.git;a=patch;h=4b7d9cd4a018898d7714ce06f3faf2626c14582b]
+CVE: CVE-2022-3515 
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/ber-help.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/ber-help.c b/src/ber-help.c
+index 81c31ed..56efb6a 100644
+--- a/src/ber-help.c
++++ b/src/ber-help.c
+@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag_info *ti)
+       ti->length = len;
+     }
+ 
++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
++    {
++      ti->err_string = "header+length would overflow";
++      return gpg_error (GPG_ERR_EOVERFLOW);
++    }
++
+   /* Without this kludge some example certs can't be parsed */
+   if (ti->class == CLASS_UNIVERSAL && !ti->tag)
+     ti->length = 0;
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libksba/libksba_1.3.5.bb b/meta/recipes-support/libksba/libksba_1.3.5.bb
index 841830efa8..5293aa91e1 100644
--- a/meta/recipes-support/libksba/libksba_1.3.5.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.5.bb
@@ -24,6 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch \
            file://CVE-2022-47629.patch \
+           file://CVE-2022-3515.patch \
 "
 
 SRC_URI[md5sum] = "8302a3e263a7c630aa7dea7d341f07a2"
-- 
2.37.3


