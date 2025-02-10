Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF01C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:09:41 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web10.57372.1739207377562604082
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:09:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=YZopxtqz;
 spf=pass (domain: cherry.de, ip: 40.107.20.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+WZnYhogZTYjzRcQKgSMfKRERmOE3DICiQd+SZ/hsrtvwqUwo2ntOvzhp7cwzX0+epHKinHCxXhN7PIfXqTVmigJMva5W212tHze+cidJEAg4QAbkpBbQS2LucdOZjJGSY3pPOuFRVyy98RptOxxC7vevb1b2nVskDx/tE8Pixtt1zKAUhVLbcg/fGUROn7RMNVZgOJTIKoNxffO7bD132OU7qkI2P7VBFw7DLJ0GOkHGAZuBTr1oG7+m/5wumYzisWg5JQZtaZrA3r+QMUsC/l3QhXY3ST+9ku/GHe48Lar+OBgmUZNK29AO4Df7XCkgANfRjTYxjZvNbiFytJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i39UvDozSosHYmeVLBqTDFbO3EK+jK1tahHR3n3m6cE=;
 b=ewPW+WvRsKfV8oSE7pVn9WOx8DPjNA9Gw1LzCunbEXJLpYDeuYqNS9hLAj492u/Lc0w6FFi4NhLQ/oUnVOUtYyOLyPI9ehJfK7wdC+omX6Nc6mnmbNRrLXMWJYhtoeUcQv036kFnoHfty2jytLKc2xsudzyqAmdT+gKjV+NlePOFZ5RrPN3S8mWXhcOur1/lc3RWRmdxypuo5+9TqVO44JhmqOcfW69RRfq9Cv6FH99qqRhV0a6paUfcNGvi4ZpXuVaq5GHQBVZCvrIl6gI2Eg99w0VyoW4mEjlXZTURZwAv4iawqxsuJyvP1Hm/Fr95WUpH9Jtao6jbyaN3H1y5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i39UvDozSosHYmeVLBqTDFbO3EK+jK1tahHR3n3m6cE=;
 b=YZopxtqzDvYWDYODEWhKLNz/EM5c/t2++O4A5/U3Hi9KpusSKNCsXSqya9oRny2baCobLGfpKRIcz2YY1suB5JYVJKiQ7Bl9IraOCSVvNNpLOHsQP4Re2rD+j3/b1w4g35vkis8pJM+7ZsPeXmx4Tp/qqpXNiAuhz1g0xt9hk10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8072.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:09:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 17:09:34 +0000
Message-ID: <4f892b99-368b-438c-9820-28f43158afda@cherry.de>
Date: Mon, 10 Feb 2025 18:09:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] systemd: Build the systemctl executable
To: mikko.rapeli@linaro.org, uvv.mail@gmail.com
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20250207071043.96282-1-uvv.mail@gmail.com>
 <26132cfd426a1494d8c42c1f8d1b6fbd347ee353.camel@linuxfoundation.org>
 <1949d535-d442-476f-85b6-55b018c4057c@gmail.com> <Z6m1YdpNtlNbMekB@nuoska>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <Z6m1YdpNtlNbMekB@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR09CA0129.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 54128888-4675-44c4-4042-08dd49f5b0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C7aBOenBTL1dD/WhGJiRWZZRZM/F0Uu53FCaEzVst4PrUup/LadAcCqF/521?=
 =?us-ascii?Q?dor5qBFQ/bo0mPoRc5pL2G4H+MsHyS481fP2YUJQ+T6iep6jGHM2QHW+BOjk?=
 =?us-ascii?Q?kvCnVNRtbeg/NaRmayJc31v+p0UmJn2ZdWAXbh8tDo5qM/0QyUWTczvJmjuk?=
 =?us-ascii?Q?cMYJk1g/awrGwPKsGev308QUNjpVMhSVHHHf98sHupxYo+N3JntkkHDcft36?=
 =?us-ascii?Q?t79vIOMeFOUXd+Lkn2CRzj9rSNvXWPGnzkK+5gdAITdUZ0o2E26xrtsuwozj?=
 =?us-ascii?Q?OH8jHKIr2CaF0cPQbj1N4IMy3OTTfKVMpTI1nBDuE1SUqp0ijTTN6u7qKXnK?=
 =?us-ascii?Q?7g36F9DSM1epTWhkbazD42nVbwcWHO50X/XyPSBWtsS1ZbxRQ9pPGV/L4QmI?=
 =?us-ascii?Q?8vdYtK8HotqssI/BlUr+HEJaOMG5GlC0y3Qr+/mSGaIujUzcCaBHef/zu09q?=
 =?us-ascii?Q?xRxkLZPqTW1MaQU0X47TXjOyZ84vLDIXdNKwychSS9ACzXw3FDKy9uP1mQTt?=
 =?us-ascii?Q?epq+l6tB6KNXq7bGIubsdzwOxLt99JWPHewBzrEtTntHIWeT3Pg05VkASobU?=
 =?us-ascii?Q?0qAG+CJ2oQtyIv6Jw5nU/FibWpoJQwZ1a5JwfEaG2xzhxM+3/aNV92dfLNlf?=
 =?us-ascii?Q?kbR2wzL6EnKupwdiUDXAEDVpbmxduCmoQBBUkmD/Zs2vDI3d5lInesYz8cD8?=
 =?us-ascii?Q?u/MTSGT4dmf5RBEGKEwX1TRylY5JtRe1QO9qkcCfE6xdQ+JAsb9yrUkJb1jz?=
 =?us-ascii?Q?AXW6kMfXmaJAPw7bG1RinuYCj5G7s5/iH+EKEScxMZqxEmWvMwwM1Wd4nOAy?=
 =?us-ascii?Q?ZYGBB6pUE+KkrHMI/l6BhhEEqPw7RKh9NECWVdEtYL9z1IqirnsIpdKeUo4F?=
 =?us-ascii?Q?v5QNT4hy5EsOyJWwJ1LB2hpA+bZSBOvz4CFCFiQdAMbTEDses48NACkqwcQK?=
 =?us-ascii?Q?dxMcda2reo9FVskTegnm1Ft7kkCM/2k/1bFaLGfS/R0TXx4sFlFxZrt7MbhJ?=
 =?us-ascii?Q?BXaTDkkhuApXdudBF9krsr0Fb3YQQ8/dA/ZsbkA7yoz1VXUHmN0dX4sIr8iB?=
 =?us-ascii?Q?kqQD9oWo6NIE7dXrQUwuUy9CtFjfDiGkqQTKT6El7nrfemM3p2Mfvzm4z9Gx?=
 =?us-ascii?Q?mZpfGzsDytbb/jWkc2PrpTAUwSLtxHEqolmCITXRb4tMT7z3UwH5V8oARpix?=
 =?us-ascii?Q?zChnC0o0h9PfQwPpAL8YVCV6JX9sJ91OAOFnOkto3PwfX3SlerOjFDNk7+0N?=
 =?us-ascii?Q?W/iyTVb8qqlg0+SFzTyOfEoR5ri2FwjZHc55+WUChcATdAeLno0OmXIDlura?=
 =?us-ascii?Q?QOev+mRtmYAA0dAWQiWMlgJ+oh2Hy1HK1DaoONCw6hJJ9w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ehg3UDAphsKD+n4sA6NsNXo014m7QXNQZtpE3mSdg4wCma/xbrum8pQbU9n0?=
 =?us-ascii?Q?TACTJT8VQ5PwWBb1o6mur+k4Z/hbF4hvVfilhkKUNqQBGd7U8w+aqx2LW2on?=
 =?us-ascii?Q?6zSvFkR5/IcHp8WG20Xw5TELVqO9mqqTZKxdhjjV2aS3r+Z5UdWCnsslV8ER?=
 =?us-ascii?Q?p21r20Bo3HPrVt34ip3WtQ5zMbg91DDoGpWijuX1j9sl5phO1UhERZNmyRIy?=
 =?us-ascii?Q?UUutktPI/VvPi2gPbFIidXmYM0SNNfOpVoeBxl1Rv5TeYirmqaOPaH9ASPpC?=
 =?us-ascii?Q?nC8ZigLIT8rEa8kSv7AwwUpTwE5HBtsHw+pQA6vrrDZvq6tBNq1OYS2v28VC?=
 =?us-ascii?Q?cGFXjKacOBBb4wZj3Yu93RWB03dUusYPFRyzAtlo9RLGw55MhClWbuStqMYH?=
 =?us-ascii?Q?6thB9vGUoUDmqYKutyZ/cT1M0cXEDttGyD/YfcXGw1o+A77jlRPY/UJKa0yW?=
 =?us-ascii?Q?5V8NNQewiX4Y6FgR/AQKvFQlVOMsqaOVRZyArAzUy4U0zD/kx/B6bB+pNZqH?=
 =?us-ascii?Q?6yI0YKDTD0nLlQVzG2M+qajtg7ZTuIAfjgH+LsPCFmYT2yxJEmSBlsVgJ6+2?=
 =?us-ascii?Q?RtTP1XrEdeMTBoOiMhGoENrWMxbMBIzT1myvOgdFF6y5QMBPoVshxXe4oRtk?=
 =?us-ascii?Q?NCGtG0KPbwX4IceYJyaLZvj3CU9SzwuJNSQOGJxLF8YueQODnax/x0BR6UJN?=
 =?us-ascii?Q?AdKHZtWRV6K56wkVD57f86qmeDaYQTv153dkPtS6yYjQIabOhbBiIZkGC32O?=
 =?us-ascii?Q?WSzq/LW+orrb/5KJE1MptZyAG59zyjvQDNszI7CyYY0M3YvdxPWmc0FKa84+?=
 =?us-ascii?Q?wImSL4ZDEFE27QM5hSR8tV6tHIldD95vSRaqkj3Hx7WWq1mElCvgGzA5PF1Q?=
 =?us-ascii?Q?dbSwFddcAz6pp12DeCGvXAY0JUDNDSrNp6WYl6cteSEnRb912+Pou0OM6BRB?=
 =?us-ascii?Q?WX+6QBK8tA7I86fl4G9jZ/So80xnJZF5+arRuTx/p7YuIWv0qwYrr8cI8mbs?=
 =?us-ascii?Q?+NjzohDXHfzJ8EjOnVGIGIHrUY7QL8N0qNao4EiLnOqIYXeaI1vB7f1vOyJ8?=
 =?us-ascii?Q?FHWRcRmc0W7mrXEp2WretGTEfEsV7NAVB59NqqYZamgLXG8MF/6q/m3ebDYH?=
 =?us-ascii?Q?g2oc8GP/x8TAmWlKOmJg3usDOjvwtG80UDm6P+kgsUQn8SiU80fC2+ij0gMU?=
 =?us-ascii?Q?L+8THiY32ROjwT7ygjDzyjHPwcTFaLWnAYWEW5v1u67+28EvnT436LkuWuzU?=
 =?us-ascii?Q?9jSea2HZWyRUop3B10EWgi49V6WVNqv1HECtbbgzHUMI72e1mmSF+2K7r3Ko?=
 =?us-ascii?Q?8Y/lMO1+cM5Nwzq0hP4js6Z5B/LDydueyOaXyjwTk1yq7/ZAEC6K1kOzhav+?=
 =?us-ascii?Q?CiS5uqgqhlq9XmjV0R8ywuI/7IReJvhnla815sSB1QzeWg0CiuUWuAYt49Rz?=
 =?us-ascii?Q?dM45WBUKTzCtTRonRvhKuXtYydDNerx4ssa/iW74LEnfyygxxTTrAOwvJFWr?=
 =?us-ascii?Q?7BMOOby4994aLkoc5ZiSE0EfjpZv9oqNppdYmdY3YPrf7dwSiBsp+NTFlD40?=
 =?us-ascii?Q?rRiwCq8z5HwNwP2Ur9I6uKq5ctXu51UGK5NEkRvQ8ddVX2+PYjAuU5qsgWY3?=
 =?us-ascii?Q?zZK0vqA9HCxrULM69pe4gy8=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 54128888-4675-44c4-4042-08dd49f5b0fa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:09:34.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtoUOzt32SeaewPtgzm/6tSvd1VDHBhsAxjil+sDnleUicOxU4+m/lPypDSJVEZqrHGngQqXTseEp6LGsaxVTGtE2wxRArKxXPigyVG/8mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211107



