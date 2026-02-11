Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780ADEB5964
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 04:03:04 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11126.1770782579119945309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 20:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=YK1QMJc8;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.61, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsyCiVQUhNg1keGa28kb49HU12FrL2PHgWOLLfu4/B4hd5O1ZfWgVeUqbByDsG/4SdlHjyHss3qTgPzIjlOw+I4FtSGSQbNsgYT2xtC65vulgcWUj7jnhxne5lnD5DAyM5PLK2vRqqGRql/hnKguTr+malZqmxpTy5snzr3PzWr5Mwb/r/c17EXcmnSCwhFJJnMyzorx6TC4wzoWgMWT2Ex5HlAIUDOo72UJpForxZVz7IJzPSz0jnSzMTrlzelOHE0fE+7oTuK5K/aa6rXuOsxD8TJgFB/m3t2JX15mP1S4cC4PWWyvE0mYVEeqeDQRwDgFaHq5Uzx8WO09ZNKEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HN3bPxuvdJp1uXvrJn1dfO6Vf/VFS/lJy33mKvDz1R8=;
 b=zUaIcSYpurav4rkWG5mqgXKGgVIAqpILWNehMneGKr8/NX2ik7rPKo9Q+X7/k/8JMr2bMQ6SQg2zwq6FzbGzJXZL8CrrooXJfFuFmp6NXAA4vink95D++WpnNZidJUOwa3v+jzI/yUc6g89rSr97mjlKfMDzHjwAYPfGTphjmFyzb3c2RHj9h47Kc/Thtye+/9VOz1SIQIN/NUQ22nnOVqLaWGYhEuESBpMtTCib9kxeTXi12O5VmitMWdS5O3VmSW6myLR8Mmu8y86a8nviva1RfWxqwwq013nDvyNL4Iwurw+v0febuQhQNvbHaRQX8ix8DWgYSUNIOQIej3fjVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HN3bPxuvdJp1uXvrJn1dfO6Vf/VFS/lJy33mKvDz1R8=;
 b=YK1QMJc8OY6c4JHg28m8cTMaVg6NhGJEVab6sBpkUwL9p+X3qQXOE6yNz9sviZP/GNw6kwRiOkrKM3ybGcMHqHS1PcMi7BoYL1qKHmPnxpvyoW55f9JdXyZtraKrB1OqAr815jdsU+epp9Jg3iuVb2EUoGC4nC+dPG1cQOsoBjnCbGl2G6f4VPrNUv8/TFYdVo/UT1Iyx/uWIxbb3Gyg53oy/wiB11ffSOFcSuou830MAAirwpO4bjljWP64nr+6lajPHG443/6U2VsPYHjsi9EiHggMIsDfM/P7Tgrckz6zCMkxwDQpgtBGpOXOfenMhNncpZQU2AMQNGnpOs8/2g==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYYPR01MB15220.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 04:02:54 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 04:02:54 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 23/39] python3-numpy: upgrade 2.3.5 -> 2.4.2
Thread-Topic: [OE-core] [PATCH 23/39] python3-numpy: upgrade 2.3.5 -> 2.4.2
Thread-Index: AQHcmaMNbaSdpynIukqKP71O6TW6WLV71fIAgAENNVA=
Date: Wed, 11 Feb 2026 04:02:54 +0000
Message-ID: 
 <TYWPR01MB1186109C9839EA70E40C0F5ACDC63A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
 <20260209090317.1468-23-wangmy@fujitsu.com>
 <DGB9J1A94Z7W.3JGACH78D4IHM@bootlin.com>
In-Reply-To: <DGB9J1A94Z7W.3JGACH78D4IHM@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9OWFjMmM5YjctODFhMy00YjQ1LWJjMzMtNThmZTQ0NGMw?=
 =?utf-8?B?MmQxO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI2LTAyLTExVDA0OjAyOjMzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYYPR01MB15220:EE_
