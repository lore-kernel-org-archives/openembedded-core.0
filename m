Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C34CC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 06:43:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34601.1785912183032937527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 23:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=jk2q791O;
 spf=pass (domain: topic.nl, ip: 40.107.130.81, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmQ6L/rk7YZj7/O11wTObglYGNURYSRt6+OP9JmEyM4WzHPYd37C1vxA86r74z70UsI9pQGWvxVImLlX+VU6wPxy9p3PYw1RldvOWg+vXrppn5F1JKkQMImYYWWsnWcQb38jNg+bD58s6+gDXo24+XDmXiweqey4ZANhiTD2q0yq1lTFhdQ2XUIf9XcSveP/6HR/4KFkKdrKyvPx8e7l8uJ9UkvBHZXaW332Qwb2vAhKIHvTsG8CemSkzc22joX/uLBjbcxi47m9cURAcrvedJ6PqhWIvh82hwgS0/l0kTJLteMutt8t9TQ/yLbxs/l1Hb3cwkxcWv0UOFDHWQPgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBRqcxUyWlIp2p2IjvxKYjTYPbv3VYTPS0qci/gNVjQ=;
 b=jUVciTydeDWQ7kLn0vcwoHqMt5Uede3gKB7odQT4xP6HdfiIuCL3caloCsjfD9mexGW8CMWmrizUXPaCbHD5nLYZ3Ld0PvTC2VRrZ/jpOUlf7i0YPEz5Hyb11X/SPnh8QA4jA6ULpKm27+Se24DMwWjWoL1vFFifjXc64DKRSIUKXgBg4hud/x0JSWLgtKDGyEwACYScG36fYy1mrmIehxq52FadN7qGjCc+34k92S88Ccrp5EuQqQG6wbLc10XMwLMyABws9TbdrVfcWo/WF5QEY00zBxdjtyGhCT4O9pGbDwxc+p6H5Q99Dj8BHRj6613imjjp03SZ2AFDpScqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBRqcxUyWlIp2p2IjvxKYjTYPbv3VYTPS0qci/gNVjQ=;
 b=jk2q791OMpMGZvQU83O/wvHxAXkT4brADLEk1k1sYsvU8SqitBTTcV6IujysExUwqLS24Z6wCWT+tWZ2jdCPrqxpXXJRuWuSaGTgR1UDXdrygw+fQGs0+IG1t5LfVhWJH252LfitD8I2dcX01KJAdkv9lm0ljYcPa1T4ep6SjhVyAN8EUyehly4oQ1gyu1GPC737U7aCLMayJebUtiE1eioyCC0ifEv2OBt5e15ofV9c/0ult/WRiANNGXTDJCSEqCJ+jVYAtkZ+iYJhPJApG76gtgDrXpe76UBia6yTkZMO+1HMHJaoVZk9SGEjqJXJtGba+EuJFtAuUfSRK6/EUA==
Received: from DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) by PA1PR04MB11432.eurprd04.prod.outlook.com
 (2603:10a6:102:4f7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 06:42:57 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::50) by DUZPR01CA0139.outlook.office365.com
 (2603:10a6:10:4bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 06:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 06:42:56 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.99) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Aug 2026 06:42:55 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by FRRPR04MB12619.eurprd04.prod.outlook.com
 (2603:10a6:d10:1d1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 06:42:54 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 06:42:54 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v2] spdx_common.py: Avoid crash when this_dep.taskhash_deps is None
