Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BECC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:17:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22422.1747916253233289621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=723726bc0d=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MBlKq1011647
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:17:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfwtg8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:17:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSoD3MmKb1mhdJ/f3NbI5LFDu6yPMlbw/2+Eqq2N8/DvpMa2+BBQBelACjRfcARKWA9Yhk4nyRtCs3X2Irk736hmOOB+ld95CJFay5Yg4W0lbDOOhtsw5fGIFY/gtMdiIeikewRDVXmNfbE7PFmASxBn/2ruMfIBaiYz4DgWVlF4zqMmG+pyvwuoMBzkdu+sHSiuFA6PaqQ1Yilsx/TfqZS4PjG2mWdTXQhvOdMlEkXfn9vHjtA3jNbJ4TzPfwRYFn/7qDWXuw4JVsOmrZNXRt+KgzhxrJ/0PoqiwxvvARODYMGqGgvp5abqK+LBRNRXp0ErJSMEtxJg4/mNriJj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZdCLO66lO6pkQYBaKCnBP6itt58qi4EUa6I8GCOoCM=;
 b=nvx4a03cBuUl+P/+WqTs3KhizAVo76o3AhoimVehq4zowN+GFYV5Njo7VsUsSoEtM8b6ZJHb3/7bwUZp90sXDwmbXPYmKyLof196agyYTDaArhwqGBaHb4J37okQnFcKmCxpPuW7rWvv3eU7GrgzEjg4i9oAuDiQJ1x/gXEMRX8A+2xFht6/VM6rprBw6BDoKNNOCRCLkiqA9xl7WNuGl1e7syYI5vrUNW2A48sLC3yUo2IvRAZetORe0Uyz/DTJ/h3VqgaD93Age+3L7uov2NIhHJRlEEl3RvafhbHOSKEaP9byCwK8bsH5qiN9KYnrYLnI1FXBcVJlJHbpaqQrKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:17:28 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8769.021; Thu, 22 May 2025
 12:17:27 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Fix CVE-2025-1180
