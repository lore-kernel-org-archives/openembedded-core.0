Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D474C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:38:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.102])
 by mx.groups.io with SMTP id smtpd.web10.48044.1736869106533705878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=TxC3u3fm;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7Iukn2H+xXvlgzoWcVu5aytCyBIRMj3jyOhUENORqxfbq9rUuv6145xGgNwRuoVVU5MxXeNZza6jjFEiwTypQnK7RZoefyhnKLDl2W9eQgOeU9MTRHmLG2+qjV9o+aWqNkLZtaWUA79r2SI1Fm8N2+/ldWAt13igxF44+0nT3rW5zUecb6CTbD27QHIw46Zu6Oq5mTHadAPCe0IOxeQUq+oSgWpVJHcwkY3AtY8YukVAimtyaeJio4n97KIBXknv678lf7k6iGoryIWFyncccl9q8u81WcKH53HJYquCY3hGJZR0LEUTCMu2FAyleYWZLdCf+LGrIyPdpCstAI+mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCFrJcL9xpUasTIGsougPtyXN0z1yscOzw9F0Ht9K68=;
 b=Hn33X3aX4+/cWB50KuW7CMSKnQ9hQIR4FaS1PXC9XqveNRKRNcOq2rAI8uttjcOmK3JlucXDKX4TIdPHeOkTylq8kNF7Vc7UmMacPkuyJZoDvz+FefXnfhQhWjK62X2kd2KvokHkcNgpbV7lbuAq/yLG5lsSsv6IQooKoPdSXJRdbtywg0xS0ToL8t4vkrFVyF4botpzsC71MKIl6SI8XicA1+Y18FHeTKVT68Bw/lcug5LorbuKzLkhZLkkWyC8h8BBPdDhyuHUCESSoF8jF/KLyJ/m8czzcojoILK3SLQ++g3eVRRATtyLN4IQdh/x1rQiRlbozK29ErwsjemCYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCFrJcL9xpUasTIGsougPtyXN0z1yscOzw9F0Ht9K68=;
 b=TxC3u3fm1RIzUqyM+B5ZqzobVMSStLDc78e6AprcYsxgc/JK1vrxXzQK3CEnwFTGzpuGSMkrDhgtX2E/RJhOnKq36LPE+mK+DxrlKKr1CW5BrU645L7gdSLNtMyUTzy8RVYCVfuwJnC2eVsG7537F7wMsVGcSn4icR791kvuDz1jUUr0bEtk4Vbc3Gqxe6XvaOQnysF5R9fpqiCZyqrtUQIRppKUAiRe6disfz2VBvkKzLTqMnKQYaif5oN8VPOCon/eQ5NnwjAhkGtuKvxB/XKpw6owgYSJ+fmeVEL0oBr/Xn+RqT0IYODS2Y3fhrgkplUwOA75rHM+NhMveI0geA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:38:22 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:38:22 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 5/5] image-artifact-names.bbclass: Decouple from IMAGE_LINK_NAME
