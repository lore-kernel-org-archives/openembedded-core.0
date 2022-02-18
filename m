Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E98C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:20:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.137])
 by mx.groups.io with SMTP id smtpd.web08.8352.1645172455003285707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:20:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=rVtnqvbr;
 spf=pass (domain: arri.de, ip: 40.107.20.137, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0rzIrPs+L8yhBKdUGj0CDGENIWZkDbldVpvAcWmoy0FYFsIP/hVQzOpqbWfi5vQMqFznu53u44Tmfm+VZI+V69FaiXsh/DN5ICsFkBmxKBF3VWYNlCHGL4OjhHEM5uuoMY+bI5HntHIUXTkdwgy6HnMHzTYzjeTJbQcVnANvxEsUukF395o7djBskwJz57aRz1YO73iv3A8ZxBQn6DDRI57pYdMpKzpmKS1tdlK2QXbXr9R5/5vsjf7yIyCiaI7yJiyE5KYvOoeFjxp3S70cLioNQoIbUN2r1UK34jd1Id/2CSehusdlpSmDtNM9aIlFTTLUM4A4OOagsVKF/5emA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dimri4Pha0uSEelO9Yz25UXnbdOLEjYyGUtccdBEfZo=;
 b=Ec+HhW8G7b4NSeB+Zu6rxRI4fsuiwi1I/8opYZlgcrdNb2GufHybgxhO06t3OfwB+F9ixaiKBAOCdTW12p2jS8j8SNMbI5Zjo7LAJhnFuJT3G6az9GVEerL0VRRG6AM3ePDrz+02Qw8VaOXElzQt+NZ2011ygQtR3ezWx3R2ASCnwLAJqROsxHesimg6F0jYUMFkxztEMJG0SYOJIVD8m1WB6pZ2i0yqjNJnJqSOHJRQJano4D4X9XaDJA1on9NNc9CSVhv1yaZuABJXYbYes+p8D2ZBllimEDHSvChtlCv1ejF8CkqfJFsE9geu1XM3Aa/0H8Ze+PJHcUR4xkNKkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=bestguesspass action=none header.from=arri.de; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dimri4Pha0uSEelO9Yz25UXnbdOLEjYyGUtccdBEfZo=;
 b=rVtnqvbruKtHDnEHO5xBERVnXjlX8IP5N6KMkfNNh0jje7b2v+aL1kwqrV2vhWL11cW9g1sCKtI8WP6lzAPEkEm89E+QpRRYGDCI8QD+ctkvuHxh4SmmunLZPFgYM75eay/aTU8YNfGk+PzZrWvLbHmrUM43kaPL1m0Q/X4fLTM=
Received: from SV0P279CA0033.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::20)
 by AM0PR07MB4322.eurprd07.prod.outlook.com (2603:10a6:208:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.8; Fri, 18 Feb
 2022 08:20:51 +0000
Received: from HE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::4e) by SV0P279CA0033.outlook.office365.com
 (2603:10a6:f10:12::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Fri, 18 Feb 2022 08:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 52.169.0.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.169.0.179; helo=eu2.smtp.exclaimer.net;
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 HE1EUR02FT025.mail.protection.outlook.com (10.152.10.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Fri, 18 Feb 2022 08:20:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.58)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Fri, 18 Feb 2022 08:20:50 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 11740470
X-ExclaimerImprintLatency: 2572838
X-ExclaimerImprintAction: a1b4bda18c3c4c9e8df865539a729202
Content-Type: multipart/related;
	boundary="----_=_NextPart_313b0d56-f036-4260-b952-78f6725fe65e"
Received: from SV0P279CA0031.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::18)
 by AM6PR07MB4536.eurprd07.prod.outlook.com (2603:10a6:20b:16::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.13; Fri, 18 Feb
 2022 08:20:46 +0000
Received: from HE1EUR02FT061.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::29) by SV0P279CA0031.outlook.office365.com
 (2603:10a6:f10:12::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16 via Frontend
 Transport; Fri, 18 Feb 2022 08:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 HE1EUR02FT061.mail.protection.outlook.com (10.152.11.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Fri, 18 Feb 2022 08:20:46 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 18 Feb
 2022 09:20:45 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Fri, 18 Feb 2022 09:20:45 +0100
Received: from localhost.localdomain (192.168.54.90) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 18 Feb
 2022 09:20:45 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: Building nativesdk package with Rust
Date: Fri, 18 Feb 2022 09:20:44 +0100
Message-ID: <1853760.eGJsNajkDb@localhost.localdomain>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.90]
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 9893e4da-6ffa-4c07-3474-08d9f2b792d8
X-MS-TrafficTypeDiagnostic: 
	AM6PR07MB4536:EE_|HE1EUR02FT025:EE_|AM0PR07MB4322:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR07MB43225B3E74C6199A3DD237A4BF379@AM0PR07MB4322.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SRpT3cCsXnAU82bBiWR4h8t1s6cWkhEFEnIeGUNt3jwQCe+Fr0bcrm5xPuDmI5tDhs5EI/5bQrFkcsWBHKsAc5UU3MCiLcXkhebE7V/MAW0JzpPL4lE5dg/LBmuRgFTA++z+/zIQu9uGmm5ivDzRiRoHWOnB1M51RCX7CIXDSlMIMjiNH8mgwWC7A+grVZmJ2c59f3nRxVcObc3/k1yJDDHi78pxmuvi4N0P+RIpa0O1mowCMTJr2DofSTTp6otp66xwKcLvbbYJLmeInztrI0OzFRoBMzB+c6wwGJRYz+7jnkJ1Ucnl3XenI79ioKfeW4dHEUWytKsmJCxmqnDvQ6vj+6S7RMR5QaWdGsXwcGoc8V51tby06wH6iqhGX6IokytQUQpceEm/QcypIyJcHuOtIcKImZ9gI8U/h+siGnkuEiU1V61PUXtLcldtKv7klAbQ5AL8rKX8gIFW6NNP3YltCcml8cXX348z4NmuEOLtMtMKw0X60+a8JzrpFarObNeO0Cf0vF+z+meJcmuy4vo1cF9ZVpNFUWgEMUCHztdIobcLaaf70PpE7Dj+efe4OP+KEJ5fRTCBf9zFb5Zb+6AsDc7RShGngWsbAsMPLLZox7bw6nWN4TAUChqxvtvTDpN8wNiXYeP5KPI+0cueUKTYScK17YpRC5fTVloLE3+nCirojTU/Qkr7zs7ew1MdGCYhGm0G+nsPxU44mfWzlQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(336012)(7696005)(36860700001)(82310400004)(9686003)(2906002)(40460700003)(83380400001)(186003)(86362001)(8936002)(81166007)(26005)(5660300002)(55016003)(36916002)(70586007)(316002)(426003)(16526019)(70206006)(508600001)(356005)(4744005)(8676002)(6916009)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4536
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 HE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ce4a5ee8-df1e-48be-7a56-08d9f2b7905f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yphzOfq5vKi0viFWk9l0niBClB5bt3Zw4RCQ61ktW431st5xYBQ8Nf/K78o9OI7XrzYcMvbzaVqsctKnpxJwRjdTlagSeHkQGOf9jviiRC1FEtp5LwvGh3P1opUYoeEVDVJQlmH2JzDmeJbKv+xM3NOwSBAD3XOb+cGBrij32rk+WDFK7VDSxBNT5lbXLAmbtw4+4LQshqiV2RiEK/VhdmVJi9ZU4N4mB/nVtTvf1no7YDjc3CvTSuuJrpYZrJNKDRDgR91796BVTmUZFD1fuDy71aX7Cyq4MSq/7xIQVF8nBwA5YoXA48GYxnqRS+lpHMOoBNia74Tgly/m6jXo9zew+bdcrNmOwd5xwHxW7lJaLV8cGh++aJJYYd3gYS3TKVxrAUlTsuorfT9Ab5vHNa7wUy3603+Jr8kcWX6nUP+2opSKkTMKRCn4SnSlGRPgP0H5zbVXk4IrZmXjqDeTRtWIlev1i+ykLZtZ6/GL+8Vj/Wnb2KUjEuj/lp/E9+wToQtXVoVcyzrnCfnedprxZC4SImaeLWGu5wPnHbBLfmCZlmt0fpWWqiS55bToXS3n9dNvXCT5hkJPcGSrecqR5p6IB8mWjXUP9CPEXa0gm6SYS9Y/zuot/XTOTydg8JKxyVYtZu5NoWEbOzfSxXVpAop09TfesxYsqCTyMUziEQhXE28foKQHYcFCX0c/4BHHK0wZqIrJSu8ycwTUubCZZvmb6Zf38CIwOh9P3DZQRMLhRyCETg/Jv2fnD713wIMVu7rAzz0UYL8QvR0B30GVPbu8CGB8ZiR5qn04mjmsgT0=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(2906002)(86362001)(66574015)(5660300002)(40460700003)(166002)(16526019)(83380400001)(47076005)(36860700001)(7696005)(8936002)(36916002)(33964004)(6916009)(7066003)(55016003)(70206006)(426003)(70586007)(316002)(336012)(82310400004)(9686003)(15974865002)(7636003)(186003)(7596003)(8676002)(508600001)(26005);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:20:50.1059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9893e4da-6ffa-4c07-3474-08d9f2b792d8
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB4322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 08:20:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161887

This is a multi-part message in MIME format.

------_=_NextPart_313b0d56-f036-4260-b952-78f6725fe65e
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_b1bf642b-cd92-41d4-a8f8-b0671fd2dd96"

------_=_NextPart_b1bf642b-cd92-41d4-a8f8-b0671fd2dd96
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

In oe-core commit 67dd505c42 ("librsvg: do not enable nativesdk"), 
nativesdk support for librsvg has been disabled:

> rust is not currently available for nativesdk builds:

> WARNING: Nothing PROVIDES 'nativesdk-libstd-rs' (but virtual:nativesdk:/h=
ome/pokybuild/yocto-worker/a-full/build/meta/recipes-gnome/librsvg/librsvg_=
2.52.0.bb DEPENDS on or otherwise requires it). Close matches:
> WARNING: Nothing PROVIDES 'virtual/nativesdk-x86_64-pokysdk-linux-rust' (=
but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipe=
s-gnome/librsvg/librsvg_2.52.0.bb DEPENDS on or otherwise requires it). Clo=
se matches:

After retrying today, only the 2nd warning was shown.

librsvg is used by graphviz which in turn is used by doxygen. I would like
to put this in my SDK again.

Is it possible to solve this problem in a foreseeable future?

regards
Christian




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

------_=_NextPart_b1bf642b-cd92-41d4-a8f8-b0671fd2dd96
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>In oe-core commit 67dd505c42 (&quot;librsvg: =
do not enable nativesdk&quot;), <br />nativesdk support for librsvg has bee=
n disabled:<br /><br />&gt; rust is not currently available for nativesdk b=
uilds:<br /><br />&gt; WARNING: Nothing PROVIDES &#39;nativesdk-libstd-rs&#=
39; (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/r=
ecipes-gnome/librsvg/librsvg_2.52.0.bb DEPENDS on or otherwise requires it)=
=2E Close matches:<br />&gt; WARNING: Nothing PROVIDES &#39;virtual/natives=
dk-x86_64-pokysdk-linux-rust&#39; (but virtual:nativesdk:/home/pokybuild/yo=
cto-worker/a-full/build/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb DEPEND=
S on or otherwise requires it). Close matches:<br /><br />After retrying to=
day, only the 2nd warning was shown.<br /><br />librsvg is used by graphviz=
 which in turn is used by doxygen. I would like<br />to put this in my SDK =
