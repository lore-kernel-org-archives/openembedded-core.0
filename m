Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CC6C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:47:38 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.116])
 by mx.groups.io with SMTP id smtpd.web08.793.1643053655114351126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=jS4WF3B5;
 spf=pass (domain: arri.de, ip: 40.107.4.116, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYSeggS9Pjc4K3Cn4d/yREWYcolRNPo2tAckk8+DpnVt+J38+ADqXP+W0i4+w0PRItkuprfsPw4iRuhqapuJNhdJ0DuQ59rIEUJzpmDezmaB9YKuT6i1uAUueuUfUWKicNGckZrRHju8UVCLy3fMLwi/4Vx5TK/nxxIz8UzdheX6O20+E0fQEdDGMv3QUnbcdku+Fs/XO11Kz2Spy+t1rhFKW1GvEWi1fB5OTqZKAKdH2y66kwqQksniMpvsg1w2ntavHF5bN6onBkQB+RpuR76JcHfiIDC80AAqB9GM9Lu+rGKbwuCHOaQCdBcfJsFK3pQnDVpIWiyIKFg+e16R4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygaXfgJhUnBEImIdqYDonY3OVsRdksDXm0W68PkJ1U0=;
 b=NqwXpNhE8Lmb+YWyW0tfLtSxVgkfcK3uDoyLJbQlSOEs5v0ZfJPiQrCHCWtdvlvDZGJAOuPBviVcvKFQipeum2Zoys2Pl6TO//sCV9FS9IwvArqsUal7VHDjpKCj8lvZVlbzT/uyTlU0GSXCn19FoQ7SiHgoiAh05mwaNpEmcBtGu/kBQYHpeMZ1BCempBBlkd2vqAP45ar0Oru45JQqYnSPMq9owDvNPVIgZEOr1vsdhop9y4RECLmI4nUr115HDw4P4Zup2hAoziqJjuDRxPSOPS35Y01zHTm/iKfTxkLbajGFoaI/66XCkDrrEfquvMSAEQkTMyAsut/eKBAy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 104.40.229.156) smtp.rcpttodomain=ossystems.com.br smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygaXfgJhUnBEImIdqYDonY3OVsRdksDXm0W68PkJ1U0=;
 b=jS4WF3B5+u2P2K3TEyC4ZBZ8dAvuMkSaV6m8ZCELgT9d+KVCX7D5KN65C64d8HcEDfNJuMhlJSq+9vPgWXWdA9qKpt8o34XXrA2unuoMKkWO+USnwPxkkPbgm5cX0qSp1wYdP5+xQXhyOI+a6Zt4cACwQVri7LLMDJmiqWFEJzs=
Received: from AS9PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:20b:46a::35)
 by PR3PR07MB8274.eurprd07.prod.outlook.com (2603:10a6:102:179::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.8; Mon, 24 Jan
 2022 19:47:32 +0000
Received: from VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::fa) by AS9PR04CA0050.outlook.office365.com
 (2603:10a6:20b:46a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17 via Frontend
 Transport; Mon, 24 Jan 2022 19:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 104.40.229.156) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 VE1EUR02FT054.mail.protection.outlook.com (10.152.13.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 19:47:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.52)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Mon, 24 Jan 2022 19:47:31 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 14417918
X-ExclaimerImprintLatency: 2918960
X-ExclaimerImprintAction: 656acef15d634b5caefc9b03f8816e93
Content-Type: multipart/related;
	boundary="----_=_NextPart_61ed61ea-427d-43b1-8ee9-a11479c58bb8"
