Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103D1D29C45
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 16:32:12 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39007.1768840323971786187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 08:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=uRF9+8VP;
 spf=pass (domain: siemens.com, ip: 52.101.72.28, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC7JXSFp0fA1w4G/qqj9iRQLUaMCZdPhHsev14sn5nkYK10hFa/1YR16qEoWHw75BUvwz0ZxFY0ooIWCU+tI4g0Ysi6ujmzt1Fzix0BkGdrPqWn//YlQoXLDjKAyxFNyzFjV3y0ZS9cTCMJjDmMC1PxZcofmfoBs0qRpjKcO9QeS3YOixk0XXyHZpJ+VHdPQSzp8ZFJ9kTO0KSafdabqp47POTD3o9IycEt0cx4pnJN2xb2HZoYwejpdgI7hD1ztkrjMVSGTJz2NATKa/8PNvwlTs42nnn+Gn1m4q4l57SpgpJvAKqJHURHPkvcSGuKpcXj7T4m5wB8n05kmfUX+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AJezeVRQcHaLP+H0hnPFqoeme/TckudgTneQzQ15hE=;
 b=F9PoRrpt7Z5HF5ITnK7pkt3v+by6oPaCYO/ryW4OKEzYnPu8mJ5BOJFHaGRB1ul0DSXeGTSFt/T3E+xdLvIDcpuPmRZuwgwJ7TlBMNRgAtVYvMS6Xsw7dBJZs9l9Omd9PgJ+g1oKYizCw0mFdPY82AdZaIJfMt0A9ony32KVltJQpS+PFvCY2xjlGh9w+WXdGAa7MK3smECtst2Zy9mqoE0U41t5ANOSVU5gYO88FwNSbAmrDKgc6tS1TLBGY9NqFl2HRkI3CZWE7aCBcfO6YDliFhvJkUO1SLS3uB6s1w6mg8OZP2Zdl4vBHVKX0hJGAnZ0kyb7XYgkljO2XSlJPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJezeVRQcHaLP+H0hnPFqoeme/TckudgTneQzQ15hE=;
 b=uRF9+8VPf9pqfBUVb6ICENoFNy1964NRp6+Qkk/kGhGInaBomCCz6LwXEXuC9F8GWovW8hQlrPOOK744lOjKATJBlS8IDIo/j2qxuga5MaLfL7dnVf8AJ9qj5MoqTm+ZaduuV2eaqeZcPJEfJN1nSxbSeV+9hHgQgattqyOzrHg/tPBTvKarc1lzuuIxZcpvxLAAyUr45bdrfQIEVpbl6fGql15jqXqs5T03rnGdptmTNaxPSd5ofnHFyhuOGXUEATZvRXuxIDbEVh8VaKIjTCczGFXeIlQ6O3ioTaWxcYhl8BdTi0PNsGsNsx3pQdDS6ZlEnzVTcASww/9NJX/aBQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7340.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:460::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:32:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 16:32:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] python3: patch CVE-2025-13836
Thread-Topic: [OE-core][scarthgap][PATCH] python3: patch CVE-2025-13836
Thread-Index: AQHce0jaBPUJsAAB9kaCrVMqFErzQ7VZycSAgAABrFA=
Date: Mon, 19 Jan 2026 16:31:59 +0000
Message-ID: 
 <AS1PR10MB5697897A5E20D9CC2A84001BFD88A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260101180250.4148772-1-peter.marko@siemens.com>
 <CAMSfU+4UWRF-LqGhU_r7A7cmqVhSNR=QpRs93cqrR+rtnF42=Q@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4UWRF-LqGhU_r7A7cmqVhSNR=QpRs93cqrR+rtnF42=Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=dc93d463-49cb-4ac4-864c-74a2b41dc7d2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-19T16:31:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7340:EE_
