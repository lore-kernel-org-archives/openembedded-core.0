Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65644EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 06:30:08 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.114])
 by mx.groups.io with SMTP id smtpd.web11.1674.1689921004722533346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 23:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=0MbF2UTz;
 spf=pass (domain: arri.de, ip: 40.107.6.114, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp7IBr7QrcHPxfuTEMqogAsfu+dqUk7zC5LlvIam4RO96HKcHPWMIHAX9VNwMSp9tI6t/qGhX6j4iIEZ6e8pE0WeKPGZViLVYKPMvqn719tpM+VSvo1IWZ05QyvdebVuHprSti+67998zBLfyBjoL2tuntfH8RdaleaR4s8UJxyeBiHE4ehR8k7uFKOHs0QTtIEtzJ6VwAYIfVObLdAUVi/d7FK1AyNg6VZlIGMwSN2UWGX0Fp6ad7hTCwYm9l0QJjn+1FmKAFV1bDrVhpdqnYHI+dW1nTcLP+QLVpva2XdDGYD1CeAlYAFcd37K2tpo8qLPNN9Q5a3b1EHokTMfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFEoMjqJt4dFuWps47UP6OfVnCeHby/K5NaVot3tHS0=;
 b=D9d5is0xG/Qj/yOre590Guo+iqUQ6tKygctbzYmOtxAAjOO2bH1i5QoNcQaKl4RgK0MZusXx4hwxPt9igP3iaRUf28YY0yRUR2TN7TAIUXtcT1egRe3OnNlcAJAfTm3n9RusIOA5KPB4UNspy3fYbc2MyYUdffJy69L49zckbFAn8ISt5937D7K6hUlq2K8nP0ruYaBTnRD1CzlKK0yTws+eUqxpjabDLEsPd8PD9+2Qaxvhd+RvhVx7r/On5wONHGpeQ16VwGwpTnVnThQTTSeTDSYOxSlsSO6tV1v2e63/lsQcP4tTw/fdDYcymRQL2CZbvVf1mubWpdVP42QubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arri.de; dmarc=bestguesspass action=none header.from=arri.de;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFEoMjqJt4dFuWps47UP6OfVnCeHby/K5NaVot3tHS0=;
 b=0MbF2UTzACH7LA1jqPnpWTgnkFjcszsOFXMRkyu362+9KXUptSG1ISduf1HwolTvbXVeM6P/Y26tbVKvOOJv/YU19y6j7cd733x/NTagQcqsQQFU1dhT6P1nuPr2JNaBCFfDGKvCYO+VD7O703fzrWdPCYPIDjGgDS2qNSud7qY=
Received: from DU2PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:10:232::10)
 by AM7PR07MB6753.eurprd07.prod.outlook.com (2603:10a6:20b:1b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 06:30:01 +0000
Received: from DB5EUR02FT022.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::8a) by DU2PR04CA0065.outlook.office365.com
 (2603:10a6:10:232::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 06:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.40.229.156)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 104.40.229.156 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.40.229.156; helo=eu1.smtp.exclaimer.net; pr=C
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB5EUR02FT022.mail.protection.outlook.com (10.13.58.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 06:30:00 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (104.47.11.239)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Fri, 21 Jul 2023 06:30:00 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 8826033
X-ExclaimerImprintLatency: 3666911
X-ExclaimerImprintAction: b0e332d170ba4001b375d57fe347eeaa
Content-Type: multipart/related;
	boundary="----_=_NextPart_a5dbf2df-f8db-41e5-a605-c49ad47b2c3f"
Received: from AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) by PR3PR07MB6873.eurprd07.prod.outlook.com
 (2603:10a6:102:76::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 06:29:58 +0000
Received: from AM0EUR02FT027.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::91) by AS9PR0301CA0001.outlook.office365.com
 (2603:10a6:20b:468::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 06:29:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM0EUR02FT027.mail.protection.outlook.com (10.13.54.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.16 via Frontend Transport; Fri, 21 Jul 2023 06:29:57 +0000
Received: from n95hx1g2.localnet (192.168.54.11) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Jul
 2023 08:29:57 +0200
From: Christian Eggers <ceggers@arri.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: <throos@amazon.de>
Subject: Re: [OE-core] kirkstone boost upgrade?
Date: Fri, 21 Jul 2023 08:29:57 +0200
Message-ID: <2161652.irdbgypaU6@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.11]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	AM0EUR02FT027:EE_|PR3PR07MB6873:EE_|DB5EUR02FT022:EE_|AM7PR07MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 3908a71d-74cd-4da4-81c3-08db89b3e934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HGHJJYTx1msx47pNScTNn33tpEXFMhKGYKbPdN4Etg8383UtnED+3EoWt8XsKL7cjTk+63Qi0RfMgzy6SYOGoFvvKe2jpyujLCATqxk/KLMxagfz25BUTM79paHZ8xuFxUzEJL+ADCKnDduJVaLV0t8YoZi+i0r/mY0anWRRmbWfOrJvAw8RgObXOQK3xcfwdWEUZcJbBxI68du2INty8dURLpfcfhsP+EVexzou4fRLaf48m+vZ2pOkZdUj/RVq1iyb8nzIAsRiLfpQBckpc5bd7bt/SHwhk8selny1lGCIr+uLPc8vjxvkag6zXBdjBpcPMievz7/7uIntlXq1tMWUbCljQhjZayfKZpx919naumeThlkOibfQLcB8vFkAQ3eTUIAx0FzwBhdHhPDh83ONTCnYYieBhKvoTwAOJJ6ne76rpCJN2ZoP1b1a1jYEe9LrSkf1/Z7g1TWhuvIqdv3YCjxa/IH72oMSdJjy+mrQWFs9lZfb0IseX984FfWKFMSlvVFcX88T2EnLtfuy4Q3wIUS4SLYZZG3h62ZuTa7v/3IjJhXKf0x8K+yjrk5E6vr4OTXnBV2N2/iprNueDQZZeahi19ajrEFG84SNO36k5suqpcWVmKdYbwzAnRuDoowPoYGTF2YfmA78lcabnkisb2qy+cfgehaFLOHtd+xC4K7QOnB7DPkCFY9p5mhe+5BCP9ETYiNNPhhn80yu2C5+RoTvetuQlnMAk9ePECQ/CVziP2KaYD+lU+cdwXNkd8jSAt9Taf448djkyu+0qvL9jjGV3oM10NSfH3Db/wYQoykkIXhG83TCIWcVCjAV
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(82310400008)(36840700001)(46966006)(316002)(426003)(4326008)(47076005)(36860700001)(6916009)(33716001)(82740400003)(86362001)(4744005)(2906002)(356005)(9576002)(81166007)(5660300002)(8676002)(8936002)(966005)(36916002)(9686003)(83380400001)(41300700001)(26005)(40480700001)(478600001)(70586007)(186003)(336012)(16526019)(70206006)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6873
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR02FT022.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e7b51f97-70ce-482f-c830-08db89b3e788
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4oTJrfaSkHZPgh25m8VRZO5rd/K8gN4Vw0/g05vnsqy2VX/YSSQ3a/tedBXnmisgV+KRB6PLMSj3QHIVyv8DVlDAASZjOI8H/Son5oJI4iN/6AUf5IxhjBQGaEvV6kjTKSVZcEnqtOPTc+q88CQuliqpTQkwcLNQkORa6Uq2cgbfR1XA8qWXo+VeyPbZMFarvSORWZoPeendtlvoov8l3PatCKkuj3bZmfJPM+ukiC2EgWWbVOzKkyILnswL9ktF0mEI+71ijXM8dSsF7BvosXfa1Q8aECF+m6euCMvAShjfAtLViEU0pryYqVDh//goeSDk1Z2XB/wrIF7nbWAEYNieico3DKI3Q/08zyvI9agJelsn+gHAssvRGoTjYSOtraFJp5Qx6SwOywRSCem16jR0Z/e9TGTYv1LuXbmO881EOSSPgrDNbIsDVdKGTGmCy+tzt67phQSDA6Lv3a3KSJhxM/PpDWWFYy49u3EGH5RH12CInulUScp2hnpwrVaHwU5/wda0/XTkNSyu+R3k4eTs5TNxLgYL/oUoTAhVnVo/dz+s5sDwjuzBOpvMpYjwQJwrByqeN+w46tIueDKQW5QSG/4YZRB6gNvBYAeL6Vc4pckPQEOgrD5NuKFffxA4/f2DVwrhHFJWhiRFnMFePisvi98qVbhfid86DHM1a5vFmBKE8Eco7jzvevRbVNAoiA7QuDooYjk9fx73a3+EvjnvqjjAV+RnzuwN1Gur3b3SruzBfH8wY/be2ewtIKHLf1vVl4ecNXVUnZ9XQiFefUBg7ZopZHXWUdSMKCMJ89g1cvmXcRFgatWR4zCvDeQhGh7T6nu4NxPgnypx73Pxtg==
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39850400004)(136003)(7200799014)(1690799014)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(478600001)(45080400002)(33964004)(36916002)(966005)(9686003)(8400799014)(47076005)(26005)(186003)(336012)(316002)(4326008)(6916009)(16526019)(83380400001)(70586007)(70206006)(36860700001)(66574015)(426003)(15974865002)(40480700001)(86362001)(8936002)(166002)(8676002)(2906002)(41300700001)(5660300002)(7636003)(7596003)(40460700003)(82740400003)(33716001)(9576002)(39026012);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:30:00.3053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3908a71d-74cd-4da4-81c3-08db89b3e934
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR02FT022.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 06:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184670

