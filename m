Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F253C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 04:38:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.44835.1743395896875306225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 21:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V3lkp3021613
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 21:38:16 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45pgck9caj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 21:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyjoCV/kxUFkVUdzIO+LvSvIeqhcjnDZTdp893VHtYq2R5BUPtwmswMh+qDFdMzQO9dLQABBMwvncOGf55wZQK0FwynnSyQpxftHteMbW6SuL12eoofuvxmYfoPvxhpJXign2UlFJC4WYqmrt8NMbCU5oKjbAmKtL3171XiPEwJz8gTVFVyqE9QW/sIAjTTyws2avgQuvpjzDihK1tLnEJ3s6IhIylaYe6ih9iTHPbmqjxroIJ6LI8iLicWZ9260s3ZiU77WYOqy7zDvqCbOZIIe9jmum3bq3H8gz2Ofd6YV/Sxu3YasNVcs+FZfLVwP7jA/QNdTVq1PhbhLp4PYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4pZTRA00wCA6iHPUPbNqdfGiiuoQi00E8KWjax1lgM=;
 b=QDQ6Bze47vNp9X8/NXhqzN9paR+Uu7ZRimoxo1sFtwAwQno4y8HrilJd5eg916ldP4ePMZsYDwdSPLC4+YFqKKheGUrOf/BKbV4ms0EpkTVNTDvr6iDv/ZnkNY3O5eEckJWoaEkFhf1TFBoQX0y3sozQVNNuA6JhBDNY2LWzkXO9W3sA0ihXx8O2zpAB8zRwQ+c03ThqARojYCXR9l7DyLDHOr8/j1LmdGXOTIBjOlelhN5zG/mpjm1I1oBGQpsYJO5P/LDKC4fpwHkTrsxtp1zdy9L4l6tMMwZHKKKHvWyNXwPqnw+LXqIZbcApPtmpdZeo/1GRrPgEAa6W1bXXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 04:38:12 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 04:38:11 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] rust: Update "do_update_snapshot" task for rust-snapshot.inc
