Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1E2C021A7
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 06:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5001.1739426419720791006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 22:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4139e44f67=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D5OBst022595
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:19 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6jkp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:00:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LKtKDuAkx84ASLZYCMSYCkR1KfPxR0qwT1xivAJ9xjzUvYvdx0y3QmZrRbyuEZ+IElrMmolw8sKIG0JqXl//WKAc1kBryOEJagxZUyTGMhqsaCiYeHhhaq7T+HUrt3VWChhfvznMDM3iLu1iB4a4dWMAH3LYviIj75dix0oWhNn0qypubSP+7zlCyMXUgco3sQO5lhpp15ghQh7IMFq/M1BbGfF/83rEe3PWu2YePn3jJA6KsPKjJC9hRF+rsm6tgg3hDQ7YUPHOCstRORqPjm62oNrVUNQQA2pVEYEB4MkPTuzbi3rob3VtTfrXVc5ByJp0PgFEwrAecbiLMjiY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVp+HahGcidjOme8kt0+VdDEqJpmK0Ic//fxaUvvJ8c=;
 b=u0lX/b1BkG9vogqxvpHoOHElkGTNWMtz+CRRWD6ueWIixqOKVd3qyyzN4VPn066CYK+jdDzqGJnD7lrIckbatg8pB5xofS90mQ1JLOzz56GPzDZtC4tYdO+1CnxXQHJGAWhwFKObtkga95MwG15bbKwfYCEVgdy4TUzPTLUfBlEB5IQWZl4lKBYyXSml/Ts/yEdSRlrL6/iYINrISakyBkLinVG3W4RGT1j4+y/2KzPDBc6OHkEdUw04rS0p7EP0d7p5km3pGmG21e4PNN6JSVkZt7ftbLwwkOEmJKPeZD5JUM5FnyqIfkcK+Nrhi5nSEOOxYYyCxh6nOwHN7fXd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by MW3PR11MB4569.namprd11.prod.outlook.com (2603:10b6:303:54::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 06:00:13 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 06:00:13 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/5] diffutils: upgrade from 3.10 to 3.11
