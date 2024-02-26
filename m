Return-Path: <omatiush@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD23AC54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:49:09 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web11.20342.1708955346402566575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 05:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Hmf29Bqy;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: omatiush@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=784; q=dns/txt; s=iport;
  t=1708955346; x=1710164946;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5npcqZ7gH59fwht+z+Ftw7poiCZmi8RJ33gPGWCILgY=;
  b=Hmf29Bqyt1fLFxjbr5yhSPMgGXGBE+41NWha5eD+fU/L8SUgG43uzvq/
   O3HvwSKjU/t/uKk71y1ErqHGboFemWJVbehGr90HMGFNHlEJWtdPNQUZM
   u1NbHinviwE+UOMvNEOE0LdT3/MsVyuRLdH0FAFfn+9znwisqfyK+/n7q
   c=;
X-CSE-ConnectionGUID: TOEkaQ7JSpW1UyLg21cflA==
X-CSE-MsgGUID: 8oY63H9sR/CZ0CIJmlVeRA==
X-IronPort-AV: E=Sophos;i="6.06,185,1705363200"; 
   d="scan'208";a="196162023"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 13:49:05 +0000
Received: from sjc-ads-6997.cisco.com (sjc-ads-6997.cisco.com [10.30.218.117])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTP id 41QDn5T1006283;
	Mon, 26 Feb 2024 13:49:05 GMT
From: Oleh Matiusha <omatiush@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gmp: improve reproducibility
Date: Mon, 26 Feb 2024 13:49:05 +0000
Message-Id: <20240226134905.280098-1-omatiush@cisco.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.218.117, sjc-ads-6997.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 13:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196202

nativesdk-gmp package contains host references in output packages.
Remove them.

Signed-off-by: Oleh Matiusha <omatiush@cisco.com>
---
 meta/recipes-support/gmp/gmp_6.2.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
index 29055492c2..3128350e5f 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -38,6 +38,13 @@ do_install:prepend:class-target() {
          ${B}/gmp.h
 }
 
+do_install:prepend:class-nativesdk() {
+        sed -i \
+        -e "s|--sysroot=${STAGING_DIR_HOST}||g" \
+        -e "s|${DEBUG_PREFIX_MAP}||g" \
+         ${B}/gmp.h
+}
+
 SSTATE_SCAN_FILES += "gmp.h"
 
 # Doesn't compile in MIPS16e mode due to use of hand-written
-- 
2.33.0


