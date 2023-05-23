Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D1DC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 17:06:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.67])
 by mx.groups.io with SMTP id smtpd.web11.3126.1684861617975525191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 10:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4vHTSl0V;
 spf=pass (domain: arm.com, ip: 40.107.6.67, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+YX+dpkdCUHZuhSfXf9K6LIBeVGvC2jXUMlySd8fYI=;
 b=4vHTSl0Va3D0nPAbxhhHIh/V+eog4JLBd0IST5Yg1/g0eEHzQEMb9oolAlftn2iR72BSYn/AHAGEgTcATSGJrcQjs+ENrAoaRnIvs68YokkdxswiQcMz8hiRNlyJbJsT83YYBLN6fPFBvyJHgCnMNbMc7jp8Mkcb1rkHpEJEabM=
Received: from AM0PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:208:14::31)
 by AM0PR08MB5475.eurprd08.prod.outlook.com (2603:10a6:208:188::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 17:06:54 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::6f) by AM0PR03CA0018.outlook.office365.com
 (2603:10a6:208:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 17:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 17:06:54 +0000
Received: ("Tessian outbound 3570909035da:v136"); Tue, 23 May 2023 17:06:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc1c2bf357de33e2
X-CR-MTA-TID: 64aa7808
Received: from 7061e7c9b92f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46FF6DA6-1435-4768-9D5C-DB90085AFD45.1;
	Tue, 23 May 2023 17:06:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7061e7c9b92f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 May 2023 17:06:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKTYwkuEjmQ1ix4RD/Rm1V+/YUbQaUTuATETDDRHibq/u4GyuygWG84Vrf7FoknRJfKSOB22v62hw+3mRR0SEJWkSyaHiRyCyl4IFiWeoiXAX7jjxBvbpnLgQQRE6KTwCwZ4e90Le8v61aSEYydRR86Qg8/mBLON1RUdfA0MjCDA4yThI1q0DodhjtWOgEL4ZGIfQiGlv5/W9LxOF1jhqyXv0652kOjuFRFRmJlF30viywcAPoK6Jjyc2gbMwJN2CuDcIZdCmcVt+DbRVeED/PNCgAHvbht2REAX5YKOj7Z9IE3+nMwpVUsPoDub6mfyCLxI2diVUCK1lAGysBcTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+YX+dpkdCUHZuhSfXf9K6LIBeVGvC2jXUMlySd8fYI=;
 b=e6rL33Nw0dSl7M3e/HUTkHoi0PJeIvb2GR0ZqwCj/rCSvSfhPc2IiSsXxhxwGnmKeltT5iT7PSF4u4MyXUcOJIAVjiE0mKievnVPjjW7kvsFOUh6VYSQ8w3kvRY8AY2s4F5F+DLwRlGCAC1VbSS2NOcOYGeJIh28q5TrgtFLinBTAHM/K9gt83FvhEHZGCSVxnNNXw9h0IQsMtbu7uZn4bB3G60nulk3H9y5WPGCYLSiQ5zN/c2+386j1steiSaQbVwK/nGeWaWOjeLUeCYVcGUQhRgjMlGTcqsmEWd3AZZtEoCPA5Tn2QT1nfG0GBbTbZVXnV/W1AsWyqC8IZbHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+YX+dpkdCUHZuhSfXf9K6LIBeVGvC2jXUMlySd8fYI=;
 b=4vHTSl0Va3D0nPAbxhhHIh/V+eog4JLBd0IST5Yg1/g0eEHzQEMb9oolAlftn2iR72BSYn/AHAGEgTcATSGJrcQjs+ENrAoaRnIvs68YokkdxswiQcMz8hiRNlyJbJsT83YYBLN6fPFBvyJHgCnMNbMc7jp8Mkcb1rkHpEJEabM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5709.eurprd08.prod.outlook.com (2603:10a6:800:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 17:06:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 17:06:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Thread-Topic: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Thread-Index: AQHZiNzM5otCvoyuyUS6G/cu21+4U69oIBaA
Date: Tue, 23 May 2023 17:06:35 +0000
Message-ID: <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
In-Reply-To: <20230517162906.2395999-1-peter.hoyes@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5709:EE_|AM7EUR03FT003:EE_|AM0PR08MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bf2db2-a397-47bf-2f71-08db5bb01bf9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SEXVA2+waODnFsKjweiTIZA+VrbG7or0H6FmiJJs9XyajiaTJ9ELQGzgwHNbSMZOocUZjTiraO9TYE+nyEkmY/rKeiwMYxrdSZTXKsTrapTPA2utuVPudrrAqRWPWxXT0aLwkXlpYNmrYmyzsYfgOY7kygKhUa9bIpwNOLPPuA0XuNztNa6HrGZodE5o3nQ3SeoIql+t7OAHNj412Gr5Wfk8qx0UGeueDf5SRXQIud0c7xCrfE3gwYpGevZ+A+oRaZDH26BqANPz2O5kaqPNo7U/BUGrHCPr0us/q8D8B0jC+WGpe/IrxzfMTGGFxwmuuZoD33ilUok17xFn785OgWsfsGf2M0fOJipwhuOPG0fQwLRJ/SX0cqc1d2ocjbYtgQmcCJc9cCWPFj8bjgBLmmu6fSsACbXSNgVS/32ffFqZaDPX//edjr7g7HVb7wKZvvdFRSKlABeV0DjjR8jA4N7r05x2GWDNgShZfz7D3ENWlzodclSZ+lkoaUtIxxSP2HSRRvRlUu0/mrSfT/3nFJkqa0Uu8WxljagL6VRcG2I7KlaWhpmNq/ZYNI+xtrwo1VWPf/VNzZtQP90fwz2wOrsphWZHInLlnA3jqjMhKtcW69U6VnbUcxrW/MPJ5cCx5wdtSk+eb/8GgJPFrUI73w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199021)(316002)(71200400001)(6636002)(38070700005)(66446008)(4326008)(66476007)(66946007)(66556008)(64756008)(76116006)(91956017)(478600001)(6862004)(37006003)(8676002)(8936002)(6486002)(86362001)(41300700001)(5660300002)(38100700002)(6512007)(26005)(36756003)(6506007)(33656002)(122000001)(66574015)(53546011)(186003)(4744005)(2906002)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B54B614303F514AAEC961C3BED9EC12@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5709
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3461c2fc-6157-4859-fc69-08db5bb010b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3VTmnBw7v3sGxiFtRkWL4S4RYvH84fUBgVJnZZOoUWwiX0wE9oJWFYZieKlupotGfvPcGMjs8IW6OpXffdvmJWXc0bumn9d3yGrbFf/w+OxtLr6E4IXjuLI12Uy7loyDtUSut/53ETWH3wmgq0kSmUt/OvvqR31KGpKpO2xeIx97cUXLnXUgR7xxAZnH6vB5wVjxKhVadc3kVgRUhzcbqB3/RJFojgaJWfPVftXK6or9poSWFMVfJMrY1NE6WuDeliYnnjbO9+U8dTP6vyNmP148JBkle9wAWUFRSBwTPoqMjDcylbYJK+Zp29WuHjX096v0zDN1PiHScEw8XDS+WRbhCrck47PAN9rsgAsyv75B6CJWFL/a6TSA3T4msppPv4t3R9Ea2W7tVooIGq7pqINkO0/AsgAtkLs+RKkosGgAW2B7Mdyuq76HbhkeKmP34JbMeHBw4cxBG3RIxh5uRlt1Dc/52U4JwCdA9bY9+PSbE6SiS6onnJwxTGbxyaY/DwigT51vE7AiqUsP7CBTVEhWRE38IjuSFcinUpEhNMxj9HwaZ7UJc+adrwIj73ZmuzhoeQMnozSxzBiwfpjG2XaBeJyTWKF3pD4HK8AdmbDL2nvSCP2qaQKb5fRb2tTVb0sKXK5743C9otrK06WpicHS/pvh5X05t4BA04azbwIuBH0gW2nGYD8LtM8yIKwZII46QdXXPpDxlUoaHJUnc5fcalVWP+eYW9trjlfoX79NTX4MBD0QEicWDjWiCVCr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(82740400003)(86362001)(70586007)(70206006)(478600001)(37006003)(356005)(81166007)(36860700001)(66574015)(2906002)(47076005)(6486002)(4744005)(2616005)(36756003)(336012)(316002)(4326008)(6636002)(8676002)(8936002)(40480700001)(53546011)(33656002)(26005)(186003)(6862004)(40460700003)(5660300002)(6506007)(6512007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 17:06:54.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bf2db2-a397-47bf-2f71-08db5bb01bf9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 17:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181653

T24gMTcgTWF5IDIwMjMsIGF0IDE3OjI5LCBQZXRlciBIb3llcyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIuaG95ZXM9YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gVGhlIHRlc3RkYXRhLmpzb24gZmlsZSBnZW5lcmF0ZWQgYXMgcGFydCBvZiB0aGUgcm9v
dGZzIHBvc3Rwcm9jZXNzDQo+IGNvbW1hbmRzIGNvbnRhaW5zIGFsbW9zdCBhbGwgQml0YmFrZSB2
YXJpYWJsZXMgYW5kIGlzIHVzZWQgYnkgT0VRQSB0ZXN0DQo+IGNhc2VzIHRvIGluc3BlY3QgdGhl
IGJ1aWxkIGVudmlyb25tZW50LiBIb3dldmVyIGl0IGlzIG9ubHkgcmVnZW5lcmF0ZWQNCj4gd2hl
biB0aGUgcm9vdGZzIHRhc2sgaXMgb3RoZXJ3aXNlIHJldHJpZ2dlcmVkLCBjb21wbGljYXRpbmcg
dGhlIHByb2Nlc3MNCj4gb2YgZGV2ZWxvcGluZyBPRVFBIHRlc3QgY2FzZXMuDQoNCknigJltIGFi
b3V0IHRvIHJ1biBmb3IgZGlubmVyLCBidXQgd291bGQgaXQgbWFrZSBtb3JlIHNlbnNlIGZvciB0
aGlzIGZ1bmN0aW9uIHRvIGJlIGEgc2VwYXJhdGUgdGFzayBpbnNpZGUgdGVzdGltYWdlLmJiY2xh
c3MgdGhhdCBoYXBwZW5zIGFmdGVyIHJvb3Rmcz8gIFRoaXMgd2lsbCBzdG9wIHRoZSBleHBsb3Np
b24gb2YgdmFyaWFibGUgZGVwZW5kZW5jaWVzIGNhdXNpbmcgcm9vdGZzIHRvIHJlLXJ1bi4NCg0K
Um9zcw==

