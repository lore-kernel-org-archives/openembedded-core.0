Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5603FC5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 06:02:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1544.1787292168072989557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 23:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dC4f3xhG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2693bf50f9=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5XLqT3030269
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=1QlCwD6gypyHFLa/lCF5
	KzdxEchj8AhjP0mMXuQbKeA=; b=dC4f3xhGTU1P0AUVOTdyVoZuQ6bYdquEnXjB
	kFWjcugvexO1jS6/MA63FKE/FXLsCZqwAqhxpPgCLn1CqSDC1c4/j78jM+n+w4+b
	s29Tg59sx7FXQBYye4MvUCVy8dszEJ99exN4B0Lq1eprQGu+93GJCKWwu9Lj/+6p
	/9VbaTewCDwCTr0E/ea30ZvvCQVfIuNZwf+BuIVsL/5g/AWuo1mPXfadz4lL49Yq
	ASx1RSxIFK4mUEUiI5I79Zz/Vq7yak5ppM3uxnWTTz/SGmvthmAJGktP5/rzjEHd
	JlFlTuvJh6JooqHjUHYbNQepSJiVniFqt7hrTBm9MJCARcmGBA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023075.outbound.protection.outlook.com [40.107.201.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g6ckm87x0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:02:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvI84i4eraZKyqmRDn3UxITjc1ZMLWAH6RcmZF4vq6g5zRsIKUtmo7YxwKOvkFBOseVi1/09Fnko/E/D3BSOZ2HYh7cOpeWyDhBxPsLdXfGaCNCj93HpuuxYAwPFO4HMJ5Yl4x6W7mYsKpH2iUWeME/QzgJJ9s93Pbt54QuprrcU1fAfuEltoAM1xEWG5X+7FCqNNcDFtsJezDq6Ru2ELy0DbHJ7MzF+bWTNv0WsnMaMxvvzMBhUqZJRrF6egLCMlen6/JDtdMtRixXjxO763gD8zEt1Z/ZhRhfl5mrtODwP0N3nlAQm+taCOZmV+7W80/bZyAH4cmaA0gv1lUg1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QlCwD6gypyHFLa/lCF5KzdxEchj8AhjP0mMXuQbKeA=;
 b=ds+R2us50f+Zu2oH2vFnr/MEDGt93wfe4n/qfoxhoHNPZgir4IpBAT/Atn6gd5P2DpdpA9NP8+PPhg6ujJRIzCQFAUi+G0oM15TiKt4LO+d+SGB4wjE2r0Ko4WCkHwIjkoVGgxOYgQ6VI2KPIojD2D1ojxpiOwrouMB9Pb5mnfg3VT2I32uM2XOPpJogHBBgA6bDZUJKQXUauZHaV6JJuX1L/jkqqU+HvDa6kyyJ2g4xEVzwzLip7PV9JbyOR5uVC3j0mYnqS4PA0inp+WlNiI/DARGT58MQ6LGzjarsiffw+BU3nl8xBLu8vV5vqGP/UMIOZJiltSIqb92g5uEsHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 06:02:43 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 06:02:43 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH] wget: fix CVE-2026-58471
