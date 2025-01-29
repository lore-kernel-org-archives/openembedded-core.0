Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCADC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:58:27 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web11.17507.1738169903311885592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UWoMavTe;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=UWoMavTe;
 spf=pass (domain: arm.com, ip: 40.107.104.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DMzGmWUJqOSdlJtSqz2GD9tZiFXtYtkE9wZMvPfb0B2zwWgmF0dH4whg9foJ3gSojnhWx2DQCq4efi/VL1ETm1SUfaYSGETmMuKP2dARLe0ltmvf86/k4U38ipd7i5L1ld/W5kfnhQgoIrqBmTxJ5PVuV2PApLdff5TfwTUP7gqeCJuqmCnIrxt/UCc24uyXzbu63aZRFXocmwESRiJo17T4c4SFHzsiGL1naOGLLh1p7Wxs3x2fPkqgzEwLs7I4cUS9EWqivhKYYfGnN9g95VWMgPXxOS2SHgqs48RytycK7Zt8yUnnjnLard8dkFHNxX6fLF2+n2lO5H4poMi+4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/2Y/fDtQUh0QuHOZwFSKSC/lEsyeMEHYXfjkM/qnNM=;
 b=Q1jvY8gt3Ks1WDrS3rZ/s/hkaSAz/nycHDwpHP6eg+5iA1szyZvBXnzgf+Yps4bRUL2I/Rt9j37XlvRtbde1SSMTDGsp7m+KPxty/AQxI66PdlBFue1XUtL7VyCndycqc3UbWycsTFvvXmQOzyP1+0b7+T6TnzPETN+Szwr8T/WfXNb+vmy7lorbC/44bRo33zNwgUimt7nCUQvkw6kqnbqN0MciBuCcZ0DukeRT0VMv1WECAsysvceTbozMFyY6Qw9SnQ2RrOrQB7Aeqw35GnH6j5HN3LU+2VjYeShij1RRb5XTBO9Wie/UKDuLGE/T8eYnsYqu1XLKuCdOJ/LtkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/2Y/fDtQUh0QuHOZwFSKSC/lEsyeMEHYXfjkM/qnNM=;
 b=UWoMavTenbIPkIpZIva15Rd8P2DPTtPXfd3Vnmk/AhPmnBwVlzBgAIE8wpMup8zIPCvIQVu19aSC7wI+laHwJcQqC7pNcq/HNTzE3Y3rZOOyjWDx9zKT7ZN+brYF+GEgR/RiKs0Yn3OWfIVjCbecmdIWtEEcV/rRPHO2g1s7fIM=
Received: from PR1P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cb::15)
 by PAWPR08MB11141.eurprd08.prod.outlook.com (2603:10a6:102:471::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 16:58:19 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:102:2cb:cafe::be) by PR1P264CA0039.outlook.office365.com
 (2603:10a6:102:2cb::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 16:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Wed, 29 Jan 2025 16:58:19 +0000
Received: ("Tessian outbound 5438980c8758:v560"); Wed, 29 Jan 2025 16:58:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24a5f43791e292a2
X-TessianGatewayMetadata: yIDXxT7Iw9nMbC+iTUhCeXfVlZw56NV9C42LghfaTIyzuWagu6AI4iglk1KIXL1spCXvBcUfjLc43QPRqEBDiH41nxddonpmBc+G/DyHJh0q86ZInlj+T1lHIs5l4XfkhVcXfEnWIo2MxYeEOjZ41Ns/RQPvPsYY4qRJGtayL5E=
X-CR-MTA-TID: 64aa7808
Received: from L49a10f4b0708.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B52C974F-B45D-4A6B-A0F1-1FB0DC494946.1;
	Wed, 29 Jan 2025 16:58:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L49a10f4b0708.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 29 Jan 2025 16:58:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbOfSG72I4P0REQ95YMLTroKHQrkGl+CvO+Xt8+GLeVMXizMlobTAP94Yp+EPcyoQaBMrr5NKXJbjbQ8A2272QbXGxMIHIk8sq/qMPXeHCn3Jeg6QMr3vEqwaOj0Kr7EKhSN7TRHOLQh91xdiItb3ovv2CX5ecPs6+ayqGMuYdl1BnIa1Vt6oFrMVf9aOTYKUDdplYaIe/zMZEukJffCNT2+2aynXnOP6gQ9fWCg7WDnmEO0NtFXXCiEu6YxbzQjHXV690oQaUGnrjMWrXhlbEmBs2WFW1wMDzHUswwIlMSz964kLSTG+kmQTIVHjMX42d+BsYMx4yfJe9taDDfV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/2Y/fDtQUh0QuHOZwFSKSC/lEsyeMEHYXfjkM/qnNM=;
 b=fTHE4mMHmTP+y9K6YZMpDxgu1GgJHEFD35mL/GiDsE2SZy9/hcvE6xGZuLFmN2ywjJ7IjFBY3/BoRco2uD8bi01dsXrtdrY3t9KEN7ynvsKoEMl3X+8/VV43XkDCaZp9WF7WxNTcxDreDX5p8Ew8WUOaYGHzrOGMydX/une4q2jmLKaTH3Dcgu8PG75S4t1Wi0z73RJgiT0JicN7ryW2PPj3FXVs+zZl4pZ4C8z5LT+LftFgo9d1qpF4Tf30VqYZEggUrXfTMfw/u0NU/xgOMi4+/Min5N8PVGuDgTWn1NjUWla4Jfk9sp7kJvW0ocTqgrhhfUbNCCAC5AJL3V+i0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/2Y/fDtQUh0QuHOZwFSKSC/lEsyeMEHYXfjkM/qnNM=;
 b=UWoMavTenbIPkIpZIva15Rd8P2DPTtPXfd3Vnmk/AhPmnBwVlzBgAIE8wpMup8zIPCvIQVu19aSC7wI+laHwJcQqC7pNcq/HNTzE3Y3rZOOyjWDx9zKT7ZN+brYF+GEgR/RiKs0Yn3OWfIVjCbecmdIWtEEcV/rRPHO2g1s7fIM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5656.eurprd08.prod.outlook.com (2603:10a6:10:1a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 16:58:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 16:58:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/9] multilib_header.bbclass: need multilib
 headers for nativesdk builds
Thread-Topic: [OE-core] [PATCH 2/9] multilib_header.bbclass: need multilib
 headers for nativesdk builds
Thread-Index: AQHba+JDDs8ojFFvEEuQioCzyk6yTLMuBiMA
Date: Wed, 29 Jan 2025 16:58:10 +0000
Message-ID: <3AEDB7FD-6C36-4B80-9E24-0030B4A54E47@arm.com>
References: <20250121085526.1370937-1-hongxu.jia@windriver.com>
 <20250121085526.1370937-2-hongxu.jia@windriver.com>
In-Reply-To: <20250121085526.1370937-2-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5656:EE_|AMS1EPF00000041:EE_|PAWPR08MB11141:EE_
X-MS-Office365-Filtering-Correlation-Id: aec369d0-13e3-4720-89f2-08dd408621de
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Q05SaEtYWHFmTjdLM3hNYzU3eG5ZbWx3L3gzYTZmMEdmOWtIRWQvZ1ROTUNT?=
 =?utf-8?B?eTZLc3JRSSsrYmJ0MVRQWVM0NXFIZHlWajl5dURabTZkZ3Q1NVNQU040RjJt?=
 =?utf-8?B?cFRuRExkalpDay9UY21JVmJtMkUzZmpCeWJCdnRkc3VQNlNpa1dzZ0FUVWN3?=
 =?utf-8?B?RW80SzNQSVJrU0huVTdVNllqT1JtZ1l5S2xEOVFVcjUwNkxTQkU0WmxtNURu?=
 =?utf-8?B?MVM4d3cwekNaNk9valJHRUdFbFNHMnRYTk1tb0Zjei91eU9GZDFKSmhKL2Vx?=
 =?utf-8?B?blUvRHNiUHhMbzdqVzhQZHg4anM5VGZYZUV6bzcvTFZuMDZoTmhOODdsN003?=
 =?utf-8?B?MUtrdE52UW1zTmdmYmIzT0tMUlZmSllMY21RVDU2c3hQQ3M5ZFBXcm4yUitI?=
 =?utf-8?B?eFNnbitYM21Gc1RjY0ZpK1o3K1h5VXI5TjVuSStsdnZ1bWVTczM4UUUwc3Vs?=
 =?utf-8?B?aVVTTDNmeEx3dll6OEsrTkVZNThVU3pCOFljUDlnemZ1Z01zbUFaYXozNmNK?=
 =?utf-8?B?UFlTS3B2NjVTUWpJNnFYNC9majh4SVNzSjQ3aEE4RndwS0Exc3FvYTllYjlQ?=
 =?utf-8?B?M2NGR29HWDVvMVRuVDk2ak9wYTdUWEdFamEyeExhSFJlTGYwdWNJVnNYV0Jw?=
 =?utf-8?B?aHNVN2lPblJ5OW9JQlArKzlMd2JSSUhNeEVBc3UxR2ZMeEZBYytjZ0ZjbXM4?=
 =?utf-8?B?QzY3aDczRjZqR20wdnJIVExiK1hwaG9LQWdmdE1ya0JXTi84WThCalI1MjB3?=
 =?utf-8?B?N2dMNFNJeXFaeEl4WmxPY3ROZVV5NW0vZm9nQWRNdTF1eWNvNVNGTldEbkxw?=
 =?utf-8?B?SWRJZXR3YlVCYmhVY3BiRXdvcUJDUFJCU3FYeWNzWkVmVitmVWNXT0QyQ0hF?=
 =?utf-8?B?SjQyKytEM0h1aHBVNDA5SW9naWZmdWYyQkZRVHRRVkdMTmNSZ05qdVFFcGNL?=
 =?utf-8?B?RUZ2dUlLV1RsZVlhVjhSeUtWK1FCNmtZekN3UERadEV6cDh1TjNhT2ZYa2Q1?=
 =?utf-8?B?NGFRYmMxakRFZTlRZk9SNENwZ2NDNGRVZGY1VzFIMm5VQ2UrRmhOTzQ0RkJ3?=
 =?utf-8?B?djBVRWJrbVRndEN2dW1CZVhCdzhEekxkNVJ3SDZpUmdraG4vUTZLZU5iVENV?=
 =?utf-8?B?RmRVUXBKZXRPV0JsWHIvRGIxSUt2NUV5ZEdHcVZOTDVyMGFsKzlSS245d1I4?=
 =?utf-8?B?SzVoWUIwRlRqZzJXOFU2c2twdGthZGcveFhtRjBDVkZWNTZxOXljdUlQT0Ni?=
 =?utf-8?B?Vk9JODlTVkVLOGpyV1p4aEJPYXNMRVRkZWUxZmNpWWx3ZTk3cmVaK0xnV2Ja?=
 =?utf-8?B?YmpOcW16N1dIajdZdlZDQnpLNjgweGswaG8zZmcrYThKMFByR0l2dEQrZHZQ?=
 =?utf-8?B?L3ljcDU1L0tJMVVtTU40cmJpQVdKcUxHcEJpckpqdjM0YlE1QzRIaFdxWkdu?=
 =?utf-8?B?Qk1WcHdYV2ZNM1cyQ1JSQnBsZmN3OWlWNURLb294M2grMjJpZmJvcHNIZCtN?=
 =?utf-8?B?Tk9VaVRUQ3gvQ1FaYlVQUVY5OExlU3Rpa1p3UHAzaStWTndSTThHNDdIUHA4?=
 =?utf-8?B?YU9DK2FyQmIyQU10N2RNTU9ZNTMwUEtOV1MrZCtsUFpQOTRkMytkcldTT0VD?=
 =?utf-8?B?SnJZdkJNZzVVcmY5Ui9pYTFxdzNlcHNUSjk1WHpSQWNnditwYVBaNGx3a2do?=
 =?utf-8?B?YlFCWmp2SVhzYjF2dlFnNCs2dnpvdVFKdnBaejIvSm5NNm5vUTYrcVh4bmla?=
 =?utf-8?B?Q1FESHYvWlByQUlJNXREc3NiTUx3YXJ6OVFNaThxYktwSkVEejQ4NDlva0Y3?=
 =?utf-8?B?Y1l2UFMydkkwMGFxUDNRYW1XTHVTRWFBY1NRWVRXS3EwY2NxOGxhL0N0aTlR?=
 =?utf-8?B?YTIwd2hXcnpZOEFHTUVxaHRzSVhHaTJNYzFNVkJMcG02L211QlNNR1FUeUpy?=
 =?utf-8?Q?in9hL8jqFPR1qYkdHYqWzo8fhsGXu8BP?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ABB9D4057AC7A408369E571B8032DD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	391a0ecd-5d02-4ede-e660-08dd40861c8e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TndLSitpSnpzbWlmdFhFeTFEaW55ZStLMllpbzVkODZGa05XeTlBZEhBMzNV?=
 =?utf-8?B?SmZmU3EySElqN21ncm5LckZadW1hdGJXQ0tDb3hWL0h1ZW5YSzgzdWQwMW9K?=
 =?utf-8?B?RFVHc0VWditrV0pOTDBhUW9JU1pCUlBRc0pkNDF4R1lUeXVHakE0ZkZyUXF6?=
 =?utf-8?B?NUg4Tk1VdGR4YlVjYXluWXlRUUNIVzkrOTJFSWNjVGZUMEtnNkNUQmxlUERh?=
 =?utf-8?B?SU9TTENDMmcyUCtZTVRqUy9peXQwbFo1bzhMR2dKZzFnZHVKakdIclpmRmxh?=
 =?utf-8?B?RE9yR1dwTjNKZjNrRUZlQ1c5b05POEFhc1ljVjdPRUt3WEt4ZmZwV0xoRlhU?=
 =?utf-8?B?amlRZGVKS0RMeFdsTHRFMEpueTZMd0tHVUM1SndHNHk2MThzRVk4NzhtVUlZ?=
 =?utf-8?B?cDBkNTErZGQ3cWtORkVQelU2SjJUb1llUWlvQkc2Yk9iVWdXaHBQUnMxSVZ5?=
 =?utf-8?B?VjVYL0xaNVk4M1NXRTd4NWZzN2NXZzRKUkxKWDh3c0k4czlCRjVmaFdSRmto?=
 =?utf-8?B?Qm92NGVaT01ObmZFRjBQRWgwYUUvTktLbmFvd1VLM0E2c2tLbXJnUktQRUN3?=
 =?utf-8?B?WFNXZ3VxQU5FbGtXS0dmUzNIeDZBVzJtTVJ0anM3RzVGdDZVbHJaNzg1VmJD?=
 =?utf-8?B?enUxT0lML1JTTk5KSmVpMnBndWpnbXYrbGZhMktqeUJoczZUVi92cXQxc1I3?=
 =?utf-8?B?ZEVSTWJwZHNNRDdaUXczYXRWcVJ0RTZUZU53NmF4N3hLdXJmRmdvbGFVQnJx?=
 =?utf-8?B?TFhWS2dJbmIvZ2pMOU55Nmc1S3FWWDdCZzMrbGQyZWJrczMzVmJGbFR6Ym9K?=
 =?utf-8?B?ektEMVZiNnVmeWhrWFc2akwwcGJHcnlJQzFLdTBwa0wzS0V3RG40L2pvZElK?=
 =?utf-8?B?R1YzSk5nREM0eTBiMDk3OU1xd2tac1VZem9PcTEvOVAyV2VWdVBCd3NRR1lW?=
 =?utf-8?B?b1VlZGJpcE9HQkZ4Ym95dXg0WVNTSkI5VW8ybEVxb1l3c2JXc3lOQmxYYzBh?=
 =?utf-8?B?Z0QrTEw4eVlkbUcwZEhTRk1MQUNHQWlFaXN4WlFBNGZJR2VSNDk1OWpORFcr?=
 =?utf-8?B?Wm45UDZ6THdCeEVMS1o5MlFMajlPamVTb0NPakpLTkdqQzUyQmlMRXlwbTFj?=
 =?utf-8?B?MG03SWhsVDU1YStad3ZraFpZK0dYbDZZTWhBNVByMjAxOVhtU0FjdTJBRDNU?=
 =?utf-8?B?OW5zYldHcXY1clFFRTFHMklmUDJybTU3Z25Wa0ZMcEhJdndNbzRHWkpmYytn?=
 =?utf-8?B?VS9YV2JyR1FvQkVDRjU1V1AzZW9TNWE3L0lic1d2a1ViNHpJVWJsdk5DK215?=
 =?utf-8?B?bjRFNEdKRkF3TnRzZk91QVRmYllsaXpCMEtNTkMzVFlpYmc3RjhRcTBuY1Rk?=
 =?utf-8?B?dllaRnFlYWZjajBnbEorRy9wVUJWVk9rcW1rNmtVTUZ6OW92Ui9EZ3F1ZUFn?=
 =?utf-8?B?WEFjZU1pMGFsbkFIeG1KRDFFa1c4akZSbTVueEdyZmZIdlVMZk9ETTUvL0c0?=
 =?utf-8?B?ZnRSSWgvSDFYcHZDTXNDVjQwUmE3TnhYNGZiYzBRSXpVVzB6S2Y1Q0s3M3hE?=
 =?utf-8?B?QzJxRXFqMURjRC8xWS8wRUh2N2ErSFhpY3lBUW1FcUlOL2VNaUN6SlpZeDFy?=
 =?utf-8?B?Y05lNGlSSVpkZ1gvSDd0OVp3bnlEWjdDS1pTaXRiV0t4Q2l1a1Ywend4OVpG?=
 =?utf-8?B?L2gxa25DNS9OeXBVWHFDSUp1RkJxSk5rNXJLQjEvU1lneW9NSXdoK053dDBz?=
 =?utf-8?B?NkhUY2NFb0RCejc5WVFJZ2RiTVRtS0lGRWJITHRIcG5nTGtjVldpaVFpNUZY?=
 =?utf-8?B?T1YydXF0R3gyUnd3ZWdnaGkrbkRRalMyU1U1b3QwaWJJRHo2QVMrb0IrOWRE?=
 =?utf-8?B?RkRUWmx0a1Y1MWRROFRmL0xOeU45ZWhOYmpHeTBXdmtuNE9hdmQ5UXZ2NU90?=
 =?utf-8?B?NmQ2REZzamF4VEsxbGZ1OFV4QnF1SFVLdk9DRWd4RTgyQXU5SGZFb0J0S3Q3?=
 =?utf-8?B?eTBiQ3cyNWhnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 16:58:19.4037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec369d0-13e3-4720-89f2-08dd408621de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210393

T24gMjEgSmFuIDIwMjUsIGF0IDA4OjU1LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IFRoZSBuYXRpdmVzZGsgbXVsdGlsaWIgc3VwcG9ydCByZXF1aXJlZCBpdCB0byBm
aXggbXVsdGlsaWIgaGVhZGVycw0KPiBjb25mbGljdA0KDQpTbyB0aGUgY29udGV4dCBoZXJlIGlz
IHRoYXQgbHVhaml0IGFwcGFyZW50bHkgbmVlZHMgdG8gYmUgYWJsZSB0byBidWlsZCBuYXRpdmUg
Y29kZSB3aXRoIHRoZSBzYW1lIHdvcmQgc2l6ZSBhcyB0aGUgdGFyZ2V0LiAgQnV0IHRoaXMgZGVt
b25zdHJhdGVzIG5pY2VseSB0aGF0IG5vYm9keSBoYXMgdHJpZWQgdG8gYnVpbGQgYSAzMi1iaXQg
bHVhaml0IG9uIGEgNjQtYml0IG5vbi14ODYgbWFjaGluZSwgZm9yIGV4YW1wbGU6DQoNCnwgZ2Nj
OiBlcnJvcjogdW5yZWNvZ25pemVkIGNvbW1hbmQtbGluZSBvcHRpb24g4oCYLW0zMuKAmQ0KDQpT
byBpZiB0aGUgZ29hbCBpcyDigJxidWlsZCBsdWFqaXQgZXZlcnl3aGVyZeKAnSB0aGVuIHRoaXMg
ZG9lc27igJl0IHNvbHZlIHRoYXQgcHJvYmxlbS4NCg0KUm9zcw==

