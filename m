Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7DFCD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:41:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web11.167327.1712756496457379619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3GLE8Vvy;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3GLE8Vvy;
 spf=pass (domain: arm.com, ip: 40.107.21.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RLDfLs0/kK4e7TPWl+dqi5/GwVjX/D25WCLgks1U47+C42foJyKBbZlV2+UBnuCedvPRoHweWJujMa5VyUZrIJPOeh+1JN1LvqOoLYdRMM0Ft/dgcdM6vfn7xG0du1YbV9UFTmpfT1AzYhjghVMYf5jl7Q91SHPNH9Zr+NrczZxnuRz+nBlhBTUxKJep5qKojlUQJ1kCtTZ4pUR+BAEDUJgKkR4GyrG5JhUZZE7cfZbV2t1IhAXHexKdo70ChaXcQHwpPJ7ZBsPgByzmSdNxMuqHP8/zrWZBUaHAhp/DIqQVQguQSy/Oqy/gtdSpMgN8gwcN9TJfYlZ3fwMG4bmHQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KQ8yTCuoaKzH1OoNvMrbIMaqesM7SVSjOOy3riPcFk=;
 b=EHtNyTQYQRDtuu1asSxLrB2ybgPS9UeaXqVWbKwRXLxodrPaGEf7nREsHf2GQnhdLXYfif7C6lXkQL4u0cx0jxLZW6QrYiHrK4tbcck0br6EvgZB7BYjpwFEJPoY/3Ha4bGE7cNereaw+2N9Y5dzZOgWlOaapXrSobrSz2zy3DjI3R9cpxGq+UDwmtIevQroIsQT5Bm4rx0f3L9o8cB0HcLic9Vyr9ukzXwsRDV4CVigMP3xT+HEanfOCtEcXpGjvN6z5S9AF8jNycbCgDmn7oeCdxjTNoqckmxA8VnSvspDyU7r7tYnfQdlCoOm2GVlCzrAeSClwMg/2CaqT1roVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KQ8yTCuoaKzH1OoNvMrbIMaqesM7SVSjOOy3riPcFk=;
 b=3GLE8VvyL82qo+8eSPHge/VD/aGptgU/bTYkIs7jvoQjxjzqBAEPqOrr9xRsC8Y9VGpIdRFgFpN8WSMEdl41osISa72/Az13sJ5qOP3j76wVscwO+2Qe6LLYEyrmiXd2a53ITrS76iA4NLM2OXHQCveGysyhAtlXGfT8c66/KfQ=
Received: from AM6P194CA0106.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::47)
 by VI0PR08MB10584.eurprd08.prod.outlook.com (2603:10a6:800:1b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Wed, 10 Apr
 2024 13:41:31 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:209:8f:cafe::ea) by AM6P194CA0106.outlook.office365.com
 (2603:10a6:209:8f::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 13:41:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 13:41:31 +0000
Received: ("Tessian outbound 5ad6c4395be7:v300"); Wed, 10 Apr 2024 13:41:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5ce910d476b5171
X-CR-MTA-TID: 64aa7808
Received: from d52f5aedf9bb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8EE4E0C3-D1ED-4705-BE7B-2D5A251603C2.1;
	Wed, 10 Apr 2024 13:41:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d52f5aedf9bb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 10 Apr 2024 13:41:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+lRtm8S8Zaka6WQ/MIUJXlceazUpTW1RD4SevRze7ox3ILZZ/gkK4vcSV3jXOT6gmeu+/v4+21ISv7FGtVZCGHS4amZHYAhT4osN6vGE2i8Fqpo3jBGX94LTDmizTlfLgzxIONkHf5IjylcoHqurpSmpNh4s6/EnCNbD6ZtKc7/cK1RmYk/k/gjv+oimfYASVoiUWxdQ+jiUi8Ym+pMjk7uZsbo8tfoQI7aFiMmKLM95bhv49VPJIpDceeQqiGKBKkR4mOuuDvtDoHBAcv60vnzRTMOltobmfHao+Pssjhh/91W8PKlUnvIIFhTzHczKy3yEpG1fKH30MaJ8uD4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KQ8yTCuoaKzH1OoNvMrbIMaqesM7SVSjOOy3riPcFk=;
 b=F7U55JZfOc6zgo7RCJZbGv1tX1bYLSw5ZGY31fH7g5FFJ+aKypE60DDkBGOJct7MnIhKbcQSLd21tEwMI7o65/1rzOvW2P+w5S087A6yu+UrmcB9kT8Ku+UzHsLwmXN1BRL4c3iDoBSFCAfq68Jlz1QqOrMlnuFuMfY1nmqLlxtGXouZj+5aPP7EDNTqJ2UXJAHDf7cED31FYiVrIrqdzG1Y0thc8JOaLiCX2Yiv8FZ5suw3OtdZGhWFCbnl79jFDjCZDW9jQNbE+dLW4BMi5BkDeB6ozkD4tY7KmfZilyd/AB1GXfSE5ldlgQeKNtz646ihIPwayehT/bAcygagBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KQ8yTCuoaKzH1OoNvMrbIMaqesM7SVSjOOy3riPcFk=;
 b=3GLE8VvyL82qo+8eSPHge/VD/aGptgU/bTYkIs7jvoQjxjzqBAEPqOrr9xRsC8Y9VGpIdRFgFpN8WSMEdl41osISa72/Az13sJ5qOP3j76wVscwO+2Qe6LLYEyrmiXd2a53ITrS76iA4NLM2OXHQCveGysyhAtlXGfT8c66/KfQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9780.eurprd08.prod.outlook.com (2603:10a6:10:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 13:41:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 13:41:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Topic: [oe-core][PATCH 1/1] init-ifupdown: add predictable interface
 names
Thread-Index: AQHaRAl1w4dsDKxydkaY74FK8ys6t7FiEWQA
Date: Wed, 10 Apr 2024 13:41:15 +0000
Message-ID: <629B6710-F394-41B8-AEB0-6C8A6A594EAE@arm.com>
References: <20240110211016.1470053-1-joe.slater@windriver.com>
In-Reply-To: <20240110211016.1470053-1-joe.slater@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9780:EE_|AM2PEPF0001C716:EE_|VI0PR08MB10584:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FmsIXvgbTTHbgfOR35QpspoxA9bbAd/zb4F53pAGDZiDPf5bfgX7ki2EZVJ3ebDTG0ttItJ8gSNDawCVdtoXvPOyNNztgWECw4J2wxkXpm/SPxQop+mHmm3PMJsQCQRfOsrrYIMqVUYFgH5uqoReKvQ+Svrndakwb38vXxuxGsj/pRGfV13YoH5XIa0EVqKhzIHh6Rf2bEgYgYA56G/DNw+yZyyq5s9CQrbkStcYpRsGc4qS8Zeepu/V84UQOHP7OPVdY8UvAQcc71GLwoahbJxrz077ixRIVhkkNE0/wSVC7kC3Jwro5vlquk6DOek2pLW8E1yNlEv1fZ58sJd8JHvj0q0NPKtEEqrHvJn2EnNYvpZSsyMtBD3Bu/HZhJCW1jqbBFGXwQdLsMUoF4nxLZWQEI3G/ko61tcKlTLPven+1ZsnMJGFy/5kN2NbrgxmbF1Jfv4noqfRCS4gDDgvXF5wM05VTfE/YNnsqHs8AC77jZqSbppkz+GvetJBZZdsnVjoUV2jLlK7h4gAPn+esicRfj8HcR/wOk3ZY8Pb6j81s8Z+wgU5lWFI7TFbTYxieEWgsqmNwLXGcwaYcexORdsVTTc02xhekAFamGVLTBZd9EVolmrpj2jAXb0CtF7udIN+lVlEU8k+sYr+66Btz4RWS9frbgaWKjkvRRFib+g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3FDBDE118E52F499ED413D4893ED3D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9780
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8e274bf-10ea-40a9-3407-08dc5963ee13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rg5wgmFAwf0FeaYPz7XGxQaB9Cvvv0h0dI4jUEx21EIFYTYU8sMpQFKEgSU643tcdvYoDRnfoadtqR4A8bq8LtHWCqXsXLY1LlnKpFAOkTeLRhlh9HKCRfxRAJ1W3V/M4Mz584nJJg9mv5G6iURR2WY2OOK6bbmxS5bGFTL1uTiCinz1xeU90SkRZKX4uyGHdecRDyxewGL8D+hN1p9RQtRFo773a85pSKnKfYi9Rl+h33z2HXejntkPdQkJUDCwIN6Tfl+AB4Gm/AjFc5b4va1iSKw0aoTApMtqu1IMIqSz/EFBufwBKs2x+oZ+U3ktr1AuMmrre+RK/repsSjvjxnnzDr8ND4jzNIo9vGO4nP8d0NYAsX+137TBJuNUHpLaQnMMbt0QbhB8B2Jr3jslnhTeXQGEgI//FwzG1lS/0auYynasJmF5ClnAjbHvJagTBgHnxHIKnZlL9QD9gw1P7unughbBzPM4SteXtOMBVJSLCAaMjMff3T6uLTb1OpO5mEDQXt+v11efD4kTgYAyiQBLh53I90AnK8qPkATLYXpaF9IKyh+DWweIGT7EHh8QUYOo58CYmSo+/zQUQoY5uICsjMMcJXHsNvFV/IDb63D8k/RhvDXFcj5qUe8AJ8nDv42ZyKVSzTPyYuPbN4ag/0foGwkb7Iecg7adTP11wPXOMlkmw1ZFYEbeWiwJyoi1xGbmP7dBY1Q4PHylxTyGz9vM377D25PUIXsRGOpFK7Uhar+clOQpQy95GAnl+M4
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:41:31.0169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e274bf-10ea-40a9-3407-08dc5963ee13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10584
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198099

T24gMTAgSmFuIDIwMjQsIGF0IDIxOjEwLCBKb2UgU2xhdGVyIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxqb2Uuc2xhdGVyPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IC0jIFdpcmVkIG9yIHdpcmVsZXNzIGludGVyZmFjZXMNCj4gLWF1dG8gZXRoMA0K
PiArIyBXaXJlZCBvciB3aXJlbGVzcyBpbnRlcmZhY2VzIGluY2x1ZGluZyBwcmVkaWN0YWJsZSBu
YW1lcw0KPiArYXV0byAvZXRoMA0KDQpPYnZpb3VzbHkgd2XigJlyZSBkYXlzIGF3YXkgZnJvbSBy
ZWxlYXNlIGJ1dCBJIHRoaW5rIHdlIG5lZWQgdG8gcmV2ZXJ0IG9yIHJld3JpdGUgdGhpcy4NCg0K
VGhlIC9uYW1lIHN5bnRheCBpcyBzcGVjaWZpYyB0byDigJxwcm9wZXLigJ0gaWZ1cGRvd24sIHNv
IGFueSBzeXN0ZW0gd2hpY2ggdXNlcyBidXN5Ym944oCZcyBpZnVwZG93biB3aWxsIGZhaWwgdG8g
aGF2ZSBmdW5jdGlvbmFsIG5ldHdvcmtpbmcuICBXZSBkb27igJl0IHNlZSB0aGlzIG9uIHRoZSBB
QiBiZWNhdXNlIHRoZXJlIGlzIGEgc2VwYXJhdGUgaW50ZXJmYWNlcyBmaWxlIGZvciB0aGUgcWVt
dWFsbCBvdmVycmlkZSwgdGhpcyBmaWxlIGlzIG9ubHkgdXNlZCBpbiBub24tcWVtdSBzaXR1YXRp
b25zLg0KDQpSb3Nz

