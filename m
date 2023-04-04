Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E2BC77B62
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 18:34:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.139])
 by mx.groups.io with SMTP id smtpd.web10.110220.1680633262892860774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 11:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.com header.s=selector2 header.b=coIlI/To;
 spf=pass (domain: nokia.com, ip: 40.107.6.139, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJKT9hcuq/GlPaGDimgcaxI8e+ApHGFMs4vax/h7IoRr5IEdpjDLt0mzVJNmBdIhuVyhuG4HfknMkcHoxf+AaSg+soQMnlLqva6EMIyG3nppwym/lWwPZy6M1LHRKvV36lk6jl2bBEW7+lhovKANE9ynHZiMvRdAnWd1QSbukjLPE6bDDR9oOPKVi4brkT4sw82rN5/6Kpn3KKsQQWjhm17cXT9C+qt2AiInVWwkZd20hzU4XTMO+vQg8XiCDQRHskD13DKbBlvWxUOPN4SmAblSajSh+CBkV3YGhmQDYZsQ1+54BssRZswoj4yRxCUljXBfGSt9ejjE/ufMRZw7Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grUYOaFpMOGILQKSRnZvklp65caHqKKp90qKTsTB1q4=;
 b=dNnZcCaD0XNdhtnA9OvPE72TFzMt2oNbQ7t6aFR5+DxwO15uTC/daRuO3qXiIXiwofTp7lTXo/cQrFwhBVXEHdP3CC3klDPl7Q2K0QZ7qwiBxQpq9HAwB32lyKqelQCnmQWibJYd73PCseBpteorzw842MRYAIdmWdXJKmJk70NqKBQI2TRwH+Ds5DcFQUm8hjSWaa75TmKBaEWIQs7a5kRMZhIIDpoLM9m7wSa1eMem98c++7gR0owZK8J27LDy6Oc5S+WxdWVKo7zcLp7pExqW6UiHXMNVhEANQjrRwZe4npOb4KJfSIJPjKpIcGXJIiumRGzXbAdwgXmpjlDArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grUYOaFpMOGILQKSRnZvklp65caHqKKp90qKTsTB1q4=;
 b=coIlI/ToxgOn7q2Q4sQMBADPSIt7CzL4I3KDjOPP+X1BGKeRHV5ikIJRpzYpi7dGbnbKq5asRfW59GWRoj7iHWIjB4t5omWE3PyAAoH71rC3c7xoOzd29986xs1a6Z3QKUe5gLYNmg3AGb/AR4hLzGMUYMB9Vm2omAbwptXvjrQSaXeleB+AliL6gAi3v2Rs4z0A93FFyQ/qyWx+KJsH4jQYEoFHOrZw/2fEt40mcwgNHoTNKxyv8ofPSF94cuh4zpv05XTvmKqqDO2HJmv4nj1m/qUGd0ax+AbfMRT+Wg9oAUmr3dLkvafVWSZWrmC2kn7REGQJiWVHtCrAjYjoVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27) by PAWPR07MB9511.eurprd07.prod.outlook.com
 (2603:10a6:102:35d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:34:18 +0000
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e]) by AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:34:18 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH v2 1/3] qemu: make tracetool-generated output reproducible
Date: Tue,  4 Apr 2023 20:34:03 +0200
Message-ID: <20230404183405.14769-1-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0358.eurprd05.prod.outlook.com
 (2603:10a6:7:94::17) To AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3700:EE_|PAWPR07MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: ca073799-cb64-46eb-a7d8-08db353b3352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3fgy03TaSfXqtjf+abMnz/Sm4zvGqm+X+Blv0C9U/VAIZXNNzetpEhxVoPAFOF1X2Mk+78ZNJtm3XKAS6ZRTcTw41s7yqM6LRdAmeZPpCq01rKtqmUuxf2LTOBBRPkqZf5jT4AhAMBlWtzW/yKI6iY7Oaw6OA/s6di/Z8Z0g+TidUMWyYCISK1pR5777erQsDNb5Ed5rtZXW3G/nbaIJcdB0BBMGtXibAVAp7ksTJVHewvC7UX4vL2451FUtGLZ8UXchEHyUAkPM5eeS0Yq3+RjMroEVxb3EzXqONtU60zoRL9kUNrSAhZLbW4Cctu1bQxzg2xbb6j/jaBMWmktEMHy97tNJSAV/f8ajCPv6SRpUmTZYQS8Ce5NJKdDBPPiS5GMBqjDSCmbszTkHiKOhjAQm6+2S+sS1HAjHBNs5+WcFSR27gejiXb3IMyDWakQVG2ByqHAzWROWWcOqFA2agZ38M75bRxhfWK7REvCxuA8adKn9s944WsKMf8S9UA/0+luGwKNgzeqw5vJbu64EEPNrUpf3VhotPAzlf5U6er0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3700.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(36756003)(6486002)(2616005)(4326008)(107886003)(6506007)(6512007)(1076003)(186003)(6916009)(6666004)(8676002)(5660300002)(66476007)(66946007)(8936002)(2906002)(478600001)(316002)(41300700001)(66556008)(82960400001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hv++XZxzDoY7OIAqc7aDnupWr1BhQRWl9h//lIRBOqIlOlYCxpF2nGMjpZ5D?=
 =?us-ascii?Q?1Cjgrq9sUtmn18xb/jzwz/UoeVwYp1LrqBxX7owZz3ZPJbREcP/x8UfK4zhp?=
 =?us-ascii?Q?W+9qGAueIUzc6fJpPlbOO3LF/VbsCrx6xlgWIGSOqKwnual4n9ILjb1BjB1M?=
 =?us-ascii?Q?7KPEb4QHLc70SDzLZltbktagbl7bOMcP+tXdRhqEBf3A9heYxhX7uDsAp8oi?=
 =?us-ascii?Q?14CEbxfuRdt4QYTD5wLi/P/ffaqFUanpgD4K84eSeXAdCxY+ucnXbuLeUvNI?=
 =?us-ascii?Q?C8acB4RBQ+gxyYIcHpB+z/An/MItMqYQs/KuR1cnTEPfudlcZswJoH0VToS2?=
 =?us-ascii?Q?wfzwxlxBTUzxGZgo82XHOJ3sCXaqWHvLN5yjM43d7WpRCU5D1KPYbcK13fJm?=
 =?us-ascii?Q?EaEjx32qbSE7bNm0YWnM3KunLjsMpExlV3k+X5nxM7iE5nqZ/d1A1lB2mz94?=
 =?us-ascii?Q?4+QUcvo7a1YFaf0FhBjbgOodaYaee6MY9OF6cF2Li7q6NueTb/B4+n07xGFr?=
 =?us-ascii?Q?urqBG5x3k1HcVK6YQDdUMIK1CVnb6naANNrqcDIVqH7/2P0u4Y/WG+A0qooB?=
 =?us-ascii?Q?Ab+afHNvytmfnnEsunuULmUHwsniMgwAzScCF8PEFRoSBSCzGpvpVEfknkCq?=
 =?us-ascii?Q?iuai0s15hxre2sDrS0jIz6IBf8somUHvFEFT4gVKMGSuzHm+FdXUncCg1TN8?=
 =?us-ascii?Q?KGypOYhDyZsGXKQxVadS5B4iliOCLSOMxak9+ynv7fvxwp2yTDh58BVLZFca?=
 =?us-ascii?Q?822YEo6+/12J26c9HLBGcmH5BLdZD8eY2cV46O6toMf7vPyt4yrkNkiUKA5d?=
 =?us-ascii?Q?Ft5dlIAYCHHj5uMeeSiZmlw9ol6oMaO+laLXRRHPZ8bpTlq5E9wBgo949opy?=
 =?us-ascii?Q?T/on/V1QXj/Fv2A9odnAZS3WaFv2DjTMVYnTtKlI4SCoXIToBvhAQovOVdxy?=
 =?us-ascii?Q?k62jevo1DJOpLexyi2F+uf1SHEqvAIKoXIMnDkJzQzii0e4VjxC8vJ3od1nC?=
 =?us-ascii?Q?/3r2D00+Ywl5hE95IzPKBF/mIBYsi0ynKJvSXN50pwZsC2nrPPaXSNRZKNHj?=
 =?us-ascii?Q?+dMvLIboZynuz2LjL0DZtImEhKqX/TFqutuo7fwRxYzMN5FOtTEhaH6NfSMq?=
 =?us-ascii?Q?uvcBa6gaxjqK+cKId67D9XWK/5HM/DR/R5czsCoNEnW1VUzxdFORMiidlmaP?=
 =?us-ascii?Q?XwPlot1bzWOnQWaMK/11BOwBg/wv/DA2PJKLtFgOk8ksMM+y1U8vEJ0r5aHQ?=
 =?us-ascii?Q?n7aZvJq/DomQkBLZ0AxXSS+EVJVB42sLrcAwl5xIEGPWr8enoQmjj8yh/8tg?=
 =?us-ascii?Q?X06MBBINUefC/DUXeAwNkwp38i6HP+DoiCHCgWhyUBQ1+KJQRQ8iwPuH7dRR?=
 =?us-ascii?Q?QqeLnv3dpsY5Kqf5kBb3iJb5sJyoiauRqJW6r7XPk0cxzmkfoHrHyzcF3KRK?=
 =?us-ascii?Q?XG290cnk9EJmPDZcNxGd37rgssn0n9UD7nORWW6Hzh8xwLE1xKqDmIWhUVI+?=
 =?us-ascii?Q?Entk/AIZukqpwZyZz5wCaReh6FSiOh8yqq3OOsegGX5qpZe6Ka4tF1l5ULJm?=
 =?us-ascii?Q?Ffqds8QX0/7FiKutinrubxII61DMaBj0rUlWW5Exd3t2kJG+CH1bXtUvYZgA?=
 =?us-ascii?Q?Im7CJhipIQJfPBZxOEbAQi+5SJ+M4fc32pEl5MSJUJk4jGY6YvhwysNLh7P/?=
 =?us-ascii?Q?yAlMcQ6vG5jyWT/XAkviozG+pEk=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca073799-cb64-46eb-a7d8-08db353b3352
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3700.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:34:18.4826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHYnNGOEze8d9j6tul7ynl1mKBUoDZTy/t6qygjLLEGdPnyBlMjWTNjUWQ4DPFD5clyi7ZSNdpdM0SoGp8maOUDS0UFbp7RpL+7krE3gZs5LFlhdWRSgEi8yOzxKW+eQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 18:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179705

'#line' directives written by qemu's tracetool makes the 'debug' package no=
t
reproducible due to absolute paths. Apply a patch to use a relative path
instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...lative-paths-for-line-preprocessor-d.patch | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-tracetool-use-rela=
tive-paths-for-line-preprocessor-d.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index b41055fe5d..36b2f14638 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.x=
z \
            file://0001-configure-Fix-check-tcg-not-executing-any-tests.pat=
ch \
            file://0001-Revert-linux-user-add-more-compat-ioctl-definitions=
.patch \
            file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mo=
u.patch \
+           file://0001-tracetool-use-relative-paths-for-line-preprocessor-=
d.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-pa=
ths-for-line-preprocessor-d.patch b/meta/recipes-devtools/qemu/qemu/0001-tr=
acetool-use-relative-paths-for-line-preprocessor-d.patch
new file mode 100644
index 0000000000..5ef1184e3c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for=
-line-preprocessor-d.patch
@@ -0,0 +1,87 @@
+From 348ea441db84a211d4fca7ef5544b5cd06a8a872 Mon Sep 17 00:00:00 2001
+From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
+Date: Tue, 4 Apr 2023 15:26:07 +0200
+Subject: [PATCH] tracetool: use relative paths for '#line' preprocessor
+ directives
+
+The event filename is an absolute path. Convert it to a relative path when
+writing '#line' directives, to preserve reproducibility of the generated
+output when different base paths are used.
+
+Upstream-Status: Pending
+
+---
+ scripts/tracetool/backend/ftrace.py | 4 +++-
+ scripts/tracetool/backend/log.py    | 4 +++-
+ scripts/tracetool/backend/syslog.py | 4 +++-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backe=
nd/ftrace.py
+index 5fa30ccc08..baed2ae61c 100644
+--- a/scripts/tracetool/backend/ftrace.py
++++ b/scripts/tracetool/backend/ftrace.py
+@@ -12,6 +12,8 @@
+ __email__      =3D "stefanha@redhat.com"
+=20
+=20
++import os.path
++
+ from tracetool import out
+=20
+=20
+@@ -45,7 +47,7 @@ def generate_h(event, group):
+         args=3Devent.args,
+         event_id=3D"TRACE_" + event.name.upper(),
+         event_lineno=3Devent.lineno,
+-        event_filename=3Devent.filename,
++        event_filename=3Dos.path.relpath(event.filename),
+         fmt=3Devent.fmt.rstrip("\n"),
+         argnames=3Dargnames)
+=20
+diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/=
log.py
+index 17ba1cd90e..de27b7e62e 100644
+--- a/scripts/tracetool/backend/log.py
++++ b/scripts/tracetool/backend/log.py
+@@ -12,6 +12,8 @@
+ __email__      =3D "stefanha@redhat.com"
+=20
+=20
++import os.path
++
+ from tracetool import out
+=20
+=20
+@@ -53,7 +55,7 @@ def generate_h(event, group):
+         '    }',
+         cond=3Dcond,
+         event_lineno=3Devent.lineno,
+-        event_filename=3Devent.filename,
++        event_filename=3Dos.path.relpath(event.filename),
+         name=3Devent.name,
+         fmt=3Devent.fmt.rstrip("\n"),
+         argnames=3Dargnames)
+diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backe=
nd/syslog.py
+index 5a3a00fe31..012970f6cc 100644
+--- a/scripts/tracetool/backend/syslog.py
++++ b/scripts/tracetool/backend/syslog.py
+@@ -12,6 +12,8 @@
+ __email__      =3D "stefanha@redhat.com"
+=20
+=20
++import os.path
++
+ from tracetool import out
+=20
+=20
+@@ -41,7 +43,7 @@ def generate_h(event, group):
+         '    }',
+         cond=3Dcond,
+         event_lineno=3Devent.lineno,
+-        event_filename=3Devent.filename,
++        event_filename=3Dos.path.relpath(event.filename),
+         name=3Devent.name,
+         fmt=3Devent.fmt.rstrip("\n"),
+         argnames=3Dargnames)
+--=20
+2.39.2
+
--=20
2.39.2


