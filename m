Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5F6C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:02:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12089.1644332548558033803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aTm9FxhF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9038fcab21=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 218DlEFt021650
	for <openembedded-core@lists.openembedded.org>;
 Tue, 8 Feb 2022 07:02:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=gA199WS2bADhOmXH3LlbnXdOeRBJLv/YgOQbi47tPgM=;
 b=aTm9FxhF3O5JMRc6zV7VAhm4ETsqzOeQrrfuxvcKZkOjxASwHSKEcKghgcO+Q7ZpF6Vs
 M+GLVt63lnDZzUkQYRT6R19n+KTMC9M8ePTMY4NDd4YksyCEejiiuUwcELUuF37Ot2jh
 i7G3gVseYc9zxgv7/4arisxLZvCPtNBAw4fcPhUk5gnw8GaGN+34tlFl/ogEwRNFB+gc
 lXCG0BCGROuEkVNDqlHkLOn7Cvb3g5JIAGXOfQrah2qisbOglkTd70dcgcP/Nml01nwj
 g48sF3HSxi16QkgHixAcKj4oMWFFQiQhBOQeO0dpZWqZXOBx9tOwl7kloZJq9ODHUbH0 kA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e3575rwj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:02:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARuXXDsR7VWbKSstprBB9kCO3kZJvEy9B71o3kW3ZQeyzP3iK0qPa36FKMnm1b1jjVd+qbseFbqLp5L7LWIGwBvAJN+3n45N70n9XDeE469ds2suA9NvOQbdJdeE6aQLzAw7b8MDpCdjv4fVoDB6RK0LzvvMqSjpUMTTN/YuTkM0u2QiPnjmxWoa8PRy1N3i3tmhm/uTZ4NvrmgLHSu0ITVZKsa5XhROL6DDCNrHmWscb+M2cOO/setUNUPvZtCbt1OQaPGpgEih6Ep275W6viYRKdCVxpBYq23kaqToLMDW+zFTWD0jgR07cM1TlONd0BJDkU8LIJ/3var2q50B+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA199WS2bADhOmXH3LlbnXdOeRBJLv/YgOQbi47tPgM=;
 b=diw53sF9QqJT+9dzvW2ZXbfsUareX29DQkczlITPG9ElvP5iR5iE/f7KSnIzlAMCDOIr+R6uUPA+faLPajVYG71xFs4rIxoUMIljPvsM0gHKL9shCY/An+AUprW9/9DEpi2Z4N2eY30PqMMG3SJI/7WDXLQM9uivDXjQLInKqG7lnUAOsDQHeQAEbMHybejH/hsc3kUi3RGkIqeB/bna7nXeizoaFKxZJq2tHjcmzhL7tJKMq3tRu1AFoPC5WmX4VoVllKmJ4V67Ura/mXaEUyR+KqBtrqTeECMNfRrTItOIN1/RjBc7za50R9YGXW2hFcd7sZjnYlZ27kKS7vzmgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM6PR11MB3578.namprd11.prod.outlook.com (2603:10b6:5:143::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 15:02:24 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%6]) with mapi id 15.20.4975.011; Tue, 8 Feb 2022
 15:02:24 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH v3] create-spdx: Get SPDX-License-Identifier from source
