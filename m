Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D604C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:14:03 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.132])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35634.1785917642604111836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=c63/t/4P;
 spf=pass (domain: topic.nl, ip: 52.101.69.132, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9f2r8KGKYs5VHUgngUgXLF3ULqQ1n54p/0myIc8huhl0RS+O+z/UaaKEAWpymOl02zZQUZWDsSjrYcpUroNFyicDMdJWn5AnLAf+ETAppgrcMR44XUAzxCAsCmawpYyvWsYILjG5dz3e+thc2xoie8sRPQne9S9WHvwvjgqUsYK0AwqPOBpxg9Vc43XRcZPz+mk/6ThjBMsoS8WlRU1ca2ZfNUA06kmsBSrk2OYmHnEEOSYXfG0GiTKeenTs7oJuLkoiZ1Aog39qlcrowKcL6L/58sqz08IIsd/OzClxS0I9+hFshDpBmgKpcO+/qWtX/Wr1jDgdVFITovX1OipPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNiE9k32LOsSwXTZbi0QLESnh2wIdi/Dj0c3QjiYd8k=;
 b=KAtksEnPzMcEPCIEg8kLGGKswVRVJhKEABfaMjkZYCzCA9yAPnWeovwd7ky6bDMeLiWSIpM9cjIfToU2zN+FN2o/IefO2C/2r5HP5HEXFYV8+oruZpWF6takKWjrUjnUhBBuGjs+udLiCUYmKhzC6cd9ZaXhu9L50iDkq0UhCovIV5R01PSdK9MLybX8BDrjjFYt0IOIAHL0I6ClyZIBxA655KaryONQSvZFPfkpiVVQRGUa4MoaSqTK6B+Wx6zwF3Mk8XtBJyqlg6V7Wpp6AVa+cXrKZRSZhZVQ/G8XuML175Hmko0eciUSIVlO8oIbG/TdF7nGLBfInfEb2ZV6Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNiE9k32LOsSwXTZbi0QLESnh2wIdi/Dj0c3QjiYd8k=;
 b=c63/t/4PYbkJ96wkh5JQqK9I1jK8XkNgEAuvpaIaGwXtQ/85PZofD2TeuFext+TxryIqvAzKmRxAOWX8eYQwIsLhtjlA5BinAxzmj9Rl+4XYpu2RXK9UXBVT6kF8/qTA/+XyOINJ6zyS07OdMOEIZ3T/80O3pMaZYO8trF74+GHiFNDHAbqtoxIV6ncRj2vZWjRgjCT20l0JZ1whvaCUPpmjXYyqiaM75odpbMTjDRKLj9Oc2uypxSShfLQ6QxsqhtT5h4+I1fOT5gkmSpkHcwKLCzs8WswR7CidRJ1D5FrV1i9JNqdWJ52TD3pT7VWx7xTSfMWxVAYigSFe56J/Lw==
Received: from AS4P189CA0069.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::7)
 by GV4PR04MB11969.eurprd04.prod.outlook.com (2603:10a6:150:2e7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 08:13:54 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::43) by AS4P189CA0069.outlook.office365.com
 (2603:10a6:20b:659::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 08:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 08:13:53 +0000
Received: from DB3PR08CU002.outbound.protection.outlook.com (40.93.64.80) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Aug 2026 08:13:53 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by MI3PR04MB12683.eurprd04.prod.outlook.com
 (2603:10a6:290:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 08:13:50 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 08:13:50 +0000
Message-ID: <584c968e-aeee-457e-95b5-34513f15382d@topic.nl>
Date: Wed, 5 Aug 2026 10:13:50 +0200
User-Agent: Mozilla Thunderbird
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Fail to compile zlib for 32-bit ARM
Organization: TOPIC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0168.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::35) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|MI3PR04MB12683:EE_|AMS1EPF00000093:EE_|GV4PR04MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b6a170-6669-4533-5206-08def2c97d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 
 RNqyK0LEHiM/dHE1FVIgS1U8V6hhFM+yypjUcwOkd07C9x3nV2UFYAqCpkIffHKr1jLiDouZx24C9XU+HQ673bTzAcn2piDmSiGKxnblZuR4jqGZQrimCUCdI8oR0SpasyYU0Y5AlsOaP+yVn/JanTxVCsuSAzuS0gopg6bqS13QAJ0mc/lEdh+jvriS78wwp5SySUTfQpHrz2huhzHWXGXC522HdC+7q4UoHNqBKKV3DCxzA6ZWRGdmfM1WZrUIJEyTKJSn3u6DXtvDUHG3h4R+ULaIXIlLuA6WJKqHIPx8Hup+LX5WTu/2ApH+IKIt+bTd3YvHerUcjdHIhljkGyC+v6jlBb9zEEKrdtMjKFpJnOC8Sz3qn3RiQPd1mngYxxNYCtYU4JHaXbUrWn5EZiaN8s5ZNIyYoVVWo87/dRLxkCRnaaDxOTJ3TRJZRSnmQ1VPuMCgxPixaJIKZ6gMK18P7pIVDSmXk8BcHpErmvxeActXZEUybdcecH192w0P2QtabR4nBN3Zuj9sDy4ECu8GVRlrGU7Q1WeiatL5Cc0Ob8Ic3Yb1CsTlAxo2vGSw9doonmPd7G2FdWsN1ls5RslnI2gT0uK9k5s8yt1kS28=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: jhN5RqRktMDOdah0M8bblBHNhLN0Aq4BpOEybXjZ/aUXc6y2wVHzU/f9JmAcB0m0ed0WxDIC0qWnsTPzb9Mavc0mLB2FI3EV0hYHG+yoKmZql+GiZHi+iWSCpo2F7ZDkVcueWE3J7svk66syEa5nIQyqf2EaKn71VHnCcSjQIipTaXrS5PPvO0b1Nr/GvNQ/KO7Xs5B7aodcYCxuXBCXfSj0nkGXtGnfHR3PQvlezDYZlbmXeT14GdeLityOXgo/zSz3B68e+5pU41087u9lNTy/rmAb2Pfd7RMbe6tIpG6QhoZsbrTctqo3PS1KtfwuhHaNEwffYYfpbLLlzuyVSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12683
X-CodeTwo-MessageID: 38b9bde5-97fe-4a88-b0f7-33a95c037c65.20260805081352@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	23c6c968-25fa-4346-7bd6-08def2c97b7b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|23010399003|14060799003|376014|82310400026|1800799024|13003099007|10067099003|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	5GdPh6p9GkyEjPl+XxPGiuneJYJiH/1mbraQ1hI5l49EZAei10ji48INPQgCXedOho4rPgdZQ5044x3NVXLfUSGH9IJZgS6Qu4OgmWhGa7/HYbEar8gZZISB6c1Jw403InNa+z4COrz8aDCG/5m30sZAFM5SrzXHOGRAanOIgRiN+hDTFZ/oSQcV2s4CKum11XiJEev7sJ92uQMPH1Y1naoLWxvNojUcYtEVqQMv8aFOxjxcXbmlKZtI4zLUwRAmNk7sQmijY5U55KVwzHiQ6SpYnkQogfvuNVnrSckdcvGH9mm6pL06OZbZZvoma6K92ISPq72ia6EEImagxU0JdaoEKW2tFDs3cCiQkyNnT4ac0lLt2oq0KiExpKa/yJSC3KCo69GGd7oo2h9oT7Ni4yWu4gBGqRzFM6eQ5ShvyKujH6VKM1pnKpCIDS1s9+qVc3FMlyEfEfoX0euEUqTe1oL1ClQLG3f/OIxglUvQoaGhtJdLzGGAQ+6mdK/BwhbDrfaVQPmBcXrddZLIQjCVHoY3P7YMWt/NPtlYmgte1P8t+zp8wj68DSeXqqv2+9AdlZ1yY4NdK7HV2cxgAaG8atNsMLA+fbQxyqdZ/3AqtcScO7BXqX9wUAiPJ9szndv+n/Sx9mwJIb1HTyKf8vieQw==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(23010399003)(14060799003)(376014)(82310400026)(1800799024)(13003099007)(10067099003)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RGG/xGanwtFMS4M8qGbONLEYb7WxEMUgHLBbeb9QwE6S9kYX6rKKqCqJqajW3dTXarCRo/Z3p0qdsEuxDQlqFtx7tAI/n/roq98PztOqQerrSyIx0HxPHR2FjnhlZmuo1gjZxa0oazKJHyo7dhp19l2hsApIuMfbw9aZOY/0M8+U1heUi3BEHKgBJJfWOenC5HqQn4Z+RldFUGRMXsMAzaAhsKg1t4fT8J8DYck+LQ9SNkzvcPUpnzScJ0PBU4coIMjx+jdTmkwrITIjYBsRgq6TumgA66DxfGJC3zQKnshZ538/NdCUdBJKUMIxuLpwuNIOKqnLMbha/gCyk17dvQrlzFG20Jh/SgCMQ3Nz0ZuoW7LJsRD68Di6Tfl5GBpVaYzjQFFKJzVxg8vC+QNg7nhgzrbHZD0F/szCx6FD2GHBvjl37NkHrVUa6pu3aExF
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 08:13:53.4630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6a170-6669-4533-5206-08def2c97d1e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11969
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242837

Using current OE wrynose branch on Ubuntu 22 LTS.

Everything appears fine until it gets to compiling "gzip", which fails with=
=20
the cryptic error trace below. Searching leads me to this page which has=20
almost identical output (apart from the version), but there's apparently no=
=20
navigation from there to whatever the solution must have been:

https://errors.yoctoproject.org/Errors/Details/852396/

I suspect the real issue is that somehow the ARM compiler dislikes whatever=
=20
gzit is feeding it. However, it's such a common embedded platform that I ca=
n't=20
imagine that I'd be the only one in the world to bump against this.

The error I get now is:

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are=20
['/.../oe-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot',=
=20
'/.../oe-core/meta/recipes-devtools/gcc/gcc-cross_15.3.bb:do_populate_sysro=
ot',=20
'/.../oe-core/meta/recipes-devtools/gcc/gcc-runtime_15.3.bb:do_populate_sys=
root',=20
'/.../oe-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_=
sysroot',=20
'virtual:native:/.../oe-core/meta/recipes-devtools/patch/patch_2.8.bb:do_po=
pulate_sysroot',=20
'virtual:native:/.../oe-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_=
populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native',=20
'glibc', 'binutils-cross-arm', 'gcc-cross-arm', 'gcc-runtime', 'libgcc',=20
'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native',=20
'linux-libc-headers', 'zlib-native', 'flex-native', 'gnu-config-native',=20
'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native',=
=20
'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_configure
Compiler error reporting is too harsh for=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources/z=
lib-1.3.2/configure=20
(perhaps remove -Werror).
**=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources/z=
lib-1.3.2/configure=20
aborting.
WARNING:=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/run.=
do_configure.817951:133=20
exit 1 from 'LDCONFIG=3Dtrue=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources/z=
lib-1.3.2/configure=20
--prefix=3D/usr --shared --libdir=3D/usr/lib --uname=3DGNU'
WARNING: Backtrace (BB generated script):
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #1: do_configure,=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/run.=
do_configure.817951,=20
line 133
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #2: main,=20
/.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/run.=
do_configure.817951,=20
line 137
~


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



