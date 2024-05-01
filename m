Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CD6C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 21:26:46 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.66])
 by mx.groups.io with SMTP id smtpd.web11.8771.1714598797936047667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 14:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=AGXEzK2n;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.66, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlafa9dB1BcI296c6GqOu916Sto8pgWYY6YFTDahcWDlNvjByFvj0KINtLI3dGLajkCpCi90i9a4MVFQeNf1Hp8skYRnxg4j5rnRs/2Tu14EwbJzNzuePhBr8l0FyJIXBN+iwx5itCu5sBDlpt5QIm1DBM7bJEwXH+Ctt7Lh1kCUdBd/vPHWQmuLBlkv6kxOdY16e8klqn9Bs0AG3s5HiqYmgWpBRGJUWx4Z5sm/tk2LuXbTke7fe+06IbtXsvGiFSKTLVxgeTvW1XzkmNsNTs1v3qMF/cqgHdXvOfDMkH05vBZLeW0/V4Qze0nuftd0QWVqChyk1/dkoJRMkEeAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HajGRZe3EcVaU/YF1+H5XN88CXZmaH8pubN5PmvpBOM=;
 b=lD9+CxK4hUE/Q2O3+9MRG03R820THzZphKIuKrNMuBLA5AZ/laV4xnjg39LImo1OkiHyrSt+DB+j/hk3QZIdD6oDiM927LSbsjBs4/kBrUYJLqHKaSzhDh5zXUfQmba31kKqYkgMBDCCZwB4OL17wTdiiYm5ibAPBmn1HbSnAv5HiDzSifWREg/MePjllSpjweRaAMUhPEqH7gA4tsxV8AcR2N4C5kKjGOFzxdBSaO0NXg50Cn2UjOuGVF2DHZJ/rD8E4OsAKMPckhGZW14j86lCaA4zLdyqmW6H+ImkHnxT69GhKzK53QrxI7CytVTbZlYfhGj7QCvLyt4j3wnYJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HajGRZe3EcVaU/YF1+H5XN88CXZmaH8pubN5PmvpBOM=;
 b=AGXEzK2ncFOGppaYZsaRvn8yfZSfl3uXkmk58D41fo1Y1bqx158atdtjEYiAHLrGPexFlurkU3nRpM64qSIhpf390/lkO0MKhBvlZn46NyzLivCPujgG8XzrqSo+9dx8j/IsuuMK1/etkjCMITlIgOiUOwceuYPnfUmco/nGRO4=
Received: from BL1PR13CA0283.namprd13.prod.outlook.com (2603:10b6:208:2bc::18)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Wed, 1 May
 2024 21:26:35 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::aa) by BL1PR13CA0283.outlook.office365.com
 (2603:10b6:208:2bc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29 via Frontend
 Transport; Wed, 1 May 2024 21:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 1 May 2024 21:26:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 1 May
 2024 16:26:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 1 May
 2024 16:26:34 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 1 May 2024 16:26:34 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][scarthgap][PATCH] sstate.bbclass: Add _SSTATE_EXCLUDEDEPS_SYSROOT to vardepsexclude