Date: Tue,  8 Feb 2022 07:02:11 -0800
Message-Id: <20220208150211.181994-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0013.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::26) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfe6b52a-0e2d-489d-582e-08d9eb14039d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3578:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB357837EEA1205556365CC383EE2D9@DM6PR11MB3578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:231;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VaZWPzfC8B+0NWV6sLqTnlFuEbrcswOUq5yXx98XybNJc3buAV1HucXUhD5ZezE2GpdRIdY7t/W80metRsdOmhbqN6qJiELY5uYWbJbD1Rnwc8d6j1uiSPmT3Ef2zeg0TO6LBa8WhkoV3MevjUUe5DtnjyzkpJCEtKzzf3A83UoEq+AJdxYtSEtyNYUJixdOdrDhUP+DLPAkyDxRUAOoyH4oqM16x929OSExCexPkPVPEry045NKGVXkXsNP4jsDtBvgzVmk6bYAisSfKqDtltqXBMLuSWs+ebZp3bHWiuglcDB8c1Kwf3DqyA6wcwZvwwrW+FBHpfmsOxdfNicm3/MD9BnYhxdq0okFI4rhOXdOrAswYbq+41YX6sOcoAX4dOVJdO0rOsfeMS1N6YSiGHqOJcaB2ZegNdzEh5DQft6zJjKSpT/RZWRgPhjsY0lMe5riPkLowQ36f71a+HnzhXV7S2Lwhhtcxry60zEy0dV7QQ3yeGdqCvE6uzqwNumjdeaLfQ6lFCD+aeqmulMEAzKBVX/x8IKgGHTtUNnfvhgG4D1sSFYi/O0cM1Yj3EOQpGkJ9QdoHSZHSCaeQCe5xdlE+KIt3S3SBTF6VTGPwEWcWkny0JTpLt4NoQOisiqf/Yfy5fYoB4+qDN/TrqyS54X354ynHcHxgxEeUHxMjgjAQIxA3XNgjki/c8acBGTqtkj1iY8nPQasudcR3NEENQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6506007)(6512007)(6666004)(83380400001)(6486002)(508600001)(52116002)(36756003)(4326008)(66946007)(8676002)(66556008)(66476007)(8936002)(107886003)(38100700002)(5660300002)(6916009)(316002)(86362001)(38350700002)(44832011)(26005)(186003)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RAg7kymoZUTSsLBKu2px9sBYCsUBsHsNPhL0PNyN71nEyXLJV5nJnNNPwUu1?=
 =?us-ascii?Q?vMNgkbSuyltZlDfg8TIaTVZ9wkHBtpQBC4ZrvYZtMMKq5sjLml2ZOYx2ob1Y?=
 =?us-ascii?Q?gFEAJRsSxVsdbhbgqhJH5iU83BAjiww5FxXRhG6ZOdX+MkRX9usO1XNqyKqb?=
 =?us-ascii?Q?5WCfqhfbR6IPf2TRxiPf/vKTBu9/u+xwltE5giSfD5MWsYbNNKClkMkEKqZR?=
 =?us-ascii?Q?dgMDmyh2qai2I6dWTSH9FLyXXBnYHfTZ1SLDESZ9sUH4xMSaRcq+jGkycl04?=
 =?us-ascii?Q?7OlqrWG30mmQGe7AWTkTTYqaGwiMjLPuvo+6SLjwZyOsAI9la1otdIgkImxe?=
 =?us-ascii?Q?HTCxvcoXTSYMUykf/P1nbshyP/bA8zcOEM6HltuY/Hpssz3Q+QYFLxRl6F21?=
 =?us-ascii?Q?umb7c6mt2YMmEVpWWiy+XncQHul/6NLHqRhlmWJzu3k+fAEIiH8PUVhXkgcK?=
 =?us-ascii?Q?ANYZuyKHohuJTg1UqkpDYw5J3DyLij6XrMAz3+k7x+qxwKP6SylAzCsG2NqS?=
 =?us-ascii?Q?v/N/0sGTcMdafqkXafLI9k+AEp3ZgCa+/0SKT0sS8bSABeGssRf+FEpGBOGH?=
 =?us-ascii?Q?17GV2ltSpsZKHZIMc4ay2vphHr8Y++sG2uOA3QWsqw9mtm4ittpzaBZ7s3EM?=
 =?us-ascii?Q?e1ZD9Yjk1AV1SUqFpynsUp6aD0O19CGqCTdBc7l9wuVF+/jbuHOQH2Fjt9uh?=
 =?us-ascii?Q?puaBZ2bIyHb7oWulZ8ixTlENSzYAeUOnucMhNJlBMRQzJ4omMWvhISR2+fU0?=
 =?us-ascii?Q?v4BQxra1+tluKcDeVXEei26h8UY8GCpXPF9g1Mg2MijUc6kw66XlXeWZUKRp?=
 =?us-ascii?Q?aED6Prv1JNbRSzy/MKf/PnkFlkd0ywnDUcWqmm9diqQ41mQuR/wjp0RykJ9a?=
 =?us-ascii?Q?yq9+5fcSHuKcr0Qg5P2kIMRtiEOjuWpIS40jrtLhI780EhGIu1bxS/r0J+ev?=
 =?us-ascii?Q?hGukdzIxcNEPkD5IQ4dU5e/PPw9IiM8owNBOQgDpRdf0h235zXYj9kHh2y/q?=
 =?us-ascii?Q?YSt2PnUH0Tlr80e8btaayup+crKhDxCkuEUTSa80nnBGsVp4JQTApbjQqirj?=
 =?us-ascii?Q?yxiuFKoRnRxLsqOj8kjKxLnl9k85UgfR0RwI8jBHpy/+/Ie0lIusRcUfULWW?=
 =?us-ascii?Q?ZYglGxXYjvCIkGY2Dfq9PbbJrYi1QSU7g64LEhpt9QwxnhDasfnIVB6B5iPp?=
 =?us-ascii?Q?p4ssWCyXQIy//oyflRtEs9UwdP3f23bDneWjJ1elCspJgluSh9x5XGSGvF7g?=
 =?us-ascii?Q?4c3oVLwZG83gSX0K/rRcOBkDarb/4Lva56yljBIGx16zPpdBQk7a3is5QL0i?=
 =?us-ascii?Q?BJXPxllk7Ngmm7QA6snQV0/s9fCI7ACGru1uwv0wDygNd8GhAdlrbqunF+Oy?=
 =?us-ascii?Q?klMKYWdkqaVirxehZgGu4hFxK6ldhn0hgjpmmjKS0tifLmfts5jPPa/3SPI9?=
 =?us-ascii?Q?uAM0vKMWT4kQwd5wR4NfK0EAihRTkv9xF+/lRWU5+ya4O4kYzUIS9GbEqBxN?=
 =?us-ascii?Q?h5iSgcZwa42F/Dh3zWY28fW33VrmpqAr1Z2DGgw3zMEgRtZCkKz8SeHaAOCz?=
 =?us-ascii?Q?rYFfImLzSLJfMXHby8s/+c4GzHKiSqWtkIpoTmS5XefJpK44a8PP6Gv4PZLq?=
 =?us-ascii?Q?Du6O17fCBmXVZ4J3+ic54CY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cfe6b52a-0e2d-489d-582e-08d9eb14039d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 15:02:24.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y4BNTmUcNSpezg8snZmxGUByluFFfKK2jUgZG7SgyrSPZr7W0NtaGS8ia/1S92u/H9B6UEGNvY1Tk2xwbS2VUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3578