x-ms-office365-filtering-correlation-id: 414f2eec-1df0-4d29-7872-08de69226f2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|14052099004|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y2ptQWRSMUdjOXdYeFhKalFnOU5jeEJEc3RHcGZzTEFnTGJ6WlNlWFoyUXRJ?=
 =?utf-8?B?ZlFtRkR5blV5SVV6N1g4MXI2Ukc0Mjd2SXhTMXJxbGFTOXNnUHBkZUhzMjVW?=
 =?utf-8?B?RFE0eUVpMS9mMGtUc3IvbmxwSVVCanVmdDlsQk9KckJ6RWdQWndPZXRDbTVi?=
 =?utf-8?B?WndJdVB4UXp0T1NtUVhyajZ0ckg5MmtDOUpTY1JKdVpRV1BlUzk1TGIwQlFH?=
 =?utf-8?B?bExoZDhFUDgybkVZajNLbUI2OThHK1lBUHJJdHFrRW5zL3VtOFJZNHMwQ3R3?=
 =?utf-8?B?eHJLOXY1OU1vYU1WOTRTT21wZEUyWUVuOW1zSmxpSWpyVStiYUF6ZVhBaXFa?=
 =?utf-8?B?STI3SHpKNlRDVnY4ZHd2a2JkdTl2cExjSDZydy9iM2tIYzV0UVpQN0JVSFlq?=
 =?utf-8?B?Y1BiaVFwTXJieVhxcG9WWGpDQk9wZEVzaDlKSk1xenFSd3hYalRBYlJzdVIx?=
 =?utf-8?B?WEl4dCtFTlhzSDhuaWRWdENzK3psME1xbmN1dDA4SWYxb05VOUNUTlJyVTlL?=
 =?utf-8?B?VmZBZXllc0lRNHpMWC9NTGhDbVM1cUZLSEt2MUZRWHBVQWJNWFQrWkQ0eHpK?=
 =?utf-8?B?OUcwanYvNis2VDZwN2M5RittYTFUSmVBUjIxRWQrZXJuWjdQR0dtQ1B0a2FM?=
 =?utf-8?B?Rk5PS3IwUkdBNUFKUnpvZGRNeE51T2plcDJ2Y0crVk1BQ3p5NUh1MmNBUkxB?=
 =?utf-8?B?MFBxNHVLN0Nlbld3QURhSVRKQXErMFhsK3QzY210OTc2SVJTZXBURlNSbkFl?=
 =?utf-8?B?eGJ2N0tGYUZlNUJGMDYva1dqNUg0WlE3VGdtWVVpcmJWTVA4dHZxc0NSNUhn?=
 =?utf-8?B?ZUFESjFjU1ZEdHY1SHpuTTB0V1hlQ2JFYWJpczhGQmxWNlVxb0dmK2Fkd25x?=
 =?utf-8?B?d2E0Mm5SN1ZoanUvME5XU2k0ZG53dUhER3hhK0FhZUVTWUJKOGhFSkZhZEhS?=
 =?utf-8?B?ZW5YcjAwQ2FVQk4xcTBZNjJLRUZ5S1BCRDJaT0Y5QU1ManRXV2VKUEhOOXRo?=
 =?utf-8?B?ZUpYRVFVYVgxZ2Jzd0U1WjRzbzRHVU03M3VuRzBoamh6YTE3Z0xTaHhZSUND?=
 =?utf-8?B?NlZSRmZnd0ZsWklpZWxnT2pkeTErSDNFMDNiZXVGMDA2Ymw3NXRxVWtBTjJD?=
 =?utf-8?B?N045MzVGeFZrN1NKRGZsVFptd3hkaGU4ZTJjYnRyaFJrZGoxMEpkME1WL1pv?=
 =?utf-8?B?bE5BRDdWVEpYbjl3VUNQTHJGNkJTV2traE9oL2VDWWJKOGtuUW9SdVZ6akU0?=
 =?utf-8?B?cEUyekVnZnRmb3FkWmlUZEY5STF2Z0I3N2tyUDlrR3V4Q3FxRlZvbnZsOERm?=
 =?utf-8?B?TXFrWE94UkltS1Z3SjdCUE4xNFJra0tFUkI5bEdKZ012SnF5OFhQUzdaL3Aw?=
 =?utf-8?B?eUdaekpTVjdqSXk5WTVKTkZORy81cU9aanhIM3l5QkpYODJZWUlqb0U0ZXFn?=
 =?utf-8?B?TGZhTTR3b1pTWGd0THJXLzhHOGV2Ui9hVmsvUHVoSWhSTWROeTV2QVhGMDhh?=
 =?utf-8?B?ZkhROFVCa2tYRktWNzlGWVZBZ2hnVE91VTkyamFwblpvcTErMTUxYi9nam9O?=
 =?utf-8?B?VURZYUlIcEJHWEpZMXBoOXN6d1RUWThNQVJoM3dLR3MwUGZVNElydzZLMFEz?=
 =?utf-8?B?OUhDSVowZVY2Rk0xZXhYUjk0VlJFTURuQ3FjN3pGREZESUJBQWR3QVFpZjMv?=
 =?utf-8?B?REdxdmNPem9pcm1CZXp4QzRoVER1eU9BdFYwSm1HYks0TU1SbFp3blFqS1U3?=
 =?utf-8?B?UlpLYUhWbk9BaitSVXBpR2t2RnRJelZkN2JVTitha3haZjB3SWRPK0VUVU5B?=
 =?utf-8?B?NFRPZjVWZU05cGc2dmpBZzVkYmZxZGg2VjA4dnNMOUlZaG9aekhXOFF4TlF0?=
 =?utf-8?B?bUVrbE15OVlEN0FOTTVNWEdjVTduaEdrTTQ4MmlnOTRlMXNlbkFJdUtTMzNF?=
 =?utf-8?B?VlRHZ3ZNWFJLTHJYUURLWGZ5MGdxWnV1aUIrOStrUlNDc3E0TXZwMVV0d3pC?=
 =?utf-8?B?RnoyRWQwREZqWFJrUG44WWVrU3RGZml4a21qZnB5NEYxcnBBaEFiQms0SUJI?=
 =?utf-8?B?aFlGSVZheXMxOXVvUmRFc3d1NDBYMlJRanBPbm9UenBSMEQ2djdDUDAwTE5p?=
 =?utf-8?Q?glbDK1MVZ1dTp6jUJl3p3zlof?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(14052099004)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z20rL25jbDVSRWxoei9wVjN5M0pVc3kwcGJHR3YwUHJZem5rYjNhRmppZ2pY?=
 =?utf-8?B?THkyeVF0YWJNNkQ4VUFpMEFMN2t6UVZIMmR4OVdReTZkUktjSXBrbHd2V1JX?=
 =?utf-8?B?aUZlYk5nK1VVU3JZN205cS9lQ1RIQ0N2UGpVejVmMjZmRVAwQ3FERW9lcjhi?=
 =?utf-8?B?UnVKZkZ0b0IvOHBkd2RoOHFCUkt2R01DUHdqd0RWTVY4RjdnNHB1MTlDRnRi?=
 =?utf-8?B?USt5cTV6YVFGZ2s3T0xYZ2hGVTNkZ3VQWmJnVGJ0d0RaOXFhZklqeGtlbnFk?=
 =?utf-8?B?UUVKWWtIQWwxVkNYRFRHeHZTQ0dOazR6aHJEVjlBQ1FWL3NZK051dFY1cUN5?=
 =?utf-8?B?dHRibXk0QmF3RFY2eWxPeUxiK0lPY0w2enROOEYzYWRPN1RTcDRweGdsOUtS?=
 =?utf-8?B?cE92L0tpdTVTV2hLTktaR2wvOUFESElhVlR6TldqcjNabWQ5eEJPUVpxNm1y?=
 =?utf-8?B?eTNmUDQrYVA2bkZSZkYrWjJCVmwyOVF2VWtKN2krR2FJdlB5ZWpqNFNnZGZV?=
 =?utf-8?B?OC9jcUFLcGlzQTNYN3RzejMzaE5pOGhjZk1JSE9CMFBWVm5Vc3JHK0NCK0VE?=
 =?utf-8?B?SEEwejBNUmI1QmxmMHRRRWZmeTgvSGlFbjg0aDU5WFhwditOaGpZQVNDLzMw?=
 =?utf-8?B?dm9MSkZhQ3ZUZWxnQlNVNkNKVnRoYVVxZC9ZZ0t4dDBzYnVUSzdkWFB1Z2ZU?=
 =?utf-8?B?cFNOQlhDcTE4aGNLNWVEVkFYMlhUU0pQNHZkUnVNdTFxYlJlTy9nTEVSN2xJ?=
 =?utf-8?B?Wm8vSjNoMDQvZEFDYlJ4TEMyaUljUDZXRlhBTkJhZ3FTb3pDTEU3RHkxdHBm?=
 =?utf-8?B?VEh0YTVnVnRhTFJiREk3OCtQWEtMSDNpQmg0ZDE3ZHlnbW9ZSm9OWlorcG45?=
 =?utf-8?B?c2dmdGM2bFZOMDF0bEhLbnZsVzcxbzZpSk1Bczh5eGJPZkx6YklEbGpkK1Nt?=
 =?utf-8?B?eUc1VFh6VFdHZDFKWk9ySDBsMVJGTjE5V2ZCYk5xQTVCVGorQW8vazY3a2RF?=
 =?utf-8?B?WWppdkdOdC9BMTZ3SG5jSWJSd2lhSFBBZXQ3bzF2S1pHSkgzSy8zZUFnRnR1?=
 =?utf-8?B?Y2RpTTI2ZTN5VDVPT29mYm91TlFqNTBaemZTSDhYZTlhdDFZbjJBQW1PVGU5?=
 =?utf-8?B?TCt4WFhwb202YnZiTjg2V0VORjNyVVNXNXk5bmNvU3pOV1huUTB3bUdGcFlr?=
 =?utf-8?B?aUVoQ2lwN2ZmTXdZb0VST3JzNG1pYmo2Vnhzbi84ekZjRlgzNmJFZ2s4U1Na?=
 =?utf-8?B?R1lPZ09NbCs3M2Z2UFpnQjBBTzRTOCtUdTU5QmJIcmp5dUZvU0RYYzBlWFlP?=
 =?utf-8?B?L2diK2FDbG0xTDh4bEljaXd3YlZZUmYrVWQwMlM3K0UzWFA2cWpya1pkZHJy?=
 =?utf-8?B?QTdZMk85V2FMSlZQVTZHVzZJM1ZCL01hZjdsV2hkVVZjTWtJVUU0MlZkdW5G?=
 =?utf-8?B?aVZhWUhNQXhJQjVEVUJQdlM3amtjaHliVDZ0Mjcxb0FaTm9Lc0VEL0p2S1Jp?=
 =?utf-8?B?dnFkYUgyM1hFR3ByZ1pHMVpuRXJEc0dzWW8xSkRoVkZVNDQ3RVd5OFNlekFn?=
 =?utf-8?B?eFdGWk5jdHFXa0VjRXB1WjhKdlZJN0F2ZVQ0azRyZFl2QTNHQnphcVQ3anBV?=
 =?utf-8?B?OVVvenlzUFBxVHhaNGJUMTcwZklGZHpaNk1BOXZ2MkpqZUlzblVscHpCQjdS?=
 =?utf-8?B?ekFDK0lEdGsxUUNmcXcrcXJBcXBtY3VXZERzQWc0aER1dkVVWCsxN2lLUFYv?=
 =?utf-8?B?K0tkTlhZWWNkUUtRUTVINTBRMk9xMWZQSGR6UytSN0l6bE4vVkluTmJEQkFm?=
 =?utf-8?B?ajB3T1dmaDdUR0lPOU9zWnRjak40Rjl3bjJZOUNvSDdKbG01ajZBRXJ4TlZE?=
 =?utf-8?B?SzRJWURTQlBhZkFRZEsvb3pVa1psbk9YUHV0bXp2dGMwYmtkZTJ2c0lxdndi?=
 =?utf-8?B?bGNMYjV5ZC9YUjBncHUyc3J2SG5OMXlVanNzWmZSSnRBWmNpVjc3eWkvdnk2?=
 =?utf-8?B?dVVuOUVEVDVmSDZqdCtjb0ZQTERMTkUxaFRIcEtpd2FXYU9IdlBsa1RMV09D?=
 =?utf-8?B?R2EvYlkyK3VjTk5tYW5SYW5qVHRvS0RCeDkyWll1bDhNZ1N4a3I2ZE9ReHlT?=
 =?utf-8?B?WkJ6Y2ZxbzdVY2NjSmlLUnF0RXc5RUpZUTdBbmRCTVE4SlNtT1haSDhuOXl3?=
 =?utf-8?B?Z3pUYmlxelF0QUJoYkNtdTlaNlFQZXUrK3BFdWVzbFNqS0NvaHk5THFXRVZ5?=
 =?utf-8?B?Yi9VNzRDNnZVZ0dpYWxTdUlYOEQwTDREaWZCaU9hUkZWTXBxRVhiV1QxbjNp?=
 =?utf-8?Q?2n8f5B50WGpYywdxDj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414f2eec-1df0-4d29-7872-08de69226f2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 04:02:54.8036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kEgjlsG+8kocTqJUCEWyUlCzgUqR4aUEcV273opxYELHddflu+H00lW+ZGlKbVyl4tnIS3eUyl6shj3PNYOHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 04:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230962