Date: Thu, 22 May 2025 05:17:10 -0700
Message-ID: <20250522121710.3923755-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:208:335::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: ee689a2c-4ea7-4834-567e-08dd992a9e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B0N+YPWKw5po3O5n5MKihPwQw6KpjlsPKzlGn9OLHtutTDuJNkewNL4oSkr5?=
 =?us-ascii?Q?j2orSfDgAkgb9i1vPRtOGAidoPWbvYMFQn9LyjzsdGPcgezvnguwmmhsxBmQ?=
 =?us-ascii?Q?fOE3LrX5nvrV0MumjWE3YMuUu5FVkyQciLJztn0XatuHnxhwVjAgDHwKYpm2?=
 =?us-ascii?Q?Wk7Pt6Mo0J/Y1FBNvQwx462KV0ovUL7MGzJXL1ddU8eN22QqrEakm7X2VkIM?=
 =?us-ascii?Q?YYWr3Xx8V8WYS4yCihMD+VJum5s8poTFKF1N2fdiQMuwzACfl4fxMxRs0rjH?=
 =?us-ascii?Q?XwumyQvIRRSzIWUZR8JG15/MrP6CPCZACdQtIceC7/w6xZw8jxEZiL6y6FDj?=
 =?us-ascii?Q?BzVhXr4MdpaoLV7FV1oChm1mlkz8P8P4bPaaagw9VZzFNwQHIy0KIcsZKS4e?=
 =?us-ascii?Q?bmpNMBAex/AGj9hvxzgdkarXuLDM/nEaazzcKcobK9pFmHZ9AZfZXG8hUmjp?=
 =?us-ascii?Q?z1d8HgO0mpTiPcru3nZeQJD32ES+zim0KCY0ad3oLj6X7uAhcP7LCneGn0q4?=
 =?us-ascii?Q?YyFtUP7fOTdp20SC12LpZG7WH5MaxDzSKdB9tEo8LfOuhnEAZ/uus4+mtr9J?=
 =?us-ascii?Q?p9jlvnjCZT2KRvgecMHAmHZyOHFqY2zVYxUPYd+yyiVwWGLXFvqQWoKfw12d?=
 =?us-ascii?Q?EV6xDtNn2ghvMPjygtA7s0JUNnwrF6q3ImehnGGKlbZNEL8RctRMWmCFArTq?=
 =?us-ascii?Q?ROJpCzEbBFBvWgLK3GqGVIs+rnlGZS0GhpPto0SyVr/1tz94udy6x8B5Rh2q?=
 =?us-ascii?Q?V+Y//M7duytp9Zd8WUGMx3kbMnD0xrThYOr/e7LQpX7I9KqX185HD79wqXHa?=
 =?us-ascii?Q?4gc9eC/1BvD7yep9z1rJA8RktquRyfbED3yJmIalSLnOqtAu7AnhAtIBkiod?=
 =?us-ascii?Q?sOlI/5sh9Vp6upPatYRuX57qWOVvtHo8Wkc8TFNyruv43ZfyccCxqU4cllhH?=
 =?us-ascii?Q?FGUMuj03mRUV9IpGsAASIQ8zIcaIGu+S5amKemnt3wxIF+1XJL1UVpmkp+oQ?=
 =?us-ascii?Q?pHACoCFrJZUYr3WLdBc2Nr53GVzVx7WR+GI9UidP/yTGKX6ApgLBeZYjsGJ3?=
 =?us-ascii?Q?Tke4ZpZQmeG7yls9E95VcI0o4K1EBuOiGk11Lu3ZQqvCEzvH2NpszUyXXP/O?=
 =?us-ascii?Q?8bkKcRe2ZinKsWCHDYMEKbxb+c9PlVqtTbsrHg2DK8I5fgTdL/3y33d2lHwC?=
 =?us-ascii?Q?XA2gdIeLvb21dvjdgP3S/r7rWpPMoUgO3X9SOJhp1xImVed1Oy33Ma4XvA4M?=
 =?us-ascii?Q?qHmFwacbEsXEnr1d2N7gLV21RsF5GJeG5bAjVyPLrVf48KqZgMkUrmFW/N5c?=
 =?us-ascii?Q?zaVY8uSvGpwy5DqzpNZyjxZZTnEdtMpxU/WiHB0AYW3p6LSQwc2rBDDJuJ3Z?=
 =?us-ascii?Q?yrEJ0P131AQZTVWQnK+4Hp8WdoXwZYqy58jv9ZvudOVAtQRK/oE21PjrX8xR?=
 =?us-ascii?Q?cJUoGu0u48plcGdgzasVrUKF6SUeLqfs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kf1hIvw5gZyEd/WaWq4IFYG+LA2qk/BfHCpwruo2DSFgCtRZh5Wipu79uNNl?=
 =?us-ascii?Q?CQisjVyhfh3jiDB2mbuHPKf8slE3/jC777omj7cl6FUJmW5rhQZszc9BGJ3Z?=
 =?us-ascii?Q?o+s5c6EcYBySB7b730Z6rbmI5HWijs/1nUmkNMuiIyJhKqiw4F8FaudP2x8v?=
 =?us-ascii?Q?GGn24MmHxN/frwVLQwf2C+4v3tFY090aLfT0PEJl57VscbphpaEcVAZZ1QEs?=
 =?us-ascii?Q?t3xTN6N6EQNYA1mZMYyyxMu83ZzxOpjMUzOjnxt+1RuebdEZuo/EF5UqSj2x?=
 =?us-ascii?Q?BkCACP6lwlUOvcQbr0MMAik9I9UsJnYPXcGziKh3kBN7J888Bp8MeD3o7/ap?=
 =?us-ascii?Q?WPaMDJLnvF9TJ/VqBGdy3JraGnhA++mBCua+bbVr3J1p2olhLGgJYaremhva?=
 =?us-ascii?Q?sRpTovJcshKjk+VEz4LQnknnRHyTZupA/ujQoWOM8X1+fOF2/wqM0muSloVs?=
 =?us-ascii?Q?6LlE+8GNav0SFHT1mfVhZXiSVvv9KbRkC6nmP1SyQ/SEWmwaLhYTacqlkgCr?=
 =?us-ascii?Q?WvlKp8a9og+gQilfBluXG9A0k2/mpULw7vuo2s+YugPVC21MLQMBWpE+JdL7?=
 =?us-ascii?Q?70F4wNFt4e0KPVgcghePcSpzvIOw1gQ1r48qD6cO54Z7Pl9EXc4jjKg7VV3g?=
 =?us-ascii?Q?ofFzYaEZIqmrUBrqeMg4REkZnozF0tJymsgtpMP4ZEhaYMEcc4htC4k5AykT?=
 =?us-ascii?Q?gknZPLQs45I5dCftI55KdH9quy04Szh+viTdtoz0hjklJFS6baVlsOyVV8iD?=
 =?us-ascii?Q?wA8WFfZqErzlK4/QQAdLZSaNclIkQ1+Q4DJtoemhG+kU+zEad86GI32NHSce?=
 =?us-ascii?Q?NaO2TD45zSWZGyw6G2uywfOWVs4fS1hPgcjEloPn8bnln5rRp1NvtEZuw/+3?=
 =?us-ascii?Q?kDl/uOmZNbGyXld7VC5IPe4/3qX0lOke29AaAx8zYVQZK8FBdqqLb2Iyi18k?=
 =?us-ascii?Q?0O+l0UWyq5UODndwg7bGHA5O9ryEzkASWo51Uidm/VZr+m1CRSpyWlxidazn?=
 =?us-ascii?Q?O29Hv/lWHiATyx199bbT9HfnS21THQedNFhzEcZdW9w0TRUPPGgVe73uGQs9?=
 =?us-ascii?Q?UWE3WVG2RKHppyORMNI7QmCG3Fxb0t3Jj1PbyHNO7gEBZC66IGKOHA/YCn2/?=
 =?us-ascii?Q?RcnlJ5SWgpDh4ZYDSrcRSpO19NUXK9iisA/zsOg8TCjmvG0kMTUS8es5FAwI?=
 =?us-ascii?Q?NHr3EW1fnlsmLYBTlO/5q4qxJoAZprmLnNxTIciu3ecMCUlc9zChh+OOyUv8?=
 =?us-ascii?Q?L8sbpx+iHB1qeOUqOuUIuzVQOOlSiWtIFsrVxoUyETAfOtAioxfkMGokQbL2?=
 =?us-ascii?Q?b4AZ9ClJ/Tneu2sR3j1Ytdm3hvLHyLLg0dY5M3oQklMFkFSwABura2ZQebhs?=
 =?us-ascii?Q?B2ML/ZxCIPZ4gJWPaJntTx2zVRyhk8uymdqa2ONJZetJKxK3VpR5V7QfrKGu?=
 =?us-ascii?Q?rbfl9pMcfEf2bInjOGuT/ITwjgcvXSo6rfPWUrmbmFhJXJLlMk7cIFnMKvK2?=
 =?us-ascii?Q?sh+Wy061aQIoFZN4nJ3wb8n1D+LmIJigQk58qj3cj6JRc5FWayEiia0sk7ox?=
 =?us-ascii?Q?qSZ1243BZgnr5v88ep5c5yc9kYyBmxglCo+Y6ZPU9WCzqiXR9cJ6JodGaCBS?=
 =?us-ascii?Q?fw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee689a2c-4ea7-4834-567e-08dd992a9e1a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:17:27.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3Z6XSKxUxg9ET5/MQZJUrU3LC335dNil0hYG1Dg+SWMKAt8sP1BvQpuSDLpywfbQd0a9+wHkMnCV8k+8m4eZ9G8RPXxPA9XFUue1id12Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfX268kA0kqeoGU NGGfwXp3e8zyADbP4vBiTBUaIhkFxmuqjwQzGwK51JYCj7QfkA1dnl6AkM7iAHjACleXsX29Zmn 7pKTQ/UWtvPSzD2kTCaWkbwQct7QcUmLN0IPA6GGgI716hm4P7gVYOyqEZhsapA1YnnY6zLEdCf
 u9urvqBPkbqcSiXa7N0LCIc+cip1DT7pnEiCCMZhdXwNcQKibnC+hOM/uhklbqnkG1mQqDAyjtA YAC0g2VBUQzerAMh+ovN/d965oFnd1XVRDaF4ZV5e6tIckStEryhJfeh1C83ldyw8FaKZsjdzLv oPqzhv218xzAzV1GxwqMpV0/Plyg1g/N1xXEhowqDHOSDPQyUVHc2gFuuGhIKaxXLHTh1GwaIWt
 0/b0trcnbNJQnMIH2fkc4wnI6GpM++cS+TyjVEtXtphKaSsdI+lcYQXb5rv67VcQ6EHHmxfd
