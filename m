Return-Path: <Wolfgang.Brehm@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876CCC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 09:17:22 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.7123.1743758238421348103
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 02:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=ceTYeIHm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: wolfgang.brehm@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5344gDxp031574;
	Fri, 4 Apr 2025 09:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=S-DKIM-20210427; bh=TZntnAgZbD2dTsZmzU
	HiMmc/nYopdAuwD8XfzQoDy4w=; b=ceTYeIHmhl25WLq7xNBwKBpkrG7Ssxzkur
	nbJifIKh6OGGfmnEoAjTcXGBzGSB4gyxxbZiCXAVMlO2htnBVhGLBTKL1KBvUkyj
	be4277Mp09gypE1472dTwZn+dWs2tut1Ph00S4lWFYj42LxTmrn0ApDaGl7AWqQX
	VsqshASW+f3d8p6dxN/Dc1tD9QTaELKX+rj0O07p91Sl1rp7q+FryHNpD4caU6aE
	wQDU+dgDd1btNqkn8c4tvy2q7foQ7y6D39CYod0RCmSZ/UscC19XDQStZXKDAaSS
	9RyZ/f3m7LyObEqfZUOO6yYzysyX7PgTpHCvkicj44unuXyhDxyw==
Received: from as8pr03cu001.outbound.protection.outlook.com (mail-westeuropeazlp17012050.outbound.protection.outlook.com [40.93.65.50])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 45t2c3t2et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 09:17:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6YD4joVnvt5Lx9ZCJG3UDMPLw8770OfIWH1l8EuOavZyHo3+oTilj3PomcXRcdIOxwavPCrbZZaGGgPuwP66LzpMsaacI5oior46J0VCEjNmfOWlU0COTYkFnohJqCWOig4wvP9hfYKo+ZOCVitcgTZdb9Jn34SwMxhnOwgfiq7sso/mqgwj6BBqOHjQrb8E2uDNqdPK5mtEMMQbbQSMaIz9p0qURe8vtLbBMT6ocz3vkaUlrLe2ZBaqBB92YEJNa141tyEGaHoc7O6LWeI3zoFzSpTsmTSyDDL1hO7r/Vtq4MPhOdVLEaUk2Faj7AcIyu5sdbEVzVaGcHM1/rI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aJMRQxCFjQiVHCC4Sx2IVTCfRqw4Qny5QtGpoZ2Rzo=;
 b=oMOHhAe9XD3YrrkFBYXdxIuKf1v394+sYUkl9K+vlFICRyGU0HUbntwgfxlWYueiUFHtzgEljHpc+M4RLMtU7pGL00rBlAAjYIn6xipCLhj2edSif6w7PUfIPXtWXvkxetJpw0oaFK1uYytBfkXYGBB8rVEVSyzgZwZH6j5ktcP1EtYzIx2Z9V7/pC0w0xNFO5UuTPYVJiY5AqlsJjrNDw+H+KQiWf3StMTgQP7UsfuBDVHp/EstkJkvo7kZT9pCMmaes52afK35lBh2LmCOuuUhwJfgkEMtT1jQp+FTVTw+WW8ovIpJtwky3xF9lI/yejRFK+ur+mfHDYMirSSanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from DB9PR01MB10074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:309::16) by DU4PR01MB11375.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:58b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 09:17:11 +0000
Received: from DB9PR01MB10074.eurprd01.prod.exchangelabs.com
 ([fe80::b3b2:11c8:721e:5211]) by
 DB9PR01MB10074.eurprd01.prod.exchangelabs.com ([fe80::b3b2:11c8:721e:5211%5])
 with mapi id 15.20.8583.041; Fri, 4 Apr 2025 09:17:11 +0000
From: "Brehm, Wolfgang" <Wolfgang.Brehm@karlstorz.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
Thread-Topic: [Ext] [OE-core] [PATCH] meson.bbclass: Specify a cross binary
 for cmake
