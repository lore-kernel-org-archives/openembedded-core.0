Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A988C001DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 06:09:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.122])
 by mx.groups.io with SMTP id smtpd.web11.1484.1689919770043138078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 23:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=F3SM/R3F;
 spf=pass (domain: arri.de, ip: 40.107.7.122, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVqLjT0/Jhlb6hCCRRZlcfNAYO7HHS8DTKkjm/u+10abV0TcrqY8JQp4bN4VIH9Y96S9WJaphSwJDlwvVRpiNaJm4SVV2g6HJtRoihm615uE2lPuMiZ2145PE7/nj2PSXBtg/cnmDmqhcgCH8beieiXWGvFlJLunG5O1rmCHDP+pfTjT6t02FIL/6caLRh6GtzYCsCfMbwe0+aR/TcEVhFNJqoz6z5hkgCzCNCXftng4v8xTrxxSYQ9ZlXbfNYu46h6tUxsvBjNeP6AVFNQNkcNHL4wAzaC4jgjPAv/xOZKvluuIPjceUZkeYNZRfj/7KUU3HXNpIZiSTU69goJeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p52XutXwmsv791CH0itnFtIJbffZj+UnPjoBDfapZAs=;
 b=HRsfqctthnjK/HD8Xyaoq61M57b6Q28UOK4M6mwLFYoTGtwSG9QrioYEjYm35he6ivhyBOxCVidI6DsqviteqTwtMOwcnpMWKNdga2K4q3dmOLn4RbjhTaINZwaF+vhcNUGTb3v7Ml5U+9PPFiCzx5bsfBzXnnj/eVt89D5HV497jMlG9L/o7rhamK9rcqBebKPyXG6z+1Hs7lMBKFYPxvowuIUAfK8dOpJ+Bw0asNIJWCucHUpb5QCR9r2RfTv41l8JkzbZYbAG1pT2c2G2U+AHsCrtYb6qri+IUzz/CxLB/0zfJyw0Eb7goLu4ZPm/x15adyFWb3fn8jzA76XcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=arri.de; dmarc=bestguesspass action=none header.from=arri.de;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p52XutXwmsv791CH0itnFtIJbffZj+UnPjoBDfapZAs=;
 b=F3SM/R3FiQO82e4iTrwJkxLZBKFUIP2ko3wagyfJQ98sRCZzNaxvfTFNUPrlX0yMLTK4xd/2J9gBaJP/TkwsrQA6PIFSZe3OyprTBgKS3BMMjJEXkRko4+ZKee+dd6tP462g8NY9ERZXAgwbndkDv0M6JkkoYowOBVdotPsUG0I=
Received: from AS9PR06CA0407.eurprd06.prod.outlook.com (2603:10a6:20b:461::14)
 by DB9PR07MB9127.eurprd07.prod.outlook.com (2603:10a6:10:3d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 06:09:26 +0000
Received: from AM0EUR02FT024.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::44) by AS9PR06CA0407.outlook.office365.com
 (2603:10a6:20b:461::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 06:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 104.40.229.156)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=arri.de;
Received-SPF: Pass (protection.outlook.com: domain of arri.de designates
 104.40.229.156 as permitted sender) receiver=protection.outlook.com;
 client-ip=104.40.229.156; helo=eu1.smtp.exclaimer.net; pr=C
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 AM0EUR02FT024.mail.protection.outlook.com (10.13.54.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 06:09:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Fri, 21 Jul 2023 06:09:25 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 6295410
X-ExclaimerImprintLatency: 3429980
X-ExclaimerImprintAction: 89785d912a56427cae231843a541bbb5
Content-Type: multipart/related;
	boundary="----_=_NextPart_582e91c5-649f-4705-97de-c8186a2ece6f"
Received: from AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26)
 by DB9PR07MB9784.eurprd07.prod.outlook.com (2603:10a6:10:4ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 06:09:24 +0000
Received: from VI1EUR02FT032.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:218:cafe::cc) by AM8P189CA0021.outlook.office365.com
 (2603:10a6:20b:218::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28 via Frontend
 Transport; Fri, 21 Jul 2023 06:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VI1EUR02FT032.mail.protection.outlook.com (10.13.61.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6609.28 via Frontend Transport; Fri, 21 Jul 2023 06:09:23 +0000
Received: from n95hx1g2.localnet (192.168.54.11) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 21 Jul
 2023 08:09:23 +0200
From: Christian Eggers <ceggers@arri.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: <throos@amazon.de>
Subject: Re: [OE-core] kirkstone boost upgrade?
Date: Fri, 21 Jul 2023 08:09:22 +0200
Message-ID: <5704323.DvuYhMxLoT@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.11]
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: 
	VI1EUR02FT032:EE_|DB9PR07MB9784:EE_|AM0EUR02FT024:EE_|DB9PR07MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: 080a2a14-649a-4ed9-f544-08db89b10920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FIYBGXjs+5KVLpFw2BiZ3XZLgWbWLm45TdFDwpOxqoLkfD8tU2mHmLxLfrryy4e9S99wORMjYSiq6OtCAJg1OkcksU0E40M8sUuHZSBe/lcpsJl5aszuXN1x8BonIfOpAAKXQQInZPJtgVyCRInOPlOWsobSHcJXyzbrqFf9EQwxLD5Brao0HCYIrlTPf7xoT/cq94QviOmJKLnSABaOa9hRbtjRK6awcIIOWxliFvbM91xziLAUQN2wU4r3ilXGrn9y6XmSiMwjvRSMxX+DdiwspTklXOxhTERlDmp9zRV+Wcr3XB7k7zc2XQIJhIWwOWylQkoiA3OGXd8JrGOYSjcvPgtPXhF4lX9axJ8ZXsFsZRign9DkdXoh7h8TaYzkVAzRyfigp+2H+4kqrvthfPerx9bWOHxylXgHO3cA7Ub5U9XpHUdlDgslhBP2I+RLFeDYj7OZbb7b/nmPSBf3Fx/oY+MYG7teEk3OK42ec8488uCHBYP8Ls23DoVscH/jn3XWNEMLDiE21wHa+ZUc2xck+K/hILTueSu2vVKspWMhBfxS1FpRRHb11VE5/ZMo8r9yjciIFX8dEQLps5wuFvnzvXoLe8WeBnrUFMU3BQBmaj4GbvWiSSrFdKQn62jrGO8Wr35Nl5ofRP3UGd6s2ykL0nHLSLdrWihl4CJKepDcOdiU2RCjFr8BgDcvUkobSZqAu3ItiQREd63GdFZPjq4BAX4fIb5L2p0EtALEhhNvuvJIBP6cNEpH7Es/oZsC5vVgVIXthSv+fDMLlZDskXsWLcutErPVSyJwK0WIsNM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(82310400008)(451199021)(36840700001)(46966006)(8936002)(8676002)(9576002)(36860700001)(4744005)(41300700001)(426003)(82740400003)(83380400001)(33716001)(47076005)(5660300002)(316002)(6916009)(81166007)(16526019)(356005)(2906002)(70586007)(70206006)(4326008)(40480700001)(336012)(186003)(86362001)(478600001)(26005)(36916002)(9686003)(36900700001);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9784
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM0EUR02FT024.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fac0078b-dc46-4fab-7da4-08db89b107d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9p/Me/jhyoGpj+M9CRU8ku/MniqOYfqr5+qieFIMRAnKUcpABT799pozlV8B+npGBHaM/q1NB/TJRKkuX/OIcLa+sCAW+Hf9Td2Ca4zvshX5SjTj00grkmrUDeZiLe5Q2XtxPY1FRmzWlPvCmIss3htDY5Qal9MKAUMQvH2Dw9OwK8kXk2vm9YthrQdLXs/kaeKVwPzEbdZyQaopF8uN6vF4Hx4+v9lsNZ3O7l1VR389Gs1fOJTrhKrMzWy7ER3VIdYFB4z4/wu2djNy1WKXqE9USHErEozJHQRKqL7nYwJa9+KQiRBD1ny+zMUu0spuTwEzY04r6MMhNeqyv80IKPDZk73j4iRHzlhvapcnTZK9f2on7idKqX9FmhEWsuxwXU1BCX7YeR4YM/UZBbQ9O4DEwrhO31QkMh7azO06ov8SDoVjMvO5HtEWlUNJoN86alOe8QWrJG3paushs9VUdw4H+NYQjhTSYtPbjoLiFQBGjwC6CS+CtePMHjAZwoiYc10+tnzC5yjG52JNi45zi8uiWi1fycbegvnhevd+qA8fN+V5Jdew0egQUnnAroN6nKFyQrhujwR6JZ5DZc1GI7pj6YV+WImstXrr5wWfHb0W+7r/wwYzUpiyXEVw/O9OnG0nkbgoU2DhdQjoKS4DXoYlJdT+9cazsb+bxFmGMyKwqLhjstsLyU+eLHaQ1zqSlM488g/c7LcSdnZ98ngOSOodLYHKzusvScEvmJ1yVktvK4ZvkxpjfHdkK7aLmmRBAR4b8t96cvJOuYdYyygiTaGHJQEv7ZdTnuPAs7upRnbaMl7BjU5HkwccpwH6ATMyGziPSGaUDy+Z3upZT5ER/IJXpBgYyTtroE65iGiBFP4=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(7200799014)(1690799014)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(8400799014)(478600001)(33964004)(45080400002)(9686003)(82740400003)(36916002)(16526019)(316002)(336012)(2906002)(26005)(33716001)(5660300002)(8676002)(41300700001)(70206006)(6916009)(70586007)(8936002)(9576002)(7636003)(7596003)(166002)(4326008)(40460700003)(86362001)(40480700001)(426003)(36860700001)(47076005)(83380400001)(66574015)(186003)(15974865002);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 06:09:25.4366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 080a2a14-649a-4ed9-f544-08db89b10920
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM0EUR02FT024.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 06:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184669

This is a multi-part message in MIME format.

------_=_NextPart_582e91c5-649f-4705-97de-c8186a2ece6f
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_3427008f-f0ce-471b-99f2-22c7591cb6da"

------_=_NextPart_3427008f-f0ce-471b-99f2-22c7591cb6da
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Thomas,

On Friday, 21 July 2023, 06:49:24 CEST, Thomas Roos via lists.openembedded.=
org wrote:
> Hi,
> we are hitting an issue with boost version 1.78 and like to ask if and ho=
w there is a boost upgrade on kirkstone branch?

I've a similar situation and decided to update boost by copying the current=
 recipes from
oe-core master branch into my project's local layer (which works fine for m=
e). 

I would appreciate having a newer version in kirkstone, but this may be aga=
inst the
policy of the LTS branch.

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

------_=_NextPart_3427008f-f0ce-471b-99f2-22c7591cb6da
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8" /></head><body><div>Hi Thomas,<br /><br />On Friday, 21 July 2023=
, 06:49:24 CEST, Thomas Roos via lists.openembedded.org wrote:<br />&gt; Hi=
,<br />&gt; we are hitting an issue with boost version 1.78 and like to ask=
 if and how there is a boost upgrade on kirkstone branch?<br /><br />I&#39;=
ve a similar situation and decided to update boost by copying the current r=
ecipes from<br />oe-core master branch into my project&#39;s local layer (w=
hich works fine for me). <br /><br />I would appreciate having a newer vers=
ion in kirkstone, but this may be against the<br />policy of the LTS branch=
=2E<br /><br />regards<br />Christian<br /><br /><br /><br /></div><div dir=
=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-adjust:100=
%;font-size:1px;direction:ltr;"><table cellpadding=3D"0" cellspacing=3D"0" =
border=3D"0" style=3D"width:100%;font-size:1px;"><tr style=3D"font-size:0;"=
><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=3D"0" =
cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"font-siz=
e:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><table cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size=
:0;"><tr style=3D"font-size:14.67px;color:#7F7F7F;font-style:normal;font-we=
ight:400;white-space:nowrap;"><td align=3D"left" style=3D"vertical-align:to=
p;font-family:Calibri,Arial,sans-serif;">__________________________________=
_____________________<span style=3D"font-family:remialcxesans;font-size:1px=
;color:#FFFFFF;line-height:1px;">&#8203;</span></td></tr><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#7F7=
F7F;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"fon=
t-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family=
:Calibri,Arial,sans-serif;">Christian</td><td align=3D"left" style=3D"verti=
cal-align:top;color:#000001;font-family:Calibri,Arial,sans-serif;">&nbsp;<b=
r /></td><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri=
,Arial,sans-serif;">Eggers</td></tr></table></td></tr><tr style=3D"font-siz=
e:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellpadding=
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
lor:#1532B9;">www.arri.com&nbsp;<br /><br /></a></span></td></tr><tr style=
=3D"font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table c=
ellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:=
#858080;font-style:normal;font-weight:400;line-height:normal;white-space:no=
wrap;"><tr style=3D"font-size:14.67px;"><td align=3D"left" style=3D"padding=
:0;vertical-align:top;font-size:0;"><img src=3D"cid:image413716.png@8E44D64=
A.54E85AD9" width=3D"20" border=3D"0" alt=3D"" style=3D"width:20px;min-widt=
h:20px;max-width:20px;font-size:0;" /></td><td align=3D"left" style=3D"padd=
ing:0;vertical-align:top;font-family:Calibri,Arial,sans-serif;"><a href=3D"=
tel:+49%208036%203009-3118" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#858080;">+49&nbsp;8036&nbsp;3009-3118</a></td></=
tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:0;vertica=
l-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical-align:top=
;"></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding=
:0;vertical-align:top;"></td><td align=3D"left" style=3D"padding:0;vertical=
-align:top;"></td></tr><tr style=3D"font-size:14.67px;"><td align=3D"left" =
style=3D"padding:0;vertical-align:top;font-size:0;"><img src=3D"cid:image61=
5660.png@0E39280C.734CAE81" width=3D"20" border=3D"0" alt=3D"" style=3D"wid=
th:20px;min-width:20px;max-width:20px;font-size:0;" /></td><td align=3D"lef=
t" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,sans-ser=
if;"><a href=3D"mailto:CEggers@arri.de" target=3D"_blank" id=3D"LPlnk689713=
" style=3D"text-decoration:none;color:#858080;">CEggers@arri.de</a></td></t=
r></table></td></tr></table></td></tr></table></td></tr><tr style=3D"font-s=
ize:14.67px;color:#000001;font-style:normal;font-weight:400;white-space:now=
rap;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Ar=
ial,sans-serif;"><br />&#8203;</td></tr></table></td></tr><tr style=3D"font=
-size:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;vertical=
-align:top;"><a href=3D"https://www.arri.com/en/camera-systems/cameras/ccm-=
1" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;"><im=
g src=3D"https://assets.arri.com/media/sign/20230524_CCM-1_E-mail_Signature=
_650x95_2x_V7_B.jpg" width=3D"650" height=3D"95" border=3D"0" title=3D"CCM1=
 Camera Control Monitor" alt=3D"CCM1 Camera Control Monitor" style=3D"width=
