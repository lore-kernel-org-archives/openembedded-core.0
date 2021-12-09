Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE13C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 03:02:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6550.1639018948505936443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 19:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JCL4QBuJ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79771d5a59=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B92p6AR008293
	for <openembedded-core@lists.openembedded.org>;
 Wed, 8 Dec 2021 19:02:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=EUsnHtNjWH9AdZjsW3BcXm/a0gCP87tKa0ybXPAeIxY=;
 b=JCL4QBuJvNccQvFg4gRGofJ8YOBTdFl7xNI+x1ktPaTt1DdFJWTDecOjGSo+/ELlM4Dy
 Ff2vaZ6KXkinqZgiuUdIeADdh2/RQ6pJLznoS8nFb8hR4kXDLH2I7dRF4+oDL6+TdguN
 v9S5GBlOxps8kuDxdYoMYLCFYXLSmaQ1AVdP8I71IS6QkoM8bIxR6Hu12Qd5a2NosNij
 rU3hSxp9+POPyfD3HDpN0eF3FaGY/WOCOb40yvBy44QKxANmVCBu4SkhDs32irarzUr3
 GplLl3tU02vPdRrMlILUKpmzgsMLT5t8z1mGogAQHqP0W/+MFpsBlfLasXMGwlagzr0w mA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cthkcs1m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 19:02:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNrzv+czzTpQqtm0SxvNL5ozHWY9YKL6rgGstakMHQTCaM8ODZZrg6YTUPjgQumpR8sz5jnFBVTfI+N5Z9a+x2TxXclZ+H9eig+PEf/N4nCbuexqHLXJZdeSVU78QlZOzcDjsNwkYgF8u8O936hxwQq3QEDM9o+FxGnW74t6iF2sjAlc4d+C6TKO1Z+rT7kL26yz9exYKgq9GmzgYXwmMXQpkMlgrpnVXJ5/ZY331FUL9iYB3srSHLJCekAyDpZbFHg8XynAWxAkA5xyfiGqIeFVIoIRcZiX0HVvBHgJSXBgYxFBvmadA4ozzB7ul4M4P+DOKJRcz6xmDIAsJDdtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUsnHtNjWH9AdZjsW3BcXm/a0gCP87tKa0ybXPAeIxY=;
 b=JViqYulPJRDCJN3wlvc1cZ/OSiHpaVZErqfMWdbrcXbSbG5lRb6I0TC1iVSgID28GkWRU6Uma1K9bOo08MWNPaOAiVhktX2PfoKVHIez1lKAasdSFCDxlPLOmHDJntQaGePAIWE/5Bn9f7Y6HjX7hNossBFR8YlfzWSh8ErMCBoGCXwWq/ExdXvo9vnTENf+Hsm/+89xMj3uRVJ607J/ktb08vKkIMe5RHvUDbw+Gzac1mBLRcuIZR9XpnoUD6CDUUmZoGAFekP9AxQa3D9KRz+audTJ+UOkS1zBBJA4vR/LmgF7jexRDJ+TC6J2IUnsSHCXaCT9u/A21RKsa7CTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Thu, 9 Dec
 2021 03:02:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4778.013; Thu, 9 Dec 2021
 03:02:23 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] patchelf: fix PT_PHDR program header
 corruption
