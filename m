Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB72D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 18:02:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28059.1764612121439387790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 10:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MF1oq1Ty;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MF1oq1Ty;
 spf=pass (domain: arm.com, ip: 40.107.130.33, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jpHG9q1VSEFSsRPwH0lJJ5UfJCooZpYJLOGCUIEp+b+//hDz2tHzPQlEyRrlGiltrjoLX11OYfsqZvmylix5OPyfdnUImcKyZgTk9Cj+oJYV1sq+ULBhDn3liiIiseMKk4yJw2IYzrW04U5h1ndhx8fTZFblKIQXaHn4Xm3P2cnBf0HHEgxrIxmNkP5RaRTtSJtOeQOQhP3d9uYKRGArlmIerTkE/8lnWPetTlzLu12z4xj9yYIf+aITQhxzt2oRBdotx95SxnykIdhMbeUEr2MqdZ1vBl0U3znAXAOcP94z+eEuIn788npvHUdM0H2XQYOamGcavFKAjqKz5pHONA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8FODMcTY5d3mGc5StUo1r0DGkRsJI9wi0DkQLnmyZA=;
 b=POvU1kqJFbUCawl7JnfBFku+zKa2JiVgiOh4iP0wPCLuyXbXcEJSK2HYjJPhJdOhkCAw4679SmHd6rH/efEt57/wLps/ewpL6v+JcZ5xnec+gNAQClecV1AzRRwb6Bk9gmF2GidAq83UHGqYFXYVscasTIPjv6sEpSENlYvWOu3PpUa2RM5Wp4uHoc1+dxsYPVhi78YNCN+KlIyFldiKgLJCfS1pDycmkFLFVK7EyqrBMgbgr6DuuF0KbhEGHhY0FwDQlxCuMHjZHHMo+4xFeYh++5JgbIAZaIV1ezwGmG1tUo0pkG7hD4neTjaazg1UG6vrgqngtwok+qapBwIjVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8FODMcTY5d3mGc5StUo1r0DGkRsJI9wi0DkQLnmyZA=;
 b=MF1oq1Tyrmjll7mbGjin0wcZELb4d+iKEDeaC3g4Z3nytMuXhEiw06yU2tDjYf0muSNVovjDBnIlEEzA37guMQZEz+pN7pyn6fHaF/lfqGxBL8qMGCEQW+LR96TNNTsBrrf7n8Tpz3gJ9IApZxaGI7ePYst9f++Rfh2greYIhGw=
Received: from DU6P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::7) by
 PA4PR08MB7434.eurprd08.prod.outlook.com (2603:10a6:102:2a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:01:56 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::e8) by DU6P191CA0051.outlook.office365.com
 (2603:10a6:10:53e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:01:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 18:01:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEOHjzr82HyKPMhi5cXo1DtQB965JSEko1N8K02ePCexwDKLG8KZ9yNamBmXE3Ii/KOODdeVzgifgsMYd2IzRh+o0Gs0/R84rZmPEInMVOZ5ENTSecTjCD03f4j1/F/8OXTde6zNpRtIDnkSXYFmgdafKji+5DV4Ggk+dQHIwW/44VWrs6dOu6kjGAEIwuebSsnzEzHqfrfVJ9kNkvkCD3f/iHluZCqWNiGMRAWhe/WD2nP3bbr+VgIxUpoht3+sLFssfyv69bMQX70feJBhX6CK5FE+ppUoRDBX0jrtH+6GOQ9jTyURpcf5D1bAdvrFm5vY61cr/pvkv2lcBuaRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8FODMcTY5d3mGc5StUo1r0DGkRsJI9wi0DkQLnmyZA=;
 b=ns2ZYT7NjFne9hFTt7JsW0r12VtNnjEh6TQHmOH+3SV6AtSbMtf+uXqLjPoVPSBK34gflh+DBt7IYvKU8RG9TLaxTgyYNpnhJOGgcvY2AL1ch5oO/0mB3msZJr/xfaM6Da35ZBR+eNaBFy/33npDmBTfJYTR53eb4P8c1o3heo9hxU65h38h5YAgKRUkg2rz5Y9NsqIfmaj+RQ61eG9PvQBVSkf9QL/k7TYyEYiD9AGFe2qHQLFXd4R9ST463QdQDlD8dZZmLofurrGDqR/GnJvmARS+YzejUeoQuTB66WWCau38ah/ljXWvFgtAo1Qlt0iuG3qkcQ/JSni1ChcrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8FODMcTY5d3mGc5StUo1r0DGkRsJI9wi0DkQLnmyZA=;
 b=MF1oq1Tyrmjll7mbGjin0wcZELb4d+iKEDeaC3g4Z3nytMuXhEiw06yU2tDjYf0muSNVovjDBnIlEEzA37guMQZEz+pN7pyn6fHaF/lfqGxBL8qMGCEQW+LR96TNNTsBrrf7n8Tpz3gJ9IApZxaGI7ePYst9f++Rfh2greYIhGw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8830.eurprd08.prod.outlook.com (2603:10a6:20b:5f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:00:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 18:00:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 2/2] mesa: drop freedreno-fdperf
 PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH v4 2/2] mesa: drop freedreno-fdperf
 PACKAGECONFIG
