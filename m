Return-Path: <Ruiqiang.Hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FE6C6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 03:22:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.2370.1663730553744102889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 20:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HXN3JCnl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6263947b0a=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28L3GEta006141
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=OIcUr1Gsf4TN9e0wtW/Yp69ZqRTR7Xv6b37bzytUvTU=;
 b=HXN3JCnlW50aS47DNmKii/HAglWhi+X8rYaEn2AxnatmBABwp/TViKCTi74uc8RA541K
 +/1jdcev4O4JBKfyyq7zb4XZfmY04XWDKzXWVH0TdH3VdYstnVfsIYV1q0WRNEON9jFX
 uogDMzBkGetgxoedQaez0AVw7BlIK7uXuX0rQBxWmv4Xgw2hroDetzxb1fwH3R0av5QY
 tnqzVJfeb3z+TbjVOmgLKstifpkmPV6Hj6ysUufzpVa3qxOwdLSUl8EFIjdFSgPjsz72
 4kE2YFEoC5z/qF2rx/PED/LVmA/RoTKUc2L8d4sen8WIxREPYS1ra6xnh91Ybfe/TnQI JQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1b6kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 03:22:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L3IXqX009185
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1b6ka-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 03:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8zatTHdx1n2PF6o2yODvWvqujZdP5lyfg2gH+m19d2whRHOL3pNsh9tl4QCXJRnBf3PIMuzbnqYHs2TyE/ba1L/Lm8ZYv1jrMznAh4nO7gXCsUkm9uU9Qn5whxA4tVNcUb1bJb6TEVRGLOiqn2sMwUJJvp7wrk35odkg3A8EW313SS4mBTCW33UjCSK6Ue+FgVsQVE+O81ZhVar2UugnqU3vpyZ6YwgcFFv+EZS3N23Yf6bDh6BJ4aan+OD721IPjyDUs+YcLUBY88z9juJq2plvweDa4EWcX5bfQGAlwp5jHNmDf8jr1MBBeOiOBcp6qOtMAvnXDdhD0nGs9Kd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIcUr1Gsf4TN9e0wtW/Yp69ZqRTR7Xv6b37bzytUvTU=;
 b=oWSnF+FpuQjjDLg+eoR+WC/YgxJuxoQmCHEfDLZsJiMg2Nyu+TWOT7JarXr/eA5tXE70EtJJpdjBWcjcsloVxlfphRMyEZScV572c5VJWZftaqIq7ZSR2heb4kYydXjrG5asUyHqEhP59LWaYs6rp077tBjo3lavqfhvy2AogTpO5r7l2vdRkIJaR623QP/TbWN2UFlpdhKc3TFqfkzM0pJKCTk6rIERKNhcrXEnZsW/92jAF+AdgjadjR2uDPfeb8y7z+yDcbKUAGymA13WIDFStGwDouWxv7hy2WjK3sT80vSiyGizgxaXMA//pIoku5tPQ2Ts2unsYJOXfX7PCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4166.namprd11.prod.outlook.com (2603:10b6:a03:191::25)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 03:22:30 +0000
Received: from BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::f8ee:14f7:43:40df]) by BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::f8ee:14f7:43:40df%6]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 03:22:30 +0000
From: Ruiqiang Hao <ruiqiang.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [kirkstone][PATCH 2/2] tune-neoversen2: support tune-neoversen2 base
 on armv9a
