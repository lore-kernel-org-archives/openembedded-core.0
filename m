Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7052AC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 03:40:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.43239.1739158826379343970
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 19:40:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41364825a8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2hHhR001210
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:40:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88sfqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:40:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDntkgZMsieGsKh77rG4CdHg5FWoPvMbh/6wFJOYjfWjV9KSsGnoqRaU5iOMQLDD+qyezkh82sTAnj0KqYtHj2//pglWR3UVbFix+2A13E1RPB5EPl6ynPO9WsteUmZ9MCUaRt2970BLuJaLKteclSVj0c0kL8pTyLsW7FFbTXOA6T43mUH67aSKRcxUsX/WyeLKHNuSmmazlNJo7A+hyCjWAClzy0fgbrwOZPSGlcBVakQITf2iNpSEz4tW0StDuGjn7LYY8Z2Isiy0Ih8fjY4S/nUBVi9gL6aDtNRuXpuFWdAEM7bKxw2H965NohoFs5SlYLgzJfmI5TD8er9fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP+MKH76ppAUgnlCmC/drLW10psGlmMKpHAICPMpy3U=;
 b=Uh0dnCLe/0SlhPKmhI3JFgM+Hxqkzk2iKLXGmZ2CRjhTR1d+tNJ83oGZV2WjGSkBvKK7/GydbQeKf0CEPxGFjpmodJzNsIR3rxoPe2DcYE7lcOy1LiZpHWYAN8Kvxcsx5nX/bc80TgrLz8qtLth4OxF8fXXm597MGBdEnshIflweF4fmFjtPylhQY0tRBJMzJotV/G/LGlSvYdeAkYlJDs4vZlynAurc83CUXStxoX0mcYo0y5CzdfCCSQL22+GjA+I6e+dwllQXHRb7qXcynjYoZuh1/wzvMcdImlgYcH/8KJEe+dfH6nx4vDo91bm0KfeFG9puLsFxmDGg3k6V7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 03:40:21 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 03:40:21 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-bcrypt: fix ptest
