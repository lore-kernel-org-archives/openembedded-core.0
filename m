Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E7FCD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 14:00:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20026.1781791207178578993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 07:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jaJATsI4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=jaJATsI4;
 spf=pass (domain: arm.com, ip: 52.101.72.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RHNm7C6B/epQ2OiM1AlZFjJqAb5pK9alON9MMeAlriRK14VfgB0e+xr+tuNktHC3McyukrH1S6BGGlpEN2oYjbmhg2HPbC0d5mwNJsZpsd0szX2SDFkvCFBlFLO0gr6awXaMbxTZeL/4PNZq1P0VA0RPsGfhKz6WgmmHTJOllTdD74Qddm2fDNHUoFzN5BykA6maKIf+GylBg1F6zGO5Id84+i+Js5QsVS1Zpi4s0ydtBNXOEziAB8RsjTSWL1N34C2dth3IUdZLhdtjrMQAhdjO+UEqvjPd/bNQ+fa7cqi72zWWih4SYwiq5tO+CYEmJyVrJ+r6hqfQYYhpg1q0EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD+yCprQAhhlsRYZGq7+LqM1g664H6102ZmaR5MTwpk=;
 b=b3Wx2KAPh9Mf6ETQoHbQoIV3mT/Orkfpf3UaOqMMGqIcyRNtyLq55goeUJE+nI/6JheM0jWIilRZNDGZ6CXSr/JSNu4NuSv3OKVh5vy2iEBf7kEEEZfrAdVjpSr2yBqT3Liy5AOA6Lr37D/ozOYnGeK1hpkMkLzY9+6FAa/dr36nMSlmDnwY0DMNtUl9GSV7e7xapyjuiI4c+JUU53gT2E6xT37qk3roQRKClNQc9tpE3CaYYzJ29Mcy4gxgt90GxlUNBcimHWFGOcM3LR6hBm3A12l5lvLlttC8T0OCgNUTQWpBjJujZfWMNP5fI8v8b7BvvOaVnQag5FH85d+6Vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD+yCprQAhhlsRYZGq7+LqM1g664H6102ZmaR5MTwpk=;
 b=jaJATsI41q6YQXd3z7aXzf2iUB8pZi/DOUP7fmc5O+zIaG/VlGT1ZP0u9QX9zVmjKaKngmfr7QtR586DAyFyoRnd+ujICHdne3pyPfM7EWIIS32z8yJWRy/6YwQSOZoeou8NewdvJXa98YivBOrKq3HJ4uMcBK+UGbRAUxwuIW8=
Received: from AS4P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::11)
 by AS8PR08MB8159.eurprd08.prod.outlook.com (2603:10a6:20b:560::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:00:02 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::b) by AS4P192CA0016.outlook.office365.com
 (2603:10a6:20b:5e1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 14:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Thu, 18 Jun 2026 14:00:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nn8Zy6HZ//ImxBlOMR7ESZ+61QzAzorOK6D9rCT/S9Rq0NQ4tJ8KBD6GPdrF1PTpA3kE/SZ/Qzkv0hRyNzwd3s4u2qmyC0U/jdHFhf6qDMbcu+iIrMi3SRr6hLKwEYeJLZ/WxnxkDRs9oi9zPwPsR4Ii3h09XeUuokIcIGuvKyAN0L1n9pkvEQQPIXt8ELAecSKKxXduHa6xn+E0Igxr7VDXHUfB1tl5Eh12iMbf3ZoSeXepnpniITKgPYO449EWZWEbrr4ZDaz5SE2Htuq8o4gAtWqoihmhFAShZCCNYyRzKIzYnID3AVQ6I9fkNruzzIiROxNRhA2t40k4wvi3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD+yCprQAhhlsRYZGq7+LqM1g664H6102ZmaR5MTwpk=;
 b=eEMWdQlF68YSAtH0Lja8ubMjF1UzW2BDCQKfZq7ErNuSnARZlUngkzbTKbPmDVcfx9SaChF2vqNA5ne/qHCACHbCikQiunjcvRyNPd81Y/zcnUp0Lw2Lu038SkSX7EwS0w1Vn5gg1j+AMD7V34q3x2m2TXNIvSlsh83A+Dyifq4Kq2PFDAhZeFXxl2ranNr5yDqUS8pS/UCjtuhybSleYstPx6BYFCQx2Yu8OnONse+hYc7iWIB7cMgg3ZpFCaDKHJePxTMTrJhQiz+N54PQ4c7PRkP/f0OS7FKQiQ1CkgIHEXrJtT0mgeEncBrhcWrNPJtKbfQv77vAqXi/SJ2JxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uD+yCprQAhhlsRYZGq7+LqM1g664H6102ZmaR5MTwpk=;
 b=jaJATsI41q6YQXd3z7aXzf2iUB8pZi/DOUP7fmc5O+zIaG/VlGT1ZP0u9QX9zVmjKaKngmfr7QtR586DAyFyoRnd+ujICHdne3pyPfM7EWIIS32z8yJWRy/6YwQSOZoeou8NewdvJXa98YivBOrKq3HJ4uMcBK+UGbRAUxwuIW8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 13:59:00 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 13:58:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "geissonator@gmail.com" <geissonator@gmail.com>,
	"mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemu: add ppc64le support to COMPATIBLE_HOST
Thread-Topic: [OE-core] [PATCH] qemu: add ppc64le support to COMPATIBLE_HOST
Thread-Index: AQHc/dHf/j+PVPPWaUC9deeueFljSLZEWYiA
Date: Thu, 18 Jun 2026 13:58:59 +0000
Message-ID: <BC47F2B7-4B25-4187-8CE7-8459941C3DB0@arm.com>
References: <20260616205030.50367-1-geissonator@yahoo.com>
In-Reply-To: <20260616205030.50367-1-geissonator@yahoo.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB6523:EE_|AM2PEPF0001C711:EE_|AS8PR08MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: b0443b7b-829d-4ab6-274a-08decd41e4cc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4022899009|38070700021|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: 
 JcnceP7XDCX4vgxDk97VzSUqefrBC/zKKxCf9fYIN22al2PlJPj7eYq1Imms3k+CGITzAxgUEPzZRClqsIy1aOvwqZmhRIVhINURAjzrtrY9wN/asKGDbHM4NmgDEvc4YHh07KJ5Ml+Egi+KQQRHTZ/oogcWszIu9kQUM5JH5POjrR9Q/K2c8jyG3eEotb6khV0C6NBpIiQk6/PSa9QypC+9tBphYEyXxA0HwYuVeuX0Y3Rp++Hj79HPNYHXGgLRrLobALhWT0t0DUPhEtwH/hd6KQ2e13GRL8EkTtDKEEjpUwxHtWSpjZEo4rlNU67WI0oraw6cQnWiEwUWgUs0e4AvCXRtZHu5/Q9SDxuP619Yd+4pfi06juNiEo04hH3kFIh+T06rAIS4LCkhdKeaj+NwI98GK9EhlOlV7eliZNgsMbOyIz9du9vXuG2I5E14kztDZeXX2oIN7khgBYNVJDjfCBhAsnaZFAMZ/+VNg/1zwoNydMoZ/Jph13Ingy3xPFtelgL9gKiEFiI88K86BdJ2lFfrt8rmbg4Ywxr51hCaNx9U9en9wNWYagfgSBCaaSbdk8brOz1qjODDckQ2yG7cViMtvEJhTQAotHnlfqOL+/SxqJN1ovFAUKMIDJZcy7dmSUJpmTu40QeSHrFdsjngFYyp1eXUPjHBmGZrO+e3ePAIYVhxPepMsMok5q9AqI8cX7fkl7AoNGYequzrU4Gv7h+MJ+gNDRxOqlxCgp7dLNfNqSzaCWwD9sK6QSL2
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4022899009)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA788137F8725B4EB4DBCE4B962DD79B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Hl1t/zD5fFf6CrnQ7tgFxUU7PfKYlFM7RvVodUxvAOGieB3xqy1bPTOjqMutyW0tvwqKH8DRGVg9zAbiv1E6TZ2pc8jXnq3LEUVokGHxG77ENedFPSEnXQtjqSgAeWOex8XhCFDAU+PtaHUOcDLQOXFL6GiwxsaW0l/Ln8npN6kZLhp/DaiX4+thmjlVfxjXjYc3knyUA7uC+ZJkoTJN4AEuq3ROj5zMPYH96NMlry8+uwOvJ71/9Fa86WINm8suDtx/+jjvDCY77G090jmUiD28leCL30p4/+4njJfHJOH3DBVPbIJqwB6CGNaD3/uFXHotMcFFSpmNkHNkw8iHdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	013aa29b-2934-4f53-09da-08decd41bf4d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|36860700016|82310400026|14060799003|23010399003|376014|35042699022|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	zOPmDkViulBBCwgD5giJG2r+++pJws+O4ncfYpHKuq5J8gZVua+AG008nVDBT+Unm1Ggzvdw/mEqCIGGR0OLGfyQurM8BetAaDWWcSynmmypzgDUQhqvYvHpDmG+cCy+A0RmMpIYUCFd58YUcvgK7EYZRhXExGrBOD055ijiM/gs+rIjW8p6Ol0L+QFW7f98N+4PhfME67ChZevMwsDLA1/cFqg0ReYucPq8aDJbtH8c1koQv3OMbXjrXxpNmK6PetTIGEODmxDVeJMEodk3N0YGEoDtHWSC4I9W3M8mPdyJ5qj7Ax3CxJvHsvV/sIL9ml2Itc+XUg6JpX8tzqdbUGcZ8ISHLaWa3dRwC3tDv4MhrBlrQ3XT47EmUwhWdfAYa/++6AdQfyWn58Y1Q3/QsPWFhvDrxIVxdxb0lIFnpsiz+YgpW9IwGFf7rtmP9ivNgZP8cLw15V8gG+cNvl6/fb47Nc62CX4gMo4uJmV2flr1IGOmgbVxT4dqoaBMgJRyQ1kQYoGh0oU4MEK5VtZ9CpkBd6Rr/eAjkQ4oJIKBYfNvyHOPcww/kp5KwFi2i8v7LdkMzQxaLZuMk3p6HCsd/TIsBcToKq7tr/Q+kYlRflc9XGWFSeKHYsUzJIGkjsawLTxuatZPwzKOIyoaG/FTps3xJ3TQfjvOfpIAPQwHOnOkyTDc5rK8Z3xqN9a8epKkUt++QoTW3+M4uzINCJ+uQqYdPebrZ2a5sa582cHCB/M=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(36860700016)(82310400026)(14060799003)(23010399003)(376014)(35042699022)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TM+7DOcu9dTosqW3XwTXGCogAKKbjUjPxxNwSTG67syZ1pL6/scLX0gzXis7WCPB8JA/F0tOflrL2kkUU001I/K9YXakZSQE5oC1vzFEGejmciEWUXizJ5FDyXJxWvkL+MY+00iYneGloaLHhegd0WZLgyWK568BQW61+X1j/b+CYNyL2pRqmqr9HaJcU+hDGeclXB5eLRoubKsi4F4Na6UvNPyoklHq2NNv1tnaZMGJndUkDy4c56ogJJgMlh+glKBytSNuFIYvPFaZW/296HLLcY1gTCVR9d+g+TIyIXRWxat923uisN8/IhizBFY7cwQJsXzNqpktdWikCvO5C7uh70vCtjOcl1xxqb9JA0YGXUuFuziciMSEh1AhDiAw8wI0WEL4VCo/Tv4L7e9yLRcArX9YtpKc24+jKBgxQMEeOY6mZQQ1mReKzhAogvQS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:00:02.7436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0443b7b-829d-4ab6-274a-08decd41e4cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239083

