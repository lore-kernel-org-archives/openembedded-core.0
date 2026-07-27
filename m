Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36831C531FC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:35:04 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26261.1785137702876527160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=PnOgpwBx;
 spf=pass (domain: ericsson.com, ip: 40.107.162.17, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+12kphECOix6JziZ769UOIYGO9qcTpV7UqC6AwoxTiIddHbKGVG5AJfBQ479RxKC3TzAXE7/AFhweXqrOs/Veu9BRLHFor5bT2mPOPsL4NcK2LEgBZNCdiUHqNRs5fNdzdiAAEMAu9AzeXKmpGZyUc28wIIpt71RV8n9YidJbg8QChOtO/ZSVDCuGGfLJ7eDtaCiKVmDg4kWAEaoKN6Ex5eACqR01H2HoJbJA5To0sewR6Xvrryez+vIWys2BzAH5s8f8XAIO3/CpktfrTuA3OZzsVpYaZJdIWERuyWZyfNBVajFN22Iw2928ixBfSGsxepAnVbSJlYf3UpCJiGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cpa6jrqTJ3dBjS9DhUcdZsRRx2xbpjEybxsO1TQcC/8=;
 b=obXLHhKWF+MMgfAT7PwHRhq3LIYgy5xXz9PCFYS6gcEWnIa97KfmsbV5jdi5Ul+LWPeoPxjFuABMYddujGNvGh5QRyDC4Fs4PZmUwwHiygLQj9Sg/8bfIepzst4KWWWVWBTrnhsao3ike4viE2KEPWl4egZsNWG5e92gL1FVHbYMRC/UJj3wbqWkeiRbaFkfi/HDaAZ1FNVyji+uJGMmryOYRGj+STLRFZOyE81KC6pOnySetSZykiHIcY/vY4m2+Z3AbmE7WQ4Gs1viwatRfExUY6LvJfJdty8CN1ZIzd+UNFBOg5Jb0WbVrc225bpa4c9j2vdXMB9kFT7Kb36rAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpa6jrqTJ3dBjS9DhUcdZsRRx2xbpjEybxsO1TQcC/8=;
 b=PnOgpwBx25pD4NsRaDOnHHYDmht+hb7RbyHw4zkwKDUJllaOmAQPIXiG2O3PV0uJFaWN5gSnYU4ilf9CxlcKbsA8P9D2JgJqp8mCzevRPxm/kJl+ZoqFYcnpq56RqAxIiwpGDiP4wKIT8IfMfpRNW5FwRjKz7u6TbYfzkbm+2wF5SZ1WqwQSH1hkoal0fQ+Mh8CQEWLuLYbI/OV0GAfZLhIw99/ICdNJnvY8jHCUAdZgzf3KWHLJdxNKpwzz49GO5qwXcHTLgrrz2LFXjW5/q4P3x/fhh1GOAeqmtagD7/Ek3C2VHBxKSxxdpx6yOwD8zWtfhsT6In8XhQBODfhbYw==
Received: from AS4P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::7)
 by MRWPR07MB11770.eurprd07.prod.outlook.com (2603:10a6:501:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Mon, 27 Jul
 2026 07:34:57 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::99) by AS4P190CA0017.outlook.office365.com
 (2603:10a6:20b:5d0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 07:34:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 07:34:57 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Jul 2026 09:34:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 5FE2C95800;
	Mon, 27 Jul 2026 09:34:56 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 2A542700DBB0; Mon, 27 Jul 2026 09:34:56 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [scarthgap][PATCH] libarchive: fix CVE-2026-14164
Date: Mon, 27 Jul 2026 09:34:54 +0200
Message-ID: <20260727073454.2019759-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|MRWPR07MB11770:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dca6045-de41-415f-1244-08deebb18edb
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|56012099006|11063799006|12006099003|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	qGOaPAAwsQ4HHmOjxl6hE+3e1IhKK8LZNrSCLDMIPNAhFF0q3l4WmtJhSe/AFYAdLQGI3clf2lJRA8gGyWV3v3QSQdjRbPb9f7Nso3Fjp4x5g77lJEudX8nteDDmOdFKtSTo+0y2gwfjQ+po51/q7G10mqlC18AaQkm94/cmUnojNJidyw/jD0n6Adi91gto8o+0l7eiH5Zk8ETsBVq73s7jnZBv/76K66UDg1b7BP9l6/LR3LCiiE0CC8ZKNTawJwio4SAbaAwQVBFcj7hYaL2Aw1o0b5o7qDLhUuV2zlRmK1N6i9DFN/vgLpDLDmVMmBv31Yun4S0eX83dbBUPbyhSAcDTyl+LGoQ/gLHOKMpF0P/EcMabJnVodYdIG85x6ZuCpPt3dg9PfWBwKvrTMMLBa7bzJnOXIdMdQiWR6gPAzTjyZjgXzMwiyRXSzBwPmbFMccmcRY4HrEM1M/MSEFUmXdJrwxAGicxjtYU4Vp0uzYtiG7lXn7avKUsrY+TGFajCbwptzkZT+mqmA18AUZlxib3lyS3YlBmLVaGSd9F2kN74wGqATdTn9V87z98p/p6JQIFsab5k7zD5uX6JRuyRpaHBRa87aDUVGJWTUC/Mhq41dVUyTkmY3qMS3f0FL1dYj6nMuBOkzR5fXCd2fg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(12006099003)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	apM8+Rxc7W6KKe9aWO0z6qTFIiTv0JKnNZWUo7d096Emb+SiOE31qBk2l7pNdwffuesXcU4v84hLsF9v3cotzUdu/UWZ3I89pNxVaoiv4MnHWdj6xf14R4i4cq8j4UaRHxpwj+v/bFww1BVkuqX4f9DXdgZKOE2z2Z+EuLJ0IQ1HA0wj8sI2dlqJd6YKt5Kr80SEI8asi4JoBI/GljIlqXNZn7nwal3CS4c407zvRahF7MdP1zw7XgThkmAneAchULcMiaPFBVUKz1aPb44kraFIQLBeJ8ptY9WdmNBrAYgUTokZILZBMlRfcU+ubsZ9CjFT+0D4r/yUd1oUVrbSSWORdHS6auJibRfqOMmhx8T3UbEVeB6HArpnrvsXQWXNDaDoJEe7q4x2ewf4+cWtwIXYvJaAzBcZCCDw812hbIO5OUqbdd6tI95dQhjibCJO
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 07:34:57.1005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dca6045-de41-415f-1244-08deebb18edb
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR07MB11770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 07:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242057

From: Daniel Turull <daniel.turull@ericsson.com>

Backport patch to fix CVE-2026-14164.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-14164

Upstream fix:
  https://github.com/libarchive/libarchive/commit/f774f03b40cb109348e5c6d52=
b59c864e3cfa8e8

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../libarchive/CVE-2026-14164.patch           | 52 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-14=
164.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.pat=
ch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
new file mode 100644
index 00000000000..c94764acf29
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-14164.patch
@@ -0,0 +1,52 @@
+From 5efdd23ea2569314d62492bdc0b078f4dad1f75a Mon Sep 17 00:00:00 2001
+From: "Dustin L. Howett" <dustin@howett.net>
+Date: Sun, 24 May 2026 12:43:00 -0500
+Subject: [PATCH] Merge pull request #3071 from stoeckmann/rar5_doublefree
+
+rar5: Avoid dangling pointers in init_unpack
+(cherry picked from commit 42453cf16255800726b4efedab25138639ceef20)
+
+Conflicts Resolved:
+
+libarchive/archive_read_support_format_rar5.c (1 conflict):
+- Stable's init_unpack() is a void function without the calloc failure
+  checks (`if(...=3D=3D NULL) return ARCHIVE_FATAL;`) that exist upstream,
+  since it predates that hardening. Kept the CVE fix logic (unconditionall=
y
+  setting rar->cstate.window_buf and rar->cstate.filtered_buf to NULL righ=
t
+  after free(), and removing the redundant else-branch that only NULLed
+  them when window_size <=3D 0) and omitted the ARCHIVE_FATAL return check=
s,
+  which don't apply to this void-returning stable version.
+
+Assisted-by: kiro:claude-sonnet-5
+
+Changes from upstream commit f774f03b40cb:
+  - libarchive/archive_read_support_format_rar5.c: adapted from upstream
+
+CVE: CVE-2026-14164
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit=
/f774f03b40cb109348e5c6d52b59c864e3cfa8e8]
+
+Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
+---
+ libarchive/archive_read_support_format_rar5.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar5.c b/libarchive/ar=
chive_read_support_format_rar5.c
+index 736c95a6..098cd6f7 100644
+--- a/libarchive/archive_read_support_format_rar5.c
++++ b/libarchive/archive_read_support_format_rar5.c
+@@ -2489,12 +2489,12 @@ static void init_unpack(struct rar5* rar) {
+ 	free(rar->cstate.window_buf);
+ 	free(rar->cstate.filtered_buf);
+=20
++	rar->cstate.window_buf =3D NULL;
++	rar->cstate.filtered_buf =3D NULL;
++
+ 	if(rar->cstate.window_size > 0) {
+ 		rar->cstate.window_buf =3D calloc(1, rar->cstate.window_size);
+ 		rar->cstate.filtered_buf =3D calloc(1, rar->cstate.window_size);
+-	} else {
+-		rar->cstate.window_buf =3D NULL;
+-		rar->cstate.filtered_buf =3D NULL;
+ 	}
+=20
+ 	clear_data_ready_stack(rar);
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/re=
cipes-extended/libarchive/libarchive_3.7.9.bb
index c167b164b4b..d08350e2b47 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "http://libarchive.org/downloads/libarchive-$=
{PV}.tar.gz \
            file://CVE-2026-4426.patch \
            file://CVE-2026-4424-1.patch \
            file://CVE-2026-4424-2.patch \
+           file://CVE-2026-14164.patch \
            "
 UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
=20

