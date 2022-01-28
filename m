Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8B7C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 22:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.209.1643407402303499702
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oYrYNVau;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90274903c9=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20SLvHLd000612
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:03:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=QY1FmFcIxXikBUm+EUQT8jJxzjyyEWxZXF8EqkpBy44=;
 b=oYrYNVauywZaFXUGoK9fpvgvtfN0Q3HFBimAuNQJNNbz05xv2UVI8LU1w1AWvDrcHxNy
 QfUN10my8WeE/Se4WfsgI/AiYC8Q5QUqUSyAEyLCF4hHE7lxMMk83IjdoVqBfJ0P5Xuq
 RyHKjpLJVZNmaoo2ECEsxdB28JjU24ahcFyz27a4XkqXoIqbdnWryxlkNeYvaitUWLVL
 EzrwIVWy3EXsJIKMbd8J5UzBcWv4zYCN9ogypVZ03r/e7F+0KxTRoEb8AOoFhXRAfbnH
 F4xbYDrWgKTrrZFsBM0jOmdbhZaC7RzRq/CcaNkPabBG5iWylC9lael7MlTFHToX2+zj NA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dugc9hku0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:03:20 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20SM3KTO015110
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 14:03:20 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dugc9hktx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 14:03:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRxherGdYiHIIqF5C5AKHCiIQlBUL66GfXBZZA8k5L6TP0xGjMIpVZq+glOC3dd0cvYOG/wkdEie/DR49/qLWd/otnXQFxFBs5kHiRV2OmCdve6f3jvDdM37kGp41jmrrPMna396Ro8sc4C/Fa1sSRzhAOLUnHM9yz8A1qsLXv+38lCQKQg3qP+7JsiEMtvU8qw0uMw/aiwXtk/xegIDYg/AuaApOgi9dkyErrpIa4YJAIDWoq/QXTqGTlhi7YshYtQ8MyH+q+126GtZPdj9FWzwgZguOMi+Iq8OTNo0U7rYlWHIjM4Ozcpor3Vfi98s0VVyHMl6yQ40ZKLG6Nkbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY1FmFcIxXikBUm+EUQT8jJxzjyyEWxZXF8EqkpBy44=;
 b=hRTysURpORHh5l57kUbWpr9g1tPYByyLABQJg7Hu/Y8J4+xUfYfmt05MJ9FbzJBk4rz7b2SoFVU/MmnHNnPE3gSGZiiZLRYsjDVzNnDv1gs1UCAGiROJy7Uza0PqYedmwK17ijGGkTT3xXK32Iegqrc914WPtha34G2Ka8PJ8uYWmiQxqy6K+Uh6RwJJNzbTPuRzvez/MPxGFq6PRAIdjhiOgdf/gb1wjoS1PG1meyWjteyIfsCaqA84YiwQYcJ0ctn7modrRefX+oJaknC73Ny5azbsmrvtx+w3hgyrssQavJ4h4kykhwHudmS1YjnFvb/a9zykg5nB04LePo9R7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 22:03:18 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 22:03:18 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [WIP/RFC] create-spdx: Get SPDX-License-Identifier from source
