Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB135C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:25:15 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7839.1786541114236566115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ig9HHyaS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ig9HHyaS;
 spf=pass (domain: arm.com, ip: 52.101.84.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JVq6aCaar7curuOQIbOe68j8/ZlU0UCa7Het98DrUB1fH4P2tTxqaq2o+R6mOFUNXoPl867DMoeCoiAm1SjoGcqiXl8GNzOGH4oIFFKT6GdGpnLuxLR1Q7gYV1h3IrIfjcQbWifOrkVsG6vK59+d/ooggscW3BIZj7ncr0rbRxF2RBxitKAbB3L8bbM4ziIwiVbV8FpAVL2WrvAWYeJmtiD05KBo8De3YZIoxrGQIDLRNwfLiQ+bZ6U6s1v3XBNgJR4b+zsCwJoqQJ99bKVpTBdZ9olvylXbHV01vjPoprye6tX9MgLedioovOJ6VRCkI63pi6ROhwPmtGyb/GHTsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZGNhCg8Jdm6czppSXYd82kkuQPRvN/L8IVQTOr1C50=;
 b=yGSu6/LJam4mwoJwF9ED/hBGfXfioSYrQTnBZpcQxgLkDyCWMi8sGZKH1SDTVfEJZfvnqj0Bn7XlcbGxbA1jeEb8eS+DD5J7yeTdysyEwezBP4aK2cikOYGDuJ+QpLWMZodj9imv/h1hp5Lweva07YpYJprKabMBeg5aia94vVWQcg+KmITLvY/+AFSPdsTpVeXXF6vRTLo5/oEM1ndYhejWKvN/zug6JJTESCKeX/xLbJTtuOfaqa3rXgdg9UL87Oader0KbNgX/Cv7o84AvWGYmi3TpBFCwKcKwWwNVkANiawmFlZRx/lD/3EPf0dYEnMXYM7jvAJ9iUmo2ewneQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZGNhCg8Jdm6czppSXYd82kkuQPRvN/L8IVQTOr1C50=;
 b=Ig9HHyaSx6oL7dwlJrW7cKjCULhNy2qv17Syg5hjYE02hiouJpG3rGpsAOc94kVzX9ykzjHoIT7XXw0mBxkq/ul0FfQFpBJqaxs+Cj2GXFBUnYoV72bTHpofsKgWGYbOL3cgvx+4amGpfVMMHfRnN2TmSm1Mx7Gs9uRsvbq6BE8=
Received: from DU7P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::17)
 by BR2PR08MB999883.eurprd08.prod.outlook.com (2603:10a6:2c8:15::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 12 Aug
 2026 13:25:07 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::8f) by DU7P250CA0024.outlook.office365.com
 (2603:10a6:10:54f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Wed,
 12 Aug 2026 13:25:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Wed, 12 Aug 2026 13:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FefpOskYrz2Ww093xHnd1nuLVvHUTDxD+ebNMcmzOIjmNWnVt3j6g/U5Dvq+QYMpJQd2ev5aoOOM8sZGr0ZI5C56h1WNVb2IRf6FRu4lncIky+y6WtSwAc1KLq5QynNX1b8/6GCYIsF3JevZ+UxP3Srnvqw6PE3MAUm/Pg0mc+hLFbImPhCkXMeYdonlwyW8yDdUfNjLL7zwo1519HsABLoWFM/LRZk597g4Ir++Xo/Ciyu6i4O4dsYZCGf6hhCLsZyXyC5nX4hNZBDk+9RkXA7XlZ+h86xtfcBIrbfUti720IqQ3RwJw8sqT6F5HeGBV8NOmt+PpOVvr8A+CCxLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZGNhCg8Jdm6czppSXYd82kkuQPRvN/L8IVQTOr1C50=;
 b=d7u5gYnqtjmJ+e6tIew8EfwhORp3HN6TPKExLp9dYtPwvbccrKo+1xKjMTO5GQ47c5cufqJrqJoagC7wRNK72p5Q9m7AHBPeNGAdMbtDsOP85bHYBTqMOVEeJ96PVgGoFlxbfLIjckqqKl6j2sHkzU7FZErBSFSr91ij2MSIgb9z9XnSeZOtJAKHDMEvYxXn/16Z48WAg01l+mrsl89S6J7rTRMUrvYWq0GJLbDFz4WZ4haN86k43QEn1GnmO9l0RE9eCaqlAXrRwd+B14BeO2qdfjHuQkEMFrjwsnUg8pnu89w2GLfQ5/NuLUyFkoTpIyIi58q3QUbjUaX6ecDqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZGNhCg8Jdm6czppSXYd82kkuQPRvN/L8IVQTOr1C50=;
 b=Ig9HHyaSx6oL7dwlJrW7cKjCULhNy2qv17Syg5hjYE02hiouJpG3rGpsAOc94kVzX9ykzjHoIT7XXw0mBxkq/ul0FfQFpBJqaxs+Cj2GXFBUnYoV72bTHpofsKgWGYbOL3cgvx+4amGpfVMMHfRnN2TmSm1Mx7Gs9uRsvbq6BE8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by FRWPR08MB11636.eurprd08.prod.outlook.com (2603:10a6:d10:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 13:24:33 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 13:24:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alex Kiernan
	<alexk@a-squared-projects.uk>, Jon Mason <jdmason@kudzu.us>
Subject: Re: [OE-core] [PATCH v2 2/2] qemuarmv8a32: add QEMU machine for
 AArch32 ARMv8-A
Thread-Topic: [OE-core] [PATCH v2 2/2] qemuarmv8a32: add QEMU machine for
 AArch32 ARMv8-A
Thread-Index: AQHdKIbGoQAm5Lt0AUKRfr2QSz3JOLaaarmA
Date: Wed, 12 Aug 2026 13:24:33 +0000
Message-ID: <214ED404-A4E7-4F85-89B3-C1C78006DE76@arm.com>
References: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
 <20260810-tune-a32-v2-2-52045fd54937@gmail.com>
In-Reply-To: <20260810-tune-a32-v2-2-52045fd54937@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|FRWPR08MB11636:EE_|DB1PEPF000509EB:EE_|BR2PR08MB999883:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e805fa-97ec-46d4-4745-08def8752068
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|5023799004|4143699003|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 bCypNltI7zNpTdsFE/juDi9Sw5/MT4rntKk7wQ8Pk5Ji32FkZF7y4UNCYqlW9oLToX8jtoJTyF/WzdkK2JLwO4Y2o9+Hnlp/FPD53rWHw+AkM8heO7g4vhls2nCOBaRpVAXP8x7AyOvo18FvwQOcHy2NW1c6E74oy+nOuAKdfJHL+cUoxyRxpk2Qy4cKRKDOUMIlurpT5F/yVo6t49fj/PrB+SMCzhSANDLw3NOFdFvYOEARcLRdXNu80/jJwkblh6JMxNqR4P8e/YdfOan24K2Gr3uqckP4kNwb3X2afQxGzs9SCZFiIcE5Qkb1c1yhflYFrT5IvFb8SEh3zWpa6kn/9MxHQSzIwHKlDM2dx/qvj6pnEod62+R6arjTgNSrvKWHEjUv/KDnHkd1ZEcSTXxETPV0LlQfQq9Bbo85UKnMawQSJHd0dDRGUmv58bcYn6TRjjwde5ZFYzR4Y7ni7oepQejNovc1jDsBO7RzhJ6n2ZomSOONE8AXf/N5C246hKZLYlEsvWaQpUrb1XCZ73Tg/ClA+PoJWjY+8HTm81H3x2Xju/E6NPHBTLb8JtDVr7qn+nrK+Ar8aZ50vpW3VNIrgAuZOuOpdJV/TTse7PRR5RvpVj2NEMVRJD9tEeRitcgOfZxfWLELPKL7A/oOg9O0mhAU0I/Rkc9SmIfXWaPWg/8Mv2C6L3UwTaBcNcjp38naN/w441w6IvUfyQSviCCJwk9beBOZEoCipJ8sb7U=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(4143699003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DE403AD17B4B746A718E282027F8097@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 cx2YeT2QRhF9LJWfVBSrgfgYTsoXlMSMzdJGF8wx4woaqeRFpLxB7U5AyntuYvAJEzJjmW8stG41knTEPJNUjF3sERNOqaB0syVTFCxOWWi1qEE1vN/FcFkNQRH0Z3x3XkcK9evV8GA4CFZLyoy+nK/S1OQ6wISMIDfYxJFzYc9wEeOqw4l+fqVRqvBkpLcCeUZlafPKf43VlWsjXlXhmnjZ4TQm0aT/R8RZXcSYU16ZWPpo+QpgUFr3CSbTMv31W55vLdbyFL1BYXVjXKkA9JiBnp5qjXt5PtuuM0eXaTWhkCjeqwEtKqUC3QOU3v8E4JopGxz+I1zCN+iLJ0bICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR08MB11636
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	592bbdc3-3180-49b8-459f-08def8750c4d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|35042699022|23010399003|82310400026|14060799003|1800799024|22082099003|18002099003|11063799006|56012099006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	UgW03V6j37FjalNxYQjX631NHe4JmohRIww6Onz62yyO9DQnc4V0DxN33ZP3xYK/NTJjGkhXUXGmFq7kmJ2WBIys3+cNTjFBtxLY4FkvikRenyqmNksnvhhYiX8xQYFOn/9kL4s2igT5cBov7s26X3ktmqpBIsU8MqRnYy1aHB+Q22gZWD6c8z4ex5rMmHUVP3JxYdWlZBoAyI/stQNvgIB3Qt8VQ06Z1KX/IY3Osio6U/UkZbKBtNlEZVZVlGGjea177lnKWwbmIvEDp/oovEYudeSaMdDz3YlpPUeLIgOQNQGj+T5IKnJ5bYmZtgx+4I82VJ827b/s7TFnoeTSiZVGDPD5zHSRHDd1wQG3BIAaPEF3hPsVokwzinvi3VwH6SfVvpKAWmdK2I/cp+KSoA8WsPjAktNiDNnqCl55L+8e6FIM8iNwplRM9uhcLy93yp54ozrfpz0gjZsCpbUTscX8y7sIqAQA5m95XAWNg5zgFd8f7YUbVKi0Ji7xNsgHWiK67fnZMkiJOm1erSTQ1k03tO1Kp/eeM/qjEiqtGy7ptJVsmvCa6jfsxIEPynyTJgbwS7lYY7djM7jmeoM015ElquuAI1hju8+kSFGQ1gRSqQ8yAH1qgIir2m0b4f1X+eOfOfHL6iI++V2nORy5byUUs4N6RtbqbDnEK6lvs+Rhl96deRfypd5oCpHdP91hwsn9CbTbYQoDFwlT2m9wlA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(35042699022)(23010399003)(82310400026)(14060799003)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uGfrluop3BEst2GE2bxVKeDlf0rvRJiXOJrULcf/vKB9GjzKGVMhcSindxzUey9VILN9vsoTP4ycCCdhq2uI4qdoeGgSqfg3hOBbZw/n6ySluF6a6awjKtqYc5pPqaqU7yYPxnyyCdcPdZcyipe3eH647sjhf5rsSKt6thCK5I1ELnHmVy0Q7jqPeYJ0QQkTXm2NskXI0LZGymYibRucoC7JznZnNgYi8Kfek1kgRI9CbK1LdMPi1mhx+BKlB4MN/ZuA+qNkisHBAYi/j4GPjpsgLmqgbeMamLNrNoyK5wnJIKZXsbGpUWihesSfYFxSKsjn8tZtmKX7aBC2M1+vLs9LbwZGLYyVnC61PgcSi0vShWUb+nfC7/PfweWh3iE00vp/sXl6/Z0Ch9WyTme1S5iIXVuhgS444UVfIGcSQjIGZhVA0SE0tYXHHRwEwb5f
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:25:07.0783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e805fa-97ec-46d4-4745-08def8752068
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR08MB999883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243290

T24gMTAgQXVnIDIwMjYsIGF0IDA2OjExLCBBbGV4IEtpZXJuYW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFsZXgua2llcm5hbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBBZGQgYSBRRU1VIG1hY2hpbmUgZm9yIGV4ZXJjaXNpbmcgYW4gQUFyY2gz
Mi1vbmx5IEFSTXY4LUEgdGFyZ2V0DQo+IChDb3J0ZXgtQTMyKSB1bmRlciBlbXVsYXRpb24sIGRl
ZmF1bHRpbmcgdG8gdGhlIGNvcnRleGEzMi1jcnlwdG8gdHVuZS4NCj4gUUVNVSBoYXMgbm8gQ29y
dGV4LUEzMiBtb2RlbCwgc28gaXQgcnVucyBvbiB0aGUgJ3ZpcnQnIG1hY2hpbmUgd2l0aA0KPiBx
ZW11LXN5c3RlbS1hYXJjaDY0IHVzaW5nIHRoZSBDb3J0ZXgtQTMyJ3MgQUFyY2g2NC1jYXBhYmxl
IHNpYmxpbmcsIHRoZQ0KPiBDb3J0ZXgtQTM1LCB3aXRoICdhYXJjaDY0PW9mZicgc28gdGhlIGd1
ZXN0IGlzIEFBcmNoMzItb25seS4gVGhpcw0KPiBwcm92aWRlcyB0aGUgQVJNdjgtQSBBQXJjaDMy
IGZlYXR1cmUgc2V0IGluY2x1ZGluZyB0aGUgY3J5cHRvIGV4dGVuc2lvbnMNCj4gbmVlZGVkIGJ5
IHRoZSBjcnlwdG8gdHVuZSwgYW5kIHRoZSBzYW1lIGJpbmFyeSBzdXBwb3J0cyBLVk0gb24gQUFy
Y2g2NA0KPiBob3N0cyB3aG9zZSBDUFVzIGltcGxlbWVudCBBQXJjaDMyIGF0IEVMMSB2aWEgJy1j
cHUgaG9zdCxhYXJjaDY0PW9mZicuDQo+IFRoZSBrZXJuZWwgaXMgYnVpbHQgYXMgYSB6SW1hZ2Ug
YW5kIHUtYm9vdCB1c2VzIHFlbXVfYXJtX2RlZmNvbmZpZywNCj4gbWF0Y2hpbmcgdGhlIG90aGVy
IDMyLWJpdCBBUk0gUUVNVSBtYWNoaW5lcy4NCg0KV2hpbHN0IHRoaXMgaXMgYW4gaW50ZXJlc3Rp
bmcgbWFjaGluZSwgSeKAmW0gbm90IHN1cmUgSSBzZWUgYSBsb3Qgb2YgdmFsdWUgaW4gYWRkaW5n
IGl0IHRvIG9lLWNvcmUuICBZb3UgY291bGQgZWFzaWx5IG1haW50YWluIGEgdGlueSBCU1AgbGF5
ZXIgdG8gZG8gdGhpcywgZm9yIGV4YW1wbGUuDQoNCklmIHdl4oCZcmUgYWRkaW5nIHRoaXMgdG8g
Y29yZSB0aGVuIHdlIGVpdGhlciBuZWVkIHRvIHN1cHBvcnQgaXQgKHdoaWNoIG1lYW5zIHNvbWVv
bmUgbmVlZHMgdG8gY29uZmlybSB0aGF0IHRoZXnigJlsbCBiZSBtYWludGFpbmluZyBpdCwgd2Ug
bmVlZCB0byBidWlsZCBpdCBvbiB0aGUgYXV0b2J1aWxkZXIgd2hpY2ggbWVhbnMgbW9yZSByZXNv
dXJjZXMgYXJlIHVzZWQgb24gZXZlcnkgYnVpbGQsIGFuZCBidWlsZCByZWxlYXNlIGFydGVmYWN0
cyBmb3IgaXQpLCBvciBleHBsaWNpdGx5IHNheSB0aGF0IGl04oCZcyBpbiB0aGUgc2FtZSB0aWVy
IGFzIHFlbXVwcGMgZXRjIHdoZXJlIHNvbWVvbmUgY29tbWl0cyB0byBtYWludGFpbmluZyB0aGUg
QlNQIGJ1dCBpdOKAmXMgbm90IHRlc3RlZCBhdXRvbWF0aWNhbGx5IGFuZCBtYXkgd2VsbCBiZSBi
cm9rZW4uDQoNClBlcnNvbmFsbHksIEkgZmVlbCB0aGF0IHFlbXVwcGMvcWVtdW1pcHMgYXJlIGlu
IHRoYXQgc2Vjb25kIHRpZXIgZm9yIGhpc3RvcmljYWwgcmVhc29ucywgYW5kIGlmIHRoZXkgd2Vy
ZSBiZWluZyBhZGRlZCB0byBjb3JlIG5vdyBJJ2Qgc2F5IHRvIHB1dCB0aGVtIGluIGEgc2VwYXJh
dGUgbGF5ZXIuDQoNClJvc3M=

