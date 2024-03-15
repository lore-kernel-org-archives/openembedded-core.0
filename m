Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36594C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 16:08:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.26468.1710518928963995591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 09:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jCO4g03T;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jCO4g03T;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AudxWLQU7a4U6BAix2W9jkRm4GP8Cu5iwCZ2RJg50PHRiYElLv5gYT5F8UK907LddNOHC94g96xyhUtMnc/7QRNEQN9fSuXz4Y+DOWZxe38MStWjq34NkxVVcVZVOE0LY6DCO6VBZbzVzjDZxKWUCjWn84SKkShYxZaX1dkEZe2rYNMqKTGl7cC9/QiBnWFWkkIouSwln1b633HgxEwyB1uc8JWc3X+w9yMt7thJ3WnpKKPSqUdVYqEWhO41MtvyW9lskxOxAwzka1msJ1LLWfI/Rusan4pVLP8l66NCDVvu2nNDfr/lETOLriGi/EBJ07qLXT63x7l6/+pCnSMXDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbondHjMib+nuiaWTdP2L3qNuIgpBApAP/gzZZrAjPA=;
 b=HkzA3P3NTov02uQ1q+QFLafr3Hlbg82bmKCneSdBFSPdMN8OFcBwq+HT/xyNVAb3wIQyfOrhzUh4F/4KLgzjEJM2S7xTQOgDSrjXnDSLi+NiaJZ0A0pf1HOuR6aNgYr/OuCdDxgL5o+saJyZWLQcUkt8ebRpxoVDz37OnDg41NUgH7cm17PAF/ibsxcWtq7uSntElN5wstwOo0d6onEcbl3vralBr4Ypg+SpoGGa7hDJTIZcjJYdzHLmE9Q05H4YuHeY29ctwXqSjSWB+KT5Y9kx2H70A91S3yPvTnLftLBbCYJuhXrK09tMK5rGsXsI4S37MuxT/AeAmMUjNwfnUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbondHjMib+nuiaWTdP2L3qNuIgpBApAP/gzZZrAjPA=;
 b=jCO4g03Tek+k822qrMKZ/iIkuikH9PFqjLzAHIwM5B7yASWo6SCalyqLxx+ziPbiYy02ZH/veE6F90/eGsQNbol+49+qdUBZ0TXA/UBVCt+93l7hiC7Zrut93fllTUooNx4g14WlsWEm6wGaFc/h41dEbwx4ZMa8Ui5F8GdC2xE=
