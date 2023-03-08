Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDBDC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 12:40:30 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web10.5660.1678279223616020070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 04:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lpOqfsbQ;
 spf=pass (domain: arm.com, ip: 40.107.14.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlY4RYmoJHO4UMQLWABJQ1GqFwqClMRe6olz/els26o=;
 b=lpOqfsbQk48VFUmD4GzlE2LS944cFcQ40ynHfTtrmQTp/u5q7XBjRJM0k8GMYDYgeudAtGv3BhL0MV2O6rJNGfi79mSjccqnp/eznpIjldZmLZ+WJKheQxEJcA/c4ggIl58CwGsD4+HtGkRYdAzQak4v/2zNnJE8w/Y5uirxcJk=
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by DBBPR08MB6154.eurprd08.prod.outlook.com (2603:10a6:10:1f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 12:40:19 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::1e) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17 via Frontend
 Transport; Wed, 8 Mar 2023 12:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17 via Frontend Transport; Wed, 8 Mar 2023 12:40:19 +0000
Received: ("Tessian outbound 0df938784972:v135"); Wed, 08 Mar 2023 12:40:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e0c5d2b316a7088b
X-CR-MTA-TID: 64aa7808
Received: from f13355d88dbd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 176A9F2D-245E-4D63-B380-A9DE059EC546.1;
	Wed, 08 Mar 2023 12:40:13 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f13355d88dbd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Mar 2023 12:40:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmOSZJ02DIQh9WTd6Hc2urgh3ZtDGIHpMuZczYtSWrQPLn/PCopy+T507d5odEx8KLj09CratfV8t2x4yze2PIOzjIY8XG1W+Fh+e4GH9eCuWDDM9sAktWUGDrcTwbM7mRuq5YfIO7sSudteSAcVWYUe3rVXpCqdZBs+ezKiOiuiytqLGZ9OU/lq4t9HyJazO+8Cj9kCwkmHW9CabXfRIv20bLB1ontG/qHr7sKFHvoIzfHFEH9fs1C9Dg8mFUR6G+mJg9wgSMZB4a5IVE5KZZtsDCfMtAHDodK8Uvv9LU67RknPipdWHc/4a11OzH2tDY43dbNwLxUO7GX698opQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlY4RYmoJHO4UMQLWABJQ1GqFwqClMRe6olz/els26o=;
 b=DfWlrC43v71EGeZbUrpN8zCWNdae+0EFjrVXYGhEuOvRfKsSGbIAQ+IDfz2DaJQpyS7gjnoJuHS3A6ygoMqYCHlUC0frQnYRNe7tWttHJHxh7jTKJd4yvatnIPGA2d/U7hgwVMgHetATao7Y4E2JIMQh75sCNXsPlVskvUpnhEEx+OBwHQuU/9PEGfUDnEpPiiPadlAXRk3kv3HL2GMBz4vSVNzxXO7+P01FVi+v+SNkhTK1NSw+NApV2HXb6+aUaw+ApCLRfst0laIJ7Mt9/7rDi05dzMkFmrgRzjwGz8YPpe4UyGXWXkJfP9aL9f9XPbBrt2rRbIU1gG9QNnFgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlY4RYmoJHO4UMQLWABJQ1GqFwqClMRe6olz/els26o=;
 b=lpOqfsbQk48VFUmD4GzlE2LS944cFcQ40ynHfTtrmQTp/u5q7XBjRJM0k8GMYDYgeudAtGv3BhL0MV2O6rJNGfi79mSjccqnp/eznpIjldZmLZ+WJKheQxEJcA/c4ggIl58CwGsD4+HtGkRYdAzQak4v/2zNnJE8w/Y5uirxcJk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5459.eurprd08.prod.outlook.com (2603:10a6:208:186::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 12:40:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6156.022; Wed, 8 Mar 2023
 12:40:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python3-ninja to speed up cmake builds of python
 modules
Thread-Topic: [OE-core] python3-ninja to speed up cmake builds of python
 modules
Thread-Index: AQHZUQdhNMHEKiS1FkGlONC4qhEyKa7wxEsAgAANuACAAAIggA==
Date: Wed, 8 Mar 2023 12:40:11 +0000
Message-ID: <A2660F77-F343-463C-81FD-D571202D3F1D@arm.com>
References: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
 <1E9DF585-4E79-46C4-A07D-A56B46F9CB10@arm.com>
 <c01e6137-1b57-4ba7-c60f-479af59e3672@gmail.com>
In-Reply-To: <c01e6137-1b57-4ba7-c60f-479af59e3672@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5459:EE_|DBAEUR03FT025:EE_|DBBPR08MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: c777ba12-40e6-4ab8-f6c9-08db1fd246eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RemkEU122Oyi7chL2KacdwTL+tcXCwASNE7Dxluqo/N1MRVCx5ZdXFOcrbjq64CuBNfwScHHSy80yRrT1kZdVh60bvIFpxhHkKUPYVFVCFAhUVtK7ulbbB5WMjjZZ/tXVrvDD+U7WqR1HM9alj5Vow5rHNpEWgb6IhvhP2W1PD+gB4qxHFmWNkPQaLgXT/SBot7XIM1TgFR5HT0vPoHg1Gj8sSVGPQIEDsSAoi1Oec57PffZpP6LO2yzanTejaf0KjN46CV50ooxt0H+zHUlUaeMvbNpVd2HCIm5UDYZq1fyvf+kcbqUh2KWh4R8Hdi0Se1Gj3iD0pXoKFkc33EHoIm3joWuUjCuM+VDsdxHuNQGARCopPsFFzzbXVj8MKHlYrUK/LE5Qd4gtIkR0Wid948V7zn6hBQ65KSZk6YzCtC0g51F1wpK67fq8HwpSXY2p+Apwny9D3olGxPLyO4ZbDgPtDLEczlQcUN9R+Ne7JOO4NxooJwhhYeRHPyefyewbz6IR+dsw/oOUNImsypZd6fBaq5cV+K4E7MFQU/jQ2gWA7AD1s6vD0DlDejsn16nv36m9c255XmUl+A+OObIlfoHdXa/rg3vqFLRN3Oj2jye1zwBTs1cdZDGcY2h2Yb5mpydAhAHLqQ1EHeX6TuebUcnrsSOkUJ66PjPPq8EllQNZr84YRulA/54cJbfQoCn+GF5alrX0BZGgB1inYEwoTgli591K6NkksxTHeKcTyEEowc7FCUQS5yNvMQpS9kjRjFkZmOuQn37UWsKdKvhfQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199018)(38070700005)(2616005)(41300700001)(186003)(4326008)(316002)(8676002)(64756008)(66446008)(66476007)(66946007)(66556008)(76116006)(26005)(91956017)(6506007)(53546011)(6512007)(6916009)(6486002)(122000001)(86362001)(71200400001)(38100700002)(966005)(33656002)(4744005)(5660300002)(36756003)(2906002)(478600001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B65306BF9A1A4A4893267622DD8C4EF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	68acd5e9-10b1-4cb0-cc76-08db1fd24262
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UG6QPGfjzwqIbVwgjRcUf+FO9fvdRWaiFha4uekA5dc67S9Zlscq2cm82PDs58tJrUWOs86Si/2L41qlWLiyGwno+eUesEOa39ccdLJ0HL1F6oPRDRzm/K0Oz3kqxerBHmgNwKe5P7wHaFvuv3sUPAwpAvWTdko8eCiQRW/KFQwYDL1q2Xcq5yuxyi6FSDKu6+HnT43Wf+ztGbWqKuKsFQoJaVQ4KC7Af6bja59q1IPDcITP8DEReINwVF2VoEbTmU3BJXHlMgR9ZYnu2mak3SZ9Gi49TGfT+afJYqNHFuBW8UaiJCwAJAgNh/wWdlOu5qPh3GXZtNck6O4/V3X9V93Okj15iCTtPrvUGZIjK8hG8xsj246ozQoG5Vv9aTT5PUF9IXMtEYUDVAisu2563U2NQLb/+zzW6G3sOIK6S0rBUNcxDv/qVCTG3ETuV2K9Ok/iRJrA095dg/9G4g1o62lgS8Qz0zK4ltOz4oI/vvYA/vEPFF9E3VgN3X5w+AyDqZFyzmb1yrF6R9nIRGcqsD8CwwyuXA3tnz8d5Bt6JC9FnqGaygcRi6xyXjmXuhw2zb/GdmgKcdU/90fmUBRDxPLFy2rmgTpQNRq53hEE3miH7WX1OXdzVBQ9yuZVPxt+WOOXDaZ7rjjZJp5DDLbL5h90CZXgrlBVByuFrqTlCvmAwlNO/cB1PNBNkWxlZ/rSfNkvE1tY06E3+/t/jRNDP1Mgf9oUdsjKefQRdY0OltI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(6512007)(47076005)(2616005)(336012)(36756003)(86362001)(53546011)(6486002)(40480700001)(186003)(6506007)(26005)(478600001)(316002)(966005)(33656002)(40460700003)(8676002)(4326008)(70206006)(70586007)(5660300002)(82740400003)(2906002)(81166007)(36860700001)(41300700001)(356005)(82310400005)(8936002)(6862004)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 12:40:19.6519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c777ba12-40e6-4ab8-f6c9-08db1fd246eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 12:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178171

DQoNCj4gT24gOCBNYXIgMjAyMywgYXQgMTI6MzIsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpi
b3N6b3JAZ21haWwuY29tPiB3cm90ZToNCj4gVGhlIGNvZGUgaW4gcHl0b3JjaCBkb2VzICJpbXBv
cnQgbmluamEiIGNvbmRpdGlvbmFsbHksDQo+IHNvIGl0IGV4cGVjdHMgaXQgYXMgYSBweXRob24g
bW9kdWxlLiBBbHNvLCB0aGlzIHNwZWNpZmljDQo+IHBhY2thZ2UgYW5kIGFueXRoaW5nIHRoYXQg
dXNlcyBweXRvcmNoIGZvciBpdHMgYnVpbGQNCj4gKGxpa2UgdG9yY2h2aXNpb24pIGNvbXBsYWlu
cyBhYm91dCB0aGUgc2FtZS4NCg0KDQpUaGF0IHdvdWxkIGJlOg0KDQpodHRwczovL3B5cGkub3Jn
L3Byb2plY3QvbmluamEvDQpodHRwczovL2dpdGh1Yi5jb20vc2Npa2l0LWJ1aWxkL25pbmphLXB5
dGhvbi1kaXN0cmlidXRpb25zDQoNCldoaWNoIGlzIGEgYml0IGlja3kuICBXZSBoYXZlIGEgbmlu
amEgYmluYXJ5IGFscmVhZHksIEkgd29uZGVyIGlmIHdlIGNhbiBidWlsZCBqdXN0IHRoZSBweXRo
b24gcGllY2VzIHRoZXJlLg0KDQpSb3Nz