Date: Fri, 28 Jan 2022 14:03:05 -0800
Message-Id: <20220128220305.29675-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4562335f-7b74-4df4-55ff-08d9e2a9fdaf
X-MS-TrafficTypeDiagnostic: MW5PR11MB5811:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5811571D41119A73B4AF94BEEE229@MW5PR11MB5811.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uYb+rFl0g4cXsC+VepgoHGQvyqT9Ba7Zzpsk0RaLUhsTCfu9RpzgffDHERbGpVBh4Eq/yF4R8ThdjpOvZpHTtTi1SKv/3MQ8baLuz3jOzCyXdAtFUoWFC4C9l5g7GRN7sFYjVu2TYHZi3J6UgryrgsfD1S0lSlpTHJEDrL+OAS+27xD+QyhkJtqVAA3xk8+WH6hSowrmad4Emzi8WkCZRJ3Dg366Z/IpbqJXV5IOJ/g6oaBFsXN28YMmePJDJCBRvp6nDVbBa69kce7ftOyKC35IMzqTMr0Ua/sXiTapxIGoyMkrhc10c6hNO8isM5uCKGb3o6lamzBqPFCYdPJPHQE9wqa9GXZoqRimSPduuxJtgiB/ItGlCvEj7c9e+fL/WJsFOZPbqUv/r490PTMsxtvFWpEb/1NF8jF0x/1Ozy8yvRWPzMs81qbF9pA1yuLCAN6qdPr9BWWn0Sg4lT21/zruRswfrJrc9Ac2RZ8tfmtolRA+JTiLrfOB2cRWyJZ/euI6QJImDTsHdsr4O2APY0ErMZc2FuiBQkWtBvicI/3j1ahFar75YTjJTti9D3B9LJyH++1YT+AiUcsUkfDEtMu8xETKMu7+B251Ua9Hot4eNTYHvmg0DgEGOSEbbqQqVFRA5DqD1j4PZXaqFufhKZXokEaTNkteg7lUnpJSexEbh+zmfZnuySyAIrycqRCkIBtkpkkxXh5kqcCv27C3bA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38100700002)(38350700002)(66476007)(66556008)(44832011)(2906002)(66946007)(4326008)(8936002)(8676002)(316002)(1076003)(5660300002)(83380400001)(186003)(6486002)(6666004)(107886003)(26005)(2616005)(508600001)(52116002)(6512007)(6506007)(36756003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VemJHSM5xA1+VFhYWu/W96pISjEvjFy7aYJIrJK540WMOOybM5vghWdjTB8i?=
 =?us-ascii?Q?6l5Fb1vQhRgMUqdMsP08HvP5MEN7KZvsIGghI7gncDCmudQZwiYbzln4AlzM?=
 =?us-ascii?Q?1YpH2pwIi4WWU/n3SMq0Mq+7SIS3KnKRPqgC3igagEUWLWL7qqN4GZXoqFDK?=
 =?us-ascii?Q?vguah0rCNDbYWsosa7Akj6VhUQiU7mHTJASFAjehc7z5XxOFbqStEDBdIK2F?=
 =?us-ascii?Q?CCr83F+3jxCTdzIX1zwbdCVyw3vvY+hfaTUcjvWpsb0AS8WhlXYw4mKXetW8?=
 =?us-ascii?Q?mMr2AsPz8nt86vJ4+i6jLN03rCH/M95auQA9Q2DkNrnDhhqy6uUD9X71JLKt?=
 =?us-ascii?Q?LDZPiJlSMa479pVb0rK2f1L5+Z9JI7EPgj4QE5OT8oGBL3U8dsXgGya1NJfq?=
 =?us-ascii?Q?fkzQrlvtoq1tSB2fDmtDDpSOYJumbt8KaO1YJ85XKu+6oCmfNH89A8EI2JDG?=
 =?us-ascii?Q?jv1AXYIfPhAAYYe3SmEIakTBOLhi37NTtFx6Xq8juu//ARFNDUYqaCcXZEov?=
 =?us-ascii?Q?WA1pOshXPv5jrDR8EvI8YUA/NjE7b3dij2bMrG8EjW1ibNs7EpiQkXh/wqEy?=
 =?us-ascii?Q?5RiaApTRt3pNYVtinOoFp5X57I+Ud7q1SHxVB2oG3ylZwUnP/bK2AEKGkQFl?=
 =?us-ascii?Q?K8hkVO5baobLdU1+KNhmvK4M3QdndEd+3REHmd39e4G2FlWAUHhzjilOY8sJ?=
 =?us-ascii?Q?T9IMpRNK4RyR85P+KXREIRjTtg32/GW0gYPtC0S3nhCucXRAArW/NCFbQQDh?=
 =?us-ascii?Q?mGGk4Ep/uFNwnjyYwguhP5dWdsni0NPu4+oc3DLWbFvFHxtxvOVGSXRHmok+?=
 =?us-ascii?Q?QEf/G/YTZmGjcBGwb9BhHInbzYvz/oRdB+ju2MtK6FX9WJHnPj6Mra1qf/Cc?=
 =?us-ascii?Q?ofNSmtIDN82V0QIhRrY9AiXl2veWCpNnAJQyTyGTg9VdJAQOjPbzqGX0ijTE?=
 =?us-ascii?Q?O3f8TqrWYkIfgVkO2CM69YmNFGgd/05BAcOs9ESV3GuPR8UC1pXDbcoUe07o?=
 =?us-ascii?Q?rgWjzoT1L+OC1UfM3UE+5e1dW+/0SD5Yd76MgyuNEvqY/9rwckF8C2uPElQ8?=
 =?us-ascii?Q?XsqOSggrj4rs7uElVoZLxW8VTjVGedO0pjc8WA6ZXnw7r4+5IoU3Rd3s79sO?=
 =?us-ascii?Q?t82w0OAPvAQFT/r+ZKz3gnE+Ca4mEwviJO1oFY8AiErsDF2VU30adfc9qDuj?=
 =?us-ascii?Q?RVAdv1RhI7MGRDdcn24qdfLk0s8bCL7qn+2E6kQHzOvpf5cNIgBGbSNn5teI?=
 =?us-ascii?Q?iY7Hg2auD2DRG6B/ldOf4LV2PznajfvZ2yY8274Iq2V82DQtRepAkK6QsuUe?=
 =?us-ascii?Q?zyr5+4DkQtI2qW1jR9mXwetDB8+dF7j822dSsbc1tLrUN+8g26GTqztTk9rh?=
 =?us-ascii?Q?0Yl9zEXLqgDUVAiph5cvTBWIk6nnsCLAPii99oIO+0XPWRZ+nwi7WEHaV3cH?=
 =?us-ascii?Q?1SyY8ZurVnwVmDyIJBVHe9ikgXa/k/ID2xZC6xOTTqnzE2GohTOSftOVAEG7?=
 =?us-ascii?Q?i7LFlhnLvjVHtyaTssExMvqkAoctzoS9S18XhmOuWt7rK0MUOQKJoO4Md21H?=
 =?us-ascii?Q?2+FFKU74/XlC4FONOSCaT0SUr4vNtMYcyouipv3WStYbJljSaJBKHkz6MNKG?=
 =?us-ascii?Q?8FMP+YqS+S//D3fxvljvsgo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4562335f-7b74-4df4-55ff-08d9e2a9fdaf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 22:03:18.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 X/q3LAf+aQmxhXEtx4/GV3IXbzZKqGn4BiWNI/hSE97QcCIUeLwTcu+K4dHGux4TD6FrpyEVdtjhyrBqScbLEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5811
X-Proofpoint-GUID: 0nWf2vKXuy8n6viEWMY-bXlZUztslU5r
X-Proofpoint-ORIG-GUID: eH4L0O-yjnbPGlYgmT9rGRPr-qB3D9NV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxlogscore=909
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 22:03:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161084

This patch will read the begining of source files and try to find
the SPDX-License-Identifier to populate the licenseInfoInFiles
field for each source file. This does not populate licenseConculed
at this time, nor rolls it up to package level.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 classes/create-spdx.bbclass | 25 +++++++++++++++++++++++++
 lib/oe/spdx.py              |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/classes/create-spdx.bbclass b/classes/create-spdx.bbclass
index 180d667..9c11945 100644
--- a/classes/create-spdx.bbclass
+++ b/classes/create-spdx.bbclass
@@ -30,6 +30,21 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 do_image_complete[depends] = "virtual/kernel:do_create_spdx"
 
+def extract_licenses(filename):
+    import re
+    lic_regex = re.compile('SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[ |\n|\r\n]*?')
+
+    try:
+        with open(filename, 'r') as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(lic_regex, txt)
+            if licenses:
+                return licenses
+    except Exception as e:
+        bb.warn(f"Exception on {filename}: {e}")
+        return None
+
 def get_doc_namespace(d, doc):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
@@ -232,6 +247,16 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                         checksumValue=bb.utils.sha256_file(filepath),
                     ))
 
+                if "SOURCES" in spdx_file.fileTypes:
+                    licenses = extract_licenses(filepath)
+                    if licenses is not None:
+                        for lic in licenses:
+                            spdx_file.licenseInfoInFiles.append(lic.strip())
+                    else:
+                        spdx_file.licenseInfoInFiles.append("NOASSERTATION")
+                else:
+                    spdx_file.licenseInfoInFiles.append("NOASSERTATION")
+
                 doc.files.append(spdx_file)
                 doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
                 spdx_pkg.hasFiles.append(spdx_file.SPDXID)
diff --git a/lib/oe/spdx.py b/lib/oe/spdx.py
index 9e7ced5..71e7c1c 100644
--- a/lib/oe/spdx.py
+++ b/lib/oe/spdx.py
@@ -236,7 +236,7 @@ class SPDXFile(SPDXObject):
     fileName = _String()
     licenseConcluded = _String(default="NOASSERTION")
     copyrightText = _String(default="NOASSERTION")
-    licenseInfoInFiles = _StringList(default=["NOASSERTION"])
+    licenseInfoInFiles = _StringList()
     checksums = _ObjectList(SPDXChecksum)
     fileTypes = _StringList()
 
-- 
2.31.1


