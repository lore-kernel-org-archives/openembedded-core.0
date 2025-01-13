Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5A7C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 12:08:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15589.1736770111143357174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 04:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108bd75fe=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D6xTEt007658
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 04:08:31 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt71jje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 04:08:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3j80WokFIifFRWtzqXIH1EGi7wL5sksBCKiFxxyPm5LsK61sreRrXMd7TaR+vKLJHU0XNlSuAkscjqW6ivVjS1hrhG2EeI64xX/upT69eTwEysHoldvprQ5/EIMbfXduSVmSPOFPYwEUF/MbYIIdKcgrJ2u+AWBPGKGtnQ9yqMxiQBX01yAJM/Xsa7e8R6oN4cvaGrCFh2EX2M3u6wp6DvqmAMROVWDk2KfYRfbbVjTvYWe/+/m3uvJFXRJXOAAG6nbEyO8EJdfmoK+Zkd2QKSbo7diGkH46Xu3RiH0Hervpzl/dnw7FzYSjMoaBgKC7TxRxacu8oHls/w5B9224g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGm5yj4vrTIg0Su9ILFcA1JJBqYh888G0Fx9xSvEcEs=;
 b=V6KvUJg7je1ux3lY5ox3Xhzh2rXRRpK09PtXXK1DnTfjoEVI8HL7za3uSAHg25Y2bPJ0zBa/VrY5+QRLGOYExs1U1Pqx+GltQRMxS8KnEwcIwNMbCuqyGHcNrL2qer/I2OgJ78pMTHFrzfm4jjzplk0hQJ3Wl6lt4E5Ami7MnQDaKLla286UNUPvMKfyPe+ivfGlHO3szfx1EJWDPbW93O0m4cX4EZh4irAbcG6VrLCR7ixQmFWUx46j/KF82YD20UNMIMoJsHKz5wir717oc+TwnUvVAiBUWNFZMVW4GnVFb1R/g07TDpI6H8Mxu3U/I4inNAR5YKKE9B+0vFqs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7785.namprd11.prod.outlook.com (2603:10b6:8:f1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.17; Mon, 13 Jan 2025 12:08:28 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 12:08:28 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 2/3] rust: Fix for duplicate libstd.so
