Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03686C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 17:51:03 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.web10.1335.1742493056982605130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 10:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=lIKlEDjW;
 spf=pass (domain: siemens.com, ip: 40.107.159.31, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P82Brq98nqpcEwE/QEJiMfSDKcDif5pLn/LXl9hrXcOencDq3bKaqLMaqaJXGjovgWyMFB472oXTNOc9/fOJcwcs0rrVvwWxfD2KVrKaQjteNrB2/nLzCW+KHkAyJQEZbqw0N1gL++QK5YjKh1L8ysUwHxxMMhcU2AC1DFHBP0glKB3zMwE5Wlq+J/y8hsN4yB2V2I5U9fXQI/mSA3Hel1QFqbo/nW5ywE9VzMfwk6cVF7JivHFGpoprkc1AORNAFooBgFMQNriP81onFZihbnpH2Rk72YwdRiRoLp/zQhuNLaTjsabRWuZFfGiyNS9lR+3ycpbIPLE7if2yKCcq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOw5RHFSJUZa1h5uzRK7JOtaoPRvHkiwqxNI+Y3gDvM=;
 b=d4z3kdd6YLut6rm5DynBmlw6WTyKnvCfuhE3yPW8CByGWu1s6PGBfUT0xGWSondsJH5wSuIRXqzDhvx31OhIIJLwE6DQdvCikKG9ZITdPJ5BXKnrhTr6wcWxihb+OyJb9rndGM6YxJVhvhVQMaUiI5simocGYqZKghPDJzpSnvV6NBgmq5CEBU8LBcTnYB9DSAYVi+UTXNiQE3aAsHn5d+hhZjOs87Yi+p7TK1fpT5KvPRGKln0IeDruDHT4r0hJIHrAj/HUGwVDLWxcxW54AvgJ7jZgzVeHXdSrPO2GZxw084wPdlt8Izl6Bgxzq/Nf6Sng4zdgv9pDZJPtW8CXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOw5RHFSJUZa1h5uzRK7JOtaoPRvHkiwqxNI+Y3gDvM=;
 b=lIKlEDjWQusu90NTfo63ymlTKMVqRgb4Yqjbld25ltHFFbuPFaHZMrx9u17645nhzda0SfU2G/Lvo7UdhekMp4gILkIXWjbTcGBRPNlCK7pyoeVjQmhTQmTktCr27Wzns0LYGUqZ15MaGPZx3sxm8QdEKJmeb1zAKHwhsGv5ZlGDTPkS5eIaJzae9PqVYndy3I91wqGRzfow8vhYlV/E8li+8Knvu8cfbe6rFyhP6WRQAz6XQrt281J40Rh+qPP00doIrIPprA6wybMkOYo+1/2w1VLF6xE9ga6en1jpRiOW5lbLdoQS7oL0VxOSQYnZF0mT9dDSfGSwy3q+2eeZaw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6136.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:587::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 17:50:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 17:50:53 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] expat: patch CVE-2024-8176
Thread-Topic: [OE-core][scarthgap][PATCH] expat: patch CVE-2024-8176
Thread-Index: AQHbl4Rg6bxAKUNjyk23bAJEUwkoBLN8KYfAgAADJgCAACFgYA==
Date: Thu, 20 Mar 2025 17:50:53 +0000
Message-ID: 
 <AS1PR10MB56979B010487CBE838B89CCCFDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250317213335.1865158-1-peter.marko@siemens.com>
	 <AS1PR10MB5697243DCA6D38EC18E2D42BFDD82@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <d727b0982977c96cfdef97ef4d11ea006abfd72a.camel@linuxfoundation.org>
In-Reply-To: 
 <d727b0982977c96cfdef97ef4d11ea006abfd72a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3de12ef4-bbec-4a09-bb48-ec871e7ad6d0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-20T17:35:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6136:EE_