Thread-Index: AQHcSZP42GF9NrWLZ0a8obm1SxyrSrUNRaYA
Date: Mon, 1 Dec 2025 18:00:50 +0000
Message-ID: <C831BC71-F6F4-4D2B-B8C7-BDE128F16745@arm.com>
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251030115415.2566247-2-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251030115415.2566247-2-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8830:EE_|DB1PEPF000509EE:EE_|PA4PR08MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: 11661687-99f3-4e2d-4a6a-08de3103b6a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z1V5RzJlNXltaVh6OWx2T01tOTJ3eEQzZ2h2WDJKS3RWbGZBREZkakhWaFh4?=
 =?utf-8?B?ZkhIVlcyb1dJbkJCeFFYUU1GK0RUcDJjdk9qWjJYSmQyU2M3a25DMFZuSyta?=
 =?utf-8?B?SVJzclREWTZzemtBSE9la2ZqNFU3Ni9YZnMzd1l2NnVDNHRGVFkxMG5kYmVk?=
 =?utf-8?B?NUdHaXh0em5ucUtITlVETkgzYmR2RlhiL2N5N0w5RzBLYXFNQmdOalA3NVRO?=
 =?utf-8?B?RGFvSTZoSHdNY09WbVpvOW9TaXJjcHdNWU83cVpyU0s4OVF1NE4zLytNcUQ1?=
 =?utf-8?B?MzJYRUJjdGFscE5CODllTXBDN2hRSDdUY2hteEhWbWpZU1U3N2wrWHduTDY3?=
 =?utf-8?B?ejdsSnpDdFJ4UEJISXJwV21CWW40bXRad1d5K2g5c1k2VFVIMTE5K2hpYzJP?=
 =?utf-8?B?Q1ZaMllML0J0R2xWSnJqVmI5bkFQb2RRalF1NTR4K1daaGNBR3RlNTQyMmNH?=
 =?utf-8?B?enVWL1lUdm1WbGY5QVNwVDBhWnN6Z3JMZEJOUEVERXZLeCt6WGcyUnVJaDY5?=
 =?utf-8?B?S01OWWdpN3M4YWhrRjdDY2I3QVI1STFVVkY4RWRWSHMwcDNMOERoY3JIRVB2?=
 =?utf-8?B?N3dSTndOSHpYYmtLT25BOGRmK3BVdUo1bnUzblE4eE5ydkR5cGZYZlozNFN5?=
 =?utf-8?B?TDlXb2czRzYxUEdHMkVsZVdZemVSaVUvVlNkOVhvdys1dHRROEVFa1lGODQz?=
 =?utf-8?B?Skt6UEJRRlk0UVMzOW9TOTZDbk9NTHlhbFRZQmlXczdyaCtvRTY2YlJYWm9m?=
 =?utf-8?B?aENyc09ya3o3NDIycDEvNmFQNUNuQ3Zob25yWWVlR2FXUlZtckpGMm94UlNU?=
 =?utf-8?B?Zlh0elJUT3hUM2haa01jS3cxZFNjRCtLMXZZMTVTaW1ZMFBWRTJCMnF3NHV1?=
 =?utf-8?B?cWxXZC9pUVlNUVN3OWsrVkpxSm9FM1JUZlB3Ri8vZG1NUEg1STVBS2FCVzZW?=
 =?utf-8?B?RitYOEhYaWRnb0huTGxJY1JZbk5yK1ZWbGkreHMrd3RNeXVIM2RwTHVEYTli?=
 =?utf-8?B?ekw5VUVFQnRBZ2NQSFQ1aFVGa2RiMU9wbmJkVjArWGk5b1Y4RlBvelBYdEdV?=
 =?utf-8?B?RXZ5N1FKSGJLcVF3emYybENERE5tVXJmWEk2ZEtFRW5ONjVlTUlKaWZzUEx5?=
 =?utf-8?B?TUtkSldLd3JCcEZ6bXNuWmZZL3Q4Yi9VQTd0TThmdGlSSEIraStaczVEb0JN?=
 =?utf-8?B?TDRaTFRMZkcweVp0b0xLYjVSdkhNTldRdVA5ODhNUHFDVUJjTkI2RVlJUWpK?=
 =?utf-8?B?SEY3cFcxY2trMGhjM1lvUEhjZHEwdlgyUzdJWm1VTmhqRkJkS1dJb2VtbE9k?=
 =?utf-8?B?NWgvVzZMNlhFdUNlQzhidktjUzI3cGhUb2hXY24wSVl5S0hLbmErcGFaNita?=
 =?utf-8?B?M2lGNEk1TVdUbjNqVDNld2dZYm1DR1VnYlN6ek91ZFVxcnlrOFpianR1eklw?=
 =?utf-8?B?NjduRXZudmt5SFkyOHhsb1dtdUJySi9aNlRBVjhZL0QyVzVucWJ6cG5NRmh0?=
 =?utf-8?B?blgxcTZ5bmpVcWd1MFc5bUN1UUlsY2M0UmNXRUVFN01jSnl0M1Z2OHlma3Zq?=
 =?utf-8?B?QWFySlFFWVhkMGh5bUlBUHFYR0JWWWhSVXJZMmdOZmdjbXp4c0ZJWi9VOStU?=
 =?utf-8?B?NXhlQy8xTTNlRXJvOVRuM1FlNHg4bGpzWlJocUJJUDNYUXJJN2VNcmUyc3Ju?=
 =?utf-8?B?cDF0Z3hDczR1UHRoWDQ3WXZPWTFxRG1wTm5HU01iK2ticVNpZ2Ftb29OVXQ5?=
 =?utf-8?B?dm1pMVdMUkJSbUJqbFUxMlBEeklXWTRaeUNrNG5jNmJEOGhtL2Z0cUFWaUcy?=
 =?utf-8?B?SUY0Q1lUaVg0bUFvc0hNK09vQkdoMndDUVMrWVZGSnpMcEVCMnNLay8ydmcy?=
 =?utf-8?B?VWtnNmkzNGxDeGdCTS9jUXQ1L29nck1lRngyK1RCanpCNTlvTVRWZ2c0MEk1?=
 =?utf-8?B?M3lRRFN3TDN6Z09aeG40aFVISm9HcDdQbHRnM25LK29Cdm9SOVhLYjVmN0Vy?=
 =?utf-8?B?czdQM2Q3WDc3UTNHYVBNVFlsdUdBUG5uU0YzN3lqN1hZbFBnUzNLc0oxNlQz?=
 =?utf-8?Q?XFg3hB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB1EE06F24FD2D42A3F776539A5C2C0E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8830
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	efb2e9d2-e2e1-4e76-2257-08de3103903d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXVxNUFqeW1ScEhjSnZ1WVFWWkdDWGhjdXhDZmpyVitScXlCSXZBRjBiaXBl?=
 =?utf-8?B?ZGhjamhQcUkxWjRFR2pPWDdaRllmZ3Ftb2o0V1VpL0l0SHV1cmF5cWk2RXF0?=
 =?utf-8?B?d2FEWCtyNTZiSUgvOWx6cmxQYzQ4L0UxLzZrSVFodHNXSDJYbUZaYWZ2TTJB?=
 =?utf-8?B?UFFLZHg4amR3UHlCM1RvN3NsNk9LWHJKNWhwVDRBTFN0dGFPREdHOTk4UnBu?=
 =?utf-8?B?Y2JJQVF6UEFQWFozUGs1SUUvTHVwcHcxbXBib1RXVnBSZjBIUHhuRWE0c2hy?=
 =?utf-8?B?WFIxZGl0cU5ESEhMbFNZVW9ibkdmMTFKWDE3Z2x1Y0tqeEtOdG8vbWVEQ1pE?=
 =?utf-8?B?OXVRWVM3aU1tTk10TE9Qb2NnbWgvOVhTbzFnb2I3dkwrZGNRRytua1p0ZS8y?=
 =?utf-8?B?UFdCalR5L3RKaTYxZ0d6WklBeTlleEZ6eFR1djA3MkdMeHFyV3RQL0FtY0FT?=
 =?utf-8?B?amlDTk9rQzFLb3NiVnhjcFR3K3pGcHJST0JaYkNhdjFWMlNDWU9RSE9UNHJR?=
 =?utf-8?B?S2RqTnVFYjFIMlpySzNab2IvVE9yN1RPS2ZHbHYwUmZaS0NqYllKUzZ4SUtI?=
 =?utf-8?B?QzQ5bG1ZQUV3YXIxOC82RmRYeEJiU3ZUcHNWQ21xOWRCWkhtbWJidmYrSFNY?=
 =?utf-8?B?VkhoK2I1b3U1cmJ1dlNtT2hoVHFEMnhaTWJHVlczSEVuSVJaWWozTk1zSFJr?=
 =?utf-8?B?clBGdHlDdWdzVzFRVGE3UGk0cXRDVXJqTGY0SlpTTlc1QVVad0VRT2pxNS9S?=
 =?utf-8?B?UzlrRlJCRndDeUxRQ29xUThzektaMmlCcVNjZWRqRXFjTVdSTjQ1RUhJc09B?=
 =?utf-8?B?RVZZQitXMC9KMnBCZnVOaDFjdXRQU3RaaWNmMGd5aWRHN0VyQlBROW9SdHgw?=
 =?utf-8?B?d3F5bkJXZEVmMmdQN011UFBINXVRUTdKdnFhbVdBeGVUWEZ4TDZvRUFEc21r?=
 =?utf-8?B?T0QwKzN3cGx4WmM3c0lncjdxUXo0a3RTK0hhdWZRVDZlRUFUM090bTVVYkE5?=
 =?utf-8?B?V3dBMGdHUldRblNTUHNQRjhDUURWWGEwTlNTR3I4dGZDOFBZNmJIck5iTUIv?=
 =?utf-8?B?eG5yaGRCL1R1Q3BtSUg5d2RzK1BOS2hWbldrRGtscXJIVlZIR0s4dUUwSHJu?=
 =?utf-8?B?bWR5aVVTVnhUUFdyV09vSThMNFp0YkR1d1R3blc2MWpIdDBoU3ZDWGJCRHh6?=
 =?utf-8?B?ZEdnQitKdDZ0d09lTTFibEFpdVhDZTFyYnlCY2gyOWNPY1pJRGtTaWdTczRh?=
 =?utf-8?B?bmpZTTQ4NTFXSll0ZHpVRG5Xdy9PNm5rS0xVU2R3aFhVRmNySTdTTm1sN21z?=
 =?utf-8?B?b2RjZUNucnUxaytQOUdvb0FQMXR4M01YZ0RFZlRpMnMrTWUrWlh1SS8yOEMw?=
 =?utf-8?B?em1hRTQzRHFDL2pKaTh3UjNDc2ptOFcwUE5hanU1Nk93ekcrZFZ3YXYzVGdE?=
 =?utf-8?B?V255M0toaXdPaW5SZlg1Nm9wU1lTT3Z2dU9QM3lOMk5iQ0hZN1cyZUxOMCtp?=
 =?utf-8?B?RTVWblBuUDdwdkZDRG5NZVU0UzFVUFZRNkhsaW1xRTBJRmxLVkpMOVlJc05H?=
 =?utf-8?B?OHByTGlFcUZnaHl0bWxXSGdYK0dSMThxNmpYY3B0VitzTkpwOFJLaWFVd09q?=
 =?utf-8?B?RHV1R2lYQXBiS0FVWmQwaEVaSzA0WnlSeFZyTkhrVm0xekNIT0VrYzVCekxT?=
 =?utf-8?B?QlhQOWtVSGdTc0R1QzNMZVNpWTN4ekZ3SnFpN25VT3dDdWpoVmlpU2tCazF6?=
 =?utf-8?B?ZUhrTmpJaXNlQ3BEYXZwc3lTM1g4Z0N3L1dwQWVHWU9vV2I4NVZpVXJQa3dm?=
 =?utf-8?B?VGRKWGtkMU9Tc3czQTlRQURNTEFXK01HbTI1QkpiZlJhck82Q3lTL2M3Sitt?=
 =?utf-8?B?Q0lMM2c2RkxXaTYybVk2NVpDL0pMWU9SMnV3dERXU2Y4NkRkanVUMW9sbzlo?=
 =?utf-8?B?czlyd1FGdWJNWlRiNi9sVFZDZHRySk9JNFhKN1hIUi9KbUMxT1h0SnhzSlBj?=
 =?utf-8?B?eDlzOFEwUWdwYU13V0U5UTIxakVTL2tORVBxQnVRdWtzdkZJVUkwaVArZkRN?=
 =?utf-8?B?TTNYQjZRdkloNnQreUNGSUw3SU5ieHIxc1YrbjJYUDRuSnJHb2l6QkloS2pV?=
 =?utf-8?Q?qLrc=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:01:55.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11661687-99f3-4e2d-4a6a-08de3103b6a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 18:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227137