This is a multi-part message in MIME format.

------_=_NextPart_a5dbf2df-f8db-41e5-a605-c49ad47b2c3f
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_9fd90cb2-c189-4603-b868-241e221a85d1"

------_=_NextPart_9fd90cb2-c189-4603-b868-241e221a85d1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

On Friday, 21 July 2023, 06:49:24 CEST, Thomas Roos via lists.openembedded.=
org wrote:
> Hi,
> we are hitting an issue with boost version 1.78 and like to ask if and ho=
w there is a boost upgrade on kirkstone branch?

Another option:

Yesterday there were two posts on the docs@yoctoproject.org list about "mix=
in" layers [1][2].
There is already an own repository for this [3].

So the best option seems to be creating a branch like "kirkstone/boost" (fo=
r latest boost
release) or "kirkstone/boost-1.82" (for a specific boost release).

It looks like patches for the meta-lts-mixin layer should be posted to [4].=
 Searching for
"mixin" on the web interface shows some example messages. If you could put =
me on CC, I am
happy to test your patches.

regards
Christian


[1] https://lists.yoctoproject.org/g/docs/message/4073
[2] https://lists.yoctoproject.org/g/docs/message/4074
[3] https://git.yoctoproject.org/meta-lts-mixins/
[4] https://lists.yoctoproject.org/g/yocto/topics




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
ram, LinkedIn and YouTube.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Lars Weyer; Stephan=
 Schenk; Walter Trauninger

