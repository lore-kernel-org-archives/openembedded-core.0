Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779B1C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:40:12 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.89])
 by mx.groups.io with SMTP id smtpd.web12.9933.1643985609235931409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=O//gKSh6;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZZe7R0Y5hI75W7qkXbxYHJrmTzT+s3YUAMqOXJbniMCPuOIHdJLaAL2J0thSIV37/qGiN/bwIiHqNgmTY67ElApp9dpkafAYRaKI4kxNhc0DDs9VfRLN1aFzlrSYh0nNiofHnQfT2xg0EEdsVetyNlrb4zcA1j2sz9kaAQ5NdfJDvDuiXjavyGApPGdrgBIlYnIO43Fayp044iFDIsvFkK45BikSIdO6/QzMo6bKv02uqq7aa/tUX0TI+Tcdhjko0Zd51cfNdvpx1S9sYbjDOnjdBs4yEi0hUL4Qsqpw7cS3GvHErI1n/U9VDP/GwTPS18wSs9Gvvi5+Z9iEOvd0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vfxybgc8t9Nj6n8MH2bWjnRZHxHlcAoamFCnsgV3czU=;
 b=JsJ1b/CCTWgrGZvDqwqDVycmVZa+XJVL8krseN1YLNeiaDo1tJf7nEUW6prELalMQED0jSfftqZAkM5aJSBpVN4Q03cSZY2GYBC9crZukiAa/jPW19WK+rbW5RcRcAmTBKOcHMs2VF6t+ZiLtEfuVHXKo2cEoT1OG1l13VIdp+v5WaFXG5jqay6lD75hKVPifqjsY+PFUYRhnV6G3HYPr6481lHWT6i91y3fBDkN//iLRKTetE5zin4RByzcUcQxFqFtG2GxbIfeHZdD3P03X1HCTwY7qitww/Mamo3mQ0EYDxnrw6FuX/IIEZHuyOKpWJWvzAc9sO3dOcR7RAQLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfxybgc8t9Nj6n8MH2bWjnRZHxHlcAoamFCnsgV3czU=;
 b=O//gKSh6v+y8frRACxTtTIe66hWI+t//cJUv0EGw6St51WBC15Vuam2vbRGvzkqUVf+QGmGzoF4jngv2hU69NN2Wt9kOq4tRDYjkiz9E74CttBjAeS2HzmxcM4kpaVRfjrZa9L8EVgECr14yK7FWQKhXqq3D5bBRHfYUUkQ9hWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM9PR08MB6965.eurprd08.prod.outlook.com (2603:10a6:20b:414::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 14:40:06 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4951.016; Fri, 4 Feb 2022
 14:40:06 +0000
Message-ID: <c7f8122c-674f-fa59-bacc-3d0330566078@weidmueller.com>
Date: Fri, 4 Feb 2022 15:40:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] recipetool/create: Scan for
 SDPX-License-Identifier
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220203170724.1319808-1-saul.wold@windriver.com>
 <1788217da73123aa979e67e651822afef176e68d.camel@linuxfoundation.org>
 <4ede83ba-c6f1-4dac-8dbd-44cc67d16062@weidmueller.com>
 <d532984a72be45bc75ea6fc80e46664dfb01efa7.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <d532984a72be45bc75ea6fc80e46664dfb01efa7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::38) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db31cf7e-e4e7-42b2-db97-08d9e7ec3c39
