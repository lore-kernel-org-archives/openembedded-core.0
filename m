Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA3CC3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 08:25:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5843.1720081501095722436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 01:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7915407677=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4645ebaX010928
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 08:25:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jrsg8uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvVBmZa7s1DGXQnjMFzednOl0giH5zJbbzWBnPhBDN8PgrxWKiAjWzq5aVAUWTq7NMplFNM89ho2qBqrvN/71Kb+E/JtctaIDGJ90NEiUa5yCt+vymT6DDrhf8isWsLO3vWhQwPX3Y7JiQGR9A/mF30rNM6A0hHRQJ6/NUhaY13LeCl8xZwd/YXO0z4xVxLYI/lojnH6uQUfsis7Nm/4cFqjQFluch5XytK3wsHHljJGbwCGzYTCgQ1LpUumItQTWFa/sinxfqwB6pCQP9Ncfnuy/bH5509w6I8AlutYn8e0/TRbxeaMqq/+7Rtu8KI1uYVrFQrLV8747HFkaudOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGqTuU4RpNXUIQ+ooxri/M+NISN6QH9iRBxEYVrG1Ug=;
 b=oUWOnbGX6Knyz+KYd53vYLhInxZGp7auuMA9TyE1g3ZaLYvc3x2tqsph3MCiPNcYAh0iqNxinOMisJhNLn8qkDWuilxd1V/hsic/QbO5VHf3J+oiCkFe6hp5dAye2iuelSUVZbDAeop/1mJuy0NPfOHvsPvSFKNNqC4gCQ6EVtlD/8oB+jqTZ4perVorpDiD0c4ZhBD0j+H14BY0R/8dUt+nzObnXNOmmQ4A/fGGu5lQNEoLKFm/Q8vDj1nhOauqiUtMERSrAQjge3YR6+/i5YVM4yNdYEKuBC0DzjQpqg31dt3+E8EUwbQxkBy5cR8+ePL3g9QqCcffLfTIgmn0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:24:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:24:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] pciutils: remove textrel INSANE_SKIP
