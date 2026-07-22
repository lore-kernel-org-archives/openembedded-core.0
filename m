Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77874C44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 16:05:29 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3664.1784736326152223565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 09:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oFbbVtvC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oFbbVtvC;
 spf=pass (domain: arm.com, ip: 40.107.159.8, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w4VBhq2/ebkBWOJ6y9jicLdKGF5orPY0B4IoCAnpRWzATwsGQ4wtUMtCEO6ZVRXXNkltY0SyRmKMzC/k8ZGVS5k+ueWPLbYnRXq93K7FKYM16RPVWvbfrzqEiXuPM2lhcMa6xOBJ087kzXsba5In9ClPxSapc+sZZv2eommBqhSadopdhuKls6ko60W+glsA1Hen+nOSGYd2KirCwlGUB/cYVejt4QlRW3xaqMiENSJh94zbsFvNjRtj4aEazUZ5RRrKTjIILuMS5qm2QSh/LjsCBNZve71stiZcxvAoqN54HJgc+sd3xy0qzSWZUvxkDEfplHjliWSW7RpM5czZiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPJAl/0S22a7GcPjRO1/wx+HFarwUNN5Kbr6pHGaDIg=;
 b=RxhMuYMyYo4eNr+YIRQkG17sEhn/AYlfdl6TcJv9bFGclSdCMnwrqy0GRtaXKH1N3Te/RrCf4FQ/ZFCdDxcZICWEBUUwkiYBQtZVl9xqxIb5S+0wzafz1XxuqtGRLE0efmPyvSAPj2Jnzpz+gdF9meM7n02wpxxuzV5ToLpjJbMIex1oQ2JvDkOAPqNGn1NPiy+w6sT+bopVHlLU9ztK3QJYVust7ENpDy2oSs9axCC+SvuAaBhsbdtS/pjpp+6TpWk02ZyLf6SWflw7elPLu2dTBbP4NXhPg5aOj37JHSJ3BeDqK5i6p/dLnIe17r4Rf3hO2HagXCqEsGWpPFIO9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPJAl/0S22a7GcPjRO1/wx+HFarwUNN5Kbr6pHGaDIg=;
 b=oFbbVtvCnYoUAAzRoVWq5SP0hUfYPsNv46XoYzERGF+r3H1rMPwgJ8+rlkhLRWJnYhpYGQ/vMnkPFbMIEOkic0Amgb9tjMnhw1RwBKwhMa+pkBpTa2uITmFGCxz6NdQw66Y2mwRc2skTbDHApm2LLxY2lpz9hR4F7TvYFXn2imM=
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by GV1PR08MB9913.eurprd08.prod.outlook.com (2603:10a6:150:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 16:05:19 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::88) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 16:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Wed, 22 Jul 2026 16:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcDbRvnpenhkgtS6EaiyQ/of9sNr85Mexb5bJi3/d9Niq54o0gaq3BFeKEBVSCuD9iGewqXQ78S8mSJ8AlOLslzXvoZb8vPF76QccPF/ILWQ1jtEhVH13wYtScOwA0g+eb6aCINeVNGiv3ZrxwkXhV50ajcDaqmKaZIyp5o3JXVFRjhFFK3CpPH0KQ3GDbNLDF/dFvdZrF6QLUuvhrYFiBmeKRXhs89d0qmjFz/8QIYZU2h/ivRjfmRq25ccZGZghqklxm8nXlqiQci8hmdnfDCvq/65AbJIgu0XhRZdLWWGTyVnCdmirFxdsgsPI3tW7AfuH3PWVtDrPQavCAzKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPJAl/0S22a7GcPjRO1/wx+HFarwUNN5Kbr6pHGaDIg=;
 b=Ol4eVN2rNRmF4s/YJMIfXmHL1FAxq1FgAvw1+no0Iksi6x+rlQOuVsnvX94mmT1XIpHJCeUpJbE6tNJZDf9CaqYqx7WPYQ4EazWo0i74568IXjoM/dtO0DJKrqxccWmRa8jVZZ5EdxmeixJb/uWocgUzj/f9xrW8jI6KSMEM06Cy7l8OlPVV5To5RCtEHPW8gIWE/4bklJwtcoq4rkP11ONwmdamy4uA3/NHz7dPVpv5/7emQJZt+moqsL2neCkKw2S3ZQfrzOqrDXdtPwIzgY3I5gDow25v9N7uR/83OKv/d8jOFdVr+tHyUbBhHTmvNZsJni1jnlU/vodvb/RL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fPJAl/0S22a7GcPjRO1/wx+HFarwUNN5Kbr6pHGaDIg=;
 b=oFbbVtvCnYoUAAzRoVWq5SP0hUfYPsNv46XoYzERGF+r3H1rMPwgJ8+rlkhLRWJnYhpYGQ/vMnkPFbMIEOkic0Amgb9tjMnhw1RwBKwhMa+pkBpTa2uITmFGCxz6NdQw66Y2mwRc2skTbDHApm2LLxY2lpz9hR4F7TvYFXn2imM=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB8488.eurprd08.prod.outlook.com (2603:10a6:150:b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 16:04:13 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 16:04:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "enoch.ng@windriver.com" <enoch.ng@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libxpm: add ptest support
Thread-Topic: [OE-core][PATCH] libxpm: add ptest support
Thread-Index: AQHdEvk5uGT5Ecc/dEy9+b24utJIQLZ5wXuA
Date: Wed, 22 Jul 2026 16:04:13 +0000
Message-ID: <ACC7FF2C-FBAC-4602-865A-29AA66B5B2B9@arm.com>
References: <20260713185431.846849-1-enoch.ng@windriver.com>
In-Reply-To: <20260713185431.846849-1-enoch.ng@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB8488:EE_|DB3PEPF0000885E:EE_|GV1PR08MB9913:EE_
X-MS-Office365-Filtering-Correlation-Id: 427c9472-a855-4e44-0876-08dee80b059d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 47g8V4qZtZ5XIBWDZC1gOQyUwBAQDu4bIwWe9CA67za+NYpZqMkIiLDzidYCOL1GJd8r+GhhrJkjROlJSWo/bx3qGdH4y4ZzcWQcX5vQaVz3nmtIp/6j8kAluvm5av8prjzV+tQkRzkYXJ/vwv4q+4kvoUh3ljtOvstgYQvxBfbTZWs35VlXRxX6qp3tZNFNBTWW3voxFIT55CH4HMRHRBSaAsS98C8cu5EzlvOd3C3gsLlmm644ZaLtwsWxfNchHeVs7NNyP2JVbdsw5a0h92WVicz6cvGw5ozg7o/2eNrQTUSBVGL/mhVCwFv8YWjjk3MqGvknqkhvTUB23l15cJ7pL85TTzaju9ftQImgGwHZWufBmpUcUNH9OD0EEVNrmfO2f8xr+irXL60DQ5kuElDotaZ59Gu3b94U2iebS7dulXc2S/15Aceu/41cAUJ0Mz3dYKCEn8OeEZjaxKs084m8dQZ48H/2X/8B582t22nJ6sf8sGrx6xkafjSspwd4bgZiPTnN43Ac4XswV+QhRM7b2vQCMGHr0gNSzep1UpZ7KPX2TD4hJEgzlqF5JjkRqEZlOuf6NVutAreIq+mtw3ckguvZFV4fTK//LI0yFtqFsDB70YhDEDOpMSKarzO68So16JAngEhghkKuj+lYL4Y781c9d7y0DlC6lFAYsj7x+ZsX/Zelumg/XkYVEShSFOp8K5wVGlt7lFWr7qP6VizVfb4fwPmgMnzUM3BS1lE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9E100AAE4549A48A105B59BD0C61F3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 XPySlwLpMZVeaEQOwbU8A7xIb51BhY2tDGrq1bMdFdGtTHSCUsudM6qugWwUvTwev5dUXHtVGFAYLsDf9RtByLhxcjduLpwRaI+iGplfxyiDkqeugywsumQnsW1DAQo8WuMGK8vzjV6Kvz3pcpe6NulpU4609ECF/tz1Od2qxsDXOyhw4pdziIWMRQYlvxdM58Zb8sq34P/ehd2QWAQsg+FDjeKbB/Ut9TTMWMf2sQJ6SSVXAucH4olU/DxiY8L7PKJT6Iq2GjgCxqktwSpv1w/p0RcmcUUWndexQkWPS+tsRqiEK9R38Gv9+DXAFvCIGymfJh8VZK8DzVpRQa+R8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8488
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ed873521-c7ac-473c-29c0-08dee80adff7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|376014|23010399003|14060799003|1800799024|82310400026|13003099007|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7Fq6x0fLKl0PW5EVGY5tFCgSs9HuxBFC4wQ6Fb5PJca09p7dYkoi7dV6xky92eMBpIWc0DNRu1d6aUpqrcLLuvL6ivRQMyz5MbFlbZbwNrbBaUHkUB6ZBxveMnAEIF0HNweWI05uPM2uV/s14Zrq9yEtLTEj5nWTrIrfxXKKh62devP5kW2IuQiACiqkX0uAzH5+1Ckl0REz1XXPwiGgGHPOytgMh/zZIBBbHhEUxqWUyK0pnmgBw04y4Tq+b+lNEK3VGuXrPiz1C9g7z26yiVzzOONWPr+pElV3e59nArqP4Nj/nIwGZHISRTQ3SItOSRlNwP9TCBNqNPtr7xt4heEUukBls/pv3L398Oduc49nEA4+nJRtOeejMuhZniF3iJhsEJ2l9QxECwK4hE2kkW1mCQ4YDGn/patBQ6IZqd2AP7fZunZZGw34YwjTdhtE2JiwxlURJcon1tFJnydTA/J21qNnloylJiVBYVQXknL60a1WPDTISm2bMknVUS1GXEHiW4A8yMotts1bpsxppXoaflB0JgLU+7KzOM867SccLEb27iP6r2rxa4kQ5y89PeZaPTJLSpCc6O1b8SrKZMZmFfy3kwv+rH4LzjQb1yxW1HAhh6bF8Bq9GYWT3+yOLxl441dmGeW495MbwT+iDyti//HmlcceeEEFLgX9zvJIgEorxpdTxtjFBP4rUx9sMG8awUBMkv6TuExGjJK1hw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(23010399003)(14060799003)(1800799024)(82310400026)(13003099007)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vmmKE3uKeNN9pHGp6ewRkWl0rHMCRNKJKDvFxP9NQnu7TR8YRgD48AboEEFS840YMWu0uOzV8mB0s5zSYzIMKB66TwC+NgvafCRDiuBLQ+o6GXmrIV/tt/HsZYoWyIsOn2qkLAlULTl1vewuBzEpwCl8fuMy+jRuPvk1gTbqu3cRCtqmiU/GtaMIdXpd1EI1EupbbJgGpBNFS9h96ty7vPaXykg11GXoKuZSzHKr/xbfcEdhy4DFG2mA62HA01WXQpi2Blz7/Agn+taUMvDvGFnSk0nicC3M6IBGo/88+13qVko5ZxGyDNqihP84A4KhXJXadcuD1aglEXtWadJqi2Komot+oeXhmynhV9oTxb/n02BieMH5m2bgYD+jtY8HRQ4SmVMqcxrXi+tWJANoFdKvVQU60mmo3mQphGiiexEo19GHpPc3BXbAveR6s833
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 16:05:16.9166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 427c9472-a855-4e44-0876-08dee80b059d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB9913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 16:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241704

T24gMTMgSnVsIDIwMjYsIGF0IDE5OjU0LCBFbm9jaCBOZyB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8ZW5vY2gubmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG0v
cnVuLXB0ZXN0IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhwbS9ydW4tcHRl
c3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMGJhNGU3ODhk
Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxp
Yi9saWJ4cG0vcnVuLXB0ZXN0DQo+IEBAIC0wLDAgKzEsNDggQEANCj4gKyMhL2Jpbi9zaA0KPiAr
DQo+ICtURVNUUz0iWHBtQ3JlYXRlIFhwbU1pc2MgWHBtUmVhZCBYcG1Xcml0ZSByZ2IiDQoNCkR1
cGxpY2F0ZWQgbGlzdCBmcm9tIHRoZSByZWNpcGUsIGJldHRlciB0byBzZWQgdGhpcyBpbi4NCg0K
PiArZm9yIHRlc3QgaW4gJFRFU1RTOyBkbw0KPiArICAgIGlmIFsgISAteCAiLi8kdGVzdCIgXTsg
dGhlbg0KPiArICAgICAgICBlY2hvICJTS0lQOiAkdGVzdCINCj4gKyAgICAgICAgY29udGludWUN
Cj4gKyAgICBmaQ0KPiArDQo+ICsgICAgLi8iJHRlc3QiIHwgXA0KPiArICAgIHdoaWxlIElGUz0g
cmVhZCAtciBsaW5lOyBkbw0KDQpbIHNuaXAgXSANCg0KSGVyZSB5b3XigJlyZSBpbXBsZW1lbnRp
bmcgYSBUQVAgcGFyc2VyIGluIHNoZWxsLiAgVGhlcmXigJlzIGEgZ29vZCBjYXNlIHRvIGJlIG1h
ZGUgZm9yIGhhdmluZyBUQVAgc3VwcG9ydCBpbiB0aGUgcHRlc3QgcnVubmVyIHNvbWVob3csIGJ1
dCB3ZeKAmXJlIGluIGx1Y2suICBUaGUgdGVzdHMgYXJlIHdyaXR0ZW4gd2l0aCBHTGli4oCZcyBH
VGVzdCBmcmFtZXdvcmssIHdoaWNoIGdub21lLWRlc2t0b3AtdGVzdGluZyBjYW4gcnVuIGFuZCBl
bWl0IHB0ZXN0LWNvbXBhdGlibGUgc3VtbWFyaWVzIG9mLg0KDQpVc3VhbGx5IGFsbCB5b3UgbmVl
ZCB0byBkbyBpcyBpbmhlcml0IHB0ZXN0LWdub21lIGFuZCBqdXN0IGNhbGwgImdub21lLWRlc2t0
b3AtdGVzdGluZy1ydW5uZXIgbGlieHBt4oCdIGluIHJ1bi1wdGVzdC4gIFRoaXMgcGFja2FnZSBk
b2VzbuKAmXQgaW5zdGFsbCB0aGUgcmVxdWlyZWQgLnRlc3QgZmlsZXMgYXMgaXQgaXNu4oCZdCBk
ZXNpZ25lZCB0byBpbnN0YWxsIHRoZSB0ZXN0cywgYnV0IHlvdSBjYW4gZWFzaWx5IHdyaXRlIHRo
b3NlIGluIGRvX2luc3RhbGxfcHRlc3QuICBodHRwczovL3dpa2kuZ25vbWUub3JnL0luaXRpYXRp
dmVzL0dub21lR29hbHMvSW5zdGFsbGVkVGVzdHMgaGFzIG1vcmUgZGV0YWlscy4NCg0KPiArREVQ
RU5EUyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwdGVzdCcs
ICdnbGliLTIuMCcsICcnLCBkKX0iDQo+ICtFWFRSQV9PRUNPTkYgKz0gIiR7QGJiLnV0aWxzLmNv
bnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncHRlc3QnLCAnLS1lbmFibGUtdW5pdC10ZXN0cycs
ICctLWRpc2FibGUtdW5pdC10ZXN0cycsIGQpfeKAnQ0KDQpIYXZlIGEgUEFDS0FHRUNPTkZJR1t0
ZXN0c10gdGhhdCBpcyBlbmFibGVkIG9uIFBURVNUX0VOQUJMRUQgaW5zdGVhZCwgdG8gY29uc29s
aWRhdGUgdGhlc2UuDQoNCj4gK1RFU1RfVEFSR0VUUyA9ICJYcG1DcmVhdGUgWHBtTWlzYyBYcG1S
ZWFkIFhwbVdyaXRlIHJnYiINCj4gKw0KPiArZG9fY29tcGlsZV9wdGVzdCgpIHsNCj4gKyAgICBv
ZV9ydW5tYWtlIC1DICR7Qn0vdGVzdCAke1RFU1RfVEFSR0VUU30NCj4gK30NCj4gKw0KPiArZG9f
aW5zdGFsbF9wdGVzdCgpIHsNCj4gKyAgICBmb3IgdGVzdF9iaW4gaW4gJHtURVNUX1RBUkdFVFN9
OyBkbw0KPiArICAgICAgICAke0J9L2xpYnRvb2wgLS1tb2RlPWluc3RhbGwgaW5zdGFsbCAke0J9
L3Rlc3QvJHt0ZXN0X2Jpbn0gJHtEfSR7UFRFU1RfUEFUSH0vDQo+ICsgICAgZG9uZQ0KPiArDQoN
Ckluc3RlYWQgb2YgaGFyZGNvZGluZyBURVNUX1RBUkdFVFMsIGlubGluZSBhIGNhbGwgdG8gbWFr
ZWZpbGUtZ2V0dmFyIHRvIGdldCB0aGUgdmFsdWUgb2YgVEVTVFMuDQoNCkNoZWVycywNClJvc3M=

