Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0096.outbound.protection.outlook.com [65.55.169.96])
	by mail.openembedded.org (Postfix) with ESMTP id 356BC724C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 06:05:51 +0000 (UTC)
Received: from BL2FFO11FD046.protection.gbl (10.173.160.33) by
	BL2FFO11HUB058.protection.gbl (10.173.161.158) with Microsoft SMTP
	Server (TLS) id 15.1.26.17; Tue, 9 Dec 2014 05:50:14 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD046.mail.protection.outlook.com (10.173.161.208) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.17 via Frontend Transport; Tue, 9 Dec 2014
	05:50:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1XyDe0-0004sH-Gm
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 21:47:32 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 15:50:05 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
References: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21160.005
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <7beccc403bae467c97f56341d2404205@BL2FFO11FD046.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(31966008)(86362001)(110136001)(99396003)(50466002)(92566001)(104016003)(108616004)(62966003)(450100001)(77156002)(76176999)(50986999)(4396001)(92726002)(120916001)(53416004)(48376002)(6806004)(87936001)(19580405001)(47776003)(74316001)(19580395003)(106466001)(21056001)(229853001)(107046002)(89996001)(20776003)(46102003)(2351001)(50226001)(64706001)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB058;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB058;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB058;
X-Forefront-PRVS: 0420213CCD
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB058;
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 1/3] image_types.bbclass: Populate cpio /init as symlink
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
X-List-Received-Date: Tue, 09 Dec 2014 06:05:54 -0000
Content-Type: text/plain

For cpio/ramfs the kernel will first attempt to execute /init and will
emit the following error as the file is empty:

    Failed to execute /init (error -13)

If /sbin/init exists symlink to it so the kernel can immediately start
the correct init executable instead of an empty file.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/classes/image_types.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9aee745..1b8ceee 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -70,7 +70,11 @@ IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 	if [ ! -e ${IMAGE_ROOTFS}/init ]; then
 		mkdir -p ${WORKDIR}/cpio_append
-		touch ${WORKDIR}/cpio_append/init
+		if [ -e ${IMAGE_ROOTFS}/sbin/init -o -L ${IMAGE_ROOTFS}/sbin/init ]; then
+			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
+		else
+			touch ${WORKDIR}/cpio_append/init
+		fi
 		(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 	fi
 }
-- 
2.1.1


