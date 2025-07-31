Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8A2C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 07:39:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56192.1753947594446456862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 00:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0307effeff=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56V4SlrV724330
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 00:39:54 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4881ger47v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 00:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwTvCk6pRDd/lWp4KkQvnzr9yYkWFAr10HSYjQSpaatk7O8IibxLByghSGRWIcDGimvNcA/kUL8hL6IEqFLqjol/giEJ1iWi5YQTviuRy80Ufz82uGzhzDMKYARlmhgUZI7oslW13NgCEHb0SEXc7WHtdSi0lcvTvpDaTQKmm7paNBWxSMv3PEcLLz1NG1LXpYO/GslDPd744FLWKZ8rF9KRb3vxNpWPREKDiDYH9oPsj950t9ckXkZUVLqikR5YB90UpJLA8lGQkkmFmaxHaQLnOe7aGTId7s54YGezcB0xcV2j+CDyXr5h9lhCcrCyuy82KFtBHLwoZrlO8BoSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HENrSOI3u+cB2o+lWGbltfOa2XyjxCIxJ03qfTKKxXI=;
 b=mhLmvBZRMIAwQo49XBXhCyZX/kppSlSP3m9DSvzrl4GSWxsex3zFWlbMdiWrj6hT5nQJUmOTXy+zOCREb0c+yWLjkKY/EGtKQpZ4MNrcask4Zb5gm+w5JR4yjmFEOlXbryHmQxwFmf6nuLapzlkpEG7jJvuG+JF3BnieetxBeVL3PjLZVX0iOIUFrCQIXnWibdv8jfIP1hUX60PHy13bAcIHhuaksIQcIt09yKzCWh9EF/AS+u282jColBnkzB/iIGNEBkeLguvjk/txczauipmLG62vD5PayrGd6kb3RFZquTCiB0Yu1ETSd0twrkfocmILTZpv/Z2p1GlwiVbwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 07:39:50 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 07:39:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH] oe-pkgdata-util: avoid glibc-locale being mapped out by glibc packages