=E2=80=8B

------_=_NextPart_9fd90cb2-c189-4603-b868-241e221a85d1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>On Friday, 21 July 2023, 06:49:24 CEST, Thoma=
s Roos via lists.openembedded.org wrote:<br />&gt; Hi,<br />&gt; we are hit=
ting an issue with boost version 1.78 and like to ask if and how there is a=
 boost upgrade on kirkstone branch?<br /><br />Another option:<br /><br />Y=
esterday there were two posts on the docs@yoctoproject.org list about &quot=
;mixin&quot; layers [1][2].<br />There is already an own repository for thi=
s [3].<br /><br />So the best option seems to be creating a branch like &qu=
ot;kirkstone/boost&quot; (for latest boost<br />release) or &quot;kirkstone=
/boost-1.82&quot; (for a specific boost release).<br /><br />It looks like =
patches for the meta-lts-mixin layer should be posted to [4]. Searching for=
<br />&quot;mixin&quot; on the web interface shows some example messages. I=
f you could put me on CC, I am<br />happy to test your patches.<br /><br />=
regards<br />Christian<br /><br /><br />[1] https://lists.yoctoproject.org/=
g/docs/message/4073<br />[2] https://lists.yoctoproject.org/g/docs/message/=
4074<br />[3] https://git.yoctoproject.org/meta-lts-mixins/<br />[4] https:=
//lists.yoctoproject.org/g/yocto/topics<br /><br /><br /><br /></div><div d=
ir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:1=
00%;font-size:1px;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"width:100%;font-size:1px;"><tr style=3D"font-size:0=
;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-s=
ize:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-si=
ze:0;"><tr style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-=
weight:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Calibri,Arial,sans-serif;">________________________________=
_______________________<span style=3D"font-family:remialcxesans;font-size:1=
px;color:#FFFFFF;line-height:1px;">&#8203;</span></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:=
#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Calibri,Arial,sans-serif;">Christian</td><td align=3D"left" style=
=3D"vertical-align:top;color:#000001;font-family:Calibri,Arial,sans-serif;"=
>&nbsp;<br /></td><td align=3D"left" style=3D"vertical-align:top;font-famil=
y:Calibri,Arial,sans-serif;">Eggers</td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:=
#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=
=3D"font-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Calibri,Arial,sans-serif;">Software&nbsp;Engineer</td></tr><tr styl=
e=3D"font-size:14.67px;color:#000001;"><td align=3D"left" style=3D"vertical=
-align:top;font-family:Calibri,Arial,sans-serif;">&#8203;</td></tr></table>=
</td></tr></table></td></tr><tr style=3D"font-size:0;"><td align=3D"left" s=
tyle=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"font-size:0;"><tr style=3D"font-size:0;"><td align=3D"le=
ft" style=3D"vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0=
" border=3D"0" style=3D"font-size:0;color:#0E50AD;font-style:normal;font-we=
ight:400;white-space:nowrap;"><tr style=3D"font-size:13.33px;"><td align=
=3D"left" style=3D"vertical-align:top;font-family:&#39;Arial Black&#39;;">A=
RRI</td></tr><tr style=3D"font-size:10.67px;color:#7F7F7F;"><td align=3D"le=
ft" style=3D"vertical-align:top;font-family:Arial;"><span style=3D"font-siz=
e:11px;">Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nb=
sp;&amp;&nbsp;Co.&nbsp;Betriebs&nbsp;KG</span>&nbsp;<br /></td></tr></table=
></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-=
align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0;color:#7F7F7F;font-style:normal;font-weight:400;white-space=
:nowrap;"><tr style=3D"font-size:10.67px;"><td align=3D"left" style=3D"vert=
ical-align:top;font-family:Arial;">Arriweg&nbsp;17</td><td align=3D"left" s=
tyle=3D"vertical-align:top;font-family:Arial;">,&nbsp;<br /></td><td align=
=3D"left" style=3D"vertical-align:middle;font-family:Arial;">83071</td><td =
align=3D"left" style=3D"vertical-align:middle;font-family:Arial;">&nbsp;<br=
 /></td><td align=3D"left" style=3D"vertical-align:middle;font-family:Arial=