Date: Sun,  9 Feb 2025 19:40:08 -0800
Message-Id: <20250210034008.2995682-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|LV3PR11MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: de47bb81-6afa-4bbf-f293-08dd4984a4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dx+qiillKCv+xrMcVg0ZUYPcTLaCdn10Jc9+QJbzV770AZNvjGtRkUA7kgWR?=
 =?us-ascii?Q?h9WuQq4Yy0wKW+bwLZXQFSZQDywhpIYCjKxCkiikSSO52Ys6F8XPBuYUl++J?=
 =?us-ascii?Q?ierujDUzJRTJNl/xwv3+/QTwXr6RsHk4soRJnxWew672oNw3jjU8r5Fyw9oq?=
 =?us-ascii?Q?g1gTfPfY8HESA9jZsRtOLEVtDxkJauql51ts8ID3Q1C05lqGx/cRCAayaEBM?=
 =?us-ascii?Q?vdVa7rtREWJ607JHPtNS1U5wP9CDv5D4VyqTCiAVo0Rjv22OKiPPzNIN0sPF?=
 =?us-ascii?Q?2v4ioTiMYg0NDjHXrkDm9eKmuEBkRbM25hP5hM6d+sNokogKFF1ES7c2XByM?=
 =?us-ascii?Q?/e/NeMAddwxYvkLC/TT3WBLh7qCYRC6cZpJ60fLUEMg5xFdV3GfUwBEwiiv1?=
 =?us-ascii?Q?6HCkVFYeQ3HoinRMxaI5wVQHpJGvbOTxaVP0YCrVXILgRGLKukgFIwQxH+5X?=
 =?us-ascii?Q?jTcWkxRXujXRxJ/a2OZs1KyOqc7uOl/UiLS4JN5oFfKDtdDymTTdvUM3nLrL?=
 =?us-ascii?Q?MjtbRQ+WNt3tlBClAqlklJE8FbGhCMDETMavy5aL8pKhlCx2HAQoMgY70o67?=
 =?us-ascii?Q?9zdQxWmSksQ8TgUeTWchZQIDUzy9Uwgj3TvMRClE7UAYoaS/1Z7MK8UOZSxA?=
 =?us-ascii?Q?fTqpV7oEzvSzrQ9cTystoBL48F9zdIkUbn4QVShsFDiLq+oupVqQFilcITJA?=
 =?us-ascii?Q?JERC5voBcpNB45qRrrh0/a466yDTV0/X2OGKN6bLdo6kUaibS41RXPH0yDoJ?=
 =?us-ascii?Q?SfzocOkNYWPnNpQUmx+HC8jZt2VR8v7ycYUjvTfIaJbEelmbtxuI+0xxBcwL?=
 =?us-ascii?Q?2Bj3vXZqOfXI/h+cKcmPm4TvclTw8T9+EIMmyxAP5LmxIr891uQo2A6Ek/3N?=
 =?us-ascii?Q?HIjGE9YmDVLemQFTJ42Lr3te52QY2WPI0p+yxmgZTTO3lRpRitkJ4atsTJb+?=
 =?us-ascii?Q?DIo9QzOI/5Wjx1bpHytii8uNC3j146v40KJ9kETkC139fEzqmfkefwvHEu/i?=
 =?us-ascii?Q?UlXUdEEiG1heypqi66gMPa/N7K/GTcfgFUqPVVfenK/P+srAMDU+1woPXwgZ?=
 =?us-ascii?Q?JajQYEIhIppAXzyAvtdWrdo2BgTAmw+o9GEI/vgCWm/LVbyN4quTPvJ52Z1e?=
 =?us-ascii?Q?eNae9l5E8RG+XylxDZBzTxttEIc1LdVJgKHRo8rnBMjMpUBe029bbviGk4nE?=
 =?us-ascii?Q?7NNCB8zq48WvFQx6e8vJWGCRxYBZNX50ka3e3Fvomu8KKe3JATkJse64nMzI?=
 =?us-ascii?Q?Pv1n92WDvCtdS67wEFEuI2mp+z0JYG5YYdD+5w8374QGPCLwCzH9YYB/0dzS?=
 =?us-ascii?Q?qI9QqEbYulz/kbRX1SBTmOW8eAbWxHkY/FqBq15p2b7nbGYSHrQohI7cSq7Q?=
 =?us-ascii?Q?tpUXg9hMIaI3ZqKyyDxr9N4CIPirfrP0lEe3u3FZhHdLEnBoZ1op5n54zuTn?=
 =?us-ascii?Q?bTkPcX/YTxOl6Ao0pFD7hg/47gyJ4Ndd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9GOZkZmJxe7ojA/p9aj7iiat9xVhQqSH7qIxT2fkMIJyyLCwkN7qBuiL9n0Y?=
 =?us-ascii?Q?LPSTweMgydV3wdcaNiTJKJPxOzQIOzxtJFfHOI+9WY3oZRnwzEFit+bMBlO+?=
 =?us-ascii?Q?tvfh82m/ul1tqkD/3dsVClYwzsY+BoOY0QsEmQ7fqxstKvDewYz2IDUEMtRX?=
 =?us-ascii?Q?mtoO9xde/1+xZRQVa7FWlDkRW3o3bYDt/CGnBd3cUG2UpuaUisVSex2BMwyV?=
 =?us-ascii?Q?994Ohvfsd1SDZRSIqx/bCsymJ62ieQciRMknOXoVQoVZl/L/f73jbxnUp4bh?=
 =?us-ascii?Q?+glmb4/vm6WZf/r80chwP5pIxLEz5+AuOzsnLSDHPA9Rk96NAXqlEI2cO6Bb?=
 =?us-ascii?Q?YIVN5HFLBJsjYSLcuEo7r2iawccfLeMQN4RM9CyZGy/cVLSLziknJHJQlwbm?=
 =?us-ascii?Q?3IN+eSAY0jQqsq2SmDgC67DSPUNqbpOLEYZGvSflfQ/dh5C86b+R9jkHIPot?=
 =?us-ascii?Q?INTTMr7EUz609MdzVFeN5kvbeMd3nNuL0wxQqMyyUmMP0aDpL4zfiK9S2xCo?=
 =?us-ascii?Q?Eeud7BfmiAyfaDlIUNddmJx4f2xv1v0sa+FcJCKX3wJlcUSHGJ0KMOtzSrct?=
 =?us-ascii?Q?+MU/3emn9ZeQ3sZjWABH9Jbhafi4owFbka1Xi3ELGeyCMA9zXWp7mKAKf6b+?=
 =?us-ascii?Q?N/UmZLs6dRPYxNidr94dpNmkhzkrR3WH9xeBcQqqOpVHf58V0GTZKf3B5q/Q?=
 =?us-ascii?Q?c/+jhheUtct1y30cE9V/SxQy3qGsUSXmmyrPzDQLUNcgrnLOXJobwm1gnoet?=
 =?us-ascii?Q?bvPHicMdqszkhd/tUQIWbRUc9NiGTFJYAE3sVn8AlkZRUR67dWxeqkEhy8PZ?=
 =?us-ascii?Q?l80tEGycpktm6e6tNBgKS8oxoZIhwitRAijVB6zw6k3m/RMWsooq91ITf/Pk?=
 =?us-ascii?Q?HiSzH6jZYvVL4eXioLQ+opjJzu88nOnddVsVPVwLkmTlE8mm9tJp1J/KXaKD?=
 =?us-ascii?Q?RGLiODwIXbWxTm2B3W0MF18Ic206e0ocQiR8wAj0P1ggOUd4MRwPVwLqTvyg?=
 =?us-ascii?Q?Ly2xkJgYMJWQXiSo2bAStnJdO+4qHAa+/C1jIrsgYr+CeVxYpXdmVbtmRo5n?=
 =?us-ascii?Q?4jBQCmmujfiHFWtccaXuMHQbEbiYu+3BsF5mbLX8P4nBoGmY/jL0ScFxnBDC?=
 =?us-ascii?Q?ioBQSOIJs3A8Z+3nV6/ZxPtfjysMYfLoxl9QEkeWFi7kwIBMfjBEB/bd1tHV?=
 =?us-ascii?Q?XWyHJ8Ue1iX+RZ0IKXTQo+MICY0yARR41NSCONrqvFuFm0JB+1aBQk4+1JBo?=
 =?us-ascii?Q?3XJ3DzA5A7KrOfbIkat31OkUPw+Wkvmq95rZdW9J97TbpHvxLwyP2SCtRIQO?=
 =?us-ascii?Q?yWfIc1WygiAEvbJpQPNsTmn3JmfExduIj80Ig8i2EJlxxaGxMPSZU4UEEFl1?=
 =?us-ascii?Q?86zWBNAclka2cZTEOlwNbSX8wedVTps0FzFsjQ27CkhEtxFIcrYD0qhDl5Oh?=
 =?us-ascii?Q?L672wMigpyLh1QtbjbypYRWNXOZ3mdyjA3yqhbpf24wj1m3S3ry07DXwek9U?=
 =?us-ascii?Q?vWPhQtKifMraG1aKjTsIAcrZ7nxEQzTJIIkbwnrqb/+JYoJ6clj9QBcvnEri?=
 =?us-ascii?Q?/Dn+iunNb3oaOJaPrP9hwFNdEvbl5Dwuc/sfBhT/0eE8aYF+ZnhOwj1VYtJ/?=
 =?us-ascii?Q?yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de47bb81-6afa-4bbf-f293-08dd4984a4ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 03:40:21.1907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFJ+GWVXrcnzTHdKchgTqqZ1lpFXwgoqLECZiSl9kV3+YZgwCfxDuAWR5grh3PQ/HvX0R4NKlwVi6rFQG9mwiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8767
X-Proofpoint-ORIG-GUID: EyxRWfqFLwzAj6CszxAg0xangLr1UPEU
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a97529 cx=c_pps a=c8UlD/aNTkVRGuk1JCy5IQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=sHnbhYch0j2JuwqK-N4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EyxRWfqFLwzAj6CszxAg0xangLr1UPEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=788 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211075

From: Chen Qi <Qi.Chen@windriver.com>

For now, python3-bcrypt's ptest package does not have run-ptest script.

The ptest-python-pytest.bbclass has do_install_ptest which will generate
run-ptest. So the do_install_ptest in pytho3n-bcrypt is not needed,
and it does not generate run-ptest.

Also remove the RDEPENDS setting because ptest-python-pytest.bbclass
has set it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
index ce9237de36..004e8ce8b1 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
@@ -14,16 +14,6 @@ CARGO_SRC_DIR = "src/_bcrypt"
 
 require ${BPN}-crates.inc
 
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
 RDEPENDS:${PN}:class-target += "\
     python3-cffi \
     python3-ctypes \
-- 
2.25.1