SGkgQW5kcmV3LCBNaW5nbGksDQoNCj4gT24gMTYgSnVuIDIwMjYsIGF0IDIxOjUwLCBBbmRyZXcg
R2Vpc3NsZXIgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGdlaXNzb25hdG9yPWdtYWlsLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoZSBtb3ZlIHRvIHFlbXUg
MTEgYW5kIHRoZSBlbmZvcmNlbWVudCBvZiA2NCBiaXQgbWFjaGluZXMgYnJva2UgcHBjNjRsZQ0K
PiBtYWNoaW5lcy4gQWRkIHBwYzY0bGUgd2hlcmV2ZXIgdGhlcmUgaXMgYSBwcGM2NCBtYWNoaW5l
Lg0KDQpJbnRlcmVzdGluZ2x5IHRoaXMgcGF0Y2ggZnJvbSBBbmRyZXcgY29uZmxpY3RzIHdpdGgg
YSBwYXRjaCBmcm9tIE1pbmdsaSBZdSB3aGljaCBjaGFuZ2VzIHBwYzY0IHRvIHBvd2VycGM2NFsx
XS4NCg0KV2l0aG91dCB0cmlwbGUtY2hlY2tpbmcgSeKAmW0gbW9yZSBsaWFibGUgdG8gYmVsaWV2
ZSB5b3VyIHBhdGNoIGFzIEkgZXhwZWN0IHRoYXQgeW914oCZcmUgYWN0dWFsbHkgcnVubmluZyBQ
UEM2NExFIHNlcnZlcnMgKGFuZCBhbHNvIHRvdWNoZXMgbW9yZSBwbGFjZXMgd2hlcmUgQ09NUEFU
SUJMRV9IT1NUIGlzIHNldCksIGJ1dCBJ4oCZbSBhbHNvIHdvbmRlcmluZyB3aGF0IE1pbmdsaeKA
mXMgcGF0Y2ggaXMgZG9pbmcgYmVjYXVzZSBpdCBtdXN0IGhhdmUgYmVlbiBzZW50IGZvciBhIHJl
YXNvbi4NCg0KQ2FuIHlvdSBib3RoIGNvbXBhcmUgZWFjaC1vdGhlcnMgcGF0Y2hlcyBzbyB3ZSBj
YW4gdW5kZXJzdGFuZCB3aGF0IGhhcHBlbmVkPw0KDQpDaGVlcnMsDQpSb3NzDQoNClsxXSAicWVt
dTogQ29ycmVjdCB0aGUgcHBjNjQgc2V0dGluZyBpbiBDT01QQVRJQkxFX0hPU1TigJ0sIGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjM4
ODg0DQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgR2Vpc3NsZXIgPGdlaXNzb25hdG9yQHlh
aG9vLmNvbT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L25hdGl2ZXNkay1x
ZW11LWhlbHBlcl8xLjAuYmIgfCAyICstDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUtdGFyZ2V0cy5pbmMgICAgICAgICAgICAgfCAyICstDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUuaW5jICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gMyBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvbmF0aXZlc2RrLXFlbXUtaGVscGVyXzEuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L25hdGl2ZXNkay1xZW11LWhlbHBlcl8xLjAu
YmINCj4gaW5kZXggNjBmYjYzNTYwMC4uZTU5MWNmMGYyOSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvbmF0aXZlc2RrLXFlbXUtaGVscGVyXzEuMC5iYg0KPiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9uYXRpdmVzZGstcWVtdS1oZWxwZXJfMS4wLmJi
DQo+IEBAIC0xLDcgKzEsNyBAQA0KPiBTVU1NQVJZID0gIlFlbXUgaGVscGVyIHNjcmlwdHMiDQo+
IExJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5Ig0KPiAjIFFFTVUgMTEuMC4wKyByZXF1aXJlcyBhIDY0
LWJpdCBob3N0IGFyY2hpdGVjdHVyZQ0KPiAtQ09NUEFUSUJMRV9IT1NUID0gIihhYXJjaDY0fHg4
Nl82NHxwcGM2NHxyaXNjdjY0fGxvb25nYXJjaDY0fG1pcHM2NHxzMzkweHxzcGFyYzY0KS4qLWxp
bnV4Ig0KPiArQ09NUEFUSUJMRV9IT1NUID0gIihhYXJjaDY0fHg4Nl82NHxwcGM2NHxwcGM2NGxl
fHJpc2N2NjR8bG9vbmdhcmNoNjR8bWlwczY0fHMzOTB4fHNwYXJjNjQpLiotbGludXgiDQo+IFJE
RVBFTkRTOiR7UE59ID0gIm5hdGl2ZXNkay1xZW11IG5hdGl2ZXNkay11bmZzMyBuYXRpdmVzZGst
cHNldWRvIFwNCj4gICAgICAgICAgICAgICAgICAgbmF0aXZlc2RrLXB5dGhvbjMtc2hlbGwgbmF0
aXZlc2RrLXB5dGhvbjMtZmNudGwgbmF0aXZlc2RrLXB5dGhvbjMtbG9nZ2luZyBcDQo+ICAgICAg
ICAgICAgICAgICAiDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LXRhcmdldHMuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS10YXJnZXRz
LmluYw0KPiBpbmRleCA5MzdlZjFhOTExLi4zYWY3Yjc0ZWVjIDEwMDY0NA0KPiAtLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXRhcmdldHMuaW5jDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUtdGFyZ2V0cy5pbmMNCj4gQEAgLTI2LDcgKzI2LDcgQEAg
ZGVmIGdldF9xZW11X3RhcmdldF9saXN0KGQpOg0KPiAgICAgaWYgJ2xpbnV4JyBub3QgaW4gdG9z
Og0KPiAgICAgICAgIHJldHVybiBzb2Z0bW11b25seSArICcnLmpvaW4oW2FyY2ggKyAiLXNvZnRt
bXUiICsgIiwiIGZvciBhcmNoIGluIGFyY2hzXSkucnN0cmlwKCcsJykNCj4gICAgICMgUUVNVSAx
MS4wLjArIG9ubHkgc3VwcG9ydHMgbGludXgtdXNlciBvbiA2NC1iaXQgaG9zdCBhcmNoaXRlY3R1
cmVzDQo+IC0gICAgbGludXhfdXNlcl9ob3N0cyA9IFsnYWFyY2g2NCcsICdsb29uZ2FyY2g2NCcs
ICdtaXBzNjQnLCAncHBjNjQnLCAncmlzY3Y2NCcsICdzMzkweCcsICdzcGFyYzY0JywgJ3g4Nl82
NCddDQo+ICsgICAgbGludXhfdXNlcl9ob3N0cyA9IFsnYWFyY2g2NCcsICdsb29uZ2FyY2g2NCcs
ICdtaXBzNjQnLCAncHBjNjQnLCAncHBjNjRsZScsICdyaXNjdjY0JywgJ3MzOTB4JywgJ3NwYXJj
NjQnLCAneDg2XzY0J10NCj4gICAgIGlmIHRhcmNoIG5vdCBpbiBsaW51eF91c2VyX2hvc3RzOg0K
PiAgICAgICAgIHJldHVybiBzb2Z0bW11b25seSArICcnLmpvaW4oW2FyY2ggKyAiLXNvZnRtbXUi
ICsgIiwiIGZvciBhcmNoIGluIGFyY2hzXSkucnN0cmlwKCcsJykNCj4gICAgIHJldHVybiBzb2Z0
bW11b25seSArIGxpbnV4dXNlcm9ubHkgKyAnJy5qb2luKFthcmNoICsgIi1saW51eC11c2VyIiAr
ICIsIiArIGFyY2ggKyAiLXNvZnRtbXUiICsgIiwiIGZvciBhcmNoIGluIGFyY2hzXSkucnN0cmlw
KCcsJykNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5j
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gaW5kZXggMzA3MWY3NDY1
MC4uZmE2YTc0ZjU5OCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS5pbmMNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4g
QEAgLTYzLDggKzYzLDggQEAgQ09NUEFUSUJMRV9IT1NUOm1pcHNhcmNobjY0ID0gIm51bGwiDQo+
IENPTVBBVElCTEVfSE9TVDpyaXNjdjMyID0gIm51bGwiDQo+IA0KPiAjIFFFTVUgMTEuMC4wKyBy
ZXF1aXJlcyBhIDY0LWJpdCBob3N0IGFyY2hpdGVjdHVyZSBmb3IgZW11bGF0b3IgYnVpbGRzDQo+
IC1DT01QQVRJQkxFX0hPU1Q6Y2xhc3MtdGFyZ2V0ID0gIihhYXJjaDY0fHg4Nl82NHxwcGM2NHxy
aXNjdjY0fGxvb25nYXJjaDY0fG1pcHM2NHxzMzkweHxzcGFyYzY0KS4qLWxpbnV4Ig0KPiAtQ09N
UEFUSUJMRV9IT1NUOmNsYXNzLW5hdGl2ZXNkayA9ICIoYWFyY2g2NHx4ODZfNjR8cHBjNjR8cmlz
Y3Y2NHxsb29uZ2FyY2g2NHxtaXBzNjR8czM5MHh8c3BhcmM2NCkuKi1saW51eCINCj4gK0NPTVBB
VElCTEVfSE9TVDpjbGFzcy10YXJnZXQgPSAiKGFhcmNoNjR8eDg2XzY0fHBwYzY0fHBwYzY0bGV8
cmlzY3Y2NHxsb29uZ2FyY2g2NHxtaXBzNjR8czM5MHh8c3BhcmM2NCkuKi1saW51eCINCj4gK0NP
TVBBVElCTEVfSE9TVDpjbGFzcy1uYXRpdmVzZGsgPSAiKGFhcmNoNjR8eDg2XzY0fHBwYzY0fHBw
YzY0bGV8cmlzY3Y2NHxsb29uZ2FyY2g2NHxtaXBzNjR8czM5MHh8c3BhcmM2NCkuKi1saW51eCIN
Cj4gDQo+ICMgUGVyIGh0dHBzOi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1k
ZXZlbC8yMDIwLTA5L21zZzAzODczLmh0bWwNCj4gIyB1cHN0cmVhbSBzdGF0ZXMgcWVtdSBkb2Vz
bid0IHdvcmsgd2l0aG91dCBvcHRpbWl6YXRpb24NCj4gLS0gDQo+IDIuNDMuMA0KPiANCj4gDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2Fn
ZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIzODk2Mik6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2Uv
MjM4OTYyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L210LzExOTg0MDc5My82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStv
d25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25A
YXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

