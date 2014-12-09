Return-Path: <nathan.rossi@xilinx.com>
X-Greylist: delayed 1144 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Dec 2014 05:50:15 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0069.outbound.protection.outlook.com [157.56.110.69])
	by mail.openembedded.org (Postfix) with ESMTP id 26D127247C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 05:50:15 +0000 (UTC)
Received: from BN1AFFO11FD036.protection.gbl (10.58.52.33) by
	BN1AFFO11HUB031.protection.gbl (10.58.52.141) with Microsoft SMTP
	Server (TLS) id 15.1.26.17; Tue, 9 Dec 2014 05:50:15 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD036.mail.protection.outlook.com (10.58.52.240) with
	Microsoft SMTP Server (TLS) id 15.1.26.17 via Frontend Transport;
	Tue, 9 Dec 2014 05:50:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1XyDe0-0004sN-NV
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 21:47:32 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 15:50:04 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21160.005
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <6a97dbf65a4e47199083ee52b86bff27@BN1AFFO11FD036.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(50986999)(47776003)(77156002)(99396003)(92566001)(120916001)(86362001)(31966008)(106466001)(107046002)(46102003)(229853001)(450100001)(4396001)(19580395003)(64706001)(2351001)(50226001)(6806004)(62966003)(108616004)(20776003)(50466002)(21056001)(74316001)(92726002)(110136001)(89996001)(104016003)(87936001)(33646002)(53416004)(48376002)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB031;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB031;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB031; 
X-Forefront-PRVS: 0420213CCD
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB031; 
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 0/3] Improve devtmpfs and cpio support
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
X-List-Received-Date: Tue, 09 Dec 2014 05:50:16 -0000
Content-Type: text/plain

The following patches improve cpio support as well as improving the
handling of devtmpfs and consolidating the setup of /dev mounts.

Currently udev and mdev handle mounting /dev seperately in their own
init scripts, as well as handling of /dev/pts and /dev/shm. Both however
implement a similar method of mounting and creating directories.
Additionally there is overlap between the udev/mdev init scripts and the
devpts script. This patch attempts to clean up the mounting and setup
so that it is done at a seperate level to the dev manager itself. So
that machines/bsps can override the fstab and have custom /dev mount
setups. This setup also allows for a system which does not use a dev
manager and relies on devtmpfs for /dev nodes, which is useful for very
constrained setups.

Additionally this patch set resolves the need for the devpts init
scripts, and on top of that prepares the /dev/pts interface early enough
for other rc scripts like bootlogd so that there is no need for the
CONFIG_LEGACY_PTYS to be enabled in the kernel.

Nathan Rossi (3):
  image_types.bbclass: Populate cpio /init as symlink
  base-files: Add entry for /dev for cpio compatibility
  initscripts: Handle mounting /dev in mountall.sh

 meta/classes/image_types.bbclass                   |  6 ++++-
 meta/recipes-core/base-files/base-files/fstab      |  1 +
 meta/recipes-core/busybox/files/mdev               | 13 ----------
 .../initscripts/initscripts-1.0/devpts.sh          | 28 ----------------------
 .../initscripts/initscripts-1.0/mountall.sh        | 14 +++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  6 -----
 meta/recipes-core/udev/udev/init                   | 14 -----------
 7 files changed, 20 insertions(+), 62 deletions(-)
 delete mode 100755 meta/recipes-core/initscripts/initscripts-1.0/devpts.sh

-- 
2.1.1


