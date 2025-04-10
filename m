Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E9CC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 15:28:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.67])
 by mx.groups.io with SMTP id smtpd.web11.1227.1744298932275004582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 08:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=AbtE5D8z;
 spf=pass (domain: oss.nxp.com, ip: 40.107.241.67, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr+1axOIHIbYFgL8ZiWjplDxVJUVeq9ycu9rqN64Z2ID+JkkPuLst8S2EoHvltoS/iba+wweUx1ef/zqXBzJhsnv3GSooJp4JbEmq7ehFUwnco1l3rYMY8vxypWb7y8zqxTZQJBkCESYCVIigyWGyOIMNWtyhpnr+BHgOuw4+wEkBQXpl4Zn5UIglMc8IKrSiu1RHAVOZzVSTFoTYj6W2qnjG9zV4wpWwkqzeNgPPla1gnTZCqth/LHZwlKdwt+909VW/fJfITjGCoz1n/sJtE21r38OqnS3Wb8eBM+cslsRJQLULauefv8P+zJcRS22jMBFVQ/9vPeZ+A1vN+oTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Szpp2h14aDJ8WqUctidZ0MecjIDHTzPvOqTsf1YXlUo=;
 b=N2GzD1zcmYQArqhWktsjTecVskgtuzO9V2xllXwBTGr8Yv04FkfnYz285ssw5FO6NgxiYDx5jTq7/axhaf9JJPCrTI1dp8BD+oPwt4gkdBdIXmYbHo9d63r/I8RDtBm2UysFiZ50MiTEZtffyW4OSIG6Web3h3emhGkIdV6HV4UWuvjBfeMZsP4UWP6uM354XNpnrjXsf0PtIQ0Nkqqm8lXl5+LByQ64QuwLtMVAJdLg+5Tvrisdl5DO6woG3RYujzMN6rtl8tSRD5Vx/f8bL2xV99KHnRwHP9ohzO5v47ZrsG7Ac/qfXmIWvrjQfqlPhrwtByexKfTLt+XW7k9Q4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Szpp2h14aDJ8WqUctidZ0MecjIDHTzPvOqTsf1YXlUo=;
 b=AbtE5D8zwtfHbytycxpcuKEgBUdswV33fGo2N6LMC1DCGFIp/VYdnL9RbOln7Ydkdt35dfujIjJig4jTCDhHmOVWvqBKtOsoJ8jrvWTXeSZS3LxNvnxG7A3014OOa7BJGC++5HVVVrRE7ln9EgLp9TwfBykKZH14p85ISLQbSZDBMcPNNRFF/ViZVAK9meLzPkfaHhHSM2xckjQ4VPxNg2pLB3TTYamcy2Sy7W0QBR4X9/f/sx1VZs1+811L8pNmJti1aG1eRsnUNV1ul6rQmo7z7yg1BHmG3YwwzQLiDEADOBRzwmY3dtvK5KENSbzZRZ1UnuMUtJ7vtBqVlkLtmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10510.eurprd04.prod.outlook.com (2603:10a6:800:233::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 15:28:47 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 15:28:47 +0000
Message-ID: <b679e6e4-71db-45e7-905d-3d1b29778302@oss.nxp.com>
Date: Thu, 10 Apr 2025 10:28:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate
 host/build target assignments
To: openembedded-core@lists.openembedded.org
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <1834F816ACB44615.7383@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0047.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::19) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10510:EE_
X-MS-Office365-Filtering-Correlation-Id: 674aac15-eb7e-4ac7-6e35-08dd784462ed
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NKwPjbBgCifj0Vnp4cYqqrDnRsO14BDs4hKVrscDtBIq6KX8pX+AyX300UcD?=
 =?us-ascii?Q?BV/pqQlUEcjd866X8EAV3ElN5accbA8rdRm6dGoT08Q6B+n0eHYzFjSCKtc1?=
 =?us-ascii?Q?rCXXi4UiWbHERbS7GT1LkYNsRv+kOQxLLVx1/IG4zr6+yA+rpXLh7qDEOAoT?=
 =?us-ascii?Q?bJdLzfGW7rMQdRFNwxkgu6Hryj7efjffwE9ofulDI8cHUx1iexFPxpPiEge8?=
 =?us-ascii?Q?54CJ3bmBhndnvGuCTEGh0qV5PlU1bheehVRICAjoRY3WCMI87oEM6U7jFH0w?=
 =?us-ascii?Q?390dVCzoNtRZWTrjlHkbGVUWnnJUZsb+eH800IhSnDpRv7jSBC90s9/KDe8p?=
 =?us-ascii?Q?I87ADral5M9MOIBpvCdHUJmRP1iL12UT+OwGGSzVBjhQd23pfQfQfdTB+/ew?=
 =?us-ascii?Q?Q6sQdzM7hWyRSLqOjktJSZTfYlMDPexv3bDytTeDvg3vgUzPSZBGHbLwkpZf?=
 =?us-ascii?Q?fKVk25AeJAgvPlkinygx2uTRTZEIZPs+V//kqZ9hEIvHx8TUOm9qFPTuKdYG?=
 =?us-ascii?Q?dzgN9AY+ZIiR0yPsGBA8YKe1LcXnv1WIEg0ETV/2ialAsiA2aXv4B4K+PNSi?=
 =?us-ascii?Q?SvTCZOAqDpwX7RwGJFhyAWyDQa7SJH+7v3sWwslcyI1LbVCb1LXU+VUfv5GI?=
 =?us-ascii?Q?WDSN/OnMFyLfYUsqq247ywvaV9oqxAlY2IPP9P9Ajf/CNBKq2tqXmCYkZ9I7?=
 =?us-ascii?Q?g0T+m2JEEfDEvarWk+wZHBNN3y/GoKwn/c47JMwFUmZS923iRV9gM1/LzfgA?=
 =?us-ascii?Q?PhnZVjrElJ38GP28YD06O9rwhAtYRFFeNC77K6f2DFo1ZekDyrGEFOOPYq8P?=
 =?us-ascii?Q?PNX7lBXjsA1gR5qs+eDt5W+lG3cbWxF08RGxXlgi/buXNbvdk+t7IKWpYtY8?=
 =?us-ascii?Q?Jys+Yfy3ckCX/P2+aNPuiRfx9gZboeFmgXspkUv9coOyTkXcwII1QWPcHTRP?=
 =?us-ascii?Q?ljYz8tdnAHcROXef4DfMuJuA3UZ0FnFY4Z9vsUKhGeq2rNmuwK0jIu5a/90I?=
 =?us-ascii?Q?pG29RLzjiiwdM1ffsz/s26dHO6tDAVcOfX18xWBAKZ8Y1QPhBgX/+ZgHZqWV?=
 =?us-ascii?Q?nz0jLWcy7so5A2aeWGRuSG0DIUh96lzHEInWMv4I1pIcF/fvcQxk9xPv+YhS?=
 =?us-ascii?Q?SnySlu7WpxhhLuvZiUAipfa1Fi5Y31Exhpb6DSBW7ac3ttpjY0qW9czsq3Kq?=
 =?us-ascii?Q?IBsDAEuhXPcRtHzmzmVMHy4ViG1W/ZdmOMQCtW/+Z3N6N4WZ58iLvmTePPtX?=
 =?us-ascii?Q?8wg7gfd6y5llcaYP39k7clpXZZz5eixtmXsPxS1SaAt1Qm359en/UQe7T8OH?=
 =?us-ascii?Q?3K1SueCZLQ10jH8A/7CmIu2C?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vc1WdcA9gclRvUolE+iYWzGXCWrBzlO4hheXtjEQB4cFKknq3lgQNWPXdtRv?=
 =?us-ascii?Q?WpQHq0COzXCxWS1EdOOe8dy5zy2belFnhlkGaau4b5A6/psPF2K+/wCdq1dW?=
 =?us-ascii?Q?XADatzjOLxfZ+S2zQQTsutuO4xEgco2GTFYw6zmj6PiT1qeY1mqX4fAHVcNA?=
 =?us-ascii?Q?VcAI/n8BT+dwIpEommUj/+b3DP79K30S3uU17Uu1t/7nTr9szG8dGUwIpk1/?=
 =?us-ascii?Q?mDoa42V+8fBmxA0dY19Dy+ozBN0RlDcZzr9L753cuslD9ncmy43GFRpeukac?=
 =?us-ascii?Q?GDbxEUzxV5nU0jQP7oGA3ru6uVVY9ZgZYq3ZbfJB4Dys5FrahD4zFCrDF/i9?=
 =?us-ascii?Q?DjWWbeDdZ6OafTqmLe0Wlg3BahUa/VidJgRE4SHIrJUq9knaKOhn2/j8H6ZW?=
 =?us-ascii?Q?t71UEN7ha4kXrwXAgcH2N5CBZUsSRhhCt8x3X+RrXbnFfB7ndiCMNOWX07bD?=
 =?us-ascii?Q?1LYRbEaKvBl06tWqy3ieJjabGeK+skzLhCiYj0olm1e3ify7JyEr75Itdunn?=
 =?us-ascii?Q?7MaxlAVBYEFAsepsqClyG6F/6LZHpo2ksJ9YfslfMujNi0jjaAzPW6n52rc4?=
 =?us-ascii?Q?/GnU4YC8wjWq08DB/4hRGybBmWI+UfQ8lSyEW/MjbQ9B5o5+KlkyUaP2L4jO?=
 =?us-ascii?Q?wt4NgywBjoSuPpoobtuI97y6wbaMdTLM9roJ0cbt6NyDD0aL5lwU9U5XWvvJ?=
 =?us-ascii?Q?XXx/y4w8mgBg7xjEpKQkyg3Pl0bObZjnxqW9trtwrHfggzG/K39WABedghHm?=
 =?us-ascii?Q?wRttag7quCES7EomBs1uFD4WervrJFExOWkc1jLQyU6G0GHMH7dhr9cuxczg?=
 =?us-ascii?Q?7CVe+B8/Z9bTCvPjm757rmV+HdyaCbekT2fgXtJMSSwtZ4AncxYWU3o4AH5Y?=
 =?us-ascii?Q?a6PN1gCo1zEXBimuSPctuQugDEuLKtbU6uwMmlFDTVz3OD+982eThT7jRB0L?=
 =?us-ascii?Q?+AiJnmavFXUBAYZVVvGVbPGI6wedDTYDfWIsai62HjASpUx76wU3zEDSvsaX?=
 =?us-ascii?Q?PBMoaEeSeB02mb6U5o3xKygEiRxhoT+0ZQyNThGFvjw53rCiadCHCGZXWpnQ?=
 =?us-ascii?Q?aiWC81JCVZ0yPFdnN5rBs5jutaIL/wZK+d8+9AbPaVUbuTZBCAa5yhWq3Q9u?=
 =?us-ascii?Q?NeYodSaPlwxix/hoOJI1lzPHSj0k6CiR4saHgVDv8EiYgjDgtkWe2TP/wALe?=
 =?us-ascii?Q?PLYgzwbgPxPix6Wygnywen0hdOj80JLQMx6EBq1EE2R5IoahYRia0omoYzUz?=
 =?us-ascii?Q?kiHjVANSX1k8qRLGzKGMOsafTNm/VuEZ/seaKEfXYYDahtGZHUuJfXLAqsWO?=
 =?us-ascii?Q?NT9darlQ8DkVXvdaG8lONhC5kV1ak/A23zb4YNfYYaVEcUJYNoQbSgGlO7cN?=
 =?us-ascii?Q?a9ax7MZ8Sl8Q1gOPa/yn/BNEqVaae2P6Q+M14G95MELBhqdob3c2o5GT7HJy?=
 =?us-ascii?Q?zdvXq9mGpMeZAJBxa8tzS16ZAqcvYZ9JOLj09AoR9gdEI+bXjDb6+rhe4dBG?=
 =?us-ascii?Q?t3rwuNOJzxifgLpwmfIb3xeWc9zwfIyZgwTrSQagn8arT+1FvcrT+kHKF18O?=
 =?us-ascii?Q?bk33HVpn04z8cBnjIO2xzCK/fIBuml3abcB+M5+WhvYwCHqIvPIUZ2ffk1oy?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674aac15-eb7e-4ac7-6e35-08dd784462ed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:28:47.2680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GULkAnRqKHx2L584i0UEUHiISgb36k2PuYQG3Mo3gC7V+pneVwtXYm8O0u5tWVdoPG8gdP65pyuIr13Mx74S9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 15:28:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214680

On 4/10/2025 8:28 AM, Tom Hochstein via lists.openembedded.org wrote:
> On 4/8/2025 10:10 AM, Tom Hochstein via lists.openembedded.org wrote:
>> On 4/8/2025 8:37 AM, Mathieu Dubois-Briand wrote:
>>> [You don't often get email from mathieu.dubois-briand@bootlin.com.=20
>>> Learn why this is important at=20
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On Mon Apr 7, 2025 at 11:18 PM CEST, Tom Hochstein via=20
>>> lists.openembedded.org wrote:
>>>> From: Ross Burton <ross.burton@arm.com>
>>>>
>>>> Use 'meson introspect' to dump JSON describing the build configuration
>>>> and validate that the build and host architectures are correctly set i=
n
>>>> the meson.cross file.
>>>>
>>>> Also instead of calling ninja directly, call the relevant meson=20
>>>> commands.
>>>>
>>>> Fixes: [YOCTO #15485]
>>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>>>> ---
>>>
>>> Hi,
>>>
>>> Thanks for the new version, but we have a new error now:
>>>
>>> Traceback (most recent call last):
>>> =C2=A0=C2=A0 File=20
>>> "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meso=
n.py", line 47, in test_epoxy
>>> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["exelis=
t"],=20
>>> data["host"]["c"]["exelist"])
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~~~~^^^^^
>>> KeyError: 'c'
>>
>> Thanks, Mathieu.
>>
>> Ross, can you have a look?
>=20
> An update: I thought this was working for me, but I realize now that I=20
> may not be running the modified test. This is what I ended up running=20
> after looking around using oe-selftest list commands, as it was the only=
=20
> thing that looked close to an SDK meson test:
>=20
> `oe-selftest -r devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meso=
n`
>=20
> How do I run the modified test?
>=20

Never mind, I figured it out and successfully ran `bitbake -c testsdk=20
core-image-minimal` with no failures, including the modified test.

RESULTS - meson.MesonTest.test_epoxy: PASSED (19.43s)

Trying now with core-image-sato as is done on the autobuilder.

>>
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1330
>>>
>>> Can you have a look at this please?
>>>
>>> --=20
>>> Mathieu Dubois-Briand, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
>>
>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214669): https://lists.openembedded.org/g/openembedde=
d-core/message/214669
> Mute This Topic: https://lists.openembedded.org/mt/112142020/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [to=
m.hochstein@oss.nxp.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