X-Proofpoint-ORIG-GUID: 77xIkHDOgwzs8ZxqW5Okplc6nk0uCqmQ
X-Proofpoint-GUID: 77xIkHDOgwzs8ZxqW5Okplc6nk0uCqmQ
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682f15dc cx=c_pps a=BfiT+f4K8gVEfImFRIf1tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=H8h2X5dFQeY3KuWU6QgA:9 a=Nb4uE5ka7GsA:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505220124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217093

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
CVE: CVE-2025-1180

cherry picked from upstream commit:
https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=f9978defb6fab0bd8583942d97c112b0932ac814

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.44.inc                |   1 +
 .../binutils/binutils/CVE-2025-1180.patch     | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.44.inc
index 6bc65a0fea..256d408018 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://CVE-2025-1180.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
new file mode 100644
index 0000000000..073361cf19
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
@@ -0,0 +1,165 @@
+From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 22 May 2025 01:56:17 -0700
+Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
+
+Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
+in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
+ --gc-sections --gc-keep-exported option)
+
+https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
+PR32642 which will get fixed with commit from PR 32636.
+
+(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
+Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
+CVE: CVE-2025-1180
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
+ 1 file changed, 44 insertions(+), 44 deletions(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 6346d7e2b4b..d765b688801 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
+   return true;
+ }
+ 
+-asection *
+-_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+-			     unsigned long r_symndx,
+-			     bool discard)
++static struct elf_link_hash_entry *
++get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
+ {
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-    {
+-      struct elf_link_hash_entry *h;
++  struct elf_link_hash_entry *h = NULL;
+ 
++  if ((r_symndx >= cookie->locsymcount
++       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++      /* Guard against corrupt input.  See PR 32636 for an example.  */
++      && r_symndx >= cookie->extsymoff)
++    {
+       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+ 
+       while (h->root.type == bfd_link_hash_indirect
+ 	     || h->root.type == bfd_link_hash_warning)
+ 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
++    }
++
++  return h;
++}
+ 
++asection *
++_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
++			     unsigned long r_symndx,
++			     bool discard)
++{
++  struct elf_link_hash_entry *h;
++
++  h = get_ext_sym_hash (cookie, r_symndx);
++  
++  if (h != NULL)
++    {
+       if ((h->root.type == bfd_link_hash_defined
+ 	   || h->root.type == bfd_link_hash_defweak)
+ 	   && discarded_section (h->root.u.def.section))
+@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
+       else
+ 	return NULL;
+     }
+-  else
+-    {
+-      /* It's not a relocation against a global symbol,
+-	 but it could be a relocation against a local
+-	 symbol for a discarded section.  */
+-      asection *isec;
+-      Elf_Internal_Sym *isym;
+ 
+-      /* Need to: get the symbol; get the section.  */
+-      isym = &cookie->locsyms[r_symndx];
+-      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
+-      if (isec != NULL
+-	  && discard ? discarded_section (isec) : 1)
+-	return isec;
+-     }
++  /* It's not a relocation against a global symbol,
++     but it could be a relocation against a local
++     symbol for a discarded section.  */
++  asection *isec;
++  Elf_Internal_Sym *isym;
++
++  /* Need to: get the symbol; get the section.  */
++  isym = &cookie->locsyms[r_symndx];
++  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
++  if (isec != NULL
++      && discard ? discarded_section (isec) : 1)
++    return isec;
++
+   return NULL;
+ }
+ 
+@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
+   if (r_symndx == STN_UNDEF)
+     return NULL;
+ 
+-  if (r_symndx >= cookie->locsymcount
+-      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
++  h = get_ext_sym_hash (cookie, r_symndx);
++
++  if (h != NULL)
+     {
+       bool was_marked;
+ 
+-      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
+-      if (h == NULL)
+-	{
+-	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
+-				  sec->owner);
+-	  return NULL;
+-	}
+-      while (h->root.type == bfd_link_hash_indirect
+-	     || h->root.type == bfd_link_hash_warning)
+-	h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-
+       was_marked = h->mark;
+       h->mark = 1;
+       /* Keep all aliases of the symbol too.  If an object symbol
+@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+       if (r_symndx == STN_UNDEF)
+ 	return true;
+ 
+-      if (r_symndx >= rcookie->locsymcount
+-	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
+-	{
+-	  struct elf_link_hash_entry *h;
+-
+-	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
++      struct elf_link_hash_entry *h;
+ 
+-	  while (h->root.type == bfd_link_hash_indirect
+-		 || h->root.type == bfd_link_hash_warning)
+-	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++      h = get_ext_sym_hash (rcookie, r_symndx);
+ 
++      if (h != NULL)
++	{
+ 	  if ((h->root.type == bfd_link_hash_defined
+ 	       || h->root.type == bfd_link_hash_defweak)
+ 	      && (h->root.u.def.section->owner != rcookie->abfd
+@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
+ 		  || discarded_section (isec)))
+ 	    return true;
+ 	}
++      
+       return false;
+     }
+   return false;
+-- 
+2.49.0
+
-- 
2.49.0


