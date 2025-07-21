Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BBBC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 05:30:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33381.1753075827846187552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 22:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92970f4c5c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L4iWKU1036851
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 22:30:27 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0scw6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 22:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yda7wTacsvQ9y6MYL/fCrnDuHXaxlNYQtolDEPzjKAJ4+u72FXzNOEP8aijLTfKDjXjGDBIB+KTQcGqDKg9Za7nPRNf5/sY4QkpLlR9FNRqRa4ARJSMKlvIMzhL6sdpB2VKQ7IwbEhdtmRtpoHdnToQLtQKcPxOcm4zSCmKtXejHXBIO0kudtmXWTVdnsYHxlyafZF/h4ekgPz8Y6RW65rNYOfHE5lri1I7Tu3d3u4Eg68b2QPgf+kwXnDH0ag4V/nbHi1BwEgyIzGa1CVnt9+8qWXDCBfTWKon+P+OE6ORrQVEek6kbjbU3AkKTno/IoxDu++k5lFF/4Hu70QNSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fFeTiwIl+5MI/lBRu1kKxp45gu88DOjTU2Y+hXkUMA=;
 b=IwvxBdER6rE8RIOHyR0B0qkSQr5Qd3LqbiEbIaxx5RmsPjEtZPJup3OwYeLAQnx31trza04IA2o+Kf3bTp9VjXM+7nNK9nfoNtWi4/x5CVeXDogFtjVZx6k4CzPMtiN0r5yPBwgDe4Zi0dMRqXBcVFQ9LXCO51GGXS84fYyE2BI81T2romHTUkVqzhci2vPiCIQesGwYAvjKWrIyYNGbUBhYM0Xt79zH878FJ16xlvGumtpMocs66b4/vJR5Vhpox0fYrgnBANGGVY9Oc73jJzbl9B33s/Zjt+BhpcoXbvNzXlDwmZfTNJiJ9C3HKlnZPv/WlftdEWStqouiXTkemA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ5PPFC295640A5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::852) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 05:30:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 05:30:25 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH V2] glibc: stable 2.41 branch updates
