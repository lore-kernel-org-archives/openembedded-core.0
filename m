Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC887C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 09:43:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11079.1789551802241628338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 02:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L+CoFXiD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L+CoFXiD;
 spf=pass (domain: arm.com, ip: 40.107.159.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M65hqit05jEZaF6TnRFTz4DYnUu7dnjl/NEZ9Smz1KKWGJutfP2vwERodzOuK2mSean4jc2pm2OAbUrCUS2857k14qRXLkmE90UZqb56Xeg5QU8cLrRw/Co52g/2IHbYpZ6ECZSSJSx8z/WjbWbXq7rfQVEhVkdUHLLxY8eKzdbZ5OqsyUZRFNMAdgGcxbT1+aX3y7iSiqDM1AGllv0teO6UCFWM0AcDxJBT8nj4ML3ONYmAYqMF/kXUv8suQ3YkVdR97Jop+pPwqEwEnimURt431BImdUpnrzGx3Pmo4MbgKmuDX2OMZGx9bu4hSvvMRSzxCOohKAtNUbPrkWKrXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv1qck8T69joHBuQ+8MHuLbt5G4fFNu9fnP8MkeN5ls=;
 b=zUVyMI5cq9zOLGTKpeTT0cL1XhfyFxtvRgvJTNkclnFTNqwO/MqWZVZSzMTio8OmmfvYatfXU49dLpnRzTcG2aqiJayV0wUSM1182O1CT9cMZHcNXes5UMFjQDHYtwJgyOKrFV0rreyFd/kkIsN9gGItJwzb4fdFIryEKFTQD9a6a+KCYjpQsen65bWXHkQIKutcdi8PCWwKCsoWRyVPuE6wfs0sSlZJYhrrKea/J3XLQZfYScFOiB+FW2bg+se6grZoFgrkSlc8e1Y1lP/FgzC+oCyOKEwAj8412GIj8yZlJ/OAnONo1CurTptxHkLmJWHT4BQx7qLW627DZuPv2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv1qck8T69joHBuQ+8MHuLbt5G4fFNu9fnP8MkeN5ls=;
 b=L+CoFXiDpaK1iD8iUL9566pyzhHIF0mtwciKzHw6QuhEeGOQODYI8mnyan81ZzcRiyEe0UXmkk/pUhFM51QnuKSrm25cTWKAR2FOI8ymc9g6EPxcoBBk6x21InW6XxDWnkG9pZqNulC1+ZeDHtfXpnPGM1IB9zUbaw6npY1OExc=
Received: from DU2PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:10:232::28)
 by PAVPR08MB8848.eurprd08.prod.outlook.com (2603:10a6:102:321::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Wed, 16 Sep
 2026 09:43:10 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::3d) by DU2PR04CA0083.outlook.office365.com
 (2603:10a6:10:232::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 09:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Wed, 16 Sep 2026 09:43:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF/1d8eB2507tg54xLR6FCW/saX2A1hl6ypiRmYxCajNq+GxDLMfbScODY+UUV0/hPM52mOTbuiUJjaI26rYeGkIS0fs3Gtm+rpIuehSIYAYRcFRxlVklLUZCV5j3yO5tUUWYaa7xieeZHJIG5yUkt9TaRAd/Hr0GvPkiYqfjQhHd/RZIfPHHPLfYbTBDyiZKWP4727JKWieHdTzBsIc/FuY1kgdPd3ODl6HDM9sQogzSYntarkzsEsOGy+EJ+Uyj9BDGg6rn5VkXsSOB9ppGEWKXVV6SKYl3nhAqdnuP9e+nX1Pq1bugpxw/WpejqAQAiZxtj99leh9hLQRyYQNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv1qck8T69joHBuQ+8MHuLbt5G4fFNu9fnP8MkeN5ls=;
 b=yxj9qXvypKeEUMaQdTRGCJtzJzvz82kPBmhQv6G+bTSeL3rSZwoSaMdyLh+4RGmo5jME5dF71szyj/0dh6k5+lnjtVcHKEjC8NEtNtmuVumUezAsfljlHr0zQFSRM5e3J9h3+dNwwEmBhOYiCvzS86S7xFV2d/axozRYv1kQI/Xa9PkyW6Ojs1yz/tHHltfgKLrVHg4G+WMbcuaxJwGa6cmdrRt2IKq5KDxtvT3ZRgZ7jmNp59gxjY5/6cVWumC05mzk6N7xMsz3gF8aqzpymahJMXpMd1NzCJGpzxJK70yC8DrGbCtrBsrlX5pnHV4cp/iTAA5vGFQ83dC4gJvrkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv1qck8T69joHBuQ+8MHuLbt5G4fFNu9fnP8MkeN5ls=;
 b=L+CoFXiDpaK1iD8iUL9566pyzhHIF0mtwciKzHw6QuhEeGOQODYI8mnyan81ZzcRiyEe0UXmkk/pUhFM51QnuKSrm25cTWKAR2FOI8ymc9g6EPxcoBBk6x21InW6XxDWnkG9pZqNulC1+ZeDHtfXpnPGM1IB9zUbaw6npY1OExc=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAXPR08MB7528.eurprd08.prod.outlook.com (2603:10a6:102:24e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 09:42:37 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.004; Wed, 16 Sep 2026
 09:42:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0
Thread-Topic: [OE-core] [PATCH] python3-cython: upgrade 3.2.9 -> 3.3.0
Thread-Index: AQHdRR49QDz79SS3vkOxdnfT21pZUbbQw/CAgAAxMAA=
Date: Wed, 16 Sep 2026 09:42:37 +0000
Message-ID: <2334C001-91CB-4F20-9634-33E7B9A5B3AB@arm.com>
References: <20260915142632.589500-1-ross.burton@arm.com>
 <518e926c64922a9536e8cefda7ab96c27a05b190.camel@linuxfoundation.org>
In-Reply-To: 
 <518e926c64922a9536e8cefda7ab96c27a05b190.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAXPR08MB7528:EE_|DU2PEPF00028D12:EE_|PAVPR08MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: c6be7adf-86b8-4edd-c344-08df13d6eb5e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|10067099003|3023799007|6133799003|18002099003|56012099006|11063799006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 tOg74GK6R90WI15yagzrUsJ3JRTHBtVRgEF3XQ/NeRe3jB7j2h4g+k9EWxIxK4Kb8JWoKU160uyBPIIEX6i2XdKdhy++YZxptzbpIeauTHe094WKX3HVhbb+vCkhIsYDrjQseZBJFvoXfwcvSwuGxhYB1nzf1u//lWmH2MdMbidrGcEYli/RCK/QLnEjr8LllTJVJ2TyZWJQkkEs+2gi7YupG441FkpqcpIa3nQowJkfhjmSpPlvS+ubESkZosNK4gN6vQYrni+zeKGc9Bjlfv4bqljuKvtFup9M9SNa6XBbUuYLt5aHGND61x9IFHn5FgZTk5E6IZHM2w9wslyK1m8I5g5iyCASSXvyOi+CbrSo5941hINySrQnDiRXT+YVTQmGEdj1IioOdscE+mm0EcE9HIxCCWEHWeRzHmlENSgxilpPz4kh/wwjxhLG4OmV9qJh/7m0utPpYfkJV1fDUxPau/7PD6RrdJOFScKP6p/3MycZDOuvBAVtsiFNalBzvbsn61UdIlL6aw37CbuPjHG8ebab9rZtiVEPhmEK0AdpmwmeRmwItWJGGMsjYC7UIvCIefN1B7EVXQ/nxkVTEE5iQjJhIMwLoM9DRbpJMnui6tg+I2kYOgCnzBq+m+7pSOuXW43rM1jygjNJVRl7PndPcPjD9iP7fjdOMDMI3yw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(10067099003)(3023799007)(6133799003)(18002099003)(56012099006)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECE038E20335234EA83DF01323CD55EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 N25B/7s4071F1m7kmFWyNf5H6unwHoYRcKFGhfRKh79Gi4LLPEh9xaNDkplxwmJPHqIS8NYcvVplsTnQ4EDyPsYi3u1DVF36SH+guz/myNSxgw3iObkZjyn/yq2ILwQZvYYrQSi5/xHMI8yuevJ4AEFK68W/+CR9Ku2L6WdVyw7be2nt11jxmqxRZe45wyaV9upjly2/fqBFxHlI3yGCMiHFn5ok7nEt5VAaDxPMCbBH7Q5CopEKY1IwjUphJxMqQM4dslSXcDrt3is8nv2xcbubX0NKVK/z9ck815kUZYz9LTRwc5gzYpwoVne+2eW1UWOc7fvE8+hfA3TGol4SPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7528
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35d31e46-22c0-41dd-8c08-08df13d6d794
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|23010399003|82310400026|1800799024|14060799003|36860700016|13003099007|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	rIdjnfcP7iSxNp2oqHP44NpPvtIYKuMRuLsVY76JktJ0dInK4hLuu6X9GDmyu9eOYnIaqO9BPud7GO33kDWtrx6T9xWmxgVn9DS4mO8RpsFA2GTfCYxrvhf8GvU6HrmGXvQ/KJzRTlNaMzAFaAXbOwnFH48jUfini6cyvdDp/JSl5DsjZSFvbhPSBNWmqJJzX7t4UdyFA1fJ6VGqWCJWX7uY8MUCEcuA8VPN64G8jRGaIv1Te5/wBfN5V/HmQb5OSqvQMxgZ/BioMqlYA/wbH4An3Fzh9jYWblI822BI8xLIxeB4/7takc/5cPtgtffjur95GO7oks8oK/y1ljHZErLItUROGGwrUzCxsrYhTD/BC/ba4X4aQ4przeIJkx+EJLFFnLH1mGnm+CP6nt8NvXRhNY0L/AN6cphmEsUioonERF9NTS6vicGdIxy8d8UDmegjf9Rw82Noy0RSyh3hk8O11Ps8dXlBC8tYYc9LW4nvCV39HOj1sKIOJrn/mSqp02QChp02elg8rcC0TKO8q25pIgDxtU6ocq5XFQnOMahm+NNSVgd1BMmSzKwcE9nssDPeC/qWPdpi/oRDSuzoa0mRk5MXt5MaSqMC/6KOTcTw2n3T0Do/114fGSh28Xv8joiNQsBvGv9HGvonpbTibw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(23010399003)(82310400026)(1800799024)(14060799003)(36860700016)(13003099007)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	IvuK3PdEdyfD1nz0hL8P1CcSpNHOs61tfsbobS3uVKgb5OPomP6mZhu2WfcoCIJm81V28Xrmb5hZuzYLvFbCoiwZ2X8+kZ688d2+3+LMN1AGRSL7qbJoJAL5dT36sJljIdyjNiawAZ4Nv3vWsDHOUsmZKhuWKjwjW7IQ9sTrRKNF/MHPBWoIgCo1WNcOH7SH3v1lE89iS/eJLWQjdt92b6Pf7a971ci3xnVOFA5qLBfQ1JPdyQdMWmpqIHjmuK96kZMCXbloBxL4LMW5Wc7Zbe4RleNGMk0HigncoxFwQ3B0fu6bcZBFLH2h4WPVmAei4lF7S3DTkh2MgDwaQFQtWF/RJmoeJJbuYaSlkzz1QZE4UScsLWvG76xwYuUWJjK0yZ7xIsfUiXFU7LF0E5ogmutKS0yBddg7BrWTGbsUmL7Hw84XE9tDlmr7hfWHk2cP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:43:10.2210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6be7adf-86b8-4edd-c344-08df13d6eb5e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245948

T24gMTYgU2VwIDIwMjYsIGF0IDA3OjQ2LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIDIwMjYtMDktMTUgYXQg
MTU6MjYgKzAxMDAsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPj4gTG90cyBvZiB1cHN0cmVhbSBjaGFuZ2VzLCBzZWUgdGhlIGZ1bGwgcmVsZWFzZSBub3Rl
cyBhdA0KPj4gaHR0cHM6Ly9naXRodWIuY29tL2N5dGhvbi9jeXRob24vYmxvYi9tYXN0ZXIvQ0hB
TkdFUy5yc3QNCj4+IA0KPj4gRGlzYWJsZSBwYXJhbGxlbCBidWlsZHMgYmVjYXVzZSB0aGVyZSdz
IGEgcmFjZSB3aGljaCBjYXVzZXMgb2NjYXNpb25hbA0KPj4gYnVpbGQgZmFpbHVyZXMuIFRoaXMg
aGFzIGEgbm9uLXRyaXZpYWwgaW1wbGljYXRpb24gdG8gYnVpbGQgdGltZSAoODkuMXMNCj4+IHRv
IDI0My4xcyBvbiBteSBtYWNoaW5lKSwgYnV0IGl0IGJ1aWxkcy4NCj4+IA0KPj4gU2lnbmVkLW9m
Zi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+PiAtLS0NCj4+ICAuLi5w
bGFjZS1ub3QtcHJlZGljdGFibGUtYnVpbGQtcGF0aC1wcmVmaXgtd2l0aC1oYXJkYy5wYXRjaCB8
IDQgKystLQ0KPj4gIC4uLi97cHl0aG9uMy1jeXRob25fMy4yLjkuYmIgPT4gcHl0aG9uMy1jeXRo
b25fMy4zLjAuYmJ9ICAgIHwgNiArKysrKy0NCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+ICByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1jeXRob25fMy4yLjkuYmIgPT4gcHl0aG9uMy1jeXRob25fMy4zLjAu
YmJ9ICg4NSUpDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFs
a3lyaWUvIy9idWlsZGVycy8zNy9idWlsZHMvNDk5Mw0KPiANCj4gOigNCg0KaHR0cHM6Ly92YWxr
eXJpZS55b2N0by5pby9wdWIvcmVwcm8tZmFpbC9vZS1yZXByb2R1Y2libGUtMjAyNjA5MTUtNmdk
NDEzemcvcGFja2FnZXMvZGlmZi1odG1sLyNyZXByb2R1Y2libGVBLXRtcC0tLXJlcHJvZHVjaWJs
ZUEtdG1wLWRlcGxveS0tLXJlcHJvZHVjaWJsZUEtdG1wLWRlcGxveS1kZWItLS1yZXByb2R1Y2li
bGVBLXRtcC1kZXBsb3ktZGViLXgtLS0tLS12LS0tLXJlcHJvZHVjaWJsZUEtdG1wLWRlcGxveS1k
ZWIteC0tLS0tLXYtLXB5dGhvbi0tY3l0aG9uLXNyY18tLi0uLS1yLV9hbWQtLS5kZWItLS1kYXRh
LnRhci54ei0tLWRhdGEudGFyLS0tLi11c3Itc3JjLWRlYnVnLXB5dGhvbi0tY3l0aG9uLS0uLS4t
LUN5dGhvbi1Db21waWxlci1GbG93Q29udHJvbC5jIGlzIHRoZSByZWxldmFudCBjaGFuZ2UuIFll
cywgdGhlIGdlbmVyYXRlZCBjb2RlIGlzIGNoYW5naW5nIGV2ZW4gd2l0aCBwYXJhbGxlbCBidWls
ZHMgZGlzYWJsZWQuICBJ4oCZdmUgbm8gaWRlYSB3aGF0IG9uZSBvZiB0aGUgdHdvIGJ1aWxkcyBp
cyDigJxjb3JyZWN04oCdIGVpdGhlciwgYXMgdGhleSBib3RoIGJ1aWx0Lg0KDQpXZSBjYW4gZGVm
aW5pdGVseSBob2xkIDMuMy4wIHVudGlsIHRoaXMgaXMgdW5kZXJzdG9vZC4gIGh0dHBzOi8vZ2l0
aHViLmNvbS9jeXRob24vY3l0aG9uL2lzc3Vlcy83OTk3IGlzIHRyYWNraW5nIGl0IHVwc3RyZWFt
Lg0KDQpSb3Nz

