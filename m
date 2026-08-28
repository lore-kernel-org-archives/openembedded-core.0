Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C637C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:19:34 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1715.1787905172858146288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=kOPku1qE;
 spf=pass (domain: est.tech, ip: 52.101.83.10, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIdYG2EXu7uJsUbSq5vsrRDvbDNSMIS/a+cOqd7LxCXHra9BPmdp3Km7YBk/L9a3wOgCCMhS32h2WHs8ehBz1jTd8ia8/Xs7NHBKAaWA74ZBeRwwwfA+nsNDXFx80HHQt8zeikmmJu9ufhjlkDgkBK6PRG3fNJbQCohm35jzLHnW56te3I26Cr9dE2muhVj3/H1RmK7UFLk6t+1PSKPrwEUbuimPkdqb8IF/ViWN1UtgYGsLdN9ssX+iN+c5Z7beVIbaCZ6ddZZbLddB3dhN1YDfj/yYfdOfrN9eSWyz8YQtDQ/q1OXUph+H3Q9dwcXuTubtZ/Kwh+L9ikAW9E+rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9FeTizJF4nJiQsTMxbd7MHOs3i7zyaOwu/rLEZ3l24=;
 b=PlmEe4y1YeL9PmFT1CPcOuu4Mg1ReAg8jMb5P4J8oE/TJIcYLyh0nzTxur3XaeD0zFDbfKmfDxq5VXl2dT6XqMP1sUpcFe2sffOkpET6HfrsQIHEXevfwCE1oOj+K0fAw151yrc4D8KmHihhTxakghRzR3dYFT5M03ZcnBmq3saAQu58AkeIEiAbAC09JDWQFnu9LLQkoYowI21VrxAGqcZhFPyfh/6mrmzeIPky0TXh6BUo+wug1f3rOVww8CmG389DtkMQ83SLnH0ioDE72oOWnvq5CPWXeI9l7yFq/ZtVXkuemIoGpP3PiHBjBlNppE7tAhWkDKmyHMJjEJSzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9FeTizJF4nJiQsTMxbd7MHOs3i7zyaOwu/rLEZ3l24=;
 b=kOPku1qE2GjfoaEYmIu71gL02zmKqU8ZLqHSejKKVclJXart/EaGKj3HaQu/Szb55q71paWCOOGVMf7Y6TdMTEkdImpNTa89Cell4AAZv5hVoURhrDBlcM//NGPgTm3qOityA+6aJM2W56PLxGMOw/jmm4MSPWucaH7SAG9DNFNWgyd6HQRzy+jZ/8gOhLFZATAmSzUd9TNQ3wylkAZdDtIBtO51VR8j7KKk//zRzvvjGhqqzZLoWbzaAxUUoHA9Byuj3tkT0QOPuPtsPF8cTym5WQiFT4HSrE7hqgYux/bavrKuz3CE1Kc5RQNAimNbo7IoMuhTq7uicA5ZEL+loA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by AM8P189MB1233.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 08:19:27 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 08:19:27 +0000
Message-ID: <8c105cf7-7491-453a-95a4-606b560e5d67@est.tech>
Date: Fri, 28 Aug 2026 10:19:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-4360
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
 <DKZRZV1Q6L2C.3AZRHXJZ8RXKV@smile.fr>
 <d5e4f76a-1f84-4822-bff3-76422e4463c0@est.tech>
Content-Language: en-US
In-Reply-To: <d5e4f76a-1f84-4822-bff3-76422e4463c0@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0151.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::13) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|AM8P189MB1233:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed59159-4c5b-4ca4-c19d-08df04dd1383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|23010399003|366016|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	AKhAugKXabK2FSBEOgiLHd/5Od0MCkNRe6kfak5dKVqzyF8MMRlBEmLwYLtD03L1oEqN3dMBs8xD5xHlcRjvELcFu8M6IFx3+oZiqSbL5m6gfawyBYRvGjio7bbHhDCYBWoJ2LITHj1E3AVaz9wAexO1OT/EbP9BEZQfClxPMHdjsxn0MBv801xV4z88v0CHfd6SMG8us1kVQj0cwH6qsWWe02pVFA9hnV+Z/nYmEoHZjF2KuPOHC5cX9ZY5zxod0lX4iWll9TVANev6vpAEkeS3+Yk8ROj2bJ/UT9PZu6zH8J4CPf41sq5tXXyrvNtgGs6rFt9o3LExD9d20g5cel65HpG8+GzCgJ7ILTJdOnoEuEheCmGVOfPW7n6RQb3rDtY8ZkqQjK5OFFKI0YfE5pjTWRwGN1eg6iswwFE2XnbpocdKuAMqO5hllhzke7uTcwWPixDS2f8ZhgvEocLbSQxAXx9qe9wF48sbt7f/42L5RGoRyBW7HyyxA8SA1FVlfWf83BLOvO85whNTw2T8WM3/MZWcJGnwUuhaFVzkFG9GjUnflVxgFmcc5uoN4qwkL6pDoA1VXylWTqVr0A8SBtXWVTCGQ1uALhCIRktY/+EH/gkTGlWJk8mv0gdSI2Mg9mrzP5HoZrulKFsHH9+mpZCC3UZjz3NktQSsk2qowLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G+tlWwcE4gd2Gq8OLpQHbrOGDnFSJQ0YryIyFMqjyJxWZrjoej+xObKKS6JO?=
 =?us-ascii?Q?/cHyf+6eBPwFHkZooOv+GgUUy/shTNtwTUAzb7UgwhP4Dy/VLd+wywrRrTWI?=
 =?us-ascii?Q?zfo0b1/B+ly2ea3C+Tn8Odmy13AC2Fkjk33BbS3OKL11RgQ39OSTVhdIOWMt?=
 =?us-ascii?Q?toa7ogZAI9iyjz21Ywjf4q8tDNeySYIas0gApulSj/e6ZmLJiA7wy5gIu6Mq?=
 =?us-ascii?Q?P7ObdluU+QlZ/Iv+zUNLOm1SWQAdukFG0y7XG12x7m3X7AUWLc2O1ontPjbK?=
 =?us-ascii?Q?+4/gLbSb0CPs6m7tBksoUd4nC04KSN3c0I/5FUzZzWo9YOCtSH/TEMDbTlB3?=
 =?us-ascii?Q?VRCA029qcaNaxzX/MalB1SCTGyzVlqc9RIm/lY7F6CNn/VBJBEBsZ9uQIPEJ?=
 =?us-ascii?Q?VzVTHYiAdY0AWoD8Dvel4IRWaK1xd79tATMCW0BuPp+xrp/Eaa9VEpBJ5iae?=
 =?us-ascii?Q?T2fOb+2aRlzW1A6RUU1zotm11vRqpLpvVKYISo2ZYf3J0kin9L1eKAgiF4hf?=
 =?us-ascii?Q?wyqF/Ubg2FHWo7iS+en0NEWJI/SyZbSV8BwUo017EbykHoquVluy6ZNOkJFS?=
 =?us-ascii?Q?jjQhNidUtdE++syRnGslx/e7d0yP0fDyxCvw0EUJTW0bWF0/3gCZz88sjiiy?=
 =?us-ascii?Q?gHHccDEA9M2Mb2MW4PAR1nL8+4xd1qI+g1cLaOoxdxJTbLWg778ZPnpLjvsR?=
 =?us-ascii?Q?yOH8ZVOUeowny+0mEjFA5nTm1VusWypDkmMDkdTRXIM9OaCfukzzVXiISYPl?=
 =?us-ascii?Q?rf0pHMJNY/tihd/NEkcx/qx3hvSLnLDkRZKCcNCcZgFlXfTDfoGt2Wku9K3f?=
 =?us-ascii?Q?3O/69FszTi+J5QPMQnDqkqBnohJ8wkrK6RO6KTebz96Xy3FAs2zgXy0RCjgq?=
 =?us-ascii?Q?k7iCY0DEItBhvcVy8taIad4kI1VpqCofDYKb01XNM6DeouOGPFk8o/o50L5s?=
 =?us-ascii?Q?q8mRzwiwQ+iWeKCGaDuwqFr3b8qIlIPtcY1BPzucAeSEfwvPsgq4zIsp8P9E?=
 =?us-ascii?Q?IXLx8fzU644anKLnnV6gsEvGA4iXddAySx0pTQdplTaX9BbIyzhbptGqEG8l?=
 =?us-ascii?Q?FWY3tVIBRbbhiH1sRqiGNiNjkE6NjsQOglXkvyoD/Vqe07wvLxcyairxErO/?=
 =?us-ascii?Q?wF3rJrTEJwjVWdKnWDpdbWfL4PVAMTmROKBJOtr97SpkkzpHAluiQ0pgqmO4?=
 =?us-ascii?Q?+H95AgtQSHD7C4GeJmHmVuOELuR6e6jatlvhZww1QOb5FgI4uqIOYJM42nlI?=
 =?us-ascii?Q?Xs3M6gpoWc45+fGYNNuRnyHZfdHgB794lHQpalPPxvCegbd680y/G9BtunvH?=
 =?us-ascii?Q?0W7nKlPVA2kiHCdEshTQ1QtPPfQQo2tGCuJI3Y85AEcneQykaR2G9nfeHBPZ?=
 =?us-ascii?Q?/aE7GkDsbZHgU5Oq9R4AAtHeZzC+OK8pApr53winM9rTXpItkLdMlxJQGsC+?=
 =?us-ascii?Q?6SdWBkkcamE76m68JQhEHOBC6dcalsuuukrIhyXE6jVkaZksSacte7ykI7C6?=
 =?us-ascii?Q?YQeGuTtVEJppbeGvzxEUklrspdLMWmiKW1Du7TXlmqTFfUzFaBZyLY/RaioM?=
 =?us-ascii?Q?isXpHZVRHNSO4PkGi2tsCy6ASpwbDbtxP5LqVNpbhSXM7LQ1bW1uz6mRIWe9?=
 =?us-ascii?Q?LbkYh8NaDqGkRPiZPDyucIKAj7TJxnfK0MdKZh2x0dZEcHNbvdhNEh+Z6dzC?=
 =?us-ascii?Q?QUUUVA5mSNMrRwc7RsOfe7KDDejRYSEAwQMcKjVDdGwlebUpDZyBhongHXYs?=
 =?us-ascii?Q?Z3W2vRxF9Dv91VJv6tQlsTPC4EQs/ESqoyCDGTrvmfoq6zNsm84+6ZMheJsj?=
