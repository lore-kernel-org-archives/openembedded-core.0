Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEE3C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 13:45:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6127.1636811119832024534
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 05:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=o1kBTDqI;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69513d83c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1ADDjIsn007272
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 05:45:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=YKSTi0aron/W4BokutHtAUdTJ3qCuXnb/c2btX1aerw=;
 b=o1kBTDqIE1xraGWarampMfbQh/3FDkmDmsfk5YxhuG/fIk03BDPhUMhLgV49rDGkc5If
 mKAzrk+xpkfC13SVHOeicWtGYx8SOmG9RNDfOjU7g/ZWM5UzVPbqLCMYFYhBB6IuaPlo
 1nYmumh7WLPvbDsmdmOPK2KG0HZXkVcfeBlFmz4aaMFB+JeuCnRZV3NXp9JBomcQ0Z+d
 2O3cQcnlm0qD5yuw2l9buSUBhDOr6DXjofrfeK0M3KXEFdfPiQ6mwPGvZnBvqsvWv0tf
 ICIDlqg1YCz1v8FkK/fl11XtTCavOAOj2TNQ/052srj1sevD5xyn7i3aBN1bhg0sTcBW 8Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cadrrg0r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 05:45:18 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1ADDjIaQ007263
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 05:45:18 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cadrrg0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Nov 2021 05:45:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNqzHRdDYTOIRlHE14O9AftaM0ZSfpEN1trTxKEBYjeb78HiAWvZe/KMsgYXBd18vtJofIA5SWPSzIXtPTs0xaXTp+oyDGUQCyb4n4CfFbFIg8ZWhFEfxXnIA2wCo+H80TM96rH/3hhBhWNIrVn4lbqNeVtKLs1DV0BUrNGoGuB0be+6qopw99JcLOMAPZ1Fo0vNDCEvzDdki1dxpGsEbCsRJ/GgMQ/6bxtqXBBiuPBh9ubjVNLwsGKjKjV1KNxOXVSnlzhKdTQ3nchr27VKfEYe241zLJyIpG8rPaceHj2wlo6BHmQvzhLs4aAufd8DWS01bGBCtAuirZMbU5oisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKSTi0aron/W4BokutHtAUdTJ3qCuXnb/c2btX1aerw=;
 b=ODUNPfxXmbA6CElv9W+9nUAqgA2t8l8txjlvuxoe+iAV/p2OQDt4qMXo17ui4OvWwuvLBsdLLx513VtdR2+OBgwVvNfyQNkzoVOsf4JUK+W2Yv9ZQIwj74IXejkg/Ilr7ik+SVPpqAmAIFKG3E3yN5pV3h2PN2jUEHy32DTblymm3B3fbEDegIOCcS/4vKpqDIYNb5kbaUcaPv6TSFUgPWeKqjbLeZqIIaIXbX88kQhZfSCBacvGx77jUhHd6lg9yxMt0IXdFy2KCO4KVTt1jZormR+OrqmqMcSudLQepz3wiSCC2EdGknJnAdE8RJJFoR87KcxaxSseYE7tSm/D6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Sat, 13 Nov
 2021 13:45:16 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Sat, 13 Nov 2021
 13:45:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH] python-numpy: move recipe to python directory
