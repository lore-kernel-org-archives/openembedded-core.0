Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12E6ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 11:58:05 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.85])
 by mx.groups.io with SMTP id smtpd.web11.36087.1661515076829378525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=nFfyHVIm;
 spf=pass (domain: arm.com, ip: 40.107.14.85, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LVJ6yQf4F/fLppamzjzFde32MOOGPR67LECOjtxza+UxbVcVUd07aYu7lcA2KlrKPhVQHyoIKvIlSkruySw8kfCbJjgmUYvGyYp1nYhqUODsuqg4kVLpvSp/3i4IHPw5r4WBT7suFmr/d1D71sXkwsqhLGPROovLlR/I/nCgmFaZMr7mFRViFDNuD8DoMc1ES+dy33t5+qRnHtq4kKizwm7z1X8yark3z/aWwEpnspXudtl3CiXl/X2afsEOOdxxAD3qKIlBWs3G39oeg7sGraBkrHBSIg9rcfw2YSWkV5bZvEca+UYp+SM6WRbdaxhXDOaG7r8IUTEZbnCII8HQOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xlqo84h90v2l8CtZqMCumQPEB+57T8hwCxSVdygTljQ=;
 b=HCqCWnRkrvHx07pCP6xst4JRaLthAMWz8OC9SvxhBS8uQD71LjNxmylyl7IUAXjFtvdoxOifQo5NbMQwWsCjnskg7zkgWNudYTKI55quTLEDty/evZSASs13XyTwasrstARicQJsOnWlIgjLHguFkyvKTjcg5v4fz0eVdq6QcK2WaPfD520Xx+9HKTUEbgUlzT/Evr3S8+TG8GHYCkNphSOTJdUj9joiUJVVUjYmP5OHxJ7TgjQitWNzVLtGX9az5KpPuG725pXGMMuSeZ19pXnxklqh+SpRgOL0kr9nPiyv4geuEhpnHGjZHlpCeJp/jID+xDd64DivuBqrPWa6Pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xlqo84h90v2l8CtZqMCumQPEB+57T8hwCxSVdygTljQ=;
 b=nFfyHVImW/9wFpENCU/5UWYRXA371v07b8JMTqTSq+tTQVfErOwO7oLro2K2FhcVdeJ9fG1mFe2UeZHCEv1MBjKTQ88gCLQ18x3YH5F1Ns4B2YdBHMkq5hacJL//xUIuXyzrHcRsA0XFqRTn10eutUkP18E2wGl9jKFdfLuFhAU=
Received: from AM7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:100::16)
 by VI1PR08MB4367.eurprd08.prod.outlook.com (2603:10a6:803:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 11:57:49 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::18) by AM7PR02CA0006.outlook.office365.com
 (2603:10a6:20b:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Fri, 26 Aug 2022 11:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Fri, 26 Aug 2022 11:57:48 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Fri, 26 Aug 2022 11:57:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7638b0e8f6700da4
X-CR-MTA-TID: 64aa7808
Received: from 03c250a66d60.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 621537BF-25E9-4369-AA07-50A60681EA26.1;
	Fri, 26 Aug 2022 11:57:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 03c250a66d60.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Aug 2022 11:57:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITARW7lMGhTZKNG+48B3WU3OhTjzlNuPpn+fhbnXSukqfYnz0FyjA9fQAPmUvA7weMw3TPwWwPXeJpMOwsSlx7RgxLY64ORA6xF1wIjFVbbcEe+mVc9kDf72nlyayXAfZ+s5t7EEI4WZ4GUimBDK/quGN3qaxwV6G4geAO8BFO9MqtTpwY0ebNO0wZz8FGww11Q+GPG56akdFJ7RrhgrV+GPuBufjb+rWn0SfWrVUk316WcyRBC1+08Mox+A2/G0xab14UXzKA5tTKtu9kHB85lgR+wnxX2qHNKYmJwq1rZBZFKzsty/fTYcn6DCjaXtt5m2Ti8NouBYbgHmoqxtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xlqo84h90v2l8CtZqMCumQPEB+57T8hwCxSVdygTljQ=;
 b=lGqq6NOEv7S4gqQez77VVhBBtWQezBHhdmYWE781L1Emg4Rt909sWg6cE1CxVXKiGAEILP0nFtY+yuBL9bgXyNdTOx2k/FHcB8G2qHCyFUxQd7HadHCJ9jK6mFs1daxQyEVTYR4gn/M0CdA9wBxu1tNGdwLd5AVGlODRFBmYBPa83OGG96Rr7L5LfwKzwTTZMbhd0jSkJKAcP7q07kjjcZ70UUn3QLf0jhgm7QT5cO5GOFzSfuTycDajpNjku615Wm4ZeORob6KMAjn4qmNlLbnsr82cY8t2JB/DbguYCKylI2VG3P+vnwTXizmbiyBA9NPyBkLgIhjztA6vlwaAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xlqo84h90v2l8CtZqMCumQPEB+57T8hwCxSVdygTljQ=;
 b=nFfyHVImW/9wFpENCU/5UWYRXA371v07b8JMTqTSq+tTQVfErOwO7oLro2K2FhcVdeJ9fG1mFe2UeZHCEv1MBjKTQ88gCLQ18x3YH5F1Ns4B2YdBHMkq5hacJL//xUIuXyzrHcRsA0XFqRTn10eutUkP18E2wGl9jKFdfLuFhAU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8253.eurprd08.prod.outlook.com (2603:10a6:10:413::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 11:57:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 11:57:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Neil Horman <nhorman@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>
Subject: Re: [OE-core] [poky][PATCH] Fix npm to use https rather than http
Thread-Topic: [OE-core] [poky][PATCH] Fix npm to use https rather than http
Thread-Index: AQHYuMNjISOYhHwlC0K6Xjeka62IqK3A//cAgAAUlQA=
Date: Fri, 26 Aug 2022 11:57:38 +0000
Message-ID: <5DB9D992-9C0F-42F7-9BCD-3CFE9B32C6B0@arm.com>
References: <20220825204250.3241214-1-nhorman@gmail.com>
 <20220826124358.4118f92b@booty>
In-Reply-To: <20220826124358.4118f92b@booty>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 89531bbc-cd07-4fc9-448a-08da875a323a
x-ms-traffictypediagnostic: 
	DU0PR08MB8253:EE_|AM7EUR03FT055:EE_|VI1PR08MB4367:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xZRkfnCHt/Elwa3BAbeCohOShI3Pp1GfdGuF/9csXRbBE3ZWuFuxekUQCaVPcKA11Ll+/PwX4P4Fhu37C5CcixJqJBrp67Emdpa6TBzu2YMceO6krUgXNLchTtL9ahAYJymB5AcAerc/dvoGX9F7KFbqDU0/xFpDzmeqwZ0SJ2YZRWW9h7M+TCoIH/KtAmMDjjnhpiD6mWirQcD0TmhWLMPw9eurVLM3Ax/j66eaD9dlmPBp7rgBI3mfi2tif9k4N+/gYDgIPNjgyY1x/eR4nXIq7N83i50PkBxnlwqH2dlMy1vC9VfdQgSkcHrqnlk2beuAENu/O2rH5EAKeQM1+am3mqA+UoUeXo5YGmebl5y5WEZmIbnYauTAPVYHj0UM+WV7+8JzQ9lYhBm0k6JnaL09PIcl/r4Y9j9o6CSP15rFRyjvyBqHlU9efdBJKzO6FCOaDMAbfy0scuLf4poiqtXxLq4OYiSOnbm00I2apPlOfwkVHpyL/AOxww2tIzLKjBUc2K5X51ZPg+YcLmbZFqwXIbiW9h0iI0gm/po39M2lh+81a7Gxt343lL9VeIl8jSKx5C3020A/IjYtEkw1fRnGPFKAKa1eDQ9Fr081SMDN1EJGCF3g8Xx6cHBl5aWhO+ayUTNaQU1is8SemJutsnvIr9+0WG3NjQoUO0jx/OgBSl0wwbDlyUfHv+YRBwsU9H5U07JgDHdh1OiM8cv40j37MyOGDM2vY2TnKg/tgBdsXFGa/qu9cOymT+oXMJqwCWWzoo0m4wB8gToj7BZNYm/jwx37U9acbHDLQLSlZlA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(316002)(83380400001)(38070700005)(6506007)(2616005)(54906003)(71200400001)(186003)(2906002)(36756003)(6916009)(76116006)(64756008)(91956017)(38100700002)(66476007)(4326008)(66946007)(66556008)(6486002)(8676002)(66446008)(122000001)(8936002)(86362001)(53546011)(6512007)(478600001)(41300700001)(4744005)(33656002)(5660300002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60A1DCE75FD8C94A9343A4A4CC0761C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8253
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a7926bb4-f492-43f3-4b3e-08da875a2c66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/k25b6zNOZkfCYSGIF65ShX2BMADMNJ2m8fUBdkAeuwVULjoIX0PckRxSNNjXhQOVjq9MAgq8lpcrBRh3WWMZD5KIQ2DHzhzp+GkKuNrhgxsZhv6OHs7VCK5O2Ipn24hBV9NyVa2fVSBxA2ImTZ996rftKb9EO+nOmlSJE906ktrfqcv8BEyXi3X67Ippa7DjXTR4sUJthJDFMOws3mx9xpZqbb8dmiQPeNSGNv133dla+b51xHOqncvyffR3k6ulrPbkHlXz08FXYj7F2pE4ERE02ZDnTPHIRZxn5dBmWLKd9aX8BVRuBckxuAZQSvixLseKQKvdo83eyEyYh7Tp2K63+DKhU2houlO6Rz8vVm6bh9OVnpxx9bMtrtBMMhDBaqXCGtHzjV8aYMAN5EVGdvxizlKPBguy7wNfMfft/IBOTQUsFrBQS6RDXMGgtzYEXLj8sfSw73W7bbUuT0WNfBjxgXkP+sDdkIH4g/9n1jt1hq4YWq/1nAU+hs3CLK9fde20o4UiWPJQljGIdSvEsbhheLxW1fVvKAtrlk7XPVSKbi9asQ0FbR1dDt3SvbUq31dx7pTn8RSTkHa8FxemW9rCpwWHaxAQ9ryB4dNGVp/Nsc1pzUYVyDbPgQKwxxaMeCk0+j7c/MIx/kjpOmlEqppg+bv18L44qFEGnnDav7x/yPpfcxEO8Q+Qodf6xuL7PPsRwfIA+kIVLhH6TZ2Smcd6nTHhaqkMZeYets9cG3eva18QPZ9VyB3Eijp8YIIEw0B0C1w3rlqfvP0M4DnA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(136003)(346002)(36840700001)(46966006)(40470700004)(86362001)(83380400001)(8676002)(4326008)(107886003)(4744005)(70206006)(70586007)(8936002)(6862004)(33656002)(6486002)(5660300002)(41300700001)(2616005)(336012)(478600001)(186003)(6506007)(36756003)(81166007)(40480700001)(356005)(26005)(53546011)(2906002)(47076005)(36860700001)(82740400003)(82310400005)(54906003)(40460700003)(316002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 11:57:48.5207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89531bbc-cd07-4fc9-448a-08da875a323a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 11:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169913


> On 26 Aug 2022, at 11:43, Luca Ceresoli via lists.openembedded.org <luca.=
ceresoli=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> Apparently you prepared this patch within the poky git repository. You
> shouldn't do that, poky is an integration layer and should not be used
> for bitbake development.
>=20
> Since you want to patch bitbake, you should:
> - clone the bitbake repository
> - make your commit there
> - send it to the bitbake mailing list.
>=20
> Look at the README.md in the poky root directory for more info.

FWIW, git is typically clever enough to handle this case.  Feel free to pos=
t the patch you have against the poky repository directly to the bitbake ma=
iling list.

Thanks,
Ross=

