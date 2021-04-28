Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.85])
 by mx.groups.io with SMTP id smtpd.web08.12964.1619621838641169143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 07:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ktgLt66P;
 spf=pass (domain: windriver.com, ip: 40.107.220.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY8SmQ3LUzS9w+abhLZia4msaoJNu4zyJFfKsNWeasJ+8SL1IBRoutJLrImL1F7AqupE3ECAkN7Iq1dJwnhLav70IouYs8+pBPjTNeAY8v8XnRilj7zWuux3qVzfXBPBFJ9sHmN/1rjkb4Kwr0P8gx9IzhdxDOOr3CqW7y0U3W8jC/q8sD+/xYuAbApY5z3k1qZvUE4Dhe7cK2EFE6UybGL4ATxX/9mJZkO6OkkSOVvmhH06gUyqS1/h77fAPA2wvx03CtpFs7NGDIgq8hc+Chsw10HAmxE5U6hitc2Wooawms7vAfsAPmomEzd6syGSlkmBIWZ0zpPI1RO2p3hhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xo+cqKb1zoyoegjo/l/bkgjKsIpRtAmzlwCperilcw=;
 b=VaiTmicT6zkj98T71d5HeeAPPzJdghEdrOqhcWGGN3JQcjYxXdwqBBVG6Vpu/JKpEuNylPUI05bCA76NMGDI/VZcngOmyQv8hJ2doAZwcJft/ntC9csDGRYVAnsUQpKFVnLlBCtOyVE58TbuPpEUAGZB+5hB8mNtsoGOCdHOYL+mmlnyKMYpMx4feHP3iTfu3VOMwenA/lvW9LdV96BBrmErnXIAzE3Y2OduC9tDo7n/aAEe2lm0m9+9gcrVC3dOIIVODDJCh6wtW5jnu9a3fkJCHc5VecvFTft1VlGeRzeebwWbp0S/U5VoPrQd+eatR09+lagN2l2gTRtbPmSMjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Xo+cqKb1zoyoegjo/l/bkgjKsIpRtAmzlwCperilcw=;
 b=ktgLt66PgY0dfspTnm5jvUL6vlaLeQ9gY/8Wu4RpTnQEtOc+/6U/KUMTrHjZzGJcuyQ03r81nxTXppjap4C4qKiQkN9arVYC/rPgFZifqPSWNTp+zGODLkbpmxpNJ2kkhQmEDgOEfOYWX3WMxxUPKCJbvkxqAnqcOodKB1jAJqQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3720.namprd11.prod.outlook.com (2603:10b6:a03:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Wed, 28 Apr
 2021 14:57:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 14:57:15 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH] binutils: Fix include error in builds
Date: Wed, 28 Apr 2021 10:56:59 -0400
Message-ID: <20210428145659.29096-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 14:57:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06bf596b-8d08-4ca8-0aee-08d90a55e927
X-MS-TrafficTypeDiagnostic: BYAPR11MB3720:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37209BC6590BC116EF86AC2B9F409@BYAPR11MB3720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8RzKFS01qpfOXTLQHIJD0iM19bxnbJF5ivxE4d8CI0NfYW2qc66oEfzUuH5KiCKkKQs6YDkO2NT61jeY5xXGs5f8DVuDmDRdq2KI8zxTnkRSlvBl4CI+OP77rzwkiIcljQKnXs+Krfg6d/419eXSoSFdlyCJ2mpo8jRo0WU95Fd2BU4HeL1zeAoSyb2q6B1EUJeLCvMlzxrXffbW9ti5SQ+rH7GNfOJRIBb5gfE+gF/otU9+ps3OkBBcmIoTMsWorUrqD7BXX7sV4jYQYg+fjnj0jgu6G+64DjqHEuTjB5j/IJIphnIYLEw9xJOWuZUT526X29xildBJog2T5s0iqW3/Gr9P0Hmv/YgzQbgUvxNRJGA/Lna8R9/hQEtUZzzU15ICcj5fMRSu2ZSWja+t3M/h52yVoLpFch0yuTSO/BWJrWI9pu/0okVPdmM1kHsf8jFabdT7NnMbXseytLAu+dM9bDfFhrwtw9MmQhLx4vrQ2OIsWdWE+4NiRlXc6KadNogMgKuYidIDjZks08iXn6+l/zmDvmMlD9f49DQVUYMArX6yCShC04fw+qQCdgiJVQBLX+dYiMw60gUug/s/++IXgfALcGYZWDyQ+BqPRzomI8N/TtNYPDtLYzE7kLyhlUKE+IsiLfivk+JpqMr3/q3aIobuAnFfOE5jr+D1HklgmJyGhIStetisMAEtCpt5G/dE60JOejkr5Q0jZRDopJ0MsvygVtEehdpgWWdEgu8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39850400004)(346002)(83380400001)(956004)(6666004)(1076003)(8676002)(6512007)(478600001)(38100700002)(44832011)(38350700002)(36756003)(6486002)(6916009)(8936002)(6506007)(16526019)(5660300002)(186003)(2906002)(26005)(66476007)(2616005)(316002)(66556008)(86362001)(66946007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9y1PUZEOG/lti+pHIAYYtI5u68c6wDWSlzeNA0ab4/VteRrR667IwR+5p1cQ?=
 =?us-ascii?Q?t/TmrPaChrt4pwEoT9ezbkv3vbd2HrYt5iitGRXbe3FFyG7heESpzLI/r3+H?=
 =?us-ascii?Q?cjG7C8gBTHvsvX8xC+ebmedxypJBFniU+tLkB1xBnQbv3ZMa4ZikewbldgH1?=
 =?us-ascii?Q?hASFCC4L5KL0Lu9inbvpHUq52Jy8na8aa5710N2uBgE6eJYSJTYSzZVa7Omy?=
 =?us-ascii?Q?Hr+5pChlfRsIxCaiuH+u/wnhxVbSbRzwDeZmfssUNray46F/AQVptIjTvGLY?=
 =?us-ascii?Q?7FsG47t5q/57kbWpHaPcopxaBQkD/P0HkZNgec0XLJZSYOD1CKkaNhkA571+?=
 =?us-ascii?Q?fkLHEZY+4TBQco9Kerl6m5UONkfJvAgVeTgu4g2THDWvWDi/1kfyrngdwUY4?=
 =?us-ascii?Q?FYx9MxgXGHQBNzwlOW3xH/bcQ38y7x0tFgPD/r71RVP5yzc4EvRvVYrrZsz7?=
 =?us-ascii?Q?6KA6UsWAan1Qfb/EhFQ3RI1N3elBkph7omch+lrWcJ3X96dukIOLQVsyoyQW?=
 =?us-ascii?Q?Dl9V2LLb7yUBMS1lO0VKV3UQe0GX3BFOipeboZ/0VVriN3+c4J5qjCaCA81/?=
 =?us-ascii?Q?m8x3N7q2S1PkjW1sZbSX9+cKfeI888RnLTmiLASVZo1oKiMVyr0kgktWzvTQ?=
 =?us-ascii?Q?EnOUClMSbCxbEBNO6VjpQN1vxgh+WXvOAr2h+FWrbCCHJ82olXRKHM5qx1+Y?=
 =?us-ascii?Q?0mxkb0tmQ7cFZ/xvJea9H1Ez/yD1yg4ZN/T2GrLqphAdaJH7BxVi8r+FX2Ho?=
 =?us-ascii?Q?5+xnUOTiku7HkW/T9TsgTO94A+eIQde1RYEvbjNmlpN7fbGKI7rsdoJdzOP8?=
 =?us-ascii?Q?EgCPQJkradYwn+ZACQ4ecHxbnzLlij3g9vQQXJr++ZviJMXWnh8Uz+TMkR0L?=
 =?us-ascii?Q?H8JQ6Ltf4+I1qbJ1gJJGXuvmMnspfEAWsOVC7wko+J8P2M9aFRDFLJlk6NtN?=
 =?us-ascii?Q?yPA8X+lAT/XmZ3R/mTI7338fUwxMNJp5n+SI/VwfHgyYm1EIG09leB8jav5l?=
 =?us-ascii?Q?v0sTkxrD/CmV5AbxQAv34C/4451VRKthCis1lgdit65oXnUq0Anam4u1siwD?=
 =?us-ascii?Q?BVcfyO4IHKRQf1fCGpyARlwAvhwst90E6/0dN7wfj8KlytCqulkjsQfn8jtI?=
 =?us-ascii?Q?84rquNgNSGDBhsYAJpIbjfuypraFI2zmUQPH2MKxMdawqsoE8FCYqCSnpiTS?=
 =?us-ascii?Q?86z3Jr4RPkLvkPutReLKX0H5+sbGchRaFH7ey6fnsY99SWyJ77tPmQfRK+3m?=
 =?us-ascii?Q?q8Uc/Y6k4TWtMAArOBjJy2QzhCSwirOayq0vz5leLsDhinNPFslKd2qHVa4q?=
 =?us-ascii?Q?k56rGTN4K9bkkRdfC8qe5hZC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bf596b-8d08-4ca8-0aee-08d90a55e927
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 14:57:15.1952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSpfrLTLgpH2wVtwM7N9qSkeFREWi8nwdut+8EVha2CDsbo5RGxNXnaUKBH+ND165SnkzUbcJx4PxADs+FnW3rEikIJfxNOfmQxmEIf9cyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3720
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

See [YOCTO #14169]

A user found a problem with binutils in zeus due to a missing
include in the source. Submitting the patch on their behalf.
The issue is fixed in binutils 2.33 upstream.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../binutils/binutils-2.32.inc                |  1 +
 ...0001-Fix-a-missing-include-of-string.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-a-miss=
ing-include-of-string.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipe=
s-devtools/binutils/binutils-2.32.inc
index 349c3e1154..1f2d033a6c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -51,6 +51,7 @@ SRC_URI =3D "\
      file://CVE-2019-14444.patch \
      file://CVE-2019-17450.patch \
      file://CVE-2019-17451.patch \
+     file://0001-Fix-a-missing-include-of-string.patch \
 "
 S  =3D "${WORKDIR}/git"
=20
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-a-missing-inc=
lude-of-string.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-a-m=
issing-include-of-string.patch
new file mode 100644
index 0000000000..9f52ed8938
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-a-missing-include-of=
-string.patch
@@ -0,0 +1,49 @@
+From 1aaf9d481a7c0e20675df165a4968e255521bea8 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Wed, 28 Apr 2021 09:25:08 -0400
+Subject: [PATCH] Fix a missing include of <string>
+
+gold/ChangeLog:
+
+2019-06-07  Martin Liska  <mliska@suse.cz>
+
+    * errors.h: Include string.
+
+Upstream-Status: Backport
+(https://github.com/bminor/binutils-gdb/commit/a3972330f)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ gold/ChangeLog | 3 +++
+ gold/errors.h  | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/gold/ChangeLog b/gold/ChangeLog
+index 458bed793e0..00f804b1bf6 100644
+--- a/gold/ChangeLog
++++ b/gold/ChangeLog
+@@ -2,6 +2,9 @@
+=20
+ 	2.32 Release.
+=20
++2019-06-10  Martin Liska  <mliska@suse.cz>
++
++	* errors.h: Include string.
+ 2019-01-21  Nick Clifton  <nickc@redhat.com>
+=20
+ 	* po/uk.po: Updated Ukranian translation.
+diff --git a/gold/errors.h b/gold/errors.h
+index c26b5586379..ac681e965bb 100644
+--- a/gold/errors.h
++++ b/gold/errors.h
+@@ -24,6 +24,7 @@
+ #define GOLD_ERRORS_H
+=20
+ #include <cstdarg>
++#include <string>
+=20
+ #include "gold-threads.h"
+=20
+--=20
+2.30.2
+
--=20
2.29.2