Date: Wed,  8 Dec 2021 19:02:04 -0800
Message-Id: <20211209030204.94008-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f1537b2-9b58-4b1b-51b1-08d9bac052e8
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5588224D1693BE1BE61DBF4DED709@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	36oOXxADm9UInQ0/j0S7U/qepN9N/lz0bJXtRxBrZQGwp2xisAbnQQdt1wiG5rOvLZariYVeSAj3GyiOWxuw1sb/jcWg2KpETq+cQC8OUrols19XJN8vy6V0SjfWaKPO4N+gP52zyZzyYM2xSO97ph2elFbSdSbWokO3OGouENaeCdRB7mpveO/zhgpyeRnWKuKkZ/YDSS6g/5nEHj+7LP4urhyZ4bfvf9bqJ+SrhN1m0RDjlaG/t/bj5CiuoMIX1Rj5K7dCKKFQ4F4Jz+8GEGGjf3FhCK+tM03ugL3RLEzkdbAoo3q4hj6CV6NxXKr0kNt7P8rgUkhNP5IRAtdvK46ZEBVlIIf/Z6+aI3a7H8xBXKhshsQuSVHEyUGgaz95L+hjmNT729LEs+xkuheI+uXlWxVMmJND3Ybpcga5LW0120NA0jDRXIFJADAL7pfAFG77pWQalxwb+I83CNo+Xl1QeKGYAN6d8nnWxOoPpfYBxUSVEu/3+YrsFRXGueld5jd0zxVuzhax8ukZ6E/DlLPg02d296AE/ZHbai6VsQgfYzhF7jDyos7J50ybI2kQhvpfzdL/jNAvQArDwNn9LyhgLj6bwPbamrUE1zm3kPa+vNHgid4DFCLAGKEjLxdaiGVHbEjDVhxr3BE8BCGTZLgifYGqSmLMFROlhUMZ4tss8qGt5bTfKyiRavkQWzp/YcGzWpeHYJ/LC9d37L97B14LyGuGd00AiQW5Uu4430Dl1PcWyGDg/bhK18gzd1jI9rNOu1Nvp9YMFVYEYAkN3BSooIvZSyYIlAVQiUVObOU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(26005)(6666004)(8936002)(66556008)(2906002)(6512007)(1076003)(38100700002)(2616005)(38350700002)(66946007)(6916009)(186003)(83380400001)(86362001)(8676002)(36756003)(52116002)(316002)(5660300002)(508600001)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wTdkL8w5i5+JNPYFTwXm38YxPWV1AaF/pFXxeSAmk0bP1xOFJOuTSQoOya5R?=
 =?us-ascii?Q?geaVpVCcJoT0Q/eVUPQqK6wJRv+5RYwX7RM96B/GDJVS8/1kyzQgFClUCNDO?=
 =?us-ascii?Q?zUX+9Ys3UnQ6x7jIkRVBPupYS4t0/X+r/rWXPFqQM2OOX3GrAPjEw/jXTkPq?=
 =?us-ascii?Q?dt9vi+2+7qWFc8hTqU9QlLAwsRQ+mvib49S/Qy6X+Q9iQ8TGUZwYGgp3Hh4Y?=
 =?us-ascii?Q?BCScp5M600oqF4jkIBlNVaODj7z0QYYJUO+eJ1RyEkSCzo7HirvypCK0KdeG?=
 =?us-ascii?Q?82z4KmWdGNt49yZgVIJqty9/w7gNWQqdTOVhsubdpNuxsap1npk5ovb/m1QY?=
 =?us-ascii?Q?7g+y6hGjoJAX6jB4gaDkByS9lfS8LCOFi9Ou6dnV8XGx/NHXmLtbk6+yPqBR?=
 =?us-ascii?Q?KbTHfGk9HiL7as3n7M8MFnPseasBmlMzFJcAPlsdA6ejUPgGJ2po2juDVohY?=
 =?us-ascii?Q?VRCLBd71p1P9rPOXSQPP9h318rEgRxV97M0l77ItBk1Xx/MPqAes0y5CJY4E?=
 =?us-ascii?Q?O1aDa3J9RaN0QTTwx6aMstFYM1yZW9kVr3BE9vPX89KANB8/WZwoUv9NVkRV?=
 =?us-ascii?Q?6qnSPbvTxbP9KY6YXoUd511ealuCGFD6zP8olpgzpFaasHZd4CIMIYzrodaG?=
 =?us-ascii?Q?juC2nFEddHyGoXV8tNWTFKMbCbc7I+Y2HiglxRbROBaOcBIYwWNa0sBEvyvD?=
 =?us-ascii?Q?LJ16ZFK1EKW97yrGCXZpCF3TnqUf/I+7k47IAEL60TPS3Qdc8HDr+Qa/FmPm?=
 =?us-ascii?Q?9lUO29o0DbNfN/rpcbxMQpfAhgYL5PbmRfXdQWb2gIN9uNyFtzBN5noVRya6?=
 =?us-ascii?Q?TeYyFCv+ERWTe1bOq0AqXm17QEiS0OEs+FXoV9Hiqn6bhiBq6rjm1LaFXiHi?=
 =?us-ascii?Q?D3/uKtUleO4lDYOW4qGro4dupMI7XVBAOmRg4BrpZuQS6M3cU30eF87829xP?=
 =?us-ascii?Q?M9ImUBPqPLyxGx5zuSTUwnsPw6J+RHsY9027u8I0GIMJhVT76AeDqcPM0C69?=
 =?us-ascii?Q?kGKkIexaJiOzwHybHqFoMXR4V9kBhRxrpS+isOpu7R6YgD+JZnkNIXImSyJd?=
 =?us-ascii?Q?/FvCCBMUckrJf74tnJT3thyTNmGMaAEvH835QzhE/zilbkld4FYybNptGAR7?=
 =?us-ascii?Q?mhEXX9J43cUVvleIW2UmRIVuyC/b6suCzNeDyO5seF/jMjWyNu+PGOjcOSWI?=
 =?us-ascii?Q?bL/9sf3W1njlJVjCJhho34jMMU25bhjMHwCRzKrXpA7SQ6aWrcZDjHOKOGIH?=
 =?us-ascii?Q?BBsKa+EE/Q0TFv03nnSBgIY5RIZtaWEgmkmwnbmROnFwShrz0LrBiiX+w5x7?=
 =?us-ascii?Q?n+HX0hGbe6Gt+9kLnjSA0C6FLAsG00rYUb36jkNEfLSizxhf3576pr/mjqpx?=
 =?us-ascii?Q?xpVi8cbx3uOrUbUSgrOV5UTRYnXgI2L4+YPG/WkKMoxfMRyu6lg5jfSw+hAP?=
 =?us-ascii?Q?VjtC1ZQTE21Knfz9IEpwssrDiO8N709zezZg44ujLndaNbA1xR+Re4BHiGf2?=
 =?us-ascii?Q?r9/rj+QOZXuI0ZBLhPdTqaPWZ1RYSQr2kBbuw+APmpAIlZN63ZIKxvQmaq/D?=
 =?us-ascii?Q?Yd5V/CiMbOoN730Kpry44E4byXnkMGTN5gPmBhZ4CGKymR5+FpEmEmspah9v?=
 =?us-ascii?Q?hV5xO6vAxnXJluUAsGxOrk8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f1537b2-9b58-4b1b-51b1-08d9bac052e8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 03:02:23.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6BvmAN25S+oTKpJnRmczoJhqUKi1C6hzHwXWWQGvmAtIsHvQgpov1RtBkP3gGUNyTCrh3MKT22JJkXwDXk+Ckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
