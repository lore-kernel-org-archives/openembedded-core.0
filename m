Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5709AC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 06:33:27 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.50])
 by mx.groups.io with SMTP id smtpd.web10.141993.1698129202061709249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 23:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=Vqo8qs8e;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.50, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6727MT85/YNzAynhBEbdcBVPYfxu+9sWrEMwAF5atduljTGBOlr1OZzV6GfxvAbvxdF/huF9/6WX5Rh5i44uqqC8w7DXzFHPawsMeYubFVbq1OB69m62NgXSI5BFi31ux0KDFdwJXUZ1X2j3aBH7L+Sz+V2dZLWohr4Vw6drGORwtM6Ldrt0x/eS9Cj3mEVfkjUOvE934mImgt7+9yz6Bk72m3ZTqUvGTTCfrSX8awb3jLjfofl/m+/bNbWev3CMZnLBiMUWW7XsmPlGM2ILStPLXwW77mZCmxrG6fPk/yxi8gWEmqPF3e06VVOCqFuBbNpZ0GkIl3hppk5XErptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAXn1mNSPiKVHnvhEKAz7gqpFkLmTEPicrA61hRh3q0=;
 b=Xi/PRiltE/k0PY0OlcJkT5yvTSEdVwk3TF6VSOFX2+hS4gEvlkvzHeDUFUnA5pITPWBxv2DjFuoqoh4PR1Jvz6Ye3gOc3ToZHg2VgcBSKaWLGk5eQzRrj8Bpot/E+HPIphGkufTpS1yiw7XlwFAAyZqzWk9xylm85YKWtlfUXM8AyAmiWypck9k3uT7qBLIE4DmPXfHOhX/AVzRBjZ1w82b/oLXblKVdF/VSI1EKuf9O11xPCcQbd7Sf4u0Od9kEy74bOuBTgE5eOMnPqIXBoKQRLBz5knSQIHVOcZS/TOUGDC4+ptjoc7f3Txrd0OnL012eiLLGykw6XNL/AzapbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAXn1mNSPiKVHnvhEKAz7gqpFkLmTEPicrA61hRh3q0=;
 b=Vqo8qs8etFexwnunmYR95sbEr5pHwWzlFElWjJ7+k8RmdoW/+mJmypaVjlievFCj9abUSJy2L5jLLlMrEzdaAMzGyzvkpi85SBNUETd6fzyQe319gVq6KZ6J3GhHKvpojicm/WJmZQ1LYeYV4BCZnHgHFmxkbhd6VRNJMr24HQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DB9PR08MB10378.eurprd08.prod.outlook.com (2603:10a6:10:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 06:33:18 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 06:33:18 +0000
Message-ID: <f71c3205-330f-452a-94ce-d6994f7d8bed@weidmueller.com>
Date: Tue, 24 Oct 2023 08:33:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
 <1762baab-06d2-4fc4-9cd0-307b76f0d79e@gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <1762baab-06d2-4fc4-9cd0-307b76f0d79e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DB9PR08MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eef4e58-46d5-4f96-02b3-08dbd45b1c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jqwIaSmjmwlL0o9tkzHmBWkbxIcKISQo5wuVzE2LnUghu2U5YEz+FKj6s6/G9dRFyMUHLPRJvXvZnsaiA38sDMDqnD4EbRnnm6WuQFaLUBFhPQ54Z4nYMgSMkiuVykA3OK2e8Fuiur3z1pBxb38zWfRsUF5uH6MN4EYeXAvaW/swpSpnhMT6aIWCWk0GSoO2vU+fNgQPq7oGqodZyIVFg3xJPITUW4bw87LczNwNVHne4dX9q38/Iqf+cvH0ycfjjr7R6pXwQRmuKN6uJiFpB5i6PJsCYwW8INpZ1sQN8hobWcA+MSzkjIr+DWhrV99ausu9LLpl9W4gZS1bcTpuYChgWUEpyMgZB0lmocOCbxg5PkE4anO17mU2OI05Qxw5Uq2H8C8oK5yXbmU62InNQfS0Et323kpXGgcfxJhf1Yl8EQA5/yMq33xMmVkjlTAXbpff4cjGFcvk1ZZn3NiPmSrPA0bkmXWlHJAoHNzILK3AgqZQtEbsG8XAaO5pTKit46aOXn5TOBghLnhWBJTPDsxzBVA/UFKB7JyDA5OtN74XpRZzLFGxeGpFETN+rk8aoxkdAogQW1YurnlUckHTuIvLUJw82NU5ivmah4mVvWry7KLFOCD0nM6MlmV2W72QAuIWqRbvuR8MQrb2kO6KjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(2906002)(41300700001)(38100700002)(66946007)(54906003)(66476007)(316002)(66556008)(6506007)(2616005)(107886003)(478600001)(966005)(6486002)(53546011)(6512007)(83380400001)(86362001)(31696002)(5660300002)(36756003)(4326008)(8936002)(8676002)(84970400001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AZQXU77S+yTtbW2WVc/k/zApBqVZLIA65Br7R4+8poPxME1QVuLQJT87TkdA?=
 =?us-ascii?Q?isxfKcVjdwaoUcP6S3dG0zSjQDpV+sacXrEniwTbNLbcxrYdeNtG3fdnxrz8?=
 =?us-ascii?Q?nSd9Belo+O9XWX2DWqofS37mtN1VItVPIogVBrK01HrJFFd7/pHd6yMYrv9K?=
 =?us-ascii?Q?Ey1xAdSMpqG5NagMfwypjLSTGqtuZnu0wz7ul6/xyJPAoY9cZjw/YUpuiB5s?=
 =?us-ascii?Q?s8Y2LWJXn4+hsFqhN4hqdV1657rTjbs2qgn8/jdxoEbeLyIzpxSMAaRkx7KD?=
 =?us-ascii?Q?H8srWmPj7vsHDTVyluRbCufrMt5tUU1QE5E+371PB99ZOHJu3MIvgWBPQ7eX?=
 =?us-ascii?Q?aRkcR0L/v2AlYeYvUKG2N1YyZsOuh95cwEboEe0VagQOsgNtBJ+KOnWrsRBd?=
 =?us-ascii?Q?iG0Bo4dAaYDybHJtg5AWLEUAXtY+ONFd7JwYeYSOeOlXZAXnXA3W7rDoTKFm?=
 =?us-ascii?Q?XISuq+9qFbvDxxwzr5y96lEI+JwpCvBcyEjmZXq0in2RV20OVb8qhV32qwVp?=
 =?us-ascii?Q?hrQ7k4oSBZVL0r644aKYV2wJng1bg65s/pr2ZU5WuGj17Np7faBd0DX4vqGS?=
 =?us-ascii?Q?jytzSwCYsJhDIwHax8sTC96qPSkCu8ztK+TMh0k39rP6c9EzLlKzEGw7X0Y3?=
 =?us-ascii?Q?fQ0J7mUD2MybvNCNYyph7zVZigCoMiqDl0PxMcx1dkX59Ff+CWEFL3iFFXPR?=
 =?us-ascii?Q?WLheoWQyOgW+1/dmpJKMI/yl3iUoQo2HWONPOB+DmJmtX6ExXKExyhpSSalK?=
 =?us-ascii?Q?PboKyr7RlMugFxlghFRnj6Cq854/y3UPubpA0deb3NAfUx+bB1Y+e3W56cYW?=
 =?us-ascii?Q?NBn1cRz6gtr3F1Y6IgAdd8gkE9OO6CdglHfmHEfbY/FID9zYbUckq481doRC?=
 =?us-ascii?Q?NDIFUxlP3TKvsdorFiq9+ZuW8eLtxAYKdayT/9Ol8ML78kPwX+DJ3uql9WjC?=
 =?us-ascii?Q?G12/7vlk0BPtaOhCm7zgy6r5Y1DY2h8ub2R+84K+Yu3Y9wkl9x6ncddxITJS?=
 =?us-ascii?Q?N2bvXC8kSfAQpZbiABaUvaAKuUo6D0pRn3tgpbDs0TlyK30nnBYo1d8hr4kp?=
 =?us-ascii?Q?7CsK2R9iplsEm8RoB49TUVPjo978uoGOAA99Z7ZOL6szf6vgP6u/tp2YGDGp?=
 =?us-ascii?Q?Uem0GeNJaHQ1VrGC2hDoVcZLaMfSXeni79AF5iIBDApCuPut9tOI1qejLQmY?=
 =?us-ascii?Q?KZwMY6WPHryayJlOoBon5I8f4R3ZpPqTmvDOVvoR9m1gGXqNrdHxcmi0+V8H?=
 =?us-ascii?Q?0y2L56YwLD6K7z6Q1JnuUBJyECO2Xvty+wBfOSiLO/01FFbcngid5A2s/6ej?=
 =?us-ascii?Q?X3GyAOUktneKvJdSxUzirscM5LzXDVjWrovZKV5G2mj2atoNsdNGsC4HxMeH?=
 =?us-ascii?Q?GEGnLawYzvlU4hT23uo0dgKaD3tdbpFcFoY8gzv1Fq3o5bEOdpJD+DGKz6l8?=
 =?us-ascii?Q?LSE+s+LI2yeYr8qT34emH/nfSQn1tf3A3s/ek8nijU6yjplyIpgY5l+xmRrV?=
 =?us-ascii?Q?ZvctSNnJyS/ybP8FA9/OMGcY4nOjMo9rNupuDOztJZZAHwnpIebNsBjEOM3w?=
 =?us-ascii?Q?1xRnOksCDI+ISLekj9a2mheUc7PXPHrCizZ+Z1Gf+d53jUbPTc3B+Y6A3uRD?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eef4e58-46d5-4f96-02b3-08dbd45b1c25
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:33:18.3394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: godnUjS5quriKUH5qlcdo1DjqoiFxuS3QKa3l4Ozhr1lJWJvywU4zuOl8TFcSBjeO3MegB6YCEsgcENZrVKyAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10378
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 06:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189637

On 23.10.2023 20:06, Vyacheslav Yurkov wrote:
> On 23.10.2023 14:18, Lukas Funke wrote:
>> Hi Slava,
>>
>> On 22.10.2023 20:34, Vyacheslav Yurkov wrote:
>>> Hey Lukas,
>>> Thanks a lot for the patch. A few questions/comments from my initial=20
>>> test below.
>>>
>>> - I tried it with a go-based backend I have by providing ssh URL to=20
>>> github. It seems like the GO_IMPORT is set to a module name from=20
>>> go.mod of my project, which of course fails to fetch it like that,=20
>>> because it's not a valid URL. How is it supposed to be used?
>>
>> Your assumption is correct: the GO_IMPORT is taken from the go.mod file.
>>
>> I've not considered the case where the repo URL is unequal to the=20
>> module path. This may require manual rework of the recipe. Another=20
>> solution would be to take the source URL from the recipetool. I think=20
>> there is no correct solution to this problem, because probably most=20
>> people might want to have the original solution, since they are=20
>> creating recipes from oss components (i.e. from github).
>=20
> Some more results from my tests.
>=20
> - I refactored module name to contain a valid URL... It seems though=20
> that current version of go_src_uri does not handle ssh URLs, and all=20
> required info from URL was lost (git@ component, ssh protocol, .git=20
> suffix).

Currently only https is handled.

>=20
> - I placed the correct URL into SRC_URI, but do_go_vendor still failed=20
> with following stacktrace:
>=20
> File:=20
> '/home/uvv/projects/yocto-lorch-mapro/openembedded-core/meta/classes/go-v=
endor.bbclass', lineno: 86, function: do_go_vendor
>  =C2=A0=C2=A0=C2=A0=C2=A0 0082:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # path =3D github.com/foo/bar
>  =C2=A0=C2=A0=C2=A0=C2=A0 0083:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # version =3D v1.2.3
>  =C2=A0=C2=A0=C2=A0=C2=A0 0084:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0085:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 p =3D destsuffix[len(default_destsuffix)+1:]
>  =C2=A0*** 0086:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path, version =
=3D p.split('@')
>  =C2=A0=C2=A0=C2=A0=C2=A0 0087:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 subdir =3D fetcher.ud[url].parm.get('go_subdir')
>  =C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 subdir =3D "" if not subdir else subdir
>  =C2=A0=C2=A0=C2=A0=C2=A0 0090:
> Exception: ValueError: not enough values to unpack (expected 2, got 1)
>=20
> The reason is that my go.mod name does not have a version component. If=20
> I understood the convention https://go.dev/ref/mod#introduction, it's=20
> not a required component, so this should be taken into account.

This error could happen if your dependencies don't have a version. I've=20
never seen this in my experiments. Maybe check your go.mod file for the=20
missing version info.

>=20
> Thanks,
> Slava