Date: Thu, 31 Jul 2025 15:39:34 +0800
Message-Id: <20250731073934.916831-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf0e5d8-5bed-4f6e-4757-08ddd0056e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZxvV5N+gXhMllW/yRpQ18OFg6MGlY1oF/7H6ueYxN8fnQwx22RsrsHAYlR31?=
 =?us-ascii?Q?HpOUsAMWJ92GDUFwIGm78p7ZrZ8M6d0T5VRM+TXBioR9yBSpiumIfrDvrB1c?=
 =?us-ascii?Q?ftzUmPf5wqOF17Qe/y0ZdRgMQJ4vVRtxHIMI0vyGFvWecGxq19BV25rlZfjs?=
 =?us-ascii?Q?eL6uKCAch7TYastrtj4rpAXY5WwZehIgONx73RYGt7a+EzWFL8efpyR8SDcY?=
 =?us-ascii?Q?UJziB6VR3eZaXUpwChk4JPte5hnsw9PdaOEy6Tb37LAbtKZE6g1ClDhK0k/Q?=
 =?us-ascii?Q?dheCyC1Ir7ynkGmZJir/0bxB363xR4tK/A4vGiNwoDkcfYkPToZ47IuO/AqM?=
 =?us-ascii?Q?bUIu8ONNRhOfjtGDUnQdh62/sy8BcXzc677+QGk7KloO0mZwZ2+byOv6spvr?=
 =?us-ascii?Q?4oDNAhGtYB0z1EbybwLYIBKYia2hNfqZGbTk7KXIiTKLAZclKNDEOX4itIS1?=
 =?us-ascii?Q?THOQissM7o/0Dd467JJAttCveLbNr015LgeGnY3etGiekIVEd0tBb2Jic1jh?=
 =?us-ascii?Q?EzNX1W5UGGffkUQp5dbZQ3YAlwfUPBwmDSB5BPh3Yg/TE1fnBdFtL7yV2BR6?=
 =?us-ascii?Q?xQExOMpua5LVtHPNKu15pnUQn5y7aO++F/bDFKdGDm8Ajo+pJ8Ut6Vj2ep0Y?=
 =?us-ascii?Q?OZ4hKKn0wHAv5Ne0UcsvpIb+h02f2j04C9P0lzgstJGHjFcBG/a5q56iVd5x?=
 =?us-ascii?Q?xR5nCn/r2VNewsHW+1KY1ipp4FbfuKvdaYHtAtSW91JTrKyvWQfdGJKunptS?=
 =?us-ascii?Q?PW/Zlx32e/onP4g3xJTwVL1+aKWjBMj3pLJcAO2OXrL0fAwLr9u8C0W2fgtb?=
 =?us-ascii?Q?LniC4RFvOLZU3AFtTjvu865/hnLqFq4Wr6PJWDub7ZWDoDrm0wkXrEr/RFHU?=
 =?us-ascii?Q?Dlx9+qdYlDVT4P+q78ADI/JEm68aSOFYLXGfQFKjVT7p2qwqOTp6FIWbqrJo?=
 =?us-ascii?Q?93o7SZQVhpskNbcyRX50+3+Ikhrg2CeRV+8G/SBeMIuMz6XWwreikEBrhOFe?=
 =?us-ascii?Q?TlNdzWi12PWXPxN4HxuXgn4qhjRLfBPaQQWHfX3ON8QB6gxmH3YqPW4rfVbm?=
 =?us-ascii?Q?a77u/tXOWLsH4aUc3FDuXeq6b6sKYkbvHywVDHCV4OmUv7+0U/DkFgmanDiT?=
 =?us-ascii?Q?HN4avAT8ltrxHCS7SPZYm7zKgLx/McZwtXl3se58eFzmawMBtXRulaYN7d/N?=
 =?us-ascii?Q?KLgkvlCtSuVgBgrVVlmWbKLklxbQUxFXPT4HolpxlG1ZL9k9RZAlq/dVfWQl?=
 =?us-ascii?Q?4n6b7JfVcBcREaI3/l7Kt3m6eoKgLtMp42QxYhhHkAEbFpvVk5rEm5VXv6rX?=
 =?us-ascii?Q?rZZaXj443grEkTjwQMVsMCZyjODU2+kLokU4Wp4snV711zBkSBD7EGfq8pvT?=
 =?us-ascii?Q?rG8c6oMTpYaE0Rcf2r3BXoUJiBFR1l0+oSHBECA3TQQrEQHv8GfA2ZabnphS?=
 =?us-ascii?Q?m15sa1Eq6XsGHaWu2M4uuQVjZgPN7+S9GMV19qFIwZEROt940OZpyw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oMA55VQuCi9DSM/hroN53ZNskpdVAj1Av1HCLSsURAMAwg7wuBsytJ3tBg3S?=
 =?us-ascii?Q?bddoXrWnmbR1G206xLh9quYqOr0a97YcXDVVZuJtdHC/8ZCmNamkGwgcVAHD?=
 =?us-ascii?Q?AUQa3QJRaqOQMuNv3ts14Fi+SOp4tovRukLUOy+HAqdbegxydlgeQ71SSKz8?=
 =?us-ascii?Q?1RHEPjZVUKmuybFzNssWgAWwhsmtn4pJYCp6/Kl1hJpy0ABc7rljuSHT74vS?=
 =?us-ascii?Q?Gacr84iqYx9571ZCxiBc1xEvzkF+G1M6zC9Q+4Rnw7mh0QjyHCvjW/77Rj33?=
 =?us-ascii?Q?SoSRNgWjwCGSaoOiJ4cmuZWfKD9+i6i8+QXVl0SV0DiD9XpKAsGLl9HtditN?=
 =?us-ascii?Q?N4JnSZSM8iKcIwHr5LpU8aIkWh/N/wXQj4ZjFYUxaMdKM0UyZ0ITCE5TLhXH?=
 =?us-ascii?Q?P++aFsJO+TD5cLuPkTTjbYHE76VQN2REIhRLAmwJLP338wV6qdn2qlddc66x?=
 =?us-ascii?Q?l7LihHy0cJC45dM7ujYIv0jshdWK1LKexyzo1W/9iJ+e3IIT639xRuPAVtwg?=
 =?us-ascii?Q?nwEz0dl03QlXTc59r903qtvlrV8gnn4YGyYW46SxPmLO+eXYRFdJRMAmnTau?=
 =?us-ascii?Q?RmDvj1dmvVSDXJMbg97+U6TCPxLSJr/fzeM4gZzA5T4CnFAI8GZwAejHB91P?=
 =?us-ascii?Q?yuUNHT3w4ZL8eSawnE5PrfXPcSVQvTs7pCIJagox1+kzYyANaFCcxcaRYav6?=
 =?us-ascii?Q?dKzb0TFDdeXciYJ5spZM9B9eBCYAEmincRvUUp98BdW3q+M6GduqHKuYVX3J?=
 =?us-ascii?Q?KFPb4dFCnVYzzdmxpYGWDdO9OM+bHbavGXIn9op6u9Hil0Z46OWATALkNhvo?=
 =?us-ascii?Q?+xl9ZU7geEEAaPLKUBbfUVUH/7UhVM7GAFai7jFTFPWJtXTb0ue3IPCL8/GV?=
 =?us-ascii?Q?1sinXQRrW4uCO0gyytnqmOYugrLzxkO6Egac4qNSis2Q6eAZwxVzoRo2G6Ar?=
 =?us-ascii?Q?XwrttxDDIeWNGOzca/OtG48CtEqPH9mAfrhqz2PLYCwZjd74T+BarvNTZTr4?=
 =?us-ascii?Q?HLo5jP0BYlp0bMQg3ryH1MzKdo+D8K54WY9/QSTcfgYYjhZ9l6Il+5wpt7xr?=
 =?us-ascii?Q?BoBZDgEhE9VsPPVJaXRho0WPN1n3IxILoKjO9kIXLPkCaWQUW5mmxrhEVUwa?=
 =?us-ascii?Q?G914Ywbk72ShmlGfO18rbLiFNgFL33HFax5bW8wC15OoWMYlVfrC2L6nRykF?=
 =?us-ascii?Q?LRrFGmkRswEPJMaynI0II7tLG3/1IzcQY9u0WViXoROryfolF/+qj6aVVqYR?=
 =?us-ascii?Q?NXf/Ri+rrCV0qj3dYSlqxKixjoP1p3WGGAr79XheIW2jFwMuLjJ6+7BvWyO4?=
 =?us-ascii?Q?v6qBjU37rRPXPo6y5yKMI9hy9rzsC5KhfW2TUHS06uNX8WdPOwcthMAzfHCX?=
 =?us-ascii?Q?62rgiU6dDRtRd1x+uptB7SdTRgveFK3XipK82MWfNX3noorYk/6npgfech0B?=
 =?us-ascii?Q?KDY5xpOvkSPmq2sinKYa2gs//RLKYtbw82G/MuyYh9AR9QqCggzZq8TbGzi8?=
 =?us-ascii?Q?uJctJ+HEDzz6BOAEkQTla8fGYeIeU1TVcqT8jOcM8soA20PCDo+d7M2dIIDs?=
 =?us-ascii?Q?TW8eTsA8gILfdFjLQmKi6FK+WQlHD4RoBDboIKv0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf0e5d8-5bed-4f6e-4757-08ddd0056e43
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 07:39:50.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYKzIU+OOfxNuI4QU996HXLy1oa4Y++LOA7FwsDrS3q5eXn/a2gODfYbaQUjHwcVkkUyt+M7Ie1OqoU7v4U29w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-Authority-Analysis: v=2.4 cv=Cti/cm4D c=1 sm=1 tr=0 ts=688b1dc9 cx=c_pps
 a=Fc+powxz0z9PvbHcotDBUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=D82hjbkxm0GsMeQaPhgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA1MiBTYWx0ZWRfX70pu3or7N+AF
 XlQ1vD4kgWKo1ICxUQEnzSg69INP/lWO/tJXJW1QQhoYdWsAFn0kJlpseQIStxdDwP1GFB79aXI
 niasIWHjYImBt57hUQ4o/U3iCqSbXWK1aZNQ7Bk67Rmq5JlATiVNtY4MDMYIHeleP3p01iWrCCx
 ZkIm1D47xVUNiwcGermqkyU1mxWis7MVriQwwGekMgXUMnkM6omMe9seKSLLH1jkVJjJVran2om
 R2ExKcUm5t939Koj3U9nIQhHWX8CeyDfcM+L/ldAbXdSCnYIdmAakZdJ2m6jvPLw4/NzXbrW5sK
 JeGKutyC45vpSFjpFfX2yv1UbUrr4SsKEDb5nxotURdsjJ9qjtP2Bq1yPtDgH88NecvreRwQAl4
 e1dF1bid
