Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2843ECA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:53:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1035.1790700824636056703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AM+nrJS9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=473248f204=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TEA3E62054543
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Ifpxl5Eij1nLv473AalToSi8L/6A1mMe4CGrB1OsFX8=; b=
	AM+nrJS9e6oamWXsxcTdRf2EYbxuTrWtbXLUkq97sQBWjELv23d1HLS2V8Vz0hTv
	vwUV6aE6frQyb6Es/y4//fmGyttkzvIxyENj5nLYkCQBwBnmwtsbvJkzwN9ONPPq
	iMUkzKXSH8yLJeqpkRC56T0Dgi8/RE8eeJFwiZARRdopmXsVkGn/LmTC1qMiGV3r
	k4nQC20f7R0UoI5ENZ5IourgUifcsPFhCXscMUqu9OPZ8VhmYT7EDY+5RMFvwrh6
	94bETUtF3DCjQ14PS4oubh6ZNFk5gkog2XoQ59nzpX4z3El+0qqOTF0fJ50ee+52
	BIdLpOXCZqL9Df5d28KAOw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020088.outbound.protection.outlook.com [52.101.46.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515cxwq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 16:53:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tcvf/aPnWeJsh1NqCcdBrKAqbxWupPhzq4niBZrNlrWSQ5vxSSLaCP+8qGrZxa3xLGtOq6rCQ4gg4qoaFAgxhv88t7XfEqVfGgKYPS42/dH48EW9K81uSyjK2/6xctBymeKjsiW8Tf3kpggnka2kZmUfe7D3+W2w9w1zgcUdpy0hfCHIaNoigxUXulUiapPfwZzKc2RfgWaq0zWeRlVODxARTxf6XGzIK9KxPuq4Q4VSJB+1zXKFdajXD209e1Z73PddLnDDPjldnRFIcf4ggTNuoK9Lhy1jwqEIE3VRWOy45dgNNcdVpmN4sfg3XZdmCJ06c9l5e5WVBs3w/e0AkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifpxl5Eij1nLv473AalToSi8L/6A1mMe4CGrB1OsFX8=;
 b=Q8GtCgipWu3EGR6wcpOjgCW6IGLjG/HHTGwKbUtZ1qH95KgsHYsdJouPIXa2X0oNiE/CzhDe8QdVOLnaCAI2WS+Wdbo2g+BwSJhQh2wAnq6whEDD2qUCzyu6RJEuB5F9vhw+0F1Zy2Q5suJFXQPLi0AUfPxlVCsxAUvxZJg9z9q6T/RNSmxEOHFVACsvOXemL2nvwiFsyNlep2l1g8maAipwvOIOuXyZqfIff3Jy+BS44vOuSf8Nwpae3ZzA8wVLcGXYS2lfA2kLyc/G1meu9Nu4odRBm/r0pa8pcenWzLkCdJ4hURb1+MhUXF8T2cUmUN4OrSCZyJPMFiBRyC8yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2864.namprd11.prod.outlook.com (2603:10b6:805:63::26)
 by LV4PR11MB9489.namprd11.prod.outlook.com (2603:10b6:408:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:53:40 +0000
Received: from SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e]) by SN6PR11MB2864.namprd11.prod.outlook.com
 ([fe80::57cd:f606:2a6e:4d1e%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:53:40 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] less: upgrade 704 -> 710
Thread-Topic: [OE-core] [PATCH] less: upgrade 704 -> 710
Thread-Index: AQHdUCvfD3+w9+v1vU2bjekC9ZAUtLblvJMAgAADFoCAAAK3AIAAA2+A
Date: Tue, 29 Sep 2026 16:53:39 +0000
Message-ID: <9a92e609-4409-4cde-9398-b7269b200714@windriver.com>
References: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
 <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
 <0920899b-01ee-41cb-abb1-98cf2c0877ce@windriver.com>
 <f2dbc6adfcf389177181ae799179b0c4bb39b51b.camel@linuxfoundation.org>
In-Reply-To: 
 <f2dbc6adfcf389177181ae799179b0c4bb39b51b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2864:EE_|LV4PR11MB9489:EE_
x-ms-office365-filtering-correlation-id: 039e8082-89ed-4d79-5c08-08df1e4a3672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|38070700021|11063799006|260925021311599003|10067099003|260925021911599003|260925022911599003|12006099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 JKhw50e3cr9aZvIA8m3t/Ndl5RkHI1f9pdGWSh18UZReZ3zkzz8m0dMiGkzKLVl5YW8GdVLi/qMJZfOVQoQE+s0MDPyQ4Sj8a7BuMR69I193zxLE2EBJLgDti/hCirwUtiCq0JOuvRHhgmbwD+91OmFOpxyE0Ia+Pca1P7AoqFCHYH9A3FILdshowhoLI0zBT/pdae5JCJQ2yzVMYHRUrY2snsxfVE4kKeIq40O/1TIBBGNmXfDA9cq1Jtb0cUFRwDyv0yTAN8QdQN0rd/0Uxx8rlwH83a31Pop7y3/v6P8h5mWJPFDqJ6ZXG23Rm00ULfzDLASIP5i0g+e1IaZu1OWVjHyp6OthxvokC3H6XxgWWCoj45BKkbaJqVv9wUrGxw6xVsEBUkUyob2kWT48U8vp++WIimMwhtpUJYXJzhsF1xfZMqISnAjEZAoKASu9rAgZSmq13BLk4gVubaeCfCYTHVphMpKUpf5oOwOqNSKxeCA4Oy/VA73AUuxNrO0uD4SOaQWAIdEYvkRKy9NJRZVEcGz/sZ8r0jRVoe0DmWh7AziQUfcn9ypf3eQXpCk2jzAtVIevBooN+E+aTN22sR7SkjCTtwOMGc5LVkXagrOyVPu+AGt4zM7hYoVZgvSSMYUSqh7HDtUJWXeCiBubd1+r51RgbQ4awONuwSZRF1s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2864.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(38070700021)(11063799006)(260925021311599003)(10067099003)(260925021911599003)(260925022911599003)(12006099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VkpHTFRweG5HQks3QnRzaHlJQ0Z2QndnRTY1Z2l6eXY0UFBQc3RLUWxZRjNq?=
 =?utf-8?B?WU9ieEVndE1PWWJRdjBhcUdPZGw1L2VaTEVNaU9WMzBhbDBZT0JIQ2pwd0NS?=
 =?utf-8?B?SnVnZDA5SDJud044NzR3ckVDaUMxUkNYYW1VbHV2TnZxZmRVNHozeHp3VTVH?=
 =?utf-8?B?TjNjTkFDeUN0MGpCdzhVNWpCTTVmd3RuZ0ZMU0g4djRCd0pRaFROL2xyY1NL?=
 =?utf-8?B?RXpycHJld09pdFJDeHI5c0dxcnl6ZGFpQ1EwS3B4aExQZ1pITmtENmFNZS9P?=
 =?utf-8?B?elZEd2c1a1lrRkRubjZab2tNWGk0MjJNWkxpbjBneDUyYXJPeXhFdnh5V0Ux?=
 =?utf-8?B?V3oxK2NUdEFzR1ZYOVNNOG9WYXRnTXphY1JFUGErSG9qL3dYRC9PVlV3Nk5E?=
 =?utf-8?B?b3NGRG15a3YzYVBvOURiT3lhU2tPK3VaZXJtYUJIb0toeWxkam82cUJ6emtS?=
 =?utf-8?B?aHZqblkybjFNSFZhM1NkYUUyN2VsQjhsdXY0WVBZZnRQNVJyMGdvWHdjUzhp?=
 =?utf-8?B?QkhNaWMzWVFJYjdWR2RZQjNUZDFwaFZDdEF0VERVaGt5UTIybXlkZU8zR1M4?=
 =?utf-8?B?WXZHbmNOV3ptaUtxWnhKUXd1b08yU3FLc0U1Wm1lRW1XWG0xZWhNQk85b0Y4?=
 =?utf-8?B?ZG01N2ZVN3FVRjlsbG95U0xSdjN5eUZ3MU94Z2ZwWkIzZ3pibVF5YURUYlB2?=
 =?utf-8?B?ZUM5S29hRUZVZExod1BhS0p4dms4WThPYmJBTitLQ1RoeVBESXlCajhudFpB?=
 =?utf-8?B?VDR5cUFza0JjRnB1a3h2RStjOWdGdXp3MWl1TllyajVaTnFnc1lkNVBRWmJP?=
 =?utf-8?B?YzJ3YXRiWVRoM2Z6MXZTajdNRmwrS1pjRjlzUjA2anY4UE8xckFmRTZjWUg0?=
 =?utf-8?B?c1Ztdy9PUlFiNWo0THBuOEJvUHlqWjVIenZSZHFCTndOd21PeVEzRTNSU0pZ?=
 =?utf-8?B?TFQ3Ty9zSjBFbXB2YTRoeHcxbWNldHgvTnlRbW9KOFlDK3h4TlVlRGd1ejNm?=
 =?utf-8?B?OUY0cW0rNkFiYjRkR2YwVXhLbExSdCsvMVZqa2kwa055aDBmaXhrTVYwbzQv?=
 =?utf-8?B?NzVITmQwcFpvSm4rU1FWWWE0RXN6STRYS2tCcFB6S3dpb2draElhUmVVSlNG?=
 =?utf-8?B?dm1PdGNxbEZhWmtORFVzaXBsWTBPT1NRTU1udmZwcVZHd3pNREQwSS91OTQr?=
 =?utf-8?B?ckxWMGxsajl1UngvUFN6TkdHUWZvYkRNUmI0NTRkWm96Z0U5TDIyZVJsREk0?=
 =?utf-8?B?VzBxWHFtK3lQQnhYZTZ4eW1idXgydmQrS0dTQVRpdmNXcmVNVkozR2RlVU9r?=
 =?utf-8?B?ajVhYlVHbmp1TDFmYUxJakFha0U2ZTlKb3p2Z04xaDN2MnJremh1MU1ZcWY2?=
 =?utf-8?B?cWNyTzVEbVFUOW55dkxrdVZsUnpWenZZWVM4Rmk3QmFLMVhoUkRzTXJPM3l2?=
 =?utf-8?B?THBObkNlblBmakcxOU5WVEQ5WlBESUMxOGhZa1diWThvQjh3eC9kSFVyQjR6?=
 =?utf-8?B?ZFBRSWVXVjBhVmplRnJ2bzhvdUdMNDkrQ05vNFFJRUhkV21EakMvUVVNQk1o?=
 =?utf-8?B?OGFjUWhoZ2hnMTgrenNQTDhVZytoQ2R5cll4Sm9mUzQ5QjdENjA4TGtkTTRI?=
 =?utf-8?B?YUVSUVlTZHM0VXpZT0xSSEZ4bktEZDJxMWlMdVgwS0YwV0krS0IvNnZBOFJk?=
 =?utf-8?B?cUhUNDFBMC9TV2h1ekJNUWEwZXFDMmFRdDBXZURMRTd5cEtJKzU2YTM4aURj?=
 =?utf-8?B?MjFkOXFjZUt6RnN0M2hUU2crTm9ncVBBVkhZTEYxeGtGOVFLcmpHZ3FMeDBh?=
 =?utf-8?B?WEE0eloyMVJrMWpDUmtHK21pVTJnVUx0TWp4cGFPblR5cGM4czNtNjNSeXIw?=
 =?utf-8?B?WXpqM1lwQnI0SVhjeFNYSkk3WldEVm45MWtVMWJnajhzdmgxU3NrNGZCZG1z?=
 =?utf-8?B?V0VYc3QraFQvcTJJSHJleEJhdHhYNzNOZ0dxSVdLcGZrbTVaU1ZDeEFvVWtO?=
 =?utf-8?B?SHpPajBlQ3k1dnNKUi9HY2ZOQjFQYm9KU29QQW03VUFmclZWbjl2SkNDaGN4?=
 =?utf-8?B?dTdaQjBhN2JIYWV6RzZmR1pOWkFpWUUrMDlVQUVoZERTU1g1ZHg1UmdoWlBl?=
 =?utf-8?B?cFdrdTZwMWdteDlBbE1UeUhON1FZYXdMbG5yNGhqZllPQzVuMlRqR1NHeGlk?=
 =?utf-8?B?KzZiU0IwaW13d1hTNldQeFhpeDBhT1NaVkxxRU13YlpvZGdKMXkyYVZWMnBS?=
 =?utf-8?B?cHdiaEQyNkp4VkpEaVV4R0RZK2J0dHZJL05VQTYyb0tEV1JHQmQrNHpGNnhG?=
 =?utf-8?B?emMwU09MdEJYMTdhRnlibnZ4ZTdTZU4zOURKbW5zOWFjaGtzbHdPS0l6RmYv?=
 =?utf-8?Q?cmTS6sIsL8yy/fAo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5736D1AEE4BD684190F8C5F1A2D25FF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	L+gkMwbU9o++7eDO0Ki5Rj/7zQSn0Qt1TnGObDrdy8A06qryY+5qFce0NtP7QIgENoRs6r9JFdFje91si9bzxxZIRHvg9Mc+ZBdxy0lGiLcA1ExOadw5yVwpvj23Ix9TLOm6MCsPdWsnpdzNoIuKiWLzffKx+7zGDhvUBVDk2rBtOyw1X5EBlySbWdmkG218niILlC5m9wMRlGRrpkLkZNW0vge1ntZ0uAyOpI5tH/krNZVd+t+HwI3UYLX7qaPZwU7skiUJbMQd90vvTTXmwYo9fTNPVJNVEl+u2r+0tQLUvHpd3byROFP6QcZJ30toK1so70hbWo3egNiPjqgLuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039e8082-89ed-4d79-5c08-08df1e4a3672
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 16:53:39.9591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XIMNRWpj38peL2zxuVBdo2F073c/OexQyujX+se0D3JJnjEbOzihejjc3u8Y/5RtWBViKzoTQjYgA6io+CMd/ayKcUQbx/DvVCB5pa3yOM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9489
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2NyBTYWx0ZWRfX1WmpcwKldsY8
 Noa6hOEPvZ6uYVvEpYACroRW9zDbv439Lo5dX/oTpNm++m910lRmsqoqgc/hedal2nLKHdjqDFR
 Otp69+abiEZ+ywt5IDE7ykxY7TghZsMEK32je0IyTxVhSrSxNrA1
X-Proofpoint-ORIG-GUID: 4-gPfQLuofS8WIeN7_DiBuQQ7WNWVdPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2NyBTYWx0ZWRfXwrW4WDh8YCXE
 TcRWGuuw+IrkY3Ylj9e1EHS7C5H0W6vyeI3UCymVLTNoOW3tkY11dUUm8fEB0uOJgE7oYYrZWhH
 q/Pdge5f81qe0fhjNNakDqLe+EWi9ZdReNFDFeDcTd+NuRPatpwZYo0fDFuoibPKNKCsTomgiGI
 zCALmoLF/irjmJrmTRSqqUC5BeBYMJZaeE95GmIhERFHqsffCax1Fu1qhxeeor5DdnWIa6CLD9f
 kBtDTmls557Aiv19fUj4x8aJqsSQkM9850b+yUbw3UO/Ot2ZwhBP4+7SQcqQ/ZVs/I7tBrMO87j
 tutooeanFqc8+dltm7M9U6YM5XNWP2y2wHT75ll0GG0yWq9hfoIPsye38QZ3BSFAQxgxqg8rQi6
 xCc9eRRZ56+vntcG9jY++XbslmEpYcEGsfsTcMBCrBbgvn+/9PfjG2JPHdRy1kNo2SkwbyMhEKk
 AepqjEa4qaKYuRi6r5w==
X-Proofpoint-GUID: -Lt4HS4XzWMSWrVGxoqprlJBjZexOKwf
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abbed17 cx=c_pps
 a=XrAAyJxZ/W28UfFUt0AM7g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=4avBbA3pAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=72fS5mxkdbvYHm_NHoAA:9 a=QEXdDO2ut3YA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246884

T24gOS8yOS8yMDI2IDExOjQxIEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gQ0FVVElPTjog
VGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCj4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25p
emUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gT24gVHVl
LCAyMDI2LTA5LTI5IGF0IDE2OjMxICswMDAwLCBTdW1hbnRoIEdhdmluaSB2aWENCj4gbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IE9uIDkvMjkvMjAyNiAxMToyMCBBTSwgTWFjTGVv
ZCwgUmFuZHkgd3JvdGU6DQo+Pj4gT24gMjAyNi0wOS0yOSAxMjowMSwgU3VtYW50aCBHYXZpbmkg
d3JvdGU6DQo+Pj4+IENoYW5nZWxvZyBpcyBoZXJlOg0KPj4+Pg0KPj4+PiAqaHR0cHM6Ly9ncmVl
bndvb2Rzb2Z0d2FyZS5jb20vbGVzcy9uZXdzLjcxMC5odG1sDQo+Pj4gUmVjZW50bHksIHdlIHBy
ZWZlciB0aGF0IHRoZSByZWxlYXNlIG5vdGVzL2NoYW5nZWxvZyBjb250ZW50IGJlDQo+Pj4gZHVw
bGljYXRlZCBpbiB0aGUgY29tbWl0IGxvZw0KPj4+IHNvIHRoYXQgaXQncyBhdmFpbGFibGUgc2hv
dWxkIHRoZSBwYWdlIGRpc2FwcGVhciBmcm9tIHRoZSBpbnRlcm5ldC4NCj4+Pg0KPj4+IFRoZSBB
VUggcmVwb3J0IGhhZCB0aGF0Og0KPj4+DQo+Pj4gICAgICBbT0UtY29yZV0gW0FVSF0gbGVzczog
dXBncmFkaW5nIHRvIDcxMCBTVUNDRUVERUQNCj4+Pg0KPj4+IE90aGVyd2lzZSwgdGhpcyBzZWVt
cyBmaW5lLg0KPj4+DQo+Pj4gLi4vUmFuZHkNCj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBTdW1h
bnRoIEdhdmluaTxzdW1hbnRoLmdhdmluaUB3aW5kcml2ZXIuY29tPg0KPj4+PiAtLS0NCj4+Pj4g
ICAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mve2xlc3NfNzA0LmJiID0+IGxlc3NfNzEwLmJi
fSB8IDIgKy0NCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pj4+ICAgIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy97bGVzc183
MDQuYmIgPT4gbGVzc183MTAuYmJ9DQo+Pj4+ICg5NCUpDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYg0KPj4+PiBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNzEwLmJiDQo+Pj4+IHNpbWlsYXJpdHkgaW5kZXggOTQl
DQo+Pj4+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNzA0LmJi
DQo+Pj4+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcxMC5iYg0K
Pj4+PiBpbmRleCBkYzg0MWE5YWU2Li5mM2Y1ZWJkNmExIDEwMDY0NA0KPj4+PiAtLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcwNC5iYg0KPj4+PiArKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzcxMC5iYg0KPj4+PiBAQCAtMjksNyArMjksNyBAQCBTUkNf
VVJJDQo+Pj4+ID0iaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2FyZS5jb20vJHtCUE59LyR7QlBO
fS0ke1BWfS50YXIuZ3ogXA0KPj4+PiBmaWxlOi8vDQo+Pj4+IHJ1bi1wdGVzdCBcICINCj4+Pj4N
Cj4+Pj4gLVNSQ19VUklbc2hhMjU2c3VtXSA9DQo+Pj4+ICIyMGEwYjBhMmJiMjUyNWZhNTNjN2Vl
ZTliZWI4NTRiNGM5Y2YxNzJlYWJiMjA5YWY3MDIwNzQzNTQ3YmZlOWZiDQo+Pj4+ICINCj4+Pj4g
K1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+Pj4+ICJkMTAwOGZiNzhkY2FlMTMyM2RkYWI2NjRiY2Iz
NTJhNjFmMDIyYjFiMTMxYmQ4MDE4NTQ4ZTAyMWQ5NzVlYzdhDQo+Pj4+ICINCj4+Pj4NCj4+Pj4g
ICAgVVBTVFJFQU1fQ0hFQ0tfVVJJDQo+Pj4+ID0iaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0d2Fy
ZS5jb20vbGVzcy9kb3dubG9hZC5odG1sIg0KPj4+Pg0KPj4+DQo+Pj4NCj4+PiAtLQ0KPj4+ICMg
UmFuZHkgTWFjTGVvZA0KPj4+ICMgV2luZCBSaXZlciBMaW51eA0KPj4+DQo+Pg0KPj4gVW5kZXJz
dG9vZCwgSSB3aWxsIGJlIHNlbmRpbmcgVjIgd2l0aCBjaGFuZ2Vsb2cgY29udGVudA0KPiANCj4g
SSBkaWQgYWxyZWFkeSB0cnkgdGhpcy4gVGhlIHB0ZXN0cyBuZWVkIGZpeGluZywgc2VlOg0KPiAN
Cj4gaHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9vcGVuZW1iZWRkZWQtY29yZS9jb21taXQv
P2g9bWFzdGVyLW5leHQmaWQ9MmU4NTczMDM1YTk1ZjM4NmI2MjNmNjRkN2U2YWEwNjlmYmI5NTRm
NQ0KPiANCj4gaG93ZXZlciBJIGJlbGlldmUgdGhhdCBldmVuIHdpdGggdGhhdCBmaXhlZCwgdGhl
cmUgYXJlIHB0ZXN0cyBpbiBvdGhlcg0KPiBwYWNrYWdlcyB0aGF0IHVzZSBsZXNzIHdoaWNoIGJy
ZWFrLCBwZXJoYXBzIGluIHpzdGQ/DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNClRo
YW5rcywgUmljaGFyZC4gSSdsbCBsb29rIGludG8gaXQuIElzIHRoZXJlIGEgdGlja2V0IGZvciB0
aGlzPw0KDQotLSANCiMgU3VtYW50aCBHYXZpbmkNCiMgV2luZCBSaXZlciBMaW51eA0K

