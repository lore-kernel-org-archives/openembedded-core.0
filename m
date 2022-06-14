Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73615C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:18:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.121])
 by mx.groups.io with SMTP id smtpd.web09.2978.1655187501765451715
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baslerweb.com header.s=selector1 header.b=0DbMMe4P;
 spf=pass (domain: baslerweb.com, ip: 40.107.7.121,
 mailfrom: sebastian.suesens@baslerweb.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=GbvrM8mBL5J3GT+IdLEvMdJEdbE6lu1ug2P/MleYHjEkMqYAvRBH5S6cyPK1pZoi+RkByww/4gf0nOgKJ7UJL5bhCbbeXSF0F+yo072BDYBZk3YL6xDegLPPrDny9v2US2CxsDIcOojkBsxMbUvKJQz8ZNHA8A8vJEZaY05DDiNVwBXaHvnADE6yN+99eQHfLOaxU7LgsiJtoy356eETPN9FaHJrdzLoH2xnlfgUwq70avHDn1Bd/dST6pzR5nDcffsB05DEvZLydt81ahy5wp4WigpwakIi6P3+4jTq3g8AJoAZhIlP6beH15/TIKZu2/V/pgHKu4Xp7FpGzoTZpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a+10p6/gnlmP4ZqW43zRhWDbbTuKW/+w+Yh+7bv+sg=;
 b=HQ8uu2FJwi16BFPpWa93rCcLSE7s1rMN3vSoGC3P6CbIPSU74tC4V88H8s6IAwf9Be8Vxo3IZAOp3260DrZLY9rUY0cTOKhF3kzHqJT4V9e+s3dXqW6/ivAgMS+76B4leT3qG3KXAQ3G0sw2NiLTOef5mpVqxtoQYICVqSxfcjRmh2uEDXZgQBj3OZ/Vv5xP7N0gXjFXlhQijXl3W0NrPrqD8WvafmLmCn4IQ3yETNhNwb1Q/auYENZ9kcZdFaV6B4QK6irtTqWSR5x4smqu5g2OWtxE1XQNhiBfQFpAQQ9gCT/tVPDzzVG3dQ9uXiUcRudzgRfKr9ma/y6X19iDBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.79.220.33) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=baslerweb.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=baslerweb.com; dkim=none (message not signed);
 arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baslerweb.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a+10p6/gnlmP4ZqW43zRhWDbbTuKW/+w+Yh+7bv+sg=;
 b=0DbMMe4PEaPC5To92pTwQ+PhyA7Y7BpStYhUZ6dKJt7WHSs2BxGZN9iIGNzekkBqoN+5RmZGop+X6pu9XCKUYQlTLpMPoeDFU53OTkaTXCK2wvcNf87/UKt2EkrhrBfCrhDs+p8howIO7ovQQaTOjGeZ8k++HzhPBN9EzHnuQH0=
