Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 946C3C3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:05:45 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.61])
 by mx.groups.io with SMTP id smtpd.web10.560.1747674339567637252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 10:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=H50lCfbV;
 spf=pass (domain: siemens.com, ip: 40.107.249.61, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=No3Fq8suFhEIlg/3r2U8aBnoxssmzCeNTN03sKkWzJeOx0z9FswZKmUapVRPogMFazxH8svNVFDC10qmaOIR8KVs6a/0JyeWUox1p3SSAXsuf/UeTaOZGUOy8ciBT9AftxlM/5eBS51TJtXjc3C5CJeOK5xdd+FnhYwqLvCY4vede4sEAGCZl6mo6Zl+Kep+kN+aUUlzq7ejr3hb0ded50Yi5fsMkdCjx5J8CLpedK7E/OWZl1hLObl0hNMWGzd6XCUpj1+AvhCa5vMxAhlpA5nwLgFXo/QELQBZaRKFUqZwmQtVkJ+NwHEZoomRmXMULvflKr3zaDNm287+xr73LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYngBqBrdQAQqud2yx2pdWzZRrt1NSFp5n3Egi7YNkI=;
 b=NlKl7/aTqUqSR+asyZD4S4GFVDEvccKY1BT+oeQDprqOLKqsx5waF9aYyBMzjsgGK1QfagYKPYPMWO76Jjd9zQiSVSehZ4KD1OhDjtQUNzxK+cs9KN4UPx5m6m8rSdCENqiw75xK10xbSoVBEa4pK6cLo0A/1AuTMOyfQmB0bdzhm6LAv+0/tC2sGRpxcyD1Egzrs+alVrAQRjwkA0tXr1GRtaHzoz9Qlel/teIVa/UGG26HRip6aTh8gP92X4Txw+jmKMnvKIu/EKDgsABEOi0ehaHbXrdgNC/9+ivgJCLpwoI4NfqNYk6krtnzJguVoDX2krvjBoANnZXxA5rQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYngBqBrdQAQqud2yx2pdWzZRrt1NSFp5n3Egi7YNkI=;
 b=H50lCfbVtqNFBN+omh4DUkR07Ojx00rAKvp1nc4bk1m0Qc793ZZ6ryaBgL4tMWbYSPzZbRxaIee/94aIB926LdpJ6zk//PqhuuEDKASVdOJFCIjUEdFKjrR8KWtMgdOihh3oRvAuRPYgznIWljX77SUqXJCv/6KIG7ZTxn3h1iCo4XSRnNJUMBdhE8wieN+rwINospT3OPLC7oA84Q8HTrXn7bsmnebUNu6s+k9mbtTaB+OowwXJEInyU/kAw93CITaHZzix5JsKM1AmQHFHTmCRoV3xcFly54bVNa9+dNM+dancDYFwmroPvzwSxNCUjVGTBaptjloP+9UsrtRDnA==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DU4PR10MB8424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 17:05:36 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 17:05:36 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "Oliver.Rohe@wago.com" <Oliver.Rohe@wago.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Topic: [OE-core] [PATCH] kernel-fitImage: allow overwrite the
 configuration dtb label
Thread-Index: AQHbxlwJ3kd3lvqCT0yrzOhlqhd1qrPaM8CA
Date: Mon, 19 May 2025 17:05:36 +0000
Message-ID: <f5080c649ce5d0f214dfdbb69a25449923b2948b.camel@siemens.com>
References: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
In-Reply-To: 
 <DB4PR08MB8102C882795C5B8725105A0F9E93A@DB4PR08MB8102.eurprd08.prod.outlook.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DU4PR10MB8424:EE_
x-ms-office365-filtering-correlation-id: e5c832da-62aa-4f6d-e9e2-08dd96f75fd5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VkdkU05od0lIRWduVlpqdHZLV3lHZ01ZNWJOcHFKdGVOeStOZWYyckpiak1U?=
 =?utf-8?B?VG9lOFgvUFF3QThyOU1uOE5nOVpPOEg4cXZVWDNnRERtU2toV1RaNmV6UFJu?=
 =?utf-8?B?OVpxckRjSlp5YTRhaTllWG5BN1hIM2pIRXV4WlJ6bi9RcjFxVGpsYTMvY2JW?=
 =?utf-8?B?dWIydHRsRjZZajB1SUpnTUFhaVBxU2VjVzVCL0NtOFZyVys4KzZjbGRCYW1O?=
 =?utf-8?B?K0gxcHJ5eFo3QVJDTUd3WEs1Z1dkZmFTVVpmT2JxS3BLc2R4UTA4WUkxbjZk?=
 =?utf-8?B?Qm0xTjJId1FGRDRlM1J3N3pwOURrTEt6ZVNqbzdKS2tRdE9nYVlMWEdFWWJn?=
 =?utf-8?B?QUpVd3JNRHFTRFhiYy82OFFtUDEybUpQdWZEVEVrTDgrbGlVTWdDRGdVcXps?=
 =?utf-8?B?a2tmZklCeHREdUJaVzRDNTRQZW1oazFCNnFTL2dQUktOaEp1ZC8xQ1IxQ3Rx?=
 =?utf-8?B?dWVQbXhDUVJmRGpHL3VzRkhtSzQ1WTRWbUFXbTRiajR1UUVGaXJzcWFNNndO?=
 =?utf-8?B?ai9lWFJZWTZJTHZXZlRnckVjdDZ2SDBMbUdiaElQcC9mV2NMeFNwbEtoaVZ3?=
 =?utf-8?B?QTJQY2RJZ2RSS3RneGNJdnBseW5veXV2R0N0QkJ3T1RIcmxhQm9PbUhaWDg4?=
 =?utf-8?B?OVhFS1BMNG56aHNSNURZZTV5NUxlMjFQMGJkTkZVYml0N1VINHYyOVAyY0ps?=
 =?utf-8?B?R1haN2lOVWE0eHVaVjhjU3JuMWhZeHcwUmFBa2RDOVJpYmVoUys4SVFOSVhu?=
 =?utf-8?B?dExsNkdpNkQ2L2hjQkNhVlRyTzFtUEFRK3dFZGNjT29tdjludjZiQ3RmbkY1?=
 =?utf-8?B?YWFnc1hqcmJDd1hmR010WjZIenBPSmJwOHJmemFFdFpYTFFqekZRRXhIbTZ0?=
 =?utf-8?B?bjVxT3VCbjl3YmJ2dno4MWhUeU0xeDFpVFZlME5rc0E0RWV2aFFXd1prdkZv?=
 =?utf-8?B?aDEreHpMVXpYSGxHR0E0cml0T2xibkxmOXN0R0d6dDFrMkQ0QlE2d3NxTURU?=
 =?utf-8?B?WGJXb3YvV2d1MXNCUXFYT2hEVlVMSzh2eXJvdUk3TWRUa01RRU40Y3NuV1ds?=
 =?utf-8?B?TklJM0JtZjh3M1ZIbTF6ZUdsZ3hqSmFDQTRQbHFxMTY3bjkvUTMyUUcyOW5J?=
 =?utf-8?B?V1JEM1lPRXllbmJwTGQwd3dvWFFyZVZoMk5KNWdUK3JuWlVQUStMdHU5MmNP?=
 =?utf-8?B?Q01EejBOVkhtK0lCeXVPWXZMK240Z3ByTGxrc1FvVG1ZTHdYVTk3TGF4Q3pm?=
 =?utf-8?B?UmQzWm1ZV3BqWTdnNFp6eDgyc1dTS0tmN1R2QzByczNHM3UwR2M3Q1VkSy8z?=
 =?utf-8?B?VUZKakIvN1RUbW5Ld0JRM29PdjJWMnFhN0hGWkJXaGNKTzByZ3M2dUVKZnRL?=
 =?utf-8?B?NFduZlBOTXJWTEJnOS9mWC9pRE0zM202WGlFcFpxcmY0Tmo1V0xPMnFkeWxl?=
 =?utf-8?B?d3dFbFNPdWFEUUZQL1krajdKM2hVTnJ3L1h4Q1hha3ltSWE4b0xKQVlhUi9X?=
 =?utf-8?B?a1lOQ3pybFdxSjA4YmE4Rk5Zc0RuWFZOVTVFalJDR0pMaWwzUS9hWlpwVHNR?=
 =?utf-8?B?QmpIT2N4RVZHSloxUXJxUEJFaFUyNXgwazlSR0VRdURTMmM0M3RPZUVhalp1?=
 =?utf-8?B?bTFYVmtSYjBNVDZHQ2Z4VG1zcmhKc1Rvckh4WGlzVzZLM1psV1FRMlFyMjR5?=
 =?utf-8?B?bENPMU9yZ1VJSWl3Z282WGhITC9hWkRHdTNqOE1IYWRZaGVvZlU3bkNFdmRF?=
 =?utf-8?B?TVZLS2dUMlk5Umx3Tk10OG1oUnNzY3lJaVh6S0xTYWJzY0RDbUVUZXNlTkRz?=
 =?utf-8?B?amNnSTk0TU5sT2pjSGNtbTZ4bmRuRkJaL0lBTjRZaW0ybmFDbGNiTDBRbUdB?=
 =?utf-8?B?a0UzSGZpR2Nua2tWVFd1SnBKTFUyNWduV241Q0NvTmd0RDlNSWZtblhJWXpO?=
 =?utf-8?Q?BVJZ9LKHfsI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eG8rSUJUeGd6VzhFUklyODR1bHp3YlRseW50bnJSYjdCUWVSd3ZxK1RpKytI?=
 =?utf-8?B?NFR4REFpS3B1RDBOVnpCL09ZeUVnYWZ3anFSVDcyMXhBWXBKaFdEbm1RUzIr?=
 =?utf-8?B?aWVhZHI3Z2RWaXRJNzE4WjVIYU5DdHRMUG92d2hFems3YllqSEtZTGduQktT?=
 =?utf-8?B?SUpHWTJPUllOTyt1c2tYdURqbFB5d2VlNjR3MnpobU16bVMzdkdsV0pNallL?=
 =?utf-8?B?Z3NYc0IwQ0M1MU5nbmNaSnZ5Q3dGdE1ma0xldjJZOXRINnZ2aVZBRzlubTh4?=
 =?utf-8?B?UWJxVFozWEc4enlaODcrT1RnTk5UelV4RXRUbVVuMW1NVmN6WktCdXVrTHVR?=
 =?utf-8?B?d2xpTFBsZ3BZbkhsYmZPdFlPS3QrVGJMeUUyckFPTG51ZTkrUHQzUm1pREU1?=
 =?utf-8?B?T3NBVVU4cTRsS2xxOGNKMGdTZUJscGtQNHExaW8veloxSThhSXF6VXFqRlUy?=
 =?utf-8?B?MExvOUFycUhVckREZS9Oc253a1NqSzhqR2JNRWg1cFhOOURHWDh4Q1JKRlZD?=
 =?utf-8?B?bVVvM1R2TDdyYzcxaEVqbmJNbE1IL1Z3empmUlJPb3RlT0NXcXU3KzJ6elBl?=
 =?utf-8?B?Zk1tR2g0NnE1WlRJblQ1NW1jVmtGb3pUQ3JsQVRtWHpRc0FjNk92THZUaEU3?=
 =?utf-8?B?VWFYZzJRUFdtTHJKbFpISHFnQXBpUmxNcWRhWnBqVStYZ1JPaTkyaDJmaXpZ?=
 =?utf-8?B?MGVrOHozb08yVWtaZWdWeXhGUVUrOFh2MG9CMlBmZWxsYTIzUzRmdHgvKzA4?=
 =?utf-8?B?eEd5WXZoOEVNSG5RTTk1YjlHc3B1UlpQdDF0M1NLbTBzWCtNM1BVbnV1K3hu?=
 =?utf-8?B?UWZjbWQ5Y0NOSHhva2FLODdZR04yVGJFb1lBZG5sSG83OVpMa3lUS3UydlhT?=
 =?utf-8?B?QWw5d2JuckNjalFoTHdDa1E2YWxXNjZpZ1c3Qk1WY3h5Z3MrWGVmdWNEZW16?=
 =?utf-8?B?SXgrWkUyVUQ5czFWT2UyQkdVZXE1dEdnRGpuVjZkYXVVbFVMY1Y2R001QWxs?=
 =?utf-8?B?bUp4NWNWczBURzFLSEdmV3l2SzVkVi93dk9tUk1RUGJSSzJ3cVZYTnc4WTZZ?=
 =?utf-8?B?UlNFTFR1YkhkNzhjTGIySDU0WjRQUnZjMnpnYmNFcEZlTzlRTVU3SlFHNXdp?=
 =?utf-8?B?OEUzM2VZRWlyWWJ2YkJaRTNTN3dUS09wRmwxNFVPMUxPTXl4YTBJbDBzQVJN?=
 =?utf-8?B?elArRnRraUlwUjBwU2RSQkZrKy9NWC81T1Y2MkppYlNIYVFGSkVmV2pIMmJD?=
 =?utf-8?B?WXZKdEFXUWYxTDBoclNoM3o2Rkl6RlhXV1FtaEMvbk1USHF2YXJaaE1zNWNm?=
 =?utf-8?B?ZmthN1dUZzZIWExhdjFEaGJzOFZ0eTFMTHBsRDJJYncyNFhBNHV5eU9ZRzda?=
 =?utf-8?B?aGJCNjlLNEpDVmh1SFREWjJqbG1rZWFhQndwWEIrSGNqZ3lGUEI4RmQvRHNI?=
 =?utf-8?B?OVdvb0Fla055VzlDaXF4MFkzQ0d1bVVJWDRFZWlmQjVHYXYvV1d0dHF1eWdk?=
 =?utf-8?B?WFRaZ20yUC9FVno0eThSUU1DMGpJRVlLZFZvaitCM0hLSW1PQmZmaEN0NE52?=
 =?utf-8?B?NmxlTnU0SzRsMHFDTUM0TUJxMUdLOG03NXdMUktxMnQ3ckhKOGI4S0ZzMDNo?=
 =?utf-8?B?eU1QRXF1dk1jM1FCNkNYeFlza2FzanBBQ3JPcVM2N1JIcTIxTE9KSzFOWGxM?=
 =?utf-8?B?TjFLK3RsbmJQV2V0OTFmb2JsUFp5V0preGhTWUJwWXBmUW1FSXBUbTJsZ1JE?=
 =?utf-8?B?aTJaa1VvSno1K0ViSTBzcGZXbUY2dE9YaklJK211bjhETytNRWlqZTYxMyts?=
 =?utf-8?B?SnM0QjVEK2thUHpvZTU3ait0NUJyV25NYjNtR3JMNGc1QVVDVDgrVmpVc2Rq?=
 =?utf-8?B?a0s2RkVIZUFLempXa2p6VXJiSnhPNk9iNHNPbFB2cmFuZENWblZKRlZjV3Va?=
 =?utf-8?B?bzkybHpEeFoyVlMrczdNZ2tWN2p5VXhMazBFUlc4MzA4VkUrV1ljR1Q0Nks0?=
 =?utf-8?B?VG5ITHNQRFVhMWF3U1MwZ01UN2hlc05CVisvYTN0V1ZVWjg1ZldlYlkvYllZ?=
 =?utf-8?B?MUVTbDlXOCtUR0tzWktNb0kyeHFsUyswcDhJNG43dmVKUy9KeDU5L1RBTTRy?=
 =?utf-8?B?YlNGNklaUE1XMFBPT2gxbE03eERkamI2M2pPNkt4OEdMa0wyV3FiY1p0aEY1?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49DF7BC2ACF4204F93EE71947349C917@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c832da-62aa-4f6d-e9e2-08dd96f75fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 17:05:36.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zP94sFPnSGNuYSAZzqQjXstu3piDuumy9JGIqI3LIBewMRdmmZMAQMtMiufIYMP7KOqvQS9H9l9PmmGrqblko4FiIbBko0FrYt1ixs8zZV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8424
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 17:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216864

SGkgT2xpdmVyCgpPbiBGcmksIDIwMjUtMDUtMTYgYXQgMTI6MzIgKzAwMDAsIE9saXZlciBST0hF
IHZpYQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IFRoaXMgYWxsb3dzIHRvIHByb3Zp
ZGUgYSBjdXN0b20gbGFiZWwgZm9yIGVhY2ggZHRiCj4gd2l0aG91dCBoYXZpbmcgdG8gb3Zlcndy
aXRlIHRoZSB3aG9sZSBmdW5jdGlvbi4KClRoZXJlIGlzIGFsc28gYSBwYXRjaC1zZXQgcGVuZGlu
ZyB3aGljaCBkb2VzIGEgY29tcGxldGUgcmV3cml0ZSBvZiB0aGlzCmNvZGUgaW4gUHl0aG9uOgpo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdl
LzIxNjgzNi4gSQpndWVzcyB5b3VyIGNoYW5nZSB3aWxsIHBvdGVudGlhbGx5IGJlIHNpbXBsZXIg
aWYgaXQgd2lsbCB3b3VsZCBkb25lIGluClB5dGhvbiBsYXRlciBvbi4gV2hhdCBkbyB5b3UgdGhp
bms/CgpXaXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHRoZSBrZXJuZWwtZml0aW1h
Z2UuYmJjbGFzcyBtYW55CmRldGFpbHMgYXJlIGhhcmQtY29kZWQgdG8gIm9uZSBjb25maWd1cmF0
aW9uIG5vZGUgZ2V0cyBnZW5lcmF0ZWQgcGVyCmR0YiIuIEFyZSB5b3Ugc3VyZSB0aGF0IHdlIGNh
biBjaGFuZ2UgdGhlIGxhYmVscyB3aXRob3V0IGJyZWFraW5nIG90aGVyCnRoaW5ncyBoZXJlPyBX
aGF0J3MgeW91ciBleGFjdCB1c2UgY2FzZSBmb3IgdGhpcz8KCj4gCj4gU2lnbmVkLW9mZi1ieTog
T2xpdmVyIFJvaGUgPG9saXZlci5yb2hlQHdhZ28uY29tPgo+IC0tLQo+IMKgbWV0YS9jbGFzc2Vz
LXJlY2lwZS9rZXJuZWwtZml0aW1hZ2UuYmJjbGFzcyB8IDI2ICsrKysrKysrKysrKysrLS0tLS0K
PiAtLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdGltYWdlLmJi
Y2xhc3MKPiBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdGltYWdlLmJiY2xhc3MKPiBp
bmRleCAwNzc4NjY0N2UxLi5mNzcwZDY1MDg3IDEwMDY0NAo+IC0tLSBhL21ldGEvY2xhc3Nlcy1y
ZWNpcGUva2VybmVsLWZpdGltYWdlLmJiY2xhc3MKPiArKysgYi9tZXRhL2NsYXNzZXMtcmVjaXBl
L2tlcm5lbC1maXRpbWFnZS5iYmNsYXNzCj4gQEAgLTM0NCw2ICszNDQsMTUgQEAgc3ltbGlua19w
b2ludHNfYmVsb3coKSB7Cj4gwqDCoMKgwqDCoMKgwqAgZWNobyAiJHJlYWxwYXRoIgo+IMKgfQo+
IAo+ICsjCj4gKyMgU2ltcGxlIGZ1bmN0aW9uIHRvIGFsbG93IG92ZXJ3cml0aW5nIHRoZSBjb25m
aWd1cmF0aW9uIG5vZGUgbGFiZWwKPiArIwo+ICsjICQxIC4uLiBEVEIgaW1hZ2UgbmFtZQo+ICtm
aXRpbWFnZV9lbWl0X3NlY3Rpb25fY29uZmlnX2R0Yl9sYWJlbCgpIHsKPiArwqDCoMKgwqDCoMKg
IGR0Yl9pbWc9IiQxIgo+ICvCoMKgwqDCoMKgwqAgZWNobyAiJHtGSVRfQ09ORl9QUkVGSVh9JHtk
dGJfaW1nfSIKPiArfQpUaGUgY29udmVudGlvbiBoZXJlIGlzIHRoYXQgZnVuY3Rpb25zIHN0YXJ0
aW5nIHdpdGgKZml0aW1hZ2VfZW1pdF9zZWN0aW9uXy4uLiBlbWl0cyBhIHNlY3Rpb24uIEhvd2V2
ZXIsIHRoaXMgZnVuY3Rpb24gaXMKanVzdCBjb25jYXRlbmF0aW5nIDIgdmFyaWFibGVzLgoKVGhh
bmsgeW91IGZvciB0aGUgcGF0Y2gKQWRyaWFuCgo+ICsKPiDCoCMKPiDCoCMgRW1pdCB0aGUgZml0
SW1hZ2UgSVRTIGNvbmZpZ3VyYXRpb24gc2VjdGlvbgo+IMKgIwo+IEBAIC00MDQsNyArNDEzLDcg
QEAgZml0aW1hZ2VfZW1pdF9zZWN0aW9uX2NvbmZpZygpIHsKPiDCoMKgwqDCoMKgwqDCoCAjIGNv
bmYgbm9kZSBuYW1lIGlzIHNlbGVjdGVkIGJhc2VkIG9uIGR0YiBJRCBpZiBpdCBpcwo+IHByZXNl
bnQsCj4gwqDCoMKgwqDCoMKgwqAgIyBvdGhlcndpc2UgaXRzIHNlbGVjdGVkIGJhc2VkIG9uIGtl
cm5lbCBJRAo+IMKgwqDCoMKgwqDCoMKgIGlmIFsgLW4gIiRkdGJfaW1hZ2UiIF07IHRoZW4KPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25mX25vZGU9JGNvbmZfbm9kZSRkdGJfaW1h
Z2UKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25mX25vZGU9JChmaXRpbWFnZV9l
bWl0X3NlY3Rpb25fY29uZmlnX2R0Yl9sYWJlbAo+ICRkdGJfaW1hZ2UpCj4gwqDCoMKgwqDCoMKg
wqAgZWxzZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25mX25vZGU9JGNvbmZf
bm9kZSRrZXJuZWxfaWQKPiDCoMKgwqDCoMKgwqDCoCBmaQo+IEBAIC00NDIsMTMgKzQ1MSwxNCBA
QCBmaXRpbWFnZV9lbWl0X3NlY3Rpb25fY29uZmlnKCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAjIGRlZmF1bHQgbm9kZSBpcyBzZWxlY3RlZCBiYXNlZCBvbiBkdGIgSUQgaWYg
aXQgaXMKPiBwcmVzZW50LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIG90aGVy
d2lzZSBpdHMgc2VsZWN0ZWQgYmFzZWQgb24ga2VybmVsIElECj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIFsgLW4gIiRkdGJfaW1hZ2UiIF07IHRoZW4KPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBTZWxlY3QgZGVmYXVsdCBub2RlIGFz
IHVzZXIgc3BlY2lmaWVkIGR0Ygo+IHdoZW4KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIyBtdWx0aXBsZSBkdGIgZXhpc3RzLgo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBbIC1uICIkZGVmYXVsdF9kdGJfaW1h
Z2UiIF07IHRoZW4KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHRfbGluZT0iZGVmYXVsdCA9Cj4gXCIke0ZJVF9DT05G
X1BSRUZJWH0kZGVmYXVsdF9kdGJfaW1hZ2VcIjsiCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHRfbGluZT0iZGVmYXVsdCA9
Cj4gXCIke0ZJVF9DT05GX1BSRUZJWH0kZHRiX2ltYWdlXCI7Igo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFNlbGVjdCBkZWZhdWx0IG5vZGUgYXMgdXNlciBzcGVj
aWZpZWQgZHRiCj4gd2hlbgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAjIG11bHRpcGxlIGR0YiBleGlzdHMuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIFsgLW4gIiRkZWZhdWx0X2R0Yl9pbWFnZSIgXTsgdGhl
bgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW1nPSRkZWZhdWx0X2R0Yl9pbWFnZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbWc9JGR0Yl9pbWcKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmkKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdF9saW5lPSJkZWZhdWx0ID0K
PiBcIiQoZml0aW1hZ2VfZW1pdF9zZWN0aW9uX2NvbmZpZ19kdGJfbGFiZWwgJGltZylcIjsiCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmF1bHRfbGluZT0iZGVmYXVsdCA9Cj4gXCIk
e0ZJVF9DT05GX1BSRUZJWH0ka2VybmVsX2lkXCI7Igo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmaQo+IC0tCj4gMi40My4wCj4gCj4gSW50ZXJuYWwKPiAKPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjMjE2NzUwKToKPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIxNjc1MAo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMzE0NDEwNS8z
NjE2ODU4Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcKPiBVbnN1YnNjcmliZToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWwo+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVu
cy5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiAKCg==

