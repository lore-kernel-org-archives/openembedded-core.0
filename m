Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5547CC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 02:45:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16306.1754448327366162117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 19:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03130c4a15=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5762KDKj2029212
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Aug 2025 02:45:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyerder-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:45:26 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5762jP3R2069748;
	Wed, 6 Aug 2025 02:45:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyerdeq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 02:45:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+FKhsQKCCOn2QGQnBX1JKlImyIAL6n1AVj4EvOXhm89KzKe2g5kZwxlf93BBNfhOXELlCK5bWD8hfW6vlTUNiwyw8EjGL6HEDvFidmmrLdeIJOipq2TFsTSFy+Yf6jDrbQFU1FUdKXqkGNlseXr+8uSGnEGU/CyXMVmT8FNWiQ6NCypPC64GzpCE/JwwOJ0EJq8WAXjcvtBL+gU1ue6z3iBCas+SuDZ/TQJa4csZNJbvAoprEQsmHtMonzx3TwCyuP7FUHYyvN3zpG+hDzS2E8x/hSIRbKfkmAL5BWbBLqG8rEVQS+NZpoO1vdWbFqj7GP5yeT7Y+rvVcZJzzMNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0Qt1pzztEvKUcmBSG9hIZ7gy4427z3BIvK7G+2p5Xg=;
 b=L1ckZBmeP/G1gEHvay7/5hEnsz9bKDlVuGkIYdO6FasoY8kpvyjYjsiQgiq3Oy16f9P1q183f/KCWSSbLdiQusVMK6j4203/pdKuvOmAohiwLlvmyhtN5uDQMR+YM4jFOVmbATr+EsvP9FTu5ngzJ6dFEJT0A2ruK8lKDZLezJ0mxBLq2Jc8if9rBJ6Hz8mYjLD2pAw2A4A+PFJ+KVLjVj3h4ZTL3Vhanz9brBRe0ILnnX+O22gqnQHHnr0GNAKuryqq+OA9i2DGMOuH7uUS2bslLEY12C20aIsNtlS7Ayxkg6tKGjqP4FMH0CLId1e+GmNOsL3LSIp53ngtyvc6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Wed, 6 Aug
 2025 02:45:21 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.8989.015; Wed, 6 Aug 2025
 02:45:21 +0000
From: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] runqemu: fix special characters bug
Thread-Topic: [OE-core] [PATCH] runqemu: fix special characters bug
Thread-Index: AQHcArBR8p2r3X7iV0KCT397gDR12bRNu1SAgAc3ktA=
Date: Wed, 6 Aug 2025 02:45:21 +0000
Message-ID: 
 <BN9PR11MB53542B07311DFD2B946D9256DE2DA@BN9PR11MB5354.namprd11.prod.outlook.com>
