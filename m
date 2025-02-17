Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED12C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:05:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.88])
 by mx.groups.io with SMTP id smtpd.web10.57418.1739811939537529997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 09:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=c46EjqOC;
 spf=pass (domain: cherry.de, ip: 40.107.20.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqDp3Sni6KM49KOXg0BIgEq0sMsflMaGpwfwoNLm4s86oj6IZJAXnLWBOE2c/FBHkAji1mymqReqff6Ujg5isMpHkaJmTNyHCw/pzPfQhWgGLJrjTnWxMO3so/Ai56FjC2yB/lwJg3EPsxiHzARU+zKhhrTYGy75eGoxpssXk+C//8dCOvhF8pHofXhPvA6hDhqn1hifzPgvw0QU/JBmKh1Ek1P5X3ejH72mtxjEafcxtterpUREU7b4RwOhhoWsaYPR2Zb2UM2pdi8WQ6uNDoSNsL7u406h1tzW/50/1uBKwFmVQC//mIkkKlXJ6R9y/FQJ0XRCfrFfKypmMkCIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kncakekpBX8Xtg0RVfmcH9C2z32Na4j7TIR7Czfb0U8=;
 b=cGyJs4Kc0kEPfnPb7JdktjlKjf6mSipwOjLRweX1sLhG4a6b78Zk4fPMH+/XNJxK+NM5S3Ov8YiNNoGZWqRFKSTugkcx/DR1mUVVXOjYkNNh+xiMe+k5hWONrdXEcjSzaG1/1cxUH99u3KML3mLtbbKlhMnREyCImWhTAs5plt36fMZr6FCx8oTgoTRT1kbgZHJwez3qhz8J/dwyQKKYSJ+TidYl83v2HwObksp7IFHNxy0TdrtLDCKVTjtxqzr9IScydRzSEtaD6Zu6S0TdJVg8yIUnlfZT3plHdJy4vXr/st8lvjwT7yJnfdjlOR5A5WF13pSJMk6Qs+f5KAKCbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kncakekpBX8Xtg0RVfmcH9C2z32Na4j7TIR7Czfb0U8=;
 b=c46EjqOCjtm/787EVPDd3kBfLSDg0JybNcOQ960CFYNK6CVg5HIx0H9Oxi1TiQX9IIqhjjA39TREaBX0rTX4ar2kugWD8NxJ+nPQlZd9YW9A4aggNttRC1oM61chFjs1iafwieEwlzunD3K06jvdoFs8xDuaAkKaWHR8ZxdyORs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB7174.eurprd04.prod.outlook.com (2603:10a6:20b:11a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 17:05:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 17:05:36 +0000
Message-ID: <1dac770a-f6b6-4b30-9c00-4d2576527409@cherry.de>
Date: Mon, 17 Feb 2025 18:05:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf
 provider
To: Alex Kiernan <alex.kiernan@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <20250215165545.1929-1-alex.kiernan@gmail.com>
 <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
 <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 61aa4837-51ec-4ea6-891c-08dd4f754c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hqL+uN066LCtO+yQBaQ5Ij8xSTn0xoyjz3I0e2OqUVcfT8u7GPyvsdHY45Vn?=
 =?us-ascii?Q?/Bu7daqkFp8P1KrDbijK2EGaWJJYliMvvuErAYdvmKjb56RoRDLWMknTtWhH?=
 =?us-ascii?Q?sJfCB9r8BwkrxsrpRFki2uJw22M8bk8LVONlRSEjsdue1l4AQLd4j7k+7sSA?=
 =?us-ascii?Q?9BomuYlDOWeqQ6Jj5FPsQerqpF2uwqgUFMmCVqWHjiitmY34yIW3awj6fCAi?=
 =?us-ascii?Q?RaK+R2fdVjLRrdE7rS1CYG3myiw4nYBw8bndTp28ntw7TukX9niDc2ejk3fi?=
 =?us-ascii?Q?PIDup7XuC9dMboKw0yUKXjI0/wDzMxOXdH3bp5SzBJGONusqO69UfpHG3OaL?=
 =?us-ascii?Q?BHIsnNOJOo8wRanqcPzIgD01rBdNMpLkW98w6oFXYNz3dJeg3fZlr9IqYuZ7?=
 =?us-ascii?Q?KpetCPJSRU9IPj67OlNg/jp+KXm0t6HoF3nq6SMUAKvw5vd9HLy8F2gLF7K9?=
 =?us-ascii?Q?Z4SdLcCdVbj2i8J6OO9WpIKa3syUj+ZkAif8PK5EeNVPHZoH0UnX729sDoA0?=
 =?us-ascii?Q?MEV245Q9KbZpek8iqwryCLzTqiBmzwuFvc+7sHcOXsbGdTORnonnWSC0iMSw?=
 =?us-ascii?Q?YU8CIy0pXJiXb5qhfpqvfUAJZ9JutI1A2s58sXMskDrd3wCrizADceb4ZV98?=
 =?us-ascii?Q?u8e3PUKvbb0cs98fmuyeu+AYyet9JHWxisC6GJU/ZO6GHPH8R86SalNHzfOM?=
 =?us-ascii?Q?O0xP0EhA44uGYLHKRQqC4nmI5eiKV3VtQKkh30JPXcTiE6h4BWV1jQBVHfqN?=
 =?us-ascii?Q?XV7ri6S90U4kEJjQ6Fqo8D6nRatyRO3rYBQLQMe9JiFiD6qZOwpr4jhN5KbG?=
 =?us-ascii?Q?fVMgPPCETuI94b4+htKBdE3miN9dhbGmaNjl0w3RXeXKMmILEKqV1Z419I1r?=
 =?us-ascii?Q?TeP15trNZeyWdH9U8PFMcyOYnPHeZgPBRQE1hD6Py5nR5uCQNzbB3xzsTdLm?=
 =?us-ascii?Q?h9s0OsPSpRNGpKcsV2/G63KMYcR2UxzT+3pUMHcoM+3XN6/dTgusmTspy1CH?=
 =?us-ascii?Q?nyAmrNMJynRuFdyw+48ZhLbisnJ4+DrHwKKe0jK/skBXAwvZYVsLS4aMdAFs?=
 =?us-ascii?Q?EQXIDmgWhHvT85QfgsxXrdNWIYdnf28gwb3Wir93z29wsysGMr5Q3kKAszFr?=
 =?us-ascii?Q?EBpCXwwBXl8AsmU5xje67NdujBY4agD9KuZacsgtDqi5MeKRmJ0DBLeXuOpP?=
 =?us-ascii?Q?aX/wlo9Xrw3mYu+AUlSEPLLgl1cdgtCeZXmXMJa1hmzq/qWlJu8shdU7X4IK?=
 =?us-ascii?Q?LMSYaFwGkxVfpTY3U6iAmXlUcil6jTmM4NUA8zqQNPcEwYY68M9FN9EPFbUr?=
 =?us-ascii?Q?FNARgMSw9p24d137DxZAOdz1JKsQgknrng1hjpkwG5jMQxfmdx65fDyYt9Dn?=
 =?us-ascii?Q?vMkQaIfwah8BDbWl/xT5G0vzOkPH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cjTCUnW8hkMwRNQxHXr4E0pk0UOCScYwYUkYHkPLSZQTKP4OMZ/OPl95PXc/?=
 =?us-ascii?Q?Z1Dsky+CKGvWWKXW8625qla31l5mfG5YcZ/bt5tXseqyWMQ2+Ut28a4I5UMI?=
 =?us-ascii?Q?aZRtRla8hg56E6R6uyisSvsqUa5NHSHRmOmNNKaCnJ1BpVe04EGO2S4lgcQw?=
 =?us-ascii?Q?/D/oLtyUfOGp+tVBrZOcC7jtcJwSEs0PiV+VKUq+6Rf7u9J+ahu+6+aS7+rz?=
 =?us-ascii?Q?G3WgGbTsXDv21UXp1qtKHzKBKP1CCfznYhFde1kjkJ/SNMZaeiG/7biyGmCD?=
 =?us-ascii?Q?/L2c8sMZdWni9dUQaUlR2SIjDxqs7XGwOnEi4MioKmC5PHA2r1sr7ESaxotz?=
 =?us-ascii?Q?AVhfHGkmn7MZvNAw280ZFThl48eIfofqLOz5i8tph/GKLFhZ04F+TklzF6bQ?=
 =?us-ascii?Q?wY5wQMLKVtUVGB81GvlZyhLiqkfXub4AaT4OLX4dms637g9JjF2drFdvgSLq?=
 =?us-ascii?Q?35XFKrlh2hDJ0exfDpibZTdJKpIA1sAoEIdE38IGhOjMq1M8+mxARHw7n8Ia?=
 =?us-ascii?Q?dgUEdh/rXAe57Eozw5BytGneBINnuGNcyLwbtvCVfje3qGKcdWeNAiGahPIu?=
 =?us-ascii?Q?D6YLavEubgdB16qdqHp3lvCB4aQAJHqreC7sPzDVch95eTmrkJZkYNKkFA7W?=
 =?us-ascii?Q?lP/73zUP4bFAkX9ZyH3PNlZfCW3t+PbBPcxFbfLClFKpWyBVj3iQ3zCpmP42?=
 =?us-ascii?Q?fZN5YIS4lAHH4uTlkVa9iDslJGExVNMtK1UufojLWriy5MbvXY5csAiIIRA7?=
 =?us-ascii?Q?EGDHA6iDk4p6xyINFquFo+zbT/eeRJ97qoIFGa38Re72rd8mKO7FhZjXQM18?=
 =?us-ascii?Q?vv5LY5bOGFZpQssy5WlzUGyVm49pMRohhxlUPvw6G1zmusrGEx02UHVbm79+?=
 =?us-ascii?Q?8NXfNzwbescBAVVEsjXd53J1MzgFalTaVP5TgrUsZ12sCzTthJVPUbaHIbAT?=
 =?us-ascii?Q?HuD6By52EKdq3CkcWe87w/QAZGQzzALnrA+oepJJE70QJkmNldpzt6cFqRS4?=
 =?us-ascii?Q?2jsW/QnesI8YDwT6iqaWpNXQixxemKxxvfMo3+gz1G+r3i7JiCZvmaqhEt0C?=
 =?us-ascii?Q?MSwEPQ+hs79NJMLaa3wGgCRla+vKRwiU8Pg5xWXX5ABfZSizW7wWzBT8OBZj?=
 =?us-ascii?Q?fqZiPVLbzUvNHsdx2rwCiBJx9+RzHy+F3RJtbBSXusH7Z5tuSpfvw8cx86yN?=
 =?us-ascii?Q?XM1FZofBcdDnJ/jm6S3VV2lvMsYVMVLY5vRLVrkteagfWRawhzJBV0QC8Pg/?=
 =?us-ascii?Q?MOwtJT0gI/hp0GllbhI2cX6PZKZo1GGC40bkg0VABoWh3tRbT36Zo0ctaoy1?=
 =?us-ascii?Q?CUsDC/6xE+62AUoAfjtvOiObh+bw5eS3vLmdhvxlIqWYPwnRpoXKqJcWbgI6?=
 =?us-ascii?Q?RbGSiEZHjAkFQ7z6R5oWMoyrEzJYZHuhLyz9cnBIDw8/UbLs/K3+nIOBMtAd?=
 =?us-ascii?Q?bEVVWjr3f9XuI/FRISGs2HDaWR0cRibpQhjexHFT043i0XU4ENXG0Nu3E5pA?=
 =?us-ascii?Q?VpNafNw0EbTKR7Row3atmwmfrCNNOy5b8oHXOBriLBdonxfSoqDXyB+JGfcy?=
 =?us-ascii?Q?bMm73Ii1TMyhTwfHHyn4gzLux+CCK6p/y5K1Xas7PBULldvP5rqrkhizqIKW?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61aa4837-51ec-4ea6-891c-08dd4f754c13
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:05:36.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRdEkbMLXelC2G67F8W08jWb/aWTIxPcw/dRqt4n21+v4cfHYbREMDxLZJaJQsIogPP6zv0Dd/uRAu9MWfW/oLUGWAFDNyRY41CWOXdJrxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 17:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211546

Hi Alex,

On 2/17/25 12:16 PM, Alex Kiernan wrote:
> On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
> <quentin.schulz@cherry.de> wrote:
>>
>> Hi Alex,
>>
>> On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
>>> avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
>>> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
>>> which of these will provide service via packagegroup-base-zeroconf.
>>>
>>
>> If I'm not mistaken, this seems to be fitting RPROVIDES usage?
>>
>=20
> I guess I'm guilty of copying what was there (WIRELESS_DAEMON)
>=20

Fair enough, consistency is probably better here then :)

>> and then we simply RDEPENDS on zeroconf-daemon?
>>
>> Does that work (haven't tested myself)? What do you think?
>>
>=20
> And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D "..."
>=20
> I guess I think it should work, though my concern is the interaction
> between the daemon and the nss plugin, which is how I ended up down
> this rabbit hole in the first place!
>=20
> We seem to have very little usage of RPROVIDES (other than as a
> migration mechanism) and PREFERRED_RPROVIDER in general.
>=20

That makes sense if the packages are absolutely incompatible with each=20
other. For example, for the WIRELESS_DAEMON case, you may want to have=20
wpa-supplicant but probably could have iwd too in the same rootfs and=20
let the user pick the one they want to use?

If we can have multiple zeroconf daemons, then that wouldn't be a good=20
solution anyways.

Cheers,
Quentin