Thread-Index: AQHbdx7FJ1zh9TFTHUS+37/GXgEYSLOTgMpj
Date: Fri, 4 Apr 2025 09:17:11 +0000
Message-ID: 
 <DB9PR01MB100748219BE5F84E18B1D3E2682A92@DB9PR01MB10074.eurprd01.prod.exchangelabs.com>
References: <20250204160609.1646883-1-pkj@axis.com>
In-Reply-To: <20250204160609.1646883-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR01MB10074:EE_|DU4PR01MB11375:EE_
x-ms-office365-filtering-correlation-id: cca4b97b-6e68-4f74-38a3-08dd73597b5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cWxaSWRpbFgzTnlaV1ZDY2dNQUlqSFN5cDJGT0RnWStnSk4zSEJjSUI2T0V0?=
 =?utf-8?B?Znptc3VtZ01kd3cvbGFqL1lMMVBZN0hObUtuOHRaaFRQaFZvTzE0d0VHSWJq?=
 =?utf-8?B?ZEpGY0lFNy9pRUpyYkF3Q1NyajFCbmR0ZmJtbkxVQnpMd3BKZ2pSN3J2T0Z6?=
 =?utf-8?B?aXBwZ3ROWm1BbEs5ZHArOUpJcnV3dFRIa2JSb280MGErVitiRFk5VEhoYnAx?=
 =?utf-8?B?bytzWXVWekxXd3NTMTJqUUR1Z2tZb2Q5blI5UXhub0R5QmJIZzVnUGtINTFJ?=
 =?utf-8?B?UnlzaE9NMU1TUGtpNXB1N1J2a0lGT1crbTMwVzZhTUtOWGpnZENHMnYrQzhh?=
 =?utf-8?B?VE85UEpEYzdtMGV0akFyTmE5YW5reDkydUZuZmZ0OGt1SEtYZGNUblljQlRy?=
 =?utf-8?B?NmQzMHliUVBBdE9SM3JnTTVROVlHNS8ya2JEQ2tuUTZEbmpDNEFKWlpRWWND?=
 =?utf-8?B?cUpkRVR1UnF3UE1lUFdoSUlJeFM3K2hTVURGNHc5QlhsM0hKUGZnRVZlckhz?=
 =?utf-8?B?R3R6eExxbzh1c1NweDBPeUV3L0NZcjlkSUF6aENTTjlGdEdzcG8zVXA0TnRi?=
 =?utf-8?B?N2RsdGJwdlRnNlpzV0hVaDRzUE95R2FIMU5EMXlvc0FSdzk3amk0V0VCUlVF?=
 =?utf-8?B?REpoa2EwaER5OUg1MWgyYWFkZkZIeHQ5UkV6RTBZN1RxYzVUdVRtcjJ6N3Nx?=
 =?utf-8?B?ZFpSZjZ2TXZ1MlNsMEZrYlpyZFExQW1SOXBGSlo1aDh6UVJSekgrOEJNbXMw?=
 =?utf-8?B?blpJYmtEWklzWFNLVmZUMHJWRndFem10ZTdrMlFNVVVvNFhDUllkZGp2YmhO?=
 =?utf-8?B?QzcrdUREREtxMHEwemNOVXBma3g1ZXErYnIrRnAxbUd3ak1lN3c0bm9HVWFa?=
 =?utf-8?B?c1N2V2kyMS9XWi9YVTBCK3BhWjVTdWdyUGxCM21hMDZCb0lPRzZRbUNEcE91?=
 =?utf-8?B?TDIrWE0xU09uVEFCblgxdXdVR3JwOFZ2cFR1dThRVU53TXl1VDZZVzErVDk5?=
 =?utf-8?B?dWRSNEVaWUpBK1NGRTJBNHFLS2RxMFhlUmpKeGJyU2wwWXYrQTNScHpvV3dy?=
 =?utf-8?B?UWZFS3I4dk1xdHlDb05OdDhPZlZQdGFTeitTNXlZMHZ2c3Bybk5yOFVOVks5?=
 =?utf-8?B?VkVHV1ZpbnZKci9sbnVIKzdUUDVHRUpBdW9KeTQ1VFFoUzBsanVoR3NUMG81?=
 =?utf-8?B?ZFR4dVZYNlpBRjMwOHVnVkp5WEgwMVcwWFZ4OU1NbDFkcEI1cCtvVnZSWUVV?=
 =?utf-8?B?QStjYjVmb292czlOL2NPdWpHQmN6b09VeGowdHNPbHkxVDVMKys2cVlHdkxN?=
 =?utf-8?B?T2JEYyt5dENFZXFVckszdTJJV1NTZUQ4N01tZ1BQKzRONUJEcVFLQk83a0g1?=
 =?utf-8?B?Y2tpMGF6c280bXNkdjh4K0w3ZCtwMzdHNGJSQUdqSGFKaHhiclFZaDl0S2o1?=
 =?utf-8?B?eUtYNjJIV3VpL1lGM3ZjRGN2dmoyeVZpWGNYRHQvNTZ3S3ltbjZTdmdUeG5z?=
 =?utf-8?B?d2h6WTlHRHJHZXloU29kMlpBYzlpK3JLM1NieUJBRlhnRTMvaDVYcjhFR3ZY?=
 =?utf-8?B?UlArYktyc1RKVXlwa1Z2SW1nRzNIOVRlQ0R4UU5Ec3RJaTdpS2NpdHJQUEZX?=
 =?utf-8?B?bVY5bTFjbnA5c1RVZjJjcGVKMFFRbHB0czR4RC9YMDU3U2gyQWExQ0ZMTDRn?=
 =?utf-8?B?NHh6MWtvb1lkK2RKRTRZNEdISTNDUUxYRURDUnhIZG1FeEtGVWFnSWR3VE9m?=
 =?utf-8?B?cVZmVjNUbkJ5L3plZElGUmpBRzhUUXNJN0xiVE5IcVY4OExrRUdxWU1wNFRs?=
 =?utf-8?B?dlpocStZZ2I2WVFBU2pEZDU4cUltUGgxY1BRTXE1c1VzK25DWHlQZnJCYW5K?=
 =?utf-8?B?emdXMXRQcXlIMzhjQm9rSGRIZkZGUm92RUtTaDEwRlhYeVE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB10074.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmhKUnRxUnBuMU1VZXV2TkNUeEs2OThCRVBmQkJxblFBdHJYWnBSS0Q2UWd3?=
 =?utf-8?B?QkI1RzBQaUxROS9TVktpY2xXNG1lQjNqdExXbjFxbXhEc1NldE5TRlIzN2NJ?=
 =?utf-8?B?aXhNbUhQbGh0WmlEU2I1bGNuaTVZU0RQazFvYW5WKzVBeUYwcGkyYjY2ckFl?=
 =?utf-8?B?cUVUL2U4ZnF5V3dmMExxdElMNDVpZGFxSVowd0x5RXU2RFVDVlR2MHplOThU?=
 =?utf-8?B?L0cwd0FOOHgveUJtb253bU44cVpyUzZrSklkTm9jS1NuRE4vazNFWW8yTnVp?=
 =?utf-8?B?UUZKaERQTU9VRWk3YVdNU0pvMFQ4OWlCMGZWOG1YWHlveUkva1BDNDdkSUlm?=
 =?utf-8?B?MXFXbEQ2VXhaUUs3SDUrOU9JdURoM1pCYjY0SEk2Sno3UTJTQWJXNVMxUGRF?=
 =?utf-8?B?MElBczNqajJCRVF5QkwwVWsxMFNLSmRpQkt5OXlRUVBVMmRBMHFFTnhnbytY?=
 =?utf-8?B?WE5jaVAxdjU0cHdJdS9kc3haU01STTFqelJyeEdGNW1vM0lGQlY1Y1RYeXVv?=
 =?utf-8?B?dFVaV3hpQm9OUXQ3NDJvUXRqcFBjYXVoNWtBNVFxbFhOa1cvYm1GaXEyejh6?=
 =?utf-8?B?NE1PWHUwS2txdWRwU0Z5SThFeEVkVWlZN05HSTJIYnN4cWRMWExnVmtTcnRX?=
 =?utf-8?B?bHA3T0tqOS9za255OGFvdUVkNTdQb2xJWEdkODA4eG9SU0pxajRRM3U4N0Rt?=
 =?utf-8?B?VHg3Z2xURlVJT1NmWnU1ZDVlaDZkMnBWL2ZvUmlYZmlTN3R2ejN5Z1VXVC90?=
 =?utf-8?B?TDRQQW1QdnhLeElCMVpGWGUxN25hWmNlaFdQQlhOV0RiVUNiVEVVMEg0akhu?=
 =?utf-8?B?R3hnTCs2RGplamRKZkdOVkVBRGxsaGVkN25hL1NwQWVvblQwbUp0TGJ4UUpJ?=
 =?utf-8?B?eUJBbzlpMmI4WDhsVElmTitKVUwrTmVlcWdVMjVkVkE2UUtsQWo1UCtHeXAr?=
 =?utf-8?B?Qm84T2xzUmU0b0dadyt1UFZoNU0xMTBGVkhmQnFoMFAwOGMzUTNwMWZMdUVT?=
 =?utf-8?B?Z3EzblAwdktieWFpM2NxMUw4eW9kRi9FK1UzZC9POXU4RHMxSkNUUUF1SVps?=
 =?utf-8?B?cFFPcCtEallTUUR5dlRLenluY1l4ekZBSS8xTmVEcTExVjExbll1eU9yeFo2?=
 =?utf-8?B?dTFxOVRoZjVUeWpCakxPY0tmWEVzMTBBMW5EZDVlSTdJZFgxOG5QNVpQcHZC?=
 =?utf-8?B?OGNTZVNHK28yQTB4ZHdqRkpsMmN4UVhDUjRGck5XbThIQVU3VWdCbU15b3Ba?=
 =?utf-8?B?RlEzbkFEejAxMjI2NmpzQ1NaY2JwdVVBb0E0RUxONVJEWk5NNVVXWlI3R0pn?=
 =?utf-8?B?Y0lmZVpFMDdUUDBCbnIwc2x6NHNtc3VwMUgrNXNSWVY1ZkhvanNkd1hTbXIx?=
 =?utf-8?B?UUxOSXhzSHh0dVFTSWhxWS9qT0VTdWdzdi90VXNld2lLQVdzcXBjbjA2UkFw?=
 =?utf-8?B?aWxXVFN3dUJETVhQbGpKTFc3YW8yN1kvZEZtTkpjblFiTXpVZXBqUlJuVHEy?=
 =?utf-8?B?bS9sM0xhMTloN0M1dFprZVNxeDdjU3dodjBYV0NmU1dxV0NtVnlvL1VsdTNl?=
 =?utf-8?B?enZqdnlWemd5b1Z3UjdjNkxheFdXUzVJeDZOUUF4b0xpdnIyN2FxRmxrK0VK?=
 =?utf-8?B?ZU5yb1FwckVwZ1Zlc05HRmlxRWVTa2hKVnVic1hNUTRnVUdRejRMUUsxM3lq?=
 =?utf-8?B?SngzbzlIWGJoWG52ajIzY2hYdXQ0dEl2U0dia3ZLWm1hcmZuZnVuWnZ6aFVZ?=
 =?utf-8?B?QTYzYWZNWFJMZnczbVdSM3hHdG53VlE0NnEyd2lCRUpoWmtBRW1TL1pzUU9K?=
 =?utf-8?B?YVMzZGp0L0pVUFF3eUkvOXFselhuU3krYTFpRmllUzNIQ29ta2hMMllpT2VK?=
 =?utf-8?B?aWllZHhhdWZiWUt2NVFvQ1ZOUjVJQXNobmt3ckJaWWpMN2luQmhwUEhITWJF?=
 =?utf-8?B?dCtSTitVaklVL0pZdkxUUitFYU9rZGtiOEpoRGQ5UXNod1VpUUlGcTRBSFNj?=
 =?utf-8?B?MmVLWDdLMGVsalBSZlBDb1g4K2VwZnVURGZyV1ZWVGw1em44b2Z4NlhIUEQ1?=
 =?utf-8?B?bTcyVnRGOXUwekxBMlQ0Z3k4bHF5NmNLRnlhNXBUMzNaRVloNnZBcXhsMVRz?=
 =?utf-8?B?UGVSTU55KzkwM2pRZjlPL3dvYk11ZGJGU2VxSk5JUWxLeTd4ZnphUGk1Ylp0?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: multipart/alternative;
	boundary="_000_DB9PR01MB100748219BE5F84E18B1D3E2682A92DB9PR01MB10074eu_"
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB10074.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca4b97b-6e68-4f74-38a3-08dd73597b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 09:17:11.5226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUsivtX9rPw4bdrdek+hH+zCEeLeBxKqO5IoLiMyU6hHW+9tjf9yAptDeN0V568Djz543KbKe6N/wGkDhic0FRuUP5LoUiEOt1v3OEqu13E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB11375
X-Proofpoint-GUID: D6RtcqxPnctiy1MWNIrzazR6UiDdDtqk
X-Authority-Analysis: v=2.4 cv=P7U6hjAu c=1 sm=1 tr=0 ts=67efa39b cx=c_pps a=OAW3LcsqvRxXw/QBZHH6HA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=n9SCklZpAAAA:8 a=RpNjiQI2AAAA:8 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8 a=teNQeY28k9VO6B_WdfUA:9 a=QEXdDO2ut3YA:10 a=4AliqQHIA6IA:10 a=u5ENMWaBZd8asqdlqWYA:9 a=2q4O/K3rjNU7EHYdBHB6dYyilSc=:19 a=jFSoZzYRqaNqXJhD:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=MDYma9B3dblYkEs0OMj2:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: D6RtcqxPnctiy1MWNIrzazR6UiDdDtqk
Subject: Re:  [OE-core] [PATCH] meson.bbclass: Specify a cross binary for cmake
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_03,2025-04-03_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 09:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214338

