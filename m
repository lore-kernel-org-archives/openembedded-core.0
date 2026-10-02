Return-Path: <Josiah.Metz@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E56CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:32:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13629.1790951528536422791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XkLTGI7w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4735868e27=josiah.metz@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692DBXoV1084124;
	Fri, 2 Oct 2026 14:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=+YAl75/6sC8huRRG6hJitXVJn536DCtwRLb2nAKoDlk=; b=
	XkLTGI7wDagdu6Dhp83gZXkLv9EIavPJ5BajJtsYBuN+mG4VjdlhHLd21OilfPT0
	F42ULm4i4NxfzTDH7UmnSzT+ALVWFKKVuUnrfbKYpJ/NmNsjoSZoj2qVx601eNGu
	QnLEjxAcqKyfscf9MEpqKJ7tOikwJVrNdjue+wi37NlNBzFfxnuocBdvmuD1PEV4
	KlCU9e1ufJB99h0Y9lFnRc+x7izYTJHQhOUAmGYnm3xRf7Y0tvRgg5dthihhflcZ
	7p67/0x1fBQfWjDegJ+FK1vROvetHjnS5t9MW39zsOQYk9z3IfXT/OygWSmvojHL
	iJuRkxSCL6IHAl+IFSwP3g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020133.outbound.protection.outlook.com [52.101.85.133])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1vx61crm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 14:32:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DT2u5T6zTzfj/dqiYHVyFx9pcehGBmNYWmxOOA5Z4Wa6zUaGQJL5XYyhUX7DunOVqJ75qm3haMX9GTwc80U7XY7OhQVqmNvhn99CoCJEkBTjjAh0IfkdRXPknfmFLgNTxfz1LiKCAJbsPjXz6bnvEX+oiCLstJ9GkpwqdfovnZwo4eLtrWGXCRGf0fknD1N2QmIgPLHDcXjKOhFaw2uJiMEWlY6KH4VasmQNcMLLxPYp9qOljS38Ir+r4Dd6iZUb62nsO4M3weMQDHt486HOhSHQH3akpNTu4tv7P48O4Kph0cug3WWFJG0Rl7rLRr1QUXMuudkI73WY5RrNI6ToyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YAl75/6sC8huRRG6hJitXVJn536DCtwRLb2nAKoDlk=;
 b=QbpoRzjAmUz14SHtODzKr+5JX7/H56c3YOi94BsZZH1HrwURA1ZLxkGRqEoPNKp6ZH5fW4J5alJRU+z6BhuQh+PqiKW29LfExf4kF8GpdiVRKiNIPpgIPuEJESl0439ZDWiWf9ZRwzwMO4DuI8OEO9cif6Ysek0FRsyJc/QbuPxzQC2feILD3lSAgl+Up8Htr773djheQJgPRcdTV/RngVFrgBrjIzltu++uNBxrJ1+YTyG6PWIw+gs/xULcYMZFjamIeGro+f1Merm0AzyuCB8Gvsv0dVNz/885c24YypL6o0uUK4ztBRxchySDsq5vDZMBhTlK/oNrys4+BYMWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7771.namprd11.prod.outlook.com (2603:10b6:610:125::6)
 by LVTPR11MB9888.namprd11.prod.outlook.com (2603:10b6:408:3c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 14:32:00 +0000
Received: from CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e]) by CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e%3]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 14:32:00 +0000
From: "Metz, Josiah" <Josiah.Metz@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pbarker.dev@lists.openembedded.org" <pbarker.dev@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] maintainers.inc: Update maintainer for bash and
 libxml2
Thread-Topic: [OE-core] [PATCH] maintainers.inc: Update maintainer for bash
 and libxml2
Thread-Index: AQHdSt0vEue4KtFkbUGf3MKnizcTqrbqML+AgAAiFQCAAA0CgA==
Date: Fri, 2 Oct 2026 14:32:00 +0000
Message-ID: <1d83d1ba-adea-4001-94e7-a91c65732bb1@windriver.com>
References: <18D7C34ABB5D4136.1120428@lists.openembedded.org>
 <e9fe138e-ac11-4f1e-a637-4afa5f81b841@windriver.com>
 <DLUEC6Z600N1.2V4ABN2U2KRVS@bootlin.com>