;">Stephanskirchen</td></tr></table></td></tr></table></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr =
style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#1532B9;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:11px;"><td align=3D"left" style=3D"vertical-align:top;font-=
family:Arial;"><span style=3D"text-decoration:underline;"><a href=3D"http:/=
/www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decorati=
on:underline;color:#1532B9;">www.arri.com&nbsp;<br /><br /></a></span></td>=
</tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:=
top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font=
-size:0;color:#858080;font-style:normal;font-weight:400;line-height:normal;=
white-space:nowrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" st=
yle=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image9197=
97.png@FB397B9C.47B050D1" width=3D"20" border=3D"0" alt=3D"" style=3D"width=
:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"left"=
 style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-serif=
;"><a href=3D"tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk6897=
13" style=3D"text-decoration:none;color:#858080;">+49&nbsp;8036&nbsp;3009-3=
118</a></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"pad=
ding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vert=
ical-align:top;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" st=
yle=3D"padding:0;vertical-align:top;"></td><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td a=
lign=3D"left" style=3D"padding:0;vertical-align:top;font-size:0;"><img src=
=3D"cid:image758798.png@4FC322E5.A34DE9BF" width=3D"20" border=3D"0" alt=
=3D"" style=3D"width:20px;min-width:20px;max-width:20px;font-size:0;" /></t=
d><td align=3D"left" style=3D"padding:0;vertical-align:top;font-family:Cali=
bri,Arial,sans-serif;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank"=
 id=3D"LPlnk689713" style=3D"text-decoration:none;color:#858080;">CEggers@a=
