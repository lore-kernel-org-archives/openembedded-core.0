Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web12.4958.1610610863340613039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ETV8LtRN;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbT0/Ai3foxhjDP+X/HFqDcZY3Cv++tvTHXM1pBps7wqEjvkq60+vQaepgylzySYB4/Ky8Q6IZ77YMIU0lASEYj5jZWffIrVMqldwtF8sIZxhqFPDsRxadKLtTAPCiGdBBD12R9YPQY4yR3jztUqaEDgrkwXoB4l/2pYhdDeO5kh6jcwWZyZW9DdMukkHTW7FiL3+3ygfo7Datv/FeqMbjm3qTr5QVVR3tuQchKd82J+/A+owRSkp1WNxOqiogBOszy4yo0s031DbGmRpaF8Y0FoE5I7loVE9xXQOb+io7xfad0yvdOuR0v+xS/GF4Z1M+xcVEBs41lxdGJgBhfIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+mtrThCwpHYywauAFsCfOAPAXzQgUGCL9M9cBmDTso=;
 b=k7REfRWHHOOziuFpteH79lRPYTxqXuNB4K3VWNqCjJtvrRBFrQiU/HN0S8q0wCQ+1PEy7cLIVR1LDDyQBh7O3o55DRnc4chZe74pIcUANfp4nxNsdH98wvz/6eAjqotoJUIhM1VG8Mdv/0k8b0D10rY2BEe7NZtU1GxrJcdera+/5DOPcJD6xW/Yv8wZZ85hvzjvSKVHitMICMgbKr/X+Ha1K5GQnGp3xcE76JAUzoCmiwdA4q7kmzM+jfKOrcYttR9HyN2Lxc//0c3TvpdJDZQsvXJTowfyGqklFjHrojRRd8QYdS4NFEFf3z78usrGx/aEDoA+e6c3Mm3ZHDek4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+mtrThCwpHYywauAFsCfOAPAXzQgUGCL9M9cBmDTso=;
 b=ETV8LtRNPODWwb77TJQ9cQMeAz6t/nYbXp/6zVsusDPPhVCTl0RRSo1qAAtKaFcHAAT0Fz5OLKfYvSsHQpPC0WWKcqcWoymUJIILajMvY1VWuc83rIVHTcWhahoUnRlZE3rEFQEYPjucoOIJEs4OqtrNzW62p8ZXlnxjmQ2YlOA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3213.namprd11.prod.outlook.com (2603:10b6:805:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 07:54:21 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::3832:57b1:4d51:5781%7]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 07:54:21 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: fix do_compile error
