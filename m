Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C28C48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:55:40 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web11.20522.1708955732756352458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 05:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=WjiF0veL;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=978; q=dns/txt; s=iport;
  t=1708955733; x=1710165333;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VXCnkGfpSJ2tsunlK7f5QiaTZq0Kulrd/AcwgWdvU0Y=;
  b=WjiF0veLcfj/l2U1vYeGHxnwZJRFVZaIjmnAsCzawOOwjTc4kEvRHULF
   AQdAQ4FNZg8Che3Y7ExG9Q+1ofphAcKjcadxYgk5QtQiU/pLZkYehnR9J
   mBLBydKYDww+lhWJwIxnhG0NTlJV5elFdlF2A1zr33+RNhneHcQkVMquF
   c=;
X-CSE-ConnectionGUID: 5hXqXZCiR4qSIs+Mfyf+8g==
X-CSE-MsgGUID: AuHxroNQTv+UarqbECbDcA==
X-IronPort-AV: E=Sophos;i="6.06,185,1705363200"; 
   d="scan'208";a="188153320"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 13:55:32 +0000
Received: from sjc-ads-6997.cisco.com (sjc-ads-6997.cisco.com [10.30.218.117])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 41QDtV2Y010362;
	Mon, 26 Feb 2024 13:55:31 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: improve reproducibility
Date: Mon, 26 Feb 2024 13:55:31 +0000
Message-Id: <20240226135531.281696-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.117, sjc-ads-6997.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 13:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196204

Nativesdk package contains host references in output packages.
Remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
 meta/recipes-support/curl/curl_7.85.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 1e71ed821e..2d60f9aba1 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -110,6 +110,16 @@ do_install:append:class-target() {
 	    ${D}${bindir}/curl-config
 }
 
+do_install:append:class-nativesdk() {
+	# cleanup buildpaths from curl-config
+	sed -i \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's|${@" ".join(d.getVar("DEBUG_PREFIX_MAP").split())}||g' \
+	    ${D}${bindir}/curl-config
+}
+
 do_compile_ptest() {
 	oe_runmake test
 	oe_runmake -C ${B}/tests/server
-- 
2.33.0