Received: from DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) by DU0PR08MB8301.eurprd08.prod.outlook.com
 (2603:10a6:10:40f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 16:08:44 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::43) by DUZPR01CA0137.outlook.office365.com
 (2603:10a6:10:4bc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Fri, 15 Mar 2024 16:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 16:08:44 +0000
Received: ("Tessian outbound 6a48a1f51a3c:v276"); Fri, 15 Mar 2024 16:08:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54fa219dbbbbcec8
X-CR-MTA-TID: 64aa7808
Received: from 50cd0c722830.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E2412AA6-BED4-4C8B-8AA0-209C8D2C95A4.1;
	Fri, 15 Mar 2024 16:08:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50cd0c722830.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 15 Mar 2024 16:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjoG4gIqAj82KZiFybVFOGq0WS5lc2Dft+CrcYUZButGzNs1iNB6fp7c1pS1tnf8aS8ltM0puSHpsK288yQuoQazOMPM+M0rljq7/AYzIDueNTej/t88K1zqVnadM/SVuAmfYvZ1IE/MsVUFED2OVT0AxW10T84kIghQR8QLTQiQF1mOHnfgxx+6HBRbSnKEyHtMgt9flcfGXqy/cncvZbFkId3uNR861nmWmJYZQjYtwnegn3WFpbixN/Px2IAQ1oJEUb3qDZqRLbWFnTcAsuLusfhgIeoO5359JP+aE8CxbliEUr7Du8xtqMyLil/Ya+FXBfRybx7EABKNISpaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbondHjMib+nuiaWTdP2L3qNuIgpBApAP/gzZZrAjPA=;
 b=NMEfGNsjOhB7eX3+5bqpN18g+evXiFSWooBEqn13uIYLHCaFBuCKzGOdQaE2RtdgdlqYKplbXbGLBpOOnwUpVa7gqp0QqmEOQW0fVDNGD1JlXSjfoHz1EsqwS6BkPOr9XatB2W54EUe4EnN38aIKhwUrsLtO0aDHblc43kNQ+DCErfudeznSf+MDKUqVfwnHIe8UmQal32nMbF3ufcxJVlEkl1Lc5qw54fK6UiewtDdkT0cKezWxx7/rG729kdX4T7tYDYIYJJUDuH6J0UDay3pjEAyqhc8jflHskEXwV/VVRHJ+QkLJXsZ6I5vr5n/63TpqWXv5/Li1ClrYhlhJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbondHjMib+nuiaWTdP2L3qNuIgpBApAP/gzZZrAjPA=;
 b=jCO4g03Tek+k822qrMKZ/iIkuikH9PFqjLzAHIwM5B7yASWo6SCalyqLxx+ziPbiYy02ZH/veE6F90/eGsQNbol+49+qdUBZ0TXA/UBVCt+93l7hiC7Zrut93fllTUooNx4g14WlsWEm6wGaFc/h41dEbwx4ZMa8Ui5F8GdC2xE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB10384.eurprd08.prod.outlook.com (2603:10a6:150:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Fri, 15 Mar
 2024 16:08:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 16:08:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dnagodra@cisco.com" <dnagodra@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external@cisco.com"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Topic: [OE-core] [master] [PATCH] cve-check: Add provision to exclude
 classes
Thread-Index: AQHabZO/yuqWuDVhMEylVWEP8cejXbE5CtwA
Date: Fri, 15 Mar 2024 16:08:35 +0000
Message-ID: <3DFB9E4D-D025-4318-8BD0-6D7D8DCEE1C3@arm.com>
References: <20240303175323.2526814-1-dnagodra@cisco.com>
In-Reply-To: <20240303175323.2526814-1-dnagodra@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB10384:EE_|DB5PEPF00014B90:EE_|DU0PR08MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5853f756-ca01-49a8-aaec-08dc450a309b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1N2/Oi7azrpFvIcsOSxJPsI27Wp/IrdbGMBMnuvGdJ5DIvUhV58hDiNOXbCwOswPeNR75Jjz4C1L+D/nJasNRJlea/z/cS6FJ8tiyncFUZ939/X9iqOPHvzaVyMU/WBVkFHzv+2oB5VbUNxjeHADQJ/9DADe/pSWRMJhH8cbtdJwaQP0iiRLZWqYbqMGT4rNFgsJxs5X1dBPa48P9J/RUpg38a/YblwPg78D3MYC0Z/fi1c6u72+3kL1UloG5GEJTuSa3jodZBOtKEJNnC9liwhB7qGtHvSZ7/hmDfISyqLusQnstJyW1800nBLSmEJJxth/WbpHZ5TVri4r7A60WT9nu1R1bGjW/t9uM4dKeW/e/1SjaVq+VNU9URyZvTAnOmL8h/KTsHnfsFQxNVTMxVX435AqUFOeS2ftXz7iHUMzw+xWxxf5GeqWfdqxybLaWPQgvm/ZozXYtiy6TjE+TfRuDaunQtEumT4Suk7oxd7v6XseDL9Abg9Y9R57AAwS2ctO/LysigyIejcOIH+AdSW7oA6lEBe+7OKOq1PtVgSe8dnfSb07W/YwifUhdRPNlVJKXTNJbcvG5moAUMeZu8OwHBl8wM9rhfuLWCxKctdVJ5vyk0pzQE97xWXyIRtrjUuKCaLu3uqgVL0RGUDoC1VKU5Qda+IxnM2WfpJzddEX0oby2z7NHxl3O7yJsGH3DHwmszd9NHGEaoKA/N5W9yNa26QVX6snHbCUltgYm/w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <176FC5BBEC51254599F3353538E79D27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB10384
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	570b243e-8d6b-4720-f518-08dc450a2b03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tbgvj4/38gJGSwaiDvc3srfctIt1j5H+DSI8f0tefuLZoczQJFPkaakzNISwKWZnMJdBwJX7M4DEVPmsQts3kvTXkkbe0etRze/G7Zoq9VtnGJk3uhJ/EZpj0tonbKSrY+67AKzGppWYxs5mvKS/cSWg50N+RQjIu0gvaFVM7Efh3B8U2MLriyhDaioYDX+nqZjzMUIdk7w66Y2y2paf6xeGCtl4LC3g+XRcIqpuOJPeLqi70GiUJoPf/pQzxve8xgU3EPsxw+RmYLJdNENJyBvj8H/QPibD+9JNBN0gCELsjtRiBRXGr69QFg9+MbLg3QGAYNWFcL1Sf69uw8e5cR87a8pR2vceVNfqrpmjooVarcMPcxRkfIpersRGMepm/E3Bf3OxuC57gDucnStSEwlHymzoGOyTcJCayBD5tUmxFbU032WKAaICT3E0Fws9WhR574LLoqa+bbrzO9BMZksj9wFXbWsZdcuIh+1wsiSmBxfi0yIlqWhY+SkvplOvedeRrCborEnvcLvReOqPqRod83vDtSmjr1ApMRpxBhGIgLUvvB/HvLJCijDNKNSUYEqW88ewiFlO7gZ7e2vBtC12i3Tirl3j3wq3XbACQxmFX3Ck+wPWm13pzWFgmaQV60DCrqtpJyC71QpuD6DbWpyJPDEpKXk4RKRgR/HSbT2tAVQL144bpjsJ47Fraf5nCG1rVh4BlDkcJ38PT2onA9aLvXsVyOreXgbi2F40t8tCvRiEzwQAn4T65ZmRDMWk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 16:08:44.7109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5853f756-ca01-49a8-aaec-08dc450a309b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8301
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 16:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197143

T24gMyBNYXIgMjAyNCwgYXQgMTc6NTMsIERoYWlyeWEgTmFnb2RyYSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8ZG5hZ29kcmE9Y2lzY28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gRnJvbTogRGhhaXJ5YSBOYWdvZHJhIDxkbmFnb2RyYUBjaXNjby5jb20+DQo+
IA0KPiAtIFRoZXJlIGFyZSB0aW1lcyB3aGVuIGV4bHVkaW5nIGEgcGFja2FnZSB0aGF0IGluaGVy
aXRzIGEgcGFydGljdWxhcg0KPiAgY2xhc3MvY2xhc3NlcyBtYXkgYmUgZGVzaXJlZC4NCj4gLSBU
aGlzIHByb3ZpZGVzIHRoZSBmcmFtZXdvcmsgZm9yIHRoYXQgdmlhIHRoZSB2YXJpYWJsZToNCj4g
IENWRV9DSEVDS19DTEFTU19FWENMVURFTElTVA0KDQpXaGF04oCZcyB0aGUgdXNlLWNhc2UgZm9y
IHRoaXM/ICBOb3RlIHRoYXQgeW91IGNhbiBjb250cm9sIHdoZXRoZXIgY3ZlLWNoZWNrIHJ1bnMg
cGVyLWxheWVyIGFscmVhZHksIGlmIHRoYXTigJlzIHVzZWZ1bC4NCg0KUm9zcw==

