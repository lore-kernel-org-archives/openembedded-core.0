Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F29CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 14:28:50 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47085.1781188123506967283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 07:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=n6ezr3tu;
 spf=pass (domain: axis.com, ip: 40.107.159.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrnKIgoqmCTqHYTzUQc0W09QgjPe7xC4PnD+9H10dajN7F66Hvd2OsANUFk9KIKLzBKskQkdRe88TBRjmRhV52CkRbqr+W4RFBi+Xix7vo8X/ZrWef0ifY7NXJy+TP98odzl2kwU18CNQr9ixhdgkpgxze5xwftYdeJBFfWTMBfJyOvhRCUYFMOSokFe/sZVsaVwy6n9pmsrVSYWRqdbrHczx8h27TonPngGAB2qp8TUNDWXn5nyNN1k93uzi8F+KDUsob4/zIXHoqqvEzsuBDgKPsfmq+LmB3bN0Lt/PZwPBeo8nB52ibBIIKL19eItkujUCIDIHwhG8N3L8m6Q0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWlSP8PF9TN8083u+ZVF9ekwpuLBk+rmzFa8O1IjJQs=;
 b=tmaXoxUArwrFRNBoP5+w/UAhXYQ+m7rEaKg5ZRD0H8wgMfC/0DvKJfETZ6TVL2WAaSACfGAx9d5gGCTdWBfWBOfwkcaH1RP0BXIUBioZ2BZzv/gxsc5I8PcIC/XwORkhvU7sbuP9QsqhJYrfFwzcJRzGDCwa6U2wCZrCNGKZseOGlWq6x1NpPel3CXFxeISKYMLg1GCbDQB8glOjSrt6xByQ6fB7Bim97J4dbxiqfZ8YJ9K/7xzUqbcdZy39kF0/CROIN8uWyoqtsq16jxmUX6zx1VC2YjzPpcVE7I3FoLOh0/0fXH29WSEWZnVFk8c7J43irsMQITK6AYCKWkD0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWlSP8PF9TN8083u+ZVF9ekwpuLBk+rmzFa8O1IjJQs=;
 b=n6ezr3tueeAHCjsxaZhOOXnIucR8VA8VJP78YkkrjJv59t3M5w4teZLiEMa5fwYJTxp+gRI0ZX9MJIjtUvHWH8JyfCiqjr6HFARnypeX5D4LU/u/C+E7VJpOv0RD1x/H0hSsEuuUjgvMlVckAHHrcPFWj7DC0k3Px66Mx5MdmoU=
Received: from DUZP191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::23)
 by AM9PR02MB7331.eurprd02.prod.outlook.com (2603:10a6:20b:3e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:28:35 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::9a) by DUZP191CA0031.outlook.office365.com
 (2603:10a6:10:4f8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 14:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 14:28:34 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 11 Jun
 2026 16:28:31 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 11 Jun 2026 16:28:31 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id B25241E31
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:28:31 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id B606D12C7F1; Thu, 11 Jun 2026 16:28:31 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] common-licenses/PHP-3.0: Correct the license text
Date: Thu, 11 Jun 2026 16:28:01 +0200
Message-ID: <20260611142819.2085544-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|AM9PR02MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e90795-62d6-4984-2de1-08dec7c5b85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|18002099003|13003099007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XTx1nSK86arAd4YSumKhyvkJXj3iqEft0qSpRHi9wuRVa0QWeyuuC5dKiGAP4VYthpoxPQ3NLgtxMA+QPhJAs2YIo+nESrC72R+IwdkOz+18XpTfUYzQF3mb6G5joReZC2rX24UAqLnvwsTL/xeN8Us/mqqMT7GUUJL5GHEiMb7ZRLpUGR57SZVFTp1TbGFwVddMQCZqaBFeM5kqcJeS3OOnFrUHP1Pc3AiqCyyoLlTO26Vh2Uy2Obv8kjm7bzL+ZArMgooNE2yk6gZySalaqQhj73bV4rwqsB6GsnY2kB0D+2uAUW/uGqsuGUEnZ5yROUthfmKfIM3I3Gd8HoQMt+mofgDhBQiXXpfHb80DkXWjtPk2OomCr4dRS20/2J3StUScHuHK8R6I+polAEwAzvb1US/NWsl/P3dh12zlQJDAmOz4JFOExzzplvS6qJDKQ52Povthte5CosadsCocPTYseLkohxtcLXBZgAi1g0VuJJ+/vapjsp83MVOg/sgwo8wdU1wkgNeCTAZUNJk1Yz9VQhwAOYifP1iZyeKEbVRITc2tfZdY3qkOSUHe945V+JSXCc7SLWQycqRJBXoOrYA/m3JBMByvCmEB7PeDBuKjVH1mXd7pVhOGSVKW45fsYkPmcgpVyfg3JrPqaBKvtJLzNpWAVwi4LnHD4W1zu09g9glivNEw63DVptzBvg5U
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(18002099003)(13003099007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JFx9xUaybvD4zYdKLK4KnWPvh5EEDxbi3gUh0T/C7YTTqvwho2s3sBinV34yWwWjw1KRnIYhcghTGh9fD2fQwcjMfKbTGeMMl+z+O0Au2I1DNxH5917ygDc7v8i+wB/H+/KhKn6nnxoe/1iqlj+dZjfhwKCoJ4/x2urmsFHuzDdIK+/x7bM9ROt59bBGHHHnP69Yfy5JN5JlWNKcpC7gz9XgBQtS/ApXm9o74DrhACELCu3iCvlV/6Dl5jcGLLD/evD//vv0pEwt1sXepogZpwjFJaoqMtAX5WkLueTZSxkbG15m0mTdxYKd6j/N5pdfV8fXKqdLu+fXvn9MbnPw6692i4UshVBdep459mDcpQrrQY3WUI3UhPXFal6KKKysXEszJexq42ijxjghF786/NnbQch87AK/vdQ9YyJtKr5J0HLKDdN+K9SgHK0L4gTN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:28:34.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e90795-62d6-4984-2de1-08dec7c5b85f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 14:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238442

For some reason, this previously contained the licenses text for the
PHP-3.01 license.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/files/common-licenses/PHP-3.0 | 76 +++++++-----------------------
 1 file changed, 17 insertions(+), 59 deletions(-)

diff --git a/meta/files/common-licenses/PHP-3.0 b/meta/files/common-license=
s/PHP-3.0
index ef0b20306a..d6e8ae61a7 100644
--- a/meta/files/common-licenses/PHP-3.0
+++ b/meta/files/common-licenses/PHP-3.0
@@ -1,70 +1,28 @@
+The PHP License, version 3.0
=20
---------------------------------------------------------------------=20
-                  The PHP License, version 3.01
-Copyright (c) 1999 - 2010 The PHP Group. All rights reserved.
---------------------------------------------------------------------=20
+Copyright (c) 1999 - 2006 The PHP Group. All rights reserved.
=20
-Redistribution and use in source and binary forms, with or without
-modification, is permitted provided that the following conditions
-are met:
+Redistribution and use in source and binary forms, with or without modific=
ation, is permitted provided that the following conditions are met:
=20
-  1. Redistributions of source code must retain the above copyright
-     notice, this list of conditions and the following disclaimer.
-=20
-  2. Redistributions in binary form must reproduce the above copyright
-     notice, this list of conditions and the following disclaimer in
-     the documentation and/or other materials provided with the
-     distribution.
-=20
-  3. The name "PHP" must not be used to endorse or promote products
-     derived from this software without prior written permission. For
-     written permission, please contact group@php.net.
- =20
-  4. Products derived from this software may not be called "PHP", nor
-     may "PHP" appear in their name, without prior written permission
-     from group@php.net.  You may indicate that your software works in
-     conjunction with PHP by saying "Foo for PHP" instead of calling
-     it "PHP Foo" or "phpfoo"
-=20
-  5. The PHP Group may publish revised and/or new versions of the
-     license from time to time. Each version will be given a
-     distinguishing version number.
-     Once covered code has been published under a particular version
-     of the license, you may always continue to use it under the terms
-     of that version. You may also choose to use such covered code
-     under the terms of any subsequent version of the license
-     published by the PHP Group. No one other than the PHP Group has
-     the right to modify the terms applicable to covered code created
-     under this License.
+1. Redistributions of source code must retain the above copyright notice, =
this list of conditions and the following disclaimer.
=20
-  6. Redistributions of any form whatsoever must retain the following
-     acknowledgment:
-     "This product includes PHP software, freely available from
-     <http://www.php.net/software/>".
+2. Redistributions in binary form must reproduce the above copyright notic=
e, this list of conditions and the following disclaimer in the documentatio=
n and/or other materials provided with the distribution.
=20
-THIS SOFTWARE IS PROVIDED BY THE PHP DEVELOPMENT TEAM ``AS IS`` AND=20
-ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A=20
-PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE PHP
-DEVELOPMENT TEAM OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT,=20
-INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES=20
-(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR=20
-SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
-OF THE POSSIBILITY OF SUCH DAMAGE.
+3. The name "PHP" must not be used to endorse or promote products derived =
from this software without prior written permission. For written permission=
, please contact group@php.net.
=20
---------------------------------------------------------------------=20
+4. Products derived from this software may not be called "PHP", nor may "P=
HP" appear in their name, without prior written permission from group@php.n=
et. You may indicate that your software works in conjunction with PHP by sa=
ying "Foo for PHP" instead of calling it "PHP Foo" or "phpfoo"
=20
-This software consists of voluntary contributions made by many
-individuals on behalf of the PHP Group.
+5. The PHP Group may publish revised and/or new versions of the license fr=
om time to time. Each version will be given a distinguishing version number=
. Once covered code has been published under a particular version of the li=
cense, you may always continue to use it under the terms of that version. Y=
ou may also choose to use such covered code under the terms of any subseque=
nt version of the license published by the PHP Group. No one other than the=
 PHP Group has the right to modify the terms applicable to covered code cre=
ated under this License.
+
+6. Redistributions of any form whatsoever must retain the following acknow=
ledgment: "This product includes PHP, freely available from <http://www.php=
.net/>".
+
+THIS SOFTWARE IS PROVIDED BY THE PHP DEVELOPMENT TEAM ``AS IS'' AND ANY EX=
PRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED W=
ARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCL=
AIMED. IN NO EVENT SHALL THE PHP DEVELOPMENT TEAM OR ITS CONTRIBUTORS BE LI=
ABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUEN=
TIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOOD=
S OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOW=
EVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIA=
BILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT =
OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAM=
AGE.
=20
-The PHP Group can be contacted via Email at group@php.net.
=20
-For more information on the PHP Group and the PHP project,=20
-please see <http://www.php.net>.
+This software consists of voluntary contributions made by many individuals=
 on behalf of the PHP Group.
+
+The PHP Group can be contacted via Email at group@php.net.
=20
-PHP includes the Zend Engine, freely available at
-<http://www.zend.com>.
+For more information on the PHP Group and the PHP project, please see <htt=
p://www.php.net>.
=20
+This product includes the Zend Engine, freely available at <http://www.zen=
d.com>.

