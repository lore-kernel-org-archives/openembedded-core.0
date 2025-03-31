Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D933DC36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 05:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45626.1743400487601828612
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 22:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V5m2G3019767
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p6311ska-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc/OZXiQ/0cokYU/FtSye7vIJpvETSa1k+b4ej3HwBshNgt/3N/kTKuycIwQVjbwyJ/iSwyRkoFnsi+GKpgmDfFRo1EOQnYsAfO2PQ5o6E5ivsoPjtX+x6mztlL/BAIhLV+gdLUKF10keN9YREdd1dwfVdadY41sBDgeZsqdsJ3ja7VZBqDgRVsWymihCOxzX/FLKWQB6OugtJurw4RyLWwLY3JGX2H4dLrc30v6FmWjECyQ3mpID5S+iV1yzGZt1Me3aNb9hsYmKSvIYcl+hQdA2iDOC2c2K5KMk15rP081B5pbGQ57JgoYP2ZOciRuI83Jf0FxAx/jwbxLytzb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4pZTRA00wCA6iHPUPbNqdfGiiuoQi00E8KWjax1lgM=;
 b=aK7jDiWRECTcqreW9hLSlENuHQLq21G1BfiqQ4HmeFwvEUTVrfNSXF9kwf1FcgBU8Ps8LvB4i3Narox2IxKrMwj/IaGRSYKXzn8BoXxJ5HErreCoyHeB99JsQMPkReaivQVFQnoSR8Cvb7eCszeJAKFRHdmLwUxoIHG+mPmldczdB2EOs3OoWc4VtRw6wd3mNeeVdh3XZpP7XflcxafZWkCaobVe3/8TyBsZ2IgELx1ch+GefzcPd0NINCsPwpEh5UxtaYKLKss+9dNKVMy1rEjgvqV+ZEbQKOqp/HAVIBzMenVLkhoZJgaQZW96OGiz64Ssp4WNYOvRT9MDJANbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:54:44 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 05:54:44 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] rust: Update "do_update_snapshot" task for rust-snapshot.inc
