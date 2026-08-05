Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97DDC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:21:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36567.1785921694192141195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=jwuzerkQ;
 spf=pass (domain: topic.nl, ip: 40.107.159.73, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csJWakLf0GKfZOOJK4P2mEf0PFN1QO+mL2UlUPqvRA9j/GSSK7ixmQI5pUmHSJw2Fe/opcGpXG+h4vdu7uOh+gtvJHqhZcqqnN/u/d6LVOZRKoX/Bvq+Gfy7s0V7UgCLBNRmXQ73AYywPmxD85HwuBbVetlq9Z9uC7haT9UuudiSdha2Y6fxaPy88SZy0nsSkf/LQJbaUmgsKBfWCk3enSmS+K5Dp0cIN3sxTbHB+YdgxHzM/C6ovUWjqvqd+xV3aDfIRV+GeJk2AEorpt+9mTL28q5NwODUWktJtmEHZG3V/K6JU8fpIYx4NiaBYEBEpgx3q1/XSKeJLyxHVJXuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBBqzyBPJcOXBX+ofQYrF9UzhSarZmdH93KlC/c8eV0=;
 b=l7sfRZNa96xxwJpr0nBTWwKbNYtvLolLoTOYfAAxcjt8WNDglV/xNFjt8FLqSLgzwa0EzR+uj18DE5u9ZgPv1oPAUf+7MzsaIELwk8nvwrjg4pFVSr31QItiN5njUWSV1YZ/T4WvM7+ZwYo1I7EaUZ/SHPi0XiK/sjyejjvd5lStaxLEt0nkrvXF+ZkOUtePgMITn+jAXuWpdgNhgohOCokX7OL/A0yIZ+z5CH+VcMPrg4RnDqLFW/JmW6U5d3aUuUBVRutgwZm8hsncbsXgPqMQtHWrw+tikweqFm8LP6qTLBp62Vt4zg7iTtV7Ao36UQkIVC61mb3eNU2GlYUGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBBqzyBPJcOXBX+ofQYrF9UzhSarZmdH93KlC/c8eV0=;
 b=jwuzerkQvoBEx4OQygMyIgliWWGmKymSoeqVOc723mAXg1va0tuz6jhCKJQl7teynY71YhXjEw1z9BeEaCOV7jltAtatepLhV02P3PC3XFUx081zaJ5xpx1YvaRY37ltV2G29HAo0/28jXbjLuz3NnP3LU/I8xZaxh00eJcWmVYl7nTMgJaxKi69YYm6kHVPy6uR+xBNNwKKtghQL7J6+GyZaIrZYv5/sjAnzl93ODffTgJNh/i6U9AnRbETjW3J7iU4Pr5VX0scWPddnfg5Dcecl6nD+ZD6mR3GxxCYlOslpEwYCuO0tq0Y7V0L/sVoHezASmasl+Q/Z4lsTaiMSg==
Received: from AS4P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::16)
 by PAXPR04MB8942.eurprd04.prod.outlook.com (2603:10a6:102:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 09:21:26 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::33) by AS4P250CA0028.outlook.office365.com
 (2603:10a6:20b:5e3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 09:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 09:21:26 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.103) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Aug 2026 09:21:26 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by GVXPR04MB12160.eurprd04.prod.outlook.com
 (2603:10a6:150:316::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 09:21:22 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 09:21:22 +0000
Message-ID: <0f67a28b-d316-4fb4-b7e7-069a44dbca18@topic.nl>
Date: Wed, 5 Aug 2026 11:21:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Fail to compile zlib for 32-bit ARM
To: openembedded-core@lists.openembedded.org
References: <18C8DAA25FC16448.3417489@lists.openembedded.org>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <18C8DAA25FC16448.3417489@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0183.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::20) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|GVXPR04MB12160:EE_|AM3PEPF0000A799:EE_|PAXPR04MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: 907892b5-a419-4ec1-d9bb-08def2d2ecf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|10067099003|6133799003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 +bz+6u2iix67v8PTQh5vSKTAghJlfGfPCgIGk3BgN3YRJV6PE4OkAclEzy9SPMFI8rfA6jV/SpLwaGIFnl4J7HfVAujMuSjEqdq467SpqUqk2II90QkKGZFJnNo/M+LDo+xO6r1UMKkEz3pLqxnnQuI94wT27TtQfwa2djisJz6iFo3Ijx7C8yK6BXu1WvlK6ykgTgPmOIDMjExsfggVkDCMcfxATC/pesQSWgUKIwXWlK4u2CupBywKSa2iaRzvHrVvSW2TF8Bp0Q3Nr+5TEamJhag8qLul9lLvUFxoG8YWWbocWYBDnU5IRxVEnvyHHG8eB6LJ9gvWJVrUO5VDva0Z9gp9GAl0YzX58iG1GHkFeCoa+AkAsQvkKBaPbd0cFRUZl9LTX5rFlRtT9uvsGH+aq675egxcUXYIVTdlZysbAegGJlh8qDK03JqZXpQ4GAq5qVinX3Qnc9md8VGgafIGMX6YfN9pWCfMGyQGZ73KH1mFnw6sXmwV7qQRNIV1T9ZoiBF9SKQy78tjSh5qPWUrGcIfnQR0DShDySgnan+A1bf5T0qlZSHvraPKXnRcE/l8kBXVWhS5bKp0a2zgV5OwGnGp5OvdVjLFnGkOk5A3rjFH4Z/ZxF5lNqtRjtv8gLNhiDg1gdK6A0Vvyuj9cy4gWWCQLFzeDFOfznyCFb0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: f22JW1Fm+q0136KbPFJd0lC2OV5XhyuULo9nmEpyUpg0zU2X2/SV29lFo9dEa0yzM9sXVDaqLYhjN9VX0LZth2XpXq+qbDO2ibs9vopw4Uhempk50sKpYhmdD8b2PtixEimu1V2z7gNhMG2pGITk2GLJ5Bq2jaDvhB45lP2KdlXhuHcwyMC+lHV4zhQq7nDjVf+recBf4Cq2NhXFPp/1eUkp6RYFa9JaGj/207+b5R+NLR8zU9ITwqtQlOmz+4/GUGpBkzVCez8uol9THj1Rc89g/IPzkv0L/iL3UZ9zZKqXqMCvzg4/z1vhlOftdDGqT1oJUAmXQvy31yZ0h3tDHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12160
X-CodeTwo-MessageID: 14f61e1c-e5a2-4319-bddb-8c87732ec26a.20260805092126@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f92e5b0-d209-40b1-4f86-08def2d2ea1d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|23010399003|36860700016|14060799003|82310400026|1800799024|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	otDq6YQltCq9OcLCZL0LRmRZGOeW1ht8bufd5etfMGATvq1O9TZd9teTNomPpGVsa3IO3ChG5gWO6HqRfzGxE/LmRLW/Vj3nqZXr1xusFNlWULSpA1SQIYuqIlWxANkZUPX3o68xTVGJVMgSPEzGrRVSPSxg7ICMw1+Nt8CWazcZIgYBXSjzkxecSzlWhvqnvpJKbVoeneD45qzG31YY7/SZs/d57a4CYXZ8GTIvcEpEzSyRkpmI8Ztics4VIdOvkET0DOZB0J9RDrpJ5+l3h+4b3Z9jiI8PwKmLgXu1XbWe0tyXvRaTKvv247qk27DLUbmSQJp0o0a6e322KNOmtp/mo3IXaEaSev98KlOHkL0NPrk3lAf6dqAPJQGukoedrL81o8ygDOf2KIEzjyU6bBlhIIq9iR4ozdFEeC7sxqFAW3/I+uK9Kd5oXqlq9NnPg7vvBcnniPqcx814SryfaX9kbJVJNpfB3nSm8RC0mHNn4/6pln8sSvg6xBMoDsmW67BChiAk91BkYo8R+pKH4bUdZ0Y0CCn1CyXaQICcMqEG+uhtKZ/C3swNQZHxjEQEN55mvuClnYlUP/0CqrPhqHMzNw8kHZnUG8ipXP4qrozkHeY1VeM0d6+XtZa7KXRsD+PNvEHISLnI1sirT8kh2GAvfsjYwLGIrJpg+pU1pJk/1aNninUCgcliD8DLyCDEVsZsaSXFWVKeC1SdHrNieQ==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(23010399003)(36860700016)(14060799003)(82310400026)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mtC3UvTdHyUHulIBAhtlt9hoz7+sC1eDSoCif8tIcJSsZo4LfNXRte3UyiyGDrQJWwaNSI9oFN4qWkyKlknkreh7Nb3jFwsudcZj+N/EeKoKSNv+QJ9KWkF0nS95JZokncysxKnLqu1gSCSHHCskZqtCwrIvNV+4XfFLhp1efa7x0q1DnLFahu5GD8cJbTfPHNskQbWYE7H9v9xeoKT2pRuD9dqd/EhKy6kTLndsp1NICy7d2KHdDHmDc4wmMOdOrcSqw0OgGjS5oMyrA/0BvZID/z0ZyFjmI+rZL/UVbGEI4xncq8T34/82hx7uiCGhAdd7Eg6JgBGH+8p6thQ1xIhmp52BSv5ITFVai0SSiQhBTkcPWUvoV/hjRzab1gQwyzI1eNh7f8UyvqnNdQFPszMJ5OZajLU2W8xTuSp1v33AEFp3ccfYmly/I3ph2Qwn
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 09:21:26.5657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907892b5-a419-4ec1-d9bb-08def2d2ecf5
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8942
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 09:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242848

