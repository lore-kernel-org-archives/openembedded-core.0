Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5546EC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:30:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12609.1743172237232690562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61826d4890=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SA3oR3018831
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 14:30:36 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hm68q92c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 14:30:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWv0oPvsG6JpdVOzQ89h9ImBFwABLniPNfy2E9odqu9M9QpIH0LVkQ40etgRuMiYuGn8LFQoUYEjBzIlXpWsX9mn13W0haZQ8K+7Jpz7dScFUhmdzkul2sSyOEuuc5RAxzwOP7OQtR1D4V99aUBdvsX3xXg1gcch8RchQEJIqDe0/v6QuNDzZQETol2QcvhKtBs6yTRNlFgKvF1uJS+vel3WwY7eW/CbFWQWxPTyX4Tg+m0KeYbH4JcCNnDqHZSRFyTFKtK7eekCRdAgs/MfAZ3nhhBe3+wpDUMCm5CTddODJVAT1JQS4vOfmQ5n5LRopuafKwJoDW5+/ZLVcCc/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4pZTRA00wCA6iHPUPbNqdfGiiuoQi00E8KWjax1lgM=;
 b=uaaZ70+g4IBlE3zehOlWyLcazjLT9t6RKTrX4PAsWtqNN0CQ9I7EpGzIRUJ+jZCT1s4NWHB/kXTo34pWRWpUjbnbdjQ0kNXR3Y9KYTY7DznXYqq3kV3GAGqlbOpfA7kxbvSHCuXxa/cfD/hPlRH1pHA8X72wTYO+5PnwFD8w90feZ9ejbMS9u1VhRhalPX6RYxcMnmv0E+NKXy+sgnZor/dFk63tcJi0EWVU0cBnPMH439M1KyaDZBOJWj0uXzBLsOcX1DHM7Ousy4jr8IUPfn2uTRtQu7O+8YygllklMZigI6uXOFj44FZFE2txI1Y88mILh4akX4glMn/DNrkCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:30:30 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:30:30 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 1/3] rust: Update "do_update_snapshot" task for rust-snapshot.inc
