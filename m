Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1DFC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:33:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.40])
 by mx.groups.io with SMTP id smtpd.web10.40824.1753104786711576421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oPtVGIGx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=oPtVGIGx;
 spf=pass (domain: arm.com, ip: 52.101.84.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dTbvyj7a8gKfvX039ev9g0U853CYRAQWl6aMaO6F2a/Y9qvDEvZbVM1iRIGibOnFDCvzFFJggKdQU9ol72PFEMd21wRFVSAn8tQJc9pH/wUHqVoFYtFxz/KK9FhAc2R4t1cExON3TipmAEJ4NfBFW0zrgMdivsgObu2ORSnCgP6TUVOa7ZC4vOtex8TVYqnTBmR2XY7+OXfJwFd2+twsQIiTq26aNQvlzPHCXTXnvXUQ53xwbh0A3oc2hcG3ZTJcdznombxEl7Y3LeSpb1J5jM6D7flJ1qj9dCKNYCgFbWc7YNGfch66/X8ImhWrpYGQRkBR4MnLSGIxyQc9ouwk/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8ViQBkjAZoYxnOYuGE/MMpyHh0DhITWgzEocWaZbDQ=;
 b=W2+QlW5qDtnaZEnz/SKXU9ORswPZJVhD4Ba+xmqzCoDho7JTXktO+9VMmB12uVt/0Rm8QP+9aS/APcSuxbFZ/YljZzICJwKmd+rKfjQXD43l243NkN4uPxlVWxp2VGzplkVgrkjqlODe0HnrnvnqnyxA1HvRA610kwNmqlIjaIrf0qJU896OfPZKa73tB3Qm92V+YWmro4qYUaKRut3lTxPnc3St97mLfq4cid3KymbAL/6aYHOj0RnUptuZUnFa3qg2SLbMPRwAMk3G3/tP9RW3XfDHsKRYCxaBFXAsSG4ntQO0T1h3l/5XbVpt5pTNZQKA3AXvsntRhoBRVWs7QQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ViQBkjAZoYxnOYuGE/MMpyHh0DhITWgzEocWaZbDQ=;
 b=oPtVGIGxQySDpKPqp8CmNTAZWQP4R+93OUn4OnlsVxAjERUIDl81vdeeoASu8UGFGYfF4V5TklZ8ZIwrAvKE+g4R8zPJIocgLdnDNat+hdcTcymIzrbnGkadEXNU+3Yz+6W/bnAcDAu+3BQuw6Bctd0/YCkfIxYuI0pFVw3hBaA=
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by DB9PR08MB9540.eurprd08.prod.outlook.com (2603:10a6:10:451::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 13:33:03 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::9c) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 13:33:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 13:33:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8VzmGPTF80TpC1eks/IfCYrdVSUDMKJv6wfoj1mJxQIZ6hteMnRPWNSo0Tcyxhslmz5hU8v3Ibl0Vk9aIVmryWsHsDKEBgQ/NrjNd4BKxsDYsup9S/lBGtzxwyMZKg/Ip1sEs218P8Hh1RMkKea1Smlmx6A9yYQy9CG8Sav/vtTx+zr6iE+OwlliKu4gziNa5ibzJdjEkpT8hd1jtKrscQvGDQvS4HUXTbkdIyyAkwZphDAOfyGBEfTy8kaMnlySZYccSMXoccILrwNOqrbZgob8SkqZodxBS+iZzLQbnSWca28hTPXKq2eT1PvSGBvhIXkKFqZxa84nwBTk4r7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8ViQBkjAZoYxnOYuGE/MMpyHh0DhITWgzEocWaZbDQ=;
 b=sa91orvIxwg/XmKV/OAsCC2ExU+qI+ePV74JFV939g7UdEPv/OemckEzFsdNyxke2RKfGq/Oc8ZsAffAuXF4gE3DhSJYIscam/yVLpKtHDj+N+/VPyF2CAOpK7c5xzOVhpdwSK5b7KQs7T87Mrl2WIRMQnVhLWbnH1y9/Xgz105Rcr/RUC0NP5//rAWK2KGr4LTpYxicO4GoM777/0Bq7Ax6wnpZiQ3ebySyFc2AT4nJ9qnhf3NzRGJgno2GN+t7fkWxQAnoi6vPKnlhrlAsv2tGIyjzQErJuCDg5tR01AnzXZPT0/RVxkkY3qKue5hL/H1d6/DsucoEeK59fuHhlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8ViQBkjAZoYxnOYuGE/MMpyHh0DhITWgzEocWaZbDQ=;
 b=oPtVGIGxQySDpKPqp8CmNTAZWQP4R+93OUn4OnlsVxAjERUIDl81vdeeoASu8UGFGYfF4V5TklZ8ZIwrAvKE+g4R8zPJIocgLdnDNat+hdcTcymIzrbnGkadEXNU+3Yz+6W/bnAcDAu+3BQuw6Bctd0/YCkfIxYuI0pFVw3hBaA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by FRZPR08MB11097.eurprd08.prod.outlook.com (2603:10a6:d10:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 13:32:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 13:32:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] systemd: remove 'serial-getty-generator'
 PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] systemd: remove 'serial-getty-generator'
 PACKAGECONFIG