Date: Sat, 13 Nov 2021 21:45:05 +0800
Message-Id: <20211113134505.353043-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:202:2e::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR06CA0005.apcprd06.prod.outlook.com (2603:1096:202:2e::17) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Sat, 13 Nov 2021 13:45:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbb2a87f-c65c-40fb-21a4-08d9a6abd32f
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2143:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2143016D4B98F29C11D784E6F9969@MWHPR1101MB2143.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V9i4JnROAQvLhiQb6zW2QLiFTowi6ldILAyZOmAXIswa0Kok49DT4z699rQZ/4CJI8ZN9V+WbFj2XwbdTbsbX3YR0izqmr4nJifetWQwlMT3vP3i6MHMtBQopeUlAhOKg30s5N7N/jkbZln+ntWdj+PJ2nUFHMLCw2GyGcQeMlPDoxGXPiBJ9fNG7d626LdRz1OtucRhVA/0Y4WhLsayF6or3ZWLdmGhKxF1dqShjutpel3YWTJYw7G5L3/Efg6s5v9OsPb68VGnejQL4YnkxrNupfAAO9hBQFShjXVwLYxLtKH8i7eBNv2sptWjwDQWsSLGPso0NLELriC+NjQEsETY5CzEiIrord4JWFFfsG3r0eOS1y6sREzYnGyJMi08x2OHQYsq7G8YVfMRe2veE8ecbTjFXJaMnO34lCtLcw5l8+6QjOcbYXEK55W/cV7YZItq/ipS9VDg5IaZKZz4ZCimddsnSDeYhafvlSF57PKV48nZPfppniF/Rt6zVHorCA/hw43MrNHp+PNLLqsa2Hzr2C0kjsaMv4sq3R0tMcrmKhoPj8OmX9uc2Q0RsHZPEpXES+sWgpsVCME7OyXAEv7G3SiaDipPopc02id+PuH/y8kGDq0qf+TLGR4JMJojVpJGEcSIr8H82264OmYlABXVo+oI4CDS97YQWN4OYpVIlOeD1LSCS/IcoZdS5NE21AgrBdPlXTHY8krVVHI8euTYaIo2vApTn++zPN08rrNyx+1s3jgT8PVd8jXMIuiEGa3ZJ+Hl0FQwvR1vB0MEi+/Dl2sQ7QT06K8Ie9n55YM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(36756003)(6666004)(508600001)(6486002)(52116002)(316002)(8936002)(83380400001)(1076003)(38100700002)(6506007)(26005)(8676002)(86362001)(38350700002)(5660300002)(4326008)(186003)(66476007)(2906002)(44832011)(956004)(66556008)(2616005)(966005)(6916009)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4YA+zmEsZEVIo3/HQyrf81NPqjF734X1cndJhsRC0oyR3+OFXfYfFQfTV33N?=
 =?us-ascii?Q?RhgsZ7CaxB0+TuS3oNOxwS+p/AOz6Sc/uyHwR0ZFauCcpKbZCZOkxNWkYIMX?=
 =?us-ascii?Q?QRTWpC0Ad+lOyPqfieRJonY4cUf6eEp4qArCyXW9EiezXGVwCpAqDdKSvZHM?=
 =?us-ascii?Q?L+tvUTRDuqHk7zqt7v5+/lsEZKhRLyJP2a3N8hFA6GE8K3Vc0jAf5UBgxm93?=
 =?us-ascii?Q?bsOn3DytM1lA7ZO7/srxWN+du+BnaDtZUZfak6YdN14Uzt7w/zqgNVixnyyq?=
 =?us-ascii?Q?97bRE/khNeMlB9qRT7a27yaGM3TYWbhOGEyhqFhmsSXl97nWAuxaYyqIL17G?=
 =?us-ascii?Q?oGDDG0s9+t8wepfZU1xUiThV+kLgMmc0NN3cS4xFAhSPKJnNd01/BWtq2jJ9?=
 =?us-ascii?Q?DjO88aojVxkQAS2b8tmKOYyxz0bOvKVFnvUClRepZCCpXpnLghqyKU37dSGk?=
 =?us-ascii?Q?KwbmBxuTyE0VXcmHOV1CP2qsMWWErRm+V83yqZtwGQ77s94m5ftWGtYvAnna?=
 =?us-ascii?Q?tshbc1M49Z8sC2BlaVN0H0scLd/llnm6wXs1BHzAMMu6ekC5+tvMXaNWVf2u?=
 =?us-ascii?Q?d24AzLd9kcR7/RyOzfjB5U/I6UbzxaHxQ7BFn1P9VWBAyvz+eK0ZvCF7LEEW?=
 =?us-ascii?Q?dGqHvwM+cX+hT84vozni1/v8wggHNXUrjxqs6t0nCPKoQWtvJnzA7kEnIeqP?=
 =?us-ascii?Q?MtGAeIskBCsPa1SU5n41vVbg9KpMCjJ5dydRvVusXEJ6deO0UgblOZOw7S0S?=
 =?us-ascii?Q?8GUMpcPSm6XH/kiEd1oqUYeiSSovsvRXmfz4dNcY6CafScBZnOjyihaAOUu/?=
 =?us-ascii?Q?/AAFeYikjndpCOjD9uDo7dnXTKjazTkpmWRUr36WU1ECojV8UtAesGYOulwW?=
 =?us-ascii?Q?eBz0+ApN8j0d8HwJ36UDNHIJ6FR9XZ/pqBeM7tuy4Ww6a9UDQHxmJjBz6PuJ?=
 =?us-ascii?Q?H4WAo1PdKGUP8rOAAzjDJgNEjeCHxhfzk+DsVE5S7UcoAYMF9kcTFqkwtWQ0?=
 =?us-ascii?Q?vDXGHH7sfgG22Qx5mNqj/rMwkEYLyFbOwTifOE8PFqvKrJG9aEiBCrYTgyUQ?=
 =?us-ascii?Q?sZPOsG4ppcHrXufLnGVXC5GjuNBVuO+9LNhUcP2noEeeTNYTN+vcKDLGSoUD?=
 =?us-ascii?Q?E85ZBx9kSznq7Iqw4hf2Nqw5VvIzUQoq5nf76Vrt3FK7L6b6UhNMOECWRkqV?=
 =?us-ascii?Q?Qp5xdAX2rhHimeVWWD2HIKNK/8y9DdoBfzTK6lMfOJGKwZ5NnHs186RUmlPv?=
 =?us-ascii?Q?BW9vZ5Hqb0HzW5EX8oa8Q8XgtKlplE1tTBmctHHWFA5F8UuPMeW+zdNk8C83?=
 =?us-ascii?Q?fImnIWyX1T4ox8rgWKP19BqfweG8bEdsepMUec1SI1tvO7u/7Ilub0yKD3Oa?=
 =?us-ascii?Q?jAsvVVlDxsxh9CiX6tWETjOAahCj9BSttWwvGO1U+KjVZALIxO6rUIdOxu1d?=
 =?us-ascii?Q?xnyMhfYRPXFScCTzSMKFI+N7J88RuYiFEA2KbzTIxe0AAdwVAfsl1n25tTvQ?=
 =?us-ascii?Q?//5tIiL8X5qXEucrGvNtya3XPCZGTRmoi/eBkk2spZamOUuONu9J4PlTOz5g?=
 =?us-ascii?Q?tp6lIe8/xFlsI6VHrdbaMhXoL4XHm85WDHlogJ2SJr9bpSA4EwnFrNfiPTWT?=
 =?us-ascii?Q?bgWC9zcY8O7KOsIJOURn3/Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbb2a87f-c65c-40fb-21a4-08d9a6abd32f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 13:45:16.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I4LlmTe5fIpLyPJ0LcgbM3UEqhZKELj0GZYIMem7d0NJ8mZ5l3/ncFTB/sEETG7UPOdwvqRIPFgO+oSDdoN0ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
