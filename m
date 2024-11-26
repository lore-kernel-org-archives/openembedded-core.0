Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B7BD5A6D1
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:46:09 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web10.37003.1732589160965279005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=xtAiGrP/;
 spf=pass (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1732589162; x=1764125162;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Cnxk/wRp+OqAmRMQ43ZWH4/5Uhe//QT2LpgutftiTRg=;
  b=xtAiGrP/bAeIlBW6sQEasNawXdAdArF3CH5Qbd2aprgcodmD1N3p+XK7
   zsND9jZtltkMJtE6a8PozJVPy3Z/XXDuyZBflEH9GizL1TV3934B5X9Zw
   W+E6tZE7kyMFQ39nKbKs1fal5lzHzZrMDsORmPPL+xzJz8tsJpZ2mh8dt
   jHTWXPcwxY+DSmucJHD88pCL/vXcvQyrqfLQ12n46Vuzny9DZ50EVSJHq
   fd6G7ns21ed067bn8CXPBlrkTUO6FT6+5HqmsLbQFnWQipKXYzqGU60lW
   KQZUjQ2ln6E9sN7QlQ2nYXau8pX+qXexsYu4JYuJ7SHMA/tDG1yf2DMXG
   g==;
X-CSE-ConnectionGUID: OTOfKIRgTVygQFXR7q6/QA==
X-CSE-MsgGUID: rNhtERp2TQS4YL1ouPZzDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="49229265"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="49229265"
Received: from mail-japaneastazlp17011028.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.28])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 11:45:59 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9fH0c/eB4/m095TKMjvl0s5QFWMnfGF5tDS4btHMOBkS/EAvnMx1ix2LdKiLBEjNd9Gp873e95HJ4MPLiFguQyRdsYvlGvDddgP8nUi3SATawXYnI0/aXN0R3moOCJrnqX+jsYghCf/HYaheaVqw/7cWJiPw3Ua1xDRqSVkILfjB/SqNVnq/PmtYwdFnQ/MBkGuFU7ipItKVKAH58//rCyS2m3U19rTlJMLJaY0ytPf+tnGRN+5C2U5OEcTy4YAJaJCj+z+OxNOjaoKyWQaLHyvRTeiRNa4gjjdqbtrWNdipYYB9+g3L/69isA35Wry3u3FpfDOBkP9MxrvAXwtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cnxk/wRp+OqAmRMQ43ZWH4/5Uhe//QT2LpgutftiTRg=;
 b=eEMoi5Nox3DPrE/ulsY0Qoec53pNXRDfrtUvbXYB3PYDE6tgtGgzh0ygSloLU5lef7dTL+UNWMD/3DdCpf5BjKrPNCBUuj6FNIciCJ3wYA+r3c0Xevy+IxMb1XrCohkSJpgaPLbDVdMbV0glwgkDEjuByvGDqu5FF4IghAgNcYh/DlGOUAIfGGiZXxv0QUjnUNXTFfaCaL/9IDBp8eb1LsXcXY/nRi0qZIiEgbLo12Weaoe1yX8bX0Z1MwiwFCo2jwkpIrhY0oisj5mT4WFtCxgDcZmH3VQkZ8w/Pc3OEn/JEZDO/aJ51gRJQmX6WlbrUuwRACiT3Tw86tJWcaPXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY4PR01MB13820.jpnprd01.prod.outlook.com
 (2603:1096:405:1f9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 02:45:56 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 02:45:55 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: conflict between tcl8 and tcl
Thread-Topic: conflict between tcl8 and tcl
Thread-Index: Ads/qUujnX5okqGuQKyHGgSMPambdw==
Date: Tue, 26 Nov 2024 02:45:55 +0000
Message-ID: 
 <TYWPR01MB11861AA75103D416B518D1CEEDC2F2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=ebcb4f22-8105-4955-8da6-952e3ee90e1d;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2024-11-26T02:45:51Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY4PR01MB13820:EE_
x-ms-office365-filtering-correlation-id: 8b00a1f4-b0ca-4efa-f1a2-08dd0dc4732a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|27032699015|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?Zm1KclhydERKOVRFeE1ocnROeWNtNnM5TDNvOFZjVllMdFpROXJ1RmFpTHdH?=
 =?gb2312?B?aGgvdGJzeC9TSDl6Y1cwMFdrWTMwUE5BbU00SDJNQ3A0czM4cWZYbjZIUEli?=
 =?gb2312?B?eXdHc282TGo2RTJrV3Z3anVVMDNRUDFScDcySEFFOUhPUmJydE9PSjVmL05z?=
 =?gb2312?B?dVBKUVV6VjNkUmErbjFNU2pUaWU5YjRMd0hSOWxsWlE1c3BQd3RPcmhWcEM2?=
 =?gb2312?B?bDhjQWEyUzFRSEg5dVNCWUhsM05aY3dScTlkUkFYa1N2THBncFpqSmlPSnJz?=
 =?gb2312?B?WUVwRkdvQXdQek1BV1QxejBVdjBTZnc3eVhPSWVTSzNCQzJIbmwweFhzcU9a?=
 =?gb2312?B?NzVoVndnNi9OWWZVakZFZVAwU2JKWGY0clg0VnhkUDRDQUNTUUFXZEF0OEFw?=
 =?gb2312?B?bnlyUWdwZEozbUxweW1WaEJ2eXlGTnIrTXRETFFRRUdQOUhPcDFocVlMODZq?=
 =?gb2312?B?YlhDcTFBY2YrZ3p5V0QrSStzU2wrYmIwVzkrQjV3cVkzbjdzYi9TTFAwdEIv?=
 =?gb2312?B?T2UwZFdVSWExNmkvSW01NlYzNGFFdHQxZGU2YS9zWXVWeEU4TDJpaDlzQXZx?=
 =?gb2312?B?VVJlbWlkZkdWTVI1Y3lXUXR2OFYzUlpvaitGdTk2ajhmT1dhNnJtM0E0UU4r?=
 =?gb2312?B?QVVmU0JqSW04ZnF1V1oweTYrOXNDakFreExOQ2hlQ0toUWVaeUlTT015WmRr?=
 =?gb2312?B?dk1Lajg4STM0VEx4ZHFiK205OVZVQVllaFhtdUt1VENBa3JpbUJqZisyUnYw?=
 =?gb2312?B?b2RjUFVMeVhqTEVidUhSMUNoLy9Pd1RaWHA3Mm9Fem93b0xkcEwyRUZJa211?=
 =?gb2312?B?dmQ0eTVPMEdic2pJZTVibVhSTDRXZUhXWG5OQmh3VXNoeFU0MGFWU3pSeDNl?=
 =?gb2312?B?ajZLL2o3SlA1cjlkNEN1d2dJU1F1eVQvMlNZMzZEL3ZwQjZ6bTA0ZTVuV1lL?=
 =?gb2312?B?YVp3VmNjNzNzOVhmQXllTVErblV0YzhCR3kyOHZCeVNxZ0kxN1NsR3VLQ0Fh?=
 =?gb2312?B?aWVtMlpOUU5CN0p3TTZTbzdIWS9Qdkg4L1lmbGltMk1zT3FhZ0pxQnJmRnBJ?=
 =?gb2312?B?YzYwYnB4THBhNzAwN2Naa0o2Y1BpMWR3enh4dWd3eVQ1MUtvWG9aQ0VseWcr?=
 =?gb2312?B?MGdLTS94L1Z1bjBhbFZxS3dkd3krWGh4ek55dHFzWmFuVmV4a1JKTFE5d3Av?=
 =?gb2312?B?MndZWi9icHpPQ05zSUJ1cFBaUnQyWEEyMDJjbUp1SDVJWldnclFIajFleEc3?=
 =?gb2312?B?d3o4NDJPa29VK0NtUmxYVkRPTHlSMjU5ZytacERtLy9VSUlPbStZNllGa1Fo?=
 =?gb2312?B?MU9tSkQ3S28zNTExaFdWa0tkcExXOEowUTVSVTA1bkFndElZSitpY29hQmNN?=
 =?gb2312?B?emRhUHFnT0FjOFpzZmc0eUUxdXhZWFpOVGxWU2ZNV2ZhUlF6VW1abGFIZEJ0?=
 =?gb2312?B?S2Zaakc0ZHh3ckxRSVZ2K2VqMWhwT3prU3dEUEtocVgvcm8yR0FjcTFQQTM5?=
 =?gb2312?B?KzNBQlVzYVBxM1ZVWDRudC9OMjFGcFZuWE9mU1FZd0dBRVdXdHVMaTNvMENt?=
 =?gb2312?B?N2tLYmJFVnZ2OUJoaytHbGNIakw1bzRGTlQrdC9RN25sSmJwR01XQS9mTDc1?=
 =?gb2312?B?Ny9BN0VLeVVTV0VKektWbGs3S3JYek9KYXkvK2ZWQzgwOVBOZGxYazFyK21C?=
 =?gb2312?B?czltRnBnM3pNNHJMaGNIV3VxQzhMTzlhbnk0MC9jRlNQRDVtQmw1TStoVXRZ?=
 =?gb2312?B?VlpXSDI3VjlRb1FNTmdJUGU1QU9taVV3eW1GSWxtZWpRWTNGOTBoUDFOM0Uw?=
 =?gb2312?B?MjBUY3o3dEZkdHI2YUVrTXhUdlRZR0pPRU5Pc1V3emszbzk5K3E1UGJvS1Va?=
 =?gb2312?B?MWx5cDc1N3dxY1dWdTlhVWVvamVTR1lnSWVaQjBTUWw0dzM2YnptQlBDUXRD?=
 =?gb2312?B?MkxNaTczVlZpeUxoVmRJNDNMWXhGaVZSd0plV3luaFhNU1kvUkdmQjAzWE9x?=
 =?gb2312?B?VEdhcndwcU9BPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(27032699015)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RUJ6YjI4c1ljZk9rMEk2NUloVVJTUGozTVJyd2piODJVczMvdm9jV1FZUVJD?=
 =?gb2312?B?bC94bVkzaVlGYWMrK3kzSGtBc0srMXdhS2g1VDBZdEtSOS9LWnJyc0Fwa01v?=
 =?gb2312?B?M1JKOHlaNlV1K01mSnF5OUZCMkx6K0hEci9ZSVhlbWJDTWxuSFQ4aDJsOFlI?=
 =?gb2312?B?OW83ZFRtL3ZTYm5ZbW5WcnVQOTJpdTdVdGpjT3ZHaWtxcVkzYVJYZlNPU3F1?=
 =?gb2312?B?RVB3TUZFc0lkNzBkTjRmRjFJVjhGeTYrRW1EbEpZaXRIVHJNeXhqcW5SWFJI?=
 =?gb2312?B?RkszZmMrSTdyZnAxSVNxMGVUM0FNY2ZHQnZDT3VTZGwvQkxLaHFndExsSVlJ?=
 =?gb2312?B?OTNQVzlhSTdvellNQklOVkUrZC9kZThrR1ljcmI3VzN1N0UyM2c0K3RGeHk5?=
 =?gb2312?B?VGZHcjM2VEZ1MDFRaWtaajg3SWEyL3BkTFN1dzRqVFRSZWI5bTZYT0Z0QWkr?=
 =?gb2312?B?YldxRzNjQlhnNTNDYWwydnAvbGVnUkxPWWk2RTQ1VUxWamFyUFE0ajMzVXFB?=
 =?gb2312?B?MXNDeXkvN0JYUWpxdGJMRzZIaTR4N0o1K2hFRDE5QXlVdzVxdHpOSzJnOXhV?=
 =?gb2312?B?eHhiN2hRQjdha0RYSGNnUTc2RWRtUHFRWFdNZHhOL3lkRkNIdTVjR2VxUWNl?=
 =?gb2312?B?S2RiT1VzaEFPWGY5U0U5eTR2Y2ZUamEzZUtuUzZYeTdZMG1XUUVvejUrbk8y?=
 =?gb2312?B?dU1La1V5SU1WdGxkcE1GSmdEQk5pRnBTcjdkdXQ2Z3JzT0dYNlc0SERKQTds?=
 =?gb2312?B?QVhsQ1gwT2xMU1B5WHREdWx2WmxqTWRMdHZNNEFTeWlTZlAyY09nZjJ5REFp?=
 =?gb2312?B?K1lWb3h0eEwvdVJTVm1PWmhNZk10Q0VZVVVONTlGMmpkNmlzSlNvMUR2cWw0?=
 =?gb2312?B?OUMwa0hmbjhDZUhLNy9HREFPdFgvMkhTS3BId3QxNVdzTVFFQW52UWNodzlj?=
 =?gb2312?B?VDlCaGVCenc5TjUwRW1LaGtxdDlmVjI0YUhheFBWRlBIZVp5VlNZcy9XMXhX?=
 =?gb2312?B?b0JMdVBieXRxRlBXSnNPVW10SmJMcE9LNysxOGRxY0o5aVZMejBPY1Ftazdi?=
 =?gb2312?B?emFaUmhqTU9pK3AwcTE5MStuQUF6SWVqUFl0akl5ZFJyandLQ01HUkgxTGxs?=
 =?gb2312?B?Q1BUY0ZsRFFhbWRQdDlJdTdaS2dyS3hLOFZ6V083bURBODhEUFh5WFFuclp6?=
 =?gb2312?B?TGxyakxwV1VWUU9TNkg4R1E0V0dpRGxmSlNhdW1sZUlnMnhRUmZDN2xwS1N3?=
 =?gb2312?B?UmozeS9YUWtBT1JlSU9NODRMSWtlVHNlZkUwaHpBRXhlT2NnQ0FTdktCcTN0?=
 =?gb2312?B?Z3B5R0NyZnhYREI0b01HSm1Pb0M5N1FwWHVrQVdqQWVvaU1Vdk9GYzBrd3h1?=
 =?gb2312?B?RSttZXVSRDVya3B3N01iNy9NOEYvM0Nsenh0M01abWFmWlBxcVVZSm9LR1A4?=
 =?gb2312?B?VFE3SjdBS0xJY1h5ZHVtb2srdWpzeE9QRGZTcy9qeEp0c290MWhKZFRReDJY?=
 =?gb2312?B?cGM5L3o2T256UVhvTFRjclhLZCtHYi9GZUNpNVlhcXRsU29YYUZ5eWh3OFVB?=
 =?gb2312?B?clBBZmVqUW9Wa1lnVG5LMysvMWZLNEVvWFA1cHhiQnZtMXpIWnFIWGFzNU1C?=
 =?gb2312?B?SWhYaW5yUVM3aUd0c1ZaemJPZnl0SUI1VUo2Q0NOaEdTRThSSk9iUVkyY1cr?=
 =?gb2312?B?WXVKVnkvQ1JGTXRlRTFtTHJsSUZQUmxxRUZRNlFqNk1FSXl2OU05Qi8zT2Uy?=
 =?gb2312?B?Y25SdXhudUFMcVl1K0hSSlpFUjBRYUlKZ1Z1ekRkYzBrMkJRcDA4V0hwZStp?=
 =?gb2312?B?YmZsZnhISDdxWmlrdnFKM2liTTRHVEdqU3ZxaS9Pa1RQL05CWGsvUFIwd3ZH?=
 =?gb2312?B?ckllVnlJSlVLd2hqNUkveWlOa0RNdEovZ0hTeG5obVorMVFKbHphOEZ6cThL?=
 =?gb2312?B?aWdtOStGNkg3Q20zenVleSs0dk5pbkcxWjYxZWdvNzd3UEdjRVpmeDBzbW83?=
 =?gb2312?B?MFJzeG9jN1dod0NFdWRCR0JPc2hCVzJvMmtOQ2owODlTd2xkQnl5V3ovc1Nw?=
 =?gb2312?B?WnViYXQzVlNIU1FEN29OZnFrWXRiRDNkMEFDa2xVTXpTTHZkaXZXMHpuaVBD?=
 =?gb2312?Q?FYaY=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bDaY2D/IVA/SI9dWfdvRwzpcKOKQLXiKj29byitYCDTDGZvAE7hQIREaVU8/BSn6on55g9qMieVUjVikWblJD8nH46sqa46ts/fY9pV2KeQfBZS4Fq2/kwkhgQcCj7XDE6PIt22pw9v0IZpBfOBP51diPWT5biv5FkgdWkXLzExqtsWjGC647/alKBU29HzzMt+cwuvaqEZnTe57wAR4iYHmrh0yI3MIQzuv8HctvNZCt8TtuZu0jnBX4f8FaG5F6Ld/miqjvOwMwIrVWh3GmRMCnbeBpOblKg+g4TPkGB8rRhmtvh/w4s/FQkkodZniJeVxCtO2ueHOf7JAxEJ5F1x5rhT2BMPFAzhoylEq7O+/vZIHag6h58Ud6NP7bJfOaCvtdkoooL4jAC77HDi2tAHe26kx39Y2v/fXVQ/LLjv5GUWlG7uyRWXwYGl6zDf1qyHs+HdineY8owuwFHrxe4H55KWyFtl8et2J6MiNgVspP6wP5tx/xd0eoPvatdhUd3+GFnfjj69OSGN4JvzSvgTHih4GK2GGfm+uPtzQEVQFhFvEHyTt0BgxVNTGwmqufjoiu1D8uwGYX36m1mU30phEUg4/3fHAKPC7nVl5V1JLtpgRG3Wr9IAHZCzlmo8J
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b00a1f4-b0ca-4efa-f1a2-08dd0dc4732a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 02:45:55.3031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRSE7pPq5mmQfAVvnmguHR1WbMpLlWNcvIDk/FFU5Xj5vGomh/R4dlJ/7xKYvCC/G8f7ihbhGr6sTkWa7GZBrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13820
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 02:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207838

DQpUaGVyZSdyZSBsb3RzIG9mIGNvbmZsaWN0cyBiZXR3ZWVuIHRjbDgtZG9jIGFuZCB0Y2wtZG9j
Lg0KQ3VycmVudGx5IGNvbnNpZGVyaW5nIHR3byBtb2RpZmljYXRpb24gb3B0aW9uczoNCjEuIFVz
aW5nIHByaW9yaXR5IHRvIHJlc29sdmUgdGhlIGNvbmZsaWN0LiBGb3IgZXhhbXBsZSwgc2V0IHRo
ZSBwcmlvcml0eSBvZiB0Y2wgdG8gYmUgaGlnaCBhbmQgc2V0dGluZyB0aGUgcHJpb3JpdHkgb2Yg
dGNsOCB0byBiZSBsb3cNCjIuIFJlbmFtZSB0aGUgZGlyZWN0b3J5IHdoZXJlIHRoZSBjb25mbGlj
dGluZyBmaWxlcyBvZiB0Y2w4IGFyZSBsb2NhdGVkLCBzdWNoIGFzIGFkZGluZyB0aGUgdGNsOCB2
ZXJzaW9uIG51bWJlciwgdG8gZGlzdGluZ3Vpc2ggaXQgZnJvbSB0Y2wNCg0KICAtLQ0KQmVzdCBS
ZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9HWSBDTy4s
IExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpU
RUyjuis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04
MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCg==

