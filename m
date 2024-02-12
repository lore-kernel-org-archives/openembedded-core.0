Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857ADC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:40:59 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.6159.1707744037104535632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Tcpkg9Ap;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=765aedbf5=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1707744037; x=1739280037;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BaelqI2FhP3gcSNXP/o3tS+PLDmabcD35w8Dafs7E0M=;
  b=Tcpkg9ApxdBnz+pf+oLm4AGVdio4qx3tSCh7arTmmCnpMFM0iidftHsb
   5GL7YvPohxJD0RCDaLr7e/0LNx81itFYRDMLI2K5b960WQSGj9ioPXGdZ
   la5uxZr28LQrJHAUEDBxmeiP2OWivhp2n19EoAwJ+oJlb6QooH2MVUmBr
   o=;
X-CSE-ConnectionGUID: uOhVYlOnQKm6Z+nfqnGY2g==
X-CSE-MsgGUID: qLBedvkdTaKnrZE377UIAg==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 12 Feb 2024 14:20:34 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 12 Feb 2024 14:20:34 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 12 Feb 2024 14:20:34 +0100
Received: from localhost.localdomain (10.30.85.209) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Mon, 12 Feb 2024 14:20:34 +0100
From: "Philip Lorenz" <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] ipk: Remove temporary package lists during SDK creation
Date: Mon, 12 Feb 2024 14:19:49 +0100
Message-ID: <20240212131949.141493-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ClientProxiedBy: smucmp10d.europe.bmw.corp (2a03:1e80:a15:58f::2005) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195337

The temporary package lists used during SDK creation should not be
shipped as part of the SDK (in particular because due to the opkg local
file download optimization they are actually symlinks into the build
directory). Remove them by calling the respective helper method during
the SDK build.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/lib/oe/package_manager/ipk/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index cc7a7ede54..3acd55f548 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -74,6 +74,8 @@ class PkgSdk(Sdk):
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.target_pm.remove_packaging_data()
+        else:
+            self.target_pm.remove_lists()
 
         bb.note("Installing NATIVESDK packages")
         self._populate_sysroot(self.host_pm, self.host_manifest)
@@ -85,6 +87,8 @@ class PkgSdk(Sdk):
 
         if not bb.utils.contains("SDKIMAGE_FEATURES", "package-management", True, False, self.d):
             self.host_pm.remove_packaging_data()
+        else:
+            self.host_pm.remove_lists()
 
         target_sysconfdir = os.path.join(self.sdk_target_sysroot, self.sysconfdir)
         host_sysconfdir = os.path.join(self.sdk_host_sysroot, self.sysconfdir)
-- 
2.43.0


