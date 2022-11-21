Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C49C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 09:40:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web10.34496.1669023614060690443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 01:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IIV3PvBm;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: anton.antonov@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyAFwSxKkzYOyGzDWzSYSdJaIj/udJoIQClTy7MVyYQ=;
 b=IIV3PvBmLQwg8O9ISglCb/CWkIzzbzQd93Lru9u+8s+mh91j9EMvGT8g1Hf5J7zOSCeewZnxJyDAwVtwiHEx2WkxUX0j14bLaAJ7Of+sSGBeDUBrz75l6D3W+Edb7k+KHIppYS4WMFZeeG3lX0vYOfSsHIAlDju348uje2DwnXc=
Received: from DUZPR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::10) by AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.15; Mon, 21 Nov
 2022 09:40:07 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::e1) by DUZPR01CA0082.outlook.office365.com
 (2603:10a6:10:46a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Mon, 21 Nov 2022 09:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Mon, 21 Nov 2022 09:40:07 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Mon, 21 Nov 2022 09:40:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8d34f25e0b60468
X-CR-MTA-TID: 64aa7808
Received: from f5abc4749281.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8901E5C7-A2DF-476E-A91B-973A61FC3FA2.1;
	Mon, 21 Nov 2022 09:40:00 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5abc4749281.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Nov 2022 09:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBku+US1k8bWHHIC/sucEQXfCFM1JihUrFEgJU7danc1nsedmQTRTg/zlLZ9RvZ9Z2IQWaf7d6fTazhA3O7hxlIM6dY8dpCnOAbsb6OkXowJTAtizgYfPAyUMRFmepaGRSH9HrQWVWl7o61o/t1E5DXM8wnj58iaydIHM7f27cH/fIwZSsl0wVsLUbniTf72OOWGOBewnhCnT+zrOXbaTu+hlqaVXHjiHM+JbALzt4shZlFgxoSFfCe8DRNKvELclWxut1ibWr92bTwYEiU/EOhZ4JKuWo3yGhd5baDD/pklPLAajhGBX2W1zeAm76ypM+gcuA9x/sG7rXEu1iBLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyAFwSxKkzYOyGzDWzSYSdJaIj/udJoIQClTy7MVyYQ=;
 b=kPW3fd5wM+3ibq/jN37GGm7EGtSscqIxexUvCjZOPLMb/f5uk1Uhk41YHaqbsiDAzogb9tOp/zfaxoRkX68hPbmmLhhcoJVVgdj/Sml/yjBSP87EBHM3OJSXLaMf0W07dm5RhlGKmvEWyqUeS/JG3ScjYQyGlevyARrbXG5Delbjio38vZWJ7rRFm6KOkItHqSqJZJoklQ+JszhCxu0Vm04faZVPs6iRAmQkkNNB9gTmS4WkfVrNSvUGIM+N++UZJrz/30qkc22kTlEP+Ktf4UYVwpg/vTkMnuEMTQ13SkcRiRknNTw50unLgdxFDt0LG2hxGfzpMLcZeQeNGzJ0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyAFwSxKkzYOyGzDWzSYSdJaIj/udJoIQClTy7MVyYQ=;
 b=IIV3PvBmLQwg8O9ISglCb/CWkIzzbzQd93Lru9u+8s+mh91j9EMvGT8g1Hf5J7zOSCeewZnxJyDAwVtwiHEx2WkxUX0j14bLaAJ7Of+sSGBeDUBrz75l6D3W+Edb7k+KHIppYS4WMFZeeG3lX0vYOfSsHIAlDju348uje2DwnXc=
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 21 Nov
 2022 09:39:58 +0000
Received: from AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b]) by AM7PR08MB5320.eurprd08.prod.outlook.com
 ([fe80::ba79:f42e:a934:d12b%4]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 09:39:58 +0000
From: Anton Antonov <Anton.Antonov@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Topic: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
Thread-Index: AQHY+1/drvhiEUgbakGXLpqCRSQQZK5E1dnIgAAK/ICAAJzzgIACNoUAgAFt+ZU=
Date: Mon, 21 Nov 2022 09:39:58 +0000
Message-ID: 
 <AM7PR08MB53201ACDF26AD8F277AF6E15FC0A9@AM7PR08MB5320.eurprd08.prod.outlook.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
	 <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
	 <AM7PR08MB53201A46A1080F4AAFA7E318FC099@AM7PR08MB5320.eurprd08.prod.outlook.com>
	 <8b2ecf15502e08644ffbc1c7cbea6d3862da68a1.camel@linuxfoundation.org>
	 <4c2db9a4441a470fb1555b68b6bffb62@axis.com>
 <1d1bbb3fb18bb7b81da38bcafd479ec74dde06e5.camel@linuxfoundation.org>
In-Reply-To: 
 <1d1bbb3fb18bb7b81da38bcafd479ec74dde06e5.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM7PR08MB5320:EE_|AS8PR08MB6182:EE_|DBAEUR03FT010:EE_|AS8PR08MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 3edac49c-1797-40cb-3362-08dacba46003
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X3zuXjPnVh6LVmjv4TEXS9v1CTAEFPFSbJwgkyJ3TlAXazZt45n3y+HOCot+/Q1yUVesx06bYieZamV41EaXMJ1TdgpXAmFMav3zwtpdC/dZvGmw/7BtmzcE50g5SAUdfavP8c3OHGv7MBoX82/ZxdKGQBs1d4yxFv9pMSPqGV01vb+sOcOcY2XdpSbLSJG59nH0tnrOfJmp+J03wQQpNStPrsS+UVvcftfgGmLcjGAQSJdOK8m4XOGtuSuEqeFm1ik5B0CCYt7yM7vjFwt/nuAIs1xtLu7YLeHV9ny5UJ7IoWdOV66/tGtm7GUnDj85bLoC1iKfQtVSNNK5NVyK4NTWgMpdFcSTSRUJbJoBs3UoVNAjkXa+C8S3enrp3M/gnbWagMGm3PamBI4gsKfNSnvy6OAm+76QkcZ/SMK88t/6iVfwbff15MB9IOLLN7HGvIiUnubLBWO2BLKGW9kc7HERSIkvXafJne6D2F9zo/PEPzXnsyn/ouh5Bh/T0CormNzpW9O4vK6/Ej1VlWHxiNOm5vqlfky0c8eNi4Ov77FFndjyTJn7ut9lPWMyj480K3eqYvQUtA2/kSYeM61ZdtD1gZPw3rfxlt0F1mGktk91c7S6izwREQJPVnQ1c9tA90hFZfYViYEvNhAvgz9qSQ5pdMr9ejhrBKmJhCGsEQT51gHQlmFNgGp9o506gvrL7M6DpHlETx8PxWwmc3JMk6Bw3ht1SrCjnAf6tlGg69Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR08MB5320.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(41300700001)(9326002)(8936002)(5660300002)(316002)(66446008)(66946007)(64756008)(66476007)(66556008)(76116006)(8676002)(52536014)(91956017)(71200400001)(478600001)(2906002)(122000001)(53546011)(55236004)(9686003)(6506007)(7696005)(966005)(186003)(110136005)(4001150100001)(26005)(33656002)(38100700002)(38070700005)(166002)(83380400001)(55016003)(86362001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AM7PR08MB53201ACDF26AD8F277AF6E15FC0A9AM7PR08MB5320eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4478341-8d37-44d8-65a6-08dacba45a96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PQ43BNyykxm3CQo0era9qa/p0ymsg1odY8raY39yfeBeGxdb6Xo9D1rN6PHLgHkfyN2OoZjB7brI+L2nm87gl1Ov2PDNQ4D13guNOvcnS2nb//6WSvvj8N3ndxK91jZDx4pw0u7gOs+e8gHMDs78GBtSZ7S6mvsXlQxw21TKlei8aGHyEPm3uAuOadpYzMo9GYcLP0T4147idh8dbRKpIXvyLYfJXjQaKCNkGNQdfXLLGuwDFLQjVAOxjvkyr8VXPHI+w07HNgNiLq+Ras4hjrqT2jzNM9Kj+ZQu/RCOHfijBAz6i2lAknRHgJfB4ABWj4LZDEHQj7j9bJH6y4k+m+H6BTFkyWuVDCb2qTBvI+NQlTTMttcBHCvZHOY//Z84WTJPfe01sB1chSiXEnQwLHflOby5TX1rMuESiUWo148JbINvv/Giro0fvDEgKJmBlGsM6FZB5de0dr2Ifzs4ght7d+jk3pHa3aARKQaBqfAZ8e5oWgVecyLFBFpCu+Tt7VMoopkC29Vex4lhdv7De0M8z9CFez5DvPgAMcWmJEQPM3UjJklA6GVG4ew/yrGBXgmEDZZYejYkusmUFF0lHxv/82NzzqX1YGUJECsw6HtRcrii9Gm25FVtNcOlvAoa6yKo61KtJk07tMVqQuiPBEt0n8jKfCiON/gXwVJc5BTd1hhwt+jwHtt+fCRbNqRrhiT19Gb1dW5ywv8REpJMLWLt2Y6RwcD1RZXwFx/Y2Gc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(40470700004)(46966006)(36840700001)(186003)(336012)(6506007)(47076005)(7696005)(26005)(9686003)(110136005)(53546011)(966005)(2906002)(478600001)(40480700001)(40460700003)(86362001)(166002)(356005)(55016003)(82740400003)(83380400001)(81166007)(33656002)(82310400005)(36860700001)(8936002)(9326002)(4001150100001)(41300700001)(70206006)(52536014)(8676002)(70586007)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 09:40:07.2244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3edac49c-1797-40cb-3362-08dacba46003
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 09:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173647

--_000_AM7PR08MB53201ACDF26AD8F277AF6E15FC0A9AM7PR08MB5320eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

   Are you happy to accept my initial patch as it?

Cheers,
Anton

From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sunday, 20 November 2022 at 11:45
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Anton Antonov <Anton.=
Antonov@arm.com>, openembedded-core@lists.openembedded.org <openembedded-co=
re@lists.openembedded.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default c=
ompiler flags defined in CC crate
On Sat, 2022-11-19 at 01:57 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of Richard
> > Purdie
> > Sent: den 18 november 2022 17:36
> > To: Anton Antonov <Anton.Antonov@arm.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use
> > default compiler flags defined in CC crate
> >
> > On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wrote:
> > >   I=92ve tested your approach. It doesn=92t work for whatever reason.
> > > CRATE_CC_NO_DEFAULTS is empty exported for native recipes:
> > >
> > > $ MACHINE=3Dqemuarm bitbake rust-native -e |grep
> > > CRATE_CC_NO_DEFAULTS
> > > # $CRATE_CC_NO_DEFAULTS [3 operations]
> > > #     [export] "${'1' if d.getVar('CRATE_CC_NO_DEFAULTS') =3D=3D
> > > 'true' else '0'}"
> > > export CRATE_CC_NO_DEFAULTS=3D""
> > > # $CRATE_CC_NO_DEFAULTS:class-native
> > > CRATE_CC_NO_DEFAULTS:class-native=3D""
> > >
> > >
> > >   I also tried:
> > > CRATE_CC_NO_DEFAULTS[export] =3D
> > > "${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0', '1',
> > > d)}"
> > > with the same result =96 empty export.
> >
> > I think it might need to be 0 or "" instead of '0'. It would be
> > nice if
> > we could make False work too but I worry that might not.
> >
> > Cheers,
> >
> > Richard
>
> None of this will work unless you change the code in
> bitbake/lib/bb/data.py
> to use d.getVarFlag(var, "export") instead of d.getVarFlag(var,
> "export", False).
> However, I assume that is not wanted given that support for
> foo[unexport] =3D "1"
> was introduced to counteract a foo[export] =3D "1".