rri.de</a></td></tr></table></td></tr></table></td></tr></table></td></tr><=
tr style=3D"font-size:14.67px;color:#000001;font-style:normal;font-weight:4=
00;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:top;font=
-family:Calibri,Arial,sans-serif;"><br />&#8203;</td></tr></table></td></tr=
><tr style=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"=
padding:0;vertical-align:top;"><a href=3D"https://www.arri.com/en/camera-sy=
stems/cameras/ccm-1" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-dec=
oration:none;"><img src=3D"https://assets.arri.com/media/sign/20230524_CCM-=
1_E-mail_Signature_650x95_2x_V7_B.jpg" width=3D"650" height=3D"95" border=
=3D"0" title=3D"CCM1 Camera Control Monitor" alt=3D"CCM1 Camera Control Mon=
itor" style=3D"width:650px;min-width:650px;max-width:650px;height:95px;min-=
height:95px;max-height:95px;font-size:12px;" /></a></td></tr><tr style=3D"f=
ont-size:13px;color:#7F7F7F;font-style:normal;font-weight:400;white-space:n=
owrap;"><td align=3D"left" style=3D"padding:0;vertical-align:top;font-famil=
y:Calibri,Arial,sans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;informa=
tion&nbsp;from&nbsp;<span style=3D"text-decoration:underline;"><a href=3D"h=
ttps://www.arri.com/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-de=
coration:underline;color:#7F7F7F;">www.arri.com</a></span>,&nbsp;<span styl=
e=3D"text-decoration:underline;"><a href=3D"https://www.facebook.com/TeamAR=
RI" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underline=
;color:#7F7F7F;">Facebook</a></span>,&nbsp;<span style=3D"text-decoration:u=
nderline;"><a href=3D"https://twitter.com/ARRIChannel" target=3D"_blank" id=
=3D"LPlnk689713" style=3D"text-decoration:none;color:#7F7F7F;">Twitter</a><=
/span>,&nbsp;<a href=3D"https://www.instagram.com/arri/" target=3D"_blank" =
id=3D"LPlnk689713" style=3D"text-decoration:none;color:#7F7F7F;"><span styl=
e=3D"text-decoration:underline;">Instagram</span></a>,&nbsp;<a href=3D"http=
s://www.linkedin.com/company/arri" target=3D"_blank" id=3D"LPlnk689713" sty=
le=3D"text-decoration:none;color:#7F7F7F;"><span style=3D"text-decoration:u=
nderline;">LinkedIn</span></a>&nbsp;and&nbsp;<a href=3D"https://www.youtube=
=2Ecom/user/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" style=3D"text=
-decoration:none;color:#7F7F7F;"><span style=3D"text-decoration:underline;"=
>YouTube</span></a>.<br /></td></tr><tr style=3D"font-size:0;"><td align=
=3D"left" style=3D"padding:0;vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#6A6A6A;font-styl=
e:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:10px;"=
><td align=3D"left" style=3D"vertical-align:top;font-family:Arial;"><br />A=
rnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&n=
bsp;Co.&nbsp;Betriebs&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&n=
bsp;Registergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp=
;Handelsregisternummer:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;hafte=
nder&nbsp;Gesellschafter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbs=
p;Technik&nbsp;GmbH<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Regist=
ergericht:&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsre=
gisternummer:&nbsp;HRB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&=
nbsp;Matthias&nbsp;Erb&nbsp;(Chairman);&nbsp;Lars&nbsp;Weyer;&nbsp;Stephan&=
nbsp;Schenk;&nbsp;Walter&nbsp;Trauninger<br /></td></tr><tr style=3D"font-s=
ize:14.67px;color:#000001;"><td align=3D"left" style=3D"vertical-align:top;=
font-family:Calibri,Arial,sans-serif;"><br />&#8203;<br /></td></tr></table=
></td></tr></table></td></tr></table></div></body></html>
------_=_NextPart_9fd90cb2-c189-4603-b868-241e221a85d1--

------_=_NextPart_a5dbf2df-f8db-41e5-a605-c49ad47b2c3f
Content-Type: image/png;
	name="image919797.png"
Content-Transfer-Encoding: base64
Content-ID: <image919797.png@FB397B9C.47B050D1>
Content-Description: image919797.png
Content-Disposition: inline;
	creation-date="Fri, 21 Jul 2023 06:30:00 +0000";
	filename=image919797.png;
	modification-date="Fri, 21 Jul 2023 06:30:00 +0000";
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

------_=_NextPart_a5dbf2df-f8db-41e5-a605-c49ad47b2c3f
Content-Type: image/png;
	name="image758798.png"
Content-Transfer-Encoding: base64
Content-ID: <image758798.png@4FC322E5.A34DE9BF>
Content-Description: image758798.png
Content-Disposition: inline;
	creation-date="Fri, 21 Jul 2023 06:30:00 +0000";
	filename=image758798.png;
	modification-date="Fri, 21 Jul 2023 06:30:00 +0000";
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

------_=_NextPart_a5dbf2df-f8db-41e5-a605-c49ad47b2c3f--