--_000_DB9PR01MB100748219BE5F84E18B1D3E2682A92DB9PR01MB10074eu_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Peter,

I have a dependency that only provided CMake config files, which could not =
be found by meson, so I thought I'd try your patch. I don't know if it actu=
ally fixes the problem because before I could get to testing it, it leads t=
o a strange error in the compilation of libpciaccess, where somehow /usr/in=
clude is in the includes leading to a compilation error.

ccache [...] -I/usr/include -fdiagnostics-color=3Dalways [...] src/libpciac=
cess.so.0.11.1.p/common_capability.c.o -MF src/libpciaccess.so.0.11.1.p/com=
mon_capability.c.o.d -o src/libpciaccess.so.0.11.1.p/comm
on_capability.c.o -c ../libpciaccess-0.18.1/src/common_capability.c
cc1: warning: include location "/usr/include" is unsafe for cross-compilati=
on [-Wpoison-system-directories]

This then presumably leading to:

In file included from ../libpciaccess-0.18.1/src/common_capability.c:39:
/usr/include/stdio.h:205:27: error: 'L_tmpnam' undeclared here (not in a fu=
nction)

I'll continue investigating.

Mit freundlichen Gr=C3=BC=C3=9Fen

STORZ Endoskop Produktions GmbH

i. A. Dr. Wolfgang Brehm
Softwareentwickler
Software Components & Multimedia
_____________________________________
Tel.:     +41 (0)52 640 35 67
Mobil:  +41 (0)76 361 57 07
E-Mail: wolfgang.brehm@karlstorz.com