Date: Wed, 21 Sep 2022 11:21:10 +0800
Message-Id: <20220921032110.985001-2-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220921032110.985001-1-ruiqiang.hao@windriver.com>
References: <20220921032110.985001-1-ruiqiang.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To BY5PR11MB4166.namprd11.prod.outlook.com
 (2603:10b6:a03:191::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4166:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: a8781457-9f4e-4d37-123d-08da9b808460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xqkY6ai+mA/m7iTl7712LPShdj0Yo2XKO9h54UpVzt73/8lxdUSnEBgfwaEztFOhg/7EOBmtHSqPPRPKTX6Rzfgs0KWp4lxPRqxNCEW6oYEhWJVbUluIHnpnib/Zkudf9Jfyz7+LHgHM6ujGSCZQ0ONbrnS3UqlTAXJ8nFR1qWlT5QsM/+8CnEl6JW+k3I8tbhRnEOxXSwrH6gPB8xb0E+EcmPszLQf3koQ6lKfJb1hfrZMdILFe3rXLl5epldH4B84jwLMCiXUBUwCV1aXx55A1OFPNwKUYZV6T7xUVve3zO1GIOcPR7Zhin6tGJV4UsFDs1PIwp0ku6RGImYh1SrLszPXXO/mo/w4W0k+QY0a4fV7pC/mwqF2D+9TXOnRfgUDB+zSPJFFNUK+5Bw+HIOgwDndYBhf6PjfJsV/D/2FtxX3TRSxKMlKHucX69rI0L7BtxZtus0txhxM9iDFQZ+xyRRQIUnMuQx0qnSRzboR3XgGnXKJYRAYcwa0Lw1JGRSgJBYKeDtNcxpypTaiDDBEVqUfccHaJv5WTv0RcEi6r2nuU4lishOchzNI8AFYEsXRkXh8yHtjAG6pyHOCtHy7KhbdNJObtUym+O3ywAd9Wy6/zKaYqSOPxM6NgAgHcD3gK0N2citq6OKRj1ixY13NNrtybnV/lu2PH+3+8YMc/CaSI65Y4UmAjrSIGdffDbzjE6DjERpYfKxlXMBjuKXmUWfAChEEVm5PF5S/wHcdvsTRlC1KiQxEOLoX/Iut0VFaNOMV88tSokrTxoqXPJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4166.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199015)(316002)(6916009)(86362001)(2906002)(52116002)(6506007)(186003)(1076003)(2616005)(6512007)(36756003)(26005)(8936002)(44832011)(5660300002)(83380400001)(4326008)(8676002)(66556008)(66946007)(66476007)(6666004)(41300700001)(38350700002)(38100700002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oUY1dnihHzB+2DdvWJQhQGwV3KGsBH7K3uZjJsB7Y3llFIep3Btl3qRleGg0?=
 =?us-ascii?Q?FW7cU23Jdybwg6Y9wKXEbvNEReFC4WZn71v+W08NM3qDyZaCbDV+3d/s1Dzd?=
 =?us-ascii?Q?FtPuRW30HZVHegMCcs3HoFomH4f/7pxdNnkftqw+7ZX3tOgj8Cm17Lk7nSBg?=
 =?us-ascii?Q?xcWlwdO1opGRx1v5hhHDSJtEDYsq089p6xqDOEUma+38w24VWQP8gmLjkIMs?=
 =?us-ascii?Q?anli+V6BVLa7XQak9jVF7u/4nKPECxg8mnRKlBRoZmRMbERjxXJdx1wZMjPL?=
 =?us-ascii?Q?+ofYlSVqL1MAIyGjBkfnqsL1ohpgLeUUbydvfW9PdVY1y2ddXWQh/SmSkN42?=
 =?us-ascii?Q?W3CCjX0Ok0WnzW7bQ3lRAMoF2FG3R12otiz3xDJemsIj5bTOgecxZDn8CiWv?=
 =?us-ascii?Q?pSbRkwqG54SNVfkF91/7KWqbdoBZ24qFDjZvv97HMpXVdPxOvR+1UJYYo/us?=
 =?us-ascii?Q?n38WZRAy6tiAr+c5m3tfYecktYIZNcdLJvulokd7E20DuESOEQT96SDqZmlw?=
 =?us-ascii?Q?kUq5EQR1VaS842/uh1D4YeVMumArhwNfIUS257B640L4GIZyX4W9ibNOVHW4?=
 =?us-ascii?Q?Yd8M6U+SigCOS1hDsGuhEggdvFMxamNZjL4SY3wf3rDzObZaMylAeYGfQ2Dp?=
 =?us-ascii?Q?d/+BQRFVaS6ZKcwV/YkwPCnYnQizmRf0gB72hPiYrKbpHYgYwzjepA0qeULv?=
 =?us-ascii?Q?guS7GAWLvypP1qi0JaI02RIPNlTYS84oXZo01uD9wkc5IOkfUSyuHofitMjg?=
 =?us-ascii?Q?x0Jec1XbpEM5Xvw255DTXuUn73lgmSDLUdvSIJ2xiXLTXIduwXAavoekI2ff?=
 =?us-ascii?Q?xZKVgrEvXA6pw7Pfq3qzh+Rq/mwKEI/0cy9P993E8GIo6/71UO4IjzCJFegU?=
 =?us-ascii?Q?xNQARVSW/hHgPH3ydbxEI9EK3tjIUmjRRHNjjzfwQgghg8ogcqzpix2NFiB4?=
 =?us-ascii?Q?Iled9DA43FQtorKLTeDxCpBNcAK3v5e5WItHiHGQu3ARXiWM9q53ei39ypFW?=
 =?us-ascii?Q?2Rb1X/i2hwTPpzgKZ3gqvaNEa9fQp8xVzVPKRC07+tlKZuBfZYZn2WZgv0ks?=
 =?us-ascii?Q?s4bcFq2lIqYgyf9UW4UzX/x6g4Hr7F4biKJgddllTsDpeNk6EsIrzzWAo2PC?=
 =?us-ascii?Q?zVzqQQ1fmqk4/RPalLflVsvdCSYD/LS46W8H7432LX1L97DY2icv0FgSRlHm?=
 =?us-ascii?Q?QQGVuS+66NwBThrYBZq+zY9/mjgULLrZyBSGIfo29O2RCNHqsW5iwBaDBT+T?=
 =?us-ascii?Q?XC8l40tz+0jWMJxgMqpfj9h1P4U8GWa1FohhGfVuIFbUVN3JVjJRyikSvHB8?=
 =?us-ascii?Q?bjhVuuw2uqSjCMkjWUVHMOBbhYtpWTQDN/GkRWAnJceznhNHoirZlCfIRvLj?=
 =?us-ascii?Q?ikhvN07YrD5zri0asZkl+/yYd+tYMPk8/lqLX2+Czs60Kq+V8qJnO7FpJD2E?=
 =?us-ascii?Q?5cSPKwr5WtdGYLkm15oGvrvEHNjNblHMzPV+jumtQeSH8f2SDwL9W440pd+H?=
 =?us-ascii?Q?j0x/FPYYcIi6yn35w1HR6/QbtWsjF5ferHh/WQJWJb0xrG6DPAoERkKgtrnV?=
 =?us-ascii?Q?tKE9WkBIRbRaOdvYVWuDQDoRLKvzUMOsLrBI3X9oNkvV24o5IpFmQZxZvgh3?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8781457-9f4e-4d37-123d-08da9b808460
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4166.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 03:22:30.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VeCGvx/cpY5zYODyZ89AfZt8LgbkZ3GdQ/OmMl7FIXb3O4j6wEdcEVGy4NVQDtLIkdaxXznU4Op1ghE2ZX6pU4PlAoNOJg6vnPhBMVaWQKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
X-Proofpoint-ORIG-GUID: D0sxIutloDj1SMOThvdPhbsfdWebOnom
X-Proofpoint-GUID: 6JcOK5HoajAYThO9CRPTHci3RQDDRG0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxlogscore=565 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170929

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

We supported neoversen2 base on armv8.5a in the past, add tune include
for armv9a and support neoversen2 base on armv9a.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv9a.inc | 28 +++++++++++++++++++
 .../include/arm/armv9a/tune-neoversen2.inc    | 10 +++----
 2 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv9a.inc

diff --git a/meta/conf/machine/include/arm/arch-armv9a.inc b/meta/conf/machine/include/arm/arch-armv9a.inc
new file mode 100644
index 0000000000..c38d6cfdf6
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv9a.inc
@@ -0,0 +1,28 @@
+DEFAULTTUNE ?= "armv9a-crc"
+
+TUNEVALID[armv9a] = "Enable instructions for ARMv9-a"
+TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', ' -march=armv9-a', '', d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv9a', 'armv9a:', '', d)}"
+
+require conf/machine/include/arm/arch-arm64.inc
+require conf/machine/include/arm/feature-arm-crc.inc
+require conf/machine/include/arm/feature-arm-crypto.inc
+
+# Little Endian base configs
+AVAILTUNES += "armv9a armv9a-crc armv9a-crc-crypto armv9a-crypto"
+ARMPKGARCH:tune-armv9a                    ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc                ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crypto             ?= "armv9a"
+ARMPKGARCH:tune-armv9a-crc-crypto         ?= "armv9a"
+TUNE_FEATURES:tune-armv9a                  = "aarch64 armv9a"
+TUNE_FEATURES:tune-armv9a-crc              = "${TUNE_FEATURES:tune-armv9a} crc"
+TUNE_FEATURES:tune-armv9a-crypto           = "${TUNE_FEATURES:tune-armv9a} crypto"
+TUNE_FEATURES:tune-armv9a-crc-crypto       = "${TUNE_FEATURES:tune-armv9a-crc} crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a            = "aarch64 armv9a"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc        = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crc"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto     = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} armv9a-crypto"
+PACKAGE_EXTRA_ARCHS:tune-armv9a-crc-crypto = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crc} armv9a-crypto armv9a-crc-crypto"
+BASE_LIB:tune-armv9a                       = "lib64"
+BASE_LIB:tune-armv9a-crc                   = "lib64"
+BASE_LIB:tune-armv9a-crypto                = "lib64"
+BASE_LIB:tune-armv9a-crc-crypto            = "lib64"
diff --git a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
index 36355f7bed..d26ab25e48 100644
--- a/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
+++ b/meta/conf/machine/include/arm/armv9a/tune-neoversen2.inc
@@ -6,17 +6,15 @@ DEFAULTTUNE ?= "neoversen2"
 TUNEVALID[neoversen2] = "Enable Neoverse-N2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'neoversen2', ' -mcpu=neoverse-n2', '', d)}"
 