Date: Fri, 28 Mar 2025 07:30:01 -0700
Message-ID: <20250328143005.880998-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ROAP284CA0003.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:c::8)
 To PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: cd12371d-35e8-4c40-51f0-08dd6e05171c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PX1yEUWXodmrtiyUE1PnLOy9Mnc76CG6X2X4k95tmEdWHR55vjIAwvIcTpLP?=
 =?us-ascii?Q?UEqnVF5vIxu6TIZFZJmljn2ngK7iJ80yFzbhqFWXmWWYAfFxW78yF6sOoTXk?=
 =?us-ascii?Q?ugpdHcDOzNURYn4BCDB04meR/PysgPHntl+2Wd+2MbMx3zrI0wSJmyf+c0Sg?=
 =?us-ascii?Q?jhv3h2NV0ZX3r2nAKXaNsHK6pRmEPJIkJv1FK5qvTiHaP7eYXWc2Rtll0Tmf?=
 =?us-ascii?Q?lnZdNW9Oq9wJ7qW9iCZZuhsgytU8O8EFGxVvnQb/AyyBuSFTeLPh0XtQ49eF?=
 =?us-ascii?Q?imDG7AhxBXGLsUdkkQidPNPTW6235OrXHC4jf5sojVreqiA3Wp5nmueXbzns?=
 =?us-ascii?Q?OvYv5C1/c5d84yvOqXot77LSzNI8XKt9+53Q5ws2r/tiF4IJ2C1YSXV4x50O?=
 =?us-ascii?Q?+cOXLQQDv4c11SJatV8nstoFlo+d2wq6sI1Jw7eHP1pMnkxJUe8ETezMHf/F?=
 =?us-ascii?Q?KHP5hWiFw+2dLNeHUhddbkVu86LdyfwHr1gcUxoGJZ1ULL1QPyeWJDnJE7wS?=
 =?us-ascii?Q?/Iar2fOXGhrjS1qZg4nF/UhorKDY4j3eez0bV3q0LUta4Ns7eQM6oUzpmsFT?=
 =?us-ascii?Q?rclMw4ZrQGlmN/TfEzYIGAcjcI9Zq1sOeHbwg2N0H3mK/cRuoIDoq+DqhuMc?=
 =?us-ascii?Q?mhK3Knt4+WWxDor3eQGZ4TCxmyzKX5kS5GJEryQudH6gwvjI4z7HuoeIRYMx?=
 =?us-ascii?Q?ivzm7eKHKSOMvjDm64rqqI9e4sXrlb3ei3lLVY+/qgL1FJ11JqLL36aa3m/+?=
 =?us-ascii?Q?perzK6fpy3REkL75zVcz+1L9+vgiBgYXQVmqelGSNDT5mwrmSbdQMs9ihdcG?=
 =?us-ascii?Q?klqddZKzljXn83ZKMxAeM4vw8nm2wKFWHQ4bxvzj8n+cQKNvkcxuKjmY2Fgx?=
 =?us-ascii?Q?nt1sBqMtVx2FvyuNdivuHt1pPNBK8+m2tasziU8dp8nSyRbUNvYUlNh8eoOj?=
 =?us-ascii?Q?ke9yls/YHmdv13CiInPa/B7ERBXyQNdAKzytkzmaFXrof61fyfZgWvyoqlwE?=
 =?us-ascii?Q?jYZVflN/SJ/LxTOsuJL+pWWZ9x58MLh9efnzpSfJrpNXKgqhjTasdHxIPErn?=
 =?us-ascii?Q?AuGCh11Jzc1d0UFyaCDGbQq376teTbbfWXIqxc9X0tqple8b+SNyRtCt5QSa?=
 =?us-ascii?Q?vVeFxJZSFQDvSU/4xaUJhBIHh8H+4zjlIha468Kj9rGeWjEgdYJNlbh121Wo?=
 =?us-ascii?Q?Tkusq+vkWgSOtuasIq85NCSN/x/xglJrWLNadzETh1nUOM+NCfIrwWvly5pC?=
 =?us-ascii?Q?j91ZelWHcP6ajOY/AMWZzv6pzh5jZE4cuT9kQ+dJgbZBGnapmCOa4zvWvBvN?=
 =?us-ascii?Q?YQCsXydH2sz3/xCXJ7TjpWnxzzpoqPwCjVXVFzCi2mIZJJx6QW2z/SpG/sAO?=
 =?us-ascii?Q?MCDPg0DnwveIALIVJLEzGfaRwTKCwWioiGZJo5p1k0OYznqB4GAe88hjkDe5?=
 =?us-ascii?Q?42n2vpokE6hjKMQJvkyhXZw+5F0q9l21CaXRVZ/vTRBEisTOBIrn3EBHKLW+?=
 =?us-ascii?Q?Ojsz/8tPYVPGtpk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hq75JLPmzNoNMjVa0f7NIRaIeb716Gv4A6DoU6SO5C9fECEtmvpnrCcaM+gs?=
 =?us-ascii?Q?G2ctlKhxQ9k56UPUoeeuyJ5ra/3RbnaUdYfKDe+UZ07bXijd4UwlkWjnBifS?=
 =?us-ascii?Q?XJeaqA6A1a8gWTb0pWVX5shcs3THVKnQGp3gvylmTe1556LBAYo5ZOEhPbQA?=
 =?us-ascii?Q?j+ydgN4EYC5yOPW/w8pe8/c+3C8YGN1qkTa8m9p3ONVxIRh+/1N8YxIG5aP8?=
 =?us-ascii?Q?fe56weW1aUYA1mNFizOqQ7XOluuKana7lDUJo/xhTyrIwFYQNIamIiOv7SYy?=
 =?us-ascii?Q?BYC+E9u+wx2D09BY7JhzmKvC7BShR4nC2+4Omhgeewuiwe0lKZdub5pLomA0?=
 =?us-ascii?Q?6rSUDB/EBFpCNV7aQJl8V8cEW/1jFkQkQcPSP7BrNt/myoL5B9vER6WVt2qP?=
 =?us-ascii?Q?hPy07n4S745nO5+1/QZyMaVh6/esovDBGfyPEtDNAKpvm9xq2rccZG8ab7kM?=
 =?us-ascii?Q?8sNMKdYSMH13e9oOLbFOP94pyTWp0Y/FhIUcovS6X40+hT/ghIbY+72CLnOK?=
 =?us-ascii?Q?EK85TtNiuorTYJqleLyw68OWYLYLau+gDPVffOL+zRoJI2sVfSMj5cbgx4Ka?=
 =?us-ascii?Q?RnQHoC09KA9PEhSyez6bkucPjZHx/4/HMPh4xELb7dNUTpl+jI2RSDF99bix?=
 =?us-ascii?Q?9SqpMELE1y8q82bCk8683JH/dSip7WfzrjlTwf4Yw2hTal4KqIC93ZN94Eir?=
 =?us-ascii?Q?ZnEBG7IteYp/aygWq2kzjK6IVSvjSM/BZPdORhU2PsJe/Sr5Aa40OaFFTfyK?=
 =?us-ascii?Q?kzfYnUioH/5pfwfNkY49gzD1maYEAeHTR6y+b+SQqKbe5uiN3g55t3zYSk8W?=
 =?us-ascii?Q?AJVp6uE+WcEzt+MVzc7QLaD9meDDNf0PBHzfDKv6XiKl/UaDESm64zYL25Ug?=
 =?us-ascii?Q?avJmbu3Ejte2VtL5UXSlAwJdFeww+jCJMuEQmnlNdZHGZSiksKtS6376GlZc?=
 =?us-ascii?Q?gpKtdam/m1aWOwu9ew1OSUWvhWaiNjkvPrO05wkSP5S7IMJ900ZlpoVRjHUU?=
 =?us-ascii?Q?4IVsiqml7g5TSai5M1FPjpFrSTlHek6gddIy6GIgu2P1VXJBvF//AsxNr0BS?=
 =?us-ascii?Q?VP0Tb4z44GeIzU9adoUa0CcoouaDyw0sive/iK2zliKPNEwlQwVt+uU6a2/4?=
 =?us-ascii?Q?7MONahGkwz3Hy7kGl9nUhDYnFUP5kWWU4yAmSOp6Lg1QkpDgUfwdx2TEBXLB?=
 =?us-ascii?Q?y+BVrHm/a0C6NPa7Jumx5MqOyPTSNB8PxrcBQMszHXXq+AZUa0ZDAaMOT5CT?=
 =?us-ascii?Q?BnpG58RD5lhcxzBg+RVgZSjipA3iAmaa34aXrNGna/WDqOujGjacO1s0DHYV?=
 =?us-ascii?Q?NugCOtAfh0hKOGIeh3I8CMXqdMKm0wnYw3w2mSuEE5MMOY8UlEoABR/acERF?=
 =?us-ascii?Q?RZuuSzd46N8sapzwl9eePtXcb3X4Py3ZdRllg/z5M6l0rj6vrVZi54UYf7KY?=
 =?us-ascii?Q?pWZhHMMA4lcnW4yxRBsXSd8Jsu+JvWubuFEuREiyw+FFGONbZR2E7qJMgBGU?=
 =?us-ascii?Q?InJvOLr++/vuCFmDkPCcazX0smcdeSNZUJaZQP/VwOaQ/1UNFLFWijkQSNKt?=
 =?us-ascii?Q?7GGKkmCR8pC26BLP45jqR323dp+QSVJPim/UU438PwaVso3SGYI0x4t/VuwH?=
 =?us-ascii?Q?JQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd12371d-35e8-4c40-51f0-08dd6e05171c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:30:30.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BisnH8rrIQpDDtesjGDxZG9LsxJXkqXwDkWnJ7iwnU+Fm+lf3zpSr0wZ95CMCPqXnF9A2dWoY+DQ6M3I+4LKq3SniEy0hXtatrZGN2lJX5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
