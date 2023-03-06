Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD14AC6FD1C
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 13:32:04 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.54])
 by mx.groups.io with SMTP id smtpd.web10.33088.1678109521680428816
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 05:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Zq11q4tK;
 spf=pass (domain: arm.com, ip: 40.107.8.54, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s2s29agJ2qPJkKXCELr4gKSCDI0NTUITXM6pU7291E=;
 b=Zq11q4tKby1YbWw7Xfg2NPRYmRVZDnig6n5zGLQfcpHlcY5WUYDbNYmxFyyLiHTmsUgXc0jO20cXLgEOH8t2JnIak7rAjb2X2lt8LlKoTpFSFDIpiolTB0DOf0kgQPIei3i/0KMljZIHis4i5MHNdxPpSLMtNAzNlZkxrVD+CFM=
Received: from FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::8) by
 VI1PR08MB5424.eurprd08.prod.outlook.com (2603:10a6:803:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 13:31:49 +0000
Received: from VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::49) by FR0P281CA0043.outlook.office365.com
 (2603:10a6:d10:48::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 13:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT044.mail.protection.outlook.com (100.127.144.96) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28 via Frontend Transport; Mon, 6 Mar 2023 13:31:48 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Mon, 06 Mar 2023 13:31:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5bcca99996aaa26f
X-CR-MTA-TID: 64aa7808
Received: from 706a165f781d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 261D2AE2-4CCD-4602-B03D-E05A1CE11F17.1;
	Mon, 06 Mar 2023 13:31:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 706a165f781d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 06 Mar 2023 13:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eArmB0gjik/8G/pJzRKzAnMJxLAVbl+e08FZBdqk2iip12ft6ydetLE8somwDcziBs2mLmv3CwqPQpwJaIDHwa+l7ATe3gjz7hM3Sl7PAZjiTEGo8axJYnz5jsdlolXpMOvXnXtQhfvxkRcpra+lTy0HCz01gF/4mTsDGdnTxAGw+gbtA+iDR8BETpSJNcTJwOSBu6c1DqCYlqMdYVRpuOkCJFr1TeL8BJsRDgt0AZ+r1IoZ+kxtB98MVnGD2rLTNHfoD0P9ofikRN2b0oP6UbVra6twAnRaC/+y216ol7XvIBVbmH9L6w4KFvY6jNEoncYIEZefD8MY4Z4g6os09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s2s29agJ2qPJkKXCELr4gKSCDI0NTUITXM6pU7291E=;
 b=lqrh8S+z9oC8aopCcp29r2vWwQEcRjt5rro96srJ2M7RdD7IIspbjQpVc/msA5+w9zdoMrPeZ9R9pslpmGrsvo/JaGGYRlSrh5WzN98wyTPQQ6uXLyqsBpS2IcOgIzIALg39gcjV8YpqduoFOHh9QECJdZvip7IZmpRjYSPf5qot6OKJ95pVE/U0/tQoyQITZBHLG7b6jdSr4yLlcd9nxTvX17w/5DfVe5UStqvNKJc/eK04UXuUC+JwphewZ939cLF6IE7E5C+xtmmyMpQNSYihRfJA5JKspNE6h0irFNdg3QqB0F1/OjX/Sjtjj60joQtRyTbYqM6y2H0hEako6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s2s29agJ2qPJkKXCELr4gKSCDI0NTUITXM6pU7291E=;
 b=Zq11q4tKby1YbWw7Xfg2NPRYmRVZDnig6n5zGLQfcpHlcY5WUYDbNYmxFyyLiHTmsUgXc0jO20cXLgEOH8t2JnIak7rAjb2X2lt8LlKoTpFSFDIpiolTB0DOf0kgQPIei3i/0KMljZIHis4i5MHNdxPpSLMtNAzNlZkxrVD+CFM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9670.eurprd08.prod.outlook.com (2603:10a6:20b:616::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 13:31:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6156.022; Mon, 6 Mar 2023
 13:31:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: OE-core <openembedded-core@lists.openembedded.org>
CC: "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 05 Mar
 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 05 Mar
 2023 02:00:01 AM HST
Thread-Index: AQHZT1qNnitOoPuVf0+yiVEpkrr8y67twT6A
Date: Mon, 6 Mar 2023 13:31:37 +0000
Message-ID: <0AF0F489-A039-4E3A-BA66-C9D8B098AB26@arm.com>
References: <20230305120339.6EC639603C7@nuc.router0800d9.com>
In-Reply-To: <20230305120339.6EC639603C7@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9670:EE_|VI1EUR03FT044:EE_|VI1PR08MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eeda68e-641b-4184-f9df-08db1e472389
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 buITvQ8zbdXfTHINMAcOuCHOciFvst/QIyKXiFK2VMsJM6WKjGQhlU1eOnEbLypKbBhXMgw5UbyuESpsrMLFfz3n/Gsvz92gM3nSbp4ApAkrnM0Q6EaUVRn18uHVJyrl0XKQXpL1yqjfRjPx/hqt8NChtUKJmRhePOCqeZbhN64+sxiaMPDQaLtRmTsK8fhmg3g4py0q1YO3oV2qo5fT1QInMEgAtSyNqcF39mTejr5r28ZdwFLvJ8UcZHw6+phaoPt88zLB5js+DgcfeEPanlMM/xnFpcMFObPXwboTgJdFXFomdS57c1xys6OmXtiBjQm0ohEOs+Etf3spodGrEyS2+ta5wYMRMxCNgiRfrrAz2Ly+sQP+OenJi5wD0yjRlSRWpB/vWCEJbech9zH6cmzDLO75+uwBfvDemuzaA/jIxInC5NhvSTGByfo4sqkpcmmLpHt3fq0SGpv/uUvXG7VVsN9j8KzG7ouCRnrbGzMGGcJLlLyTE908ERi25kupFQ3XGCIht7XTlrZeiW3Clfu+Xrvy/cFZcTAoXkThnHYdB4atey3lSJTxLA/3c2R879/Ca6vht0DAU/yxuv1yxVTGUxUeY0J6/cuOT7j486PPV9AdsrTQ0moHfQWWLqnDLmdvFJqILHy45dBTKQvI5FiXi3PuPp7DWRgyAeYZANBPbQGa+3CSb6EDQ9Ffrpf+hiwo5SK0xktYFV77QAMkvBQrhMHTlMHAcXP0z+0BlgY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(451199018)(186003)(122000001)(38100700002)(38070700005)(91956017)(8936002)(6916009)(66446008)(66556008)(66946007)(41300700001)(4326008)(8676002)(2906002)(5660300002)(76116006)(66476007)(4744005)(71200400001)(478600001)(53546011)(2616005)(6512007)(6506007)(26005)(64756008)(6486002)(966005)(36756003)(316002)(86362001)(33656002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C1A9F213367394380EC4D25EA7230B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e215b6f-f403-42c4-a11b-08db1e471cdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	krN9cELsL2tbFowKde68hh1Pk+CeRXocDnVJVKdoLpg7MPVJ05/2hONjNgkCesbX/FvC750fOVdFb5PVSjyQyE9qDLvCHJ5dANsdq4JURxsxP1HOL61RFOjWhdW7XsXTWBd/seV0/w/rP+PisNhdULuW1eaJzf2HwFDA7MpZv2cGJkfVZlsoQF43dSFI6qyN7sp6sqKILJdAHTH8+Y70neyfxF1Gz4Q17flhY7xw/26IX2CWr6uXF23HWqTvN8qgobog388SH+uUOPmCFjhJbNGW5rEYnpUSaGwqL+Ie4xenSxjQV4xoHQX2WI7cJzKEd1amTpMXxomZKIn3uOdqerZ0kaiECIHWeShdgll79FnrbKd0aBVyDWG9ROMKC0eagHLSjlVNn7al064O+dlev+DZWwgcM+JlimXJLu5fnsBzT7uQtbl5JaZqkdTWSKZbtUAwkiWPcnBmkfezWiCnoMzkvORxPz6X7l6bYiicPKevvNmcqL9oM/L/dAWJWL2FOiiaL8yjTP2cB30wnkShHY/bLAkLMKI2CuICL1C3dZ48l5o8NyFLe5qXJqLHb/AMWG1WDMzpi6ZBaFdOxPuHEzlgE5/0/rJuRkIFb2Ag8AritF6Gsk1Fge1oAQlqoysMMKny/i0lXk9OPrYvp1y9ECN4S4nhDmkALOw3Xci4id9loST4mXSjUABKA5E7face
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(186003)(81166007)(356005)(8936002)(6916009)(36860700001)(41300700001)(4326008)(8676002)(82740400003)(5660300002)(70206006)(70586007)(4744005)(2906002)(26005)(47076005)(478600001)(2616005)(107886003)(53546011)(6512007)(6506007)(6486002)(966005)(336012)(316002)(36756003)(40480700001)(86362001)(82310400005)(33656002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 13:31:48.9719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeda68e-641b-4184-f9df-08db1e472389
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 13:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178071

T24gNSBNYXIgMjAyMywgYXQgMTI6MDMsIFN0ZXZlIFNha29tYW4gdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPHN0ZXZlPXNha29tYW4uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3Rl
Og0KPiBDVkUtMjAwNS0xNzk2IChDVlNTMzogTi9BKTogbmN1cnNlczpuY3Vyc2VzLW5hdGl2ZSBo
dHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMDUt
MTc5NiAqDQoNCk5vdCBhY3R1YWxseSBhIG5jdXJzZXMgaXNzdWUsIGNvbnRhY3RlZCBOSVNUIHRv
IGZpeCB0aGUgQ1BFLg0KDQo+IENWRS0yMDE2LTE1MDI0IChDVlNTMzogNS41IE1FRElVTSk6IHNo
YWRvdzpzaGFkb3ctbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAxNi0xNTAyNCAqDQoNCkRpZmZlcmVudCBzaGFkb3csIHBhdGNoIGlu
Y29taW5nLg0KDQo+IENWRS0yMDIyLTMyMTkgKENWU1MzOiA1LjUgTUVESVVNKTogZ251cGc6Z251
cGctbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5J
ZD1DVkUtMjAyMi0zMjE5ICoNCg0KVXBzdHJlYW0gaGFzbuKAmXQgbWVyZ2VkIGFueSBmaXhlcyB5
ZXQsIGtlZXAgdGhpcyBvcGVuLg0KDQo+IENWRS0yMDIzLTI2MDgxIChDVlNTMzogNy41IEhJR0gp
OiBlcGlwaGFueSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxu
SWQ9Q1ZFLTIwMjMtMjYwODEgKg0KDQpVcGdyYWRpbmcgdG8gNDMuMSB3aWxsIHJlc29sdmUgdGhp
cy4NCg0KUm9zcw==

