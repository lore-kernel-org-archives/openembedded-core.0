Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF118C43211
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:07:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37149.1782486420445384651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fIaf29rq;
 spf=pass (domain: est.tech, ip: 40.107.159.4, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It5y5xbPfyWCRwd2SXVMdnPEYFlzO7/dn9wHjX2IYNdxiKaUtp9NSr/JZodVGp0CPMVIYjZ/nYPXJrY64uNuuZyuuMctRl+eUe51/eAbLg2ppGl2dwTKvLD0neQC76QN3Jl9bRxU1uJKV7xxczOzlQPUT/6gdgn6D4iY7kg7JdWg3rBoQEWM77+37rlN1/9eCQHWE1GjmmQxqW5CS9IgnIhC/uvJYZXmmEcBPSlavvJg8dE1NDMCeNkDoa0Cyc1yE19im1wDdtYlax7bHe8wdhkXiTKRQrTo5HzuSNNT1o+EfrftzUq06hScMSsqsKRlCn/F7bAhVBX4XZMbw3eB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3VBIlPewAv/z6ZrFwgExC2DHWkWASRLQ657P1o363M=;
 b=kMLAFATmMJKwXqv2Un0a79kR7P1JC2iO7xuwPI5EV13PusVeoa+GdIwUAs6rfgqRtukHR+dtgfhBRMClYHsQUFA+uQElHLUde2hHh9UHRwQZM3IPSAGnt5fKfB174/NM27fKKuDIvfSQvZ312G49MOH+zu1VIDsmB/Q5EgnrbAet0cE8UE8wossCRQ8PTnQ76JqIZD7SIwI5JZjcvgiqOLJWqjAfrKdSUP18hcTef3HZ24F2psEhQmU7vcTYWVQSWBoLClnuOnfY33RqrCdLo8lHGMVIt1uQxhiJq0d3V9JxRPt+zqOFa4tI2I2zWSa5HqnRGloonj1VzWwZm2xR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3VBIlPewAv/z6ZrFwgExC2DHWkWASRLQ657P1o363M=;
 b=fIaf29rqdulTWQmvTfwDnd2de6exbwROhDZ7LAnoNsYuzpALHvJ8SOJz8rhki6cfkSMqybgdyNFSyy5xLTjFPyW0eEgHONVkpAseB0bszj5wK7bsElvU6xkfUF8XGXCvd7ehl901HydiP8kHRsWCqovoLJl/LqPQP1RebPtAVDnGiMDA6K1zu113ECBwotoddnN8deJoAoZSex1RzwSOVLz1sQoKdmil8SqHC+AhvpI6yQXrOk2ZoOIbyY+yjV7NUQljNXRNr5EF629vDgAFLrBCGs9lut6mGpDiIkezamzXxIDhAKxYM7Oh8CB0VhGLpyCv4uvz0Yehr+c03/MH9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 AS1P189MB1912.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.16; Fri, 26 Jun 2026 15:06:57 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 15:06:57 +0000
Message-ID: <7a21bace-90b2-47cb-8d23-f9f6811ac98a@est.tech>
Date: Fri, 26 Jun 2026 17:06:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 2/2] oeqa/selftest: add copydebugsources
 tests
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1782189065.git.anders.heimer@est.tech>
 <a65e58b8e68dff4552c042ee39dbed7055dea4b7.1782189065.git.anders.heimer@est.tech>
 <9F1500A9-372C-4A9F-BB06-C6C4D5B8770B@arm.com>
