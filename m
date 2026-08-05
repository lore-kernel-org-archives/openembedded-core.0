Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A9AC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 05:58:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34211.1785909477578304089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 22:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=vKb1LYr4;
 spf=pass (domain: topic.nl, ip: 52.101.84.112, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wzk98FjbsEPujnkDsPLIYbqpz8nEasEcISsKOsDqEWvoie8yKP1fuSjqJWUzWO8nWXb2OQkhaq64Ys5ypkOevOhOP3Nb14ecfN/+m+zBfmhesw6LtUcIyAWS449yXg7rswOlIsQBg4BXydXczTr+jMzNNOwL3Z80NTKOKgwPmo8BrRe2KnytzhUWt8EhOrzwAM1oEh6IASvCRA1X2vMbKIVxXvO+n+f6FN7kJRSqAH4xUeejwu3obOXSfYJqNAZUTXm90iftAzpiWYMJhp8j8Yf6x2FG1IZVKMGpCt3rSYiS0D5jliGfBzGW1MMW4L/KuAhnP5y1G2Eitea5duCmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRFzMDVuNe/g4RgZjoH/TIhSGSsra3uNXcwPXv/CED0=;
 b=c4I8BuEOltj9jZ0z21y4yZOk57ZqYNYbr5WgOb5NzV8S1OxQIJPF6lwFIM9F0Tbe6Gdlrawwm3pILEgsvgt4X2mWEdFk4TLewMP+zcqyCB4hvprnffhoLco8GIy0dLIeG62nhQsdEpvK3kO9+MLKiIS5IjcTDt+5ilgS9lT6byQlp4ON9+P54cEtNWo0Y+KvyLPoTkA38WyJHxXznHj+agKbOhWPDz0NRCG29SQBr0TOfXIcqMofL6UHLyI74VDSd2CZebRCPUIdolLYutoy+TdI+JFhkdeCHPfii1x/BvOui8XjGraNvDxfVaG7Uc0ENKZ4ASLKcXU2MfzG+XhOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRFzMDVuNe/g4RgZjoH/TIhSGSsra3uNXcwPXv/CED0=;
 b=vKb1LYr43FhG4uk1233G8HTrQ+gjG7aryFyQ9RZfUe+0ILqEQfJNYbIk2uYqUFaXz7TdS82yiuKzDCNQtjWWyAojVp/e20XryU+HbPBIfQhjxUrUJDX3BbmNAB3UQoR03puwF656Hxoq5EMMDTODIQpLHgkGmST4dHtFgRal5SJ1a0f6Olx6itPmGkrSveK198Bmhk4cfbU/zryX9UjjJjG2mnAaygwOyWshmoFLf2wFJrBUMbvGgYit7sPhRJl8xgB9dymHtwDHT44bMmANMdTnmqOUo6nzv+4qn1HTwXiSCPm3+zZ+Z7TzXmx94462Dfo5kTBAQB+HsCUt/DVPTA==
Received: from AS9PR06CA0309.eurprd06.prod.outlook.com (2603:10a6:20b:45b::11)
 by PA1PR04MB11429.eurprd04.prod.outlook.com (2603:10a6:102:4f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 05:57:52 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:45b:cafe::38) by AS9PR06CA0309.outlook.office365.com
 (2603:10a6:20b:45b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.19 via Frontend Transport; Wed, 5
 Aug 2026 05:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 05:57:51 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.91) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Aug 2026 05:57:50 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by MRWPR04MB12329.eurprd04.prod.outlook.com
 (2603:10a6:501:86::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 05:57:47 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 05:57:47 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
CC: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] spdx_common.py: Avoid crash when this_dep.taskhash_deps is None
Date: Wed, 5 Aug 2026 07:57:39 +0200
Message-ID: <20260805055739.2325838-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::12) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|MRWPR04MB12329:EE_|AMS0EPF00000198:EE_|PA1PR04MB11429:EE_
X-MS-Office365-Filtering-Correlation-Id: 173a177f-d6ab-4c34-f694-08def2b67c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|56012099006|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 TYrrt/HD1ehPPdzhnR/9JRp3YGlpbzTLMKB7FfPS3odGp+I7A149Z6G/olzGsriSJxmwLEba2axZdGdt1EfasjcttRXSz4QfWyhqpwnT4zJ8IZKmwIELpI1e3ZZyOPJOCZUwkmppF7bb4LvNzr/oehwTa1fV6gynB4j6c6Ke8nGDeQNwRfiqhLWaA8O1ASCpe3SWWVW1uAT8LTcqVq+KuOCulp/0iPL8DJW0Q9V3ORaHpGFZr0xf42emAka/x5xDK/fFFfFX4+/UAfOt8GgJBeUNqtSaQXH77VUHZ3ae9wCDIfd3j+k2+geKmMu2rYaU7jXs/aHXcEH0xI6sWpZHKEnPN3wVwUQXz5CIkWanV/Oe6W8KCw/NvklB+hoLQnCgCwld8ccLBpiomvRjMXdTQofc75NvKGBLhZDt4GqTRjFmm1oEvDTD2nHkTYQ8tbOnKFrtXA7qOaH4lj2SaUBnv0pMSXtEmeApEhHRyG5DJPm/n8Ne7A2JJe/UqFFYnv7VXt/Gf+imwDtlNGF4HvxK3wl7nQE06Zvc5ZjQMDr8aaZKC13Huko4GskLiolILELnIgpbYBg3xP0J8GQKe0Mt4a2NxyfYG7nvsOMFLJQHgy0/92eG2chegAMWM0eT7A4q3XCyhEnE7cvyfFW72BdcLkSb1fH7oM5c//MOr7ggr3NpgBBBDRYNOhonmFwZNVX8z8JrjPlTe5AXpPyaprG4xg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(56012099006)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: enJI0ThVoEr3/EH604aflfVc69zDQL5el1989O7g/awvdTk70OKJw8TsklcRSbGiT/kKAJjZn/IVXdlalJXf52d1Mgv6W8BFluehBwqg6IlyTLQ9ufMRE2eS35bAsyeU3S2EkDVreTOXeZxfpHXQF2Q67bQfBjBLAbrfIM3DzVLfs7SBTIG2G27RpHvF+Xr5lEx7D/vfA7Yl7CY3unDWL7EpRYj9Quw2kU67o2Lc1K+9RlZfn5NN2meLO6fOF9Y48F1RUxTysa2KaUwaNWAKjFo6UfnKNrc6t80ekLFTxWGnxfDjkgHhn36WNyAukbDN+/kBNMAf8s34Iu6iMqCx+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12329
X-CodeTwo-MessageID: 1342b691-d514-486d-b7b8-360a71fda198.20260805055750@westeu11-emailsignatures-cloud.codetwo.com
References: 
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6c801780-b022-4077-b66c-8acff05549a1@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2fd46aea-f9d1-40ec-60db-08def2b679c3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|35042699022|14060799003|36860700016|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qziOxUMKIKyGJoNWACwT0oXxYP4Tk4Pc1HwTJfZXYSDWgAg0pVSWJyQzc8z/oWx7WhzxY8rTn4hVInnyppSf0pt6mFWa2MweuVPBqg5NYeO6hmH4KqDWdblbYNEV+XSH0OwtfJ+qmKDGtLTF66/76ljhYkO58Myst5VMvAO86MBmtfPHKIMRamirhmewGKPwq86ExvnPxwGGrRrbV5CE4t9UL4i4vZbJ3Cp834pm0k2wMS6PxVCd6OEO5O4tUjmPZu6WY49PTRzm2W6fmuajGpTZdKFgkSHMHOeJexqnRs2dfnEhpT7ETkZ+Mye03UdExI+XYBDkToRMJAQgGorjHzFuotpLTlqL7X5z2C4mMY5WU0+0DBa0zuziBLb3y4m/8G7AtQwbAip7VZE04h8wBHBnRLxdY4r9XuALhQFeaS4MdnY35feX8p7Ps//rKWXxPIBqfsmKWDyUDjh65pHCBLnf5zvGk0e1faOnYfuszwblRHqf6975K5SR0pejZvoKtpUTtJ/sVX1LZ24cNiFD5WEHKwTnGz/uOd+pjtFFfbwysSSmc0QPQftLCxH+NLLvVB6pj+Fh2o29RzcdYN+uMogxkI2TuZIESbTUz9brqkpsnoTMvtSFpN2kWLmmfUYwBY+Q+s10aSQHtbUd1ya1Zg==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700016)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Smj3tAYPNSyls5/TFz5rGh+IwF5KSuhKBzM4Kd8H19CqFidasrZjBWJC8uMJhqxzQQ5QaPvdFEvSuFAD7QlJ4puJYL9qTHv1hZ7+1IhIHssRXE6jnKgqp1xWXEnfw+jNlK8h1JePT1oRh6/ga2QfcHvvr575IwR3QzjdMnTaF7+OwNkaigOUXYBnicM+UovfO3oO9CDGhOOPEc/wKK9k5mxpaFXNqnXg2H37G7mC7yO4l1en+mia9CN5ShzxcU4ETdKh/NfKq1ySlFM1iCIcxdjXcHSLygxcVqbj0hhaGQ9Tecmgjm/wxRPZXqMZwWHRVT8xsHWIL2asuyyyptp8g5HN4amRRhdCoASXAe4fZ9wYIQL4OAgyOm8UwG6GYZ8tiYY23HHR8kEEV/zh3DFr+gXvwAJ7nOJsgGlbsyCQvpg9JE0Z/4QCyX7O+eZZ4UE+
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 05:57:51.3625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173a177f-d6ab-4c34-f694-08def2b67c20
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11429
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 05:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242823

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

