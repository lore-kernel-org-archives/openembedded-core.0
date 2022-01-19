Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C25AC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 11:58:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.5248.1642593505070207910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=efwWeduA;
 spf=pass (domain: siemens.com, ip: 40.107.22.41,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVJADEH6chG3+2l5Kp/FIcJMSfq5LUIzxanmoAMtfOAMWIgFdvkASvu+HJ8BzxycRE/jXg/UdMCIA97IohJMQd7yG4CAQ6kBMDwjhLgxCPAuXKH3tQu28JOEPk1gbIQOAQRIOAWF/GrYYAZq6rxB2EEYS1Z10C3MHx336hA22HSYUw/rvoAxuaddsgArQ6s/cmrpmNGN1kMRT592X26dJ01jgUhWReoff9QANzeRbVfflnvECscV0eyOMNOMOy1UOgBB/TEeTzClF74HThwbKEzAk8T1y1X8sUyMtMPrcJpVz68VV0vzH4tzK5KHGtzH5HcJgV4PW2eonjLRVjBklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U0GydIvSYo4Ppbc+AIlLEGUJQCkakf74U59JSrWPJY=;
 b=WKKEjyeS8ldABJQaskn/VC6MyapB0sPd94zggToWMdQK/6JvgsEgWu5h8RD2kiTWDlFEz2Y+vRG3lwyr4Zdod4m9WR8xCztlBoZnfjfkPXbcECPYc0cX6Q2ymwS38jX2RqhCUvx6TB5bseJ4TWv9UolRp9InZRlSBgkEJHmj0wgm+1PIJYApBkxppSVP7PPD26ZUQBBBBP/pYx1z+7hFn8El9Y6EtXMJAB9wg/nCpPlWdgUDEVMyHPMi4i1Rm3t5vFMq31G4ahXSUoXc0y02gJVXsWbxnvlwICEnhxIW5cYSzYKsEZD1BqCk1pYIBXzui58En/Q2jmO31e5OIGfsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U0GydIvSYo4Ppbc+AIlLEGUJQCkakf74U59JSrWPJY=;
 b=efwWeduAM4uLZsSeap37q939/BdqTVWPOykMghTBnbqQzFDSieWOC9CSkKyNh4JNd2RTHAZCtAja2Iro5LVEqJlmZNgcp6WiUukdNNzUSJFViWos0uofiMdBkw+khpXnNIg5y1YfIDUhrsggTllH2z5v8YrRgjhOV7TUNzMa97Hg+9uvkZDJHQwVqQTY7aeXPX4GFXQi3cjxKkrbLzTQaTjOuuAWGHwNBZ+3MRRNwrJINXNfXhejrD0HpRnciw856SynVNX4oPDNpRn4LPVl4OQYBd36LlOXtG5kuT0juEPrXHF6o2ky1TX3NF6ccOLGLLgCt69IZNwARaKLHicaqA==
Received: from AS9PR06CA0209.eurprd06.prod.outlook.com (2603:10a6:20b:45d::14)
 by DB9PR10MB4861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 11:58:22 +0000
Received: from VE1EUR01FT051.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::e7) by AS9PR06CA0209.outlook.office365.com
 (2603:10a6:20b:45d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 11:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 VE1EUR01FT051.mail.protection.outlook.com (10.152.3.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 11:58:22 +0000
Received: from DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 19 Jan 2022 12:58:21 +0100
Received: from md3hr6tc.ad001.com (167.87.73.16) by
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 19 Jan 2022 12:58:21 +0100
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <saul.wold@windriver.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] kernel: add missing path to search for debug files
Date: Wed, 19 Jan 2022 12:57:59 +0100
Message-ID: <20220119115759.1390792-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.73.16]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A1A.ad011.siemens.net (139.25.226.107)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bd8b2a6-8f8d-4ed7-3d07-08d9db42fde2
X-MS-TrafficTypeDiagnostic: DB9PR10MB4861:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR10MB486154469EF29C266041DB7292599@DB9PR10MB4861.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wGzFosbk5kPXHN6qk5iRr4vjauzAQaeJTpsARIWvmfVQrISkRYGrsgZUqu7wOde6APVGxPvYvziMPdjo42czEWdmDHgx35xkYIfte6zt8XAaLkuA7rFkvCZVe0dbNzhp4Y89ZLzNoMkm9TxcpHeP5D2iDd3c6uoxappFqRK+W8VwJWa+my+y1lIk8RCRP06DsIAyj3T/PViYp9yIzWPfnIt7bhfAoVMeQsiBkhEjoCyY/XnxCSWKMiY+1BqP7RNSfMzZO6DVwFrHeTS1UtmfBslFC327NdRYTBiaZuOpttv/Jrok0Y+7VSDgx9HJkVOqUeVGb52V7aEKfmlXHSRNYhk1Eo1cxkVjZyQD24JtozTZTS60mXbMsPcrbWdUmr2UhSqyVVf+X2rxatHfctWTOcqrIs6r/jCCGk0GrI5buqMFjPwoOMos5VwR+fZQ0ICeh0l42j29RrW+gBwCr6cLFQU5Iz5Y4eLrpXmMT0ooXyKqcJP7X+2KWavu4GEoi9gjWaIGfeglkGBu8m/vzsdWZPfgWUcs0YOtWS1wgtuuCzFkzTE74yAdGZs9YgfqzMpy95Uhy/M/o4AsprniIWsLFTyHrnYmfCWKjbLKmuZFLGyIXbFClb5ZV7o8O75EZ43xGPccShgVCG0ouwHmLmxpDJxNqF/+GacySigIFkXPNgUnR387k1CdveqdKDNv3AYUCLgvgViYeJbrTfiR3cQih+2CfOmY6yFEiEwNLM1rT+fweOMK483xoeoxPcGmq/e/ROPg1jh4smXUsnC/H3ggQcR+JBdNjhF6Iq/HWshokI8=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(36756003)(1076003)(54906003)(4326008)(316002)(508600001)(336012)(356005)(36860700001)(6666004)(186003)(16526019)(81166007)(70586007)(26005)(70206006)(82310400004)(82960400001)(8676002)(44832011)(6916009)(107886003)(86362001)(40460700001)(2906002)(47076005)(8936002)(2616005)(956004)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:58:22.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3bd8b2a6-8f8d-4ed7-3d07-08d9db42fde2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT051.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4861
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 11:58:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160734

Since explicit debug package creation via ${KERNEL_PACKAGE_NAME}-dbg has
been added to kernel, it has to cover all PACKAGE_DEBUG_SPLIT_STYLE
options. For ex. when the variable "debug-file-directory" package search
path has to be set explicitly, otherwise it will not find any files.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 473e28be47..9ea201c936 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -647,6 +647,7 @@ FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
 FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/boot/System.map* /boot/Module.symve=
rs* /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNE=
L_VERSION}/build"
 FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D "/boot/vmlinux-${KERNEL_VERSION_N=
AME}"
 FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
+FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/debug"
 RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=3D ${EX=
TENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
--=20
2.31.1