Date: Thu,  4 Jul 2024 01:24:42 -0700
Message-ID: <20240704082444.3886275-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704082444.3886275-1-Qi.Chen@windriver.com>
References: <20240704082444.3886275-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0038.namprd08.prod.outlook.com
 (2603:10b6:a03:117::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4649:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b7feb4-207e-4718-44ea-08dc9c02c9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ttfIG1/UU9WRY8NQK3fw8mUaAUcCDBAE0j9219P3KYTLUHBb1+LozqqRS4Wf?=
 =?us-ascii?Q?SjRokWr9qzHbQdMmVD+fm3IjpPvFKAHqkJMFyNfYM6fD+wVfpbpG8bsr0qtW?=
 =?us-ascii?Q?vd+JnVtrK6/gMEvif9UHxQDEYmifwaLnFDEAsBxdFqDblWFYYw+y6ZHhOzlD?=
 =?us-ascii?Q?l35ITYIh990a+AluNg5rwJAkrbIZGC/9S/nwoiy2DOhR3O0+G0WDCOLpjP/J?=
 =?us-ascii?Q?IILzoJRA+CEI11gNVMHqLpBODX6jVjFxaoB4cVF/2xQBKhDQ69AGKQpKOLF1?=
 =?us-ascii?Q?kx7M2kTjBHnzAEAJ8CprHsJAerEHAdUg4XhAH0Zres7l2kszUQiMLdscaeYb?=
 =?us-ascii?Q?J8YcCoTq7djvD4/PmgJ9vHJp9w1M4SxHwpGzz51aNYfskuX7JjviuU89ROAN?=
 =?us-ascii?Q?jKWNhjv5E8C3x8nwgefmozRLWiX3qI6+d36EkMP/6rAbgyElEfVsB+4GUBuA?=
 =?us-ascii?Q?GE05TKhWFPCGYBqhZo/18uj2kiJF+hyMaeCDPWeNu5uONmvQ2vy1O7SlfOF3?=
 =?us-ascii?Q?5g7XwS7z13b9qO6qC0hfGO+bmMhQxMiT9+IT6W0G6goSqrGSIEunya/Qwt1B?=
 =?us-ascii?Q?cFzpPY2ZUq9wW9IPxwC0JP23jvXPEZfR1eoogS7+tR3xyPqzZIOhz7V9Cmkm?=
 =?us-ascii?Q?3QK/50hE5JLwL9WlAdAA0ZM0hvO/yOHSB5RuA4iUOjj0kTHe+N6wwqf+qbJ0?=
 =?us-ascii?Q?o0QfMhae5XHJw3owO8/NXJfvONuysVU57hijPyB1hnm8u+u7XZ0bAW6FKj+5?=
 =?us-ascii?Q?lelwstPrvsuJ8djTr/bcQ5Fb7Jk723CIxEjVSOsWtfK46NoP7Kxt2pEasc3g?=
 =?us-ascii?Q?AQP9YGQFUb7D6+MbmzxFfa+7M+0RARXCvbN9Lq4teoPX4uWprjqXFAFPJ5P/?=
 =?us-ascii?Q?vdDcXPDSG88Cs0cm5pg80lTf2UNZJGtWU/G+cU+8UzsJtR5b/AChyw5VIsgI?=
 =?us-ascii?Q?wYiSlSXt2NHBQO36HtU6oEHA4yl2tygwmDYJckc7618cK1ffWSSwlZ4fqoCq?=
 =?us-ascii?Q?etEbnbnGtLF21DEHvVhz1o5VbK6NPfSghKGX/oinhBNJrR+kcCcFvOAPA9sz?=
 =?us-ascii?Q?AuwoIYozWLmjwen85IW9kaqJYkiN6epwR34JbnpMUizWVmI1WXVF5gk3JT1E?=
 =?us-ascii?Q?4LBp6GGlp8k7SvtM/l7IFUDsZv01tobVonXYO8WKTTDnNogHoXxNtLvC20BA?=
 =?us-ascii?Q?RP0ZQzarXls5GHx9y8kCOdtMVRwPDEn/Z6mkCVFdhf8P3ycu7oBiGi6zy0HP?=
 =?us-ascii?Q?nsXLfGNUjRaeCnCACecWnM2dn7NWok5U9dX7lNVAf/hi+JbhCJJK2RCJ6njh?=
 =?us-ascii?Q?vLDRy5iKgQOm1nP6pr90yank7vX8GeT69CiGGyeBNL+lYfsCyw1FbCYfjH6C?=
 =?us-ascii?Q?9dlDnnmHLRlqoC7I5jWa8e7BM8JMsPizvwRKHI/QfrYINxhdLw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WUEsDBA2WGNNPSXOLbfF84i4HzuMSgoA92X2b8a2RFxCPLdai7ZjfnvbOQaA?=
 =?us-ascii?Q?uQk7ztqGHDBcDIyZXlAFsUQyQBtlnkjQRlmgVrSyMm81ZKCCCfAyXNPAwnCZ?=
 =?us-ascii?Q?lqk7ilMgDgY9qNODIjOWB6yfV0dH2oxAMigpvoX4NBOJ6bWuR0uMsW6lKp/6?=
 =?us-ascii?Q?8/sd1zACuTh6MfSCa3AVG7g+rzhn6jwFeaBRpQdk9kwCJMVnIXBIZuU6YyIp?=
 =?us-ascii?Q?xadxR0+vVyhnivJspTvNYDQ8Sdz+/URohWY0ZDuix3Wgv/R+eEBdnEDviXTR?=
 =?us-ascii?Q?XBGuh8Lg6jmefwTblW1hsLXb1GOqSeCG1vDWdOvtWwwE91FxW/vkFS1xhG/R?=
 =?us-ascii?Q?hRVlJBqrMoqwHyopg8R8874Udsa9RRcjGnkzw0xhAhVKOgBdNXdqyXTMr4Td?=
 =?us-ascii?Q?/yJ7Xnoc2wLLbvtk89eE6JC9iSsobqg3yl4bq5QbrPx1hUmMZwAOTxozVUpa?=
 =?us-ascii?Q?RVlp8cWrTHJqFvmXPObuFYUHvZP96x/qOy/e6azDpeYRFmbp8tjgUb+chK9T?=
 =?us-ascii?Q?jpSSAH2Q4eVkd2+3n0fsPOzHE3W844m/YubKDdJ56eFG/3r1xIP0qx+blHyL?=
 =?us-ascii?Q?Pp5yVkKh5COknILCtkOVQy0cnXyJ2m7x69gnlUfwdB6KBx/RVS4w6YfSAD1W?=
 =?us-ascii?Q?MTAo9Wl9HF0i3TDqESo2RmypYkoRFMufzGZ1ejOpIdlP+EZBOFZYgiD4b9O1?=
 =?us-ascii?Q?AvCjVx5F+amdbGSIe3lzgQqZXZ4LFTO0oO4POj3L65TtQywqFMJ6/aqWCf2P?=
 =?us-ascii?Q?27mHfNze3a+auHnIZWzTelnKksNyMSTrgLDUht0mg6noxEWqBNXyEcIDrwxd?=
 =?us-ascii?Q?SnbdY2zvBvf6vF6vvM8rXGuysgcRrccJCojrs+/Q5J13osMdJ7ey2bJvgEu6?=
 =?us-ascii?Q?sOXo2tvA9/spjsMq/vWupuC6wbBKQhSwGPaRuPxOuWxYtHyko+iiPqqU1YVi?=
 =?us-ascii?Q?CycjvJCLlcRSKWoVyPTvFehJ+GHfWlbuXrmz1siGi5z0H9zEzK1SUzhDuAa0?=
 =?us-ascii?Q?1kldG9Ju8UDGkk8mxfwj/tJpx2sFKLY2hlMJGQEE92h6FPOC1EF1bcC5dgf/?=
 =?us-ascii?Q?X29ra5gqcI58x2MrDfXGvdCjwG2jeOLwtTXeTj22FpKlUmNyWjLYl7B4fsdV?=
 =?us-ascii?Q?qwugOMN+t8u3lDv2yrQajQEkXvzoyesWTeFtx2wivSbfm2TsgGbIjtUqSCaq?=
 =?us-ascii?Q?HICboC9ll7w5llhTjQj/c3VqMjYuZVy2OZnopitJnu1NbogMc0XL+WPWa08K?=
 =?us-ascii?Q?eFNwYmtjFNiVqSlHgJWZyAJtOlJUuGVUbkoRzvQKuJb+DHYAsAeZIZocT7U5?=
 =?us-ascii?Q?J3dKdPOECGIVwIfQKFtJzJk0Yg/exF7Xmd2cRl7AfNCy6XfVkrg1EDSWAkBE?=
 =?us-ascii?Q?Aup8hqzXOQnGAMgK6ADq+zJ+Ketjj02i5j4UZ7mFhBR4Wgo7bMnkn+4ezIQR?=
 =?us-ascii?Q?dgaMpIAGZiP9bKDqsWxCA2E9l4+/VLRdSCTlDIQ30Fz4XB/SboeQ24ftplbN?=
 =?us-ascii?Q?ytIQRByotbQeryCewVasThEskCAypRLs/5WWUWuFLotzWrCD2n73MMJctZJp?=
 =?us-ascii?Q?10wJsWZrUY72S3aoenlGesYpvbjG9SXTMhIwv9j76Ywgy6bPG2R/CkKA8wqr?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b7feb4-207e-4718-44ea-08dc9c02c9f2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:24:57.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xyi4m9c6zDd8aZEa7My5+ZfodVu5BLCilktGOBBvcLErtFpVS57fFD2EOb/0MpYDoMzXNK/GPZ/kGpokqnyg3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
X-Proofpoint-GUID: hufQ_HEs8E2e-K-ZZjG-asJ5uSgtthnW
X-Proofpoint-ORIG-GUID: hufQ_HEs8E2e-K-ZZjG-asJ5uSgtthnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxlogscore=725 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201524

From: Chen Qi <Qi.Chen@windriver.com>

The current pciutils does not have this textrel problem any more.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.13.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
index 0b876c7070..74edd8686b 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.13.0.bb
@@ -47,8 +47,6 @@ DESCRIPTION:${PN}-ids = "Package providing the PCI device ID database for pciuti
 RDEPENDS:${PN} += "${PN}-ids"
 
 FILES:libpci = "${libdir}/libpci.so.*"
-# The versioned symbols in libpci appear to be causing relocations
-INSANE_SKIP:libpci += "textrel"
 
 ALTERNATIVE:${PN} = "lspci"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.45.1


