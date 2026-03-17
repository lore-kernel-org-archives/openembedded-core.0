Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B3AFD876C
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:39:10 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76175.1773754743964604317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 06:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iFfope4T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iFfope4T;
 spf=pass (domain: arm.com, ip: 40.107.159.26, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SR5fCru2jZ35BylTAyvgL8cuO7bBxB5flDt4LT2XEb8zmaad8xdybyNSImILn8nyLCfs2p6IQ4ouMLd4Rrq4Fp3UEdzqVIkWZNkNtZuXR2tZVxPXQqvqXBuOQALJPRfzMMNPpntpZmgG2PhW/6pOOuzWcUrSlPViW+6cMM3bxSBm5+nG35VoJ2Ous4dlxqjUNjiHVskhCwdSpWSexivZHNQILhh4byY3DT1VoAiiA76yvQ57cLiV7EYe9ZP416JPe61G8BarHuVnkMubQfavA/0f1dYYkcldTpkKBZWOKJiaJ08fPoKHd93Z/NNdhug7AXa6/8u5M8ep4BCCxDrHdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJR7g3GYOZmoOQn2yQpnuNf39puFfBNwWGlTwK/S5EE=;
 b=lh3fypgLba6kSM4/CZyTzYJ2d/vvFqq6Te9RNXFyo5oG1PYQv+TCGSz4IyDfMCGxkO3Drx04+R3fGW3ppQNloMAdzR0xz5hrIygsIlnFhEgOAd7iMBIojuBbhmPEr4YOnpbIwvTUAYofXNVvyB85greJd0WyGmdt2YwbDUbA30Lqzcd/KrWRp8MiSuoTNQXPLElXhMF0160f5JR7bn2nJeYD5wIT6I5M9gDzi599jTr+6hrpZfMkuYeUWy5wW4vqR32mopE88u/U4Zu5mykRfb2yHThNMveU155YXc8E252mbgHjUuwtXemz69Z2hWop9DemFQmnnxW7/w7c94W6Jg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJR7g3GYOZmoOQn2yQpnuNf39puFfBNwWGlTwK/S5EE=;
 b=iFfope4TLIn90uzoIs1GTau55Vy79CsYfAct9gb6lhApZPA53r5MIpA4QgiZ+QSLgbhnkvCE3B0huuvPreCfW9Cw4apob1dvGc9/nXVq992oYpUGMV4pCeK9mG0OhvO9EJhyi5H/rIXyspMGpQ1qZvtIfBf7lQTwUDoBlkUo9vo=
Received: from DU7P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::6) by
 DB9PR08MB9946.eurprd08.prod.outlook.com (2603:10a6:10:3d2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.24; Tue, 17 Mar 2026 13:38:57 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::c7) by DU7P195CA0026.outlook.office365.com
 (2603:10a6:10:54d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 13:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC6kHBRX2yo6b53xRerFrJHQxRhGLVchQ6h1pdII8cdz46Xy36LoFYDKR7oV2MicGxru5Fdydo0RSpoZO6NA94STCEr4JjN7cuA9fyIHEiEGQtJ6N51W2+47CxqPW/ACeCNi7DW/+xbQJD1vvsIsnRjrWsEXpKtVmRpmp+OtiGN4kOJpWwibP/AEifx/T5YydrwiGjrnehE0MjTg8+wf7PgLKSVbYgDf1lMayOafigA8+xwV8Ax6lIgCiVEEnDa95opv0YatHEP4lERgfeMvxeFi2TGNnuOGBy2KPaLN7brsOmkNnwrn3H379i2JuqAVUzUGSGqMv/qQFRPsZR2Glw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJR7g3GYOZmoOQn2yQpnuNf39puFfBNwWGlTwK/S5EE=;
 b=vQgi+MZrWm8J9TdtVY/CAwO7+r/09l8ra4ZwaCLEj0dsxXlSaAt8G056+YMdSPtIywLLLp5itBIQFV5ADxL69ZSQNP3fE8Cz8HzqaJDLB579CY4yGLc8+k5ak/kRsBd+a16lCVi61N7FuNiD4oJr0KHWbMMmzlnKRV8chzMsQ6+T/Dw4eCq6i+MugCHiavfexB9S1SOCh2z7ve/kLxStgUAxtILW9/YZOPllrS28m03O3eZQ/oY45XZgXDby2Nvh4SJmhKON3Nn7yiFgofX8eS2QIXR2WFkWcoBMXB0AvN7d9/vxF9nr2sPXIOy1dYxh+/H5BqrrSBmmDlUsHcxv7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJR7g3GYOZmoOQn2yQpnuNf39puFfBNwWGlTwK/S5EE=;
 b=iFfope4TLIn90uzoIs1GTau55Vy79CsYfAct9gb6lhApZPA53r5MIpA4QgiZ+QSLgbhnkvCE3B0huuvPreCfW9Cw4apob1dvGc9/nXVq992oYpUGMV4pCeK9mG0OhvO9EJhyi5H/rIXyspMGpQ1qZvtIfBf7lQTwUDoBlkUo9vo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 13:37:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 13:37:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kory.maincent@bootlin.com" <kory.maincent@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Louis Chauvet
	<louis.chauvet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core][PATCH] default-providers: switch pkgconfig provider to
 pkgconf
