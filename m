Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0FFC83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 15:12:24 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.27])
 by mx.groups.io with SMTP id smtpd.web10.23309.1752851541144675992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 08:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=I+SpAnjm;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=I+SpAnjm;
 spf=pass (domain: arm.com, ip: 40.107.130.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pXADS94d5ZClYXQM/jJ+kgpbyVhd01xNVjTCY8zyvbvS+Mu+Gbt57C39N6/g9x3bjvhB8FpaWo+qXjv7MHQZPLvkJkGogmoPE+86Yp27ro45PmM+uvzRoGwpkRV9iFve11mpEMQAjkujlQ0eUfcrNGA8KFYVIcAWvEzRl5PBPvqOFwda0Hk9JEZWMGharwtwsCOCw6FpFoaHIDU1gep3eUZYaJilBzOykpksvlY9juzStMvItQb2cA4Gi8jiLeJ0eOrCzArWQc00+o5LMsE5376biJlhhcEodkeTfB1SCI2Z0OxHVqO3/zVa+z0bbo5eDrzmgXwflm2KuzSq9yP34Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9Nnn5cONeFpYJiQyDFaEVNlvvMdxSsI4TSj6GPT2W4=;
 b=yhSOfqoBM1gJ2Tzo3e863gYW1oThNXkN6pxUsvQ+4t7lqiBu26ozZLMWJcQOnMjnoycQwACZLJjYlRI6/5qzArMAxsQygpE7TqPzQPDwFcyaSGWvqzbjKjkD3E+Q6+j+OfsBPVr9pUH5hFxfEsroV2B3ZDecS6OFRQwcKfitj7FFYFt/9KNEMV+WExJsifn06wWN7V+WC8jf/kKyVsACpWagLjYxs8kWB933+faZQdVJJHxVoziG8bl51AOEBWTUk8t5DYFIpksTs1C7hh6Yktxa+Wj/hWEBqQd5yww8/BHokxXuY8PYI/X8IuQgBIbwYmT8ygt8E88avYM2LAYaXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9Nnn5cONeFpYJiQyDFaEVNlvvMdxSsI4TSj6GPT2W4=;
 b=I+SpAnjmdLLcAHIBs9wnXBxhbnJAEeFjkATALFeu4qAojUQ37DISjsPX+bZdYjeU0xnnicLzpy9cjmCEqnn61G0YHGCceg5/dKfzcsR/MMSjjYqSNziCvMcGzBeg0OF9GETZO5L/CtQCypHd0tIXc+O8Vw93iRUcFukp6VycTSY=
Received: from AS8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::10)
 by VI0PR08MB10559.eurprd08.prod.outlook.com (2603:10a6:800:20f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 15:12:17 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::4c) by AS8P189CA0001.outlook.office365.com
 (2603:10a6:20b:31f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 15:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21
 via Frontend Transport; Fri, 18 Jul 2025 15:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNl2vptBlEE7WnH4UHcoAvIybpM/ptmFmgm82Cof1NWPyj7rVSPRB7j+WHj4jUzKizPwMBAy58BXSNPOQ9O5T05FaRBEjOmKXOORYD+BHZvpWf3/RVWRngbvHry7LiuSnZN8E7XhGU78F9XXdoyt0Kli2Jt9ZGgnmunSuIQJgbLfJ3zZS3LW/M9g/cYTwxQA8hTxHUL1VVbG8AwUUIVCi6iX7PX2r1SFAZTYLQ9NrI7Cj5jgjvtcldOBJPOl7VI57913qwrx9YCBKVwCzi5z5h18uwH1KDyr45hRCsrEz7uhzzCpzkT0/UQJfd4ORTW8rG59pUfcjxlUcmANSCupuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9Nnn5cONeFpYJiQyDFaEVNlvvMdxSsI4TSj6GPT2W4=;
 b=nmrg/u6XZ+AK34+b2ndi+rtgP4g/0ckOrgNql2iAiUpRu8S34PN5xIWkfC5u9vRETEhd80uK1yVH/2L/oo6DtT9xjDnD7xHlZXjU9wd+rZVjMSBl/vf+hDOAN4lgN+kKgKGUzJFrEj+4npbkPkg/+89Q34P2lTX3JHz0yHlWFkdc92UhlrHDcbW3dWBAOrNmJtwRvmkmlOUTy/1Iph7J3cwh/8lO+3ywXXI3/ZIrVPBT4wCz5+agCNdgyfk4lgFx6ZIzv2mB9E72PQ8UVd2WSCKzvzyjXuaQ6PY5zd81lIAHq6ALl/LnZffapTbQ5DOIC39KuIcCbYK93pwihNghcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9Nnn5cONeFpYJiQyDFaEVNlvvMdxSsI4TSj6GPT2W4=;
 b=I+SpAnjmdLLcAHIBs9wnXBxhbnJAEeFjkATALFeu4qAojUQ37DISjsPX+bZdYjeU0xnnicLzpy9cjmCEqnn61G0YHGCceg5/dKfzcsR/MMSjjYqSNziCvMcGzBeg0OF9GETZO5L/CtQCypHd0tIXc+O8Vw93iRUcFukp6VycTSY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5379.eurprd08.prod.outlook.com (2603:10a6:208:182::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 15:11:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 15:11:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Topic: [OE-core] [PATCH v2 1/3] cmake: drop CCACHE_COMPILERCHECK
Thread-Index: AQHb9/YZ4sZr76TI30mfd8ByNLY7Y7Q3/JGA
Date: Fri, 18 Jul 2025 15:11:44 +0000
Message-ID: <97CF77C0-807B-4D1C-B495-938388B5F356@arm.com>
References: <20250718151017.3153315-1-ross.burton@arm.com>
In-Reply-To: <20250718151017.3153315-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5379:EE_|AM2PEPF0001C70A:EE_|VI0PR08MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c15ecf-fe59-48b2-6a0c-08ddc60d7b50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cEk4blM1eXhXQ1NxVm5Xc29nMGVsTHRLT1ErSEt4Rk4vem1UaHVxOXhjQlhV?=
 =?utf-8?B?WUMwN2o3SGNKODIrVE4zWjczRTQ1dStDZmx5Ris1RWUrVGl6UFNzbTMweGRl?=
 =?utf-8?B?amZMcmhMSW9DRTFTNlU2VlQxSllEVUxOVHFYaVJ2Y2h6dUlGWW1MOUdYclE5?=
 =?utf-8?B?Zi9EYlg5NHVtcnJWZWRzdURIMWttejJxYnY0b1N1V0ZjcFFpVGxSaEZ5d2tH?=
 =?utf-8?B?WWNPTEU3WmFMaER6UFVvQkNzcnQ2Tm0vWElibjZld0Q3K3gwM1ZlYjVrWS9P?=
 =?utf-8?B?Q284eDdBUzRBMlJBVm5LYVc2ZGN6RHdQTUVpTFJxQnd3YmRlTVkwbTVZanRx?=
 =?utf-8?B?ckZyZDltRjQwWWFPOU9qdWZWNDluZjgxWlB0MmRDOVpGZ2pBbkR6UHRXZGNN?=
 =?utf-8?B?K2d5enJsWFVNRnoxNFdmTFQ1TXVCWU9lZEhESU9La2RXNjdOd0QwNUNKOUhM?=
 =?utf-8?B?OWU3N0dxUS85enVLdjZueVJoSGxlTXphdndETWtudkUyOXVGMDNGbFBFa1Z4?=
 =?utf-8?B?R0RqRzZNQjVHTXByK3E2NFNZTHpPSHpubUFxckV3RHN0dlFyR0ZIdy9sYWxt?=
 =?utf-8?B?REc0L21zM2xXSC9FbEU2V2YxMkJHbHVoMEx0d1hHSGFzS3FuRmw3bVF2QkNh?=
 =?utf-8?B?WHQ2T3pXZWhyc3Q2bkIzS2VQOWo0WE9MVzVxcnBqMmw3V3dKeEF0L3kxb0p5?=
 =?utf-8?B?V01rTVB3YlVSZUNNT1Zsc1R3SEZtVUVkL0RtSC9LZDd4Z3lzczIwOVJ4YVhL?=
 =?utf-8?B?MTBHSmovaU15VnNjSUlhdDZjam93VFo2VytWaDRlUkk3eW9DeEZwVjgvMHNU?=
 =?utf-8?B?YTFDRlhrc1Naak1YMlhJa3MwUmJKSWpxQTd3M29ObUNuTytyZkdxLzg2cWly?=
 =?utf-8?B?NGQvdTMySFdvRjVKMnU2UUMwSFRVSGF2V3M2cnFjcTdpZlNsTEJ2YXp3ayti?=
 =?utf-8?B?YlFYOVM5VWZxcWlOUm1FTnFCaDBVVCtmV0FDYlhsOVV6QlpING93c2ltYW8r?=
 =?utf-8?B?QUhOb05jWm9ZK3dMSTFvSnVRbk1jVUE1bVUyd3Rkbm9RUkpndlp2WG1QcSs2?=
 =?utf-8?B?aEJ0K1N4Vy94S3paRVUxdFdrRjYyQmNwZjdZdEYrWXQ0aEpnNm1QS2dwUDFq?=
 =?utf-8?B?MEdTd0wvcmxsYWpkMWJIRnlZYjdkUFdoYU04U3o2cUdMQ1JQRUcwV3FJR0VX?=
 =?utf-8?B?UXNaUkk2S0M2dklSNEdpUlpYMFIycko1U1VwNVlFT24yVFU4dnFpM25zczRa?=
 =?utf-8?B?OGV3aW9hVS9nTlpGeHJWWkUrbXNkMnB5MjlDWjhXck05bFNrN3pWR3YxUkxq?=
 =?utf-8?B?TE9ueTFkMTE1a25YcENNb3FqVFVvOUhZbEVqcmZHUXE3dlhOUU50SEl3dWJ1?=
 =?utf-8?B?OGJBQWdrY3VKMkIvZmd1MnM1RVhwQ3NCYjJqVm1PeGF4K0lMWHpiazd6UThX?=
 =?utf-8?B?LytYamNna1dhRUcwdzkxTnc1Y2o4eGZZS05RQUtKRWcwT0VrVE9QRllzckJz?=
 =?utf-8?B?aC9DOCtZU21YakZWR1ExTTBOck5QY1d0T0ZqNmk4dlozZEZGb1dna1puSzlC?=
 =?utf-8?B?cnV1VlprOWF2RDltWFVKMWlYZzRzTUJrSlQyUW8rMi9ra09zSThuYk1ZWkhG?=
 =?utf-8?B?MW8yMDNBRExGbU1PcWNmTzRNMlFUYndLd1k3UTIyT2VMN2FyVldGQUtBS2x1?=
 =?utf-8?B?N1BReTJWdnpLcVlDbTJZaWhETEdmMURZazJxLzlvSzJ3dGZlUEkzTW5QYjNT?=
 =?utf-8?B?Y0Mzb1hWVXBIVFYwZDJjSmR5dmEzc2dzZ2p2dDdNN3IxM0srQjYyTzUxd0I2?=
 =?utf-8?B?aTBrQ3l0c2ZrNEpZOGF6Y0FseGpnaGhZWGM2NU55OWZpZENadEovbzRUM2E3?=
 =?utf-8?B?OHlUVWRBbGgyRXdmbHlib3ZWNFErYTZOV2NDV3c2QzQ0SE5BTEZBNGgvZEsv?=
 =?utf-8?Q?FcKWqPKpcPU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB7FFB69C245F74BBC68CE569ED27D1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1831cbe2-0c6c-4b74-3999-08ddc60d6822
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|4022899009|14060799003|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekdha2JZaW1LazhqWGZCQnRsTUJydkErT0VmT1NNY3NicDk5WHo5MlFQSlU2?=
 =?utf-8?B?UnFXc0hMZWZWdE5XQkVKOStyRmd3TmhOQXJsQkJCUnEvMHpWZGZtSlAvREY4?=
 =?utf-8?B?QVM0V3VZYmlxZXJCc1ZpMHB1S1FIRE9wdmFmeWlOZ25nUXVBYmZRQ3dHQUta?=
 =?utf-8?B?RytMNWpvMnM5eEQ4RU5maFdrd0cxNGg1eVBRaUxSSjRHOUg5SWwxU0wvOHg0?=
 =?utf-8?B?WHBiZjVVdzBJaCtoZnRpV1ZjUjFUUmlQRTE0bC9Zbml5MWx0M1FWOUFWeUJj?=
 =?utf-8?B?Z0QyV2p2SzRIaytQanNqZzJhRWdjeXZNdG5pcnQxZG9PbHdHWCtzSXRScDFF?=
 =?utf-8?B?WWt5N0JVZGkzSEhxN3VVVEhqNTNINE92aDJyd1ZxYVMyOU9QT0hySHRhSExn?=
 =?utf-8?B?WVJqbXU4R1JLQlg0TGdOU1dQTUhNbFpseDBxTnFkNVBrUnJoajREL2VscnBv?=
 =?utf-8?B?ZUl2OTRvbzVQV1JNNVlrNEFsNnd6dm80d3AyYkdEOWhiUWRBMVg5L01mQVRU?=
 =?utf-8?B?OGVnb3B4YzRQalhXcjZ0TmNmTU4vY1pKVk5iVmxKSnEwTkEyUDZWR0d4VWE2?=
 =?utf-8?B?WVVBdkEyRnRRZHptMVFMV0hDL3hsaVF5NUU3cnJ5NmZGNHlWeUdCa2JQMEpH?=
 =?utf-8?B?MWhLMkVNT0hsQVR4aXJwNGNEUjFDNVlFMkIyU3NUWldrQ3dhc21BbmVkQ3dS?=
 =?utf-8?B?VnJSS3VhNDA4bjBCYzU5Q3VVbHZvMVlIN1JDYS9zNVVjOVN6c2pOVVkvdlYv?=
 =?utf-8?B?Z3J2bkhuMWlXeEloZmpnWmZkMU1KMURrZGdjdTM3RUxIdEE3UmpnQ3p3cExn?=
 =?utf-8?B?SVdRZ3hOVHFhVWcveHE1dXZpUlVIU1Z4d0ltRWZBMGc3cnRaS3VrakZiWldR?=
 =?utf-8?B?TmVvZzNpZ052bElQUDRxTXFjc0VFMVdCYlRYcHc3WUxzMHVpSUlBemxqVWNa?=
 =?utf-8?B?OU84dDdSRFdQWUhmRG8vK3RpdlEvZ2FQUHRGZ2JKRzVpSGl1VHZBUDEzdmVi?=
 =?utf-8?B?azVMbFg5ZDhZRlV5T2RuSHlISm94b0lqMkV5eHBjNGhkSHFiQUdHTm1iRldh?=
 =?utf-8?B?TGFPQUMwelJzc2Z6K1g2aEF5dmRocEJFTG1Fc29hREM0bWZDQmd4U1NvNXdH?=
 =?utf-8?B?azhmR0RPUkhYODBkSUk2cDFUNGh4MzBIcllGNkovbFFrOFExR3RBWGw1amcz?=
 =?utf-8?B?eDBwdUxRL3BkajMzaUJCd2N4YWV0NVIzOFRpZEp6cUROL2I5aDYxU0ZOdGhN?=
 =?utf-8?B?SFpHNDIxL1ZhNHZ3TGgwOGd0L2FvcDdUb2Y0dXBXWWo3aGl6YzcwN2R5dzFh?=
 =?utf-8?B?UXp2dlpzM2lmNHl4Ymk3VTR4aHN2dU5xZ3p2MEZuRjY0TFFJUy9XNkh5Sy93?=
 =?utf-8?B?MjBidEhkMlo0Q2lUNUJSNVNYUS9TK2pXV3l3ZnFvbkxZMHdFa0QwYnQxYzU5?=
 =?utf-8?B?UkZ0RGMzbkxGTHU0NkViV0ZOTEFIV3dSK3kyS08xNEhHRHJVblVHQnZCWmZ3?=
 =?utf-8?B?SDR2d0JqQmtmT0V3TDhEV1lNVWlpWEh1MnBiQXAyNWNxd3ZEckc5eGdEdGJt?=
 =?utf-8?B?bkF3eE1scGdXUlRFRkhDOGMzejNmMmEranUxUXBxYVNOK2RoS1M2NGdpUkww?=
 =?utf-8?B?WS85TU51Z3l0and6aWRKUXU4bGxzUHRsNjh3MTY2R0VtNVNMelpCck5PVXlj?=
 =?utf-8?B?WFNqMzFZTktQVHdUV0tET3lvU25rdTBoRUF2QU5yK2E5ZWZCbUxVZGlOaHRH?=
 =?utf-8?B?emNVdmp6YlEwWHVkQ2ljY3NPRG9xWkhUVENhKzBjREV2clhVZ1IvUVBMR1hw?=
 =?utf-8?B?ZDkvS1JYTTltTGFOWjZXNGpYNFFwQ3BGTitoeE1aMHRRTjRvZFpwREttNmZr?=
 =?utf-8?B?MXpreGd3aDVSYVZ5elZNYVZpWHFkTFJOdG9lSkRPekhlS0V4NUl0Y0NocmtC?=
 =?utf-8?B?WU1YbWsvMGFXa2k4cGZ1OXlZNmE2RTZNbVljYUlIaGU0aWdDajN2NGFSVkhM?=
 =?utf-8?B?MW1DdHZQQ2xBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(14060799003)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 15:12:16.1791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c15ecf-fe59-48b2-6a0c-08ddc60d7b50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 15:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220600

Tm90ZSB0aGF0IEkgZGlkbuKAmXQgc2VuZCAyLzMgYW5kIDMvMyBhcyB0aGV54oCZcmUgV0lQIHBh
dGNoZXMgYW5kIEkgZGlkbuKAmXQgbWVhbiB0byAoYWxtb3N0KSBzZW5kIHRoZW0uIFRoaXMgb25l
IGlzIGdvb2QuDQoNClJvc3MNCg0KDQo+IE9uIDE4IEp1bCAyMDI1LCBhdCAxNjoxMCwgUm9zcyBC
dXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGlzIHZhcmlhYmxlIGNvbnRyb2xz
IGhvdyBjY2FjaGUgZGV0ZXJtaW5lcyBpZiB0aGUgY2FjaGUgaXMgdmFsaWQgb3Igbm90DQo+IGZv
ciBhIGdpdmVuIGNvbXBpbGVyLg0KPiANCj4gQnkgZGVmYXVsdCwgY2NhY2hlIGxvb2tzIGF0IHRo
ZSBtdGltZSBvZiB0aGUgY29tcGlsZXIgYmluYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IC0tLQ0KPiBtZXRhL2NsYXNzZXMvY2Nh
Y2hlLmJiY2xhc3MgfCAzIC0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvY2NhY2hlLmJiY2xhc3MgYi9tZXRhL2NsYXNz
ZXMvY2NhY2hlLmJiY2xhc3MNCj4gaW5kZXggMDFlOTgxNmM3MDYuLjVjZTIzZTUwZjM0IDEwMDY0
NA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMvY2NhY2hlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFz
c2VzL2NjYWNoZS5iYmNsYXNzDQo+IEBAIC00Miw5ICs0Miw2IEBAIENDQUNIRV9OQVRJVkVfUkVD
SVBFU19BTExPV0VEID89ICIiDQo+ICMgaW4gZGlmZmVyZW50IGJ1aWxkcy4NCj4gZXhwb3J0IEND
QUNIRV9CQVNFRElSID89ICIke1RNUERJUn0iDQo+IA0KPiAtIyBVc2VkIGZvciBzaGFyaW5nIGNh
Y2hlIGZpbGVzIGFmdGVyIGNvbXBpbGVyIGlzIHJlYnVpbHQNCj4gLWV4cG9ydCBDQ0FDSEVfQ09N
UElMRVJDSEVDSyA/PSAiJWNvbXBpbGVyJSAtZHVtcHNwZWNzIg0KPiAtDQo+IGV4cG9ydCBDQ0FD
SEVfQ09ORklHUEFUSCA/PSAiJHtDT1JFQkFTRX0vbWV0YS9jb25mL2NjYWNoZS5jb25mIg0KPiAN
Cj4gZXhwb3J0IENDQUNIRV9ESVIgPz0gIiR7Q0NBQ0hFX1RPUF9ESVJ9LyR7TVVMVElNQUNIX1RB
UkdFVF9TWVN9LyR7UE59Ig0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMjIwNTk5KTogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjA1OTkNCj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE0MjIyNTk2
LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAt
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

