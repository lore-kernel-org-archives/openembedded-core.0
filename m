Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE0DC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:39:18 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.82])
 by mx.groups.io with SMTP id smtpd.web10.14087.1683103156958984292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WNo0qykV;
 spf=pass (domain: arm.com, ip: 40.107.105.82, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMz/MuDlCKLzIuATx6kU3UPEQ4RKSA/ZjUOYrPSmRi0=;
 b=WNo0qykVxu/Sn/pALl824GZfRTZPlWfBW5pImLMLyfeV+EyouoklglxJ5wPaPddjerZbrA0+ToDRLuaOl14Mq8xHfx5Hv6qe3JdHr25IqU1e9JGJpSXTO0574A0XBqHPNPOGo9vOb5tBfzRKD43nfA6n6rEoeETWPoBksSMEFs4=
Received: from DB6PR0501CA0029.eurprd05.prod.outlook.com (2603:10a6:4:67::15)
 by AS2PR08MB9988.eurprd08.prod.outlook.com (2603:10a6:20b:642::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 08:39:13 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::7f) by DB6PR0501CA0029.outlook.office365.com
 (2603:10a6:4:67::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Wed, 3 May 2023 08:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22 via Frontend Transport; Wed, 3 May 2023 08:39:12 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Wed, 03 May 2023 08:39:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 083fd3c00bff8d01
X-CR-MTA-TID: 64aa7808
Received: from 782b0582948f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0FA76A3-F887-4578-9C8E-1F1DFF6ED189.1;
	Wed, 03 May 2023 08:39:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 782b0582948f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 03 May 2023 08:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4i2EQq5W+OJFMHd1sKyf2wY2f8DUImN8ozb5f1xfGdRHYboON5CL44AixkVUbeAlh56VaSWFhjXkNpA596P/F13b8AiGXiuBKEE+g64rLFBc22nbomXv5Hz8ujbkiRssgP7fuEKH0WD9bBpjssMQzEbHsLX/j3sSWVQuFzWWcjVJ6S3olFYn+tfgTDLUlOW+WDCW3QTujQnaWf8Nz/QwDOzG6hebTrdJpNgE3aTWbSLwYFmLCLR6janp5byQYyTUqkmFsjs3Jf1v6i0pTyATjmlfl5xBgpeAxx0EtVZHvWu0L7AscmfhyNXpITH12rCuzOSdl/SzHRKfT+PhrKJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMz/MuDlCKLzIuATx6kU3UPEQ4RKSA/ZjUOYrPSmRi0=;
 b=OUWfowCF+INC/yVSk4zHLCpgowKQEf0cCb+mIDhJ2O1oSqMa+8PerhW3DV0Q1kkYBIUunIwIVf5WKbujoSy+j4rIzThSiauxCdKRyphVrVUXuS1zoVt8OCZHjJU8zKmO8RSwjFO886qI4WQ6M5YceVsulAPmw1L6Ut56BC8lCSct/73h7GNHZGY73VD1jtMEu1qD54mt3Fy0hZNxRBE7Sn6rigGsPaKPxYPsZKg1A+YHsp5DtJgS2wveH/OqZ+0mLCk8slevwmjrn0HouITwUwGNvPTDnaOODh1Z82urWTRDHZnFzZnAiCcZdoCO3evVzJkMYNJMopHyqKEijMRe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMz/MuDlCKLzIuATx6kU3UPEQ4RKSA/ZjUOYrPSmRi0=;
 b=WNo0qykVxu/Sn/pALl824GZfRTZPlWfBW5pImLMLyfeV+EyouoklglxJ5wPaPddjerZbrA0+ToDRLuaOl14Mq8xHfx5Hv6qe3JdHr25IqU1e9JGJpSXTO0574A0XBqHPNPOGo9vOb5tBfzRKD43nfA6n6rEoeETWPoBksSMEFs4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6120.eurprd08.prod.outlook.com (2603:10a6:20b:299::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 08:39:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 08:39:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
Thread-Topic: [OE-core] [PATCH 1/3] vulkan-headers: upgrade to 1.3.249
Thread-Index: AQHZfTCp9NM+8piwjUadT+czFWGfTK9IOnqAgAAAggA=
Date: Wed, 3 May 2023 08:39:01 +0000
Message-ID: <7113C985-FF04-411B-A1C3-B30337067A6F@arm.com>
References: <20230502195932.2196823-1-ross.burton@arm.com>
 <CANNYZj9hNOKAD2=ZbEc9ywHaU=vR2wVDg999=yGF=oJ46tU1nQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9hNOKAD2=ZbEc9ywHaU=vR2wVDg999=yGF=oJ46tU1nQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6120:EE_|DBAEUR03FT006:EE_|AS2PR08MB9988:EE_
X-MS-Office365-Filtering-Correlation-Id: a588f733-98c5-4bc4-04d8-08db4bb1df2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n4MMGb/RwoXbKx3WUSzHTNGCOzaIj60Q37E4pGAwqNfhi5cXm3okvIohIsF8vYjSsbDVFA0K1IvntqcWlp5q4gD//AMu6uFJzh98vGaCXmr9TjbNFfJsdVV0QqWWvYK9hiiZuAXDMJqdIYmDxeHml5AM72VCWp8e93zjgyuNfW8pMBZOMacox9+TRRx4r3jSJG/B5wGUScqO/MW5a33Q0SuP+kYifD/q3Ud99FwbANIXpbFXL5GZz7aAC4HRt9Yxf2kd68msLsseyFm30rAqZk4QrIS9+4ATrcktlgODLxB5ohvz+5eNQIOM84EIKgDwn9wcJ81U9921Uf9XRevZsX0DYNDaka08WrM4AmDyQgUhW5hzp9M+tB4QE9nqaU+mNYSk3KsKBswXJvtMtS3zUqs9JFqKqGRvyuru2brEN9HHK04/ZobQdOpyw5eGHFnNeq6afulZFQlhEFjz8c138+bdsn69Y9bjfcaP6EZUKmIm0TpypGstG36JkW1zVKhKeUmVMXmK2DwL3Dz8quE5nkponKmrYGrN4cPHgVEousTf72FCBUsKYQg7rb3IpwugheIaqF+biH0n2PgPGhawOa5xnrAHoCE2ocOTzMVS2ZIi6YTOdyksmL5ACABHXYsQzryClEb3d7nwzDoXGzyM2Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199021)(26005)(53546011)(316002)(4744005)(2906002)(6506007)(6512007)(41300700001)(83380400001)(186003)(2616005)(33656002)(5660300002)(36756003)(122000001)(38100700002)(86362001)(71200400001)(478600001)(8676002)(8936002)(91956017)(38070700005)(6486002)(4326008)(66556008)(6916009)(64756008)(66476007)(76116006)(66946007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1742C9DD72CEC43B8B9F11E1C9DA595@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6120
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd605d8f-9125-4896-4598-08db4bb1d852
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cr8KGGEmW4c3ngJQP+qJRGRRsr2SOete7rrm8w8Kwyj0WGdO3V7mNuLnA98u+dtdAZRh4qxlIeJ8W58LCYpxT+VBJ6ijswOgCP+5UWol1m+/X/c44yUn+UCp8PgjszT+rV4vIMigUweCTvfG8YNkwWv8qvgM3aa4j5nan8NHS+7aDq2Yy9npiI8A2D1hcaZLQ8QfDIYFsnpg7SY6Cnz//lp9rkC+9DTVRPUqrVRcVP7pH0faW+bE0CRZiumbj0vc0/PLvWRAnzEuKQ8ydioRfdIaeph7rn8hD/tyWlLidTSYQY6lG2pASuFIUy12VMLnEtRp0GjnIjxFDYjGUzas4UR0w2yteqO5RNpQAO+vlIOarG5IauvFxkbAPhDICvXSubbBLZjVUNrKpoSc4RPlkT8j1jCIJSJtQM5jxa/9RHuRUYXjrbO5ah+br/tk9hVJ+AXTAb1LowyfqwIIEJKJPV2eXywo7E2UJKEE6BsirNwOHGoc7MqCpqYv4uIgFQVXFqm1oTKCuT50zOeLnJYHkxs4m6QneD1ZPS9KcTZSPOl/r3DsuiZthwGZ9FuABOjdtZmH7+A9F6eEwY6Y/fE7WePWWEKhQ/4CBYjwI2FDTikWRt329Oiy6uT9pt1gDplIY+lWMXIf7B2m9EHCtqaGm5wfx2OY6aJufgjTrJuIK0pgqIAFzmqSB5l6X1btV6soyylhKJpJ6+RsbQj73oJSodd7wxq+vVqYzx1jTtSNb+8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(478600001)(53546011)(2616005)(186003)(6512007)(6506007)(26005)(336012)(36860700001)(47076005)(6486002)(4326008)(41300700001)(70206006)(70586007)(34020700004)(316002)(83380400001)(6862004)(8676002)(5660300002)(81166007)(356005)(82740400003)(2906002)(40460700003)(4744005)(8936002)(40480700001)(36756003)(82310400005)(86362001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 08:39:12.8268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a588f733-98c5-4bc4-04d8-08db4bb1df2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180788

T24gMyBNYXkgMjAyMywgYXQgMDk6MzcsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IFBsZWFzZSByZXNwZWN0IHRoZSB1cHN0cmVhbSB2ZXJz
aW9uIGNoZWNrOyB2dWxrYW4gc2hvdWxkIGJlIHVwZGF0ZWQgdG8NCj4gc2RrLXgueS56IHZlcnNp
b25zLCB3aGljaCBjdXJyZW50bHkgbWVhbnMgMS4zLjI0My4NCg0KSWYgdGhhdOKAmXMgYSBwb2xp
Y3kgYW5kIG5vdCBqdXN0IGJlY2F1c2Ugb2YgaGlzdG9yaWNhbCBicmFuY2ggc3RydWN0dXJlLCBw
bGVhc2UgYWRkIGEgY29tbWVudCBleHBsYWluaW5nIHRoaXMgdG8gdGhlIHJlY2lwZXMuDQoNClJv
c3M=

