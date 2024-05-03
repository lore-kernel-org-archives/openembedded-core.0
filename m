Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC69FC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:55:29 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.101])
 by mx.groups.io with SMTP id smtpd.web10.15043.1714748121880310254
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=GeDFTuMA;
 spf=pass (domain: cherry.de, ip: 40.107.22.101, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWTZwgYiOV4Ik6ZbUQlqMLYchsaV5170YEZBxiAzcP07Z03NvER4YivcLJz0bBb9caoJdASI/TM53R6OFNtiWrTkNQUZO3TFFBaQVZVp24+BItI1zdL1zmlMoGGs9jfQh0gDq3HnGPi4LusXj++vKPK9wrGjtmh71SJv5wKGtg4ukFccG2M38Bm/YwaPB24UufY/uEoVi10ba5rHJG2QbHhjmB/K/4fLdezphNTxz8Ku6DF/n7ojNTCI5Iz5DOWbq61vezIbl95NOs7KsvlhsOG2lXKNlvxPGNm1DH4R5ms+DB5utDwPLWE9BEiC1S7kpE/v3e3uU2OgWG4P2BpzoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7/NU1Aw6r9g4gD0k44QVGr1Ygw2OIs32qc/4skGe00=;
 b=ItvugYjX3lESqr7ddnIJ8wmaBpLvTTsceLLb3vvFowSsslI+IgVpeKasCRBBZ8t7RlX7scfM3eexFKW72M85uJNQFe73n1CEt6ZySDTbkuAmymTVBB6tKQvvzcKYovElF8lEF3W5xWNSoitSGY9JZDiciTpp4eiIvRCbmQGfPLSvuD7VBJEWd73MLoRaMeXZYl8U832jwyb68gWE+SAFDHO2yOj99uUYu5xUwXIbW2j0Q7zGJ5Jjp9glAJcEpkkreHt65sAhxz6I4pwSYLCS0YrLwLM7WLGuTD22vLmYlhLCnjqoljWbpJqGVQRlChpbnJVaMKg0zcpoxYXfgDdRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7/NU1Aw6r9g4gD0k44QVGr1Ygw2OIs32qc/4skGe00=;
 b=GeDFTuMANEaaNAV0czJGaZOXY7PTW7SI51SrYSUd3ufia9tWBHFItGQzmXN4yFV1cw86fZ2pj0ryrX+brQaDAFJqiRJ/IHQm+V65xYjtBp/J1+OBzUBFj2jhvEUZlZrrU4L0QyyJ/T/oyc6lZB5tFrKe5hhk9lw+a4WHdz/6teI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by PAXPR04MB9138.eurprd04.prod.outlook.com (2603:10a6:102:22d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Fri, 3 May
 2024 14:55:17 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 14:55:17 +0000
Message-ID: <14513887-7fa9-47b9-9903-ce4336f46b5f@cherry.de>
Date: Fri, 3 May 2024 16:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ipk: Do not hardcode payload compression
 algorithm
To: Philip Lorenz <philip.lorenz@bmw.de>
CC: openembedded-core@lists.openembedded.org
References: <20240502142716.2112863-1-philip.lorenz@bmw.de>
 <af6e8a05-7c2d-4310-9414-a747593275c7@cherry.de>
 <a0cff382-4302-4f27-96b6-ec41c243588b@bmw.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a0cff382-4302-4f27-96b6-ec41c243588b@bmw.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|PAXPR04MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ade9bb-7a95-4065-d66a-08dc6b810ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rTtPHPSq5fYlbnSH+t8QTd9BPfqIXSgZn+wup0vjVxG4eju6NljhF6AMmIFv?=
 =?us-ascii?Q?Zy+2qOjkW/cYyewzWc1zXmC7IY+Ml4JhTxBy6+LO2hp03B9M07RGd5v/cTih?=
 =?us-ascii?Q?rUdXrlJk+sFoWPv0RPp3l5kK+94dHd9jMkuTCruw/yr49CsUAedQ4dQY7/9B?=
 =?us-ascii?Q?V2lBcFFMwFlWrdIOZAbr7ifDjlsYbEn1aFEoDI98zJVHIg3QBx5MK56dJ2Gn?=
 =?us-ascii?Q?ah7g2vw51CsTQvLT+kjd/RUWkQAnHnyGk339sGsH5hwLSRuBwELAMpZPDiFm?=
 =?us-ascii?Q?2jj4SCAojIPvXLWsh966q+ii9fIVmdaS+8i7FE/SYkujaLUHjQaS4dWFXZPl?=
 =?us-ascii?Q?hSutXlfe1yBa8T3qLtLcAOOTttieuFEQbKvqH+juzCsgMEYsLjsRI4mC83qg?=
 =?us-ascii?Q?t8jQnIth4ujdUlrDJ8Hn7Wyw4GtUe7ugXzeacvACyxbBMtD4UcTnfcnyJhhP?=
 =?us-ascii?Q?UBsxvjwywpdcUhZmineyf5X1C4UfVTgJqmjNhpkLxkJYQ21ti3AlJ96Lzurq?=
 =?us-ascii?Q?tvQUm0rZcBuOB0z0qcorY13K8OaBwwFrtXQ3TrlogbAN320wCisEz0w2Yyx9?=
 =?us-ascii?Q?icKNMp3bFPd6BErDbfIyv8CpVsxryI0Mm9JPdcMYGV6kaLNiNgZ4ZRo993Qe?=
 =?us-ascii?Q?uamLoPNldr40mRhkG3nwSr1kUTrf8EbOKNLiVkCLI+daRGVYqeoRt2La2bMu?=
 =?us-ascii?Q?0YX0maopfyfv9IPJRtZWTD3lE/bAWlQB0isfZC+cBBeQMRlTp1UlzDIdJ/xy?=
 =?us-ascii?Q?yWAiFDR/9D28QI+ZbdR7Lj/gEI/3zGOUcJ86G9d4NtI2+78UiPvtQFzBjPM3?=
 =?us-ascii?Q?3+Ob5o/5mwyeDJ4gBAE1WEpvbqdNFa6JW+438mD9lOtuXk+negwq88hdUn6S?=
 =?us-ascii?Q?eGIUdf5uKYnlhAH7+vyBehEoxuOiSnSGOTXF1C9pnaxH7ecgWKFDCGkKv0SD?=
 =?us-ascii?Q?cQG8n3Z7m42dMLfjKmYVGzzIV/2dvQ0CS2iuILY5XPDJQyViI7H2WfX4YPMW?=
 =?us-ascii?Q?YW07cJ9rNCqYaNXSIN8VNeDF1sr7U/i7A6qX2piy9ER4Jqgr5nHKr+k51nG1?=
 =?us-ascii?Q?HfiplD+BpDzSou5c2+2qeLRnTfRoWLq8Ju5uqJbSHorgxQF24G5UqO2tOE8n?=
 =?us-ascii?Q?P7hC8DP5/vgyooHZJ3bmBhlw6K6rBcQoqNiX1L2/djkISiirG4bF/91ZEXt7?=
 =?us-ascii?Q?DlZRYPl/FiQbShvqzi9txNb5IvW/tEpxdeg8TQOHo1AKAiP855yyOsqJRlec?=
 =?us-ascii?Q?U8Jnj368W3+/8OZw4Ya6Kd2pmlWQbegU5hiC9IYZZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4842.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VkqQTvVpNH4zNhxqFcNftK9iNZB/bGMDyfbjtOP+co2WMQ8VxpRiu7DMPf9p?=
 =?us-ascii?Q?G6XwzeL0Wka1nk5GYKsikHzZ9dZNbdDtpyiWgSOjld9hXn7ppBiVIymY1k9c?=
 =?us-ascii?Q?YzRAcGN0NrG/66fdgphsbio3ZsnFAE9SoAgaLAPz/BjZucZKi4Dh3qoWOu25?=
 =?us-ascii?Q?/4lO/1327+Pk+Vnv6Dfa3y7SG8LJhn4NBJu5YzdQD4wRSW83ngI/F7K/RmJA?=
 =?us-ascii?Q?bIFwghrAlylLuKN/wTC11OUaR1TPhiXlC83cLBLAxw2wt19sU+xYrCYSZI4j?=
 =?us-ascii?Q?B9WF1uMRJrTLhwMcg9aclHf1sA6uDbUDq6QnuwlpR1+YCnjbU6H+uLXAlYKk?=
 =?us-ascii?Q?twP630JUz/c3vy1KdXhD1onVg6Pu72qO02jJiCoOCEsNhXRsE9YfFK0LXNNk?=
 =?us-ascii?Q?RkQo19mPlj++3at0m04rjo2B46Vk8GVUfZZrr5nfr/G/9WjddTYwAyxfce6M?=
 =?us-ascii?Q?CJdnU3rzbFTO3McDYp2kF5kxTI0YKyk/UMYNbYPeU2ZsinwocoWylLuT4NmP?=
 =?us-ascii?Q?8R5YY5UGzf1BwOVxdNG4Rkn1Y07PZlgGA/rwrH+89atS7WJ+b2OoPYSEcQHJ?=
 =?us-ascii?Q?cxoz+AS9ljm+bibTjtfTACUWtIUpNRj9PUrrXNcZGsEG4cv5si/AmkAErX4l?=
 =?us-ascii?Q?buZ1A3iqdU9Ez6nIQxBNooQykNmyAcUhruGo7jbvGGqee1Die5STbbqpBByU?=
 =?us-ascii?Q?D8bLUhkFjte7BGeU9Y0bpfdBc74Zt6jFCSjd6eEJhE7Z3Xjo7PEWedtfw0c3?=
 =?us-ascii?Q?JKAZmy2xsSN6gIhsi+LCzC7GkEAFxBHwKgPbLRdzwSRrVe4KyI/TXYEsTR2e?=
 =?us-ascii?Q?4eQPc+7MqfCAwl1F64p+qd/LbLeIUVD4cPkjnU48BGDHQegrI/R0efSef0H0?=
 =?us-ascii?Q?SBWS6/wtHm+YyPpH7fPw3HsANJ7iYurTgZ5tn30vZmBQ+Re5GUcrR+S+b6kS?=
 =?us-ascii?Q?ox1/D1okP+rNeH92KLJwYrHT8VKzx1uJrueqal3YS0CRebxNMH4e5WsxuDx2?=
 =?us-ascii?Q?jLwxEcNAY7b3teVA353iLHYFl3I3jcKI47iPLd9rxAT2nga0N5BaVlLCRFJy?=
 =?us-ascii?Q?h2N1/RUEO/4718HEcjMQLbqlT/bw1KI/o+7+bgudNG8/4wk7nOy3oN13oFX1?=
 =?us-ascii?Q?AihKiXZ5AqdrZKynajUZxgqKMjJpDWmVdeVARaREVZPyFzEGFYUuXNsde9X7?=
 =?us-ascii?Q?SFIOIDNluqkt5+dfQTukIRIxxw7n7gTgFIbO52qL6gK4Uw+XtwfFUxHRLe4H?=
 =?us-ascii?Q?u/MvSKFmdE7yY7JDh8Gy8hr5LoBZlxjeHes98nrcjiTNTjC8eMbf7QLkq/ML?=
 =?us-ascii?Q?0i4X4tjZZmSuMsw4qwfnggo/e1wVXnD1PJ2pt3mBOZW7IGWiTV9WATmYEnZJ?=
 =?us-ascii?Q?jbHI0aj+KQRCcvdpWDyAEc3fSde62kl/b6sbQjvSgBqc8jaXt2oh36iVcDSA?=
 =?us-ascii?Q?limSyKmUinkCflPfEHd7NPjucW+ERtgwo6Phl6FrBVI+j0bakRb6AqwX2zfh?=
 =?us-ascii?Q?gkm5ayaBtp3kVnrpigADfz3dm8JvKr6YJJKYc4/AC9ZwocpWFsOjwsDPlEr+?=
 =?us-ascii?Q?UeqAU45DH+257nj+EVjrOdIkSDEvuMGKaseqf1xxVzg3a6xWjC90lMxrA2OF?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ade9bb-7a95-4065-d66a-08dc6b810ba5
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 14:55:17.3250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWY3Nha8Y4+U7WeB/tao5/gPPQces2bAsaoy2jFOL8WOwoVziG4nzW4Lf++r8ZYt+KSk7snLtjb1rWVuoo5k+CAZ7rNWkyiL+bz9WXp83sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 14:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199003

Hi Philip,

On 5/2/24 8:00 PM, Philip Lorenz wrote:
> Hi Quentin,
>=20
> On 02.05.24 19:19, Quentin Schulz wrote:
>> Sent from outside the BMW organization=C2=A0 - be CAUTIOUS, particularly=
=20
>> with links and attachments.
>> Absender au=C3=9Ferhalb der BMW Organisation - Bitte VORSICHT beim =C3=
=96ffnen=20
>> von Links und Anh=C3=A4ngen.
>> ------------------------------------------------------------------------=
-----------------------
>>
>> Hi Philip,
>>
>> On 5/2/24 4:27 PM, Philip Lorenz via lists.openembedded.org wrote:
>>> [You don't often get email from=20
>>> philip.lorenz=3Dbmw.de@lists.openembedded.org. Learn why this is=20
>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The chosen payload compression algorithm can be changed by overriding
>>> `OPKGBUILDCMD`. Ensure that package extraction deals with this by
>>> globbing for "data.tar.*" to select the actual payload tarball.
>>>
>>> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
>>> ---
>>> =C2=A0 meta/lib/oe/package_manager/ipk/__init__.py | 8 +++++++-
>>> =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py=20
>>> b/meta/lib/oe/package_manager/ipk/__init__.py
>>> index 8cc9953a027..0f0038d00d9 100644
>>> --- a/meta/lib/oe/package_manager/ipk/__init__.py
>>> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
>>> @@ -4,6 +4,7 @@
>>> =C2=A0 # SPDX-License-Identifier: GPL-2.0-only
>>> =C2=A0 #
>>>
>>> +import glob
>>> =C2=A0 import re
>>> =C2=A0 import shutil
>>> =C2=A0 import subprocess
>>> @@ -134,11 +135,16 @@ class OpkgDpkgPM(PackageManager):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp_dir =3D temp=
file.mkdtemp()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current_dir =3D =
os.getcwd()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.chdir(tmp_dir=
)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data_tar =3D 'data.tar.zst'
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cmd =3D [ar_cmd, 'x', pkg_path]
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 output =3D subprocess.check_output(cmd,=20
>>> stderr=3Dsubprocess.STDOUT)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a_tar =3D glob.glob("data.tar.*")
>>
>> What happens if we have two consecutive builds with the same build=20
>> directory but different compression algorithms? Would we have two=20
>> data.tar.* matches?
>=20
> Each call to extract() creates a new temporary directory into which the=20
> content of that particular IPK are extracted. IPKs should contain only=20
> one data tarball and as such the described scenario should never occur=20
> (and the length check I added is a merely a safety measure).
>=20

This makes sense, thanks for taking the time to explain.

Cheers,
Quentin

