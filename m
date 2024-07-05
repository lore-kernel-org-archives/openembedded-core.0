Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F5C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 05:19:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.14])
 by mx.groups.io with SMTP id smtpd.web11.10970.1720156733148112444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 22:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=grha5cBc;
 spf=pass (domain: outlook.com, ip: 40.92.91.14, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/K3sgsDb46qnQbY/ipaF/sNfYiZrY3P1ajp987v3DgZpwJUCr0NczUy2mqGSqThlPM8C50RlOF0r3ORDtlwmI6A0nj1Ik7H+WVzsJwPkt0d7ZtAOhZl44FuOU4uXZv1qCun2+fL9ZSvyMSTCQLyVmOlKwYKYw0zT0gtpXfbB/80C7bxzeXYrZsuNk1YDk5R27kl4dUNQ1AtQk4IcIItX68m4X79y38mHz6WVJPkmzJPbBvRSHSUU0uQOoCZGBEtdaJ3wcOD/O2VfE3r5guU8QCsZ39Aa3KsN0jCcrpRDTNi9wltw2fli/6Pl6sdYWygSRZwgpXFeaet9/bXet2BfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OCMP09DK4MU37nY7p4/9LfnOmjpedwSgWDDl8DGFWE=;
 b=SgTKPEZGiZCeCHdk6oJj/klft1VZoCG2fSlb8hdijN6hMauYnc28kP6noSIttxDWkEDT2DoOJtQnhhkot6hnpnowBYYXmxZMO1PaAHhwWmI1yMxfSAguEpnP9iDwkANPTpYpp5yQqfli7TlN9QhrExB69UVPu4D6DgZZGjxa7c1a6HY0EkZ+g4Dgu2px9FemB0w8FN3BPyXMiHVeXxf4/tJYx8t4mvUWFh3fIgk5/muI6UbQ/UhUlOiNHEnfoJSOp9jLBBbrk/NE4y3ZQzyyL4J3vH5iUELJv9/3vvx5PryE8ewpoybDQArFRkIVH7lUsai23w7qaHz7QI25h13l/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OCMP09DK4MU37nY7p4/9LfnOmjpedwSgWDDl8DGFWE=;
 b=grha5cBc/y7HGkNAJNFAjy8ffAjMYT586VgbrZ7zTtqdBcwpCQjv/m0B4t634Na0362y4FhdwKfDBFbWE//cxp6Rn7fh5j2JBdX0X+KUuB18C41v+3jSXNUQBtUSEMa8rTqQGRtBlZT7iRv9Eo8DQ/OKsIypAlfrjf87YoZxVGL0My35OPTXMsgVMIPmkaT3DvH9FCSh4LuuhMn0yjF3gevirQkJivJiE2gyf1TmyN12GeMwFBHU7UZg8vDnpmPsik6zcSlBxkgaqW/735ST6RnxfKIiztdL/y0+2adk2fwnoAvXGggm/nrHQZyLM2Kth5eiwOc5kZx7Zguaz1HySg==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AS8PR07MB9547.eurprd07.prod.outlook.com (2603:10a6:20b:62a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Fri, 5 Jul
 2024 05:18:49 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 05:18:49 +0000
Message-ID: <GV1PR07MB9120FC5B240E083C496D9B9FA8DF2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Fri, 5 Jul 2024 07:18:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] testexport: fallback for empty IMAGE_LINK_NAME
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>
References: <GV1PR07MB91207447D621EE3962C6802EA8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
 <6b8ba5a42a03dc0e04e89989584fb313411d0783.camel@linuxfoundation.org>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <6b8ba5a42a03dc0e04e89989584fb313411d0783.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [cB6QPvC/47rnWdwumGYTJz0NrFNyTP1tZt0HKEgVXQOgZGLUEkq41bhXpM09ooel]