X-MS-TrafficTypeDiagnostic: AM9PR08MB6965:EE_
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB69651C3CCE675784C8A7F347D7299@AM9PR08MB6965.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	85tvSvD9H3a1EcplSYWiupEBHqWJtanzlQv2YENs/JYzyTkM5vW0uGyYyptaSaMlvh84ZC+6nc8WqWh8UK7yKo/OeemO5zu8nw8z66IfDtcLlmz15LHRySWQC0LTr6IekIpIIVA5hyHwS0WKbDvRF1I+zTxCKJd7i9kGjPGILsCMaLGCVQa8nQTTQ7NZ7oHJFx26TRJWOwPtp73l4B3bsAHP08m1GUg8LFBZmpfwD+fyM64DJ4UWQg4EdLo2N+XB90/EvK6lby86UjHQNcSyIUdkw4Rpuwjg55uzO8Z+CZn3Z+DPbsb+uhHfeBbBLKppx2Gd52YzIM3T8ENGFWFfzLaTaS56Ly6SNG5pWrJm7V3ztiDFCRZBOHtUdJ63/QuLMl9QIWY5es1iQaK65DdLj89PDK5IJhvLT5lGGH7EBOPq3/H6kbN0p4MR44FQeaUk4WPqo9hBteCqPURA7K5mYn55TS94AKgs2zsrYSjpE4828j3bIT3mlbllTw7y/WUxsQFMhbmmusD1RZCfXHYXgI2OmbM2NZweTvSfMdApzW4c7OqZu5tph4QGydbnuN13X6opynUGjXHTLjxVUkYQFPGzHRZXJ60jdmjdsopqw/sw1H2oIcsVCMePQ3YsYx3ieWrTzwIpSWX45dChXAqTx80Q503gsmiZxl0tJ09oPM1Huh4DX4AU8iqDtarbUCl/BXsYVQJODHXPeMUwJaz3oS3xKFXhWBZ6likbbG5TzjdmWzoj7DUBO9HlJaATZaXqmJ1X+1Gc7Caw2pkcHlLKkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(8936002)(66476007)(83380400001)(8676002)(38100700002)(38350700002)(6506007)(26005)(2616005)(36756003)(66556008)(186003)(6512007)(31686004)(52116002)(6486002)(5660300002)(2906002)(31696002)(86362001)(508600001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fovn2IUjbfDXPzQ0ygC/3D/MpOVJx+cWXRuLj8a8NEtZLx9M/gKLKgt4tf0q?=
 =?us-ascii?Q?QB3TWjnJyFLyqFSXhXqQUnKUnxN7mWFrKzkKxqkbi7VeaL1oM06Ec88RJlvV?=
 =?us-ascii?Q?Vx7K+f+nz91U8bhbpL1Am0ysg2j9342PGm1LuP1cTvLDTMcJWEpWAseNXRXk?=
 =?us-ascii?Q?rYlzLTblH6tltIubnT8YQqtTvbit4l4DKcX74OlFi9yS0gTolg5ukeXlyN8D?=
 =?us-ascii?Q?mDBXnxS1OQUDm7IeadAs5zvP+LE27Cgug1gL7tsafpKFrfPZOx+FRCKGNcWJ?=
 =?us-ascii?Q?yVuz6D+vYRzvlrsRiwhpB7BT8Z/tDTVt3FmJLdO1HA8SvWtpJumjfpjlZedZ?=
 =?us-ascii?Q?9Y7pX7foXtzwaMmBZSqbd2597gvYpPoB94f5XW1QPqyX52SxyZlHnKszCTgM?=
 =?us-ascii?Q?owZIaN21j1iv3T10R0tDuvoPWDwjKKarFYiRckeor/BUEED7gYKBeLNF2hF3?=
 =?us-ascii?Q?9oEsrjwvLIPfQq1QAfLVaSOSQ4Mmoob4ZGWnLiqkIUu6p1GjTSR73Ctf8Hmb?=
 =?us-ascii?Q?XAKix604L1WKaa7mLNK2ZGcfrV3OHd7eAqhAIIz5/kVZ/9UQWLFwqvV4sj5J?=
 =?us-ascii?Q?Oz0OfhssPE5ctz9dCpZgFfoVl+0DCdS1lk2BlfWSSJSA+7cwW/hO0yI8hWxp?=
 =?us-ascii?Q?14sTjzKcDo/L1PIeufa+zKgbeAaLFeX06YtqVVtljHhIUKjb7RHCboroAWCA?=
 =?us-ascii?Q?fAjxUICvFvjBhxn4I3aYAhamdfDcQpHOAjDLIT+flAbwnGaEI68I16pTzJfy?=
 =?us-ascii?Q?q1OWacp0nB/rYZ4QZt6Vp62L+oPuWEbyJOAKY6Q78BprS3KB+eTVIwL4LqQy?=
 =?us-ascii?Q?IWO9FDB8OKqwCChf8Cl9Zq3rpxBvzYZBfzcMVXbMt1Z/ILb+ikX0SPDtC6Ji?=
 =?us-ascii?Q?vVYGoJ+vhrkTW0qepHhF9+UDiviWN0SOrrNhwGbubqZZXbsLpZJTRYRdfhhB?=
 =?us-ascii?Q?2uBzFvJS6K+MoKM6rWXPnoJ1eKYYHuR5qshGpcew4/X5Dv5Lgs7tz97yU3YA?=
 =?us-ascii?Q?WbrLaOc9ThxR3xzzpZrSdnwnoBrCT/O6tVqSrUrD4COODY6SCkyOdOj+xmiD?=
 =?us-ascii?Q?3JOjo4Y8IOWKWBFLr7f0EBdsG4Q1P0P2Q81dBaEwOhouGiwBoWhBFQUCRQg0?=
 =?us-ascii?Q?bVgTgKkpZIkDTGK3oZRY0MegokXyPPQnjXEbhs6tGKxzCeC3D4ljXDhhDn4v?=
 =?us-ascii?Q?261I3u0Fnq6aGwBCUvp0nlX8NzchYEQx2DSwQ/Bu2E09r80nd2XaHLRFHajx?=
 =?us-ascii?Q?8TTfB59jobErKNQ+1UTssZIioini9DlvexrigvsNC+kywF0ocbiqdcrDO/PE?=
 =?us-ascii?Q?B/dPPA9OGIybjHxeIrPGCzm3uy1IS9DXUkZX/ch1iCRqhekrlMc2rfHkeVHD?=
 =?us-ascii?Q?AO0dF1fFY33uSGiab/hBKlZhNY3lGYHSXdkBAPaKu4HseGpFpqMnMeboYj7d?=
 =?us-ascii?Q?h3J7jytqMoVLj3cFu+3QkJ8mlAWeeJi3Kw/0pd997rSKeFvf3+4DgmrrYd4X?=
 =?us-ascii?Q?M/hfhoVEPDkPqIgTt3smGqN6oK1HkbMdDRbQWaRKZEAO2MTaD+ePZZrfk5pr?=
 =?us-ascii?Q?JiMTVvQPnWdOXqU9IgDwWYAu5BKlLxrjHt66RheHvClgJmbgVblc1bBQEgFr?=
 =?us-ascii?Q?jbycIHH5krF7a6yVo11JRfw=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db31cf7e-e4e7-42b2-db97-08d9e7ec3c39
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 14:40:05.9920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aiwnb/8Yjl8vqPq7HAOMUVd6mahKZvtN36AN/6BQyXGrz5SYFRU1kZcvt/r0nmcV1kmE29JJSb/C4sqPfIR1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6965
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:40:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161366

Am 04.02.2022 um 14:41 schrieb Richard Purdie:
> On Fri, 2022-02-04 at 10:05 +0100, Stefan Herbrechtsmeier wrote:
>> Am 03.02.2022 um 22:24 schrieb Richard Purdie via lists.openembedded.org=
:
>>> On Thu, 2022-02-03 at 09:07 -0800, Saul Wold wrote:
>>>> When a file can not be identified by checksum and they contain an SPDX
>>>> License-Identifier tag, use it as the found license.
>>>>
>>>> [YOCTO #14529]
>>>>
>>>> Tested with LICENSE files that contain 1 or more SPDX-License-Identifi=
er tags
>>>>
>>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>>> ---
>>>>    scripts/lib/recipetool/create.py | 16 +++++++++++-----
>>>>    1 file changed, 11 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool=
/create.py
>>>> index 507a230511..9149c2d94f 100644
>>>> --- a/scripts/lib/recipetool/create.py
>>>> +++ b/scripts/lib/recipetool/create.py
>>>> @@ -1221,14 +1221,20 @@ def guess_license(srctree, d):
>>>>        for licfile in sorted(licfiles):
>>>>            md5value =3D bb.utils.md5_file(licfile)
>>>>            license =3D md5sums.get(md5value, None)
>>>> +        license_list =3D []
>>>>            if not license:
>>>>                license, crunched_md5, lictext =3D crunch_license(licfi=
le)
>>>>                if lictext and not license:
>>>> -                license =3D 'Unknown'
>>>> -                logger.info("Please add the following line for '%s' t=
o a 'lib/recipetool/licenses.csv' " \
>>>> -                    "and replace `Unknown` with the license:\n" \
>>>> -                    "%s,Unknown" % (os.path.relpath(licfile, srctree)=
, md5value))
>>>> -        if license:
>>>> +                spdx_re =3D re.compile('SPDX-License-Identifier:\s+([=
-A-Za-z\d. ]+)[ |\n|\r\n]*?')
>>>> +                license_list =3D re.findall(spdx_re, "\n".join(lictex=
t))
>>>> +                if not license_list:
>>>> +                    license_list.append('Unknown')
>>>> +                    logger.info("Please add the following line for '%=
s' to a 'lib/recipetool/licenses.csv' " \
>>>> +                        "and replace `Unknown` with the license:\n" \
>>>> +                        "%s,Unknown" % (os.path.relpath(licfile, srct=
ree), md5value))
>>>> +        else:
>>>> +            license_list.append(license)
>>>> +        for license in license_list:
>>>>                licenses.append((license, os.path.relpath(licfile, srct=
ree), md5value))
>>>>   =20
>>>>        # FIXME should we grab at least one source file with a license =
header and add that too?
>>>
>>> I think to close this bug the code may need to go one step further and
>>> effectively grep over the source tree.
>>
>> Please keep in mind that we need a full license text and not only the
>> license name for license compliance. The current function only search
>> for license files with license text.
>>
>>> We'd probably want to list the value of any SPDX-License-Identifier: he=
ader
>>> found in any of the source files for the user to then decide upon?
>>
>> I think this is an other feature like a license checker because if you
>> have a SPDX-License-Identifier without a license text you have a license
>> violation.
>>
>> This brings us to the problem that this code will interpret a file with
>> only a SPDX-License-Identifier as a license file with license text.
>=20
> As I understand it the tool is there to help write a recipe so filling ou=
t
> LICENSE and highlighting a missing full license text would be a valid app=
roach
> for the tool and helpful to the user?

Yes, but we should distinguish between license files which are guess via=20
hash of the content and SPDX-License-Identifier which labels the source=20
code=E2=80=99s license. In this case the SPDX-License-Identifier is non-mat=
erial=20
text from a license file and should be filtered out inside=20
crunch_license function.

The collection of all used licenses via SPDX-License-Identifier is an=20
additional feature and we need a warning if a SPDX-License-Identifier=20
exists without license file.

> It certainly isn't intended as full validation, just intended to assist t=
he
> creation of a recipe.

But this patch is an regress because it doesn't distinguish between a=20
license file with a known hash and a mostly empty file with a=20
SPDX-License-Identifier.

Regards
   Stefan