Thread-Topic: [OE-core][PATCH] default-providers: switch pkgconfig provider to
 pkgconf
Thread-Index: AQHctgDGq6DnfuAvV0WhSFDLbwGTrrWyum8A
Date: Tue, 17 Mar 2026 13:37:48 +0000
Message-ID: <8ABAF2EF-06EE-43ED-8D90-589322F0CD84@arm.com>
References: <20260317112407.312819-1-kory.maincent@bootlin.com>
In-Reply-To: <20260317112407.312819-1-kory.maincent@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9396:EE_|DB1PEPF000509FB:EE_|DB9PR08MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b6925ab-9277-4fcf-dbd5-08de842a8a58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 XSJf8HbMZob2MWQvnuZPWtor/GfD7iEfMBH6mX8x7xi9singXhb5/YY7KfhSVohcyeX9Q6gKw/X1dxFU29TLHA5POUlxeX2R/mQH1M+BEIqbPFDPEMVahmHgG6nfKDpkLaKFYbK4domsEJll3RjrN3Deiq+4DKWWNB96XP0jEN84kQ5xGWOplBcU9KMRcCsVsjUckxucX5tVO/HYGRf70X8v7W3v5eM41v5BndIHImh5jG0EqFOR0Jala5FxTa1NoX/mHXJYMZy3NKgsTBViuZ83mb3XhnOd1BQvODgpuDuQdT2+/2HvnBs2wzL98J8NpazVH4P2ISzzBQFF3UxbVXBfV0Dv8AvyWpTfEcEfe06IBuR9NO78l0VW6PmeChp73gTiHtSncVgXCQ1kzOr/KHHZ6+Hu40hQgynNetTH5rBo+vTrtiEaZVJVKfMhxRSvv7VDDuggkrIbLNQCCIQfVlB7cUagHxG2rK8ooXEMIZPT66O5bhCphDNUUWWj4khCcNCD4CXfeoj7iuzam7MC9ZauOKHJQN90PlXelnm96tJbXqshGSdeIgA74N5mkGmOisMdnCnIdJkTZbD7XrMiiFzmkJSOn33RIYqjq4Yjrjfb3UJ423kDuopZ1xEKRYtObVKPCFfA2pwHlCwGcaDdUecEDCENojO6qUO3QHQsvOzW43Xtm7zxYjsVtC+evpbe9RtanYb+FcS8loWCxWR0d48ewSJgTTfCtbDJjRLrRKjIMVxPSEZTiaVvuHoQuux1Sf/jGRSR8WthYHcwzqUG0F9RZzumaoRGNqs6fBEbJqE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A2A718A0FD28B48A94FBFF2A348803B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 FA3SbSXFmhRWos9oKPEUUQoUtdvUSSI41EReyE5VmoGiQUhJNP/Rt6KF75o46DsYFa7QLh0mDjO/Wb9u980kRmuSODlRgnwtQTJdrmvyvFh5Ay2t9ob6VPgLX0pDS4s/g8PN+azQv2wJAquPl8ctY0XcBtSCzhZSWm0HNJnVxuvpVYPTcw8HNd+r7i1oGA7XsYMxjlNHpWSTirz9xSud19hvf9+SSdCmuOwuAiWcIDiAHHw3eNb4/6SymnlcO9+25lj2i+OZmL9xeO6qwqBhLndrrDPtHCZhmIJwwihYfSsH+ie5TmBHxLfg7Teu06C9t67ekjI2dvBy4W/dkz/DeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7682d1e6-0415-43b1-b301-08de842a613b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|35042699022|376014|1800799024|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+T+QJFdmljqqt8+Vdu69ypbkii5BO9kR7U0REzEtE728NSi7QZ9S+NqSWYWKocizupJQtcL+VaPgDNebojVfAH7LqSk451pS9gk97w3Rv9rOzuNaYpOCmC1f0ylQyLF7s5GL65gXtPN3BVbKVDs+nhurZelTkhWfnbenKBBW2y17VAK6IrOBwUSsk+ySyxE2AghZKuGLOtrrfK7ykZVe9gbIPkj41E2czEWnRG0AOayFSRJ10//bLvhXwWgT9kaxDqBW6rD2mJXeSwDQQtPutNtUF1tDdOU/tYf2JGoHht3p+j2RbpH8sXTHp/eCJuCSAPpiok6vfTGzoXzNOUpf4oVjmg1waW0X1AiirYnWjIcR0SkSB6HfjmCWPQ9Z81CEP90goV+R8Am1ZaY4C385fYQQcVvmmMqwn+aonhJKpbTrjxFMHS10QSaP/XR9eg1CLV/iM8yTY0ocTq6nhuvovuc+rIQse7X3EWsorLOCdTU7bWC5Td9Np+mUx5gRAq3oBQWlsZHfVi/G/UcgCcjj1xSTmU9ygXIvV2e3u52qiN0CXvHQn+/jQE7nOAbaTKhCC2TSgF16t72mzCXzTjWj/kdJJfPZT1jGdaRXtk7NAsBxfU+P1l41DD+dG3lXvRT3oCQobJckYpYSokMZatxcl8daj3X4Hr4U65K0emHGk3xhnC8dj5/JuJTl5lskU7v6NXsJ60oAqxP5nM1WbdgpRV90RBcgcHluc53guxYP91WNXPVAoyT8jPbp9BKyQunfSfl0Ogdf8mcrUWr2d4rrwQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(35042699022)(376014)(1800799024)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/C/jHqpOH7X9hbHu0k0Qf5QyuRQoLra1LbFiNLIuJI747Q+Us131EQwgiBYAE9AvDJ7v7BWwp7iUpNL0+K+4q/PPY7XnUiYFk1xqEOiRRzNOOUnvRI41tjZzVgS01k5kgCKha66IBn4EaHp4vYw83Z1hznQ5VF04urIFGKkgyvuV/hFklO5NNhkIwdb2dl9SbI71LsAZLnjn5hYvfpz0VbiFHJ1w5ZSpK3vdcArUT5kwDB53JIgZcjbHckMC37vWvBe68um3/hIvB2KYarAygT/GBHamVWAcX6La71lYDZM0b5Qq2ZXsKpsLQWcgjMaTVr91/5V4MfaTBn3BNITD3uOR4k1mo43XUpEJfkfF0cUdwYqkMNdN7lYOegaTnUkEZp6TOZitV0/ybOqKicv5BQSTpaeRmyysY/BPMSk/d8qwpO4964OxTYmKZt8sSLvC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:38:57.6607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b6925ab-9277-4fcf-dbd5-08de842a8a58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9946
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233323