:650px;min-width:650px;max-width:650px;height:95px;min-height:95px;max-heig=
ht:95px;font-size:12px;" /></a></td></tr><tr style=3D"font-size:13px;color:=
#7F7F7F;font-style:normal;font-weight:400;white-space:nowrap;"><td align=
=3D"left" style=3D"padding:0;vertical-align:top;font-family:Calibri,Arial,s=
ans-serif;">Get&nbsp;all&nbsp;the&nbsp;latest&nbsp;information&nbsp;from&nb=
sp;<span style=3D"text-decoration:underline;"><a href=3D"https://www.arri.c=
om/" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:underlin=
e;color:#7F7F7F;">www.arri.com</a></span>,&nbsp;<span style=3D"text-decorat=
ion:underline;"><a href=3D"https://www.facebook.com/TeamARRI" target=3D"_bl=
ank" id=3D"LPlnk689713" style=3D"text-decoration:underline;color:#7F7F7F;">=
Facebook</a></span>,&nbsp;<span style=3D"text-decoration:underline;"><a hre=
f=3D"https://twitter.com/ARRIChannel" target=3D"_blank" id=3D"LPlnk689713" =
style=3D"text-decoration:none;color:#7F7F7F;">Twitter</a></span>,&nbsp;<a h=
ref=3D"https://www.instagram.com/arri/" target=3D"_blank" id=3D"LPlnk689713=
" style=3D"text-decoration:none;color:#7F7F7F;"><span style=3D"text-decorat=
ion:underline;">Instagram</span></a>,&nbsp;<a href=3D"https://www.linkedin.=
com/company/arri" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decora=
tion:none;color:#7F7F7F;"><span style=3D"text-decoration:underline;">Linked=
In</span></a>&nbsp;and&nbsp;<a href=3D"https://www.youtube.com/user/ARRICha=
nnel" target=3D"_blank" id=3D"LPlnk689713" style=3D"text-decoration:none;co=
lor:#7F7F7F;"><span style=3D"text-decoration:underline;">YouTube</span></a>=
=2E<br /></td></tr><tr style=3D"font-size:0;"><td align=3D"left" style=3D"p=
adding:0;vertical-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" bo=
rder=3D"0" style=3D"font-size:0;color:#6A6A6A;font-style:normal;font-weight=
:400;white-space:nowrap;"><tr style=3D"font-size:10px;"><td align=3D"left" =
style=3D"vertical-align:top;font-family:Arial;"><br />Arnold&nbsp;&amp;&nbs=
p;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH&nbsp;&amp;&nbsp;Co.&nbsp;Betrieb=
s&nbsp;KG<br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:=
&nbsp;Amtsgericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternumm=
er:&nbsp;HRA&nbsp;57918<br />Pers&#246;nlich&nbsp;haftender&nbsp;Gesellscha=
fter:&nbsp;Arnold&nbsp;&amp;&nbsp;Richter&nbsp;Cine&nbsp;Technik&nbsp;GmbH<=
br />Sitz:&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Registergericht:&nbsp;Amts=
gericht&nbsp;M&#252;nchen&nbsp;=E2=80=91&nbsp;Handelsregisternummer:&nbsp;H=
RB&nbsp;54477<br />Gesch&#228;ftsf&#252;hrer:&nbsp;Dr.&nbsp;Matthias&nbsp;E=
rb&nbsp;(Chairman);&nbsp;Lars&nbsp;Weyer;&nbsp;Stephan&nbsp;Schenk;&nbsp;Wa=
lter&nbsp;Trauninger<br /></td></tr><tr style=3D"font-size:14.67px;color:#0=
00001;"><td align=3D"left" style=3D"vertical-align:top;font-family:Calibri,=
Arial,sans-serif;"><br />&#8203;<br /></td></tr></table></td></tr></table><=
/td></tr></table></div></body></html>
------_=_NextPart_3427008f-f0ce-471b-99f2-22c7591cb6da--

------_=_NextPart_582e91c5-649f-4705-97de-c8186a2ece6f
Content-Type: image/png;
	name="image413716.png"
Content-Transfer-Encoding: base64
Content-ID: <image413716.png@8E44D64A.54E85AD9>
Content-Description: image413716.png
Content-Disposition: inline;
	creation-date="Fri, 21 Jul 2023 06:09:25 +0000";
	filename=image413716.png;
	modification-date="Fri, 21 Jul 2023 06:09:25 +0000";
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

------_=_NextPart_582e91c5-649f-4705-97de-c8186a2ece6f
Content-Type: image/png;
	name="image615660.png"
Content-Transfer-Encoding: base64
Content-ID: <image615660.png@0E39280C.734CAE81>
Content-Description: image615660.png
Content-Disposition: inline;
	creation-date="Fri, 21 Jul 2023 06:09:25 +0000";
	filename=image615660.png;
	modification-date="Fri, 21 Jul 2023 06:09:25 +0000";
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

------_=_NextPart_582e91c5-649f-4705-97de-c8186a2ece6f--

