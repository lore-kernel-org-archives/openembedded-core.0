Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4F2EFCE38
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24362.1772646266687946064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ch26+kgw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624B9GBm2764162
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 09:44:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DgByyMMAIcaV+6ev0IFT96cFaQdhrJ/9dAYxrVnPgxQ=; b=
	ch26+kgwY3Od7MSobHHIHqD4y1AVUUebT+9kHNAxMoxzfNBCdV5T6dZCIrmgMmpJ
	xV8Xi0x3FfPevHXNQHn9MYDCAno6maD9jj3DUrjJLLXMscvs2Vp7waf4kaRBLeF0
	t1vZtUHCktVEECfRk/HJrgQraMiIXvELr468qTYCq/VeYZ3kPoXKPPFc+/FTtGai
	lD54XlWv9jxQxnTo6sCy5U3CD4dmdchtSXhPsf47PSGm7TCD4R9UMySGHPY/VQxs
	Ldpvq0pgEWlGeJY+uJKKcxpPBGBp9aTxp8s6gV28F9XFNpzsD0MOjLd1/CMe4HiD
	CZJgqlCRUhLP4AMP+PYCjQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh454j1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 09:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBlqyeNwUdJCTcgrfdAXVQ8EXG2VY+RvfW6pJu7d0I7M0xNPP0PhtoUksk/OpfekMKhuNCLdrL5CT9X//zcG28jCtx5dj4OavEgEhbnmcKZytIVDZhF/KC/QF/g2k9358sBGOjpx9xvAS71A1PLum60fzcxe5e/kjzz/RoXLd6n6neKoJKLfkVdPVX+eZcB3OaYpWE37qpH3z3rPwGimuY+fEp4m07kfVc0PmDays13nt6oBqL/QSahWHl3RH4gaYC2LTizGCVq5yeLgvxfWxNgkE+79DXXbhrnX+6ky4EOxa+9iJJQaQ5XLg1LBUoqAFQBK4ZldwTjlQ+toticC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgByyMMAIcaV+6ev0IFT96cFaQdhrJ/9dAYxrVnPgxQ=;
 b=pV0wi4lusHrw6BiK+cfmOajhFvujTnhxIB7W1htrJIV8VuoF3rFPz8Ng1T/jnrpil2HwxRogRr4czzi+QsflbHK3CEgUXzLZGjiLG8kDBD1ROuBQbCHZTDw4vD344ViDSf8+/Zu1b99RE4QVfRPyb3O5Jr9pr95pcaKniNINhOIRGWfb3J7TRuLkzvJzGcVmmPPTG8zs4ZKYrqZv77o613AvCAe2JOKypyINIkJ5LjoCqlCY0g63BI0fmTObMUFtC8dHfiPghu72DpwSJ4j9lYvMBaP4CcZHjkps15rj2AG2njrAm2Q2lLC9K8TaKHbeiG8a0iNly7qcsx99VNUXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA4PR11MB9396.namprd11.prod.outlook.com (2603:10b6:208:56a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 4 Mar
 2026 17:44:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 13/14] make-mod-scripts: fix for buildpath issues with rust-out-of-tree compilation