www.karlstorz.com

Hausadresse:
STORZ Endoskop Produktions GmbH
Tuttlingen (D)
Zweigniederlassung Schaffhausen
Schneckenackerstrasse 1
CH- 8200 Schaffhausen
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
STORZ Endoskop Produktions GmbH
Dr.-Karl-Storz-Strasse 34
D-78532 Tuttlingen/Germany
Sitz der Gesellschaft/ Place of Business: Tuttlingen
Handelsregister/ Commercial Register: Stuttgart HRB 451 142
USt.-ID-Nr./ VAT-ID-No.: DE 142931059
WEEE-Reg.-Nr./ WEEE Reg.-No.: DE 74465858

Gesch=C3=A4ftsf=C3=BChrer / Managing Director:
Karl-Christian Storz
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
Datenschutzmitteilung f=C3=BCr Gesch=C3=A4ftspartner / Business Partner Dat=
a Protection Notice<https://www.karlstorz.com/it/en/business-partner-data-p=
rotection.htm?target=3Dbusiness-partner-data-protection.htm>
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Peter Kjellerstedt via lists.openembedded.org <=
peter.kjellerstedt=3Daxis.com@lists.openembedded.org>
Sent: 04 February 2025 17:06
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [Ext] [OE-core] [PATCH] meson.bbclass: Specify a cross binary for =
cmake