-# Even though the Neoverse N2 core implemnts the Arm v9.0-A architecture,
-# but the support of it in GCC is based on the Arm v8.5-A architecture.
-require conf/machine/include/arm/arch-armv8-5a.inc
+require conf/machine/include/arm/arch-armv9a.inc
 
 # Little Endian base configs
 AVAILTUNES                                         += "neoversen2 neoversen2-crypto"
 ARMPKGARCH:tune-neoversen2                          = "neoversen2"
 ARMPKGARCH:tune-neoversen2-crypto                   = "neoversen2-crypto"
-TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv8-5a} neoversen2"
+TUNE_FEATURES:tune-neoversen2                       = "${TUNE_FEATURES:tune-armv9a} neoversen2"
 TUNE_FEATURES:tune-neoversen2-crypto                = "${TUNE_FEATURES:tune-neoversen2} crypto"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a} neoversen2"
-PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv8-5a-crypto} neoversen2 neoversen2-crypto"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2                 = "${PACKAGE_EXTRA_ARCHS:tune-armv9a} neoversen2"
+PACKAGE_EXTRA_ARCHS:tune-neoversen2-crypto          = "${PACKAGE_EXTRA_ARCHS:tune-armv9a-crypto} neoversen2 neoversen2-crypto"
 BASE_LIB:tune-neoversen2                            = "lib64"
 BASE_LIB:tune-neoversen2-crypto                     = "lib64"
-- 
2.32.0


