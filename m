Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CD0C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:41:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3017.1642214463688307466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=f7tXWBJ+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80149e1e03=kexin.hao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20F2VZSg027178
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=rFUfMoJpRe+Ei61s+O1FojOoAjaui4R7ac07v1VMjx8=;
 b=f7tXWBJ+cl295GRAUoihTDLMpvuSqCt8BoOn58i6DobyWkgR6gfmL+narbO2fjNtrTbO
 wZfjt1oYpauJ1sm4glrBbpYYRcc1MmR7oiJM/4Wdkmx+sc4tNol228wjH/gg0KPYT2Eu
 clIAJwJE+skRt2DaXH2b+2uA72FGx/SHAQYC+b4yV6TF7+hZKAgpFbQRBXx9/VwRtMlN
 ZmCPDrxxxTQQwBXY5jn64pJjVADmrf2/Kg1HGcpcFdzlaDi/twjb5IJfL6IyP3ZJ+AJ/
 eY7pJq2oYW22ODaS5u9Slmk2jm6mzF9gGp1ZVEUS3CL3cR18JLBDImMbI6VK+KM4QqZ2 tA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jan 2022 02:41:02 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20F2f1m4012744
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:02 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkn87g0ds-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jan 2022 02:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSdtqxZoYiyCoveWUf/ZmA/izl2ywCH6FCOUJOoj72U5e1x0c9uiF4samyadvCjp6HZB5cdSNe9bnb0jDI+CVK9rJvn4bE+C/DQwlT+ophG5c/K+k6B3w2evM8b8BSALu0xvh51Wt7UzOGqI7ecvMJ8sOzyXg17oTEW2lr3609JT1VNu78iAkgctwIvVnqqulp3NfC6pYKpzPvB5d4+F0ptJ6VZ2g7vNqeMB9dyiXJfE5jWpD273xaRzRmRUWa1ijZJzxU5F5UltIqyDgPDj9AZnSZ98MHIWfI/fMnqRDekC1xL/mfybTWQJoMxmf4sZ21PuSSPpHRO/VpeAwCp9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFUfMoJpRe+Ei61s+O1FojOoAjaui4R7ac07v1VMjx8=;
 b=dYeVAkxvLl5z1SmApsnuQ1tl0ytQfQTMFgQLBMorwpCCTbAI0rSf2ZptQKOzXbmxr2c3637BRT1fyVikceaAhTkqE2rKReNs11C6FxTQppwBu+mr5h+c5zZr82/8NZ9jhsKlAVSnj0Xh5lfdwAMdOVwcJdvFy/TTA6gL5RFXBsQItZwWn0XMokhd2kyD9QIRz8guNimpP8RgS01pHwMmZLtZLBLCK3pwqSYVoqwuu0LJsjcPbS3xl+icqZzyUoZAdpp2ObdYY7Ovr4MkbiXwHXydNhJ/RHoJK868P/tIkQ/I6mERIcvNPoNMyc4DtSNdwH1GlMGSS/Zk2E+mRwgc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by BYAPR11MB3445.namprd11.prod.outlook.com (2603:10b6:a03:77::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 02:40:56 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sat, 15 Jan 2022
 02:40:56 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott 2/2] tune-cortexa72: Enable the crc extension by default
 for cortexa72
