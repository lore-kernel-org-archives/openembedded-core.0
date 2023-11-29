Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B839C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 15:24:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web11.39561.1701271492013548638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 07:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=hvKnVh5O;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.59, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwWKG/nVgWSlnNPaBleX82yZaJicg6PEEdZgFyL+GG5ApYdyGZsFnsHy2xaie6FXZe7eA7BoO1Ci3LL3GqXNbVJYapjrL8EJQKVKheZgZMRkTeIsaRh4wlDPKYAQMXvjTW8ewnwQTgvhO9N9kOpokhr0KBu2vOvmUvWdh+vTVDhPRh94GprNKsVKSl63KijvQ0U1rILKlUb8m/M5KcNVYptF+PkKRbmdg5zcLX11EM30v2AaPUVdlPwk5TAU12YtlfqE5qq+iiprOYj6VQPwUZO0xquqDp9TmR7r1AXA6M8Un3JWxqV0NaN7o3aV/6gJBlmN3DSdtgB0l0KMOmtmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLLt4KPE1bFLDZaDnpzu9GbtovG0kODdXLNcoi4hCTA=;
 b=gIz6dT2Y4EYzvPTRYk5xGnz20o0aZ/YU+Zh29R884UyntYN/lZyRkYDQtHSu6rdpkhVlfxbgKaX9QYpXaN/vfAMWq9QINtdj79BIIu90GcOkXdc792IBfA1JIJt1tOxHNKrlftT+CTZs8xub7jHWg/dGDPN3JqzUsjWEdAFMDkFYx6lcfeKU/dc6WMtkPTSZT+K6LTje5GvVM2k7N1u2H0dRlMBWIZSadzblTFsIQIKmqz/ndZI8g4LibKaVUKZaBX0j9MoD8dmmU3p8idFnZe76X1CME9xQWl8e8v1o1OWpE4dk8TFm+6I05TejFho4rsMMG137fMYX4B5jMe9SRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLLt4KPE1bFLDZaDnpzu9GbtovG0kODdXLNcoi4hCTA=;
 b=hvKnVh5ODBGBek8W+quUyPVuwfVM2DHxzfiKBLbbkkd9XO0mVSWhRZ48/wwNuzsMRcLGuQUzzPI7TcjhFSX3EyV8MscUkzCDkZIGG8T3etOKa6GQyBBAcIj+VBFSw62BgO/oi3Jm2vX2O/9BLUO1ZZlPRvx9gNmzp20x6YI5FmVkwHmNDlcbJPc84ZFv9Zr6tNqcBGIacMpcJibMtIMlklgkAQTHuPSDhbjgmGq0vtkZb6GzrIKthgaJj5o8VsnekAw/1atThmrOLkzHiEgDf5v4KuSVX3EostRGRhJVCQ0gIuNwQL+3BA9dzWovqMSKoEGjIrmdcjkhv7+5sJJebw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB7452.eurprd06.prod.outlook.com (2603:10a6:10:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 15:24:48 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 15:24:48 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] rust-llvm: Allow overriding LLVM target archs