Received: from AS9P194CA0014.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::25)
 by AM6PR03MB4374.eurprd03.prod.outlook.com (2603:10a6:20b:f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Tue, 14 Jun
 2022 06:18:17 +0000
Received: from VE1EUR02FT099.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::77) by AS9P194CA0014.outlook.office365.com
 (2603:10a6:20b:46d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Tue, 14 Jun 2022 06:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=baslerweb.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=baslerweb.com;
Received-SPF: Pass (protection.outlook.com: domain of baslerweb.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 VE1EUR02FT099.mail.protection.outlook.com (10.152.13.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Tue, 14 Jun 2022 06:18:16 +0000
Content-Type: multipart/alternative;
	boundary="_000_VI1PR03MB63010CFD6930BD89458CB6CBFCAA9VI1PR03MB6301eurp_"
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (104.47.14.51) by
 de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via
 SMTP; Tue, 14 Jun 2022 06:18:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTZG38UgRYrFbXQ4BKlr2gPj3s1ooF77Kuq76B4y/TNqQrPlVP4VxLVZUGKBCA8rZSfBgTvWXzYvdWTJUZuqeIW5iKbIPX7Pn1XJ2l5vqKP2rxi3cPrSlmD2rbD5rJ0tqhlvgjXRw/tAYqnm5NcqUbHsmpi72f6kxnbZ9bvryoSVnxDZ9cw1C5a5L3abD2V6VgfI2RaPrK9xkqArrmeb4ffqEl79aHh/8Q7vtgFwfic24KbARMcKOSNm2e0kX3jNfS+Qx/Znt3xWWvyxpDk7IfhNp/MKjepbNSC8iEUrrpNaWUGw0AsBH5FQpB8RYj4cChgsQUSV6A06pUs5lXOqEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4B2xYmB5UNkh87kGUx612Ap7N4s9NrqQ6pxJDK+qsI=;
 b=BTm85eSd0pCJxps3MlIQhDLrWPGAMejFlbLUyw2r0ZMQ8fQb7GjK+harLLVYly65RDblH7p/Q3XBTXjfm1lbGPl+G2dlJJ/oP4fZzj7ZKF9Q70lJrBYJw0DawVzLb2iz9E6bOGCk/M681Yc7YeD9JdmC3lJRLDFdQOLisTEPjNcNidejn+FiiFDjBN4mMRDEHC0cP/2gttw/CNTAN1xfqyNOlX3pGR+A0non3nJnSavgxYb8ezBm8R0umFA0YRl2bNcnXvjADTLm9fHH07cKOByzbpkg194Y0P7In64zw0YdSnrR+UW4SeE3g5mI6vmO+jdziKlCY8+cbzK/EshhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=baslerweb.com; dmarc=pass action=none
 header.from=baslerweb.com; dkim=pass header.d=baslerweb.com; arc=none
Received: from VI1PR03MB6301.eurprd03.prod.outlook.com (2603:10a6:800:133::18)
 by AM6PR03MB5765.eurprd03.prod.outlook.com (2603:10a6:20b:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.21; Tue, 14 Jun
 2022 06:18:14 +0000
Received: from VI1PR03MB6301.eurprd03.prod.outlook.com
 ([fe80::c923:65ed:f2f7:dd1f]) by VI1PR03MB6301.eurprd03.prod.outlook.com
 ([fe80::c923:65ed:f2f7:dd1f%4]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 06:18:14 +0000
From: =?iso-8859-1?Q?S=FCsens=2C_Sebastian?= <Sebastian.Suesens@baslerweb.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Test
Thread-Topic: Test
Thread-Index: AQHYf7aH/RQb975l4EirytUSW69IYg==
Date: Tue, 14 Jun 2022 06:18:14 +0000
Message-ID: 
 <VI1PR03MB63010CFD6930BD89458CB6CBFCAA9@VI1PR03MB6301.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_Enabled=True;MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_SiteId=744babbe-2423-4ffc-a968-eb9943b74386;MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_SetDate=2022-06-14T06:18:14.284Z;MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_Name=SK4
 -
 Public;MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_ContentBits=0;MSIP_Label_f9f5373c-0244-4f85-bfd2-22dfa2199757_Method=Privileged;
suggested_attachment_session_id: 1e9b76ea-f845-9480-15a0-86caa9efab22
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=baslerweb.com;
X-MS-Office365-Filtering-Correlation-Id: 1e3d902d-5d66-48eb-92e7-08da4dcdabad
x-ms-traffictypediagnostic: 
	AM6PR03MB5765:EE_|VE1EUR02FT099:EE_|AM6PR03MB4374:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR03MB437439E32D0E56B2CCE68DEFFCAA9@AM6PR03MB4374.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VSUHKNF5mDMFLssqkmpipg44D6QBqzGmTAJrrVi1b/XcUAo485AytXB1yPloac4HP2gBuOn56NzioMg8ElQpyMH2aFwT9HLG9HUj2a7zulpP7oXGCJRqj6+pIs2e9TDQPq7dZytYvV7jC8C6HFAYDaWFcaM33y+ati+wpu8gUXJPXm2Ymh7a05psP1v//iwGn6FKC3NQORYAJfiAoK61HiG89vUuOdpm4/VQ2rMJ+1IJoZtfdtS4WAtDKkpQjNfaUjrCacQsjYT/E/QnQeDX1uQoBzTJp7/zYl8cNPSUavwm2DofgOy9bsfQZCK3SfoSWn7C54WUt8J3JagHu1kOq7Cqrhmas2YAIn8kMRtgdqcHxdfGK9zACMUbe7Pxlum/+7kj9iWD3Oezs3D4dss/mMWSAf11iVifDcH1rBVR30Kv9s/kM3XZ2d7yq819n4mn8zxlgkhKKjreHcYGIuD+Ng6Poje0B0QRf4Ru5HmTbgY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6301.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(122000001)(38070700005)(558084003)(186003)(8936002)(6916009)(316002)(91956017)(9686003)(76116006)(66946007)(64756008)(7696005)(66476007)(66446008)(6506007)(66556008)(7116003)(8676002)(86362001)(71200400001)(508600001)(38100700002)(3480700007)(5660300002)(33656002)(2906002)(55016003)(19627405001)(52536014)(558944008);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5765
X-CodeTwo-MessageID: 
 177fe003-b186-407f-a23e-6fe921664907.20220614061816@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
References: 
 <a39facdf-fb40-4959-b9cd-806ddb238833.6af23c10-22b2-42ee-a496-feef3dd05c70.3c4fa4b1-f4fa-42c4-aa6d-4907f8587f6e@emailsignatures365.codetwo.com>
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR02FT099.eop-EUR02.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94c9d50a-86a4-4b67-7236-08da4dcdaa2d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jywYvaEwHPsnHdC8CHSI5O0n8A9WYaCw0vAYGXKp78ozLn++BjWllrlmTQW3eafCpfNe9Bu55pYzPgwR8LTf0ZwChQEtFBxQkM1bD/VrdG+hU8v3GgUNZS/TRJ885hoDojw2LrveBVEqTkveGjRItRmCCFjx8aJARBtqY1DMIHUSGUE0dArUMnWs6Q/7qkZCuT6soZJusTvo39bBIokWTrdDkkh4xhzqJh3Hb8vQ2g/0lp/w07y7D2hMvosqOJrxY4DhDblDkU8T+MoyLiD74k0lxnT1SQ0AWm1dXajLuKLThpnobqgR8V7/rNLSPmXn2zdtyB0wfYzVqZExJ95BzJ72PoQiD9g3tjs+51Dr934/+y8I9oAaoWsdpwFzzYrxuHzngYpI7lLPmwfwF+fHfN0PDn4IlZDW/RLlAHi7jcUSUPHSWsbPcu62CzPhZe/iv0i4KxOCeZDhMbFWh+2GkmVxERDDo+Vrz6+0/jNhkNlbFXFF7aXA00dubNJ2IIW8xs7JwZkcAjmuDgmD2RcwmQbAZT/s3ugeEXEDuyYei/RvC0MXvIl83kRlnStTxnw3btVptwU5xXpdGskPBxZqgnIQTZQlTzYYUz8bGN5BeYHxIwb7UskO8qqLALshhYSVLhy/9sciFHsUUmuOddZLuvx/6WWXLDgIvbFMeSN7pDzjvbj1UyZUYqAN3p4omXgtwUiw3H/tsuyJ5cc9doL3TYJ6ddMHambvp539rBPzxQCWDl931Kuq31qmwBe3YeatvpXqmo8C71fOadG4MbBvVCYuBWWsqfsTXNqjwYO43rb9mV0aknAuk8vZP1XdXzgT
X-Forefront-Antispam-Report: 
	CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(19273905006)(70206006)(26005)(6916009)(7696005)(6506007)(47076005)(86362001)(70586007)(15974865002)(8936002)(2906002)(82310400005)(166002)(19627405001)(336012)(8676002)(3480700007)(316002)(7636003)(36860700001)(7116003)(45080400002)(186003)(9686003)(40460700003)(356005)(55016003)(7596003)(52536014)(33656002)(5660300002)(508600001)(563064011);DIR:OUT;SFP:1102;
X-OriginatorOrg: baslerweb.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:18:16.9791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e3d902d-5d66-48eb-92e7-08da4dcdabad
X-MS-Exchange-CrossTenant-Id: 744babbe-2423-4ffc-a968-eb9943b74386
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=744babbe-2423-4ffc-a968-eb9943b74386;Ip=[20.79.220.33];Helo=[de1-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT099.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4374
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 06:18:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166875

--_000_VI1PR03MB63010CFD6930BD89458CB6CBFCAA9VI1PR03MB6301eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Test

Sebastian S=FCsens
Software Developer

[cid:basler_bfcf2c8f-c1cc-4a01-80f0-9f2e624337c8.jpg]

Basler AG

Tel. +49 4321 55956 27<tel:+49%204321%2055956%2027>

Sebastian.Suesens@baslerweb.com<mailto:Sebastian.Suesens@baslerweb.com>
www.baslerweb.com<https://www.baslerweb.com/de/>

 [cid:thumbnail_microsoftteams-image(1)_3dea03cf-0524-4caf-8746-383e580b5de=
6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png] Call me on Teams<callto:Sebasti=
an.Suesens@baslerweb.com>


[cid:facebook_blue_140d26a0-35cb-41d7-bcd5-32e774b3463c.gif]<http://www.fac=
ebook.com/BaslerAG>  [cid:twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635ac1=
.gif] <https://twitter.com/Basler_AG>   [cid:linkedin_blue_df7e77c3-9715-40=
99-b64f-cbb717af355e.gif] <https://www.linkedin.com/company/basler-ag>   [c=
id:kununu_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif] <http://www.kununu=
.com/de/all/de/it/basler>   [cid:youtube_blue_674ec9f3-397f-4b79-9a96-8cf5d=
69e771f.gif] <http://www.youtube.com/user/BaslerAG>   [cid:xing_blue_bfd885=
b5-987f-409c-b792-75d6c6a70665.gif] <https://www.xing.com/companies/baslera=
g>   [cid:imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9fa.gif] <https:=
//imaginghub.com/partners/category-hardware/51-basler-ag> <https://www.face=
book.com/user_name_here>   <https://www.linkedin.com/company/user_name_here=
>   <https://www.twitter.com/user_name_here>   <https://www.youtube.com/use=
r/user_name_here>


Management board: Dr.Ing. Dietmar Ley (CEO), Alexander Temme (CCO), Arndt B=
ake (CMO), Hardy Mehl (CFO/COO)
Chairman of the supervisory board: Norbert Basler
Basler AG =B7 Amtsgericht L=FCbeck HRB 4090 =B7 Value added tax ID: DE 135 =
098 121 =B7 Tax number: 30 292 04497 =B7 WEEE registration number: DE 83888=
045



--_000_VI1PR03MB63010CFD6930BD89458CB6CBFCAA9VI1PR03MB6301eurp_
Content-Type: multipart/related;
	boundary="_64bb6760-c139-43b6-9e14-7274713c1128_"

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 10pt; c=
olor: rgb(31, 73, 125);" class=3D"elementToProof">
Test</div>
<p><span data-codetwo-visible=3D"Phone" style=3D"font-family: sans-serif; f=
ont-size: 12px; color: rgb(19, 19, 19);"><span style=3D"color: rgb(0, 69, 1=
24); font-size: 13.3333px; font-family: Arial;"></span></span><span style=
=3D"color: rgb(0, 69, 124); font-size: 10pt; font-weight: bolder;"><span st=
yle=3D"font-family: Arial; font-size: 10pt;">Sebastian</span> <span style=
=3D"font-size: 10pt; font-family: Arial;">S&#xFC;sens</span>&nbsp;</span><s=
pan style=3D"color: rgb(0, 69, 124); font-family: sans-serif; font-size: 13=
.3333px;"></span><font color=3D"#00457c"><span style=3D"font-size: 13.3333p=
x;"><br></span></font><span style=3D"font-size: 9pt; color: rgb(0, 69, 124)=
;"></span><span style=3D"color: rgb(0, 0, 0);"><span style=3D"color: rgb(0,=
 69, 124);"><span style=3D"font-size: 9pt; font-family: Arial;">Software De=
veloper</span><span style=3D"font-size: 12px;"><br></span></span></span><sp=
an style=3D"color: rgb(0, 69, 124); font-size: 9pt;"></span></p><p><span da=
ta-codetwo-visible=3D"Phone" style=3D""><br><font color=3D"#131313"><span s=
tyle=3D"font-size: 12px;"><img src=3D"cid:basler_bfcf2c8f-c1cc-4a01-80f0-9f=
2e624337c8.jpg" border=3D"0" id=3D"0.8eu4pfarlto"></span></font><br><span s=
tyle=3D"color: rgb(32, 31, 30); font-size: 12px; font-weight: bolder; font-=
family: ARIAL;"><span style=3D"margin: 0px; padding: 0px; border: 0px; font=
-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch:=
 inherit; font-size: 10pt; line-height: inherit; font-family: Arial, &quot;=
sans-serif&quot;; vertical-align: baseline; color: rgb(31, 73, 125);"><br s=
tyle=3D"font-size: 10pt;"><span style=3D"font-family: Arial;"><span style=
=3D"font-family: Arial;"><span style=3D"font-family: Arial;">Basler AG<br><=
/span></span></span></span></span><span style=3D"color: rgb(32, 31, 30); fo=
nt-size: 12px; font-weight: bolder; font-family: ARIAL;"><span style=3D"mar=
gin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inh=
erit; font-weight: inherit; font-stretch: inherit; font-size: 10pt; line-he=
ight: inherit; font-family: Arial, &quot;sans-serif&quot;; vertical-align: =
baseline; color: rgb(31, 73, 125);"><span style=3D"font-family: Arial;"><sp=
an style=3D"font-family: Arial;"><br></span></span></span></span><span styl=
e=3D"color: rgb(201, 63, 63); font-size: 12px; font-family: Arial;"><span s=
tyle=3D"color: rgb(0, 69, 124); font-family: Arial;"><span style=3D"font-si=
ze: 10pt; font-family: Arial;"><span style=3D"font-size: 9pt;"><span style=
=3D"font-size: 9pt;">Tel.</span></span><span style=3D"font-family: Arial; f=
ont-size: 9pt;">&nbsp;</span></span></span></span><a href=3D"tel:+49 4321 5=
5956 27" style=3D"color: rgb(0, 69, 124); font-size: 9pt; text-decoration-l=
ine: none; font-family: Arial;"><span style=3D"font-family: Arial; font-siz=
e: 9pt;"><span style=3D"font-family: Arial; font-size: 9pt;"><span style=3D=
"font-size: 9pt;">+49 4321 55956 27</span></span></span></a><br style=3D"fo=
nt-size: 9pt;"><span style=3D"color: rgb(0, 69, 124); font-size: 9pt; font-=
family: Arial;"><span style=3D"font-size: 9pt;"></span><br style=3D"font-si=
ze: 9pt;"></span></span><a href=3D"mailto:Sebastian.Suesens@baslerweb.com" =
style=3D"background-color: rgb(255, 255, 255); text-decoration-line: none; =
font-size: 9pt; font-family: Arial;"><span style=3D"color: rgb(0, 69, 124);=
 font-size: 9pt; font-family: Arial;"><span style=3D"font-size: 9pt;">Sebas=
tian.Suesens@baslerweb.com</span></span></a><br style=3D"font-size: 9pt;"><=
a href=3D"https://www.baslerweb.com/de/" title=3D"" style=3D"background-col=
or: rgb(255, 255, 255); color: rgb(0, 69, 124); font-size: 10pt;"><span sty=
le=3D"font-family: Arial;"><span style=3D"font-size: 9pt;"><span style=3D"f=
ont-size: 9pt;">www.baslerweb.com</span></span></span></a></p><p><span data=
-codetwo-visible=3D"Company address" style=3D"color: rgb(19, 19, 19); font-=
size: 12px;"><br>&nbsp;<a class=3D"meetingLink" href=3D"callto:Sebastian.Su=
esens@baslerweb.com"><img src=3D"cid:thumbnail_microsoftteams-image(1)_3dea=
03cf-0524-4caf-8746-383e580b5de6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png" =
class=3D"meetingLink"><span style=3D"font-size: 10pt; font-family: Arial;">=
<span style=3D"font-size: 9pt;">Call me on Teams</span></span></a><span sty=
le=3D"font-size: 10pt;"><span style=3D"font-size: 9pt;">&nbsp;</span></span=
><br><br><br><a href=3D"http://www.facebook.com/BaslerAG" title=3D"" style=
=3D"background-color: rgb(255, 255, 255);"><img src=3D"cid:facebook_blue_14=
0d26a0-35cb-41d7-bcd5-32e774b3463c.gif" border=3D"0" id=3D"0.e4dc2bdabjq"><=
/a><span style=3D"color: rgb(33, 37, 41);">&nbsp;&nbsp;</span><a href=3D"ht=
tps://twitter.com/Basler_AG" title=3D"" style=3D"background-color: rgb(255,=
 255, 255);"><img src=3D"cid:twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635=
ac1.gif" border=3D"0" id=3D"0.goi16bhv86q"></a><span style=3D"color: rgb(33=
, 37, 41);">&nbsp;&nbsp;</span><a href=3D"https://www.linkedin.com/company/=
basler-ag" title=3D"" style=3D"background-color: rgb(255, 255, 255);"><img =
src=3D"cid:linkedin_blue_df7e77c3-9715-4099-b64f-cbb717af355e.gif" border=
=3D"0" id=3D"0.7otbgesh6j"></a><span style=3D"color: rgb(33, 37, 41);">&nbs=
p;&nbsp;</span><a href=3D"http://www.kununu.com/de/all/de/it/basler" title=
=3D"" style=3D"background-color: rgb(255, 255, 255);"><img src=3D"cid:kunun=
u_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif" border=3D"0" id=3D"0.2fvep=
j7qpck"></a><span style=3D"color: rgb(33, 37, 41);">&nbsp;&nbsp;</span><a h=
ref=3D"http://www.youtube.com/user/BaslerAG" title=3D"" style=3D"background=
-color: rgb(255, 255, 255);"><img src=3D"cid:youtube_blue_674ec9f3-397f-4b7=
9-9a96-8cf5d69e771f.gif" border=3D"0" id=3D"0.d7ccpugi9me"></a><span style=
=3D"color: rgb(33, 37, 41);">&nbsp;&nbsp;</span><a href=3D"https://www.xing=
.com/companies/baslerag" title=3D"" style=3D"background-color: rgb(255, 255=
, 255);"><img src=3D"cid:xing_blue_bfd885b5-987f-409c-b792-75d6c6a70665.gif=
" border=3D"0" id=3D"0.oxg0f2xaarm"></a><span style=3D"color: rgb(33, 37, 4=
1);">&nbsp;&nbsp;</span><a href=3D"https://imaginghub.com/partners/category=
-hardware/51-basler-ag" title=3D"" style=3D"background-color: rgb(255, 255,=
 255);"><img src=3D"cid:imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9f=
a.gif" border=3D"0" id=3D"0.fsjxzsejsrm" width=3D"30" height=3D"30" style=
=3D"width: 30px; height: 30px;"></a><a class=3D"socialLink" href=3D"https:/=
/www.facebook.com/user_name_here" style=3D"background-color: rgb(255, 255, =
255); font-size: 9pt;"></a><span style=3D"color: rgb(33, 37, 41); font-size=
: 9pt;">&nbsp;&nbsp;</span><a class=3D"socialLink" href=3D"https://www.link=
edin.com/company/user_name_here" style=3D"background-color: rgb(255, 255, 2=
55); font-size: 9pt;"></a><span style=3D"color: rgb(33, 37, 41); font-size:=
 9pt;">&nbsp;&nbsp;</span><a class=3D"socialLink" href=3D"https://www.twitt=
er.com/user_name_here" style=3D"background-color: rgb(255, 255, 255); font-=
size: 9pt;"></a><span style=3D"color: rgb(33, 37, 41); font-size: 9pt;">&nb=
sp;&nbsp;</span><a class=3D"socialLink" href=3D"https://www.youtube.com/use=
r/user_name_here" style=3D"background-color: rgb(255, 255, 255); font-size:=
 9pt;"></a><span style=3D"color: rgb(33, 37, 41); font-size: 9pt;">&nbsp;<b=
r></span><br></span></p><p><font color=3D"#00457c"><span style=3D"font-size=
: 13.3333px;"><span style=3D"font-size: 10pt;"><span style=3D"font-family: =
Arial;"><span style=3D"font-size: 9pt;"><span style=3D"font-size: 9pt;">Man=
agement board: Dr.Ing. Dietmar Ley (CEO), Alexander Temme (CCO), Arndt Bake=
 (CMO), Hardy Mehl (CFO/COO)</span></span></span></span><br style=3D"font-s=
ize: 9pt; font-family: Arial;"></span></font><span style=3D"color: rgb(0, 6=
9, 124); font-size: 9pt; font-family: Arial;">Chairman of the supervisory b=
oard: Norbert Basler&nbsp;<br style=3D"font-size: 9pt; font-family: Arial;"=
></span><span data-codetwo-visible=3D"Company address" style=3D"font-size: =
9pt; font-family: Arial;"><font color=3D"#00457c" style=3D"font-size: 9pt; =
font-family: Arial;"><span style=3D"font-size: 9pt; font-family: Arial;">Ba=
sler AG &#xB7; Amtsgericht L&#xFC;beck HRB 4090 &#xB7;&nbsp;</span><span st=
yle=3D"font-size: 9pt; font-family: Arial;">Value added tax ID: DE 135 098 =
121</span><span style=3D"font-size: 9pt; font-family: Arial;">&nbsp;&#xB7; =
T</span><span style=3D"font-size: 9pt; font-family: Arial;">ax number</span=
><span style=3D"font-size: 9pt; font-family: Arial;">: 30 292 04497 &#xB7;&=
nbsp;</span></font></span><font color=3D"#00457c" style=3D"font-size: 1rem;=
"><span style=3D"font-size: 13.3333px;"><span style=3D"font-size: 10pt;"><s=
pan style=3D"font-family: Arial; font-size: 9pt;">WEEE re</span><span style=
=3D"font-family: Arial;"><span style=3D"font-size: 9pt;"><span style=3D"fon=
t-size: 9pt;">gistration number: DE 83888045</span></span></span></span></s=
pan></font><br></p><p style=3D"FONT-SIZE: 10pt; FONT-FAMILY: ARIAL"><span s=
tyle=3D"font-size: 10pt;"><span style=3D"font-family: Arial;">&nbsp;</span>=
</span></p>=0A=
</body>
</html>

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: basler_bfcf2c8f-c1cc-4a01-80f0-9f2e624337c8.jpg
Content-Type: image/jpeg;
	name="basler_bfcf2c8f-c1cc-4a01-80f0-9f2e624337c8.jpg"
Content-Disposition: inline;
	filename="basler_bfcf2c8f-c1cc-4a01-80f0-9f2e624337c8.jpg"
Content-Transfer-Encoding: base64
Content-ID: <basler_bfcf2c8f-c1cc-4a01-80f0-9f2e624337c8.jpg>

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
IT80cBXNbr1REURFERREURFERREURFERREURFERREURFERREURFERREURFERREURFERREURFEX//
2Q==

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: 
 thumbnail_microsoftteams-image(1)_3dea03cf-0524-4caf-8746-383e580b5de6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png
Content-Type: image/png; name=
	"thumbnail_microsoftteams-image(1)_3dea03cf-0524-4caf-8746-383e580b5de6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png"
Content-Disposition: inline; filename=
	"thumbnail_microsoftteams-image(1)_3dea03cf-0524-4caf-8746-383e580b5de6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png"
Content-Transfer-Encoding: base64
Content-ID: 
 <thumbnail_microsoftteams-image(1)_3dea03cf-0524-4caf-8746-383e580b5de6_a55eb40d-5861-42e1-bd5e-f1cc162fd231.png>

iVBORw0KGgoAAAANSUhEUgAAABgAAAAWCAYAAADafVyIAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAAyNpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDYuMC1jMDA2IDc5LjE2
NDc1MywgMjAyMS8wMi8xNS0xMTo1MjoxMyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6ODZDN0QwNDRBRDhBMTFFQjlCNDc5RTUzQ0JCM0IyRjAiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6ODZDN0QwNDNBRDhBMTFFQjlCNDc5RTUzQ0JCM0IyRjAi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIDIyLjMgKFdpbmRvd3MpIj4gPHhtcE1N
OkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NTU3OUY1QjdBQ0M0MTFFQjg2
OTdBRDVBNUY2MzI3QkYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NTU3OUY1QjhBQ0M0MTFF
Qjg2OTdBRDVBNUY2MzI3QkYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94Onht
cG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4Fvd85AAAEMElEQVR42sxVa2gcVRQ+M/fObjazm3S3
dNlmidumTUwbtBZEorZYolUqAYWAIKU+8PHHB1QphaCgVFrqD6GIxf4wQiiJ/SH9I200lrpIDdpk
NU00bYKp1Dw23WSTzT6y87rXc+9k11owTcAfDgxz58455/vOd849o3DO4X91+SqD1YRo6mrtldUa
xjbvat6774Pj1cHaxuJSJnkp/tHxXwZOd/0nAKH1dbGXX4sndH84ZJkFIMQDKqFwuuOpx8eu9vQK
m+pgw3Zdj8bSc8P9xaVUquS7qlTv3t7aVlUVDRnFRWDMBssqgKIosGPns6/I7LY8vb/lyTOJh1pO
nmvZ19WPYNvWBMCZjXYOqKoqA8s9bA5VpbpY12878C6uvZa5CP5A7K5NW9teL/nSdcEtDU07DrQr
CtEZZ+gpnKEcRCz9gZrY6OgQaBqBcDgClHqlTKPXenqEHWMWVyRXBQmowByjTI5ujD7QWt/Y9rxt
G2jIwba5GxhvxmEZzYF0elY6VAX82EmqFf/2aPfgQNdnYm/kyqcf3v/gkY893nX6bOrn6+OjZ06V
ARzHYoaRR10NZKjA+pDHBXI4ECQlAGfnDGSmoU2+2N35zKuZheuDS4X0lVKQ6YnvPj9/9omffHqk
NpsZT+DWzTKAUEQENE0HYrUBeOuNJvB4VNArKSxkTJicKsD7xwbBYUwko9ZEdzZu2twcIdTbKmoo
amLbFk+lkjZHoSI1u+/Db3RxfiwxNXHxHOXc1ZoQBf64kYc3D/0Ie3ZH4KXn6qH9vQRksxZmhMGl
XsTz8CNvt28I1y33h1ssUfzfRgYhX1BQBR++eyAzf3ViZvpSAxW0HOZqblkMsjkLcjlbSjS/YEA+
b2FRFSkb5w4YZg6Kxcw/AAghIDrIMrHDuI0AGjgOSgIKdTNAZxFAkFTE2VNkdXHlPpkjvrkkVmjm
29+5WwN8OGUA7srBpbjuHr4LTBeA/d3Dq7yo6HTGbr2F3i6IWDOZFl+WiK15OMoMmMPKhfRgq14e
SMHBw32wVLSEfuAI9msEwAMnpwTFE6ypqtdlqGI3IdtsjsFcugDCpKSKbARBYsW56Y4RlWhgFNMz
eMILdH52qHd6In4eW7xSMCydYoxEAtXRZnxSJtPk4KvQQKP0tiGsuAQcRY4PSislo7GRzk8wnrPi
uN615+A3+B/Ya5p5OWP8/g0QDG0Fb0XVMgiiU+z5halcIhGf9QfqcOLOJa/92nFy8kbviTv+DyI1
9z62/4WzX+PsV7GvkaFXDjoB5upMoALBvvzixcODie5OTdM3mmZGjInJUgyyEkAuOzOez90sNN3T
9qiuh/HAEjmuRWDNUynB4heOdfR9f+Id1HDRcYwkumVvjUHu1A0zyeEffh+7MIRMwz5fMCSmHv5w
ipN/9g/3fHXo6OW+U0fQzPw3/78EGAAjBTfeZLihnAAAAABJRU5ErkJggg==

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: facebook_blue_140d26a0-35cb-41d7-bcd5-32e774b3463c.gif
Content-Type: image/gif;
	name="facebook_blue_140d26a0-35cb-41d7-bcd5-32e774b3463c.gif"
Content-Disposition: inline;
	filename="facebook_blue_140d26a0-35cb-41d7-bcd5-32e774b3463c.gif"
Content-Transfer-Encoding: base64
Content-ID: <facebook_blue_140d26a0-35cb-41d7-bcd5-32e774b3463c.gif>

R0lGODlhHgAeAMQAAFt1mMrO1yRaiQBMgxpWiABQhRlVhwZShjhhjb3CztLW3QBGgSFXiYmXrkhp
kqOtvuzu8d/i54uZrwBLg8vQ2HyNp662xbrBzaWvv2uBoABOhABQhTBeiypbiv///ytciyH5BAAA
AAAALAAAAAAeAB4AQAX04CeK3Wia5Xmmqgl4cDQt28a2ZD4isJeot1FnqPtwPi8YZUA4okwcYtC0
aVAgEI/lI8CtuITHI9GDYB4WC+LgnLaOSU+A6fQW7V5W3R4VEBgEXUJuXhI9PQkdAoR2cQoaB4t4
QQQbh5ceF3g4cD1zBh83JYwjnTCfdqRHGT0RA3mbpF8tsrShtidHBlmHF4q3myJHAocKGBcVd09B
UXEBE5G1Tx8bHw6eCwsDG5KENwwHmJcdG3tAOQQADhU9Cg4OANRC5yqmchoECFHTuEZIngMMmKNX
79+pgMHmlTLoYQmBhF6cBfRGcIeEBg0yMJgFsSCpEAA7

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635ac1.gif
Content-Type: image/gif;
	name="twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635ac1.gif"
Content-Disposition: inline;
	filename="twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635ac1.gif"
Content-Transfer-Encoding: base64
Content-ID: <twitter_blue_ab154049-bc6d-43f7-8f98-a01f84635ac1.gif>

R0lGODlhHgAeAMQAAABMg154mmR8nABJgv39/XiJpQBGgR1WiABQhTBeixRUhzlijpaitTNfjIWV
rK+3xbG5xwZShr/G0Spbim+Eos3R2d7h5vT19+Dj6PDx81Jwlejr7kdokT9kj////0FmkCH5BAAA
AAAALAAAAAAeAB4AQAX/IPd1X1l2KDqaLLmeIhk5HhEYiVgCkuf/PkzFcfhwVEcAZQNsOimIY0k6
OkQOHAdky3BoDgrsSnVyuUxnc+eYQCjOJ6OqEygwnfgfozhliTgDBgF3eBIIDVR9cC8tZHEpL4tl
aCRklWiMIxwLETp+VhIZPhYCgg8aDXJrCgFAGQwdAAMdeR4SAzlwBwu1vQmpLCwHFL1NAgCTOigM
Qhe1GQUAwJeOlCTKwZnBR9SNc5faZphwaX6YKzEjHQnqlWcTCB0CAQhRB/HlCgIeAbPBv6KaWPAA
YdcaFzN+PDiA68OCCb0kHGCXLhaEJgQsQGDgDA+DKCg8IWDgoWMxIALYVPWZgqDAySYV3kR6MbIC
gZcYFEx4gW0NggCibtZiAECNEZoGZlGoUOuBtDEwViwIcDHPBgYJik4CN3NBAgX13ByYQA0SpWxj
xKEtM2fc2TRwq3UIAQA7

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: linkedin_blue_df7e77c3-9715-4099-b64f-cbb717af355e.gif
Content-Type: image/gif;
	name="linkedin_blue_df7e77c3-9715-4099-b64f-cbb717af355e.gif"
Content-Disposition: inline;
	filename="linkedin_blue_df7e77c3-9715-4099-b64f-cbb717af355e.gif"
Content-Transfer-Encoding: base64
Content-ID: <linkedin_blue_df7e77c3-9715-4099-b64f-cbb717af355e.gif>

R0lGODlhHgAeAMQAAJeitipbijJejH+QqGR8nLi/zCNZiQNRhgBMg4mXrqewwHOGo3KFow1ThhRU
hzhhjevu8S9di1Ryltrd44qYrgBGgeTn6wBQhczR2ebo7MPI0z1ijgBNhEBlj////z9kjyH5BAAA
AAAALAAAAAAeAB4AQAX/4CeO30aeJSqaYxdcEnEF3Vd3td0ZjiHkpw5n4Sl6FhyOwgiJGGqBj9GT
aNQ2QqIRqWQKnp/otJrbcABTBWLEUrFXNg5jyl1O78bC4dEaThlJdh4QXzhiRlUkbXBujSUsHREH
AQENNI5uLA8HBVMae4yYbR0NBBMYExMEBw4JGRgZAxUAEFMYmx2jcn+BUxMfHA0SdwRgIghaRQsI
XUWETy5SRhQOQAhzWxwIgs82ARtjDS0GEgAUCQkSlATmFAMPAiJ85+cS8ScbAgKLmG4dAgcAZLCg
YFKZUI5cGJgwxQIlR/xIdHCwgaEHCxNVmMCBL0gEDhUqcIhQwwCCkwY2gxxAEEOCgZFARAgZMGUA
s05FNAiaQqgapF3ZmtnCgEcASZl+tpzcKaGC0QoJwpG49ocZNyeGHkhFmuxIL2eFwkgrQg0I0CKA
hD6DMpaKgxZUjaTlVija1jg0jdjkgLPIAwPeOkwBUK0FwAOsfrhAzOrNgwYXLhy4Z0MHjsuYM2uu
fDkEADs=

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: kununu_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif
Content-Type: image/gif;
	name="kununu_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif"
Content-Disposition: inline;
	filename="kununu_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif"
Content-Transfer-Encoding: base64
Content-ID: <kununu_blue_0d911b72-5cf7-4dc2-ab22-f45ea2cc2f92.gif>

R0lGODlhHgAeAMQAADhhjYSUrFt1mK62xbe+y/T09pijt6SuvmR8ndTY31BtlHKFo77Dz4+bscnO
1+fp7c3S2kVokS9dizBei97h5kJnkNzf5f7+/jlijhpWiABGgUBlj0FmkD5jjj9kj////yH5BAAA
AAAALAAAAAAeAB4AQAX/oNd1IumVpqia23iSXctp1GczGeZ23FZ5GcIgYAgQHJrIyTOrXZ62z/Ni
G2h6sNSSp3lEcRLOrBH9BK7ZFSzDeFAehwngpdpsMoYEQTCwHJIqTV8SOh0aBlI2CxoVGxh2Jy0j
gjYJGhMYABpkVB8LGZIxWi0eERFiG3UdFacVHCp0LC8bExMSOUuRagAZEhETOa+kMxZRBDmSIhtK
GBkNChoSBhkepEw0XxkAPBkCEA7fChkKtxPisNdOHwl5FDWJHxAaGCWpAK/VXO+dCQMMZR8sROMA
I18uQVSOYXC1qQyCDPhWbPGAQYEAAQgi3BORCcFFAfSSxYDlAh0dUiRa3WyIiC8NAAm1MExQkwrl
hAXQIiyYkIJLgSgOcowQxUFHhgEHEDRAcICBhlTVKH3AkcsEgAgSFBjYIAGAAQUzh1bAdgMZBqwa
0mrIsMDBAAkHIAQAVUIqjkceGkY5AzNCB0x00iWyslaDgJ9UCtxhYoeHKBEIOwFMLC6CnaIn6EUa
6wQKwCgPZaQq6ELqhwaFFXiJIoBayVkkEH44NieChgAOk1gbOmIlNio4ADDEHWXRSqgTff+0EZSi
beKKnvaugxJIYQknIpzVlCGDBiYA7EAq3UOMefOuzqNXfz4EADs=

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: youtube_blue_674ec9f3-397f-4b79-9a96-8cf5d69e771f.gif
Content-Type: image/gif;
	name="youtube_blue_674ec9f3-397f-4b79-9a96-8cf5d69e771f.gif"
Content-Disposition: inline;
	filename="youtube_blue_674ec9f3-397f-4b79-9a96-8cf5d69e771f.gif"
Content-Transfer-Encoding: base64
Content-ID: <youtube_blue_674ec9f3-397f-4b79-9a96-8cf5d69e771f.gif>

R0lGODlhHgAeAMQAAJKes5qluMbK1U9sk/n5+rW8yX6OqD5jj6y1xNXZ4ABGgSFXiQBOhABPhQBJ
gldzl8/T2/Ly9Ors72l+nuTn63aJpd/i5+Pm6qKsvIiWrgBKgg1ThjBeiypbiv///y9diyH5BAAA
AAAALAAAAAAeAB4AQAX/4Cd2I9mZYqqe5ceSrsl4kRJNRjFZD/FtKdbotyB4JBPNw+JpVgZNWtTz
aHBgw80iU+h6v9/AwRpzDUULDkCU4aRVwfjKLNo8HptNJqOtHA4dC3AqHAxQTREMEhBLFQABEAoM
AhIRTQYaHINYZpxCQShwJp8fHJp0nGdzKQ4CEBAIDQkJCw8GBxkfgoObIgwUFwoEAQACFRYTHj90
ZSJXDRMXUREUwBEEwMASEgAMb1iFhzQaiwsFDxgTExsdAA0Clw6nMAsMCU0EAJYBGAIXARmaTEAQ
hcMGTSdS8RpkCiEvGKFUoVrVaVQHNw4WLNBA8YWcQUA8TAjIQIO3BVqAvTj82OkDg2QeNhQgMCzD
DQ8GWUr8oAFCAgUSDABAMCHBAAIdgHhiNkRRDYIeMjw4EmEZU08bGOTRoGFDAwUOGjTQELZB1jRL
XcKcgMEAhCgJ4E1pEmuXigZTozSwVAEChgIbBizaADNqJo8NxEUgZxSCo2JdJwxg4sGAPGaGokhQ
YIGCFXQLDgwYUOhe5ctCDB6QMLd16wkMJJJw08CBA663yXLFffsg0yGhhJBKBVGTceOljpdafhy5
qQ8hAAA7

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: xing_blue_bfd885b5-987f-409c-b792-75d6c6a70665.gif
Content-Type: image/gif;
	name="xing_blue_bfd885b5-987f-409c-b792-75d6c6a70665.gif"
Content-Disposition: inline;
	filename="xing_blue_bfd885b5-987f-409c-b792-75d6c6a70665.gif"
Content-Transfer-Encoding: base64
Content-ID: <xing_blue_bfd885b5-987f-409c-b792-75d6c6a70665.gif>

R0lGODlhHgAeAMQAAABQhaSuvhlVh9XZ4I6csXaJpSRaiQBKg1BtlCtcizlijvz9/UdokThhjS9d
i73Czj9kj+Dj6FFulVZyl+rt8Pb2+MrO12l/nrrBzf7+/kFmkEJnkElqkkprk////0hpkiH5BAAA
AAAALAAAAAAeAB4AQAX/4CdyYmmWHIl+3Wl2AOHN3gNoG+IolZfNnYREwyGeBAWaB3OQ/TwBQEvT
Ublcnc2H00EYkj7PAHA1aTSfXGuD7kg2XMBASUggtOZOUDNbeCgAEzM/EQIbLWUiCQYABgIMegcB
SlE5eCOJLghEDA0KnxCIK5kmVh+fCg0NRlgSEAawBhCbVRwNABRhHhIGtaYSHw6CHn6FHwbDMxUC
CqJYDAIXShYHYD8WADmYLhsGD3QHDhi6BFJ3h4lcLCUdRDGDNQLrLqYvOWcf0UoUBpek9Cc0KNgw
MBE6IqYOtRMWgQKFBQ8MtDGB4E5CS1sAWBNzY8oJBwUCiAwAIUERPe/Cn9jAkcIZiwNzaFwQIIGD
gElPomyZZ4JBDgCTaBBwcMACMT8EBNQLiHLckwIwdc08ZEWFiiAAIujScCDXEwkC2rkslYCHElg/
fiwoyaGiv4ANHkQYEOFBgg9l/fyoAMHBBypblqbpwAAHi0MNDPR4wiBBu39WfBKGkcuPhwl3y5BY
WguNgJgzCoT9V6rEhg2qTtt5/EKP69d61HGpArt2CAA7

--_64bb6760-c139-43b6-9e14-7274713c1128_
Content-Description: imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9fa.gif
Content-Type: image/gif;
	name="imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9fa.gif"
Content-Disposition: inline;
	filename="imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9fa.gif"
Content-Transfer-Encoding: base64
Content-ID: <imaginghub_blue_8a11c956-df5b-4958-aa8e-9be8d4d0f9fa.gif>

R0lGODlhHgAeAKIAAO7x8094nmuNrZyzyMrW4OHn7fz8+ytciyH/C1hNUCBEYXRhWE1QPD94cGFj
a2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0
YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMx
MzIgNzkuMTU5Mjg0LCAyMDE2LzA0LzE5LTEzOjEzOjQwICAgICAgICAiPiA8cmRmOlJERiB4bWxu
czpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRm
OkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20v
eGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4
bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVm
IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxNS41IChXaW5kb3dzKSIg
eG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4MEE4MDUyMDkwOEIxMUU2OUMzQjhCRTVERjA0RkQz
NCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo4MEE4MDUyMTkwOEIxMUU2OUMzQjhCRTVERjA0
RkQzNCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjgwQTgw
NTFFOTA4QjExRTY5QzNCOEJFNURGMDRGRDM0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjgw
QTgwNTFGOTA4QjExRTY5QzNCOEJFNURGMDRGRDM0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3Jk
ZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv
7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2
tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359
fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVE
Q0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwL
CgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB4AHgAAA8p4utz+MMpJKyMlaw2C2BoBDYFhnmdxACgK
GcHQnoc8G8Crsu1w3Kbco2AQlFoHAhAHIeaUJ4FgaWqafKkDEQcqAFRDmk1wCJg9ZuPZahIZwAzA
NyOHN7YmKblhQ4ZPQg88gGwnPg9HhIIzAQ4kfUwPGBsAhwxvP4oOZ5xqZTV5U0EQGHVfcleZTFCB
DYM3SShYkQ54M0YzoK0MtigqvQZuBoUtHkBSww9AJFQBIg8DGRjTHhkzGZYWDB8oe9ojUd8SAize
4qTm59oJADs=

--_64bb6760-c139-43b6-9e14-7274713c1128_--

--_000_VI1PR03MB63010CFD6930BD89458CB6CBFCAA9VI1PR03MB6301eurp_--