SSBzdWJtaXR0ZWQgYSBwYXRjaCBvZiBwaWdsaXQgdG8gZml4IHRoaXMgZmFpbC4NCg0KICAtLQ0K
QmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdBUkUgVEVDSE5PTE9H
WSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENo
aW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiAr
ODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5k
dWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxMCwg
MjAyNiA3OjU5IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0
c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyMy8zOV0gcHl0aG9uMy1udW1weTogdXBncmFk
ZSAyLjMuNSAtPiAyLjQuMg0KPiANCj4gT24gTW9uIEZlYiA5LCAyMDI2IGF0IDEwOjAzIEFNIENF
VCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZyb206
IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiANCj4gSGkgV2Fu
ZywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgdGhp
cyBpcyBicmVha2luZyBwaWdsaXQgYnVpbGQ6DQo+IA0KPiBFUlJPUjogcGlnbGl0LTEuMCtnaXRy
LXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZg0KPiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29y
a2VyL211c2wtcWVtdXg4Ni9idWlsZC9idWlsZC90bXAvd29yay9jb3JlMi0zMi1wbw0KPiBreS1s
aW51eC1tdXNsL3BpZ2xpdC8xLjArZ2l0ci90ZW1wL3J1bi5kb19jb21waWxlLjI0MTI4MTknIGZh
aWxlZCB3aXRoIGV4aXQNCj4gY29kZSAxIC4uLg0KPiB8ICAgRmlsZQ0KPiAiL3Nydi9wb2t5YnVp
bGQveW9jdG8td29ya2VyL211c2wtcWVtdXg4Ni9idWlsZC9idWlsZC90bXAvd29yay9jb3JlMi0z
Mi1wDQo+IG9reS1saW51eC1tdXNsL3BpZ2xpdC8xLjArZ2l0ci9zb3VyY2VzL3BpZ2xpdC0xLjAr
Z2l0ci9nZW5lcmF0ZWRfdGVzdHMvYnVpbHRpbl9mdQ0KPiBuY3Rpb25fZnA2NC5weSIsIGxpbmUg
MjU3LCBpbiBjb2x1bW5fbWFqb3JfdmFsdWVzDQo+IHwgICAgIHJldHVybiBsaXN0KG5wLnJlc2hh
cGUodmFsdWUsIG5ld3NoYXBlPS0xLCBvcmRlcj0nRicpKQ0KPiB8ICAgICAgICAgICAgICAgICB+
fn5+fn5+fn5+Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiB8IFR5cGVFcnJvcjog
cmVzaGFwZSgpIGdvdCBhbiB1bmV4cGVjdGVkIGtleXdvcmQgYXJndW1lbnQgJ25ld3NoYXBlJw0K
PiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvNi9idWlsZHMvMzE3MQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdmFsa3lyaWUvIy9idWlsZGVycy81OS9idWlsZHMvMzE1NA0KPiANCj4gQ2FuIHlvdSBoYXZl
IGEgbG9vayBhdCB0aGUgaXNzdWU/DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+IC0t
DQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

