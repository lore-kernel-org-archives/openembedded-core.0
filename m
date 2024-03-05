Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3F4C54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:47:05 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web10.28363.1709657216615188336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:46:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fS7wRqRF;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fS7wRqRF;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MTcgv+gA4F6MxjJqdSBgakXln8QTyjLZl3BsNATvJyxKqsLWYH/oCvBgYKkUE5WxclGW0vEuyduuBk+JcVgBRTQdH/PTnbIL2XlDnAj8qzQPdl9/3e9p5GWcUQ1UtAr1OJupBDjAn9CfininaeejwYPpoPe8L3+kd9CB7IVg1MV8+wKU1bdHONCUWxe5haz//S8/+Lpl3FVZr3a6xwvDW2wExR9d/k8uiI8Vk3smJNmZSIv+R06P2BXo+Ugm9hI28eOhPteQtRIa+ftxvbpY5hw3Wz1FdZWb1e0NC57rEbhIUGz7nUsImeWu6K8WMVIngRvJP6DdDOxEG0Y0JRUeuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBmNre52dNeZoVhWsC0dJcSOe9SLxATrhk2zgJDhJUM=;
 b=JNRJPl+eOOREqsMxo4SR5TM+5YDuCYfH6JK5wZ26qKjGIbirX/PKYBOIL8RCy3xKoSE7EKFZogFA0zIvu3exK1BT/dLVKvWMPHJCBZ0P3UcGwc8pGiOO0wolxRKSRqWYPg2S7rh14t+Rv7cSTJA980JlryUzXBVCvvHDmTCwQEcyRg3GalpmvgNq0cVrYERRsSbsWSyOtTOZ00Txa5G6c3vWGyY0TR4JdyTj1fZEu/mNJubdabTxA3vya01LcZNKN05Sg4aFN+hdAVq4TusDD6jZYNXbMqkZZ8CMtOf0rzFNZ/nzoW+fSlbscKUKuHwDn9ixZDWwdiCemTEVBtsnow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBmNre52dNeZoVhWsC0dJcSOe9SLxATrhk2zgJDhJUM=;
 b=fS7wRqRFzbJVM7++FaGTCRFrHygsQfrh/FgKNcqBxza3uCatkSych5nfyZz+sxQrBeawM56GoQrQK0h9Suuj3HosOAS/RUfh8JV8vqE9QzLt+wLK3kLMiwC6QGi+4wY94V+OlD3xVk57s4eb8kOLRsGjGb1unXEyTi41FQgFjaA=
Received: from AM6P191CA0082.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::23)
 by DB8PR08MB5402.eurprd08.prod.outlook.com (2603:10a6:10:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 16:46:50 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:209:8a:cafe::e6) by AM6P191CA0082.outlook.office365.com
 (2603:10a6:209:8a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 16:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 16:46:50 +0000
Received: ("Tessian outbound 7b0d57313a48:v276"); Tue, 05 Mar 2024 16:46:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 712172650085ce04
X-CR-MTA-TID: 64aa7808
Received: from 66617babd6ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 170A2C88-A322-47F5-B669-8360C97EAD16.1;
	Tue, 05 Mar 2024 16:46:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66617babd6ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Mar 2024 16:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC5aE/p4rl1sWw/5HjXjz+3157NAFZniiDR9NPfk9ODWPSPqn3LPy0xw8Q6wzqWeLJDOKJnRiZIoNqelw93rpNw5pNaugEv7KVbS7FTFwUhbkiIdUH7TsBGPZzOZb4a3JTLXRLu3eJ1Np9+iEJePQgOCd9IyMrYxfROaiyI2eYDeHCIBxLffWPZnLE9ifv8gcB7ZmHdnluz6m4rOUbB9Z4e75eCU8IlrcsLNLBEo7qVtbgSbC+g722nhLpm48XYAKoh0XNE3K5lpbvgduYgGehsk7W0c0DQHJFq1mSEoxBZ4INyUDERYeR5Spu+D0om1xOHcVtk6yXK0QEzSgeWC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBmNre52dNeZoVhWsC0dJcSOe9SLxATrhk2zgJDhJUM=;
 b=YrN11Co/3fQH8CaLMjK6P0TONfP6ifoojM+TZXZg5/kO6bD2h3Euzczqqj+/EsfwBoudWon+4aLhvzlJGUmoJE3tZQDxz7v3qHUs+ocfNA157BZyJkg1DJG9TzEgNTNnN5NEJiNL+m5d/GFn9dY7+AW32hYEQpgDW7loPiYkEjR7Bfkr09FBs6eTCEOFzD7+tn47f7FfvYOYoytvrKXKYgeUNuvAk6L4nlFGqJoO8ar/w18jwtgI5HwrYl5+LV1Hk36xKuy3GK8ILVK5N+9iJjOeKZu/+XCcfwmF7irs4naCjON6dOfRVc4x/hp2qE7ZK6M+WJ0wCqwbK/9CUv8V5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBmNre52dNeZoVhWsC0dJcSOe9SLxATrhk2zgJDhJUM=;
 b=fS7wRqRFzbJVM7++FaGTCRFrHygsQfrh/FgKNcqBxza3uCatkSych5nfyZz+sxQrBeawM56GoQrQK0h9Suuj3HosOAS/RUfh8JV8vqE9QzLt+wLK3kLMiwC6QGi+4wY94V+OlD3xVk57s4eb8kOLRsGjGb1unXEyTi41FQgFjaA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 16:46:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 16:46:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] kernel-module-dirs.bbclass: Add class
