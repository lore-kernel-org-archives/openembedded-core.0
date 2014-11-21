Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0107.outbound.protection.outlook.com [157.56.110.107])
	by mail.openembedded.org (Postfix) with ESMTP id CB8D56AC82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 05:34:44 +0000 (UTC)
Received: from CO2PR03CA0051.namprd03.prod.outlook.com (10.141.194.178) by
	CY1PR0301MB0714.namprd03.prod.outlook.com (25.160.159.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.16.15; Fri, 21 Nov 2014 05:34:43 +0000
Received: from BN1AFFO11FD033.protection.gbl (2a01:111:f400:7c10::124) by
	CO2PR03CA0051.outlook.office365.com (2a01:111:e400:1414::50) with
	Microsoft
	SMTP Server (TLS) id 15.1.16.15 via Frontend Transport; Fri, 21 Nov 2014
	05:34:37 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD033.mail.protection.outlook.com (10.58.52.246) with
	Microsoft SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Fri, 21 Nov 2014 05:34:37 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAL5YXpM026808; Thu, 20 Nov 2014 22:34:35 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 13:34:31 +0800
Message-ID: <1416548071-18880-1-git-send-email-B40290@freescale.com>
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
	SFS:(10019020)(979002)(6009001)(199003)(189002)(93916002)(86362001)(46102003)(92566001)(92726001)(97736003)(64706001)(120916001)(99396003)(95666004)(50226001)(450100001)(2351001)(106466001)(105606002)(77156002)(62966003)(110136001)(229853001)(4396001)(104016003)(107046002)(36756003)(102836001)(50986999)(104166001)(87286001)(85426001)(19580405001)(84676001)(88136002)(89996001)(19580395003)(87936001)(47776003)(20776003)(68736004)(6806004)(21056001)(50466002)(31966008)(44976005)(48376002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0714;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0714;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0714; 
X-Forefront-PRVS: 0402872DA1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0714; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v1 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Fri, 21 Nov 2014 05:34:48 -0000
Content-Type: text/plain

   This adds support to build multiple U-Boot configs for a machine; this
   is useful when we have support for different media boots which require
   different U-Boot configuration (e.g: eMMC and NAND).

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/uboot-config.bbclass | 42 +++++++++++++++------------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 8ac1b71..f70ca88 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -31,31 +31,21 @@ python () {
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