Date: Thu, 14 Jan 2021 15:53:38 +0800
Message-Id: <20210114075338.27151-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0026.apcprd03.prod.outlook.com
 (2603:1096:203:c9::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0026.apcprd03.prod.outlook.com (2603:1096:203:c9::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Thu, 14 Jan 2021 07:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8976b7f-f589-4ff0-ee13-08d8b8619a23
X-MS-TrafficTypeDiagnostic: SN6PR11MB3213:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3213F690350B604E18EC932582A80@SN6PR11MB3213.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2FsiQ8QndGL5kImeVvjKPNk1C/jbzN1cudX1eSJ68WY+URzMXmCJvsJ9Yi/HsAuOBkgF1lMg/ylhghkXIPi0Wo0NP3rFUEpxu43M+SjtDLmzijdJJ82erWp5QvDdsrHIIQ7sULgHzCZb606cPiX70aOe78LL1gp6w7wFRO7R7rfoRUsADDEfoVTD7tsnLMJCP86Lh5ZmCYUoF+5EkY8/r2DNWyc+uR4yUDOo+f7AJBAoi8xQDQzSbyc5MBjw2oI8hCZnrm8bEKjoVTSg3PIfHdw5uosrxRqc1I/T7Hb5k7zuaEPRndRrLk/GH6kF3ZR3nPgvEXArToa1yWqU0Bs55ysiULDqrg320MVY4dRqIFsi3Mwms+j7KVC420uTt1qQyuJUHmRm9lki85YfLp7B5vSpfLYCNnUExtfJhHuPbwHa9CHbvzYC7VQ1kQ5DIgIBq/aW65YONQ4EG70sphuFng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(316002)(186003)(6486002)(8676002)(83380400001)(26005)(6666004)(16526019)(956004)(44832011)(5660300002)(1076003)(2906002)(52116002)(86362001)(66556008)(66946007)(8936002)(6506007)(66476007)(6916009)(2616005)(36756003)(6512007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bryUyUDsZgyPIGR6RfmTClrnXBCp1hNiqvwEm400Lo8RHVnD2viZ+UscsOu7?=
 =?us-ascii?Q?kyQVBq6rpOTmme6rAC7xfcpBBqdWsvZHYWgbWTLsSfjgXLnId0nyX1AX7QLo?=
 =?us-ascii?Q?LcNR7G5ivneBxoAhDcAU2aPspNmsw9Oxq8LGiYR9DrQJPGN+9gJQ07kzx35J?=
 =?us-ascii?Q?o19E/gixpvPpfNqhc7gzFd/fKNdqEin6Dgd0LjybC9J1uTAI0tNgCGYMjfN1?=
 =?us-ascii?Q?3CDEtY0ofj+1C1K/ZtnZklfn/AnXlX8SxyZERQXyIunWU3Jd4YvEYmexDoLy?=
 =?us-ascii?Q?JnqjtZXpas8e5sr1c615k/JkpXYAzbFy/bX5wsdqCYnUcyPDtKxTEqpnWrwx?=
 =?us-ascii?Q?EFmbjomsX02iE6pnjp9goFK5i649VuviQfBz1GLGZjhgaHEgHv8cEFP8Qfmn?=
 =?us-ascii?Q?W4+ZvBbcsZAiCmO4ZED9w2rulELgrL+G26k6mGNTxTXYXZZD/56PXDdv/VJS?=
 =?us-ascii?Q?D+1E8st75ErqTuZkrYYi2YRD0q3qOE9hxutx5vVbhOSprRErHiZE/86ASUcx?=
 =?us-ascii?Q?w77oZbuMa6LwsScBbACgzHbHFeRSNar5jUW4Rozv+9LY1gcvboHHeCQLscr0?=
 =?us-ascii?Q?CKKKxEkf20dmE4kwsCMKWwyDhlE72VK9HuFSyxrLoOMaARctPTIDvG/UW7CQ?=
 =?us-ascii?Q?45X+gcmAgAOc2l/SOX4TSbTu0Rp786/s8/bVdg+Kzv4Q4hXOPNsD5yEJzm6I?=
 =?us-ascii?Q?/PDNSplFFoj3MHeS/DBdTI2moVlI+c2SvKlnpT5D1Aiyt7U7LhySMCxgZWgm?=
 =?us-ascii?Q?W4oLw78z1K1kdxs0agE1kqZtA6VcwfB0YB9d+CNGWiLSqSTiW5Gt7CXLYLqR?=
 =?us-ascii?Q?C0/9r7XBsndydqH5XNb22AS56ifKh/CseuWoghBs+H/0MM1Z9fWKS5cyCPnv?=
 =?us-ascii?Q?uz59H3zsvJfA9o3WAG5yKR72LWLq4hRSEYWb5Wep+FpFiSpRWTw9pEetrZqk?=
 =?us-ascii?Q?CZsWcOiX5FARfvevwo5zUUQvveY6QVCzByTTqNkhtD4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:54:20.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: b8976b7f-f589-4ff0-ee13-08d8b8619a23
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sxkd/5Xe3QPQ7ylqWco47GIm19GXQAXOgOkkcRScw/VkTBwUPLq3hwJLhLEORfsmsjawrJ3EP+e+89JC3K+S+7BgJtP/ZcfxCsIxwXRpvAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3213
Content-Type: text/plain

Fix error like:
Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...d-use-relative-path-to-refer-to-file.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cfa65f99d0..c894b81b10 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -29,6 +29,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://mingwfix.patch \
            file://mmap.patch \
            file://mmap2.patch \
+           file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
new file mode 100644
index 0000000000..5cb5757c37
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -0,0 +1,34 @@
+From a4bdc0416134477e4eae386db04b1de7491163bb Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 14 Jan 2021 06:33:04 +0000
+Subject: [PATCH] tests/meson.build: use relative path to refer to files
+
+Fix error like:
+Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
+
+when build path is too long, use meson.source_root() will make this
+filename too long. Fixed by using relative path to refer to files
+
+Upstream-Status: Submitted [send to qemu-devel]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/meson.build   | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index afeb6be..54684b5 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -113,7 +113,7 @@ tests = {
+   'test-keyval': [testqapi],
+   'test-logging': [],
+   'test-uuid': [],
+-  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
++  'ptimer-test': ['ptimer-test-stubs.c', '../hw/core/ptimer.c'],
+   'test-qapi-util': [],
+ }
+ 
+-- 
+2.29.2
+
-- 
2.17.1

