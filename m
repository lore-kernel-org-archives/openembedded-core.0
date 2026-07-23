Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB378C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:21:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21239.1784805676485470530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ibxlKMhB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1664a73ee3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8rvET3240864
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=DTSTNiEp32dOxlyzkuGApCuDVU22/ciCEWjj0PBH89M=; b=
	ibxlKMhBRWHlQGvnanDW+3Ij4jcv8q3tb9LwCqP2e0cHSYFQs5W+ycgXu88rPMnS
	cX783N9gthXypNuqid4K6BgS+PJhznwrQCp1wT8Rx0tQ5lLCfI/UYCg/Frs5HOXD
	YmXrZeuRYw8IptI43ctEC0n5JaUPg3lB3EM5QCEPYNCXVIhY+PJqvJxRAO65TfuM
	XEauZM+58xV+NP5FpEpXRy4kDL1C/dO0c+ifzJrcQQ3RLcVBvO2re/xBIJOogUN3
	3K4Ulc9hKOBEiKB9ON2c8j3MEqxMJR6cZsz7oFWb+FSIvgWCjZJkb34x1QLAZsRh
	RN1pNb/yXoYCV+aZ4qFUnA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fkdfs8cc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUV3X5i7ntIAuQIvuQemCWBkLArsh1wxchI/KUh60JgjEQvTQUyW15Ib0mTQgEmdJ+Ua6rtt+nF/Dnu2TKy8F8DTlVKX3bNLDeKJavJU2jmcBNpRHNRgzmdX1oNUmslqFEPozpn2di6jmEO72xmNhpCp9Fu2x0XIV8fgmLOFqW5V5ogT93pNNi4SUxuITxf87t/pwlQJAwlHypPc+OXiQtS6tB9wJubkEZA1HnReWO8YDrIrdJwF57LDNv5FGIgUh1L0gm7k2NkM3ZM2G1TJjfPHi6mgnKi2875Zul6x5RGLKqAzPKTWZOB3hc60AMiUg7lsAAQMT5A8QnXgNm2kOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTSTNiEp32dOxlyzkuGApCuDVU22/ciCEWjj0PBH89M=;
 b=Xb1/3HB9gyCCWJlHlpQIWvZFSNT4rfahCt6gpVXQkfWeX5Fmv2aOFF2XILnVJHcJuasK6KQaktqVIuMeNz9zGpdjf2WYvZrUWN8CT/Bf+OK60SNrTh5zPe273caScZK50fFjH7m10lx5L7r4y3COzdmLH45BO5Y/KMejJNfFnLo5paiBbtspotuSRTZ/tRIYs4fe6n/Q+zfl28eNFqSMd9hjNC8bpu95eeW2LbiHmVt8mkrJvuBt7eskP5bwtwo/xcnzgzr+4zwzOte/ivVQkF9LtFyenO7z8rlUvON8gKW/hHn+rgIg3Vgo6prRyvijGb357R1k1+VTD39ToB5+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA2PR11MB5083.namprd11.prod.outlook.com (2603:10b6:806:11b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:21:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 11:21:13 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/3] oeqa/sdk/cases/rust.py: Add test to verify cargo build builds for target
