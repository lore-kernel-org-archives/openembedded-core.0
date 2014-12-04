Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0139.outbound.protection.outlook.com [157.56.111.139])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9E760670
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:49:28 +0000 (UTC)
Received: from CO2PR03CA0037.namprd03.prod.outlook.com (10.141.194.164) by
	DM2PR03MB445.namprd03.prod.outlook.com (10.141.85.15) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Thu, 4 Dec 2014 05:49:26 +0000
Received: from BY2FFO11FD021.protection.gbl (2a01:111:f400:7c0c::143) by
	CO2PR03CA0037.outlook.office365.com (2a01:111:e400:1414::36) with
	Microsoft
	SMTP Server (TLS) id 15.1.16.15 via Frontend Transport; Thu, 4 Dec 2014
	05:49:26 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD021.mail.protection.outlook.com (10.1.15.210) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Thu, 4 Dec 2014 05:49:26 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sB45nMYX027275; Wed, 3 Dec 2014 22:49:23 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Dec 2014 13:49:16 +0800
Message-ID: <1417672156-6102-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(48376002)(102836001)(104016003)(110136001)(50986999)(450100001)(68736005)(104166001)(64706001)(86362001)(47776003)(93916002)(20776003)(77096005)(62966003)(229853001)(36756003)(2351001)(107046002)(31966008)(77156002)(95666004)(106466001)(105606002)(84676001)(88136002)(46102003)(89996001)(92726001)(50226001)(97736003)(92566001)(4396001)(50466002)(21056001)(87286001)(120916001)(87936001)(44976005)(19580395003)(19580405001)(6806004)(99396003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB445;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB445;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(602001);
	SRVR:DM2PR03MB445; 
X-Forefront-PRVS: 041517DFAB
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB445;
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Thu, 04 Dec 2014 05:49:31 -0000
Content-Type: text/plain

  This adds support to build multiple U-Boot configs for a machine; this
  is useful when we have support for different media boots which require
  different U-Boot configuration (e.g: eMMC and NAND).

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


