Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66279C55182
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:30:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.125])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35151.1785915016780175047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 00:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=MYnK+323;
 spf=pass (domain: topic.nl, ip: 40.107.130.125, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO7WblIWbms4zL7JG3zBJaedqUB18863HfZsioEwYnxFsEqA01CqAkgaA4WH941bFExVW9Mbdaozmzj56yIfxiH4JI9UEgp3hfl7ENGlc8kEwbZHcTeLTdyJ7o0DGux/DBysz14fmvWkMJpFVxo8i9vSV1DkNCe3EWdlhNRwCMUIGwnJLTLehtPLEgUKbPnyevo7BWFAzPTzq88qLZTdADFNDt5aEszpxKOCQ8bQ1ZesB2codE0vIkjoopFtWtTyT1zd5dCVp2eXsTQYpQ8OcELnjakv3f3Q6v332MKvV2nU85/RfGYGGYR04Un1gwTwgSD/+Y+HrfWe0hpJPoZ6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h2JqZZt0bbDzgefnDRErDT0qCTYTDCemX7Aqqsfal6c=;
 b=NaENMQdD/U0X0F35Z20X2370b/aYztEh7+49ker+NXr2rihJI2UT8UU916N+dd9Z3ic0lcidDLvESr0SNyFpCXGP4oWVnvYPGQKOG0iw/T1lW2W7enVI7skZIbnp1rhj0R4s900Azv9tsQ0Mn8PajeYkBbD0tTR18uuQUtVf9tHzair5y3lY2/seBXHqVybFEws9HcKV+kW0PEcNRhS3Sc+luDnPRSExR06DyHfIlRjkz1bgBgTdAsMAM9GU5QiVCzReLWeKwuwv20Ne99hojw2R9i3QMxXI5omZx2668mr87C58TbZoGp65bPrE83mQy39FC7uWq8Mf9ptisXaGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2JqZZt0bbDzgefnDRErDT0qCTYTDCemX7Aqqsfal6c=;
 b=MYnK+323MD5NMLrZHT9VKzjyUJG6CuGvmase9gDzvB+a4dEA4YozzbyRqi+bG2pygAcjSxuBUydIUFTSB3npw48BDRdGCGZgSqUcSYlc11aycPvRjnRGdw6ViHJ8zN9gwnPo/H5fmDdCiu1s6+MrR6lcZ5VEqjq3SxdrWzSY1B9mg2c2vroubDbCLBnkNrfcCPEqnFX+VvWZAiH3wxwNMShMXOhB3wD5R6KvBOYQTXBqrZalgNWR/EV2yyC3GAI65jChQcHcLr8JU8Si/m2utYw7+xwW3z9CTSNct6kDUNtJdS1FAtEh2CbyLYJYoYWVdMA13Jr6n62wllMeYjaAxQ==
Received: from AS4P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::8)
 by PAXPR04MB8189.eurprd04.prod.outlook.com (2603:10a6:102:1c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 07:30:10 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::5b) by AS4P190CA0020.outlook.office365.com
 (2603:10a6:20b:5d0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 07:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 07:30:09 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.70) by westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Aug 2026 07:30:09 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24) by VI1PR04MB7166.eurprd04.prod.outlook.com
 (2603:10a6:800:121::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 07:30:06 +0000
Received: from VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224]) by VI0PR04MB12030.eurprd04.prod.outlook.com
 ([fe80::e428:3105:17ec:8224%4]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:30:06 +0000
Message-ID: <681ae53c-7427-4430-87ac-079c3f9aab05@topic.nl>
Date: Wed, 5 Aug 2026 09:30:04 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH v2] spdx_common.py: Avoid crash when
 this_dep.taskhash_deps is None
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.a0496a1c-b05b-48c5-bb27-609c26e2367d@emailsignatures365.codetwo.com>
 <18C8D5AB3A5C8CDD.1990914@lists.openembedded.org>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <18C8D5AB3A5C8CDD.1990914@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR10CA0024.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::16) To VI0PR04MB12030.eurprd04.prod.outlook.com
 (2603:10a6:800:316::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	VI0PR04MB12030:EE_|VI1PR04MB7166:EE_|AMS1EPF0000004D:EE_|PAXPR04MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eedbfec-b3e4-483e-8273-08def2c36140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|6133799003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 P9bLupZD6A9+GffXpLiEvdKTmIfnw0QmH5Jz0S8ZOPwElX7NBvTQtd8MaVAMgJutFISj6EbunJjfj1Xf2901nSOxKgU84nhYJmJ/kTN5d3XyNa/j6j9GtO2mdf1epTg+75AgfIlnne1MjUfUFj3UpfiqF/WuNEBOoKFEwxJaGhBqPuLNoEkffnXv9EM/b7pJlp2a8E7cPf1MWWsrPmpHSjs0pWgVBHgngd8PLxhZiHC8VjkcwiZjkB+McorAqZTYOi8NUuvvRxuQIGTFjXhc025RoimknKpMYh81Bh8waaTEY04Ghl1VqcUfTYA5kJX11PGHHZ38k0+dAwJEWUSqZBRcxD1RLgvB1elR+ZDjRE1QfmHIwt1e/GaPi/GR4TAw2gxo7pk274ZBEiRZ0ARYtMXHAf4ElkB7xQ5qwHhmP8V2RW0LssvpI8JcG/2Oh5Wa29snPp/rqVXob9PKCy1/Yji7fGnR4I9OJWy70wAaFbJfQ303drCBda0mdh3o9QflNBevTDZgM11De5e3JeHDUCErnsHc68RYmDorySHyovVOrnxKITe+2cD0sRLTJlSvaeGGA6IZhlBQIC47qy2OYcKM0KWuq+8s2ey4dtg6wRI/uh6F37iKoey00ckX/b2L/a3BiK7ZkGcUCZvvIL0MB05WFjc6TzyIhNCXGMD/h5E=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12030.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: foxXooue1fpScH3UT5NczwhXgFFNnYSwAfYIUl8WtLYrOT5ozWyDXelxINi3oqVvmUpqnpSzbIsQPxOF//ORgZqGVp/4JOEgYZISdCWYiQ6XhpwYEkxvj1mLEr2s+MFJoj6nj6yWXuE0GkR8690mKgvsA1/zblZbtcloZTdcDE5xIOX9NC82focj7UCIxkh7EuoGMm1r/Dr/ZJKUoOvxd+QhYylOQ/XmPDfh7Mw6jDUq1BaUH2FxZ8TOhhnOK8md2exkQrmN+ldzUSYD6VkxcKBgXR08ZHbF6Epc1IZYEAxF1vGPbEXqktydNsH9CixdRjt/MWq1/kcDVgSHsvWzXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7166
X-CodeTwo-MessageID: 46a821e5-fd35-4fed-a4a6-8920987a211e.20260805073009@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5be82167-aafc-4292-aff7-08def2c35f1c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|23010399003|376014|14060799003|1800799024|82310400026|6133799003|56012099006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	wW98f2XgeKSAmPcEbjlnBWAooRSxWi1ULY/bP/D0dQwGDLvVXxrchJoHt4OZLoO/wwztjBU7Xi6tS4DbGEL72HXlsTOY9wTmPnLyxFcp1rsQ26WYpjwUQwXKytwYjYqp/hun2bmZbhkzX0WasYIowY11dqdZmNXXlEdUIcGqk5vMMbDOLpIKNB+t82xCTRQlw5tJwBDwzBES0nUVDkEhCLbvrTOp1KsRixj2vkZByug1u8eBqylH3SmqoCnGCxU1IFb3T29fBQ5YfsTblpeV7UpTl8COrD2BP0vMoh226TdkHU9waf/k+u/5jPGnpMqRMsvjaplz7JqAI4FFJCF4IFV5fy0u98RtWGaIFY2qooD+tPMmVuAfIVtyCQvi9YbdYOAz153RoB5ARjNJsfEiNYYZkFDXnFVpS7z77FNWOkEwm7EzWk0ZXj6Id9B5fzfxCIv6tr13Deh7z6oYIUkiXHVEAf1acmqfj3T6pC8asX8QJUtoKXiev3inJIDsj/QMDnE5knf2yqYyU/u09OKugbCsXVOnbmpsuBF7zRucVKDuE/AmfAJvGvglks1rkM6IKE4lBwH26ph/O+wD7CVRrjmxsQQtAzsDTt5Dg6KAbIDzUzlpMUW+hTYZfuzdtkI/NVTLSIZyjpORrd9HCQhom6pUkhNB8jyGb7WqWM2TdVIhjWA8iHsK0/Lu36XhJm7LWR8aqrwrd4xFfPsuJYJX+w==
X-Forefront-Antispam-Report: 
	CIP:20.93.157.195;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu11-emailsignatures-cloud.codetwo.com;PTR:westeu11-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(23010399003)(376014)(14060799003)(1800799024)(82310400026)(6133799003)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wXx8Cs3ZBYIQWW4QkMpVujVm5WVp0bEU7IEEr8M2xQj1fpOjXpi3cNYyPH0u205SsttSKwvG5zIbUaGEDagQhPAFTQey/f68bio6ofeh+mcrLn0K8dvMREn7JzXSdNvz9njhYwAUubwQcUjabHX66vn9qvKbB3ptvPqfiDlV7Er87LoSS5nSppJlmaTxvWXA29PuZ+PUgRLvtC9RWuOt9Nmb9UDw+G3SKhfc1Qq3+gV3nep13BNmBQ47jyhhNLd8ztCR2K5d9n2dja8YWHifN0UUx4QoK6FB84wQnF/gCP29gL8vjDgO+8zzI3yilz9Zg9L/q42mSGCV7mK/Vdv4AC8OKghGR8+VU7XYy9I1UA7atE9NpdOmtQEanPX7dcxgEe3mLe9ay/Ocm+cJu7TWtubnLYpxKp6juxQRtE5ZZjLAL8C0CqZ/lqTwIkSh7pO9
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:30:09.7256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eedbfec-b3e4-483e-8273-08def2c36140
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[20.93.157.195];Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242833

Found out how to re-produce the issue.

It's related to BB_HASHSERVE, setting BB_HASHSERVE =3D "" and=20
BB_SIGNATURE_HANDLER =3D "" as per the instructions I got on the first buil=
d=20
triggers this crash.

If I set SSTATE_MIRRORS =3D "" instead and build with the defaults, it does=
n't=20
happen.


Mike.

On 8/5/26 08:42, Mike Looijmans via lists.openembedded.org wrote:
> Apparently this_dep.taskhash_deps can be None in some cases, which
> results in the stacktrace below. Add a check to avoid this.
>
> Solves:
>
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_create_recipe_spdx
> ERROR: Error executing a python function in exec_func_python() autogenera=
ted:
>
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:do_create_recipe_spdx(d)
>       0003:
> File: '/.../oe-core/meta/classes/create-spdx-3.0.bbclass', lineno: 193, f=
unction: do_create_recipe_spdx
>       0189:    "
>       0190:
>       0191:python do_create_recipe_spdx() {
>       0192:    import oe.spdx30_tasks
>   *** 0193:    oe.spdx30_tasks.create_recipe_spdx(d)
>       0194:}
>       0195:addtask do_create_recipe_spdx
>       0196:
>       0197:SSTATETASKS +=3D "do_create_recipe_spdx"
> File: '/.../oe-core/meta/lib/oe/spdx30_tasks.py', lineno: 675, function: =
create_recipe_spdx
>       0671:                identifier=3Dcpe_id,
>       0672:            )
>       0673:        )
>       0674:
>   *** 0675:    direct_deps =3D oe.spdx_common.collect_direct_deps(d, "do_=
create_recipe_spdx")
>       0676:
>       0677:    dep_objsets, dep_recipes =3D collect_dep_objsets(
>       0678:        d, direct_deps, "static", "static-", oe.spdx30.softwar=
e_Package
>       0679:    )
> File: '/.../oe-core/meta/lib/oe/spdx_common.py', lineno: 127, function: c=
ollect_direct_deps
>       0123:    for dep_name in this_dep.deps:
>       0124:        dep_data =3D taskdepdata[dep_name]
>       0125:        if dep_data.taskname =3D=3D dep_task and dep_data.pn !=
=3D pn:
>       0126:            deps.add(
>   *** 0127:                Dep(dep_data.pn, dep_data.hashfn, dep_name in =
this_dep.taskhash_deps)
>       0128:            )
>       0129:
>       0130:    return sorted(deps)
>       0131:
> Exception: TypeError: argument of type 'NoneType' is not iterable
>
> DEBUG: Python function do_create_recipe_spdx finished
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   meta/lib/oe/spdx_common.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 6b1a409c40..d09f749d0e 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -124,7 +124,7 @@ def collect_direct_deps(d, dep_task):
>           dep_data =3D taskdepdata[dep_name]
>           if dep_data.taskname =3D=3D dep_task and dep_data.pn !=3D pn:
>               deps.add(
> -                Dep(dep_data.pn, dep_data.hashfn, dep_name in this_dep.t=
askhash_deps)
> +                Dep(dep_data.pn, dep_data.hashfn, this_dep.taskhash_deps=
 and (p_name in this_dep.taskhash_deps))
>               )
>  =20
>       return sorted(deps)
>





