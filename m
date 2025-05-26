Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2518C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:01:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.23802.1748242906731618139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 00:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7241b4366a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q5jJ7Q000520
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 07:01:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u5391cpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 07:01:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMixc4zWsqiDIRuOQHa9qal0aagnR3SuYC9XuG7G5AZ2/K/ZZLkZANi/O+aTmVq/Z9+heBOcsUeIxeO/gsrvhyPxLEwtFC6dPYqZwji9gMEjkJdPx6acyKnQVJM+B0qhmytuBRDZB3fNnU9OVgNVZhjScdo9itegS3GIBCz65EmevsOcqWClOyPVauDvRsbQovECB5ckVr2oyjwp60ib0SMrfoBgzbRBHOBifvl44iJsH0sXrjKxe2sU9xjLbzYL56AJJADeKgx17DZTsOZfpuumxZN6TBvEiDzGr/XCy5072wZkEmpk7ftqObWx4BbMq7WlZ/Sx65Z3etBGQZWSGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSS4M9rVf1dPXAJXKrO38mvr571p0DzbaSggUFCFEro=;
 b=YzcPNvmry7Y5eIA33FXPbPOU/X+u9X5b9tzRyYxnYo/7ifVqSKRr9YI7vjOMhfgxVFXDCWAEd755ezi3hoWWEs97UTgzfDQGeb71sYnM/3Z6PNi2owXdmmPx5NRrXJhvjw2LX8NtAoSHDJecH38MUcgTxjF1XSXFdaLy5KSUc5lj5LqemIFvod0vyAgy8xB1l7hpy2FxHVekFuwuMjzC+/Jf/dfaEkPrPLuLirW1y0Z1JVBd2eCkCvPNMFUZy3oLbUFaXBuu9SDlm80DkjKM6mayCIY547FZIX+snlbZrGU6adclD7oU/cAWEhBFIoFDewqkQDYh7KfW2CBjgJVrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ0PR11MB6670.namprd11.prod.outlook.com (2603:10b6:a03:44a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 07:01:42 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%3]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 07:01:42 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] sysstat: correct the SRC_URI