Date: Sun, 30 Mar 2025 21:35:59 -0700
Message-ID: <20250331043737.1964155-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 943f463f-1d13-492b-da9e-08dd700dd7f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sKybSzcI4Z2FCJUsfSRHCzerZ4ZdPB08qi4SI3R+9LDxgPjUDHplT9rUZuoO?=
 =?us-ascii?Q?TbImjxH7IqCsra/dDuF3GMEG+t/0Wmu65gbuoRCWkrtrLXqYAWsOeJxsXPUr?=
 =?us-ascii?Q?5vFSFZDrI+ESR5bj48R1TZGZSB+WWf4uvE7zjbQCF+7XnBtaol1AKbQ97FNY?=
 =?us-ascii?Q?mkTza8AMRDhjyM9ntzQf+gcjPGFWP+qQx0YJQlkUkV97fJakyhWV/620LmLj?=
 =?us-ascii?Q?bYwBdzfLxG3Zg8Iby3k2cLsUcpUf7Ng9GH1DakjMlANnaX+Y57bYLSQbkaJd?=
 =?us-ascii?Q?hDGOnPqvIU+96VhFy9bbx5dJeJpF5spHgHL0qnRNypc2RkrkqJ3sXsUFa3rB?=
 =?us-ascii?Q?cTuqFEgfSFJ5g7gfdqeMH9LZEKiCpoFGCxgJsM31uwMzm1cH/o1GaUlnyjDD?=
 =?us-ascii?Q?ajDqQEhR6w1wUEWDED729smoXhBYg/OwkjR5OU/bnBV9IX6j/6px6EyhDGvb?=
 =?us-ascii?Q?wLAAtVHZo+Co/aN7lzr9dKHhb7q7u/nYbSwLe8crxnisbZrUCTfIr5LYRxrj?=
 =?us-ascii?Q?JDiwKYWoqP2dbanrgBbSavhyKkwy0f9iteD83pIm9BlATLmLsdbsg5rB4mXi?=
 =?us-ascii?Q?nYRwh4Gdy5B7YVw059czW4RBRLZSRT7SK2bkZN35Qwv+LLmnG4KtwPlN3g3Y?=
 =?us-ascii?Q?Ln6ti8nqq0Qq0woyTRrFDerLjsqbGoLTW/rQk0nrijefyj4rT77vQ8pX9uW1?=
 =?us-ascii?Q?NUW//TaTd36zJRXc1OWquXj+CHabIAdZNrrjM5+alrY9uiz/SZPaR222ROZ2?=
 =?us-ascii?Q?uEjZeIiYsOpPeE2/uejQrm52fD9m1jG2GeMm23GmVXCmGxOvFaGhevsGsYlD?=
 =?us-ascii?Q?HPnRHozJyo9EvEocGPttFtTVyqPb+dySn9FPLGAZlMC2ygWWQg9pGMdj4Vrw?=
 =?us-ascii?Q?Yc97J6647yY7NZBDEow7VqqbopINqT7BnqcXuz0KS1waMBR9OR7LgzsIlTNX?=
 =?us-ascii?Q?1MTJInoO6FstF5nPlghUdyrJbG5F3upQA+Mui/ZUYfq+gxjaXSvdey9N7rko?=
 =?us-ascii?Q?hwHsCrK2cBppRagy2ibF3WBwTL+PBv9DYMfE9sE6loyW2NT7T0bMNJSv+Ua0?=
 =?us-ascii?Q?CsjP4hrz6VqmDGkgnvjXo84WWaSKMBxJ26k/HXvQEIsXmzWn1lFjq7NU2AUn?=
 =?us-ascii?Q?FmPzunSGf6kbc/52sEDMtUkS2vkKzJN8xiprDFra2HRqoCJrjSlcNos/dXJq?=
 =?us-ascii?Q?csx9VTSymkTCJ+kSthncbAyPFxCgwY7AT5wN3jKqDlyW0ddb6+JaMTqeP0up?=
 =?us-ascii?Q?UXBaf1Z1cbP82cLWsMPuT+kwzl8UHcil1wJXWvb0moqJd576LjWG6D/0uGPr?=
 =?us-ascii?Q?Wh2gv61vZxRwtL3/tliEQQSaI9sRt3lKYqih4jr4ut/9qgpBjCNLugS/Dm0w?=
 =?us-ascii?Q?Hpcoj3SwKV6jiX/7wpDfYTNfmzEZDygOLAK+cH51Vzu+fRRrK6Up0P4hOy17?=
 =?us-ascii?Q?LBeHqM7pYqCM7UGhP6ZoyRwzMUp43uzfJ3rM0mJYXakQ3pcVqSfG30GOWC8Z?=
 =?us-ascii?Q?FMNdzAvGisJeGDM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BIHDoF0iXWisaDZ5JCbZuPBlGrhAVLvqU3k1Yb1yalrmIdRaV3Z9R/1PKvbg?=
 =?us-ascii?Q?g7kvWPpaVEahxKdetSJpw01ktBAvxSZvUExbpmdAbvkvCtZHz6jjiisrMXiq?=
 =?us-ascii?Q?68pmBFMkcnPK9ZrStTLqJhRdO1Dn9REKC7z13WlBUQHcWCpTn5C0c7KCbWpC?=
 =?us-ascii?Q?+ClGPuJ0Z46SWZzxLAnDAyhV3aosdvRnmQ1tiS+ITw0WEz4iZUAZAvO6YyBW?=
 =?us-ascii?Q?QdkpUxZVWHlrA0weXLS83ggSNNYsjqtZZ9P8UkWYu72Bip81a4knGoM51rSm?=
 =?us-ascii?Q?u+CXuyrASerm6k/FqxEnmpwmzNflFdJsA5tT+eznYm5bTr0dpXuZMl3BTidX?=
 =?us-ascii?Q?6rrXaYIujnrdmXd7+mTImr2bDL99H4I7yltprbvr1G5KTvM8/8YcEGVorBC9?=
 =?us-ascii?Q?ZDrY50LBYkxXXBz5nDyBPju76P6qNjB7bwm1eW61HJsK7d3FnE5qCA+ywDyw?=
 =?us-ascii?Q?/SfCnJ9oEXngZK69q50HFFmpS6Q+vwEfjNk3vjc8zoM76y9XXDtEM4QFcVPI?=
 =?us-ascii?Q?2SKr6owAJvqb45DhIxbP7cuyPRwU1geZFVkedAWw8vcgiOK+iiN3E3xSKT3y?=
 =?us-ascii?Q?CL11wYWPG5Q8UWma3o82DWqaqlaW/4RVjDtkIK5FzgwMXxeXodPFnIUZ+c9X?=
 =?us-ascii?Q?gX1yOgkhl4Ede34/yAwKFek4Bo8G0lQzRcXApasdePNACG2PgBmjib7NASzz?=
 =?us-ascii?Q?cPCJWCxFMzulkHJ3enmEyTV6riKCPI2cao0gDjIrClKAcIMJoDjW1RVpk+yd?=
 =?us-ascii?Q?xVF9uyHiR0Q+UKulmJCe0SxOUyOZjqBUToWep/RVxkkliZ9fsIEW6BvNYjS0?=
 =?us-ascii?Q?NpB6N9l/83Xe0c+jNmaplFjOPZhZp7TT/mXA717B7xIO1THGuQxTzIbqta9/?=
 =?us-ascii?Q?Lnqbls7OhVOhI09N0g5ruMa/treJW8T3rlfoDdBUy20iIE3WzjxtcPcQuSHK?=
 =?us-ascii?Q?3LeQW/9wy780mNso8D5RoY0UZLB7Blbzva2dfFfsT9vHqUev/I+ULD+j5B90?=
 =?us-ascii?Q?v7obi0FuluUgV8K6F+GlXa1e+P/2Tzxmcv+a0aRIbA3mDlqzEyZ15Q1I6GNA?=
 =?us-ascii?Q?RvHpJ606MGxNnhFqbjRiExuxbgFxsIeHt80gX6kDjVuMuT5Kt3SAmvLjFwzx?=
 =?us-ascii?Q?insLxKaiZ5dRy2F+rcjrpp1pLC69yQWA8ioEgiJ1zMrDbr/nX0B1qEawjyYu?=
 =?us-ascii?Q?i1bvawWLFWGn7Fe5/+zocak4M3ZO8tdhZwrf+9yuiDOoRgZAQMMDGH9o7nI5?=
 =?us-ascii?Q?V3eA2GMOXgEOMLGfGTOq9uyCn/W1q8y833Pe8znsDJblv87GHPbyXyM5t/cu?=
 =?us-ascii?Q?oTVBj2shNfxEfEOkSfdxJkfb3rrFML0gR5q2rZTP6G2z1nTSbcQVbM0z0M7l?=
 =?us-ascii?Q?ztXeLXCghPgvr+97kOUX5nH3F8BQs83wtT+qUS4T2TLB64s69Jk/Preyt6PD?=
 =?us-ascii?Q?hK2gWFX4hqCQrMk5p1YlClAY6mBxJ1AE2Z66kXEYmTcceZJKLCM17BKQAOVp?=
 =?us-ascii?Q?DGff4ccNyiYinXhGYNnc15iQf05HPygktXV0v5LdFxaGbysmEkBKu92XyeKd?=
 =?us-ascii?Q?ChQ62UDS/7WbqfhPWzc7dBjOwhickqdB7ms7kdpJmmbZjQ0mydmPR04tCn16?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943f463f-1d13-492b-da9e-08dd700dd7f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 04:38:11.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw1TOYmPfwpzcsgYmHFrmGRMXZaIUAPQqfzSOmtrFemI1vK2Vy0ODjIQVqPFdq4ZoW92kY8qIZUidIhzB9HynV3Jjci8l3sBJMCn7oKJE1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-Proofpoint-GUID: AAwtCEAe45K7U_B74x_acJwVz-Z21MjJ
X-Authority-Analysis: v=2.4 cv=Paz/hjhd c=1 sm=1 tr=0 ts=67ea1c38 cx=c_pps a=VzeH2YOhhDlPZ0WtbyP6yA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=35MxA5Dq-6QydqeM2aUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AAwtCEAe45K7U_B74x_acJwVz-Z21MjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=993
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213927

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


