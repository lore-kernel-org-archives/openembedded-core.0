Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0134.outbound.protection.outlook.com [157.56.110.134])
	by mail.openembedded.org (Postfix) with ESMTP id 552E465C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:04:08 +0000 (UTC)
Received: from BY2PR03CA002.namprd03.prod.outlook.com (10.255.93.19) by
	BL2PR03MB436.namprd03.prod.outlook.com (10.141.92.26) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Thu, 20 Nov 2014 10:06:32 +0000
Received: from BL2FFO11FD011.protection.gbl (10.255.93.4) by
	BY2PR03CA002.outlook.office365.com (10.255.93.19) with Microsoft SMTP
	Server (TLS) id 15.1.26.15 via Frontend Transport;
	Thu, 20 Nov 2014 10:06:31 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD011.mail.protection.outlook.com (10.173.161.17) with
	Microsoft SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Thu, 20 Nov 2014 10:06:31 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAKA6Ra3011103; Thu, 20 Nov 2014 03:06:28 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Nov 2014 18:06:22 +0800
Message-ID: <1416477982-13153-1-git-send-email-B40290@freescale.com>
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
	SFS:(10019020)(6009001)(199003)(189002)(105606002)(450100001)(77156002)(62966003)(64706001)(95666004)(106466001)(229853001)(107046002)(19580405001)(68736004)(2351001)(44976005)(31966008)(6806004)(104016003)(50226001)(120916001)(4396001)(99396003)(110136001)(20776003)(104166001)(85426001)(89996001)(47776003)(46102003)(87936001)(102836001)(88136002)(87286001)(19580395003)(36756003)(48376002)(50466002)(50986999)(97736003)(84676001)(21056001)(92726001)(93916002)(92566001)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB436;
	H:tx30smr01.am.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB436;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB436;
X-Forefront-PRVS: 0401647B7F
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB436;
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Thu, 20 Nov 2014 11:04:17 -0000
Content-Type: text/plain

     *This class provides a system similar to PACKAGECONFIG but for U-Boot.
      The format is: UBOOT_CONFIG ??= <default> UBOOT_CONFIG[foo] = "config,images"
      Below there's an usage example: ,----[ i.MX6Q SABRE AUTO based example ]
     | UBOOT_CONFIG ??= "sd eimnor nand"
     | UBOOT_CONFIG[sd] = "mx6qsabreauto_config,sdcard"
     | UBOOT_CONFIG[eimnor] = "mx6qsabreauto_eimnor_config"
     | UBOOT_CONFIG[nand] = "mx6qsabreauto_nand_config,ubifs"
     | UBOOT_CONFIG[spinor] = "mx6qsabreauto_spinor_config"

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/uboot-config.bbclass | 40 ++++++++++++++-------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 8ac1b71..f02ca58 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -31,31 +31,19 @@ python () {
         return
 
     ubootconfig = (d.getVar('UBOOT_CONFIG', True) or "").split()
-    if len(ubootconfig) > 1:
-        raise bb.parse.SkipPackage('You can only have a single default for UBOOT_CONFIG.')
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
+                if f == 'defaultval':
+                    continue
+                if config == f: 
+                    flag =  f.split(' ') 
+                    items = v.split(',')
+                    if items[0] and len(items) > 2:
+                        raise bb.parse.SkipPackage('Only config,images can be specified!')
+                    d.appendVar('UBOOT_MACHINE', ' ' + items[0])
+                    d.appendVar('IMAGE_FSTYPES', ' ' + flag[0])
+                    break
     elif len(ubootconfig) == 0:
-        raise bb.parse.SkipPackage('You must set a default in UBOOT_CONFIG.')
-    ubootconfig = ubootconfig[0]
-
-    for f, v in ubootconfigflags.items():
-        if f == 'defaultval':
-            continue
-
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


