Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81AAC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30679.1753865328032659046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306c9daa3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U8SWQK2903759
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:47 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487fwtg0k7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpNZQmfdxiY0T2loSJToPgC+MZTt3PIjVuNUHmHzPOjLkTNDbLzNA5eRAzsEIRpYT8E3fkj9uCJ2TZyxjL+o7XbL1duVMOW7c0FiKEFF9gERsvkNYS/ZbP8YS25lPIx+U4fiOKg9jx55ZJ/nZxHWgXamEOSNXfwmmn6jVPHia2jnV4SNljXQElrA6ZMRR+46eae7XWIF9LHyVIPijPkaRZDcFCyRK6Tqxs2sJzrbbyOCW0pzB8mvW+nPgjp5zFQUbBAanuveIEoSAJMOCRswvf1iLVfDwPUiGZnntND39q7e1gDU7PT43W584jjtzeSD+9LI2E3gQSIiG9AIrSAChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZ5adZzivRZyjc/WSJ8/hSxf339LNxyb7Mg8HyhABDo=;
 b=ypLLvEYMQhs2JHzFbGbb3ULA+Fd3noIsrOdzFr2Fx1ffhUiQxHTgqjhJtBiZZQA4Ysq0e3ELuq3syL1rLJcoinLvJdDD6UoquxYFg/7znG/M1eJYwOlcRv9mX+R7awdHIMkg/773dvc4Jw4T8RKQUpmM4qZjxA4p9tDaDluCkccFV7Uh1INMbHc3dYSgE1lJdLVkPKMEow6MFMeIWdcTqmTPBa+/0qieNSjzHiZvc9zf0Ua153YrkHZ0KxBQ6JN6Sp3lsqlDGWeoYVwC0gokjDiVByIIR1CfA5x937yenpiKXTwqoN5EGu/UVPOIikP2/Ei1RXXCsb0JpqF2pnxi7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 08:48:46 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 08:48:46 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 4/4] rust: Add test to verify cargo build builds for target
