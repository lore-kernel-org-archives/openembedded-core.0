Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F98CA5FAC
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:49:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12670.1790772587355029025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mMbK6AXW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4733047ffa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8dJ32368711
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CBAwQnrWV7qk80+EzPjhfJX6sf5gXVREnDPGjluAvQ8=; b=
	mMbK6AXW3UZd2BNp6se9G2YCmfBo+HjVWqDUDAF2FMw5RP/Jx3P65wUmoBfbgzE2
	ShHt0gh+VvgNbc9STXs33+aVWbOZ+J7KnO+uNhMW1S8bFE7PCip7T8s4GcUcg4PI
	3dd5wE3ilsTUVa3A4qLn+Ab/aPaGRBJX8Sty49KJ5HE3hdyA7dP+jMHgl8OhY0I2
	iK2ztC0y069vu7KWtiJ+WI5w3SCdatTidO2akzaZsPl7lCyIRKqyXLBklT0n/s+M
	hROm+QaCzAXsDOHJAmJPytCRDZcaueecVKe0mTmWhVyBHjUFdQ7AnIyAQfNmt9Ya
	dLeAwNSbqVMo4nNl3k0JbA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx9b1xfhe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJyt6Z6vfmhFD3l+TXt57h0oWia0htv8zZT3hG8sHkp8JWz9uZxPEMvA4K5UJ45Du2sRjDtN2COvLo3c6NAwN4amLReHoB/wq0N1UozGkIBCVeL2oahEdZ8mFJuqtlXAuz2NuJkvdKrQGIWgOOlV7hhQ4ISiNfv5RVdI/cPYjTnn/lTpTAt8bM5cqixpsit4YndhqDOcRlWyYpXnLh+/K9eXblFGCUlt29qpMkDtUnZXGSgQpk7nKuqEz8Zg54FjDma+qy31m+kra+qJasUU3eg2+igvtcRHPuLYmFddt0hUNvB+I1gPKJ3Z08IwJYLDx6PVJj3XXDtqXbs5uuiJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBAwQnrWV7qk80+EzPjhfJX6sf5gXVREnDPGjluAvQ8=;
 b=Na6/Qx6LNsoJ+U3pHk2XEiGNG1r5ohCHGHPkkLbCGmK42E36vkqpH225sXRU+5KS82JvVFcGaV1hPkI8Y0xSW4HOAC3RYgbIsFNuERHSvv6knoI6wILRmez/YDU1eDBMUwOzdiHMCS8W8A7pJF93kKM0SRHDt55ZQVemqNqa1hYtMU7EZSGTxxzpmRYTPssD/OyUoLtIPwSwjVYK5zkHiJyXOXyed28FvIgt5dMzshHn376ZO+xmEbTsEeLOoZDHw3L4FCdNTd9qIvAwO7HGRtTKQUBb/IJ5N2NogR2lrtfKqVzqttL/rtVx3fcAYG5YSjdI3P7pvVNVcptJWXKFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 12:49:43 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:49:43 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 4/4] oeqa/sdk/cases/rust.py: Expand test to verify cargo build builds for target
