Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CBDE9D41C
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 17:11:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25997.1770225097776590733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 09:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZNGYPhf2;
 spf=pass (domain: siemens.com, ip: 52.101.83.39, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpSPTOw0YoDelOV9KWLsX5x8B2akYjvO6WdyIj5UZEs+Bi2DevMmAG9oQ3u+nMo4gYlzMXe3RTn5wU2paHI9jTiAgAKgOjMNK62mtQEtLWvCXzQ51XSSoKIhoQ+qe9w1HqkKzOYUDTW0QVe8GdC2FiaHBncgSngmivRo4QW5GQ1P1r/WRXbs+MjYBjwbXK2awXqLalB5++zvQdvx8Vhe2lK6k1rR2BiIklNro2xn7uUpp2L1kZ5YM9FxQ0M5Q6y6N0ebxrPYSs6XYYpRIYTicUoeqWzKbarNi87MbAt/ga1awN5WpE83dO0eH272enZMU7TsTsA9F0yaZBif+jMt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xi4+BZbgW+cWTRErWuZyeZtLrUd1vp0meyn5mtU7hpU=;
 b=q+QpLhCagRGasU0V6KELvJkbaOE0+zg+0ljp9DdRflqaBc8NTWJcVdC1QRsZMvyli+hLP8/tx8xJ8CG5E4SZwK4t4A7zGUSfLI/5JwF+Oof9DfSJsDy8m1krWtuWiLU4xLMNZsdOgeNUCdvB/6Jo74/or6t8uKxY1+ZeJKDDb+lIo8LtiMUlRUASiozPV65AiY7iZdr49cCrQXRPB3+AFGgiNEVw/ZkXJQdsJVPlkS3Jo641MGpcnR5SNGVlJBUK9OHvtACCaeSApy+L/0qJCSMK4pT+zCNQGPIGkvaykYibJonv+r8n8VWAi5q4O6Bd4rtsaDv8YSQ60cQV4r1x8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xi4+BZbgW+cWTRErWuZyeZtLrUd1vp0meyn5mtU7hpU=;
 b=ZNGYPhf2t33ZSdW7+9mnzQIKqdcTSWQnRZLmJNYCLPf8P9N+52zNJD5Sn/H0r4GkWv/iXmRZqrmFEibL47RhfvtiWawW1QYSSyVJFu61XGn+/V9ALgeXYzsROBQ7daCFD6DVD27H7EntBaiUf0kDgJGK5OtZ2KuOQLhOmf1HgKzVbsT8U2cge5IJj8p9uob3gqD9eVow6bNVa447R5YzYjJpNVZhV3tf8/jtcJGe8FPsdeWJMj2CqCdlmQrN8E0g4KcpoGxbv1LID3THN7/mam6zC03ziInfFfsi3KZVU+pyZw2XOZqaHw4bdjo7TE3Kmfm3TvIMJQhStG3uIC30zw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7564.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 17:11:33 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:11:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "hprajapati@mvista.com"
	<hprajapati@mvista.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
Thread-Topic: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
Thread-Index: AQHckat8eJwbEubvBESOtLyw0iD4P7VyyS6AgAAFK6A=
Date: Wed, 4 Feb 2026 17:11:32 +0000
Message-ID: 
 <AS1PR10MB56972FCF587B6954B626995EFD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260130054350.300667-1-hprajapati@mvista.com>
 <DG6BYJEIPLBK.2FSCSMFX8XMR2@smile.fr>
In-Reply-To: <DG6BYJEIPLBK.2FSCSMFX8XMR2@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=79c1e488-ea90-4916-aecd-24fb44aac77a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-04T17:08:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7564:EE_
x-ms-office365-filtering-correlation-id: 08a13b16-285e-4831-740f-08de64107230
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZStZMDRsK0VrL3V6ZzY5ZmpxNXV0R1RBaG9kT0FFMWtxK1RENkZxRW5nZTVn?=
 =?utf-8?B?M0orWSs2TXRHWnBPM21GUkNucWxmam5Rcm05TXE5VmVpb1kxMXRJNzhxMkxC?=
 =?utf-8?B?azl2U0RHcWI3Q3FVUDFDY2x6a2pQYnBwdWRidW9wSzlNK1NGQkZxVzZpMWtF?=
 =?utf-8?B?dGdKUGozc2cvenZrR3FYS0xDdExzbGEzVkZUdElmL1BQdkZQdHo1bDRXd0lj?=
 =?utf-8?B?eFlvcDhxcGJtQkZBVCs0b043WWxncEpOTG1VN2oxOHIzdExPQXg4ekcvQnRy?=
 =?utf-8?B?YUR5WjhvQms0UmM1Z3ltVWNoRVh6d0JPVHpld0hFODJOQUZ1VjNEcUd3MHdH?=
 =?utf-8?B?YmZQYjJnODRhYzdEVGc5MXVaTGtVd3A1L3JNYUw1ejJxUi9YdjZMUUoyeUxN?=
 =?utf-8?B?NnNDRlcwdklKay9PYzIrdEpZY3cxTWsvWlkxVm5Fcm5HNEhNOXJYdS92VHk4?=
 =?utf-8?B?UEtzaldXMlY4TGM1RTZMeUk5RVNURWs1VEZaQ0Z5OHNxb09hcWNBVi9nUTlJ?=
 =?utf-8?B?eTE1cWg5bU8yRSt0S0s1KzY1MC81YnRxaDJHUGVDc0wyZkdaQ0U0YmJFY01x?=
 =?utf-8?B?NTk0R0E3TnBWUGU0ZEFRL0VTRmdyZlZPaUkyVk1aUkoweUVkVE1VOU5zZ3oy?=
 =?utf-8?B?MEhaQ0RIcmZRczRkekZYYTVxWG16V2s4K1hCakh2TkE4SmlFTjJOc3lhdDhx?=
 =?utf-8?B?eThTN0pQY0JMOVBpNGxvcktTMmU1bkVFckU2SUM4V0sraFVNSExJc3ZqTVZp?=
 =?utf-8?B?MG0vWE9oVk9VMkRzTVFPWXVZem1RWnEwZlUwZmVqcUpOV3BPQlFFMEhvN1Bk?=
 =?utf-8?B?a3hBMWFCS1FjUzY4KzFDM3hwbGQyNTJaTUhKZGNkU1p3ZWJuelYvbWxzK1B2?=
 =?utf-8?B?ZXhoUmRjdFU0STM0dWVuYXhUYmFnMFUvdS9rbmJUWEtGamFZbUxiODhSbVd2?=
 =?utf-8?B?RzhvOGJXbHZHUElIZHFkVTBUVHo2bjdsaVIwMW9SNHJCVDc3czRFOXIzSEd6?=
 =?utf-8?B?bjVZdDdzUzBoNVJOTDdvaHlqcTdRMjBtWllFMjRpdXI5ZnhNbDR0TXFXd0tJ?=
 =?utf-8?B?eFJ5T1VyOWJKZ0tZd05yNlhYZUhWNnJURWo1WVlPc0Z1S216THpzdEFjY09L?=
 =?utf-8?B?TG9rNXM4bUI2MEtQZU1lZm9uWlF5NWpqaFdra01YYUNnZ25WVkp4MW5jUTNO?=
 =?utf-8?B?dVFJQzhNZlRwWUZDSk4xaWp3YzZYZzhOdDd5cVJ4WkFMYUh2SXlZc3dISi9k?=
 =?utf-8?B?Nys4TUQ4c1VoYm5ZM2pjeWh2VmVRajNFN2lVVExIb3RPdXhnN0lQTHRKOTQ3?=
 =?utf-8?B?R3I1VTloUnYrMTNPUCs0VnBWM3RpbDQ5MDBlVThLM0ZZUkFPU2ZkblZpS0tB?=
 =?utf-8?B?cGtTWFhKSG85MUp4QXFBZFlqU21FTjZiZkJWbDdIZ1I2UmZqVWxiZ0xyVVZX?=
 =?utf-8?B?Vlp4S0t6ZmVFUkY2OGtTbGlrcldZS2xrVVpiSndiTTZXRnU2UTdEQTdRR2RM?=
 =?utf-8?B?ejV5dXJzWWZDRzRKdkpQKzRCRW10UnEzSzJ5YWkwbno5Z1JRQU1CZ1RRRVRs?=
 =?utf-8?B?Y0RaWVdIRmpiaTZOcGw4T3JhemlZUUpoY0R6TjhQcHBFaWhGOTdmQWtZUTRH?=
 =?utf-8?B?azVwWGtJZTUxWFBiWEhxWHhrbmtGdXpoZ0I3SDBUU1hPRENpcVdLNkE2NDhO?=
 =?utf-8?B?dkNIYU16T2wvd1pLOWVDYzR3Y2RDNzhnNTNvWkZzbFdMc0NnSitrTm5TSFpP?=
 =?utf-8?B?c1pIMHA2M2pyNlgvSE90K09HK1YwYzRVUllDYzBIZGpHWUxMakpySFRqWlRE?=
 =?utf-8?B?WUI2dzhuTUdsU2JCeXpoY2lzM1VwSUVGT3o2cmVPbjVDWE84U0t3MmZ2Rks5?=
 =?utf-8?B?QWF0dldmMU9FSlBFcDh2dzFjUVU5alI5dFQ0YzcvclNyUko5bkc3ZDR3RURH?=
 =?utf-8?B?OTJVMWtWak5kYkhnNndaTnphaE1DQno3M01tcUswM1ZYU016T05IaDJXRHht?=
 =?utf-8?B?d0s1ZUh2WjNGNGdxdU5VUG9wWXdBVXM2SnlKQ0FLQU15NmZRR0d2a2lOZE4x?=
 =?utf-8?B?cnc0dzdWVmwrWlNON0xXaEtsT25QYTRNYXc3akJYdVpENFpvMFZWdDhwTEx5?=
 =?utf-8?B?OHhTL0FibVBtZ1dpaEYxdEpTamE3UDlOb0xvbGZqaVVFay85a3lzYkNYRS9F?=
 =?utf-8?Q?NpwRSvqKEyoH4C0iiLA9wKimc3cYNVW+q0P+Rlzd2Ibe?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFN1azVUUWVCWmJ3anNQZnBZbFRyRDEzWjJlZWk3NUhDMzBaUlRKL2pMZC8v?=
 =?utf-8?B?WjJMRTdheHhnU0pYTG1LaGdUN3pkNElVYWNXSXRLd1dvcC92UHFJWDRlOXZ1?=
 =?utf-8?B?MDdHdXNTT3dlTzFCelVaR0oxZmIxQ2xCZ0VzSDZBbjltTE5vR0QxaHpIZW9t?=
 =?utf-8?B?TmNuMVlQV0xuUGZCeFJQSXpsZWZxQzNERmV2VW9BdEJTUm85T1ZBcDJMcVZr?=
 =?utf-8?B?L2tIUVlMMWxTcFYwcnU4dDBhbzgzcDFIQ1RyVmtPV0RBSVZLY1NXa1krUno4?=
 =?utf-8?B?dTdIakt5YjRUVmZ6bk5pTHNqTi9YdnZWSmxBNm51NUZVYnUxcjZWbFMwZXpl?=
 =?utf-8?B?aW4rQWRIWXpuSkZMc1VqcittQVRQOHdTdXFIOUhpTFRjeFN0aFlvUzNHS2tq?=
 =?utf-8?B?bUYzMmdsWlowL0IySUl6TzZLNmtxQ1l5Yk5zckxNSlorRUV6clh4RFdaT1pu?=
 =?utf-8?B?SmRLWDJDc2xaeThDSDIrZG1PWXRMWFdKdExSQTZIbEVSYzZQanJSdmJpL240?=
 =?utf-8?B?TVZ6blN3WDdMN0FlakdhRXNrZHYzU3QzREhjcTNNUlhySXFRZnVpRG81aHZS?=
 =?utf-8?B?VnVrbXY2ZVJkbkZhV1Zkdm9qWTRoOGlXY3B6b0E3Qm5udDgzek1ZaGFYSmxw?=
 =?utf-8?B?M3FJY1BCSXZVcGpFNmRscWRiTHlFbHI2OUFxc09xZ1VRZktLcTlQbEtyVzRZ?=
 =?utf-8?B?YlVPR0MxR1JhTTJmSyt3bWdkZkhBbWU3NExESDZqckM0dFBuVXN1bzQ0SkQ1?=
 =?utf-8?B?VWpnc1Q1WTIyb0J2aFIwbkR3RlRBMko3U3FlTG9qaWk0SGJkNXV6WVdrWk43?=
 =?utf-8?B?VEdIdjJxckNtMWNFSUhYTEttYTdENUtqc0JVRkVkZlpFOXVsSU5pYUVsNWUx?=
 =?utf-8?B?aTZ4ODNoaXQyZ0t2TEYwTktzbnZ1SXFOSElPYzAxYm1SbmRBSWtleSsxbHFr?=
 =?utf-8?B?amYzRVkzcDIwUmFmYXhUbHYwUnFNZ01CWDdWOVJ5bzFzamxqc0tuSGxBYWwy?=
 =?utf-8?B?ZG5YOUNWRDJucXcxVWpyWFRKV1NQdWMyRFRiOE84aTd1NEhhbUJqQWd6RE4w?=
 =?utf-8?B?bTRFWUhVVHMvWGVpeWxVWmRsT2diamZsb1FJZ2xQUWFueDlkR1pqb0JBOVBG?=
 =?utf-8?B?TlRaUE5vVlhLUzBPU0s4Q01kT2lUd0JUZDBrNjZoRnRhQVo5NSsxbFh6QlEx?=
 =?utf-8?B?dFROVk1IUktMNS9KeThubjVtSldzbi9FeWZNOXBwa2ZFeFNwSGdOSEVnaVN6?=
 =?utf-8?B?cEVVTS9jUkdrVU9ZTnBVWnBBRTluNHFKOWdTSHpUd1ZxZTlnMkVOaVhlUEM3?=
 =?utf-8?B?SmNRNGxxMDN0ZHJaTU1kTzJiMHM1TXBCVUJPQUdPczlNSlBJZGlMdzZXWUVH?=
 =?utf-8?B?WS9VSTNnQmN5MENjb3hxQXhyRzJ3T3p1aTNYZFJJdnJUSm9TTFh4TGZmRXJO?=
 =?utf-8?B?R2hJQm4wRnNNbVJja0trQ0c3M2NBTlh1bnpZRis5MEp4ZnJBQWp2WStkVHBP?=
 =?utf-8?B?Q2s4MW1qaHJCWVpnSlV2R01NOGVMVDQvZThwVUt4aEpjSjNlMFZWQmlQdE1G?=
 =?utf-8?B?Qjk0SkN5TGlXN0dRTVFIa3oxaDFSb01OdEhVU2IxbG1TcHVlcDhTZE9yVHJT?=
 =?utf-8?B?QmxEMzV6a094b2JlRVMwNkI1NGgraUtOOG1hRUwvRnJDOFgvaWhWMW15SlRl?=
 =?utf-8?B?UWJ5TzE0S2pqdzBjbk5CbTJ4eldza0JWQ3hLY3JsbzkrYTVLVDZpL3BmUTVq?=
 =?utf-8?B?Nzg1SGpwZFNSWEpwWUVsUkpGWFo5aDVRTjdGQ3pidHpyZEdlMWFtMW04OVFN?=
 =?utf-8?B?WDlWMGhrZ2QyVFplN1l0UHpNSGlCY0RBUFJOYXZvdGcxeHhXWWVvMUVuRGxj?=
 =?utf-8?B?UE55b3pqRjRVL2VLVGJZQUp0UlBFOGdlNGZ2VmY3bW9QRzlQbFFYUFdld3la?=
 =?utf-8?B?L2ppU2lOY01xTUZpUXhuSm1rYTBDZDVlMUd5TDFYUjZFNmxSb0dhNWJ2YmFY?=
 =?utf-8?B?LzlwWDhwTk4rR3Y1UlJXbm1BbGtZMnVrazI4cVpuOE8vc1A5MXVZY05lR1Uw?=
 =?utf-8?B?QTExZmVhWTBZbnozRjZpamVJY3pYeU9zYU5RS1c4R01NUTlBUFBoNVluK3Zn?=
 =?utf-8?B?cHFIdjEvcWZQeDZaWktzVmFLcmk3VEIvQjVKRU9tRkt2ZWF3L0EyTWd5Qnpn?=
 =?utf-8?B?aHdBYm5VRkFnR2RScElQSExrckNnay9NVkczVVBqdUtVc3BFQW5iLzRuMEpl?=
 =?utf-8?B?dXV6a0VHcUxKVStndVVDanUrQzNOdC9veTdJUVJHYnJGVEpwdk1FSDhYZXpB?=
 =?utf-8?B?NmYwYUViWWZHcGNQcXRNMXNPQUd5bVo2MDBWYkFGRWhjeWtMU2dHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a13b16-285e-4831-740f-08de64107230
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 17:11:33.0644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fr6WEdTHCw8t8AzdW364ZyMgS2ffZwsTQ0abfhnKt4jD/xwha4zA3AGpNlz8bce/4OvgdbVVCJbbmiiAmdUedA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7564
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 17:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230555

V2hpbmxhdHRlciBzaG91bGQgdGFrZSBvcGVuc3NsIHVwZ3JhZGUgaW5zdGVhZCBvZiBwYXRjaGVz
Lg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVz
c2FnZS8yMzAyMjkNCkl0IGlzIG5vdyBtZXJnZWQgdG8gbWFzdGVyIHNvIHRoYXQgYmxvY2tlZCBp
cyBnb25lIGFuZCBpdCBjYW4gYmUgdGFrZW4uDQoNClBldGVyDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2Yg
WW9hbm4gQ29uZ2FsIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTZW50OiBXZWRuZXNkYXks
IEZlYnJ1YXJ5IDQsIDIwMjYgMTc6NTANClRvOiBocHJhamFwYXRpQG12aXN0YS5jb207IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW3NjYXJ0aGdhcF1bUEFUQ0hdIG9wZW5zc2w6IGZpeCBDVkUtMjAyNS0xNTQ2Nw0KDQpPbiBG
cmkgSmFuIDMwLCAyMDI2IGF0IDY6NDMgQU0gQ0VULCBIaXRlbmRyYSBQcmFqYXBhdGkgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
ZnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVuc3NsL2NvbW1pdC9jZTM5MTcwMjc2
ZGFlYzg3ZjU1YzM5ZGFkMWY2MjliNTYzNDQ0MjllICYmIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
c3NsL29wZW5zc2wvY29tbWl0L2NkY2NmOGYyZWYxN2FlMDIwYmQ2OTM2MGM0M2EzOTMwNmI4OWMz
ODEgJiYgaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9jb21taXQvZTA2NjZmNzIy
OTQ2OTFhODA4NDQzOTcwYjY1NDQxMmE2ZDkyZmEwZg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIaXRl
bmRyYSBQcmFqYXBhdGkgPGhwcmFqYXBhdGlAbXZpc3RhLmNvbT4NCj4gLS0tDQo+ICAuLi4vb3Bl
bnNzbC9vcGVuc3NsL0NWRS0yMDI1LTE1NDY3LTAxLnBhdGNoICAgfCAgNDAgKysrKysrDQo+ICAu
Li4vb3BlbnNzbC9vcGVuc3NsL0NWRS0yMDI1LTE1NDY3LTAyLnBhdGNoICAgfCAgNjUgKysrKysr
KysrDQo+ICAuLi4vb3BlbnNzbC9vcGVuc3NsL0NWRS0yMDI1LTE1NDY3LTAzLnBhdGNoICAgfCAx
MjggKysrKysrKysrKysrKysrKysrDQo+ICAuLi4vb3BlbnNzbC9vcGVuc3NsXzMuMi42LmJiICAg
ICAgICAgICAgICAgICAgfCAgIDMgKw0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyMzYgaW5zZXJ0aW9u
cygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsL0NWRS0yMDI1LTE1NDY3LTAxLnBhdGNoDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvQ1ZFLTIwMjUtMTU0
NjctMDIucGF0Y2gNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L29wZW5zc2wvb3BlbnNzbC9DVkUtMjAyNS0xNTQ2Ny0wMy5wYXRjaA0KDQpIZWxsbywNCg0K
VGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCkFzIGZhciBhcyBJIGNhbiB0ZWxsLCBDVkUtMjAyNS0x
NTQ2NyBkb2VzIGFsc28gaW1wYWN0IHdoaW5sYXR0ZXIuIENhbiB5b3UNCnNlbmQgYSBmaXggdGhl
cmUgKGVpdGhlciBieSB0aGVuIGJhY2twb3J0IG9yIG1heWJlIGFuIHVwZ3JhZGU/KQ0KDQpUaGFu
a3MhDQotLSANCllvYW5uIENvbmdhbA0KU21pbGUgRUNTDQoNCg==