Date: Sun, 20 Jul 2025 22:30:12 -0700
Message-ID: <20250721053012.4156913-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ5PPFC295640A5:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f86a02c-9766-425d-b2b7-08ddc817b1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ltJ/8Gqwz9uxtzriLwkXpoUwcqNIVO2Wiy4PyRsOYAiTsUsEk9rKSpV346T1?=
 =?us-ascii?Q?Rvs40qV5nxHxp/tdWHzOYjUgCsONhlHqV46fei612LV1xEP9vvmRaSqEc74Q?=
 =?us-ascii?Q?QIpmKDNJJX+YjbGwV/tVdDLrn7Mytgp8+Q26D8ZmcFMHtAUpH/n5BALVg+8Y?=
 =?us-ascii?Q?oPBlph7znaFqo2BXkz+FOH2XCdCK+sa7Uei6dEJJt9Xm43LlLcRMx2/6qKDz?=
 =?us-ascii?Q?AKJFkcvTjzH8CR6aeyAXwkZU8FlKWQE0n5ohvieTjia9U0uCyA52cBFAWgZy?=
 =?us-ascii?Q?w2PiKgVU+gWt5eYmRivw8Ym9e9O9WG6Hh4TsxxWWi6LT+Kk2NGVryeXBM8EF?=
 =?us-ascii?Q?8A6IF2O2xJTigghhSz3+cUtnj4yT17nA8p3uBel1yf9nd1BrJrZDvVFtyg62?=
 =?us-ascii?Q?x01l6ARrxNQ9cLemqGZ+vWyzZofxnOpavi81aOubiwsNSz6vzLx9/Et39EiD?=
 =?us-ascii?Q?Qamhb2yzYC7P+EfMabJ1lzsQowp8nana4dDGycErxsIde+EuJ4f7tsER0jag?=
 =?us-ascii?Q?NfXJUa5MqGgdB8dp8tTI2X1l3geqan3EOUwia4w+7dc4fs6tVIYSnX4WSDyA?=
 =?us-ascii?Q?o00+Dtm3BU2Kpgpruy4FdcuR18xQ7uK5TQHYmhdDjoDQj6zN28TU1HkI485z?=
 =?us-ascii?Q?i1NrvSIUjuGwkCjFk0woK1sH8zSGbXG57XiKxvV91kyMc/0fiNQx2HxUA1X4?=
 =?us-ascii?Q?ikgbaqJM71q7AGpwDLTE3xzXYP5i1b+0FrreLDuIj8BL08wREIoH3YT/p0QQ?=
 =?us-ascii?Q?RjhmhI098ll/neENTZBqb4ptoeMZIuaQ5MfEt7VoFQfe0Z7A9G8xntXQR9az?=
 =?us-ascii?Q?7/mZCvoDVWHLbH7GS/wkrf20BeFZYOw/IvNpE1xtFOoErXs4YvS6/ep+Xy2E?=
 =?us-ascii?Q?Teuu0oKRtuxsaUQoBWOAsdkcMClDH1MjMzy87JhMkHy6KcuP7Djbw7oaEZe7?=
 =?us-ascii?Q?UfIBGDbVyqAeMV6XRYGE88y3cKcJ/FKAdO00N5mjQsTldDijV07UvDjw6Tma?=
 =?us-ascii?Q?RL2wvmW3ROQzSh1dpBdqlRaglzJCfHKDNhJd2X9uWrCF3g0LgGTEfwww51Qm?=
 =?us-ascii?Q?kkwHebZ86ixFEY2jnjEGtQmLNV2Q1dUaO03o2EcZDHyIOmSUEiSE29nivhur?=
 =?us-ascii?Q?CCb1ftzlcaVtxGJEnt5TKxddTxiFaXbELSCmM9XhjUnNWSGJeodPed3bGrpi?=
 =?us-ascii?Q?+vA9C3ni7HxjYAifOvQXJIvhWmJzWWyh9ZuKH2gCbIpAsKGN+LI1I8/gQ68W?=
 =?us-ascii?Q?HjZ0WR5weGGQdcOsVHK/Ltr5Y+7HDJdmJotlXcjWbmYbqg30NMIy2IPZnwub?=
 =?us-ascii?Q?j2c0OH/LbPsdZlQABOp/nsdoUKV2+KYD0THDg6rNYI7rayfKnpU7eZlT7Lrg?=
 =?us-ascii?Q?mhq9SjZ+mSIErYgaeKIvKW3DOcqg4rfNy2spj9XfZZKGds8eCTBM1qA7p8+p?=
 =?us-ascii?Q?iozpHH9Zt9y03Lt0A+f9WgCK9A5knG6MACZhWZ1QpLId276tEctiyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DrlVhUdLOuGX01r4JFn9j4g2NEisoJgx4ouzkktkxzQIe2AmJpQnM6+6DJVm?=
 =?us-ascii?Q?+2KqvXt+mwme/B8CfyK5yp3cEz37IgfJ6780MFP2AhQOT/aSpOnHrbNBGS2l?=
 =?us-ascii?Q?z8kIyJfb2saWvSX8M9B/vVIruwJgBsxPmIa7t3L9FaXi2j8Kz/MBrazqdh78?=
 =?us-ascii?Q?2QIGE6jw7A58jCw0/koyFzC1rMqZGaDwOW2bwpbLO8BQ/vjQSFdvkAp6hiOF?=
 =?us-ascii?Q?ymDahfzxkvuSvWRpJEAI9qc6iIFHmCqbU+5d788fYfU0HrJ1HiHDOLBkcoof?=
 =?us-ascii?Q?KITh1vZEsAevjN2O1Bek0DuJOsLw/ic141vC57A66dEfIOnAMfKWr2zl26sT?=
 =?us-ascii?Q?rSqI4goMPhinPVsuqi6NKZir2TDMtf+7AA0pIlpuJCKfAVEoLyblg0idcEuX?=
 =?us-ascii?Q?zIjafE9192Q+94QilHIQgu+K0bY8f2qx0u+eWDRdxi3akyDcoCpveA8Zn+HB?=
 =?us-ascii?Q?2LyG+al8u9E7BUzh5qNhHOXlfrNzAxDvydn6Qi8wHGZqnFveC2ShgqzxE5KO?=
 =?us-ascii?Q?fsPJ9Z4QXlGY15Jkki6T0qyTXnmAbFcEef8qQ8WtZl3VIHA++oCHhAYJ7Aii?=
 =?us-ascii?Q?7Lo0tzDy/Zsb0WuLV+IDMEeKQyYw7F5H+FHqI15xH0RWB3bmOvoElyFUG4Hg?=
 =?us-ascii?Q?YD3MKlBuWiYLCUXLRowtRSM94BwzRDp5yJZy+x2aHnVCYqwxFKVKTBFg5RhY?=
 =?us-ascii?Q?Lm4Tq2MqgWWUQTd1HSELoIa5El+KuokfwgjIdA7aLxcR+aqGKiu8F9QaatjU?=
 =?us-ascii?Q?Zmebocz+pcpmUxtXIVHW3iuUGgfuR60jZW9wt4JvjJwZ9mtGRbXEPECIBE2y?=
 =?us-ascii?Q?ABDG23KRjlKr/krZVpyKjpZqA/C1TJvIixipK/24dAwlDyYSYpskAFvg+VRi?=
 =?us-ascii?Q?34jOSvkavayf8fP8pda8FO05z0wgzoNvhYZ9NJhJYdLqrH+hUnzDt/mdlKM4?=
 =?us-ascii?Q?vYbzDgxHbcUzgGV+yoYH+jE8RY6u5gokzh6r0Wnq72gpCbpl4GnTA/IGlVyY?=
 =?us-ascii?Q?mx0pzidliDkQj/lclGLpDG+CEGrs4sbD14gF91AxsiKuTk4vw6NwMJP3yBNY?=
 =?us-ascii?Q?otH3S99yCTK8QeYLPW0dxmrROj3XIDvlLLRSMGPSnQKMA1AyETzUN2dM31CV?=
 =?us-ascii?Q?MhlRjY7a1VyEpFoPwDqhxf3wBt+DWwYm0yRn8XKYSq1zjSkASp2eBvkUZDzF?=
 =?us-ascii?Q?8dyP1ax4qRsV5m6iT+DBH52j72UQbcMdrQup8DR7fM+ZrwCtdRJiosn4rgml?=
 =?us-ascii?Q?IWt5L5wPl7lRNVmh9+2devaLkSD/gtCRCFX1ysb4uAkUzqFpYES0Ytp0tUOy?=
 =?us-ascii?Q?+0BkTl+YKEH2mAAARDY4nwzGk7wo/HYqWR+A1uEqovtpb4gRgwc4NJoX63xe?=
 =?us-ascii?Q?Cuc6+u1fcvlFUBpY1uXt1ZRnn8t8pI+MCex5+RYJFcV0ewbZOzZsnqaH7yof?=
 =?us-ascii?Q?KUeRFMm0uTWFiUSTM73jDgFrqawDeGlb8b9pwhwpLdWwzyFV5GOG5Oui7jyX?=
 =?us-ascii?Q?Z1KZxxanSoyZbQgbpubpcIr+uIoOvAJkW70aSeLjXj7N6cS1+zIFRMr2KLk0?=
 =?us-ascii?Q?VmF609hKtpasddbYFDOFe61oDpuCcLNJXwXmEJag5CuFMgssnb4r9il6cj0T?=
 =?us-ascii?Q?zWs8GK0w8oj1YExe4Gs9p0U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f86a02c-9766-425d-b2b7-08ddc817b1ae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 05:30:24.9526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WO08MBqYnk5S/I7CRdo2aydCHGU+5rwDjrUxUswUQYfaQK7j5tIOcMD+KzQehDkTmLNxKURCCYy7hJiyhWTjpWlXH1lMREubVAOdLciH9nESLhFZbjbWvwoAZpEmi1s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC295640A5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX2c5oBXGp0PuF
 BjZzg5R/yerDASbCaLvQhD4omcnG1ZuiUceFPNkYsasDCdWTI6LJe8w8M4QNIZnwmmxUFtiau0Q
 mSN81LTc52iJPmhnvqmrgnna8U3TrfKwhO9jmA6VCqf00k7UkRFvkPDzCFF8KQriXBH72IDcDcD
 vTfwzMK4Uy0K2NlTS5XsfPovdew8ctcd40n7FdrJJF8P5gIbVKGDCt9szE90tGwBhsyWTggJjVs
 NiBqaOoRnOfxhSIfjtTQLsn9zzMzvEbtnU8cwT2LgWEKmk5tOklDvfYQp19xF8G/LFYdR3cHRrf
 V5ZWHUcAXMnnCkpa4G1Xkzkjk0juNcF1Dsl+hHTGw5QwfWHMIzHatuVo4+MSibijokDNoR50nBY
 CyqvgxwO