Date: Wed,  4 Mar 2026 09:43:23 -0800
Message-ID: <20260304174324.1186644-14-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA4PR11MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fc5fe4-f96e-4c15-c550-08de7a15ac7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	br4O5z/3lLymQrDQgYEPyL6EPNqyvXgsn1JOiHRkqGlGtdj7irY7wNt4incbVE7K54OME9H/118SJaBreBRdsRaVDBpOGOiXZKPC7EDreK3znLjdcy1dj0+S3aBToxHpYjk/jO3n+CYkqPnmAqt/1YatXR/3nbFjY1YLHRoa6kOxMFRmFhpYQrg6t7qje5SDzR6+4UdUtSsyn1edsKzy9ibkRY+9sryMLjVNBnaIXv86SllsXwCEnqVXEa1+qJpPy2S/o3dZzpTn/gjgvX4KENZpuu9aPuXa2YwYhbTQrwYcutyAFLW+67VBWJ5qdk0PNQ3ppPTOOQ3JY6tdKfcHzUchjFjAJtZzw/iKL0JKaIKG0E4d01KWuBK3siP5FOK02VO4+vvnBMuJmubS6qNhDyIFZOlheJGcw/pvhcduHChtPziK9AA6aoyNqj4hrHQyiMBcxNpGnXkAmZepOU0+wQYIftp4Q3UzwWH1RHprHpn/SuBXiDQunmXN1vN5XngvhXjPO2fl/HDwTfSno7iVyTUJUcL4L4M2NbRlQ3DIbKoIe4TPKm9HF8uQz87IvBxC7R2dshpE++rofeImZ4o6/sHNIh4eERQAJJiNVTkCzFrssw9zLpZ/zPpI/PWv3QZygfOAQEPvDub982s0VUsgZnh12MfZhX6cAIN63aiiKPM5IP48qq6oazfDY9p0F+RDkux8U4LcN1lpQ+re1dkm6RMnwsWU8C3FOMXnWDHueJQ8DOVFXVg60b3rLy4CYyLB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jZd7TIc6b3crpxHEO+cVqAglXdC1Dj5W5XSFSIYHENn5JNxII0b6Kk34A7bV?=
 =?us-ascii?Q?3AcPyAhIycrN+TxMD62Rg/uD5rXaQU2M6lKqoafbt3bm84VLF9K4Wht2izUw?=
 =?us-ascii?Q?ONY1RPIUJWULW0XZh9pDDpBybpXxtCW9NIOETwz1amAmvWLeu1bsNEvCZC2r?=
 =?us-ascii?Q?QGhmRZjMNyzfijNcPVVXsJcQPq0iPFXxWafOPzLFss8+ehDMPxIcyk947dB5?=
 =?us-ascii?Q?YGcVlHH2m3NBIiu9ogGp1kOKQcV2oefIggKHv8T5z77N1jx+EOBnnP7mE5kn?=
 =?us-ascii?Q?UKJ58/ygwLEICZSdzw1ZIusbZFAyCIhjOL7eQ1PrwpPmJaLrhBsfPqGV0fo8?=
 =?us-ascii?Q?L1l6XGw43jQ4QCx/Jr5S8B6FAOTn44er1zwqaYYled+GdSlg0SzFoqX40Ikr?=
 =?us-ascii?Q?LzoEQcFb6zWT0p8dPVVpzH3r/D5IL0Hv9K4MXoqB7W/8Plh1Fwok86/1KRYH?=
 =?us-ascii?Q?TLvzaato3lg+lqyH8TqZIz/iG6tMaTOAT+0QRMoa4Z6fybVJIHX5SqY/cJD6?=
 =?us-ascii?Q?iB+WHfQrOTYDxo5U+vVcoPowx/Vu/q92sX8w082ZtBvi02e1PLCnkEXuARgB?=
 =?us-ascii?Q?x4KOLMLOJ9qPab16iH0GW4lg34hdMM80OuF7BRbjh2+kgOyUTNPsLDm4KxIJ?=
 =?us-ascii?Q?kCmf8k2wHQql7l5jbM5kgYozu3SOE/u+AVFcisvQlADuHY1KkLgUDmiue+kL?=
 =?us-ascii?Q?QhkjccPef97hkTFDT+OxL+jTVpD+eBwaO8ysPIFKuWCvOgC42G+h5qf6b6A8?=
 =?us-ascii?Q?V9vxlfHr+fbVCJuwWf8eiQqgIfbWCC9zxueaW+Y8+gkzKOZVKD29DZJbHp+F?=
 =?us-ascii?Q?vaRr6vrXEHBwxtuHafqqsj13iQb5ZSVbxLZDnIYYukmgv7TtVDds77Q403mI?=
 =?us-ascii?Q?LzZ3CNoxb0RVksF2aBcr2yZclY3Giuz6da++wVSC6mmN/Dw3OGYXhirrmwO0?=
 =?us-ascii?Q?e0Pgd/jU9kdyy/BH0w5nX5omwjSxGr1FCt+qXWTTySmzsINyr3P3J0RM3uHD?=
 =?us-ascii?Q?tD30/SDtFM9QRXwtHKSE6ogLjzuS7IBvz0ySFUNhl0ZR+ezmfz+jrodMqL76?=
 =?us-ascii?Q?o7ZlYVFxGbbabTBYI2/B4DIidSKy7lbM9se2ZsfMtG9NHzjHDg9tIsPrRBaI?=
 =?us-ascii?Q?g8U0J1r1vfzo/j4zXtewVu/F9jFz1UZO14n4DeJPyNPbjc59N5NW+4lrKbnE?=
 =?us-ascii?Q?oHyYX89eU0TQhC+I8KPT2Uomjy1+Kr95/ALzN4SXmk8a3blqeA+J0jGpXErv?=
 =?us-ascii?Q?63Zgffwy4RgRcxaumCBrVuoDaqRLethzwzqCuWG0nypMCyrNQcaK+YRK24L4?=
 =?us-ascii?Q?mVAXim5PR+iuo14CjpGo8f27zU/c6FdKgPRfdHu5d9fbVpdWfD+EowMbQ3GE?=
 =?us-ascii?Q?3wu4qmK29qVZgysBcUmoY7QFTlOY8oqg6c8fQP3jWCb3ZKUx6XEus5QAk2Ur?=
 =?us-ascii?Q?5LceFrxqkY7ni/uy5x9NxdE/0YJrBrSWn42AdKWUBrpR3O1xXFrAM44aBtvj?=
 =?us-ascii?Q?k8mn91DiDqegKtnHrBJffh+5EjMIbQ5L1bb4JUw8qwkEUcrqxLEYSJaNfEet?=
 =?us-ascii?Q?aQsqjg5YxIg9iDu6oHfgsNnuMGQzvlpR2bj05d7tFeUu0tX2kUg2SkQGcc1i?=
 =?us-ascii?Q?igMF13MOdgeoJVoAFHEo/ldjRE0AO9yWvhREKD9KHd2GZA6MPnGMFLVqQ6l3?=
 =?us-ascii?Q?ugxpcEfkkFfN0uG3vU5Ok9W601obfcUWmBQsR2w66XQpxd8AdGta/tGV4Oxt?=
 =?us-ascii?Q?FzehAUQBMj5uZoddBkGsv3BGBJ8nzRs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fc5fe4-f96e-4c15-c550-08de7a15ac7d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:24.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvvXH0UK+fMpp1Aki50k758yblioYIoGpaDdjNyKjDtIOn8UcyV9oKrM8hsgeNoa4jOz96XRHEvKPCAPC83inGPXGywd4eeoL2vnhXlPSoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9396
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Kz4MGalT7Oy6XfJ913D0I6anB4bmUPiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfXxzVI5TnSj19b
 ABvXqHVZ10jbW0EgLrQSckhQ5IfKipb5nivytHS+YbfxUJu3QW4Ua/9CXzwFRt899PRFB0B/69d
 +1IA+4UJ8TK2lfFLNE2IMqj0nLmbM5Kae+q+smz1IwqlSKZKpGqKXPuqFoBDj3jGX/5N2n2krs5
 kFCrHrc1uZttbzEQiDNslE/Q1Fd3MYsr3Iq2O6e/cqKN7d/qcOap0owS/67uL87KJcVjDSMgArg
 wLtpCK+aBhnHNp4b5mxJNWGs5tedAAqrwqRtRWTldwAw8xbNSEhcON/myLh3MzVGs2h/5J7Td1g
 XUFrpfyNJ2bTZqm+yhXPbPZG1wW2wt2O7KWf5kPoEkenUXHvBYNAkq4JxQtiUGv0WBLQ6Gqipim
 G2BPaRcgbnIJFoIKeylpY/w2dv7GF96WwrP3YTbvNYjlsoAim36oVqEmlLzfOJmrD6xeMsYGYbB
 ZzGuatxNEn+E7fmQuJQ==
X-Proofpoint-GUID: Me80CHsqunk7C7UvHbDIO30tkqyZYCUa
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a86f7a cx=c_pps
 a=RshLvFd9jIxZgmNOnSXiNQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UhGsRKG8cyjctxJ2D5cA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232429

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes buildpath issues when compiling rust-out-of-tree recipe.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 6226382001..2de7d4976b 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -43,3 +43,10 @@ do_configure() {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this
 CCACHE_DISABLE ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', '1', '0', d)}"
+
+#Fixes buildpath issues when compiling rust-out-of-tree module
+RUST_DEBUG_REMAP ?= "--remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+                     --remap-path-prefix=${TMPDIR}/work=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = ' KRUSTFLAGS="${KRUSTFLAGS}"'
-- 
2.49.0


