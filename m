Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05CAC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 17:17:15 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web11.41256.1702055827200579434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 09:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=79vimFth;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=79vimFth;
 spf=pass (domain: arm.com, ip: 40.107.6.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IU7RnCuNWnauo10CXnhn03AT415/1HHPfubdtrj4oRsIx/3jFveLjtBrTwdRYQ4ZltM3eBuR2y3tylH9zzoRQeWFZMrB1UHydgMUamtWWL4Md+pMKfAflBL8mqWVNvptisEMIqjYE1hapRh4dWgpFtULFFlECKKv8FNTC3scDKOEt4ssMw7S1ybkfQCGkoHn0QwCsOAKoQCr3lUwp6JY4mXO1fdFjbnRn6B7NwDS0Rbrt72p48/VVTlwRr0eghHOGJiMShq3pldVgGSStm//lrsPuDW+OvbErDQxgn32BLyw3/DEI8ePh3v0KkHfwPrivaKDyxBXJEj390Xu5XLi/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3M1S3soLbYi7iWc/Q12UA+VKiVN4gkwpmJoH1UdT3A=;
 b=PHGOoVa4aU3J+Ygp3OOIdHYBGIk5oo5t9Qrz+E3dy8xy+zPTQdQXXWnwcn1fWCiKi1FWgt2kwDiylQkBxB+Z24yQj6vWBCMxfDlyeQSddhQr78g46JCrZ0RKJwTM1D8ozyb1Fae8GtoHOpxcsMJWC7kc7Sy2C4XgYrVQLq227/Yu0juKNIacuwjxa+7kaXR4I4FGyGHa61wIbHgVfFynXVEB+vZqLQ+21YEffKtfLezPRZdkZVHaEcWDOxa1px4eVP710AQIA4dJ+/AIsEHKgHNbrG8Naaw6Bh1aZ/zmZRcK7ePuEjiv8wo+kwMMcLSFlVi52c/P/XBDv+Bb6ylGfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3M1S3soLbYi7iWc/Q12UA+VKiVN4gkwpmJoH1UdT3A=;
 b=79vimFthDLKDaBfDhq8AJk0+kmarZTGXDBBjwSgKYPYaatCh702Rs9DkEgvVIox8ctwByJ3GaZ2YjTmzOgr1HkXvoVwurueH8uCPaoTR99JzgbF9trIw1+gAyXqEvkrLzefgFucYUjtjz+UdkxRbbqAYHSxA9IqDYWsqnlSoib0=
Received: from AM6P193CA0117.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::22)
 by DBAPR08MB5589.eurprd08.prod.outlook.com (2603:10a6:10:1a2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 17:17:03 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:209:85:cafe::ce) by AM6P193CA0117.outlook.office365.com
 (2603:10a6:209:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Fri, 8 Dec 2023 17:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 17:17:02 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Fri, 08 Dec 2023 17:17:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1725ff7812a9f842
X-CR-MTA-TID: 64aa7808
Received: from e5172d49438c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC219A3A-C0BE-4840-B338-4ABABFE69547.1;
	Fri, 08 Dec 2023 17:16:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5172d49438c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Dec 2023 17:16:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqIzwqaFOv1c5s0kYvEyzNcZYog/9WPjJy9PFjFCwrMCnqabWE5aN55SFstKiYBBB0ttfSL+r0JVqIBfZnsJmEURWg3TMTcOUnUutSMoc96HBMqU8tPtJ077tdIbBnbarbrKVvMo5ut4rp7yjGb6LuMwcfHk2NlTTGa2QRaz8kYOBCiCyzD4+2xCvSZvZx4athknZFks3JICmbC2Zf6VI/oxbJM1N6bXnk9vcOLSJ7+WMOVTaFowRFuJwiixn2eg9J1/cAnWtMoUmIC1NikPhFeMd/xKUHaRULwpaEU2wFat4aWJKYimXxx2evusm1KMdg1FpktVDMWW58ZVmRf0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3M1S3soLbYi7iWc/Q12UA+VKiVN4gkwpmJoH1UdT3A=;
 b=Pq302mgVWb1tRvh7X1JfGKj7Ys+untDFD4S3gOi3zw7vmsH4rJxZ+VGMSbc1Y99780xE+Zx5A17O1w2oXwgrRxMQQ/mwXQ+G/CujIPutmq9HXn7wCYYFy7tC3yX46J7AsweIcoUzxsiKkt3HAlr2MEyvDAwWIfI79K2t84A2ceKKb140ODIAETbfAAZe12ru7dSIHTiODMLccnReGizd0kl+oSD6QnZ76WL1IIFv9unAyzKYieT74l6g6b5Ok7iUq/Qzf4/nOucFfeqHd7/AKCyxJMbR3FfNp9DMgCJIab5M6SX2rVmCGtKdoZ49G23oVH3zSN/SqW1HPWSLJaokSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3M1S3soLbYi7iWc/Q12UA+VKiVN4gkwpmJoH1UdT3A=;
 b=79vimFthDLKDaBfDhq8AJk0+kmarZTGXDBBjwSgKYPYaatCh702Rs9DkEgvVIox8ctwByJ3GaZ2YjTmzOgr1HkXvoVwurueH8uCPaoTR99JzgbF9trIw1+gAyXqEvkrLzefgFucYUjtjz+UdkxRbbqAYHSxA9IqDYWsqnlSoib0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7600.eurprd08.prod.outlook.com (2603:10a6:102:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 17:16:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 17:16:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"fnstml-fujitsuten@fujitsu.com" <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [PATCH V3] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Topic: [OE-core] [PATCH V3] cairo: upgrade 1.16.0 -> 1.18.0
Thread-Index: AQHaJ+DXIfdpEZsFz0qB7pvaRXdiI7CfpN+A
Date: Fri, 8 Dec 2023 17:16:53 +0000
Message-ID: <ED88BEBD-DAE2-4C5D-928C-FDE28B5C94FF@arm.com>
References: <20231206010428.1275299-1-qiutt@fujitsu.com>
In-Reply-To: <20231206010428.1275299-1-qiutt@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7600:EE_|AMS1EPF00000043:EE_|DBAPR08MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba36d76-d0d3-4e4c-5ed8-08dbf8117e99
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WtzUXg9k1Ctd1fSpNMgLf3CEMdKnTA55cAnFxz54+vY1pxsv3nDqqRoMjpWBjpFDMjpEPf8BAX29jFccpdKS1pr0YcnthICyzj8S3GkGbqJ6jwaQfsRDo+P+EwnChFSTOFQTeUGUdnr8GeT11u91KQ6e9a/fbPtjF+6tg98xUrBqOL0hnHTTFAIAL7ar+9GNM4nO18JvMKRZLK9PEv3KZpsUmzbzx4igbhtQ52ku+JY6hGIksfy7DZYZ6ptYq017LFg6eXULIh56Lxsht5EFHlm9in/t087U9efHBv+FdOfqG9J6Xdwy0h6gO2rqA7jox6U4pPyLcTNkbS2RwG213F4KWmVnrGl/APFAym779YAa2mamy7DcrNHpNzTkhnWc5Q9s5D3gQ9s/VdmCX1sEMT00ryp5d0i/yA8KjCSPIUQZi4T7YEDV5vxyUg/vuv2X6a32VB2dw6CsreHhCMYhYzsKXJnYJjdb8+nPjWijsBM+XIk+yzz4WL1KscAQrvuqM1AO/KxABqTAGrNwQehnBMspqcWLusWwqockXokRULbWf/KogXz78nvHgA52Hj9fuHHieGnpdEwNB/NzTJDe4qHDwoONQf8tVeuFeguUWJHLq5pZOHTim21hQvS/iVJVCATqz5DSX/o+czpSaXKNJXZoPZHDz6tPzV4jOS6xfbxU8dfTBOEB0S7/OmqVF+Ri
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(122000001)(2906002)(36756003)(4326008)(8936002)(8676002)(5660300002)(38070700009)(41300700001)(2616005)(26005)(71200400001)(33656002)(83380400001)(86362001)(38100700002)(478600001)(91956017)(66946007)(66446008)(66476007)(316002)(6916009)(76116006)(66556008)(64756008)(54906003)(966005)(6486002)(53546011)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6773C81854267E4D8E7C7AB8B743530E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7600
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bdc8f546-5f89-4e06-0e86-08dbf8117949
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jqL1uqurnxQ/pEB4ps9vrrA8FVgpXNVWkfCLtuvtRj4RF0ROCI57+6UFBLPFM57davWNnjAtR9orfWjgfKNtyXVUwk3jPDme/uqpjUi3MX+7gR/6aBoQeKde2zzpwULDs1JJAWRKmeYXk598gRnXeTv9mzcHKWaEWzgCaigKXKY0Z/aYzZbMJbrSF8Z9+PaRgfyeaq8iTyxu5hKlsLh5q1pV/mvFC87vSL1/9+PPE3agKK4K7GbpKUrMMqCPoK57/LVuugP7Fc63AWjh7iYypPvZMboVNboqFGhNPBc55VW35AUAPy8eInUrp2ufQWKecHyg/GJU5YbQb3JMm7mvWxs03FNyXdHfImyEYZw19FG3tHCOLw41jAsc6JDItDcnIF8k38KV4+rli+B2ck34yXO7ZCzuyPm7m86/BE35TBzkhuoGWJ56ugoReHrSUZOYJjR4ZY1J1BZqq6AZs+CsiIWXHre6s/pTxkhRzM3LTPAEtNjo0+3z5G9m8Cvfx8cT8lCxPBFj798g8TVfEs3VnT2XU6Sbfk7mDCvMQP+Nw2foqxT5VyKlB7n8dSVLJBxKyNDK9wXxbVYhuOOOi4eBQtXeiuLgOXFNq2jo55mxd2Bty7V9N+d15cWtzxk7kL1jM5AhECc6MwoQR7YqqmK0tr+6q6BoirOuE8NVP3fKvocVzzLo5g63ReHgiaFIURtYzovuyeZBzveaiskv9uYfJiTweEBO80sg/awmC2T8Nbs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39850400004)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(82310400011)(64100799003)(46966006)(36840700001)(5660300002)(2906002)(8676002)(8936002)(6862004)(36756003)(4326008)(86362001)(41300700001)(82740400003)(81166007)(356005)(6512007)(83380400001)(40480700001)(26005)(107886003)(2616005)(47076005)(36860700001)(336012)(70586007)(54906003)(70206006)(316002)(53546011)(33656002)(6506007)(966005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 17:17:02.4701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba36d76-d0d3-4e4c-5ed8-08dbf8117e99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 17:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192081

T24gNiBEZWMgMjAyMywgYXQgMDE6MDQsIHFpdXR0QGZ1aml0c3UuY29tIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxxaXV0dD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKy0gIHByb3AgPSBtZXNvbi5nZXRfZXh0ZXJuYWxfcHJvcGVydHkoJ2lwY19ybWlk
X2RlZmVycmVkX3JlbGVhc2UnLCAnYXV0bycpDQo+ICsrICBwcm9wID0gbWVzb24uZ2V0X2V4dGVy
bmFsX3Byb3BlcnR5KCdpcGNfcm1pZF9kZWZlcnJlZF9yZWxlYXNlJywgJ2ZhbHNl4oCZKQ0KDQpC
aWcgTkFLIGZyb20gbWUgaGVyZS4NCg0KVGhpcyBtZXNvbiBjb2RlIF9leHBsaWNpdGx5IGFuZCBp
bnRlbnRpb25hbGx5XyBkb2VzbuKAmXQgc2V0IGEgZGVmYXVsdC4gICBJZiBpdCBjYW7igJl0IGF1
dG8tZGV0ZWN0IHRoZW4gaXTigJlzIG9uIHRoZSBidWlsZGVyIHRvIHByb3ZpZGUgdGhlIHJpZ2h0
IGFuc3dlciB2aWEgYSBjcm9zcyBmaWxlLiAgSSByZWFsbHkgZGlzbGlrZSBhdXRvY29uZuKAmXMg
aWRpb20gb2YgcHJvdmlkaW5nIGEgZGVmYXVsdCB2YWx1ZSBhbmQgbm90IG1ha2luZyBpdCBjbGVh
ciB1bmxlc3MgeW91IHJlYWQgdGhlIGxvZ3MgdmVyeSBjYXJlZnVsbHkgdGhhdCBhIGRlZmF1bHQg
d2FzIHVzZWQgd2hpY2ggbWF5IGJlIGVudGlyZWx5IGluY29ycmVjdDogdGhpcyBiZWhhdmlvdXIg
aXMgbXVjaCBiZXR0ZXIuDQoNClJ1bm5pbmcgdGhlIHRlc3Qgb24gbXkgbWFjaGluZSBJIGRpc2Nv
dmVyIHRoYXQgc2hvdWxkIGJlIHNldCB0byB0cnVlLCBhbmQgdGhpcyBhcHBlYXJzIHRvIGJlIGEg
TGludXggZmVhdHVyZVsxXSBpbnN0ZWFkIG9mIGJlaW5nIHNwZWNpZmljIHRvIGFuIGFyY2hpdGVj
dHVyZSBvciBsaWJjLg0KDQpTbyBJIHJlY29tbWVuZCBwcm92aWRpbmcgYSBjcm9zcyBmaWxlIHRv
IE1lc29uIGluIHRhcmdldCBidWlsZHMgdGhhdCBzZXRzIHRoaXMgdmFsdWUgdG8gdHJ1ZS4gIHN5
c3RlbWQtYm9vdCwgZ2xpYi0yLjAsIGFuZCBsaWJzb3VwIGFyZSBhbGwgZXhhbXBsZXMgb2YgcmVj
aXBlcyB0aGF0IGFscmVhZHkgZG8gdGhpcy4NCg0KUm9zcw0KDQpbMV0gaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2NhaXJvL2NhaXJvLy0vY29tbWl0LzUwNDFiNDYyZDA4NGRlODU1MjMz
NjI3NTkxNGQzMGMyM2JmNWRkMzU=