Date: Wed, 30 Jul 2025 01:48:18 -0700
Message-ID: <20250730084818.27093-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
References: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0c5d90-2e88-4e2b-ac43-08ddcf45e510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z64ClAw9f5wMZSV5e6euJ28NmcjiyQRl4Wl8H1VPN5FBl3ycpxnNh54OgKJc?=
 =?us-ascii?Q?NLFwmu7DiJIBYGAsC7icqRurZiS43DXmj1SXYjW9Hxxu//92ucyPK/CCGuUQ?=
 =?us-ascii?Q?c+w1QLSic8U4J9XGz2MZWwK+qWcsWrFgZtFkDE6nsjdx63BDw1GUgf/Cg1L8?=
 =?us-ascii?Q?xUq9IS2HcbU/WplewaStJdKAHUAcSes7gTVVUr0rxpdRN4LrvubrxZPrzq+6?=
 =?us-ascii?Q?3JpjMM9tvfKi4JMpbjwpBDhjw081WtqLIwzJWOTE//HdQvyq7In2nDJDG9Nw?=
 =?us-ascii?Q?OXawqIjscZORv+2cKj13mu98VluSjRlOABBiJ7Q89l+Z1W9R+krtc9bGANzK?=
 =?us-ascii?Q?kf4oIkDGJhMgw3xuP1tMii22XumdXKMs21vjPLwj+FCTyUPFdi8+276UrvHH?=
 =?us-ascii?Q?LyUHlXxcTJh3G8EUnfg1PQYq+dFMZ5aYrQA6lGJjI132GT5L7Ro4st4s0syx?=
 =?us-ascii?Q?G8qE5Cv/JvrVNiEObaFOWktDYyL8mnYEJA848NtKhBK8kDd4M8SOj8n/21QH?=
 =?us-ascii?Q?9uKzZ4Hp1oT5GERz+2gSz0yOBF/DV9Ot09B5g/ffjnj61BSi9iDaXybXPQ6t?=
 =?us-ascii?Q?nQJgs17TBJOeFSv+y/iroR9y+QwMkJoTw6lqSk46CHzs08O8A2xZQZk/uPVB?=
 =?us-ascii?Q?BxRq+5MGZ3X3/t6ZaHTLO/YJlnJ24jjsWHMPMi2UUY1l6JJGsAHcWuYBF6wc?=
 =?us-ascii?Q?ClCZTaVcZex7DfhjPvggfFmp0VwbR8fFIGmCzu4RNBjl3+C21+QfOr8R5Xgz?=
 =?us-ascii?Q?9Ta0jT3lByIC61OOoBPRUnvcQ6FvQSevl0+m1X54r/7AlBGws4eqE9KHByLI?=
 =?us-ascii?Q?db+uKOL8RQh/6e/KgFL6XiiFqqFrq8FiPD1VaW2ZPIfsLgqW0Ym7TzDNpDPE?=
 =?us-ascii?Q?YCywcWQFggKVvcKl2Sb+CVuCjUN2LWlZQCWSW9ZyQ60vfPFz8oWnikDNaV5b?=
 =?us-ascii?Q?YIYdMq5aFVzhfzePZEZTtp5o9PTadwzb+1sDYRTFladbn9EKhdTKODPo1PNT?=
 =?us-ascii?Q?F5EtPGZVkQlIHAQVYR3ebFlSsBXvPR9mPuHW9RAdDsC20Ebdp8Wd6Edh5T+a?=
 =?us-ascii?Q?HDfFjaFVHRgWBT1CDlK46tAhCF8Rhyf1OqMXzpJllTfz7W1xvjTTRWLb6ziJ?=
 =?us-ascii?Q?SHxv7DXSnDLrvhPkahQ/sg0VUsVPjdHq0KuYvoFn1Nh155k1Hnx9LhenRVpf?=
 =?us-ascii?Q?/lYZxjywvnp0V8ZCla3ik/QHLqMG7j8iNTJUPBJkKabvkJMo7xuc/XuhEV52?=
 =?us-ascii?Q?h6dhmPfQ6MRKnjx45aYOLoTYqFvufUD72z3ZrcCOs7dRYffaggsfF6t3Gf/e?=
 =?us-ascii?Q?ddZHg4752JzVtJWIkBDNjry71RL3bk/GYwQuqB0sS+uI0s7fVKUj4SjOg6vR?=
 =?us-ascii?Q?QQMa562pDnocWkA3lJvwb3YOHvNpgpaqntt8zh028htZPn7BmR5Yr94ZAptz?=
 =?us-ascii?Q?OGSeE5OaIH2JDFPQUzJ/9dZEHxUzqvlyjux/okWszxf4CzH5QHb7OA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+iZF49Fsre35yKwyvImORef9dxpBn7pSfbYSM00fL4sqTpYOY5sQlqqjfoq4?=
 =?us-ascii?Q?ILEOoXw+G+si5whL+nPVm0t7FMvmSI5oTl1aA6oJCjyoIVVJaiVgbADnSgUR?=
 =?us-ascii?Q?qln5LcNgGaWAUXnZjw5e+oM+GrT8kiD3KsafM7Z8JHPX7MB5HCNE9K7zmHzK?=
 =?us-ascii?Q?B61j+AfNnW0VH1JCca5egUfXUJC21RunNX66+egka5qLnL5KIbqruM03eNeS?=
 =?us-ascii?Q?pZXPiYtaIW1JMlbZ4Xhawk4Pw3GlXRKmO5xgrM0NIJb+afK+WOJ16Oe5OItM?=
 =?us-ascii?Q?/xnKXz5aUBbXAbTbE1KXMTXElMvRy+vN5CeJzqqNo/T4ZSIIb2WEjl79GZ5w?=
 =?us-ascii?Q?/wBFsc2zGpJxZiT3KmnKthlK+t4xeeIRer38EGvq/rxeyuBENqvj4MNrRk1Q?=
 =?us-ascii?Q?tMC2m/zc0CqShPXHT4OlUZ54a16tpyl+AEwvYQPoir4d3HqioyMsHXhrb2S/?=
 =?us-ascii?Q?IXgo6ghgZzNK9i+kvJ3nLoqc6DFkCs1P+AsSgwUbC4lqL86sQNG8gwlydJtx?=
 =?us-ascii?Q?xITGrItapdfMrg7WEdBXmyR90F1y4Fo5InPjIBziqLH/RjW8L7mJbmJink0c?=
 =?us-ascii?Q?JSELh2K+sN4yQyDX4XizegtkIj0d/moPexQp6LzqyU+LfXy9OkRMNmCXTYY6?=
 =?us-ascii?Q?GopyIvSX2M5E1fa62XuKnvm6SIB9Fu2/JqjddXbvQGLejeTSoHUG7btqlWeR?=
 =?us-ascii?Q?LAT9nA1RfP5zQXt0Mlb6LIZ4cW6psTgPYEIBW/LXfN3OZji+guIlepqdcLYT?=
 =?us-ascii?Q?c4DMrMvHM9Jq2CYRs87ah2klH0EBgNjaIGZtlb7lj4M0vjQh7QR3bTMDMbGk?=
 =?us-ascii?Q?LG43dhGmgElwbrgCI8KhDIlwPaHEfsH2afsrjwmGQWZSDYZG4C8X2cikcCoA?=
 =?us-ascii?Q?1XFNbSDJUtzkyOirBUBnOcKd9ni66KPpTrXRohuPtkU72KLNFHv72gP+CS+y?=
 =?us-ascii?Q?YBCSX0zFlaM33BqBGGjkaRrgifyOnTGAWvHv+KCAYYOZnGbNGX7KUAO+ZiG5?=
 =?us-ascii?Q?m9eryUX82NHh/SzBM4ktatV56x8TdeT4+/aPKJMwdijukFG2Acv+cRQocG6T?=
 =?us-ascii?Q?jFCfnh2Irisl/cJ6VdyQvu/vsU68uULtg3uXwEfNt4A/u0sL97W7VTjpJnE8?=
 =?us-ascii?Q?bi6vnIQLCAaP1z3T+AyNm7amWU6q6Y8aOBwlllyeHANQs2BLRhLUV1AAXcUO?=
 =?us-ascii?Q?bMKds9X8KrmIj03acRjJ1+EwAtVkTFGfDZ1z5YMaoyNFqRsLGc5FFAhYkU+u?=
 =?us-ascii?Q?4BM3c099jjBmQLjnfVV/QOMD4Z3bifXDcd1QvCRNC8VngDbFL1s96HszzbJA?=
 =?us-ascii?Q?mrbzm6TmyK2qbfVqaejal6a+ifQnQrippbvlxhe+dRVw64Vv5HbhivGEjSWp?=
 =?us-ascii?Q?aToazqPAakE2DgQAvU/xk0Qr2wduCnWbYk5qdR7K1uOKLLSGLh8tC+xjBMqM?=
 =?us-ascii?Q?kXrE4MwgrAMlETY7dp6VIIQimRA1dZe7GZBsiYcOxO2MeJ2EjlLARqyJhzUL?=
 =?us-ascii?Q?v+n/MjF9QNav7NOKJmuExahIDoiyDJK8ZufA/+YdA0ZpF0AEvSQ+0iCUTRTu?=
 =?us-ascii?Q?9jGe0U086eGKy3hl8lHRslUSFs0jL6fWg1cWTnOvMVfVqlEPUlvPqNs05utz?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0c5d90-2e88-4e2b-ac43-08ddcf45e510
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:48:45.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ugnu9Qehb5S3IBYga+ln+jea1Z1BK/z0hawUyxNWl59o5FKIsVb1MQyBby5iHEedaG0HugssU9iUDJ4TiV+xErz8NlEs6Hz4PnuRMS/LdTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MSBTYWx0ZWRfXzW0xg9su3Hhy
 Ztfm6CB50LlrDjveqGnk52tvM/VRQ7bSRyC43raCT8VzdOKRQ3lNPdfNupNGWaTd5JULkG/tOkV
 3Bsdd0wCTDqsek1pf2j+6z7LSANB1pcpHvG2TZsSMDTwJTFhLzlmMvtAQiqN6EpwkbORj7ND/8s
 6Xl4qApZRp6AcokqxQUb3872EQ4kIzHi5VtdD0/9aaT5JkUihvoA9VrEy9Jsavp6dqd+psf9uCP
 9fUBZJf1OFCk0XkgZBXlJO+Jw+M7SD44lgbltPsdOHPf9JVZJhsbJbOgvKT7SQ4QAWYHwCnETjz
 YMMftKiZlt7JvhSWEAYvUlbcszfGtJm42KO2mS+dLmHt1LHlipsXQG3Rd6e+ysLAEWNOjWgTMiC
 fZ4SRtsv
