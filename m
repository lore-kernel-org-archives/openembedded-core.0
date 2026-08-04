Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A72C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:09:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.138])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17232.1785852538884747101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=TOfbjpqq;
 spf=pass (domain: topic.nl, ip: 40.107.159.138, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp7kakgbNBFY9U4G7atX7FdPePehaKTkpr149lY3grJtnAvwW1rGZzTqTYg1LfnmVIAeDXl2Ve0gl4ospt37g+Y5IC90TlcjdmqCcb00Be5CEUK0wrEjikrhKzPFbGeRyE3jP16txGAO7ar0EZSDCEnvQG+yell1yXTdjeG1UU+s352E6HBFStctFUTysYdFljfnQiagft464kgJivWdYbJyApcvE3DmdzTT0ii0Qrohjtcb5aNAmwegQapEr9Z1WhgriaGMfmpU0cnPb7AyycTzThv9zhy4ciapxgR2+rhzWf6bpBu/A1mhuu1MhWws7aeOPP5Xjs7RwPfOQO+RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS6OFr7WeoeG3Qc6GTXMIO81C4HCTwFNU+54rXaRsMM=;
 b=ty7GGNF/EKGCmziMd5AfG3CFqHiJomN7Ql61uiSxtEbzTvdpYVE0Afm+SWBxf7PVSdz/SIqBJnovXWAPmxJKVhN/yMGFZgbUjiqm1YOueuryc/Uxf5mnRPeY6HzUpLZ3k0PCjvFKP9T5CfvMnNsNDCnOFwmziGchCWHE75Z+ON/RIj5eH7kxwNP7I8MyeLDNcb2bAxsrtdTj+WR/V4iDlBE/Ae790RLagxvay2LsIE3DRJbBxL3fqB73HaKwiE5rkwNKAXfL2skORJwPZmWHTYscY3jpGQIlMwYfenP1/xacFECK+yUketV8C5X3F+vZUL5d/sPigJM1wvTrtOnBAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS6OFr7WeoeG3Qc6GTXMIO81C4HCTwFNU+54rXaRsMM=;
 b=TOfbjpqqub993CcB0lqWMNXbgBZg4yN8d09qzyC6aJOI5zliAC7egxnfAPuFAoSG8E3fNMKc7SFEVDFmIRQuB4iJIgRFSK6PY1cktmR4oKBAUmB+T2617qCYQbfhMowQk0CmbsWbUMHE2TGVqMsgUJ/9pZkW8JkE7D5gjvyPWJy4Epiz7F0+lmEv44hajmzqM/7MFkHDV55EhcoLLQSmHPSSHLKIWKVzH3g1O2+RoSdEuLxPMUHUVrS6751ebcnMplrPa6sdJbJK0JQ10FdUGJ8yZ2hHwvOlTotnBjURNbsjyuEhUe0DycUsJcWe24uqzQ6DnXNYocKhQPdvMJdR5w==
Received: from AS4P189CA0047.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::19)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 14:08:54 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:659::4) by AS4P189CA0047.outlook.office365.com
 (2603:10a6:20b:659::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 14:08:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:08:53 +0000
Received: from DB6PR07CU003.outbound.protection.outlook.com (40.93.64.89) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 04 Aug 2026 14:08:53 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by AS8PR04MB9096.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:08:51 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 14:08:49 +0000
Message-ID: <08c08476-f920-4a18-b309-0e01a474e8fe@topic.nl>
Date: Tue, 4 Aug 2026 16:08:48 +0200
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: wrynose: Weird error in do_create_recipe_spdx
Organization: Topic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::9) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|AS8PR04MB9096:EE_|AM1PEPF000252DB:EE_|DU2PR04MB8757:EE_
X-MS-Office365-Filtering-Correlation-Id: eb391172-344b-4890-04ca-08def231eac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|56012099006|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 prqXCbaSkZa8+wwkE/6WuIkorHf652Ay2MV02wDMuNXyGQtAiU3cQQ0nVhmc00NhPEicAKQiF6H3K9SwiynHK6l16yXR5NjMpINfZI5JO140qE7GgK+d745PBTcthJmfZ/jS5jjG3h2xVN8CI7P+xwv9gQFaQ8p7/XpbPwPTle3Ds1Ks3awMTMC1+5FbD/G1PRNT8AS0a6hySLMQtBjJV2CF9A/YC61JclVweuEPaFInQOOjpZV5WQHaAD5fpdNQDX5Y5eYA8QJLjRhUSIgpeu4uPh+jVcDrlGyAxOr12XLMG8MUn6c48+1JP0WXV/Df0FG7y2FbLq8NAPuNxik4uYl41EJx8tITnRNhDACFFQkSgaX0nARE7jScUbG2T+e5Rg8tMpQj9ZddG4xfkBEGa0V/wNGxNoQefodzVTdZP4zvxhupJMUY2hOf0yP5a241mns7lZMZgemNIv/3vLd2+N4SbLyaRinLpy9i7GIX3kDBzkwyDUi0YZNRqhrKg5iFFjEENMs5e49Bg5Q1uY+dFKJwr8PrMC0jzUByL0opQRHdTHLSeQ9e9a3a7KKZqGHOjUL9smyVDptvQR6S7Ik4aEU2ywH5yavShZqXMccmOhkSq19WQEz+uC+iWxPvsUKpZO7WK1z6WvyAvSPqxEzD3goGozmn1s5qd4NwgrS2ous=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(56012099006)(10067099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: gk/7Vg01MDE8W5q3AwB/HCXOkFc1sRikegUy3V9RnU5BmauwK01c2jt6bMjsT56YVztdnno0nz6iGsowlI2P3Es0pf/jsp1t36glsifQUBQgkimVlGM0RWlg7Ap1HOxSGtDHIUaL5nlLPfLJ/bSn6jTUka8XuYIDpeUvbNtbs6NjLEpH4yNHSO6j2x9lVTFJiDAdQM/G5jCVNliJlI/+4N3/BWeV+8KL0mwpsZb7Oldt9VHYvYuI9ZXvqrvpXhtETzsaDbk0NRlTYItOvvQaUqfouibnq4KMIjIBBjmNKbDCnGxj8cNAf7jUB8t4ICHHswT0epijmKp5O2x9aA6z/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9096
X-CodeTwo-MessageID: 3567e883-a3a5-4947-b8c7-248a32b38246.20260804140853@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2c99bcd-82e4-43c8-170b-08def231e835
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|35042699022|36860700016|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	e2m7onfiTv5TIbbm3E9F12VZrOygpN9ApFEAhMQMpUziAXh7DoW5qV7f/BhDfhAkX90ipj7fTXXATMMO1V5SSnKTAz4KXlD1s/46lQFOqZaInROQIAHdLFCA+YUP/glpjcnkCLXQ/MKEkkGIjtx3UFPDlSOCpczZhMDFKC6du/h9X9KKonRvz5nEG/2u6KAgMX8lr1I7VecZD7QSuB09+eZY6f18klWfTCMTwXOxhYseGUIiXxmXaXoazTyZQ7M65+qHfcxENNPzBIBpQ7LyoMxeRMrosIl0sdbjliGbSpN3eoyGTKHSK5pgCnzWqMMmgJkfnocA9T71KV5RPYQYp85u6GaJCquYBAE3XzQM5HeNfAramKYVIavv/8REHxqABNAV4Hjr0n5dQG+PxvgPZLdGHJRLTiyb47fZEHKHvTiNqxXicFXrmZWBhr0MC8I89tw6BQyXZTnZd8IAI4VDsbD/k7J3haFCHdYuoOcQJpUtiF8ACpta2Mz+4QHOHSHXqwkzksOUPZHrNyCIY6UBBN0UOb6qj1+n1JRYZlIgvbbsnOPLtvZU4yHwMA/fXJpwT/ijVOA/srRLHomKORegG4yWlJbeHm/54AtELSXZTYzD/8bnVCJa038JKrGYW1hnKtRWyGlD7D0uHsLK5sQ1yg==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(36860700016)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rdc11N/bpTYZJEi7F9wzFgdRMddG1oaFgp9enX9yYEkCgTuyj6KraIdMNXr4qaC6VRVJ49DrQX1+C06IBexzUAi6xAtzO1Mem/L82SyPKKNkZisqV82+AMSp9rl7Rc4eJDOQ06NFfeIszJY8XEJxo50UEwfVY086Kwzt2tBBcLkUhRGzWicDTWxdbwdLUFlCA3i7sHUAWNILklcxg6ST5nUW0AeTBF7YqrUCs3OslbHjcYOOtGIwBDJ8xklky1U6ffgxnu2+jGA3HW7EFifrJJ5cc6atYxReM1uceT2uEm5srik3fJVNGW4FLVhnwV6y4oEUeaCjIh0votBEqRHK+E54PJu7q+0WEv7yqg+lTgAKkdUz/NaDy2/xzunLeF4fwHYI47Fsv40XZC0QZfRFtFxBsESskITPHwmZu6UO0L+ySqYsx+WS3Ml5B9FCbCbv
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:08:53.9450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb391172-344b-4890-04ca-08def231eac9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242764

Taking my first steps in migrating from scarthgap to wrynose. Having=20
done the obvious things like the UNPACKDIR variable, I'm now stuck at=20
this, which appears to happen for each and every recipe it tries to build:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_create_recipe_spdx
ERROR: Error executing a python function in exec_func_python()=20
autogenerated:

The stack trace of python calls that resulted in this exception/failure was=
:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
 =C2=A0 =C2=A0 =C2=A00001:
 =C2=A0*** 0002:do_create_recipe_spdx(d)
 =C2=A0 =C2=A0 =C2=A00003:
File: '/.../oe-core/meta/classes/create-spdx-3.0.bbclass', lineno: 193,=20
function: do_create_recipe_spdx
 =C2=A0 =C2=A0 =C2=A00189:=C2=A0 =C2=A0 "
 =C2=A0 =C2=A0 =C2=A00190:
 =C2=A0 =C2=A0 =C2=A00191:python do_create_recipe_spdx() {
 =C2=A0 =C2=A0 =C2=A00192:=C2=A0 =C2=A0 import oe.spdx30_tasks
 =C2=A0*** 0193:=C2=A0 =C2=A0 oe.spdx30_tasks.create_recipe_spdx(d)
 =C2=A0 =C2=A0 =C2=A00194:}
 =C2=A0 =C2=A0 =C2=A00195:addtask do_create_recipe_spdx
 =C2=A0 =C2=A0 =C2=A00196:
 =C2=A0 =C2=A0 =C2=A00197:SSTATETASKS +=3D "do_create_recipe_spdx"
File: '/.../oe-core/meta/lib/oe/spdx30_tasks.py', lineno: 675, function:=20
create_recipe_spdx
 =C2=A0 =C2=A0 =C2=A00671:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 identifier=3Dcpe_id,
 =C2=A0 =C2=A0 =C2=A00672:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
 =C2=A0 =C2=A0 =C2=A00673:=C2=A0 =C2=A0 =C2=A0 =C2=A0 )
 =C2=A0 =C2=A0 =C2=A00674:
 =C2=A0*** 0675:=C2=A0 =C2=A0 direct_deps =3D oe.spdx_common.collect_direct=
