Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DADC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 16:40:03 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.41])
 by mx.groups.io with SMTP id smtpd.web12.420.1637772001478804016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 08:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=xtl0BiJR;
 spf=pass (domain: weidmueller.com, ip: 40.107.5.41,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/S32yZqZpwd6Jo+1WJQ3QgCL2Rb72PLhtOmKNgO5sLCxlyVRak2VnBAqt+lSX2SyNyixZE67bfuyVw9VVUv6IJP9/3xKTex5i4U8u/2ZcKIO3r8JISElT9nQFDs5/6mHO6/Pb5l4yZKA7OEZIXDAFhMGqh0l8QFLgSLPsU0mh7pLu5+TscnctYyt59Ll6WmJ7jywqMluWvLWs0ic831aE90bU+JhMVq8LSNluoRRaMTzaDXaiV5/3yeTwJ6upJU3eDehrBU2s5rcisvR9elEiuc8U9dbIoQNFO0MFD/nCIAuSiiJ+rt2jYusFAe1lKYkkbqupw6JotsCJ68uSFTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcV6zb6cN+JpsfYmYnht8zl9YuCcFl+QMMppeBwhTyg=;
 b=aNAYFXAjwp+QU8gxneaFj+CrAgu5B9WHu2bAGFTgckSojl9POkuuUMCBtAhl96cRCkXA/8iEfRRNIc7KL2dAKmoJqoZjU2ylVv2aWkQMdl+7CZ+ox9tt3PpE3ZwSxR6AX0+lflaUSVCQQmKzfzHNb8aSWe+f4f7pYvqLyFf96OpimKgxDgZTh+Z4fL1KINb62q3ij/ytkQpw9Z8J2JYKigz2P7kXvnClFN0YWIiduy2lIBy8f8368aQbzF2c8UrXNMgefbn2HbGsEG5EPUI2oDFKXYstnaJzbpjuC68/6UaH7qlE81U0F04+FSKrOOSLqmrxFwTl0xf/vNcJJqB5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcV6zb6cN+JpsfYmYnht8zl9YuCcFl+QMMppeBwhTyg=;
 b=xtl0BiJRDclZybL89wiCafSaxt/tRrhsaYS2Qyc/W6NLxArC+UJinEM/Tx7s3pMTUG1j2+rH40W+kQqu9WiFeU/WXScwlbqlkrWFideg85qJbq6jTfUs2YCSREnpKAVsoaGGmQuUGLL/Ros4Nxw6n/WYR4vK+5z64KeslzCfYug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR2PR08MB4876.eurprd08.prod.outlook.com (2603:10a6:101:22::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 16:39:58 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%7]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 16:39:58 +0000
Message-ID: <ebc4790f-5122-0f8a-40ae-e399361f6948@weidmueller.com>
Date: Wed, 24 Nov 2021 17:39:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH 15/15] node-red: Add git version
Content-Language: en-US
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <AM9PR09MB46420A0D1AFE854BC0E40567A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <AM9PR09MB46420A0D1AFE854BC0E40567A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::28) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.181.208) by
 AM6P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::28) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Wed, 24 Nov 2021 16:39:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21f43313-3a52-4b6c-6c03-08d9af690d88
