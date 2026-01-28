Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED4DD46BF4
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 19:08:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2701.1769627297896774196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 11:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YXnQKifB;
 spf=pass (domain: siemens.com, ip: 52.101.70.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgexX11Qnf2Nkdcjlfmo6hq3R5O72mwPYcZ+68uiyELRiKQ2CK9UrSYA0+AfxkctDgAuyEBq10rVhdMEfVibHRTntUaSTxzYSNczBMo19OrJAw+kms4GucVfVyieN6IgguNEty3J2KqWGSq3TCxGx3LbINfTTHGzDAV0d5vI+pZb5EF8f1DrmiWdk1gurZCusRxRVZOIm052Rg0eBM4sBZlbUWsYv97Ru+mDO1k8zyuZXs/Ol/pGhErLdsD5+sBfRvjo1SvMk/7+5rmwa4jD0xpv6beVBlWsIjCbJ+MkuBU3rQucilGmnJyYJZ1nM9y0N0TXZlxnw+tWcMCp6eNS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+OvK9YNNChv1VwOEoOx+RxgJ5BppPchxJgbkwRi50I=;
 b=HVisZgSwDnUWNwWFJlikIateRfzFNSKEy7Bpj8zKxsf/6HS4FgAkYdS0GfuU1qceIvzxUlsr3ZVSNgOxpfBeOmrTS7Wt16azkCDR5P05VIPBw4FHPmm8CDRrE5n7YTXeJPnVVY3f9s359g70qV4ZSn6pE1tvpGqvdKBxO2lSCNIerl9i4BIZc+FaQdb8aIjfiHGax05GVHhg8+YYNgGS46aAv5O3LIwZYevq7L64aw3qksrnRp20TKB7rQCHBhmpfhIVcBNzczicJ1t5yH8tVRNNLbF0VyMPMemrOGQ/nGDCzU4LfdEANnG8lXJfAQkjImKEAUvsTVcHJNu4L0V1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+OvK9YNNChv1VwOEoOx+RxgJ5BppPchxJgbkwRi50I=;
 b=YXnQKifBOyyKr++fuU9AarQIqz0A3qQ5RXx3/KrPuRv4ZHF8lt3UWQYhkNuXIqKTJplZmCxHMxhBh5pMnLh47HAgYBBHQSTmeSyJvHpj8TzMYeWqKFA3Rwu08By+mWE2Jhu+bDPVGh2RYim9AiOrExKq/xjCvTCaYdx+M/ubGQJMwWXRIbIFfhhKtWlsFcPjjuEeKI+JF7mB0jTn/z0w27HiKos6y2B6guLGZjz/NDgaZ1o+xeQPHOoHUWWLJeljoE6XwuFRU3HkUdDAuBOAiN9blDlalTORyGCXiEsdpQ9itHK2NKN48PGP2abX3xZcF6mjy7RQTe0KxDNiUz07/Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3488.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:134::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 19:08:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 19:08:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glibc: mark CVE-2025-15281, CVE-2026-0861 and
 CVE-2026-0915 as patched
Thread-Topic: [OE-core] [PATCH] glibc: mark CVE-2025-15281, CVE-2026-0861 and
 CVE-2026-0915 as patched
Thread-Index: AQHckFOv5XLedUbDwUa6ySyxI00+GbVn8iSA
Date: Wed, 28 Jan 2026 19:08:13 +0000
Message-ID: 
 <AS1PR10MB5697B31040D6449485183D72FD91A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260125162241.730332-1-peter.marko@siemens.com>
 <995143.1769604191932117173@lists.openembedded.org>
In-Reply-To: <995143.1769604191932117173@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=c85725f5-8df1-4cd2-b5ea-c9cc87f42735;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-28T19:07:51Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3488:EE_
x-ms-office365-filtering-correlation-id: 49e6ad19-7f70-453b-80ef-08de5ea0960b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YTlUV252OUI5VWNlVTFaOWVESjlJQTFPVytGUlhuaG8rU3dKL1JqQ2dmL1B3?=
 =?utf-8?B?TWtTdmRJaEhocVpDbWxqVk9mYzdTSWVLWXRQZXBHc3cyVUExdDNscXRnaHlD?=
 =?utf-8?B?a2dBL1JwWk5ZbVRHMlU0RUhLcHM4b0NTTXJIMm9senJtMUVYQkxpbGVLQ09Z?=
 =?utf-8?B?MjhWQzBBT3Nkck9GeWczNDFZb3V3cW1GY1NQTm5NdlZ3QkFNenVXYllUMGNx?=
 =?utf-8?B?MHpmaWRtT1R5c2VwK0l2RmZ2NzNOZUpqU3JJOEZBVEhReG5lWURHajVaWkRp?=
 =?utf-8?B?Z25jK3Z5Q1BuVmZTVis2WDFrektjdnpXSmRBV2tETjNraEc0eTZHeTVybG05?=
 =?utf-8?B?OVQ4emxIcmVUa3hWZkxoMVErSHFVMVZIbkZPY1czME9wblNLenMxQmdkQmVj?=
 =?utf-8?B?Vmx6QXlrR0hxWW41cFdXRlgya1BZcURKSFY0azh3OU1FbW9iQldwVFFCOXUr?=
 =?utf-8?B?R2xUbk5ONVl0Sk13b2tNSFd4a1Z6ZzRzMjMwM3VmdjVHTzVFalFtUzBtTVg1?=
 =?utf-8?B?TmFzQUFFaDhGYjF3WHo1aklNaUZRM3RhMk90Y3VQZEdZbXJzdVo5TTJ6RGVz?=
 =?utf-8?B?d3hzMG5ISDJQcDdxb29kNzFzcUJEUGVLZ1Y2LytiRTdQS1VQK0Y0MVRTSUZK?=
 =?utf-8?B?UnlwWVlsMVNHTVlyWFRrMEdOc0piVUk3SVZDSDVvdS84dnFvRlYxUEpTS1l1?=
 =?utf-8?B?NmNzUnIxK25JL1o4SEFzSWg0V2xUVURkNnRVN3JUblkxdjYzUTNYRHdkSEpt?=
 =?utf-8?B?OU1OUTFzaWVRcjZCMUJtdENrbThyVm1QTEoraDd4WFJjNlFoYzZmczdIZkwv?=
 =?utf-8?B?NG9FZEM3am8rdHJnVzBpNXdGQmZDU3Z2OEh5RzdCdUhQaDBBSmV3RmdLYUY0?=
 =?utf-8?B?YkNzalcrZElkUEJKRU1SSUxhSDJHOVBYM1R3aFd1Unl3N01hT2ltbm81SDNz?=
 =?utf-8?B?TTVOUGhHVUFqZEVqbngyYVBFdVFwNFJ3MkhVaWNqNHhvQ2lPRGlFaUZLbVlD?=
 =?utf-8?B?blgzbWlDUWFFeFVhb29QZjREWE9tSzMyeWdDR0N2ajlTMjQvT2xDYlI3bEt6?=
 =?utf-8?B?eURzV20xZlcxTERsN2wrSm1Ga1JkR01qbTV2NXlwRlMydExPVHpLak1PREdt?=
 =?utf-8?B?MG1qWUUyb0poenJWZjFPOWtmZGZ1aW1pUHBjVHY5NFRpR0lDUVBlWEI4UDBV?=
 =?utf-8?B?Q25lcTlZUVUvRndrd2VZUjg5dmt3Y3FXSUtNdTBYYUlpR3pFTkZOMElQWDFS?=
 =?utf-8?B?QmFBYmloOWFaVkZKRW5XUDE1UkE0VXRHZDE4alVQR1phWVF5N29WRmpIVEZp?=
 =?utf-8?B?dHUvVWFZVHBtS0dtYTJFckE4dlE3RHVqK004NlFBeGt1czBGeTNhbGlyTzA2?=
 =?utf-8?B?VHMvandxejFHNFp5S0h0cW9OMXJvenlZR010NTRVQlc4eGhVcVdMckZZUGRE?=
 =?utf-8?B?OVZNeEduRFE1VEQ4UUg0c2R5QXMzSVpsODh0OFBRdytFUmhXdHNURmRmZVd3?=
 =?utf-8?B?OCt1M2ozUEZCOFV2RGlSdGgyWXpYR3lGZ3FtNFZSdmFSUnFvOHVaQ1QyaFRN?=
 =?utf-8?B?MytjZFlOMzFZbU9iOWx6MnZZeG90NEM5bGpLcUplR2lrdUg1cElzeHdUeWZp?=
 =?utf-8?B?SGZZcjZMWGZscjJBM1BNSGhiSE9wcGlwTUJVVFpudTM2Sm1EaVV4K1JSdzJK?=
 =?utf-8?B?clphK3VseVJzSlMvbFBNZXJOVVIzSThOaE9JakZENnI1VUsxSzVaem9hQ3lH?=
 =?utf-8?B?T3pWc3RrMkxkT3QzaCtHbmFNK2NwTzZVSlNta0hCbUpJVXlXN3llT3JIbW5C?=
 =?utf-8?B?RHdhS0RSWmFyamFOSDI1Ui9OODA2cU1pVUdjeHlKdlhTdTk0em5hcStGekxW?=
 =?utf-8?B?WllqcWs4dm5XcGhhNkJkVGFxRU1MTXUvTENoSVVGb005NFl4MXk1ck5kRzc2?=
 =?utf-8?B?SHZuSCtvQWI5YXdQcWV0S25HWHdNVDJMTkwyUmNyWW5wQklvN1pNYi9zSWtD?=
 =?utf-8?B?aVZrQmp1WkdIYTl3RVR2dDgrOVV0NSt3emJvYzFvRTRaOXJ3NTlOdGE5ZWFF?=
 =?utf-8?B?MEZ2NXZVcWtyYk9PVS9VenEzTVFSR25lbUIwbnJMUWYxUktHZlJhV3BTUVBM?=
 =?utf-8?B?QXZuOFhNMGUxTGpZeGZRajBiY0Q0RVlhSnhlVTZMM0Ftd1h2ODdHOHFQNy9F?=
 =?utf-8?Q?7Dwv18fOmUqFuxu5FR9Bj98=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a0xuOGtxTFBQSjZOS2tadXplN3dmbGdDejFCaGV2VUFNUGQvOTZGd1llRzJG?=
 =?utf-8?B?Wjl0aUdaNzFWdlhwRkhYNlR1Um5UeWZab3crbHBtMnFjcWJvWkVkZDFQWStZ?=
 =?utf-8?B?RGFNbVdnQ0JJNXZrc0pUckF2elBVbmpjem1RQ01TSi9XQnZEZWRKUnZmS3or?=
 =?utf-8?B?V3B6M1c3RlhZdkt4czkxNFlSK2xMLzVGdHJTSkhOUEs5N3VIcGhWTkNUeWMy?=
 =?utf-8?B?dTYwbmdGNkw2cjhMQTViamVlQ1lHUnkvNzQ3eEkvT25UUFNXbnNGVlhXRm9q?=
 =?utf-8?B?eExVdFJ3WVFIelBsUEl4NWgxekxDOEI0UEw4Rjg5dXVoZzVnMFl4c3o1TTlL?=
 =?utf-8?B?RWk5MUFYc1NWdFVTbkRxMDZVOWpwLytFSnljMktpc3pmdEh2WmdqS3BEYkND?=
 =?utf-8?B?ZGcxZ0dHd3A4dUFSNG9sWGRTM0hSdDVGSFRCMUxVeXNHT0tlMkR4a0xBZmZy?=
 =?utf-8?B?bjBBZWNFTjlGc3IwVm50akxXM3YxVVNEY0JLaWFPbmNVeG5jYVRWSFZmc004?=
 =?utf-8?B?bGFpUlhVSVlCdHl0bjlVejRoRnlQSmViRkJSQTFSdCtBL0VadVlIVmdTZlNw?=
 =?utf-8?B?RFZadWQ4aTRWYXhqbEJxZlYxS09aZXdMR0phTnNUOWhaczNPekZlMDl6Rk1U?=
 =?utf-8?B?Vy82bFhLck9ON0RYK25KRDdMa3dta2RrNW9ZSUNSelpZSTd4MlRFd1d5c2xY?=
 =?utf-8?B?MEV0MGN6cllxWk9mWTZTYUdXNEhTYWh3K21PNEJDdU5oNjh3MG1vWUZUR3Ax?=
 =?utf-8?B?dlpTL3pOd0xWd3Q1ZDRKcy9nVUZwY0ZRVlhMOTNWM1UzVzI2RmhXRk5Renpy?=
 =?utf-8?B?a0J0aGNDRkR2eUdkM1Vsck1OeTM3SThYaTZVMTlNVlN6OHVCanhSUnJ0SUZW?=
 =?utf-8?B?Y2pQSUdUQkRqYzNIZVZBWVBoeXE3T3FVOVhDV0ZhOXYyamJTTndsK0dlTEkv?=
 =?utf-8?B?d1VTN2xpYVNFalFTamgrd0JYRDdzY2Z3bHdWQjU4b2JrdkFzbWtya2VrZXV4?=
 =?utf-8?B?blNsR0s5bHhyVnBkNGdKS3VpdndYNWpEWlNQa2owV2doQUZUV2E2OEJYWStv?=
 =?utf-8?B?QTd6R3RQNVFrVlNkeTlZdUNWUEs1Y1cyaDcyeFJ3TFBSdlovVitIQlBTY09P?=
 =?utf-8?B?czgvZ3F6ZTBmMGx0SDhqdVRWdHVWUU5JUTdDcHUwQlVkam1JNkMrU2EwQXZ0?=
 =?utf-8?B?cGxWYVdENFBTbmp4SUV2c29RR3FScVM5TlpNRnkvUStiUVJjKzExcm9wMEVw?=
 =?utf-8?B?ZjA4alV1eWk5aUdkR0IvZHVYMTd3UEZXclFQMVV5MFBNN2NPTHBkZWhLYld6?=
 =?utf-8?B?dWEwV3hBK21sdnloQjBUYTVLcDhza2dHbDFMTGhITmN5dUR3YzhIUmtSWjNs?=
 =?utf-8?B?clE0S0wxQjNzb0s0Sk5FUFZMM0tKVVFhZHdqNFFVR1VHNWpENnVnRmFIMEl6?=
 =?utf-8?B?VGZtSmsyY2M1MUswNHhUZmRleWxNT2gvQWtTYm43TVdZZjVkRytrNnNWQ3Ay?=
 =?utf-8?B?UmFCVFh2TE5ZajhYaEZ1WFJiY1ZPZkh6a2U1U3dkRmJGNE5FZTV3UmVremxw?=
 =?utf-8?B?bTg5bUdEdnlOT0VJL0xsK21ZaS9tNkZlZ1MvWDJuaTNweHZsNFpmOU5BaE54?=
 =?utf-8?B?Ky9RU3RncEhNRDFWQVhqL2E2T2RNZjV4ZGlOYnpUL1pib0Z2cFgyL1ZON1Fa?=
 =?utf-8?B?WUZ2cWxMMEczek9HbnYrYzRpeEtadHNyVkhqTW40RG10Um9iY1NheTUxNktE?=
 =?utf-8?B?dGp5ZlNubVlmd0V6ZVRITmNaZXlQNXFsS2VnS3E5ZzI2dldkNmhibnBmRXJJ?=
 =?utf-8?B?N2xHYzNYc1Z0cENBZ2tpUE5kTmhBQWJWdi9aM0Z1b1BmOHo4bHJTZCs4ZFVO?=
 =?utf-8?B?dE1XaFRtV0xCakY3ZEltMVhncFFIUjN5YlRCWDU2dSthUnJTazlPSmtqWDNm?=
 =?utf-8?B?YW83Y0pSU3hDNTdIK1VtTVZnRi9IZklPRVRtWUQ0UmEvSHVMMWxGSE5BOWEv?=
 =?utf-8?B?SmtOMTVxQzNmYkNmaklvaW5IYU0yYlg1Y09SWmIzWmRTVUNHcTFRTUh5VDJ3?=
 =?utf-8?B?M1pCQW85ZkF4eTJ6QjYvZkFFcmVtV2VZbFNabkRaZU9JUmVxRWt3QmpKLzlS?=
 =?utf-8?B?OE9oWmY0WGl3LzlKSGc2ZlVxOEVtMnQxTkxLZ3RXa254V2c1UjRWckVJeTVF?=
 =?utf-8?B?VEZWMmJla0x2RDhjU0hrUW1xS25yRHlQZ2pQUTkzamxCYjRMdzBSWWdJeGkr?=
 =?utf-8?B?RFMreVE1bU1sQjVObFJmdnZVU2FZcFp6V1lMbDdxKzR5UkxyR0VXanFEV3RO?=
 =?utf-8?B?blpwZzN2Q0NmSkwwaXNwUGFzOWJML0RMS0I0TDBUWG4vQUpkc1R2UT09?=
Content-Type: multipart/alternative;
	boundary="_000_AS1PR10MB5697B31040D6449485183D72FD91AAS1PR10MB5697EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e6ad19-7f70-453b-80ef-08de5ea0960b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 19:08:13.8091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ScAEDbBtG81RqLeb1HeYbDcO3WU6SxLSM3FjO1jGhxTT07ORb3psvqPsKm/uLWswvygp7F2JczmEXmjv85BVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3488
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 19:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230108

--_000_AS1PR10MB5697B31040D6449485183D72FD91AAS1PR10MB5697EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciBub3RpY2luZy4NCkkgaGF2ZSBzZW50IGEgaGFzaCBidW1wIHRvIGhhdmUgdGhl
IENWRSBmaXhlZC4NCg0KUGV0ZXINCg0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
T24gQmVoYWxmIE9mIFZhcmF0aGFyYWphbiwgRGVlcGVzaCB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI4LCAyMDI2IDEzOjQzDQpUbzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0hdIGdsaWJjOiBtYXJrIENWRS0yMDI1LTE1MjgxLCBDVkUtMjAyNi0wODYxIGFuZCBD
VkUtMjAyNi0wOTE1IGFzIHBhdGNoZWQNCg0KT24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMDk6NTkg
UE0sIFBldGVyIE1hcmtvIHdyb3RlOg0KLUNWRV9TVEFUVVNfU1RBQkxFX0JBQ0tQT1JUUyA9ICIi
DQorQ1ZFX1NUQVRVU19TVEFCTEVfQkFDS1BPUlRTID0gIkNWRS0yMDI1LTE1MjgxIENWRS0yMDI2
LTA4NjEgQ1ZFLTIwMjYtMDkxNSINCkhpIFBldGVyLA0KDQpUaGUgY3VycmVudCBjb21taXQgaGFz
aCBkb2VzIG5vdCBpbmNsdWRlIHRoZSBmaXggZm9yIENWRS0yMDI1LTE1MjgxLiBUaGUgaGFzaCBu
ZWVkcyB0byBiZSB1cGRhdGVkIHRvIGluY29ycG9yYXRlIHRoaXMgZml4Lg0KDQpSZWdhcmRzLA0K
RGVlcGVzaA0K

--_000_AS1PR10MB5697B31040D6449485183D72FD91AAS1PR10MB5697EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkFwdG9zO30N
Ci8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYu
TXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWls
eToiQXB0b3MiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6IkFyaWFsIixzYW5zLXNlcmlmOw0KCWNv
bG9yOndpbmRvd3RleHQ7DQoJZm9udC13ZWlnaHQ6bm9ybWFsOw0KCWZvbnQtc3R5bGU6bm9ybWFs
Ow0KCXRleHQtZGVjb3JhdGlvbjpub25lIG5vbmU7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0
eWxlLXR5cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzQ2Nzg4NiIgdmxpbms9IiM5NjYwN0QiIHN0eWxlPSJ3b3JkLXdy
YXA6YnJlYWstd29yZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+VGhhbmtzIGZvciBub3RpY2luZy48bzpwPjwvbzpwPjwv
c3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEw
LjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj5JIGhhdmUgc2Vu
dCBhIGhhc2ggYnVtcCB0byBoYXZlIHRoZSBDVkUgZml4ZWQuPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9u
dC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+UGV0ZXI8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEwLjBwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmIj48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3Jk
ZXItbGVmdDpzb2xpZCBibHVlIDEuNXB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNC4wcHQiPg0KPGRp
dj4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0UxRTFFMSAxLjBw
dDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVv
dDssc2Fucy1zZXJpZiI+RnJvbTo8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgJmx0O29wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcmZ3Q7DQo8Yj5PbiBCZWhhbGYgT2YgPC9iPlZhcmF0aGFyYWph
biwgRGVlcGVzaCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxicj4NCjxiPlNlbnQ6PC9iPiBX
ZWRuZXNkYXksIEphbnVhcnkgMjgsIDIwMjYgMTM6NDM8YnI+DQo8Yj5Ubzo8L2I+IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8YnI+DQo8Yj5TdWJqZWN0OjwvYj4gUmU6
IFtPRS1jb3JlXSBbUEFUQ0hdIGdsaWJjOiBtYXJrIENWRS0yMDI1LTE1MjgxLCBDVkUtMjAyNi0w
ODYxIGFuZCBDVkUtMjAyNi0wOTE1IGFzIHBhdGNoZWQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMDk6
NTkgUE0sIFBldGVyIE1hcmtvIHdyb3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0K
PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbi10b3A6NS4wcHQ7bWFyZ2luLWJvdHRvbTo1LjBwdCI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tQ1ZFX1NUQVRVU19TVEFCTEVfQkFDS1BPUlRTID0gJnF1
b3Q7JnF1b3Q7PGJyPg0KK0NWRV9TVEFUVVNfU1RBQkxFX0JBQ0tQT1JUUyA9ICZxdW90O0NWRS0y
MDI1LTE1MjgxIENWRS0yMDI2LTA4NjEgQ1ZFLTIwMjYtMDkxNSZxdW90OzxvOnA+PC9vOnA+PC9w
Pg0KPC9ibG9ja3F1b3RlPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgUGV0ZXIsPGJyPg0KPGJy
Pg0KVGhlIGN1cnJlbnQgY29tbWl0IGhhc2ggZG9lcyBub3QgaW5jbHVkZSB0aGUgZml4IGZvciA8
c3Ryb25nPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtBcHRvcyZxdW90OyxzYW5zLXNl
cmlmIj5DVkUtMjAyNS0xNTI4MTwvc3Bhbj48L3N0cm9uZz4uIFRoZSBoYXNoIG5lZWRzIHRvIGJl
IHVwZGF0ZWQgdG8gaW5jb3Jwb3JhdGUgdGhpcyBmaXguPGJyPg0KPGJyPg0KUmVnYXJkcyw8YnI+
DQpEZWVwZXNoPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+
DQo8L2h0bWw+DQo=

--_000_AS1PR10MB5697B31040D6449485183D72FD91AAS1PR10MB5697EURP_--

