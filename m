Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A98C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 16:16:18 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.69])
 by mx.groups.io with SMTP id smtpd.web12.34399.1659024970865522178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 09:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=eqUJMwLr;
 spf=pass (domain: arm.com, ip: 40.107.0.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SKs5xJSh3eM6U/C2makOfhpn4B/ujPlKqeO4o1JXFixpVNECO/FR6om39WWkHUXeqAAq47d4AF3QmhFvEBlti+A+CtJhhwYFBYwo4apDyZNYGZsOCTKQM1mDCLV8wv8TK68rmtUKiKqtG/10u68vGEV0p6WZcKJT+viR04NJYRUlVKIB3NxmL6xMJz8189uISuW2y7i5lZ5EUVvvDCn4sSkFF+Klk/oX4oF2kcn2vyhQOq2qvtinGM59m3hRwBTF8n5au0F57nf43+47+cclY0lye32qjl3Z1sqVX01kZzY9KC/Ciw7EBc19zfIEFBIvwY1UXqkfYTOltO7SSitjfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYmx1P7be1fEXao4cTpyen4G1Gw/0jOh8v2wXXuae00=;
 b=eN2twn8jDfWqLCZN/xz0tEyoH7D+rBNJ1CwkHBQDvQRyXd2tHPJ5daz6e1895uH9VZD0nZtdc7hBhdSk4xH08DFJWHQJNZ2NtHJtGGe3pw9sagfnh+Up00lhZLHnb/JWu/mBAfb6PFrjVtlaXY+/YV8xP9zXqg5NyflpFyf3bnSkUyUCSYhFdVWozlObNYZLQii8yiKUfDIUV+8id1zggmQicAi0KpQA6PyxuN4MT4imt01dEitCr1Q3LrRIq7AsItal8JIbYILibYa81RJBhXkIxH1AapzvxSzUc0sDU50kO/CdkR5i7jaOWrBrCOhHM/5ullCPnOv/LvVqXN6/iw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYmx1P7be1fEXao4cTpyen4G1Gw/0jOh8v2wXXuae00=;
 b=eqUJMwLrTz9j2gheu/BJw1Teo5LvjZgXmhksEYse8uAAmI2Wnam979Npd0V2RsiNB+iplMKLlljsMKEoElS4T2tSAQoA66fgmIYq8zyTnf2+brGXK6u8BovVCGxRhLnxokQKT/l4s6Emg4Qrama23+GXXecSJmZTANhw+2/eirI=
Received: from FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a9::19)
 by AM6PR08MB5237.eurprd08.prod.outlook.com (2603:10a6:20b:e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 16:16:06 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a9:cafe::aa) by FR0P281CA0101.outlook.office365.com
 (2603:10a6:d10:a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.5 via Frontend
 Transport; Thu, 28 Jul 2022 16:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 16:16:06 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 28 Jul 2022 16:16:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 126fe24893414b53
X-CR-MTA-TID: 64aa7808
Received: from c41892bb1179.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71686FB7-61C7-4E80-B118-5F470B961FC8.1;
	Thu, 28 Jul 2022 16:15:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 c41892bb1179.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 28 Jul 2022 16:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrbC5hFR+g42czxG3eaei4Ayw3+Q0EC5/XLqPn1BxBJhY9M0lyRtuZtaemvKO+sq9fI9loT9e6qEColEBlFK5kWdkwlXsdAFoX9bgQnGY3yk2cH+sGSQkBYy5K750wy1gg3ijqwLTOTpO8nk8GSA0RXAsW3bzm70zbJXlvfsCO9EthNwW7dnfQGNsb7pkKywnY/AHk8wrktHM4mzN4QHGSsKUmw0LKYM6ljQHE5wPjA1DAOD7OgcPeqJMtehXXsowVBaK7YfOL+jFalipmVSQcuOIgKb9iegT0n/J0/7trJ1VcDZPYiCNTr3IuXBSXYwZ6lJIbovJEvQqx93lkGQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYmx1P7be1fEXao4cTpyen4G1Gw/0jOh8v2wXXuae00=;
 b=bUlhb96103hBRgtqEVKP6ljNWgGihnqN2mneNWffjwtJoumaiA8GsywDTfl9ZCjaPYaNborJ0L+34zi9A6vGemRPQmtqS8r7oMWayGOCQaESEUFJpjiyPPx264+8OZn7QWDRov+2uIaB3n5LFJAT/Lh9SIr1NfxnRUaKj+Wr+s7iI/2JxDbejVGLivEmW+lyrcChYy7Qx45otkbfutYb1PU2n3Z5c1CceyJW4oIyLABUhjB1JyScGiuyT3YtuYcH/2E9eJgko8cAz+Xp4csO07mBeBbJkySftZvaiNt+buPvx2/DXXPAOeza6DtXWKea/0rIV07J+CQyknJebpEq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYmx1P7be1fEXao4cTpyen4G1Gw/0jOh8v2wXXuae00=;
 b=eqUJMwLrTz9j2gheu/BJw1Teo5LvjZgXmhksEYse8uAAmI2Wnam979Npd0V2RsiNB+iplMKLlljsMKEoElS4T2tSAQoA66fgmIYq8zyTnf2+brGXK6u8BovVCGxRhLnxokQKT/l4s6Emg4Qrama23+GXXecSJmZTANhw+2/eirI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8312.eurprd08.prod.outlook.com (2603:10a6:20b:557::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 16:15:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Thu, 28 Jul 2022
 16:15:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>, "tobiasschmidl@siemens.com"
	<tobiasschmidl@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
Thread-Topic: [OE-core] [meta-oe][PATCH] wic/direct.py: ignore root mountpoint
 in fstab updater
Thread-Index: AQHYob8pnjmTY5oF5kK8rMRdiEoG9a2SXBqAgAAWVNGAAYS0gA==
Date: Thu, 28 Jul 2022 16:15:56 +0000
Message-ID: <536911C2-925C-47AF-A369-9453B5900916@arm.com>
References: <20220727134512.4033-1-f_l_k@t-online.de>
 <A08B6BB6-EFD1-425D-AC02-457EF8A40229@arm.com>
 <1705BCB17DD12169.1380@lists.openembedded.org>
 <3FVOFR.R0ZY9H7K1WKY1@t-online.de>
In-Reply-To: <3FVOFR.R0ZY9H7K1WKY1@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0a613bc-0b5c-4656-ad51-08da70b47998
x-ms-traffictypediagnostic: 
	AS2PR08MB8312:EE_|VE1EUR03FT048:EE_|AM6PR08MB5237:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 acX8vtorsRhyV/dlxW5lUr/sX6M7pEq7mEIEm2Oy68pWh0rOCrfAeIAG0hG3w/LA3RGNfbQ4WUNlGn+4uiYWuUnckqc9lXtPdaPKMiX1eT4x4TGpDKlu4DczJCSEkwTgavAlOBcMxDmtVAJM8DIkQm/tbubnkCEMb2N+PtTYOQEEo7bf7n4EOiQRMdgC2aImS7L7kJH1hoVHBtSCba/nNDRox5ndqus9AsdnDAlqJOpaUPKcHa1OCU88XqcE94CCwx0iHBaQ+lD+ik4yjYwk85d41LoNDEE3YE2PD6s1mtHGZsSgCk4GzDKY9hdECdgYNVaOxGokkza9vbeInz7NUu58xwcPDOotu9/k+Ml6yGblvhQFQgb0Z7vh2//moSGSmxAB+t6mOcvw6owA4DpMYc7JVPV0WbsZrIuT5u1hz4tMHlmXRnHlkw4MaUKisyAWC5zsP0dCS0ZvLCpwxH4AA0Lb7HUK7JMXtWQGU7jH3zcRF4ybQ6gaoAH1J2Iru/gGPeuojMTIoEXdUkcW630yq7YZh719hOHc5k2pjK3q+BFYYtpeh8mAUSl7tVnhPVjwnGksuffwd97HLEcHKshwNOBNEWbn+WdOZc9a1cyLFAtZYY9STmdyU08/qvdiuFf2FWsZinP9T0yhcAReRjI+HsICDwB2dSR/bp1o++1ipn8jsnl0SJn1h1i/vbdNAxe5scc95Vp/w5RYGwrHBC2g94+Bzqem8aUaExG1ctsoPbdYJFc/LZZUT6jWBTKGgCQOoeNWlAA3VIg7yjBJfLJaTXSMqcju9L/qPz0bNyX1s1VGodQJl4nQgJ/qirlUIJ2okdeJoaH1qO3s2juF1RH2fv2xCLLmou5RSjT9N4U4B2Eb2wepAHDzmo0+3Q5I3NKC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(91956017)(83380400001)(110136005)(36756003)(53546011)(6512007)(2616005)(2906002)(41300700001)(26005)(186003)(6506007)(76116006)(33656002)(38070700005)(86362001)(122000001)(316002)(38100700002)(966005)(71200400001)(478600001)(6486002)(66476007)(4326008)(8936002)(66556008)(5660300002)(64756008)(66446008)(8676002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4D797E5D1F39041A71F741AD2471472@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8947d6fc-351f-466a-347e-08da70b47393
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1gmb9zIAnVjIJ3HEIFqGTN+WkZ5z3D/PM29wpHu8r2AI4DY5RBdLofi1BwjGOM8fFvGVj49xC44A2rZk0M+Ryj8HgVY7eqfLfGCxxUoHjf0CrJaMi6H9o+2ZSzk2wzTYTpl5CPiT4KLmtbC41ixQDYTyve8vdI8nk+KuM0YQE5wKhNSIROfToiwHDy/h8BeuyPH1wq67SIMJkITTUY0pDmW/DCx/djUdogTOqfrYsxUCvd9f40P4InSANnjZnUNoVrcexbNyt1G7D1PFw5jrh4/k9Qm6U4pO8BQz4H82CZCydhpHCFC3LWjH1LxTcu13vJM1NMsbXij9KJs97zwOCDoWpTzL93elk6sLVL6hK77U1i/TK+L4cviD8NB7N7UW/hltnB8WWmUD97LqDS4Zaf1y5qbF+VDHF5b1dA7S3kJHAKnZdXdB/C6wnZObPl5Agvi1kvezZJP60DJInlmmyw80ivICZ5LgfPTJijH2+3+d/++yz0kReb0GvOEeRkZMb6LBNumbfJGn2lB4MSadBoJY9LuqVC95y4OqiI+jaPN0J4aUPdPvaiAnMZmqzJ0IMMOWMUez9+uMlS1Z+PU6pWOMeUYSPMso6VZxwWlEOEDklCqizuDqxrbC0M1N9jZYmTPaGGCksNHj+n5POVrTCoZm+21ZEoG4yE+ijTI755aBav31kCNzg72IK5DKB3LEoWyB5jiLYFMdfxFdyUTmw0mBLduMPvLeDM85aGE5DybXhXrizxtAJZKwHVDDCDIbKpQLcq/1H33qmfvgyqLqEq87K/JP92bUmK4arT24Eq3eWPYEv7FIGUy4g2vG1oCdYKbQBYdBduzGerJ9dggRow==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(36840700001)(46966006)(356005)(186003)(2616005)(83380400001)(6506007)(4326008)(70206006)(8676002)(70586007)(110136005)(336012)(36756003)(47076005)(6512007)(2906002)(53546011)(41300700001)(26005)(82740400003)(82310400005)(36860700001)(40480700001)(33656002)(86362001)(40460700003)(81166007)(5660300002)(8936002)(316002)(966005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 16:16:06.1686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0a613bc-0b5c-4656-ad51-08da70b47998
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 16:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168611

QWRkZWQgVG9iaWFzIHRvIGRpc3RyaWJ1dGlvbiBsaXN0IGFzIHRoaXMgaXMgYWJvdXQgYSBwYXRj
aCBoZSBzZW50Lg0KDQpPbiAyNyBKdWwgMjAyMiwgYXQgMTg6MDQsIE1hcmt1cyBWb2xrIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gDQo+IEJ1dCBsb29raW5nIGF0IHRoZSBjb21taXQgdGhhdCBpbnRy
b2R1Y2VkIHRoZSBwcm9ibGVtLCBJIHNlZSB0aGF0IGl0IGNvbXBsZXRlbHkgdW5kb2VzIGl0Lg0K
PiBJbiBnZW5lcmFsLCBJIGxpa2UgdGhlIGlkZWEgb2YgaGF2aW5nIHRoZSBmc3RhYl91cGRhdGVy
IGNyZWF0ZSB0aGUgcm9vdCBlbnRyeSwgYnV0IGZvciB0aGlzIHRvIHdvcmsgd2l0aG91dCBkdXBs
aWNhdGlvbiwgdGhlIC9kZXYvcm9vdCBlbnRyeSB3b3VsZCBoYXZlIHRvIGJlIHJlbW92ZWQgZnJv
bSBmc3RhYi4NCj4gVGhpcyB3b3VsZCBmb3JjZSBhbnkgd2ljIGltYWdlIHRvIHVzZSB0aGUgZnN0
YWJfdXBkYXRlciAod2hpY2ggY2FuIGFsc28gYmUgZGlzYWJsZWQpIGFuZCB3b3VsZCBvdGhlcndp
c2UgcmVzdWx0IGluIGFuIGZzdGFiIGZpbGUgd2l0aCBubyByb290IGVudHJ5Lg0KPiBQcm9iYWJs
eSByZW1vdmluZyB0aGUgL2Rldi9yb290IGVudHJ5IHdvdWxkIGFsc28gYnJlYWsgdGhlIGJvb3Qg
b2YgaW1hZ2VzIHRoYXQgZG8gbm90IHVzZSB3aWMNCg0KVG9iaWFzLCBsb29rcyBsaWtlIHdl4oCZ
dmUgZm91bmQgYSBwcm9ibGVtIHdpdGggeW91ciB3aWMgcGF0Y2ggZnJvbSBNYXk6DQoNCmh0dHBz
Oi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0Lz9oPTIwZDQz
YTI1OTlkNzYyMmI5NmUyZmIwZGE4N2E4ODZkYTFhMzc5NGENCg0KU3BlY2lmaWNhbGx5LCB0aGlz
IGJ1ZzoNCg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNDg2NQ0KDQpJdOKAmXMgbG9va2luZyBsaWtlIHRoZSBlYXNpZXN0IGZpeCBoZXJlIGlzIHRv
IHJldmVydCB5b3VyIHBhdGNoLCBzbyBhdCBsZWFzdCB3ZSBkb27igJl0IGhhdmUgd2FybmluZ3Mg
YW5kIHVuZXhwZWN0ZWQgYmVoYXZpb3VyIG9uIGJvb3QuICBVbmxlc3MgeW914oCZcmUgd2lsbGlu
ZyB0byByZXdvcmsgeW91ciBwYXRjaCBzbyB0aGF0IGl0IGFsbG93cyBlZGl0cyB0byB0aGUgcm9v
dCBtb3VudCBwb2ludCBidXQgZG9lc27igJl0IGVuZCB1cCBjcmVhdGluZyBkdXBsaWNhdGVzPw0K
DQpUaGFua3MsDQpSb3Nz

