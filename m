Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7ACF589B2
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:39:55 +0000 (UTC)
Received: from mx-relay61-hz1-if1.hornetsecurity.com (mx-relay61-hz1-if1.hornetsecurity.com [94.100.128.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18362.1776947992001397694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ZfPJBn1Z;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.71, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate61-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.130.122, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=mrwpr03cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=F6EjCDANPJ/N4GGmqriFts0/1GUWK2rs+zTbv4O1BiA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1776947990;
 b=TUF7s5DRM0p25CWfnrhNV0jEoRmKkXnX0EHkvcZ6kJaOA4F+oGjZk3QOaowos4r3IdlSJZU9
 9M0nXlqhF+q14NF+mSEGt9zTYgperLqGT+VULV98ox6IlTPywQsNAFfMlREzNaQFnnLosNwbUoA
 Ai3umaU9k4NV0zUz8ERxbQgP/+TMHjBWUL8eFycHWIGf58/aPuNulDw8ITSaAWYLeA7cwCR8qNH
 t5NAW5ayXIGfAdQ2HGQEhQOvF5wTgH1iOri4i5l5XRYR6JyPvj1XliDARLVmAXtY5aQvTOY7BX3
 PgHx9hwPR4ZjQHFBDle3LrDz1hYUGEcS0+GTgQPe7NHxw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1776947990;
 b=Bmiqty9vzGEz/QZck+P+5TsLU13Q5qwPyzI8U5mrqDE3UQmZtNdmm/Ap7di0BH3j7w9pZI9H
 ncEQkuyiIJ+fR3AGlm7lqGDWBQwvGqk3/WPCqpTf0TlbqoGyAFtjUdrbjH0VXJddtDlKC9BfuBH
 ACrzn9lvWVJUwmmnmV3m71eAJ+Ot3/uWoUbUbVV9TlQvDKUsScM2ajGNr2XzkkpfOUSpseTAWDL
 L/GZp5akhzym1ZcAgAfvnUHfS0F+3Mk4xHxoHbRzn36vc7el8dXGdRy50LbmAZ/BwYBQHljRh4h
 YhuqkB/DK9ukq1BFIaupsUWcjwlqf2q0SULQgqV/ljG4w==
Received: from mail-francesouthazon11021122.outbound.protection.outlook.com ([40.107.130.122]) by mx-gate61-hz1;
 Thu, 23 Apr 2026 14:39:50 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+xblN0TyH5KUjNUVizz+Mw3TvIsfqrCUcWUIdm50W/TIBJ35/CpFiio/15mcXwVFH1zs9ZoCGaoWFAO0piRK0pc6ZbFwqrXi5nMQlPwEtEAlX72QEC633HPspqvTXGF24F3Qz0v28alUM8r0ArzWcNrvcgBZ5XRX6AxHcT52l/kmNWHsc2nR4+iiK7Z4tWySetm9jqrNRFUqvI15hrSaSL7fa8cIBgm5Ria2NU+YhivmGyfNlMwfEbepZEVSt3dlOm1kg8WfAPvgRDHnMBoaLskrAGJ44viNSoLDO+KrpGBYvj25QmwIAKf1fAk5Gt3J76zSgvVuA75kaDpc6uUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6EjCDANPJ/N4GGmqriFts0/1GUWK2rs+zTbv4O1BiA=;
 b=A7ks9tNuGzPUygNn/GaYVnhfWkO5waAZDPGB8V81IuOu1J3FNR4B72WzrxRjgh9Vm9RhGzInD0y6cUWO7GyYdhAY+5u9JbHov2gpDdy+/DkwvRP4Rp7QXNHiuSVAY2ezoPWp0TiWQFRxgbFdtvz3LOL74r+OUUfSVqHmxDD1N4hLG1IIDe1200f9Vzd/4Q+P8xPporR/i9p3QMPu5S6yB2Vv7+nM93TT1okf79VHxFE6n3ffM8VTTQcqZrHXDEhFOCug5JXVd/HoqKEowi2mdbPoEPhaNjZ8ShGO0PY64wkTCQRffgF204sOQxj2z9aHBia8yoZ87OlsY/aWdnipLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6EjCDANPJ/N4GGmqriFts0/1GUWK2rs+zTbv4O1BiA=;
 b=ZfPJBn1ZyjkmogHhuBWhDTVMQwwbj1TcwnFsNqNUyQTzIeLnCxnSOP/V9RhtFmhNJkhe3pOhTHwg6oFn5Q9X6whiS00hLyNGBTd604z9k6aZ0TT9Gq6aBVSHxnFvyYLNgE9h90MhL9U3J/L12fyDlKeQ9Wxgyv92xgsQtKasOxC4/S451eaYtgT8azo0sS4vMMy4VJmfVot5ozxqkrm2b1luUX6iDljSjGOd3hrmna1EQ7REnrRqyJDy3Jswh2el+HkL8/7OJT0GlPo+nTisLLXLK7qZ/Gv00f0a0ZUJTQ/accku/iPc5nLCj7fRpXXhII0OJoV78YdgqCgdBNDKfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 PAVP192MB2112.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:321::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Thu, 23 Apr 2026 12:39:42 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9818.032; Thu, 23 Apr 2026
 12:39:42 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 3/3] expat: patch CVE-2026-32778
Date: Thu, 23 Apr 2026 14:37:07 +0200
Message-ID: <20260423123854.388088-3-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423123854.388088-1-hsimeliere.opensource@witekio.com>
References: <20260423123854.388088-1-hsimeliere.opensource@witekio.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|PAVP192MB2112:EE_
X-MS-Office365-Filtering-Correlation-Id: 80201c8f-d185-4cb7-b970-08dea1356470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|52116014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	jRDqevSea6TL8+1jlPOKz0z+vQjcevVAg8RQDe5sBULxH9rRE9/CyV7LEaYQp32MKIM77O+q2IbIjV6L7OBTPLWoDNdKpTFg+Q8U7829S0kNubESB6w8GleVfAaprTbGWiZAfrdCkCiFtTRJq89OhBbACAOQks1P/mK/K3aPZ9SSKcdY6YhiVipleTv2CaSPGnuW0h6yWHJVs448BpfD4nUGPdxZ66lCZk7FSks73Sm3MVcJfj3gTpV9Gvo9Tr390buqiO3IrgK+jT2fqVJSBUBtQy1DFglVdlIi9dOTIZdwhaOfBC++55Ow7wz+bId/YRyesheyUKui7qhU3HuuXpHdnq03GD6/WdUsYpG5SW0G2jubPNIKxedKC747PWgod0iuHrWTabW9aYp/2zo95CvJLzA/VY3rEY5SusX+fW5igmmvzSBZVi20WK/yjQ0Iz75/oigQSUoZt4wOqoiQLrghXj14E0vfDMFZm69YFAjTgUCN9p2cS8aAo9G7w7B/QkJnaITMTMy2Bw/opNpYmrI6U5hSElIjvP9Hi4PAnsSCJVjqZTg+itk1fhseY36lS0RL+Ps8l6j8nN1d9G5BQS0V1dDuDGcmTKdE/CUf7LGVCIWaG5Nj/xPp1kCCYdAsqbywv2NfEhJNq4yrjtnWcDTrS+qJMsFIw8MOwgh+RTqQBxtW2Mt8Cc1LUwWzJrkD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(52116014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1BtTUltNnpxclBMa0JJMHBxOTVNeWpNQmdtVkJzdFh2NUZEVHBYWjJGZXo4?=
 =?utf-8?B?TVNxbFBVTHNCZXFaQ3BwT0dxcEVYeDdwNmovL0hUQ1hRcThEL20yVGhjQkI2?=
 =?utf-8?B?REhyeVJFc0hvWFFoWlluNlFzcXMrVU9PTTE5cEdDVXh6Y3NZcHBmZEpFM0N3?=
 =?utf-8?B?SGFuRllVd09pS2NWQW9EZk9VRmROUFJqYW1MMDA1c2tOZmd0RnVwcngzOXE1?=
 =?utf-8?B?WUFTYmFkZHZ0L0ZFV2hNdDVsYnp6ekpuQTRJZE56V2p2R0lXTjVhU1RucTAw?=
 =?utf-8?B?akVFSmxHS3ZxYUxFbUhEUGtjV1pkVXVoN0JzWUUwc3NUWDAvZzdJejlrZWo5?=
 =?utf-8?B?NVIzWnozZTl3ejVySHU4MERaZ2RWNng3TTlER3YrTlgrcVVLU3A2QkN3SjVB?=
 =?utf-8?B?Y2FtTjA2TzBqNWZXVy9WNGhVU2hFd25QeWJiVVF2WVoycXdIMzFaUU5rSG1P?=
 =?utf-8?B?enA0ZDJaTjA1VFhiWkd2UHBiVVEvczdxOUNseXFTNk4zNFd3anVzQ1R2TFZK?=
 =?utf-8?B?cnRkKzkvTWlQVDRkdGQ4SlJuTUN3Zy9CZHJXN1oyN0xCN2tRNDRVWmFnTGo0?=
 =?utf-8?B?SXR3Z2dHZjRDSTlnbG9sOTRHUE1TM2lOSTdFZU9WcjVVVTNSZTBhTzRXT3JE?=
 =?utf-8?B?ZDhoSEdkbUdRVGoxamJyZ0hNRS9STVNvQUswZW13SVI3VXkzcmtWWWNPd1VN?=
 =?utf-8?B?dXNVUlRLWXkyQnNjNHI1TGJaYW8vakNrK1FTSVN4NDQzQzlOZ3lEZTNJWVV1?=
 =?utf-8?B?RDB0VmFoNmgwM0FIUjFGK2tTVUJjVnJxR0hXMUtwbnpGSThjTkxIUG94SG9j?=
 =?utf-8?B?SWNlZ1lFbjJTYjl5SVUvSTNMcnZzSm5QZXpKc2o1eHJQUUNHa1U2L2UyaDhn?=
 =?utf-8?B?TUVHL2JYSVRYWXpOdFl6bTFzZWxYdDdZdDgxTVpBK2p5NEIrUmxoSGF1amFM?=
 =?utf-8?B?cGdoZm9pOGI4YTRYVEEza2ZDOVloQUFVUjFkeXZTQ2piTXREWjJYSmxoaWVL?=
 =?utf-8?B?bVpYRFpaUnZOUXpYa1VHZnZzZ3d5elNOdkVWVnBLd2RJcEkvRlBzN3VBLzFJ?=
 =?utf-8?B?ZXk4MXR6ZlFxMTgxTEdHYjhOajcwY25odFBkR1p4V0hCK1BrdXNpQ00wWE1u?=
 =?utf-8?B?TVpkMG82SDM1Nm4waXlQWDFPRkgvQTZhTEMrU1o3UncrQXJaM3loelV0ZFFI?=
 =?utf-8?B?VFlxTEdyOGhreVVpaE45cWRHN0VBZEZMMnNPTERiVkpNaythUFRGTUdISmpZ?=
 =?utf-8?B?Y0NteVFqc3AyN2lCK09lUHF6WmZQVit2bndTbTRFRUJVNjBRaUY0emZrNUdL?=
 =?utf-8?B?cCtOaEZpNEZuV0NDZCtwSU1pM1Q2YXVxZnNMRER5Zy9POUI3WG93RXl3Syt3?=
 =?utf-8?B?aHBmQTc3bEp5elAraVF1T3VrWTh6ZjZyVTU2b29RS1d1MHVqMGZKZy9zRXBn?=
 =?utf-8?B?b1hCS3JuWEhKN1dUQ2JaTStWanhQNGVxZ2UzNFRZL1JhNisxREtyRzVlNkJT?=
 =?utf-8?B?alZ6dDFneFRoaEphOW1qT3B3NTdybzJpdXZYeDhVdlIvdlJlTmxUdGlXTHpk?=
 =?utf-8?B?TEIxUmEyVHQ4anNWZDRYNkN0Z29ERHpXZ0w2OGtydDhQL0k4SzBocDg5Wmg2?=
 =?utf-8?B?anByeDFtaWhLcnhhRGxDdmRkb1ZvYVBOTEVSdmQ5R0J1SUJaeVRjcjM3eWdT?=
 =?utf-8?B?S2tmMGJPaEVCR2dnc3hYdnUzQ3kwRm9HZEk2cU83alhpQ0lzalBIRnQ0Vk9w?=
 =?utf-8?B?bFFlS05XcE04Q2pVRkdvRlpYeFdpQXMyQkh5UW81RnEwSWl3a3pCYWtSSm9T?=
 =?utf-8?B?amIzTUNrQnIyV1I0TVo5OGhleCsrd1pxQVRzTnp4b2NoeSs0eWt2SzExN05z?=
 =?utf-8?B?bWR1dmtxS3hxa21IZlZMU0E1ejQrL2UvZ3JmNTMvWVZQMHVmVytCR3p3MGxC?=
 =?utf-8?B?eWp3YVhQKzlWVVNWK0szcjFBZnk2eFFXbHJVQzhreW40U0wxOHl3RGxrNlM3?=
 =?utf-8?B?NGE0YVpkMGlVdnhNODk2MlBCL0orZWJ5Qk1XbzNXeEJ4d1N0UTM3OWZqODFE?=
 =?utf-8?B?NG5RU3NqWUVITkcxQkxYMU5GeFphaE95bVRxMFVhN2hpd3RLa1pma3BtZks0?=
 =?utf-8?B?bWFxRWxRYzZGR09JK0xjeEJSMWFEWjNSeGZBU0tqM3BtUDc0NDVZRmJPemdF?=
 =?utf-8?B?d1RaNjVlVVFBY3lvOXdPN3JMVjN3YXU5Yk5uQjJUMWI4MC9Vck5LM1dxOEc2?=
 =?utf-8?B?enY3UVlJZ1kxZVp5YmxCRitYWHpMY3A2ZFhnU1g1R2lEakhpVFRHOVN1NzFs?=
 =?utf-8?B?Y1VJRU8xMklXSnFlbzQ1L0F0UEdxc3lLTlZ1cmh4eXp1TW9NUGcxT1lwS0lt?=
 =?utf-8?Q?2c5fz7XILqPf+azCAc1IrinzgnB6sZ+QvObg+wgOHsA91?=
X-MS-Exchange-AntiSpam-MessageData-1: j8iEm/NGvouGZw==
X-Exchange-RoutingPolicyChecked: 
	a/XQFLCahlVVB3hqCFed8qbdZxQFBOkOnxziEG+JpNJt2AKsSPaGw2efep/dbehfTnq3SLG4ZnIN4hR/MWpH1e83IuOLavZCBrw8E44FxhWmTlZA/fYON9EFDhpHmuQ3gn5BCRZfPO7abyID6//9FaZ9lUNNiqH1qSCLFwHiOtLmmjg+f51KrK89KU2vtG1hWIqcrewhN/AnAkRt9gTewfCoolNsOL1hTK0KmWmDTR/1mn5Cxc9mB+ZGKaGNWNCxRVWw2bDmIvRRDoO5ZVDCJhlZgnfskmjlWno9QGbD6T6NQ4TTF1PcodNNCuu3FRCX+o1xoWlACNc61DPzGyDjQw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d8cpaxoWdB75YPp9Lp6S0LwREfgsQnw0fggliWlFX4NQrC7REIYYxG5b2g5RAmwMwGey0e3eSliAziS1kQIxgqYCSvVqotvqQh6tAk/PNrjkzJzTwv+K0mMHUw1V1zEdS18kQzJeYdzguAuR7VTCvjwmPTFf4ERFmWj4ynCakaPUoRWBpTtN5yMfe6dXG3KAC0u6NdPahzsibiB6GUaPgthv3rrIgpSPeACjZb/XxbqPX5xJmfb35gy7eshYMY+Axlc16jjn8EkmHTQY0/LUYsOEsKkkDYyq38jWfEkRiD9HIJS7f8WdhA1XRg/RB65JSFxoSvsEEL6TycQhXyLpjSPYSzM+5pal2lWwGc9m/deGPeN3+VFKSnRcw0xc+yxbwJcuuT+rLXvtAtt1MvoEF5B21eQihAAOmO7wzNEzdox10NvVwqSGaGVO7QKmKEFejKhv2JedUnj7DiBKZ5yBumuXNW6dPMB3QHx/ymEj/9JQDIyeyKYz/lfB5bWLG84idhncAd1tJnVP/w9k8v23A/dXxN+kZ1CajV4iOotY06KDKWt3X9Bwncb+q+G62CstapQv7OD2njXbMq5B8Af1HuxQFDkH+oZHWpwlnZo+szURKVxflBBcl3uelJS8uAgS
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80201c8f-d185-4cb7-b970-08dea1356470
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:39:42.4688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zi/Sb9QZL9gcDj7ildHGFHjyJGCX1h2CyLLZ2AatGPfVndf0/gIMe6eAV0tae7oNXppG8Cdpx5xF5n7+XlDabQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP192MB2112
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate61-hz1 with 4g1bJd65XTz2gd5P
X-cloud-security-connect: mail-francesouthazon11021122.outbound.protection.outlook.com[40.107.130.122], TLS=1, IP=40.107.130.122
X-cloud-security-Digest: fc986a11b81852c41cdfab6cd8967f74
X-cloud-security: scantime:1.381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235765

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1163
[2] https://security-tracker.debian.org/tracker/CVE-2026-32778

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../expat/expat/CVE-2026-32778-01.patch       | 91 +++++++++++++++++++
 .../expat/expat/CVE-2026-32778-02.patch       | 61 +++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch b/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
new file mode 100644
index 0000000000..0105fe7417
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
@@ -0,0 +1,91 @@
+From b878628b560a2ba1e11b3a12ff8df0dab7d6b8bb Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH 1/2] copy prefix name to pool before lookup
+
+.. so that we cannot end up with a zombie PREFIX in the pool
+that has NULL for a name.
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/576b61e42feeea704253cb7c7bedb2eeb3754387]
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit 576b61e42feeea704253cb7c7bedb2eeb3754387)
+Signed-off-by: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+---
+ lib/xmlparse.c | 43 +++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index bfb8ac58..9bc67f38 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -590,6 +590,8 @@ static XML_Char *poolStoreString(STRING_POOL *pool, const ENCODING *enc,
+ static XML_Bool FASTCALL poolGrow(STRING_POOL *pool);
+ static const XML_Char *FASTCALL poolCopyString(STRING_POOL *pool,
+                                                const XML_Char *s);
++static const XML_Char *FASTCALL poolCopyStringNoFinish(STRING_POOL *pool,
++                                                       const XML_Char *s);
+ static const XML_Char *poolCopyStringN(STRING_POOL *pool, const XML_Char *s,
+                                        int n);
+ static const XML_Char *FASTCALL poolAppendString(STRING_POOL *pool,
+@@ -7443,16 +7445,24 @@ setContext(XML_Parser parser, const XML_Char *context) {
+       else {
+         if (! poolAppendChar(&parser->m_tempPool, XML_T('\0')))
+           return XML_FALSE;
+-        prefix
+-            = (PREFIX *)lookup(parser, &dtd->prefixes,
+-                               poolStart(&parser->m_tempPool), sizeof(PREFIX));
+-        if (! prefix)
++        const XML_Char *const prefixName = poolCopyStringNoFinish(
++            &dtd->pool, poolStart(&parser->m_tempPool));
++        if (! prefixName) {
+           return XML_FALSE;
+-        if (prefix->name == poolStart(&parser->m_tempPool)) {
+-          prefix->name = poolCopyString(&dtd->pool, prefix->name);
+-          if (! prefix->name)
+-            return XML_FALSE;
+         }
++
++        prefix = (PREFIX *)lookup(parser, &dtd->prefixes, prefixName,
++                                  sizeof(PREFIX));
++
++        const bool prefixNameUsed = prefix && prefix->name == prefixName;
++        if (prefixNameUsed)
++          poolFinish(&dtd->pool);
++        else
++          poolDiscard(&dtd->pool);
++
++        if (! prefix)
++          return XML_FALSE;
++
+         poolDiscard(&parser->m_tempPool);
+       }
+       for (context = s + 1; *context != CONTEXT_SEP && *context != XML_T('\0');
+@@ -8041,6 +8051,23 @@ poolCopyString(STRING_POOL *pool, const XML_Char *s) {
+   return s;
+ }
+ 
++// A version of `poolCopyString` that does not call `poolFinish`
++// and reverts any partial advancement upon failure.
++static const XML_Char *FASTCALL
++poolCopyStringNoFinish(STRING_POOL *pool, const XML_Char *s) {
++  const XML_Char *const original = s;
++  do {
++    if (! poolAppendChar(pool, *s)) {
++      // Revert any previously successful advancement
++      const ptrdiff_t advancedBy = s - original;
++      if (advancedBy > 0)
++        pool->ptr -= advancedBy;
++      return NULL;
++    }
++  } while (*s++);
++  return pool->start;
++}
++
+ static const XML_Char *
+ poolCopyStringN(STRING_POOL *pool, const XML_Char *s, int n) {
+   if (! pool->ptr && ! poolGrow(pool)) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch b/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
new file mode 100644
index 0000000000..2cfda33dc8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
@@ -0,0 +1,61 @@
+From c26728576de3850258c7762c036dd0eb7783ea15 Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH 2/2] test that we do not end up with a zombie PREFIX in the
+ pool
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d5fa769b7a7290a7e2c4a0b2287106dec9b3c030]
+
+(cherry picked from commit d5fa769b7a7290a7e2c4a0b2287106dec9b3c030)
+Signed-off-by: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+---
+ tests/nsalloc_tests.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/tests/nsalloc_tests.c b/tests/nsalloc_tests.c
+index a8f5718d..d284a58a 100644
+--- a/tests/nsalloc_tests.c
++++ b/tests/nsalloc_tests.c
+@@ -1505,6 +1505,32 @@ START_TEST(test_nsalloc_prefixed_element) {
+ }
+ END_TEST
+ 
++/* Verify that retry after OOM in setContext() does not crash.
++ */
++START_TEST(test_nsalloc_setContext_zombie) {
++  const char *text = "<doc>Hello</doc>";
++  unsigned int i;
++  const unsigned int max_alloc_count = 30;
++
++  for (i = 0; i < max_alloc_count; i++) {
++    g_allocation_count = (int)i;
++    if (XML_Parse(g_parser, text, (int)strlen(text), XML_TRUE)
++        != XML_STATUS_ERROR)
++      break;
++    /* Retry on the same parser — must not crash */
++    g_allocation_count = ALLOC_ALWAYS_SUCCEED;
++    XML_Parse(g_parser, text, (int)strlen(text), XML_TRUE);
++
++    nsalloc_teardown();
++    nsalloc_setup();
++  }
++  if (i == 0)
++    fail("Parsing worked despite failing allocations");
++  else if (i == max_alloc_count)
++    fail("Parsing failed even at maximum allocation count");
++}
++END_TEST
++
+ void
+ make_nsalloc_test_case(Suite *s) {
+   TCase *tc_nsalloc = tcase_create("namespace allocation tests");
+@@ -1539,4 +1565,5 @@ make_nsalloc_test_case(Suite *s) {
+   tcase_add_test__if_xml_ge(tc_nsalloc, test_nsalloc_long_default_in_ext);
+   tcase_add_test(tc_nsalloc, test_nsalloc_long_systemid_in_ext);
+   tcase_add_test(tc_nsalloc, test_nsalloc_prefixed_element);
++  tcase_add_test(tc_nsalloc, test_nsalloc_setContext_zombie);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index f78d9a8a60..151720a9e3 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -49,6 +49,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32776.patch \
            file://CVE-2026-32777-01.patch \
            file://CVE-2026-32777-02.patch \
+           file://CVE-2026-32778-01.patch \
+           file://CVE-2026-32778-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.43.0


