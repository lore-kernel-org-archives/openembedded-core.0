Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCA2C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 12:59:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.67])
 by mx.groups.io with SMTP id smtpd.web10.86177.1749560377117268096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 05:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=WgNPtChs;
 spf=pass (domain: cherry.de, ip: 40.107.130.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOKMuL5YHxHJVX76UyW06RJXhGk45HCQjjlsCVJbLRysNp4X8OOH3eZ26djwG+L/55NhzvPA/Ushb4rfYzJQD283HA+rUiWGFD+nXNuX+ozVn+nb/Mp3qYpQdGexL7R42fsARqoE0SJX1OTMspTXJP3NN46YPGjyhCyC2FvSAwYDYmOGbAoM0NRNeBx4sortQh+n/8a88xoAlMgqeM/RhlcaT6nKO2o0osWXUyFBJJ7QPGmBXBz98ZckVQ49w4Cnk88GpbH/bxM/kA1SVWycTJOoSuL8avXJIoHTa4AD8YmKak+tiwqFPr4lM3oi81rPDiVOOPNwZly9NTmN+5MjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyQTteUK0XUg0drrpEbHd/GchXdGeougKUu/JAP/HQk=;
 b=V9DQGDm3QVhozU29SV3ceNB/HbC7Ic0sfvUpF9qQZEW49CyD9ZzcECjYHa3sN+huuvhNpW3gMnbL5WocvF22dYlq38x3amGChpLHc1ltjbpiW9YhL9N3vl4WVWv4nIi/zQhakMm+M7yA7YlzUPI20Uf2LfRobqra2oORhf47wfB64y6+KJxbDNxDpojYMPq9cOrDCBhFTJuJNndfvbNnvtXdlwe2QSaW/qkSwyjdjEBKN7gN3udgK36VZs6YSk++KX6g7vO7DwLzldT2LoSbx09AnKmWzfQVZC/iPHUrP/d+NHcxLvx/fAvStbanYQ0k6lYYLBZqfDw9Aa2ov3cXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyQTteUK0XUg0drrpEbHd/GchXdGeougKUu/JAP/HQk=;
 b=WgNPtChsGU/s0L8ssZaXAaSXxpPYK0Ovgl2sOhvGEQdakfqP6DY+XrW6po2DzZ5oSkzx8YYSVebOyVWJ5R+sa4vrhCGAm4OaC2NkFFPDtH1wrQhoph/ojXq74UMbEFzypk1AEf7yQlNZTD22ugS4ykYSxnnRXjwMas4xMINMWXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 12:59:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 12:59:32 +0000
Message-ID: <22128703-5434-4497-b5b9-853dbda8c4c9@cherry.de>
Date: Tue, 10 Jun 2025 14:59:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] reproducible: allow each layer to define its
 known non-repro packages