Thread-Topic: [OE-core] [PATCH 1/2] kernel-module-dirs.bbclass: Add class
Thread-Index: AQHabkzFPVp5ZDlieEq012VywGeK9bEpXL4A
Date: Tue, 5 Mar 2024 16:46:41 +0000
Message-ID: <80FAB562-424A-43D7-A4E1-22D420BF0ADD@arm.com>
References: <20240304155732.2267310-1-pkj@axis.com>
In-Reply-To: <20240304155732.2267310-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8393:EE_|AM3PEPF0000A78E:EE_|DB8PR08MB5402:EE_
X-MS-Office365-Filtering-Correlation-Id: 40364937-8f68-4829-f51a-08dc3d33dab9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qWo+bJ/K3icyu51S5akwX/suWbTGQjajhM0mcKkR+N0E5k8YOOUTuggyKg6uirOaHHLePJvr33di66w9FC/bbb2RbN+jGJRff8y/fH4Q0oqub472oJCOR9H4zQufcxWc4OAfjUge1l96tHOXoTro3o4/88BZP/BrMBlQkbstSln6fubLbLdf/YLuJXRzTCu7Q8JT5sebSnBKZMa8xu3QgVP9xNfbkyrGLw42yMp+7i3ZnZrA+Y+McK02KKhziKIsLOXki2JY6XfJh+chqKEdefeJmiuy+ijcbmgA64UUdcMZNJBOjOCBsNgBqjp7ITPsG6DJwXmfm0Ec1gSqHcnmryFpVzLhqsYbvN6Kjy7+UcwDYZ2uk71A+lvA/bjqrSYKyguGczXQqxxZylAwJ3VUQDTiip2jI6+U4/8EH2JG38De3dayCnYI1OHGNXRNrES8sX4UmW7cKjaZD6jOCJuBy75SBTAXdDnD3IvhpkzWZq0Yq3AwBtVJSQT+/467ZaxwWyar/4nuv71/BbL85/UorKA1gjwN7zKBCCzTPA9O/kigSxNyiwFqmedcacmboDeDaIogEHFBcBJapks5pQbubj9hFKQM0P2dd0EwyvHKGaloajOexnDKMbZ+N5YPcOzPY7jZOXw3PZLlDVZ0PiWhQaRTzglhSB37S7CjKRefvtcBpsIWxXB1rQhx+3CpHc1y6QxW7Uy8JdISl+UdJT0Hw7+RtdyfoxkTFPhjwXaXXC4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B536B151178FC841AFAA494569225178@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1abe249e-b84c-4ce5-334f-08dc3d33d57c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hzW8WmSEzulImbi7IaWKOLu4Cc0ExR7SqeYPoofvYk8t9jjkf6PJkd1Bd/WYqsgN1K0x1rCvnapAtCT/gbwQW6pqjNZtQ1DM9/OyxMOSBEZ7BGY4z6hpmWqgiUMih/brxSiPC6pvLjeWcuNz0waBGlgjM5ILeBafntSmabR6VdM5L6hGPnYagFwP5PqXrewNo4n2RkoEgylpkYJfh2kavFPYHQe5GAQmHStOWIkwZigjucOyLOybsdErrYBuQmeX0usdpjp7JCyU01FiyG8GdKjVI/uyEl8f3HO/XUpLeS//PBwt9cLVS5//iiXdw5eROpH6xPDfNt8+lafCXddj1UZp44I5ORjVYcx+35NREvusnmv/nogwt89Y81GwFUuwlU2Btu4tSQWJi3pMd4p3RYgPXozQjr+okYpErOMx9IwiCVUirG+3rKZIwRUtJZtm76pmVb9RPlKz4nBwkfX3wl/Z+RVxVb8D6j9yK/bsVxa+1Fstssn+GKX1IWMKrI10V0g/AHRQiAMefxuBDB9JIEHqsmWt2RqpBMaNU7Fg1h+UtT8Ft+Pz0BrSAgSMc9ZvqAUiar9eu0AHUwBuGI0R/mjoFAlQ8LV0Wq/GaJjsRWeUFbroGod/hUc3s3eBiGUfyQZ+Ncxuxi214ltcGVUdfKs504B10HfFcxnSB3tbWsvb7EA3o1swogIqHUKLKp6+YWI1EQed4JybTvpMET9fpAbw5hXNXVSwyeOi+XG3WH8OuDz/+5/z5uBRHcZmIrwW
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 16:46:50.0764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40364937-8f68-4829-f51a-08dc3d33dab9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196642