Date: Wed, 30 Sep 2026 05:49:22 -0700
Message-ID: <20260930124922.2397906-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
References: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 22382501-a403-4283-ed80-08df1ef14c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	C5nvkAADaDGh4SaEHvRJeECZjQlGPIbsbh7+2EPS0LjDvp2HU2+MUB8yiASL0zO9K42sh15N3prlTopXIULCeaTs+qvwe4L5AYFhYMFamZZ0AoyrEWrBodrGo1vHQxT9LRNerL7qVSE3Y4Yc/jq+0bbbYJkMfCCgRQ6TghxrwGukq4ne130dKbRZvZX6rl0pvrGCQbRUK7ObpkyitpftlSkqtpSoj0Gwi5/P+UaYz3LHR5zarxirW3KiGtNMxs1RXScCF2v2bX8MnZEeoFX4EZIkVKdM2IBPfhvXNwrdQEgsqWJTUdGYKrpbjBxQ79F/ZSxt9LxZb0JaLwIkS63WQzBTEe3cMThVlAcxgiR8Frf/PhogGhIpRFWGISSscfRkTRN3G214eMIDKhiP9P9Ut83aQcdzX+E2W+Z8ZinW6kRwamTtTT50s6xELPf0dXTkQI0cnohLbymGvQI2tCZ8/Dm4lH/buCe51e93UHsLKrxTxLlXF23t2FDqbHXQxBHME9ClLhv+fCcnKpcFlZCaLuyx9pIng8bn6/ndLhhYgPaOYv7JwZdbBBZcI/q+vXL/d3H3h0bd461SWazCaeLrdYHeZC4rQ+IPHQfHX6yHC6sJhzt+wwx/GdThnC0TIKc2sSA+EtIkWcixGS3f3h2d2p82WmEb7fnncXneFiRi520Z2/0Vz6RNwMEyfYLLiqS0bMeozP3mRQpqJLpfGM7xgeaGyS13wc6UwSENwDTzQxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yXAUtZQBzNo41Rf2kvm9uKz2pyEytSuerh7e1hyyLvtOW4osN3wzPXtFhvXV?=
 =?us-ascii?Q?ByhacuajLgE8guMs1xtYxM4b4BgFyX/N45MXCEoKuXIKAXUdIyae4MZg/Esj?=
 =?us-ascii?Q?nJmMSVPwnjNqR6Dtz/NV9eOi9iX7zKreQYHKEF18ixAerZoSrX8IA6YBLYAd?=
 =?us-ascii?Q?jUbByivspFOUv/2tuyhzAsesB0+YtL3J0Aw2s5vPtd0K3s5UaCUHnUcZOF3B?=
 =?us-ascii?Q?IW50wPwD5bR9q4lvylxYhVgdc1WrCczy1XREaqAd5F3STC3rSedP5VV5FUEy?=
 =?us-ascii?Q?ujsPy2C6D1x0PepreQ41raPTPnRwDrcTlK8EMOofidNnAISOi94p3bk3gD7t?=
 =?us-ascii?Q?XCxfBXSDFBYunuins1hD/Q7G6H1h4rvoxJCZAb90yLYTUBwJ+n5T+K+94B+J?=
 =?us-ascii?Q?ZumNyEHaEsNhCCXEg3xZc8zbvtMWo2tUe0wv4KBGXmIA1E9+8hNDNAeYnXiI?=
 =?us-ascii?Q?tYjzVrjd22jYRoW1UGvf52h/ZOGsmw4MwRky8SwLFLngVmHIhIC62zCTHFC4?=
 =?us-ascii?Q?9uVqrEKdTjCBwPAPUnGGpuBvPySNi0NB6OFghY0iYrkXXGpFoVkZ0prmdFaa?=
 =?us-ascii?Q?egVhGuiVrCdPCAfpl5uYt0cuyinGjep0e+d4keiwqpCvn9ffQgX0EOvq6KUG?=
 =?us-ascii?Q?fkPQG1AU1nAfrMW2qQfRAj3QZinrRgBfIB9lLU+iTGftsK7MfO/+fZEabBDh?=
 =?us-ascii?Q?Ga5LkzWxhe1BYFlJzV/uw8UAXz4SH2SP7gdm77McdFvmN0FZSvZmHYE4k4lA?=
 =?us-ascii?Q?Q8IaDcomKByICtBa84PwN9DOSVXkibyVHiakoaAeM2JX03uDLFNt2WvnHz7U?=
 =?us-ascii?Q?usLnZImFqv+/7rAvK37fRPuMW1adHKfiehDoFQCnE6KLPaeeJ1HCQuDjceo/?=
 =?us-ascii?Q?0hQVEhLn+pCvnuvNvTIPIQSrZNP4vUw6KZZLpa5VmUZi2hOdqJSQkPVcv4p/?=
 =?us-ascii?Q?sbwz49XQKbr5i0/8vHodps9NcFZ5kbS/155J3bJVyMar+YKx2+MKl1MMK4Hf?=
 =?us-ascii?Q?knHY3voYVaiS5IoRv56CDrTPOlgq9QreGjPft7gn27OS5T7CK2q8T9ZhcaAy?=
 =?us-ascii?Q?h+7+q+i+t+zQcS4tN0+OIYzeJQW4NDh/Df04QEylpyRNcB8r6k0vwVNdtHBs?=
 =?us-ascii?Q?o8FPNAt6WDC5KMOZUmfiO8SsxXGmrvveQl1UKSK/nIH6WEvIpuicoK6eIEXK?=
 =?us-ascii?Q?nKjQuxvr4//IHUQRWE9QTjiNCHNIM/54m0DYLPY7lB2I4JS3lofKblExQttf?=
 =?us-ascii?Q?GHKFbqgaa8FMt/sJlNJQgMhlocrNqzVW8VfnH+Zsk9tOQzctBPqggg8MgnB5?=
 =?us-ascii?Q?S2vx0pSTwOFFbPuvDT2wXLldmGhD3+057kQh2Ozaa4t+GiUu3VLZg6Lk84YI?=
 =?us-ascii?Q?4ugn0DWcGhtVjv8FaVs5h6mBHFZdvasTifmBpPNaOCv2MvDobtF2RYc0lPQl?=
 =?us-ascii?Q?9Yo0CD4/czCiABLXEem/BT7VWCFDoklB7zawqp0r3uNYeIvcRfXdILKgRUI5?=
 =?us-ascii?Q?DHy25qYGqD0MTqFmumjTi1pixMc/mnsUZutVMG6VwZ94+s49Ge/b68K4Rr1V?=
 =?us-ascii?Q?kCDmSA9UhPR0hXQX7RmfaQPE0Z7QR7XaMyFig3v5Et7zInwHWpeCdgCBKKm0?=
 =?us-ascii?Q?GgjziGqI03/KUJYXKWPFHQZQ8BqmwYDyJLyYuI/1rnTIyI/Ky4myGf7m922U?=
 =?us-ascii?Q?eNAnAL/TEVdfb1h7lqJeYYZit48AcGdM+T4dHKGRBcXHjtlXaXq0CoVHjaBI?=
 =?us-ascii?Q?9Sw3kfcD0XjR2XXNBeQ9UtLCMkPS98w=3D?=
