Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62875D3943C
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:43:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17395.1775141002904231736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NkwKeQz8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NkwKeQz8;
 spf=pass (domain: arm.com, ip: 52.101.83.11, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vgG+rC1WKrJngocW7HwaJRAM1cYeryqV69KXX78TP8RqvdwmExtjhXF0Q0AFxnU80T4ZL2be5fsR1xojjLZZRW1z13jo0co2qvf56rlsjR18K8j+nyWFQGDprMup80kAeMvgqSlNJ8zLX2nXAXVfHQrL0gbzUcP9z7XL0egtEYNPPt3zfiFepOeWLmW0iOhS/NElt8btRkmUuU/80kRvM8vnjklba5QyrQBSh/726/UtHe/CFtzWYMZwtNUa386HKAV/1N4Wx0pOKjaAtBJzqR9KIEWjXcLH7kCdai4up1GUPI/lhLaEZkV4vYhLwpYzZu5222lX8S4DucFFSsaNGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH86qO7M5xtoJqok8Hd+wx7ad9CireusijePFDegBEQ=;
 b=mDyFEt+zm3LloML5xZhJ71o6o8//R7gLsrcWkGHjtoVOcsJs4OCbXg8S+fzA8Eqp7Ji69Z0kot51gr9lDVsc3PqgDUIFN8o3gPRuTPHcLo3XpouMNa+EMCbpt6M/Yl74JOgFeqNlTrNuk+2SVMfnPJUNyRjl/bszcJ1z0J0Yr/pHinkoTnGpTLFDb0RNq5w1KkUa7XGtyd2SOzH1jRNunId42A3Vtxy/xnMPYzfoj1iYGYrcfQgVSRtKPXfB6vkg0sX2ZOvAuQBmhKgGWex/PdG37+qdkOnebKRL9YHVnIhAgnYqoPM5hAOVjq23TisOdDKV/r2vllO+AogGF3z4Zw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ericsson.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH86qO7M5xtoJqok8Hd+wx7ad9CireusijePFDegBEQ=;
 b=NkwKeQz850RcqJnu4tYdBlKQ84hfuYPJBLgc37nxaSgqjmGlmmEszYi36H7H/mcaVDdpgWZ0VXLzsqYfdarTBCZDSBP/dM/n3Aqqzhui/F9rS99TD9gy23tIB1Qci5D1OTLayvP4rabABUFg1f8x1fr83YRlNzfhE1hMODir7ak=
Received: from DU2PR04CA0268.eurprd04.prod.outlook.com (2603:10a6:10:28e::33)
 by DBBPR08MB6074.eurprd08.prod.outlook.com (2603:10a6:10:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 14:43:17 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::1) by DU2PR04CA0268.outlook.office365.com
 (2603:10a6:10:28e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 14:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 2 Apr 2026 14:43:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8fBsX9ITK0cIJxUK175e5piediXW0CbHlbDwvszxcy1Hjzr4S2OyH0EZlMv1iK09SxvxVQvbFmu1WsR3XZfx4AjlmA/+JioywgsoXg36unwOgDe3Nu/qkYzA6csd5CJ/PDVFp9t47CjG+BGw+7x4M9vqZUfHCee7rwkqEC6GkDb3yHwwN9ZlrmmEfccWH4ErxYOBDRSMlp35iJUcn2x323+WNySQaE03JmNLBz7kUDl/yifXaCi1fOOyJdT7a98LYzWPieGqnXAUsBzcNVbaoLs5BkhTtsrpXjmpKeufbpJUMp5pbfv6Z8KtYSaRzWbow67rMZzy4coWcBAA9DFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH86qO7M5xtoJqok8Hd+wx7ad9CireusijePFDegBEQ=;
 b=LY+pJc5D27lzFxKS30934auvVpZL/XcTwPPZdkHQZx0AE5LCiO0X4BgpHfvb8z6vrZvAj7AvH+Ik4XhZvPQiWX5zUrIaig+vPEo72CV11LncHqQZ5NacGJeuAh2yHnO3KPQBoXh9PM42OAu3wVvA680kXEIfUZY6KR1SDGmePD33Ca2U403bIPft5uKWYuvAzR6owcx/eYJatGDljBxuVci5JHTN0S8StQvHt/h1Lxo+2t0Osh/CeNWZS9bSw2CS0dAZJ2CzLrNGaDLxc/YThNYtlPx+hnH8JtXVtYSumMtoD2g2A3wwQDDQRg1GXPfVTgAeM6CeeqUlXQpcsbNCEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH86qO7M5xtoJqok8Hd+wx7ad9CireusijePFDegBEQ=;
 b=NkwKeQz850RcqJnu4tYdBlKQ84hfuYPJBLgc37nxaSgqjmGlmmEszYi36H7H/mcaVDdpgWZ0VXLzsqYfdarTBCZDSBP/dM/n3Aqqzhui/F9rS99TD9gy23tIB1Qci5D1OTLayvP4rabABUFg1f8x1fr83YRlNzfhE1hMODir7ak=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB10340.eurprd08.prod.outlook.com (2603:10a6:102:30b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 14:42:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 14:42:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Daniel Turull <daniel.turull@ericsson.com>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Benjamin Robin
	<benjamin.robin@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Topic: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Index: AQHcwRHDMM2buOT4+UKIWvUT2idtcbXItzgAgAFs+ACAAbdpgA==
Date: Thu, 2 Apr 2026 14:42:13 +0000
Message-ID: <B7466D11-14E9-49CF-9203-24A6B4D47DB6@arm.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
 <CAApg2=Rnrr_ZijiZ4cxKvkwmeCOssHXVfNHi2hZAywuhNe+F-Q@mail.gmail.com>
 <PA3PR07MB10721439AB9FDE89335C33B3E8A50A@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: 
 <PA3PR07MB10721439AB9FDE89335C33B3E8A50A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB10340:EE_|DU2PEPF00028D0A:EE_|DBBPR08MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 7867d24c-7272-4e22-ae00-08de90c62d34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 qi5lh+NwYDpuWxgguPgSOSV/j1AlcZX8czFv38Mc4zs5tPfcJMtAqX7cRm1PAWj5YIg3yXDkWHS6jQ38oIGPEwit9uZfkEowj8rojxqFkG1gR2uRB5xfmohpDDawD8mCe27Me8OdJANJx4TZFZLiKu682qLWtH2vRRVWD9EjG43LGQaBOecgxlskaT1wa/j2k8Y+rLrxLdr4zpWDutOQUGgpmcDncn+9duepSumwXjooyj6FP0QJsCRidkBiDbba/6NtLUMUw3sESsQF8AeQPw8+akXP0wTRxaJ9s300vJDMQmG7Bbqfo28M0JY7HUb2KPHqz1LeDEAa2cYU4Y5FrTtIBPptCGPvlGTcGN0KmThXSKPZVu7mwN9d/ewmWNZZ0KXLP5iuGobLvEM4tEjJhMZZ0IGD6y4N38/rlyxAedOo/vtTUXnLroXYvLRYzzwJa2SF02S6QE4P9bXxGoytj0u9NIxVxBspvp1FTQKRBxjDVox1Vlriy00tGV0BUss3V6nkURtu4WeA3bZPaktrBpdzIswjTzd0x7/tEEMgXYGpR4ekF8u3IJNHOtAbz0Oud/df8OR17P3MIZtqUT0bJ8dVqzo5NXW1MsCcrRJkw8B6oTWBz2uCxdceQDz7yRZ/NQ0oyzX3cnkQ0NrP1ovC0QTsbKvepqWpWyFWNqwx9ZT1S3iNHR3PjmRDzpWJGEqs8JZQSl9QLnifUw3yjmKKbO0I1cdLkst4XTvDrkhWb0uhP2KRIp6F2IOze6vIAlmgcN/L4jfAQ2fXDVYDiQ66Th7OvIH6CefXBWHDlt4CQMU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E727D5A0F0D9124A93DCE15A36C51D08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 s402Q0bhL6HWBj49Mh+taJe2u7W5OHuF3OIkMDjHsOzvfHJ1nh9mw1npcwjXIgQ5yG+yedemUXscUR+TiSzbG5YShFOh2WBD6E+BcBmpECCv+m1spn5e9QvgGlhnowBxchUUSfViLAr0bnHJv+uv5C4YPS1BdXxSgnqPq0FE/KhWhYQxC5iDOzcMCgEzVFiYQUOYORkjcwA2Co0HD1LpkZuMFP5BRcePXzK3S7E99NqlJlUYN1nAze1L6BGmEd20o9xXDMH4FjFGIwlarmStv9D4MYPnrmos1rrMdl6j4bCGTYGM0/yHBgYi4ROcRq05Vt0F7KOkTucFfQUN+0/qjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10340
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	936eaf89-6c0d-487b-3979-08de90c6076d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|36860700016|14060799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	PAmjCX7NDgix99RVUi7mTl9x/ov1W9LvuSuc3zQO1wnGfPhy55qN6+POCMnDku//9YEZlBB/lgKbDpuCeoDIUXTkbzVSXfURXKNN80jn78e+4Wd2gKp4W+lajPABAi7hflR6POwvKXoS4hhmwWgbpVaqtHXZnBCOlDB1KqJfDRPJ/IR4+cTtB9C71F7FAowYSUCPIWi3bIv/WB5CKxWYYWE+zpbGmpHxxUs4UTFrls2uE6oyslRFG0s4n1zjrPe3ko+4jJdCIIVRBEM9eTSA+gFWQG/+dYcLY7Edk3kz3v6KQSHQQ0AmcUIKlqn+xeULeKL6754/2Ue0sIdHr2oOuZ8+JhJ4W63YRIHyVzUNL+mL7uqNYdtWDzkU6fCk+UPdWQlRw3XByj9tvxgdo0EG8bPz3GUstRPhlYPLm4rdvxL+mbc16i4tHtYjHy3fU763OE1tHrk+LXxB2Xdj72+dq9yYaR5hk8l3Rle7yJWSb4ESbHoTqot3Y2rrrUv8PayjqjuDY5XVzMV+N80grTloc8fvD0GoEsX2H+edg5ldFQntepkCOlD/QeViWNhVycdnNJ/dLI4h2ypNOB+C1T2Q28W7QfpMH1G4IOtdNhGWUWqlT60ns8gNxnNFzPPfzxdTavyZ7O8HN8gfLXPfqPYbU0ujQ/PVA0PLk4I5CVSurTRhdKRVJ4AbBvxD6T5GxnNmD3W25IiBmRrzkAlQFToHUAucOEdBvd2ZSHDa8JQKFM4=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(36860700016)(14060799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	13jOwg45wS3UJds5sw46nmvrSPFIa8l8cy6I8SMt7elnv1mRF7aS1m2EiWOgO7FF2iLW7fbrrWR7BslZMJiAt5bTpW8wOzt2qn0GeXYtA9IB9QbY+LwMZkhA/243rxDvoXMk+DqlQgJqCR5VY/yypyppGxRficLJiFkwrOPVULZedoifTUI8Qp4BsxezBZc0W1r3Vt4CGSrqy8hMFvSbAT5w7KZVIblw73kWVxz0SYFiFdVVFQKPeR1+UzP95xVhoCS8eH8Ic0E7CiLIw2GPQcunaQF+IrsJOB32Tgw2yebeQDFm3jY6T6rGl6HYYD2ImP/whXccBdSUpaeMOsSctvTdQOhnR/l62OBsBmcBFswMWIPtdcFOVGa6KbdEKqSnvTuuQNmV7B7tPGaCj6/eFEQGBZwS+1isAbMAaUp3cZqVvUezqZdM7ympIiw1I+rH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:43:16.8517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7867d24c-7272-4e22-ae00-08de90c62d34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234529

T24gMSBBcHIgMjAyNiwgYXQgMTM6MjksIERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJp
Y3Nzb24uY29tPiB3cm90ZToNCj4gIFRoZSBrZXJuZWwgc2NyaXB0cyB0byBjaGVjayBDVkVzIHVz
ZXMgdGhlIHZleCBvdXRwdXQgYXMgaW5wdXQuDQo+IGh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5v
cmcvb3BlbmVtYmVkZGVkLWNvcmUvdHJlZS9zY3JpcHRzL2NvbnRyaWIvaW1wcm92ZV9rZXJuZWxf
Y3ZlX3JlcG9ydC5weQ0KDQpJIGJlbGlldmUgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIGFsc28gc3Vw
ZXJjZWRlZCBieSBzYm9tLWN2ZS1jaGVjaywgYXMgdGhlIHJlY29tbWVuZGVkIGNvbmZpZ3VyYXRp
b24gZnJhZ21lbnQgc2V0cyBTUERYX0lOQ0xVREVfQ09NUElMRURfU09VUkNFUzpwbi1saW51eC15
b2N0byA9IOKAnDHigJ0uDQoNCldvdWxkIHlvdSBiZSBhYmxlIHRvIHZlcmlmeSB0aGlzLCB3ZSBt
aWdodCBiZSBhYmxlIHRvIGRlcHJlY2F0ZS9yZW1vdmUgdGhpcyBzY3JpcHQgdG9vIGluIG1hc3Rl
ci4NCg0KUm9zcw0KDQo=