Date: Sat, 15 Jan 2022 10:37:47 +0800
Message-Id: <20220115023747.1154635-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220115023747.1154635-1-kexin.hao@windriver.com>
References: <20220115023747.1154635-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689687a7-f0ad-4675-7138-08d9d7d074f0
X-MS-TrafficTypeDiagnostic: BYAPR11MB3445:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB344587032ABDEB16CA51B301E2559@BYAPR11MB3445.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xo4xW+S0oermts/IxH62mvamhfeA1Ul3w9vw8vQDt1frQI/I8PMFgmjICuq1quswTLPy51X70Me0USRvxhCPwkrVdBQmxm1y44J83IiV07ta3CwVyHhgX58fUTkxgFuqqx8JeCETdAmBl2BiL4Nk6jq349msf7G0uAO/LukhqR8gw41uh51I2yVXFCbNyEf+/e22QZwcDQxhovRCq90wNIE6ZiCvoaq0/MlN8ESG+2Vd1WyLJY4OY2TWKcZcx0b1m1/MYpGX3sdk80NDZHYQaQPdONPRpG5Mh0GM9a8waTwqXbPXoGeZRupY7GEYWloC1Vhx4R0uqJQruYnHWUxSLapU0QA51aR8ScTopAtvkkkU3Q9N2VL6n8S9XLi+VAd2NVU7Gg7HBtwy1fKb1s61eallWlkl1EOojkkKp8S/NYyvdXn4i0TDxdwEL6GV/WHdDIiNGqc9ZIpa8qBmLhgvFRZUxzQ2LGPMMN/6SW7DceSrcp3VH49mfkK+5y/YyryYUBQW3lzQWHZ7wIbwQ/wz5VYU5wSqSvfUbcSPiBpt1OQfpmt6Qwq2NJGoTfKGrSBZx70MpqKXU2QveCmRQX9f6txe5FbzBSVH+HRrXkvEk+xskWhsHo93IDyI8qX2h3ITrd7AKQdcFP3+p8vtiaU4sVDLOxA+OzxNQW8ttfpZNiZZAgIq7hKGjAWZOSIzppeLKS9r0ogU6PQQin1yyD+i8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(2906002)(107886003)(36756003)(6666004)(26005)(8936002)(6512007)(186003)(83380400001)(316002)(5660300002)(6486002)(8676002)(6916009)(4326008)(2616005)(66946007)(508600001)(66556008)(66476007)(1076003)(6506007)(38350700002)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rfiPsSFHDAE8MvU9DjJMJFDgwpy6EdBiYGF+g7frNjDEZlnieiJU1mk3IDbR?=
 =?us-ascii?Q?A5QYDi9gKvxOOSaDQo0wOTNFsTQK/e6SX6p1mcsLjw/0CZezHG7HaBcjhYw/?=
 =?us-ascii?Q?7OTSD09qYyJTwOGCQgEI4pbpsOKTN9ZNPhV2G56ttkZNIiBGwxdySH3ZoZd/?=
 =?us-ascii?Q?J4tgBR+vUsrMgub46S2WKjWlOPYX6TDMaJ/MI+bEf1PhEHd17fRiVtJRwfOH?=
 =?us-ascii?Q?epneT1ktouGX7jX5mGhfYVqhJQAPtQ6LSgfdEuc6CHAtxTewkDAdCj7C/stU?=
 =?us-ascii?Q?eX93SOtSs6ybF7fMNYhHqX0yi1NyxECqFRQKsRYOgzUY69vNc/460hTNmsMX?=
 =?us-ascii?Q?qM5jq3Qh/mMXnvx3eRCWoo/2IuULUchXlas6GWv8osaj65Dl7Sp3M4SxvLk1?=
 =?us-ascii?Q?jVr5gF1HzjVpaIclcHdwfEX1cg2Bsa/hwXGtRodnL1TPbbpXQi+UauZGLNZT?=
 =?us-ascii?Q?6mxNxYhEbrkamoPgGcL3ipkL0EgNl2il9Yfnme+qpTcVA7NqDiPltxYbgze9?=
 =?us-ascii?Q?83MTo6QASuBMX8N7LdS+wmePXpVDTjEmg1UFqVlyfk0OpvX93w7VqFFVJS/z?=
 =?us-ascii?Q?q+GUeUX5IG1ux844FXylgS100xFqzilF3ytsyv2EiVDEN/qff7lZ1Uh3DKc9?=
 =?us-ascii?Q?g0uHQiszTwIAYgxeXpjFVJZ+Sd+XsxnbtXGLl07D5sgKRXPQvVus/3RKEPZD?=
 =?us-ascii?Q?IxZNwBP6EnOcAPL4y6CyE+E5+5Q+wwhZDeKq7WTgTfqQjaTrG+/Gv3z7/sCu?=
 =?us-ascii?Q?F3XCCyvuvxgpPqjnKrN0ausXm6YJr5o4wJRSjmv06kzVxSJ11bCmQ5qsF9zA?=
 =?us-ascii?Q?IUrQ3uET9mXYje9xRdV2XgATxdk/V9R26V+xGqKd55uD1hXT6/9yO5AROQPm?=
 =?us-ascii?Q?AyMqQPAQQiplNRiI6jahM9dyoQCmAPgE1Gv/+NpNSRFiPdK3APgcneIZ6Mh6?=
 =?us-ascii?Q?rsyguLIy+R1l8fExZKlkX7nRiMNSPxvUjxMBHOFYD1R8jNQ4wcUgb0q3Xh3M?=
 =?us-ascii?Q?+3Z2AuUq4g9vE1JK8cyFoGdjPIjdV5ayL/5zrvhe6KCGZ+ZLmMFmfaZeYRs6?=
 =?us-ascii?Q?z78Xiu+YOUjnfYhEEaTmysU8laYuX6OgjTrHm7Sqq6L3HU26h2q0M+YLVZu5?=
 =?us-ascii?Q?8/oU38wvHKTeslvYCRa98g7dpLQoenb3YVFICnx4AUZQwlQ93Ma6NOM+cQLn?=
 =?us-ascii?Q?GBzvRAJftYToNgYh9vuyBRmXTt327Gowh5VVv8zu1gAvnqTq8UmQloon1QJC?=
 =?us-ascii?Q?ldToFhloZmap+So4hc0kAZ1Qd1IP+FgBdzSXkNKLZmy70O0sF64g4agJwU08?=
 =?us-ascii?Q?IlaIefVUtsw9Sg5QraNV3s9gYWWBXbEUSluB3MI6x9CRL50R5vH4hHmQVe9h?=
 =?us-ascii?Q?I1RKr7ArCzBs+uzJamitLwOcXvM6Qq2M/lghjhCLe2Av3p9cGD3Xf9jW3p6d?=
 =?us-ascii?Q?oSgTX4Jut7uveXdA/W1iUBWkHUQdIEIX8ccqCCrTlMMw1pdMVAtS8WO1xiCO?=
 =?us-ascii?Q?KDouFbu3pQCOZA3S3pMQb4iJLRgwjDZEZZElDg8gJgaPN/gcQhtlJJNfebjp?=
 =?us-ascii?Q?ktbYe0hvJr5ZVNojqFqdEKKNCXNRuApee1+zrwTie3ZIHsdZSEhXr3AKD6J3?=
 =?us-ascii?Q?D3Emh+/jfuIz33jtI8tXYVU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 689687a7-f0ad-4675-7138-08d9d7d074f0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 02:40:56.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vXzoGoM2uAf3v4tBaArWKCy21bUV9venmGpCqfqWqoBVOo6LC1RCu7xdB00QRuOd0FRN3FTosLnbehVIP6wrLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3445
X-Proofpoint-GUID: JgPa393PGE81wJ-R4RHeCtwttvYFP3CF
X-Proofpoint-ORIG-GUID: 9N5-qxjIWj7WWA999RrjJySxCdIYXgDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-15_01,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=694 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201150011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jan 2022 02:41:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160598

The crc extension is optional for the ARMv8.0 but is mandatory for the
cortexa72, so there is no reason not to enable it for the cortexa72
tune. With this change, the cortexa72-crc seems redundant. But we
had better to keep it to be compatible with the BSP which already used
that tune.

(From OE-Core rev: ca50267ab568d2f688844cb7c6cd867ed34168db)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 7608a20c43f4..30480efd8328 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
-TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
-TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72}"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
 BASE_LIB_tune-cortexa72            = "lib64"
 BASE_LIB_tune-cortexa72-crc        = "lib64"
 BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.31.1


