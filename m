Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0100C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:42:51 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.57])
 by mx.groups.io with SMTP id smtpd.web11.19458.1713271366934624704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UMWTl0+0;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UMWTl0+0;
 spf=pass (domain: arm.com, ip: 40.107.8.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jiM/8w6T1+mvm7QmFwnCPElxC7tCfzW1ZdpS80ce+aq5vaPcZBSZ6nmHZJCb9HfXRqWfnjeDB2TW9OzMjrzNSbmvDR5llpsI8VhDT1dNmdEuhqo76ioU8+U79GUjSUsHf/TsH0lPvwCQnUt1eFMX5GlxcFyoy4l9RxlQM4AwcTrzxnryfrf8r9XIsA0YL2etMREK/k21ZIfR+RWBnEBIfnmeD/HCQBbnFEgP6cnuvoZdtE0B0iamrfnr1ypREKr06FnG7R15fwGRfzks1Zukvg52o+F5QNRqoLWdCsqtV7vptLZA9JJweZ5lYvaHU0lQyr2CjwY7+h/sCRqxpLpQMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZLt7W9EF2vEarxC3cNHu2m/xum3QtKSZiVXwpoJtJ0=;
 b=Qkqwdv0TW59ujlgLIt0mgH4zmLvBWjkZg/4wsWFcKULX83aMuLFQizFp5OyD50VVcLD+g0HD8hWoSDH5kw/wOjE40a3ytDY+cH0R8Dv4Z6nkiZVxvXyRrGzvPksH0oHWocgcZlYYdtTDL9unExEr1uVGJhkFldDDuxdLVtnrK+Sd4NFxp1KN5boS9m8vI8EKh7T3bkHXc5Kkzi9Dm3qm/uNccXT+WhtKSdBjkbb94RFxRzmvyYu+GjgfNEKh2D6Zg4CWzS0EXJ63BuDrydK2lmmXeaCStJiP7QjUoz7HKA/iL0EZkBZx8Sn7AL36IJRLnpOWMM+6gVs4gT1gXia82g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZLt7W9EF2vEarxC3cNHu2m/xum3QtKSZiVXwpoJtJ0=;
 b=UMWTl0+0/PpqhZ+obnUGGGQ0Cy0ueE72gH/evfjeuHTn+5hT1wjqwGIznoq8bDSxJLt0ysPJ2CiKEn+BgBbi2MNQk3BoXWBvjHA5YFFckzFMj3Ttx45GJAJxUSPuurh/QO1fHPUM0GRmAG/kkFeqOrxPhXuwUGyJ5xHDdBmoqtc=
Received: from AS9PR06CA0297.eurprd06.prod.outlook.com (2603:10a6:20b:45a::35)
 by DB9PR08MB8508.eurprd08.prod.outlook.com (2603:10a6:10:3d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 16 Apr
 2024 12:42:41 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:45a:cafe::ac) by AS9PR06CA0297.outlook.office365.com
 (2603:10a6:20b:45a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 12:42:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Tue, 16 Apr 2024 12:42:40 +0000
Received: ("Tessian outbound e14047529286:v313"); Tue, 16 Apr 2024 12:42:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51545757a961633b
X-CR-MTA-TID: 64aa7808
Received: from 5a8bb610216f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E6465DBD-EA8C-4274-8369-AD526C1C827C.1;
	Tue, 16 Apr 2024 12:42:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a8bb610216f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Apr 2024 12:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkR4XPsBvygpad64bOOpmo5CRZKxmRzlgOC2jr/LG6QrIBBMZkoMItUEM+sHgxGdnFxsf/q09iGHCLG5FRiWGUYKnBAVgOi8/MxF2FZLD8wfQ0jxFIiXsoveHr7jbX+dY1rNjGLp5RHg0doFF1jPAkcQ0YYjpVUPECOq1UGL6qI5RvVkiz91T/Z2gcUlkdZ6npujPYTVRAzBxJRTIsC+EuXZIyMFUWsS152EXMBvwh4dNYymigNi6LfFxGxCM0+2JxVEzmq5HQ+qFTYio7Eu2SYwRgthkdcYdekDDkaBTHtckUxs+uofMb5cYOIIzwqzAE1fLs5LqVnsoHvXEuc50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZLt7W9EF2vEarxC3cNHu2m/xum3QtKSZiVXwpoJtJ0=;
 b=aM9Komp9SZkNSyDEMEh133+sH6G1CoNC/fSzngYtSNt8hKi7MlL6+glm6LrY9qYHt6DUYy4amI+KiBZa8gCeB83svYY+NByvv88d1xWXKJWxqhxvGi1QfAVvV8g4QL3OmHL+faRvpaF0W1rzfJqdoxkJi87QxuUVJ2/a+gylxayiLqJ3VmFJc/uveBq4M04r2BRgDhvL0QwiU8FmP7mM0yPjRbSaN6bTvbUCodPJnu2GsN6lTw/q4xVXMoV1GhZVcXhzbz3InHBypgg1bg2j0LWeguPDoIcbsmxyLkSjvCoS/E7iPfO01rWUY8edSV6st/40fiyLUx2/TV+nrchXlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZLt7W9EF2vEarxC3cNHu2m/xum3QtKSZiVXwpoJtJ0=;
 b=UMWTl0+0/PpqhZ+obnUGGGQ0Cy0ueE72gH/evfjeuHTn+5hT1wjqwGIznoq8bDSxJLt0ysPJ2CiKEn+BgBbi2MNQk3BoXWBvjHA5YFFckzFMj3Ttx45GJAJxUSPuurh/QO1fHPUM0GRmAG/kkFeqOrxPhXuwUGyJ5xHDdBmoqtc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9365.eurprd08.prod.outlook.com (2603:10a6:20b:597::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:42:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:42:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, "vkumbhar@mvista.com"
	<vkumbhar@mvista.com>
Subject: Re: [OE-core] [PATCH][kirkstone] openssl: fix crash on aarch64 if BTI
 is enabled but no Crypto instructions
Thread-Topic: [OE-core] [PATCH][kirkstone] openssl: fix crash on aarch64 if
 BTI is enabled but no Crypto instructions
Thread-Index: AQHagDgungkj2FMrh0CVRpFt9QjiO7FOGDWAgACiTYCAHDwZgA==
Date: Tue, 16 Apr 2024 12:42:32 +0000
Message-ID: <A328C99D-E275-45C4-A911-D86FC48AE45A@arm.com>
References: <20240327111523.855715-1-ross.burton@arm.com>
 <29693.1711684265473117694@lists.openembedded.org>
 <CAOSpxdbCRMVfXhf7jOVYA5rgu1nayGW03NiDk5yWj_kJBU24jA@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbCRMVfXhf7jOVYA5rgu1nayGW03NiDk5yWj_kJBU24jA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9365:EE_|AMS0EPF00000191:EE_|DB9PR08MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cb50da-2175-4117-ba0a-08dc5e12b477
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6iD0Z3r9cVk8y0R74qV/ZVFLNZ22aFjiGV2fXUlaA6+mhSbUpgVMYdYcHldDF7C1eguDgRhW+R7EdYMzExw2ek9uYI74z9t02Lm4uOoHvGF5DXJ09cnK0JbSrRnh739X6/FWdeJQNxteZmzJ7q+DQayqfWm/ctR2DHz0/B9T1jSPKwdyGpdvFT1KuQZIZRqD4YHrp3GvnwFjLKAI3TLPnY5XsMcscTaIkbgcP/y/ossqmgK4Glb2sNuHjo07GY7SFjuVyip9k9Z6+LRx/d6SaEwtJXfKJTCMMlJYo0r+szMbwHXWFS0UE/FfetdYztgpiSSUoGvSMITF5PACoJ7dhNr+JjazsaCN26ANlOFLsYP378XJmTzjY70i00nqRp1BUwxFURdB/2VvKo19lKcKWSeT9Gb37omWuI1shcyRhCgjGzxRGoaJU+ffwmiK5cBFSVl/wJd3+Vk49kP/MinTV+wHgBaXWhnQIhmsRbLxFrNky3eMmwZsjem2Z19mwUjNS5RTrStIjK+BUq6qMFreiGjtJ9u23xaR8Z4MS0rUiwkEb2eJRiBg+fhjohO82gHRGhCZvsKRPQHB/jSvP65G+TZXk7seDIdCk3R1lZfqiRSedzEDpsEaBwXQ2Gjt9qNxmLzhCEHquAQSX4d2nK2JupdvGQAjKjBIQwNjT0eeJ1FnPIp2s4Qw5btXWGhvQgjJP9dte//N5po3brSaTobxgA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B88F66D3F1BACC49B7979BE9D83AF463@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eaab21d4-fdd0-40cc-80cc-08dc5e12af48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3sfijZ12sZ0PGkc4iHWYDIlt4vgVb+uL4epJ1t+oK4m19J4XC9tcCkCepLEIfI4O7dBuUGnn1g4Z8gjaqydXlOfA27gHVEPhiOIuPahhfzybaBEuoUmvjd30AMRZBpjcp1L56BqI6clMiU9S/SXEJ1tTG+Jfkld7q9QOenTVixqNtWmT4DnQaDJbOR8PC+y8ZdEDYA+G8BuwYm1TP6vi8eRjUbtWUVMxGqyLPgjezOHGJHN5t7rr9yJIB2mkntYWKretWupNwijndF4tuvEofn7lEGyNJzDCxIScIa5LMo5v1JabG9/3lMmgyVFmmYhckzS4aUrKytCYp3spudfaIptGqF/CP6/pG+4wyY4IYXcGdmWsnS0NUYTvcnVxg6iWxnCrJMgKa9/uw5THZwhaJI7nZ5DSsytC8jaF7qfHC61CZNMadxLzWgOwknx4X8qxFJcKeUaKWY5ouURfO0crflWrkbC1tSiR5dhb4iP5/W0nyTnCNErcNZiL9URHhqdG6bbmoKHQdTs3HpwB1KYo/zkLVCko9l1uyHD0r86tTIsDNnf8YFTW0REkCaNF/PJjFnhlFisGRjj8pln8e5wo3Yy0jJAgSyB1Ta2ceahSgzyAa91IP6Sbufuj/LIkaEK8QmSw/qZuT3v7CVF1XAMCNt+D3F22UGWoToQiUV6jVDEc0c2AWT6YXerRxhfIeIYAm7GfDtwd/oZ+Voxb20R5jakUkLbPyzC66jy3/j8tCWJhqbbLj5HGfNQ3wjd3/uAD
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:42:40.9310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cb50da-2175-4117-ba0a-08dc5e12b477
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8508
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198449

T24gMjkgTWFyIDIwMjQsIGF0IDEzOjMxLCBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNv
bT4gd3JvdGU6DQo+IA0KPiBTb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UsIGJ1dCBJIGZv
dW5kIHRoZSBzYW1lIGlzc3VlIHdpdGggdGhlDQo+IGtpcmtzdG9uZSB2ZXJzaW9uIHRoYXQgVml2
ZWsgZGlkLg0KDQpTb3JyeSBmb3IgdGhlIHZlcnkgZGVsYXllZCByZXNwb25zZSwgSSBzb21laG93
IG1pc3NlZCB0aGlzIHJlcGx5IGluIG15IGluYm94Lg0KDQpUaGUgcGF0Y2hlZCBjb2RlIGRvZXNu
4oCZdCBleGlzdCBpbiBraXJrc3RvbmUgc28gdGhpcyBpc27igJl0IG5lZWRlZCwgSSB0aG91Z2h0
IEkgdGVzdGVkIHRoaXMgcGF0Y2ggYmVmb3JlIHBvc3RpbmcgYnV0IG1heWJlIEkgZGlkIHNvbWV0
aGluZyBzdHVwaWQuDQoNClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSwNClJvc3M=