Good point, which reminds me why the code does this. Expanding the
value for all export variables would have a significant effect on some
performance sensitive code :(.

From memory I think there was a bit more to unexport than that. Looking
at the history:

https://git.yoctoproject.org/poky/commit/?id=3D0da3c82a66e02bf2d3780e23427d=
476766a0bcfc

I think it wasn't enough just to not export some things, we wanted to
actually unset them in the shell environment.

We may have later done more environment cleaning which made this
unnecessary, less sure about that. I did remove a lot of the unexports
(e.g. MACHINE and DISTRO) but SHELL[unexport] =3D "1" remains.

Cheers,

Richard

--_000_AM7PR08MB53201ACDF26AD8F277AF6E15FC0A9AM7PR08MB5320eurp_
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
@font-face
	{font-family:"Times New Roman \(Body CS\)";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
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
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Richar=
d,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">&nbsp;&nb=
sp; Are you happy to accept my initial patch as it?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Cheers,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Anton<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Date: </b>Sunday, 20 November 2022 at 11:45<br>
<b>To: </b>Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;, Anton An=
tonov &lt;Anton.Antonov@arm.com&gt;, openembedded-core@lists.openembedded.o=
rg &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject: </b>Re: [OE-core] [langdale][master][PATCH] rust: Do not use de=
fault compiler flags defined in CC crate<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On Sat, 2022-11-19 at=
 01:57 +0000, Peter Kjellerstedt wrote:<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: openembedded-core@lists.openembedded.org<br>
&gt; &gt; &lt;openembedded-core@lists.openembedded.org&gt; On Behalf Of Ric=
hard<br>
&gt; &gt; Purdie<br>
&gt; &gt; Sent: den 18 november 2022 17:36<br>
&gt; &gt; To: Anton Antonov &lt;Anton.Antonov@arm.com&gt;;<br>
&gt; &gt; openembedded-core@lists.openembedded.org<br>
&gt; &gt; Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use=
<br>
&gt; &gt; default compiler flags defined in CC crate<br>
&gt; &gt; <br>
&gt; &gt; On Fri, 2022-11-18 at 16:21 +0000, Anton Antonov wrote:<br>
&gt; &gt; &gt; &nbsp; I=92ve tested your approach. It doesn=92t work for wh=
atever reason.<br>
&gt; &gt; &gt; CRATE_CC_NO_DEFAULTS is empty exported for native recipes:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; $ MACHINE=3Dqemuarm bitbake rust-native -e |grep<br>
&gt; &gt; &gt; CRATE_CC_NO_DEFAULTS<br>
&gt; &gt; &gt; # $CRATE_CC_NO_DEFAULTS [3 operations]<br>
&gt; &gt; &gt; #&nbsp;&nbsp;&nbsp;&nbsp; [export] &quot;${'1' if d.getVar('=
CRATE_CC_NO_DEFAULTS') =3D=3D<br>
&gt; &gt; &gt; 'true' else '0'}&quot;<br>
&gt; &gt; &gt; export CRATE_CC_NO_DEFAULTS=3D&quot;&quot;<br>
&gt; &gt; &gt; # $CRATE_CC_NO_DEFAULTS:class-native<br>
&gt; &gt; &gt; CRATE_CC_NO_DEFAULTS:class-native=3D&quot;&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &nbsp; I also tried:<br>
&gt; &gt; &gt; CRATE_CC_NO_DEFAULTS[export] =3D<br>
&gt; &gt; &gt; &quot;${@oe.utils.conditional('CRATE_CC_NO_DEFAULTS', '', '0=
', '1',<br>
&gt; &gt; &gt; d)}&quot;<br>
&gt; &gt; &gt; with the same result =96 empty export.<br>
&gt; &gt; <br>
&gt; &gt; I think it might need to be 0 or &quot;&quot; instead of '0'. It =
would be<br>
&gt; &gt; nice if<br>
&gt; &gt; we could make False work too but I worry that might not.<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; <br>
&gt; &gt; Richard<br>
&gt; <br>
&gt; None of this will work unless you change the code in<br>
&gt; bitbake/lib/bb/data.py <br>
&gt; to use d.getVarFlag(var, &quot;export&quot;) instead of d.getVarFlag(v=
ar,<br>
&gt; &quot;export&quot;, False).<br>
&gt; However, I assume that is not wanted given that support for<br>
&gt; foo[unexport] =3D &quot;1&quot; <br>
&gt; was introduced to counteract a foo[export] =3D &quot;1&quot;.<br>
<br>
Good point, which reminds me why the code does this. Expanding the<br>
value for all export variables would have a significant effect on some<br>
performance sensitive code :(.<br>
<br>
From memory I think there was a bit more to unexport than that. Looking<br>
at the history:<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D0da3c82a66e02bf2d=
3780e23427d476766a0bcfc">https://git.yoctoproject.org/poky/commit/?id=3D0da=
3c82a66e02bf2d3780e23427d476766a0bcfc</a><br>
<br>
I think it wasn't enough just to not export some things, we wanted to<br>
actually unset them in the shell environment.<br>
<br>
We may have later done more environment cleaning which made this<br>
unnecessary, less sure about that. I did remove a lot of the unexports<br>
(e.g. MACHINE and DISTRO) but SHELL[unexport] =3D &quot;1&quot; remains.<br=
>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_AM7PR08MB53201ACDF26AD8F277AF6E15FC0A9AM7PR08MB5320eurp_--