Date: Sun, 30 Mar 2025 22:54:20 -0700
Message-ID: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:930:a3::29) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: b06e083d-03fa-4cf4-9444-08dd70188929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?227OhxFygG4hx23M7i6I+lLoYvw96VQa2WkP4zVk0MF+w7rkEUf0TxpQ71/P?=
 =?us-ascii?Q?d7oWGfvmIbJ9F+gvM3ETCYBr72OXRpuEbrIoO8GtUco0d7z0Xq4bMGyboIZj?=
 =?us-ascii?Q?QJuChIKvGqO8TzsuIxgjxFqE4IgueDKk3YYmlRLfp0L2jHSbB2mDM3FcFL2k?=
 =?us-ascii?Q?VicIXTY8j1p7vjKHG3cgAXsY+oWc9D96qVmDdbcgVyuNoJ1vq1WpyrYlKcqM?=
 =?us-ascii?Q?TAJtdaFgPNwC/zQ03y1rs+0Sjnxgo0qBvvb8zvLJFs6XHg+/TGVSczirb+Jp?=
 =?us-ascii?Q?6kictcxJN12NCBxae1M+dGD+nCw2uTm+Z4BbJXUOp6YuzofTjBhQ2mHRrHy+?=
 =?us-ascii?Q?Y0CV7oBsw4l3x1ZRbKS5B8h1k16PJGCWCxKpZa2Y1arO8ha47VuAc2Ehj3Bf?=
 =?us-ascii?Q?bY5kcc1GziiDiQB0kSZYxXdCingPI7IofC0hYQl4+Wn/ggB9GNHNao4GX0bL?=
 =?us-ascii?Q?7ozhhheGkYvUGGHpO+O+Ac6rv4+IzotFp7Eu0ArkhiNLvc5XyaCe5wh0cy3X?=
 =?us-ascii?Q?ldI89jon6GTBTb/6a7xivdmC7Bm4/VX4TaFxdKJ4CuDe30xPezUdC/9X2x9Z?=
 =?us-ascii?Q?9rkVmtOwxEmeRZtNFePtKtBN4iImUzV1H1s1R6KVuWwiHCYE70LuGLGzso88?=
 =?us-ascii?Q?Z7DILjYCvfeEG10Sk4xEU4yyUWWpA6N7shHjCO53FZbwn0XQE7ubGwscX1CS?=
 =?us-ascii?Q?3qTlWjvPWkxMWGYFKfVFM1YwpkVEq1mqna5OhoMyPLniz4w85EINPxa+Doyk?=
 =?us-ascii?Q?G6QxKfScbllrrkyF8Mllc2dpTmVGQnnG574TdkG8yxQb/WhAgAe9z7htsBA/?=
 =?us-ascii?Q?ybR5udqMR5de9S4YoRI3ELCkzrpGpjVL3Ld67SmsrYlhNjT5612C+9Pw9DDe?=
 =?us-ascii?Q?IrS/CJ9Il2LuSjnLQMs08E2wqpqy/ipUsIc1LhvSUZaZm2cI78qvz53lupbR?=
 =?us-ascii?Q?KyLBUb1BWRqOpyZKNUwuRuNywGR5h1zCch3d//wLiKdl1zJB5dGLglHXBJRj?=
 =?us-ascii?Q?AObp7OOXkamia/5VTGcuQpyasyTSDINPsgnc2XCJ3bx7b+LmDWWm3q71uAT7?=
 =?us-ascii?Q?PiP2/fuH+nYoGSQgIc0+qd4An3fqSFY0VvMNUfH882nPRCKBWV7rpauA6Dx2?=
 =?us-ascii?Q?SZk31AAFLtRB4fI6XzOSESQTlKKKbVOqhgZJCDEI+4OAFxitcM+hksAyN/3W?=
 =?us-ascii?Q?aw5bPOhQYGgMST0CtxPCujq9AyuHZ/1JL2GIR4ubSsqnkXcqbgE0yb5/IkVE?=
 =?us-ascii?Q?M9svVrN0WAqGM7jxC2hRb5eMc3kWnp62nrijr2DmtN9+QozFxc93/XktBrIU?=
 =?us-ascii?Q?jTogvpyUbFnpuAcMhrW7vGZodTngNQchxAtxYlEMo8yQGXx+5PfYm/d6yeC5?=
 =?us-ascii?Q?PhLVdrZjON4pzoD/01t1eeM3734/cLXrT8S7vEBZXcLtHyAr+7eN8LVN5rsJ?=
 =?us-ascii?Q?/wizghio4MFA5bEVAmK+UoIjpl08ohrk6qcyQSAoImEp/Gq/U4wMPDzQ4fjE?=
 =?us-ascii?Q?O52uHb2mRNrd21Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nws8HgoP/Bkmo6fUuSX/hM63/bDRwQPGN/T7y4XwGC3R2fkb+ojVb5ULDTtq?=
 =?us-ascii?Q?jfrCvHExpFoprF5mastxV8wug5EQPX+JzUXOjE9k6GD7dYqwOdgYTCnUH2fq?=
 =?us-ascii?Q?d4DDXUDHw6BWZYLLWXrhA4QppZDh7+339QmUaDDqOfZyVdmpgVrIq5sxezFi?=
 =?us-ascii?Q?8lUh44Tis2HKSrKWF+VzYiKFqbi3BlnbFD74QwFy8EX3Z45iRNLJnVQl5ERM?=
 =?us-ascii?Q?9JnYonAl6WpRVGIKlDhYdBrB1TXhUekJ24b54vOCdlY7BpnmnBVQTumW7EFl?=
 =?us-ascii?Q?C0CY17sTmq3kboOw3RoFqgQJev/pwL9V41g9LyiJUk0daF9Z/XBYGs+TweHc?=
 =?us-ascii?Q?pzrdWHZiuY3F4UYAS+EqBDUQ7xQE18lFefZ1js0Fl6/9mwwMi/2LjelZH2WY?=
 =?us-ascii?Q?zgaQUL/y8RWImoSX4KcJRxTj7XOT1auMDTvl+CwEFsBjosePAkU27y6htRKh?=
 =?us-ascii?Q?2XzEmDYq4NMdPvmsgTSuKm99i4lmRD2rKoiqJ1bcK79T/m127eUvijU4MD3V?=
 =?us-ascii?Q?YLwChnoi4nggDpcTiP1K01dimACt6zz5S8ZFKUZdGnvbr44a8yIk3u7ZZq2k?=
 =?us-ascii?Q?EcsiXcHALD0L4MH8RIOrvkJYp4GxW+EZP6Oip5JZSc4GzVh76aWlrvwjWCXa?=
 =?us-ascii?Q?YthoEBcE9D2mDNVvTRnQnvvxvSiyvXV6M59XTVADPD0S5Q7SdzyaHjOa9Quw?=
 =?us-ascii?Q?b50Ttb2DdcV8jjvKQqnXlBvhbkbMxTD9QiAwz805P2STuqxdA5EmNSYwzauf?=
 =?us-ascii?Q?Bv7Q2rBin4Bso0okSf0y3Q0DQkKDhE/jP4ueqbuGdGTwtTLeR6IRO7FmWokM?=
 =?us-ascii?Q?jOTWoAib8Gv5h3j9qpNptI81oqoLYfRCBYhGr1zUx7fWVCDwfSMvd4QJSlwq?=
 =?us-ascii?Q?J1zrnGKBX1LtozoKsLct1yct7brJg6CwnKjHMu6tB29PyrJ/Y2Cv+O/FGOVL?=
 =?us-ascii?Q?yyzlGQxnPvB/FvQqnzuuMlQF1KtIF/rvgmx7F48MzSQ80P/6BfQdoGCe1q4C?=
 =?us-ascii?Q?muLPGr2SZjgKhnqwfshtZFaKao3n9uI3qNAv6gPMau8jKlQunv10tkJgC9ih?=
 =?us-ascii?Q?6mITmzbKstJeRerPgYBLci8f/bcSCzB8LHMTZNDVCz7tXgXkZ6NWQeVHR2UB?=
 =?us-ascii?Q?O3DMlqLALIpNt4sYHPCx4vAJahockRRD5VX8uY77N/e8mGgrPfmQ731qhGNt?=
 =?us-ascii?Q?qEfyWv+62kynP8lzdP0BxclVSTW5gFXZKndUCuMntRawaZI1kDSFIDwJhjGI?=
 =?us-ascii?Q?jzyp+cdwYyYlDEmgWwRzspq5qdS2Oi8rGnmd8qSO2pWcm4Qq8HuNXZJJAJdL?=
 =?us-ascii?Q?ggTNQpB3m+S4hv1n05RYQ4IwHXeLudSP8SXquIgoQcBENjP/dIbA04/N4WTi?=
 =?us-ascii?Q?L6lQGmaCUb6KYo9evtWrks5hXN5zRdfj7PfUtWFO70DGr7iveyaRqChatD44?=
 =?us-ascii?Q?RG2OlAmG7CDmJOMHIWe436xB2HRJw8BN+Q0agWXH6TJ+nCJPf7Ly76VKH7/5?=
 =?us-ascii?Q?crlnL4hC/shiScSBFh9Epjf7sSLf4226JrQzJOXWj25GMM9rPKdVth4caqYl?=
 =?us-ascii?Q?+/Qb8HpElHcCthh03qWWikPfXvVG6a6wEx3ul1VlwXsA0/Ep7wt+3l6mRwXU?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06e083d-03fa-4cf4-9444-08dd70188929
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:54:44.0389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTOV8NJZYBb8WbuJaB/38xTGpB7k2NyKu9lqqi7Dthxt5qlSfCBrhlmYrvR7M4D1YRf6oAPZ8vFD5gN8NZgFoYdOulF6lLQBaJgm7h0Ic/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67ea2e26 cx=c_pps a=clyc6YhGvfCRRXf4btgSWw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=35MxA5Dq-6QydqeM2aUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: -MKjrmIrz4hBgCRHejgxIM1b7xkjRTZf
X-Proofpoint-GUID: -MKjrmIrz4hBgCRHejgxIM1b7xkjRTZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=980 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213934

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


