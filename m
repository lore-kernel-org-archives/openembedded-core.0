Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81107C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=domLtgsW;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoRWT1XJpDCJJC1tnR50mSs/1CyngrBlnlL4BH0BxYhiT/UV90I4Znm7lxrUrSPDg7W8FgZBwCtW4FSWlEzKls50dOJFowD5AcZ+GmUMj+bsOPHXNY2WU40xEgu2PdhnmqUTrpyrCMdV2jwpwYmMGd8aXRKRSLFf3eZDa7qq343OHFS54BKDgeyv8hgIRF+DfXZ3EPpQx1pGZeABwKU+UmIQLW/Bra2tnknFeiYcB+bAxQO1KwaTFVBvUYAKD/uZDvnyprtHFFafJH3CNplpVUAdU5hbTaCg20TKF5/hOoHWPcd27TO6pNN1Qp48ry/lQ5TOlnhkiJMu+5Yw+5cGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nie/LJCqx7NbVF6yjfKMowY75lxgDovM6ZvO2gh9pU=;
 b=ILEXAcdErH/B02pOYmgpwt1WV6IPFcPhpfxsi0Oe5KH2MTxOrB18HJHXFvpbZzt4a0z+fDASAVrrLe18wY4EEu8rMiuLCPtogQKUI7hn55r2PgGo69jO3DoGo/tRaZDC3DIY7RoKUHvTmA1uz6lMivOl4PaTpS23gp8Iw8/jH2qj1BIA9M+/hBKV8ouARdQQVDB9SLe3eLameWvEcAQgusOw6ibyRVzV4gG7tvZEhu8Sxofanm1BwaN3ZbiUf0JnWw5yBbJEuNtlxNUuJ7CWRoXkYxfFH2JH6ebJh4bWHfB/5Qw2kpEJQUuIlFq6pSNOoZc2Ol5xfjc8DkiA2QpE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nie/LJCqx7NbVF6yjfKMowY75lxgDovM6ZvO2gh9pU=;
 b=domLtgsWLL6QBVsfF68RsRAXiQGlIItexOWw3TyHloA0tffpHcFcxw/ie4y0mbA/5hHKp1EveZ+50X83BrpnbXreDKuMUqOhi47KGxu0eDTec+H6g+v/MuolBNENEDR/PJgWjXR1WVCQTnqyT5d1GzMfTWJDEcHToPE2/l3ElITR/1H3zrigOcdHWOVyCxbhgIpgiCkhog/zFE1fxH6UgnROKG82J4OpPl+us5dKM1QxsywMuz6HrkeS9qUyEjAd8zOMf3p39VpQB18/9zxfIhJUe2m3lSUwUETzFzTKnbyrD76moZDw1SNDPZCLjGAtrEnyHkjH9YCdtGVFNKpfmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:50 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:49 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 02/30] lib: spdx30_tasks: use expanded FetchData for download files