This is needed to find dependencies that only provide CMake files, e.=E2=80=
=8Ag.=E2=80=8A, json-schema-validator in meta-oe. Signed-off-by: Peter Kjel=
lerstedt <peter.=E2=80=8Akjellerstedt@=E2=80=8Aaxis.=E2=80=8Acom> --- meta/=
classes-recipe/meson.=E2=80=8Abbclass | 1 + 1 file changed, 1 insertion(+)


This is needed to find dependencies that only provide CMake files, e.g.,
json-schema-validator in meta-oe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.=
bbclass
index b343480f9a..bd1b86e931 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -73,6 +73,7 @@ nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
 readelf =3D ${@meson_array('READELF', d)}
 objcopy =3D ${@meson_array('OBJCOPY', d)}
+cmake =3D 'cmake'
 pkg-config =3D 'pkg-config'
 llvm-config =3D 'llvm-config'
 cups-config =3D 'cups-config'


--_000_DB9PR01MB100748219BE5F84E18B1D3E2682A92DB9PR01MB10074eu_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Dear Peter,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I have a dependency that only provided CMake config files, which could not =
be found by meson, so I thought I'd try your patch. I don't know if it actu=
ally fixes the problem because before I could get to testing it, it leads t=
o a strange error in the compilation
 of libpciaccess, where somehow /usr/include is in the includes leading to =
