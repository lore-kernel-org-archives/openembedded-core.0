Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0146.outbound.protection.outlook.com [65.55.169.146])
	by mail.openembedded.org (Postfix) with ESMTP id 193CF65C86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:39:51 +0000 (UTC)
Received: from BY2PR03MB442.namprd03.prod.outlook.com (10.141.141.145) by
	BY2PR03MB316.namprd03.prod.outlook.com (10.141.139.26) with Microsoft
	SMTP Server (TLS) id 15.1.16.10; Mon, 24 Nov 2014 05:24:27 +0000
Received: from BY2PR03CA003.namprd03.prod.outlook.com (10.255.93.20) by
	BY2PR03MB442.namprd03.prod.outlook.com (10.141.141.145) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Mon, 24 Nov 2014 05:24:25 +0000
Received: from BY2FFO11FD014.protection.gbl (10.255.93.4) by
	BY2PR03CA003.outlook.office365.com (10.255.93.20) with Microsoft SMTP
	Server (TLS) id 15.1.26.15 via Frontend Transport;
	Mon, 24 Nov 2014 05:24:24 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD014.mail.protection.outlook.com (10.1.14.76) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Mon, 24 Nov 2014 05:24:24 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAO5OL0Z026369; Sun, 23 Nov 2014 22:24:22 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 13:24:18 +0800
Message-ID: <1416806658-15685-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(105606002)(87936001)(88136002)(87286001)(46102003)(95666004)(20776003)(36756003)(104166001)(84676001)(89996001)(110136001)(64706001)(120916001)(47776003)(104016003)(50466002)(99396003)(21056001)(31966008)(77156002)(62966003)(450100001)(4396001)(6806004)(19580405001)(19580395003)(44976005)(50226001)(50986999)(97736003)(106466001)(68736004)(92566001)(102836001)(92726001)(2351001)(229853001)(86362001)(93916002)(107046002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB442;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
X-Forefront-PRVS: 040513D301
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40290@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB316;
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 1/2] uboot-config.bbclass: Allow multiple U-Boot config for machine
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
X-List-Received-Date: Mon, 24 Nov 2014 05:39:54 -0000
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