References: <20250801064828.2904332-1-libo.chen.cn@windriver.com>
 <CANNYZj_jPS8+nSmOr+chi3HAbcN9q5pj=9sU53P9gjP7OCoYxw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_jPS8+nSmOr+chi3HAbcN9q5pj=9sU53P9gjP7OCoYxw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=5d642013-1296-4954-b173-94a5f2a04017;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-08-06T02:45:15Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5354:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: 8e6f9226-4604-4b29-515d-08ddd493497f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SjJFT2M3eFlyZXJOMWhqZVFTelV1T1N5UjdJL0pQUDNVTWd4dUpFdFJ1VzhD?=
 =?utf-8?B?MDI0Z1U1SWFpcHR0MDFFcE80bjh6RlRKNW15UWdaeHg5OW0vZGlkdlJQaGUr?=
 =?utf-8?B?ZXUzcGxFUnhleHJzNnJseEo1STZwMndGZll3YnRRNHlsRDhLM3NCdjFTU3or?=
 =?utf-8?B?aWNROVVDdXBxRXBLNGdtdG8zVGEzQmtWb2x2ZE41UElCL0pWUEZyaW9SYVNF?=
 =?utf-8?B?RGRMR0hCQzc3Z1BER2ZxSGJMUmprazJreWNtdjF0TCtzRDJ1b2YyOHduYUFI?=
 =?utf-8?B?cm1IbmZLYk5qaUNYNFRPdkhrbllOM3hhZE11c01JQlRRbzlXUHJzMzkzY0g3?=
 =?utf-8?B?ZkFaRU9DNHpZdnBuaWVETURQa3ZyY2JsUi9WL01KS0dqeURJVjd2VVc2RFJK?=
 =?utf-8?B?VVRxSGVUVGxzTmdtdksrUG1yQmYxNm9jUTg3Rng5b2pjelZ6YmJMeDJzU24y?=
 =?utf-8?B?ZzNwcG4rZnlKN3dmRks0aWhVYmN6dmdHN3VYS1loN0xLQXVSZzhGdTBHTU9v?=
 =?utf-8?B?UVlVNXduc2ZUcVFUbnRNcHk2R04ySFRjM1IzUGJNeHdFelpTUUlvMlo1anYr?=
 =?utf-8?B?aXF5enVNSEEzdmFkbjlsRlloS1BldUJ0eEltYytrYnhsZys0bWVtd0hMbWtR?=
 =?utf-8?B?R1JLVnFZWE9iWTlYZmVzUzBtTXlmS1Zsak1LcWx3bjZRa2d2cEwwS3UyUTZ5?=
 =?utf-8?B?N2Q4OTkrREMrSUxHQjJzcXFHT3pnb2NuQjlsVDZ3N1pUd01UZzJLaW9CYmFj?=
 =?utf-8?B?RzYySWRVQ0drOE96ZmxTcEQ4ekt1b281S09TYjk0ZEp3Wm84SWdZWmtldVFR?=
 =?utf-8?B?U1Rtc0M4aGxWL3MvSjdhd0poRTRtZjFzVXdQemRJem9tSHBIclRFbWthNzZI?=
 =?utf-8?B?QVdlZFpsbWZaRzNwZkorR3M1QkZEZG1QZmJwSHh2SFgzV2lybkJzNTJvRnlY?=
 =?utf-8?B?MGJUeU1jd1JGdHl0bWpNK3BkS1RXYmtWNFZZUXlNcnUwaFpkeEZDbkZFUlRn?=
 =?utf-8?B?Z3RYUFFSNk5RQ29YMlplQW84NFhQZmU5bU84eGhkbHFlRjk1bkExZkZKNk9w?=
 =?utf-8?B?bVd0SDFQeERyVnpNOW1taE54ekY4MjIzRXM4Yk1TQU1aY1ppWXptQ2VPVWxx?=
 =?utf-8?B?TlUwOWZYNjNHL2VpdTEvdGxrOCs0bVhvUENUOU5LWU9ZbjVRUU9UL0VIeE1x?=
 =?utf-8?B?OGk3eG1odHlFM1BPY3RRa2FGdTFkaFJwYmM4dHYxd1RwRTVYOVhlcXNrcjVB?=
 =?utf-8?B?M0lsbU9FU3VoaE52V1RyNDNEcHd0U2VHRHBqUHZBbHE2WHVPaGJya2tFR1RZ?=
 =?utf-8?B?TWNtcGxnSHlReUxiS05QdnIzcFBNcGtJbEdFL3BVUTdBOHRiRlZIc0ZwaExP?=
 =?utf-8?B?UjVPUkhVSTFjOC9LYzhLSkRYbHRVTnVXbEtlTTBHM1Z3V2hpeUdDY2paZmVl?=
 =?utf-8?B?Qmw1c2swZ1haK213b2d3enNLY1dyWWs3ZlliMTlGamJjbG5UNkwwTzA0ZHp3?=
 =?utf-8?B?bGdidWxkQTI3ZlljTmdJQ1A2bGRjT2xMUW00TjJkRkZkdDNYdGZqdi94YWR0?=
 =?utf-8?B?bUJWTjQyQXd2TVVzM0RBVXg2Y0JWOUtad3AyL3ZDSi84UGwvQUdYUkNsdkJ6?=
 =?utf-8?B?dThvVUVsZDJDeCsvd2szejV1MU42Z1RTUGNCOE9keWpYN1U1MnJBZ2M1SHFV?=
 =?utf-8?B?czFRSmFweDROYThGUW1vb01vQW1qSjVQWnlkdFNUNkFOM29WUlMzazlhVlFZ?=
 =?utf-8?B?VWs1NnZYZHMyKzlkR1RGQmRxRnAxcjVtV2VUclpQSzBqejUrQWR5WGtrL2Zt?=
 =?utf-8?B?RjVpMlhZTWYxZ2t1TkI1dUZBaVgvVWlDbWJqdUwzQ2FLbDk4UldOMENWdmdI?=
 =?utf-8?B?U0lCYU12WCthNjIyWVhWNGdkeDRHUmdqSGtNRElWL1MycmJhOVAyTnliU0JR?=
 =?utf-8?B?ZjVBZVUzU0pvejRieXpVQlVYRyt2NG1aRE9ZV2U5dHEyMXB2U1NORlB0Njk0?=
 =?utf-8?B?WGFkc3N1MjFRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eWszY2RGYkNUMWRPc01qUHh4M3dGVE1yajYvVjdNUXBoZGZ0T09tSFlZdDBH?=
 =?utf-8?B?aTRCUjl4VlJUa0l4ejdDNHdndFNCUWowdm05ZHRzbHkzVldkK0hvMWg5M1Zn?=
 =?utf-8?B?UTl6cVBLZFpjbU9Cb0V3ZDNTeHFRMkJZcnkzLzBXQTdsd25SN2lzT2o3dEdm?=
 =?utf-8?B?YVhjNktyNkI3UUQwRFF6Y2RBdERuaFZQejBKU1lWZWRQanBMQlNTRy9uUld3?=
 =?utf-8?B?dE85akxWNlBZRld1WVpmL005ODJ0b3VyUVY0MjhzWGR4Q0xndElRb2VDa3ZS?=
 =?utf-8?B?Y211czFldWVIelJPWXNjRXhYTUUxMXdhOUc1T2UzWW5YZkQwYlQrdGhhbVJk?=
 =?utf-8?B?WjF1OUVLSHNHOXpXd3hVcWZJa3hnNG9KMUFtRnE4T2JNdUdlY09FeEdYd2ww?=
 =?utf-8?B?dkFvNjlSUnNNa1E0Z3U1Z3NBeUc0bkcyK214c3JLQWtFbHBMU0pLQXhxQkNR?=
 =?utf-8?B?eW9EQlZ2OXRzd1JoVXVUZkpEcW9oQUJKVk5WOStQSTFwWVpQZEhabHdFVDRB?=
 =?utf-8?B?QmxHYmY5RFFZdDY0K2d1MFppWmcyVDZ0SWdyRU1LYURDSkFYRnovOUtZcWNH?=
 =?utf-8?B?TmVQckpwQ002WjlMVXJrdU1GaUIyeGVsN1hiSXdLTDNZZ0VYcTBqVEE0anZ2?=
 =?utf-8?B?dXdNVnRqL050RWpRTUNjOGZyUmFNeGREMkJTcmxnNEhnYlJERFU5NjBrd1Vq?=
 =?utf-8?B?R0gxbWszZUQrR2JVWmI4Szl2UzY3S2NaVE9VbjB5ZGU0QVk1N1UvN09CclNZ?=
 =?utf-8?B?Q3JaYUY5V2ZYaUgxMGNKMEdyblpkK2QwNmRHWjFaZUN1WFdjdjBnbSthdTkr?=
 =?utf-8?B?YjF5aHpSN3dUM3ovbk91eHFmYml3NlpRTUp5K0pSOXdEbjJUaEhKQ1pYQ0tp?=
 =?utf-8?B?MENzRGVkWnErbFM5aUhWU3RWa2sySUozQ29IdmJLWW5uOTBnbGF3QkhORlRQ?=
 =?utf-8?B?T1kvaFppRzZSTFVrVVdXMFFjcWtNTEJTdzRObng3UTUxQW9HRzFtYzg5R1hD?=
 =?utf-8?B?YktJb1BFRkhNa1JjN0oyazhncGc5UEM1VnV6MTgvYnppTkNZbUdQcjBpQlZV?=
 =?utf-8?B?MFJzSzViamVWa3J4dUJwaU1BRDk0MHd6anpTdkQ3Z3RmWnhUSFV2ZXFCWDZ6?=
 =?utf-8?B?MFlBRkhtMmJPTDBEZXh6dEdpQ2JnUThzQTJMUXpXQWJoeXN1bmk4WlRWZWVO?=
 =?utf-8?B?TldJbS9kUUNMbXBMQmpYTkJqOU9HZjNJWVpSQWZnWURtOTBOOWcrMzhCcDlv?=
 =?utf-8?B?N3BMcnhXbDN2VGhCeGtRdjRBemtScURZNy9KWXRDdkdwbmgvN09PS2JERXBJ?=
 =?utf-8?B?bWNESk81Nm9qSWlycUYyb2RNQ1dOcTJPOXR4eHg4WXFxbTl5QzNBZklRdmF0?=
 =?utf-8?B?Tytza1B1dmRDOGF0SW9NSmZuMVVEK1NDdXhkczB1WDVUaUZ6S3JZL1FuNGk3?=
 =?utf-8?B?bWI0eTNGTDY5YkZBNEdRRUdVTEpjdzV4V3pEQWoxNklnVkttdmtJbWtnY093?=
 =?utf-8?B?YytVZk1UN3E5ZHZWblUxZVRxZnVNL2xJV1R4bHgzSUgxdzdPS3lzNlVvYXBx?=
 =?utf-8?B?dUp1clBSNis2STNUR1o3SUFuelhjenFBaTJsWk8vYXZLK1ptOExhWnAzUXR6?=
 =?utf-8?B?VEpMU05DVVV0akVIWlk5R3UrTksycDFSZ1h1TWticldKRmxwNU1XekhrNHhk?=
 =?utf-8?B?NElPOUxvZXI5NWEzWTFBY1hHdUNCTkdWSy9FZXhyeDBxNTQweGYweFA0NEZL?=
 =?utf-8?B?c29FSERBcW5TUytIMGtoWG1vS2Zsalc5WjZoS29vUWF2V0t4VDl3cEV0SStV?=
 =?utf-8?B?OUhzOElYNHg3TXFaT0xraDFKa0VQQmN4c0oxTTRCcHQxR1ZxUHEzcThIdlQ5?=
 =?utf-8?B?YTFHMlplbWJDRUNURDJTSWM2cHFRak1nN1YycVBuaSt4aWJxbzdTS0FZUEJX?=
 =?utf-8?B?QzR0VStTcFQ0ZHh0MDVOc2tZZCtYVFRXMThWdzdSeDd2enYreU5DZVR4dVNo?=
 =?utf-8?B?bm04V2JBUTVkb3hJR0FKS0Q3ejZ6Q2t6ck0zbGdkd0I5SVhhNytWMHcxK1JP?=
 =?utf-8?B?MEVGUkxvYlhFUVVGWllHN20zNXArTCtXbGtxak1Pa2VTdGdxbGxvNnQwMDRz?=
 =?utf-8?Q?BIKzsjCX5rzrqJpi/lIn0bhV8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6f9226-4604-4b29-515d-08ddd493497f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 02:45:21.4657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5gg1UDO7t+TQu2uMQV0u1wifb+UTBnoUa3gndqhKZ8rNk8cszzPqwlSRO4uJVRmGCj/OX0PwWYyz6dufrENP3uLK/yP3DwSPvO8UXF6SPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAxNyBTYWx0ZWRfX7iwyudDaumeP
 y2/z8hwIM0zb/59D069VXpe+98oHHnHSFPq9vlUrEcIiWgXpjE4gFFK52uZuAryqMXwhLBXcPQj
 VcUWzAhxPyFo1hzwLD+OPPAWj9XQNwJaq2x2leeQZpfqEW3se25ZhKZ4PDUEa/hpjlVpCa3FTCI
 WQewdouRLYTRvzJz3VWLdThwxHmDShVb3oEf13OyMKjBW+T/CMfeR/5sMUivDYFm28gryHTqoLX
 W43taoDdfmz0Scejg/73ewtV25Yr/f6jz2EO4H5EIRl2e/UG3UCV3Ogn8EvNCJ03Nj3876qpZYx
 uAzfmktf75l62lWSvXqRDFtG7Z5GrmR2xZ345V1hQ6a5NozyN3wXNylIXCIuKc=