a compilation error.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
ccache [...] -I/usr/include -fdiagnostics-color=3Dalways [...] src/libpciac=
cess.so.0.11.1.p/common_capability.c.o -MF src/libpciaccess.so.0.11.1.p/com=
mon_capability.c.o.d -o src/libpciaccess.so.0.11.1.p/comm</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
on_capability.c.o -c ../libpciaccess-0.18.1/src/common_capability.c</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
cc1: warning: include location &quot;/usr/include&quot; is unsafe for cross=
-compilation [-Wpoison-system-directories]</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This then presumably leading to:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
In file included from ../libpciaccess-0.18.1/src/common_capability.c:39:</d=
iv>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
/usr/include/stdio.h:205:27: error: 'L_tmpnam' undeclared here (not in a fu=
nction)</div>
<div class=3D"elementToProof" style=3D"font-family: Consolas, Courier, mono=
space; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 16px; c=
olor: rgb(0, 0, 0);">
<span style=3D"background-color: rgb(255, 255, 255);">I'll continue investi=
gating.</span></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" style=3D"color: inherit;">
<div>Mit freundlichen Gr=C3=BC=C3=9Fen&nbsp;&nbsp;</div>
<div><br>
</div>
<div>STORZ Endoskop Produktions GmbH &nbsp;</div>
<div><br>
</div>
<div>i. A. Dr. Wolfgang Brehm&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Softwareentwickler</div>
<div>Software Components &amp; Multimedia&nbsp;</div>
<div>_____________________________________&nbsp;&nbsp;</div>
<div>Tel.:&nbsp; &nbsp; &nbsp;+41 (0)52 640 35 67</div>
<div>Mobil:&nbsp; +41 (0)76 361 57 07</div>
<div>E-Mail: wolfgang.brehm@karlstorz.com&nbsp;</div>
<div><br>
</div>
<div>www.karlstorz.com&nbsp;</div>
<div><br>
</div>
<div>Hausadresse:&nbsp;</div>
<div>STORZ Endoskop Produktions GmbH&nbsp;</div>
<div>Tuttlingen (D)&nbsp;</div>
<div>Zweigniederlassung Schaffhausen&nbsp;</div>
<div>Schneckenackerstrasse 1&nbsp;</div>
<div>CH- 8200 Schaffhausen&nbsp;&nbsp;</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&nbsp;</div>
<div>STORZ Endoskop Produktions GmbH&nbsp;</div>
<div>Dr.-Karl-Storz-Strasse 34&nbsp;</div>
<div>D-78532 Tuttlingen/Germany&nbsp;</div>
<div>Sitz der Gesellschaft/ Place of Business: Tuttlingen&nbsp;</div>
<div>Handelsregister/ Commercial Register: Stuttgart HRB 451 142&nbsp;</div>
<div>USt.-ID-Nr./ VAT-ID-No.: DE 142931059&nbsp;</div>
<div>WEEE-Reg.-Nr./ WEEE Reg.-No.: DE 74465858&nbsp;</div>
<div><br>
</div>
<div>Gesch=C3=A4ftsf=C3=BChrer / Managing Director:&nbsp;</div>
<div>Karl-Christian Storz&nbsp;</div>
<div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D&nbsp;</div>
<div><a href=3D"https://www.karlstorz.com/it/en/business-partner-data-prote=
ction.htm?target=3Dbusiness-partner-data-protection.htm">Datenschutzmitteil=
ung f=C3=BCr Gesch=C3=A4ftspartner / Business Partner Data Protection Notic=
e</a>&nbsp;</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Peter Kjellerstedt via lists.openembedded.org
 &lt;peter.kjellerstedt=3Daxis.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 04 February 2025 17:06<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [Ext] [OE-core] [PATCH] meson.bbclass: Specify a cross bina=