X-Proofpoint-GUID: wGlMbjK_hb8m_Ykd2lg2q5TIdUZEts_C
X-Proofpoint-ORIG-GUID: wGlMbjK_hb8m_Ykd2lg2q5TIdUZEts_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_01,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=983 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 03:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159438

Backport patch and tweak it to fix PT_PHDR program header corruption.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../patchelf/0001-merge-from-PR243.patch      | 47 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch b/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch
new file mode 100644
index 0000000000..a5322f0375
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch
@@ -0,0 +1,47 @@
+From 6ac5c1350834b9da81ab90ab5ba4e5bf507c6c0d Mon Sep 17 00:00:00 2001
+From: Satadru Pramanik <satadru@gmail.com>
+Date: Thu, 20 May 2021 16:52:21 -0400
+Subject: [PATCH] merge from PR243
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://github.com/NixOS/patchelf/commit/4efbce410d00c8cb43f134181d07b364bcf78022
+
+[OP: tweak patch to apply to patchelf v0.10]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+[OP: tweak patch to apply to patchelf v0.12]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/patchelf.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 1854cfa..73a3a86 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -774,12 +774,15 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+        PT_LOAD segment located directly after the last virtual address
+        page of other segments. */
+     Elf_Addr startPage = 0;
++    Elf_Addr firstPage = 0;
+     for (unsigned int i = 0; i < phdrs.size(); ++i) {
+         Elf_Addr thisPage = roundUp(rdi(phdrs[i].p_vaddr) + rdi(phdrs[i].p_memsz), getPageSize());
+         if (thisPage > startPage) startPage = thisPage;
++        if (rdi(phdrs[i].p_type) == PT_PHDR) firstPage = rdi(phdrs[i].p_vaddr) - rdi(phdrs[i].p_offset);
+     }
+ 
+     debug("last page is 0x%llx\n", (unsigned long long) startPage);
++    debug("first page is 0x%llx\n", (unsigned long long) firstPage);
+ 
+     /* When normalizing note segments we will in the worst case be adding
+        1 program header for each SHT_NOTE section. */
+@@ -852,7 +855,7 @@ void ElfFile<ElfFileParamNames>::rewriteSectionsLibrary()
+     assert(curOff == startOffset + neededSpace);
+ 
+     /* Write out the updated program and section headers */
+-    rewriteHeaders(hdr->e_phoff);
++    rewriteHeaders(firstPage + hdr->e_phoff);
+ }
+ 
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 390a8110da..007435a719 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/NixOS/patchelf;protocol=https;branch=master \
            file://handle-read-only-files.patch \
            file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
            file://alignmentfix.patch \
+           file://0001-merge-from-PR243.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.33.0