x-ms-office365-filtering-correlation-id: 77324de0-596c-452f-add5-08de57784520
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dW9xVmljS09jeEorTDBKU28xeWZHN2pGZ2NrQXIwSjB1d0xZSXJLQjlUdGhl?=
 =?utf-8?B?TG9YNWhEc1l1RjUxOHhSVzZkaU5JMUFWbDlMa28zZHl6M0c0SXRaQS9VdnF2?=
 =?utf-8?B?eVU1MzI5dDkvQ3ZZRzJCMkVtb3FOdllhT2ZJdDRRUjZkN3d3RFE0dVpPNE53?=
 =?utf-8?B?SXFwa3ZMQ25ZNkFsdzJGS2RIek5UYnp0RmtKWkJFYjBWYk5LTEFwUEwrRXov?=
 =?utf-8?B?Y0dkOXQvQk93TkNjaTBlMUdCRWpuNkQwMkVOTDJnK2hIRXdscUxtK3hnN2x0?=
 =?utf-8?B?KzZtUTNldHE5VksvdDNqR3YzY3RWUSs2WU9rOWdWYWh1U3lVVTZSMjV3M0t6?=
 =?utf-8?B?bUEyZy95bDh6Yko0MHNBakFwcGVOM0FmL3h6STBxbDk4SWJCYUFiSHJwTGtG?=
 =?utf-8?B?U1J4d0hrbHM0RFVpNEFIQWdzdEFNRCs3dXRhekNKcTZLaDhCL2R1dnBhK3pz?=
 =?utf-8?B?OUp2clFSbHptYXF5VjFwK05xSllKTkEyQXJZdkRReU9ucGJoOWNIcWRVWWda?=
 =?utf-8?B?dWNTWnRpYzNjcGhnNHZYVTFScDMwdkFtSjVUTmFtNjJFZk40LytpeUREdm1P?=
 =?utf-8?B?V3N1SWdqOUNvQjdrK2hkbThIYzY2ODQvSmI4RWxEdjIyeUxGRS9sYlJycGox?=
 =?utf-8?B?OEVBSFpEWExQNVQ0d0xYWlh1ZEVYdnJIdG5CWU1icHljNXZQeEVZNUhYYlFy?=
 =?utf-8?B?UGYrK1E2QkNQdVEvemZNbE5iME4wTTNjTFQwb1Foc3FLUzFtZTJEL3JiNFpJ?=
 =?utf-8?B?WERpUGs2NHVBUTIwYzRyR01RKzhLQU1GMFRQeWRVempJL05MNjg2TFU0bVhr?=
 =?utf-8?B?TWxZTVBUaSs3SllWbDkvb0gxcDNFWnRlMUJOVTJuZ2hjekgxdXIyMmNCVkky?=
 =?utf-8?B?V01oM1g2d0szM0h3QjFUNVkweC9qQ0N2cHE3bHhYYVVQMWZsc0FmbkI1RzBl?=
 =?utf-8?B?K3JEbXlpT0tOdUJMeVlhRWF1OXpCbGFwQ1JZQ0NpN09aWjEyeDFTM3dFcU5O?=
 =?utf-8?B?WG4wMm92eWswYzZkY2pjMGd0L1RtaDhrOTJJREo1aUhpNEdjTTVzTm03SFhO?=
 =?utf-8?B?aCtCeWpHVzhtS0xzelIyY0xLamxUakFxQUMwZUVqNS9tdE9ZUkpKMVZuVDdw?=
 =?utf-8?B?eTZsL1dGbnpESnhJM3U5N1BhT2dkQjNoWnRobEJKcEJHK1FQa2ZvS3VkM2FS?=
 =?utf-8?B?aVdpLzVlelVrMkVjVTluSG02MU16U0NxSXV3anN5SkROZVBTZTdidlEyMjcv?=
 =?utf-8?B?MUdZOWdMelBBVEdMT1h6QVYrdEJnN3NrRG1ZN1R4VkZjbVF3N2xqS1lNcGdN?=
 =?utf-8?B?OXVUWWhrN3pJWTZzZklGZlY4SUNMR0tkWXhpMlFUZWNlTk9nMXJ0MjRvVm55?=
 =?utf-8?B?bkNTRUU0ZEF2VmV1YXNpL2djZmdQZWh3S2FPWmJ4b1FCWTdXeEpTNVo2ZjF4?=
 =?utf-8?B?dXRKditDNks3N3dIcURLNDRRUGtOeU9qT2tmekZ2L3N6TkJIZzVSYURKUm1R?=
 =?utf-8?B?cnMxZlhFMWJFZnJJVlVCZkRJMDBpMVRsaDdlUDg4amkwd0lOY1lqdGVoU0RC?=
 =?utf-8?B?RWprYWo3WGFuRUFLVHVkVmcxY0RCRGJIb09PZUNpaC91YllpdXJoblhLY1BN?=
 =?utf-8?B?QjBPbDdqVkt5LzZ5SFJWQmg1MkRhMktqdGRyQnFBSDdER293elpMUDZUNUtT?=
 =?utf-8?B?emVtYWNYY2gzWGlTOWw2em9sTUNsenVCNEROZytSNEUvUTBtSkFHeDZ0NUZS?=
 =?utf-8?B?b20rWTAzZTlPTHJId0dOZ3M5cVdpdGF6dEpQdVdVNXZqaVpmd09tVm1mUnBR?=
 =?utf-8?B?NnJ0dVFqRXpsbHJESkNjK2tUQzlmeVRIb1g3d0JCbzNMTFRISTF6SkFsdXcz?=
 =?utf-8?B?Y0o0bUhzeHpNWCs1NXFNb3JMc2dBUE5tWVJPNlVsMEVrM29udkJLLzVkN3Y5?=
 =?utf-8?B?QjlIU256Ym5xMGRaSGN1aGh2TUdZcWtXZk1YT0hMOWJ0K0pjR0RxWU5xMVVE?=
 =?utf-8?B?dFZpM3ZJbUxsaGcyaXZvNGFEZXdmUTA3aVh1a3hrQTBKcGhCSnFabEtnUXpJ?=
 =?utf-8?B?VzhBTkpLbHhQTlY2bituQlplUlNWSk1hbDFYYUNSMG4wNHl2VWU3eDVKbEhN?=
 =?utf-8?B?UnB5M2s4ZFhwYkJQRndQd1M2eUk5TThuRzcxVnpKZTdCZWFkTzlzaFgweFVT?=
 =?utf-8?Q?hd3wzO4XieQ+PeVvzZqqHeQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L0VjNGR4SkhMUGhqSFRUMWRBdnFCSUlmSzY0OFJ1Uk1Ic0ZBSHFzTHo1YlJY?=
 =?utf-8?B?dkhsb1RUZzQ4Nk12Mi9QVlk2VkZiL2UwT1lWaFJUUVVHenNsMGZuTmIvTG5r?=
 =?utf-8?B?ZjNCcnlkbzNrZEphWlJiNksvR1J2L0pSM0IycmZCdnhQWTU2TlMvc2ZIa2hs?=
 =?utf-8?B?L3JuQVMzVGlNTkhiMWNuQlovVUtUc20vY3BCVnJ5blZhODlCVTFzZkdzM0FO?=
 =?utf-8?B?YTdrK3VNZ3B4UnA5QlhDUHMvcUp5VUFLL2VTb3U3UDV0WncwWEkyYlVSV3Fs?=
 =?utf-8?B?QlVvR09tZlh2RUNhZDhEQVJvdGZYblNWSmhzL2dwTTJkRzdFN09SRWFab09j?=
 =?utf-8?B?bHJpY3F0ZkpYRHpkSkllbU5rb2NqcTNrY2JKemRRemVDeHljeVY2VnMyN2h0?=
 =?utf-8?B?N1ZwYUlMMzVaK0lSTWJ0akVQcUNSc2NPdlYrSkhES2pmaExYeFRLeFZFNlM1?=
 =?utf-8?B?amE3bERvY0hnTWRjaDZRTEdUSUZWN295VDlmUktqRmR6YzA2MDBiKzZqbHdJ?=
 =?utf-8?B?UnFwMkdnQW1NYzNmU2cxQWs3dTlEVUR3WHlXZk5uN1VRbS9aRytRRDZ6TFpm?=
 =?utf-8?B?UHRDQTU5eTc1Vmd5U1FadGdxT0N0V3N5clBRWUp4WThUVkI2RHVkM2Q2aVVt?=
 =?utf-8?B?NTRuWnFGaXB3TGVkY3Q4T3FHdTNHTCtFTkZvSXdxQnFNLzArR1NtK0kvQUdk?=
 =?utf-8?B?WWR2U1BOczlFcDZXTk01UGVNSDFlY0k1VG9TQnNGS3VZbkZJN1NXc3pVcmlI?=
 =?utf-8?B?VEdPQ0Z5UFdjQ05uQ2dvMG44YklkMVFBanZPSFQ2ZzBCRlNIbkZZMGMxTXRH?=
 =?utf-8?B?eFlENDFtZVZWVmtUTjFlNzNrWVQ5NkRRZ1kyZk1ZSmpTeWg0RXNYTlRBZk9O?=
 =?utf-8?B?NjlLbXh0SmltZ0F2ZXRJL3VmaGkwajdvSWFVUFhrbFhjYjRGU3BUMm1KeGFy?=
 =?utf-8?B?RGR2TlE3Q2VEYVc3Y0paQnI2VndvZFhHUVQ4dUxvZTZsWERMaTNnMmlRNTlW?=
 =?utf-8?B?Vm5zLzdMWjVDai9GSUxpWjN5SnZJejdTRUh3dnQ3SllhT3pWL0pNVE9FV3lt?=
 =?utf-8?B?djdNTEl4RUhwMk5GVDJ6ZFo2R0E4WUdON2ZtOEJTbmlkSnJWTEljL1lSanJX?=
 =?utf-8?B?a08vSm8xT09HM3JOTnVyd0FwYW8wd0ZSMERjWlBmZjk2cVhKMHI1bThQRGtI?=
 =?utf-8?B?OEJTcmIxMUlaR1dxVlRkQVVFd2MrT09hQ0NVNmdFZzhDRzlqMUxqbFpzTzNE?=
 =?utf-8?B?TmoyZUNhcmFwMWNJUlljeW9TVEdZcUt2OGZPejdRKzlVS1p4VExGUVhHbDVX?=
 =?utf-8?B?b0wxNU9zTk8ydUhFRWlDQjdUL1U5N05JTGlYbVdKSmhLcG02c2t1M1J6bzht?=
 =?utf-8?B?YTBGdUpBWkZqblNjdjRMa1d0cURpbEhCUFlsQjJIZk8vQ0RiSGtDTVNRWWtx?=
 =?utf-8?B?M0xZM2FUV3kyUGdQeHdHNEZ2U0lHdlZXU3crMUN3eFZmSzBqOE9TajdVbFMr?=
 =?utf-8?B?RXVVQWxxK01jNno5R0xyWWt1c1I4Q0gwaldUdzRJUzJaN0NvRjZPR2pqSXB2?=
 =?utf-8?B?TGM1SlNjK1lsN0dXSmxKQXZJS0pwZTdLTjIrT3I0cTJTcDZObFMwY1JvaXFm?=
 =?utf-8?B?UlJNc2xUb2E2ZlRpUXN6VzdyVHBiVytQaEgyems0cU1OanYybHFZbkpIWXJw?=
 =?utf-8?B?b0FZODh4N2tzSk01U092YjllS1UrVGdqOFJQR0hzSDY2TzNXUHhtQ0FDV0xy?=
 =?utf-8?B?VmVvUVFkQmRqOERmNFplYVVybWNuNlYxd2h6ZWxFRjhlWGw2TE1lRUFRUE5L?=
 =?utf-8?B?UzBsUDQrZncxYkhQbjdTRUdqMXVIQ1B2T2lWN0cyTCsvZ3ltUUV5Rm5reW9K?=
 =?utf-8?B?N3RaT0hhbk1Qa1UxYktGRmRhMjBVS09YcXpncFk3bXVoUUZBQURGN1gzSHRK?=
 =?utf-8?B?cHlhQm1PWUIveWNMbmM5ZlVGR0ViQzg1TDRWYnVFakVUQ1kzZnMrb0QrRXcy?=
 =?utf-8?B?cmZXQURnVTB1K1AzNGZnV0Z1K1ZQUXQ5Ui9iRTloUkdFamNCekxvRXJwbFNt?=
 =?utf-8?B?aVhpZEVtbHkzcTZxRzgvcTZkMWdETU1JN0VPYk9OUzdnYXJ4ZTNINzkySFVP?=
 =?utf-8?B?WDE3NnNZOHdJakIwc2Y5Wkpjd0NZYkNLMC9uS2tTQk5YYzFGVk5HZkdGZjJa?=
 =?utf-8?B?dlRVZ3NnSXZyNkhOZ2hsd0cxZWxLWlhVR2grc2lpYjJiZ2JLYWtVZWRiUi9Y?=
 =?utf-8?B?dWdBS3NlbnpEWHBSYVdXeEZCT014MGNLQTJ1ZFJsZ3FjQWo0TnVsYUtFL3VO?=
 =?utf-8?B?ckpQaWFuc2RHTjVibFBFeVEyY3dMRGRhR1ZscTJ2ekVDeDA5QVU5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 77324de0-596c-452f-add5-08de57784520
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 16:32:00.0474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xt9XqIx/fCKM6bHxdWXwO9Cex2MyTh1VmcTR5BUbAZD8VNip3MSvGvkF+TdUZz4HUtfM6C6WAvBEiSrUyFWtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 16:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229626

PiA+IAkrQ1ZFOiBDVkUtMjAyNS0xMjA4NA0KPiANCj4gDQo+IFRoYXQgc2hvdWxkIHJlYWQgQ1ZF
LTIwMjUtMTM4MzYgcmlnaHQ/DQoNClllcywgdGhhbmtzIGZvciBjYXRjaGluZyENClYyIGluY29t
aW5nLg0KDQpQZXRlcg0K