X-Proofpoint-ORIG-GUID: OJyd5rxp6VKb-_pyEgTC7_QxWJZRc1tq
X-Proofpoint-GUID: OJyd5rxp6VKb-_pyEgTC7_QxWJZRc1tq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=700 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:02:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161513

This patch will read the begining of source files and try to find
the SPDX-License-Identifier to populate the licenseInfoInFiles
field for each source file. This does not populate licenseConcluded
at this time, nor rolls it up to package level.

We read as binary file since some source code seem to have some
binary characters, the license is then converted to ascii strings.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
v2: Clean up commit message
v3: Really fix up regex based on Peter's feedback!

 meta/classes/create-spdx.bbclass | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 8b4203fdb5..64aada8593 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -37,6 +37,23 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created f
 
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
+def extract_licenses(filename):
+    import re
+
+    lic_regex = re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+
+    try:
+        with open(filename, 'rb') as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses = [lic.decode('ascii') for lic in licenses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return None
+
 def get_doc_namespace(d, doc):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
@@ -232,6 +249,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                         checksumValue=bb.utils.sha256_file(filepath),
                     ))
 
+                if "SOURCE" in spdx_file.fileTypes:
+                    extracted_lics = extract_licenses(filepath)
+                    if extracted_lics:
+                        spdx_file.licenseInfoInFiles = extracted_lics
+
                 doc.files.append(spdx_file)
                 doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
                 spdx_pkg.hasFiles.append(spdx_file.SPDXID)
-- 
2.31.1


