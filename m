Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1EACA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:35:22 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15675.1790872514682839574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qdkYZio+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qdkYZio+;
 spf=pass (domain: arm.com, ip: 52.101.72.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NwII0Z2tm7KrINciINXF2AH77Qi/yl9e9kZc8paVntUz8jA3Xld4V7maWIRCBcwBBeoABpal2YTj/xuNqMZnctCio8RnBaBI7BlRjROIPG9IuLPwDG4/nAQVk+pZE8p609Nf+w7tR6PVVTsPUMvhoP6Y9krxE/+2/4nwGjYM4Qzz8aGel1Iy6MbaXvX6jx+bZlJ4/0TluWvBW74wI1Z0hz0B1tFvj4foYoDQehMU7Jx7vsZzMQzLPQ0Cpr9rS4A5LAvjteZI8Oopj6vuXXPHIhJbCv7n+1vba0/sjiokVwUdOT6gZrwAN01lAWa1bYuvHkpjn7fUjOVlPNtNbMMCyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hon/xQrVrJW3VhND48Sw18IEDRsdCm3gtKW7cqLflyc=;
 b=i0LH18iS0vApEnTA4o3FaYMPShpHI8oPSbxINlckQlilZ+xZ5DDlw9g1bguGTLLjPae+vEOZSVyeovxnoz88aK8WNwzqI07Ot8wwBf7O/Y7T/S4sTW7NR5RDktzOcf+ptOceGMJqNhMTJsal9ai9S6GHkNk2X3lWDYywzZxKZhsZhDnaVKz6wpFkzBlyAhNaC/x/Df/SEHzPnC99PxPcyzD4FMVHapu5uET4LcJ6wvGg4O1K0mROlJtaEvJU1Wn4mxW3ow2jmW/ib7yIu6xK+jujpLxOsTaYaLyi+qB4oh0H8cmmEB1myMAVSWFq3bhvKoqiPN9HEOBf6+whheBNfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=baylibre.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hon/xQrVrJW3VhND48Sw18IEDRsdCm3gtKW7cqLflyc=;
 b=qdkYZio+Zh2O7Y6vc/hZzLeiBmbMxzdX75zrnHzEoCwjYIv4S/TM/oKiQF4jND7jjJIqK2gF9WzPL1KpUtAzV1nw5iumI5Ssl+X9H66vyheQoBPP3xj9B41aKTF93nPW867a0ql+WkG9hYDE8Jt/j2dIMb0BddNiLZOItqU5ZXw=
Received: from AM0PR02CA0198.eurprd02.prod.outlook.com (2603:10a6:20b:28e::35)
 by PAWPR08MB11485.eurprd08.prod.outlook.com (2603:10a6:102:50f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Thu, 1 Oct
 2026 16:35:06 +0000
Received: from CPH1EPF00000520.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ac) by AM0PR02CA0198.outlook.office365.com
 (2603:10a6:20b:28e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 16:35:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 CPH1EPF00000520.mail.protection.outlook.com (10.167.241.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 16:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCQc9cmVd3Rq7BAXVlrzuO6hyOLjVQwcl18VRXhhXKkT7RXegEQylywOnBifsvCGKgHzOdqBNrGmY4jlsm+Wo/fsK/jpOVo7jfaxz48syVnTYiKVR/R2OcPaRuJT2ebxOFfe8rIhbJMqrZ39FRk6XjWE9GOaNbT3cZJ4RMWRh44Y1XxqPgZ1v0c1Tfyhi3Vky7y/1cleO+REKmrDLJNt7H+dodrDh9otzD5NVMxpaA3DMM8eajXIf88y90hNiCzfeJI6j8pKZLGSqdNTYE8jvxPyCLhUXM9Huz2WCrXVY1BYlxzRjbo5goMCb0W7peTCyLil6S1HG47fyc3lhLS76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hon/xQrVrJW3VhND48Sw18IEDRsdCm3gtKW7cqLflyc=;
 b=tLrKFB4/2tAjlg9XM+5tweBgQKa3P84YHkIwyENJlN3fNzAUhWWCh8b6yD5J8RH4jbcHMaDR1JsX0iDehmJHJAw4S8FttW/puj7L3TQzSX3cHbgRxajpNK7wfHCRhnNb65Uvk0f4lTeh1XEgU3zvmyPXShKC2D77T8PoQV5Dbf/lAx/tC2Aw/LZhtpOq05VKlSoxgYDWkQPljEsqveh+CoYhXpBFrjeKn6kZSwHigNfnbSf97SsYCMeotBppjzp54fqhanExmdJID1Pz1XUE7CvmsNs+57j+2YDKc/S4EBj+/Ecgsoy1D2nIEvvBoRqY5ZpoojFO7tqShDuG5kmfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hon/xQrVrJW3VhND48Sw18IEDRsdCm3gtKW7cqLflyc=;
 b=qdkYZio+Zh2O7Y6vc/hZzLeiBmbMxzdX75zrnHzEoCwjYIv4S/TM/oKiQF4jND7jjJIqK2gF9WzPL1KpUtAzV1nw5iumI5Ssl+X9H66vyheQoBPP3xj9B41aKTF93nPW867a0ql+WkG9hYDE8Jt/j2dIMb0BddNiLZOItqU5ZXw=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM9PR08MB5889.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 16:34:33 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 16:34:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 01/13] scripts: resulttool: add 'durations'
 option
Thread-Topic: [OE-core][PATCH 01/13] scripts: resulttool: add 'durations'
 option
Thread-Index: AQHdS5X20eIjSY2Q6EGYD/jKzIH7kLbo7kKA
Date: Thu, 1 Oct 2026 16:34:33 +0000
Message-ID: <BB4DFAF2-1A9A-488F-97A7-43F96272C09B@arm.com>
References: <20260923190419.353493-1-tgamblin@baylibre.com>
 <20260923190419.353493-2-tgamblin@baylibre.com>
In-Reply-To: <20260923190419.353493-2-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM9PR08MB5889:EE_|CPH1EPF00000520:EE_|PAWPR08MB11485:EE_
X-MS-Office365-Filtering-Correlation-Id: df0a1476-07ce-4d08-dc63-08df1fd9f368
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 +uBiZQ5x+LxZUY+6zuZMeuTHrkMPzQB5tZhNvZC0lITw3Yn+tZXRrTSoq4YUMAca8XzwFBBClHt2zelD0BAHpUd8B/pXl0ZuZLUtzS+BiqPJAmUZmvCWsqK5W0PbYlThjVdfAY4L+yqDlDr5uCxaDiOMwyQmGcTyGOL5VwNsQdkBq8sZkTu2p7+dHGJKYtlPeFGSfyht/zr2hRaBV112lIyX4a4khMt3xjE5fck1drAzfhdnw6/Pk20m7S/QegevqxyVojB8EuTAnLKtDvZZwjPNEkFYTmXLjBLfF8/LPnbgd1ytd7JdES1DC3Qws2xMYuJl9RInn0FKEXY5y6hoSH4mL8TiggIG7QlOHPz5fkiqq1axNeCboNknVq6aFYV5iseexJF+T/23xVS62y0BYmwB6xhh8xLtK7N8fAZvx4OYHdcXE91h3x9oSkAEE5GFRnfKxY3BS7HEMP2b7n7db5+p8RVNQLVmbAoNvAprUYOPxvyQ/jtQ037a4RQ6QAeg53VYu4O2YYVpMJpS/QmR9J+A5FjTzYX+b9CqX4GIPO9QMpjWZnobHGe0aOYaYBz8AyDQG+hIlY+gYOYo2heClyEsculvALQ+qLnSx5VMtewOho1CuJQYV2ag1zMQpctqdQOKEb/wc29Cphuv98PQCGzJdBPY1PMfeA5GsbCMgVe1SwHQ4Wf7tI69oVmohGmN0afknBdlBuiYOkr9XVs8XlmgneUaGQix0wIXp01EUzQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <109981F7BECD37498724966E1CE9C4E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 WaKM/C6Qt93rBxpmoMnQeA3TKbFPq2+b8fXbX9RvoKZ6AcRQOo2hA6V6Zty6WT4BGgyRudx5EdEPZODU3+SEMsc0LFYPO2aY0UEpyUgV4Cxd7lz86XVQ8d2YS0+7e+qtLa5ZgWReZ612gyF0UNkYSigp1AW5FKM+7oGJz1gZy16iZeISK2WBspg6Mki9pdzkTtJ/1ZT9I9r/4k/mHs+hvWIfQ7O2njAfMiuDQfJc8v3Ta8VXAOk6J1FK37qf7ax7o/9exdFXz1vHh0ojRJSIoxoZg8SCrW1C14UHf8F3KdDlaIJeD69DiZIa3asNYD2itjtte1MyEN/UJhKlcTr+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5889
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 CPH1EPF00000520.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cd2fa545-53c8-4ae7-710e-08df1fd9dfde
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|14060799003|35042699022|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	5HyGPN+9Rrw+mXsXgLNpZ/ZDHimjUzYJCEKkBAMFKIw+ALxlnzT8r4vGoLKW2thp+Znx1O2Mrw/IDOw9nXOop5p1yyXTwFUCmr2KjG9qmpfZQkLx+qsuWOPf+h5DMw5T2FklnC+8CPaIMDXqoLcFzPkJrRTvHx6DAumjAifZ858cJJi6ixm9785rvJ7M/XMKORlKQCCCMvah9k5VD6GyAdbb/65p3HC8HtHVYLv8/gYl/70bOVME9Di1VKQjmO3WBCOrFwtZVcFTeaUTcl+u/68Dp7uCqsaLWqz3JCNzZ5REZkfC9YCetvnFfzrMzDRn/5bb6oYJxUYs1984BGLPDskOB8MLztsoU5FSnLnNcfFwOgr891/ULpHyAwPTHUejQOeAE98sNz3IlqS3tt9LrDs7KZHPPYwrMzelg6+lymnYbID5RV/kqQV1J9hOVtadTEBigCFHm0eS7alRRuTdkbBCx+dKawMWG62pUA/Q43BMnqyTUf8DxtDE8eQIeKugpzky7csmLKVj8xaoqiQQmQRwedbw1roGBVX28axA3Ci3ZLhaS98+irDW4Ly17B669CNzn5Tu5Nj5fK7YqOs2dvhMHS3nSyXedKMesrwPlRkhQ9J9PXmrH13/ksRaRDysY9RYQK4iOJbuxM30MtWQJP+BRaNLX54OYkv1+hJAYLPx8y0OyGSVeHUXirZBVTTrsXptzkKFNP7f9ZQ4z9uswA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(14060799003)(35042699022)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	H9mNH6f7QwRuuJIhsyKDJuU4JcXxEluvScFJQB4VXNLAVXmvUHgmuWtIdxZAcZxhp9maaKBFbDi31Eo8FTPUnFmrt1YAG86LuYMTO5zidwCSNgKqTJPp7RNOV7e557eBerHDCd7Ta04VjOFAW7WGU2CNnR68oSbXuJUvlPmHaaX5SAUMscBL35d7UAEzs0TW+qfWSVUAG5EB6My9dWsuz/iJp85EJrycn3yuSXt44giCfMlju/aOe41yvcSezX9ti8r9tYeSc+g4Or47CSvmOMTLhJxJ3VeQcQDtSWEBUzofsSDKNVnv3VYt+30pjtcJ35eEfEgTO8rOH0feL/WDm1N9kp+VUkgeMUVhLMOjz1NIM0a+KsvRNM2FlpnDk8Rxxh1B8hF1dKc7bX2M45aPeA+36JUVy48rxkS3wIeTdgcpi3oXeynoNS+dIAic1mNK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:35:06.1252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df0a1476-07ce-4d08-dc63-08df1fd9f368
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000520.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11485
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 16:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247046

T24gMjMgU2VwIDIwMjYsIGF0IDIwOjA0LCBUcmV2b3IgR2FtYmxpbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8dGdhbWJsaW49YmF5bGlicmUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArIyBNYXRjaGVzIHRoZSBzZWN0aW9uIHRpdGxlcyAicmVzdWx0dG9vbCByZXBv
cnQiIHByaW50cyBiZWZvcmUgZWFjaA0KPiArIyBSZWNpcGUvUGFzc2VkL0ZhaWxlZC9Ta2lwcGVk
L1RpbWUocykgdGFibGUgKHNlZSB0ZW1wbGF0ZS90ZXN0X3JlcG9ydF9mdWxsX3RleHQudHh0KQ0K
PiArUkVQT1JUX1NFQ1RJT05fUkUgPSByZS5jb21waWxlKA0KPiArICAgIHInXlxTKyAoPzpQVGVz
dCBSZXN1bHQgU3VtbWFyeSBcKExpYmM6IFteKV0rXCl8THRwIFRlc3QgUmVzdWx0IFN1bW1hcnl8
THRwIFBvc2l4IFJlc3VsdCBTdW1tYXJ5KSQnKQ0KPiArUkVQT1JUX1JPV19SRSA9IHJlLmNvbXBp
bGUoDQo+ICsgICAgcideKD9QPG5hbWU+XFMuKj8pXHMqXHxccypcZCtccypcfFxzKlxkK1xzKlx8
XHMqXGQrXHMqXHxccyooP1A8ZHVyYXRpb24+XGQrKD86XC5cZCspPylccypUP1xzKiQnKQ0KDQpJ
cyB0aGVyZSBhIHVzZSBjYXNlIGZvciB3aGVuIHlvdSBoYXZlIHJlc3VsdHRvb2wsIGEgdGV4dHVh
bCBzdW1tYXJ5LCBidXQgbm90IHRoZSBKU09OIHRlc3QgZGF0YT8gIEnigJltIHdvbmRlcmluZyBp
ZiB0aGlzIGZ1bmN0aW9uYWxpdHkgaXMgdXNlZnVsIGVub3VnaCB0byBqdXN0aWZ5IGhhdmluZyBh
IGZyYWdpbGUgcmVnZXgtYmFzZWQgcGFyc2VyIG9uIGEgZmlsZSB0aGF0IHdlIGRvbuKAmXQgY29t
bWl0IHRvIG1haW50YWluaW5nIHRoZSBmb3JtYXQgb2YuDQoNClJvc3M=

