Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D36BC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 12:57:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.47])
 by mx.groups.io with SMTP id smtpd.web11.19156.1745931435255749535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 05:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=r9xQjxO5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=r9xQjxO5;
 spf=pass (domain: arm.com, ip: 52.101.67.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H1JsUb6VxNcCtaf3RKojDJsjQP/+WxZVmCEKLrjVqgiYwlfhqdqhuUhA0ZOXJynvebv3pty6TD5djztwfUlW+G9o+zmD6IlpZyHRw0TU4ixAohptC9R8dWCVM4k6ZRJ00/u5t31TWHXmkFz4K613oNkKz3DqMJLvLoXfkgZifqn9wF2eCZndYMS10YS7gD2sihfRGKFIffmuqyUvbIuX377G0qK7TWzdBItccpyul+p+iIoLfIP9nmOdeGw35yBOX/jjLDMO8nhcrqJc8ca/16BpPqeCV+jpROpFcB93eb5d7M/i4vNx0iOYHxzX2AD8dbpbT+P9DGPV1vQKm+g6vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++MXpevptNJkBQklWYwTqpp5dTZpguLImZ5+hbqrQOU=;
 b=VC12U26TozO7pLUhIMdynCGKopY5PuqokoFaPx2tR2Di2Jk4rq1EOqsOI78vtc0/ncrfckHyO3BL+doRCzUNyfpYLADk6ObdHVrFOtdcJnVc/vh43y11j0/lae471UTtySmhEPT3kxg35Zr6HMj5aiul/36NB9sazKCB7pcv4sHspFSw3M+0ejdqmWI038wGPIv5MMM2FsuepcgwlKqeXeuIddOoSNV7MY6oJcESLxZjtmiEhGdwuQ8w5trGK4GnPmWbna2DkZSf7Bs2BIgimcSV91GKT21m/9PcfHVL5InNZcw0nWnhSZMXojJx/XYWXqtrA4SaXbcgkOSblYyFOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=baylibre.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++MXpevptNJkBQklWYwTqpp5dTZpguLImZ5+hbqrQOU=;
 b=r9xQjxO5dCCNaXIznAEJInKMboq6C1m/nP9lqxxUI4MUw9jshqCS4HQluZr/eUJWfqYhqbo1G017f5dCwMeMiauaKdf/dPjus+IAABCiuRayEAA02d/Y927vwv3tS9LQNtGqECHkYgb4DvIvzi13tT0Kw20bMXJINe/arGCiO7g=
Received: from DB9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:10:1db::7)
 by PAVPR08MB8797.eurprd08.prod.outlook.com (2603:10a6:102:32e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 12:57:11 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::1c) by DB9PR06CA0002.outlook.office365.com
 (2603:10a6:10:1db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 12:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Tue, 29 Apr 2025 12:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nvzi6hbFa0js55uKB6ShM5zLBtqr+SNhUfh3fDeyWDlETSLx22NnNzgdVM0WsyM5wxOA7qcAReJ7npVeJAlwV3Pbp7qLn922pa7bEZ/INBkjkOnGWWC8zGhgtbpmeG8/LD9XuGLF4LJnefb0FYjPZfXtRBfLY2KgdIv94YYgx3+QxDeosfUs1dKrmHA5p8B3XVV2F0efJM2pBewy2ykTk3EhpPVmle0UpdcXit7z6YZ7CXkQIGi4Xm61CQ4Apkc5fKsbBX68OESxLNvSOWzhwEwLd7D21NWJLEQt+ZqXxCNMbzRuev3Cli9yWr2MWsr8D1dZP49t1siniaapOR+ANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++MXpevptNJkBQklWYwTqpp5dTZpguLImZ5+hbqrQOU=;
 b=Vs9/Qso9v7ZvkKVee57EBqsxAOqL1xUxtfdIw+B1+RZENpH5MQGmfbFFok6Em01QGjVm4iO74cBt9Xd/Fnejho7tMM5BHT0DxBKN8Bd7JPLYPtESxjDTnXu6HkF/OBkgvhW9ZU4Erey2bUQOCjvRlX2fXYaq2/2AMp7mqVeHsxAISuGnFfAE/f8cla3YGK/T0w/lxkqlbga5vKgU0htucNRNz89nkRwYXvrOSULipaeYoRXjrvtp+uTMLpEYQEFD+TWOP5YIsNTovu1NC2LG5bABmHvRKgH+qed6hn0zrrWC1r/suFfrJVKv0MVbvHa5DvGcAdOCeMuVwT/Jrh32DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++MXpevptNJkBQklWYwTqpp5dTZpguLImZ5+hbqrQOU=;
 b=r9xQjxO5dCCNaXIznAEJInKMboq6C1m/nP9lqxxUI4MUw9jshqCS4HQluZr/eUJWfqYhqbo1G017f5dCwMeMiauaKdf/dPjus+IAABCiuRayEAA02d/Y927vwv3tS9LQNtGqECHkYgb4DvIvzi13tT0Kw20bMXJINe/arGCiO7g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10467.eurprd08.prod.outlook.com (2603:10a6:10:519::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 12:56:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 12:56:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tgamblin@baylibre.com" <tgamblin@baylibre.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
Thread-Topic: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
Thread-Index: AQHbuGVCZlyenU53sUKKi7FNXOr0UbO6m3MA
Date: Tue, 29 Apr 2025 12:56:38 +0000
Message-ID: <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
References: <20250428174416.379821-1-tgamblin@baylibre.com>
 <20250428174416.379821-3-tgamblin@baylibre.com>
In-Reply-To: <20250428174416.379821-3-tgamblin@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10467:EE_|DB5PEPF00014B97:EE_|PAVPR08MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf2fa4c-2242-4612-95c0-08dd871d5b3f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MnU2dDc1YXJjbVljdE1Vc2daWmV1SmNlUTdsSFcySmt3Sm9pRWpIVEk3WTVp?=
 =?utf-8?B?TWZXWHI1VkFraFBzNk9BR09vcWFlYWFUZmZEVDdZNDhhQWhrdytnSnN0cGNG?=
 =?utf-8?B?dE1qOEpZbWtRUHdhMlNRS0xFZ0puWGNkR1RCMDQyUG96eFVvVmtEZmIvM0hH?=
 =?utf-8?B?RXFXS1FOSUFIQWNiaExJR3k1RlVIbDd0MitJS2RRcFVwWmdoMU9idHR0aUM3?=
 =?utf-8?B?a0ZLUDRCTzQvWjMwSG0weTBub2JqVDRBVGNOdEZuVXROSXhyWDkvNHBCMGlX?=
 =?utf-8?B?QU92a0dGc3pHS0I0MFRyd0J1WUdobmhOMEF6c3drc0JVQTk5WGR3VElJTGht?=
 =?utf-8?B?WC8rSWZiSy9Jd2VuNDNsRHF5QXpWREhBMmE2SUM5OEJhVUphckswNGg0Zjc1?=
 =?utf-8?B?SVBpVWxWekJNTy9VZlp6dzRBc0kvL05BQ3VBWlhMeFBGQjl3d0g4SHdDZ0xH?=
 =?utf-8?B?VHQrUEthM3VWTTFhbHFrQ2VQU2YzdWRyRmp2M2FSb2JHZ2JKV0NEQXJnR0hk?=
 =?utf-8?B?eERsbmU2U0ZrdDRoc1FVODI1RjA2VUFBY1ozZ25MNEFUK05oWS9hTXBCa292?=
 =?utf-8?B?SGNCbUtjejR2Z1hNVGJaZG1JSU1aUGVJZDNIZXhUdHdGYWlsYlZqWXlZZFJQ?=
 =?utf-8?B?bm1OanJYU3lBT1V0N2RBWGFEVElFeklsYnh1VU1oUzlpUlA4RjFDNHFXaHU5?=
 =?utf-8?B?Wk9xTmxjanFtMUp6eDd5QW9JZTFWUnR5c3QrVCtjY0VhOEJVSk9OVUh0RER3?=
 =?utf-8?B?c3ZJRktvUUZNeHkxZ1dZVm5RUDBueklvRzl4VHMyK3dkK3dEOHk3ZmxLQnFq?=
 =?utf-8?B?VFk0RFU2TS9oVTBVUGJSNE5SYTZZQ0Q5eWhzemxMVi9BMjNjNCt4c3B3ejlN?=
 =?utf-8?B?THltN3BiNW12cDBPRUdrbk44Yk9LU01KVWFmZUFPb3FhMTZVYU8vSk9uaFpL?=
 =?utf-8?B?NjRWcXMxZEpqV2FNN2RwSE5ESFVYSlpiMkhSOG4zNWtJc2dzZS8vYmp2L000?=
 =?utf-8?B?TEhYL2c1NW9GeXNxWFNMbUJ5V1p1MHpHckJUWG5LczBLRkM5NVFLWDI5RzNU?=
 =?utf-8?B?S292UHRtaVRnNjl1KytUcHA1TXN5MDRxS2cvOTdBYyt3c0h4OXFNak1MZXZB?=
 =?utf-8?B?UitxcStod3E1UUFNRjF6ZkIzZkRJSUo4cnJXSVZhdXlYN3oxRnVibklDNEt0?=
 =?utf-8?B?NHJSa213dkZjQmhSc0VmRnU1WGVSRWhPL0ZnUDZnN2FWUGF0RURzeUQ0d0xI?=
 =?utf-8?B?SC85OTloNU1UakNFVGtZRDkzM1ZoSHI3NzIwMmNVMTJ3ZWlIUDFIb1d0Mi9P?=
 =?utf-8?B?c2N5bzJHVndZRWlQWktDbFM5ZmEvYW5XYmZVV0crcXVFU05lZE1DRkMrUDcy?=
 =?utf-8?B?endmdURLV1Q5eW84OGdPM3NWSGhWdy9VNnYxRUdNOHdZam9PY21LTnhPMjZS?=
 =?utf-8?B?NE5yMElMb3lRamxQdEdaK2YraXpWOEtTWjUyWXZuMXJkcXlKZDdZdUhzekRs?=
 =?utf-8?B?b0NodkxTMlVMK2Z5bC9ySUM5aHZBUUFRMGprcmRPWXlJY2VGTzM1UTdrTHFW?=
 =?utf-8?B?Q0p6VXBHYUJ1cFhSdFo1b08xMndGV2JrRThzUzlTVVRMOFhGTkprQ0xnSFIr?=
 =?utf-8?B?NWxGWnlmTVdHdWJXdGFhSk5yU2M3RkovdGJ1NUZjMGt3L0FrZWhIWWQ1OGtC?=
 =?utf-8?B?SWFLVWFUSlJadE1WWUdlditjZ0RLSFpaY2FmL3dLaVZoa1lNc1ZZUWtmaDlp?=
 =?utf-8?B?SFdrdmRGMjRpd0VPaFRPMGJPS0VTZFF2dm52UFU2ZlZSUk4yQ0o3empIV1E5?=
 =?utf-8?B?UHRkZzJnMjhRNk9HNFYrREhaVHRxc0Q0UEtJbUtXQjQzL05mRGpObE5QSEhS?=
 =?utf-8?B?ZkJRZ1IvOUg2WVJFL2Jyamw3YWl0R3JnajQ4amNQZXo2SVYwSzE2NW0wejla?=
 =?utf-8?B?Q0J4NGNJT2FDTVZGQzZNRjZnNUNMQlY1OWVwZk5IUUduQ2pSZ3MzVldDWEVS?=
 =?utf-8?B?MitveU9KRGtnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DB81CB133192F4D9BB9B751D71FAA42@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10467
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	df6cda43-842c-4ea9-01e8-08dd871d47d2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700013|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGVlaSttZXBxakJEU3hZekpFMmUyeUlycUVObjdFRVV0eU14LzFsTXg5V0tO?=
 =?utf-8?B?YkV5YzFKdzJEWFFuTVNZOEFldS9ESFhaQmliZEFnbjA5WHRGY3NsSEFkNUhB?=
 =?utf-8?B?QWRwVDJHN1RyUnROZFZGYVk5b0VTS0IxVlMxelZJUlV4VGU5U0o1RjFtcjFI?=
 =?utf-8?B?cUlMNm9STTBBOWtFNTZUNzRzaEF2Sk5tMzROUzgyaFhiNG5wVTNsR3BDbTVI?=
 =?utf-8?B?OExPN25KdEs0Zk9CZW83eUFlVWJaUkZ1TlVuUVkrVXBXMHd1RUJiQVhlLytH?=
 =?utf-8?B?a1ZPSElEQSt5V2FDenlUUkxsU1MrajNTMGhmanlacTBoTGtvdnVkdWM3ay94?=
 =?utf-8?B?KzU0aStEMWRPZmM0emVxNVpHcmswam5YZUQ0dmRiTkxzNmRITUNHRVZkdlNH?=
 =?utf-8?B?NjRVK3dVR3BqMXFWY0loZDBmUy9hckVLZXNkWWExc09LK0xSUjRMZHhKOERx?=
 =?utf-8?B?ZFRaRk11SFNXUnROd3loOTlxTUlOdmV3eDgxVTJmcjFhT1hyOG1aVUpTV2pz?=
 =?utf-8?B?ZmFLZExKQ3c3bUNadngrR2xHTHBHSlVGYXVqc3RXNmlKd09DZ2l2YXMyK2U0?=
 =?utf-8?B?ZkRCWG04N2FPUHFTQnFxR09zMlpCRVVRck1jU0RwSGg2N3l0UHhRZC9Xc0FX?=
 =?utf-8?B?bG9NRGsyc0ppRXgwVE5XWVhqRWo3Q2tpRDJvWHB1UDZEa1diWW9QUVFDVVhj?=
 =?utf-8?B?ZUtGQzNPMXovUmZpOEZMOWVXODlMSUoyRFRtTE9Lbktpd2lzL0R3ZkJPa3hO?=
 =?utf-8?B?ZUIvUEl2ZkNxcFJNZ3VDVm45YldsS2MrMnJ0YlA4SHhYcklqYkhnSDkzWHBm?=
 =?utf-8?B?Ujg3Z3k4V2o4SGYrRFptYTV1bzI2emZMOFVoRWkrd213K3hXdlpXeTB0Nmtr?=
 =?utf-8?B?a1RBb2haTUtVUmdGVFFabk9qaDV0dk9KYk1OQytzeFQ0Q3FXSzU3SmxSV0lZ?=
 =?utf-8?B?SEN2bDQyYW1vRVBnNm0wU0ZFcmQ5WmU3MXJBT3dpUCtmd01GSUN1ZjlmVGpO?=
 =?utf-8?B?Y0FnTTRiWWhzUlovd1NkczZwZ1lsdXZrWEhzUStDUVYwMlFsNUxZZXNrelFm?=
 =?utf-8?B?VE5Hd3U4ZmJSYTVHUzBLU0JWNzRVUTNYdGdDOWxvRlF2cWxiUVJidGViejBh?=
 =?utf-8?B?MXlkNHVuZUllQUZWWFlmNk5zdFp1RVdxWGVEaGRjQmpXY0toYldoVzVNZmx6?=
 =?utf-8?B?aXJvRDg1WU1EeHRKdzZrRzdRcXRxc2FVZmphSk42aW56aUF0RUo3eWJCclky?=
 =?utf-8?B?eGF5K3h4eHZ0MjRMWGFmNlNqUzRmTzlDVlcrZUgrNEVFTk1MVkg3bVl3Q2Rl?=
 =?utf-8?B?SE5LTDZTYWJ0OEp4blFaV2dOU0Q3eHlGb09ESk1FMWhxT1lpQmoraTJ3ZW9J?=
 =?utf-8?B?eFJ4aE92RUlDcXBXK2QveHM2SkR1Z1NWZndid1ZMcmRUdWJnanVvS1VkM0Zz?=
 =?utf-8?B?RWJDK25HVGtaUEs3bDFhaHRRd1pYSU5vZ1RUR2kwMFFNL045NnhwdFdQdHdN?=
 =?utf-8?B?UzhKd1FqbnZTamdkQ3QxVndNSk4wRllpRnQveXMzTkJPSnhRZkpIY2VULzdL?=
 =?utf-8?B?Nit3UVYvTm9xUEFpeDhQektvd0ozcDVFTXhXSE85NFpRbTdaVWZnU1lOU3ow?=
 =?utf-8?B?N2l5T3d0QlVwV0dvNHdtTHVJQW1uNC9OVkRHM1dTOGxCa1hRYmpnTExKZHFH?=
 =?utf-8?B?dWhxMmUyTTE4YXRvUmxwRnAyN2t0Y0tPdHBSeUI5WWdTQndvWDBPa2ozdXBm?=
 =?utf-8?B?N0pyUjdjdGIzeWFKeGV6SmNvSXNxVnVldG1HZTVHZWV3bmllWmRpcUpoQzZM?=
 =?utf-8?B?NERCVHFpbDM4bHNxQmFuK1Q1VEVhRGlGczNPeE10eUMxeU9DLzZXUUpaTllp?=
 =?utf-8?B?NXZ6ZUlYOGVGZTZKN0ErY1pCZVZ4T280QnF2c3RCSE56akFGU1BWbjBoUHlL?=
 =?utf-8?B?MzZla2FId1NsWksvS3V5U0NlYVhRY29ibXBBZHZWVnBZTVhpMnc5OTlVMFFl?=
 =?utf-8?B?RHArZlljNVBodFRuT05TN1lDWlIyU0NtdVJ3clAzOEFGQnJtdHlzTjBtVU1G?=
 =?utf-8?Q?uURD0+?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700013)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 12:57:11.0737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf2fa4c-2242-4612-95c0-08dd871d5b3f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 12:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215662

T24gMjggQXByIDIwMjUsIGF0IDE4OjQ0LCBUcmV2b3IgR2FtYmxpbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8dGdhbWJsaW49YmF5bGlicmUuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAtIEFkZCBnY2MgYW5kIG1lc29uIGFzIHB0ZXN0IFJERVBFTkRTIGluIHRoZSBy
ZWNpcGU7DQoNClBlcnNvbmFsbHkgSeKAmWQgcHJlZmVyIHRvIHNraXAgYSBmZXcgdGVzdHMgdGhh
biBwdWxsIGluIEdDQyBhbmQgTWVzb27igKYNCg0KPiArQEAgLTIwNSw2ICsyMDUsNyBAQCBkZWYg
cm91bmR0cmlwKHNlbGYsICphcmdzLCAqKmt3YXJncyk6DQo+ICsgICAgICAgICAgICAgICAgIHNl
bGYuYXJyX3JlbG9hZGVkLmZpZC5jbG9zZSgpDQo+ICsgICAgICAgICAgICAgICAgIG9zLnJlbW92
ZShzZWxmLmFycl9yZWxvYWRlZC5maWQubmFtZSkNCj4gKyANCj4gKysgICAgQHB5dGVzdC5tYXJr
LnNraXAocmVhc29uPSJSZXF1aXJlcyBhIGxhcmdlIGFtb3VudCBvZiBzcGFjZSIpDQo+ICsgICAg
IEBweXRlc3QubWFyay5za2lwaWYoSVNfUFlQWSwgcmVhc29uPSJIYW5ncyBvbiBQeVB5IikNCj4g
KyAgICAgQHB5dGVzdC5tYXJrLnNraXBpZihub3QgSVNfNjRCSVQsIHJlYXNvbj0iTmVlZHMgNjRi
aXQgcGxhdGZvcm0iKQ0KPiArICAgICBAcHl0ZXN0Lm1hcmsuc2xvdw0KDQpIb3cgbWFueSB0ZXN0
cyBhcmUgbWFya2VkIGFzIHNsb3csIGFuZCBob3cgc2xvdyBpcyB0aGlzIHRlc3Qgc3VpdGUgaW4g
dG90YWw/IEp1c3Qgc2tpcHBpbmcgdGhlIHNsb3cgdGVzdHMgaXMgYW4gb3B0aW9uIGluc3RlYWQg
b2YgY2FycnlpbmcgYSBwYXRjaCBmb3JldmVyLg0KDQo+ICtURU1QUk9PVD0iL3Vzci9saWIvcHl0
aG9uMy1udW1weS9wdGVzdC90bXAiDQo+ICtleHBvcnQgUFlURVNUX0RFQlVHX1RFTVBST09UPSIk
VEVNUFJPT1QiDQo+ICtta2RpciAtcCAiJFRFTVBST09UIg0KPiArcHl0ZXN0IC0tYXV0b21ha2Ug
L3Vzci9saWIvcHl0aG9uMy4qL3NpdGUtcGFja2FnZXMvbnVtcHkNCj4gK3JtIC1yZiAiJFRFTVBS
T09UIg0KDQpXaHkgdHdvIHZhcmlhYmxlcz8NCg0KUm9zcw==

