Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AE7F531CE
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 20:37:16 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2474.1776112625202194648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 13:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cXbUz6BG;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cXbUz6BG;
 spf=pass (domain: arm.com, ip: 40.107.162.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zji/V/1HXdjRyIm4loi3X6W4UqND1Fg0aK22frWFu7Tuw/bdy5FBYYYodKJS7DmtRtyefYWzclUhJWHnODrqlE8F7uir49L32LAxMpAIlBadzSxolqQJHAuqAWPucY8WnNUCcy1PFVrZT8G5304RhXifWnxuuWQ0nSoenldDVeFmLcpahnRS5YolTpdEKabVtRpQFDnRgeWOrn5BOGtl+5ukojSfmpvdwnI+74f7TfQQCXmcI0Z0ckTbhxPiQAtebV4Arb/F8CS6jul6ZruuTfJWblqkeIgi69QmA+kymS1p3WW6Wegl7hCnKjDSWl2aSTy6J/PJUJQgAifw3f7wNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JmvHavWLS93YczDXH3nre8MOpYpy/4W5wY4WMcAHZY=;
 b=gwMMIdhEFOwEuFlM45br87O6clWb+3ZKBzIPFedF4f4cgiQ634U9+l6eVjWzoVgR2y2UzQaQXVIyKmT9Eo4zd3oNTGW9jExcQvYIR9IgUqJGpiOodb8Bh21uYJiE6NzkkDMs866L42XLc2mLLGoBKihxA6v3fJ0OhwEG+U6io48gELCFWsKpkYzQ35ALTHCULuYUQvfEv9aiV4UL9A8+YExeseIhe9rGSHa3sR/Wb4SQwh2aMMx2wY82EU35vs4Zr+UFuXHFPv2fswgbdVpDoBp/sGNBIz9x8L4qZHuXyuuwv8JafnkAYh4uqo3CauM4KJTJs/lchRoDV92kCeXyDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JmvHavWLS93YczDXH3nre8MOpYpy/4W5wY4WMcAHZY=;
 b=cXbUz6BGtXcHj0a8zlFgY5SQDq5aXQY44g8/Cdlpp+f/deENtLRSZY1vAC2ZO+1mBQWqSGdCfWR2VdthPSDcF2KLV/DyMO8DbSAmkAKgLQ3d1gmmW7+vhEw0xSWNtaCd2a7WvbYzaZmjQNbllfZsqwUevpmxEda4xne+PKBBVLo=
Received: from DU2PR04CA0272.eurprd04.prod.outlook.com (2603:10a6:10:28c::7)
 by AM0PR08MB5363.eurprd08.prod.outlook.com (2603:10a6:208:188::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 20:37:00 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::95) by DU2PR04CA0272.outlook.office365.com
 (2603:10a6:10:28c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.47 via Frontend Transport; Mon,
 13 Apr 2026 20:36:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21 via
 Frontend Transport; Mon, 13 Apr 2026 20:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4GQdyVnIZi7qxZGoMVy30ibZ4Icqzy8HSXws0n8i0YgLSriGTep2jcrZKgvzGQHmup7Qu4iRS04v8Y2DCYXA8IKjBz+4h7R4tD2+o1U7O2PSecweL9lPn3lflwT0aeMidHEhVy6f1NZLrfl79/VOch1nA7sk5O6HZYe0dW/iqCVUJ/tLS/WuIvlWIKAcBxxNhbWyFMNFDXuV8jPYkOxslS6e0YGUcTMnzkeB96c7CxmsrLtE88ARI5vOiXptxcB9YATMmckanf1CQOAarjBL4i0iE0cB2tdZGqfHVP2C7oj+y7AXNkeKinsbk7PbjFOntvgOm7j4N/UyTBtLzNdcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JmvHavWLS93YczDXH3nre8MOpYpy/4W5wY4WMcAHZY=;
 b=V6vEQ+Q86YhQUF/GzfALMV2Jr//fc6NoNKtENMtPO4LOxgHRqodu1aRFk0WeoZvh4MDAMEQRatx02mx+Etff4Fc5d1P/NK2wV4HEO8kUVT12qqXoRoJVov2hSJAMgOtSW8xwjuw7GZ1ylcHJjkZF4Bj0NWNBUYQrRwiTndu5cAHSuwV4SpFXtIvfpGJMeSDVPP/Xoyelm13r/M10gF16H2jr70wVcEUxMIz547+U7p3G6fODG8aziJQAd5PTjlGILyBEoqS0G8x1TENLQpI6T6MZA0OHDEmKPeA2vIOqDiOA9pQS5j3dQV0kANQwH7dqOpnB4wIav9L8GEj5dxyBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JmvHavWLS93YczDXH3nre8MOpYpy/4W5wY4WMcAHZY=;
 b=cXbUz6BGtXcHj0a8zlFgY5SQDq5aXQY44g8/Cdlpp+f/deENtLRSZY1vAC2ZO+1mBQWqSGdCfWR2VdthPSDcF2KLV/DyMO8DbSAmkAKgLQ3d1gmmW7+vhEw0xSWNtaCd2a7WvbYzaZmjQNbllfZsqwUevpmxEda4xne+PKBBVLo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AMDPR08MB11673.eurprd08.prod.outlook.com (2603:10a6:20b:73c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 20:35:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 20:35:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: OE-Core ML <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Topic: [OE-core] OE-core CVE metrics for master on Mon Apr 13 13:29:07
 2026
Thread-Index: AQHcyzn000QLxZgEQUOClbXtG4fcJrXc3seAgACU+wA=
Date: Mon, 13 Apr 2026 20:35:57 +0000
Message-ID: <19D8E9A0-1552-432B-96B6-DD30EB1E9CBA@arm.com>
References: <20260413113708.69695-2-yoann.congal@smile.fr>
 <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56971C974B642A7B02678B29FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AMDPR08MB11673:EE_|DU2PEPF0001E9C1:EE_|AM0PR08MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0bb865-1ed7-4687-a8bf-08de999c6987
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 G2OkgZcU6mz60rCWjBu75eiO87esrRp3KUAdVP4U9vpbibOtLBl336LnEv4EvYYSgrG08rBTyRlv5BigddAvBxcrNpabvuE19GUYQwk3wRAXgsLdT6/zht897CDQ6vqtm3aC99AbYLUCX5AcjVo0zzAtXS7t23W+iM8kNTW0leqQ3toadM5JSa2FV/Ch+sGrCDalTDIZDtavpVmrXC8in/Wtt4YRi7G9bENUuIZ3DQjroHUeXr/wHWN9ew05tTXNoM5CuCCK3qwlJW65qCHiSQ8zlUEC4c6TfB9n2EGC6B5ZizaSRbSCINvPU3h7ZcRgnt1Nz1m++ovKbP+KRJ8cYTSG0gvvYryetOPcQ2BKx68Nwm3HquUW2BIpIaUqnqTjjVgbrBNoqAuIWIRIzPd6qzK/oss5b43Wlvt4BnTKuHuroSfKdhLyDIDcYhsgeAteQppDY4sBtOgXlM9LVzi6Zamt+aJgEMJ41otbS+FRoDe1Ee1RqyODt3AkPcZBse390wRWKixRzYZtfIgTqbkuo9f6xX1Xzc3Nezk8XX0Kn/4IsveRngu+OmcN1iDmc5gSQf30l2FBSnLiqdfIS4m054y4iJkk5DJ7U36V294O7qPL/W3Tmcz7sM9WsEL8AIf7S4DV2ZLLF27M+mK6lRAw34E+ZLAT0RlKwDMR54hXxrtPLu74OOJFOvZnZbX3s9zhMwQF0AiJHwY0mYm7UxeAb16MQEdmOMn9tPsUGJcWwlFUdn9/m1Vh2wfEM8zGiFBUWGDUYDx0scGYcxOq/fcNX00CVRG17R6famSeQ2APHUg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <20332062ED4F414DB611C545F26A6D8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Ey1OET+tLSQNiz+MpU6oBx3WC9gUbgNqxVuO2vDzZhGUM6uEtTqGwEGsxG9Wn6dMNIG1WvKAU4Ko9USEbdx9HDgzLGct/s16sXHJMGLnNpFsCWrxz6W+lTEBIYAMD8hvn8tYHMnnZh2ibHO1bTGQO/vRjYV3pZj9kCDVtgHcAvbYe5+Ek7PEr93K7wq0FqE4Zl3Xy8/rEcxY83+yprtNfDukMwdKRKkoNRIQiqV7K3rMJ3mSEYuSWcSl3GNDX+uok2vNlD3eORVevaVRc6lRYju40Y8uKD2gPupNkFhVcuje7W/xl1XJVB81PskoDSA6Opt7vVVaZE/ygQOyFGFxQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11673
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	74598611-5b3f-4ec0-b40d-08de999c443c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700016|82310400026|35042699022|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Qk3IuiNJujfLjdRcFnCnruZFrRq0XDeP8QjxE2408k2ES8cbQLr3LVEDxwmSlixBSB2GUuwowNkjLhwScJuJImBqWuNaz/H2AKZKkTdsb4p7ClXfIL5KrAgR2Mb953vyEW8Oy9B9hgCMNlsXNwU9/6UUWgX2Y6+S4AB2K8pCg4rPaONNaikkxM5N0pkKjAdUtXx11fXDFLLY9h4FJrgGM2XCtUk20O0xYzGb6AiZmIA97ZkPyozkgcfHEWER+tIoXBVPODlv1gNiAqHAG1QzLD4WPell9evVezi+SCU6JO7nwp5Z6c6QT6O2BZ7zn2JX33n5vNYGkewkzYBIfgdc3+h0TofTi1vXNXUOcQGwJ+9dmyLKA1+pizugqNG1x+SCdDU/ZS7oYElghL1PcPSonyRhelWyz0Px7+tVv/8Y30V1WNdSCeeK3cyZBDOCMTnuQjnabTMvRaBalJzpthWe7r0OgnMkJ26/Hc9UheaZCX3Gv9XDmV9s7SOzSl1tXtf0HT82LxyzVfDg+4OJZQFhOqgdDfEyvBakGYveMhq50I4zUZnlvcSiuQ0EMirVZTdHHfd3q1C67EN7s3Dj0GaK3NVXEhp7TrZOJVV1lt6KXIxErhXlcXW+Nm2U1bb/zYL7Vzy+HDeuVCemkNs0GnjgK4pX7adkfLPGDKC9TnT1t+lUDa27eoNDki7xT+6z3tdFO/K27tgTs0lZ+rGSfyh/IbB+DSC0nYn373rfTsrDlkuu4tA8ZTuu5Mc23hxgvEDU82rQab0QdmadZPQMWhsLpg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700016)(82310400026)(35042699022)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hPbtGek4KYCkr8ZTt/zKixRSMmJF/phHLK9MlPM+uSOFu0HGsz7LMbYvq8MiAT9oKsLIDsCSr2gotuw2sT/SPVYN+RS3C/uMpreF5759LlbVKKYFC3xz4/hjJ8kzNOPzEyyCYU73nvyBWkY9PBSbGwu0KAs+ZPfoHXnuN3yDDeunjLrZPXtYq/6B5ULFdwtKK6vOqdBQJqmKwY3kvcH9LVIbanJ1VT20Au+AxAV2s/Zr3r0qx3HJll6+tnZDV2IKZfny7ufZ7Oiu9bXaLwSvNz1j6a8tRwxrKiOp4ZiU/ve6ibrUt5tOCuO52tLiMfJfBuzhUwlJXpNmF23PAmhM+aIp0cHx8uKsc3CBeATeMgEDfGqcFbzxUXvDfV5zKGt/4PUlZulSEol6D81UOHCmc3uj0D0l/JeHERDT8i7UJqmj6VD4NWfJaeHuajr1zH2V
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 20:36:59.7161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0bb865-1ed7-4687-a8bf-08de999c6987
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 20:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235121

T24gMTMgQXByIDIwMjYsIGF0IDEyOjQyLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBUaGlzIGlzIGEgcmVwb3J0IHdpdGggb2xkIGN2ZS1jaGVjaywgc28gb2xk
IG1hc3RlciBicmFuY2ggaGFzaC4NCj4gVGhlIG5ldyBzYm9tLWN2ZS1jaGVjayBtb3JlIHRoYW4g
dHJpcGxlcyByZXBvcnRlZCBDVkVzLg0KPiBFc3BlY2lhbGx5IGtlcm5lbCBqdW1wcyBmcm9tIDEy
IHRvIDExMCBvcGVuIENWRXMuDQo+IA0KPiBJJ20gc2xvd2x5IGRpZ2dpbmcgdHJvdWdoIHRoZSBu
ZXcgZmFsc2UgcG9zaXRpdmVzIGFuZCB3aWxsIHNlbmQgZmlyc3QgYmF0Y2ggdG9kYXnigKYNCg0K
SSB3YXMgYWJvdXQgdG8ga25vY2sgb3V0IHRoZSBsb3ctaGFuZ2luZyBmcnVpdCBidXQgSeKAmWxs
IHdhaXQgZm9yIHlvdSBmaXJzdOKApg0KDQpDYW4geW91IGNvcHkgbWUgc28gSSBub3RpY2U/DQoN
ClRoYW5rcywNClJvc3MNCg0K

