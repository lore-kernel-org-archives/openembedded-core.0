Return-Path: <gshastri@juniper.net>
X-Greylist: delayed 1109 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Nov 2014 11:35:02 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0102.outbound.protection.outlook.com [65.55.169.102])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8E472051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 11:35:02 +0000 (UTC)
Received: from BL2PR05CA0044.namprd05.prod.outlook.com (10.255.226.44) by
	DM2PR05MB445.namprd05.prod.outlook.com (10.141.104.154) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Thu, 27 Nov 2014 11:35:02 +0000
Received: from BN1BFFO11FD027.protection.gbl (2a01:111:f400:7c10::1:172) by
	BL2PR05CA0044.outlook.office365.com (2a01:111:e400:c04::44) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Thu, 27 Nov 2014
	11:35:01 +0000
Received: from P-EMF03-SAC.jnpr.net (66.129.239.17) by
	BN1BFFO11FD027.mail.protection.outlook.com (10.58.144.90) with
	Microsoft SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Thu, 27 Nov 2014 11:35:01 +0000
Received: from magenta.juniper.net (172.17.27.123) by P-EMF03-SAC.jnpr.net
	(172.24.192.21) with Microsoft SMTP Server (TLS) id 14.3.146.0;
	Thu, 27 Nov 2014 03:35:00 -0800
Received: from gshastri-desktop.juniper.net
	(gshastri-desktop.englab.juniper.net [10.92.9.56])	by
	magenta.juniper.net (8.11.3/8.11.3) with ESMTP id sARBYwR75214;
	Thu, 27 Nov 2014 03:34:59 -0800
	(PST)	(envelope-from gshastri@juniper.net)
From: Gaurang Shastri <gshastri@juniper.net>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Nov 2014 03:35:35 -0800
Message-ID: <1417088135-31227-1-git-send-email-gshastri@juniper.net>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:66.129.239.17; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(106466001)(81156004)(107046002)(20776003)(4396001)(105596002)(50226001)(48376002)(99396003)(77156002)(62966003)(50466002)(47776003)(2351001)(229853001)(95666004)(36756003)(102836001)(50986999)(120916001)(64706001)(84676001)(92566001)(92726001)(33646002)(110136001)(53416004)(46102003)(93916002)(16796002)(44976005)(87936001)(86362001)(21056001)(31966008)(87286001)(6806004)(19580395003)(19580405001)(69596002)(68736004)(97736003)(89996001)(88136002)(104166001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR05MB445;
	H:P-EMF03-SAC.jnpr.net; FPR:; SPF:SoftFail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR05MB445;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:DM2PR05MB445;
X-Forefront-PRVS: 040866B734
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
	juniper.net discourages use of 66.129.239.17 as permitted sender)
Authentication-Results: spf=softfail (sender IP is 66.129.239.17)
	smtp.mailfrom=gshastri@juniper.net; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:DM2PR05MB445;
X-OriginatorOrg: juniper.net
Cc: gmshastri@gmail.com
Subject: [PATCH] When building with systemd based image, udev-hwdb postinstall script will fail because of not passing correct CPU option. So fix it by passing correct QEMU_OPTIONS.
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
X-List-Received-Date: Thu, 27 Nov 2014 11:35:09 -0000
Content-Type: text/plain

Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
---
 meta/classes/qemu.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index b2cf85d..c373855 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -30,8 +30,9 @@ def qemu_run_binary(data, rootfs_path, binary):
     libdir = rootfs_path + data.getVar("libdir", False)
     base_libdir = rootfs_path + data.getVar("base_libdir", False)
     oldest_kernel = data.getVar("OLDEST_KERNEL", True)
+    qemu_option = data.getVar("QEMU_OPTIONS",True)
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " -r " + oldest_kernel + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_option + " -r " + oldest_kernel + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
 
-- 
1.7.9.5