Date: Wed, 1 May 2024 15:26:33 -0600
Message-ID: <20240501212633.1343526-1-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: ca01ee37-a09b-4f60-e0a1-08dc6a2560c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400014|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EZA6JwWEHS0iwRN+ElPB+rTe72Aml8GPDVl++NYCcA3V7RkbN3HgwexsZZqk?=
 =?us-ascii?Q?lwRMerpDWc1qMdgcaEO+U8fPd3Umhi4P7/oVAJUJaUNX5SqZQBdLbJf1FSUk?=
 =?us-ascii?Q?OJqCYDX0NrjdfwCRZXJdu2SUhq7n42VnLEji5FIEcBDCtkL9pokDm+agRn5E?=
 =?us-ascii?Q?q6FnmfvF/Cg6MEJxYpPdpCQlz4ezwrFDJQHlLPQBOhf2ax9CQBDQevBjAqi3?=
 =?us-ascii?Q?9M6FXf0CqyHcrK1dGorMRgx8pmdDcWSYYgLtLImpWbRZ8L9CYPEAZ/U9rD+N?=
 =?us-ascii?Q?Y0KIGNbG/Avpg7+KtinAPVQuChDVLKCXOnVCx7pzEE6Z5lfR1PYpDjw8Cq7g?=
 =?us-ascii?Q?K2XdtWvVcH9JGdez+pPWgRrZmZVcencJDug20szvdcYZVb6PCZDsiuCBu4Vw?=
 =?us-ascii?Q?lBV8qEg5PW75x0XnCo5R48CXn8to4za2VUe5s3LjD3ZEUhceuJCzOiQRzo0l?=
 =?us-ascii?Q?9rjjckZiqIC9hqKGmFCgMyA+QLg1KKkAnQRcoBF5ENn+Xutiy56I7K3LCv81?=
 =?us-ascii?Q?LgcC7ka9gVOtfoNNsVn6+zExsYrUgeNxRh34kK3Nw4FcaCOE/8yDCRUkorlv?=
 =?us-ascii?Q?1rBVUFfsd+RZctn/eK4GQ5WXtz4bKQU7awSEMvlSZhOl2h6fFHBVw3vk8GVZ?=
 =?us-ascii?Q?HoUrHV9CjU0qEn3IuzVAHYOacsS/pKV7NMVGwFIE7gXkRsytKHmh13gNKHtu?=
 =?us-ascii?Q?OL39vRzHWKqB0aEzhQ32pdZPSLJ/pmpzQRMK7rvR4Ztkauin7i8Zclw5Vxax?=
 =?us-ascii?Q?zGyv1Zvdfi1qkFtvFp6GBc1Yyf3IBEC6vBolHwMMEpcdsqyjfOwOe6+WDXpz?=
 =?us-ascii?Q?MdpUe5BZJvaLl8LajdApxowN3NhUsGWDHAM8ox5+ybWYTJeJQSIX2li7rI5P?=
 =?us-ascii?Q?Jf1n5nQZmc41fbCbMR8k3h3JX8I/WY2tRJ9FmUMxw4UOKlH3i9Ck42baYcNG?=
 =?us-ascii?Q?PZp6x4CEFyWjTQZAWLmPSaiZ5Gob65bQd/ekXlXWKOEtCQlY6OV52RbMwJrO?=
 =?us-ascii?Q?5TXBs6GrC5E+tUcXeWGAkT+0JMYipP1F9pXPXzA8JkkRPM78cVNRewOU/IHD?=
 =?us-ascii?Q?SAKfMMg3lmYgC68USOejVfY99AuDfhU7PdTxeMfpKnInc4Ese+Dlq7sMjjXM?=
 =?us-ascii?Q?v4WzWn9qBu0RASJp2xH6GI9dZLY3g1hUcpYmhOiUyK6XPIx9bkCxC36DSraF?=
 =?us-ascii?Q?wtZh5T8mcL1zrBns4tkj3dnAaW+eYZm7ZL8EXQ+6x6b5/rfXR9AYVdNaSsmd?=
 =?us-ascii?Q?/fxf4e1vmc30/PGy7fR/pKTG+53GTtY95BDS3L5RTcMdwvYiQcgPyQwAF1gA?=
 =?us-ascii?Q?60Hvb2+ASmwvzCeT5mfUx3wodooKltiz2L2lICIm1T8ooAFJWpM91ssu40JT?=
 =?us-ascii?Q?5NKvEStdgQ2n6b6ibNMSEFE4gEH/?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 21:26:34.9566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca01ee37-a09b-4f60-e0a1-08dc6a2560c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198886

When using tinfoil to control the build, multiple commands (serially) could
trigger an error such as:

  When reparsing ....bb:do_package, the basehash value changed from ... to =
.... The metadata is not deterministic and this needs to be fixed.
  ERROR: The following commands may help:
  ERROR: $ bitbake esw-conf -cdo_package -Snone
  ERROR: Then:
  ERROR: $ bitbake esw-conf -cdo_package -Sprintdiff

However following these commands it was not able to be reproduced.  Forcing
bitbake to dump the signatures and then running bitbake-diffsigs showed
that the value of _SSTATE_EXCLUDEDEPS_SYSROOT was being set in one run, but
was blank is a different version.

Upon inspecting the code in sstate.bbclass, one usage (without the _) is
already excludes, the leading _ version is used as a cache, only if set but
is not actually required to be defined.  So ignoring the value should work
properly.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---

I found this issue on scarthgap, but I've seen similar symptoms back to lan=
gdale.
Most likely it's an issue back to kirkstone, but clearly rare outside of a
specific workdlow with tinfoil vs command line bitbake!

 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstat=
e.bbclass
index 04539bbb99..76a7b59636 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1115,7 +1115,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
=20
     return found
-setscene_depvalid[vardepsexclude] =3D "SSTATE_EXCLUDEDEPS_SYSROOT"
+setscene_depvalid[vardepsexclude] =3D "SSTATE_EXCLUDEDEPS_SYSROOT _SSTATE_=
EXCLUDEDEPS_SYSROOT"
=20
 BB_SETSCENE_DEPVALID =3D "setscene_depvalid"
=20
--=20
2.34.1