To: Yoann Congal <yoann.congal@smile.fr>
CC: openembedded-core@lists.openembedded.org,
 Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250609152757.1153027-1-yoann.congal@smile.fr>
 <3e190ff1-9261-4a13-8c1c-daeb16671b44@cherry.de>
 <CAMSfU+50UFfmzHUf+ag9_8-FAau4+ym3+Oe+9G-i97C+2irVDQ@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMSfU+50UFfmzHUf+ag9_8-FAau4+ym3+Oe+9G-i97C+2irVDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0301.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU0PR04MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 0721270b-ddc3-4324-9eb4-08dda81ea4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ds38U4Cd83wNkUu2eRLhXxiNUYvIl3uTmQ2of92My0Nqqr8YScv7F9gODHbm?=
 =?us-ascii?Q?Qq25cCtpMLA4jSn7vva4jgK4rybyEvXBVl5YH/ZPr3pDw8HC00eNGkJowoo6?=
 =?us-ascii?Q?Is4Tl4D2+6hV5tC+XAR4BMln1uzKPaWf+sN6BCrAx12mDUqblfXSVQea3DR4?=
 =?us-ascii?Q?qAeml3SrUipwfmXHD2L6CtfEBDf2UFeKjcHNKSlis/E64uZE8JY27+owego+?=
 =?us-ascii?Q?DUg+lUA8KOPcvhHYDcMtSrzxc6LQ7j5r0oaLDP33jCN63vuwWTeJ8DbwGftL?=
 =?us-ascii?Q?mDDrwtsq5kMC9yZ6SpOiW2mHfNj6m8oKRi4W75URqsJkcUUelVj8PMN4t8ux?=
 =?us-ascii?Q?0VsMm6DBdl9EFsuRn22IXpc2A8asCAzxmEiwTk0my563Tqb/k5eI1jJm49hP?=
 =?us-ascii?Q?137xedQtr7GAFn8Zqk55DJSmFS5poaedTWoHqpI7GRm4ENR0KvsbBTxIvznG?=
 =?us-ascii?Q?OHTjZkuyFs1Umf/PJjZ2wNim3Uhyhr5MPZkcTxg9faMp9WLiEb38tHJ3xJiH?=
 =?us-ascii?Q?/+Y/Q6N862SrCe2iOSY1caXXYVv7LGVybibny76i9bhUvGQVUzFfcyfGcbYI?=
 =?us-ascii?Q?lYtsWSrt54VTiY6sp0aGmskJpVLeUm0HRKbDMjZA3s4YZSUKHWmEjMW0khHz?=
 =?us-ascii?Q?/w+2xAojw//V5wBp8RLDBZlFbMlwjnZrA3zySMTQ+CgiZRm301r7wAsMQCmS?=
 =?us-ascii?Q?fWz76Sm8ILlixAc32clbcNzTec5bcjQYyxNO55ztGIOVHxglcPhMZocTkOMY?=
 =?us-ascii?Q?HstQnvs7y0E3LuxIuQWa8aUvZ8LQEWuQbWlKMz/iHYR8lp1izhp3vGwitYxT?=
 =?us-ascii?Q?JG9XcOHdF/ZOut2mgqEQ/9DQNuzNGub2FkXZv3sI54kRB3ahNt4UI0f0ZBY3?=
 =?us-ascii?Q?0hSjBRE32B3R+Z04swFyhVwp2eMrh4H9sckna4EiMs7lwWFiYn25tSGNRI0T?=
 =?us-ascii?Q?BiROvlbAKUfyNJCxOLmdAadQuvIJQtlcJDPc5iaWZbJLlhsZSIg6SEckViNA?=
 =?us-ascii?Q?q/a7fk8RBi0Qz73nceCd3SN6J5YJDFXRpoy2ONDeNHKGgFwgPufnolP8F/Ma?=
 =?us-ascii?Q?y/27Z1eLqDDJt+Pt4wSc9PggivD2RtdNpBca1MKBYazem2WBGFz6C3WOoTMK?=
 =?us-ascii?Q?kVkGwq2VUBtdAV15NClCvGHbSt6fBtlk2NYnbtk00zi3AMoDGk8YpTdKurLz?=
 =?us-ascii?Q?Dm1tDtITvyCl7TVdFOm9dta/Gr5M+ZGwlwwzo+Toko6wVvELjLjMsXqGywCe?=
 =?us-ascii?Q?330MzO+0hJhkVvABVwVxQB/n1mls3tREh7Rjqt1HQG+8xKLPvEbe+ktDHUiz?=
 =?us-ascii?Q?mT5ELgS6gwRW6/ijGHNk6/9lIt/PFHRuUx5M9cxipsjDeSOZSNRFmX5DgMau?=
 =?us-ascii?Q?Ai6GzDvMIN9LaJyk3X7Vj7nrPfRxdTK3PwMXDBU/6FDoxp72yiQCSS2L+ah+?=
 =?us-ascii?Q?TWdwkK8yXjo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+jB6cdaDWp+96su59cjZD6wtiKznvfI/RtHd5XG++SlIpQ/aLP1kNwHYlXFn?=
 =?us-ascii?Q?9MMCNGJvzXT5WrolcCHHrZfVsWkEf25JkmzLFngxzqnm9+xuRmyS/SgwR4le?=
 =?us-ascii?Q?t/4nQG6VDwjVrSqpiwaD/Cva0bvDO/qmLgn2ZBYduIgPKloIT7x2lH9C3Dw5?=
 =?us-ascii?Q?FT0XS/T9u06xZKZs9bWJ7W0ySAU+1EfkAgoDqChU+6uk9kc4JjCNZe5oAgBa?=
 =?us-ascii?Q?sRchBXMpTO1Yo1PVjTAEPE5ZJOWLQhS+yt/rc6xu66+IJ55G6lceCd//ylyx?=
 =?us-ascii?Q?fhLuUD6gQ63LJZbYr/b76GMl1iHzz3ISkFCdt2QAOFjHqqw91nj+GbXasaQq?=
 =?us-ascii?Q?qlZB9efxxmtN+KBdrGTIOqwuq/rIQBcxRC04LhiGKCD7VlN/rUTeNoz5Nd1P?=
 =?us-ascii?Q?IUQIKvBb7VtK4JGoeJYDQEXfu1x1n8cTuNeIA5YsXBcUSg+mhJq6HJaGFO7A?=
 =?us-ascii?Q?rMNF0EqwV60VM5RJ15vHyeFeYX1fbDWgV8FiddSPi9a0IhbOMggkbh2QZl8b?=
 =?us-ascii?Q?OH1Zv4gTTx2KOYEGTTfp4ETdhwk54/QmU+c5WByLCUk3yNqY5Ir0MV1+zfD/?=
 =?us-ascii?Q?m5wKKrqMORw0krO3bc5PL3rRQ5Z/W6eUfMGChNmYTDq/nMEe5N9/gKrPXdNV?=
 =?us-ascii?Q?WpHxzACmVuSLJRlYyOmpTE/uAQWvBu/fgWLWk8kntKb+F0AVGsHFsZWJMRrr?=
 =?us-ascii?Q?GKnVr9tNVCe4K3VvJMveEYClW7DWyIzh2jLiHs4TrkKBSKbMcM/Ex1NmFVza?=
 =?us-ascii?Q?8hOamxayIkwiz5e+P+JthAelKsicVPofIG5C1Iy+k3UeQZnUDCmNF3+IQsdx?=
 =?us-ascii?Q?agCmxHO//jwI15Fsa/TEefaPlJ/nyj8ChCu62s3wv5lum067kjX0kiqrKpPB?=
 =?us-ascii?Q?k/ll2u0FSGyv42vL/vCWOxzl9TwbKczp33aH/GpgCsTDJvgJW5ZED7uNyoAu?=
 =?us-ascii?Q?stkewaS5e6QaMYAv5nGM5Gdmqjl2AC6A1D0eI7rD91m8rUnE+unGvSDr3bz5?=
 =?us-ascii?Q?3UZ7OkdvIPIkGVRZHQNxbFUiLYugQUyqXvXzEIbvoyKCu1VCAkvOSQ4Sqxes?=
 =?us-ascii?Q?TCtuVjSC/ctIoIWH0JRkzbyDlf1TkcGXPNk+pDfdUB/+hs2wQ0QF0zlhz3qo?=
 =?us-ascii?Q?uKMoDtf9rQ/tTZ3MCXmT8r7V/3QHtjqkiV2QqVAmar8JSHwxPOj/5DwTMaHy?=
 =?us-ascii?Q?fzKdketwotSQl9Lpdzz1diaReVkgCfERdsWWIQnq0XKPp64pYp84JAKfcqDF?=
 =?us-ascii?Q?leUdUK5/oNL3BJ7QlvO1rGVxPcfROabxxv/yusmRbFOZQDUZMwGTmdBisITo?=
 =?us-ascii?Q?yXCdW6mn5VnZfX67xztvbz2V8Aa4Z8vMfNf042G7Qt4QbdpzafpwTUApKiqX?=
 =?us-ascii?Q?sDnxh9VL6KG4LWUVDmMu0F2Z5ujKpb+DnUoTdrvZYbGfux2BRVPAcrsoE0Bx?=
 =?us-ascii?Q?V07/qcdNEU4nANIivtMk7WDBMgazTZ4uK/hH8/YnhFQJCzJjlSu+JMi+gm4F?=
 =?us-ascii?Q?t09GKU4zEUdQD4HuFUvC/uge31FWD4+mx9DQ0YcF5/8oztYx7S5a/cm0pRzj?=
 =?us-ascii?Q?QKkUzPOjCo/kp5PZyCMaV4RZgfyOpU6/mJw8QDLMsdTpKrWIhGwvvJn4oaMC?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0721270b-ddc3-4324-9eb4-08dda81ea4f2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 12:59:32.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3Z2pNPRykqiMTg/hK/5DHJH1uvFGVef7XX3By5AW4QE8PY62bWgI7KQ2RFoDVUWZ3reSry3Sv838P5O5psy9Ji29WfrxtHNPaDHLYqlK1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9418
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218351