Date: Wed, 5 Aug 2026 08:42:39 +0200
Message-ID: <20260805064239.3111725-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::35) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|FRRPR04MB12619:EE_|DB5PEPF00014B96:EE_|PA1PR04MB11432:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b56d2c-fb07-4deb-8304-08def2bcc89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 8zEvFNC+aIeKSeK++w4WjZc+RF1ijr7IugIsUAv5ncJFDZOwxRKtdTPDLnMU9VHIgXnwLPbNsuwuI3QMyL+fqoT7Dr5xw04x5uNIAQunLsimJK54jn3LZjjj19X6SShOXB/mjNRv5JqOEx/c9IqN/E/BlmDc8vqc2MFrkTQsn1mvsGXl3e9m/5thGhQ3KquSVnQP1TTyqUs2ONgg1yUJY1QGxNIQWUgJOG44K7Wa1bLB1F61Rki9dpn5wX7Iuury8QvJ509BUUbPX1WL+qruX4X/49BJc2F7HkbBqb9oo+1UfgswIECyWLwz7vtXcmTs3+vBiVX1vq1UcMTgMti8wJlj8Ewzp/fzuPBnfVzbgAcp7AQMUuoi9mq/jP3MGOUE6zuelT41+r/BbR5hONgpJJyCSbSMGl/MPloMJC+XzkKxwvKJ3gV+PfMkI2X+KP03L6j8/vW7EaiKR7SZ5yAaU8ZuWbGmcBe4Hf6kQTpeHZ96vBErmdUdQW5quEX6Unlj9Cr/ySxw0bUEulBz/4EkTGZHhZPK1g2E9fFNouC0uBYwmrf1Loh6V3kIoTfyJu1dLz8BXe87yGS6gfjLPUBbD8cIQiIe48ByAvLFYQT8ssDf61tA0AneTeV0sCF9in5OOQlr51fD+GyoPvXfLTAYWSia2VDbQlIkxKWiBkq0vV7QQG58UhD5/D2Z1dNlKb1u+T2xGoXNQYNukfp0/kcAuQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: TytpJMwwG+Wj2LbdctyNXvig+GpKtRnmApKezasf7cB8G4EVWcyCpJSabq+kO1ycZ8iD2LoFI75ISonPi4t8swqKL9b5KOTMtNMoC4cKI0dCHGh+7AeEcfQ79A5L7P/XfDznTSQWDjAasBCbc3xHX+YPizYhCEftRr9uWVb8+vuVyYbdK3zAUj/3KoTCcafGtNqWj67+vKPhPxfSQC815diYcQdYQfAZDkxTvYdVk2B9nFj6p/z+lxbTntemPrCVyEmi/OD14WXioourXqaiHMIYYgPY7ouhF3m52Hn7SfzJ89oIC3CtmuisYbLOF1TLTfLMfAkvMCvul3lB3SVXJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12619
X-CodeTwo-MessageID: ec82c275-318b-4163-be18-68b54b232ff6.20260805064255@westeu11-emailsignatures-cloud.codetwo.com
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.a0496a1c-b05b-48c5-bb27-609c26e2367d@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cef88095-fae7-48a0-9465-08def2bcc730
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|14060799003|35042699022|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Duj76TnZyRDhwFp7Pdz1o4Ih+ckHx4s4JeBjw10deJihgNP0rLO80MpL3nvjdGsS43nKDw5AJHq68rmZZOxkNEv0HgerVBP6bnqd6x9TIl+yZpmNQTJUbAMRXH0Ibbid7XqVIkGxQrbr8pzIm0Qg/UWuyzifUitG3Fbgzq72BSYeo3h8UPZ4RnBV17Nftv9tp5Ztpp6NMAX3eCs0dt6EWfNFqU08+bcaiKwJAOg4cfV68sjH1j7Xk4toLr39mGZcDchq8FyI8m1Bwi+hWW7OZVYRiaJRswKE51K+MkKFIoP5v90upjvn4+zoIKWyQRip/aCtU6XDkkekWaK4R0LvyqPyacN1MgyZ6O7wEuG9PulTgBOKwj96/+R4ZbWQ2BqB8sD0h4vT6eJBd2OnS5/0hSA0HMBM3Ip8IalJ238/dUYqrdDgEoFicHL3io3cLicBpS1gBdVOXp3MODgNZssTq91p2KVqb5WsbVgS0uzx7tAZ93U4zW2tNnEUHoJOXo20bttAjKdbrUMcId3FgF1kMN0cya4ADRnoYc+ZIv10OaJ834mCsdFbBNmSbNg3XCXQ5ttVI8jZHR8Le07QOBVF93YrhRV0/x9TfaXz/nccA0g4NmQSUZajc7+9Z7YtHKyyTL3ipJHVUM650QhqHD0DOg==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(14060799003)(35042699022)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aO/tDvdM81EhCo2hDW0Tap+GWVc/5Xxno5migVheEgD0P9WeYsmvO8b6oNr+h25NraUTQksQRklz0TwopJAzvP5oqWYcQt5wLszTfRVADvt1fkT+CsCHY3mGmGK3qMIcoL5q/m+Myj2FkgOQeYrsK460XvHZSdg9F6wkEUt6jcczusLOHONsUHLi+4otRPuORo0dKb3pOaUqH1DcXEGMJpNfRrhkc+y5dgnKjyATBGYd8V1LIAAc8Q3CnQ63ai2Hyy+o3BEv2wvPN8qh2U4t8pm6o01Gg45Hv9kIgN12L2qOXpZLfcgmaX+8GF/CVt/CbKU2q5D5LfbonCJ+q2WQsDgwYWvZQwyu6sCUdK7XpFJrAJ3Ld8cIRgnFmgcv/hn8dwGv6VUQqL5xi79vDU0kvTMEXlljOBAVllGUm7vqAFH+IupGZnrKi8wHvTRi/tEW
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 06:42:56.6483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b56d2c-fb07-4deb-8304-08def2bcc89f
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 06:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242825