_deps(d,=20
"do_create_recipe_spdx")
 =C2=A0 =C2=A0 =C2=A00676:
 =C2=A0 =C2=A0 =C2=A00677:=C2=A0 =C2=A0 dep_objsets, dep_recipes =3D collec=
t_dep_objsets(
 =C2=A0 =C2=A0 =C2=A00678:=C2=A0 =C2=A0 =C2=A0 =C2=A0 d, direct_deps, "stat=
ic", "static-",=20
oe.spdx30.software_Package
 =C2=A0 =C2=A0 =C2=A00679:=C2=A0 =C2=A0 )
File: '/.../oe-core/meta/lib/oe/spdx_common.py', lineno: 127, function:=20
collect_direct_deps
 =C2=A0 =C2=A0 =C2=A00123:=C2=A0 =C2=A0 for dep_name in this_dep.deps:
 =C2=A0 =C2=A0 =C2=A00124:=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_data =3D taskdepd=
ata[dep_name]
 =C2=A0 =C2=A0 =C2=A00125:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep_data.taskname =
=3D=3D dep_task and dep_data.pn !=3D pn:
 =C2=A0 =C2=A0 =C2=A00126:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.ad=
d(
 =C2=A0*** 0127:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Dep=
(dep_data.pn, dep_data.hashfn, dep_name in=20
this_dep.taskhash_deps)
 =C2=A0 =C2=A0 =C2=A00128:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )
 =C2=A0 =C2=A0 =C2=A00129:
 =C2=A0 =C2=A0 =C2=A00130:=C2=A0 =C2=A0 return sorted(deps)
 =C2=A0 =C2=A0 =C2=A00131:
Exception: TypeError: argument of type 'NoneType' is not iterable

DEBUG: Python function do_create_recipe_spdx finished

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




