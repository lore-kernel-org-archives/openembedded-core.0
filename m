Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA67AC61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 17:09:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.495.1788023340139370171
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2026 10:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rkP3y2fy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3701197a58=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TH8sAQ3558020
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 10:08:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=Bc58+aWlTV4jmpsGBCDEcn+ULsmzR0CKih9P7Fwz3Uw=; b=
	rkP3y2fy9ZkQ4DgHQ/Y133ArhSw8asAY6yiEicmaCrVXh8+t9JFCiDur1H/weQnJ
	3F60siUksHq2D7CN9I8cYwBFOPJFznc+ghzRPnYC76dO394b+iZ2qgXNgbPvUucU
	OauYgUD1CeXrfx3d9sRm/rmuHcezuwUyvXhgnTJ9Oh1QZNp052/r5nK5Nqo7Kcua
	LflUgOHfw1mc2lHY5jLR6jclpXonUwOlem1DpqwjPaXiSPkG8Gwp0/3Ilz8QdIlT
	r41mX+pKqLssRmsrd7/g1HebD5PrhcYi4bhWq09LvTlgSrRfX7Idftui/l6eWGdh
	gsKx2/TkNExQT+Akf80OhA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022090.outbound.protection.outlook.com [40.107.200.90])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe88ab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 10:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5Es5yboqJdmfF8oLoiJzs6oFAxsc/KiQvuDAQY57AQegRgduU+lxd22E5BbxURx7hY1LkQiv0qnhIulrnORWjRvADX3Ha7cPPwII4bFBQWvPUbO2HALFuL3KE/WwMNwfYqP3D0Mn9fVMJDB+6LBFaC2H/KyQ+JguHb53/9P0qJxj2rHeY94sm/Jh491aMztcKa//WE/BFmYswmByv82VaGF7uYaPMctG4MinACJiclSuBTRv4OGJ0Fn04gj6D/DYq7tZG73tOPMEAq8SKFn7z0lkBiOtjwJNj3oGy8Ctt+oFTHYH21lOhjWyYL+3W6aKl/DiFXJmahKgMOsBn0dSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc58+aWlTV4jmpsGBCDEcn+ULsmzR0CKih9P7Fwz3Uw=;
 b=vJ4DkvDoBdghTwxSIKQBbGVtill6Q0a7ggR0Tw2CpRo0Z3Dca9tc5hz+f+Z7kwcaozlANCAaX4PQDdczajbTQdnUlFN1UORrnF+rvRrp9UeICSmaiAiS2t0vPcyalMSeZxnhmxeA7SCiqKAojmAjDyg4UtS9uyH3MJVUdREW84i0wU1pSSIkMPLUVZ7X67OirlPBz93MqgdFVphJykONc359XiftLEQdp0ZH9br3nbyvmqWy+UuBW8GB0hX2X0Ra6WP0u5Tj45UUb6C8rOYMmx4ByA0BkuxPJQIFkFY4faMibzdmLdZOkcPF4qTm6UratWQQpPcjiCNu91M+DK+7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA1PR11MB9496.namprd11.prod.outlook.com (2603:10b6:208:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 17:08:55 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 17:08:55 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v18 00/16] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [PATCH v18 00/16] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdNaRJZhACRLbx+k++/4zBGJrJILaxza8AgAN5LAA=
Date: Sat, 29 Aug 2026 17:08:55 +0000
Message-ID: <465aa637-7d82-45a6-bd10-591158414f8e@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
 <DKZPOS2ZANNR.2AZTW1QIJ8MJB@bootlin.com>
