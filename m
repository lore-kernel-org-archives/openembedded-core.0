Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418C8C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:58:34 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.56])
 by mx.groups.io with SMTP id smtpd.web10.10172.1749725913120942225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ro75D3G+;
 spf=pass (domain: siemens.com, ip: 40.107.130.56, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OamuxgMiSozTg4MaN43Ib9QhNVy1BBhAMjl583NuK08aZ3U2U01ldMlqmp7g75j/+OybXUD5qCu+HvYd3aFL0z0kmRbDiQRb0FhS5YMAkAzhSt0Qxd+UDxeUp+T0Gyro4WHtpAwdu4Nmn5ZKLkS5uV45PwgXvmTMvEFcZu21sdQK7MXyWzNi30nWIj82wr6GJbW+xOc8bgbKBEbc2FyUJX1yuyffLwC9Ju8RoVQma5XJhn2c6/aJB4lV73OvGd7u4CV/DE8zLOfJlop0Ogz7hWVI12lEVK7PQj2Dbjlkrg04ObD2X7r5pK85o2tlUyT/N5Z9itQg3RNFY1Ihi0Qb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atmICK9IFn1sagUgKKddLxTWcC3EUS3Oa0+ZF4eUpN4=;
 b=mAJTS/oYc9hXmhmygwKhu4IADvh4mu8z/uYdkz9HWcfo8TEm/w9lPHsdHX/tN64J6w7nRzytL/F+7dAfyzCzF1BKAOU6DdG7aq9jhy0t/t98XjIyiMvsm1M/7mmOUc8fSQ7Y4qY7420X5PqytBFlTlZS0g8nW5GGbKFVehsdpg3wR55NFyziSiejsrsXoWauYNZ263MinFVc6c1+IDH08PLSmmSPIM4+c93MXgSzy1ss40A2A+UHrxySQttxJIR0oLP2gmqMR+Dq8KcVKYrjhU9LEUuNfOvTe1sBRT3sTF9GemvZPHl3Stbo5z7E5s4ypGclRXmGN9+wMqj1HSsS9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atmICK9IFn1sagUgKKddLxTWcC3EUS3Oa0+ZF4eUpN4=;
 b=Ro75D3G+4Rq0IVNeB6YCPky8GPDgTJp4+KeEs6w+LDeJvBLc7M/3vxTNXYVqLSVa2Dbr/KzlaTuOF/QeqUCfgp48KpZY7hUTzD1IDMRpZOk7XsRWKxve677HD8ds5ZE9AK7WqOxbOMre/HVw6ZX2sFGlZztIUVw7hYOMQM4jvibGIj6/G2vTDmWUd1jfXcGrz/ENRgShgFoFGXBEBDQTNcm10xjSuUm30Oq8UogwLYfB8E1vniOgENMwEl6OS0zLz/AfMERDMkieJWKNt9gEukJ+9sw6DMv06RGh9vxF7dliDhtlTQPXzcWXKDUZJ834Z9SXjZpNeiToYiLDAqqp0Q==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB8PR10MB3863.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:168::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 10:58:29 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 10:58:29 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "jamin_lin@aspeedtech.com" <jamin_lin@aspeedtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "troy_lee@aspeedtech.com" <troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v1 2/2] uboot-sign: Make SPL DTB public key
 injection optional
Thread-Topic: [OE-core] [PATCH v1 2/2] uboot-sign: Make SPL DTB public key
 injection optional
Thread-Index: AQHb1rNmZJB/dcETz0aei2BTgYIc5LP/ZHMA
Date: Thu, 12 Jun 2025 10:58:29 +0000
Message-ID: <23eebbbd0b82a36fa0bebbe28ff98fe59d0267a8.camel@siemens.com>
References: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
	 <20250606071915.2680182-3-jamin_lin@aspeedtech.com>