Hi Yoann,

On 6/10/25 2:50 PM, Yoann Congal wrote:
> Le mar. 10 juin 2025 =C3=A0 12:57, Quentin Schulz <quentin.schulz@cherry.=
de> a
> =C3=A9crit :
>=20
>> Hi Yoann,
>>
>> On 6/9/25 5:27 PM, Yoann Congal via lists.openembedded.org wrote:
>>> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>>>
>>> With this change, layers can use a conf/include/known_non_repro.inc fil=
e
>>> to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their
>> own known
>>> non-reproducible packages to make them automatically excluded from the
>>> reproducible test.
>>>
>>> Example of usage, in conf/include/known_non_repro.inc:
>>>     OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
>>>           this-package-is-not-reproducible \
>>>     "
>>>
>>> This uses the new "include_all" in the reproducible test and will move
>>> the maintenance burden from AB config[0] to the layers themselves.
>>>
>>
>> Isn't this something that could already be handled by a simple
>>
>> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D "this-package-is-not-reproducib=
le"
>>
>> in the appropriate layer.conf file by any chance?
>>
>=20
> Yes, I guess that would work (and without adding new code).
> I seen so much bad stuff put in layer.conf files that I always forgot tha=
t
> you can! -_-
>=20

Yeah, I've seen horrors too, so that's fair if we want to be a bit more=20
selective with what can/should make it into the layer.conf :)

I assume we could have some sort (or maybe we already have?) of=20
validator in scripts/yocto-check-layer that would only allow some=20
variables to be set in layer.conf? in which case, we could either add=20
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES to that list or rely on another conf=20
file like you do here. This is not for this patch though, just an idea :)

Cheers,
Quentin

