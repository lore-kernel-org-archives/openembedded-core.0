Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54390C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:40:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37862.1700566839783620549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JV47hCcm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9689cbffc5=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ALAo2W2015137
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sCsCl2uwMW7OQyAmGP
	3SPaqyZc11QJt0d7K8mNJND2w=; b=JV47hCcmEhHg2b1vST9ZnQSQO1/LFFilGP
	CZEsxqYtTxdLPFRyGww0vfpsoXxltGa4qyrT+qh/fmr5mS9cQ10wJkXppp3WGCZY
	OyS2kpI4umpgdVEudR2r/0NOQJqRDA+uQi0YThuHccLAjZdy2i3SrVLfKenH2/Kz
	8hXV+q6+yjRh87ZofawhFQ5k8lh1lHs7cur8aIOcXgwc1qCAhg5joLjSWwaHw5en
	gCZ+Z9P1gK2UjLc7BockW5+Gw+IC/V0XrKOE2cdbfp03tQAMvNL2nCUUAepJFVmK
	bRhtl7uvELfDm+oBAZEt47HiisOnesiDvKrVA7TJP3jl0606YcQQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uejfwterg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:40:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DldgRSPCEt0oAt2umDAEXrlMA9b6zNTj+BO5DhJHgVBURYNnfb7OQdHA+gxUAYFJ79YZ2MDJJA37vuNiujHMXgUL6C6QTYuqZsqbP3urMT0bgPgXOnYOQpda0dwnoYH6ZiNhoAFIKqMp55Ix1u0NcI7uGEnZxKlKeu95mGr0Vw9ZcgP+8XZzZxCaGlDWRfXIV/6Pnv/kyHw4S6GxLMwSdpOuL3HIetG8n/ZMFmnFg/rjhgr9vo5FJ0YdpQyVQaBG1c1IMU/OTp7TA6gVmgdfJSoqGzdXhfbVz7xQ83DIVuFQA+6OWpoqGHKIqawUuBXAxU++WVZOB/RYpzHAPG9XLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCsCl2uwMW7OQyAmGP3SPaqyZc11QJt0d7K8mNJND2w=;
 b=oXlLwTFuYXWHDa4TdKw8GQhvLveNLBBTjXnka4e59MVFg9bnoSlNqk8b7uYIznqxG0Qr0BlkJYFlv7Eqypyt5Tii6c0IoUfPW6kIIWvutqRImbp/Uqfh/TVxqIjuzB2BNiuUSKMFOnzMoKpp+c4hvLI6UjxZEdV2k07NqQaV36/6eB1NBJpgyhOMiAFWIXSEoKa36HkJpDVHA3epB+AVme/x/1SqyvPy8DxBpGWPwblM6cgE8Oi9y8CyIfUMR30xigpOkgj7QGFhalyAfQWOynFsRraTJwuFsW2SmMveoGuQ/BPg3iFvVIjSMkjlc1eVc3br8atViNVXKGvCac8J7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DM4PR11MB6429.namprd11.prod.outlook.com (2603:10b6:8:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 11:40:34 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 11:40:33 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2022-48064
Date: Tue, 21 Nov 2023 03:40:12 -0800
Message-ID: <20231121114012.27280-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DM4PR11MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a5360c-ea83-4473-d62d-08dbea86abaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RFOl2CJwz+Qlzy5EYuWQ6Ztu1Cv8zymBv+M/MxyVXSxEgN5YQv2pz9NobUHUhd6FOGq231Eye1bvynSAuMDCfOB+geSVeEt569NaqMlCvQMrj1X6FDCwEwYerDzGO/Dt5/xlnyg5KtO88YWXXXnOzF4ywQlUNBmujXtn1rwSd770Tv9E9t5WRzWORJnKNLEOYx0ksXzhvJqMlsw0ytbIVk7bRp4Gh3Z6KNQdvxIzGYlbxxyiNQd84dS3K3+mMLGcyUnNOvmSpvpyp15sjMnRjf0TzUi8QGTIvZMaNqyg0qleByV9Y6ZRbMmCNG9Hqdw9Ri+uhbqLMsbot1NGyqEF2k/IVCBzEo9GngUpj2TMgu1tEvJ6O9ThkQ+wh7h+/xokfOoEvxuNGyQEiPfp/GhQoRHNQ5DUYIpVwrelPtKSqjisVcUUzCSC+Z4fjqyiA+9hI7ifLHmM5ZJRAS4FCwJg3znvJVoejBZbWm8RLTQRPm0o2evJcxml2yjhmRcRNtlJtOveFXr3Hk08CbKCwPEuXg5bVqLTxZFQvoidJ22oXf2w9xjQmbYOLmIPIseZL2hxGVclUPr8cn3pKBbiC4QlACBq4m0JpbwFjS0AbNq/7Ew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(376002)(39850400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(966005)(5660300002)(4326008)(8676002)(41300700001)(8936002)(2906002)(316002)(6916009)(66946007)(66556008)(66476007)(86362001)(26005)(107886003)(478600001)(6486002)(1076003)(6512007)(9686003)(36756003)(6666004)(52116002)(2616005)(6506007)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xTJzTqalvlFAOVnLhKSVbx9fFAjUgz39WZtVzaI2/ypBXyFMyax268ZhomMi?=
 =?us-ascii?Q?hfsk5A46wcFHTJ91JP7jqIbX6EOekDZDHkleQd4luu1g0YvmjaCQT272VNoJ?=
 =?us-ascii?Q?wtSz9S9F1pjktF0P+V44yhSb2xeRVFhAmz0lB1t2wlOGJ/PQNBEuh4zHe3VO?=
 =?us-ascii?Q?YqU08a1bmdtVUfWQ2CWq40nftobe38StrTE2uo9uHkDujpmAGHHRNA75VH0Y?=
 =?us-ascii?Q?ujHEhMfD0zeGY8Rw7BEANxNGAD7PEj8qIe29tFR3aJ0KsktnAh4ei0yu8kHx?=
 =?us-ascii?Q?E9ME5zhZKHt4USPPj+659UwY4l+l6Z7Zx2BXg1FU4K7pLbv4Eshd1nnULzGS?=
 =?us-ascii?Q?xFLqZm9rXdeHJ/OGbW0xfYtnORl3yqzU5sWkrAFggOfA/fGXkfjtjqU3v95+?=
 =?us-ascii?Q?EyjtYl+QXwm3s1jfUXlsIpKsrB+eUOpTDWfKsdrmv20slka7LX4SMfnMWzUn?=
 =?us-ascii?Q?iLraiRr6DKXYf+wpd6v1U6P1TqyQ7/+1MOI0AIqtyPLhEOs82vfXdIefo0RD?=
 =?us-ascii?Q?nMYYxd3RlaecEr0Jyg66ss49d62n6hIYmEV2WoSLn0gHX1EmTTIyDZdgJrXx?=
 =?us-ascii?Q?rA0uUuK9UpOHBXDkRdJ/FTJIBwpp+ZnXJV8XA17/KU+LtWlbYOITN5oULjR6?=
 =?us-ascii?Q?j3hMbpkN77GrrK7mrzWD+Y3xFvgQ2CwGlo4gJJB0sjGIRPOMQrhMDWcxAvDo?=
 =?us-ascii?Q?7k/xoG77f2Lqjcy9irD6GjBzwkdzR3iTYqEfW4pEcmbYA69Nwqmmv04HzaPF?=
 =?us-ascii?Q?ghSWnfQLDpoGfOUcJnCced/frz6uQngoWUbZRxlXYZmrCPliFF5Tu4rFvPzn?=
 =?us-ascii?Q?odc4Q3nibjxKBvxjPgwzPPGbSA5ebmXuLLDQ10dmkVr8Vs81qt1G4rH6t8tA?=
 =?us-ascii?Q?7joj6o3ScvanaFNidyFJXuuaHGVs7CNht0dyynpRWDJ5OOGVTOOANUuxgh9Z?=
 =?us-ascii?Q?imuLoBSwQw/1f/afOc9VHb/XiAIwyTvlfjIkcbaxIrY99imFZlFzevxa+eBF?=
 =?us-ascii?Q?N0HzU5JK8ZNBcM7yEIfG02DLSEgdKEb5+4mgMBD7s+zUEpNhQRTGQNeBQIIN?=
 =?us-ascii?Q?ZjMVBzEo1SmWvQzQSjfdACX5CrvuC2/TxW0CPLjOY1g8jX3wpYgPopbbYWux?=
 =?us-ascii?Q?ek93Ayovoqcl3ry6+wT4QAmlyd1PYZCeqMCYOolVOoczIhN8BopCaE4cng8I?=
 =?us-ascii?Q?ILmLqFe5CSumx2rjf/0mJvYgGfDwsqyNPXJjLAau02GCMWSEtG1voE0qQWRB?=
 =?us-ascii?Q?t+ve8opx6/qG2X5Wh5Sw/OUCjoZfx0225PjdMo/APKVILPcCKOdf5sS2MTW8?=
 =?us-ascii?Q?/iTT8D5LRubx+8CJ7EQ9+vXSoeniyMJ1pW2xvDg6VFYv+e7+AmksaXxZKA5Z?=
 =?us-ascii?Q?UMEZ4LlO1VkjvS4Cg3JI3HL9kHiTIt3koalzJPRlJXROgaN1E9LcqqFVStsw?=
 =?us-ascii?Q?QekN3PRLPZtOUjFMm7B6ggClVZoKco7knLmdZ33FCLXoT3diP/zCyS5flSSR?=
 =?us-ascii?Q?xNtLX1pYULiUMTaI7dYFW+kIXVHqxKUEGr76HBDmI5yxxoIh4G0tUESq82c+?=
 =?us-ascii?Q?ehEtEvnrXyFq7tcaQG4AHKfsgkQBiRgELrYiN0x1LGSiDy4A08Qhkq5iUrGs?=
 =?us-ascii?Q?ow=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a5360c-ea83-4473-d62d-08dbea86abaa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 11:40:33.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEbVBOxDfC2CFMKoZPU9d8EAPvmX/1ckyuu2yGVbmItHszuI60zSD9vpkDWCC/nb0maJe9px+wcHZr0rTha435/Vw2/tNR7fy3TkvJ1IC1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
X-Proofpoint-GUID: BzKpxXIuafdWvncwKwqUaNorBZim4MT2
X-Proofpoint-ORIG-GUID: BzKpxXIuafdWvncwKwqUaNorBZim4MT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=757
 bulkscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311210090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190968

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0034-CVE-2022-48064.patch        | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index dc29141812..3787063cba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -68,5 +68,6 @@ SRC_URI = "\
      file://CVE-2022-48063.patch \
      file://0032-CVE-2022-47010.patch \
      file://0033-CVE-2022-47007.patch \
+     file://0034-CVE-2022-48064.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
new file mode 100644
index 0000000000..b0840366c7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
@@ -0,0 +1,57 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 20 Dec 2022 13:17:03 +0000 (+1030)
+Subject: PR29922, SHT_NOBITS section avoids section size sanity check
+X-Git-Tag: binutils-2_40~202
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931
+
+PR29922, SHT_NOBITS section avoids section size sanity check
+
+	PR 29922
+	* dwarf2.c (find_debug_info): Ignore sections without
+	SEC_HAS_CONTENTS.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=8f2c64de86bc3d7556121fe296dd679000283931]
+
+CVE: CVE-2022-48064
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 95f45708e9d..0cd8152ee6e 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4831,16 +4831,19 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+     {
+       look = debug_sections[debug_info].uncompressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      /* Testing SEC_HAS_CONTENTS is an anti-fuzzer measure.  Of
++	 course debug sections always have contents.  */
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+ 	return msec;
+ 
+       look = debug_sections[debug_info].compressed_name;
+       msec = bfd_get_section_by_name (abfd, look);
+-      if (msec != NULL)
++      if (msec != NULL && (msec->flags & SEC_HAS_CONTENTS) != 0)
+         return msec;
+ 
+       for (msec = abfd->sections; msec != NULL; msec = msec->next)
+-	if (startswith (msec->name, GNU_LINKONCE_INFO))
++	if ((msec->flags & SEC_HAS_CONTENTS) != 0
++	    && startswith (msec->name, GNU_LINKONCE_INFO))
+ 	  return msec;
+ 
+       return NULL;
+@@ -4848,6 +4851,9 @@ find_debug_info (bfd *abfd, const struct dwarf_debug_section *debug_sections,
+ 
+   for (msec = after_sec->next; msec != NULL; msec = msec->next)
+     {
++      if ((msec->flags & SEC_HAS_CONTENTS) == 0)
++	continue;
++
+       look = debug_sections[debug_info].uncompressed_name;
+       if (strcmp (msec->name, look) == 0)
+ 	return msec;
-- 
2.42.0


