Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC3FCD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 16:32:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40961.1779381125870680952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bWq873IZ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bWq873IZ;
 spf=pass (domain: arm.com, ip: 52.101.84.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JYTF6u9lc7SmskqXfn2xchsvOMStrIUottwOWi4eM7hs/5ZppocuYD4Pkr7KBGVa6BoNL97pT1TI4isFARXIddMbj87CcWBW4C2hlPLVqSZvaraTBZWi+VUj0zTZj1OdANH/KPAj+/o9qbZbuGjwdyk8YyrPgsQSN0EcCLTlMkxC5BleakowNTv+h97Kom2lsSRxDqWrLWaQyXSn0PVwUepxmGw54a74tGun/DodTsH3N3Q5aCltJFZxGdWaslIvRDs4ll9gesHIfOdjll3m/0IvUOyJDKkH0XyA4x2j8SgRLn83GgZ0ZqYL7r6ozE77eL2B/EiOJ3b5mo/1/Ekutg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbuTNWcTIXUC7OuHwBupTkvWMIkeP/Ef6C5Anjs3DW0=;
 b=XXnA5JLa2XPbG/d7tmU037ao9f8+T4wqs1KaAZdS0K3LA7VdxXsK3xEoz2ZrZzx5oD3sjrHOQt/ZNNWGqLIewzpZiu06/5L5GOJ88pIm0hRKZUljO/uxgeTsjgX+tdwNPY8feaxPwkshWLVBMzjiCmu/+/Lf5T06e2p4NbM2AtwitfXFzkjfXp7doLyckQbdcAx7tciJgzToSFmjt7shDzXaT6+z1tAlx8qE/o3XygUZMX+jkZVk1U2bfHtIRx5CRY+S/tT6V5kxJQ9jmn2Y/k5CLOR9LYqusK05Zyt/XPGW7vXVSo0wxZfxKmfimrmMMiQojW2/if1vLItjGImNAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbuTNWcTIXUC7OuHwBupTkvWMIkeP/Ef6C5Anjs3DW0=;
 b=bWq873IZVLN4/ONwJ+iRTJuvkrAY91ICz5zroLH1Hm691PIGYdqjFmHV/NTx32ctjZQ90sVPbyZ1aeBfAuq0GI2oyhnZmp8uaq7fGDW4xD4BJiIh7HlYW2JB3DZftvZsmZROaE4V8oHuFeQfG4YjH8LMVZm46fGJ+SQ3996w5wI=
Received: from DU7P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::28)
 by AS2PR08MB9665.eurprd08.prod.outlook.com (2603:10a6:20b:607::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 16:32:00 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::2f) by DU7P251CA0004.outlook.office365.com
 (2603:10a6:10:551::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 16:32:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Thu, 21 May 2026 16:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW/NvwiMSGHGWZEIIJul+FD5MzPUs5J9alypYIjo4SwxGLgyzIhNF+qfzlRojhsB5WMdywX3V42PD89HrcNjNnJf1qeBvKt82OzuSws+/HnVJaf1uJwh6ixr3TW5Qtfj5MuHuJ82G4qY6dt+cXpeIdNzp+FhAMQO76r/mpvB/Ix++ezlw4U4qIb77yoEOCwtvLuyFHZlkwY3cYpTVoEcdDMWR8hO5Q8XOMxX2LY08C1LIL/EsdxgcK+Mr6ZXdWLwSbdrJTmqfPbhVthaF8NnD+mpfuEjxTZidSBFk5C15Ki20hT1AHMIbPdtxSg9Egf3DKF3wxQxMNH5H5LMV6WHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbuTNWcTIXUC7OuHwBupTkvWMIkeP/Ef6C5Anjs3DW0=;
 b=Kl1ypPENRZ1LEgM9nUqt6l/l7s6sl0YoGMlob65nJ+k2pOBd5NLE0O5FaShWdlF7XVMQfQrl2V/xF7M+BiiaspuCyBZvmceArMi3aJM1MLDSknPzHaf6CfEC7eAnqeUFtzHhjewe5U9matFOtnJfnmRKGh2lcdLtdNZBkSEOa5yVXxIQhOqckt1qC1sx9nb6AZUWq4w2a82EXf7P3OvlNd56LKLhE8vxsr8vOe/+xWhj9KOoaAOCfsMeJY2J/GAe+uibLA9teoZzIHLzX5YwD2S3LQN5ISJXKmMt3J0+v80qB2aBevMv+SC+NLljG36ozM90qXyyYWUCHf2lhZE99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbuTNWcTIXUC7OuHwBupTkvWMIkeP/Ef6C5Anjs3DW0=;
 b=bWq873IZVLN4/ONwJ+iRTJuvkrAY91ICz5zroLH1Hm691PIGYdqjFmHV/NTx32ctjZQ90sVPbyZ1aeBfAuq0GI2oyhnZmp8uaq7fGDW4xD4BJiIh7HlYW2JB3DZftvZsmZROaE4V8oHuFeQfG4YjH8LMVZm46fGJ+SQ3996w5wI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7433.eurprd08.prod.outlook.com (2603:10a6:102:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 16:30:55 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 16:30:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] dos2unix: pass BUILD_LDFLAGS to native build
Thread-Topic: [OE-core] [PATCH] dos2unix: pass BUILD_LDFLAGS to native build
Thread-Index: AQHc5gUIU77hiW20f06zgK++wsq2xrYYsk0A
Date: Thu, 21 May 2026 16:30:55 +0000
Message-ID: <E89DA4C5-DA92-4865-8F80-409A9D291D2B@arm.com>
References: <20260517135646.11831-1-liu.ming50@gmail.com>
In-Reply-To: <20260517135646.11831-1-liu.ming50@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7433:EE_|DU2PEPF00028D0F:EE_|AS2PR08MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abb9735-9a63-4a33-3917-08deb7567b75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|3023799007|11063799006|18002099003|38070700021|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 oPzZx9vs0O4sFHCSu6Am0zuUn1jKG/VnRlGvZ0v7CW+vyIydGeU56ISnR1hu5xfr8aeQLB62PvJTK6UEjCmQ19MmB44R5rjf4EgFe8Iu8nfQHdklmjBLBs8fzRhfxdQjbagUvQbyyLC4AQeMUKEQtcSP3hDVsv5XQjljyES6ALXyH28Ra1SWy+MSm33sTLoUghUx2AQFiSSc6/LFt8tPVVYkqiNZyGliioHbkoSHelhYu5M1HonYUpq//0ts1IKjKNVxY5P6GPSrbxX4KqUGgF1WAYvPP756of4nUrIjGsoTDfGk7PxdWJGA3ZzwoNfF29FglqMmJFhoDRlcvFQ2P6REYh/o1Mhk1IBtg9TI7y8QU2/CCsj1L3IPbf4vyTTmioqbm+eYb0oK6lq6fmbz2kerQdpobFpIWSZSH4+eDCtZPjI/009NVDJG7w5x6Iq62nps/nU+vwq1FmEZnDb7H/2xUpp75Pxj5JeF7SJMGrLfyvQYj36oLKEJaBtJHy8K38ZQwXni69xgFrgKZAeHk5/uF9q8H0bCZzo0Zi97AWOxI6ySVaZx1o+09jiFqMzL/XmrklF4fW8H5LQtOEOWHugxSwIfGtIcgCPs7S2w8N8b9NJ6OeL9DRwP09MaEIzxHOTkBbfXmS/6KJn+d3Wv40C5DViXUx6Zl7gJN7agAT2iZ1RJXCQ6lvyZWfnOqtpauf1Vb1pcmIWvcOauwB/avIaZxfbi0EumNwMyw++wDHN3wb1aB/m8qd8MXpC3/TSh
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(11063799006)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF67612C08E9EA44B9F66577D2BA16A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 FuQuLaM/dXMoQsL5zXmxHAEU1XieGs3NidCpzOFofd4KgbEKVv5Y54zersdv4gmqluVEG382GPliXzN8ySrxe+TUAj/DN7uKes+5cFnUaU5Jk6Kg6jR4L2a4Sw+5+541zEvQo9S3SZWgGnfwhHxqInBSt4/SWRgKWooUl3FBRmgq1Qaqb7vdRaETvSgiLVbhrYXRpgrMGo39Nzh6DiHKkkQyNEh7fNbiEaH16c/fHq+KbnPR2lIaKF0cSC+5frfZOBsOCVEAAJA8sVpyInFRc7rItG3xyHUw7H1YzmUP8gSwUFwaH2G3cRYHBqTztaebUyZGmMF0g30wkrQAdybzmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b43b72f9-0f1d-4adf-5bf6-08deb75654f5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|14060799003|35042699022|1800799024|376014|11063799006|3023799007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	utipOrzvVIedZLQmQi9EvO+gDnUO+5lq3cj0AgIhshHpO1U1MthiIKDlRBj9BIVVv84pJbI5hDcJ6e67Qzcuy9xp2N3DoN3PZi0imfAlUf3i79huZ/H/0yvS/g4WcBs7aeJlZ3Ej0cGc5QiBErW00xAgy8eQBmXXinljBOqGXaEZIdobpncHjdtdUkuft4WDzdfkFuAzcef4570zncwDAiABKSjIH3JvWaPp44OVaMkc+eVq8IN8hF19S2/g3DxnMwsUW/MBlLYO+6Kt3AFxH0wWzNCDEL/091v/SHKAYP+NyMCMntTPmBM8RgKbAf2m8Ufg6fmbg2wWlcbyJcwlN5nT0miWXZGbxS+ry6gpuBFP6o4jheEFR3GyNHEXqbRiWDFtjwzv0nM7Og570x6CQ274rLdrSzMkZx6TgklN7UmKoajKp4H3jL+GaKYgQNQX9K6pDdYugrApb0PYnTp3Ri6LzEvuwuyVMnS6FwudSexX5uHc2G0ZuG9Phu+A1gRvgea8S7jWd6QkI2VwkRcM6XtMmU031yPVcnTz8ofuo8yTcEcBerqnDf2OBVbJkOsMf19qYxOzQqJrTkQ1yDAeyYYanMhdPp7Fh5UXeOqmJi8WBB6x65UNNPVl5S5WrUFoDCleBhaHszVE1Uszdc5RhMRfTUdeDuKrJ/1QlngveZU5ILMEp8RzklG9jQn5ih9b22SG26SUJsHj4SlcFdIMGUIPlwN1Tq7wALPAAgKm5MU=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(14060799003)(35042699022)(1800799024)(376014)(11063799006)(3023799007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	J14VC3Diq81evbUK+d0WWcs/dnh8VA71Co5tTtwzY29Zrz32jLTxVoYG0yTzAZW45TCcvK5r2MDDV9lihaWJM6YJ4nqU3HGw8OddYzmGZsIlQ58g/z9HpTOvpleSpGaeyQXu9kXbxOrrG6XL7POjwq+nIYhPEsAx6+WNTY+1V2k0K4Nj0CbwHOBIhXMd07ty+K9yXWvZxuvsCkiycFb7iHpE6WOKpKWuCRov+8bc1UTCsqW0gjAeQk6Sz2PisJSzA8jnoz9P+Fng2tEJscGfr5ufNyE9fecHXHDrMds/wiXL1gYhhvfRoDAaSW62W7vswue4dgZ+XtTcuG5FqRBCACO/xBIjV6bkeGcnvMyvxGJrGoNP1Z7IxmXsThlgMsUsge+Kz/lXY0QaFFTMJPHhaLjdJBi/3Ju69RZDaAu2kiD8i6AU9XBE0etbXPPxBiyq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 16:31:59.8979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abb9735-9a63-4a33-3917-08deb7567b75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9665
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 16:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237520

T24gMTcgTWF5IDIwMjYsIGF0IDE0OjU2LCBNaW5nIExpdSB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8bGl1Lm1pbmc1MD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBCVUlMRF9MREZMQUdTIGlzIG1pc3NpbmcgZm9yIG5hdGl2ZSBidWlsZCwgYWRkIGl0
IGluLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWluZyBMaXUgPGxpdS5taW5nNTBAZ21haWwuY29t
Pg0KPiAtLS0NCj4gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjUu
YmIgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RvczJ1bml4L2RvczJ1
bml4XzcuNS41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41
LjUuYmINCj4gaW5kZXggYWEwNzhlZDIwMC4uY2I3MTAyOTQyZCAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjUuYmINCj4gKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjUuYmINCj4gQEAgLTI1LDcg
KzI1LDcgQEAgUEFDS0FHRUNPTkZJRyA/Pz0gIiINCj4gUEFDS0FHRUNPTkZJR1tubHNdID0gIkVO
QUJMRV9OTFM9MSxFTkFCTEVfTkxTPSxwbzRhLW5hdGl2ZSINCj4gDQo+IEVYVFJBX09FTUFLRSA9
ICIke1BBQ0tBR0VDT05GSUdfQ09ORkFSR1N9IExERkxBR1NfVVNFUj0nJHtMREZMQUdTfSciDQo+
IC1FWFRSQV9PRU1BS0U6Y2xhc3MtbmF0aXZlID0gIkVOQUJMRV9OTFM9Ig0KPiArRVhUUkFfT0VN
QUtFOmNsYXNzLW5hdGl2ZSA9ICJFTkFCTEVfTkxTPSBMREZMQUdTX1VTRVI9JyR7QlVJTERfTERG
TEFHU33igJkiDQoNClRoaXMgaXMgb25seSBuZWVkZWQgYXMgdGhlIG5hdGl2ZSBvdmVycmlkZSBh
Ym92ZSByZXBsYWNlcyB0aGUgbGluZSBhYm92ZSB0aGF0LCB3aGljaCBkb2VzIHNldCBMREZMQUdT
IGNvcnJlY3RseS4NCg0KSSBzdWdnZXN0IGRlbGV0aW5nIHRoZSAiRVhUUkFfT0VNQUtFOmNsYXNz
LW5hdGl2ZeKAnSBsaW5lIGVudGlyZWx5IGluc3RlYWQsIHRoZSBQQUNLQUdFQ09ORklHIGlzbuKA
mXQgZW5hYmxlZCBieSBkZWZhdWx0IGFueXdheS4NCg0KUm9zcw==

