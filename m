Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3420CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:36:42 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.40])
 by mx.groups.io with SMTP id smtpd.web10.14633.1759829800452479551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=IxmnFeVp;
 spf=pass (domain: cherry.de, ip: 52.101.84.40, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd+uIQEwQVk1EwvuWhCCbtExj5voGSdmaNBjbnwcYtkuvLwhPoIWS4GSTITMDXeJtD3PFKbYPuRH0hTWZADHy5Si+62ciP4X34eNc7vrVWq7CRsXjmV+3MYcqjY5o6RqYcJBbiFOGcsQ5b+X4FodAR7Z/NO1zTQ3YoubBbc0Th8EKLi9p6npRh/3d16UVIyggwLI8/eLSZlF+o1f6F8JRE9ZpC41RXbTWyPImKIbIvi3MQpiurqbR8clTYt7NGrr74pFRY9Xz7QxGbQGZ0glh8I7uE2Vr/5IRf6bAqzWRofgkb4qYB+2vpW678ij7gDMGZfPxSH3TSnttUad8mz4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqG9gYAOHvYPPMyWRdJT7bblp9VhocosggBN4qgeIvQ=;
 b=Qto6sc+eN7cR9TQoy/xHrkhZcOMXZNyieYeuTipCGm9GZAJJCRaw295vsWLS/65Rg1I/yvlM5LeT+aMWelWW/oottr3yexXc2tejmkXQ+qZmBHSuM6PB9oDlm8OTro80d6JGTbQZJ8GYJFk3NhKLPgMiyrADYs9ZTGNStBm2PNg78y6lyNh/1RNWdA8tXSYWndNrI5UlCzJPTTRLUdNts/cEXCHZJjQSe1E/MXo62hjYVbDDmQ8MgUrFDSjHJFNUYlO+rnKW+S/asoi/dsP94QpEtYYNY5wPNIVxi4d62cqJpij39xQGzaUqSoxe3w+YRalPbT4PYcpewCapGhe15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqG9gYAOHvYPPMyWRdJT7bblp9VhocosggBN4qgeIvQ=;
 b=IxmnFeVpb6gwhVg1uFFHRUrDfHplsrKyJCGUxIZ0aOhu5uP/ScThxKBqzmcC0Y/NfsJGvTCkXNgGDtazvshu0aTBT8REAvd5HQhpkVZc2zz4jNoIDwg9KjBqkXizSmCNFIVAO9+4Nw0AMbUFzJ5/10JX7yJOkFm6Za79dgU05wA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6869.eurprd04.prod.outlook.com (2603:10a6:20b:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:36:35 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 09:36:35 +0000
Message-ID: <18ea0a5d-036e-407e-96bd-ac1e6209ccc3@cherry.de>
Date: Tue, 7 Oct 2025 11:36:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate
 package
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
 <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de>
 <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
 <9179d213-ebd5-43d9-8748-6981807c29f6@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <9179d213-ebd5-43d9-8748-6981807c29f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR5P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 729df66f-53ea-483b-93d0-08de058501b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?f4w5m/92opWeQIkw6VzrwW+rwRMABAPX6+j7/3FS9eIv2kZuOXZTeUn6D/Am?=
 =?us-ascii?Q?q/6FMIeJNpkoNS2YnNRpYfR6IKtr4BJmr7b2hK2MV0/oM8HEd4m2kORoPvXW?=
 =?us-ascii?Q?P27E2BUht2P4JpwZT1ldvbzsoGmEoqzFHSdORKZf4BMUiV+U88R7hpHdtlCH?=
 =?us-ascii?Q?3bHkFcntMh1Agh9dvl0B3aAaa8UC2xkftEmky7hg4i2FtaeKaf8Tn70Zc7w9?=
 =?us-ascii?Q?aAEdiSHSZsS9BQsCLlClR1AjMviVI5wZYhp4VVQFP1bByuCgJmpMoc9f558p?=
 =?us-ascii?Q?i1S4Tu2PPD3/Ndh2qdtlvFuQLLMw8CXMBLKZkTx3LjRdiTYvusgm18AiPsCd?=
 =?us-ascii?Q?9VZzQnbzA64fei1SoihufQRAMjBYlQv7pwN5kWFx4tOrMiaBwHSjNWkMB2uD?=
 =?us-ascii?Q?IOBqxj/bH7MVtgqzZqavtAL/UwydTMz5q0fapiuz/CnsyWeEEp3A/U5RfYOl?=
 =?us-ascii?Q?9fFERIKgCfuW5OlPfbScM/zV9mEAYYr9D7uXVS2QEOU7dXLgMKnZNolyQyTo?=
 =?us-ascii?Q?a9ogRtY9I6h8sVpoF3CClRzFSUxidf1SFTLKoD/sWkxbqvu1Q3Gqdsg5VN+o?=
 =?us-ascii?Q?x1tLeesoSn9eEdSret2wwX/h/ouP+60UjKgJGghi5tGqF6JzYFBLqinnRB0x?=
 =?us-ascii?Q?b0SWH7hp3SXeI/7D66UTSNsULuq6Sbyzyh79rXI2RCs6efhoUawFLpgH76lZ?=
 =?us-ascii?Q?B5T9RlkwTuKeVxDi4DqJiYGLgD37FWDSem+NLaKCN9l21hgcsy0CIc/B2ITa?=
 =?us-ascii?Q?kAzXPqyuBwSLLfTsEnSn3lCrpZog/kkTO0pkqjt7GNkVWWH5TJd6e4/3AIot?=
 =?us-ascii?Q?0SZeD7sT41DquKAfDrAs+BCiTNSIuhSB+3pPjqrQyo8B+mxokGfraPIWt4LH?=
 =?us-ascii?Q?9a888WQM3vFaxZScIpDRuwqhGejZKkvgJqqYo5vh3d9eXwINxbs9Jhp4Bskn?=
 =?us-ascii?Q?jZGS/3yDzhDxCzMYt4FQjwfvUFuh6nU0z1bR11a/r50uZFei2lhATk6hOeJI?=
 =?us-ascii?Q?oWwOM6lPCVfwSp1UiAmNzqkB1MFLfC5Ihy4+4Ynnq9BctVwwC2tvWT5KqFY0?=
 =?us-ascii?Q?+1/5C5Sr4cbCQiqr1C/4mDoVlymVOkpBofOXrSC/9n2KhZ6MeT+NfqqVkHwH?=
 =?us-ascii?Q?lZngaYxBBwB1LaZej+pRpwjRj+Sypeh2UGwllJUzyhbdm+ZLTuUtJDnXkjFs?=
 =?us-ascii?Q?1L9Sj/JlYifeQJ6chuz1tFAVHyCohP/tmI05i2ka44RRR6kSspZzzRcwLJIi?=
 =?us-ascii?Q?wA2CkvS/v8UnhmnVKc5ic4DREcHROcVwoLieJ7un12i7flEDmpsm1edDQddJ?=
 =?us-ascii?Q?QpLz3fzE9BE56v881DdYqjdwhDgF49ktftU7gpycQI9KBBlyo2CcCzRoyxP4?=
 =?us-ascii?Q?gSfh7T4Xpjo+3vA3CLycbxPR5PBvhKpSl4h7yMsmJigjOJ4MYBBz1MASSYd9?=
 =?us-ascii?Q?7ZIyVSB7aBv/52lS6fcKlL86vJ/RrKe1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?W5Pd7IF5KWo/aVkuFE6sslVznbKY0ZvxWEWkWVJSugJcZ8bjEjGsmACuaKeS?=
 =?us-ascii?Q?oPcIS01G6AtgAEVBYwLobhuRwL7blV7LWNEh8JkHG0DGahlN7jgmo7+89J04?=
 =?us-ascii?Q?PHV0bgPTcphN4/acZErR6ldx0qp5GwtGGoG9Wi23xaf7EJoZ7Rj6V+kHICmp?=
 =?us-ascii?Q?5dSd5h9LzpOqOrS/g25AilwkNG+RJkrdkRQmEP01SMiRzaMQAO0SaxeSeGDW?=
 =?us-ascii?Q?7cakNeXLwhCvqwO8DVztKbS5O+sZu8tzGBU/onb1VdmSNEnaC/aZvQNb/ItS?=
 =?us-ascii?Q?1XOmLAYKya2lcAV+iuONbFq8H8p24UKD0oAgoXqOd+udSPez7HfINpUdCTmZ?=
 =?us-ascii?Q?4JCgkDlGy7isCJ3QquWc8z6wysWzkDksExHXVyLqeN4KBcK1pUmDcSNjJOol?=
 =?us-ascii?Q?ZHWGtdCRq+ZTCiDptnp2kboZ+HwZPHOB60p6Unbvn2f0ULT0JJMEN5xVNWbp?=
 =?us-ascii?Q?d9ZFwqVRY41DSM6IjDH7TWBa93bKhXbfRxP4higbuVAztCR1fLvcQyco+qUa?=
 =?us-ascii?Q?KBzl+lFxJXaz3JWQcKdbZjzXUhpzh60VAu2cGUgujYvVCjaB61+r41Mzil64?=
 =?us-ascii?Q?5q9Za3BylM45VDL6/izjTQ5IFcMVlS3BXXSUY8YYFvdLpFOYYMkR0dx0mvm3?=
 =?us-ascii?Q?ffonRY4cKk42n+4nHB2mDH+Rx/MTLBgfWfUR3Pg0sddjrZDwMjHUSY6HqrCA?=
 =?us-ascii?Q?Zp39YPLFSz5JZmNsKmGjvBxz/sM7fzLslMl2NNheLc0F2DY9ebs7Lc0d//zJ?=
 =?us-ascii?Q?ET2qjwM+3OxzARUUWmnzTQ4QNuXsq0F8xh3anlnfD7yFAOGUPBbwZVBOEp81?=
 =?us-ascii?Q?z0wU8GMquzP1Tur/ZuyCAlcqM2DPqQXJR9SoJTEzvcPe7Q5HQliz0CtdjR/X?=
 =?us-ascii?Q?F1BLWrLVojMPIQJt4khuk6KF04yix7qXHEpk86enj27dDh3TQb9eaWQ1GoLf?=
 =?us-ascii?Q?LPOmFFnw2EFgF/chAGT1Xu+BXfP897YKOJG3mLuw64ZPPsWIX9M8BL1rWkrx?=
 =?us-ascii?Q?IhGWtXzw4ogv4QvX+HEsdNBqRGcHtwV6AeOBXwbJnCLNYsK3LR6WtG+tKztZ?=
 =?us-ascii?Q?e27BD2Wy0vJ+qIeaRSth/3RNPsfDvCzV6Km4/PNvFqIvXLXzacSf2xtg3K6n?=
 =?us-ascii?Q?IeAXnOTdUVQxOS344nNsXprSiQpSkkVA2YIMTcRiOSlRb2VaAwSSxtMIm7hg?=
 =?us-ascii?Q?bweboT/sjTqlbjHHfkkzABsQqj0+rmIAbe0Wde5OjarrSEbzYZFFhwlfPp5Y?=
 =?us-ascii?Q?NABD6+RtX5EI1mAs7tN4CFyYss6IE+uYJsJH8yO+fS3OvsP9Ua5oyR+6jGGw?=
 =?us-ascii?Q?1k0kJD5mPs7Vnx1r0vrAgHWXe5PeBe/aHeQ2lCEyHxp5sHIA4l/kmrzDc3Dz?=
 =?us-ascii?Q?W9fm+YWZNwUA0vTBn2IkuXcxp5Sg/MOsmARPU0zNL8KlxnMaJFcRw5jYemI7?=
 =?us-ascii?Q?FkDXqL8IWYxRLAWeYOCijlzifpoq3qkoRMlv/GeVeb8lk9MaqF7O+k2Ij9ZW?=
 =?us-ascii?Q?w9KRx+stQgyvDXtBjMEZN/rc9U0j8tJzBxq0F8TcL0cgrIYJr1KDX3gVDmHi?=
 =?us-ascii?Q?adRPpaS9+WpbMP03u2JhHgxtIFFc35QAELvCsJIxh4HCW7Vq1KPZHnz1DU7r?=
 =?us-ascii?Q?2g=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 729df66f-53ea-483b-93d0-08de058501b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:36:35.2349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOQuJPa+c0uGjOu+UfIBfOlxhiMa55hgmeABYJyFHMTb20tTT12hNbEGn5q8ahCYY9yObi1tSJ7IicqHs0n307JeLhHcIe7U4RaNv/u+JqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224516

On 10/6/25 10:51 PM, Dmitry Baryshkov wrote:
> On 06/10/2025 19:39, Ross Burton wrote:
>> On 6 Oct 2025, at 15:01, Quentin Schulz via lists.openembedded.org=20
>> <quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
>>>
>>> Is there really a dependency from demo applications on the various=20
>>> info binaries?
>>>
>>> Can you justify this dependency?
>>>
>>> Otherwise this looks good to me.
>>
>> I=E2=80=99m not Dmitry, but I=E2=80=99d imagine so that if you install m=
esa-demos you=20
>> get _all_ of mesa-demos, but you can just install mesa-demos-info for=20
>> just the info tools if desired.
>=20
> Exactly. The distros / users might be pulling mesa-demos and expecting=20
> both kinds of apps. Let's not disappoint them.
>=20

That's making mesa-demos kind of a meta package that pulls in everything=20
built by the recipe and at the same time the only package bringing=20
binaries other than the info ones.

Can you simply add this to the commit log/as a comment so that we can=20
remove this RDEPENDS in the future if we want to without having to guess=20
why it's there? It doesn't reflect an actual dependency but a personal=20
preference.

We could also use RRECOMMENDS here to show it's even not required per-se=20
but we think you probably want the info packages too.

Cheers,
Quentin