Date: Fri, 21 Aug 2026 11:32:23 +0530
Message-Id: <20260821060223.2156627-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::13) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 276d5ba6-d326-4c39-2102-08deff49d08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|52116014|18002099003|13003099007|56012099006|3023799007|10067099003|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	PJrkXFTKyfZK4VoqsRM2Z7ONdmQf9aqbB8XLepOIXvyfddLVNnB6XGh8DDmEqID/Do0qdrlanL93u0U76kzm4PKuQo7I6C+Jbd4gIcQP9CSTmHWHwHYYRdAJVp6NV62vMt5vZnzoINtjd3hqAM0npRnGBHG6iEKwLz0cIoEDtykryFjaJbp/7lbgQw4Xo5EAFX+ruYoca13iWDTNlxHvSB69KZ7nH0ebNVXFkt5A/iqqk4y5Obdw1QSricHs19vX0AtXlG3F8z3F5cacVQR6o5BEuuJhNUju9P/hgQqLKtmS0nHm0zdnZ2znw+Qzoh4pD853AqoFkxb8K5g57UzKIK0RgI1ZpHbAjbcHvLlwQqqKXA7GIomyj7DTWtALZ8I6vkpkxhVhdTte+RZY0esoIdp9fE+h98nlFbArquqdtCKBvDPRdAkwpESFGUMhXN2HS+E+Q9FWijtHEbg2peaVF3cJyWUiuwSTbIaNWoz6pdKJ/7pazi9knZ7B/G7a/bIVLmmjJzz2bo9KKpFKgB6UxstoJgMEMyATgu3S/EUKyeWAMHV5OGNMav+42dnS87hKdb/pvaHQQWe2YzOTq2p+ZtQg4TwrnfIIGeMWSg+6ysQyD8LXOu0jlw4sH41Yxvw1RCGtFCzNUpXM9GByuw+os2ui5oeJLbiQetaKtCoi4I4HINjboPD+z1ZqROUB6O6LPuBB1PY2w5ZAwVpGt8M717I6W99Pug+QVr/dJaAQJLw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(52116014)(18002099003)(13003099007)(56012099006)(3023799007)(10067099003)(11063799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4oikxpAUdvNGcjxLbPEXtzgPN455CgwqSYyr4MmYyh+nagH28ge+BsiiNjza?=
 =?us-ascii?Q?5ZsAI6jRnn4h4zkTsEOR8OZq1v3IixxN5nYpwNiMHcAKQbbDoTTSKDuEBxmZ?=
 =?us-ascii?Q?C/kiSTAX2g7FMj68UHizc0imIBEUIxUIGOBcwu1oTr6q1gedRVwfojswOsWj?=
 =?us-ascii?Q?IAwA3hEgnMdP6AhQ1Bdjhqa9U6X5x6h+ukEry1Dhm8Iy7R3hBEWkWaLD/wIW?=
 =?us-ascii?Q?YfGMq98H+5zBRjnHUM6VANR7MSbQh9DtSVsA5Oy8tyZxP4xQt7uuKjHou25K?=
 =?us-ascii?Q?g1FLItoMcIiB8M9uXsp27jyNdmbyBFk34/ldoAfCyUXq4zOBY2AUEDzK/pEF?=
 =?us-ascii?Q?h5LVfcU6Kddxr9C4zkSc77pGjI0T2QkhtyZ7mR4M8wQ12szuCpsBT1Iutxho?=
 =?us-ascii?Q?LGRN0rXRmzWPXr+7FmfMpnBeTDSVeAhvclAhYEQEW7f6w8U9oS2b4zc6CHMx?=
 =?us-ascii?Q?jirA7hB2rNPDwg4mPrcmHDE+psXt1XWhCRTZhZ10SHtY7cUcgtYwdbn1Cp6H?=
 =?us-ascii?Q?GNV4DhwenRGQS4q8Jme1XbP3nplbuNyAoYhT3xiUAXdBKcs6WUDCCeCifE77?=
 =?us-ascii?Q?HjEnvqyLHTzijNOjuBvHFVpTqTXqT0It//MugpdELVanNfolHbjZiszb/yE+?=
 =?us-ascii?Q?uJFgt2QrxBMOocxTTjmNcBNLZR5qdxhPhTXpJIedWxo8lqr0yDJEBnU9udTn?=
 =?us-ascii?Q?X8Cr2GiFSIxkjmxcRM0Qq4g1zLGEuG7cliusrxpIS+wTDYfJI23Bt8wrS+f1?=
 =?us-ascii?Q?Lc4QWw04kdjwm89BFaZYWan52n0m6hFymFljNKW2i/W8kyH2r4RBiZRy5cYV?=
 =?us-ascii?Q?lnmGv6N5HmtSO4Fl/NGv3KkJJrABV2GkSe2tBgpRNTkAJcneVq/UdbUfMPUG?=
 =?us-ascii?Q?7UtgfVuF1q+F+qggXJc3KCryF2eIZ6xhbKv5EkxFZ9FTQrTfCnfdST4//zH8?=
 =?us-ascii?Q?ymHe+JSwwX4A1H2gK5MyPyZr2/Aj7hV9XSzZQALVnNL39GLlqwRJ6ao/A3DH?=
 =?us-ascii?Q?sDC3ilND1cGewCSTSzUoWVyW+t7Fr+mrliRXClvLRbAnMf38GjqirDTPeVeB?=
 =?us-ascii?Q?gsbzIym253yZlsHTrrCbxVcOy/Ieq7Xy8l9tC0Sf3X8RdZrK9ruyXImX/eB9?=
 =?us-ascii?Q?Sji22mFT0YWCJ9sFsIRV7Rq8ObREIxsB+WU9pXxcxUbt95cxEDaO1IwnN6m2?=
 =?us-ascii?Q?djmnqKmv0t6CBMZRu6a8+A+Kek8MHM3zoKfIWuIi0Qq5OD6OmapxLLgF64UG?=
 =?us-ascii?Q?I7nF23gxawI94kEuDaLGwbwsnsZAowgjL4UI66I0a1VskyefZfqnEc0kEfKg?=
 =?us-ascii?Q?qhksCb/tXAlSq/yqXQE61sRnJ8gT9EYVKJM9ZVxDvBrU9UzSdps2kjmhN7Lp?=
 =?us-ascii?Q?DIrBxcpZAoY7U9rZRwbyuQh1ryt0GqCIX9vHuOAboVpDP5hhMbBGLur4DihQ?=
 =?us-ascii?Q?T5UJLsvltsrWw8dPRRsk8nyTdxwW+UFC6wYJH8MLzgzun6bvcw1lkok1RwIq?=
 =?us-ascii?Q?OIryUIdIJYjRjgRu4daA1XImmE+ByxhVA6kxBON4D4poACfh4mN7jyG1oSJ6?=
 =?us-ascii?Q?0w3iflSse2v9kbeAeIgKW+ERbZ7hg35PiRieeDcJsgLWpMR/FaQoXH4egs0m?=
 =?us-ascii?Q?/so5ae8ykIwwQk0Ug6tW1bR0hykhmmh879oToMacia6LSpVCpg1DBKQ+2lf3?=
 =?us-ascii?Q?HWMVMl4PZAMqI1sf70r2l1znYn4R9YJ+ZhNbghzXN6MFCbleQ9H77k7P6Q1J?=
 =?us-ascii?Q?4A8rYd3rwjO5wKTXoB1CCAIs61zKhhalnus1JjBq5t05i36fB/UB?=
X-Exchange-RoutingPolicyChecked: 
	XlhN9sMKj7/aFA2ww3H3mD+Mf+Zimfes2ZiSJaR2lrqzI0hwXrKYrxBPDJeUgejxBpo57kXMYgvG+stUvc0eQywda5Kxk1TQK4nVmQXUme8ep61ebw5z4v6qh9IYwIxG3n3jVLyTVgdtJQyeJGEx9j2TndOioEKMSnADOi27YD12jMEg67hSlRwVHAyjo0fRNq62iUiz7O1MdXPnXLg1/E0VNqPlOkkezpIsim32+VncZNLU/gAWAKBq8EvmbnkKE3cPWd2V4Skf56Dc6YEm4LK4Wku4lX6ezAuKJd+omWK/AcU8W/FFoizBOGd62uHdwwQ1iqRJefe5PGHSEakyPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276d5ba6-d326-4c39-2102-08deff49d08e
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:02:43.1979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AG7FrDzfop6ytrJsWD+ucXetbKlD1XvP5vCXXtc2vds3t6HtdQwi1nknpHRRGvIW/k7dHYBN8OvAr2IkIN7E86y4Ju6gmsoKxKMJ7k3ePuPB/4v9sKQ0Nl7S0Hscq0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0MSBTYWx0ZWRfX67H9x/iMSPe/
 /CFRVd2bJ2bzPr5eTK/tXbLzBNCRk4Hzw1Ku0J7Ux666kvdyevTr4r2BdjN66fQR90Dw3wcV6Rq
 0uLT6PNqGErOB2SZtRO669nkP9h81G+I+2hOV553kJBP/jpPKOWD
X-Proofpoint-ORIG-GUID: RRF8uceBlZosuP-fPUQFmWM8SjE2zheE
X-Authority-Analysis: v=2.4 cv=V5VNF+ni c=1 sm=1 tr=0 ts=6a87ea06 cx=c_pps
 a=CMChTFI+x3L+VPqXLnm0rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QhM6qkWOIZOezFH_UlMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RRF8uceBlZosuP-fPUQFmWM8SjE2zheE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0MSBTYWx0ZWRfX4gI71uoGo2ck
 QBPcU98ZVS3UKCYzkWdan9GAcsr0l8GOp6PgRamRXMYbmhF/N6bBCD6a/VzSic/jBvaZAo9d5Nq
 2wkZFlk2mlUUP2YGMCu5uc1ia/HI2j2QsfeAkWHcKtG9cA+O8fWHWBqiQidFiNRyRS0JPKKz7yR
 CCsw92JUqczU9HZDoA5YWG38cohE50zEEmivHtrL3CUbhPvw08/qR7zvhMvOcQAFBydkTwFRpMb
 yimAULIilE69H6LqjY/IeN6+GMN9QgnjTxlGZneOP2LBkbI0IdUj0j81iRRt4dMFV+M9tfJZio+
 yN+gZg66QBAtEob2DpO4eQBTo6XV58Dba64mv4IYGPppdUP553vGjXnZwJ4Z5ndkxWQsyos33EQ
 AYXvBV/ep/MVvJd31MFWeUsQaH3MPKzthgVJ73vdBaIJc0VIbY2eWpTyU+aNRTchHjlab4RjPv6
 ztTsxKJwk0RgaPMORtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243893

Backport patch to fix CVE-2026-58471.

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-58471

Upstream fix:
https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-58471.patch            | 74 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58471.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58471.patch b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
new file mode 100644
index 0000000000..2477505ff3
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58471.patch
@@ -0,0 +1,74 @@
+From c2640fe5171c59f87c58dc9fcb195b2d18b010ee Mon Sep 17 00:00:00 2001
+From: Arkadi Vainbrand <arkadva8@gmail.com>
+Date: Tue, 13 Jan 2026 12:22:04 +0200
+Subject: [PATCH] Fix buffer size handling in filename conversion
+
+* src/url.c (convert_fname): Fix buffer overflow.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-58471
+
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/c2640fe5171c59f87c58dc9fcb195b2d18b010ee]
+
+Signed-off-by: Arkadi Vainbrand <arkadva8@gmail.com>
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/url.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 7540e90f..f334456c 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -1614,7 +1614,7 @@ convert_fname (char *fname)
+   const char *from_encoding = opt.encoding_remote;
+   const char *to_encoding = opt.locale;
+   iconv_t cd;
+-  size_t len, done, inlen, outlen;
++  size_t len, inlen, outlen;
+   char *s;
+   const char *orig_fname;
+ 
+@@ -1636,7 +1636,6 @@ convert_fname (char *fname)
+   inlen = strlen (fname);
+   len = outlen = inlen * 2;
+   converted_fname = s = xmalloc (outlen + 1);
+-  done = 0;
+ 
+   for (;;)
+     {
+@@ -1644,7 +1643,7 @@ convert_fname (char *fname)
+       if (iconv (cd, (ICONV_CONST char **) &fname, &inlen, &s, &outlen) == 0
+           && iconv (cd, NULL, NULL, &s, &outlen) == 0)
+         {
+-          *(converted_fname + len - outlen - done) = '\0';
++          *s = '\0';
+           iconv_close (cd);
+           DEBUGP (("Converted file name '%s' (%s) -> '%s' (%s)\n",
+                    orig_fname, from_encoding, converted_fname, to_encoding));
+@@ -1667,10 +1666,17 @@ convert_fname (char *fname)
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
+-          done = len;
+-          len = outlen = done + inlen * 2;
+-          converted_fname = xrealloc (converted_fname, outlen + 1);
+-          s = converted_fname + done;
++          size_t used = s - converted_fname;
++          size_t newlen = used + inlen * 2 + 1;
++
++          /* Ensure we actually grow the buffer */
++          if (newlen <= len)
++            newlen = len * 2;
++
++          converted_fname = xrealloc (converted_fname, newlen + 1);
++          len = newlen;
++          s = converted_fname + used;
++          outlen = len - used;
+         }
+       else /* Weird, we got an unspecified error */
+         {
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index d1dd6a1598..00667a1e24 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58472.patch \
            file://CVE-2026-58472-regression.patch \
+           file://CVE-2026-58471.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.40.0


