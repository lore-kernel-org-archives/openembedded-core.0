Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80397C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 13:46:26 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web08.6944.1653486365925333366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 06:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=cZ47R/wv;
 spf=pass (domain: arm.com, ip: 40.107.21.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j5XfVJHCbfLeW8niVehRBeAlbajVH56JZMXo8Nx18tuYOjqwv5Dhm5OiJbxnI6Yygy65YT/IPoQm2TVtAAsuLTxO2EC8pyuz8iOzTUYKOR8i+2vqP4XEKTAZ9TPFqkOZLcP/OLFdGEwS8VhqsLVT/MEo+UsdalIJ9q9ZGLnR3jBv65w1YWSul4s9mQ8g26BDY8mfxonCzmn4/sh6vy+5cC8gFHrABkq4tQGjRFclIzG/2GkiPRcgaLmdCVx2A+uGSweSs2YIA98B6D7k00OQffK9MaPfjyO85KkVocLsU0vXGRURC34ddBtAILpO7R66C+1tQDopqVXfnhWT/WD6dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYQbWn0taBp/tNXIX7c9XuznLNsDw08HYlBPUVSc27M=;
 b=m/B+tX8XGeKV+xbUcM1ILCLUSHK1X6mZPUpqhN0Sj0z0sYCExIhl2ApuCEUP4UQSvDduN3TI2hLRZRklWsA7cN8XQmp2RC2XbOfCjVfd2pieocUzQIlRGe8975LbuazYqpOy5iTdb3m8fwKxBIOUuJVHf0vsojFbOqh2Jeeehk4EA+XPQDecc90V54lkZKKlUTdKZkEITcdOSTb3VVDeBSPDny3FTv40I0t5wbFJF521y4G9FBJtFwQIh+aQIzIcQq/mHits2yKKwp5I8t6pI2rzlERMcwBUHqIQDFyQ8bcJpVRx0qx+ZBoega0TgeIp9vYYHEIojNalAtz+3X06Zw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYQbWn0taBp/tNXIX7c9XuznLNsDw08HYlBPUVSc27M=;
 b=cZ47R/wvJkJdFq5f+Zx8C0UKy8VqbuMiTiTv0cd/J7uKbu6p+ruefBfLZYwUhxoBiHvIuGU1zUaGlPsq9xJ379WV3+E8I7zvpnUhlUSE05uSKILt7/Nurr2ZoiGXy+42Q9TL7gb+gX+1elnmRHMP4AIm2kBvCNTJDVQcHamJVRw=
Received: from DB6PR07CA0085.eurprd07.prod.outlook.com (2603:10a6:6:2b::23) by
 DB9PR08MB7209.eurprd08.prod.outlook.com (2603:10a6:10:2cc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 25 May 2022 13:46:02 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::3) by DB6PR07CA0085.outlook.office365.com
 (2603:10a6:6:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 25 May 2022 13:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 13:46:01 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 25 May 2022 13:46:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4686e1727d0b3321
X-CR-MTA-TID: 64aa7808
Received: from 8fa0fa9d4361.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DF8A36A-C643-4B39-98AA-F329F1B1D6FB.1;
	Wed, 25 May 2022 13:45:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8fa0fa9d4361.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 25 May 2022 13:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka2u2qTqEprExEOiwowgRm+87j3RBas18wLPJM3Q97qVeV0w1l6KLKW7npbpeQZ8h3+mHxjYcNb31NHUyKqIfHVWT9mUGTjm557faFSUTGiPf5mGoVZiyj1225o4sKnsNehETgFMySYpugV/E1aKpBYu1OYnnbMiMM2r+jy9nuAizUD+6Kl9i9/efeCHYvbFQQgY7McSydz8INE5DYxAeAlNcGBD3Mc6SsRogUNHqBmk29ZnYbTjzStHCYDDsZdw7+X5/Bb/MqkHnA7z/xRwFrH6sRMaW+ZabN4UUYviyo+94kt88cX+TwUTireReKqtxH1LR3J/OczsqPxhyCAl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYQbWn0taBp/tNXIX7c9XuznLNsDw08HYlBPUVSc27M=;
 b=DKWqRulNTnPiR0GxJuYUqMOlo5Zc6ACvlyKdfTHqJKYoSJA6Ln/LvNgDT9VW/1xn3GPq3+rPMr7ZhONq1wFGWH5eypKyosZiq1WWrnfHnidQ7TErWGJS2lmI8xnPY+lsDvbbZlCDcXbcEwjXpBCyoe/XBBvBK2ga3i5b5oZQFSR/ojZEFegDvxtIYBslWVsM5jfoiwo0NkFa7uD/in2w74HWgMvGmcAsHUE75KoiLbfe7uqdVutSdYKzrHrGXp1DotMdLUtB64ysICtmtdDGSKuxk3u4ciukrJetKkcScIDik27VRfdQJJibjgRIHQfXwxmoxNbbRE+QQkikn8MCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYQbWn0taBp/tNXIX7c9XuznLNsDw08HYlBPUVSc27M=;
 b=cZ47R/wvJkJdFq5f+Zx8C0UKy8VqbuMiTiTv0cd/J7uKbu6p+ruefBfLZYwUhxoBiHvIuGU1zUaGlPsq9xJ379WV3+E8I7zvpnUhlUSE05uSKILt7/Nurr2ZoiGXy+42Q9TL7gb+gX+1elnmRHMP4AIm2kBvCNTJDVQcHamJVRw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 25 May
 2022 13:45:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 13:45:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
Thread-Topic: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core
Thread-Index: AQHYb4KLpILPDwKE6EK2QCs21NHGFK0vPMgAgAA41ICAABncgIAADLj1
Date: Wed, 25 May 2022 13:45:52 +0000
Message-ID: 
 <PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
 <20220524152401.1663317-9-ross.burton@arm.com>
 <20220525100322.1a50d726@melee>
 <9BB79F38-1612-4383-BAE2-DD4FD065476B@arm.com>
 <CADkTA4M_j9rPa+FscV93XZgDvs_HpQaXg_SFZAD2yW9Ldf=ihg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M_j9rPa+FscV93XZgDvs_HpQaXg_SFZAD2yW9Ldf=ihg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 883325f9-7459-4791-ce3f-08da3e54e81b
x-ms-traffictypediagnostic: 
	PAXPR08MB6461:EE_|DBAEUR03FT014:EE_|DB9PR08MB7209:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB7209ED08237AAB02045ECB4AE8D69@DB9PR08MB7209.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 06qlKeiRBNO/kXeucMPvkPjS8py0yJ4ZWcFAS5Y9dLM3DUwzrQppH5+SR2qNx0EvgpejhlluJtbs87yWqm5v6iYvzacjfSGSt4R0VYVT2NjKW5XFE1SfhSKcVsqgs81A+K8nGDqdaKqOMB+5U3ZfOBnFvy48TuHgyoQJVbCFINdTfeFEq4GZfl3VdW2QKVekzQ2B7lUWg5ZQX8/qdZDysqCU+k+LJfHa9IrqbQWUPlAKZ1ez1terPwMWVhaIp7XyItQyp8aV8edo+lCRDOkMvE89m1tEk3K9RR5yLeq7MIo1M5vrDYCBKWmP5KZCuetGXwmTCPzVTU6h5pKCmWSvZL+Z078zBy4finIrWg3wKmDVMrtmfHmGdfIXmp6ZnZRGJucOFcm7Wqd39sUBKntV6ow+As2BezwL03Koona3k/UnjKSin3oeLw0ABacD6ozjpEaiyU9SZ2anjEfxi3sSVWrKVdy51YN4wqyJWgQaUbC11EEZVp+n5TvswgISeFHs+l8bjzuxwzrABkX4Kbl4OSSdW0yNJ1kcBt9jyIghU8KeybSglYPLGkW74ucF+taz/CVqJFQpw86A3NhUIcKiDrWJ8e9i8wG/mdVakRvqKfDhMD01URZV4mU34vHR6E1fTglpnzVGWY5Gt7unERVhpkZoXRMIu1sMDbGKWaUwC6Xxdso/iUv+v0M/oedrkr7zY8FrcTupZTIEFZr7fo3Z2A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(8676002)(66476007)(64756008)(26005)(9686003)(91956017)(66446008)(4326008)(66556008)(53546011)(166002)(66946007)(8936002)(186003)(86362001)(71200400001)(6506007)(33656002)(76116006)(122000001)(2906002)(316002)(6916009)(7696005)(55016003)(508600001)(52536014)(38070700005)(38100700002)(54906003)(5660300002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aabd5128-0c0c-42a7-61e7-08da3e54e2a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wuB5uJqSqy39WKxSEfFroSx08YuFseFbxNafLGY890VYgwd8CKzF+Pnd7lytA2PQle8dtOyX77WHc98iF21UFrbzu2DrOfNzli/9yiQPc2gi61rQaP8i/uOtR/jr3cGjk8jFt7RaEJCQYGvXEwQv9ep5IoeY0X4J/wxzQyHOYakvM/0sRSBiPESpZqIt9PPQlG8apqZ/iBJiT2GQazI+lBWVNTRSePSR8Gst4ff87iuoQsla8HGCk1eE7Zemf6IVgroQIrRPKn6/N7WIJBuxW6CxbD1/rj3twxmTbO1pBjJIymyp5Go42byLcF3lNV3mmv+vAN9x/cVvoCQZbJ1j1TVrmSYFns8Xw3Rk2RciBv6F2j4nS+eKra0Ew4/82aP0Mx0CWQO7J+D/uk/w9b003ITpdJHiKb5jtFnEaUT36zRqB+D0eeBLYxuRP1R1aFio8qmKI2nfRG0iYIMHrScThcUK/o9CATVGSl6WEXwZnSIRmmv9WcFYyV+7Dl1ZDHhvxNQclqlAm+TK4EBHy6AnBcCYioFv57AyuPAS9hrStjJ+BxPVtI8l4WQLHBbhJffuIwBNa39XeIPZ+Y2Her0LHAvMxUYzGm5eQKyF1ZUXcI+XrbKNHeoii128UNrUQyy8r3Tn9fB5mwK6ZrKM/PiUXuertp5gnZk/ypYSTfmfhrmDPeMlELBTjf6iMvkUvG5K
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(9686003)(70586007)(6506007)(356005)(55016003)(26005)(47076005)(86362001)(83380400001)(70206006)(166002)(81166007)(53546011)(33656002)(186003)(2906002)(36860700001)(8676002)(5660300002)(40460700003)(8936002)(52536014)(6862004)(4326008)(82310400005)(316002)(54906003)(7696005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 13:46:01.8501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 883325f9-7459-4791-ce3f-08da3e54e81b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 13:46:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166123

--_000_PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Yes, it mainly blew up because the tested oe-core branch had the removal of=
 lzo but meta-oe didn=92t have the addition.

Would you like a resend of the xen patch to add an option, but leave it as =
enabled?  Or will you merge this patch which disables lzo?

Ross

From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wednesday, 25 May 2022 at 13:59
To: Ross Burton <Ross.Burton@arm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, openembedded-core@lists.open=
embedded.org <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core


On Wed, May 25, 2022 at 7:26 AM Ross Burton <Ross.Burton@arm.com<mailto:Ros=
s.Burton@arm.com>> wrote:
On 25 May 2022, at 09:03, Luca Ceresoli <luca.ceresoli@bootlin.com<mailto:l=
uca.ceresoli@bootlin.com>> wrote:
>
> Hi Ross, Bruce,
>
> Il giorno Tue, 24 May 2022 16:24:01 +0100
> "Ross Burton" <ross.burton@arm.com<mailto:ross.burton@arm.com>> ha scritt=
o:
>
>> LZO is a fairly archaic compression format that hasn't been updated
>> since 2017.  It's now unused by anything else in oe-core, so remove
>> the recipes.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com<mailto:ross.burton@arm.c=
om>>
>
> I love removals of archaic features...
>
> ...and how they make things explode :-)
>
> stdio: ERROR: Nothing PROVIDES 'lzo' (but
> /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-=
extended/xen/xen_4.16.bb<http://xen_4.16.bb>,
> /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recipes-=
extended/xen/xen-tools_4.16.bb<http://xen-tools_4.16.bb>
> DEPENDS on or otherwise requires it)

I=92ve also just sent a RFC patch for xen to disable LZO entirely, but I=92=
ll leave that up to Bruce to decide.  If lzo is removed from core it will b=
e added to meta-oe, so xen will continue to build either way.

right.

We'll keep it as optional.

But isn't this just a timing issue for the failure ? Or are we missing a de=
pendency in meta-virt on where this landed in meta-oe ? We definitely have =
meta-oe dependencies in meta-virt, so the AB should already have those in p=
lace .. so this must have only blown up because it hasn't landed in meta-oe=
 yet (nor should it probably have, as this is a test of the removal in OEco=
re) .

Either way, I'll merge the meta-virt, make-it-optional patch shortly and th=
is should be good to go.

Bruce


Ross


--
- Thou shalt not follow the NULL pointer, for chaos and madness await thee =
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--_000_PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Yes, it mainly blew up because the tested oe-core branch had the re=
moval of lzo but meta-oe didn=92t have the addition.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Would you like a resend of the xen patch to add an option, but leav=
e it as enabled?&nbsp; Or will you merge this patch which disables lzo?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Bruce Ashfield &lt;=
bruce.ashfield@gmail.com&gt;<br>
<b>Date: </b>Wednesday, 25 May 2022 at 13:59<br>
<b>To: </b>Ross Burton &lt;Ross.Burton@arm.com&gt;<br>
<b>Cc: </b>Luca Ceresoli &lt;luca.ceresoli@bootlin.com&gt;, openembedded-co=
re@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;,=
 nd &lt;nd@arm.com&gt;<br>
<b>Subject: </b>Re: [OE-core] [PATCH 9/9] lzo: remove recipe from oe-core<o=
:p></o:p></span></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">On Wed, May 25, 202=
2 at 7:26 AM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=
=3D"_blank">Ross.Burton@arm.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">On 25 May 2022, at 09:03, Luca Ceresoli &lt;<a href=3D"mailto:l=
uca.ceresoli@bootlin.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&g=
t; wrote:<br>
&gt; <br>
&gt; Hi Ross, Bruce,<br>
&gt; <br>
&gt; Il giorno Tue, 24 May 2022 16:24:01 +0100<br>
&gt; &quot;Ross Burton&quot; &lt;<a href=3D"mailto:ross.burton@arm.com" tar=
get=3D"_blank">ross.burton@arm.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt;&gt; LZO is a fairly archaic compression format that hasn't been update=
d<br>
&gt;&gt; since 2017.&nbsp; It's now unused by anything else in oe-core, so =
remove<br>
&gt;&gt; the recipes.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.c=
om" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; <br>
&gt; I love removals of archaic features...<br>
&gt; <br>
&gt; ...and how they make things explode :-)<br>
&gt; <br>
&gt; stdio: ERROR: Nothing PROVIDES 'lzo' (but<br>
&gt; /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recip=
es-extended/xen/<a href=3D"http://xen_4.16.bb" target=3D"_blank">xen_4.16.b=
b</a>,<br>
&gt; /home/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/recip=
es-extended/xen/<a href=3D"http://xen-tools_4.16.bb" target=3D"_blank">xen-=
tools_4.16.bb</a><br>
&gt; DEPENDS on or otherwise requires it)<br>
<br>
I=92ve also just sent a RFC patch for xen to disable LZO entirely, but I=92=
ll leave that up to Bruce to decide.&nbsp; If lzo is removed from core it w=
ill be added to meta-oe, so xen will continue to build either way.<o:p></o:=
p></span></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">right.<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">We'll keep it as op=
tional.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">But isn't this just=
 a timing issue for the failure ? Or are we missing a dependency in meta-vi=
rt on where this landed in meta-oe ? We definitely have meta-oe dependencie=
s in meta-virt, so the AB should already
 have those in place .. so this must have only blown up because it hasn't l=
anded in meta-oe yet (nor should it probably have, as this is a test of the=
 removal in OEcore) .<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Either way, I'll me=
rge the meta-virt, make-it-optional patch shortly and this should be good t=
o go.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Bruce<o:p></o:p></s=
pan></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;<o:p></o:p></=
span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ross<o:p></o:p></sp=
an></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><br clear=3D"all">
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-- <o:p></o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">- Thou shalt not follow the NULL pointer, for chaos and madness=
 await thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<o:p></o:p></span>=
</p>
</div>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB7411343691EFAFDEA1EEE9C7E8D69PA4PR08MB7411eurp_--