X-MS-TrafficTypeDiagnostic: PR2PR08MB4876:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB4876BBACF27A5DDF8E4893C8D7619@PR2PR08MB4876.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NKpbovHve0HQeX3orfMpSQrn1dyyXx8te3aGdKSSwFM2CfIhjn70M5X4ZJnmQ4z5OnatmtXQE5ZGY3wSYkwtNo7RUOx8qgwPptG1lUhbMbNyD9FgZMfwiawfAC69NWtOYgPHbqEAc346EF5laeU0S4WlLtbbie+GlztfWqMPDTONXol8LMsfwckTuV55++ZMhqPe3XQKMQDA3nlSkHu6vKA+tnRgO/zydWkHASD/kkun8vo0ILKlQkbPPJz79TJroUfJG3wQRBk8O+wp1iUzmIBRk+QMz4v1FSz35ZNOUzhgsNAS3WCbb3xsJ3qdhX2Dxp5ve7f6pl8W0qf9uFb4kom7j4Pay+cg/qKu0dldqubvwxjB4CqldoZmCjQUYOjO5jjO5FF8/miXZb1X0gFSeHdwHlaF8z1UHpRmKTeSBnoGJMW/l5BV2ybdxm9JVa8hk1vCW6ULntzVrqwgFPf0S5K3UXf7x+aKbsB18c7Xv8Eg688P7jXYAv1VgAwk2z2MxhYQnGcRgXCvj0CFeubIE1qZ6gRfstOAoEmmUFtoO0D7AHIddezL6yXgcg0JWF+JwYx60fdbODXx8lSf8EsZSWyAyv0FmChQnwvXcdELSW3dBtVrzetyHGv7OxNyvJQcd6eaLB6VstfdWX4EK3nhrT+ys3y5UsgnLhIKK58RNm/qJ2tqOkYk4A96KwCQNWV5iJxSycE2UNRWZ0bvkbUY8fPkbhAaEhQfUmbUO0MXq1Ob9NX6Bxm34wCwVFubzKAIU5KRo2sBsICTm9DG1se5DSgrNtDkRO3k+TkhmIZsxyxc0HnfZnkykRVRaz/h7ZbaLW7ek6SxKk6u5EfkEIYBlQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(66946007)(508600001)(36756003)(966005)(53546011)(5660300002)(2906002)(26005)(31696002)(66476007)(66556008)(86362001)(186003)(6486002)(316002)(16576012)(2616005)(83380400001)(8676002)(31686004)(956004)(52116002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?53zu1kjowEph0Qea5LyN6yzfbc3fUccKlVCvHzzX6PnLcnzjeFPgu9OKwK7b?=
 =?us-ascii?Q?M2yzXFl8XxbBr95xF3S7P+bamYwe4+k3DtYifOA3NKJAgYAvPOvWuIgzpVJx?=
 =?us-ascii?Q?973Nl/B3NkmraEBxcmRd33uiCIqO0AcSvw6FEqU0EAwzmVZRxpHI93iLwQUw?=
 =?us-ascii?Q?AbzQ5jeJ3wm9JKt4VQ97CCEunDGKgiFSQeYHFeoDfMmOWwuFP7efABCPUYV+?=
 =?us-ascii?Q?yTQxwJNOapQ1IFK1XWzhaqyFJYwpLyT/bekiN0EM5IOx09Yrm0uWEjtsXwk5?=
 =?us-ascii?Q?M7vj9adxZPMNnrbkNRr3CWqnY4lVv8FzwckzU4NJArUwEeREshZiZkOphxGg?=
 =?us-ascii?Q?g3hGVFe0fdY+p4xuncYeB7wrXSxW1RT+MnHLh67m62N9Jue8wH8VjQDlLTgM?=
 =?us-ascii?Q?9cDVpLWLoEVIDGHoS0c6gAd/qm0Nyz4dYkbJodQi0ivqOPsWkSe/wl121Z6X?=
 =?us-ascii?Q?B0qblTFH6u2UdEcnm8jUVSeEZ80wCEM1L6MFxaiNuqZzPrVMfY1g5elSyUzF?=
 =?us-ascii?Q?OlRJFxuEE8G3+78LvdbInjRRghQF9CvA7cAAr+vpxHuFKgC1aJ62Fs7qMi3Y?=
 =?us-ascii?Q?tF+gYVjgA/Ui41VPBOuWe2+yMXDehDsStqhnrRPvr4zPZahViRF7ovGbuRWN?=
 =?us-ascii?Q?9wNAA+tn/u7/boiBATPTcEm8k3CySoBWbBj4PBG1t2s+QgnQJWj6rxBYF9xo?=
 =?us-ascii?Q?uIbttfxHuevw/QlRqhq2wsWBZcHw/HjI+mk4ec99kyPaFA5ArRQvsgOfMkZe?=
 =?us-ascii?Q?AhgvDGLrZIvvpqleyW58gXMLC1JGekHyDpxQQhj8xVd1Ex8kArvwNT3HQr4E?=
 =?us-ascii?Q?4GrK9AY40kI7o+0ZajM/US9QaJp1V7KbN6dAUofoBJnDB0Vejp/QRFtypaDC?=
 =?us-ascii?Q?xL7rgaI99P6mB8FsdQhZEckUeM3rnWXFanMLPxdWzTnWwrnmdXZ6dBCt0lF3?=
 =?us-ascii?Q?P/4gjLEApkcB/1oXF804Zrm57qkiErHStpHy+Z9iiVLL3vdoHrYGFV1eUv8r?=
 =?us-ascii?Q?PZ/LY/1vWTS0rBwgNM3/n+OnFhNAI/2OaizvXShbeLyqU+W1sz0AouHbNuQl?=
 =?us-ascii?Q?aYho4K92J3wNtCXrqpKEDrpUiiXUV30Mm8h2MDZ4ljxj3CUsphIocDgGJ6Ei?=
 =?us-ascii?Q?SD9RWXdLtFWmNKBs+85H/6z7qGBZzN/noO4dV4OfM6E5rUowyta87mYLO51e?=
 =?us-ascii?Q?dRYIdaeixtiGc554lPVkmxJLAP9WOjyPKMBGR5aFgeYZ/6+nq+z7FqZi3C+H?=
 =?us-ascii?Q?MykpY8Lk5UJOVM1iAOZ4rHj/icSwtmFePFcKLFo2WW1u2oi+gtZNKkRuanxt?=
 =?us-ascii?Q?Pl7sjvCst4ANBKWEikwxSjY298P/NdD73RyvLGqzTl2rsrJ61UNly+bpLuTr?=
 =?us-ascii?Q?N4pBgm0wWi3iubmtsyD3VVw+g1NZeiYRG+AWm2MHJyIC6TyMlf6hd842XWhl?=
 =?us-ascii?Q?IcBhIR7ARClM3OANakrvtGX7JhwhAsKuOEW/4DtCe31JVXtoVnO3eRpchlHY?=
 =?us-ascii?Q?7/5nVv71qE8XJUmvtmdsOFkGQnJEfZCOm5RSBEyRdQ9QxH5mJ9zLvqI3LmlD?=
 =?us-ascii?Q?dE5WMucHRczs/cluRn+IhjJOZ5yA3A6Qr2SJ81FlOoRoxCmuVzrdiZVtGNF8?=
 =?us-ascii?Q?9yhckBqYAUKfrj8CpTIajbE=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21f43313-3a52-4b6c-6c03-08d9af690d88
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 16:39:58.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +idvTbHJYVT032DSTTKGhlO7r3Pq+t2U9w1MiB4K1hxs53JTo5Cx4kCTzQ5Jy9NuK9TwBwoyG6s8gAe8Wc2rtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4876
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 16:40:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158724

Am 24.11.2021 um 15:58 schrieb Konrad Weihmann:
> On 24.11.21 15:47, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Created via recipetool:
>> =C2=A0=C2=A0 devtool add --npm-dev node-red-src=20
>> https://github.com/node-red/node-red.git
>>
>> Requires openssh-native as DEPENDS to pass all unit tests.
>>
>> Signed-off-by: Stefan Herbrechtsmeier=20
>> <stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>> =C2=A0 .../node-red/node-red-src_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2855 +++++++++++++++++
>> =C2=A0 1 file changed, 2855 insertions(+)
>> =C2=A0 create mode 100644 meta/recipes-devtools/node-red/node-red-src_gi=
t.bb
>>
>> diff --git a/meta/recipes-devtools/node-red/node-red-src_git.bb=20
>> b/meta/recipes-devtools/node-red/node-red-src_git.bb
>> new file mode 100644
>> index 0000000000..a2e2d9aff1
>> --- /dev/null
>> +++ b/meta/recipes-devtools/node-red/node-red-src_git.bb
>> @@ -0,0 +1,2855 @@
>> +# Recipe created by recipetool
>> +# This is the basis of a recipe and may need further editing in order=20
>> to be fully functional.
>> +# (Feel free to remove these comments when editing.)
>=20
> I assume that could be removed
The intendion of this file is to demonstrated the output of the=20
recipetool and not for integration into a layer.

>=20
>> +
>> +SUMMARY =3D "Low-code programming for event-driven applications"
>> +HOMEPAGE =3D "http://nodered.org"
>> +# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best=20
>> guesses - it is
>> +# your responsibility to verify that the values are complete and=20
>> correct.
>> +#
>> +# NOTE: multiple licenses have been detected; they have been=20
>> separated with &
>> +# in the LICENSE value for now since it is a reasonable assumption=20
>> that all
>> +# of the licenses apply. If instead there is a choice between the=20
>> multiple
>> +# licenses then you should change the value to separate the licenses=20
>> with |
>> +# instead of &. If there is any doubt, check the accompanying=20
>> documentation
>> +# to determine which situation is applicable.
>=20
> Same for this comment

See above.

>=20
>> +LICENSE =3D "Apache-2.0 & MIT & BSD-3-Clause & ISC & ISC & MIT &=20
>> Unlicense &=C2=A0 MIT & BSD-2-Clause & Apache-2.0 | MPL-2.0 & BSD-0-Clau=
se=20
>> & MIT & BSD-3-Clause & CC0-1.0 & MIT & Python-2.0 & Apache-2.0 & MIT &=20
>> ISC & CC-BY-SA-4.0 & Apache-2.0 & Unlicense & BSD-3-Clause & MIT &=20
>> BSD-3-Clause & MPL-2.0 & ISC | MIT & WTFPL"
>=20
> I truly believe that needs some brackets to improve readability (and I'm=
=20
> even not sure if it does compute correctly).

You are right. The old code needs some rework for the license generation.

>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D014f1a23c3da49aa929b21a96808ab22 \
>> +                   =20

[snip]

>> +DEPENDS =3D "openssh-native"
>> +
>> +SRC_URI =3D " \
>> +   =20
>> git://github.com/node-red/node-red.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dmain=20
>> \
>> +   =20
>> git://git@github.com/node-red/jsdoc-nr-template.git;destsuffix=3Dgit/nod=
e_modules/jsdoc-nr-template;nobranch=3D1;protocol=3Dssh;rev=3D3c7c8f96d585c=
7c5918a2e63519310e1297e162d=20
>> \
>=20
> IIRC ssh will be discontinued by github, so I'd say it should use https=20
> if possible

This protocol is resolved by npm from package.json to npm-shrinkwrap.json:
github: --> git+ssh://git@github.com/

I will replace it with https in the create_npm.py.

[snip]

>> https://registry.npmjs.org/zip-stream/-/zip-stream-4.1.0.tgz;downloadfil=
ename=3Dnpm2/zip-stream-4.1.0.tgz;sha512sum=3Dcec873c105bb806ee18e906581e40=
ff51bb23c6371bc977347c494337421c429cb8d637613b8f774ebe9783710a044df1f1d2ead=
14bb12d9954e8aa5ed8a54e0;subdir=3Dgit/node_modules/zip-stream;striplevel=3D=
1=20
>> \
>> +=C2=A0=C2=A0=C2=A0 "
>=20
> To be honest - this recipe is almost impossible to read - is there a way=
=20
> to split that up in reasonable chunks?

What are reasonable chunks?

It is possible to replace the URL with a python script or npm fetcher:

npm_package(zip-stream,=20
4.1.0);sha512sum=3Dcec873c105bb806ee18e906581e40ff51bb23c6371bc977347c49433=
7421c429cb8d637613b8f774ebe9783710a044df1f1d2ead14bb12d9954e8aa5ed8a54e0;su=
bdir=3Dgit/node_modules/zip-stream

Furthermore the sha512sum could be moved to=20
SRC_URI[zip-stream-4.1.0.sha512sum].


>> +# Modify these as desired
>> +PV =3D "2.1.3+git${SRCPV}"
>> +SRCREV_FORMAT =3D "main"
>> +SRCREV_main =3D "9439cd0e3d57ad103cef28618783f0d609441dbc"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit npm_test
>> +
>> +LICENSE:${PN} =3D "BSD-3-Clause Apache-2.0 MIT"
>=20
> I'm missing a few & in the SPDX string in case there are multiple=20
> licences by package

I will check why there are no & or |.

[snip]

