Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web10.4552.1618959902101874301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 16:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ivVu4t3T;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MU3tNzydPk2WdcyCwwfDlaSpOdpmVK+v2up/CtTYvtq9LQBW5nCPjCZJnZqdIgP5GpMLwu1/JN1cS6/+z2ePmkGE6DgzN/4yl8romeUi2k0gbAfr09hS6nZwZe8jax5UgljRH+8dZ7MiBYuJZ+DuYiE9l1gsFpIIT0QIIu1tjFCLDrTbb3+8V0B9+tvGox6lRNigDG/vwivZHbUDXIZASYhRDYYryjZNe1ipGV9aJb8QWbQAVAo9OOuJdrTvSTIoyDIEZQQVhmDCmbda6pX4AlogMdpHvGI1kgOcH58yv88o3G7+E3DTcmVC0f7QzVBxgab7u7dS28JhBYA3mGqTJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8fQ0IGB4ncvr9RfjAcdqXksPn9fU/WHhQTWaIPd+tk=;
 b=WKRfSDzOIKKMqfgYeyaH8evB1GU8RWi5udGJwixxnWvGcN/kJ0ZtAf00eYzzbOHf195S05q+Q1MtY1exNpuPeDzmlPpWPRAKd5r3r/Qw+uOejtpoJe+R85URpyEIn9oxSsuve+MZs0dHNdrYJqzYus/CK4jn602djPt/gqjhAtzXmTN8xHqXzwOu1xWHwi/4jxF3GKSasxovd8zMu9j2G3za/BbT5v5qWuQyt5oPaMqTBWC+3G62EB8eFeBJ+Vi6ycvSt4pB5yFZy9ppZXSzZ+UZDJ11ez0xdVdR2oGcfssIscaMKDFiNxlvMvWd9a0FHhWSLOLd4Dux0o71IJeP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8fQ0IGB4ncvr9RfjAcdqXksPn9fU/WHhQTWaIPd+tk=;
 b=ivVu4t3TtQdD9QSaWCUec1hIMFQtDsvGQhlXhITk/Yqq1dJ0GXdfpirZBT3OGx9czu16XuTdKw3CXxcEmot/oTvn3AKXIBos0/6KyQll30ywCxec76k3xBIu51vicIaIvBOYftdb//h5zoGhhs1eN5hmJPzls7zc+yvG1ZeUfJE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 23:05:00 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.4065.021; Tue, 20 Apr 2021
 23:05:00 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] valgrind: Enable drd/tests/bar_bad* ptest