T24gMTcgTWFyIDIwMjYsIGF0IDExOjI0LCBLb3J5IE1haW5jZW50IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxrb3J5Lm1haW5jZW50PWJvb3RsaW4uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gcGtnLWNvbmZpZyBoYXMgYmVlbiB1bm1haW50YWluZWQgc2luY2Ug
MjAxNy4gTWFqb3IgTGludXggZGlzdHJpYnV0aW9ucw0KPiBzdWNoIGFzIEZlZG9yYSwgRGViaWFu
LCBBbHBpbmUsIGFuZCBBcmNoIExpbnV4IGhhdmUgYWxsIHN3aXRjaGVkIHRvDQo+IHBrZ2NvbmYg
YXMgdGhlaXIgZGVmYXVsdCBwa2ctY29uZmlnIGltcGxlbWVudGF0aW9uLiBVcHN0cmVhbSBwcm9q
ZWN0cw0KPiBubyBsb25nZXIgdXNlIG9yIHJlY29tbWVuZCBwa2ctY29uZmlnLiBUaGVyZSBpcyBu
byByZWFzb24gZm9yIFlvY3RvDQo+IHRvIGtlZXAgbGFnZ2luZyBiZWhpbmQgYW5kIGNvbnRpbnVl
IHVzaW5nIGEgZGVhZCB0b29sLg0KPiANCj4gU3dpdGNoIHRoZSBwcmVmZXJyZWQgcHJvdmlkZXJz
IGZvciBwa2djb25maWcsIG5hdGl2ZXNkay1wa2djb25maWcgYW5kDQo+IHBrZ2NvbmZpZy1uYXRp
dmUgdG8gcGtnY29uZiwgYWxpZ25pbmcgd2l0aCB0aGUgYnJvYWRlciBlY29zeXN0ZW0uDQoNCkni
gJl2ZSBiZWVuIHdvcmtpbmcgb24gdGhpcyBtaWdyYXRpb24gZHVyaW5nIHRoaXMgY3ljbGUgYW5k
IGxpdGVyYWxseSBsYXN0IG5pZ2h0IGRpZCBvbmUgbGFzdCBidWlsdCBvZiB0aGUgdW5pdmVyc2Ug
d2l0aCBwa2djb25maWcgdnMgcGtnY29uZi4gSXTigJlzIG5vdCBxdWl0ZSBhcyBzaW1wbGUgYXMg
anVzdCBzd2l0Y2hpbmcgdGhlIHByb3ZpZGVycywgYnV0IGl04oCZcyBjbG9zZS4NCg0KPiBTaG91
bGQgd2Uga2VlcCBtYWtpbmcgcGtnY29uZiBlbXVsYXRlIHRoZSBsZWdhY3kgcGtnLWNvbmZpZyBi
ZWhhdmlvcj8NCj4gQXQgdGhpcyBwb2ludCwgcHJvamVjdHMgaGF2ZSBoYWQgc3VmZmljaWVudCB0
aW1lIHRvIGFkb3B0IG5hdGl2ZSBwa2djb25mDQo+IGNvbXBhdGliaWxpdHksIHNvIGl0IG1heSBi
ZSB3b3J0aCBkcm9wcGluZyB0aGUgd3JhcHBlcnMgYW5kIGxldHRpbmcNCj4gcGtnY29uZiBiZWhh
dmUgYXMgaXRzIG93biB0b29sLg0KDQpUaGlzIGlzIGEgYmlnZ2VyIHF1ZXN0aW9uLiAgVGhlIHBr
Z2NvbmYgbWFpbnRhaW5lcnMgaGF2ZSBPcGluaW9ucyBvbiBob3cg4oCUdmFyaWFibGUgYW5kIHN5
c3Jvb3RzIGludGVyYWN0IGFuZCBzaW1wbHkgZHJvcHBpbmcgdGhlIGZkbyBiZWhhdmlvdXIgZG9l
cyByZXN1bHQgaW4gYnVpbGQgYnJlYWthZ2UuDQoNClJvc3M=