Date: Tue, 11 Feb 2025 16:00:06 +0100
Message-ID: <20250211150034.18696-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc8bfed-5f15-48f7-09fb-08dd4aacdd5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AKqkbV1q8gFMpJA7kV5L1GRKeFFaUWq3OlNCIBN7eLZjo4RifnZ0cHVDAeLG?=
 =?us-ascii?Q?SEPZ+x7qkkIZm9QPmAGGV+WzGirZ2LNWcLniaOXCB7NW/LNE9bCSF/ZIZrJ8?=
 =?us-ascii?Q?OEpCScw0T5BHoktH02HcSEkGz0q+SuzDpuxfNF0AGSnKEY5etn1GjL7enLor?=
 =?us-ascii?Q?kHVkJ9Axw3Jdm4dys9mF79CgKofxTQfXY02QRqIADAdMi/XJ1MRI+1IEaJkU?=
 =?us-ascii?Q?dOc2e67jw+1NJEow7MD5oODaco7efwD+d4StkxeeJky/a9+FETY66lmGvpRR?=
 =?us-ascii?Q?sw0H9oNEtdSAfqb3GMS1vhHP8RfQPlcAVNSCF1a2erkFE6igtXC2DMEiygX2?=
 =?us-ascii?Q?s28dfGR26ucM+/MJH42OIKe2M1+QSvaorV4pJrV14NaCEknpqSGdkOREIMiE?=
 =?us-ascii?Q?rcwtglrQ+IaPD2DG4mM4TEXjALoeCjh6lxe5PLi6AFkXuUyip1JI6RQbfmC1?=
 =?us-ascii?Q?8tQOyRPbPiZ+tcF2tuj6gMFAvRFAP7caQFeIY+KekifFK1Mps8lK9DNVrKCC?=
 =?us-ascii?Q?a4Uz6EugWEPHaFbdHPHk7Qa78nAuLRPPqDAfe+vlMLul5x3RML1LexxE4032?=
 =?us-ascii?Q?W7j/42fS1Fr0cFDUtpJ+9Gse7jgqVMTjSeDxYQ3h9vjM4068jx0NG9QCCPiB?=
 =?us-ascii?Q?QWtQ/3bUjV+1ka0Hq6vFFwafj9r5Pu+xvmlNWXM/8lEB/05/svzTTSCIukFN?=
 =?us-ascii?Q?ihPpm4YNu7pU3nZYF3SQS5Vb7LyltYS3jjcy8w1rIQdt8WqGGGJu7Dr6a6QP?=
 =?us-ascii?Q?voeWe1HgLVuLvo8fn51wXKJ037qaQncG/O02hgfjFoklg3wMPJrxm0tjx0K/?=
 =?us-ascii?Q?i2LNfgdXai5F0rwUCF6g7cp2cSc9zaV/kbG1Z5/fFJgdowAu6b4+6jayNxR+?=
 =?us-ascii?Q?169zJyIx8ufp2EyJUJIim62+4Up/q0ewiLrjOngGB61a0dwjq5bZy3R1oP9S?=
 =?us-ascii?Q?Z4c4KOO2747RuCfdMBcL65hYpQIM2KXrnHM/jLlby6kpy9Sjmvb2o8ZQEQ6G?=
 =?us-ascii?Q?Plwwod0bvHMPoun7yJKTcqLMudD58ifpimQ5KCiXWVre+cgU13voOa5h3z6R?=
 =?us-ascii?Q?jIMWBXGu+/l9uX+LfopofwqQrnILAN33DzIcjBYlSgoSZbbnJR0YjCjvN36j?=
 =?us-ascii?Q?Pn89drmQE1Caf/mYBc0fTPczhhtdA0f9611yy0VEjVZH3K+zHhS7TJYehIqU?=
 =?us-ascii?Q?QN6cKf5WATHnuCDzVapUJS9HSWNQ2hHN8ng1sw6fpUwXP98Jw2GlKxDteICS?=
 =?us-ascii?Q?1Rcm5/gWsq1aSQP6IvDFrtThG1CbUaCrJG0trN0AHTxo1tHd99PPw8F5d3fo?=
 =?us-ascii?Q?43BTE73eGg09UYqwqy3KeQVgaWx4CCVGBR19jAkIZewqiBdJ1O59PdORV007?=
 =?us-ascii?Q?c9mJU4IB6JEGP5ruTJL4tDVzFtgP256OYkmswGYr6aOARIkMBEIIbt5itKBX?=
 =?us-ascii?Q?nAfPhCXWC5Bdm5jmd7pqnyhd4XuSRCSV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XDhAYePaVBWZiUlA28mLUHxel3cM2APdbMAvBCKuiGuVcDt3DxE1UXlre6fH?=
 =?us-ascii?Q?Sh9h0uAlXGeqrphEADC84NTRgsWyGgWyF0eFQmi7vzHcJn2odnRaoGfJCZGT?=
 =?us-ascii?Q?3UtKk87Ay+H7ySZ3CKSsGmTLZXkfWOvyLFf7txnkp5RSNHqCqeQ1g/yoLfDq?=
 =?us-ascii?Q?ICO9xh537bCPpLiScotbk9moCAfDIQX1eFy/mRMNSbdiHkYs9OO+gYO4OnUZ?=
 =?us-ascii?Q?FBAOkNFr/99D0QmN8OrJmgjamAGC3njkc6KFgUaSccHU2jknWlGnPS+VsHbv?=
 =?us-ascii?Q?+PUvMs7tV5fRuKftqVn8qj0pQ/XAs86a62ccfvp6hqaJgRUzIDaXn+JsU/MJ?=
 =?us-ascii?Q?/gek3qS055bJ9w4fPXnzGqWioiK+hTSzP8726/8MtkzNhz79Ewed0P1m6fe0?=
 =?us-ascii?Q?ffD9ywmvGJm28fkWAWxmo6oU/5uoLIWZ093AO31bzhH3N5GYEJPEnh7CGuwS?=
 =?us-ascii?Q?yUYQB/J5lSfM67DscZkogkeDnVGcMh7L4C1RZwcukF2/NgtptH67//Q+QUKz?=
 =?us-ascii?Q?hwNPFcjAH5rZS85ynysUH1HMaLzGn8SJ8LdBEYDjBfiSTAGrQybJ2H/FrE6r?=
 =?us-ascii?Q?7Zcmv3vfLEBdJmW2KLf7HTCG8uc0s4DTWBo5Kxx2pqoHc8wZPXO7uXdIE5ES?=
 =?us-ascii?Q?j6aphNsf04QFw8ARQyduaWUbafFrZGNtkflXIyXbY63KzCuJ4UW7jA3ThEco?=
 =?us-ascii?Q?yTC0j5Kh/vndnQBTpXrEQSxTo3LlouzzWpWiym+8pwyoxoCCeay5mUu9oOfV?=
 =?us-ascii?Q?Dx4n75jhFZFM7kr5a1vOltFM6tCFFbdzyUppUzSKEY7ih531lI+XH7SR2La7?=
 =?us-ascii?Q?qRlRXPu8+fQ9ddBLkPWIt4QwVZ0IIGl2MLrUzc21hSzeBmanJDsUxwjNhHNl?=
 =?us-ascii?Q?sQ1ZnB2RimdEmrmvj0+c3zzxGFuqIQ8gLXsDCrPHDR62pYn3hNKN2lCr305W?=
 =?us-ascii?Q?dkC9ddFrj2+IaXBLrmT2+P27wpQqCPwyCMmSb6eU8N4HPTk1n4WogkIElzXh?=
 =?us-ascii?Q?1OFATztfeqiqI6Jwb7JLy/qoOer5uqc+qUpkmsoMTi8mNrf8RkbWpwdvkPBb?=
 =?us-ascii?Q?zW7UstK6FisA6yLzC1YRzb8rj36cFWOhE/ITQnILbeBrTqZtD1b6UnNbJM23?=
 =?us-ascii?Q?Mrh/TUYdebYecCZF/BST3ZyfrQpGrZeCXU1Wsiplen4uXRRZkRgsM0b6Ivl3?=
 =?us-ascii?Q?LKOKLSUHAgvZWaBMJ1NpL1xadb2S9uwES2o9Du909iQo6pDsmYcKP9D15KVm?=
 =?us-ascii?Q?iNTpZHkxjJkwzTlkGLWqJQpJeLFLnLpOOHBfvAhD/tFfJttVm4Qs2Z27TaQy?=
 =?us-ascii?Q?jyFHcxI+5uuGlgme2s9VxS0eFBlstTHZRJLdW/yyPz1PzDEUzh066KKRZhuT?=
 =?us-ascii?Q?3zsqnDSidsPLXd6UhH5X1KuucaxWbtc3Fa6PHtNUNpV3O7+qP91AZe2Tln6Z?=
 =?us-ascii?Q?IsNlJGkA4KZbsjrUOHZoR+//DxITvJ/tRjAUKAnfQKoAcZR2F2Hfwpi2V+QX?=
 =?us-ascii?Q?YKYHNF/u9haoutjsjvvvClQo5Ke+JhNwIENms06xo3zyuqDfeqflQtYw0ErP?=
 =?us-ascii?Q?q0LtgdjXHySMgg4WVt5y+1KmYiTBOa3vvSdv2j02qvNDQsqOHYBOg2cN45as?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc8bfed-5f15-48f7-09fb-08dd4aacdd5b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:46.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJfQahfC9KN1PPhCbB5evjOdO+/L9IIETqdAsaRXDuWkpzaak8v9JegyirZkKexnqKH3AKQwV7o3jgwOJWiJWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211126

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use the expanded list of FetchData objects covering both the given
SRC_URLs and any additional implicit URLs that are added automatically
by the appropriate FetchMethod.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/lib/oe/spdx30_tasks.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6a39246fe1..10b1b3fe14 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -343,9 +343,8 @@ def add_download_files(d, objset):
     urls =3D d.getVar("SRC_URI").split()
     fetch =3D bb.fetch2.Fetch(urls, d)
=20
-    for download_idx, src_uri in enumerate(urls):
-        fd =3D fetch.ud[src_uri]
-
+    for download_idx, fd in enumerate(fetch.expanded_urldata()):
+        src_uri =3D fd.url
         for name in fd.names:
             file_name =3D os.path.basename(fetch.localpath(src_uri))
             if oe.patch.patch_path(src_uri, fetch, "", expand=3DFalse):
--=20
2.39.5


