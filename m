Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52F4C43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:42:50 +0000 (UTC)
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com [207.171.188.200])
 by mx.groups.io with SMTP id smtpd.web12.1004.1668112966957802391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:42:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=guCFAvz7;
 spf=pass (domain: amazon.com, ip: 207.171.188.200, mailfrom: prvs=3066031d8=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1668112967; x=1699648967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQCBjgAOf6rOUSr90QIShE1D2vpP6IY3KkMIJGpS1Ik=;
  b=guCFAvz7FiGqxLQ3CftXRKhOmUTQTLmiu/ps29rfGd8mEQRGIjpUU9RS
   s0O1O35GcOFLl2T+ds3Du5agqRgIoyVtoh65Ob0ivTLN8mKfs7E86q0na
   sissfcpdj7y7qKOi3la1s4vueRMJnbUI+43Uk5G7XmG+UHQFr7m9zPB5o
   U=;
X-IronPort-AV: E=Sophos;i="5.96,154,1665446400"; 
   d="scan'208";a="1072750467"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2022 20:42:46 +0000
Received: from EX13MTAUWB002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1a-m6i4x-366646a6.us-east-1.amazon.com (Postfix) with ESMTPS id 742E4A0D7C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:42:45 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB002.ant.amazon.com (10.43.161.202) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 10 Nov 2022 20:42:36 +0000
Received: from dev-dsk-jorcrous-2c-c78924fd.us-west-2.amazon.com
 (10.43.160.223) by EX19D047UWB002.ant.amazon.com (10.13.138.34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.20; Thu, 10 Nov 2022
 20:42:36 +0000
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
CC: Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH 1/3] spirv-tools: Correctly set the prefix in exported cmake packages
Date: Thu, 10 Nov 2022 20:42:30 +0000
Message-ID: <20221110204232.12768-2-jorcrous@amazon.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221110204232.12768-1-jorcrous@amazon.com>
References: <20221110204232.12768-1-jorcrous@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.223]
X-ClientProxiedBy: EX13D22UWC003.ant.amazon.com (10.43.162.250) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173108

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

 meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
index ea47796543..fdc9c9225a 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "eb0a36633d2acf4de82588504f951ad0f2cecacb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
 PE = "1"
+PR = "r1"
+
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
 
@@ -25,9 +27,10 @@ EXTRA_OECMAKE += "\
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