DQoNCj4gT24gMzAgT2N0IDIwMjUsIGF0IDExOjU0LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxkbWl0cnkuYmFyeXNoa292PW9zcy5xdWFsY29tbS5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiAjIGRlcGVuZGVuY2llcyBmb3IgdG9v
bHMuDQo+IC1UT09MU19ERVBTOmFwcGVuZCA9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FH
RUNPTkZJRycsICdmcmVlZHJlbm8nLCAnIG5jdXJzZXMgbGlieG1sMiAnLCAnJywgZCl9Ig0KPiAt
DQo+IC0jIHRoZSBmZHBlcmYgdG9vbCByZXF1aXJlcyBsaWJjb25maWcgKGEgcGFydCBvZiBtZXRh
LW9lKSBzbyBpdCBuZWVkcyBzcGVjaWFsDQo+IC0jIHRyZWF0bWVudCBpbiBhZGRpdGlvbiB0byB0
aGUgdXN1YWwgJ2ZyZWVkcmVubyB0b29scycuDQo+IC1QQUNLQUdFQ09ORklHW2ZyZWVkcmVuby1m
ZHBlcmZdID0gIiwsbGliY29uZmlnIg0KPiArVE9PTFNfREVQUzphcHBlbmQgPSAiJHtAYmIudXRp
bHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZnJlZWRyZW5vJywgJyBuY3Vyc2VzIGxpYmNv
bmZpZyBsaWJ4bWwyICcsICcnLCBkKX3igJ0NCg0KVE9PTFNfREVQUyBpcyBqdXN0IHNldCBhcyB0
aGlzIG5vdzoNCg0KVE9PTFNfREVQUyA9ICIke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNP
TkZJRycsICdmcmVlZHJlbm8nLCAnIG5jdXJzZXMgbGlieG1sMiAnLCAnJywgZCl94oCdDQoNClNv
IGp1c3QgbWVyZ2UgdGhvc2UgdG9nZXRoZXIgaW5zdGVhZCBvZiBoYXZpbmcgdHdvIGFzc2lnbm1l
bnRzIGZvciB0aGUgc2FtZSBjb25maWd1cmF0aW9uLg0KDQpSb3Nz

