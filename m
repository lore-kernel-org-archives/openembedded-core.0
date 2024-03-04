Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61065C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 12:29:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.97118.1709555389705484522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 04:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4mH6ofKx;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4mH6ofKx;
 spf=pass (domain: arm.com, ip: 40.107.241.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dWM5vhRjxAZqV6bsqg2F5Kvp9nnXYe2DRGlKz7Pl6hxrT80cIiZSzh+A4/BIZtshosL0Ay6ah0pjC1Q0RyXvfdyuj6G0BqhzNZWH9YMNw+a4BfcVv85icLbucKJq/tI2865BxQ/5GWdXHt3xL0WmaJdgKhq3gOAxrvsHfkXdPIts3qXsO4E85E1YBNkOxkijWAHiIweTX+rOYi3GYi2M62H8pbAkwlqzarTCzucD3wthDkT0vl1q3V99Y/GngfhU9EAeYmBUWYo8+4QklmxwJ0GdfR5aQIMM/XNw8JkPsq00HEKUcdizclT2L3pwSBD6xWiAumrLjXHc8Rh3zsHEQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3QgF00ckQ644RCuhycBEfxCX6nBvCyy9XELH0bMo1w=;
 b=R/449bfFGMhl9L5SVieIPQbec8C2hZIb2fbU1+xHdxI//3xPtY0fVK0ztXniOmqkxUlN5T/XF9edG9GzaHbe2xb4OWBod/cbdidKTRAT/+YD8KmRC8YNHlV+HnOlwIUI6bVqEGz5GiEgCm1wGAtBF40IMngwYU8dRHSfp1fZWiARQ6k50ULxtOSaJzWmRZAkqJTqoqUAnoZdEIIGHm/P/TiDtHP6MOBnDCuUimBf8qFLTWc1UPteApGEswOghTts6U7xrXb5Nrec4mNYEzayzmbIe8jGSZ7uwykBOmdnZDn4TBfzxlm6P31h7LtPnjQ8k7XGB07ukdY7V4a5Ai3Cug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3QgF00ckQ644RCuhycBEfxCX6nBvCyy9XELH0bMo1w=;
 b=4mH6ofKxDO7LbsAMqR/7g1BoJGUllioQw3JGRSQogMIcXNtLidLz1HYRyX03tikUP0dJwysTGXTUTRt7yZwqhcFCQINJvaYqYZXoxFdzl0RwNOhlPFbQ03bmNo/Kv8ZfEoyg19x8V/W6gm0a2VQ2h/9j+JyEbx9miKZv/Gliwj4=
Received: from DBBPR09CA0039.eurprd09.prod.outlook.com (2603:10a6:10:d4::27)
 by AS2PR08MB9022.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 12:29:44 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:d4:cafe::27) by DBBPR09CA0039.outlook.office365.com
 (2603:10a6:10:d4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 12:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 12:29:44 +0000
Received: ("Tessian outbound 3b68a75ac28e:v276"); Mon, 04 Mar 2024 12:29:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c39bea3e3d430c0f
X-CR-MTA-TID: 64aa7808
Received: from 0340156aef1e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D21807E5-F707-4F60-858A-883AD92B30BA.1;
	Mon, 04 Mar 2024 12:29:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0340156aef1e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Mar 2024 12:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+yZRR9tTS64xYWqEqPezGjfEBNzeLXKL5Hx6Zn9SIodjD/g1Lsp2FH5LxG8Fr6GFJXtslg4Hbw0bTL+G0he2c9vyBShDnzQsihokbfivW8RZ7PI77yCfqkh3lS5efihWkInZDCl3MjV+GGzz14Tj4hgRcQS0tYfGZ37tuwwnZpHusYDsmY6li1dg9Do6gVHR9oZ0zEvZedg8a8mecOlh6PX58w2oBOZ22Iqzx8q0VL1y0Onq+zTAVEVzNXmzUW3N1/KjSV3SrfohmgjkHqUYtdoS7PwhxqlgTqMBhLHuVH/RQ4tdC0h4wVASSRcNUhs0gWaZsc0+NbHAbNPqZ50Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3QgF00ckQ644RCuhycBEfxCX6nBvCyy9XELH0bMo1w=;
 b=VDJDsvqhCXkPvvG8d3EhvAxA/7yQ/MelKFeO5TCrPsI10RoJuskP9qSgeDU99QJ3VWaZSb9mgZm3/XIo+OCPXfXtJUnvCFbKGbZi9XxkVYdqB4Ul84nAzN5Fm1yPbcyRvyibEzihnR5BddyuJkgrnNEB3/1x4AFzEO2wfJlrwjOzvaiXFDkAHkSy1hSolkkGMGGzM+aemEoULFADZKXEDH5Lq3XTPA6XmITUyYWyLxroFLIjNt/Uo1ICFQ8GG7X9hHlieWllIqKyNq0HvGMI9pVRC2gEENogt16YWXpf2w0i7d0pq45JmFjObK3ZTVeK3DX1wnmCiitb0/l33dAoWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3QgF00ckQ644RCuhycBEfxCX6nBvCyy9XELH0bMo1w=;
 b=4mH6ofKxDO7LbsAMqR/7g1BoJGUllioQw3JGRSQogMIcXNtLidLz1HYRyX03tikUP0dJwysTGXTUTRt7yZwqhcFCQINJvaYqYZXoxFdzl0RwNOhlPFbQ03bmNo/Kv8ZfEoyg19x8V/W6gm0a2VQ2h/9j+JyEbx9miKZv/Gliwj4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8187.eurprd08.prod.outlook.com (2603:10a6:10:3ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 12:29:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 12:29:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?utf-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
Thread-Index: AQHabVyYYrMjNd0Ul0qBwClrItKp6bEl5wCAgAAM8oCAAAvSgIABhLKA
Date: Mon, 4 Mar 2024 12:29:35 +0000
Message-ID: <68A4B042-3073-40FC-89B8-FD50AD8AE919@arm.com>
References: <20240303111845.7A4DE106912@builder.sakoman.com>
 <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net>
 <d30f4cd0293437624736e21d82d14081f0c23d48.camel@linuxfoundation.org>
 <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697DA05C2BBC97F0BAFF040FD5C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8187:EE_|DB5PEPF00014B8C:EE_|AS2PR08MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: b02e18ae-ab6c-4a63-a6e7-08dc3c46c5bd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IigluST5UoBwzXAjMCX50eW01v5woRndN+SQWdZNoV0NSHIcrGGU6fzuN3A4HZPLE050jmcMQFuHhXLXKFXx1GV4/ZVJ3/kwqPat1X/PlT5bosgHhD7NK9PVejIpAQnm9VPJ+lYeP2S+cOsowDp8c132fDv1EAgJFifmy0Bkb3QOQq2Uc0rWlJNJZmFgNFW6gyGKWZ0ZUzZGuZB2cW80DlguVdP/kdheZ6gja6OUvjIKkwY4eLf0eT4GXJBFHdEtw0r4jaAN/dLuzCdol65ZhlFg9w48CKCwU8A2FQsrc+kMhY+UOWhj+2/u6prbJ2qOL3i64aqZJY3dns6JNbtKxLKWYwdoQCV3UiLN5OM2FzmdY7bYZCAfJF78IZzSpPVGHzlsQEtSMrDGspwbx2KxmsvBu8ReoWUrWsYYJpjI8Ks8iV024IWuuAAByt1vQ0TQOZubstrXeETVNhLoZAUTi1JoCu0158j9b4wtoLqfWnhqZRUVuRO3KsYb5wL2C+Vq377SgCpjXRecc3N87JkxzKEpCxt5xheVU/unliJI9Y66OB6JquQEySb38skrFLRX6i07Y7ecXDESCmLONkHDeDzhC8NfOnzvn72ASkoBSsz7J+dBeLGNG0mWebpi/NdgQ0KsHOg9Bg7QLRxJF6KaPXJvFsZZ2RpWs4bd9eOdhlU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC6C3F04CE714148BCC74EEDDE6E6F4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8187
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	96988f9d-9c6e-40bd-0df3-08dc3c46c0c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2EMbmVH+qqUDmM4d3iSWPYS0dnqrlkcjLjwGfBWvdmfGypdxffpRK7uxVvqNd/foM+et39ti4fJbS5ugsVIra0cvuL5AjOVSbdjKsaObr4wR6lda6yVH5tknfId5q9Hmlr4QL4koHIvOhMqlYM+E5XDG4iLg/lyHHgYsaAmmBkPcylobGbwUyRtdbqbCcZl8bN1vpjjvdQ3TWvH8xWT1MXh8APMFDwehBWQB0bKJf+NwHQM2J5sxxIM9AZUEAevhULOL6CWY5nnL0rV2neZ6XHNueRRWT8kuI3SW0GRQDAjbiSLO2C554RSxGaookH1Uea1LGcA5Bsdkkcl3d0Cn4gfx+LViu3OZGIWgGL0ExOzTrCfazFDOvQUbVvh7wX6vkc8NSVwAMQweD8bRlpK9CWNQuiZxcN2yt3tI/0xaoSbc4IKETLbAUSXoxkDso0puZsbfhgFbbppwB7zc70X+ViE9ZIeb4AtrM8A8BxsaBNaATyNOA+e77wg7nDKZ/fV8VDwX2qx5X5bwxVJejKOQQPZNaGbTQnj92laklcXBV63aHVvlYsJ4EBw5TX6ZsMr4osMSSz2p0WLowmOgvgD+129L0cu1ensgA2BKuNBKMT1H9imhnrxNfEcfys2znfLSmhqoRgavZZY+XHNYRHnHPh/aBgB/7csoriJtqXYlDzfIRCnU/lYZEKFNZQBUekqYEQ/tOwVVHr9GxKI8h79yiQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 12:29:44.2530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02e18ae-ab6c-4a63-a6e7-08dc3c46c5bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 12:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196597

T24gMyBNYXIgMjAyNCwgYXQgMTM6MTgsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3
cm90ZToNCj4gDQo+IEkgYWxyZWFkeSBtZW50aW9uZWQgdGhpcyBsYXN0IHdlZWsuDQo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTk2
MTk5DQo+IA0KPiBJIHRoaW5rIHRoYXQgcGFydGlhbCBOVkQgREIgdXBkYXRlIGlzIG5vdCB3b3Jr
aW5nIHByb3Blcmx5IGFzIHRoaW5ncyB3aGljaCB3ZXJlIGNvcnJlY3RlZCBieSBOVkQgYXJlIHN0
aWxsIHNob3dpbmcgdXAgaW4gcGF0Y2htZXRyaWNzIGJ1dCBub3QgaW4gZW1haWwgcmVwb3J0cy4N
Cg0KSSBuZWVkIHRvIGZpbGUgYSBidWcgZm9yIHRoaXMgaXNzdWUuICBJZiBDUEVzIGFyZSB1cGRh
dGVkIHRoZW4gdGhleSBvbmx5IHJlYWNoIGFuIGV4aXN0aW5nIGRhdGFiYXNlIGlmIHRoZSBDVkUg
aXRzZWxmIGlzIHVwZGF0ZWQsIGFzIGEgQ1BFIGNoYW5nZSBhbG9uZSBpc27igJl0IGVub3VnaCB0
byBhcHBlYXIgaW4gdGhlIHF1ZXJ5IHdlIHVzZS4NCg0KSeKAmXZlIGEgYnJhbmNoIHRoYXQgYWRk
cyB0aGlzIHNlY29uZCBxdWVyeSB0byB0aGUgZmV0Y2hlciBidXQgaXQgaXMgaW5jcmVkaWJseSBz
bG93IChhbmQgeW91IHRob3VnaHQgdGhlIGN1cnJlbnQgZmV0Y2hlciB3YXMgc2xvdz8pIGFuZCBz
dGlsbCBpc27igJl0IDEwMCUgYWNjdXJhdGUuICBOSVNUIGFyZSBhd2FyZSBvZiDigJxsaW1pdGF0
aW9uc+KAnSB3aXRoIHRoZSBuZXcgQVBJ4oCmDQoNCkZvciBhY2N1cmF0ZSBydW5zIEkgZG8gc2Fk
bHkgcmVjb21tZW5kIGZvcmNpbmcgYSBmdWxsIGZldGNoIG9mIHRoZSBDVkUgZGF0YS4NCg0KUm9z
cw==