Received: from SV0P279CA0041.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:13::10)
 by DBAPR07MB6693.eurprd07.prod.outlook.com (2603:10a6:10:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.2; Mon, 24 Jan
 2022 19:47:28 +0000
Received: from HE1EUR02FT049.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:13:cafe::b2) by SV0P279CA0041.outlook.office365.com
 (2603:10a6:f10:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Mon, 24 Jan 2022 19:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.66)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.66 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.66; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.66) by
 HE1EUR02FT049.mail.protection.outlook.com (10.152.11.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Mon, 24 Jan 2022 19:47:27 +0000
Received: from dhcp-192-168-0-28.wgnetz.xx (192.168.55.5) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 24 Jan
 2022 20:47:26 +0100
From: Christian Eggers <ceggers@arri.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Fabio Estevam
	<festevam@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>, Heiko Schocher <hs@denx.de>, Fabio
 Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH meta-oe] rtc-tool: Add a recipe
Date: Mon, 24 Jan 2022 20:47:25 +0100
Message-ID: <3181378.44csPzL39Z@dhcp-192-168-0-28.wgnetz.xx>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: 
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
References: <20220123150358.1306062-1-festevam@gmail.com>
 <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.5]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4bcbcf39-a484-417b-c5e3-08d9df725bf0
X-MS-TrafficTypeDiagnostic: 
	DBAPR07MB6693:EE_|VE1EUR02FT054:EE_|PR3PR07MB8274:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB8274BCA0F381DD0E08CE31B4BF5E9@PR3PR07MB8274.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ioKxGzxjG+ljsHBOnm82VyC2Z1E359r2pp3+ujl3ElcvbtfX3wnV6iCJL/BdFkYWbKsBfu8Z9c2G7UHEqbXNcjWOgK1wG+mnXdPCH9RnnCmA8DoHGcJqy4oCaO/8i0/JtY9HtWWnLAEWQLsJHq9xh2RIoq+HOk2O3So/LV3GgDP4CgP1L5DaFr8OCCfkUhZyLndMrvlfEyKSoBGQI3x2j2CrpSWB2zTQ7+tgzp9xzTZLqvUcbqyV/56Lv+b1VMCP5O2LKTEWl2g4aZVJ0wAaTZoI+nJSPZZugeGSsrAX5d3BPBaoab1awSHbUiuDr1hYrYqRM1MbPXOPCypHCHJWk7ajNWvuso8bs5NObqW6fziFzRK4cj/K7Lunbt3TbT8WEpr3bbAzWfQZ/NUsMvTBGJkN1rhvAPDWRdkmnynoFKy+k3t4DQBhwPLgsXyI2xMImIgPbOQPLRjSpLK57/oh2WHi5A9zfIQi5LCAfyk/t0cP9ljQpt6JvtGBg2T4zHyW8yya6tK7K1p4JnSotCAQJxMTv6HhtA7/DUdeiaAkEXbbi4Sir71Qj2RFP/YxctQGFDin0iAhfX8KnJKv0NLURC0nBKY9X/Jpj9pt+MNglWB9Zm+miY3ymHl3WoDbc9UK3yl3qeRlQOK+kpio1o9UayCQVAAHgee3nC9v/nsqlY4qyNzv5C/H3QkzbabN/9Y4Y2UhnbNYCriyt6zOOGexAI4AhC8O9aDfs81beLXy2fAsXreDjOgUBb+fDY7jqcOCvFeWxnSSCxHITXYw6+bU0LRwoFMGuDyTkFRFGB9wProoFB4we5EjBn8dTeamG0B+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.66;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70586007)(70206006)(8936002)(316002)(4326008)(8676002)(5660300002)(9686003)(53546011)(36916002)(7696005)(55016003)(40460700003)(82310400004)(81166007)(356005)(110136005)(508600001)(426003)(336012)(16526019)(47076005)(186003)(26005)(54906003)(2906002)(36860700001)(86362001)(39026012)(102196002)(36900700001)(20210929001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6693
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbfd8986-e881-43c1-289f-08d9df7259a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FoKU+kHvMyPJFC8GOrohF+F7elzyHlGz4s7H9IqQfjZcysr9t0vGHSSCMAjUCn0JMHUrw7K0N4tp/wItQg9zdQ5U2HsnLEk75PIuCY5bvuZfc/CojfGr3RkHt1koo6o2vjKQNyCEa7Bs266gCg34lNCVfG1jxHrh+BmG8BMEMMD09jtucuMrSpLR0ip4MXgDDiffSCVx3surfdtvS+UaljFGFV5mYI8BgPvpVb5uujYeFCDxT6dCYPz97nYLpID4grc+PxLyx9OnhKikbHrSYWl7Vdk8lGDzIE8iwvjnW3WdXcL617rMcOLv2T5iU4yOPlOapb25qTuHiFwnC/cXIHmrImGrHIcsAMXGkrLF4rDfglcx0YrwD67SZ/u5wLKGp0Fx2VUsYyOYXzvVcWNQW/2rtwxGhzvXDroWeG4deyWxlsAF3IsXO/psGwumxegz49WPdY8/nwXJ0jq80K5b4gBQ/2zRhD7YB++7MqZNYvHldVkneMjYF8Ngbbz1+HAUDFPw1J+x+ia6jHedUtO+zes5d5jwB0YOSzNO2ANH6Ow3F50QVqZJ1TYazNglmg3HKAS+y/wxy2AVCK6xIrGaXA893ACcjcWZr0RKiZ4Bk+eFiRavPL+GW7ikV+iEFKP7BjJ5C/rR6aPHAS1OSD0j1WuzkKa/Yt93/U/vO9y+sSRksnhQlWcxVrYp/VrcG30Gxk5xgmdQTCCFE0HXvtWgyXfEoaMh08Wm5um9JtAx4a+hirGQFK2kfxWrZ5orwM5aBhDWArd26G0KOs3Kp8Oxt3VO5XeTLsIxZEuGDGtUdR8zuOplilsGmbulcFFsW0mTiGugZhT07IJq0e7XQSes2GYx7yIuxBuzTejPt4tXLN4=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(33964004)(316002)(2906002)(86362001)(4326008)(70586007)(7696005)(508600001)(9686003)(166002)(7066003)(8936002)(36916002)(70206006)(8676002)(7596003)(54906003)(110136005)(53546011)(82310400004)(15974865002)(47076005)(16526019)(5660300002)(63350400001)(7636003)(336012)(26005)(426003)(186003)(66574015)(55016003)(40460700003)(36860700001)(39026012)(102196002)(20210929001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 19:47:30.2033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bcbcf39-a484-417b-c5e3-08d9df725bf0
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT054.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:47:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160896

This is a multi-part message in MIME format.

------_=_NextPart_61ed61ea-427d-43b1-8ee9-a11479c58bb8
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_b1750d4d-292a-4f44-b65d-51983bab5df3"

------_=_NextPart_b1750d4d-292a-4f44-b65d-51983bab5df3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Fabio, hi Alexandre,

On Monday, 24 January 2022, 20:18:34 CET, Fabio Estevam wrote:
> Hi Christian,
> 

_______________________________________________________
Christian 
Eggers
Software Engineer
=E2=80=8B
ARRI
Arnold & Richter Cine Technik GmbH & Co. Betriebs KG 
Arriweg 17, 
83071 
Stephanskirchen
www.arri.com 

+49 8036 3009-3118
CEggers@arri.de

=E2=80=8B
Get all the latest information from www.arri.com, Facebook, Twitter, Instag=
ram and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler

=E2=80=8B
> On Mon, Jan 24, 2022 at 6:57 AM Christian Eggers <ceggers@arri.de> wrote:
> >
> > Hi Fabio,
> >
> > from my experience, custom build systems (including "bare" Makefiles)
> > are often hard to integrate/maintain for distributors.
> 
> rtc-tools is a straightforward package and I have sent the Makefile
> patch upstream.
> 
> Not sure why it can be hard to integrate or maintain it.
ok, maybe my statement was a little bit opinion based. It is likely
that the OE/Yocto maintainers have a different position to this.

I remember that I've read an article (but cannot find it again) that
custom build systems regularly causes headaches for distributors
(because they usually use custom/no ways for setting compiler switches
and installation directories which normally the distributor want to
control).

Well known systems like autotools (I don't fully understand them) or
cmake (I use it) have a standardized interface for setting
important switches. Additionally they provide common features like
cross-compiling, platform specific stuff, removing build artifacts
(clean), installation of generated files or out-of-tree builds.

Doing the same in bare Makefiles is possible, but requires much hand-crafte=
d
code. Often Makefiles consist of a lot of repetitive code. You can use 
macros for this. After putting everything into macros, you will have
reinvented either cmake or kbuild.

> 
> > What about using CMake instead?
> 
> I can do that if needed, but it is up to the rtc-tools maintainer, Alexan=
dre.
I am not involved into rtc-tools and also not much into OE/Yocto.
So don't count too much on my opinion and choose the best solution
yourself.

regards
Christia
(having created hand-written Makefiles for 13 years)




------_=_NextPart_b1750d4d-292a-4f44-b65d-51983bab5df3
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Hi Fabio, hi Alexandre,<br /><br />On Monday,=
 24 January 2022, 20:18:34 CET, Fabio Estevam wrote:<br />&gt; Hi Christian=
,<br />&gt; <br /><div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-w=
ebkit-text-size-adjust:100%;direction:ltr;"><table cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" style=3D"width:100%;"><tr style=3D"font-size:0;"><=
td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" ce=
llspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:=
0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size:0=
;"><tr style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-weig=
ht:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;=
font-family:Calibri,Arial,sans-serif;">____________________________________=
___________________<span style=3D"font-family:remialcxesans;font-size:1px;c=
olor:#FFFFFF;line-height:1px;">&#8203;</span></td></tr><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"f=
ont-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpa=
dding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F=
7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font=
-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:=
Calibri,Arial,sans-serif;">Christian</td><td align=3D"left" style=3D"vertic=
al-align:top;color:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br=
 /></td><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,=
Arial,sans-serif;">Eggers</td></tr></table></td></tr><tr style=3D"font-size=
:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;fo=
nt-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size=
:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calib=
ri,Arial,sans-serif;">Software&nbsp;Engineer</td></tr><tr style=3D"font-siz=
e:14.67px;color:#000001;"><td align=3D"left" style=3D"vertical-align:top;fo=
nt-family:Calibri,Arial,sans-serif;">&#8203;</td></tr></table></td></tr></t=
able></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"verti=
cal-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" sty=
le=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left" style=3D"=
vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0=
" style=3D"font-size:0;color:#0E50AD;font-style:normal;font-weight:400;whit=
e-space:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=
=3D"vertical-align:top;font-family:&#39;Arial Black&#39;;">ARRI</td></tr><t=
r style=3D"font-size:10.67px;color:#7F7F7F;"><td align=3D"left" style=3D"ve=
rtical-align:top;font-family:Arial;"><span style=3D"font-size:11px;">Arnold=
&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;C=
o.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></td></tr></table></td></tr><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:10.67px;"><td align=3D"left" style=3D"vertical-align:top;fo=
nt-family:Arial;">Arriweg&nbsp;17</td><td align=3D"left" style=3D"vertical-=
align:top;font-family:Arial;">,&nbsp;<br /></td><td align=3D"left" style=
=3D"vertical-align:middle;font-family:Arial;">83071</td><td align=3D"left" =
style=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br /></td><td ali=
gn=3D"left" style=3D"vertical-align:middle;font-family:Arial;">Stephanskirc=
hen</td></tr></table></td></tr></table></td></tr><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-siz=
e:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#1532B9;fo=
nt-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size=
:11px;"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">=
<span style=3D"text-decoration:underline;"><a href=3D"http://www.arri.com/"=
 target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline;co=
lor:#1532B9;"><strong style=3D"font-weight:400;">www.arri.com&nbsp;<br /><b=
r /></strong></a></span></td></tr><tr style=3D"font-size:0;"><td align=3D"l=
eft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"=
0" border=3D"0" style=3D"font-size:0;color:#858080;font-style:normal;font-w=
eight:400;line-height:normal;white-space:nowrap;"><tr style=3D"font-size:14=
=2E67px;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-siz=
e:0;"><img src=3D"cid:image558382.png@7B0A72DB.3D26A43D" width=3D"20" borde=
r=3D"0" alt=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-siz=
e:0;" /></td><td align=3D"left" style=3D"padding:0;vertical-align:top;font-=
family:Calibri,Arial,sans-serif;"><a href=3D"tel:+49%208036%203009-3118" ta=
rget=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858=
080;"><strong style=3D"font-weight:400;">+49&nbsp;8036&nbsp;3009-3118</stro=
ng></a></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=
=3D"cid:image912385.png@E004867E.33245174" width=3D"20" border=3D"0" alt=
=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /></t=
d><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank"=
 id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;"><strong s=
tyle=3D"font-weight:400;">CEggers@arri.de</strong></a></td></tr></table></t=
d></tr></table></td></tr></table></td></tr><tr style=3D"font-size:14.67px;c=
olor:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><td ali=
gn=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-seri=
f;"><br />&#8203;</td></tr></table></td></tr><tr style=3D"font-size:0;line-=
height:normal;"><td align=3D"left" style=3D"padding:0;vertical-align:top;">=
<a href=3D"https://www.arri.com/en/lighting/led/orbiter-accessories/orbiter=
-dockingring/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoratio=
n:none;"><img src=3D"https://assets.arri.com/media/sign/2022_Orbiter_Dockin=
g-Ring_E-mail-Signature_650x95.jpg" border=3D"0" title=3D"Orbiter Docking R=
ing" alt=3D"Orbiter Docking Ring" style=3D"font-size:12px;" /></a></td></tr=
><tr style=3D"font-size:13px;color:#7F7F7F;font-style:normal;font-weight:40=
0;white-space:nowrap;"><td align=3D"left" style=3D"padding:0;vertical-align=
:top;font-family:Calibri,Arial,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;late=
st&nbsp;information&nbsp;from&nbsp;<span style=3D"text-decoration:underline=
;"><a href=3D"http://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" ti=
tle=3D"www.arri.com" style=3D"text-decoration:underline;color:#7F7F7F;"><st=
rong style=3D"font-weight:400;">www.arri.com</strong></a></span>,&nbsp;<spa=
n style=3D"text-decoration:underline;"><a href=3D"https://www.facebook.com/=
TeamARRI" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:und=
erline;color:#7F7F7F;"><strong style=3D"font-weight:400;">Facebook</strong>=
</a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"htt=
ps://twitter.com/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">Twitter</strong></a></span>,&nbsp;<span style=3D"text-decoration:unde=
rline;"><a href=3D"http://instagram.com/arri" target=3D"_blank" id=3D"LPlnk=
689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong style=
=3D"font-weight:400;">Instagram</strong></a></span>&nbsp;and&nbsp;<span sty=
le=3D"text-decoration:underline;"><a href=3D"http://www.youtube.com/user/AR=
RIChannel" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:un=
derline;color:#7F7F7F;"><strong style=3D"font-weight:400;">YouTube</strong>=
</a></span>.<br /></td></tr><tr style=3D"font-size:0;"><td align=3D"left" s=
tyle=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"font-size:0;color:#6A6A6A;font-style:normal;fo=
nt-weight:400;white-space:nowrap;"><tr style=3D"font-size:10px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Arial;"><br />Arnold&nbsp=
;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nb=
sp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Regist=
ergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsre=
gisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;=
Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&=
nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:=
&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternumm=
er:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Micha=
el&nbsp;Neuh&#228;user;&nbsp;Stephan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauning=
er;&nbsp;Markus&nbsp;Zeiler<br /></td></tr><tr style=3D"font-size:14.67px;c=
olor:#000001;"><td align=3D"left" style=3D"vertical-align:top;font-family:C=
alibri,Arial,sans-serif;"><br />&#8203;<br /></td></tr></table></td></tr></=
table></td></tr></table></div>&gt; On Mon, Jan 24, 2022 at 6:57 AM Christia=
n Eggers &lt;ceggers@arri.de&gt; wrote:<br />&gt; &gt;<br />&gt; &gt; Hi Fa=
bio,<br />&gt; &gt;<br />&gt; &gt; from my experience, custom build systems=
 (including &quot;bare&quot; Makefiles)<br />&gt; &gt; are often hard to in=
tegrate/maintain for distributors.<br />&gt; <br />&gt; rtc-tools is a stra=
ightforward package and I have sent the Makefile<br />&gt; patch upstream.<=
br />&gt; <br />&gt; Not sure why it can be hard to integrate or maintain i=
t.<br />ok, maybe my statement was a little bit opinion based. It is likely=
<br />that the OE/Yocto maintainers have a different position to this.<br /=
><br />I remember that I&#39;ve read an article (but cannot find it again) =
that<br />custom build systems regularly causes headaches for distributors<=
br />(because they usually use custom/no ways for setting compiler switches=
<br />and installation directories which normally the distributor want to<b=
r />control).<br /><br />Well known systems like autotools (I don&#39;t ful=
ly understand them) or<br />cmake (I use it) have a standardized interface =
for setting<br />important switches. Additionally they provide common featu=
res like<br />cross-compiling, platform specific stuff, removing build arti=
facts<br />(clean), installation of generated files or out-of-tree builds.<=
br /><br />Doing the same in bare Makefiles is possible, but requires much =
hand-crafted<br />code. Often Makefiles consist of a lot of repetitive code=
=2E You can use <br />macros for this. After putting everything into macros=
, you will have<br />reinvented either cmake or kbuild.<br /><br />&gt; <br=
 />&gt; &gt; What about using CMake instead?<br />&gt; <br />&gt; I can do =
that if needed, but it is up to the rtc-tools maintainer, Alexandre.<br />I=
 am not involved into rtc-tools and also not much into OE/Yocto.<br />So do=
n&#39;t count too much on my opinion and choose the best solution<br />your=
self.<br /><br />regards<br />Christia<br />(having created hand-written Ma=
kefiles for 13 years)<br /><br /><br /><br /></div></body></html>
------_=_NextPart_b1750d4d-292a-4f44-b65d-51983bab5df3--

------_=_NextPart_61ed61ea-427d-43b1-8ee9-a11479c58bb8
Content-Type: image/png;
	name="image558382.png"
Content-Transfer-Encoding: base64
Content-ID: <image558382.png@7B0A72DB.3D26A43D>
Content-Description: image558382.png
Content-Disposition: inline;
	creation-date="Mon, 24 Jan 2022 19:47:30 +0000";
	filename=image558382.png;
	modification-date="Mon, 24 Jan 2022 19:47:30 +0000";
	size=528

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC

------_=_NextPart_61ed61ea-427d-43b1-8ee9-a11479c58bb8
Content-Type: image/png;
	name="image912385.png"
Content-Transfer-Encoding: base64
Content-ID: <image912385.png@E004867E.33245174>
Content-Description: image912385.png
Content-Disposition: inline;
	creation-date="Mon, 24 Jan 2022 19:47:30 +0000";
	filename=image912385.png;
	modification-date="Mon, 24 Jan 2022 19:47:30 +0000";
	size=824

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=

------_=_NextPart_61ed61ea-427d-43b1-8ee9-a11479c58bb8--

