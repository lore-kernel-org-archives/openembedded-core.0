Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.50])
 by mx.groups.io with SMTP id smtpd.web12.2381.1607391942655495472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 17:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ATunfV/l;
 spf=pass (domain: windriver.com, ip: 40.107.244.50, mailfrom: jiping.ma2@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXp+jFxhnGJcgp2ZZ9zI8A6HSTmnnYMgLWi+a3NR73VMXfvPS12bdToV737AAKjVBXhmgGcicdqO8mqK8V3tn9i86cJcpfWXV2yyC9nVpdCnzv+B+xokeT+TU5JhmNwDrKK9AB4Lxgwa22HVCAAW0BrhWGGLAHAnjH1bTsOcZKPhXay2f2Ppd03EinBZLHo8QfadG2oH514IvGom+ggvRcXITNkeQcHzzf/LLX92Iy7K81ZN8TL9XPcdwlv6UvO3zqqdo6VFwxGNzyE+dbvIpHcGt8/XWVlAE7XRTFEtDdIl7/D57/RTC/1ys8ZrvjBhFXyAHwTdNe1Gb4LH8F/2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90MCv3YI8WhS5BCLnqcw9oKE03w0ghMK4o8R6QMHNxY=;
 b=Ei6ee4uIDY4T/h5sncg0UceA9K6CL3I/UoQBZHeW5vMUPekuZsnpE14jbN3KV8/ZNFyx1mh/FW5rgjNr9QEa9ItFGCW+91N5kJjV0qh77aKAyEn7hENmF/7bJdmSt+ccK9klm2U1H1H3oeLOM/1UMSawPDquWf2eMWgvn/PW9HXJdp3i14oemO3vDxde+ydwPhbLoehl/ycC3XnNLATNHm95YLzkw474z8WoaZPfYxVRQRz9UF801LNb+3HSFJk+bis5+h3e3nHBWzfNqcCiGBxFNTEap/VgTqvLzE0FUIVP3WLRISmnjaR6rEd6xF1yiWYS5WFOC05I1aI06ax5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90MCv3YI8WhS5BCLnqcw9oKE03w0ghMK4o8R6QMHNxY=;
 b=ATunfV/ltdD6b6bBFLVjc0pKB6+I7/n/vg7hDhLHofs2aP/N2pb8/0NtNwXyw3tM/hFdkarcjIJc3a2sOhga81ebITwVkE+kVeycFqq8Rog41GYK6KQffekDAtkjTdDoOmEdhZG1pttjGglo9Y4gehC8Jg5O9A/ZqOtJovL7nJg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2747.namprd11.prod.outlook.com (2603:10b6:5:c6::22) by
 DM6PR11MB4057.namprd11.prod.outlook.com (2603:10b6:5:19d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.18; Tue, 8 Dec 2020 01:45:40 +0000
Received: from DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349]) by DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349%7]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 01:45:40 +0000
From: "Jiping Ma" <jiping.ma2@windriver.com>
To: openembedded-core@lists.openembedded.org,
	yue.tao@windriver.com,
	jiping.ma2@windriver.com
Subject: [oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
Date: Tue,  8 Dec 2020 09:44:40 +0800
Message-Id: <20201208014440.789-1-jiping.ma2@windriver.com>
X-Mailer: git-send-email 2.18.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2P216CA0008.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:18::18) To DM6PR11MB2747.namprd11.prod.outlook.com
 (2603:10b6:5:c6::22)