Thread-Index: AQHb9fzPVWcp0NOovkuthBGcGMnNibQ8m8gA
Date: Mon, 21 Jul 2025 13:32:28 +0000
Message-ID: <B4A15273-226F-4688-8BF3-71E1956F4949@arm.com>
References: <20250716025258.738590-1-Qi.Chen@windriver.com>
In-Reply-To: <20250716025258.738590-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|FRZPR08MB11097:EE_|AM3PEPF0000A799:EE_|DB9PR08MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: 528ccc4f-440b-4fb5-9dc9-08ddc85b1ce3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cFBZdlZKQlJvZXBKN3QrNjNicFpVUlZNd1NOUVU3VjVNblpxQVZCYnp5UDBh?=
 =?utf-8?B?L0hGbk02K1ZIWFdRaG9wWC8xa09HL3ZOSUdPR3NmRVhnb3g0YkJsZ2tNKzVv?=
 =?utf-8?B?MGFUVVlEZTIweHhtZTR2by9JTnhmWFhnZHhsTU11cDdBV0o5eEY4K3dqa3dT?=
 =?utf-8?B?MlZKcjdOM2dpdjdmcDlFZjJSb3JSdlMySEZPVlJvc1dvenVPKzBpa2t0NkVJ?=
 =?utf-8?B?ellmRndlWVVOS2Rpb0l0Umh6SWZsWlhhTkdPMnE3OXFlcjVVeDFMWjkwcjlF?=
 =?utf-8?B?YVlxZDRyMDRqVklKV3MzN29kdHROWGNUOVdYV3NpZmNmL0M5NDhpVVJFdWFo?=
 =?utf-8?B?UFBjYU1KeGNnaUtDYUtPY2d1UFBMdmtWeDd0d2ErWU4wSTRYdjFGalZyL1la?=
 =?utf-8?B?ckpYQWV6cG9yRjdnY1JTemk0YmowcUhPS21jM0R2THB5Z3BOTzFqYWQ5NVZu?=
 =?utf-8?B?bW9MUTBvSXF1K1J6bGRpODZYMTZCaWZXN1hCY1pEcklSK1FiZzJjWTU5alJH?=
 =?utf-8?B?aXo0S3UwaEZLSFBUalQramNoeEYzdzBlY1Z1b0dBVHo0N0dBdlh3UlJEckty?=
 =?utf-8?B?ck1USHJyWkh1cHUrSXJEVnBKeEZKVFVsTTdtTmVKR3pGSE5tbUh3TnNFcmQ5?=
 =?utf-8?B?Q0IrenBPNy92Zyt0ZFltQjBMaEhJa3BqbGhORGhpUnpFUHh5ZXRxMVl1WjlL?=
 =?utf-8?B?MGV4S0t2d0dTV2gzZU5tOXYzQVh3QjNBMGQzT2JvMDJEQ0JGbGtHVllPdzdR?=
 =?utf-8?B?dkVBbVhodHF1SHJVb0pVVjRtYjV3NGFFYTN2TzZZbUtzSDJRZ0w5UklOdDRl?=
 =?utf-8?B?bnZVU0RQKzkzZTg4bzhHVXBndmMyM2JFZmNWRDJZdDBmVUlKUmljckdIMzdu?=
 =?utf-8?B?MFF0Y1hZc0ZLS2RiaUFnYVJzc3Z4cHhWU1c5MkloeU1VS25rVC9rNUdPblhY?=
 =?utf-8?B?T2ZpME0wYTFPMmpKTjNNZCsvcW5KRHhYV1JhRC9sbEF0RWdLU2U3QlRKNHRP?=
 =?utf-8?B?UFpYYWxkUWl0bUFXR3ZQck4wenZsSllUMEVlRXdqN094NXJEUFNrRlJBT1NP?=
 =?utf-8?B?STBGUE83V0NRSjlHTWN0dXNSM3RFemlYbWg2UDY0YldFVnpEWUJERDBXcm81?=
 =?utf-8?B?T1Z2ZzcrYmlQY2krWUsxT0tOK1NNT2cwZ05GNzJqd0FsdWVVejlOS1NVVVc5?=
 =?utf-8?B?VVBkaHFEbEtmekM5em5sR2FmenFUTERaa2JZa0s2OXFuZmk4MWpJSm5EeEs4?=
 =?utf-8?B?OVFPVnE1YnNQdUM2SnlXK2RVMzdiRDgrbUpRaUVjNStRQ1RuZEROQXI2WFpZ?=
 =?utf-8?B?L2hNa3RNbkFhUkJocXcvazFFSnpMVlZ0d1Vhdi9ZU3c0V1pDcjQ2M0o2bk1u?=
 =?utf-8?B?L25WN21WcnA5NkcrOVo4NlNITlgzUFpCYzlwWjROek04UkZoVUZpSWJOaHdm?=
 =?utf-8?B?Vmk0TUJGNWV5QlhGYkdkVUswMy9lZWwyQXVaN1I0WWhlOGpFRVdVNHY0NGV6?=
 =?utf-8?B?MnhyTDQ1QUF3OFdoNHhUTk40OVY2Tm1CRzFYNkJtSi9PY2x1bDk3M1cyNU9Q?=
 =?utf-8?B?R3RLWmZleWRianpTb3gyT0c1eWsxeHVlaEZ6MzRnRXU2a2ZsRnp6YTloNXFq?=
 =?utf-8?B?MWlJcnV6VldHQWtjYlByaGdTakYrVnZsc3ZZVmJKNFRFVU1CejBYMkxNd2dU?=
 =?utf-8?B?YSs0OVVqcEhaZ05reDdYem1PTzhLME9BaEZDL09pai9UWE1CMytaampvMGdV?=
 =?utf-8?B?SHBtdndJdFhXeTMyUEFhZXZ1dStvREUzM0FaSThoZFVOSUw4NFVneEE0Q0p5?=
 =?utf-8?B?b0hpSk1vVHdJU2lSTDhZNEM3VmNxMTN6VlhvNVVvam5Gc1VXNnhyaXpDNnA0?=
 =?utf-8?B?QWMxLzl3ZHNXU003RndtZlN2bDFOY2hNcUFqRFlkYkVnQ0ZSdjdUemFGU0ta?=
 =?utf-8?B?SEpXM3hJYjdJRk9sRjhnUVQzQnVZSmtVaFZBMTUyb2dCZlBKMFk1eTdkV05G?=
 =?utf-8?B?WUdvMFhueXpnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <24D0EDEAE0A9E748B54BA27403AD05EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11097
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aa228075-4cba-454e-c7ff-08ddc85b09c7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|14060799003|36860700013|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VTJscy9YMkMyZDlhaWoydVFQTWpYdEptdEN6TFFpRWhpRzZBandiK2l3TVpD?=
 =?utf-8?B?UlZIQ1RrS1llemR2Q0tKbURvUVQyWVNSTi9tWTJ5V1dYWWI4dE1ZdThNNlox?=
 =?utf-8?B?M0lONjUzbE5GMDB0UjNpYmhwZ2NzbHlaU1J5K1FoWWVOR1IvdmVPWFlLcXN6?=
 =?utf-8?B?SEd0bk8rQjlvRzFXb0pWSDl1NVFDZ0NPQTM2eWtaYkdwWUZXUFVKWUQwU2RO?=
 =?utf-8?B?RUlWZ3VZTUZYL0NvODVGYjRJRGdWZG9abWtXYmxJem10UWNReDJEVEpSNzFj?=
 =?utf-8?B?K0Q0a3hlSnViejREM1ptUGRFMy9yeFZYSHJZeVJWWWNNbmoweTNrbFhFRHZl?=
 =?utf-8?B?MmJWemluVUNGRXlWUFRSczB6VmZtazF0NC8rMGJQTzBlUzM2OGxnMVg4Rko4?=
 =?utf-8?B?UmRzZ01LMFc0Qjd4TVpUV3ozWXlXT0xTSGV6WG9WYnBtU3hmcEhuTkpyUlhB?=
 =?utf-8?B?U3A2blYzeUVxOW83c0lLSWdodUdnamdNZGtHUkxobEx0ZUxndGZJaG95SnNH?=
 =?utf-8?B?YTMyS3IwRE5nMVFrQzl3T05DaTUyYzFzNEwvcmhlT0s0emRJU3NoaFZoa3dr?=
 =?utf-8?B?Zi95QWM2SEFWNXNRM3BVM1dUaEN5QnhFamRjZkpoM21wSzZZMmVxb3BDQTRK?=
 =?utf-8?B?blVRQ3ZPRXpzZGJXTmJDdUJ3U3JPTlBPRis3cS90eUZwOFZxdlNNU0ptdzVm?=
 =?utf-8?B?QVNNNUhtdExDTldlK2NMajlqaTJHSDBUMXNoS21nQ1lKWk1BeUptUDFEYmZm?=
 =?utf-8?B?OThvOXdMb3VMeVlWZ1VDdDVYRzArRUNCSDFid2FFZXJXcTgrSkZMK0RXemQ5?=
 =?utf-8?B?YjdoWDlIYmdXS25yZng1RXN3Y1daSzB4aWF4ZFgwbE41SXVZMXJLbjYwc3dB?=
 =?utf-8?B?VWQvT2Joc2hqdGRNNlQrTitGWFZiWGQzWHJEZCtoQkN6ZGtiUmdoQi9HVHBz?=
 =?utf-8?B?MUJxdFYyYUFPQ0FIYnRWTWhtUTJtalBoTHdxZk93Y3RtNXg0em9yRCt6elZW?=
 =?utf-8?B?OUlzY3hrUVF1TkRrTzh6eXZFOHdqKzhpM3VsS0c2enF0cldUdnFtOVZadFFI?=
 =?utf-8?B?ZjZSeUNOMkl2cjYrMEkyRlJpUG9ERWhDNkROVFVYMHZZcTdTYVZvVkdSQ2dT?=
 =?utf-8?B?SjlNVHRoSkZJdzhja1UzUGZYSkhqZzR6eWY5RnRGL1gwL0puSEYyL2MzZ3Fq?=
 =?utf-8?B?WnltbG03SFBMOVdOSFUvMGZYY0FlY2xnMWxzYnQxbjVNQWwvTHQ0empyaHpt?=
 =?utf-8?B?Q1VKWEtjcVhtM1g0YVluU2FIUVhJbzlDQ0cybTFUb3FHM1BjK1pRUnhwV2Jj?=
 =?utf-8?B?SjNXTEh2Q21XTm5kZUYrbGxyODVnL0xxS3FNdGtpODJ3OGxmdXl0RDhLWWp0?=
 =?utf-8?B?aGE2SzdnR3VoL0lVWERjVVhPY1U3RC9HQk56KzVQdjRuZnlqMkt0WVlaSXlY?=
 =?utf-8?B?ODVIZDZuMjJaWWJpeEhxQkg0emk0cmJLWmNlZ2Fyd1ovWWlDRjYwM2VIVjdZ?=
 =?utf-8?B?VGFCdVJYdFVXSTZtREhpNnBDcjBIRXhFaXloejh2QTdKRGJON2RkL1F6RUVE?=
 =?utf-8?B?eWlkSXpGT0V2cUZkVGRCa1JGNFBBL2dBQnNobzByY3doWGNRTzd0YVMybmlS?=
 =?utf-8?B?aEhKTlcyaE83YitWU05oMjBYMWdFdEZMRFZDR1RDa0VFd1VJYWZ0bjk2MVY2?=
 =?utf-8?B?VWszUnZJdWxCR29KMkU4bnQ1TUlVRGZLZU9BK3RQUC8wQURibmt1bEZJQzJK?=
 =?utf-8?B?SWlRalRhRyt4Q1FaOWZPNFIxTThZTXRsRVBUeDE2UFRXckt2YW52V3dUdWZ3?=
 =?utf-8?B?NWpwb3cyNUxxbk1oNDBVRURxMTM1MWlxbUp2Nkg4L2tnVUxSVmw2d1VmMjhX?=
 =?utf-8?B?c3RuL1pNM0ZnOE05a1Yvb3k2Mmlac0RMdmtvRmVVWm5HQnNpSnoxeGdkQUhu?=
 =?utf-8?B?Sk11b25ZOXBsWWpST002dWp2aEcyYUZEcm9OSjJFRkRURTErK3ZlaisvMzA5?=
 =?utf-8?B?T2FSYUJtTjRPdGlMODFMV3lhUlBBNkRPSHU3RG4vbUI5VFV2ZjVWYzNDTDVv?=
 =?utf-8?Q?DfpcbK?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(14060799003)(36860700013)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 13:33:00.8355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528ccc4f-440b-4fb5-9dc9-08ddc85b1ce3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9540
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220693