Date: Tue, 14 Jan 2025 15:37:48 +0000
Message-ID: <20250114153748.2358116-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114153748.2358116-1-niko.mauno@vaisala.com>
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fff1206-2aa7-4b43-a23b-08dd34b179e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VOChDfKM2s/uOkC4198xb0YMC4ogh1gDGwi5VzkYnib+tYRQ17SCh3ryJ8+K?=
 =?us-ascii?Q?bup+fSlKzp28CMichx50pyeIXTpp7mmjU+aM2LzYdTDJrmB1DDpnbu6Al/0/?=
 =?us-ascii?Q?pZ8+fwb5395daPm1t2IPn3AZWabKRYmEYgENzasiWPXaHKNSa6g6APoAqi1R?=
 =?us-ascii?Q?tyUitV2AURIvPlXksuYjoMbAYatL3/SfY2zgzligRD7lf4JTA54eBboLTthc?=
 =?us-ascii?Q?G5cqrLdWkv0iwsRoZZec6Ujt5HvvbQLJGXEMb7ewMV5e5r+Wdyzez00q7SIV?=
 =?us-ascii?Q?uYdQHUFz033W/V/hiAdeO8HoSrHlJDzjdgjb5BKf1H1I2KomVVO688Qcuy29?=
 =?us-ascii?Q?+yPCNSTqEdtbo1OC5HbichrY+qSZwgbkzHAWKLhC7UC7Q/qp6oaU1SFypw1m?=
 =?us-ascii?Q?Iv74pqL1OpjUGXalzz9YN8124povsVtwsvpRKPjFPQO1qum4539KYyvbM0Rt?=
 =?us-ascii?Q?jXlVPJccj3UsWve6rpgKQnII7bWuiH5JdtQpYZTaCmL/XwZ8/VdaJ0yKSHpJ?=
 =?us-ascii?Q?bJYYqnLc6devpiLg3EGsSJrT8SfXNZGnJ8WFME1Ujom03BSHuqePhiGifH2u?=
 =?us-ascii?Q?Ezi91nLJoANMXC8SwHm+lVX0QMX7/gBx9MBNYlofNgTWIxWFeh63ymefWtm7?=
 =?us-ascii?Q?M32R+/2HuOpV2lij+is1jY5kQs39KlIFUcH3hsh7k4ED6CcUfvo76ZWZw/oe?=
 =?us-ascii?Q?cF9koJLyRky7oaSkEekmtmCRLT9uFgA55AoMfzmefgXYJjXPNuUBq/2cOfQG?=
 =?us-ascii?Q?QZs8vT8P9dls0tcml1l5UcnyOZ6+eL5fmxCHhsKqjwK/aJSIa4tfMILqUSxY?=
 =?us-ascii?Q?7Dxmscr2brr0WFxzXaRE3irXf5VwO+b0jcKlIMO8A1RG3OwuYFFQWw2/E9tO?=
 =?us-ascii?Q?imSE6uvAqIt+1PQl9qxFDkJ0vtJltSMU4rr/tsj1Lw6vuAEUtb7PMaiMnkeu?=
 =?us-ascii?Q?4Ejth/oJc0t4tXeVK5vVkRbPbsdO+Oac02OWTKGVgB9c9NscgJWJi7OTpQfl?=
 =?us-ascii?Q?DqZu1D+jssZKxKPRNayPxiMBSlNz/eCQlRIyiPPfbw7i+tqRR1PzJ3aeqxbY?=
 =?us-ascii?Q?gpgekhfbjMcmNJkeFIatLOK/YzOXrm1HWLfvj8gpDpliL4XYeggE9OqvPhJx?=
 =?us-ascii?Q?cB7STsmQokBpmA3yskE/xUlg/k1Nc7m8XwnlrqNc7aDjb30pDdknFGQnEYqj?=
 =?us-ascii?Q?p0tJjOixdS0NkYi5reTT5x2/sXJ+fU3YCwiOYq4fkj+wh1mzmObZARvkA7fE?=
 =?us-ascii?Q?CJhCcsM6HXUmPYM2cmEphF537NspLIu+4XthG64ZDjKOzc9D7YJ88jn2OuYZ?=
 =?us-ascii?Q?6m+Zxfw2w5IbrgRy2pm+sYlwamy0XioPeAhus/QxEz2zXRG81HTD1WQ0er2/?=
 =?us-ascii?Q?p/n5W1u831qmXXZbHPQyFo+9f5xnDniOi9m1kmTKAls9gn9hqgTzRjfvEQgD?=
 =?us-ascii?Q?zuiaY/BlAlyAK+s12Z4x7b5z80BeP9aZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CrEp3S2d28nnX+SXF77z5aoQu5yDinqqHUZ2vumzghvX+/JTd5FS4gMyPLXx?=
 =?us-ascii?Q?gfVVPTp8Rhpq+R+yIhBfJZA6M0EmDaJzyM1K0w1A2+Cg13F2MLoDc6C8pbOj?=
 =?us-ascii?Q?pjp+R183KdZMGoMq4t2WBFPVEtkmuoTCieiIQkE2xTxvYABYZu5n6UtghMnk?=
 =?us-ascii?Q?xYreVO3edJ/uBxf76WdR0pyIJWI/TnvhbPYHXU9NX0tUBlLyb/dLdxrCqqVP?=
 =?us-ascii?Q?vw0+8WPs0qhv1Oczb8DDvf3lv3FofvznxLpPn8kwCDPGciOBsNK693tkzznM?=
 =?us-ascii?Q?s19lJkFFq9bUjEqyxVrAWVGe2aKf/koiQJf1y4bQ4mHtlG6hNUMSLCxrSyB5?=
 =?us-ascii?Q?yiHYOEMfWSqm5iRG/ock8aNYNdi2Q0Y/zthNtcGkAmxasCqY7vgkNCfAAZ0z?=
 =?us-ascii?Q?5ruo/yDJxwU2CsS/JfU4WPMqYaq/1pnK/3D+TyfwJqG0lbKTp8yOaxkUSAZG?=
 =?us-ascii?Q?4Jua91HFCUhWr9SkpsKb32KxXXQ49ELL8EGb/tuAy+ex9vSjalptvDhSzSEm?=
 =?us-ascii?Q?5E++TtVnSfhErokBmQD6bQD1+75omK9dihw3IwnVFlbqmicTIXGcQjS+Dj1y?=
 =?us-ascii?Q?K9gWMruci8kobsy1NH3UcQEqy9fL9f62m4era3+dFngExkRAbK8oQ8XIwCf4?=
 =?us-ascii?Q?YaK/H8Ip9Ir+6bjyzvtFRnn0ZEDo9uWA7zFaIuEiCR1mXNV1BvNlBcZawwGm?=
 =?us-ascii?Q?TiizLYdvwsAsuagWQ3oi32wCHjyqfQeZdVmfAvV6Etaq/P/zBD+ZwzFg1DUB?=
 =?us-ascii?Q?BI1ZLUZdgKi3Fc5vPe8kHqigVz7NbD7TOFG0qb9NyJXjmkRFu7Alc9eKv5YO?=
 =?us-ascii?Q?vbdOFdXVu8bCuNPPu1EdYNMJYE2RFq860NtlH2U7RovqZMGJTaRbA4rXuSQ9?=
 =?us-ascii?Q?23BssH2mJHZra/G87jIQehx+emiXXu2XB1gAWWUx01zSouWwbgGgppFs3U1M?=
 =?us-ascii?Q?JAn9x+ab4m5KitSNAUCunGRF83XsVqcJ9d1EO5ElqCMf3sd7Jfn0a54CTvJu?=
 =?us-ascii?Q?63M2XkVLJCPlWHtKaNVzMyKyRJ08eCAFzDXzfxdUcZdJQUCxLpsXy51Bbdsc?=
 =?us-ascii?Q?Sg1+d2qWpzRQMegWs1Y4Zw5vzgyV7m7chz1Yo4yqRRXuE6IBCtq/U5x+b2yp?=
 =?us-ascii?Q?r3Pv0ArpcpSksA/KH9/EgD8lhxGAuu9hTreowbZGveCwMrcU7pEdIYFTbFo3?=
 =?us-ascii?Q?VMcNBOnmRGRVHDNinJQEvfGVbU8fydlEfwRkG7PUsaD+T0tl0orrdvzceuqP?=
 =?us-ascii?Q?rwjTm+eNfNybQNFTudAcx6Jr7SoLV/rov7d2SLUs85mnoEuwFM8Ue2E2YnRE?=
 =?us-ascii?Q?tK1INUCzJZcRJ9kboYNwFVc5aAytUHI8k3J6f6hzOwHRmMb3yu/0v1L6rFKk?=
 =?us-ascii?Q?cvoPRJj/uAu3VtcpQLOzlGFTfTSRkRe5I01R4zVvZ7WPtpURodSzNGwy1LVo?=
 =?us-ascii?Q?WynFt0gtdJWIpoJXmOuij1dRVaUnzTryXplmNpPVq11XyGMTKuxI8h5VNux9?=
 =?us-ascii?Q?ryjbNd2bz48gszwu1fVdCE0m0Xj3vtwGFzgd58/VIB3J+bK+UtZVTJZOoH97?=
 =?us-ascii?Q?Xa+lSDzb9G8ZrxL8NPainIXA08uVfzxvZKKJ4UB5R8ByFiB6d1jXaYmwMc22?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fff1206-2aa7-4b43-a23b-08dd34b179e4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:38:21.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHEZbkVq9mjGHKgLc6EolbuSfQbot4+HcqDZIT+ygEsXoFW69YkHhgR2ZQTVGl4E+XkvTHWf09cLxT/NHu/c1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209804