X-MS-Exchange-AntiSpam-MessageData-1: lwYnIGQzpVGrZzliycNn7r2Zc6xEq1eCkGM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed59159-4c5b-4ca4-c19d-08df04dd1383
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:19:27.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8zCBhJAB4JeyTSnCyWCXP9DGe77n1/YKc+df4ZLexidVWkyWMRDSUJQAezpiI1Znk00iUWp+ebbC6Mxb4U5hN9WxxnPOYjM5wuZUcI9VWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1233
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 08:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244521

On 8/28/26 08:45, Leonid Iziumtsev wrote:
> On 8/27/26 15:54, Yoann Congal wrote:
>> On Wed Jul 29, 2026 at 11:35 AM CEST, Leonid Iziumtsev via=20
>> lists.openembedded.org wrote:
>>> Backport patch to fix CVE-2026-4360.
>>>
>>> Reference:
>>> =C2=A0=C2=A0 https://nvd.nist.gov/vuln/detail/CVE-2026-4360
>>>
>>> Upstream fix:
>>> =C2=A0=C2=A0 https://github.com/python/cpython/=20
>>> commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
>>>
>>> Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
>>> ---
>>> =C2=A0 .../python/python3/CVE-2026-4360.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 148 ++++++++++++++++++
>>> =C2=A0 .../recipes-devtools/python/python3_3.14.6.bb |=C2=A0=C2=A0 1 +
>>> =C2=A0 2 files changed, 149 insertions(+)
>>> =C2=A0 create mode 100644 meta/recipes-devtools/python/python3/=20
>>> CVE-2026-4360.patch
>>
>> Hello,
>>
>> In this case, I think we can consider upgrading to 3.14.7 (like master).
>> Can you look into this?
>>
>> I'll hold this patch for now.
>>
>> Regards,
>=20
> Hello Yoann,
>=20
> I will take a look.
>=20

The upgrade patch has already been submitted to the mailing list, so we=20
can drop this change.

--=20
Best regards,
Leonid Iziumtsev