Content-Language: en-US
From: Anders Heimer <anders.heimer@est.tech>
In-Reply-To: <9F1500A9-372C-4A9F-BB06-C6C4D5B8770B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0206.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::18) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|AS1P189MB1912:EE_
X-MS-Office365-Filtering-Correlation-Id: 8482b35c-4474-4a84-a21b-08ded3949114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Kt8+Vgff19S89n91AJ/4W5jDS+h4GAg0ooUui2yTBBS7xAAVgzgL3vGJNERrVRsFN33IXeaZjjRNa4RCXDNqs9lJm0AqU1Uf4yXNED8mezfoDaEsAlLGV4A4kAR0fZnfohaJUvE8hmPd79z6UpEPfi4IEMrevcUpAhjHwIRCnn+SDbk6YXuaGrvixgsmXUYENSIuB+sTXtkuh7jY9jWaaLiFCBA6P3Br1ZO6OLtmAblq6eJ7Vm+UMHnbA9nM1P+WSfsfGcYZH//Rq1bn/zSZQugB+Prs6ppodtMEiCPj/qmpH48kau8Didm+i9QJtj9wRKbg/bgawmy/2fL2nIuQG64ZQRDB8IplQPn3BWpoCOoSig6am5NxESitj/MZ7EpEpGI6cpTjuPBit0nmrWbpUYe5PLf8ytde0z9xEN34P1/ZwPhzBpTAxgbLAgM0+HrrXkmg1uk/+Dz+RyeNVwayLhHLj7bvYmWdZi1UGj+dLstat5pIp3rOmTfDuFknZwsUZ2XA8NZo5C2OfueySwI2qsEh8IkKmlRgZ03DNNNjakjoWWr9eD50RuEoBNZOaoYmLBMd0qi54BPSHjACiCq+8cG3ojqyjhQJv3t0ASasyUHPeJCy/fuk9QEFTYQlTyjdGKFf7uq/BMnvnpCWrBHfvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8dBq2P5MlVaEkMcZKRILtdWPkDvb5N9K97j/0uCHj9SAWkUkfsWDgeOiGgzm?=
 =?us-ascii?Q?uVeeO9uvngVwW8GOccqHYRLLaRIhoRihbjEWpyOLKKQUY3xS/NCaxpqDPdIY?=
 =?us-ascii?Q?UfhzJP56J2yPkFXVw/R5NoqPfUi+3EhUr2IC7YvlDI7k5ivqwt4c5MKqqTKy?=
 =?us-ascii?Q?bJGqlzsjjVOZYgvsCk/iU13b5N0FxowAxQN8qzA2Q7Bf44b6gTN30OWstGP7?=
 =?us-ascii?Q?gKrmnXNxPOWFMTLvX/2nPAriTbN380fmnCIXp7KJBegwK2xFWq4V6BHeKF9G?=
 =?us-ascii?Q?GJR/DzknjU/0dq/DSlpe8aMKHDhI0YOj+kg8rdXB4lMJIlajS46TDmmEd05O?=
 =?us-ascii?Q?B4DaiGlWDLp7gCib3hXgHNaoOxnvXGACHwvnsb48Am7M9hKYDfqsrmSnHtd8?=
 =?us-ascii?Q?tiFIfRdM+4V22PClzr3jIW3U3p+GP2kkupHpAwr50cRXzxONSC2jaIuoPJBA?=
 =?us-ascii?Q?5hbs6jxKmTbsltivBTiAlRAQ9T8izhXvx/PLh/TdE6/F+zt/lrbNhWzXh4ir?=
 =?us-ascii?Q?X7Cxte/nxsBal6K0iTzAGEAFhYouAVfUUDZvlqsrZc6GthsrbfU/1aNalCcx?=
 =?us-ascii?Q?OaN/1/klDy36FU4ENqheGg0Bv8RmQGfeZLSLpYHv7WHMI6ccK3SwzRqt8lhs?=
 =?us-ascii?Q?Wvj1itw+dggBQeMe/e17D/wGcRLWJfJtJSi3tLy0NHjtPVUfhF3+DYavc8IM?=
 =?us-ascii?Q?bOc+ngIkKTEMB9/3CeQoO95s/gza8zC6W7WKVyrpTN9AxQNT0snrDwNr1KRG?=
 =?us-ascii?Q?eNa7RIDRalO3w8J1c03L50I6lOZDYAP7qFv+g2wVJ/XCppuiBpDU8Kf+DI2P?=
 =?us-ascii?Q?MsEYI29zhLAV+QJoUyUd8ZUX0a78ldjy0e84bHUygbWBu/mPzXp5HuoOfIfK?=
 =?us-ascii?Q?vHmAMqUkx8BXkE0wKhYkjJA3ABzBKpagOVHWLrqI7yNJwAl4m8zEuJCHi0tP?=
 =?us-ascii?Q?ufNt0Oe4HgtI+K2bLOAog4T+DDwc2Kt2xFsJ/eAUdrxZndmtnv0lXGEFvvUZ?=
 =?us-ascii?Q?AIiF9AgX8AWFmkveSUJ8etIcjiuR6Xr0sWG1lZHWhsqPtws7BqMRVlFwB5OK?=
 =?us-ascii?Q?goxj8VL/oLI52Q94pfZQMlHL2r7Lz7F+YwrX+hy+zq5azmP67vTiXgCXn9Yf?=
 =?us-ascii?Q?EzjhfN0lxjhDVBeM4KnawNvk1Eqas3ivHBkHOllz5NkONG+DOo9yFGaDMq/p?=
 =?us-ascii?Q?BdOIxhJ+944/O/5VGxV/FgNBRdloqffy414HhycVcWlHTRpU+++R4hUl3kFr?=
 =?us-ascii?Q?CX2eAcMmT0VdXOOUCvbJ+iUqU56QeHwEbgAlN7aRs2tcnGDZRpsfv6eBndeZ?=
 =?us-ascii?Q?eX5NRkd0u/TihOXVJUsOv6fJ8sNb79UUYYka2wXOCTrzrCx2R3JcsgUZjUmC?=
 =?us-ascii?Q?fV3I8zj4hEZj7qCbLyHWyRjzDxXcblO1yKKPbDadfq1j9sbLkF2lKgTi11Y2?=
 =?us-ascii?Q?7GoHKTIYixHGZPi3mJNFpb9CrohiA7fb+sS5arewNPpmOYX1bdJ/CPhWHl2S?=
 =?us-ascii?Q?VjCTf1+4BcjzSS8tEu7g9t7GmXua5PckCZLf45K1NvtpdZH+KHTBG5os+cla?=
 =?us-ascii?Q?COrPIvXv9RFCgJ5mhm4YicEfKMbySyGyJPe1U63Ry8yUPyShv+5OvmV2gdqQ?=
 =?us-ascii?Q?fRzmI9Bh6KqDhV2nOGCfAXP9NcW9ZWFpWXn91jPyfrgsZWc3gnK5WkjTgThP?=
 =?us-ascii?Q?NyghAhGgczt9xqk35afk0vryS273+VVnO789qH1plSaE5kcaIfxWSHA2sMOC?=
 =?us-ascii?Q?YXTBegA0qA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8482b35c-4474-4a84-a21b-08ded3949114
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 15:06:57.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPntzFzqjiXFH9K3DY9nHTWIeaQ7WdWZZZvMyPTnQbwhzKJWOjlZh2PC7XAcEo7GwYx7Mt/CYd2T4Ns6NxxnjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239646

On 6/26/26 15:52, Ross Burton wrote:
> On 23 Jun 2026, at 05:45, Anders Heimer via lists.openembedded.org <ander=
s.heimer=3Dest.tech@lists.openembedded.org> wrote:
>> +            copied_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/"=
), "real.c")
>> +            moved_source =3D os.path.join(pkgd, debugsrcdir.lstrip("/")=
, relocated_name)
> What AI doesn=E2=80=99t know is that we have an alternative implementatio=
n of path.join in the oe module that doesn=E2=80=99t have the behaviour of =
os.path.join when it finds a component with absolute paths in, so you can r=
eplace those with eg:
>
> copied_source =3D oe.path.join(pkgd, debugsrcdir, "real.c=E2=80=9D)
>
> Ross

Thanks Ross, good point. I have made the suggested changes.

Best regards,

Anders


