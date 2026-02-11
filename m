Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF8DEB594E
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 02:23:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9939.1770776613712839354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 18:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=arTq7mFV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e09c5b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AN8nj03503357
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:23:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=McXKvqV+hDxjxRSe5V6A/2
	8JywvDgN/fOehC5cxiZJU=; b=arTq7mFVfS1s7IBq55U6F+Ttrgxzs11cvz0Vsj
	L03q1E+P57FoLHVV8Yx8i6QpzfsdtLPdm6dBpnllca1HRI7+V10Usw6rQu2AovoP
	mIupRo/uKfc0GuOF9U8GNgeq/aJzYMPk8FGp7CaUXM3FsUUzNNc2nRbbRG6u3gEj
	EKPx5XvihFJjBhtnG5qzgX7LD/tZMY6rDMsy0HVg4jvsfgt6j4+QmTfiKNAUh7UO
	/xkC5plKiMsjdf6imTYcRtyYvxZKbPg7oVgtGFsksyiWoEBCjHC9L1xPY4o2MDDF
	y9ystKHjkqC4hhaEfsfw8PCldJQM41pJ6c4JkYbz1oWph1KA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj3t1f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 18:23:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTsHWl6pC6FQPFcVvRP8M5d1G5HJVCRQmxqDgpKuNoHIF/0dl2v2Hr8ASsXjy4WQPXV7KfABHQ4kWNMv3YQYdJguJvZiZuu/Bbj/9aY6XeM91gq4cvaCtCQ6D+0JtWWM8TWMpKbYjhwbA63M2M5dwRW/T26izuavJ6+hKO2k5ZQy8lQXipQDP9SRBvT/0KBv82jQ6EcMWdwMQuuK5jOeaPva14cCXeMXH3zYrGW5ZbNUH9BNxyImDs2U/yhQmDRaTW9ZeELPhZJI1/WGXdMXzpuJO4Lirmxb9fArdZ306lTD8MFDA/7gmRUyB06S4hJzSGWk0B+6pNogRXiMV65ZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McXKvqV+hDxjxRSe5V6A/28JywvDgN/fOehC5cxiZJU=;
 b=qXxigepizoUOp1nmciR3Mt4+ThI7rwbe09z1QtFcOMFK0xwVaRJM+52bEymlhAYjAzB6i5e8crbaxh/tmylEcTedOi9anOrEw5f3zD/ZjkeTA+88eepAVfXTFX4AAlNbaqQ6ibq8AfIw6Pdh33kK4kS4fOquvPoI5JU0iLpo3ef5J5eofRDLetvTZGfOt4Ud0QkBgIJi0Z+It+VA/WEVvuGcuADra2c9GHN2JUrIUeI4J1SwKa57t6iJjWnTeJ6Y2k7AYUQznGJRF8YtPLQaGEEw8e3bQYaAvxiz9SnhPjskwevnfcCY633jwmnRuPwxNHZJ77qSHWOd1mrYBdPMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:23:29 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:23:29 +0000
Content-Type: multipart/alternative;
 boundary="------------olVRjnWIKuaIK0BMU60jL0z3"