In-Reply-To: <DLUEC6Z600N1.2V4ABN2U2KRVS@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7771:EE_|LVTPR11MB9888:EE_
x-ms-office365-filtering-correlation-id: 08061866-7083-4e23-3042-08df2091eb7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 lYHAbL+2gDSWxDPw3+oT0RYJ7MdXn9zVjKwluhhW+vq4h7t62Qa8h2uUa9wRw99ef+VGNq4r6wsBenmheX3hEiNljMyuTBqjILdgA+XlN8zNb3BbwVGU5SXTN5jeydXD1SaoZkKFWsJkLAe/EceOIc41MKH0xNCKeumlgpXXH48q7PfnblFyGXAp5gjv0i7i70eUodwo7hvyu8B95nwWyyMsGmF8Ta8n8DVqMP/E4SdrQMXashxcFFAWHhRWjS/9Kr9V6Iv563QrK7mAL45aIz9w7SG7jGe7FQqhvMFNjGVjLh0HLH+kyd+cXo/uwaCaphWTex8VOQLvAIgg+lA+fmcgSInn6SwBtUxZDSOWi9FF+5xtbPa7Jso3Xa3P+D3WehSUI3aBaydtju7pXE92DJddZTEepzlwbaYLTVqRdPPSRR6q46q0fj5mIYFvEEI+boVJn+9PjbBGiXRJRh1Rh8dpGTm6zDl9mHDfsCKJaZrz2py9ncpss0Qa8B/sJN1bDtBL86kM84noOtWoeWexejW+PSmmfai4sGaVQJTnpExnkJX1H9BhQHqD2nGLB3jXRoq92VN5505RSsIAkvKEyoUKFGBdsUGkpVhBBeNJCg5LAer+jTD36AECIWjQndY18Sp1Bk64T+IQjoBgj2f+hTNWQYsBjDwC0zBdZiCKV8M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MU51RGFuTmxmS0dKQlpPaVJndFk2Z2JBbUlQQ1BqNGl2eCtZcmZ1NEJ4eFQv?=
 =?utf-8?B?cHkwQk9GTGFtTFV1clowdkF1UFc0YkhhUTNXR2YwMitFeFQyMG83V2lpYzY5?=
 =?utf-8?B?eE1GMEdOeG1CVWtWWTA5K0c0R1U2Uml6NVBEZ1pzaFErZ0JjV2svUzlpby9k?=
 =?utf-8?B?S1V5NmFKbDVlL3BpWlBhSzBFVXZjL1p6dmpkbUUxVk9QcEJrTGFFczdXc0pR?=
 =?utf-8?B?VjlVZW9FVksvaTJkSVlWLzFRQ1lMeUQ4aEFlWlJqRWZ3S2pZbXR0K3RDYWRM?=
 =?utf-8?B?bnY0Yi9UVG1ZQ3JGUTFDbkVFYUdzS1RzZnkrRWF3Nk12UFI2U0RaNjhqNmIz?=
 =?utf-8?B?eUhCVk1jU1dNdVozRXdScmZTNVpISzhCSkVucXJsNFhpdGF3Y1RKQndDbDNQ?=
 =?utf-8?B?YU8rTFlEZWpCMU1pQVZKMUxxMnVwOU83RWw0Y0hzYUNySHpJRzBxSUcycEZ1?=
 =?utf-8?B?L2c0R2pkTkYxY1cwNEJQVVNFZ0FLbEJVbGZxVmZzU1FGL1MwYjVmMVpma05l?=
 =?utf-8?B?Y0htZ0dVaFZydng4R1NyblcwTGkxd0F1aVRwelM3Nk1yZFhyc2ZvbWhhY2F5?=
 =?utf-8?B?MytQYVFteVVweFF1ODRPTWEra3Mwa2lFbkx5UU96emlRN3pleC9YZFg2SHln?=
 =?utf-8?B?eldWMzNHYWVYWVVWbnlxdmtzc2tpKzJFVGhLRDNHOGlWalJWZTBkaktxVVU4?=
 =?utf-8?B?eEJHZG51R1ZvUlRwTjFldm1LWGJWQ1ZJNUt3MjVKMm4yTnFUOFlpcVU3WEh6?=
 =?utf-8?B?ejVvd1lETTJtdDQ2SWF3SXVodWhkREFJM2ZJVktLZTZPRTE5WDA4enByMlU4?=
 =?utf-8?B?TWZyUDcyWGN0SXpyZUxlamVQMnN5aFBmcnh6bnBITndjcFp5TmdMYm4yajc4?=
 =?utf-8?B?dHptUnJzSmNWbzVreFluMGxtb0Nsa0EzSTJvK29JZldPOTF1VHFLMVl5clkr?=
 =?utf-8?B?eGtlak5NVEd2K0JFUnhqcHhyRC9OZzFqNFhRN0NsY01ZNy9FVzUrSjAwbGFI?=
 =?utf-8?B?Tjl3U29RSTMrWGVOUkR2TjltN3RUcFdoeFRXSGdlYUJOV3NCV3V2eGJrT3hY?=
 =?utf-8?B?RGd0WXhrckJXb01GdVlkaG9lNSticUZXOUFwWVoxbUVpN1c0Y24zU1BaMWRx?=
 =?utf-8?B?TlhJU1BlSUJkdTZBNi9wMnhOa3BmU21jSFVWeDIvZTZSbVFtK0xHNVFUcFNO?=
 =?utf-8?B?TG9iR1d1SWF4eFNTeVVBN3VieGVFd2dqdHFqSFA2OW0rb1BnbFNCQXNad3Za?=
 =?utf-8?B?Szk5YWJEVlQ3cU4xU09lUi81RVpYeWNQV09XdzkxUE1zZEMydFNsY2ZHMUJ1?=
 =?utf-8?B?N0hFREFMV1VUUWU5NWhDQzdKMGhEMUJZV0Fjang2RWN1eEZxc2ZwaE5ER0gv?=
 =?utf-8?B?NllMdDlnUDdNVUdpUHJXMi8xb1puQ1VXV3Bjb3RVNm1KSEFIRXVDZ3hLUjI5?=
 =?utf-8?B?bzZFU3Rkd3Vwby91VjVkLzFjcDBua2w3dFE0azEwREhpc0xJYnVYQi92TzNT?=
 =?utf-8?B?NE00NWVhVk1uSTdjRHZUNVpBYTk5S3BvWURMRVZYYTJoTXc0RUNnYnE2Y2Yr?=
 =?utf-8?B?eVNJOHJhSW41TC9VYkUxb3hUZTBUTVR2ekJhd1N0SmNiaUpSRGF3K1lIclJR?=
 =?utf-8?B?Z0lNZWZmcnZuL3FzWDJkZWJMQ25oelpISWNnT2ZYVUJ6czIwTU1QZHZCY0Fw?=
 =?utf-8?B?aitETWhqRUJwVkFVU3BzYlgvVU5ZS3JRUGQ5YWtvOVNYMTM5YW9Kckl1ZWU2?=
 =?utf-8?B?dTY1UkZYMWRMMWdIMjdORWNiZFVaQ2N2SDdlYjV3NmtyR0F1WHlLMzV5YkVY?=
 =?utf-8?B?aXpaUlg5TnhSZ05VOWNKYm5halljOXFTNkZTTW5OUGt2K2VvNjFSTmhpNWt0?=
 =?utf-8?B?QzdxZFB5cVg0R0FNSEowWjkvUlZKOWVOb0UrMC9xNTR5aEdwaVVpdVdsYm90?=
 =?utf-8?B?djVOa2RodmgrUDI2dFI4VmgzdG5hWXJHclh3KzV6VjliZ051a0JxL053Slcy?=
 =?utf-8?B?ZzVKaXpWTEpiWEcxWFNoenk5UmNhd0tIWTQ2c2V6ZmJLcWh6UjRoeklNbkFu?=
 =?utf-8?B?SEk5SDYxVUxET0lrL0l0MmtyYzlJcGN6K29qTkFMN0Q2MnJpK0p3L200ak8r?=
 =?utf-8?B?MUg1N2RUOHovdmxwMUFjb0JtOWNLMUlIYkRXZitLSkFxMU9HWWJJNktHa0c4?=
 =?utf-8?B?azZ2VnZkdkZZUUdlTkxxNklLVndSZFQ1czgrUDF5cy9EOEJxZEtBeXhCUWJ1?=
 =?utf-8?B?VGpacG9XcXQ2MnUzVzhleWhBeXpPeHpoenF5ZjI0TUVUYnl2VitpMTcyM1dr?=
 =?utf-8?B?ZTJJS3RRcXloQlYrVS9ObmtqOHE5QU5VcDZvT1NNQ29zaFFtdGJGdjU5SkZD?=
 =?utf-8?Q?lg4wgnoPEL1l8WGU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBFEEA8E530A1B44B6D1D1880A46BD9D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	QK0Iqorqki306tC9Ve8/UQb/prG9gTPdWJTdPqeLOHb9MJX6Qcjpr/qJdb7VCfVN91zSmZ9/uvXqA7wMnS4GETO5w7py+GV8VcA4BxL/LzzsT7/a4Ou5+d6mBIEiPpWEZh9/IfYTkIY8HdkJba2fDWnmpBm7BscKi9BfoUL7qm6lx2YvrOs+e5T2yhmSQlBIWQkx9uAvz4AX+8L3O8K9w+t8MhtSJwz3Mv5DQo64kI9tr4ybN8pDlC6rH9XZplXsgpqnjMrrmIPy/ucsB4M+LTk6KUaB85lUC5DuQKArAI8BzNPCjDaoD8ARterzyec7nODU5Ub8M4BYVj6pJO4j0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08061866-7083-4e23-3042-08df2091eb7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 14:32:00.2656
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1CJZIX2vMWK25HItpTWChcBFcbu3HXJ8HGwapNRSJJVvIGaG8RNIF6SeEIUQ0VhfH/ekoW9p0zOttaKFVL6Pee3UCftPddFIRnML4R6haZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9888
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FoOQbGrq c=1 sm=1 tr=0 ts=6abfc067 cx=c_pps
 a=HNo1bxtHJBcBpsuwJpMK3g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8 a=P-IC7800AAAA:8
 a=nt3-h9zAZYCFtu873CsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX1CdxtGkao8hS
 m8Ioj41KZY/mJB9uezj5N7pmDTDvn4M51rIUkrW4gCVQeLqMbiNgxQC9gfegxf4v0hWYGVGrDJB
 9fjOkh7MExdCfRtAD0cVuiwZYEcBb0PFkVQC618Im3lQR8t87baiPj6Mtuhe/TCSm6TXHd7VZiV
 o1QHF0TQn3YxCgplBPH6Epch5iZfUkdkhTJ2gAhRBswTmtO41Y+s/buL30zUEs5KCmq+642pXdK
 mkQvuHlEnANTSLCszJ1l9Imqy35NXHTLObo2icsMm7V0PpKvUi9gy21ZN0lZlvwxSoatNg4N1++
 cwifqezmj5bvKSoAmBQyCG9wKxJ25IzXxbb3o8QvqJFdRE4SuKnn4VVanQcNeX/B6byPn4yq7RQ
 20q5MqBmi7PHbw2YUbpHrrhAp/XqYbA4qN3MAeuFw6cV5iGx08Ed+BQ8TFMvooqpBjuZGx7wL+d
 mqIiVpAsK4MIhah+3XA==
