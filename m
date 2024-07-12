Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3074C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 11:11:41 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.5273.1720782692570508782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 04:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=hzlw2BMn;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: ohnatiuk@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1646; q=dns/txt; s=iport;
  t=1720782692; x=1721992292;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BbXBsgNhGVXRl/7xMg7ZP/jD3ZZ8TUambkQKUeWyO2M=;
  b=hzlw2BMn9hnVDbad9j0X6OP1a/A7WjDbLgEjn8iZf8K1ffRnjCf15jck
   IUlmTooqEXhD31jOiT+/0Lmr95hovP1W7ccs7uAulOeBvzGYAnYRSh97J
   58HyPkC8sCvjZTFG1x6dtDpT1/eGpiIQYhH+Je/clrRxADUyEf0eE+a5c
   Q=;
X-CSE-ConnectionGUID: 6iSlV6whRlK0V3CkXEiu0w==
X-CSE-MsgGUID: 6O/Wy+xlR3KEGeTF2O6SKA==
X-IronPort-AV: E=Sophos;i="6.09,202,1716249600"; 
   d="scan'208";a="319726808"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 11:11:31 +0000
Received: from sjc-ads-3960.cisco.com (sjc-ads-3960.cisco.com [171.68.251.157])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTP id 46CBBVxj020321;
	Fri, 12 Jul 2024 11:11:31 GMT
From: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] icu: remove host references in nativesdk to fix reproducibility
Date: Fri, 12 Jul 2024 04:11:30 -0700
Message-Id: <20240712111130.2221496-1-ohnatiuk@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.157, sjc-ads-3960.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 11:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201820

Fix is only done for target. Copy same code for nativesdk.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
---
 meta/recipes-support/icu/icu_75-1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-support/icu/icu_75-1.bb b/meta/recipes-support/icu/icu_75-1.bb
index 27fe392e4d4e..4b7023fd06e1 100644
--- a/meta/recipes-support/icu/icu_75-1.bb
+++ b/meta/recipes-support/icu/icu_75-1.bb
@@ -39,6 +39,15 @@ do_compile:prepend:class-target () {
 	    -i ${B}/tools/toolutil/Makefile
 }
 
+do_compile:prepend:class-nativesdk () {
+	# Make sure certain build host references do not end up being compiled
+	# in the image. This only affects libicutu and icu-dbg
+	sed  \
+	    -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
+	    -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -i ${B}/tools/toolutil/Makefile
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install:append:class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
@@ -66,6 +75,16 @@ do_install:append:class-target() {
 	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
 }
 
+do_install:append:class-nativesdk() {
+	# Remove build host references...
+	sed -i  \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${@icu_install_folder(d)}/pkgdata.inc
+}
+
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
 
 FILES:${PN}-dev += "${libdir}/${BPN}/"
-- 
2.35.6