In-Reply-To: <20250606071915.2680182-3-jamin_lin@aspeedtech.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB8PR10MB3863:EE_
x-ms-office365-filtering-correlation-id: f05c254c-e2c6-472d-4325-08dda9a0106c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RE9JcFNOSXlRd2tpS2E1Y3MxeXg5aGJjcjVPZGhNZ1dQUkg2dW8yWlB2TDdW?=
 =?utf-8?B?bFp1WC8xN2xVT1JHanJ0bUhoNU91eThCdERzVW50ckhtUjg3eVJSUStGN1Vm?=
 =?utf-8?B?MExHbXRoSHdEYTlxcmFJMEJyOGxLMS9HcVBZZUNZYk1ZZGQrYU80elR6cml5?=
 =?utf-8?B?aEtwUDB3QkhlVFJzRzExVlBVYkkya2U2UjllNVJjR1lVSHlzRitIR00waCs4?=
 =?utf-8?B?VmZtTkVDWGJtY0F4ektYdHBJNnRtZzRyS0dPZ2d2bTU0S2hhamlYSitnZzNQ?=
 =?utf-8?B?Qmx2dGxVSlVUaUJXNUNUMmhVNS9YREIvYXRPY1F6ODJCUGVhZnI4czV4N2g3?=
 =?utf-8?B?R3ZIUitlWHpyZzNrcGF3aGhKbFFGQzQzb2RmSWdPcVZ0bVQzV09QdWI2RnRw?=
 =?utf-8?B?cHlTbzRhT1hmS3YyYVdLZEU4d2grM3NXanBkUnMzV3BEanI0aG9yZHRYeWlp?=
 =?utf-8?B?bUFXODhOWTJFUmFwZWU0YjZPMTNIS2ErQytxdFNuaThjRkYrWmJNV3V3MkJa?=
 =?utf-8?B?YzZPWm5ZVENwd0hQODRGeHRuS2FLQmhLRmUreTRUaWNCaDExdFVvSzBUOWRP?=
 =?utf-8?B?TUlGUktxYTRUbW1hZmM4QS91NFdoODVUejdLYjN3bWF6cnhMNUFFZzJlSHBV?=
 =?utf-8?B?V3hmS3N0ZmFOcjM0aGNxc3ZSc3dCb21ya0FTQXlzZVNJWE83Znd6MEtrb0J6?=
 =?utf-8?B?VkwwRTJNY0dEZjJNVVpnQVJvVGNnc3VwZ1hlRVR4UjlpMjZGWGdCYXR6R2FX?=
 =?utf-8?B?RVVKYzhQaEM2OGFaY09Ga01LWUdEOWMzN2pEOXE4d25HemM3ZkNRQnJnQ0VH?=
 =?utf-8?B?RitzNDBuZVNzVWlrRmxVazhSSUN4MjBSRXZwUWZIbnN6TXFXbGNHMTlFQXhv?=
 =?utf-8?B?K20zYjQ3aUlKbGtINDRJUjZ3SGwrT3JaV0Z4TnlEVVdCdmVSSDc5WElhTGE4?=
 =?utf-8?B?dWorUVNoeWFlOWN4b0c1YWVRMTIvVHZjTnpJRVJQUVhlNWFNSnVVME9NeWZF?=
 =?utf-8?B?Y2VBQ2hhNmVGckVjdUhTNkdlWjRxYkJLTHV1NDFIZm5tZ3JuOXMwN1ZnVUVT?=
 =?utf-8?B?Ry9BN1ExU2dOcytLY3B6NGF2SXdyVnhJaHZkWXd3TTZXa20vZTBTUEN2S1hJ?=
 =?utf-8?B?cExiRmUxaUNXbFduTWNpcUx6MXQ1YkF0cTJ3QUE1RVFFNFIraTE2d1RuUzR2?=
 =?utf-8?B?cmNadDB0RjdVWGxOTHBGUk1yN3RUR1lCY2t6VTNmL2lJSSsxYWhZaTcvcnJa?=
 =?utf-8?B?eGwxd2p2WTNUTEFDZFF6SDhxYmV0YkpOQ1piTFhZNnJvTDNpYTN5YUE1bzFs?=
 =?utf-8?B?ZVpuc2pLRkFydlUvVmgydjBZc0ZtcWVCWjQ4R3RWQ1FJakprNlBVRUZoenBa?=
 =?utf-8?B?Q2Y1TzVDTFNPWDA2REFtbVBBU2p2akZ4UWwwQ0lOVUZJbzcwOHJEQlA4aEUy?=
 =?utf-8?B?cEtlbm16MXNEMWpOZi91aVFsVTdYQ3JLaXlOZElqaGV4VGU3ME9XaTFTQ0dk?=
 =?utf-8?B?dDY1UGplQlpkVlkxUGJSclVnQmN5OUdkZGZNYzNFNGpsMkZtVzFCL3E2Zzlk?=
 =?utf-8?B?b3hhb2VQMnd6UkRJTCtzTlFjRzcyb3BHWldHTk5YbDhBb1JzM2czajA0cENV?=
 =?utf-8?B?bHVGQmlVdFAzZ3FlTElESlUwQU1YQktITnRwcVgzL1hML0RUbUtvQ1JIcFhN?=
 =?utf-8?B?OUI0U21ocnhWajJqZjhTM05Gd1VpU2xSMGpsZjd6K1RLeE5TN2pETFAydkhs?=
 =?utf-8?B?MEEyeHVuc0N4ZDlHR0c5S0VOQzBXQytaRWxqeXRpNndCd0htNWg4bE1wdlc3?=
 =?utf-8?B?a3ZQaW42MU10WmdGWVVGYVdKcTQreDlPU2lJQ0xXUmVuWmNmZVhMbXYrR0lq?=
 =?utf-8?B?Q2lFeEdBVmU2VjFBMmliN1FEaWw3M2FVUTVZaHR2dTVETE8wSUtYa3VQcnN3?=
 =?utf-8?B?N3dscGMvWUM1M2ZjZWJnQjV4VEJmblE5a2xTQktxZFZrRUxUemhUaFNJZnVn?=
 =?utf-8?B?MkljTVJPcUh3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TWRkRjZVWG5DM2dlODBEY1lMdXlRRFVDRk5kMDFJVW5RMExGemRSUDBFQmhV?=
 =?utf-8?B?Vjk3Y2V3K20vUXd3ZW5SRVFrR3lmT215RWpkeldTbkRpd1lacWIxamNKSm9r?=
 =?utf-8?B?ZXhQNllXSndxM24yZFpXVDFsU1ZFejEva1V6cFhRR2U3U0p1amhCOS9KNldu?=
 =?utf-8?B?MUZ2eUVIaGtadWplMW5BTkFMY3dFY3l5ZXowYXJINWJlbGNGbEtCaU1oL251?=
 =?utf-8?B?MGplT3BHV1A5ZVJZYXVJQVkyYnY0QjcrQUE0T3RIM2FnM0pwZWtuMFRjZEY3?=
 =?utf-8?B?cFVad3RrMFVPNzBRTXBWN3lHTGZJTzFiaWtRTUE2WGNGQjMyeGFEQ0o0YnRW?=
 =?utf-8?B?L09ZOWhsQWJCQ0VsOHp4WjlHVlB3VWsvbTlDeTRlbFB0ZElUUHllQ2pERnVM?=
 =?utf-8?B?OVAycXMzckc4Zk1LMXRxV3BVSWg0TklQV05EYzlWMjE3NktNMWhnaUdjWXZN?=
 =?utf-8?B?djg4WUZuMnNkRXdVbWV0eEorWmcvQmtVWVQydlZUSjd6Nk1GSGNDMDVsWWRk?=
 =?utf-8?B?VjlNRHU2ZDJNbmNaZVZaS0w1V3RIS2lsYm1kbVA5Q0RDdzNWeiszSVJ0K2Zy?=
 =?utf-8?B?S2NydDhXZFh2ejk3THFsZnJYTEx6Z1BkeGlqa1RiZzExcmk0Z1d0djlhRHlz?=
 =?utf-8?B?R0RQd25rZkFYUUpycU11VDQ5V1hsdGFoVzZuY3owcUsrT2xWaWFZNDNYSzBr?=
 =?utf-8?B?Z0xycENzVHVUK3FlMjRiOW12NFhjZXVNcFl6NGE1Vm5xWUw0NWZUeXVsYlps?=
 =?utf-8?B?ME4vanFMYWxLejh0V1JCVWMvNExhLzRhOXZKMFVRT01JVkpkTmthclpBRnFw?=
 =?utf-8?B?UjRzT21HckVyT1hERzc4V082bURUZlVWOVlDck14a3RVek0yNFM2NVhDeERj?=
 =?utf-8?B?aFhsTXROenV5RmNzcDZMaVUraWZJQXJiRm9yNDYyTHRvUExibFY2UHlQZlZt?=
 =?utf-8?B?WkhGL2IvY200R0VPdDVjc0MrQ1lqblF5aVdSK01HK2xkUUdUYzMvV0MyaXZu?=
 =?utf-8?B?MVM5dUdTOW12MEY3Q2lSdXpXYzJ5QzlxQnZqSEhTcTJDUVFtSEVTZlJkSThy?=
 =?utf-8?B?a3BFRzBsZXZBLzluNGJBZjErT0dNYkh2VzJaaTZ0QTZJdnpTYXZmRnZMdW1L?=
 =?utf-8?B?dDFFd3ZlMkZXOUg2bkpjczk4aGdsT0ZVZ05JTU0vK0dMU3FrMlFWdmdwSW1B?=
 =?utf-8?B?aWFURTVzQi9wdFNFVExwZlFyQTNib2lzSXNXc2g2a3NaTW1hY2ovelQ5Tkc5?=
 =?utf-8?B?Z0Z5OS9maHpOdGhlcUxSNnhQVk1LREJpWXg1NnE5L3JldVY3Q2J0M21JTW44?=
 =?utf-8?B?VjIyWjZlcEkxb25sZlRRK0xUKzZTWjBmbzlpV1Zra0xXWGV4Y1U4d3RQOEpo?=
 =?utf-8?B?MHhBaGt2WG5TVE91N3F3V2tvTHUremk3b25VNmxYRlFGOVlwNjdoTXVNYzAy?=
 =?utf-8?B?eUtlTTBjWmU1ZW9Vb0YyZTVQdVdTVklvTlBJUXlTNFp6OTlCSUFsR0t5NTFZ?=
 =?utf-8?B?Y2lIRDRnVFRWdkJwWTFrcVExTmhQOXJJa1JNd0F3dEcwNllhUFBJMW1WbStN?=
 =?utf-8?B?UW1ydWxaaGIvUTVkMXR1MGh4RHZjS3UxMFI5YVBIQ3hId2FQZWQ2akVwUVFG?=
 =?utf-8?B?S256YzZyNldUR1RZVkZoV3pYKzNGSi9vQUZXOVlEWFVrS1NDN1hJbFBobC9a?=
 =?utf-8?B?V0R3TG0vYkV6VWREc2tkNXlRZTIvaFFMeGJHdHhYVit1dE9GR3cxQnVhNWNj?=
 =?utf-8?B?UGtoNHhRUm10dmx5UlBoeVkvSGVqMDZ3cGF6QktFdnpqOUx1Vk5SbEk2azZN?=
 =?utf-8?B?dXg2MWZES0VjUmIxWUdSYW5TQUhqSW9UdnkyUTFYREVyQWRDTVpHNUQ0WnNm?=
 =?utf-8?B?blJUcURXV2pEZTNoajg1YVFLUjZlOVpHYlZLMXdCSkp6S0ViWkc2dkt6Y0hr?=
 =?utf-8?B?QW9CenlRYnVTVUJMRWw3emhpc2QyTTNteUQwR3VlRHhkVmtqNHlQUTRMYUFo?=
 =?utf-8?B?dHZGaDVvQ1lvVzhQY1czL010QmdHYmRIb1UzV3d3MU5PRitCZXJCbU15Wmc5?=
 =?utf-8?B?M1g5b3JLZ3doSVpja0I5dC94NWhBSE54THVWKzZQSzc5WHBwS0M2czNJQ0JP?=
 =?utf-8?B?d2pDa2l1WkJFR1ZsL3ZIenU2Q3JZT0FTckhFMzJiM2JubkwwQVIyL2xwRWc4?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89FF4E4745755343B9C6750BBC7B3BF6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f05c254c-e2c6-472d-4325-08dda9a0106c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 10:58:29.1319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zeSvQ/4LIirc+KYl9Xv2UKhCQLPKGU2itU07Rbsvh2xfVLN2p5h41D8+C3zLWCITmbOyplsetexjtcvOciSr6aebFEERxSakExgkp/sp4iM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3863
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218509

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE1OjE5ICswODAwLCBKYW1pbiBMaW4gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcKd3JvdGU6Cj4gSW50cm9kdWNlIFNQTF9TSUdOX0FERF9QVUJLRVkgdG8g
Y29udHJvbCB3aGV0aGVyIHRoZSBwdWJsaWMga2V5IGlzCj4gYWRkZWQgaW50byB0aGUgU1BMIGRl
dmljZSB0cmVlIGFuZCB3aGV0aGVyIEZJVCBzaWduYXR1cmUgdmVyaWZpY2F0aW9uCj4gaXMKPiBw
ZXJmb3JtZWQgYWZ0ZXIgc2lnbmluZy4KPiAKPiBLZXkgY2hhbmdlczoKPiAtIEFkZGVkIFNQTF9T
SUdOX0FERF9QVUJLRVkgdmFyaWFibGUgKGRlZmF1bHQgPSAiMSIpCj4gLSBDb25kaXRpb25hbGx5
IGFwcGx5ICctSyA8ZHRiPicgdG8gbWtpbWFnZSBvbmx5IGlmIGFkZGluZyBrZXkgaXMKPiBlbmFi
bGVkCj4gLSBTa2lwIGZpdF9jaGVja19zaWduIHdoZW4gcHVibGljIGtleSBpbmplY3Rpb24gaXMg
ZGlzYWJsZWQKPiAtIFN1cHByZXNzIGNvbmNhdF9zcGxfZHRiKCkgd2FybmluZ3MgaWYga2V5IGFk
ZGluZyBpcyB0dXJuZWQgb2ZmCj4gCj4gVGhpcyBhbGxvd3MgVS1Cb290IEZJVCBpbWFnZXMgdG8g
YmUgc2lnbmVkIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBTUEwKPiBEVEIsCj4gdXNlZnVsIGluIHNj
ZW5hcmlvcyB3aGVyZSBwdWJsaWMga2V5IG1hbmFnZW1lbnQgaXMgaGFuZGxlZCBlbHNld2hlcmUK
PiBvcgo+IHBvc3QtcHJvY2Vzc2luZyB3aWxsIGJlIGRvbmUgc2VwYXJhdGVseS4KClRoYW5rIHlv
dSBmb3IgdGhlIHBhdGNoLgoKSW50cm9kdWNpbmcgYSBuZXcgdmFyaWFibGUgaXMgb25lIHdheSB0
byBzb2x2ZSB5b3VyIGlzc3VlLCBidXQgaXQKaW5jcmVhc2VzIGNvbXBsZXhpdHkgYW5kIHJlcXVp
cmVzIGFkZGl0aW9uYWwgdGVzdCBjb3ZlcmFnZSBhbmQKZG9jdW1lbnRhdGlvbi4gU28gSSB3b3Vs
ZCBsaWtlIHRvIGFzayBpZiB0aGlzIGlzIGV4dHJhIGNvbXBsZXhpdHkgaXMKcmVhbGx5IG5lZWRl
ZCB0byBhY2hpZXZlIHlvdXIgZ29hbC4KCkZvciBhIHNpbWlsYXIgdXNlIGNhc2UsIHdlIHVzZSB0
aGlzIGFwcHJvYWNoOgoKICogYml0YmFrZSBhbHdheXMgc2lnbnMgd2l0aCBhIGRldmVsb3BtZW50
IGtleSAobm8gYnVpbGQgdmFyaWFudAogICBuZWVkZWQsIG5vIGV4dHJhIHRlc3QgbWF0cml4KQog
KiBUaGVuIHdlIHRlc3QgdGhlIGZpcm13YXJlCiAqIEZvciByZWxlYXNlLCB3ZSB1c2UgYSBzY3Jp
cHQgdG8gcmVwbGFjZSB0aGUgZGV2ZWxvcG1lbnQgc2lnbmF0dXJlCiAgIHdpdGggYSBwcm9kdWN0
aW9uIHNpZ25hdHVyZSAod2l0aG91dCByZWJ1aWxkaW5nIHdpdGggYml0YmFrZSkKClRoaXMgc2Vl
bXMgc2ltaWxhciB0byB5b3VyIGFwcHJvYWNoLCBidXQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeQpp
bmplY3RpbmcgdGhlIGRldmVsb3BtZW50IHB1YmxpYyBrZXkgaXMgcHJvYmxlbWF0aWMgZm9yIHlv
dXIgd29ya2Zsb3cuCldvdWxkIGl0IGJlIGJldHRlciB0byBoYXZlIGEgcG9zdC1wcm9jZXNzaW5n
IHN0ZXAgdGhhdCBzaW1wbHkgcmVwbGFjZXMKdGhlIHB1YmxpYyBrZXksIHJhdGhlciB0aGFuIHJl
cXVpcmluZyBhbiBlbXB0eSBEVEIgd2l0aG91dCBhbnkgcHVibGljCmtleT8gVGhhdCB3b3VsZCBt
ZWFuIHRoYXQgdGhpcyBwYXRjaCB3b3VsZCBub3QgYmUgbmVlZGVkIGF0IGFsbC4KCkFkcmlhbgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbT4K
PiAtLS0KPiDCoG1ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzIHwgMjAgKysr
KysrKysrKysrKysrLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL3Vib290
LXNpZ24uYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy0KPiByZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNz
Cj4gaW5kZXggNmVlMTg3NGNkNi4uM2JjZjQ3ZGQzMyAxMDA2NDQKPiAtLS0gYS9tZXRhL2NsYXNz
ZXMtcmVjaXBlL3Vib290LXNpZ24uYmJjbGFzcwo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUv
dWJvb3Qtc2lnbi5iYmNsYXNzCj4gQEAgLTM0LDYgKzM0LDEyIEBAIFVCT09UX0ZJVElNQUdFX0VO
QUJMRSA/PSAiMCIKPiDCoCMgU2lnbmF0dXJlIGFjdGl2YXRpb24gLSB0aGlzIHJlcXVpcmVzIFVC
T09UX0ZJVElNQUdFX0VOQUJMRSA9ICIxIgo+IMKgU1BMX1NJR05fRU5BQkxFID89ICIwIgo+IMKg
Cj4gKyMgV2hldGhlciB0byBhZGQgKGVtYmVkKSB0aGUgcHVibGljIGtleSBpbnRvIHRoZSBTUEwg
RGV2aWNlIFRyZWUKPiAoLmR0YikuCj4gKyMgSWYgc2V0IHRvICIxIiwgdGhlIGtleSB3aWxsIGJl
IGluc2VydGVkIGludG8gdGhlIC9zaWduYXR1cmUgbm9kZQo+IG9mIHRoZSBEVEIKPiArIyBhbmQg
Zml0X2NoZWNrX3NpZ24gd2lsbCBiZSB1c2VkIHRvIHZlcmlmeSB0aGUgc2lnbmF0dXJlLgo+ICsj
IElmIHNldCB0byAiMCIsIG9ubHkgc2lnbmluZyB3aWxsIGJlIHBlcmZvcm1lZCwgd2l0aG91dCBt
b2RpZnlpbmcKPiB0aGUgRFRCLgo+ICtTUExfU0lHTl9BRERfUFVCS0VZID89ICIxIgo+ICsKPiDC
oCMgRGVmYXVsdCB2YWx1ZSBmb3IgZGVwbG95bWVudCBmaWxlbmFtZXMuCj4gwqBVQk9PVF9EVEJf
SU1BR0UgPz0gInUtYm9vdC0ke01BQ0hJTkV9LSR7UFZ9LSR7UFJ9LmR0YiIKPiDCoFVCT09UX0RU
Ql9CSU5BUlkgPz0gInUtYm9vdC5kdGIiCj4gQEAgLTI0NSw3ICsyNTEsOSBAQCBjb25jYXRfc3Bs
X2R0YigpIHsKPiDCoCBpZiBbIC1lICIke1NQTF9ESVJ9LyR7U1BMX05PRFRCX0JJTkFSWX0iIC1h
IC1lCj4gIiR7U1BMX0RJUn0vJHtTUExfRFRCX0JJTkFSWX0iIF0gOyB0aGVuCj4gwqAgY2F0ICR7
U1BMX0RJUn0vJHtTUExfTk9EVEJfQklOQVJZfSAke1NQTF9ESVJ9LyR7U1BMX0RUQl9TSUdORUR9
ID4KPiAiJHtTUExfQklOQVJZfSIKPiDCoCBlbHNlCj4gLSBiYndhcm4gIkZhaWx1cmUgd2hpbGUg
YWRkaW5nIHB1YmxpYyBrZXkgdG8gc3BsIGJpbmFyeS4gVmVyaWZpZWQgVS0KPiBCb290IGJvb3Qg
d29uJ3QgYmUgYXZhaWxhYmxlLiIKPiArIGlmIFsgIiR7U1BMX1NJR05fQUREX1BVQktFWX0iID0g
IjEiIF07IHRoZW4KPiArIGJid2FybiAiRmFpbHVyZSB3aGlsZSBhZGRpbmcgcHVibGljIGtleSB0
byBzcGwgYmluYXJ5LiBWZXJpZmllZCBVLQo+IEJvb3QgYm9vdCB3b24ndCBiZSBhdmFpbGFibGUu
Igo+ICsgZmkKPiDCoCBmaQo+IMKgfQo+IMKgCj4gQEAgLTQ3NCwxNSArNDgyLDE3IEBAIEVPRgo+
IMKgICR7VUJPT1RfTUtJTUFHRV9TSUdOfSBcCj4gwqAgJHtAJy1EICIke1NQTF9NS0lNQUdFX0RU
Q09QVFN9IicgaWYgbGVuKCcke1NQTF9NS0lNQUdFX0RUQ09QVFN9JykKPiBlbHNlICcnfSBcCj4g
wqAgLUYgLWsgIiR7U1BMX1NJR05fS0VZRElSfSIgXAo+IC0gLUsgIiR7U1BMX0RJUn0vJHtTUExf
RFRCX0JJTkFSWX0iIFwKPiArICR7QCctSyAiJHtTUExfRElSfS8ke1NQTF9EVEJfQklOQVJZfSIn
IGlmCj4gZC5nZXRWYXIoIlNQTF9TSUdOX0FERF9QVUJLRVkiKSA9PSAiMSIgZWxzZSAnJ30gXAo+
IMKgIC1yICR7VUJPT1RfRklUSU1BR0VfQklOQVJZfSBcCj4gwqAgJHtTUExfTUtJTUFHRV9TSUdO
X0FSR1N9Cj4gwqAgIwo+IMKgICMgVmVyaWZ5IHRoZSBVLWJvb3QgRklUIGltYWdlIGFuZCBTUEwg
ZHRiCj4gwqAgIwo+IC0gJHtVQk9PVF9GSVRfQ0hFQ0tfU0lHTn0gXAo+IC0gLWsgIiR7U1BMX0RJ
Un0vJHtTUExfRFRCX0JJTkFSWX0iIFwKPiAtIC1mICR7VUJPT1RfRklUSU1BR0VfQklOQVJZfQo+
ICsgaWYgWyAiJHtTUExfU0lHTl9BRERfUFVCS0VZfSIgPSAiMSIgXTsgdGhlbgo+ICsgJHtVQk9P
VF9GSVRfQ0hFQ0tfU0lHTn0gXAo+ICsgLWsgIiR7U1BMX0RJUn0vJHtTUExfRFRCX0JJTkFSWX0i
IFwKPiArIC1mICR7VUJPT1RfRklUSU1BR0VfQklOQVJZfQo+ICsgZmkKPiDCoCBmaQo+IMKgCj4g
wqAgaWYgWyAtZSAiJHtTUExfRElSfS8ke1NQTF9EVEJfQklOQVJZfSIgXTsgdGhlbgo+IAo+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTgxMTQpOgo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE4
MTE0Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTEzNDk5NTg1LzM2MTY4NTgKPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+IFVuc3Vic2NyaWJlOgo+IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbCj4gYWRyaWFuLmZyZWlo
b2ZlckBzaWVtZW5zLmNvbV0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IAoK