SGkgQ2hlbiwNCg0KT24gMTYgSnVsIDIwMjUsIGF0IDAzOjUyLCBDaGVuIFFpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IFRoaXMgUEFDS0FHRUNPTkZJRydzIG5ldCBlZmZlY3QgaXMgdG8gZGVs
ZXRlIHN5c3RlbWQtZ2V0dHktZ2VuZXJhdG9yDQo+IHdoZW4gbm90IGVuYWJsZWQuIEJ1dCBkZWxl
dGluZyBzeXN0ZW1kLWdldHR5LWdlbmVyYXRvciByZWFsbHkgZG9lcyBub3QNCj4gaGF2ZSBhbnkg
YmVuZWZpdC4gSGVyZSBhcmUgdGhlIHJlYXNvbnM6DQo+IDEpIFRoZSB1bml0cyBpbnN0YWxsZWQg
Ynkgc3lzdGVtZC1zZXJpYWxnZXR0eS5iYiBoYXZlIGhpZ2hlciBwcmlvcml0eSB0aGFuDQo+ICAg
dGhlIGdlbmVyYXRlZCBvbmUuIEJlY2F1c2UgLi4uL2dlbmVyYXRvci8gZGlyZWN0b3J5IGhhcyBs
b3dlciBwcmlvcml0eQ0KPiAgIHRoYW4gdGhlIHN5c3RlbSBhZG1pbiBkaXJlY3RvcnkgL2V0Yy4g
U2VlIFsyXSBmb3IgbW9yZSBkZXRhaWxzLg0KPiAyKSBUaGUgZ2VuZXJhdG9yIGNvdWxkIGJlIGRp
c2FibGVkIHZpYSBrZXJuZWwgY29tbWFuZCBsaW5lICJzeXN0ZW1kLmdldHR5X2F1dG89Ii4NCj4g
ICBTZWUgWzFdIGZvciBtb3JlIGRldGFpbHMuDQoNCllvdSBsZWZ0IG91dCB0aGUg4oCcd2h54oCd
LCBhbmQgYWZ0ZXIgYWxsIG9mIHRoZSBkcmFtYSBhcm91bmQgZ2V0dHkgdW5pdHMgbGFzdCByZWxl
YXNlIEnigJltIHZlcnkgY2F1dGlvdXMgYWJvdXQgY2hhbmdlcyBoZXJlLg0KDQpJIHRoaW5rIEkg
cHJlZmVyIGhhdmluZyBhbiBleHBsaWNpdCDigJx0aGUgZ2V0dHkgZ2VuZXJhdG9yIGlzIG5vdCBp
bnN0YWxsZWTigJ0gb3ZlciB0aGUgdXNlciBoYXZpbmcgdG8gY29uZmlndXJlIGtlcm5lbCBjb21t
YW5kIGxpbmUgYXJndW1lbnRzIHRvIG5vdCBkaXNhYmxlIHRoZSBnZW5lcmF0b3IuDQoNClJvc3M=