X-Proofpoint-ORIG-GUID: 7yYq_JCOi3nE8nbhqG1id5IH5XJyWxwd
X-Authority-Analysis: v=2.4 cv=etjfzppX c=1 sm=1 tr=0 ts=67e6b28c cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=35MxA5Dq-6QydqeM2aUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7yYq_JCOi3nE8nbhqG1id5IH5XJyWxwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=980 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 14:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213839

From: Yash Shinde <Yash.Shinde@windriver.com>

The 'do_update_snapshot' task is failed with below error:
Exception: FileNotFoundError: [Errno 2] No such file or directory: '.../rustc-1.83.0-src/src/stage0.json'

There are changes in use of key-value format in stage0 file in
rust sources and the rust recipe should be apdated for that.

Changes in rust:
https://github.com/rust-lang/rust/commit/1adfffd07f8704ca722f3897719ace079944b0c5

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.84.1.bb | 47 +++++++++++++++--------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.84.1.bb b/meta/recipes-devtools/rust/rust_1.84.1.bb
index ee8c782ce3..5a181b059c 100644
--- a/meta/recipes-devtools/rust/rust_1.84.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.84.1.bb
@@ -327,24 +327,37 @@ python do_update_snapshot() {
 
     from collections import defaultdict
 
-    with open(os.path.join(d.getVar("S"), "src", "stage0.json")) as f:
-        j = json.load(f)
-
-    config_dist_server = j['config']['dist_server']
-    compiler_date = j['compiler']['date']
-    compiler_version = j['compiler']['version']
+    key_value_pairs = {}
+    with open(os.path.join(d.getVar("S"), "src", "stage0")) as f:
+        for line in f:
+            # Skip empty lines or comments
+            if not line.strip() or line.startswith("#"):
+                continue
+            # Split the line into key and value using '=' as separator
+            match = re.match(r'(\S+)\s*=\s*(\S+)', line.strip())
+            if match:
+                key = match.group(1)
+                value = match.group(2)
+                key_value_pairs[key] = value
+    # Extract the required values from key_value_pairs
+    config_dist_server = key_value_pairs.get('dist_server', '')
+    compiler_date = key_value_pairs.get('compiler_date', '')
+    compiler_version = key_value_pairs.get('compiler_version', '')
 
     src_uri = defaultdict(list)
-    for k, v in j['checksums_sha256'].items():
-        m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
-        if m:
-            component = m.group('component')
-            arch = m.group('arch')
-            src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
-
+    # Assuming checksums_sha256 is now a key-value pair like: checksum_key = checksum_value
+    for k, v in key_value_pairs.items():
+        # Match the pattern for checksums
+        if "dist" in k and "tar.xz" in k:
+            m = re.search(f"dist/{compiler_date}/(?P<component>.*)-{compiler_version}-(?P<arch>.*)-unknown-linux-gnu\\.tar\\.xz", k)
+            if m:
+                component = m.group('component')
+                arch = m.group('arch')
+                src_uri[arch].append(f"SRC_URI[{component}-snapshot-{arch}.sha256sum] = \"{v}\"")
+    # Create the snapshot string with the extracted values
     snapshot = """\
 ## This is information on the rust-snapshot (binary) used to build our current release.
-## snapshot info is taken from rust/src/stage0.json
+## snapshot info is taken from rust/src/stage0
 ## Rust is self-hosting and bootstraps itself with a pre-built previous version of itself.
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
@@ -352,10 +365,10 @@ python do_update_snapshot() {
 SNAPSHOT_VERSION = "%s"
 
 """ % compiler_version
-
+    # Add the checksum components to the snapshot
     for arch, components in src_uri.items():
         snapshot += "\n".join(components) + "\n\n"
-
+    # Add the additional snapshot URIs
     snapshot += """\
 SRC_URI += " \\
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \\
@@ -369,7 +382,7 @@ RUST_STD_SNAPSHOT = "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-lin
 RUSTC_SNAPSHOT = "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 CARGO_SNAPSHOT = "cargo-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
 """ % config_dist_server
-
+    # Write the updated snapshot information to the rust-snapshot.inc file
     with open(os.path.join(d.getVar("THISDIR"), "rust-snapshot.inc"), "w") as f:
         f.write(snapshot)
 }
-- 
2.43.0


