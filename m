Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCC2CAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 08:33:41 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.17])
 by mx.groups.io with SMTP id smtpd.web11.17988.1758098019840382141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 01:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=FZZWvp98;
 spf=pass (domain: cherry.de, ip: 52.101.70.17, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P39C1pQS1Gl2qYB1FXd/TBNxbXXc5Pp58pFoGqqzW81stvfKpbUakYbgcUlQ+lgHO//uSLzqjYvD8Zy2jPT/3NFV+Y47C7aGmB8jGbv4RvTnOUyUgkwEA6oxouu7VLjxVRG4iqFJxMN/odeTuxxJn1XpU11+dt1H08clCKgVSUaj+oZQ675vWIMUTfUI9F4a0zg8a7EKj+YWZ3o7V6kuXdXeRkc3yZS7TZUZ21UTb5OWRZ+lDydyW5y8H4YxAQe7eZBueVr+yf3gU0VwClN5ZThHs0nQoCHC+/kvF+gQb/fMEPd6B0rxwcueWA5X1ipSMB4q+eB+CtCFxzXhj8vC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba3+Rxjm/JqZ3r3IaFPAM+ZSTSJD2l8eu7dwjF6lUX8=;
 b=qVNDW6Pe3TXH2hFWVuY3u/3cK8lQale4eBu/6WP1MqTRMxwGNlkDh91aB0aok88Cdv29pF55rSw13veAcLJWuTx6hNVZ6C18KjME6lgRn7b1dgvim9Zdz7KLrnc8zrZX+ySyxdBPR/FLzN4MuUPcjOlkMTGQLW/SiG9xPD33QC25clbi4q73UKwoj9l2X4zIc1kdNbe5gfgojBPIR6ravzbYCGdGuTEBambc5KLpMaY1UnYA5VTDrhrrC0gPCA/JNMRUHK8f/J0qvKQAYcSyAfuwNNjmZ+rWDw/C4z5ONQjl4+w6hA4ef+MJzX7H41kiTzNN/Nk9lrrs0nttzQazdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba3+Rxjm/JqZ3r3IaFPAM+ZSTSJD2l8eu7dwjF6lUX8=;
 b=FZZWvp98ADpeB1iOcQfHJxQlrBX2PVsxbH4XZaNpB00KgOt+rERctGbVVTnycNWIqxrfsE8tOOhzKiI+/5urBSyBDjNNzVEv6EnZXakYYt7nBlBhnwQoxsSKIqNtrBvphE6ai5OElg/r6b8BhwbCeDA4bBHuF3cdF068mJEk8IA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8814.eurprd04.prod.outlook.com (2603:10a6:102:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 08:33:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:33:34 +0000
Message-ID: <b26fc568-4afe-4de1-be63-2f53e3468617@cherry.de>
Date: Wed, 17 Sep 2025 10:33:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO #15965]
To: barne.carstensen@danfoss.com, Mikko Rapeli <mikko.rapeli@linaro.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "randy.macleod@windriver.com" <randy.macleod@windriver.com>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <1865C555FCF7D165.11775@lists.openembedded.org> <aMlo-hknGOEJqrGP@nuoska>
 <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DB9PR01MB721006FC2064A4FF2F7AA6288717A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d218e8-ff17-4541-028b-08ddf5c4e3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iNVV9T9u6rtA8LktrMpKBDWcTowd1QXNuTk2gtc/W9XBwMKk/ZUVtClLBpPp?=
 =?us-ascii?Q?Qx3hijFUOUTZ8JbS3T8/DZb8TAiHjJW64tWNBDB9dtwM/ZiJDKJCQL/6gOig?=
 =?us-ascii?Q?X0JOw3QWtAVTmwW5MKq0dNDNnhjTlD4aWpCElxafWKQrxCTxwQpby4dqkwk2?=
 =?us-ascii?Q?8ywlLT+Gpt4kKAQRDV31wqOIjD5sgzN9W69leyb3pQX8wJvZc+MI2jaZ1Af/?=
 =?us-ascii?Q?OMyeRYRRAIpkf20Mj3FzB4BzYd4zPVxt3lxtLBlmaf8URvBhVr/xN6x7EObc?=
 =?us-ascii?Q?gKjKpv7D5LxEVud9SRh1dOWjRKJvdWf/kMx8VI5qwIlgxX5xrFekHR0AnoSW?=
 =?us-ascii?Q?YVj5dGQ6ENb6K0aR6ocMvVj7lbmajF3/rD/jXdCVf9jh0qemQedWwjt5LqFA?=
 =?us-ascii?Q?4NLZiqgzSUQJihzEDRCNZo9gtCLGuMmciMeL1zroaYkF9GKLxLwfPxoCRBTz?=
 =?us-ascii?Q?kJ+Ho/Tu8qt7rzTk2GBkQjDkG7jrZXIbv8Ok/pdF/0wod1HDX8q4nUi92srd?=
 =?us-ascii?Q?5ZoJLDNC9bddiJ3u/GMTBg0GSKTPCo7ITK7RQHT/Um/e3/BuyigH/w/hhn62?=
 =?us-ascii?Q?w1g+WxUW+O4nu3F1qcFCy/IYFYDnufoiLj+3ax1fCXwfi2ldZoe9oHINoC+s?=
 =?us-ascii?Q?wSyTBaSHHGyGAiFDaaERf0TzhA/ZjFsSCJZwppgo4DLIhgzZagpdfMsCcv3+?=
 =?us-ascii?Q?1kW/8rYfkEMIhUv+B9ihxtcc257HAxSn5+EQSNAOksj6ZUloBfMwi3A8usuF?=
 =?us-ascii?Q?uNM+uZd52S1di4pvuwO7Z3IRR1BaHcKP9B1X8YHXoGN8sPab4ItwzYmI2r5O?=
 =?us-ascii?Q?EgjtQH7JfzIhnutLczvyIX/vWpwpGOBwd1bEHDZrFCTzoNECAF+KWiBwpSNt?=
 =?us-ascii?Q?nRJi8NOIM1ApvruI4JVZQ6vHPpwuoS6kj1Xr7i5g1O38SoaT9ydrfMqghBYk?=
 =?us-ascii?Q?BePp0eQj1QoOz42cfaXliLCzoH01U8TMFw3yc2othwVbXH8vWeJhtgtpOKTA?=
 =?us-ascii?Q?KXe0saP5MmfZ9/tAwCoSGi9oLtMmcaoaMZ7VGmbcYVNsi4mS+DWzDNmc1Gzz?=
 =?us-ascii?Q?9drHJsnISEQ/+ZBXOERNhwhBSj8Jiyc+ZstDd2nEq384c8Ll2JKUhUqnO1Tx?=
 =?us-ascii?Q?O+VdU5uePmYA6JAaaKn+Q8QTAWNqaiJYmHGSiRwk+J1Gdn9SJnXRHR21dYAD?=
 =?us-ascii?Q?4ehH//38MkfhAEaEp01Rn3A76xf65r4d2FSbLpdbQ0lgHzeQdIMJ1rH8MyAN?=
 =?us-ascii?Q?4fDArE+oa8gPvJhNetxdsQZYc6h0mkQJF39MPrrKV/2RPQl7Dp/+mvzzyMTq?=
 =?us-ascii?Q?vvaG30PGM9mSnNClFng+pfAB9COrWPtyM3nr+fbyaJJ+OlAvcp/ZYoQWowBU?=
 =?us-ascii?Q?6aizORg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OVeMy0FfSsZzp24n0stEe4tyKzb7ghC20sEmheGIoH8yxMsVdfRVdn1LgPCG?=
 =?us-ascii?Q?UqrRUiMrnNW/RDbWrBwlzUJ63CpuL8QnBT6++GLaZC/RwVbpmhxob49Kv1Jm?=
 =?us-ascii?Q?lP6IpPD5OYtmTOQ/FBKe9Kt9PIEtbV84g1JFcA3THkaT1WbtJS2AIYtzj21x?=
 =?us-ascii?Q?2EPIIp0id5JTk8iV+8cg6+i9uEjp6N6Mkwph3/Cyr0J/pTAkms05MfPDjOR3?=
 =?us-ascii?Q?NU+YF4dC8isRDrgnBe45fQQh9J7HfQt286s2RxQ2kElO3SVC715AWnstIkqa?=
 =?us-ascii?Q?2z94PjMDXKhYg7/BpOpSzC/Oiye4Ggvwr+DOITpNt9qmXkDvxAZewa3usPqt?=
 =?us-ascii?Q?wHrAG0ZzUVXfDJGSazJtsRREwBWpzFQvgyfar3GP3LCziny0qwT94pT7Pwrj?=
 =?us-ascii?Q?jWrD/Gyj8Lh2bB7GYi6qF/nHfi3CVm13/iCk6A6OU73c2r3geqZOu5CFb29P?=
 =?us-ascii?Q?RQKgqsWKKIvNNdPqJQdVrMeHQGBPTpu5RfIxaVnmnjd6bOMqAWCUgz/Z+nx8?=
 =?us-ascii?Q?shm4mUHbVOKK5axB956+XrLVjZ9iANm8H776gjX9vFkz4Ykjg8+q4dlSCf9K?=
 =?us-ascii?Q?J7XWaNICKB9hUHpet+1l2teeO0nbGV96bqzhFvV1drypXJJdUobOdinf5+jf?=
 =?us-ascii?Q?FoKW9YapwYCy/DZaCkNa65mA3RzEmmQbtStGvaw+lrCi/x9pF8fTi4w6wCeA?=
 =?us-ascii?Q?4rJ3AmetIsyrO/FrbdTdxJms6OAer2BvYAF0W+NmlC9ZQN6B/MNwrL5wwZfs?=
 =?us-ascii?Q?z3gVAEWo3WhP5rh+lvVeuFgnICW8HN614s4JTic9thjPjteZ16kzFZaZSHsb?=
 =?us-ascii?Q?2wsb+xkTKq6UgjEY9K1GXDB6Zcum5IeiL1SULxTdc+fajonQeYmkGlKqfdBz?=
 =?us-ascii?Q?3QU0StSZUHJSeI08fdBAlt1sdE6ZFnoTiX1gR/YoULQBHmiGDTMJHlZCPG7+?=
 =?us-ascii?Q?lnri+NZRktPlpXjk42uSMIZvK2P4nJwShXxx98VbtU0mdNmtZmA8gzCV5uy6?=
 =?us-ascii?Q?cFrSzpRN53xKkNUNRyOO/WkgNWkH5+hhKRpviHBhZ5Z62d+zPHu4UbN1RFXj?=
 =?us-ascii?Q?3Nvj6PAitRkfNURfGG3oJSyO/LQFplcGJqPNUf4SliD7WrCDKrWtxWIeyQ0i?=
 =?us-ascii?Q?bgSAzV+AM/VR1tFIFXUwwshG6VgHawuptrtgw3/84rDf6uJ2/XPXEA1fPqy/?=
 =?us-ascii?Q?3fljxT8AoqDXFTS7ujeJ6WgfVDSY07jl2ieNZLG6KnBhzSJQHWce1Iv30cIU?=
 =?us-ascii?Q?+gadGcxb6TP0bJIujhmuoVokNJSCNuPsKzirPC0b8ncK6lNCTEGaVnyMupvd?=
 =?us-ascii?Q?JkVy7Pvv0YF3UWO1ELX6DEb9/R5jpfAtPiQ5RpUQSIYax6oxt0aCaHGEb+sU?=
 =?us-ascii?Q?V1va922jeq8SQ8Gsj+ZWiqzeZ3TxnhPuk9ahzWpCHDud8iWClEH9+vUUHzHp?=
 =?us-ascii?Q?e+WAKnsd/ZN6UwJK/OhgkTcnYGo6kJSyWInH6g7qr2XyGA9SGtbdaDIylDWV?=
 =?us-ascii?Q?SifNlb5xUmOSKohgDtmOZEgjeAGCt27CTfcdiY7SfImHd2XL+coFYOsFOlZc?=
 =?us-ascii?Q?KJsi3RoI6U7BDpyHoEi3obQgirzacarwrqDGaC1Tn5UwOaqXj2fzaK+zMPCn?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d218e8-ff17-4541-028b-08ddf5c4e3f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:33:34.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/droB2CnzL5aw4TRYaMfrd8tyaDOGEFdfCfAJHFoTdJot0UFHcd1D6YfKniz8T5msLAb6ZrzyixhhB49x/uvC2kRJ1Z/sspX3OEaK1t/K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 08:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223585

Hi Barne,

On 9/17/25 9:26 AM, Barne Carstensen via lists.openembedded.org wrote:
> [You don't often get email from barne.carstensen=3Ddanfoss.com@lists.open=
embedded.org. Learn why this is important at https://aka.ms/LearnAboutSende=
rIdentification ]
>=20
> Hello,
>=20
> Okay sorry, was my first time sending a patch and in the manual (https://=
docs.yoctoproject.org/contributor-guide/submit-changes.html#implement-and-c=
ommit-changes) was written to use that form. I am a bit in doubt, which bra=
nch should I use as reference? The target milestone of the bug is set to 5.=
3
>=20

It wasn't meant to be understood that way, but I understand how it=20
could. I'll try to rephrase it so it clearly states the Fixes mention=20
should be in the commit log and not commit title. Thanks for the report!

Would just reordering the example to

"""
detailed description of change

Fixes [YOCTO #bug-id]
"""

be enough?

We could also have:

"""
single-line summary

Fixes [YOCTO #bug-id]

detailed description of change
"""

or

"""
single-line summary

detailed description of change

Fixes [YOCTO #bug-id]
"""

Which of those would be the most understandable (to you)?



5.3 is not out yet, so I would say not specifying the branch is fine as=20
that would be master. We're very late in the cycle though, so not=20
guaranteed it'll make it in time for the release (but may be a candidate=20
for backporting. I'll let Mikko provide background on why they thought=20
it isn't for master (did you (Barne) try pulling master and applying=20
your patch on top of current master?)

>> Since the commits are bit scattered, these from master branch would be n=
eeded if not already in the relevant branch:
>=20
>> e5e8f2aa0a63d testexport.bbclass oe-test: capture all tests and data fro=
m all layers 05e97d5e6e24b oeqa context.py: use TEST_SUITES if set
>> 2d900c3061e12 oeqa/runtime: set self.runner and handle None
>=20
> I cannot find these commits, but do you ask me to cherry pick these as we=
ll?

Those are in poky. People refer to commit either in OE-Core or in Poky=20
git repositories. The commits from the former end up in the latter but=20
with a different hash (hence why we have a "(From OE-Core rev: <hash>)"=20
in the commit log.

I guess what Mikko wanted is - if this patch here is for an older=20
branch, which doesn't seem to be the case according to you - to also=20
backport the listed commits in addition to your patch so that things=20
work properly on the older branch.

> Thanks for the help and sorry again for the inconvenience. I will try to =
send the patch again with the right subject and reference branch =F0=9F=98=
=8A
>=20

Thanks for the patch and feedback!

Cheers,
Quentin