X-Authority-Analysis: v=2.4 cv=MbVsu4/f c=1 sm=1 tr=0 ts=6889dc6f cx=c_pps
 a=zxHiD508taSEJT0SitQUCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=M3dyMfgvqobQDrJ_8gwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 832XNHj4wqFdl1muHJLYcTkGYJK_Xupw
X-Proofpoint-ORIG-GUID: 832XNHj4wqFdl1muHJLYcTkGYJK_Xupw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221112

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Ensure that cargo build successfully builds the binary for the target by default.
This test validates whether the default build process produces the expected output
for the specified target.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/cases/rust.py                  | 16 ++++++++++++++++
 .../rust/rust-cross-canadian.inc                 |  1 +
 2 files changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 4b115bebf5..17908f21f5 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+import json
 import os
 import shutil
 import unittest
@@ -33,6 +34,21 @@ class RustCompileTest(OESDKTestCase):
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+    def test_check_cargo_build_default_target(self):
+        result_env = self._run("echo $RUST_TARGET_SYS_VALUE")
+        rust_target_sys = result_env.strip()
+        result = self._run("cd %s/hello; cargo build --message-format=json | jq -rc 'select(.executable != null) | .executable'" % (self.tc.sdk_dir))
+        lines = result.strip().splitlines()
+        last_path = lines[-1]
+        parts = last_path.split(os.sep)
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
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index ba11cab524..c0f6b85bb5 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -61,6 +61,7 @@ do_install () {
         LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/lib/rustlib/${RUST_TARGET_SYS}/lib"
 	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	export RUST_TARGET_SYS_VALUE="${RUST_TARGET_SYS}"
 	EOF
 
     chown -R root.root ${D}
-- 
2.49.0