In-Reply-To: <DKZPOS2ZANNR.2AZTW1QIJ8MJB@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|IA1PR11MB9496:EE_
x-ms-office365-filtering-correlation-id: 579f7c53-226e-4452-7479-08df05f0354b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 /HPhbLXXXCk6QKPnodByilIE1Z75asscnLSG7a0gRZtTTGjZjP7O7lRFf3s7t8GxP5OPL2peP8mqvZ/z5Gl0/ciPuuI4A3Sj5P4E5ZRWxJsSNqipm8dX+PSYnoXdGe9nvFsa8V7DgjPWpe/WqehlFk/6X+CrrauLVSer0MpkK5Joth0z9c9ooVTT6/SQAt3fCIjvCViduizEOhz2UaH7VsutM/LYLB77YlT06Quxw4yR6x9fZWFtUbjclmQp2zMJ5C6l4iC0OI66k51GPuwyp/XQdwD7w1v1959kQxDG4ElSVUb494J6fDwcLPzEgXGXNQ9ZKFSDSCJhAr3nr53tsZ+JZnI3HbFbjUPN/ioi8cQTAqoBURsFhQoRpsODUM7pz4cMYNmFi3qGV7cwkJCfVymFh3vHiTysc9dl8Gn7gBoWj6wEm1pBLRGnVdsw7t2sU6lsgMZn26/VZGuJ7X67zemHstSgS6bZotmu7E3yO8PW0BcvjIO4V7D6hs4jIFKaeVwXNr/S741jY8SaFxsG3nH+/ASSNqFaGFxJtFMFMrTQAZWViyDKO+oPUTetR9iszNuKbhvmde5EVyhgCZPEcggXf78C/ljjE1Nb+kmc+rs+qEKs6TbmFYeU9fZdLb1U/V2PS5VtipOBPwScsN9qvj3tPjMa6hGn1Ae6/ygw1zo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGNCVnhEbkFwcDE0aG5obXprM3ZDOXVPU0V6VHc4KzBoeldIbWRHalUvNWNP?=
 =?utf-8?B?ZXI2K2NsUXl0L29IT25abXJGNkZPUTNIOTlCR2NsYkRRMGxWOGRIT0x1bWNJ?=
 =?utf-8?B?Y2NCZlo0WHQxemxVQTljcjlLYTROc1VpUkZPQ0MzM2t4VTB1dE8zYVFPeTFn?=
 =?utf-8?B?U1p6dnF0Y1pud2J0cGJxcHN4ZkhOT0tHSDZjWmFUSGxkUGhOZ2Z1bWFqK2RB?=
 =?utf-8?B?VHlBTWp6RUl6c2RNZG1sbWVOWXNOcExnWnYxdG9JeXc4YUQ5VW14c0tNM0RJ?=
 =?utf-8?B?ZFhhV0ZmYXZsOVNxM0JXRHVoemd1WHZ5TzBiM01GOFlSMy9UREErbm9TZURJ?=
 =?utf-8?B?S3lDa0hFc041OVlHZyt6Q1Nwc0g3Y29SUzVINEJ2aUNpeXBpeDZ3dkcxcGtV?=
 =?utf-8?B?NjNUWTFFbXdCTjJBbllXU3paNGRlQ1dOWGV4U01WL0QrMEpvTUU3bWF4TGJ6?=
 =?utf-8?B?K0NuRU9EU3o4dlRXQ252aHg5UlJWcm42bkpYbWpzZ0w1SXk3RkIvN2xFVkFS?=
 =?utf-8?B?QW1HaGZnb1FMWTZaSllPcElXdFpuWTd0Zm1tWXpvUnh3MzVCUkh6dEtKTyta?=
 =?utf-8?B?UVptc0pjL2kvcW1pd0ppVGU0QzdMNFdaOUwxV0R1eGxIMWJObVJpTnd3Vzdj?=
 =?utf-8?B?L3M3YUZVMTRncjNrZlpyZFh1dG55WnVhT3pIQmFaM3hZL1BpTDhYV2tzdG9Z?=
 =?utf-8?B?V2M1WjgwT0RXL0d4MmRLQTV0WW1jY1ljWUluSE1DczhRNFo1RXV1UzM2a01D?=
 =?utf-8?B?RzBCQ2MvVlVaYnRQZVBEQkg0ZzBoR0puc1JERUZrbmVRYWxLVTJjOGZmT1M1?=
 =?utf-8?B?ZVZwTEJUUkd4Mkt5SnZUck9yZmZyRG1NVVpILzgvak1lNUxNUDlmQjJQeVRY?=
 =?utf-8?B?Z08yMHNVcU15YnRWYitDRGNVSnZwZm5adWlRRWo5cWJjL3dlK0pxZGZERVVu?=
 =?utf-8?B?eHFYalVrUXl5YjNIK0Q5TitJOW0rOW5XUkdUN29RUFB6RkluTFlUUjNRLy9y?=
 =?utf-8?B?VzJTZFQyWk5iSXBBUEVNUEYwVU5BY3l3dlU0Nm9vN3c2ZUNNeEtPeFNoS2pn?=
 =?utf-8?B?Y2xZV0NGSlRyTzE3OG9jWjluY1o5KzcyaGpqSzVUcHhIa3Bza282VGx4YWxx?=
 =?utf-8?B?am9reG5VeUlxS1lyMk9nTjBuN0doK3kvajR3amliUHduTEpQTXFtYWhRL2JL?=
 =?utf-8?B?a3R2alFaeHRwTjhobUZVa0s3MnlMQW04MGF2enZaVjA0cDNIWnZVdDNDakxx?=
 =?utf-8?B?ZG5LQmNNSWxwVWN3YnZCZS9URnZHbUhtdllCZ1o4c2p1ajhyd3ljRlVVUk5C?=
 =?utf-8?B?YkF0NkJsM3dwTmNWbzNyMEVRQkVGV3NVUE5TRG9hOGQyQWNpSGNzOE9ERUNY?=
 =?utf-8?B?cERoaUhrKy94Q2lybElibXpsVFBlVW1GMTV2eldXRFF5S2FEVGlxSTVKVFJ1?=
 =?utf-8?B?NUlvSVozdTZvNmRSYlR5VzdXbzJJKzBTdFdsRzB6bmpPeFJnT21MeWpCUUVL?=
 =?utf-8?B?bGl2Z1pFVnVWaUZYWURWelhaRG1XcGFETnJHUGl5WFRHbU0xaGtRZ2JjN0VN?=
 =?utf-8?B?MU05MlYvRHN4YmphMHhrY1E5ZXRES3VXWGRXWk93bHlKK3U0QXNPamMwSTAr?=
 =?utf-8?B?N284Smdoai9lOEorNW9Ka0RxUHJoQVBuNHgvTW8veW9qZjZ2NTcra0xLWFNQ?=
 =?utf-8?B?dnl3T1RjWW9oWXZtUzF2VXNRSU9BTEVVZCtVK2NHQ2tVdmRuSjhtZUNLcEZ3?=
 =?utf-8?B?VU5FN05HS0o4V1NNSnRaeDBzdEJTNVBmbmJnWHV5UDl4azVQbTNHTzRubEJ4?=
 =?utf-8?B?eGVyNHZlbEZ2TEdjOTRPTUJOemtUNjMwOUlFNlQ2SFdSdE11ZnJ2YTRubEEr?=
 =?utf-8?B?ZC96cDhDK0V1d3dHZzBDbnZTZTdBNDBqdkcreUxrMlBqRHZWUFhycDViN09S?=
 =?utf-8?B?Y3N5blNIL2pBWlpPSUdVOHJ2bU5MVGk2SzM2K0FEUHphbk0zRHZONjhIR0d5?=
 =?utf-8?B?K1NCSm1ZZWdFWm1ndURoczFyeks4MTFHUkF2RTZndGV5VW9rNUZhaDdXWm9X?=
 =?utf-8?B?Q0tBWEdRdHFQd2dSZ05Ja2VXNUdrRFkxdGthMGtpTDJaZndUQ0ErWDJrNDZu?=
 =?utf-8?B?clRlZzY1amNJeDF4NFpWQ1FPNDZUOHppTm1JL0c3N2s3aHpYK0l3VTVEbEg1?=
 =?utf-8?B?WGY1SEtXazBxbUF1MXhMQTB4MndsRDQwUDBUSy9jcE90VEp0aHB2bzRXalI3?=
 =?utf-8?B?c25mZ0tGWXJ0RmU0QjhqbXMwekR6WDVJZWlEZGp5ZFhlUE85amNFcXNXNWky?=
 =?utf-8?B?ai9EZUZERlJpZGVnOGN3VHBCVGxoTE9ndkpqTUthUXZSTG03SFhCWWkvWjhi?=
 =?utf-8?Q?9G3TjIwKjaVmTHlU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D93B753BBA92974E89FB59B971BB7460@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	kYQ8mbwBSPEnRFd0CO73q8cRXB2n+TcmvPedHol9DdX0LgeAK6GBCBjJZaV3eMLrSTppVtTyE8EcfZ0OmXE9g/g+suZFWgugrcNlmrjTuwePNbS8iMUZIdVu/c8B1LhrmKAUra6fF3r5gkNEd58amFcTZsn6Ezs4aPa0D7Je8nuQa/SGstAXdolyB3Mlu2E/bs9ZspN+0Jd2X2f2yO9+nrzMrN0Sid6E8nIgR2NtyePI7rkJjYkzjoNlSc93koLBMwW/ESDxsXdCC8FZKSkdORzACb3gj4RE52eIRM8gV7RZbx3b3/xaYseQJbbMkHYr4mMW+R+mmd9Ax6rLb5wa5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579f7c53-226e-4452-7479-08df05f0354b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 17:08:55.3481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RgOd6fHluxg5QMjoHS8aBE0tXm9IXPX2mN9bXqQRfH4x3bCl4H9gw4TQZuu39TSl/QmsgsXyDmAPGEfjUzRIZ5SxgfOKHHmxkhQ1EUjZNF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9496
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0OCBTYWx0ZWRfX0g9yBwUKnYq7
 NJWjBU5Anqjkz8zoDj4jHYXOGckQfICzWmlGhwann+5TOZ0BhGydz6jtwFFLkKfzl813+Tt19yN
 vcUmP+m1dy+ehPgeuSeog9bhhhdb0zucE0afodXB2DQX2JE9nHajdXisRv16daYAltzerQzfJpE
 V2ksQz5kEGziX7TKo9RHNQkxvZUwqhpln3sEpOxWnC2hGTEwKSA3lbYw7SGKSCRPPfK9TgMuR/k
 6DMYcIJf4zNQQymV+EJEWcdRIffnI9I7odVJqGKl4HhC43DYrPzpGABVt7+HAycjhH4Eqlq14g6
 E6RkqF8F/oPmY9/booLrQuHe5uxFTKyYsmYmJUJjq6SVuCzn3HL7xd9JS/LF/kB/vA0HHg7DaBv
 prRhLEzhvl3OBiUrQtjZX7eyWN5Vx9J5iqilTePdFzojYSrOwinPCaKzAsu9uVOVffqQByHzp/Y
 OfjaoayigMd6MbryLUA==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a93122b cx=c_pps
 a=EQiSdmqO/0h9UsHobtR7BQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=zb9AuIBqXSQhIXUs9gYA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0OCBTYWx0ZWRfX9y5njTsvLqqI
 4raHAHY+yFo3dWMw6y3L2IPjZcpC9kAWCh3ybgwogyYnDosYsnzreBwX0VC73qdfsayLNXaSpe8
 u95Rjf+XmpEUHz/R8mFna872RTRzERbIQZaOlNE1sATUjtzRwrBg