Date: Wed, 12 Feb 2025 21:59:58 -0800
Message-Id: <20250213060000.1092285-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213060000.1092285-1-Qi.Chen@windriver.com>
References: <20250213060000.1092285-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|MW3PR11MB4569:EE_
X-MS-Office365-Filtering-Correlation-Id: fc060ef0-43cc-4b3c-9fd2-08dd4bf3adfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KpIqWPxtL2e2Yzw++865KcLlZIeScRLCCe8t3VkoNpQH8D5l/x6eOb+hFG1n?=
 =?us-ascii?Q?oj8fODMItGhChhaxImt1I4kAcN63D6eRplr6wY/s08B/qIoInUv3e7jnVKvs?=
 =?us-ascii?Q?CFvPiamkZs1Nl30b044EBAsdTQMAaRur78NO4XDV1O/BlQSeh3uP8S7A+rNF?=
 =?us-ascii?Q?Z8VEMNNoQfO5PH5Per6+j9zFt3yl+fWBwFN+14R9gNRHO13IRcCg5ME+vVMq?=
 =?us-ascii?Q?6uJTR1mt8S9/XStE1L4rVK+Qug0IXi/r/s3wxC2GhAbXrWUIxpSwnZs+FVpE?=
 =?us-ascii?Q?nb00+HIipRz6i4WQmHNYPZTkA7dDgHlpKR58svNnEeLtVsIkQjKz/7w8pHW4?=
 =?us-ascii?Q?cfn1MzNQU+TXLyJD0S/RHjuiiiI61Yt/I3OuhfNJ+7APrgKPmdpcLDA8+Nl6?=
 =?us-ascii?Q?LDs4HdhOSFjgcYVwLLiuqNO/9nGi2hqarPBH84Ner0KuqsBxeDUC7w9oPSgD?=
 =?us-ascii?Q?j+qgHu+k85O0xYtnXusmKsNa8lPZpq55TKLs6eo0uQVldLg1bwM/g3bcUkxw?=
 =?us-ascii?Q?Od2bPCaLoUuuzHpwCkks6VCS3l/dX2i9HQuV8LGBoHT6CCsc6blpoAD/+Ycx?=
 =?us-ascii?Q?LpvxivOxSVcpcyIS5TkZlLqbi1rvDrgI9wU5xRLRajet+A5hfB+J+4vp1X4V?=
 =?us-ascii?Q?cpyIoCtF9j7i+uctXvMYapKD24+Q2rvM7Lwl30nH+v/Yjumw6HOr5Bv+3Ibm?=
 =?us-ascii?Q?uokmezmvg87bh3/jdcC6SmwSXSCzUYF78TpsXzal66lmBc6kNC4uG3qeQKKu?=
 =?us-ascii?Q?HDnm7ldgc0ow+bdEfuHLsNUFToifo/40FVsM02caizAPxeFlpV3WiwbmtSNl?=
 =?us-ascii?Q?ivApd8C4UjNb8iiNJcUWtHFCSOIxrVJXlUGQ1znpLOabALIxXs4Es383T3yr?=
 =?us-ascii?Q?SYVotoXuxfUS3DSMhSKB1dbyYFN0SLOVius4TuCq2+F9FIOOBreqIo0OPxKj?=
 =?us-ascii?Q?jKiVNKsZl6gDakkCuyA0NqkCJdeUpeORsRoJ1yq49cKCEORVkJqDKdxWCXKC?=
 =?us-ascii?Q?ggtETxDlwVWwadsIaeNFxDwnNkNP7sjZ0lv5oZuLbFN3ltljfuoV0xlF5nWb?=
 =?us-ascii?Q?0I1hH/7kx/sEim4z1mBB7KhAXKRx5WixSzSAUJLNYsEYoEc1iND8VZF+DrXZ?=
 =?us-ascii?Q?3qfr1vIkKcLpqHQRCKxq7/bCat5Hemy0W/QSps+uN/OStHBqJnWNrTqoBy3/?=
 =?us-ascii?Q?0QAxmUeM0yw+JtaYzRajrVpaPctnuBWNVZ6QYXSTIILXi7CNQQPkEcsXl+v9?=
 =?us-ascii?Q?6C1UQt9JneHkmVZsjPbjzsxGbwpwkQ1qhpowvUcJxofW9egcpfMlc/C9lX3k?=
 =?us-ascii?Q?xdC7jgLqK2UIut8yPgXWG/Kfd3xjahssQLbo4sJ9GjJq16Vq67/gxJbyuGwG?=
 =?us-ascii?Q?Thd65CamiiQn7dbQCkpuxNGZn7xfxLfI7EcG0n2nrDWkmsdD8Q5yTS0JpkBa?=
 =?us-ascii?Q?k8jc3Z8OVQ6AZSgxq8wsXFiZfTbGA+F1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?18utau9l84hw/r6LHGRQBsGZtiotrm3QFx2ByQBS+boua8QFkNW1OYhcy9Ma?=
 =?us-ascii?Q?DZjVY5uRBraCLhpPvTWqYE+gDIzVbU0S02uMjw/BIxRfVN00cn4S6IzUYpxI?=
 =?us-ascii?Q?Fr7bewsp7I69/h2VvgzyG24t/lRAME4nMuPoxCvWPn43DtVEuxZqpbT2gTif?=
 =?us-ascii?Q?ie8erOioge91pXnTBF01tPgNqiuYhrfFO1KrYGn60XawAkz2cXaYuYmcfTcG?=
 =?us-ascii?Q?N2xthasxDQVX0T6vDYEZkmt8caG9nwN7+c+iUx2ty1Cb4v8MKlrve6jdP7WJ?=
 =?us-ascii?Q?ARv/WhzB7GyyNwE0iNG2kvZpY+EyN1qvGWklsbKN/v8f5XzyTLww5yb2C8mo?=
 =?us-ascii?Q?XRvsmf2lXS1eFyqqPv+C6dDIPasxRycY3eWO1WShRRQfyki7k7DzxvP4koKm?=
 =?us-ascii?Q?RHwON0qlVwC69xv8xXcAezGaMTEqe49EPzfOKccgQytmPjiksQ5JFLkR/Te+?=
 =?us-ascii?Q?f4gsptdqeiPJ8iToZys84YoTVLYfaGjWYscIK2oKnUm8AUtvtedj+jDAd197?=
 =?us-ascii?Q?ZzN9Ct/G6tCQT3aeq8dSkKADn4YRZEZIOzf2g7xIdOvlv3Wv4rMIBPXRL/0+?=
 =?us-ascii?Q?MKZNiw7DOY+gr704tzIDVyATJz0ty6yYbvkm9j3Kp9nF9yrC0RLoh0CtwASe?=
 =?us-ascii?Q?ZyH7bNzsjnI8vuH0dXND6NxB3ZTgadFuRwYQ6L5Fhydw9gw9adMa4YTNaEDN?=
 =?us-ascii?Q?O6HJyjrCPQsVlpLt+rCkafBhwf3zsmBYJY1xnY7Pt378/qgN25Lmh7eSr3gG?=
 =?us-ascii?Q?N2Av6r6GE5XyOAem6ptAD04ZGuqGHDdLKuth4xO6bgik0fnLb8ju7lUtwoZx?=
 =?us-ascii?Q?qslIbIkYVwfmcNriBwczmMycXTd5/Wpb/MbqNS1GDFNUjy6Rw3wYdAxX8xRs?=
 =?us-ascii?Q?dbAZrnOatF1zbuJaDgnyL4KntsttPctrZYJc8RY6S0h3j4Crv6LZ66sr1P2m?=
 =?us-ascii?Q?67w1qsJPdFKCMqC8800TfOd+aN4oZl11hKhllOkp2GY5u2h8yDdL3yLBLXbP?=
 =?us-ascii?Q?EsrU9jyfwsmhkSzJVAUF7aW0fOBdEx8EmbriTSDdtQnKIsTwhg882KzOGoXX?=
 =?us-ascii?Q?h4PstOXvTZ2w3Y/yZYVs6DIODr+/JHlTP1ve643gMRy+1OtkrbfTiHWFc3q3?=
 =?us-ascii?Q?JpyaaUlyNtumeZFn6B7E9ltzeqduTFuMcomjTpBVV+MeLXudQGXCBJ7a3ryI?=
 =?us-ascii?Q?BW5txAARWmVhKNpUr3QrRqlxOBoILgBbwh/18RCa5fmd7s3ARW0W0bQusGHc?=
 =?us-ascii?Q?/229TSelRY6BYJDfIsBFe4RqiqtXxHF1PrtdkVere9pm451vv76tISb8ch/5?=
 =?us-ascii?Q?q5Q6uBIRBuUhNETyCH9Hqvi2fu2cHl8MGpmwI18F59Sv17X8YFWidLM0tsVT?=
 =?us-ascii?Q?G9wh0CdfKc8mqUVSIy/il8ahSWbm60uFHM1sCHguE7GVS2ubAX3CH+45bk/l?=
 =?us-ascii?Q?i0DeP419OjfwrZBlOAgvwVKV18ItWZmweWPcBRxzrJxEirSzGjXc0JnQXsXD?=
 =?us-ascii?Q?E4WQ4fP9+BqdOsVXvx0JQAashgE62Vgai/yTTiiLxG4q8OqijLDE4blPihee?=
 =?us-ascii?Q?4iAEx3zch22CS0HNfQMzZxNmvYlGRhLRvf6S1L2x0hSVSAxU0d+sRMKVcRn5?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc060ef0-43cc-4b3c-9fd2-08dd4bf3adfe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 06:00:12.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFnjzL1f3OF0Wf10VI/uUaCCEa1lJVNR/JQfuExrcobdcaB0NVUOnBbujW4CSAkYEgz/ecYWmOAAgicMu+AxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4569
X-Proofpoint-GUID: XbYkcdpGhUNIwK19_E7nfuuTyhpKpsMI
X-Proofpoint-ORIG-GUID: XbYkcdpGhUNIwK19_E7nfuuTyhpKpsMI
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67ad8a73 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=DCqfb0bBOKTph5PbknQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=567 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211295

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade diffutils from 3.10 to 3.11.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../diffutils/{diffutils_3.10.bb => diffutils_3.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/diffutils/{diffutils_3.10.bb => diffutils_3.11.bb} (93%)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.10.bb b/meta/recipes-extended/diffutils/diffutils_3.11.bb
similarity index 93%
rename from meta/recipes-extended/diffutils/diffutils_3.10.bb
rename to meta/recipes-extended/diffutils/diffutils_3.11.bb
index 08e8305612..8f5a87c2db 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.10.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.11.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
            "
 
-SRC_URI[sha256sum] = "90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e"
+SRC_URI[sha256sum] = "a73ef05fe37dd585f7d87068e4a0639760419f810138bd75c61ddaa1f9e2131e"
 
 EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
-- 
2.25.1


