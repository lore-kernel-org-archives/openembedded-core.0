Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0136.outbound.protection.outlook.com [157.56.111.136])
	by mail.openembedded.org (Postfix) with ESMTP id DCD3771144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 06:27:59 +0000 (UTC)
Received: from BN3PR0301CA0082.namprd03.prod.outlook.com (25.160.152.178) by
	DM2PR0301MB1198.namprd03.prod.outlook.com (25.160.217.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Thu, 22 Jan 2015 06:27:58 +0000
Received: from BN1BFFO11FD023.protection.gbl (2a01:111:f400:7c10::1:131) by
	BN3PR0301CA0082.outlook.office365.com (2a01:111:e400:401e::50) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Thu, 22 Jan 2015
	06:27:58 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD023.mail.protection.outlook.com (10.58.144.86) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Thu, 22 Jan 2015 06:27:57 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0M6Rrld018427; Wed, 21 Jan 2015 23:27:55 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:27:49 +0800
Message-ID: <1421908070-13605-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(229853001)(50466002)(2351001)(105606002)(85426001)(92566002)(6806004)(19580395003)(19580405001)(106466001)(110136001)(47776003)(97736003)(86362001)(50226001)(46102003)(104016003)(68736005)(77096005)(64706001)(77156002)(48376002)(450100001)(50986999)(36756003)(62966003)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1198;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:DM2PR0301MB1198;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DM2PR0301MB1198; 
X-Forefront-PRVS: 0464DBBBC4
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1198; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2015 06:27:57.7241 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1198
Subject: [PATCH v5 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jan 2015 06:28:04 -0000
Content-Type: text/plain

  This adds support to build multiple U-Boot configs for a machine; this
  is useful when we have support for different media boots which require
  different U-Boot configuration (e.g: eMMC and NAND).

  Below there's an usage example:
  ,----[ i.MX6Q SABRE AUTO based example ]
  | UBOOT_CONFIG ??= "sd eimnor nand spinor"
  | UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
  | UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
  | UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
  | UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"
  `----

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/uboot-config.bbclass | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index b467659..cb061af 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -31,28 +31,19 @@ python () {
         return
 
     ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
-    if len(ubootconfig) > 1:
-        raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
+                if config == f: 
+                    items = v.split(',')
+                    if items[0] and len(items) > 2:
+                        raise bb.parse.SkipPackage('Only config,images can be specified!')
+                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
+                    # IMAGE_FSTYPES appending
+                    if len(items) > 1 and items[1]:
+                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
+                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+                    break
     elif len(ubootconfig) == 0:
-        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
-    ubootconfig = ubootconfig[0]
-
-    for f, v in ubootconfigflags.items():
-        items = v.split(',')
-        if items[0] and len(items) > 2:
-            raise bb.parse.SkipPackage('Only config,images can be specified!')
-
-        if ubootconfig == f:
-            bb.debug(1, "Setting UBOOT_MACHINE to %s." % items[0])
-            d.setVar('UBOOT_MACHINE', items[0])
-
-            # IMAGE_FSTYPES appending
-            if len(items) > 1 and items[1]:
-                bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
-                d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
-
-            # Go out as we found a match!
-            break
-    else:
-        raise bb.parse.SkipPackage("UBOOT_CONFIG %s is not supported" % ubootconfig)
+       raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
 }
-- 
1.9.2