x-ms-office365-filtering-correlation-id: 93e1ed7f-beee-42d6-86d7-08dd67d7c295
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OFRhekxvN3VWQ2JpUzQ0Z3k1V2NNTXBrL0NDN2c5Q1RNaU9ORmZGZTYwdzBy?=
 =?utf-8?B?N1lSNXhjbzNmQXUvM2lVbXM3UlV0a0ZrZUVha3ZlUmpnMEJISFVUTFNwcUpo?=
 =?utf-8?B?cmVsNk9DT0NiMjh3SjduSDFjdzg0ZFJhUFY0WnlYYjZ3RnliL0lLSy9BLzRl?=
 =?utf-8?B?VXVqVXlpellhcHEyNHptMXJ4K0FPVHIvS1pPOFZHdm1lQnNHOGNNSW9YQldN?=
 =?utf-8?B?MVlLMENnaUF6eHFQZzNNcWlGd3NjSnRRb1c1NG1YZ2w3OWc5VFVxaDVPWDVt?=
 =?utf-8?B?UHpPaWtaZk5wQ1NXd3B1YXRuWHpNT2RNVVBpTzhVQ04zUWErakNIdjFLV2U1?=
 =?utf-8?B?VTlpenprVEdZUXBQVWtWSDJwKzFDK0dMejR3RFFENWhMYXF4Y3grTG9qVE84?=
 =?utf-8?B?QWkzc0gxNWZLbnBwdTgyNGZnL05KSjQrMGtQWEtvQk54bTIvck9kcG1mc29O?=
 =?utf-8?B?c2dUUVhvRmJUQ0VHOXNqOWprUHUrcG9JV21QOTUrNWl4UEFoRzByQkMxQXFC?=
 =?utf-8?B?Wm1NRzNHVnczdk5Pd0JiVWZSUGpxSEVzSVV1ci9MUGdKM0lxMTV3VERtWVNs?=
 =?utf-8?B?dzJsNFJJeXNsaDZhc0JoRC9rYks4MmlBZTdiM3dOUFI2Y2FnWCtmS0szMnJs?=
 =?utf-8?B?dEt4dWc5VTNoRTFjajNyQTBFbDBFZUFwakpWQnZuUlg2bzM0SmhyOU1EZDNB?=
 =?utf-8?B?M0hpc2dURHAzYVBSYVZDQy9zTkVZTk5kK1lKdmd4bHRVNXlDR213VXBJTW1H?=
 =?utf-8?B?TDRNNTBJSEtjYWRQd3RDQnJ4dDN3a1RPM25iYldwY1pZa2c5b1VKM2w5a01l?=
 =?utf-8?B?ZUVrN2NnUElUQnBZbitGbWZZNUtSUllGVzF6emd3TlA3eWVweU1nL2RyZkZ3?=
 =?utf-8?B?T24raklZZVZBaWJ6bHEwMHFRZzlxZ3RFRWRnYlJlQi9aMkVxY1d0cXdFUVBl?=
 =?utf-8?B?T0c4RnFqVnRaU0l6MmRpdyt6dUNmcmVweno1ZWZQQkNjaUh3ekJoZ0xKK1JT?=
 =?utf-8?B?cXBDR3ppVzZ2RDd2NmRXOXpNRzg5dTB2SUIvbG01bGxiVkFrdUdNRWtadVFZ?=
 =?utf-8?B?ODJjTExqeEx4N2lQNnZHOHB1VzVISkljYU1ldXo4UmdKcmI1M2tRMjZMZ0k5?=
 =?utf-8?B?SXhsbEQvdEdiZzhjK3BscDFLOHpaRnJFRnhMeUI1cDB0VmRVZ3RVK2tLQW9T?=
 =?utf-8?B?a05TdkhieTlOc3NLRm9sdlBxM0djRWk1WDZaNU5pNmhrODA1VjdMNHU3ZURk?=
 =?utf-8?B?aExHeUVFUlpEWFZNdjdrbVkwVjI0cGlVMjVuZVJ2OFFKN0dpM014eHJ1bkVa?=
 =?utf-8?B?dXpMUHQwYzM3TkNrTjh4MFpVTDFRZjdJSnoxVkEyVGdNZmluWG5tN0xQWWRW?=
 =?utf-8?B?Zk5lVCszU0RUQnBzWVEreG9Oa3lmVXlRYjU3M2hQdVo3R2xHbTZWd3AydG5v?=
 =?utf-8?B?U1Frbmt6Zm5jc1o5SHNpKzc1c0gyL3ArNUdhcGRyQkNjOVFQQVhROEJNMmJj?=
 =?utf-8?B?N0ZvNEZURkp1Z29xUCtHSkZkaTl0QUtHTDVnNjRRbms1Sm40VkwzdmwrNkpo?=
 =?utf-8?B?NTh0eGFlcGNBT3RnRHRBSGJ6UytRbTFKSU54ZlFNd0N4clVLeW1UaUl5QmdM?=
 =?utf-8?B?dUtqVGdWTml1OWdtZ0gvQXphOGR5Y3BjMGQrNWVtMW9Uc1NTMzFRQXgyRlpP?=
 =?utf-8?B?UGhMZERNWXNwR2xQZnlZRkFQTkUzOHppNnZORGs5K0tYRWpSaVd3QlFTejU5?=
 =?utf-8?B?dXYzSjQvTEV5NlVsdDVTM2xjQjZmUENrUEZ0S2FlNC9HZ1FUb0VGejRyTFNW?=
 =?utf-8?B?UGFVKzg4cGQyZURlRVdVazVVVnkwS1lCOGUwNGFVWTE2NTQ0MFRrNFU1aVpu?=
 =?utf-8?B?dXJKNzhFa1gvUnNpK3l6dFQ0MDRNaVJGTEl5RGlSOFU5Z1RDcW1hb0hvQXUz?=
 =?utf-8?Q?5xmMEAeq67uowgB2Tb7MPyh9U0sSo9tF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V0hLMzlhT2Jkb3EzU3MwSERTRktkbnlKd0pzdTdpU3ZrWlJwSHBteS96NDFa?=
 =?utf-8?B?Z0RsTkFDU1pQWmIxS2IxdVptdUtuVThDdk9YU0ltOTQwcldmRSs3Y3Rsdnlz?=
 =?utf-8?B?UlYvejdTZTV1ZVRqNXA1NzhnMXNuSjQvZS8xU0FkV3BmUm0zNTc5WHhmTDVE?=
 =?utf-8?B?R2t1ZHVSRXl1Wm5tNnVsYkNuSjBpOTNaTmVxOUhPZVkzdTNJMW1KZ2xMc2RT?=
 =?utf-8?B?YzQ3WEdyREJEaGdGUENMZ2kwck5ZZk1WYm9wZ3V3b0pYV0FXb1g1Zm1mNEpF?=
 =?utf-8?B?UTVLd0dhMzNVRlMyTzdNQW1BRWQySmp5ZG1rM3NsRGdnNElKTzZyYlZKd2JT?=
 =?utf-8?B?ZEtJNFU5VFZNdjZqdElYZENONVZyS3lML3doWFhNUmNJMERSZDhFZi9JT25T?=
 =?utf-8?B?VlVpVGF6Q0RBWmN3QWRQVnQ5YjE1bEpVZkFya25LUnN4RFBuRDdCNTZsaklv?=
 =?utf-8?B?Zy9PSnBoS3JGaXZLa0prZ0JSeFBKc3NSZ25KL3lwK1cwdXBsV0QrTmNKR0ph?=
 =?utf-8?B?L0pvZlV0eStyTzQvSmdiVkdKYm84SGNidzQxVnN1cWxWRG4zb1RWYzhFWHoy?=
 =?utf-8?B?eEZWb1RyOHd2VldkVC9Famszc3UxU3c1Nm0wdytqUW9LWmJYM0VhZWdCbVhv?=
 =?utf-8?B?a3M4Q0cwOVZNQWpqM0l1cEVRSzJud1p1TW9kdnE3ZTNiZVlZNkRTYW0vMkVs?=
 =?utf-8?B?TXlwdTIrM1doR3l5L01hdUJKOXNDZVFURDV1MEVWNHRHREJ1allKcEFnbk03?=
 =?utf-8?B?WExYdmNEcS8veGZqOFNVdjJLOTlvWVBqRE4vL3ZiejUxa3l1YVRpSkU3TGFO?=
 =?utf-8?B?RDhraUFDN2dyMHhRbm4xd1JaZ21JdTdaRGE0UUk1cUw4OUZkSDh6M3BYR2JC?=
 =?utf-8?B?bitWd3R0ZWl2TXNWQ3lEaUZwWlpzd1dBVURENzhqc2p0em5iK0JabTVrRUdO?=
 =?utf-8?B?ZXNrUVI2R24rbzVIV21mN0d0VU92c1FWdGNwNVFVSTlsamZCNVhzUmVTTTcw?=
 =?utf-8?B?OUkwV3RhOG15ZzJ1QWt4ZkN5U2poYUlMbmZwRWhoK2FTR0ZpSDltbmMydVZq?=
 =?utf-8?B?b0lxdHNsSDZZVjBiVFZIMXNoS2I0TWlBalRwUHp6YVEwQ0tNc2owNVJSckp6?=
 =?utf-8?B?OVM1Y2pGckZDby9PMXdUb09NaVN0b1plajNjSEd0ekU5T2Racm93VFEzck1O?=
 =?utf-8?B?SkttRXJTUG1HSjV2eTA2MnZjZTBHUWg4MmlDa2tzcVN2VTZ6MGVuUnhkT25E?=
 =?utf-8?B?Qlo5MmJKVUJ0TUdISFI4QzRsTERvYVVsOXZyNHBlMjlreDlaYklURFk1Tmt5?=
 =?utf-8?B?THJ0d05PR3RHN2c3R3JCbHdDb0NBMDVZZW1EZHJYeXZoZklkWFgyNDUreGRt?=
 =?utf-8?B?MXlTNHFiUG1zdjNjWm91RmY5TmFMQW8zZHlaeDlVanRTN3YwTWpseUxXc2xi?=
 =?utf-8?B?dkZ5RHNGWjh2WkhoTUVTa3dVWC9TY2YxRlhHM05ENWFHMjNmanp0ZFAyL1Jk?=
 =?utf-8?B?dVdKTkN6UEcxK0wwYmlPMUFSNVVxeXB5Q0hkcUx2TnNrV1JZL01idDFwL0hE?=
 =?utf-8?B?TWk3d216OVk3eitWbHNiRWd0MEdyOHFsVmJ5K2s4a3JUL1BjOXEzYUJFc1lw?=
 =?utf-8?B?MlppbVNvK3NybWhIclh2SSswaUI0Mnpib3o3cHBiYUhCN2k1YjExWjFrdnF6?=
 =?utf-8?B?aExWREF2eHRBRzkrTTJjVjFMQkg5RDBVWHd1K0pFQWRqNjhYbXBjS2l3dnhZ?=
 =?utf-8?B?L0FGaWlINGdWMytlak9ld3VNaTVTWCt0cGlMTTlLL0RlWGcyd3dkZURUT2xT?=
 =?utf-8?B?SEUwV3hjYVpXNHpPdUZjekZ0REVXdlg2d1VrbFBtcEFXb3g0YWFONjg1SGw2?=
 =?utf-8?B?cU54ZnJiS2x5N0NlUWprWU1NVGFvTGorMmhROXp6RlFCRW56elR6SGlUZnJk?=
 =?utf-8?B?a0c5cllMU2VtamFuZG5GKzZXNVN0d1dIOEhkNkJDdk1hSmxlbVk4S0JqRzFO?=
 =?utf-8?B?OS9NSVRVdVA0NkV4V3JTdkFycGdoY0w1Q2MzRmtjaXRSNE5oOVQ3MWc3Tm5T?=
 =?utf-8?B?SC8xUUR0ZkJIQ29PMVpDdDNQYTE0VFgrZnczRkVCUUU5MUFVc2lMVEJLMk9v?=
 =?utf-8?Q?EHLOr/OFCvmu0RHYQ8zQV4ENM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e1ed7f-beee-42d6-86d7-08dd67d7c295
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 17:50:53.6586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KBBtvGASZHXTQ6oVMutT8PUC1Qof+rVR2kbwMYqdbxxbhdfrJlKKCcRfTlWxnegpb/EGAlQof8VNvsYv2g7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 17:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213423

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE1hcmNo
IDIwLCAyMDI1IDE2OjM3DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBl
dGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3NjYXJ0aGdhcF1bUEFUQ0hdIGV4
cGF0OiBwYXRjaCBDVkUtMjAyNC04MTc2DQo+IA0KPiBPbiBUaHUsIDIwMjUtMDMtMjAgYXQgMTU6
MjggKzAwMDAsIFBldGVyIE1hcmtvIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3Rl
Og0KPiA+IFBsZWFzZSBkcm9wIHRoaXMgcGF0Y2ggZm9yIG5vdy4NCj4gPiBUaGUgQ1ZFIGZpeCBj
YXVzZXMgYSByZWdyZXNzaW9uLCBzZWUNCj4gPiBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQv
bGliZXhwYXQvaXNzdWVzLzk4MA0KPiA+IEknbGwgc3VibWl0IGEgbmV3IHBhdGNoIHdoZW4gdGhl
IHJlZ3Jlc3Npb24gaXMgZml4ZWQuDQo+ID4NCj4gPiBFeHBhdCAyLjcuMCB3YXMgYWxyZWFkeSBt
ZXJnZWQgaW4gbWFzdGVyLg0KPiA+IEkgdGhpbmsgd2UgY2FuIGxpdmUgd2l0aCBpdCBhbmQgaG9w
ZSBmb3IgYSBxdWljayBmaXguDQo+ID4gSSdsbCBiZSBvYnNlcnZpbmcgdGhlIHJlZ3Jlc3Npb24g
ZGlzY3Vzc2lvbnMuDQo+ID4NCj4gDQo+IFRoZSBleHBhdCBtYWludGFpbmVyIGRpZCBjb21tZW50
IHByaXZhdGVseSB0aGF0IHRoaXMgYSBjb21wbGV4IGZpeCBhbmQNCj4gbm90IHdlbGwgc3VpdGVk
IHRvIGJhY2twb3J0aW5nLiBXZSBtYXkgd2FudCB0byBjb25zaWRlciBhIHZlcnNpb24gYnVtcA0K
PiBmb3IgZXhwYXQgZm9yIHRoaXMsIG9uY2UgdGhlIGlzc3VlcyBhcmUgcmVzb2x2ZWQuDQo+IA0K
PiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCjIuNy4wIGlzIHRoZSBmaXJzdCByZWxlYXNlIGFm
dGVyIDIuNi40IGFuZCBsaWJleHBhdCBpcyBub3QgdmVyeSBhY3RpdmUgcHJvamVjdCBhbnltb3Jl
Lg0KU28gdGhpcyBiYWNrcG9ydCBkb2VzIG5vdCBwb3NlIG11Y2ggcmlzayBhcyB0aGVyZSB3ZXJl
IGFsc28gbm8gY29uZmxpY3RzIHNvIEknZCBzYXkgYnJlYWtpbmcgTFRTIHJ1bGVzIGlzIG5vdCBu
ZWVkZWQgKHlldD8pLg0KDQpLaXJrc3RvbmUgaXMgaW4gbXVjaCB3b3JzZSBzaGFwZSwgYW5kIEkg
ZGlkbuKAmXQgcGxhbiB0byBiYWNrcG9ydCBpdCB0aGVyZSBkdWUgdG8gY29tcGxleGl0eSBhbnl3
YXkuDQpUaGVyZSBhbHJlYWR5IGlzIGFsc28gQ1ZFLTIwMjMtNTI0MjUgd2l0aCB0aGUgc2FtZSBI
SUdIIHNjb3JlIG9mIDcuNSB3aGljaCB3YXMgdG9vIGNvbXBsZXggdG8gYmFja3BvcnQgKHRoZXJl
IGFscmVhZHkgd2VyZSBzb21lIHRyaWVzKS4NClNvIGlmIHdlIGFyZSBvcGVuIHRvIHVwZ3JhZGUs
IHdlIHNob3VsZCBjb25zaWRlciBkb2luZyBpdCBpbiBraXJrc3RvbmUgdG8gZml4IHR3byBoaWdo
IHNldmVyaXR5IENWRXMgd2hpY2ggY2Fubm90IHJlYWxseSBiZSBwYXRjaGVkLg0KDQpQZXRlcg0K