X-Proofpoint-GUID: CDVb_7vGehWpFqkRP0EEYbt5-Bmk1yso
X-Proofpoint-ORIG-GUID: pKg_hWvQzIrlCe-3InWfUGD0-EAhN7Xx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-13_02,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111130078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 13:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158244

This recipe had been moved out from python directory since 2016[1] in
order to share patches between python2 and python3. But now there is no
reason to keep it in its own directory as we only keep python3-nump.
Move it back to python directory.

[1] https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
 .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0
 .../{python-numpy/files => python/python3-numpy}/run-ptest       | 0
 .../{python-numpy => python}/python3-numpy_1.21.4.bb             | 1 +
 4 files changed, 1 insertion(+)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
 rename meta/recipes-devtools/{python-numpy/files => python/python3-numpy}/run-ptest (100%)
 rename meta/recipes-devtools/{python-numpy => python}/python3-numpy_1.21.4.bb (98%)

diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
similarity index 100%
rename from meta/recipes-devtools/python-numpy/files/run-ptest
rename to meta/recipes-devtools/python/python3-numpy/run-ptest
diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
similarity index 98%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
index 8988a5bc39..a3ea4ab5aa 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
@@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-ctypes \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
+                  ${PYTHON_PN}-json \
 "
 RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
                          ${PYTHON_PN}-hypothesis \
-- 
2.25.1