X-Proofpoint-ORIG-GUID: 3G-NFPYbO2nSmP31XmhsDSoYUbcPEhqm
X-Proofpoint-GUID: kfBxfVE2yNTgmZ-hJtaECHCw_pAn1_LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 17:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244635

T24gOC8yNy8yMDI2IDc6MDYgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gV2VkIEF1ZyAyNiwgMjAyNiBhdCAxMTo0NSBQTSBDRVNULCBTdW1hbnRoIEdhdmluaSB3cm90
ZToNCj4+ICogVjE4Og0KPj4gICAgICAtIHBhdGNoIDAxLTA5OiB1bmNoYW5nZWQgZnJvbSB2MTcu
DQo+PiAgICAgIC0gcGF0Y2ggMTA6IHNwbGl0IGludG8gdHdvIHBhdGNoZXMgYmFzZWQgb24gcmlj
aGFyZCBjb21tZW50cy4NCj4+ICAgICAgLSBwYXRjaCAxMS0xNDogbm8gY29kZSBjaGFuZ2VzOyBw
YXRjaCBudW1iZXJpbmcgdXBkYXRlZCB0byAxMi0xNS4NCj4+ICAgICAgLSBBZGRlZCAicGFja2Fn
ZV9ycG0uYmJjbGFzczogZmlsdGVyIHBrZ2NvbmZpZygpIGRlcHMgcmVnYXJkbGVzcyBvZg0KPj4g
ICAgICAgIGdlbmVyYXRvciBzdGF0ZSIgKDAwMTYgcGF0Y2gpLiBGaXhlcyB0aGUgcmVwcm9kdWNp
YmlsaXR5IGZhaWx1cmUNCj4+ICAgICAgICBNYXRoaWV1IHJlcG9ydGVkIG9uIHYxNyAocGtnY29u
ZmlnKCkgUHJvdmlkZXMvUmVxdWlyZXMgZGlmZmVyaW5nDQo+PiAgICAgICAgYmV0d2VlbiByZXBy
b2R1Y2libGVBL3JlcHJvZHVjaWJsZUItZXh0ZW5kZWQgb24gaGljb2xvci1pY29uLXRoZW1lLWRl
dg0KPj4gICAgICAgIGFuZCBvdGhlcnMpLiBfX3BrZ2NvbmZpZ19wcm92aWRlcy9fX3BrZ2NvbmZp
Z19yZXF1aXJlcyAle25pbH0NCj4+ICAgICAgICBkb24ndCByZWxpYWJseSBzdXBwcmVzcyBSUE0g
NidzIGdlbmVyYXRvcjsgYWRkcw0KPj4gICAgICAgICBfX3JlcXVpcmVzX2V4Y2x1ZGUvX19wcm92
aWRlc19leGNsdWRlIGFzIGFuIHVuY29uZGl0aW9uYWwgZmlsdGVyLg0KPj4NCj4gDQo+IEhpIFN1
bWFudGgsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBuZXcgdmVyc2lvbi4NCj4gDQo+IFdlIHN0aWxs
IGhhdmUgYSByZXByb2R1Y2liaWxpdHkgaXNzdWUsIEkgYmVsaWV2ZSBpdCdzIHRoZSBzYW1lIGFz
IGZvcg0KPiB0aGUgcHJldmlvdXMgdmVyc2lvbjoNCj4gDQo+IDIwMjYtMDgtMjcgMDk6Mzc6NTgs
MDYxIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOg0KPiAgICBGaWxlICIvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcmVwcm9kdWNpYmxl
L2J1aWxkL2xheWVycy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nh
c2VzL3JlcHJvZHVjaWJsZS5weSIsIGxpbmUgNDA3LCBpbiB0ZXN0X3JlcHJvZHVjaWJsZV9idWls
ZHMNCj4gICAgICBzZWxmLmZhaWwoJ1xuJy5qb2luKGZhaWxzKSkNCj4gICAgICB+fn5+fn5+fn5e
Xl5eXl5eXl5eXl5eXl5eXl4NCj4gQXNzZXJ0aW9uRXJyb3I6IFRoZSBmb2xsb3dpbmcgcnBtIHBh
Y2thZ2VzIGFyZSBkaWZmZXJlbnQgYW5kIG5vdCBpbiBleGNsdXNpb24gbGlzdDoNCj4gL3Nydi9w
b2t5YnVpbGQveW9jdG8td29ya2VyL3JlcHJvZHVjaWJsZS9idWlsZC9idWlsZC1zdC9yZXByb2R1
Y2libGVCLWV4dGVuZGVkL3RtcC9kZXBsb3kvcnBtLy4vbm9hcmNoL2hpY29sb3ItaWNvbi10aGVt
ZS1kZXYtMC4xOC1yMC5ub2FyY2gucnBtDQo+IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9y
ZXByb2R1Y2libGUvYnVpbGQvYnVpbGQtc3QvcmVwcm9kdWNpYmxlQi1leHRlbmRlZC90bXAvZGVw
bG95L3JwbS8uL25vYXJjaC9pc28tY29kZXMtZGV2LTQuMjAuMS1yMC5ub2FyY2gucnBtDQo+IC9z
cnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9yZXByb2R1Y2libGUvYnVpbGQvYnVpbGQtc3QvcmVw
cm9kdWNpYmxlQi1leHRlbmRlZC90bXAvZGVwbG95L3JwbS8uL25vYXJjaC93YXlsYW5kLXByb3Rv
Y29scy1kZXYtMS40OS1yMC5ub2FyY2gucnBtDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNy9idWlsZHMvNDgyOA0KPiBodHRw
czovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZXByby1mYWlsL29lLXJlcHJvZHVjaWJsZS0yMDI2
MDgyNy1xb2w0YWU3YS9wYWNrYWdlcy9kaWZmLWh0bWwvDQo+IA0KPiBUaGFua3MsDQo+IE1hdGhp
ZXUNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCj4g
DQoNCkhpIFJpY2hhcmQgYW5kIE1hdGhpZXUsDQoNClVwZGF0ZSBvbiB0aGUgcGtnY29uZmlnIGlz
c3VlLg0KDQpJIGRyb3BwZWQgdGhlIGZpdmUgd29ya2Fyb3VuZCBwYXRjaGVzIChEVU1NWVBST1ZJ
REVTLCBjcm9zcy1idWlsZCANClByb3ZpZGVzIGZpeCwgcGtnY29uZiBSUFJPVklERVMsIHNzdGF0
ZS1jb21wYXQgc3VwcHJlc3MsIA0KX19yZXF1aXJlc19leGNsdWRlKSBhbmQgcmVwbGFjZWQgdGhl
bSB3aXRoIG9uZTogZGlzYWJsZSBSUE0gNidzIA0KcGtnY29uZmlnIGZpbGVhdHRyIGdlbmVyYXRv
ciBieSByZW1vdmluZyBwa2djb25maWcuYXR0ciBhbmQgDQpwa2djb25maWdkZXBzLnNoIGZyb20g
cnBtJ3MgaW5zdGFsbCBsaXN0cyB2aWEgYSBzb3VyY2UgcGF0Y2guIFRoZSANCl9fcGtnY29uZmln
XyogbWFjcm8gb3ZlcnJpZGVzIGFyZW4ndCByZWxpYWJseSBob25vdXJlZCwgc28gcmVtb3Zpbmcg
dGhlIA0KZ2VuZXJhdG9yIGlzIHRoZSBvbmx5IHRoaW5nIHRoYXQgd29ya3MuDQoNClN0YXR1czoN
CkxvY2FsIChvZS1zZWxmdGVzdCAtciByZXByb2R1Y2libGUpOiBwYXNzZXMgZXZlcnkgdGltZS4g
Tm8gcGtnY29uZmlnKCkgLyANCi91c3IvYmluL3BrZy1jb25maWcgZGVwcyBpbiB0aGUgLWRldiBw
YWNrYWdlczsgcG9wdWxhdGVfc2RrIHdvcmtzIA0Kd2l0aG91dCB0aGUgZHVtbXkgcGF0Y2guDQoN
CkF1dG9idWlsZGVyOiBzdGlsbCBmYWlscyB+MSBpbiAzIHJ1bnMsIGFsd2F5cyB0aGUgc2FtZSBw
YWNrYWdlcyANCihoaWNvbG9yLWljb24tdGhlbWUtZGV2LCBpc28tY29kZXMtZGV2LCB3YXlsYW5k
LXByb3RvY29scy1kZXYpLiBUaGUgDQpmcm9tLXNjcmF0Y2ggYnVpbGQgKHJlcHJvZHVjaWJsZUIp
IGlzIGNsZWFuOyB0aGUgc3N0YXRlIGJ1aWxkIA0KKHJlcHJvZHVjaWJsZUEpIHN0aWxsIGhhcyB0
aGUgcGtnY29uZmlnIGRlcHMuDQoNCmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9y
Zy92YWxreXJpZS8jL2J1aWxkZXJzLzM3L2J1aWxkcy80ODM0DQpodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNy9idWlsZHMvNDgzNw0KDQpU
aGUgc3N0YXRlIGJ1aWxkIGxvb2tzIGxpa2UgaXQncyBwdWxsaW5nIGEgcHJlLWZpeCBycG0vcnBt
LW5hdGl2ZSBmcm9tIA0KdGhlIHNoYXJlZCBzc3RhdGUuIFdpbGwgdGhpcyBjbGVhciBvbmNlIHRo
ZSBhdXRvYnVpbGRlciBoYXMgcmVidWlsdCANCmV2ZXJ5dGhpbmcgZm9yIHRoaXMgYnJhbmNoIHdp
dGggdGhlIG5ldyBycG0sIG9yIGlzIHNvbWV0aGluZyBpbiBteSANCmNoYW5nZSBsZXR0aW5nIHRo
ZSBzdGFsZSBwYWNrYWdlIGdldCByZXVzZWQ/IElmIGl0J3MgdGhlIGxhdHRlciwgYW55IA0KcG9p
bnRlcnMgb24gd2hlcmUgdG8gbG9vayB3b3VsZCBoZWxwLg0KDQpVcGRhdGVkIHNlcmllcyBvbiBz
a29ra29uZGEvcnBtMDIuDQoNCmh0dHBzOi8vZ2l0Lm9wZW5lbWJlZGRlZC5vcmcvb3BlbmVtYmVk
ZGVkLWNvcmUtY29udHJpYi9sb2cvP2g9c2tva2tvbmRhL3JwbTAyDQoNCi0tIA0KIyBTdW1hbnRo
IEdhdmluaQ0KIyBXaW5kIFJpdmVyIExpbnV4DQo=