Date: Tue, 20 Apr 2021 16:04:47 -0700
Message-Id: <20210420230447.68970-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:40::14) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:40::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 23:04:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad6c1d62-037f-45f1-bc8a-08d90450b920
X-MS-TrafficTypeDiagnostic: SA2PR11MB5002:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB500239F738827D4789522F2080489@SA2PR11MB5002.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5AOqpGffRjmqQoxE4LF+eia8JbPRdcMy7AiwUuoHCWdxm6eU9mfLa7zv8xpj5/0bX5VwIfo+DlxvzDgYuDlC1mkWdFFRfarFxS89t78aNIeSDv/zYNPyRI6hZjI7QgjBlLPeYjMjB1Mqx3x75xFTws7Ox3QVib1pj/M5Oti8Y3drZdXXzhM+ZSVlsKW9a8dXePMLU80PVr6nm0cLXcC/gumuK1lAOwYfG9wln5E6U2thDY0LNLP2GNZOXF3A122Mke0VZcLguNgAiLszP0xVpXY15ZoSLS83Pgouicr4DShF+bVgmeXDBAnp5cWGgP3oLPQXIaoUtv4iz3krg5znJlb/xUjEQ7ep8T9Vu62sMxk6v31mz+/ujeHnj0l0XciYdRZGCMTDxeON121pTgwcXmfjawIkA75OB5w2rWa+Y0fSLf4XomgC5cNp5F29/ottAZY01tgX6Rw318blXUruPF6tgNeO4jE9gB8eXm9hRgbOmEtwXDRTddyVk93YvV/5lsDM/vESc6Uy6MhKqTifnGhMo9Zy1UYTVUl4r7+YReFZEQyuhr+fXcOdpIAYSTqGIVYecpBGTdUOL7BbVD/HWqhzqAHYGir2K7dPuUEQY0lnSdhliIYp0Sb7Qkfw8fHANCAX53qqUWsl9jGthSivS9niwCovQ35zHXJbeokFf+gYqFxiQ7K1g2Gg+sdaJudRoz9bmyfx/Wq/doJ2vUXx26NC482mcA766eOE0jvqGs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(6512007)(16526019)(966005)(186003)(36756003)(38100700002)(6506007)(478600001)(26005)(2906002)(52116002)(38350700002)(1076003)(6916009)(66946007)(5660300002)(66476007)(316002)(2616005)(66556008)(6486002)(86362001)(8936002)(956004)(8676002)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?TxXyp/014Wr1L6v9E5p5YyVbWuckBElC1cDu97gVsUy5XHBhBII5in9gskae?=
 =?us-ascii?Q?ZQR26bFvJyc5VWrKE1jOrl9kDORiGgzq5xDsV7QS61Jp4KsxeEvUzuAPqIjD?=
 =?us-ascii?Q?af1I0MWBAstgqYBQtbXbfqnI8Mjrl0664Una/6RaNHw/B4rze85fORSaeg06?=
 =?us-ascii?Q?WMBCEOwTmtNmamG6Veu1JYEUN3xFGoML/E+O634FPKe0zdtMPO5GNvZU3YOF?=
 =?us-ascii?Q?CfU4AtrQzCGd7SSh/uJmj+pFFGv0AKYUTUi1Dj3G/lWARWs/6vKxf3+FHg4J?=
 =?us-ascii?Q?RfU3SOSSv1f70JZLLY3OEDKvqIZ+v2gZ2KlWg/vl1LJQWdxsghlSZQUkshM2?=
 =?us-ascii?Q?nICc+BAcoHFJWB7JgvrtInhngNEXU9t6YfaEjMSUuDcbyggF3+9J3djvLNmy?=
 =?us-ascii?Q?XJdHoTnfXYTi8hMQsI9lz6FH5B8OkEkpWYpgiKrtexc5m5nnHujbCjdKBo+B?=
 =?us-ascii?Q?JzaH1gfNsihdh0rA3iKhFeSTPY/4Un5W2mk+Whv0FyaRvyoyeaBMYyiTNm9b?=
 =?us-ascii?Q?2erzdPJUbABsLgrWX5ygxP7oX1rQX+0Oyv2chN6mzekw32QPcS6Ej/WAeZCf?=
 =?us-ascii?Q?fjwE5hbBN7dBDJYv31W97hn6IMfBo/Ta9J0FWLixgH5wkWQBqPi+hfYGki2e?=
 =?us-ascii?Q?wfTVykoEQFEZOPUPa/FpzapHiaJ49x9YMJU7ZN+6E74bxdCoPwAqAjjWYOOU?=
 =?us-ascii?Q?U8fFSm0ouZ7KGjeoPM8bpkOCNRC3bXezC1DeUXCn/OlQzsBJ4zydpPV2SgCX?=
 =?us-ascii?Q?VhKPqhJbXFwh3ZM4sKDUz8T195sfSWwv3idI4ubkCkjsbIbCUVXvQZ1VPYlc?=
 =?us-ascii?Q?pr5QLeEMb5GoFtZ4OEOYbQPTkc2SOQ6RqXQknX6WJKWg+i28rbLdq8u/JwZD?=
 =?us-ascii?Q?Gx0xCyf86CFzAC5PZ+1tr9Zkij2kYmqvAhj5TBg7iHhuzL/ZxwUCbHsRbdJc?=
 =?us-ascii?Q?UGKIdew9wp5SUARUTIQ+W0QCJSs/DH+zmg5jQAg9svM8+GEX+X1AFhvzAqiL?=
 =?us-ascii?Q?Z2xEktjvulmx8y6P38+SfTFrgvlyc7b5siUtbhqvSBD1zSD3v/buzSuJIJ1B?=
 =?us-ascii?Q?6aQNY4v3wt0kClg/rzn2h+JLmtmctUJBa+O6Nx5EQA3AH/7/NvinSE5vpogR?=
 =?us-ascii?Q?7lBwS7IWqW5ssAew9PHP9TMT3FLKKugy5P/eR1izHjkSaq91i3dd0MX6WWD7?=
 =?us-ascii?Q?B4EC9/zlXbfsX+QAGLa387CbO7uB3q9wwPaqr1Boj0x7V2A/TH1tnrNSW0p9?=
 =?us-ascii?Q?1GjxYtgQ+eNLr8snznfAhGLWnylC0WQSz7m5aHzK94AffyXPksFTv510Lcro?=
 =?us-ascii?Q?68FJXVrYYPC1VZLJ80ja8TQ0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6c1d62-037f-45f1-bc8a-08d90450b920
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 23:05:00.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DM4nT5K31Tj2dy2oh15U4cNbINP4xRvLc/ROT/H/aRawY6fOiVsn0CfFV2/+J0X76Dj20LNK97UycS6DUR+AfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
Content-Type: text/plain

Revert some of 7f7d2fa18267090891754d976cbc3e628324d3dd

Was not able to reproduce the reported deterministic failure.
(ran 20 times on qemux86-64 on a relatively isolated machine)
it might be related to the AB-INT issues,
but it seems to only affect ARM builders now.

Also no action taken by upstream valgrind to fix
https://bugs.kde.org/show_bug.cgi?id=430321

Let it run on AB to see if failure was fixed by uprev to 3.17.0.
if not, we can gather more data from the AB failure.

[YOCTO #14051]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 ++
 meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 93bfd45a4e..a3a0c6e50f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -31,6 +31,8 @@ drd/tests/annotate_static
 drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index d6a85c4735..e69de29bb2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,2 +0,0 @@
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
-- 
2.17.1

