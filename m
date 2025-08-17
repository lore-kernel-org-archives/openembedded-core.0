Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8241CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:09:02 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.56])
 by mx.groups.io with SMTP id smtpd.web10.60039.1755461337869450459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ZL2zotv1;
 spf=pass (domain: axis.com, ip: 52.101.72.56, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQPfvDBoQtmjP1BeOr0TaUyvFGFyyC6Nuzy8YEBNcrAsx9TTx7xzQmRn0xtHx78NsIFvPC25CaVOChwNfMshA4LJ12CM9mu0RTbot6zaANCXPPvc8hMCJsEcdpG60XPqVyTVsk/+XlOU+v26b4/P3D5r8cLzXZrxDAiT8FLnFYD1V113UVJ12Y1e4dkwBkc646edDa+IcmqlwPMfK/MzlD/VWGEAT1i74VQ4SSZhN5qt4bOOKabTA/mVMOhChjS+UTVkebmlVfegsIf+ZcGD8vzZugakcU3NyE5X6q9stlz27rHAT8N2VIJ8iMr4Q+XBHshAmFDFA7qVfH7G7lFG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLe6jgwE/YScnVVRfiPkjAS0zcRT6pdsNKpXgFzaPpA=;
 b=Iak0BD7ynEPhESnQBdfPXA8iC/KygmtZTinxW1hlD+Pzy7l56M0cxQms58azt3c/oqarGFEjULn4SLKHNrEvTknypHjgVz5V0qDTefSomxUDiNbN3Q5je0gHIfU/sjBUwXz123Bi6sxhwfJRI0UXCgPCniPK99tsEmVfKg0+ro8bOb2DiF524MI80sN0qxXennnJWbb2Ibn8JVo81Zkj4ZRSNBuciiHEKTw25BDPUcUhF3oTRL+gG5HjsLFL+/FCJ1c0MmmYTJYWa4FdCK9EsG+5befoUVsjAQmdpdw+wI18LShEm8yPNb+E1RRW8Zio0t7A+7ZiOvmCi0CTuyrezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLe6jgwE/YScnVVRfiPkjAS0zcRT6pdsNKpXgFzaPpA=;
 b=ZL2zotv1XACZ8fTzmvo6L7Y8o/XFBuC/3QQC5ncP9H+Uf+jxpAIXXdPt5SlSP+X9TyQqpqs1cN7zg0ehR7myJSfx7NIaBrBxGsURxC6kO9fyTggicF7YtKn9RWCDLp0P2mfY4OlnL6ZFS00a2nFTHGWohxK9vQ/o+psQVca0XP4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI1PR02MB5791.eurprd02.prod.outlook.com (2603:10a6:803:139::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 20:08:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 20:08:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
Thread-Topic: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
Thread-Index: AQHcDDqHfkt9donyd0avnn3wSV9YTLRgXcYAgAbrqIA=
Date: Sun, 17 Aug 2025 20:08:51 +0000
Message-ID: 
 <DB5PR02MB102131339A02724253787AB95EF36A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250812211424.76559-1-pkj@axis.com>
 <DC17VPQRAFV5.XZL8KUA3Y7RK@bootlin.com>
 <DC17YXMZE1EK.38MQXWDL5WLTI@bootlin.com>
In-Reply-To: <DC17YXMZE1EK.38MQXWDL5WLTI@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI1PR02MB5791:EE_
x-ms-office365-filtering-correlation-id: 0e458f98-7cfc-41fd-4891-08ddddc9e2bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YXNiWjhxdFlWdVgzRGFTK1J5Z2MyaU5aQ1NoUnRLbnVNaWtuYktNZ3pJOHQ4?=
 =?utf-8?B?VmZpSCtaTWs4bE5VT3BrUkZaY1paWXVpVjhvc2h2aFNCSWtxTGV2Y0E1dU1x?=
 =?utf-8?B?d2RGcVJDMlgxbTlJbFFMZ1VFMmNtckw1YnlCL3dMTmVSN0VtMFg1UDc1UE44?=
 =?utf-8?B?WVNtV3dZYm40R3AxRkJWVXhZeC9nenVPZTlJcXJ5T0NnOCttdzBIcHJMWlY1?=
 =?utf-8?B?eWNkSnJxTGYyOW1TYmpiWmtEcUxMeTM0ejN6RXgyVFM4cEw3bnFZeCtFQXJt?=
 =?utf-8?B?NVRBQ1NFcWxCZExkbzR1ZVBDNllRaHR2SXQ3NmhSWlZwdHc4SmlhUGI4Zjlo?=
 =?utf-8?B?YlBhK3U5TGhmbmt2NzZ0L2pMTDU0eHY2S2dCVFcxWHJ5YitTdDRFS0F5dVFm?=
 =?utf-8?B?QUpETmpqRm42RExkaFE0RUNPWEZvQUlwT3c2YjhWU3QzTXZUSmJPZCszMDkz?=
 =?utf-8?B?WnZhMTlpVFRpcTlZVzFTVVlEYWxDZ3FiWjMzMThXRWVJSG95cWphazl2T1VW?=
 =?utf-8?B?aXdvTnB0ZWR4blFrRmliNmtMVDIrM29HZ0Nkbnp6NmZFTTRTTVh3eHFFMFNZ?=
 =?utf-8?B?eVRLMU42dWV0RHdnWWRpM3VUQWhnVnBtQVBuYzdkTkVGYk1ZTjZVM25oSWhV?=
 =?utf-8?B?dS9JK3JkS1pVRU81alVNRlRGT0FnQlZ6UGJKQkxPQWZwenFOYXlVczNDZGJB?=
 =?utf-8?B?VVR6NEp1dG5iL2VxODNHdUFDSzFlL2pQVWRveCtDdlpaUkRSTkxjV3laYWNs?=
 =?utf-8?B?T1F6d3owWlUyblMxY2VBR3FDaVUwSUM1TEt4NGJyekpsUmRrNU9EZVJkN0E3?=
 =?utf-8?B?ZHZkOVJYYWQ2STd0VzFZcWFFM1BPTFVZOG9kNlhHdWNFUXlxWDhTTFZEZG1l?=
 =?utf-8?B?a005Rnp1WWtlWSs5Ykl2Mk4wNEVCNlptdnJpNlVQYkNrb3owd3V0R2ZqSmtO?=
 =?utf-8?B?Y2lsVjdKMGJLRVd6RjdiczRucTRiNEI2TitnMWZJTE5ZYXZqaFlFaTRuVXg1?=
 =?utf-8?B?VGhJWkswODJGRVljZVl5R2MvWEIyQTFUWUNKN1lXN3liK3ZCbmRWWjFIcWFp?=
 =?utf-8?B?YWZSUmlUYkhWQloxK09aZnJqREtiS09GK0FWRWs5QlNMWFlRZ0NkSmkrZUdt?=
 =?utf-8?B?M2FQR1ppcXpUbFd0dFdvOGMvWUY3dXZFRkY5YnExVnpFS25mNHh0TE1qVFgr?=
 =?utf-8?B?TGFoOENPVTAvL1hQdE9oa3pVMUx3UEZlckRtdFk0dWkzNTBCM0tUUkJOaThN?=
 =?utf-8?B?K0NYYWE0dlJKZ01VZ0Nocmhia0NuVGVwY0pHZTVZRnFORVBQdjJSUVU0QmdY?=
 =?utf-8?B?d1lmWVpOMmRYeDk4QzdhUmhJUFRVVWhnSnhib1VIUkVpdno4T1kxb3QwQ2Rk?=
 =?utf-8?B?OFlWZTdyK04yUGJzZFRhbEgrRTlkbm10dnl3dWphUy9xdEtMdFdlQWYxUUs5?=
 =?utf-8?B?OWM5Tkkyckc0MVp4VDErUnNsdTNncS83M0MzK3NwenJncE1Qb3B3VXZjeHow?=
 =?utf-8?B?OWRPSWNJTjA4VTNDdkNNTm5leVBMSUpXUnpsVkQ5cG5OdDgrVW9HeU81ZnRE?=
 =?utf-8?B?MnNIMmJqR1FuK1Z2bmRsa0dXUmdWWmYyWmJHMkIwNEUrNjBqUUhzdjlib3Y1?=
 =?utf-8?B?V1d5a29ZMkIrdkI1cWRnY3lYQWswcHF2Z1didmVoQ1B4MnF2NlR6SmhLQ0lO?=
 =?utf-8?B?S2ZISzZmNmxDWm1EWUp6MU5HOW56dXlWMGRUQ0ovZ050bUVpMnRNYUNxTUMz?=
 =?utf-8?B?SnUzZ3BXZ2xSVStsbndLclF5ME9hR0huTVQrcjN2YVoxc1VYTisyNXFhQlpk?=
 =?utf-8?B?QzNmMFJUaElKRWpoTFM2L3hKWlJOSkhIb1ZLdG4zMFNnZlUxNDUvb2tzVkl2?=
 =?utf-8?B?WkduUVNYZ3dDNHk0R2IyblhLZ2hnTm5uRVQvN2RRN2Rva3pxcmM5MEJSbFpH?=
 =?utf-8?Q?wYO3zvEos8w=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?djlUQ2pxcnFibmFwaVJacUNnVGNHRllldkhOTTlURDljK2g3SWRyN0pvdUZz?=
 =?utf-8?B?Z0srM25LMld6OHB4Nm9vUXJJV1cxQmtQb0FORWFJdkZ3SFF1SHNpZHB4eWps?=
 =?utf-8?B?Nk84Vm9CMEttM3ljTTAzQzA2ZmVPYklhY3NLWlRKRTZGM1IvcENuLytNeldn?=
 =?utf-8?B?N0JrMGZKcnQ3NDF6RExIVXNZWUlycERML1BjTE5aRk51eUllV2dMVHBRMjFW?=
 =?utf-8?B?T3NvSGtGUFFpdjdTV0RIMUtlQ1JvUkUxUEkxMC9mM3VnclVreXJHdDBmYlB6?=
 =?utf-8?B?M05sQXpuUFBuYlFrdmRxM1FhZzV4QXV4WElteFhydXJYN2hoWjFocFFKdm1s?=
 =?utf-8?B?K2ZndDg2SFBoOE5OR0lKY2RLRjdqSXJyM1dORFZyeU9nK2YyNXBsTHZaeFdw?=
 =?utf-8?B?N1dOYy9jU2VIZFovNTA1SWJJT09ZRmhQMzNPOTUybjkvNlJjL2pCRS91akls?=
 =?utf-8?B?UVF6Zy81NzMraG9tTnRCKzlBMGt0VTNZRnQxS1hoVG1pdXVZeW1PcnpwYXIv?=
 =?utf-8?B?Q0lLMjFiSVJDS1hEbHlpTk13andFNEJCL200dXBlYWU0NDEwYWgyUUU0M1U3?=
 =?utf-8?B?cUVIQkVqUmhJSnhrZWpVVEJ1K1I4S3lERDJRY1dyYzA5OWFmZDA5c25CaTlQ?=
 =?utf-8?B?U1kvRmVvdnk4dGVROFlDRzlYTEhLSnFUbDJjMjRTMWZUVnhreHB6WS9jR2c1?=
 =?utf-8?B?T296UkZMbGgvZ2NNUEhybEVMYVd1TVJoZnlrU1dOSHNGK0Y2UXZpdWc0UkhG?=
 =?utf-8?B?Z2o0M21QNGJIa2ZBcTZsOXMwUGJJaE9LTFNkRDBuaTRoVERqUkF6QjhXTnlz?=
 =?utf-8?B?ci91TWNOUlhLak1XWERuVEVBVVVGRE1pRUxYZG5zRFd6OXBFQkxZNUg2T0pn?=
 =?utf-8?B?NFZVQTJ0d2lETTdMMERzWFl6aDE2Um8zRlVRZ0lQbEVTdFQ4QURHTkdXZk41?=
 =?utf-8?B?OUdRVlFsYzYySld5bWE3ZlpzVUNjeE1GRTVSQ0RGVzRPUDk1VzAyUExxU05k?=
 =?utf-8?B?OEdlYjZpWlJrK0x0RDc0WHBPLytmMi9NVG1YUXVES1c5YlhjVC84SUk3Y3Jo?=
 =?utf-8?B?UnUyWXZXNEg0eU51OTMvNzdySHZFeGFuOForRFRySmxtMXNXbENhRkl2N2ZT?=
 =?utf-8?B?TDgzMlJsaVMyY3RBamhCdGxlMCtoREI4QjE4TGp2UzRNbjkrc3RUU2RxZnFC?=
 =?utf-8?B?eU51MUFYcXJRM1Q0SmJWRTZGMDlLQWF6RzNpOHBpMzl3ODI5eG5jcU9nTGZ2?=
 =?utf-8?B?MXYvdWtGM0xSTmJCbHBuaEFCUUFhMWR5T2FLWS91cDdoZHJBY0cxR2ZCQVBs?=
 =?utf-8?B?cHp3YUhwVHZ5eWdiV1BKVmw4NDN6ZjRvcFlCNlVGVWpESlo2SDNhT2U5UUdK?=
 =?utf-8?B?YXc1THhsY1pFNitYSE5rWk00Y2hSYmpwbFR3d1BPQ3k4dVdMQzFKVkNRQ0lz?=
 =?utf-8?B?RG55VWJZaUdycTlSNWxKVWl4YUkvQ2VxaGVBY21CQ1I2WVFPWENWa1VtcCth?=
 =?utf-8?B?QW9oT1AxRVA4Z09CWjFwdVJ1Ump4SGVIVXFRWlpzUHlGNlhjSzlNVmdjbXJC?=
 =?utf-8?B?UlJqVlVEeUtDYlJhYjZaVElKaFkzZEIzeEd3TzY0UXIxaU03N3dDeSsydFBY?=
 =?utf-8?B?cDAyY2c3UUtKOVlXM2g5Ry9CSThGUkkvV1g4cGJkUm1ZaCtETEVCYTVJNmt3?=
 =?utf-8?B?SjFRTC9HVkJCODJ1R2RxQUJoMUR1ZUxKTzcwTEZjUk9QMTg5eVFyVFIveERT?=
 =?utf-8?B?RVd3NURsanpidnBwQWduZmMzYXlLV0dsdmx5UnVmK1dtY3VLZmI5eE5kTnA3?=
 =?utf-8?B?UkFHUS9nYkFHZ1BXVTlMNGlQUkNqRlROMFBieTJ5WEtPYnRRcGZ2SlFkNGxi?=
 =?utf-8?B?WURiQ3U0QW85aFdNKzhCcWxtb1NCUDlzaW5Ga3dTTFphVXlDWDR1RnpIZkV6?=
 =?utf-8?B?T2grK2Y3dFBSZEZrV1BpTitqV3hHWFV1d3ZZK1NvL0F2SGxxTFdqLzFwdXRa?=
 =?utf-8?B?UWhnbGF1d3BycXFXYngrTC9lQ2dpSTYxSDhjY1ZzV1NnTHJBTXNVZVZhUUtS?=
 =?utf-8?B?RG5PRFhHTHBKZlpUbGx5enFrZ3VnbGxUeVozQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e458f98-7cfc-41fd-4891-08ddddc9e2bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2025 20:08:51.8173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ne8gUK9ZKSUjTSAcPB27I/HGZv1EZmQJbddTaaJbHJ6oUB5neT/uPgPmluevcQX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB5791
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222012

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDEzIGF1
Z3VzdGkgMjAyNSAxMjoxNQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gc3lzdGVtZC5iYmNsYXNzOiBN
YWtlIHN5c3RlbWRfcG9zdGluc3QgcnVuDQo+IGFzIGludGVuZGVkDQo+IA0KPiBPbiBXZWQgQXVn
IDEzLCAyMDI1IGF0IDEyOjEwIFBNIENFU1QsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToN
Cj4gPiBPbiBUdWUgQXVnIDEyLCAyMDI1IGF0IDExOjE0IFBNIENFU1QsIFBldGVyIEtqZWxsZXJz
dGVkdCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPj4gQWZ0ZXIgdGhlIHN3
aXRjaCBmcm9tIHVzaW5nIGEgc3lzdGVtY3RsIHdyaXR0ZW4gaW4gUHl0aG9uIHRvIHVzaW5nIHRo
ZQ0KPiA+PiBvZmZpY2lhbCB2ZXJzaW9uIG9mIHN5c3RlbWN0bCBmcm9tIHRoZSBzeXN0ZW1kIHBy
b2plY3QsIHRoZQ0KPiA+PiBzeXN0ZW1kX3Bvc3RpbnN0IGZ1bmN0aW9uIGhhcyBlZmZlY3RpdmVs
eSBub3QgYmVlbiBleGVjdXRlZCBkdXJpbmcgdGhlDQo+ID4+IHJvb3RmcyBjcmVhdGlvbi4gVGhl
IHJlYXNvbiBpcyB0aGF0IHN5c3RlbWN0bCBwcm92aWRlZCBieQ0KPiA+PiBzeXN0ZW1jdGwtbmF0
aXZlIGZhaWxzIGlmIHJ1biB3aXRob3V0IGFyZ3VtZW50IChhcyBzeXN0ZW1kX3Bvc3RpbnN0DQo+
ID4+IGRvZXMpOg0KPiA+Pg0KPiA+PiAgIEZhaWxlZCB0byBjb25uZWN0IHRvIHN5c3RlbSBzY29w
ZSBidXMgdmlhIGxvY2FsIHRyYW5zcG9ydDogT3BlcmF0aW9uDQo+ID4+ICAgbm90IHBlcm1pdHRl
ZCAoY29uc2lkZXIgdXNpbmcgLS1tYWNoaW5lPTx1c2VyPkAuaG9zdCAtLXVzZXIgdG8gY29ubmVj
dA0KPiA+PiAgIHRvIGJ1cyBvZiBvdGhlciB1c2VyKQ0KPiA+Pg0KPiA+PiBUaGlzIGlzIG5vdCBz
ZWVuIGluIHRoZSBsb2dzIHNpbmNlIHN0ZGVyciBpcyBzZW50IHRvIC9kZXYvbnVsbCwgYW5kIHRo
ZQ0KPiA+PiBvbmx5IHdheSB0byB0ZWxsIHRoYXQgdGhlcmUgaXMgYSBwcm9ibGVtIGlzIGJlY2F1
c2Ugc3lzdGVtZCBzZXJ2aWNlcw0KPiA+PiB0aGF0IGFyZSBleHBlY3RlZCB0byBiZSBlbmFibGVk
IGFyZW4ndCBydW5uaW5nLg0KPiA+Pg0KPiA+PiBUaGUgcmVhc29uIHRoaXMgaGFzIGdvbmUgdW5u
b3RpY2VkIGlzIGJlY2F1c2Ugc3lzdGVtZF9oYW5kbGVfbWFjaGluZV9pZA0KPiA+PiBpbiByb290
ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3Mgd2lsbCBjYWxsIHN5c3RlbWN0bCBwcmVzZXQtYWxsLCB3
aGljaCBpbg0KPiA+PiBtb3N0IGNhc2VzIHdpbGwgY3JlYXRlIHRoZSBtaXNzaW5nIGxpbmtzIHRv
IGVuYWJsZSB0aGUgc3lzdGVtZCBzZXJ2aWNlcy4NCj4gPj4NCj4gPj4gVGhpcyBjaGFuZ2UgZWZm
ZWN0aXZlbHkgcmV2ZXJ0cyBjb21taXQNCj4gPj4gYTUyZTY2NzYyYzBjNTE5MThiMWJhM2Q0NjIy
NzU5NjM3YjZlOTIwYSAoc3lzdGVtZC5iYmNsYXNzOiB1cGRhdGUNCj4gPj4gY29tbWFuZCB0byBj
aGVjayBzeXN0ZW1jdGwgYXZhaWxhYmxlKSBhbmQgaW5zdGVhZCBvbmx5IHJ1bnMgc3lzdGVtY3Rs
DQo+ID4+IHdpdGhvdXQgYXJndW1lbnRzICh0byBkZXRlcm1pbmUgdGhhdCBpdCBjYW4gY29tbXVu
aWNhdGUgd2l0aCBzeXN0ZW1kKQ0KPiA+PiB3aGVuIGV4ZWN1dGVkIG9uIHRhcmdldC4NCj4gPj4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+DQo+ID4+IC0tLQ0KPiA+DQo+ID4gSGkgUGV0ZXIsDQo+ID4NCj4gPiBJdCBs
b29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgdGhlIGJ1aWxkIGluIHNvbWUgY29uZmlndXJhdGlv
bnM6DQo+ID4NCj4gPiBFUlJPUjogY29yZS1pbWFnZS1zYXRvLTEuMC1yMCBkb19yb290ZnM6IFBv
c3RpbnN0YWxsIHNjcmlwdGxldHMgb2YgWydibHVlejUnLCAnb2Zvbm8nLCAnY29ubm1hbicsICd4
c2VydmVyLW5vZG0taW5pdCcsICdhdmFoaS1kYWVtb24nLCAncnBjYmluZCcsICdydW4tcG9zdGlu
c3RzJ10gaGF2ZSBmYWlsZWQuIElmIHRoZSBpbnRlbnRpb24gaXMgdG8gZGVmZXIgdGhlbSB0byBm
aXJzdCBib290LA0KPiA+IHRoZW4gcGxlYXNlIHBsYWNlIHRoZW0gaW50byBwa2dfcG9zdGluc3Rf
b250YXJnZXQ6JHtQTn0gKCkuDQo+ID4gRGVmZXJyaW5nIHRvIGZpcnN0IGJvb3QgdmlhICdleGl0
IDEnIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuDQo+ID4NCj4gPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yNi9idWlsZHMvMjE5Mw0KPiA+
DQo+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0aGVzZSBlcnJvcnMgcGxlYXNlPw0KPiA+DQo+
ID4gQmVzdCByZWdhcmRzLA0KPiA+IE1hdGhpZXUNCj4gDQo+IEkganVzdCBzYXcgc2VsZnRlc3Rz
IGFyZSBhbHNvIGZhaWxpbmcgZm9yIHRoZSBzYW1lIHJlYXNvbjoNCj4gDQo+IDIwMjUtMDgtMTMg
MDg6MTU6MjIsMzc3IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gb3ZlcmxheWZzLk92ZXJsYXlGU1Rl
c3RzLnRlc3Rfbm90X2FsbF91bml0c19pbnN0YWxsZWQgKHN1YnVuaXQuUmVtb3RlZFRlc3RDYXNl
KQ0KPiAyMDI1LTA4LTEzIDA4OjE1OjIyLDM4OCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtICAuLi4g
RkFJTA0KPiAuLi4NCj4gRVJST1I6IGNvcmUtaW1hZ2UtbWluaW1hbC0xLjAtcjAgZG9fcm9vdGZz
OiBQb3N0aW5zdGFsbCBzY3JpcHRsZXRzIG9mIFsncnVuLXBvc3RpbnN0cyddIGhhdmUgZmFpbGVk
LiBJZiB0aGUgaW50ZW50aW9uIGlzIHRvIGRlZmVyIHRoZW0gdG8gZmlyc3QgYm9vdCwNCj4gDQo+
IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJz
LzM1L2J1aWxkcy8yMTQxDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92
YWxreXJpZS8jL2J1aWxkZXJzLzQ4L2J1aWxkcy8yMDY5DQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1
Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCkFsbCBvZiB0aGVzZSBmYWlsdXJlcyB3ZXJl
IGR1ZSB0byBgc3lzdGVtY3RsIGVuYWJsZWAgbm93IGFjdHVhbGx5IGJlaW5nIA0KZXhlY3V0ZWQg
ZHVyaW5nIHRoZSBidWlsZCwgYW5kIHdoZW4gYm90aCBzdXBwb3J0IGZvciBzeXN0ZW1kIGFuZCBz
eXN2aW5pdCANCmFyZSBlbmFibGVkIGluIERJU1RST19GRUFUVVJFUywgdGhlbiBzeXN0ZW1jdGwg
ZXhwZWN0cyBhIHN5c3RlbWQtc3lzdi1pbnN0YWxsIA0KaGVscGVyIHRvIGJlIGF2YWlsYWJsZSwg
d2hpY2ggaXQgd2Fzbid0LiBBZGRpbmcgaXQgd2FzIHNpbXBsZSBlbm91Z2gsIGFzIGl0IA0Kd2Fz
IGluc3RhbGxlZCBieSB0aGUgc3lzdGVtZCByZWNpcGUsIGFsdGhvdWdoIGl0IG5lZWRlZCBhIHNs
aWdodCBtb2RpZmljYXRpb24gDQp0byBzdXBwb3J0IHRoZSAtLXJvb3Qgb3B0aW9uLiBIb3dldmVy
LCB0aGUgcmVhbCBwcm9ibGVtIHdhcyB0aGF0IHRoZSBwYXRoIHRvIA0Kc3lzdGVtZC1zeXN2LWlu
c3RhbGwgaXMgaGFyZGNvZGVkIGludG8gc3lzdGVtY3RsLCBhbmQgb2YgY291cnNlIGl0IGRvZXMg
bm90IA0Kd29yayB3aGVuIGJlaW5nIHJ1biBmcm9tIGEgc3lzcm9vdCwgd2hlcmUgdGhlIHBhdGgg
ZG9lcyBub3QgbWF0Y2ggd2hhdCB3YXMgDQp1c2VkIHdoZW4gaXQgd2FzIGJ1aWx0LiBJIGhhZCB0
byBhZGQgYSBwYXRjaCBmb3Igc3lzdGVtY3RsIHRvIGFsbG93IHRoZSBwYXRoIA0KdG8gYmUgcHJv
dmlkZWQgaW4gcnVudGltZS4gSSBoYXZlIHNlbnQgdGhlIHBhdGNoIHVwc3RyZWFtLCBidXQgaXQg
aGFzIA0KYWxyZWFkeSBiZWVuIHJlamVjdGVkIHdpdGggdGhlIG1vdGl2YXRpb24gdGhhdCBzdXBw
b3J0IGZvciBzeXN2LWluc3RhbGwgd2lsbCANCmJlIHJlbW92ZWQgaW4gdGhlIG5lYXIgZnV0dXJl
ICh3aGljaCBtZWFucyBJIHdpbGwgaGF2ZSB0byBzZW5kIGEgdjMgb2YgbXkgDQpwYXRjaGVzIHRv
IGNvcnJlY3QgdGhlIFVwc3RyZWFtLVN0YXR1cykuLi4NCg0KLy9QZXRlcg0KDQo=