Date: Wed, 29 Nov 2023 15:24:02 +0000
Message-ID: <20231129152402.2222800-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013E2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::21) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 687d7d0a-b8c2-4f3e-9e63-08dbf0ef52e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8P6Yq+YQpZtglzcEmU7VSYDKR2VftBxT1uEK5B8/rWaGk5uVl7BpNxtil5otW7F0l8BH/R0i0TkYeIQsJsh1vgnpcUKl6xJsmC4vF1ACfOvhaBaooG+r63yr5dPHFbe8VbCd8Kfj8rUNyAoLQV2SuzTf4jIQwNdJZw23CBx1oMArR5baHppb2Qjeaxkp1ryXgymNUqgEDa0j+n09vC+H3b+7w3ePNX/mquUWDTU/9j4dWH8oq2hykUpDqZe6gnE9aTq3Q9Z1F3HARzi65clJquwHz1nR8IoV0Q6WzWDc/tx143fbQe1NINOmC5Ag25/PqXyp5ltlLk1/Eq63e6F5HfZn92P0nm411ENmhE2Qi6A/abSQwy6sHE9qNIG7fsai8O8S2+jZ+6iRYy/mtDiKAWW5PS4G0ySjfiV8jL2bDwik8sbKOTSdaKiYj3o4D74GRS/APqwOjlViZkB2F9tiIPmBj4zpZINjyuJiMijXcgKKkTzyyfg5cOJaV04hC7QuQ6aT3Y6BQBDkUitWRt1T1roEjOzwhRs1yDiZrsQIo7r5BjR+563n0SR/PM1Ka4RAFp5BntFfFXKYbhCQAwmVTQFWXDbtDOxePMH+waEI6mkFpcdrK322lyTJwhEJYvgP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(2906002)(38350700005)(4744005)(5660300002)(38100700002)(6666004)(6512007)(9686003)(8936002)(6506007)(478600001)(4326008)(66476007)(6486002)(36756003)(41300700001)(52116002)(8676002)(66946007)(2616005)(83380400001)(316002)(1076003)(107886003)(6916009)(86362001)(66556008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MDRdCsjFhFOiIzbHmqnHne+6ivWmpX455PUXfLBdLOk0tHW70KjIvasR9C7C?=
 =?us-ascii?Q?KXcKtH/E+zDSHF88BynrwhDtTWYwCOMYEwIdN8Lxed6szT0160AIU2t/bees?=
 =?us-ascii?Q?LkcaJcS1tRPAij1c5dlqqKMN/rztK1nCOvTvJZWXDIpLvdPoJ94r2ttDoIt5?=
 =?us-ascii?Q?pN4JVdetsS4CI1lwauI5Pw9jL/gARtByG3oHzR66S0vi3yPw9nTIIwa1CSUO?=
 =?us-ascii?Q?/FDeY9yjT/AkK5T9emdr8u+KssnrCJ3sP44Ugcv1XrSP0p833BZEYTyvAhXy?=
 =?us-ascii?Q?56+zG3BXsyR7l4fhrsBCzyFNtKaZiJpqOneM7S8kLqFSev3JM4QHb+x2RynT?=
 =?us-ascii?Q?qapkHezgM1H8HLgcMQra2DUyjeZ1t8DdlfmH56VLmXK067qq559g7Du9YmAs?=
 =?us-ascii?Q?zwVxTGf2kHB9+LRqv5ecPJvdiXl7NJB5l3yN6F0dbJmmeLwvAJIRoKiJYHAX?=
 =?us-ascii?Q?stLc1rwrmVGrw73AfFD5XC3fcsk2K/mYe3BinpzIlhOcRTztABOB1NJ8y5n0?=
 =?us-ascii?Q?F5ms8IJD7qv0ebJQDN9EtKYIkSBZxq1KA4MDboBozosYNl08SCTF2rQghfNO?=
 =?us-ascii?Q?999pO5/xAhTgaUoZd5uClvHCQem/8SiFDrbouBiMsZ6sM3eAECXd7AN9Q6ct?=
 =?us-ascii?Q?ZqWwKCX59fZMoX3d3gyIpxjS6ch85P1FMsBu5MMUXmff3QznBv4wLSLPPAep?=
 =?us-ascii?Q?O5sOWkopbc2AYj0YoTGX+Xnmd+7vekiAgiGSqJVamG/a9Evf+o1GqOqzdO+j?=
 =?us-ascii?Q?7bCHP4+0r66K64vRychFB+6BXnmMrdldmjw3Av6fuhILIDanYBIHeJs5XZOq?=
 =?us-ascii?Q?fXR8MaB5G7gRuQNTdgxoWIEIRMXTi4QsUyVjSlxel+fwLCBoYX+C6WdreUJW?=
 =?us-ascii?Q?PFvbdRmi7TmQTRfULLXU7aotbz/6Q1hdDrfVx+1Yw86kXwa4Av5NDEhXBKyg?=
 =?us-ascii?Q?v0A/ydH3C/IQCgZBGGhw26h8aKWyp/NRERcBHzlSvRKO/HG0+UOxJARp7jA1?=
 =?us-ascii?Q?IA6kJNQru7hYu71jOGHooZjM/2obHQk/dzrNmql+BT1xpFe2ACJW/8EYl1ku?=
 =?us-ascii?Q?0i+nAAFE/Ur5rrwL6GSq406dQSTYzO4yVGCl7/hBJeHSCMD7K6Fracz1QOOl?=
 =?us-ascii?Q?hL7ka+Fwkvl1iFOI1of+4Zxt6FBvaxx83QpjL6XNhlwZJMR0oNo0jIu/UNQG?=
 =?us-ascii?Q?obfMkhpwtkOVcdbW9902+4E2R+4qfKI++agzh4jqtCN3AGoqtawDuso0smsH?=
 =?us-ascii?Q?pyJ/a0kxC0q+FKJnbqvnRnIFmc5u35XA/FnKJ33mxlQkj8joOpX194ZD8zM2?=
 =?us-ascii?Q?dahd1gehS0RqMZdDUAhc/HUpctdd6fTixRKidbcvc8D0brHYe/a2xpwCVM2i?=
 =?us-ascii?Q?Los3RthmenV+DNU8zgIDpudTJfo4RfSr/uRA/Pex0HsAkyaYekUwF6Ib3OzV?=
 =?us-ascii?Q?Td83xWg4SFw5xbgQ8WRC/eC7X/QDDiHs/2y48WGIcMNa+J2zUNSfEOuuAEQ3?=
 =?us-ascii?Q?T1NpIwih5ixCtomeZy07ELvgX5BQoLHe7El+UzF5YepkE5XrA9CY4nP9AHRS?=
 =?us-ascii?Q?/VPubiJ87N9U4D33D+8ksr6kRRRuc+o298URAbfM8RMf8fPzjwACw9I+aRe+?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687d7d0a-b8c2-4f3e-9e63-08dbf0ef52e3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:24:48.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yCJou9U5zaI/3qIpHlHGaWxYs/z40fHaZB8AKHqmeG4al0ZIqG0zRchgWP3q8vgLk1RNDhLshfNFMCYoSBH1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191455

From: Niko Mauno <niko.mauno@vaisala.com>

Move the default value into a variable which can be overridden to
match more accurately the use case specific scenario.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/rust/rust-llvm_1.70.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.70.0.bb
index 57bbe79cdf..5bfc1faea8 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
@@ -30,9 +30,11 @@ CXXFLAGS:remove =3D "-g"
=20
 LLVM_DIR =3D "llvm${LLVM_RELEASE}"
=20
+RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
+
 EXTRA_OECMAKE =3D " \
     -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'ARM;AArch64;Mips;PowerPC;RISCV;X86' \
+    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
     -DLLVM_BUILD_DOCS=3DOFF \
     -DLLVM_ENABLE_TERMINFO=3DOFF \
     -DLLVM_ENABLE_ZLIB=3DOFF \
--=20
2.39.2