again.<br /><br />Is it possible to solve this problem in a foreseeable fut=
ure?<br /><br />regards<br />Christian<br /><br /><br /><br /></div><div di=
r=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:10=
0%;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" =
style=3D"width:100%;"><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" cellspaci=
ng=3D"0" border=3D"0" style=3D"width:100%;font-size:0;"><tr style=3D"font-s=
ize:14.67px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:now=
rap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;">_______________________________________________________<sp=
an style=3D"font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-heig=
ht:1px;">&#8203;</span></td></tr><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;f=
ont-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td al=
ign=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;">Christian</td><td align=3D"left" style=3D"vertical-align:top;color:#00=
0001;font-family:Calibri,Arial,sans-serif;">&nbsp;<br /></td><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Egg=
ers</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left=
" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" =
border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weig=
ht:400;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;">Sof=
tware&nbsp;Engineer</td></tr><tr style=3D"font-size:14.67px;color:#000001;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,s=
ans-serif;">&#8203;</td></tr></table></td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#0E50AD;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:13.33px;"><td align=3D"left" style=3D"vertical-align:top;fo=
nt-family:&#39;Arial Black&#39;;">ARRI</td></tr><tr style=3D"font-size:10.6=
7px;color:#7F7F7F;"><td align=3D"left" style=3D"vertical-align:top;font-fam=
ily:Arial;"><span style=3D"font-size:11px;">Arnold&nbsp;&amp;&nbsp;Richter&=
nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<=
/span>&nbsp;<br /></td></tr></table></td></tr><tr style=3D"font-size:0;"><t=
d align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" cel=
lspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7F7F;font-style:n=
ormal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10.67px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;">Arriweg=
&nbsp;17</td><td align=3D"left" style=3D"vertical-align:top;font-family:Ari=
al;">,&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:middle;fo=
nt-family:Arial;">83071</td><td align=3D"left" style=3D"vertical-align:midd=
le;font-family:Arial;">&nbsp;<br /></td><td align=3D"left" style=3D"vertica=
l-align:middle;font-family:Arial;">Stephanskirchen</td></tr></table></td></=
tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=
=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"left"=
 style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" b=