Apparently this_dep.taskhash_deps can be None in some cases, which
results in the stacktrace below. Add a check to avoid this.

Solves:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_create_recipe_spdx
ERROR: Error executing a python function in exec_func_python() autogenerate=
d:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_create_recipe_spdx(d)
     0003:
File: '/.../oe-core/meta/classes/create-spdx-3.0.bbclass', lineno: 193, fun=
ction: do_create_recipe_spdx
     0189:    "
     0190:
     0191:python do_create_recipe_spdx() {
     0192:    import oe.spdx30_tasks
 *** 0193:    oe.spdx30_tasks.create_recipe_spdx(d)
     0194:}
     0195:addtask do_create_recipe_spdx
     0196:
     0197:SSTATETASKS +=3D "do_create_recipe_spdx"
File: '/.../oe-core/meta/lib/oe/spdx30_tasks.py', lineno: 675, function: cr=
eate_recipe_spdx
     0671:                identifier=3Dcpe_id,
     0672:            )
     0673:        )
     0674:
 *** 0675:    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_cre=
ate_recipe_spdx")
     0676:
     0677:    dep_objsets, dep_recipes =3D collect_dep_objsets(
     0678:        d, direct_deps, "static", "static-", oe.spdx30.software_P=
ackage
     0679:    )
File: '/.../oe-core/meta/lib/oe/spdx_common.py', lineno: 127, function: col=
lect_direct_deps
     0123:    for dep_name in this_dep.deps:
     0124:        dep_data =3D taskdepdata[dep_name]
     0125:        if dep_data.taskname =3D=3D dep_task and dep_data.pn !=3D=
 pn:
     0126:            deps.add(
 *** 0127:                Dep(dep_data.pn, dep_data.hashfn, dep_name in thi=
s_dep.taskhash_deps)
     0128:            )
     0129:
     0130:    return sorted(deps)
     0131:
Exception: TypeError: argument of type 'NoneType' is not iterable

DEBUG: Python function do_create_recipe_spdx finished

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/lib/oe/spdx_common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 6b1a409c40..d09f749d0e 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -124,7 +124,7 @@ def collect_direct_deps(d, dep_task):
         dep_data =3D taskdepdata[dep_name]
         if dep_data.taskname =3D=3D dep_task and dep_data.pn !=3D pn:
             deps.add(
-                Dep(dep_data.pn, dep_data.hashfn, dep_name in this_dep.tas=
khash_deps)
+                Dep(dep_data.pn, dep_data.hashfn, this_dep.taskhash_deps a=
nd (p_name in this_dep.taskhash_deps))
             )
=20
     return sorted(deps)
--=20
2.34.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

