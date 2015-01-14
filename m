Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 12837 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Jan 2015 09:16:15 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0130.outbound.protection.outlook.com [65.55.169.130])
	by mail.openembedded.org (Postfix) with ESMTP id E7D3171634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 09:16:15 +0000 (UTC)
Received: from BN3PR0301CA0012.namprd03.prod.outlook.com (25.160.180.150) by
	BY1PR0301MB1191.namprd03.prod.outlook.com (25.160.195.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.53.17; Wed, 14 Jan 2015 09:16:13 +0000
Received: from BY2FFO11FD046.protection.gbl (2a01:111:f400:7c0c::131) by
	BN3PR0301CA0012.outlook.office365.com (2a01:111:e400:4000::22) with
	Microsoft
	SMTP Server (TLS) id 15.1.53.17 via Frontend Transport; Wed, 14 Jan 2015
	09:16:13 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD046.mail.protection.outlook.com (10.1.15.170) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Wed, 14 Jan 2015 09:16:12 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0E9GAkF018133;
	Wed, 14 Jan 2015 02:16:11 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 17:16:09 +0800
Message-ID: <1421226969-6840-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(50986999)(46102003)(86152002)(36756003)(50466002)(48376002)(85426001)(77096005)(77156002)(62966003)(450100001)(68736005)(19580395003)(69596002)(64706001)(47776003)(6806004)(19580405001)(575784001)(86362001)(33646002)(104016003)(97736003)(106466001)(81156004)(50226001)(105606002)(92566002)(87936001)(229853001)(2351001)(110136001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1191;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BY1PR0301MB1191;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY1PR0301MB1191; 
X-Forefront-PRVS: 04569283F9
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1191; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2015 09:16:12.8911 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1191
Subject: [PATCH] bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Wed, 14 Jan 2015 09:16:24 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

In meta/conf/bitbake.conf, PKGDATA_DIR is default to:
PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"

But in meta/conf/multilib.conf, PKGDATA_DIR is set as:
PKGDATA_DIR = "${STAGING_DIR}/${MACHINE}/pkgdata"

When multilib enabled, linux-libc-headers cache will be machine
specific:
$ bitbake-diffsigs sstate-cache/1a/sstate:linux-libc-headers:ppce6500-poky-linux:3.17.7:r0:ppce6500:3:1a0c3934d91479fd7242a5b1d407d155_package.tgz.siginfo sstate-cache/28/sstate:linux-libc-headers:ppce6500-poky-linux:3.17.7:r0:ppce6500:3:28c918e8f9f4a4cfceb3a38b258f7501_package.tgz.siginfo
basehash changed from 8d3158bbddcee612fa30badd05f47b8e to 68ac258fc6c8e489f360fde3123a5894
Variable MACHINE value changed from 'b4420qds' to 'b4860qds'

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7902bd7..3d2f384 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -771,7 +771,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_DISABLE LICENSE_PATH SDKPKGSUFFIX \
-    WARN_QA ERROR_QA WORKDIR STAMPCLEAN"
+    WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
-- 
1.9.1