X-Proofpoint-ORIG-GUID: 8N9S2jSIyMd45ZeUlaXAd5MgngCXIH_J
X-Proofpoint-GUID: 8N9S2jSIyMd45ZeUlaXAd5MgngCXIH_J
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687dd073 cx=c_pps
 a=yucLCA0tZaJmGp8KGFRTUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=yh1250gtqQAN5CR8qEwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220656

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

$ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
6e489c17f8 Fix error reporting (false negatives) in SGID tests
11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

Testing Results:
            Before     After   Diff
PASS         5803      5813    +10
XPASS        4         4        0
FAIL         266       257     -9
XFAIL        16        16       0
UNSUPPORTED  164       161     -3

6e489c17f8 Fix error reporting (false negatives) in SGID tests
Improved SGID test handling by unifying error reporting and using secure temporary directories.
Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
These changes reduced false negatives, increasing overall test pass rates.

UNSUPPORTED tests changes
-UNSUPPORTED: stdlib/tst-secure-getenv
-UNSUPPORTED: elf/tst-env-setuid-static
-UNSUPPORTED: elf/tst-env-setuid-tunables

FAILed tests changes
+FAIL: elf/tst-env-setuid-tunables
-FAIL: stdio-common/tst-printf-format-d-int
-FAIL: stdio-common/tst-printf-format-d-long
-FAIL: stdio-common/tst-printf-format-sn-ushort
-FAIL: stdio-common/tst-printf-format-v-short
-FAIL: stdio-common/tst-printf-format-v-ushort
-FAIL: stdio-common/tst-printf-format-vas-double-f
-FAIL: stdio-common/tst-printf-format-vas-double-g
-FAIL: stdio-common/tst-printf-format-vas-double-g-mem
-FAIL: stdio-common/tst-printf-format-vas-int

PASSed tests changes
+PASS: stdlib/tst-secure-getenv
+PASS: elf/tst-env-setuid-static
+PASS: stdio-common/tst-printf-format-d-int
+PASS: stdio-common/tst-printf-format-d-long
+PASS: stdio-common/tst-printf-format-sn-ushort
+PASS: stdio-common/tst-printf-format-v-short
+PASS: stdio-common/tst-printf-format-v-ushort
+PASS: stdio-common/tst-printf-format-vas-double-f
+PASS: stdio-common/tst-printf-format-vas-double-g
+PASS: stdio-common/tst-printf-format-vas-double-g-mem
+PASS: stdio-common/tst-printf-format-vas-int

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