Message-ID: <a2f62f5b-6c1e-4aae-ab4c-1d14905df6f7@windriver.com>
Date: Wed, 11 Feb 2026 10:23:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] vte: 0.82.2 -> 0.83.90
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260210095025.633860-1-hongxu.jia@windriver.com>
 <CANNYZj8-pjs91R-TiLUo22nZ+bWAyN-P084AmAUPuyY-GY1mQQ@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj8-pjs91R-TiLUo22nZ+bWAyN-P084AmAUPuyY-GY1mQQ@mail.gmail.com>
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb8c895-da5c-4fe8-33d2-08de69148b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ym9CaEgwWUI3TW1Td1hxNGFleGpnVkthSGdqNlBTRXA5azVNTkk5d0htTTll?=
 =?utf-8?B?SlphcWhCbnlKWlFiUi9hQitEWlArMHA1NW8zZVJPSnJzVHIvbm4rOTc4Tmpr?=
 =?utf-8?B?b240bFllVDdLRndtdEpDU3RqalJqaVJMTGRGeFpqNGpILzBCLy9TODcvc2da?=
 =?utf-8?B?N1phMjVKbzNoaVY0MDZRd21VclpKQUtDS0xKS3BCUXYrdUdRRFJUVGNsUlkz?=
 =?utf-8?B?eGY0RjVoR0FPWW9laWRhbEdKb2FWMHF0aVdJcmZ3TzV0U3R6RzFFQ1p6YWxp?=
 =?utf-8?B?RXgwdkFnMFZrKzJHdFI4YXdGbkFIQVk4U3hnNnVZUGY0a2lnOWhMWWR5ajh3?=
 =?utf-8?B?SUh4UHNmSW4rMy9reWpUTnFLcDV2VmxFZVpkTGo5b1VQckZjTkk1dmNwcC9m?=
 =?utf-8?B?ZXd6TitGRVIxNDByWmxvUjNFNGFjckhvcktTeTNaNWVPNUh1TGZvU3RYay9L?=
 =?utf-8?B?R3o5K2VVZUl1TkorZkF2d05jdXV6dWc5VmpiemR6aVV5aThEU0dLa1ZIUGZR?=
 =?utf-8?B?L0M1dUlURnZWa1J1MUxUa2oyenNhV0V0QTBCTHkwRnAwMExjUWJSaVpuVWNE?=
 =?utf-8?B?aStsYWp2TkJHSDlNbk9MRTRVZWoyUzZtWDlzTXE5L2hPNlZPN29Nb0RkWE16?=
 =?utf-8?B?dEEzcWpaRjRRYXBpbHQ2ZGxuWWpBWTN3bEJDMjBpbFhLaTlXdTJjN3MydUFK?=
 =?utf-8?B?VjZudzlFY3ZPY1NpSGFWY2FWdWZWakt3L2pCV2NUWXFITkNUeGNYa3R6SFIv?=
 =?utf-8?B?MGM3VHhFQUsxcHhxT2pxc3RhaUxWUFUxcUtYUHhvajJFS2FtRGRJWHg5NnVl?=
 =?utf-8?B?SHZSTUFpdlUrU3NEOEJoRXhUUVNqczhEcVB0QUVsSmJwYjUvK1ZsaFRhdVF3?=
 =?utf-8?B?ZjRoVGo3SzRxZTAwOEFwQlY0c0JGaEhQNDV0VFl6cVZUeEx1ZU1lanVzdFhJ?=
 =?utf-8?B?ekw5R3grcm95N2NrQVAzbkgwbkFlWm9ZZTlKb3NjdUVZZUFHSWk1V05wbS9p?=
 =?utf-8?B?czBobEVBeXo5VWU4NGJBM0R5a2RBRGZ1RzNFcUxxMGxPdlNTNlBDUHhGUHVu?=
 =?utf-8?B?c2U4VUo1SERYTUZWT01GWVJOU09lbUZadTF5dW5GZVJWdGYyWUEzdys2b0VE?=
 =?utf-8?B?ek16OXRRQngyUDc5eXdTaFVzN1BZWDR5R1RXdU9nOGFHV08vdFN3SVlMR3R2?=
 =?utf-8?B?a0ZNZ0hGSFF4dHlLbEREajU0UVJ6UE1JNTgxYWc4NFJuZUMycmdoZitMRkN3?=
 =?utf-8?B?ZlRTSTVOWElRKzc5enpseXlucDJ3WXRtdXdoUUlvOEwwY2JzUE5vWXZBKzdR?=
 =?utf-8?B?UFJ0KzlXbVoyblBzRmF1a2tyRjhoSmIvYyt4WWhqK3dOdDlYbFFQTHBmZ1li?=
 =?utf-8?B?ZS9hSytueE84ZTlkc1h5Y3EwNXNjS2tqVzU2anlVdDRJQ1V6M0x3MFY1VmF3?=
 =?utf-8?B?SUNHczZSZjRFQ1gramNSaUx0ZWJCZW9naE1oby9PQWVMTkQ1ZW9hNE9NOTBU?=
 =?utf-8?B?QWVXdDd6eXJkUi8rZ3ZVYnQ4S0J4QlU0bDc5MXB3WU5abWVncDJML3gvaXA1?=
 =?utf-8?B?Umg4NWt2eEdSS3ErVHNQRm9Wakt3QXR1WkJSL0xIdEJKVGtnYngzUHpUWkho?=
 =?utf-8?B?UERWb3Vrek9tdGZuS1VMaXNqcDJRa0hUOFFMbEljRWJlNGFNUS9IeGtoeUpW?=
 =?utf-8?B?dHNvdi9wNXNvVElMQXlMaVM2RmVzb0pqQnpvTnREYzZuZThyTW8rNTlmeHFy?=
 =?utf-8?B?dWE4NGFsa3lzOFlsNTlqVzZrRGU0dmVySVFWcXQrMnlrcXpuRXMzWDd5ckg5?=
 =?utf-8?B?ZXhHSEVZOXMvVmptTXEvUW9qN0p0YmtIbE1NZldPODNibkRZaWxDNENuYzd2?=
 =?utf-8?B?aDczMXlqNU9FUWorazU0Zm1aTjNsc0ZhL3pWT2tMU1o0bUYxUTBFMjBPd1dt?=
 =?utf-8?B?ZStldlhzRitLOUtRV0pzYkNvNTRPeEFSbithZHg5ZWNCa2dmMlhMMFhCcTlV?=
 =?utf-8?B?dE8va3o3RktqeDlTa3c2KzVtYzMyZURZdGU4dWtDcktGVnlpaEdxVXd0VXpO?=
 =?utf-8?B?WEpJT0lCYjlOZGlaTDJlazdndGlkVDlVbjBSQXVaYjlSZzBwTkM2c001NS8w?=
 =?utf-8?Q?Tow0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDV3WU4vaG5PUWxGREhnOUlhNmxHeWVnWU5laFRRK2JSelEwU0I0SEtMOWgx?=
 =?utf-8?B?WWRmOEZBL3FBdHREeWJTa3hWN3p2TzhsZ0lldjE0aTdNQVVjeDZxYnF2bFZn?=
 =?utf-8?B?dnBKY3NYNEhmZW1jM0k5TzR5bmpPSDNrMUdRRDZEbzByb2NFb1lNd0ttcVpH?=
 =?utf-8?B?RWR2M0lnaU1yQU9XSSt3Y2F5Vmg3TWR5THFHTkxzZ3FqRzNEM1RpYzMwVCtO?=
 =?utf-8?B?OHFwdlBYenRjWUt6ek5zTGdRU1N5NWNpMWE2T3RlWnA1UWM4K1lNbUMwRm1N?=
 =?utf-8?B?OHFtWTkyaVdpZHFXWnhScG14THd6TVp0UlhadmNKZ0xzNklCQ0hwQzVPenFP?=
 =?utf-8?B?MDJ1VTIyaERxcmFnN0ZkcnROdDJBbzJLQUNVOEUxbjNQU2lCY0tvM3dnN3U4?=
 =?utf-8?B?amNZR3BmVDlzSmlIZ0V0K3l0SGNQSTA4S2VIS0xTV0JhRXZ3SHpxM2RUL0x5?=
 =?utf-8?B?N1FtbWJ5R093ZHo4VVhIcHdYY0ZPaE5FTU0vVXlsUWJYNzhoVys5UHl0OG9W?=
 =?utf-8?B?Y09zdGZKNXVpRWNSMWowWkxxVzFIZ1dSa2FNNlM2aU5MWTFYVHlFTFFmVEQ2?=
 =?utf-8?B?bCtDb291ZUh3b2tTNUNPbklYRHNlTE1GcGpQZ3FYdy9ReEpHYnNZUERYdWkr?=
 =?utf-8?B?U0NGMGVMWHk5RERrOHloZXZ5ZVU4NkdVN2svVjNNTzh6ekVQOTdjY0k1OStM?=
 =?utf-8?B?bGxHcHI5YlRFMjNKVnJJYUdFL3RFeFE2akNZVzE0Wm9IdXpFVmJXSXVwY3Fu?=
 =?utf-8?B?MkdjbW4wamdlYkFqQURqY05BcTJaMnE2Q29vSVYveVRkRlRHS294TC9UR1Ro?=
 =?utf-8?B?OXpvRjFNNkZzbHNEUlNJVitXNm80b3dybzVPTm91SFdrb1pQT0J0ODJwTWRi?=
 =?utf-8?B?c2ZhczFrai8zb1Y1Z2I0NUM2NjA2THhja3FMeXVORXBTaDVHYlg3SksvYnlY?=
 =?utf-8?B?R2tLbzZxK3ZkZ2MvbVBNZVk2a3dCZVJyRUJ2c2NYc0t0OXd4SU5lQ3BpZVVP?=
 =?utf-8?B?WHlsUkZna0prc0NQVFR1L1VaSlRBNVJ6aEF4RUVIc3VQK3VvMUFaMTRJenZv?=
 =?utf-8?B?SkE1VEZxZy9FKzRtNGlHcGxNSkRIa2liQXdQa1VQNDRUUFBDVkNDQlNMTGhq?=
 =?utf-8?B?Y0tnOE9ZYnRJOUtmL0JuWlRxQ3ZzRDUvM1pPaGZYNERCdFVVeTdIN2s3QkdU?=
 =?utf-8?B?NHRKTTNNZHF4UzlHWGVYS0E4YS94QWtOeWE2U3hldU9HeWs4UjcwQzNBRHl6?=
 =?utf-8?B?Vmd3ZU9GcFlnYjgwSXVyMXYweVg4SUxkOVgwclhzdzIwa2Y0Y3lzdzhQOCty?=
 =?utf-8?B?NDl2STFuTThJcnh3aUVtVkkrVGhSV21uK1B4cVdiaTJnZ3JSZmRvVGlSWlNZ?=
 =?utf-8?B?cVlOQ2ZNRFFtc3JNcmtKdWdocFR5SWhoT2RXV2I2VFNzZFRvRWR0WDFXZHRK?=
 =?utf-8?B?V2dnNVJhZEwwbjBmNHpNSkp0ME1kaHRVbmo4U2Z0ZGd1dDN0OUVKK1VMSUpn?=
 =?utf-8?B?cWI1VWZpV3NhcUpMVVJJN2dZMmM0WUpGNzVTL3c5S0s3QW1uZGw2T0I5N08x?=
 =?utf-8?B?bWpuY0hqNGE1TWJZamkrNHlvR2hLTXBrVUZNYWNaenh2ODdrcjNoZVRFd2xX?=
 =?utf-8?B?TXdMUER1VFdZeTdLa1hKOFFzZ3RhdHpGbXJ0L1dQWDcwd2FWd1JDYnQ3UU0r?=
 =?utf-8?B?L010T3o5TThSVTZqZEQ4SzI5WEhROTZUcTlYZk5DZEl4M2tvbWRQT1B1TERG?=
 =?utf-8?B?N01vY2tCVDlKUjVZWE15SXRYN2hzV1BRYTBabTZ2WGFXNE84ek83cnBNazdI?=
 =?utf-8?B?V2ZxK1dLKzd2R0MrbmZkQ2F1dE55YnhSdWFFT3ZaZEltblRzWStKNXI2VGlq?=
 =?utf-8?B?dUgydEZvdXN4NmhhTnFiU3Q1YUlxK1RuN0VJWXlLbkRXVnJ3VTZxV21SdXMx?=
 =?utf-8?B?Um0yUllncXhwbWsvMWJia212dC9jRVh3TmFqK211Qk83Q2k3M0NOOXl3SCtP?=
 =?utf-8?B?SURLbUJ0c1UvUEtLQ2ZZTlBxU2lGYi8ydi9CQ0JNYm5ON2lYVG0rbE9PTk5H?=
 =?utf-8?B?V0RMOE8wRk9iN0Vxd2JxQng4Y2cwdEpzYnlyYmJ3V05wOWtDV2gzMVN3clVE?=
 =?utf-8?B?bFl2NStmZVgxeFNKTCtqbXVVTW4vNkQxN2FwWmFsQ2EzeFR2MmQyTlJ2WGZO?=
 =?utf-8?B?dVNENTk3bTQ3Y1dqa0lyZXozdU1Wekw4Z2graDNqN05CVTIzekw3RU5WSVlj?=
 =?utf-8?B?SkdrQ2I5Qm50UGdLVkJkTzA5S2srKzFhM2Y5YllTTzZYODB2eU5YUmJTdm9J?=
 =?utf-8?B?ZUlWTlhNUzVsd3BDNUVsWmNFUCtrdkZJR1VzeVRPekRiWEpKbTZ2Zz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb8c895-da5c-4fe8-33d2-08de69148b83
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:23:29.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQJWbIt9LEBv2mnzwCUYIJMsQfQAuzrX7eoZBFP7wxtS3IFBhqoO/ebeT/CZh50jPZV60HsdyYfKhT2vthjU0auvqfsClu6W3MliX3yEJgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 3B0L1XX4G7jQXJmkdbI-w0dyJEFlTZy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAxOCBTYWx0ZWRfXzQHUAd8pcxj8
 CzweQGaMvv3306PoE631FpjMVprHOtB2nsalpctPxVXzcPg1vPpGfwYPVfbNJj68vTquUK+53ZW
 xuN7j8HiJX345xor6mDurQtgzCtyAG5/+LeHunfTvpgbgZHm1doevUryFNopOw/So2sm8vR3YKd
 /17/0Ya/JoUzg7rdoVmCua21cHOgGJJ9T0EO2A243bURguUVNdpOe15zeO6rWQV0otCUoQYWSPS
 HMbSwL+LmGh5ZbxZveXHCejH58C8w49UvfMyufQ1WotJTcsRyBkQisW/toPzk5ZI221h0LMgCM3
 nlpex7OvOlYe7WFPin9FOKhEGyZG8iIZStX/CpiVw0Oq2H6SBXp9y7E8lEpRTUN4buf0I3sWCsN
 pq7JjC6ZCh0+2p+RkEpLjSL6ZJUNh/kFe4hl2eAi5SJKkj80bIfrqXF1P3/9dyCfivtfyygTuY4
 EHVyVhocvS2oYd5uIJg==
