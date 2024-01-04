Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CE2C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:43:02 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web11.52803.1704372172413519218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:42:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=e1bNtkP+;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=e1bNtkP+;
 spf=pass (domain: arm.com, ip: 40.107.6.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZY3vNqVv3kDOU6hj+FCnJB96Yz3Qw8yj43cSYFDBkJeagHTIvesFEUXgQF0EWMCAEW4EYqYGEeenjVinct+5zNJgGa3TLotphNLJHlKE+buNse9p1AfV65+kGlbaLHkYr7FmUH/ugzN6UZm4of1PUCGiK330bAFlyKvVwBwKlIagMq4ZJu5nfj/mC9FJzgKz456oWJti4E4AgWm2tgJDkN85z1Zac0aTiM3nS2uZWR7r6EVuOTnVRyrdN1PFBSjP/POUa2L92kN/tDIsHrYJtHlG55BZ3FF6qo2jg/7OMH2qAGDv72TYM5qJwlM3uNypDD3tNN5SQ2zSGUh6mut40Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iisb/YtyfBockZE1Yu5WBuUhGgbAzAE1851VPQP4PU=;
 b=DeWUblGWElBCQMU8ItVwsv2t4es4kuQj16pfB5GjFmaBwuFjpNUFss+Q8waOq/5xC3yBAFOIyFkwHG2CA6WqRuvJvIHZvEK3wYHhNRjLiJ19tSgDMwGumD/zBUeQfvDl3MUnq2Ac8HXGt60qioQ+bFPG3HcUkSSBr9t7Clc9JQUt02cd5yCzvgorUgcI1TUaFPJxIakg0RPfDJi9vuVWzay+pKFQMrVSqHzlfakdtbDbCvtwFubUiRrWqenxF/Xh/iTv2+acn6Z3gETxt6IeoYZCGA813ohwwN1MhgskdihI/vpJvbZuKnn4qcmE3sPl8ENyJ7rRpEnhGtWr0/pNhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iisb/YtyfBockZE1Yu5WBuUhGgbAzAE1851VPQP4PU=;
 b=e1bNtkP+XN8+L05OaHPDGOTZqLBcuoxpnfI+r4bdDG88Ca0od5SypVKfLXboygDqQ1cKyov8B4UxsVhhLU1hLISM3985IewscUIkW63I7o1PR6ran9roa5RefgqVqiIwt4isyY4Nxvq+gDHB/iwXoAiSKHaWkoGhn82SPRxcSYU=
Received: from AM6P195CA0034.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::47)
 by VI1PR08MB10199.eurprd08.prod.outlook.com (2603:10a6:800:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 12:42:48 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:209:81:cafe::c5) by AM6P195CA0034.outlook.office365.com
 (2603:10a6:209:81::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Thu, 4 Jan 2024 12:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7159.9 via Frontend Transport; Thu, 4 Jan 2024 12:42:48 +0000
Received: ("Tessian outbound 9bee66383d2d:v239"); Thu, 04 Jan 2024 12:42:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8141bdd53f396973
X-CR-MTA-TID: 64aa7808
Received: from 53c6c6654e16.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E6981D59-1BE1-4934-8335-672FB42BC4E7.1;
	Thu, 04 Jan 2024 12:42:42 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53c6c6654e16.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 04 Jan 2024 12:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKvcy4/rKIVn777rIv2HMhZCxIfmWjcA9Z2/sLPpdS3SnMXNhIU8lX7zPb3kdtR80L+Jcl6qQKtFJrEy1doNCexI1nSMSSH0uocnWY1JK+l+pdCBtTp2tvq/9TkqdmFjSLDnP0FcO4JLquLLrs0xQ3GMMsVFmHhvBjoiEHdLNwadMRzKvLFZ1GNLXHy3VJlQGrMmJf3YV5cRMX1cOW844uEvpNIt/aFPIje9jmHEjwFIRoBpBfUVdeN7KRTVwF0Nx3Ft4OP+veE4PLN0Vxof1A9GPMy9zMOT5R4h0WuM+izHPnB4aMPqkRnEPj+FAnByvappGRTfCm5R8L2OAoDOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iisb/YtyfBockZE1Yu5WBuUhGgbAzAE1851VPQP4PU=;
 b=E1f/LyOj9VD4SLEHmvjpNbRECeUWBpbxNHEmwMw5g9IQ84aZ1cHkO4N+fUhHZ42w41jzsCCyyMk1WcWrM/8QTX6vFgr1C3SXZwEFqeI1FXjumldzYO+7M8zXJiDRjj0nH13cgngTH9fTletieZo2WCdCgTPRlUPwXsAWBetGgGY+JWIsrdRSRH5OTsUU8+QUaKcwXpluDUmxCjh/R1qaOwXDvW45hnHdrR4vcxmQQehGBsMx23dfqdF9hYfBDf0+WQPnSa+tAXSlmORmQn/uuB2P9WQVgc/nAY6z8MXd1PP1Zgcq9egsze7TXrjMe2kzt+QJAW4gD1NSTrAP25Kj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iisb/YtyfBockZE1Yu5WBuUhGgbAzAE1851VPQP4PU=;
 b=e1bNtkP+XN8+L05OaHPDGOTZqLBcuoxpnfI+r4bdDG88Ca0od5SypVKfLXboygDqQ1cKyov8B4UxsVhhLU1hLISM3985IewscUIkW63I7o1PR6ran9roa5RefgqVqiIwt4isyY4Nxvq+gDHB/iwXoAiSKHaWkoGhn82SPRxcSYU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7365.eurprd08.prod.outlook.com (2603:10a6:102:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Thu, 4 Jan
 2024 12:42:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7135.023; Thu, 4 Jan 2024
 12:42:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
Thread-Topic: [OE-core] [PATCH 0/7] kernel: consolidated pull request
Thread-Index: AQHaPpw4bLALm7z8tESE0kfzUMXWdLDIwrsCgADW/wA=
Date: Thu, 4 Jan 2024 12:42:39 +0000
Message-ID: <262414E4-7590-4D40-AF48-6E64B741A201@arm.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
 <0e71617a87f786db81fcb971833ad8897c88841c.camel@linuxfoundation.org>
 <17A6FA95DD1732F0.5872@lists.openembedded.org>
 <CADkTA4NpFszvHQ0XXT7JrSW7XoFHU43zjiJiqdNSwgRnxZU03Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NpFszvHQ0XXT7JrSW7XoFHU43zjiJiqdNSwgRnxZU03Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7365:EE_|AMS0EPF00000197:EE_|VI1PR08MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab21420-8588-44e5-8b53-08dc0d22a85b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Uhh4gdPLjDwNHB77EmRgQD2XGBbqisN1/Cq+wnaftf1W+u9qjO1+3Mqlz21hrXilR2EPcxiQw45KsfeUcVfd554PlDHnFntNTTZUTShJ8k+dN8cMFqWUhe2m1shqk4IRvKuShEt3iIDzkVQX5nWUJKoJ7PQYf7NAjGNHeYT0sp/5Ro2gsPTIlUfvRFKmVXFbB6vowM96JMmKytZVsZ7G1siCuS8UPh0+K5ld4LbBKem/N9q84DOeExDa/Fwe5/JKW50/rU0hth8Xv6BCYRRPBPSv6rGTPJHq9Fi93K0XEAhjqDxPnFgp6itBQfle6aGuftvXvvlwUR8g33HChtccU8VYSAryLEJGIQv43VUPtURzGvfXPNXQVr3HeKJth4jbJq8+RJ9TKh1Yv4Hn58tL/UpMJubKD1xG3tMxsynIIfG7XFjsH6SAXGzijwriOqhgyCSyY7+EWWB1fb8Ba3HUJ1nqI4zxfeZhXDWlkUE1jphzSALUn6GoflR5d0vBI8ORbTjKcTp1PJlr1JzP6LdyIcxo974ktEJ5PYcnmUVcEChBD8hVigMUxS+krFWWceAsOSWhmiQy4Z2KxiLvl7ZuYy9CcGczjlxzilGnZQ8IxQUlX5caGPwe5iufQDq6IiCoQSeRjLlOH0NdppPCNJoYnA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(39860400002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6512007)(26005)(71200400001)(2616005)(6506007)(53546011)(5660300002)(4326008)(8936002)(2906002)(41300700001)(6486002)(478600001)(316002)(6916009)(966005)(66476007)(66946007)(66556008)(64756008)(122000001)(76116006)(91956017)(66446008)(54906003)(8676002)(86362001)(38100700002)(38070700009)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E491A4BA44823D40B505E6628DA51AE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	10e0f67e-f569-448c-d3e0-08dc0d22a30f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ndnuXh6qm4rV6z2pefH0j9v388416FOzs6ep91EcXH5qOwaBWXZIZt6upiq36zHMc624JkpeQQDtMSCad0tCF7YIjCUlWszZ/eFYVEL2ZExdkYBzYW5E0ne5A4yCcmRziuMSabTmuEsNUKX/5RlYh22opa5/sNsEf7HJ1HUXffnEumz4I25BzqNvNFGGlDBZ0RRhywhpjJ09xGLSU+DqKQ0VjymwaI/8ohWJs7n96mrvVqSWTPq8Otaa7HKuBmsEW1kjgs58a1iFEThi7obKPKfwynftMHt4YpTNsTz+AMcbIzyoIJWV23AJn/1zr7T+O2TZ18L0a5SRWCION2Gdj24xYixiTT6MnTqyBNKyCJY3h4eWf7RIItmJmkvL+1/FjtCubpGtvkYLgTszNe7f4S3UtqbnSuw2R08YRuHdQBjawGUXFKkGTTJ7jm110VVksjVxPb/aea8TJOVW5hnGr3F9CRLlJanYyr8MKFdESttoqY6GEbrReNm3ETa8/HydlY7RI57do0opURCpUnsKk5hLIBeGJeWMlOuOeEk8isQxMhw6XceGpJsqf8c2/hlCPJZ6E7kvEdy9xg4+LV3UfbcwuI72/fpe4TM/6Tw9l6P5asV3//72aZ05zaW00kCT8mr98qIX44aF3ay+0ZkhS/h68B1yiscnA88cb2GnAbc3dtWpRShJ6GMPukZppki5wGw9Dai5aXH0Rh+AEGt8/Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(36840700001)(46966006)(966005)(478600001)(6512007)(2616005)(6506007)(5660300002)(53546011)(4326008)(316002)(6862004)(8936002)(33656002)(8676002)(6486002)(54906003)(70206006)(70586007)(82740400003)(40480700001)(36860700001)(81166007)(356005)(86362001)(36756003)(336012)(47076005)(41300700001)(2906002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2024 12:42:48.3763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab21420-8588-44e5-8b53-08dc0d22a85b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193319

T24gMyBKYW4gMjAyNCwgYXQgMjM6NTIsIEJydWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IHdyb3RlOg0KPj4+IFNvbWUgaXNzdWUgd2l0aCBxZW11YXJtNjQgcHRlc3QgaW1h
Z2VzIGZhaWxpbmc6DQo+Pj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5
cGhvb24vIy9idWlsZGVycy84Mi9idWlsZHMvNTkzMw0KPj4+IA0KPj4+IFsgICAgMS42NjQ2MTNd
IGppdHRlcmVudHJvcHk6IEluaXRpYWxpemF0aW9uIGZhaWxlZCB3aXRoIGhvc3Qgbm90IGNvbXBs
aWFudCB3aXRoIHJlcXVpcmVtZW50czogOQ0KPj4+IA0KPj4+IHdoaWNoIGxvb2tzIGZhbWlsaWFy
IGJ1dCBJJ20gZmFpbGluZyB0byBwYWdlIGluIHRoZSBjb250ZXh0IG9mZmhhbmQuDQo+Pj4gDQo+
PiANCj4+IEl0IGRvZXMgcmluZyBhIGJlbGwsIEknbSBsb29raW5nIGludG8gaXQuDQo+IA0KPiBo
dHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UtY29yZS9wYXRjaC8y
MDIzMTAwMzEyMjU0Mi43NjQwNzMtMS1yb3NzLmJ1cnRvbkBhcm0uY29tLw0KPiANCj4gSXQgbG9v
a3MgbGlrZSB3ZSBhcmUgc3VwcG9zZWQgdG8gaWdub3JlIGl0LCBkaWQgdGhlIG1vdmUgdG8gdGhl
IHRleHQgZmlsZXMNCj4gZHJvcCB0aGF0IGlnbm9yZSBlbnRyeSA/IG9yIGRpZCBpdCBvdGhlcndp
c2Ugc2xpcCB0aHJvdWdoIHRoZSBjcmFja3MgPw0KDQpJIGNoYXNlZCB1cHN0cmVhbSBhbmQgd2Ug
YmFja3BvcnRlZCBhIGZldyBwYXRjaGVzIGZyb20gY3J5cHRvZGV2IGluc3RlYWQuIFRoZXNlIGFy
ZSBub3cgcGFydCBvZiA2LjYsIHNvIHRoaXMgaXMgYSBuZXcgYW5kIGV4Y2l0aW5nIHJlZ3Jlc3Np
b24uDQoNCknigJl2ZSBqdXN0IHBpbmdlZCB1cHN0cmVhbSBhZ2FpbiBidXQgd2lsbCBzZW5kIGFu
IGlnbm9yZSBmb3IgdGhlIG1lYW50aW1lLg0KDQo+Pj4gVGhlcmUgaXMgYWxzbyBhIG1ldGEtYXJt
IGNvbmZpZyBjaGVjayBpc3N1ZSAoY29weWluZyBKb24vUm9zcyk6DQo+Pj4gDQo+Pj4gaHR0cHM6
Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy8xMTMvYnVp
bGRzLzUwNTkNCg0KTm90ZWQsIHRoYW5rcy4NCg0KUm9zcw==

