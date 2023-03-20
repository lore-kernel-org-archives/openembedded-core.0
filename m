Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A4AC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:10:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web10.282.1679332250840939569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qb8vMmEa;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl1TIKEVxiKckaKaT71FeSLSNlOWCsOsJRiEdBg89kc=;
 b=qb8vMmEajpobrxj8fWblqwyJCNEqEj7k3O0bXH8swByU+GT2PVv4DuJfNXENUqT+NAOJgyawwN/TqEmOtTiqvp1g7XogWJEt8JviFFPByhTucLxQep6udw8cVr1F0QZcFFiDEDjfDYvJA1ESlDBsYJpKD0jOM3L0TezPtyDEB1U=
Received: from AS9P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::29)
 by VE1PR08MB5760.eurprd08.prod.outlook.com (2603:10a6:800:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:10:46 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::72) by AS9P250CA0024.outlook.office365.com
 (2603:10a6:20b:532::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 17:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 17:10:45 +0000
Received: ("Tessian outbound 2ba0ed2ebb9f:v135"); Mon, 20 Mar 2023 17:10:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14bb9d1e08227b6a
X-CR-MTA-TID: 64aa7808
Received: from 94e61582faaf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2A4E8A02-FE7F-4D16-80E3-246696648E56.1;
	Mon, 20 Mar 2023 17:10:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94e61582faaf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 17:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQdCIn0APLbbEoiFxmbSydI7StndYZ9NwC1oGqZRJyqodd/OWsxDkloSNe4ids1y0prf4iymnSY/bdM7qbz1C2wKyUpjqAjh+45Ra3sCOHsBUnqEleD8hM69h0E2ukiE25NnWwkMBYmDcoTcUs0uPnczCqrJouPdspvnlFm+jnNcJm715cxyMFOciwY2Qwrgs2IvK/kevt7MwK5fwkM1OaQ4hwdLAuVTxOh7++vGJY2EUh1G616D1s+20OoDIfB15imA29vD5aFixygo/+QuV8QYi2xeCmHiEpZx+psC3WE14q1mUzb2EEPSAjTuVztJdigGZDxyVXiovKsn4crfeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xl1TIKEVxiKckaKaT71FeSLSNlOWCsOsJRiEdBg89kc=;
 b=Q+y21DhiFqBRJ7ex6o7TSN8+ZBzXzZ7acNLs1WJoIvdtE6zDlNlCe/V9xP99KwbhSXbbkgvmpIfUYin1VsW6xk6nAa1MjPsDwec9c8Gzl+O88MYpmQWrKFSUmWoBWVjkTrYyT+MvXcPI2Z80rI5s3gl1lzjGaSWg/NK1AASkA0+zLm6d5CBbWucm4WxDOBzVkfHEzfnrakSr3h+4vE/LXq1ICPPy50yhgZXXn/9e6mulHXHeaVVqBuAwX57hhPtN0lYyHiyYv23ZV3coV0A85tmBPVva2lBChdviwzZuePhXCHO/2MhZNF1JphDMOdrq6R0L0W9eXksM1pLEzGUEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl1TIKEVxiKckaKaT71FeSLSNlOWCsOsJRiEdBg89kc=;
 b=qb8vMmEajpobrxj8fWblqwyJCNEqEj7k3O0bXH8swByU+GT2PVv4DuJfNXENUqT+NAOJgyawwN/TqEmOtTiqvp1g7XogWJEt8JviFFPByhTucLxQep6udw8cVr1F0QZcFFiDEDjfDYvJA1ESlDBsYJpKD0jOM3L0TezPtyDEB1U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8956.eurprd08.prod.outlook.com (2603:10a6:10:467::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:10:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 17:10:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
Thread-Topic: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
Thread-Index: AQHZV+uF4m31W3turUKmKqCDH2IhcK8D7eAA
Date: Mon, 20 Mar 2023 17:10:31 +0000
Message-ID: <E06BEA96-189F-4FCD-B524-0E00033303C3@arm.com>
References: <20230316094102.2628727-1-alex@linutronix.de>
 <20230316094102.2628727-3-alex@linutronix.de>
In-Reply-To: <20230316094102.2628727-3-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8956:EE_|AM7EUR03FT019:EE_|VE1PR08MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 6872df0c-918e-4d4c-ef55-08db29660b56
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 w69ttzMVukQFRFTZYUH5lb/KdJUYArSOvg3W15Vkp6wG6jk4YRMRpHjDIJGByMzwPXjFEfEswPw9lrsA07TDcd5yKPMiH2c/kfj334GoCUJxpGI1Za7adyTP3DWDr4SdmU8GtR864+4r/QIVWzVnPeG50vKKwobUa0u8y9EP+OihIYI4la8E+0PRq5njwXvWmj4IyY0iQR8mdw/c0I5wTPK1VVWZa9y3aKzTkFRylp0K3kLlqEz09XggH6L6AK0sW2xW10VJzvCPdXVnXTn0OGab8qLKJWWol9dpOndVRP/C9r2VQ005kDJFzLj+W1FWovvXMK1ON4wK4i62Uca0kI4jztGDb/MuqqfK/MwA+Y4q3pMaATcR51/+lHX9LL4OLb5bP17zisv1aZ/tYpNXMQNtvHWguMvNgXlFYZrC4xCMPnWIRk9Y6wMIcSGFvoPPCblF9vIyfE+wzn7DNL9m77Eteff6/nGFgpuRleIBscCyZ+LM3EOlloZuE3e+6vEvykAW6TNNHqBl8Amj2WmkM9hApsWa5r0IhjeceuezliD+Co/wpYKtBv/BE+YxYouFyVwdAa7CLgktv+ITvAVT5OhwiPUPnhQZCjsU0nfZqbLpHpGwEruKIxSddRke6p1u6AsvTNrSA7kqMcUZt5qXhi+ExVR6g8avgnoaO0cF5LJ1SyXfx/2j62Pb5KT2qaS3SQLlbdw9gH9Lgw0uJjoOG2P+380ZbzGqLtAzRgS0pTQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(6486002)(8936002)(86362001)(91956017)(76116006)(41300700001)(4326008)(66556008)(66476007)(66446008)(64756008)(66946007)(6916009)(8676002)(122000001)(33656002)(54906003)(2616005)(2906002)(38100700002)(478600001)(6506007)(36756003)(4744005)(53546011)(5660300002)(6512007)(26005)(71200400001)(38070700005)(316002)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <72225BE86D1709439963FACA7B662E71@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8956
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ddd52baa-1d98-4b26-cd1c-08db2966031b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fBn7iuMvnlWO4v2Lp0/tp8FsCCVcO9T4ECdyJDmoxLFZbL3aHdrUDHljlYu54sLSMvLu3V3G0gM0DkjhA93fsSiKW6EaEUt74idiWhyJqcQvmsFylAsiu9sZApdPWLAmjkHrCgkP/aJGExszIrKJ39KFDcvFN9HzVx1wUUyCYl1zKitIrNPgaufHQEMztZdz8rrUvbOMclaU2ZRz98TL35Zt7J2rgpS3dx3NrKnYlIvoAlPmz0T8Cnnw/Nn5eHdDleGizhduYwmSqzULL8mJ/w2ZDjU9V+sqvMYgQte9ztCuZvUPUV4UkkUNbPXnafsJPjJKVMxZBkfOBObzctwRc2qAcmkc0l/BdU4NbkADRNEm9XEQsjYK8s80FOCINL39O5VIl+AlMRrw1BhY8dNhvW2/WSM3Rv85+RH2XvuoINGxabhRyV8TvslMZD2/yPKxi/gusJIhMWVCicvejVXafG/OImJHm/8VFiZoOZEak/sFleT7+h3iXxr99q/Y5dFpQZ3EbYjH5JIzxy1jRU+1xcHdD/bJCg6Q6BAXQHEuW0lLLR1Qdp5IBB0duYc+G3ggFdoBsWs3pT5FJpguV0mDq0cjIuV6v5MSvt+XckIwFoarH5D0bwvibQcwtZhWIR1+qCgxRQgC7kzUDz/UTnRGgpwqqLUHwTXgBbzcAPVNHz31FeqehnCGdZOyANm9PVVV4UvxaQ49eHoCjp38PzOnjQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(39850400004)(136003)(451199018)(40470700004)(36840700001)(46966006)(2616005)(47076005)(54906003)(82310400005)(6512007)(478600001)(6486002)(6506007)(316002)(33656002)(26005)(5660300002)(186003)(107886003)(53546011)(36860700001)(356005)(86362001)(336012)(81166007)(40460700003)(82740400003)(8936002)(2906002)(41300700001)(6862004)(4744005)(40480700001)(70586007)(70206006)(4326008)(8676002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:10:45.6081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6872df0c-918e-4d4c-ef55-08db29660b56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178836

T24gMTYgTWFyIDIwMjMsIGF0IDA5OjQwLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IFdpdGhvdXQgdGhpcywgdGhlIG9ubHkgYXZhaWxhYmxlIGRyaXZl
ciB3b3VsZCBiZSBzd3Jhc3QNCj4gKHdpdGhvdXQgbGx2bXBpcGUpIHdoaWNoIGlzIGZhciB0b28g
c2xvdyB0byBiZSBwcmFjdGljYWwsDQo+IGFuZCBzbyBxZW11IHdvdWxkbid0IGJlIGFibGUgdG8g
cGVyZm9ybSBhY2NlbGVyYXRlZCBncmFwaGljcy4NCj4gDQo+IFRoZSBvbmUgbWFqb3IgZGVwZW5k
ZW5jeSBwdWxsZWQgaW4gYnkgdGhpcyBjaGFuZ2UgaXMgbGx2bS1uYXRpdmUNCj4gd2hpY2ggdGFr
ZXMganVzdCB1bmRlciB0aHJlZSBtaW51dGVzIG9uIG15IG1hY2hpbmUuIElmIHRoaXMgaXMNCj4g
dW5kZXNpdGFibGUsIG9wZW5nbCBjYW4gYmUgcmVtb3ZlZCBmcm9tIERJU1RST19GRUFUVVJFU19O
QVRJVkUuDQoNCkdydW1ibGUgYnVpbGQgdGltZSBncnVtYmxlLg0KDQpDYW4gd2UgbWFrZSB0aGlz
IGEgcGFja2FnZWNvbmZpZyB0aGF0IGlzIGRvY3VtZW50ZWQgaGVhdmlseSBpbiB0aGUgbG9jYWwu
Y29uZiBzYW1wbGU/ICBNeSBidWlsZGVyIGlzIGhlYWRsZXNzIHNvIEkgZGlzYWJsZSB0aGUgc2Rs
IGJhY2tlbmQgaW4gcWVtdS1zeXN0ZW0tbmF0aXZlIGFscmVhZHksIGFuZCBJ4oCZZCBiZSBkaXNh
YmxpbmcgdGhpcyB0b28gYXMgOTklIG9mIHRoZSB0aW1lIEkganVzdCB1c2UgcnVucWVtdSBub2dy
YXBoaWMsIGJ1dCBJIGRvbuKAmXQgd2FudCB0byBkaXNhYmxlIG9wZW5nbCBlbnRpcmVseS4NCg0K
Um9zcw==

