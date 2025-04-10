Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEF4C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:59:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web10.6433.1744311539583296744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=PNrD3+Y4;
 spf=pass (domain: oss.nxp.com, ip: 40.107.21.78, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7Zt4ykxFiZGomLc9sz87jPIGWlUDDv+M/32xlkUYSe9Xa1RzIGNaxJcACc6t0EImqKp0ll4qp9OSBzaH/XNnBTIthrlU42rfG/bXZf++PV5AFCoiLYO24ORML4ormy6TQe4KFNDyEwyahi2JNRNO0WWr8Yd/VYDi6L+GAIYZGukpTCCh30ntNvKxCjhuByih4nRalFtdIVJ0LJ17XX0P8G7fTFlVKfK1vhS/GDrF/gZbVcHS9/X5Juz80+J0Rijhp+pKgivIejeqnfTA9Cb4hp8zbx0rlPNlFQrrWlatOnrCEZib+AbNVpmnI2/38LFo8Fl0GQZU6AwjZrUki803w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK/9lP4BUPJX9oMS7+risROXKl7B5jTtj1zYh27GH6U=;
 b=itnGEldqzL7aQ6JnHspSo7Umb2+a3bAGTpG3L7vtQCwSe5GfCpoAhp2J923KCMiUDbPZYoPjn0fYp/kvFoNCBxqZBvM0H8wB+0ZtkCQdJMQi8bqc25a2l/d61gnMirwQY7Lv8KBKQOmV7KPJ5OROcJk0QYYtlzNTbZt+wjJ8LKEHGQI+uFCut9aeiimah86f4eDaY8fAHXw6eQmrePVG1Q3cG/ZvOQVnx/aEvpzvfgwi1j8y6Kp+38QTMm2o72v575Hzt3W6c3eskTIYewrLO3d9gm6+5RTrLvpNmlV05VOJIsxmPjUYVw2fH8nA7QjiJIHsbPO7s3BQYc9c5eTNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK/9lP4BUPJX9oMS7+risROXKl7B5jTtj1zYh27GH6U=;
 b=PNrD3+Y4cxVh9M0eHOEzuN2nTMyBzxVhyIIL75LIPx2325KOcckyl1iog6g/yXnO6B7yyTNPqNCMWAbbyGRMR8Sym+ALjFJdrVR+btpOh8LNaYvUefrDSuOJIRuyzP4f3IpCqY9ObI5NwyGrmruFYGRMe+sddNFM77OyOtzTPL4RgEuaDIN1kIN8633X5m6aCkpLx79YzM7e5duZCOGu2IyeFyWzzc1DBwRLqJc9xjFoOCFUYZrzwDqoL2J1GBI4HTLyUQ2aNplEs04trGoZOGdQ1mODVYzeIZ6TcrP/Q+A5skurW2ZNyFe+M3AMLM6vb7AYo+ouREKJ37NmtBDE1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GV1PR04MB10078.eurprd04.prod.outlook.com (2603:10a6:150:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 18:58:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 18:58:54 +0000
Message-ID: <cdae0d74-ade9-4b2b-a0ab-45788cd8044f@oss.nxp.com>
Date: Thu, 10 Apr 2025 13:58:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 4/5] oeqa/sdk/meson: improve test to validate
 host/build target assignments
To: openembedded-core@lists.openembedded.org
References: <20250407211806.1782316-1-tom.hochstein@oss.nxp.com>
 <20250407211806.1782316-4-tom.hochstein@oss.nxp.com>
 <D91AQNC6UKX5.394WLWGGFWT4O@bootlin.com>
 <183460753CA35884.31078@lists.openembedded.org>
 <1834F816ACB44615.7383@lists.openembedded.org>
 <1834FEA34534143E.27206@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <1834FEA34534143E.27206@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH8PR20CA0017.namprd20.prod.outlook.com
 (2603:10b6:510:23c::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GV1PR04MB10078:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ab2c05-92de-4b97-5827-08dd7861bd76
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?a2/2kdvY0LEsAvyJk/o8BlT0xEFbcWZ7dmwlMgsxs2MgPgrTVhMaEBVWzX1c?=
 =?us-ascii?Q?yle6DxaAMhluiwjHAAFj4VhMWz3pYPWzJNKyo3vG/aqgiMluOBcpwlMW9sh8?=
 =?us-ascii?Q?rhfLItmJSV2KRxHXhg0LN0jIiORQ8M6YguwDGRvOWXujLZmqFQb6mbCh/Rre?=
 =?us-ascii?Q?GVTWHaCzaTXILEjiU87tAeqwLx5Bb848b8iEK9qVSVzApI1XLiMJxqOy+QP9?=
 =?us-ascii?Q?kVME3zj3mfI9pLUWNvaCdWrdBwgOeiDSmXTIVaDdhE8OnZwUTHOXtKPzPMET?=
 =?us-ascii?Q?6N+sSbtEODfiTOmV6C3OQxABp02erCmJ90yQeIHTvg+iTgB8wTjx2sz8IwBV?=
 =?us-ascii?Q?c1vyxzevrMCZygwG2ZbOuBGmD/TUL3/mY/NlR8PClHxnBofkJwVgL4C2GTFu?=
 =?us-ascii?Q?5cIPgzFK7Z1mdl+s25YOarDE10oczr0ePmYLU0fG63Z1/VrDsVt2yQsG+/cc?=
 =?us-ascii?Q?+kV/wnkSvm2wvmXBec1FRVOJK4mpoAeFpl4pPRN55jkiZ+YzPhVSnlhLpGGB?=
 =?us-ascii?Q?l8oD3ob31SFxuOjiTL1xsI7+1XAybyHDuOhooLswda9eaqK0jI5znYHrKF1c?=
 =?us-ascii?Q?cVgGRe/vj2ahzsuXSKFhWNVWlu3dTWPQ+y7eCAu9wVJ59KxBJSi49TxZ1Hti?=
 =?us-ascii?Q?wE+eTXFTq9M7G4QDaprLQa/SvlfbvfzaFgmBDOOLKml8RGg7yeaXrC9jbiNn?=
 =?us-ascii?Q?B/niRF5OHCTqNNTYYTyI96qyV+nMQhskgGM8nUaObQq+37TrIs0LvhAjDlLW?=
 =?us-ascii?Q?fuWhjzOOQddr/tuUoyJRg4MIbwddatYQKdFtJANNJJmKYqsWX0iYtnnLCL5d?=
 =?us-ascii?Q?BnyYV9Q8C76bTIThQMLD91QH8NZsQOmid/as3DW8Coo13UInFEmWWMofy0vP?=
 =?us-ascii?Q?T4WQDQBWmB28jDyZWX49DJSTXFqFjB1YM2wPeuLWjnQFvaARN1vrEVwt/jZ3?=
 =?us-ascii?Q?iXK56+u08X+o4ZpIde3wtNqRD7wvZw7SsUqD5sip0z87VmsDAsHsR1c17Zsp?=
 =?us-ascii?Q?qNBeeT97S5HUH9t0jj02OXNIXgQwyGnhC3h2ghTPdHu8Xycr60C+DJX4PYO6?=
 =?us-ascii?Q?hMORhZmtNAj4tlYZRYeaNRo7RgzpYvelJwHIsnKD+ia+DY7tBJLPlk49xvjY?=
 =?us-ascii?Q?bkBtxlpOisIe5iZqSenAHoTkHt5JvJX2mJ/HROItdZ3Fmc141WP5kDpCPCJO?=
 =?us-ascii?Q?TKmvpjSv9CVSf2VY0LUilDzDnEGlesB62T+sfHKsyE3QVMUOemOQoOKXgwLw?=
 =?us-ascii?Q?MJyRtwmX0RrJ9ZVDEO9uhmyf9AfwPebk0mi0pSWIeq5DFPd1j4vdCekGSW6o?=
 =?us-ascii?Q?x0hFgUFrksr4JIufEYwY/M4j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fbfTbR1l0Y1f6jfrz9TA/BZL+j3iyD1XRkU9K4K7L5yfhLasK5lzE5nxYH8E?=
 =?us-ascii?Q?KlSN8Cb08Tj5pkD/iSszUcJshyG00+h0SrL9OGo8g8nTYPL7e5dCII7NBYbE?=
 =?us-ascii?Q?eSaB/UyOlgRSp3L+KGaH2c7XSt8A9TVbpAGRtDWP9fRyUmeIgH26BmHbweOK?=
 =?us-ascii?Q?L5oYZ6l1jErS89gP+OiRWmkzwWpZwaA0osP8gea6LcRa0FqJzWNun88CaIvy?=
 =?us-ascii?Q?80NSZ2858scH1vtxVBlmOFc7dDCyGAMkIGJB2QVCOGwU0jt/xReCZ+g4hMk0?=
 =?us-ascii?Q?2R3Qcq8DETlDipR8GSSpt81mS0gJw+RYmKrEOxLA5db9nHUWr2YJa95I05B0?=
 =?us-ascii?Q?v0ahCOTnLGvvU0ygyXxwDHS7K5fFChdc6opiUgsFPXSQw5C+PMcuEGmatpw9?=
 =?us-ascii?Q?Dgdy37gp16WRIC6xbrySwQdhQIZjphdXp2wbHHJCVh+N6kffR6egOV3dHJGz?=
 =?us-ascii?Q?3n+qFbrGuoC9IJuPgBUXTD7p1CsIBWXwPnazNOmPy0V80/luR6XdsnEb7zg9?=
 =?us-ascii?Q?SV+L6i7P7U1kk7tLMyUzqUAojdiJFxn/MOi/ZkY0qvCg+StgeYxzQujEF2Jq?=
 =?us-ascii?Q?PPYCqwNWz5ScrhusgdQm+tuOMskZKZRBRhT7LXuJ9ZtkXn6E2WjRFVinuCvx?=
 =?us-ascii?Q?8lppy3015nwTXAjJ7kjGcj0ceLgLkJOy7SwSXbkZULTprTXGqgtSQrOycijE?=
 =?us-ascii?Q?NVCX4exTm5PMLVaUprfBzIPa35mTJYithVhHna1JjTbS6vP2pgFTuEbAlYsn?=
 =?us-ascii?Q?hIPb8v7fy7KB9FslYSFd5UCPdB3KRNPGpPn/IHpA2VxXStXJhIrov5Uwbr85?=
 =?us-ascii?Q?mLXx61twS75KDKXKHtU25cuQCJkfndlMc5yCMRKaxjHs0XesYiKdMXuDaNZY?=
 =?us-ascii?Q?zPVG0N9HGKqIVleEQVt0myFcstjbjpgYg6jfY8kfHdDjZ8BXGmuHaI6y7+VD?=
 =?us-ascii?Q?fmVy7nCg0SyAKZfgbA0EsB3Sm9y3rs/6iKC+0hSm4Ys5z6kEX9EtpvBAhI2I?=
 =?us-ascii?Q?P+I13lsUHqevshmx+GoZrSP9ge9tAUeng5sOOQncdo7/YJa/UnwIGSPHZp7T?=
 =?us-ascii?Q?SpSrw5LWLCUz2JL2BnIpGgcadXWQWdpewARgtFZyzAkZQsauzWSh0chZ5Daf?=
 =?us-ascii?Q?/3HWtrLxNFPojpYStOea6XKgyNbuPA/YT+FR38K2T90IvktsnUIIo7wWIzjw?=
 =?us-ascii?Q?McTzkW+dmha4ZQmogi/kehyeIxjs0iFd1LrJiMvYf2/54iByGWq1lUurtnCV?=
 =?us-ascii?Q?c/4SyuVb3Ic/5lhTdoBW7aECF4d6iIYVOiICIcb5sJlCBJXFHTyf1YvEQ8dd?=
 =?us-ascii?Q?TErA41FfF7Bf66GZihFJ4xRCYLxuq1+cBtPdkh283AEuEtCQ5LGTCAO1ntrp?=
 =?us-ascii?Q?Kk5ZqrxLn/5RdE/hHY99wmt0PSkjJz6ezPwajqG1+9lqMWagUsA9riK1ZWgP?=
 =?us-ascii?Q?JBMjfBYdJ84Ev9we+JW2BhhEVY6Wh0Gn+sNUl5DOYKirfRhYDqCcELm2QWWx?=
 =?us-ascii?Q?1F8HhaRIY/7eQSGSyxZmvxqlCuAAmh/iz+cSobkpPghae43WYswNZ0a8YnB9?=
 =?us-ascii?Q?vP8KqGpB7W5psaO4fExD66ygUcqedzLXekaoIRKO9PELBhAMF0AhS0AfV3Dc?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab2c05-92de-4b97-5827-08dd7861bd76
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 18:58:54.5658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Fm+BZv59abGLKvebMSqjyW83rLs6eel/Q/ZkIEDdpueRkD8kDjaB8OqFO1rbpZV6yM4kMtkFuRj59aHA/XB2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214698

On 4/10/2025 10:28 AM, Tom Hochstein via lists.openembedded.org wrote:
> On 4/10/2025 8:28 AM, Tom Hochstein via lists.openembedded.org wrote:
>> On 4/8/2025 10:10 AM, Tom Hochstein via lists.openembedded.org wrote:
>>> On 4/8/2025 8:37 AM, Mathieu Dubois-Briand wrote:
>>>> [You don't often get email from mathieu.dubois-briand@bootlin.com.=20
>>>> Learn why this is important at=20
>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> On Mon Apr 7, 2025 at 11:18 PM CEST, Tom Hochstein via=20
>>>> lists.openembedded.org wrote:
>>>>> From: Ross Burton <ross.burton@arm.com>
>>>>>
>>>>> Use 'meson introspect' to dump JSON describing the build configuratio=
n
>>>>> and validate that the build and host architectures are correctly=20
>>>>> set in
>>>>> the meson.cross file.
>>>>>
>>>>> Also instead of calling ninja directly, call the relevant meson=20
>>>>> commands.
>>>>>
>>>>> Fixes: [YOCTO #15485]
>>>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>>>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>>>>> ---
>>>>
>>>> Hi,
>>>>
>>>> Thanks for the new version, but we have a new error now:
>>>>
>>>> Traceback (most recent call last):
>>>> =C2=A0=C2=A0 File=20
>>>> "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/mes=
on.py", line 47, in test_epoxy
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotEqual(data["build"]["c"]["exeli=
st"],=20
>>>> data["host"]["c"]["exelist"])
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~~~~^^^^^
>>>> KeyError: 'c'
>>>
>>> Thanks, Mathieu.
>>>
>>> Ross, can you have a look?
>>
>> An update: I thought this was working for me, but I realize now that I=20
>> may not be running the modified test. This is what I ended up running=20
>> after looking around using oe-selftest list commands, as it was the=20
>> only thing that looked close to an SDK meson test:
>>
>> `oe-selftest -r=20
>> devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meson`
>>
>> How do I run the modified test?
>>
>=20
> Never mind, I figured it out and successfully ran `bitbake -c testsdk=20
> core-image-minimal` with no failures, including the modified test.
>=20
> RESULTS - meson.MesonTest.test_epoxy: PASSED (19.43s)
>=20
> Trying now with core-image-sato as is done on the autobuilder.

Unfortunately, I still cannot reproduce the issue. Another variance was
that I had used the default machine qemux86-64, while the autobuilder
test failed using qemux86. I updated the machine, but still cannot
reproduce the error.

>=20
>>>
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/133=
0
>>>>
>>>> Can you have a look at this please?
>>>>
>>>> --=20
>>>> Mathieu Dubois-Briand, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
>>>>
>>>
>>>
>>>
>>>
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
> View/Reply Online (#214680): https://lists.openembedded.org/g/openembedde=
d-core/message/214680
> Mute This Topic: https://lists.openembedded.org/mt/112142020/3617670
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [to=
m.hochstein@oss.nxp.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