ry for cmake</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"display:none!important; display:none; visibility:hidden; font=
-size:1px; color:#ffffff; line-height:1px; height:0px; max-height:0px; opac=
ity:0; overflow:hidden">
This is needed to find dependencies that only provide CMake files, e.=E2=80=
=8Ag.=E2=80=8A, json-schema-validator in meta-oe. Signed-off-by: Peter Kjel=
lerstedt &lt;peter.=E2=80=8Akjellerstedt@=E2=80=8Aaxis.=E2=80=8Acom&gt; ---=
 meta/classes-recipe/meson.=E2=80=8Abbclass | 1 + 1 file changed, 1 inserti=
on(+)</div>
<div style=3D"display:none!important; display:none; visibility:hidden; font=
-size:1px; color:#ffffff; line-height:1px; max-height:0px; opacity:0; overf=
low:hidden">
</div>
<style>
<!--
#x_pfptBannerc26qaff
	{display:block!important;
	visibility:visible!important;
	opacity:1!important;
	background-color:#FADF9B!important;
	max-width:none!important;
	max-height:none!important}
-->
</style>
<pre style=3D"font-family:sans-serif; font-size:100%; white-space:pre-wrap;=
 word-wrap:break-word">This is needed to find dependencies that only provid=
e CMake files, e.g.,
json-schema-validator in meta-oe.

Signed-off-by: Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.=
bbclass
index b343480f9a..bd1b86e931 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -73,6 +73,7 @@ nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
 readelf =3D ${@meson_array('READELF', d)}
 objcopy =3D ${@meson_array('OBJCOPY', d)}
+cmake =3D 'cmake'
 pkg-config =3D 'pkg-config'
 llvm-config =3D 'llvm-config'
 cups-config =3D 'cups-config'
</pre>
</div>
</body>
</html>

--_000_DB9PR01MB100748219BE5F84E18B1D3E2682A92DB9PR01MB10074eu_--