Date: Thu, 23 Jul 2026 04:20:47 -0700
Message-ID: <20260723112047.3535219-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
References: <20260723112047.3535219-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA2PR11MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 55eb3764-dd61-45a9-bfec-08dee8ac8151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	AZ/sScJqpsYDIYkS5/HNT8GSKfKDA38f6fP9enUOcef2Z5XXPcF+duQKd8jPBbrxFZc/NuKc3KhyRAYbmc8qEmiyVQLJi68sBJikhij4m2SgENHQHW8jtgsygXUkS/48kESu6abnGzsWDHfR2DsonvAEUPx2DsNJMwf4n8XcnOWYteNpssAS3enTU9oRnhTB0n/yhIKORbG6bd9Ej7uk2tLIAbUtp3Mepl/Qdq4ol0VNApn77jxbVtNH/MO7V9OujYS2xbeNF6UenJgNG+4bDsbAPah3x2/JqA56OBRWujIDkCExSSfrxYP6VvYHnaklb5CbD8Y5xVffQgZLJOy9xuA10dEzGYZuq6I9CGD5/ENmkGcgUuegbiYiZyHK9IG9jTXh16fqWc0pXb2tJuyqX7V1nDC6MVDKcCF2METlJiBbQudgdhiINIus8+tl7uXEwvRY47c9+V0XV20h1TIXZTzkLEmlPT+/y5VSCGkzQTS6hhNPi6co/mCP8TyRTyk+Lp1ljZw7jmZh6jWrYXJQ2nkU4IxbOU1f+TCILLm0gaM8gLO+vkGtJlXMHlMbTfZ80IjBjf6RubrHAajGb5DN4Ziyj/cO5w6Nw8cyXp1tP3OwTEupfsoV9gNGnt10WWSxK349e1O5lugvKOmG/Q8MFkzzJaTNkzRDQ2Zp+saehoUDdKeWCrvCCi5vNwhuMrNbokWN/nWzqfknIhD65h1cVnh818Y39RDaYAKmiIXxoCo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I7vR+msy+Fgfhl9OJ8V8HdJ6Vn4UOZSryMhy52B89yYfB6JL/5OIzFBXyTmx?=
 =?us-ascii?Q?GvG/4pdXeACQdZSQB//8jkQ7/KzNJzcmv43YnxVPL3ftIigV9mrB2tGSnfMt?=
 =?us-ascii?Q?HlKqRDGGNygJMMm9VBLCtX+J9A078exgTrBWihpElqybTy0vbtAULkfepnXs?=
 =?us-ascii?Q?KQCIXIDGoSZX5FeDe9fhzv65x/xSOmHhewzoJ/HYjZyp2dCfSkmEkJsIq1hY?=
 =?us-ascii?Q?/AK4I2f3BBef+vw2vID+MjDZ22u8GaljFfoEIIv9PPM2UeFH1efph1CbZZmP?=
 =?us-ascii?Q?sSDkgniKTP7PIMqYl35I9G/ip3BLR2xvvucRNRbO0HnZBO1j2lLNI3dtOl5L?=
 =?us-ascii?Q?xQzBFSuBCGD+9iyHjQsxeyu7efq/SSuCpKs9RlZUwx072XNhx/jqB9lAV0yx?=
 =?us-ascii?Q?XD6iefGegIf1Bi/tSwxvmk3yUSu3XZpCjuOAymqiFjAj8K0CRohKZYpZZdkX?=
 =?us-ascii?Q?6sMtPyzKS1nY4N5f3Tb/KsH46MCqEnG7e/ReTiUXOm8wyjLWlBKslixq1U0V?=
 =?us-ascii?Q?7hLwSRSILP9GVvdYmPsTecofHW4GUVsnQGBy4S1hzYDhCkHt9TGtJcJjGj2/?=
 =?us-ascii?Q?HUg+cxyenS0B+bsIiaBhImP404bZjJM8+NVW6gz8J6imFoloT6/4oSYr39ah?=
 =?us-ascii?Q?xaUASv1btZ59BjDIP9Qy+bdaA0Y9/Sbs1t294AjVV924+sXrl7wvwN2mEVCE?=
 =?us-ascii?Q?4vJ2UFQ+JhKnH7LjJoSksgQvKasAswCig7lNGVhFbvrrhy/RPmZiOsZWAH3Q?=
 =?us-ascii?Q?Q0suiPAqBrqJXhNZ2A5Y2hElzr1qy0Mcv8vtixUgdxCPu3hjYLcFtpepy93f?=
 =?us-ascii?Q?SkqoLZuSUvfYHE3bSKk9AVtIyeKkpXeLIVTMz0DJvoEryW1Hmh/0i/9UVjqL?=
 =?us-ascii?Q?sKqdI8uQXoDF7VNmfWDMVRY7m+nvsPNdO0OYZ5fr/3Q2jZu9ZTjlRc3OddEz?=
 =?us-ascii?Q?dxzPaoA7uoSHFh22muwetA+g2NEqHe1vkhOhFYnj1HJhgb82sJWL/329dcVd?=
 =?us-ascii?Q?vabxyZY3ZFfDFB7TnVawCqpO8qCofHu5W2Jqb6T5RUNGO3bKB6b/TREpVSpO?=
 =?us-ascii?Q?yUWzBM4mvci8WKiYUOhTWfpvyuX8UxUv+AHD6nW2E3FHFnOLs9OrkoeUYxz4?=
 =?us-ascii?Q?8aitYOnOLbtKM+EN3SQQ9sD6Ej8XexITxrKjbtcOTFp9X9t4jV2Q/NVED9e4?=
 =?us-ascii?Q?8RBeFR8vhTryvODOd5+H8sn98kCNM4VZDiI4z7g1Pw/9622PSX7DysUHyi4B?=
 =?us-ascii?Q?N6Aug6j9j2hJnQnH6aL+FDs5wUEvJjy/AKm2GuVOt2RDCvLLiK1OznOB1J6h?=
 =?us-ascii?Q?PhzJukfLQsdao6no63GV9Ui+mErIpXOrC4tM3zk/5ZDKh1tgIgq5bds9xYkm?=
 =?us-ascii?Q?6mqqexTWymBIiJt79rQ52tzZzbiiOc9WFAn2ND0GAzmDb1yNeNCMd10CnKBW?=
 =?us-ascii?Q?KnjqcF4OZYhDYR8yilJf2aKCWd9QCxGzwu0eNx7na6mP98LXPH+R8dQVy7ei?=
 =?us-ascii?Q?eqSI9PLiusVAEiERXOyZmzyfExQFHgia/mhh9MFaTA7m5HR+HzbKDvtmxtfn?=
 =?us-ascii?Q?IiwM15QqxV3WOv5WcadXud67/UN+fGpnAdietzY/D+FNA7r3End22ITVeQNu?=
 =?us-ascii?Q?Uhl5kE06LjEkNDrE+mfCuaC3vU3mfOj29Og9SRLSP6q3GV6RaeHyAquYqrVh?=
 =?us-ascii?Q?KOPgTVTUu8G3aSTblpGTxuyP7f4pctq/YKIVirbgreuVG2W02UxKRDIw5ma2?=
 =?us-ascii?Q?x5WvXdo//AsqbRyT5T6aYMEz2EcMdPs=3D?=