Date: Mon, 26 May 2025 15:01:24 +0800
Message-Id: <20250526070124.1356362-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ0PR11MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: e0592372-09d8-4070-3183-08dd9c232b0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SgenGrym5Av0eYyWi0JpzeWhP5rGP2eSZjMLjVqP1MxJ8YACqzbWi6Vf6mSs?=
 =?us-ascii?Q?0zxkPhxrc+JD4uQ2I1GJeqTO6SwEU+VwDKLHOZitYw/OEE/VWRf+ZffCZK6I?=
 =?us-ascii?Q?dWM+3wnfgBsE/HsubWwuse1REa+U/1/uNNHV2zmOEDrtQ+rF/j2mKCcAPOH4?=
 =?us-ascii?Q?h7runnvZGZUHJs3lU8XxOGK7mpPNbedwIeEj2wQU2seJ4bpfeHgnFu+YSSTI?=
 =?us-ascii?Q?dDCPfUFqgWPIj1T09g96jqo3kew0MxQM+DN/aIMhDPwKn4DRkP4oMGPlyaYN?=
 =?us-ascii?Q?Erq2PC0R0ww0//k45uYfecjfmIY8C1PXGhQxogWpocXjHHPaUoIaVS6IP/8x?=
 =?us-ascii?Q?jSHcBZi/i6vW6ISFbdpWfxWFn0e8a6Z5L8EVCHF4c3Wk80qs/utOJ+uUVd2c?=
 =?us-ascii?Q?cLXfMsoh2I9iLUWDInUECX7bJYRj3ChCzSI6AwgJyf52oWdDlip/WdkDURcj?=
 =?us-ascii?Q?hbl9GLNmhno17PsjflyK/D3FtGTcsjg108jkI6EaxzF/s95kXfXT3irAvvUP?=
 =?us-ascii?Q?hJaVEUEjm0ufbtXCafmhKpa4+MUhJ/rjc28rVvNdPkcRFUACzl/TqRV5ynOr?=
 =?us-ascii?Q?p7DNwJu0ZJX+6DrEjMqEga1e/GSz+FCjkIx92cAV2AjdANtQS3O12DfZXxm8?=
 =?us-ascii?Q?saMcUR1trZWjkQMWbIC+jAUQriVZbBFRkmcd7NA4EgSdNG6hTCVUUN8Y0Byu?=
 =?us-ascii?Q?9kGF48vJwCa+cpbjIpyN4xwn0KyNdK7nihjElODKmbfdB9rX3+D9V2+1eYQk?=
 =?us-ascii?Q?tnHO5wmKNGClKflaeJHul9w4Ho25lGUCPjAmtRFq7W5616UQ2HKmLdRdEYr3?=
 =?us-ascii?Q?XcwTs/mlZPOe1fJtYt5SisAPspG8MfBfDNsYjrJRvBHcrtPBjYDOL11gr4al?=
 =?us-ascii?Q?JbgcrH/9PmFTva7RADXZaM1CDFxkF60oJp+M4+npxySjAGZ0v2clhgIPZ1SX?=
 =?us-ascii?Q?fmVLO08fPdpn0FpWIjlV92gYCgdG/HlyWH/X1akR8Se3qU2BTKdQrSRcRpok?=
 =?us-ascii?Q?j3USbqldSMgK9/fdZ/lvonWCdV6vLrAq4FRou6gpEMWVzEOzL8fsdo5FT045?=
 =?us-ascii?Q?5gN/Q4l92XhhG2+yN0kVIwzdT+s63SOZcI9GJFZA6RDYrkPm9k7pYMKIwl/h?=
 =?us-ascii?Q?j9jODkow+klUd1zXUQalNEx6mTLXenKoTrIo9tkJqK+/zMqM8ojuoi/2HRPz?=
 =?us-ascii?Q?7HbxF906+5u3BI2wQfwNh2v4QFosIKJpsBf6SPbs2ZQ/qmpTb1pPrQt61Q/P?=
 =?us-ascii?Q?lUfj5OQ7dP3CYBGmcxjhEj/WMro4I8aq4BZruO/F1UYKAN98OBAFsNIKC3aS?=
 =?us-ascii?Q?McWIBEAmy1w0HU2UD9YG87+7RaHKEjenCKwKnMWF3ij+f/RVn77+NtfDy2pG?=
 =?us-ascii?Q?JY0VRggh94xZITOHWVqkBzG4Lkb1L4s3FpWlqRJJE3KSISo84GhzgU40WB1V?=
 =?us-ascii?Q?/70tiF6ryVM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N+581lVdIDzc37hyD5Aoccyy0RfXogV3JiC7BAruthCvd00PiOTNEo2gApeQ?=
 =?us-ascii?Q?ad5Eon37mUsM1XXn62bVCxXULPvcXu+lVhQLcIPh3/oI3+60WeA889moYZ2X?=
 =?us-ascii?Q?z0IvO/2P6obHuqynfx/e3D0GhBOXMM3yP6UYCQylA5edroSCl/QdDoiTySFy?=
 =?us-ascii?Q?bURszDSZjeL7jgSNOSNucwcFRY5o0Y4JPCLGnssKcMrzkAqFjZDaCv5hpxFh?=
 =?us-ascii?Q?8WC5Bx7tOPpBcoRIYbceC5niU6zkfmQJRw4v6rTjZAlJTTvNC6T6ssHYcjMa?=
 =?us-ascii?Q?/E7pO3ngXL3ziBBa9q1JvvCPFztDZiOi9TwAXYf5NjmY5laHa7R7BRgGNEbN?=
 =?us-ascii?Q?xbQJaK0kY5caVrC/Ltm1V8kfZgBeB6QcLLKJkVy52AsOikEKmt+tdAGlDoai?=
 =?us-ascii?Q?kKUlIlwt0O0ZDBf9/AX1bwFjNZ/AIdUtmFgmdIHM7lAj/i0py/yEpjgXAq4c?=
 =?us-ascii?Q?kB8gAaH52BBlsB152TXdjj0xfsjB0vncGJvMtY0kQNfpc51nQ84MjrfhsUhq?=
 =?us-ascii?Q?BYWNafDCMA6cMJfRup8DZCYI4kxp7w7yTtQomslwFRgMrj8zAYPIi+qQyssq?=
 =?us-ascii?Q?oXQ7ZZRWXHE+c/RHFlPnpFfh4/fadxQp7BmhSW9WOqcZ1m2h2iClzc/qYjN+?=
 =?us-ascii?Q?ApUIbm8JDLpr3KMbixGGwlWWc0yKNLGavKzDspC0u/iZjYgODFNqsX6tlSYz?=
 =?us-ascii?Q?QT3NLjDV5G3Sm5up8PuEHLMTChEA35cdkYLuDzIxFdP1u6SpaFayowyiQiPp?=
 =?us-ascii?Q?TBrAhRn+SH+VQAUcjnEgrlRJ0TOUlB8Zf1YusVA8+vN8LJnv7wxbzhp1QaIh?=
 =?us-ascii?Q?7T3cFvutJbEQSJVWnWhCkHu9LIGUqEAMoXbHmvjzJv/vV6p+FKNNfOOaFVsk?=
 =?us-ascii?Q?KOgW1PFieLF3U+xS+kzCp67ZGJvVQqmR5uI/rWXsEeazgFyvR26StcmU+hJo?=
 =?us-ascii?Q?H93D4mN/Bqr/h1s8b+XOSCs3vjlfHvSI+UN35LyqUnWFuFD0b4H8AGyXO4MV?=
 =?us-ascii?Q?fmiUef8t1pwvgjC0UON5tPWlq5eSyZS7MuvfvelnuddTgsMxQ2TdYRyWQgH2?=
 =?us-ascii?Q?G9tlyW/B774GAMXoiWBAe/ypfmvwW9j5Co8SCbgUZjK9ktOLY3ZpMrzcdMM8?=
 =?us-ascii?Q?FlRGeBVufvrYv6SHF4u8V0R+K7rQ1HCWrGPmGg2wNRBaiwLADS0nqs150YVp?=
 =?us-ascii?Q?lsoATYVOXPVdnpD17Gh3b6xNq07phdEItnvYwUAA7y9P7sN5eEi+AtV30mhm?=
 =?us-ascii?Q?HAb02r2moHmBI257n5Cd7gbx/eilu5Yp2pYjLkjMIHlvd83dfnL/hfJqb3u5?=
 =?us-ascii?Q?4WqSOSBIO6wUCELf8aSAuhUKZHvCLlHZ5NfsVq62TjIiMSr7TJDkER2xXCS7?=
 =?us-ascii?Q?NjOZnPRUCnEj3IYB3bSffOWjnK9hk8hTqk+mimLU8qt3hzrzGABYqP/qPDHm?=
 =?us-ascii?Q?994xvQYvpJStWGOezr6E1OnyRvcTSun0S52mM+P9zbbAJsOVpRPNJOxTg7s7?=
 =?us-ascii?Q?BhQwA1lQtTTTueMdWd28aUdnT2+fq5TbslW2C8ecIiTHOKs/WjlO6xVetAdG?=
 =?us-ascii?Q?RE/jPiPQQfk1LeQgHLgmspXyTSwvgNYPxqWXZ2wI5tZtDl/6ueLUSDuxY5/y?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0592372-09d8-4070-3183-08dd9c232b0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:01:42.0191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiR3FHUHox3mCnz5njnKZ8C8MfmL6JP81AGblVOB/YXFTHprGRm/DU02oJRpI04dnnoniS1GQq4/Yq1IQtYhk8w5EH/Uz50t0/71gbEso+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6670
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA1OCBTYWx0ZWRfX6WyX3/zk1ghN nHzRY8SntnVlcKxL1n6g1OGOIDr5e2ml9bDVzMJPA7HHDA2Mj8dFt7yZTsev+jsoMULQDVy5nt8 Omrsy6Os4m9oCRvVfr2DdwqaJeUZlHaWq4aDbOCHpULkSo+RmXB3KzFQ9vqSoNMBMO8BiZ4pW4g
 T2BfV5B4RiXrzghGcr7+7JNRiw7LFtE1FN3yvps0fNIV0+As5w/hz/hKATHNrULxI55Oif82cxi zD8r5xOB5/TGWabnFExTJ76/fVnQhvSFvg2XldkuT6PwMQ84g5g3WQ/3M5qv88s1J/6BwI/w98l 2PyTYPHBIei8fC0/6XUb/dA2hmXM0gIQOB9Pag35XHHEtXWDomgphkbPE+Jsf/T76xAvl1lYpzz
 JHqTIhZtLq/d+hfarvvrNHqT+3pH/rwzifidfMVC94to7P26yOrDzGAyOfw1MJfxX9JtNDk6
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=683411d9 cx=c_pps a=LDhhUp7+I2fSpfpYFg8AXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=UfCy49plAAAA:8 a=t80VaisKAAAA:8 a=t7CeM3EgAAAA:8 a=UgPviPxobGNiChzhi5wA:9 a=tFQD9lyTa14A:10 a=YOAhXw93GYYA:10 a=bGsBfvwO0riRclnN_bbC:22 a=Qr9WZOfhgF_NPYegn-NS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DHtv2t7N6WtiN4e74taDQS981wWzAqSg
X-Proofpoint-GUID: DHtv2t7N6WtiN4e74taDQS981wWzAqSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505260058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 07:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217255

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI of http://pagesperso-orange.fr/sebastien.godard is not available
and the tarballs of sysstat are in https://sysstat.github.io/versions.html.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 77337722ea..45236e893a 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -1,15 +1,15 @@
 SUMMARY = "System performance tools"
 DESCRIPTION = "The sysstat utilities are a collection of performance monitoring tools for Linux."
-HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
+HOMEPAGE = "https://sysstat.github.io/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "console/utils"
 
-SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/${BP}.tar.xz \
+SRC_URI = "https://sysstat.github.io/sysstat-packages/${BP}.tar.xz \
            file://99_sysstat \
            file://sysstat.service \
           "
 
-UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
+UPSTREAM_CHECK_URI = "https://sysstat.github.io/versions.html"
 
 DEPENDS += "base-passwd"
 
-- 
2.34.1


