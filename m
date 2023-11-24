Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E650FC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 16:21:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.75])
 by mx.groups.io with SMTP id smtpd.web11.140336.1700842907083214679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 08:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oheph+dG;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oheph+dG;
 spf=pass (domain: arm.com, ip: 40.107.22.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mufsyGd7xtuho2qqZicRRDcb2hIh5kFfhDR4Zyc98/peuAc2+/maDGMQ+PJiigRdn8kBawS7lERDvt7uAVVGSE7j0/5/aA1YsMk7R+uMT14Qn0925TNuPios2TtWR1M2MZNpVcFfa3noKcJMSu6piMZggi4+lprXqN4LrxnbBgyb0/XK+fBZdLJPEHrKTuSw6I9FK3eYt+w8b5YzdH/cVrJgRCfNuGQzD4g5u2sMFqVWnuTUziA8VFlZrEAQKSGu0R9saEwL+MbWdKd3jwal3MjlLOcxjSnOVOqKCz4yVHcF0v2sau5r5e6mvJLW4jzbt3i3wTNQXXN9qGyxSehghg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clhq3EMSZ++Y2LqirzDNfxoRkZa10m6FvhA3Ka7fYiY=;
 b=lniuQW4kcr1oPYSJ+TJMXN/n7qySTB+kCrB3g18dJgOEocp0Cgyi3aavnLEJavzuKARZmSxtGFeax9UqFiRfNMotqne3NfYITV5ofIEuscsqtGIWyiH5Xd2sqrDVR2Nc+U4y5iPNf+G12PC6zQ4a5Vqftw9mKY6eb19O2490KVfaD//l3ZpKuM8qC5DShvV9V2NLdJJLoX/pirGPIwh4EoGaMqP7+1fmFj3pqu9pi871iOb3Z+0/dWNjzWJqn80ItkN0V66KQTczRnCN10s1IvF0eLg1BS74RlkTYNmY3utu1EQV19786LmTlqXcWP87W4gm+8mULnHN881/OcxB6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clhq3EMSZ++Y2LqirzDNfxoRkZa10m6FvhA3Ka7fYiY=;
 b=oheph+dGDrYTY29rbBnjgng1KCZS+W1A/xeNq+4MXxgv2plD1zsVCT2tRjeIJeqMpoV2tRjEkHMrEsduTFCuX1yhLRxx4tBF+qKup+zJjy3Wrspik+pwcgmJgs4AIxBuk2D5k2z0UFI0h3nE7uoVPbOGVo55MZRkhKdMMYjziDo=
Received: from AS8PR04CA0126.eurprd04.prod.outlook.com (2603:10a6:20b:127::11)
 by DU0PR08MB8398.eurprd08.prod.outlook.com (2603:10a6:10:406::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 16:21:40 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:127:cafe::64) by AS8PR04CA0126.outlook.office365.com
 (2603:10a6:20b:127::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 16:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 16:21:40 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Fri, 24 Nov 2023 16:21:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be832cc10886d750
X-CR-MTA-TID: 64aa7808
Received: from 743267c5b951.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A4DC67D-B59D-483C-B1DB-5AD9CD4690F3.1;
	Fri, 24 Nov 2023 16:21:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 743267c5b951.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Nov 2023 16:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n92bRAgcZwbhtpSkIi22dD6okeVbYMQjrWPoNk57Jb0yx/B5TCuhX/yEzaecoPEuSoYcrC17WLAjxaeDguQiZkihh8HTlLPnZdrGkwy+Zz6ypyCOniD7Qr4AU7CbmeaP6pbuPAQ5jbuFF1p8fqZPvjRDSmB5rGsPrmWz9Tu+rpWFGdyQVjpeNCr78PkTpUES0eVPI6ChSmMPtFHKTfR7I2Aw6H0ShyyKkUsuMTkjUY3jTG3LrqemhVoPYnXVKKUMBvjxPYkz3Ql27WDBeYltAwDXK6bj5giCpcIk51t2/LRIwx87fojfJaAPh9ZWJKv2clCs6jPh7QpQYGv6NPk6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clhq3EMSZ++Y2LqirzDNfxoRkZa10m6FvhA3Ka7fYiY=;
 b=UBQhcf0wcMA2vHhDCEU1cHcpE2bqBh9rLdL8hbK/BttrN5jmTuJSK5ov1l5oPfCxP/MyQ8E8MGgWkbnofIwod+y8WXf/bp5wgDDqNxusCv5OXE9trNOZUqSauvjzpEvJIeS0RFDF0VUmM0ve9IE287bt4RBaj8Pl3Km+XKZYuZRA6juFYZydslat3CHKo4roq+BSEnvxHjsT++GtbYeTntwaFDT78CfTH2ZD6d6asgWkH/7oR08gXBzl1mSWmoQM/jz9eqa3upgHxvJw9QoUa+oyL0h13tF30vSDNfxtBDsEl58CvYfLtVuls6LiWZwU7Xh+FX+lQeS2bccyWIGSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clhq3EMSZ++Y2LqirzDNfxoRkZa10m6FvhA3Ka7fYiY=;
 b=oheph+dGDrYTY29rbBnjgng1KCZS+W1A/xeNq+4MXxgv2plD1zsVCT2tRjeIJeqMpoV2tRjEkHMrEsduTFCuX1yhLRxx4tBF+qKup+zJjy3Wrspik+pwcgmJgs4AIxBuk2D5k2z0UFI0h3nE7uoVPbOGVo55MZRkhKdMMYjziDo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9028.eurprd08.prod.outlook.com (2603:10a6:10:474::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 16:21:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 16:21:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>, Markus
 Volk <f_l_k@t-online.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Topic: [OE-core] [PATCH v9 1/3] vte: upgrade 2.72.2 -> 2.74.0
Thread-Index: AQHaHQ2RTudaz6UdlEWVs9rhH0b2UrCJqmYA
Date: Fri, 24 Nov 2023 16:21:28 +0000
Message-ID: <462EA886-8F44-464F-88ED-609B42680F39@arm.com>
References: <20231122063119.3620722-1-raj.khem@gmail.com>
In-Reply-To: <20231122063119.3620722-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9028:EE_|AMS0EPF00000190:EE_|DU0PR08MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fea160-7c23-43bc-f1c3-08dbed09708f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 lTZYOJsOGSef3gcpZlHkwWaYd2ub3nkB4SWUXqR4Z40VhdtsGUBOkv7VU1Sn744f+16fk6R6B5AGS6GZ8kZSTzz19OY1kpx6xmHQNr+epyeT5Q16TavFZ3N54Y1KFr1U3Wuoirww6JL3b5C6XQP7bXXjoWZYZd98zs/NaEZBZM7727gOSaZDTYmWZyPxcxeUTOTTcrh9OOnbqrA4MK4D4Y4JHyJvdk8J0MM8ewwvjOaTEY9JnvdKZ8zxIPj7ns6S/hG+DP/ffbMs6KLeA2x95Sxeibdf64ZGmbh52ig556/C1ZYA+84pqk07vS4pAAVINc23ZrWNqlt6e7I7pQp33tRJI+Uprmux17t8+tojanpA6BCNjFdDvgf/N4tzPLNGbirxvRBmb6ty+gJ9nGp9QSqMKvr6nzJRMNBoU+WrbNf1CCiqKqv/+QXbLXi4wg2CJS1ttpJwABFkVTcdj1SYqFKfO+tiee7dpHStjS+rn+WHsYGPVNgnfc7Y4QTFg+SF+8GVtCHmL+/837MDS4HZx7tFHqrJ9SrMRLtqloMtdZVUTXCwBOS/e79Ojw1niOz7R7Z8Ae77mfEWFRbATQ+sCnA8TH5sKxPJllNHLxym9xxBEwf3ZLRDqU7eqNFOxNvBGKW7EKbwAA+daI5lzZwWz5Tx32fHL88ENVCAbO0jjoR0br1Zznb4ohpiDTP/Brtlnt4HJTNW6NWY0+SH/r8Mqw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6506007)(6486002)(2616005)(53546011)(5660300002)(71200400001)(8676002)(8936002)(41300700001)(4326008)(6512007)(2906002)(478600001)(4744005)(316002)(6916009)(26005)(64756008)(91956017)(54906003)(66556008)(66476007)(66446008)(38100700002)(76116006)(66946007)(33656002)(86362001)(36756003)(122000001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <399FEA840EC8AC4F906A4A890E75E2C8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9028
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	49ad9ac7-2b8b-4a1c-4329-08dbed0969bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d6t6b+geWLHz5WztLdt2CUBJyXe4uMzdhsljy26hutmxs4mq7R45jSE8s503XhvInfbTqP3RX//iFzy2vvLZFFocB5hNx/cArdvpxEsGdB6a2+EjG3FRIdO8lYHhRF0sglBUwzDsbCcOKlVkn4jWvxq2ETcX5Eqos1ZRvKgzUBjyeSwPAjFyhPwbULzPoFE7q0E1Nr2Brvk2bDFinNj6xNyIeqG/Al+nGIcLG1YsFfOsj6n1nvbvSjDUCp/WVD5Xh4TSlrGmzOXZoYcd9r2qYFbgNZwEPEyfoVm1seejpe6dBg86HAmGRXiD1+ygbh3Wh6u0YrjwZrY9WJ1amhw0lm6yNClr3dGEczegPGkp9ALU99UKOKLz+p9wIn40csgsJCmUpAmkqtWgyJ7TtOpzltIa6oEtkJIRDm8jIJPmkYq12N3xX3EcY1PR5ZBdezVQveXw39r1YdIMylVGAwmeI4B1fNssg7QiCX9MUFORHuNq0wXwm0ul+dD8RoejFI+FJG7gm0RWnw0Q5JP8JAye0NQCKl2+J7iXdpYlwPuDsyCP2T/FD73JNKdyfMEs15kSFIJDJPqKnY9gA7zbpF4y2aQNU9IZshCPCA7ZZh1W8CwVVK6rNqh43W8cyBo5I5+toKmcOArWGbEwDBGNIBfbvOW7SPlGq6xYVZ/ZwlRSeQbKTpE+2zMw9lOYBBZ2VXKW6Fv5v6dE8YIhjrtsRRFKgGghprptQFZq5FhJtLF1QB/ret7oEIeRc5VTlLXTV+FX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40460700003)(82740400003)(86362001)(33656002)(36756003)(356005)(81166007)(47076005)(36860700001)(336012)(70206006)(70586007)(316002)(54906003)(4326008)(8936002)(6862004)(41300700001)(8676002)(5660300002)(2906002)(4744005)(26005)(53546011)(6512007)(40480700001)(2616005)(107886003)(478600001)(6486002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 16:21:40.1558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fea160-7c23-43bc-f1c3-08dbed09708f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 16:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191207

T24gMjIgTm92IDIwMjMsIGF0IDA2OjMxLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArUEFDS0FHRUNPTkZJRyA/Pz0gIiBcDQo+ICsgZ251dGxzIFwNCj4gKyAke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgZCl9IFwNCj4gKyAke0BiYi51dGls
cy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ29wZW5nbCcsICdndGs0JywgJycsIGQpfSBc
DQo+ICsiDQo+ICtQQUNLQUdFQ09ORklHW2d0azRdID0gIi1EZ3RrND10cnVlLC1EZ3RrND1mYWxz
ZSxndGs04oCdDQoNClNvIGZvciBleGFtcGxlIGEgU2F0byBzeXN0ZW0gd2hpY2ggaXMgZW50aXJl
bHkgMTAwJSBHVEsrMyB3aWxsIG5vdyBhbHNvIHB1bGwgaW4gdGhlIGVudGlyZSBHVEs0IHN0YWNr
LCByaWdodD8NCg0KVGhhdOKAmXMgY2xlYXJseSBhbmQgb2J2aW91c2x5IHRoZSB3cm9uZyB0aGlu
ZyB0byBkby4NCg0KU3BsaXQgdGhlIHBhY2thZ2VzIHNvIHRoYXQgdGhlIEdUSzMgYmluYXJpZXMg
YXJlIGluIHNlcGFyYXRlIHBhY2thZ2VzIHRvIHRoZSBHVEs0IGJpbmFyaWVzLg0KDQpSb3NzDQoN
Cg==