Date: Mon, 13 Jan 2025 04:08:07 -0800
Message-ID: <20250113120809.2847446-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113120809.2847446-1-Deepesh.Varatharajan@windriver.com>
References: <20250113120809.2847446-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7785:EE_
X-MS-Office365-Filtering-Correlation-Id: 935c2822-af63-4f28-08a8-08dd33cafd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X5EDVd2IoeO+z4ZEvVu7sQWty1CGuHCOlEFF3MQVD301jc/BmrDTbS2EsR09?=
 =?us-ascii?Q?UIaQDx6YODIB0XVuHpe2ZQm09Y1HNX7U/6rgozLrRfRxzTv4uIpNAaCpqvp0?=
 =?us-ascii?Q?K2pcjOSVUgKGwb1qYCuYb5E6cToPCC2/HSs5J8sYIF6N+b6qQ0gbmz67upKf?=
 =?us-ascii?Q?qU1CaCz1SSF5hP9FL7LN6VHul+azei/gjndam0AhLiKZoXbiGUQN/tjoiuXO?=
 =?us-ascii?Q?dnVv4E3V1Wb4TutE+s5hSZVawQddle4l7wkGqxWxzpnaH3sgKUQth3N0pq3j?=
 =?us-ascii?Q?19/E3IzMVFq1Rmq9jPGsuHbZGlv/LYtaPyzW73oDe8VLT5BnICIKdk6DReol?=
 =?us-ascii?Q?1lxjGqCOOarPZWhdKqaCiH3rGPyWvIxH9YxhMWkcek3d7DiJIBI5J9qC0ee7?=
 =?us-ascii?Q?KgqVnxGq49F4uG+H0yr+/PQ4kHHhW0I0MY2pw++NXpEekxvR9+tsxqQDkDyG?=
 =?us-ascii?Q?bZRpUdyZyt5s7XlkmPwZYpG0gsZRLecgEoTiCfKsriVFY1peUrsyHemfxgc2?=
 =?us-ascii?Q?F+ity4PQoV7vrYUrUvNuTIztqLO6BV36zLJLjGjbQ9JIc8eFIS1GmLvg07xf?=
 =?us-ascii?Q?Rxzd0m++rlshI5ybZPTogCwwZzoENKlgaR2lZvYvYK9861w2PPV7VBaAi8X2?=
 =?us-ascii?Q?L6aOKO1H0kyDaItSiePONWR595d6ig7vtp8wbECWv6EbdjLGXD2LdQv/lV/8?=
 =?us-ascii?Q?S9ccEHQuAdK4ysVqt6x5rl005CPWR/IMKq9friIQ3FJ/hh5KO+miBEF7GM4r?=
 =?us-ascii?Q?Qhg9qZec9MCl1ghMp+Pf0cP2pRoISK+7IF+kkJewcupB9gAqLcj5Dniq9T+U?=
 =?us-ascii?Q?E2Tf9uejmTyIOoepw4OAIHlAoq0ABPhnqLhIfAm5f549DJ8hS7kiahP+T+gx?=
 =?us-ascii?Q?EypTLgIx8UcGvnIOvkV4c1IZ2Dcpw7cLf1a6Z1YmrWCh9NEi50uCREH1a2Qa?=
 =?us-ascii?Q?68+fGvQb0jpgk+ZlKtyG81fCGhp963QrvcjeTUBU87EACE5LdX17QP1bMQ+n?=
 =?us-ascii?Q?kHQR43PDBpeLUGOWwl7QK+Yir7DyFlY9bOfyoZuZzgQuk14ADS2xloB4qV2S?=
 =?us-ascii?Q?GhFHfkQ3aUPQaDOP1u+8muGRKRhnXHpIG4/Hu36XIP9/145WDF6GkRxllJlq?=
 =?us-ascii?Q?cy4MXak4SSoP8UKtTJ4+s3A2p9fZd1DYKs18H0ReBYV3lZrRjsc0/XZCNa2z?=
 =?us-ascii?Q?hexHDXA4wpATsdcw3pbryzAhoYwmeRjgYzsi9xEvKx64cvtoiWS5Nar2AAXX?=
 =?us-ascii?Q?9t4qvRubA1d56MMJpTPOnHtKwn496WEkMzLBgQ/5rh/4+CKOSS+8a+tbceFq?=
 =?us-ascii?Q?BNnNBF5XX1vY+c6ZJDaJe7tJ8xcFUledU14l7N2rVKX+rrgu4UW84X0ev1Gz?=
 =?us-ascii?Q?dyi0spQJuzlKEkmW01hEjbylubhXbIwItohyLH7K/GK6z5MXDRL/bGw31Nxn?=
 =?us-ascii?Q?HqCyKpBUxPqjNI5+1B6tH60oanZDtiZf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wJYv+pZUGIr7zYQU/3oM1j/jjPKU2t2bbJI/hxTL0YP8qNdDqdoqT00muSw4?=
 =?us-ascii?Q?6o+h4Bup738kxUMRRQ6/3HyI55yMIWxWJy0ZZZ85ofMRmdxSKYszDB3bvzKe?=
 =?us-ascii?Q?lCYyfnVmAOhZj2JP5PQgLkxoCcoVyu+/r1AcfzYmwzZaelnTYyBSZTzlMWiY?=
 =?us-ascii?Q?YeqvsyNJ/66uyoGR3eI9vXVUZtvF2uJ//FK3WGcLZNMHx9TmqQC39HOu76yg?=
 =?us-ascii?Q?46xeE1q3cGuCB1uqtjOyJhSPoriPBe3kjoWM1Rz0gYdCMqUIGKnrPabTkiLT?=
 =?us-ascii?Q?RF5KygY27AmHmspX/21mzatPPA+rtbaTFSitnEzAdgZ7f+Jrn/gMCM/TklzP?=
 =?us-ascii?Q?7uz6gc5IFpMSN892bsK8rOuoS4Z1PRoDb5ktyB5/QpNiRTf2h4TRzTZi0+1/?=
 =?us-ascii?Q?fGjQyU9zDNK8fkYmtMtw/86dBk37+MfYe4WdYaHC9ws+raooyx6TJfSVe1en?=
 =?us-ascii?Q?jsmVUTMniJEZhLtBdU7aLsQ0aXkn1GBzpVJ1esB3F67BT4UulojCdm7CcTz3?=
 =?us-ascii?Q?+W7WM/e7530oog8tjcGQzQqqbjmI25D9inx+sGwC9rvm+QrOhhz9rLCFSldJ?=
 =?us-ascii?Q?J3UY9KKXUSBh3E+RlVI8A4IZ7w1Z0gbyClHuS8R3qhZhFxUvOKSmO2hd1twY?=
 =?us-ascii?Q?j7xtdwwycBg4H6Qr6UO90QVVFx6Qb27+zEXxRx42Vo8SbbsjH/r5g7RA1kQD?=
 =?us-ascii?Q?vi8ombqv42FQpk/0Ji/ZE9Ti8H9AJxoyA/KnHgLH7nfiHKW+z+UtmqAcCxY0?=
 =?us-ascii?Q?hIM8IlHElLjTiSAJmWmAfn+PAcJegFpHongrXc+Dv5PicCP0+ZheEK/rVkr3?=
 =?us-ascii?Q?pwixkW46yJg/tQDfaYV9nAkYNZ1xCcbakOQPE+Apwr+FEYc2vPS48oUU1L/e?=
 =?us-ascii?Q?BpTeP/CcNkuMyC/ZegfetJm3x2Ib4o97am20GL1qZWeCHgogPVu9LhVOvKLK?=
 =?us-ascii?Q?KRhowxa/HGB0f0FXJ/yn7T+0vaiUB57PAwhdEw2hHdka3ZPk8fUf5QcRxzy6?=
 =?us-ascii?Q?0fBM+QpD5T/EJ7326lhi6uBhEa25q69CjHsBN/bgpazW2lOYv1kTJZ7nsZSP?=
 =?us-ascii?Q?CgYPBy9cgQvRc+JoQdOwphQhbyQyogm4rv8ENN8y2SVZydlr3K0XfLfbZQZF?=
 =?us-ascii?Q?1nT2gC/r1FsIqmNEJwh+wMSXF3sSky57xRoIR1dYvZyyJYBJCgUUXorzCcnV?=
 =?us-ascii?Q?dBDuT2HOgFfOz2QCKRBx3oYpufubkIXBaebaOrsO/eUrzl4tO72RJsqx2RlL?=
 =?us-ascii?Q?eJAlcnlHC5leuipfWbPu74L0OphssW02AAj/cuTriPyiNLtnNaaNJtqQcxof?=
 =?us-ascii?Q?GFK1tGEV99vga7UD4DIycpeYJrBUjXFeSFWZWGxaZfXH8Xnymu2iELhzleCF?=
 =?us-ascii?Q?x3EoxrTS0vfi4fH0UVFbV8F+JTAuBc/q2MdSi5Gv7SP/bL31E8nIuxCZWjrD?=
 =?us-ascii?Q?NMQgqc1Jp83ONY95Q+SmDwQIy509P7SkpzaLVAHxDp070m1yS1l/dMgpv7IL?=
 =?us-ascii?Q?/zf5E3h2c7Ruqj9ZLxSPPZfNntSILjNt5stW9jfKF+Ao1no0phSfLwC8AqFZ?=
 =?us-ascii?Q?NUCoLId9F/9npGk5sfYEST5rcOS/uMLUV4dOZYmC7hw5nscrZfL+30viJbSd?=
 =?us-ascii?Q?5vZN2k9G5oaESedgYYwbesI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935c2822-af63-4f28-08a8-08dd33cafd21
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:08:28.0724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEmga0DdWq9BF3FfbK/jAXNK2/vkFr8H3QYiMKIxDK6lpsBbF4jt8TdxeenmmItWCXb1WwFYmOya8WR3Ealt6wa0l9y+8czHHaQ5zwL01swVmuq+rnKKKiGPYplZPj2b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7785
X-Proofpoint-ORIG-GUID: VSteYraDwo6-v2f3yxioe4un91-0Hkph
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=6785023e cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=6dGOS1gDf5vp_lC5mo8A:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VSteYraDwo6-v2f3yxioe4un91-0Hkph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_04,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=769 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501130102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209714

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

During the Rust build process, multiple copies of libstd-*.so are generated, as Rust copies the
required files from the stage2 build artifacts to the target image directory. When these build
binaries are copied to the image, Yocto's do_package step encounters an error. To resolve this,
the redundant libstd-*.so files are removed during the do_install step.

-----------------------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for libstd-20c3de2d9292cd03.so:..
....
-----------------------------------------------------------------------------------------------

Multiple copies of libstd-*.so are generated during the Rust build process.
The redundant files are removed during the do_install step.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.80.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..b583508456 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
@@ -294,6 +295,7 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 addtask do_update_snapshot after do_patch
-- 
2.43.0