X-ClientProxiedBy: FR0P281CA0235.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::20) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <bf3de911-3fec-48c0-a14e-4e7f1cd95f11@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AS8PR07MB9547:EE_
X-MS-Office365-Filtering-Correlation-Id: f484f11b-26c3-4749-145e-08dc9cb1f384
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 
	8FLH+3UvzwSaNfhwOs6fJKFTVws85i5mquQ7SFRaqUBfqORrUXah1WCHpU2cHt7rnGgRjIX3mWAgl03wx4aQy8etMI3kIHeHCI2/KSNHkpC3hCe4fDfpJABvBsChh7EE+YkhpZ4I+C8PaIrJ1aeDkEo4iZ6iIIVjWjBOG/BKI+YdFqOLbDQriBXroHWneioA6NMx6GhvunaRp+ZBNLuQNHC8iwTEhpaUKnWtk3xR+6zlpdT3hsI8oIMIss2TEY8YC2enoF+d3z9/XKl+FbSZgAzE3C73RtYQh3rtFWnf3Op/O5tgnK2bmoGfJepiVt1AaIdxTRt/6REgdcEhzbJT6M48Akg34rvfLYFOYC+qprt5gq6OReJIlCYG520va3cHQSRCB2tMvgLXPfnUXUnT3baKS5XZuEaf+76z7eN3PV+bi4QrrUv7HbjY7k6hBq1N3eU4JLnHmMhdMfghM6IcV+pME3w9eIPvhq0Sho4SDDFjelkzqph/5qXV9LFdU9fN4ZyfuSxM6J8RBAo97Ip1O0Bbq0jimrIOb14pz8tLBGfvXAVFxrWkjCFnwekmkqOEA4OrUvUnkv0nuZ6sdIMyOXSoCnRTACkoUgPBxOJnLau5eXUebM0lDGxx0DrSUyg+5WCO3fZRQ0cJhEQTXNS6Ug==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/FPYZH4ttNDRGeNPKxfbYJRkMPTN2wuVSyk7GKPNgCcpErNT8euNpJE/Vu7E?=
 =?us-ascii?Q?YBH6WRiHpdtPlSrljNwfzRTztHggwrI+5JjCoVFKQR/F7/nXWgRrNqEwK8F8?=
 =?us-ascii?Q?/tT4PsKkwrzayurP7HC+1ug6O7auQ/HZbCX4pKtzTpvxPNdKGBPgkBMop1Bq?=
 =?us-ascii?Q?8kz6Q7xBAjpcAkSHkg2nCnK766cknW3MxBMkzc5I3PpocKyK+z4pXpTiOosI?=
 =?us-ascii?Q?FIHdecOEVEfDVy52s9hz7A7IJhi4NB32dUKuu447BkyoHMMIWkdei5a/w7x2?=
 =?us-ascii?Q?v+hSlsPi1GOFUzEyeaKeAxzotKjxJ6UNL1fNzBiNfJV+NHvPrly1GmhrWp3P?=
 =?us-ascii?Q?kOJZs1e9A1t+OAzOydUAab847Da++CfcyQt2kX4JHP+srNCp7GaHgWdKG2e2?=
 =?us-ascii?Q?wWnTXoMTBiIMD4S8HR/SaayQoxEkSdaqUJdnEOh0pzGinLy5MQTSn/zqs6f9?=
 =?us-ascii?Q?a8O3LQA3VrYRUiLTNYJ/ReI2lIJFSJ0DlBFD0ed6GpEWPApctKG1tg2soJGQ?=
 =?us-ascii?Q?jYJCpKsufgfxe7TSzsZiOxnbauL2xsZQ466euNV+G40HYSC6+RSn1sjMSlhf?=
 =?us-ascii?Q?D71U2F0/PTtcL0nII5tRM6m1qABL2H+V+8w9MdFHI1GNvToczJRo75vzJXib?=
 =?us-ascii?Q?8SCaNAMtuusKfXUa/myRI9IUGI2Y2rQSKZbLwpcaPzgIpx7xwvj4i3XnAuqg?=
 =?us-ascii?Q?+jTmXX/uYYaBJlLZJMKrn8d+oBziG79Vu5+RKo72OSsJWAvdSaV9l7cZLr+s?=
 =?us-ascii?Q?IehCdXKGwBrguXVZJClfjjxfPPWm0SWSn081YJJyfVMPAYRpMvmkCT2WCZ4z?=
 =?us-ascii?Q?+txTOTuP1HtcDz4Vrgp6cL+ROD70Sg2HshYMdMQdixFTtADSstoZqzAIoGEX?=
 =?us-ascii?Q?+/F+wrCK26U7F1YQ5MhJycbWmVDAyGdLWs6jLr6H+tHxdXtnzL7kvU0EmTti?=
 =?us-ascii?Q?TG0W3IFej2zhxwM77BMiPGnRdCRSpC2PIEWQ6yGogA4hxujBeQ2VM8RZTogk?=
 =?us-ascii?Q?wlPXj/vP404v2SZ4Skyl5ryveyaSck+AiFdeZJWsMpVq4CU/OO73PVLYDzbu?=
 =?us-ascii?Q?15MoQZH6sudEgYmpEhZzvknA2XRwcony48UVbgeJGBQ49DftRS8DXWpA1P4B?=
 =?us-ascii?Q?x8fVfAjYJanl7TU3Op5eCt5FdUk5xStqD5FL4UyTjIdyIJkq/gotZy0W3CgN?=
 =?us-ascii?Q?9LH1JZk71KsS04z4sSNjnFTCbj/o+z5rlY8RTj/eNv2OlEqsCxDh6jMQf7D5?=
 =?us-ascii?Q?0s3gpacle7xUNyYLx7MdELXXameUkrouh0b/C4zMVSefhVX/oxRLFcg7Osoy?=
 =?us-ascii?Q?O8U=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f484f11b-26c3-4749-145e-08dc9cb1f384
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 05:18:49.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9547
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 05:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201588



On 04.07.24 17:15, Richard Purdie wrote:
> On Wed, 2024-07-03 at 04:47 +0000, Konrad Weihmann via
> lists.openembedded.org wrote:
>> if IMAGE_LINK_NAME is set empty to disable the symlinking
>> for image artifacts in deploy, testexport fails, as the path assembly
>> is incorrect.
>> In that case fallback to IMAGE_NAME
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>  =C2=A0meta/classes-recipe/testexport.bbclass | 2 +-
>>  =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Are you using the test export code? There has been discussion about
> removing that which is why I ask...

Yes! An integral part of our testing at work.
We are using a slighly patched version, which I still haven't found the=20
time to contribute back.

But we are running on LTS only, so it's fine if there's no one to=20
maintain it, then we will need to adjust 2028 latest - worst case, I=20
will move the class code to one of our layers, if the support in core=20
vanishes.

>=20
> Cheers,
>=20
> Richard