X-Exchange-RoutingPolicyChecked: 
	Nd/ooG5ekrYI23hV91SJntnbARS314FMgmCgJHKmPw7pfXbzxuzSql4AJanoJ6swlZkgzTXBfKlB07TwGJpHIbzgYUHSZ9Ll5nxHlPRdr+exAQEyVSLH4qxLKj58A0E480wP+m938RECZSsa0V68DkcoS4cRjp8qlVTuQJ9uvi2fKHlVtW4rTOWg3GhiVwsw3g5AVO/tnvPy0QcaY6WFJj+ZSUSuI+omUeOdfd6qQOIHySuvbpXPPYja0IWy6YgJfkPkYizUE2zTXliCwpzi647OgdLydvqUjVE7A4baY2Sj9iFRfCsEt54HT/ct4x8wtWkx5RWH1SuLPYhENhgOOg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22382501-a403-4283-ed80-08df1ef14c7b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:49:42.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFvTAsn2o0aWwam8VzyxGB92i18swWP5M+O0DyGaHVYKAheC7RoXvQlEIkeHAdtwELXWmkaFGNr+BjFG7ygk2oEK+Jpa6p0p6DKvaYA50iQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8T1cnqap1zgS
 sXMy7nIGETznrVLYNL1ucUrgalJpELHUdwb7nBYnvj1JzEIuCpgBvMzpvVaps2BczywILFTuIRf
 2aTG85EWrW218D2Qf+UyBffRgQ0KpPZb1aBk955NsQxV9YEuvunvEWn4aCRY34jd3rnWjP+0Wgc
 Nxukb1ETm27+rIRQ5wPD7l/6UnLRZZ5PcISEMc75iNWZNvB4c9p5Opwsmt6Va79pVldQ092+rIj
 W4XYUSAapPiEjd1RRbIh+h/HF/DDN/jyzPC31iS1s8gyLJXOHtmWh2nuIJfGZ3eOzIhJwNn5uDm
 DIC+8fWKRAXUPqRNsQJkH5JzVRwDh365Q9ziF82w2YGHKXINu6dyUiHYqI+XGL2W378/3dT4xa4
 yUIJCuyfi8+TKSJKIzgCz3ZZou94FGz59K+R6UTeqN1ldBfKZJW/9RjPJKEa4n5zAqoCj+tvh91
 KIb+I14Ap0mThE/+Dag==
X-Authority-Analysis: v=2.4 cv=bvrZl0ai c=1 sm=1 tr=0 ts=6abd056a cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=vbqt8YWObaADYMrP3jIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: gLdQP0bKvod3wXAay1HG6Pnkh0XULp2r
X-Proofpoint-GUID: gLdQP0bKvod3wXAay1HG6Pnkh0XULp2r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8hiSZQHcltY3
 2xbmPOIsbq0UWvUvsm3qzuc4wLsMvjt9AQSxgpZz3UzNa6vuZZ/FHMygO4NGRT4UK6MGpvwItQl
 gLA+UPsrZH/JZ4O4liTjXc0wucG8YWrxLVCef6HBjpjrBl3EI20C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246967

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/cases/rust.py | 37 ++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..b4a8a1b671 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -7,6 +7,10 @@
 import os
 import shutil
 import unittest
+import json
+import subprocess
+import re
+
 
 from oeqa.sdk.case import OESDKTestCase
 
@@ -32,8 +36,39 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
-        self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+        result_env = self._run("echo $CARGO_BUILD_TARGET")
+        rust_target_sys = result_env.strip()
+        result = self._run(
+            "cd %s/hello; cargo build --message-format=json-render-diagnostics"
+            % self.tc.sdk_dir
+        )
+
+        executable_path = None
+        for line in result.splitlines():
+            try:
+                msg = json.loads(line)
+            except json.JSONDecodeError:
+                continue
+
+            # Cargo emits multiple JSON messages; we want the executable
+            if isinstance(msg, dict) and msg.get("executable"):
+                executable_path = msg["executable"]
+
+        parts = executable_path.split(os.sep)
+        target_index = parts.index("target")
+        path_component = parts[target_index + 1]
+        if path_component in ("debug", "release"):
+            file_output = subprocess.check_output(["file", executable_path]).decode().strip()
+            match = re.search(r"/sysroots/([^/]+)/lib/", file_output)
+            target_triple = match.group(1) if match else None
+        else:
+            target_triple = path_component
 
+        self.assertTrue(
+            rust_target_sys == target_triple,
+            f"Cargo built natively for the nativesdk host instead of '{rust_target_sys}.\n"
+            f"Cargo build needs to build for target by default not nativesdk_host"
+        )
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
 
-- 
2.51.0