X-Proofpoint-GUID: BJWZF9xYXPUYUxsi3u_BcIr40iVn9tmg
X-Proofpoint-ORIG-GUID: bDMtP9WDdVxf-j0TZisN4npZXiUgLUlj
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=6892c1c6 cx=c_pps
 a=Daim6LSLd+RCLQhFHRRSfg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=PV5jDTEukolafxnLBDgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221497

QWxleCwNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBJIHNlbnQgVjIgcGF0Y2ggZm9yIHJl
dmlldyB3aXRoIG1vcmUgY2xlYXIgY29tbWl0IGRlc2NyaXB0aW9uLg0KDQpMaWJvDQoNCj4tLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgQXVndXN0IDEsIDIwMjUgODozMyBQTQ0K
PlRvOiBDaGVuLCBMaWJvIChDTikgPExpYm8uQ2hlbi5DTkB3aW5kcml2ZXIuY29tPg0KPkNjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+U3ViamVjdDogUmU6IFtP
RS1jb3JlXSBbUEFUQ0hdIHJ1bnFlbXU6IGZpeCBzcGVjaWFsIGNoYXJhY3RlcnMgYnVnDQo+DQo+
Q0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNj
b3VudCENCj5EbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93DQo+dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4N
Cj5PbiBGcmksIDEgQXVnIDIwMjUgYXQgMDg6NDgsIENoZW4sIExpYm8gKENOKSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPjxsaWJvLmNoZW4uY249d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4NCj4+IEZpeCB0aGUgZm9sbG93aW5nIGJ1ZyBmb3IgcnVu
cWVtdSB3aXRoIGEgZmlsZSBwYXRoIHdoaWNoIGNvbnRhaW5zDQo+PiB2bWxpbnV4IGNoYXJhY3Rl
cnMuDQo+DQo+V2hhdCBhcmUgdm1saW51eCBjaGFyYWN0ZXJzPyBDYW4geW91IHNob3cgYW4gZXhh
bXBsZSwgc28gaXQncyBlYXNpZXIgdG8NCj51bmRlcnN0YW5kIGV4YWN0bHkgd2hhdCBpc3N1ZSB0
aGUgcGF0Y2ggaXMgZml4aW5nLg0KPg0KPkFsZXgNCg==