X-Exchange-RoutingPolicyChecked: 
	H6tGeFGl9C75NTRZWSuPgVPani4f66wXR9MM28eUCKxmr6XwPLIajwDBpiHtlrO6qhot9vdbiGCjIxX6fO9HgUjOBLj7Xol4aXwQh2KnKTO0QZ0RwuTD+IM5ZMMt9vblWC8HyQOSF0uSEQg7jOMVo6m+OpygQZb9TACCJ1rFhoWsAQhpRFCugEzbW4sPsXV0mOmr3QCc+4+vyxsbPJApoQGsL5DHrZnjJJML2JS2bxLzRWvZ00dYVT8kERpsNNto+Nu3CndXCd4stbHqZZMrh0M307kimdjI3XYiNOsEyT/Vu6boBWdg6iJkXeFRj9heqXxr+wceWPWHcaGrCXKk3w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eb3764-dd61-45a9-bfec-08dee8ac8151
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:21:13.5475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6El/tw9tAA0h1/MrFZ8DI32geUbMfZ4WHJj4xrehrBJLVr6GTEmyd6Os4LTzDzJPRCmdO6VLbli4TdnM33Dtgg93cQhKaGYkrmd1WEDz8tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5083
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfXxQaAuiXpAFxU
 NEKeN/lrHl56SzUNnt967DvmcC2zfm5Vc8YUydIYvyEIbX35U2OxJ3Bot0/B+V/zr8RYO6Nxutc
 Dc3fv5fFvLBHSABSgtgPN7ewYJXnZEMglUU1i2jCevlyuXHE3MOC
X-Authority-Analysis: v=2.4 cv=EKE2FVZC c=1 sm=1 tr=0 ts=6a61f92b cx=c_pps
 a=guboMCJq5DUNhCsQxgR9jQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=vbqt8YWObaADYMrP3jIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bNra2HjaOTxP5sKV0LyfOlqEfEKs163_
X-Proofpoint-GUID: bNra2HjaOTxP5sKV0LyfOlqEfEKs163_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExMCBTYWx0ZWRfX1WCD/4W7XbfX
 XSSls8KfWsCsgCmHas3S2hqXLlnPmKORGcPNceY3nb+qLfVYTVfA7btulzdXPeiE9FTvRJFNLTr
 UyjjLLY3c5r1j5A5GH0ZpqFrXSEzAzHkwsShP1e+P6B4nalcyqMKOMWMfub2x9AYvbFMiL2/3AW
 CAmRweMBQ3nDz61BFRP27Qf/h6pZlWHS8/wucNLeB2EmsOfLlfeKTBWAjKQIy157PlZAVZ1V7Z5
 K+gcQhfJ3R9L8kDHQ0CE8Oii207PPICl5LtUsjXiF2YJQQdR95wU++avUqeadl+S0jdi/eVbKlQ
 FUc7Rcotp0HCmdql0QwkRK0hlzOrzy12Mzyoe1BaFq6Cm8B++HCI56GH690yna5pz5jMrZs4uE0
 0CLKryEC0XJVUdD6RB2FfkRQV0L7qCyIfOz4jwjUwxePgJGYKBInzOd1nP26BfV2BoZvAjODkC8
 0ILVjt+B+atZpGxb4tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241824

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/cases/rust.py | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..831994c14a 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -7,6 +7,7 @@
 import os
 import shutil
 import unittest
+import json
 
 from oeqa.sdk.case import OESDKTestCase
 
@@ -33,6 +34,39 @@ class RustCompileTest(OESDKTestCase):
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+    def test_check_cargo_build_default_target(self):
+        result_env = self._run("echo $RUST_TARGET_SYS_VALUE")
+        rust_target_sys = result_env.strip()
+        result = self._run(
+            "cd %s/hello; cargo build --message-format=json"
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
+        self.assertIsNotNone(
+            executable_path,
+            "No executable found in cargo JSON output"
+        )
+
+        parts = executable_path.split(os.sep)
+        target_index = parts.index("target")
+        target_triple = parts[target_index + 1]
+
+        self.assertEqual(
+            rust_target_sys,
+            target_triple,
+            f"Target triple mismatch: env '{rust_target_sys}' != path '{target_triple}'"
+        )
 
 class RustHostCompileTest(OESDKTestCase):
     td_vars = ['MACHINE', 'SDK_SYS']
-- 
2.51.0