Ah, after a lot of searching and debugging, finally found the cause.

Some old config file was setting=C2=A0=C2=A0FULL_OPTIMIZATION:pn-zlib=C2=A0=
 and added flags=20
that caused the failure below.

M.

On 8/5/26 10:13, Mike Looijmans via lists.openembedded.org wrote:
> Using current OE wrynose branch on Ubuntu 22 LTS.
>
> Everything appears fine until it gets to compiling "gzip", which fails wi=
th=20
> the cryptic error trace below. Searching leads me to this page which has=
=20
> almost identical output (apart from the version), but there's apparently =
no=20
> navigation from there to whatever the solution must have been:
>
> https://errors.yoctoproject.org/Errors/Details/852396/
>
> I suspect the real issue is that somehow the ARM compiler dislikes whatev=
er=20
> gzit is feeding it. However, it's such a common embedded platform that I=
=20
> can't imagine that I'd be the only one in the world to bump against this.
>
> The error I get now is:
>
> DEBUG: Executing python function extend_recipe_sysroot
> NOTE: Direct dependencies are=20
> ['/.../oe-core/meta/recipes-core/glibc/glibc_2.43.bb:do_populate_sysroot'=
,=20
> '/.../oe-core/meta/recipes-devtools/gcc/gcc-cross_15.3.bb:do_populate_sys=
root',=20
> '/.../oe-core/meta/recipes-devtools/gcc/gcc-runtime_15.3.bb:do_populate_s=
ysroot',=20
> '/.../oe-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populat=
e_sysroot',=20
> 'virtual:native:/.../oe-core/meta/recipes-devtools/patch/patch_2.8.bb:do_=
populate_sysroot',=20
> 'virtual:native:/.../oe-core/meta/recipes-devtools/pseudo/pseudo_git.bb:d=
o_populate_sysroot']=20
>
> NOTE: Installed into sysroot: []
> NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native',=20
> 'glibc', 'binutils-cross-arm', 'gcc-cross-arm', 'gcc-runtime', 'libgcc',=
=20
> 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native',=20
> 'linux-libc-headers', 'zlib-native', 'flex-native', 'gnu-config-native',=
=20
> 'patch-native', 'pseudo-native', 'xz-native', 'zstd-native', 'attr-native=
',=20
> 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
> DEBUG: Python function extend_recipe_sysroot finished
> DEBUG: Executing shell function do_configure
> Compiler error reporting is too harsh for=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources=
/zlib-1.3.2/configure=20
> (perhaps remove -Werror).
> **=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources=
/zlib-1.3.2/configure=20
> aborting.
> WARNING:=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/ru=
n.do_configure.817951:133=20
> exit 1 from 'LDCONFIG=3Dtrue=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/sources=
/zlib-1.3.2/configure=20
> --prefix=3D/usr --shared --libdir=3D/usr/lib --uname=3DGNU'
> WARNING: Backtrace (BB generated script):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 #1: do_configure,=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/ru=
n.do_configure.817951,=20
> line 133
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 #2: main,=20
> /.../build/tmp/work/cortexa9t2hf-neon-oe-linux-gnueabi/zlib/1.3.2/temp/ru=
n.do_configure.817951,=20
> line 137
> ~
>
>
>