On 2/10/25 9:14 AM, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
>=20
> On Mon, Feb 10, 2025 at 09:07:57AM +0100, Vyacheslav Yurkov via lists.ope=
nembedded.org wrote:
>> On 08.02.2025 19:34, Richard Purdie wrote:
>>> On Fri, 2025-02-07 at 08:10 +0100, Vyacheslav Yurkov via lists.openembe=
dded.org wrote:
>>>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>>
>>>> Instead of the python re-implementation build the actual systemctl fro=
m
>>>> the systemd source tree. The python script was used when systemd didn'=
t
>>>> provide an option to build individual executables. It is possible in t=
he
>>>> meantime, so instead of always adapting the script when there's a new
>>>> functionality, we simply use upstream implementation.
>>>>
>>>> License-Update: Base recipe is used
>>>>
>>>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>> ---
>>>>   =C2=A0.../systemd/systemd-systemctl-native.bb=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 23 +-
>>>>   =C2=A0...-meson-add-install-tag-for-systemctl.patch |=C2=A0 25 ++
>>>>   =C2=A0...2-meson-Bypass-certain-config-checks.patch |=C2=A0 64 +++
>>>>   =C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 366 ------------------
>>>>   =C2=A04 files changed, 100 insertions(+), 378 deletions(-)
>>>>   =C2=A0create mode 100644 meta/recipes-core/systemd/systemd-systemctl=
/0001-meson-add-install-tag-for-systemctl.patch
>>>>   =C2=A0create mode 100644 meta/recipes-core/systemd/systemd-systemctl=
/0002-meson-Bypass-certain-config-checks.patch
>>>>   =C2=A0delete mode 100755 meta/recipes-core/systemd/systemd-systemctl=
/systemctl
>>> Unfortunately this showed circular dependency errors in testing:
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/76/builds/933
>>>
>>> Cheers,
>>>
>>> Richard
>>
>> I believe the failure comes from util-linux. Any idea how to "inherit"
>> conditionally only for target builds? (without creating a separate nativ=
e
>> recipe).
>=20
> Set a variable conditionally and use that with "inherit".
>=20
> FOO =3D ""
> FOO:class-target =3D "bar"
>=20
> inherit ${FOO}
>=20

Just chiming in here, but I believe this should rather be inherit_defer ?

Cheers,
Quentin