Return-Path: jiping.ma2@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by SL2P216CA0008.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 01:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8768dcef-d04e-4811-4feb-08d89b1af807
X-MS-TrafficTypeDiagnostic: DM6PR11MB4057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4057418223BADBBB0DC24598D8CD0@DM6PR11MB4057.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XZ96m1LFZNUZtBvZ3B5DrD9W69X7PAtbPVTxBnFR+KwzLs+9032o9Q5F0qGtBPA3wb/cQo2Btx6Tjbf5ffmx0QtCI/9jIqpYBisMglgkN7TNxq8GCZi6FZR7EVoedlUnHC6+D2vQ/ZS6Y/f92f1/H+ZAsZQ4iYd7kF8rNT3nAu7J/c5GM274qOLOJ70S3nadgfq8C0RPppR6RT4grEsZ6ecam9xXzUVT/mbEOG1FRZ9+e6Koa1KF337VWLl+Ybo3pgy+ib3ZbUl4bIQ/n14CpBr4CnoMZQjdxr71Q0tzpDwdviwjmClzkI9dlpeSi1rF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2747.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(396003)(376002)(2616005)(6486002)(186003)(6512007)(26005)(956004)(36756003)(83380400001)(1076003)(2906002)(6666004)(8936002)(66556008)(478600001)(86362001)(8676002)(16526019)(5660300002)(66946007)(52116002)(316002)(6506007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Q0v03J+JYjfLOYdJnVoeEwDK+93bXKYayZGLBkWjS3VMdLOPPNGsbq9LzrK9?=
 =?us-ascii?Q?A6P04+wRrtn8+jQk8caBRm8Cs4WeADJ6V2l+Bci39Xpo+WVogHlaiRsrU9QS?=
 =?us-ascii?Q?Ai6a0c9skviMpuBhK4B7GWsMomMTQ9hVo7as/vbu1KPHPhaOpjqz3mzepFXk?=
 =?us-ascii?Q?N6qE7nMfiQ0OUT9xSD11KdeuBOuweZUumiGf3cvkpCuzrYI2vZFKwjbvLCfv?=
 =?us-ascii?Q?kwXLkzojqdIm2yZTEbdE2pGmduvSiFinjgNKjY7qOFqgbHDpO9np3U05PXxe?=
 =?us-ascii?Q?Yc2x4rEXDepj3pKy9M0wmxu5WEYo+1DJ07juyFHPN73GL24iWm0dzM4yq7GZ?=
 =?us-ascii?Q?TqbjOy0jSyX0rd55qaKdMz9aKi4g5AydFMychxnz77yPijCwihhY3D2jc/U4?=
 =?us-ascii?Q?75Qqh5erNBAHA/42YnEYdkFaJJPJeg3wIVVU2Po12FUD0FN6sjsHHJL336UM?=
 =?us-ascii?Q?3SkwED3qipcDG/UYwZL4JobCMBdj7wdGla6QEKKe0PGqsuHfvydFjWAf13tE?=
 =?us-ascii?Q?pS2I3A1AY8Vu0QXHN+6AZhnANHjmk2ALD9RQiDE6yq1jk7LM/jM85R/lwMYu?=
 =?us-ascii?Q?loWkPHYDv2RVw6bfS6aI4Vgz4VAjLL2RiHgaAKg8qQ7Yp3aoP3lAQnTnPtwN?=
 =?us-ascii?Q?7mw2y5Smc06+GMXMyK29u4Tuv7TS6UEF2lB7Wtw9+f8DMya5bGvcNBi6CtGi?=
 =?us-ascii?Q?9GGpqNjxnZY0CNrdUIzfzr+f1YQKA5hZfhWtD0yRsCsG+zEMV1y0at+F39v7?=
 =?us-ascii?Q?ImLBd8MvLIjUN1lPVJptyoS0b3LyXj82kxgh9dHB05Z93Q2eOp+A1MjcPBhR?=
 =?us-ascii?Q?P2sB8e2ZztPGMQ/7DrtK+JpE/Y6SqJ83Hzq5pN12RI6eZgX/AHolvbauuDMf?=
 =?us-ascii?Q?fni6ZRpT7MEGTrtpkJC3rRn1jZwzLKfcYeqg6x2z3tCCulxvqFgyzl5USzAp?=
 =?us-ascii?Q?38jYGgeul7N8qkNBJn1QOAAviE9ACOdtCKw6XgJaS1n/FpUEDoh0sWUwGDdI?=
 =?us-ascii?Q?VE83?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 01:45:40.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 8768dcef-d04e-4811-4feb-08d89b1af807
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3j3NJeRIFReBS662ZKsfFhz+OgwgXqBMh8N8Sk5+505I6ZdCTRQTfMs+xidhmbu+E9VeDxMIzDaszeEyKroDQtng/LWmjwStb2/Ptuuv0NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4057
Content-Type: text/plain

1. Build SDK without "MULTILIBS = """ in local.conf.
2. Build SDK again with "MULTILIBS = """ in local.conf, build will fail with the error info.
Error:
 Problem: conflicting requests
  - nothing provides binutils-cross-canadian-arm needed by packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
  - ......

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 3b430c0814..b6b3e5235f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
     meta-environment-${MACHINE} \
     "
 
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
-# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
-# This will result in erroneous reuse of previous sstate packages. The following line
-# establishes a direct dependency instead.
-do_package[vardeps] += "TUNE_ARCH"
+# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine 
+# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to 
+# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
+# following line establishes a direct dependency instead.
+do_package[vardeps] += "\
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    TUNE_ARCH \
+    "
-- 
2.23.0

