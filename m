Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185D4C5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 16:10:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12590.1787069408385501036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 09:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C586iUeH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26909c8a78=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDtxEU1122253
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 16:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=Ih0+zfq/Xn/qAXsE/Gcal26mhD9px5yAyrT3pyZZvSc=; b=
	C586iUeH1+Uz/Ux4frXLj4eexFxgjd64IyGBtMw5Lfk4L+tbCyifG9gQ3+2AZAq9
	DYnJJbA20eKCOI+ntQ04Dfe58ONEg0ONxnCkWrF4P2dyeD3o5RVvQNAcQDsJy0QW
	kZQG7fbw1KVGxq+mCyKg2wR7qDUHrtPMXMWhcun3LNI0XsAJgWsZgHX3T4MBCAo7
	M/koryvn62YA2Tf6floEF1NOozd7RrMS+DxY831amyKZgSJL8Io89JUzHna8L4oq
	15UHUo9CMO1A1rYU204e70L8Af4a0A3NGDqw4pjly8DaMPjm9UMmh/xHsKCRmJGm
	kTEP9aYXj9kxwl0g/Kj3Tw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020078.outbound.protection.outlook.com [52.101.201.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2eebd7m5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 16:10:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/Q1bArRYVC8y66f7BXP/M/wQp1WVDDijByEeBZOthMhsllPRw5/bTgcxcT9TVvKPoKrwVf/lgDBDicL4GpdBev+vclpJFOZYURCNskyaYdnx0KW57lXauZc3LG98+rJEKVhVHAHLgCXSwSqqrVT/X9cKY5Vy3SczCBKPVBByDnG202Xmpvm8QHe69WoV0sA4ZRzj3oFoS8ZOP3sssNvzn8p6UIJLzpDG04YNE7kmC+hO983uJ/ZWFZx+9AjbAYale9NScpmZZmcoejtLKfxhPH/9eem1YEcbKHoXMyNAcShxwAabJ+jD8u+IWxp7YZ5CZYsng4Tx1rvi4fcVzfQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ih0+zfq/Xn/qAXsE/Gcal26mhD9px5yAyrT3pyZZvSc=;
 b=fLs4dFWQ16RSyduF+70qVg/9I0FfjTkC7+BDJ90JusCeleuaOIJJ56Yqt1M/qoMqjyjl12LLujuj+f1O2UJmqApMRMS2FBGkmcIEWs/cxOAIsAYM09dYMK0zMZu1N1X8oSG9r01R80j84thFf1HFk/S8kqottcs7JnA+6VYkSyveXHxOSGWy9x6Mh5BXMdOP34ifjVJxp0gYfRD63J8JeWyYQIMHLA8hQ9qWh4jcxgXAVYFPnlW2Ns9CWMkN/P67rP+1gsnVpKMFc5smFwlBodrR795eWAVjxH3AU14LhEPKMgPOYBLNqUje1r6cQFhdzbT2sfguGZH1VL48PyiDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:09:56 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 16:09:56 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "mattware@cisco.com" <mattware@cisco.com>,
        "esparlin@cisco.com"
	<esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdLdSLL/lciiEiikyKjiZvxXTaqbai0YQAgAEq2AA=
Date: Tue, 18 Aug 2026 16:09:56 +0000
Message-ID: <8e27d69d-7d93-48a7-96c1-4145c477cb4c@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
In-Reply-To: 
 <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|SA3PR11MB7462:EE_
x-ms-office365-filtering-correlation-id: 0c9464f3-02fd-44d4-9e49-08defd43255b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|10067099003|4143699003|11063799006|5023799004|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 8MBCAEXN4liAvi+a/4+oZv0lwf+2ZJL4wg+BKeqKE75Y9tTOgN79WIj9YgCChuEx7fPQus7sR/eypLVdmTHg84cbetgu/rvSmbzDca00nslW/CxGcPpZbIM7KHy9eXgTG6yikrgdidCklCAHPnKgr41fj85MlfkIDMkeIlIaK5jIZ3M+2FOSfK6lsn8CJBCMnB/K/q/ci5cazfPcfCDMgJV0+4H8kNapOCQveABaDlerdLb6mpGyP4te8I4CjvoX5OND4BkRjiEQE8FYNiKs/bkXygvAB6zAFrzKjJ6SdTNGHPHE/7zeIMzux/Y3zjCTu2wsHnqNSmPLA/UqgL78148Zed3e+1iouvRlmjomyR5WzhJVImYfApuFYLoiyYUKjkAGlU2yzEjNK9TOW8FKS5wnHQNDuB/xM3daHgkOkoDSvUtRzusXuNSDW/Nwy6wJ9PiCbZl8KP1DY3qqmTJ3Tu5oS0MD1+jwm0uJh2/ujBlbKkFYkAmTJizuHAIFOT1m/jkN9Cxq5Tf2/s3DJv0EIIJOlqb8N/+1yoHNxyikIHjub0ryidSdDIqSosL2eV0fz5yttzLG07KlTROkVAGxao2dw1DaPr4WaNB6XyUjvnXrpP/dXa8+jzKWNNk6IV8b0k704ZdKByIyDIShHj7cy98VCbVwXCAl6J3Prb2ZHqBPldIn/gzuvDqlk7VJJXWmBCEXMAco7mc9fH7ejO9JG2kJoXWQpnPXtq9yyfCypj0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alZGZC9meFdkb01xZU5OR05aZXh1VnFRYWFqUW9wL1piWDdPYVZJZWhnbGha?=
 =?utf-8?B?VkM2bXJUWWlnTEk4TDAvYUg5U244NVl3MUFGY2hEOUkvRkdzZDhQbGlxT3ZB?=
 =?utf-8?B?KzN3TFM1NXBXZkd1dVQxZ0dmM1Nidks2a25PNitMd3JXbXpPemYxNTJpTENy?=
 =?utf-8?B?R3BFTUVBUWhnME5DTytDRTBjMUxaVzl0R3Nobnp1UEg3dGF0a3lMZXFzcU9L?=
 =?utf-8?B?SUE4M0pZMW5mYjVjU3ArNXpqbXdsMnd3YjkwY2pUeVNrR3hqcFZ3WE0yYmJx?=
 =?utf-8?B?SnkvTUljRlRzSmZ5cTJzVXhNL0IwYkVMVW1FZVlPcnZONmFubmZNbjFld2RP?=
 =?utf-8?B?MlhtTU0wSHFhY1lSMVdqOEFtSEFQYmR1NnZNdGdDeDliZWlGMDRZTjhSYklV?=
 =?utf-8?B?ZVkycFkveXRhTnRHZFZFcWQyZ0VkbUNKWWh6cnA0ZlpQZTdaV3MwWjQ1bTRy?=
 =?utf-8?B?d2dvT0pVWDIreUM3SktpRHZ6T0kvcTIvcW5BTDZ3OC9UOXVxQlJ2bXZMd2k0?=
 =?utf-8?B?YTRWWDdaU1UvN2NmZ3JCWXFHWHZoMGVEanFkYk5tcHRmajhmRzc5KzlVNUxO?=
 =?utf-8?B?UWJwTW9KTE5Lb3ZlSitna1FGWGR6NTh6eEhqUXlFaWwxTnJkMkVBMXRUd0pi?=
 =?utf-8?B?Wi9YU1dUQTNpa3ZiczVKYWJzRzhUTmhOUVphcEIzRGVkRll2MUJNdFlYbmtv?=
 =?utf-8?B?RnpQcG5tMnpBVmJkZXRlTU80bnBvbEQ1WllyMUFNNkRLWmF4Z0xZQ1lPUFNj?=
 =?utf-8?B?TGJtWGlNMGxYT0F1MVlJWmQwVk1LaW05N1c0V1VmemN2MGVVTzJqcXJwRnNk?=
 =?utf-8?B?aGRlV2x1QnhJSFlOMDMvWVZOWWFHYWhyclNJSnNmTzBtQTRvWEtHVzY0WTgw?=
 =?utf-8?B?K1g0am0rK2QwTi9ySUptMFhvOXc0d0Y5bWRoQ2p6M3lzWm5vOXFOcVI1dXRC?=
 =?utf-8?B?bGRyS2hDVkZjUFdscm1KK3VoQk9tRHVXVnduaHNoQ2lMa3FVUkhyWXRvenhJ?=
 =?utf-8?B?MHhzZzllTEFTWXBERFM3TnphL0V6NzlrS3FUQkIrL3ViZXY5MXFReFVOaWFv?=
 =?utf-8?B?QnYrd2NzcjRLL2RWVWFnY2xKOUtBbkxKajRZamxrVVJVd0djZjdOMHloY3hF?=
 =?utf-8?B?aVJ0WWc2V0FoUjUrZTBIU2dUVU1Kb2oxYlB6TUxTa1RsYW92QXp5bEVvZzdo?=
 =?utf-8?B?NmtmMFBCZTRvSm9TU3J3c0VuYVlTQWE2bFQxRENXUzk1c3FQK0UwKzMrY3dY?=
 =?utf-8?B?TlJnVlIxdlJaSHkwcUZjd2FqTXg2VVN5bzU4K091c3BkM3VvbXg2TUJCa2tP?=
 =?utf-8?B?QkRTRmR4dFk0ZldrTDRPQWRMTy83ODg3WEZscDMvaXpobXJ6MVN6LzNVVmJv?=
 =?utf-8?B?b1p0MHdESkFIMDZXUTJwRFprNFV0V2V0ZjljbFFReTlQdG1PNWNoSE9qZzA4?=
 =?utf-8?B?cEgvL2M0M1NxemYzWk92MmFwWTNjMmxneTd5ZmlrZzBzYTJkbC82c0N0Q1k4?=
 =?utf-8?B?K1I0Zm1YQ3hqdGprZW94SmpubWxNbDBBTnN1Z2cvWmRDaS9scmpaQVN0eTJv?=
 =?utf-8?B?WW13bkNUTHVmSytLbzlMVTFxVjNNNloxdC9IQlNxRWF4MHdkYWE0NUhqeFhp?=
 =?utf-8?B?aU1qZjNuMERwVmtMZXBOdDVJTlkyZllIbS95YTJISG05Ni9RMGdyQXVmZVl3?=
 =?utf-8?B?Wk1rcnEvZlFMVXJZdE9XMS9XU2tGUTFlVHdMYjRuZmVvZkJBOGxvOVovVDlB?=
 =?utf-8?B?eEN5VllZd1JINm1STi9wUWRpcGtDRHVrRGMvalo4LzhlWnl6ckFGRXQrZnpJ?=
 =?utf-8?B?Vmc4akdCMkVYK2dOUWFEY2lDb2czSGxNUHFHNUlMcEhBWjFnMm13eld6d2ky?=
 =?utf-8?B?eGxTcUd1MzA5VTdOUE84VFYwbHhKRGtJVnpwaHhwN2xEcnJpOC8za25kckFT?=
 =?utf-8?B?czBqMjNoQXBVNzlBQ3JmUTdNNTZ1MzJkS2R2QkNyZW9NY09kVlNpMVRNdkpo?=
 =?utf-8?B?Q2E5KzI5KytTV29CdWhOMC9lVm9QOVJ6TW5VakgyZmxrbkh4eWtDa21YbVBp?=
 =?utf-8?B?RjdHUmRPQkNoMkZZMFVOMi9HenRTRFhtc2dGU3VlNG1NMXhEVmpIUHRRZ1Bm?=
 =?utf-8?B?TjQ0M2c0VkFkRnJuM25XdTROSWxRRWlXT1lvZEdqd25lMlpiaVVsQkZhL0FL?=
 =?utf-8?B?MmxoMnAxakFXMnp3anpCOE1JYzBDc3FWd3pxckRNVkx5NGhuWmxNcUVFSHlw?=
 =?utf-8?B?VXBBblZtNHp5SXY1ZSsrS0JpRmRjUGRldnNDTmsrenBJYUlJTHh5YWlOYkdI?=
 =?utf-8?B?dkJjQ2hhRDIySyt0dUZZZVJPcjN5TEUxN1RrMjd1eUhLZHZ4aXdrWUg0aW1h?=
 =?utf-8?Q?NxNAaGlxsChfbh+o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89B23A2EF7BC4741A4D6D9FF0CE1836D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	NHdedFwQpGGUtKZ+W8tHHNAA7HswZTk/KRQeZxfoOYOU7Ql78uwOBZMJgVi/IP6jHDfYg5b6xSZTm12PqG5hJwjzY/TjMUTlVrUt8fuEdKwNIjHeHkoxi5M4qffP6XkdB7e9hoh+ITZXTXAxRPLy6HcDsysPAFno2XYoJ98v3pstY/gNWrIe+smkXFvZ0gVKqnNbvtA/41XD4/LSXbJabpJi9N0ZTq0fgAlty0x8+kSVQ6fwumGGWbDb9nNk0BR7DERZqb6XMNd575SjwrzOAFR3V321iWio9gMDZB3gOS7vBNLcDsMueCwLyt4h4KTnKPfW9fNtT0q/xwNdu0N80Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9464f3-02fd-44d4-9e49-08defd43255b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 16:09:56.4544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DeYYhRSeMf0j5M+7NA6sziP4my/QyevVTGr2dvgIGGhKDHhi15uH1BuQ+BzgfP4FaCZ95xavhW67iGPymjLnQcABSy5lqVw0EmOvaPaUaYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: EXNE0bn1yvK8h2cr8Jc8mzhtIjocVyLG
X-Authority-Analysis: v=2.4 cv=DLy/JSNb c=1 sm=1 tr=0 ts=6a8483de cx=c_pps
 a=liVm50ALzK+Uh0u2J7W3cg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8 a=ZM1UMM6c0oSqzygfa2AA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExOSBTYWx0ZWRfXysgcKQdJI1r+
 pZm8Gy1pXzwHbhNa6zIVJ2pVMLNrlPCK+peL2NFROg1PDbJDS/kFawNCj1Q/DK8JWjm/zPYYH9f
 9SMGuclGwlaKiPXNjZWAymIUxXv5/MojmUDDNRQ3eR+EofyEZ2Yw42IAlQAoL2GvGXriLsRK5Fc
 O/j03t7xPKFi6PZpRxUPtN1Ba9ZRlHcoNSXGS3BLADO0v6N0l20+w3J+7t/w51D3f9Vh0jRJqVQ
 rT76APc5w2C8ZkxYwe4nkHZFOQo0/AgTOz3Pj0v2qMZ/3U9KsZ9YkaiwE19O+4EnEyqopd1piz1
 t0wpO8grNGKGCA4/nOucACPFyY3U2/mE7BqV8WrS6YBBtBLRModZct1HTMDVjZuGa51SztK9z06
 TfhS6wKFO2qCjhLeYmAMZUDalFspEBbSARsiSfzqBnhR0rQ2n4CFyQYjlu/yZaDJanU6LdvTDCk
 Kp+VA6kxCHxPsfAnJ+Q==
X-Proofpoint-ORIG-GUID: eS9omfOhyOTM5AHiYnExOzor2kBUq0wf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExOSBTYWx0ZWRfX+a6Fi9q+iAVz
 3W2HPx50tBBta3Fl2j2ADylasnPYzOuSTN/WJi08MrIn2lVykwEwKCss5kDfPYtQo/NK6pS3npZ
 hfjjHLbNMYLfGwq9y2iyR4nnNZ/I3TyoVRCwnMGkrcT1VqJwLNkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 16:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243687

T24gOC8xNy8yMDI2IDU6MjAgUE0sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6
ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBTdW4s
IDIwMjYtMDgtMTYgYXQgMTY6MTAgLTA3MDAsIFN1bWFudGggR2F2aW5pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gU3VtYW50aCBHYXZpbmkgKDEyKToNCj4+ICAgIHBhY2th
Z2VfcnBtLmJiY2xhc3M6IERyb3AgZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgdG8gc3Vw
cG9ydCBycG0NCj4+ICAgICAgNg0KPiANCj4gSSBhbSBzdGlsbCB3b3JyaWVkIGFib3V0IHdoYXQg
dGhpcyBtZWFucy4gV2UndmUgZm9jdXNlZCBvbiBidWlsZA0KPiBmYWlsdXJlcyBhbmQgdHJ5aW5n
IHRvIGdldCB0aGlzIHRvIHRlc3Qgb3V0IG9rLCBidXQgd2hhdCBhcmUgdGhlDQo+IGltcGxpY2F0
aW9ucyBvZiB0aGUgaW50ZXJuYWwgdnMuIGV4dGVybmFsIHJwbWRlcHMgY2hhbmdlPw0KPiANCj4g
V2hhdCBpdCBtZWFucyBpcyB0aGF0IHdlIGdvIGZyb20gdGhlc2UgZGVwZW5kZW5jaWVzIGJlaW5n
IHByZXNlbnQgZm9yDQo+IGFsbCBwYWNrYWdlIGJhY2tlbmRzIHRvIHRoZW0gb25seSB3b3JraW5n
IGZvciBycG0uDQo+IA0KPiBJZiB5b3UgdXNlIHJwbSwgZ3JlYXQsIGl0IHByb2JhYmx5IGRvZXNu
J3QgbWF0dGVyIHNvIG11Y2ggdG8geW91LiBJZg0KPiB5b3UgdXNlIGlwayBvciBkZWIsIGJhZCBs
dWNrLg0KPiANCj4gRG8gd2UgcmVhbGx5IHdhbnQgdG8gaGF2ZSBkaWZmZXJlbnQgZGVwZW5kZW5j
aWVzIGJldHdlZW4gcGFja2FnZXMNCj4gZGVwZW5kaW5nIG9uIHdoaWNoIGJhY2tlbmQgeW91IHNl
bGVjdD8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KSGkgUmljaGFyZCwNCg0KWW91
IGFyZSBjb3JyZWN0LCBhbmQgd2Ugc2hvdWxkIG5vdCBoYXZlIGRpZmZlcmVudCBkZXBlbmRlbmNp
ZXMgYmV0d2VlbiANCnBhY2thZ2VzIGJhc2VkIG9uIHRoZSBzZWxlY3RlZCBiYWNrZW5kLg0KDQpJ
biBSUE0gNCwgTUVSR0VQRVJGSUxFREVQUyA9IDEgcmVzdWx0ZWQgaW4gX19maW5kX3JlcXVpcmVz
ICV7bmlsfSBhbmQgDQpfX2ZpbmRfcHJvdmlkZXMgJXtuaWx9LCBzdXBwcmVzc2luZyBhbGwgYXV0
b2dlbmVyYXRlZCBSZXF1aXJlcyBhbmQgUHJvdmlkZXMuDQoNCkluIFJQTSA2LCB1c2VfaW50ZXJu
YWxfZGVwZW5kZW5jeV9nZW5lcmF0b3IgaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZCBmb3IgDQp2Ni1m
b3JtYXQgcGFja2FnZXMsIHNvIHRoZSBmaWxlYXR0ci1iYXNlZCBnZW5lcmF0b3JzIGFsd2F5cyBy
dW4uIFRoZSANCm9ubHkgd2F5IEkgc2VlIHRvIHN1cHByZXNzIGRlcGVuZGVuY3kgZ2VuZXJhdGlv
biBpcyB0byBzZXQgdGhlIA0KaW5kaXZpZHVhbCBmaWxlYXR0ciBtYWNyb3MgdG8gJXtuaWx9LiBX
ZSBvYnNlcnZlZCBpbmNvcnJlY3RseSBnZW5lcmF0ZWQgDQpwa2djb25maWcoKSBkZXBlbmRlbmNp
ZXMgb24gYXV0b2J1aWxkZXIgYW5kIGxvY2FsIGJ1aWxkcywgd2hpY2ggbGVkIHRvIA0KdGhlc2Ug
Y2hhbmdlcy4NCg0KU2hvdWxkIHdlIGFsc28gc3VwcHJlc3MgYWxsIGF1dG9nZW5lcmF0ZWQgUHJv
dmlkZXMgaW4gUlBNIDYgdG8gbWF0Y2ggdGhlIA0KUlBNIDQgYmVoYXZpb3I/IElmIHNvLCBJJ2xs
IG5lZWQgdG8gaWRlbnRpZnkgdGhlIGNvbXBsZXRlIGxpc3Qgb2YgDQpmaWxlYXR0ci1iYXNlZCBw
cm92aWRlcyBnZW5lcmF0b3JzIHRoYXQgbmVlZCB0byBiZSBkaXNhYmxlZA0KDQpUaGFua3MgdG8g
QWxleCBhbmQgTWF0aGlldSBmb3IgdGhlaXIgdGVzdGluZyBhbmQgc3VwcG9ydCB0aHJvdWdob3V0
IHRoaXMgDQp1cGdyYWRlLg0KDQotLSANCiMgU3VtYW50aCBHYXZpbmkNCiMgV2luZCBSaXZlciBM
aW51eA0K