T24gNCBNYXIgMjAyNCwgYXQgMTU6NTcsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiArbW9kdWxlc2xvYWRkaXIgPz89ICIke0BiYi51dGlscy5jb250
YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCAnJHtub25hcmNoX2xpYmRpcn0nLCAn
JHtzeXNjb25mZGlyfScsIGQpfS9tb2R1bGVzLWxvYWQuZCINCj4gK21vZHByb2JlZGlyID8/PSAi
JHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdzeXN0ZW1kJywgJyR7bm9u
YXJjaF9iYXNlX2xpYmRpcn0nLCAnJHtzeXNjb25mZGlyfScsIGQpfS9tb2Rwcm9iZS5k4oCdDQoN
CkZlZWxzIGxpa2UgdGhpcyBzaG91bGQgYmUgZml4ZWQgYnkgY2hhbmdpbmcgZWl0aGVyIGV1ZGV2
IG9yIHN5c3RlbWQtdWRldiAocHJlc3VtYWJseSB0aGF04oCZcyB0aGUgdHdvIHJlY2lwZXMgd2hp
Y2ggYXJlIGF0IGJsYW1lIGhlcmUpIHNvIHRoYXQgdGhleSB1c2UgdGhlIHNhbWUgcGF0aCwgYXMg
bW9kdWxlIGNvbmZpZyBmaWxlcyBjaGFuZ2luZyBsb2NhdGlvbiBkZXBlbmRpbmcgb24gd2hldGhl
ciBzeXN0ZW1kIGlzIGVuYWJsZWQgaXMgdGVycmlibGUsIGVzcGVjaWFsbHkgd2hlbiB5b3UgaGF2
ZSBzeXN0ZW1zIHdoaWNoIGJ1aWx0IGJvdGggc3lzdGVtZCBhbmQgc3lzdiBhbmQgZXhwZWN0IHRv
IGJlIGFibGUgdG8gYnVpbGQgZGlmZmVyZW50IGltYWdlcyB3aXRoIGRpZmZlcmVudCBpbml0IHN5
c3RlbXMgZnJvbSB0aGUgc2FtZSBkaXN0cm8uDQoNClJvc3MNCg0K