order=3D"0" style=3D"font-size:0;color:#1532B9;font-style:normal;font-weigh=
t:400;white-space:nowrap;"><tr style=3D"font-size:11px;"><td align=3D"left"=
 style=3D"vertical-align:top;font-family:Arial;"><span style=3D"text-decora=
tion:underline;"><a href=3D"http://www.arri.com/" target=3D"_blank" id=3D"L=
Plnk689713" style=3D"text-decoration:underline;color:#1532B9;"><strong styl=
e=3D"font-weight:400;">www.arri.com&nbsp;<br /><br /></strong></a></span></=
td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-ali=
gn:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"f=
ont-size:0;color:#858080;font-style:normal;font-weight:400;line-height:norm=
al;white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image1=
92961.png@63A81450.56CE4B61" width=3D"20" border=3D"0" alt=3D"" style=3D"wi=
dth:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"le=
ft" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-se=
rif;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk6=
89713" style=3D"text-decoration:none;color:#858080;"><strong style=3D"font-=
weight:400;">+49&nbsp;8036&nbsp;3009-3118</strong></a></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;=
"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"></td></tr=
><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-=
align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top;"=
></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image111259.png@1A6=
00697.DB94B1B0" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-=
width:20px;max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"=
padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=
=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#858080;"><strong style=3D"font-weight:400;">CEgg=
ers@arri.de</strong></a></td></tr></table></td></tr></table></td></tr></tab=
le></td></tr><tr style=3D"font-size:14.67px;color:#000001;font-style:normal=
;font-weight:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-=
align:top;font-family:Calibri,Arial,sans-serif;"><br />&#8203;</td></tr></t=
able></td></tr><tr style=3D"font-size:0;line-height:normal;"><td align=3D"l=
eft" style=3D"padding:0;vertical-align:top;"><a href=3D"https://www.arri.co=
m/en/lighting/led/orbiter-accessories/orbiter-dockingring/" target=3D"_blan=
k" id=3D"LPlnk689713" style=3D"text-decoration:none;"><img src=3D"https://a=
ssets.arri.com/media/sign/2022_Orbiter_Docking-Ring_E-mail-Signature_650x95=
=2Ejpg" border=3D"0" title=3D"Orbiter Docking Ring" alt=3D"Orbiter Docking =
Ring" style=3D"font-size:12px;" /></a></td></tr><tr style=3D"font-size:13px=
;color:#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Ari=
al,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;information&nbsp;fro=
m&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://www.arr=
i.com/" target=3D"_blank" id=3D"LPlnk689713" title=3D"www.arri.com" style=
=3D"text-decoration:underline;color:#7F7F7F;"><strong style=3D"font-weight:=
400;">www.arri.com</strong></a></span>,&nbsp;<span style=3D"text-decoration=
:underline;"><a href=3D"https://www.facebook.com/TeamARRI" target=3D"_blank=
" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><st=
rong style=3D"font-weight:400;">Facebook</strong></a></span>,&nbsp;<span st=
yle=3D"text-decoration:underline;"><a href=3D"https://twitter.com/ARRIChann=
el" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline=
;color:#7F7F7F;"><strong style=3D"font-weight:400;">Twitter</strong></a></s=
pan>,&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"http://ins=
tagram.com/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decorat=
ion:underline;color:#7F7F7F;"><strong style=3D"font-weight:400;">Instagram<=
/strong></a></span>&nbsp;and&nbsp;<span style=3D"text-decoration:underline;=
"><a href=3D"http://www.youtube.com/user/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;"><strong=
 style=3D"font-weight:400;">YouTube</strong></a></span>.<br /></td></tr><tr=
 style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertical-alig=
n:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0;color:#6A6A6A;font-style:normal;font-weight:400;white-space:nowra=
p;"><tr style=3D"font-size:10px;"><td align=3D"left" style=3D"vertical-alig=
n:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nb=
sp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&n=
bsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp=
;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRA&nbsp;5791=
8<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellschafter:&nbsp;Arnold&nbsp=
;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252=
;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nc=
hen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;HRB&nbsp;54477<br />Ges=
ch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Michael&nbsp;Neuh&#228;user;&nbsp;Ste=
phan&nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger;&nbsp;Markus&nbsp;Zeiler<br /=
></td></tr><tr style=3D"font-size:14.67px;color:#000001;"><td align=3D"left=
" style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif;"><br />=
&#8203;<br /></td></tr></table></td></tr></table></td></tr></table></div></=
body></html>
------_=_NextPart_b1bf642b-cd92-41d4-a8f8-b0671fd2dd96--

------_=_NextPart_313b0d56-f036-4260-b952-78f6725fe65e
Content-Type: image/png;
	name="image192961.png"
Content-Transfer-Encoding: base64
Content-ID: <image192961.png@63A81450.56CE4B61>
Content-Description: image192961.png
Content-Disposition: inline;
	creation-date="Fri, 18 Feb 2022 08:20:50 +0000";
	filename=image192961.png;
	modification-date="Fri, 18 Feb 2022 08:20:50 +0000";
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

------_=_NextPart_313b0d56-f036-4260-b952-78f6725fe65e
Content-Type: image/png;
	name="image111259.png"
Content-Transfer-Encoding: base64
Content-ID: <image111259.png@1A600697.DB94B1B0>
Content-Description: image111259.png
Content-Disposition: inline;
	creation-date="Fri, 18 Feb 2022 08:20:50 +0000";
	filename=image111259.png;
	modification-date="Fri, 18 Feb 2022 08:20:50 +0000";
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

------_=_NextPart_313b0d56-f036-4260-b952-78f6725fe65e--