X-Proofpoint-GUID: 7MddmiWdTF8JSoUssVHCtclCBIUDUP7u
X-Proofpoint-ORIG-GUID: 7MddmiWdTF8JSoUssVHCtclCBIUDUP7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507310028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 07:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221175

From: Chen Qi <Qi.Chen@windriver.com>

oe-pkgdata-util's glob command will output different results depending
on whether glibc-locale is built or not. This in turn results in do_rootfs
error when multilib is enabled.

The error message is like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Enable multilib and install a lib32 application by adding the following
   lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?= "multilib:lib32"
   DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
   IMAGE_INSTALL:append = " lib32-sysstat"
2. bitbake lib32-glibc-locale
   Note that people usually don't deliberately build lib32-glibc-locale,
   but they will do world build. And when so do so, the following step fails.
3. bitbake core-image-full-cmdline

This above steps are how to reproduce the issue in oe-core. There are three
steps there. So it gives people the impression that it's not easy to reproduce
the issue. But in fact, with some image, it could be reproduced by just
doing `bitbake lib32-<image>', as long as that <image> brings glibc-locale
into its build dependency but not runtime dependency.

The problem happened because do_rootfs will first form its own repo by finding
dependencies. glibc-locale will be brought in because of IMAGE_LINGUAS. But
lib32-glibc-locale will not be brought in. And in install_complementary,
oe-pkgdata-util will use its glob command to find all complememtary packages
for IMAGE_LINGUAS, such as "*-locale-en-gb". Then we get the above error.

glibc-locale has its own recipe and which to install into an image is
determined by IMAGE_LINGUAS. So let's not map any glibc packages out
to glibc-locale in oe-pkgdata-util.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/oe-pkgdata-util | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..9fb7952c58 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -136,6 +136,10 @@ def glob(args):
                         logger.debug("%s is not a valid package!" % (pkg))
                         break
 
+                # we don't want glibc-locale to be mapped out by any glibc package, filter it out
+                if "glibc-locale" in mappedpkg:
+                    mappedpkg = ""
+
                 if mappedpkg:
                     logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
-- 
2.34.1


