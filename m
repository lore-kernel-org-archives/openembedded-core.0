Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87EBC43217
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 21:47:26 +0000 (UTC)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by mx.groups.io with SMTP id smtpd.web12.2399.1668203239316012544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 13:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=EGIBVmdJ;
 spf=pass (domain: amazon.com, ip: 52.95.48.154, mailfrom: prvs=3074a5097=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668203239; x=1699739239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQn6ebO9Dn2LCvpQ0zjM3PUyjXMntNcn9NupWSOm4UY=;
  b=EGIBVmdJAjIi93IQmvzOX5RXI/XzZIDHjpVsktGq4dLDsN5IZo5Jd7v9
   u6LsKb1THhSAYzW2F5yaA4y9UXhqj+gN+FabAEdFJ3LnxyDXDMp7NSqqg
   BwohWMGF1ao1mOpN5lOBRPawPkRNLZ7HquIVleA1fX9OUEjqFDvaCxeQk
   w=;
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 21:47:18 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com (Postfix) with ESMTPS id A62C44205D;
	Fri, 11 Nov 2022 21:47:17 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Fri, 11 Nov 2022 21:47:17 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.161.14) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1118.20; Fri, 11 Nov 2022 21:47:16 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v2 1/3] spirv-tools: Correctly set the prefix in exported cmake packages
Date: Fri, 11 Nov 2022 21:47:12 +0000
Message-ID: <20221111214714.9939-2-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221111214714.9939-1-jorcrous@amazon.com>
References: <20221111214714.9939-1-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.161.14]
X-ClientProxiedBy: EX13D15UWB001.ant.amazon.com (10.43.161.254) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 21:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173142

spirv-tools exports Cmake packages.  When they are installed the
INTERFACE_LINK_LIBRARIES variable is not correctly updated to use
_IMPORT_PREFIX like the other variables. This may have something to do with
the path to the sysroot being different than the source path.

The existing recipe recognizes that the sysroot path made it through to the
install and tries to get rid of it, but this just ends up with dependent
tools looking in vain for /usr/lib/librt.so.

Replace the INTERFACE_LINK_LIBRARIES value in SPIRV-ToolsTarget.cmake with
"${IMPORT_PREFIX}/lib".

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

Changes in v2:
- Don't change PR per Khem Raj

 meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
index ea47796543..e175cde145 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
@@ -25,9 +25,10 @@ EXTRA_OECMAKE += "\
 "
 
 do_install:append:class-target() {
-    # reproducibility: remove build host path
+    # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
+    # tools can find the right library
     sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
-        -e 's:${STAGING_DIR_HOST}::g'
+        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}/lib":'
 }
 
 # all the libraries are unversioned, so don't pack it on PN-dev
-- 
2.37.1


