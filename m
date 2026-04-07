Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C45FF5126
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:25:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85679.1775579128877893649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=keTnbhrN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=keTnbhrN;
 spf=pass (domain: arm.com, ip: 52.101.70.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rDrfko+kMmLScLyV6ep1WFX3omXeGLOzcHT+UPJZS9VmJsnz3aGskMr5+GFGdHAxYfojTtTx6YkPQ0/ArC0uo0lqtoqKiIljT4ufwd02hrz7o3ykRLtOXHlpuwqc5FpmR06JUpdS6NelzWdPa+EOumCPa3qy8PB6I7ab4H03adXag7ODyjTN9QZcl9VeBr0BonKYj/TX4DHDl2huhKqPq3Pji4ZVwNznx3peraf82yY0C9iniaIo3STPV/qvY5SvhY+p7HXDJemhSUTzmPFUpPB03jxKipxrzLNt1Iq9X9IOmsRpa1zRUo5zp8SP/lrBpo5KFoxGvE88AfIesZGluQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8DPDJdGHY+75l29NdqTouPXxkNrITlOTQ0VdBs2o9A=;
 b=CsuqjeTWV9fj7dNsj/SW3yeTouRwd6p3pDFT6DpxGiWasf3o4rry1tR2MAIEchh3BU1aZ0hpKfJkT2hb4p5mOoKHBRAMx3RikwSaSXu+Se4bx5gfurrtKzrQ9M+rHTpku7rp6+7PqU1eJeKaDNj5m9j2Y6xOJzOgvBEke+0E1sCi+XLza1digdQtM65d98KbTebNRYel63ZJQlqARo1wp4j1md5JM+xHb+ojWIFVi+6hKROnIHdqlOLcovSPx+ywB1Vu3W1nm/gjoIaV4MGFkmncvGfW4yit60XSxzN41RRosohT/lyBTPqgWGwP1b8M8D7324xVc0RwHOk8HycdXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=navimatix.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8DPDJdGHY+75l29NdqTouPXxkNrITlOTQ0VdBs2o9A=;
 b=keTnbhrNcXB0lWwfS5nyFBESbOzGmWuZRu5h1qhscqCkBvMYipF3ustA647wbHz3NuzIIPzHI0AvvsdAnmUAJHNZgB5wwOgJ0Q+k+aQLEj/MjKTWdxuvDpR1XA9l0TiKRF+DRIdoXScVRGR3sPCkgThFoGwGWCzOMfZAtXNWE80=
Received: from DU7P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::14)
 by AM9PR08MB6020.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 16:25:23 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::98) by DU7P194CA0023.outlook.office365.com
 (2603:10a6:10:553::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 16:25:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 7 Apr 2026 16:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cs/O0YINaabcKpohEwfAugWR8KKYlXuraGC/XT+ISC7hvpurIw3ETIY89yF6wN5ojpIHsCp7OlP+9748eRHBVnNYYOpj0AADZM7bpaceoyUSkTT738OKspP+xAx4kAJpJ8VoGxNr5O89K6leuo0mQbh4fZ96wb5Vn974dQ5tUwTSxyXXBMVi/59EOp9snrqaaVLCaG/KkvPcYYJ5j+5W27uuRVMriBOVU9ZqapVYOieShX2jngUzPZ1e9BXISGz2O5QeERjZWs0KvxbX+GvcpqQAYLwjW8EnBEqjEPFAHVWPuxV+nbnFc+6KjO/keVXkh5zLeBvECq/q5bL3lt5V5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8DPDJdGHY+75l29NdqTouPXxkNrITlOTQ0VdBs2o9A=;
 b=f7oncqWoGx78haIEFojq0wDDMzVZh8Hp6UX1mf/vZ4Ex0BV0KOloVu2zicjHvwyOuEd66DvEYKc3rlsWo7GcSosJeMkVdsVcBHtky9f1FftZGCQUJYn8yyjcgXoveGWsttVbSnFHLguS24A4KkHUzJAab8qTlAw08bmqBu9nxglGeAhCLKTuTaoJt/0CDF0fEenESMR367Lwh2+SxiO5xXrTZN2N2qrIxNOtXYbsa0cfS1oLhOB2/AO6yy//JEYYwXhdPLuH0xgw3XE774wibN42goAkYzzYo680IkOhwhwUu4Bl9pkGmS2Z58ArwRPUULeXYEaevL3kRcEau7FOww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8DPDJdGHY+75l29NdqTouPXxkNrITlOTQ0VdBs2o9A=;
 b=keTnbhrNcXB0lWwfS5nyFBESbOzGmWuZRu5h1qhscqCkBvMYipF3ustA647wbHz3NuzIIPzHI0AvvsdAnmUAJHNZgB5wwOgJ0Q+k+aQLEj/MjKTWdxuvDpR1XA9l0TiKRF+DRIdoXScVRGR3sPCkgThFoGwGWCzOMfZAtXNWE80=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9813.eurprd08.prod.outlook.com (2603:10a6:20b:616::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 16:24:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 16:24:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] busybox: fix DISTRO_FEATURES detection
Thread-Topic: [OE-core] [PATCH] busybox: fix DISTRO_FEATURES detection
Thread-Index: AQHcxqkaoIQr9ey14kuKW2GZFnVMEbXTyCWAgAAAdYA=
Date: Tue, 7 Apr 2026 16:24:20 +0000
Message-ID: <3869A7F3-4170-448D-B599-A1057E68F5F3@arm.com>
References: <20260407161030.1196116-1-ross.burton@arm.com>
 <adUu2aZMnLWP8bKu@navimatix.de>
In-Reply-To: <adUu2aZMnLWP8bKu@navimatix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9813:EE_|DU2PEPF00028D05:EE_|AM9PR08MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a98099c-387a-4a96-df69-08de94c24464
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 
 DLqPOmo+usPSDTQ+ShrjlWpapEJZswnI97KRwr0QqaAhX0gCUNDmwH4DThlbMBzvC+QFs48BwYXqo69Sluuw4XpoIfP7bJDqkHTUqW8vuBQd61DGDxDcXQ0JOM5hIwZ/eR00jU2NxnMIhgf6KQnPP2vPIokBj6Vr7JwIMkgUBvgN09ZqNUX0NOvA278hj9ulzO2ZiN738Xr63uwmKYbKFc2HK0WTbbdUDAx/L5X/1dOCVuS+mQoPqF+M9dB5A/SbrUSgeBDPBMF+YlWSvVTLni2/OzIzvfxbb/2iEblwYwBzlGxISvjuUE7F4Pqqx5wDkHabMiGvPe3B1lHTllcpmZyfI+7aijXhzRYSxsNaLt179whR3SZi4JTJPAYOREBvGaJhmxa+FmKOmt67ZwnjhYLwos+5Ymjn3AaAckORH+7UMPK0n3f5KKVCNM97mug2uXXYIngsArTizIfufgTsBvW/4hDUMB7WuJLQb8Zn9Z4lsE1mfFoVI0JV35g1wEs8s4lhh5AlRl0ZNZpvQKrxOiLC7ncRPdyBwoqrfRdLftz4YZ3E96tQOoVYnCeXt8bcQmDVdrNEwGY9P3hWnhWrg/OQnNiSvKk4kA80wzgV5Mc7W0DWYO8mxjp1ap53Hjn+3Uk867Y+l6iIwkHNWZfDi9ouQP/ID0HLsIX9LbBlaFuI4iqrD9txrRZpS5ui8pJuo37L5NL72Vic2Ak9+nKSe11eeBsrV1Sy2NRMott/5Xu1tF7FsG34PSaIGnAenAyC/7AvxvtPR9bDu69QkZpEtaclqVZ3jeTkSgufj4mESV0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBDB52D64EC2C141AF21659ABA9C60AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hCJXbB6/Emodmu/yqqsLQ6h0pjV4Z09neBRxIyYSgKHBSoAPdp9E1iUVz2g4zbV8xQTnd4XpafwJ/veuBz1aBftHv331TThV2S/wWTSsuvZl62jm+etC3MltZJwekiSlwLxjHkwjVRWb8D/JjMr8kMAX6N0ARya4qYPvUzRQUi7GtBTnCTK6WHJ8bvqXlvR79HloallXle2YhXsIrGa6OErcWRV/6sKoOGwGFpqV5cVKnmqjdjZiisEn8k2LaA0x1gPW8GBtgwu9COlofsY9i5B/MoD7qGGzsPRt0DZ0o79Q7bbcBMJmogvBu12V1dFgWwhwXCEzawYRFQrYLT007w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9813
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1f3e8a2a-2fb2-4597-4321-08de94c21f28
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700016|82310400026|14060799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	6eKFUGkcYXwuBb3rtRAxNhdneKMkIiTZYjo9npVXbBpF5hbflp8GKg2pp7Hjfo8haNVa6mKkQOh5aBth9k1lZOvvt7hi122vUEK00ZhTqvY9ASrAhASTD+8QJlJfdatxqpP6p65kNT3a3tWD5FWZmN2v2eiVHrLDCmk8JMFg3qvmBlPbzn6FLqOvAszyc4kRRGh7FvXH8ub1wPSthendg1cnXYkKT1FenBBm6AtkO9urOFX6bcbhsusF0jcvtXuIC/qsOHKWxhP2Wv+ZbK7FvtHxbI6lVi4Wx6vu0gsdT4/3mHSeiFLQpa7+IMSHq3qRjbLON1zHbZFgMkw12TmhJihg0q2e+nLhj0Pbk/YneRx3l1IHNl62wjBjcY6QwPYQHIqLwQFd3NHdMRy5XB+IWb7j9Fyeo7CkWR7HtoPx9k4MLuj8QG4s6Ah9cV8iS34FWDpdbuNHo8rx3MiNQaMba6gW9siC1XTnF0JDUAPuB5SZxi3uBLMGwxQTXHUOHlV28odlHQWu9QOaMuvtqjnWt+xTl5uXCosrGhZaTbneI4njsVeJ7Has4vv1C+GmVHpe7vzgKZBsrydBEP0RElbtwiLIqNe9GCq9Z9o5Bc5QTdj8ljbgY9/pXONCRxtMuSKfErv5IkjfMo8uAlKts4JH+lm9pcVvAjDXlk01HpYIi8vNx/c6vm82lavKP3VUVtwaskESXHhTmY1O3RsOqgZEsV9Ijnv/3SmksNwVnlqo+6z3YxmrPvblRFBa3m6MNVIgFCjZKqcnyACctbPQshOHxg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700016)(82310400026)(14060799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UygjFy7u8T1ApWdjwSpliO+HdjIhwpC3UgBjf52ABBwMdlo/YwJ0AeO0dXOlZ81ydwoF/nDmr33IfTmIr6VcH+epXiPE3AQyQ/OlwGYxIIj23cW0cP20NNbSeXl2rHF+xlzoIHswydUU1moNoib0SJXZ6ccGFsmKx3KVWuqmFRQFHHnGGoyPiyCf3OvZYyqW9I/cVjBGTrgND6HSWrG0C2MzDN7DHr7j3POGCS8O5m+/eeTDbRx8IPchsdk6IJkWereElGayvPnO+sgichNXUtcevgtdMUxF0yrBc/JE6a0KpVxen7ou0SXruHF7ask3S2sQbG8GHdBYWC4t1RTF6VhHmRZlFdeJs6klFyro5d+xGmPizqRi7hBBpb7ktfXppToapHbaHIYF/MNf7H0/NiBHF8ZU7CM3HwyLGU9RxMuLOBlTRZKZZcfqAdImIEOU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 16:25:22.4761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a98099c-387a-4a96-df69-08de94c24464
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234775

T24gNyBBcHIgMjAyNiwgYXQgMTc6MjIsIErDtnJnIFNvbW1lciA8am9lcmcuc29tbWVyQG5hdmlt
YXRpeC5kZT4gd3JvdGU6DQo+IA0KPiBzL25vdC8hLw0KDQpUaGFua3MhICBNeSBicmFpbiBpcyB2
ZXJ5IHNsb3cgYXQgY29udGV4dC1zd2l0Y2hpbmcgYmV0d2VlbiBweXRob24gYW5kIHNoZWxsLCBh
cHBhcmVudGx5LiB2MiBzZW50Lg0KDQpSb3Nz