X-Proofpoint-GUID: MKs7V-n8w0hDLaKTYgvKrZeAmjQARQBU
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698be825 cx=c_pps
 a=JJStoDgKLvGmSPu1zToK9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Q4-j1AaZAAAA:8
 a=QP8B-6YlacSzq-4UwIMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=pGLkceISAAAA:8
 a=ktOyJPztaX449sVuNHoA:9 a=Zl30NWpstgsvkUdO:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230944

--------------olVRjnWIKuaIK0BMU60jL0z3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/26 17:54, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 10 Feb 2026 at 10:50, hongxu via lists.openembedded.org
> <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>>   .../vte/{vte_0.82.2.bb => vte_0.83.90.bb}     |  4 +-
> 0.83.90 is a pre-release, we should wait for 0.84
>
> Unfortunately gnome release schedule always is just a bit too late for
> yocto releases, and typically there's no time to test and merge
> version updates. Can the backport be added to existing recipe?

OK, let's wait for 0.84.

The backport is not necessary for 0.82.2, it was introduced in 0.83.90 
and fixed in development branch (master)

//Hongxu

> Alex


--------------olVRjnWIKuaIK0BMU60jL0z3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/10/26 17:54, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj8-pjs91R-TiLUo22nZ+bWAyN-P084AmAUPuyY-GY1mQQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 10 Feb 2026 at 10:50, hongxu via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia=windriver.com@lists.openembedded.org">&lt;hongxu.jia=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> .../vte/{vte_0.82.2.bb =&gt; vte_0.83.90.bb}     |  4 +-
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
0.83.90 is a pre-release, we should wait for 0.84

Unfortunately gnome release schedule always is just a bit too late for
yocto releases, and typically there's no time to test and merge
version updates. Can the backport be added to existing recipe?
</pre>
    </blockquote>
    <p>OK, let's wait for 0.84.<br>
    </p>
    <p>The backport is not necessary for 0.82.2, it was introduced in <span style="white-space: pre-wrap">0.83.90 and fixed in development branch (master)</span></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj8-pjs91R-TiLUo22nZ+bWAyN-P084AmAUPuyY-GY1mQQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------olVRjnWIKuaIK0BMU60jL0z3--

