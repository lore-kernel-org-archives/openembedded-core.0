Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D22C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:20:39 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.80])
 by mx.groups.io with SMTP id smtpd.web11.11635.1744903233316278780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kxhHzBCW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kxhHzBCW;
 spf=pass (domain: arm.com, ip: 40.107.247.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Pips7Oj3ppDC0FUDxL7LV1/YAa3XAG5vQ4Kmq54LgQzxuNTo7ndiCYfzYO+FHqUGBhnbRmOIkqfTID7N1B4R5LGzXmTZb4s+3ivP5skgVsg/28BD/e2CJXGfJlf0uQJiauB5bsP4g/zY1YZwYnVKdNTOf89gAEyCngyzrwvIil83MKp9Oip/+k5HD4ueUDvsxpo5FzJ+xrNQyFQjOvNEOCko64WGOAls6uI9VUxSaVuIwYMWa0RY16IwwQJ35ruan8bPiid/xUgAAHAhGjLybN8WlmpnDZIHxNMdUQ7zwLR+a9ERiHNrr4pi2Aj1GvB3/Gp2Mq4cn5uJI9mRTDzmWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OzQuBC7eekvTBmoZDC0HuGduAze4JCeju2mR7RX05E=;
 b=MVNp9GgjaOcGcY112Iyw+1LoXDMfl2VsYjtyr74liwVsJVB2FQivdEaQBy9qn/iKYXveIWes+kDZmRJtoedMzuLAgEI80PFeSYxyAEF4zTfXiaPfMI+x2Dw6Vq4R8eAg2YATW31KjftqMJRbS/OGW44koLBelm0RKd8SMhyGB+aXufbMpIp5MvPDiJD/y2a77/KgQaD8Mtr8X0OIYWTv2C+C+3MBwfHS07Y/57BgI+SugZHpp1xXsoYyb4vvaU8CGMftpAeVLjGf58VgYSs+PAVv/XtMDEJDs32wag6GBE7hGAMLNwEGkZvNrVTxdnJEPh1lcv2VQo/wjRgr9fE0hw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OzQuBC7eekvTBmoZDC0HuGduAze4JCeju2mR7RX05E=;
 b=kxhHzBCWuYrFR0salH+aeYDdJ608k+gGEM7ddsaKuKpOYsxUbEhdWWPv2cDHsFrbsl4V3TBGQVX380Zdv6bZqe1M2bQn9BxHbI7yXq61qkyux/VYlfy6Ciq6ENd1pBqUp/Q9+y6bcjH7/est91AGfRBRYieOkje7DJn5DF/LooY=
Received: from DU2PR04CA0208.eurprd04.prod.outlook.com (2603:10a6:10:28d::33)
 by PAVPR08MB9675.eurprd08.prod.outlook.com (2603:10a6:102:31e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Thu, 17 Apr
 2025 15:20:28 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::b4) by DU2PR04CA0208.outlook.office365.com
 (2603:10a6:10:28d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 15:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 15:20:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVUGzysnK7asPHgOu+kGupJqfED5KvczHe1TEey92JwuARaRNNM3xE0i6u26FiOmQ+/P37NjqHy/kkFT6z5ilFieuHVHEMhyyrFU5i+7btiqw66eP7jEvbGu6Gd6BhHLUTFUhDp0hujB7Ko6pqg+zjXZ5H/fjwHgNwJQHP+LomFaWhMQoB6BJx9n8PuwIMk5f6+f91YJIMWzvhLQAEMV0p5CGS01CWQaspAj21hF2EBOQDU29OpUoO4M3JhoFjkwyESfC+vJVKHC1pPcvRrtq1mpP5l0CKVA/3S06L89RiFsrGJPR6DVkNpI+NyCzaTL7DrG5UESM9+Jm6MLX3NQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OzQuBC7eekvTBmoZDC0HuGduAze4JCeju2mR7RX05E=;
 b=p8b1xDhH3lrGlPyxwwOudi7YpsLMTXEUyMcvf4EV7RU2PSLteVubZTp7YP0UuKkz3Zh740b0CtSXc/Qx1XZKqiQyzqtuAmyN4YJoJEJYXyHJVhDndt7UJf7/BS0I3pLV0p7LPJB8zPTIZ2fh4iBiFxIq7qNppPBdZpETqpabcu6Lwv739mqtH0OSU0ZIRlrDs47X5AnqRkL8O1Ot8CgBdFy+fmVErBo/kZbj73MRaRxWNjiTRZujokuCVlYxN7gtPIOOvBD00RPwi99xk0WGNltshS+UpYcNnUwmD9KQN5LeW/7flpqoyKieb3fW3w2UMaR042ONeaVLI36oHMeR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OzQuBC7eekvTBmoZDC0HuGduAze4JCeju2mR7RX05E=;
 b=kxhHzBCWuYrFR0salH+aeYDdJ608k+gGEM7ddsaKuKpOYsxUbEhdWWPv2cDHsFrbsl4V3TBGQVX380Zdv6bZqe1M2bQn9BxHbI7yXq61qkyux/VYlfy6Ciq6ENd1pBqUp/Q9+y6bcjH7/est91AGfRBRYieOkje7DJn5DF/LooY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 15:19:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 15:19:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Topic: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Index: AQHbr6v9uoiKvnuafEKeLa5ew4Fon7On+PMA
Date: Thu, 17 Apr 2025 15:19:54 +0000
Message-ID: <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
References: <20250417151813.2295435-1-ross.burton@arm.com>
In-Reply-To: <20250417151813.2295435-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6432:EE_|DB3PEPF00008860:EE_|PAVPR08MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5297d3-a617-44da-2c93-08dd7dc3615c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ajh2VjZVaThaaTJPd09YNnlPNlU4YUVleGx5V3pkSEdpTmtNMFhmN082UTZM?=
 =?utf-8?B?UGZBNGxvVEJLMWVoVXBHMUxlTTdvQStFRGRCby9OMDA5cXVELzJmTG8xZngz?=
 =?utf-8?B?eDFFZjE4eVZOQjZxTGVhY1c5Z3NMQm5waVNOYVlhRzlLRFFOcUx2TGtFRzVQ?=
 =?utf-8?B?V09RSUljN0dGTGRrdHZCN1pyd2NvMWgvaGViV25SaGVWczRWdC92NU9Bd2Qw?=
 =?utf-8?B?YTNMdXpISXU5YkZNdm5JbnhWUmVVcDdjY3pEUUJzVDR1SFB0S1MydUpsclNw?=
 =?utf-8?B?ZWo4RUZrS0F5SXlSQVpyeDcxK201UkVGdXBBR0JPYmVDYjZ5MWorbzdoOVFF?=
 =?utf-8?B?ZlRqQVhDYkdVbDhGUnBZTnJaM2RRMFQ4YnlRelI0WDNlTGRFMm52NmJPOTFj?=
 =?utf-8?B?ZVFwN3BucGp6Nm9SdnpFUW10U0c4OE1GVlo0V0JCUVlIbDhERmJnNWt5Z0FH?=
 =?utf-8?B?dHk2SENGV0FEWmt5cnpKNTh5VUhCYTJNNnZsZ1BXbmQ3dXJrVHJzYUZCMDhx?=
 =?utf-8?B?T0htVkVnVUNGR1NKeDVBbE5QbDFJS1d1UnZxdzFTY2l4YXE2YzdBR0RZcXFm?=
 =?utf-8?B?MDMzWGd4UisweEpHVTFmZ3ArZm5hd3pvdkJ6cDJtM2trOXZFbVRLQVBSRFdZ?=
 =?utf-8?B?endlZEM4b3Q3WWtDUDI0SmF4cXNHNFFaWk1zdUhwb2VwQUVTUzRCVWgvYTZt?=
 =?utf-8?B?ckx3QzZQZWNPdVdQdGJVamdqMmxoTUIrVDhlR0ZPYnVobkNhRGpBV2FhblZT?=
 =?utf-8?B?T0hMMTBNd1A5T3RVNEZ3UzNLTm1zRU00UHhrOWs4QkovdHhJbTFjODZUMUtx?=
 =?utf-8?B?MjExYlJ5cGNDU25QZmQzZDdTODJTdGRDdkdBNTd0bjNJMnQrVXNnTkRBK01v?=
 =?utf-8?B?TnZ2ODRIcTZGa05SOUNSNEY4bVZHZEpiWlZYUjV2TkFzcldMSkZMTUhFdnRa?=
 =?utf-8?B?OThKTnhCSGFmSG0rQmV3TnB0MnU4K3ZGWkNEbUpKcVkyM09GMjFFeWFhNlNt?=
 =?utf-8?B?Z3R5cmhwM3Zndmkza3N2RzU1WHFzT05WNjNPTE9oQXhkbjlzVFlIWTd1VUd2?=
 =?utf-8?B?U2t4a2JyQnhHYUlOTm0wQ0RDc0dhdWoxTEVnczZBZUdXRjQyNk83SDQ0Slkz?=
 =?utf-8?B?OWJnQzIzTFVUWlFicDRKTHhFa0ZWd3RHL013c0hvamk5L1cxWllmYUFRdEFl?=
 =?utf-8?B?NGRuV1ZlSkpWc0VvcjBnQWdZaFVZbUZNS01Ldks1WXlKTGovclNGTStmcitR?=
 =?utf-8?B?VGtjWDhjL1h3dkNJeEdOTEVjY0FSK1VkZzJrZHlyVktEckRubHUxK0JVRWFL?=
 =?utf-8?B?L2tQMFlYMW9IVy84MXBraG0wbG5jSVp1a0VmdXI1TVNuM3hobTd1Vk1vamJ5?=
 =?utf-8?B?TGxNKzZ4MHRyUm53dTk2YnQ1K0ZmbU40K1JKdXllN3pTdEdwUDhVMGtlS2gz?=
 =?utf-8?B?QlFzRklYdEw2RnBsMVJwU2YrOTlQZGJ0YU1STjJjUFo4aG9STkhMSVkrQUNP?=
 =?utf-8?B?MTIwQk1oa0dHcmRWQUhEUm1RdUxyaS9xajVXUFQwbVlWbW5FMG9iV1B6d014?=
 =?utf-8?B?NkJSYnprSjdVY0ZrRXEvdVRFNDk2WEkzSVBuOC85STNoQW5BU2lLMzczS1NY?=
 =?utf-8?B?aGU1ZENCU2FBaFdmSk41aU5zRCtRU29yckRsaHZsQzNvV0VXV3B4ZUFrRW14?=
 =?utf-8?B?SnI4eCtEbzFkY3F1OEN5SURUUmtjZGlKS2FhVm1hL1NXSGNpMm1tVGsralpw?=
 =?utf-8?B?eGFaUGc3c1B2d2lBTjVnSkxWSHdManRzWUZ5MnZ0eDl3VmplT01oUFRBbk5K?=
 =?utf-8?B?cTFlMUxadm5SQzc0dGtINjhzb2ZsN0tUS0RCcHlBNnJpTHY2QnMvRUh6c244?=
 =?utf-8?B?Z1lKZXNoYlIwK2wxU1pQb1h1Sm1ZN0lsczg0Y0lPL0lQZWRZZ0ovbVV0Vjli?=
 =?utf-8?Q?752IJlePWNU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A279C8E4E1F9F4A9ADBDC992FB56CAE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c3fb28e-e259-4af3-3479-08dd7dc34e54
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|14060799003|4022899009|376014|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VkdzeDhmMFdLTEJTSnNRS0cvNUtRbm9FOVhacWxMeHFqaVY2cFhyRnkzYmNB?=
 =?utf-8?B?ZTEyOUN2WktMZEsrZm9zQ29mdW1zWTZKdmRzMjFrYmUwM2xqNmNEb0V4cUdn?=
 =?utf-8?B?TVB5RzIzTndXMkExUjdLL0IySVF0VnBPYXdNMXpRZmNhdmQ0Um5TUGJtMkNs?=
 =?utf-8?B?VFQyWVlzMGROLytxcjlkQnJXSHhCVzAvYzd1SzQ0dGUrTk5SQ1plMjRPVkZn?=
 =?utf-8?B?MzJQdXd2WTVmWGhLaVBiZWpEU1dFTDdtdFhDUWlmUzhtclhTdW5GUjltUllV?=
 =?utf-8?B?VFc3Ti9pemhvdlF6eVZxbGJ5QUttZ3dCK0xsaVY5UGNCNGpQTy9MNmdKTFlu?=
 =?utf-8?B?bXZzcGZ0THFlZGF2TWtIb3BleVhGTFNydlRGYW0vdUd5bU9adnY2alBKUWNt?=
 =?utf-8?B?WER4ekZPR20venFVZkh2VXBZcWYyWFZRSDRoQmZsdVhiOW1BbVgxSVZlYmhK?=
 =?utf-8?B?TWVBR1FJbFRVcEZJcnRwSXRKYk1TYUVIRmxpVzRlVndjZlIvem94TmV1cFNY?=
 =?utf-8?B?cEJMVzFVSXh2Y1lwUlNibVAycjNuOVBWSldIZ09WL3BjZFVyQkRFWmpOdVZF?=
 =?utf-8?B?NzRGdmhuT0k5ekFzaXpsZFducW1qbGlvRzlMaDdBZWZ6OS84MGp6S0REeU05?=
 =?utf-8?B?NmZzd25pRkFiamJZWHdHTXcrbHJDUXZNOXlrTnlWcG5WMUpKTUNmV3M1TGxu?=
 =?utf-8?B?V0JkQTN1VC9pbzlDT3RER1F6UERKbHVkUlpmb2MrV1liZkxwK1dXSndReUJQ?=
 =?utf-8?B?WlB4MmFmYUN0bExmVlJ4SjRyejdJcXl4ekZibGRxampKMG85ZmJ3UDlvNnJR?=
 =?utf-8?B?RDdjOTdhY2FuWVlZeUZkVlp6U1hmUEpwZlF6U0IvNjdVeUpPYUNOdVNHMXlT?=
 =?utf-8?B?SjhhTkU0VDZnd0JMRHdBaG1BNnF3eDJHNXNha2tZbTQrYW8wRE9wWDhxYVdr?=
 =?utf-8?B?aUl6MEJkV2I3YmNTYmRoR1hpR01uMGR3U2tIbm9aU25TY2gvL3RpYjhqQkNV?=
 =?utf-8?B?RllobGhyYWVzOHRNWlRSL3NJeEYyMUJWWmdieElkY0R1aXlRVy9RTU1YL21Y?=
 =?utf-8?B?VHkxOXVyM0JzTW1mUHM2eG9kTHYvOXVPRitzTEQzWGEwbHpuZE44MmsxUU0z?=
 =?utf-8?B?OHZ2VzBjaEdnUnBydFJrSm5pTklTQkdvZzdVaDR2VmNFL04yaUN0Nm5NV2xZ?=
 =?utf-8?B?QXVlZmRwWGo2dXM4d2Iya3UxT1pWMzZYQUdoSy90eXRaY3RSQkxJc3p4WjE1?=
 =?utf-8?B?dE4zZXV0ZGpadFlDYno4M05pTlIzVVkxZ3RUKzFBRG1Ib0M5QnFBMDVEK3NZ?=
 =?utf-8?B?Y2wwa2tYYW02M0h1UFpLRFdudDRmNE42WnZRQlpQcGFNWjZXZlQ3TXFuaTlm?=
 =?utf-8?B?WmhRNzdnNktXSEFxRG5lV204Q1BqckRoTXF0MGcwZHFSMWRrSXNIWUhvT0VU?=
 =?utf-8?B?T2hkUnR6UXB5aGU4NnlEUTVZVWFYZGw4Z1ZWb25wN1RJbnBLQVR0NC9NcVlI?=
 =?utf-8?B?NWw0L09lSGUyTjU3NzNrZDhueitJYWFTQis3TXdQTElRV1hHZWo2V2dXa0Jh?=
 =?utf-8?B?RkpKNmhYZSszWHFOR3dwN2RGOHdBbTRmLzVvZFpmbzF6Ty9xOGdwaVErZVZ3?=
 =?utf-8?B?ZmFMNkdBZkdEeHE3L0J6R3RSMnlEblQwWHAxSmFPaUlOdVVzR0FtQ3pQSUZ4?=
 =?utf-8?B?MktNYXp1UDMrNDNaTW13YVVKcUZRU2xZdk5lYkRzYm9lSjNXOWdVdzFzVnFs?=
 =?utf-8?B?cDY5Q3ZuZ2FNRjBPYXdxd0E2bGR1cWN3SVRSdE45b1pMRnM0eDNvcXRaQlkx?=
 =?utf-8?B?L255dzYxNDFRTDhaMHI2c2k3eHR6K2Nsd3FEWEdMZW9PT3puK1NLMXo4Vkhl?=
 =?utf-8?B?T0F5bUZVMTJtcnc0WXByS05oSVVmcVBYYXF2MFNUN0xLcitIMklKd2k5TGpj?=
 =?utf-8?B?Szl2YXIzb1BaSFdSWjdWVG5qdlZlL2QybVpMRUoyR09aclF2cEtKTzJkR0RJ?=
 =?utf-8?B?OVJxMFBHdStBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(4022899009)(376014)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:20:26.1495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5297d3-a617-44da-2c93-08dd7dc3615c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215100

SeKAmWQgYWN0dWFsbHkgbGlrZSB0byBzZWUgdGhpcyBtZXJnZWQgaW50byB3YWxuYXNjYXI6IHRo
ZSBjaGFuZ2VzIGFyZSBtaW5pbWFsIGFuZCBzaGlwcGluZyBhIHJlbGVhc2UgYW5kIG5vdCBhIFJD
IGlzIGEgZ29vZCB0aGluZy4NCg0KUm9zcw0KDQo+IE9uIDE3IEFwciAyMDI1LCBhdCAxNjoxOCwg
Um9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBhdXRvY29uZiAyLjcyZSB3
YXMgdGhlIGZpZnRoIHJlbGVhc2UgY2FuZGlkYXRlIGJ1aWxkLCBhbmQgd2hpbHN0IHdlIGhhZA0K
PiBnb29kIHJlYXNvbiB0byB1c2UgUkNzIGR1cmluZyBkZXZlbG9wbWVudCB3ZSBmYWlsZWQgdG8g
bm90aWNlIHRoYXQgdGhlDQo+IGZpbmFsIHJlbGVhc2Ugd2FzIG1hZGUgYmVjYXVzZSBhbHBoYS5n
bnUub3JnIF9vbmx5XyBjb250YWlucyB0aGUgcmVsZWFzZQ0KPiBjYW5kaWRhdGVzLg0KPiANCj4g
VGhlcmUgYXJlIG1pbmltYWwgY2hhbmdlcyBpbiB0aGUgZmluYWwgcmVsZWFzZSBjb21wYXJlZCB0
byAyLjcyZToNCj4gDQo+IDYxOTljZmYyICh0YWc6IHYyLjcyKSBGaW5hbGl6ZSBORVdTIGZvciBy
ZWxlYXNlIDIuNzIuDQo+IA0KPiAgVGhpcyBpcyB0aGUgZmluYWxpc2F0aW9uIG9mIHRoZSByZWxl
YXNlLCB1cGRhdGluZyBkb2N1bWVudGF0aW9uIGFuZA0KPiAgdmVyc2lvbiBudW1iZXJzLg0KPiAN
Cj4gZTU0NGEzMjMgU2F2ZS9yZXN0b3JlIEFDX0xBTkcgc2V0dGluZyBpbiBBQ19QUk9HX0NDX0Nf
Ty4NCj4gDQo+ICBUaGlzIGlzIGEgYnVnIGZpeCwgYWxpZ25pbmcgYmVoYXZpb3VyIG9mIEFDX1BS
T0dfQ0NfQ19PLg0KPiANCj4gNjM0ZmIzZTcgUmVtb3ZlIGJhc2hpc20gZnJvbSB0ZXN0cy9sb2Nh
bC5hdC4NCj4gNGZiZTY0MzYgUmV2ZXJ0IGRlYnVnZ2luZyBjaGFuZ2UgY29tbWl0dGVkIGJ5IG1p
c3Rha2UNCj4gODc5NGNkMWMgQWRkcmVzcyDigJxhdXRvbTR0ZSBwcmVzZWxlY3Rpb25z4oCdIHRl
c3RzdWl0ZSBmYWlsdXJlDQo+IGU1ZDk4ZjRjIEF2b2lkIGEgc3B1cmlvdXMgdGVzdCBmYWlsdXJl
IHdpdGggc2hlbGxzIHRoYXQgaWdub3JlIHdyaXRlIGVycm9ycy4NCj4gM2ZiZmIxM2UgQWRkcmVz
cyDigJxhdXRvY29uZjogZm9yYmlkZGVuIHRva2VucywgYmFzaWPigJ0gdGVzdHN1aXRlIGZhaWx1
cmUNCj4gZmRiNThkZjYgdGVzdHN1aXRlOiBTa2lwIHRlc3RzIHRoYXQgdXNlIGFjbG9jYWwgb3Ig
YXV0b21ha2UgaWYgdGhleeKAmXJlIHRvbyBvbGQuDQo+IA0KPiAgVGhlc2UgYXJlIGZpeGVzIGZv
ciB0aGUgdGVzdCBzdWl0ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0NCj4gLi4uL2F1dG9jb25mL3thdXRvY29uZl8yLjcyZS5i
YiA9PiBhdXRvY29uZl8yLjcyLmJifSAgICAgICAgICB8IDQgKystLQ0KPiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2F1dG9jb25mL3thdXRvY29uZl8yLjcyZS5iYiA9PiBhdXRvY29uZl8yLjcyLmJi
fSAoOTQlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29u
Zi9hdXRvY29uZl8yLjcyZS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi9hdXRv
Y29uZl8yLjcyLmJiDQo+IHNpbWlsYXJpdHkgaW5kZXggOTQlDQo+IHJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi9hdXRvY29uZl8yLjcyZS5iYg0KPiByZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mL2F1dG9jb25mXzIuNzIuYmINCj4gaW5kZXgg
ZGIzNzQzNzNjZmYuLmYyZDI3ODFmZWM5IDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYXV0b2NvbmYvYXV0b2NvbmZfMi43MmUuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2F1dG9jb25mL2F1dG9jb25mXzIuNzIuYmINCj4gQEAgLTEyLDcgKzEyLDcgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Y2MzZjNhNzU5NmNiNTU4YmJkOWVi
N2ZiYWEzZWYxNmMgXA0KPiAgICBmaWxlOi8vQ09QWUlOR3YzO21kNT0xZWJiZDNlMzQyMzdhZjI2
ZGE1ZGMwOGE0ZTQ0MDQ2NCINCj4gDQo+IFNSQ19VUkkgPSAiIFwNCj4gLSAgICAgICAgICAgaHR0
cHM6Ly9hbHBoYS5nbnUub3JnL2dudS9hdXRvY29uZi8ke0JQfS50YXIuZ3ogXA0KPiArICAgICAg
ICAgICAke0dOVV9NSVJST1J9L2F1dG9jb25mLyR7QlB9LnRhci5neiBcDQo+ICAgICAgICAgICAg
ZmlsZTovL3Byb2dyYW1fcHJlZml4LnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vYXV0b3Jl
Y29uZi1leGNsdWRlLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vcmVtb3ZlLXVzci1sb2Nh
bC1saWItZnJvbS1tNC5wYXRjaCBcDQo+IEBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiIFwN
Cj4gIg0KPiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9uby1tYW4ucGF0
Y2giDQo+IA0KPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0gImYzNDc4ZDNiNTk3ZDUxZjVkNjE1OTZm
YjJmNmY2YWJhNDljZGQ5NzRiNGIwNWZmMGJhYzU3ZjU2YjVjZmRiMzkiDQo+ICtTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYWZiMTgxYTc2ZTFlZTcyODMyZjY1ODFjMGVkZGY4ZGYwMzJiODNlMmUwMjM5
ZWY3OWViZWRjNDQ2N2Q5MmQ2ZSINCj4gDQo+IFJERVBFTkRTOiR7UE59ID0gIm00IGdudS1jb25m
aWcgXA0KPiAgcGVybCBcDQo+IC0tIA0KPiAyLjQzLjANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTUwOTkpOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIxNTA5OQ0KPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTIzMTUxNDYv
Njg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

