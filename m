Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCA5EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:47:36 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.70])
 by mx.groups.io with SMTP id smtpd.web11.16424.1686757654298609683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6WV/xZKG;
 spf=pass (domain: arm.com, ip: 40.107.6.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsUOVF1+DSSi/kXF2SIa0Sw0/EOjFWpnAAHsrvALHLI=;
 b=6WV/xZKGh/PedD1KF6drW4XWTs5s/xv4HzmkRADDsXGf/1GEnxfMhQv4JWMZdKTRvbNihFnB/reQEZZPlDtYsSVqt5dxps/EpWez8gfoCY7+WCzfPaXfh2Chopbr1fySoImhQ6zI3g+CR2QH5/UBPNAELi1zWgdUWG1QjXh8RMA=
Received: from DB6PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:6:2d::32) by
 AM7PR08MB5526.eurprd08.prod.outlook.com (2603:10a6:20b:108::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 14 Jun
 2023 15:47:30 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::6c) by DB6PR07CA0022.outlook.office365.com
 (2603:10a6:6:2d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25 via Frontend
 Transport; Wed, 14 Jun 2023 15:47:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 15:47:30 +0000
Received: ("Tessian outbound 3570909035da:v136"); Wed, 14 Jun 2023 15:47:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37103f019df72009
X-CR-MTA-TID: 64aa7808
Received: from f48fd6e5bfca.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 989B1029-85BC-4CDB-B791-973997A882DD.1;
	Wed, 14 Jun 2023 15:47:24 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f48fd6e5bfca.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Jun 2023 15:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlcW9OAlzrwqGdTnN0ZaLI27p1KNgs5Tzhm27umgsICZFTLZCanRpjp0kVA96U9Oo1M03uBBxyE9N/9z6exHOc69hfqXA8SgYnuaJFlkC1fTIbTb4Q7KE7urKjfNIhDw2HrFq1Ddixi4XbGGCabQAQVymuAGN+daifLdb8OQCE3+IU/4c6tItzFKTr4oRdaYq0gqT46J6QGcJYt27mrJCvNTW6UH536aBKc+9peatuHFNi9ftygKri5kjWtwLFaQgj36+4TbZGKFXpPbgj1YzZVBqggosEw4G0D6kR7bSlon65NoCgVLr27lsJ3yy++fY5c43dbb5CY65C28Y1fF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsUOVF1+DSSi/kXF2SIa0Sw0/EOjFWpnAAHsrvALHLI=;
 b=HFV2sxGZVpD9vAsg2KkJ1yxu1+XlOFOcDYPyDAK8ynC79dE781BQACNDwJS57GUTw1eU1Ujx6QQLRIiM8osufEdnWbtn01W+v0vNN9BDo29Dw/6CKo3x9OKE4MMOqewLQLgL9Mh5jn/6nxYRmWWpuBsKn44BmXWH04soXweIITkRhdBxSLjfsMhXdajuNG19sCneYMGprpRcuV+vse/uiRm1w/JIGFjQERciNRAnDDzlueH8mXoAPYCDTsc3jFToTuFLeaqtOBvpBaWahaTvlWit7NYnlLZSz1I88De/JQ1jRb22AgTNB2hPjSpBwz8UqBoyOrNyb+KYuM1cFlwxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsUOVF1+DSSi/kXF2SIa0Sw0/EOjFWpnAAHsrvALHLI=;
 b=6WV/xZKGh/PedD1KF6drW4XWTs5s/xv4HzmkRADDsXGf/1GEnxfMhQv4JWMZdKTRvbNihFnB/reQEZZPlDtYsSVqt5dxps/EpWez8gfoCY7+WCzfPaXfh2Chopbr1fySoImhQ6zI3g+CR2QH5/UBPNAELi1zWgdUWG1QjXh8RMA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5630.eurprd08.prod.outlook.com (2603:10a6:800:1ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 15:47:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 15:47:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
Thread-Topic: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
Thread-Index: AQHZnjj7PNEoTmExa0yCtxHtKgPo86+KUoeAgAAWh4CAAAl1AA==
Date: Wed, 14 Jun 2023 15:47:20 +0000
Message-ID: <ADAC057F-4754-4451-B00A-FB1090212A72@arm.com>
References: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
 <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com>
 <CADVatmN=x=5VAUZUU1if+SrX19dg7h-pBiD-B7u1PrX7wHOnBg@mail.gmail.com>
In-Reply-To: 
 <CADVatmN=x=5VAUZUU1if+SrX19dg7h-pBiD-B7u1PrX7wHOnBg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5630:EE_|DBAEUR03FT029:EE_|AM7PR08MB5526:EE_
X-MS-Office365-Filtering-Correlation-Id: de6efd00-d3a2-4567-acd3-08db6ceea9b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aLiY0CMJdPEUi2K4HO+AIroRHun1/G9VuHT9wZSllaWddq2L9aj9NvWrjNj5D+4p/f4CtSJUaVGl6uZ7unZpxKA+3qY3u3YIcD3TnHCQ0xiHx4NfLEz7D2GW7NIPyJ0d/VEaN4WfGe7ao0wc0hBgImXhcXu2xL+X2jQXRxxCkqO7d4Mjhr8sGUfVFmPR2ju7TfYVDrE9j/8/zpralTS7gGj9ZEb+5wlePxOQdAhw9mSJOFSPWHGmqkP8uCUnHChebKENNcuj4UAukLdub7+pkTKVp320/dhLuCyZ92EFB8aA5hkpZubgObqhEBDfrYtPuxosnbl74ltncKJzmfp4wX0ciEQp+2FtGy6v9MYDGLOlip85ksPFNtUDWlLbS0nk/UXMSV+ib6Uj1NNBHT5mtnMg6kP6CYo3znDvoRwUQ+DwlKyaBDOoxfEciZ3JaNuDnjBsO0P6C1dL36AtupINJxQOHBFaob2DXD1vGjmEkAH/EpFKnh4utgoP8Lf7aIJvpUFNl9UILPBFI2hHZOuDDPghcJc/K25yG4RhHc3Kh7Q1DThv/GnMXEogA8fCeT5W6DdlGD7ofhfVAZ9fKIrzrUMQlGaXjVYkil50Vb1TGMEUlp73oYRzxqiJ52GxVfYDUomaFOvvOxgEOhvUaTi3pQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199021)(66556008)(91956017)(64756008)(66946007)(66476007)(66446008)(316002)(71200400001)(76116006)(4326008)(6916009)(478600001)(54906003)(86362001)(33656002)(36756003)(38070700005)(6506007)(53546011)(6512007)(186003)(26005)(2906002)(8936002)(8676002)(5660300002)(6486002)(41300700001)(2616005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B20AACDF7D18C4685D73CF69CA321F1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5630
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89f361b0-c542-492b-b125-08db6ceea3aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ms7QRKe7ZbtnfjdQx0csmlnU7Rb9YPR0C9aR4HX1vIOwA6jACAaZA5d/r+y6H7mvW2lFvJDcy8YL52WLR/VialVUhROgOip8iKzlR/UbXMnn1u/kr5W1icXex9OGTYvXFuMWDibWMAwRKl9qGqjED/ulzwR+yrAgdAgGxfhxbqG7Y6VlIB+1v7XDsTBJKSaM4CfMb0XspnLG7aIKRm5vlqRhXAfqc5rU9Lsxs83LuEPG5nnS1tTbLJ4wTrztpgg7Rq4qnIRO3h3/pD5bJTj2OVkRKMtZMAl9L5QweCTJt6kvncAp5AUH4ESDgkiPfTt3Ii54Gu7I7L27lt4TEnb4KG9K6IIJ9OEK8awHAlP8LZo9+c4oG0ZDR9BxVDPqYlJXURSCiUfxScg3OX8TKT3XfA6xPqo72c5ImCbFAfdPmWfrzit11mUGCstoO4+KptkIqskpOjm4gzmO163njnTXvpaAFAqSA12GpDrNXnGDdgtWUUjs9YCxGSWhLeDAwm0sMPhzdvl/mzhhaPNsKlQ2YfiHHUnAWyWejSiY629hoz/YjZ0xjiN4lqXgeqBY2+swlJxOvTPeCQY2C8ETJA5o+3bjqSgr4oFluoLAmInO0vS1DSJW7LZsSP6/A0WcPSSee1tmQFDsexRXgsNgMXcteNNbzY4uHPSSR6anMr/gLqj1Q1xWYpyJncRx0I40QPTCH26pEvQLiQbDPr9H3wOju/JieUSHZiJ1Q77q9xpwEtk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(70206006)(8676002)(8936002)(36756003)(5660300002)(6862004)(70586007)(4326008)(54906003)(478600001)(40460700003)(6486002)(316002)(41300700001)(40480700001)(81166007)(356005)(336012)(82740400003)(53546011)(107886003)(6512007)(186003)(6506007)(47076005)(82310400005)(36860700001)(26005)(86362001)(2616005)(33656002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 15:47:30.8132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6efd00-d3a2-4567-acd3-08db6ceea9b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182820

T24gMTQgSnVuIDIwMjMsIGF0IDE2OjEzLCBTdWRpcCBNdWtoZXJqZWUgPHN1ZGlwbS5tdWtoZXJq
ZWVAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhpIFJvc3MsDQo+IA0KPiBPbiBXZWQsIDE0IEp1
biAyMDIzIGF0IDE0OjUzLCBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4gd3JvdGU6
DQo+PiANCj4+IE9uIDEzIEp1biAyMDIzLCBhdCAyMTo1MiwgU3VkaXAgTXVraGVyamVlIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxzdWRpcG0ubXVraGVyamVlPWdtYWlsLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiAjIG9ubHkgb25lIG9mIG9wZW5zc2wgYW5kIGdj
cnlwdCBjb3VsZCBiZSBzZXQNCj4+PiBQQUNLQUdFQ09ORklHID8/PSAib3BlbnNzbCINCj4+PiBA
QCAtNDEsOSArNDIsMTMgQEAgZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4+PiBpbnN0YWxsIC1kICR7
RH0ke1BURVNUX1BBVEh9L3Rlc3RzDQo+Pj4gaW5zdGFsbCAtbSAwNzU1ICR7U30vdGVzdC1kcml2
ZXIgJHtEfSR7UFRFU1RfUEFUSH0vDQo+Pj4gY3AgLXJmICR7Qn0vdGVzdHMvLmxpYnMvKiAke0R9
JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4+PiAtIGNwIC1yZiAke1N9L3Rlc3RzL21hbnN5bnRheC5z
aCAgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMvDQo+Pj4gLSBjcCAtcmYgJHtTfS90ZXN0cy9zc2gy
LnNoICAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4+PiAtIGNwIC1yZiAke1N9L3Rlc3RzL2V0
YyAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4+PiArIGNwIC1yZiAke0J9L3Rlc3RzL3Rlc3Rf
c2ltcGxlICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPj4+ICsgY3AgLXJmICR7U30vdGVzdHMv
bWFuc3ludGF4LnNoICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPj4+ICsgY3AgLXJmICR7U30v
dGVzdHMvdGVzdF9zc2hkLnRlc3QgICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPj4+ICsgY3Ag
LXJmICR7U30vdGVzdHMvb3BlbnNzaF9zZXJ2ZXIgJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMvDQo+
Pj4gKyBjcCAtcmYgJHtTfS90ZXN0cy9rZXkqICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0KPj4+
ICsjIE1ha2VmaWxlLmluYyByZXF1aXJlZCBhcyB0ZXN0X3NzaGQudGVzdCBnZW5lcmF0ZXMgdGhl
IGxpc3Qgb2YgdGVzdCBmcm9tIHRoaXMNCj4+PiArIGNwIC1yZiAke1N9L3Rlc3RzL01ha2VmaWxl
LmluYyAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4+PiBta2RpciAtcCAke0R9JHtQVEVTVF9Q
QVRIfS9kb2NzDQo+Pj4gY3AgLXIgJHtTfS9kb2NzLyogJHtEfSR7UFRFU1RfUEFUSH0vZG9jcy8N
Cj4+PiB9DQo+PiANCj4+IEFzIHlvdeKAmXZlIGNsZWFybHkgYmVlbiBsb29raW5nIGF0IHRoZSB0
ZXN0cywgd2h5IGRvZXMgdGhlIHB0ZXN0IHN1cHBvcnQgbmVlZCB0aGUgZG9jdW1lbnRhdGlvbj8N
Cj4gDQo+IFRoZXJlIGlzIGEgdGVzdCBmb3IgbWFucGFnZSBzeW50YXggIm1hbnN5bnRheC5zaCIg
d2hpY2ggbmVlZHMgdGhlDQo+IGdlbmVyYXRlZCBtYW4gcGFnZXMgaW4gdGhlIGRvY3MgZm9sZGVy
Lg0KPiBjb21waWxlX3B0ZXN0X2Jhc2Ugd2lsbCBub3QgZmFpbCwgYnV0IGFjdHVhbCB0ZXN0cyB3
aWxsIGZhaWwuDQoNClRoaXMgaXMgd2hlcmUgSSBzdGFydCB0byBzYXkgdGhhdCB3ZSBzaG91bGQg
YmUgdHJpbW1pbmcgdGhlIHRlc3RzIGFuZCBvbmx5IHJ1bm5pbmcgdXNlZnVsIHRlc3RzIGZvciBp
bnRlZ3JhdGlvbiBwdXJwb3Nlcywgbm90IHRoZSBjb21wbGV0ZSB1cHN0cmVhbSB0ZXN0IHN1aXRl
Lg0KDQpSb3Nz