X-Proofpoint-GUID: RBTEjFxLZaKO6cagBd-xKAlYJqZOOVrT
X-Proofpoint-ORIG-GUID: BpxnMK5jgTaHlwmRN0CyqI8fGJ7ZhbpL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1NyBTYWx0ZWRfX7rBmLEd4sATG
 bFyqv1MpeEnzT4bin1p6FpuT+boguKqw+4D0evGHEN10j2iaYDmDeE0e6tXJvUbDQ60vwQ9QI4y
 sNZXgjMAHwiwxInZICzc4UC59l1+U1I1v2tfdlj/t8j3XSdMrNov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247123

T24gMTAvMi8yMDI2IDk6NDUgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPg0KPiBP
biBGcmkgT2N0IDIsIDIwMjYgYXQgMTo0MyBQTSBDRVNULCBKb3NpYWggdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgTWV0eiB3cm90ZToNCj4+ICtQYXVsDQo+Pg0KPj4gR2VudGxlIHBpbmcgb24g
dGhpcyBtYWludGFpbmVyIGNoYW5nZS4gTGV0IG1lIGtub3cgaWYgSSBzaG91bGQgcHJvdmlkZQ0K
Pj4gbW9yZSBpbmZvLg0KPj4NCj4+IFRoYW5rcywNCj4+IEpvc2lhaA0KPj4NCj4gSGkgSm9zaWFo
LA0KPg0KPiBJdCBsb29rcyBsaWtlIHRoaXMgd2FzIGFscmVhZHkgbWVyZ2VkOg0KPg0KPiBodHRw
czovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9MWUw
MWY4MTNhYzU3ODc3NzQ1OWExMGEzYzBjOWQyMmVjZjA5ZTliZA0KPg0KPiBUaGFua3MsDQo+IE1h
dGhpZXUNCj4NCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0K
DQpHb3QgaXQsIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRoZSByZXNwb25zZSBNYXRoaWV1Lg0K
DQpCZXN0LA0KSm9zaWFoDQoNCg==