If the user has wanted to avoid complementary symbolic link creation by
setting IMAGE_LINK_NAME value to empty string, then he/she needs to
override the value of IMAGE_NAME name as well in order to avoid build
breakage.

Mitigate the issue by placing the common segment in a separate variable
which is referenced in default values of both IMAGE_NAME and
IMAGE_LINK_NAME.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/image-artifact-names.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image-artifact-names.bbclass b/meta/classe=
s-recipe/image-artifact-names.bbclass
index bc76ff0e16..8acdc16072 100644
--- a/meta/classes-recipe/image-artifact-names.bbclass
+++ b/meta/classes-recipe/image-artifact-names.bbclass
@@ -11,8 +11,9 @@
 IMAGE_BASENAME ?=3D "${PN}"
 IMAGE_VERSION_SUFFIX ?=3D "-${DATETIME}"
 IMAGE_VERSION_SUFFIX[vardepsexclude] +=3D "DATETIME SOURCE_DATE_EPOCH"
-IMAGE_NAME ?=3D "${IMAGE_LINK_NAME}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME=
_SUFFIX}"
+IMAGE_NAME_BASE ?=3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_NAME=
_SUFFIX}"
+IMAGE_NAME ?=3D "${IMAGE_NAME_BASE}${IMAGE_VERSION_SUFFIX}"
+IMAGE_LINK_NAME ?=3D "${IMAGE_NAME_BASE}"
=20
 # This needs to stay in sync with IMAGE_LINK_NAME, but with INITRAMFS_IMAG=
E instead of IMAGE_BASENAME
 # and without ${IMAGE_NAME_SUFFIX} which all initramfs images should set t=
o empty
--=20
2.39.5


