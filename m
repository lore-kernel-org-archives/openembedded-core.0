Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D225C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:11:36 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2608.1784567488107725027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KVa4CJzn;
 spf=pass (domain: siemens.com, ip: 52.101.83.63, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiK4PMhOk5UEH2ctP2kgQEq167Ad9JHQra8sC7GUCJkHai5+G9EFG17A8B+AP4uAFuA255+CjhB/dGBF7NAC6rbcbdi6cJKG3C7EMtCd0d2YArQkxE0hEqWwgH5hHjot5W1WWVyk4K80zTnxwGyHErbHbEh+l8UmIY8zwcocx0X1FDpfmSuRn6cW1BUqeucsIygXODmdf9ETZW5Yduc62QszpxE0t+GrA0enxlMAChw61EHAeAYrRIz41+F9vTIgKEDSdAG5LrW2ofCN/XobBBBOVPwi1eJ631tGKt8vl1FevsPgxd3JZ2NmM3xwoT9cvqpJ7Yn+O5JhN8UkOMzS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=v9tD9p0bqhFS91RI2CyWGPH3ROHqpd6+s5uXjOhdAO9AgObwp+AebTUQFFdG0AKYcfvl0dIEfaCUnY2jz8DqJcfiVemKqiKzzpy3VV5zRy9KJe8tLF9ayt0M8UPs2+8I7yR8EeKVYt6OgbMviKT9poG278biHEx9J5Qsh4IeJuqitQL1z7S+vsteuCCxRboBuvvEj53NXQp9GV4zCaas5NRA3PmYFiisFcHg+gG3ZW/yoTQsIudRFo6NLUzakgjrZVCPmrI+4CkkV0wU1jAGimLijzeqJw7GjsCfVV24k5uQo3d51BB8UNzty2n+lP5G9iOx/z2JgX8zLEDbNv/0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e//aAMtSbJi1T+yN7v/BqibCM01rpz+1P2UM5I9XTwU=;
 b=KVa4CJznXbXiE4ZdCWGQBh8xSaKfP08qImka/kZhoCbH+GYMD7rbsj6DJ8e4R+RYRo1vFa6IZzyXZqhkq4pA9nxOO9WlURtNE5cEWxDwXWnlQcS7hzoy61EUSJ7HyVBpMhqnifp1phFSSSP108F9R1MJjJ0E4iUjkqfiDw3Coo/jproKdOgojKiQXMpunt893buueHWJbPmzk3fg2IcQZBl4yZrxtS19V05ePawLknd9wFLMXBELaedg7LhMfgBmyHNw5GPGfKZ0oOPD49g8TqK0x3CMLef9EX0FjUSw9HN3PUOzwEJ4g8dxPaEE+P2vvLjEt/zkwOTkkdc3uVGwbA==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by GVXPR10MB9183.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:11:22 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:11:22 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, Paul Barker
	<paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add KERNEL_DTBVENDORED
 support for FIT_CONF_DEFAULT_DTB
Thread-Topic: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Thread-Index: AQHdFpMIn4L+Bk3djkW8bp/LFE0fvLZ2CMiAgAB/I4CAAARzgIAAG96A
Date: Mon, 20 Jul 2026 17:11:22 +0000
Message-ID: <df0810bd8195bed1f754fb754f94eb64133491e6.camel@siemens.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
	 <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
	 <DK3HWGV0JCOP.14DJEFKWLP67L@smile.fr> <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
In-Reply-To: <DK3I8NXUCRHK.C3U8MB8K4NZV@smile.fr>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|GVXPR10MB9183:EE_
x-ms-office365-filtering-correlation-id: 9d8c5738-f616-407c-2abe-08dee681ec75
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|23010399003|366016|18002099003|55112099003|22082099003|38070700021|56012099006|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: 
 OhjjX2Bq0IP07q4rGODmz+ImndEcHBqYV6mkJMavvGU1x3Wzfqr41T7BRFZIE8qbD7AQdijNVPzBnoMwYKIqiUZPThx9w/muNPQYc5BXWQ+LaF4kiuRGFp8gsLeqFPc+2o5kOmwon5wazKEb7fegfHhzMVaEJDX8kCAzJ2f1f7KrJmyfGH0MmzRozoAjBky3p2NWmbqwUtAGpsQk74PWD6t6uMkOJVdh62avjrt5tA9nnvggZo/Ttz2X7vko2PZJsQMs3zVHF4tM6M4DvCb3UFUUqkppjGbQ4XLD8+vC8Vh41OmSr2hQgbvFob2cGiLSaDNBTIYfg02lnwyKzjVc17WeEAreADV6GuVULvPEv2/+KpqVEL8ZUGWdfpJhVJ7Yywdlf1Qq1z9uUQxE69dsrWVXnEabbPPxmpVQDoPnYpXLfTOE6M03nS+z9aCYFrXY9QrhL7KTTMzZVbMi3ljGihAQK53Fb/pBdS3bhh40hSb5L/uMcSUZzPL7WAG9aoPCWr9SipK+bYQzWDxHuU8WqS2GYzL2XHdPpQOBpYRqscvcNcKGhLhTCOsmEMXNhfTYevN5ny8FSbtP2SkaYLiHJ/GeBlg2t5BGr9c+6Q371gUIJD4BLUSYTqNDsrfUf3mveKqOEsT6vfk/AjvFQasDjB+25e3g1k/xQdNberb3CtI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(23010399003)(366016)(18002099003)(55112099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WWg2UC9ZVzA4ckVDQXBocGhWOXBJbnJvbVZ6a1RCUHZPeWYzYTVGczU2cXhj?=
 =?utf-8?B?b3krS3FPeWFwK1BVRk1Jb2VqWVF6N0NqVmtBSytCQmZGTTZCbUtJdThOWmRJ?=
 =?utf-8?B?M1lXQjExTldoN2gwbVZKbEJNV2pFV1QvUWlvbFhZajEvNWphZ2RmWDc2L21I?=
 =?utf-8?B?dzFVZHYrRWcrRm12S1JncmZlQWtERmoxK0tzSDdpSDZqR0FYazJCcmFnZEJT?=
 =?utf-8?B?cGdSVktIVFNFRUJDYUR4b3JqY244dVNzc3JiVVdycWZlSXpFcTdVV0NjMjl2?=
 =?utf-8?B?L05SQWlDRzg5RjBxdEpsWElUOFZaUzBaUUErUFlBMDBmbDl1ZTlFcmplWHg1?=
 =?utf-8?B?Q0ordTR0cjdKTG41Y1hoWG4yMFFDUE5rYzBOT0g4YzJRYlk4TjJqTzFXMXd0?=
 =?utf-8?B?RzNCS2NMR045YVYycU5oVFFLbVpGQ1AyemcvU0tEOWdlRWpLSmpaWC9vL2Zk?=
 =?utf-8?B?WlIrdjYyY0tyalNwNHRESFpqdnY4Z3QxYWlJU0xnMEFWU25HeE82S21WdGVD?=
 =?utf-8?B?NTRuTDZZZVZFZ09PVnNxamgvMzUvRERsUXNNNXFHbzBGNnlqbGc0UTlKZmF1?=
 =?utf-8?B?WkdhUTcxUFlYUVRHSVdzUzhIRm5Od2ZvQ0k1anJwMFBjQnlrOU1hajBtWGJI?=
 =?utf-8?B?L3crZmw0cVNFT2xiV1FWVzExNWkycU1waWlZOUNSVk5sRHY0R1JaQitxYmRr?=
 =?utf-8?B?SVFPTEw4N1NoT1pCRUJvY0xWTXg0eGNXQ21MaG1nWDFyVDNXMmNsbVdyWnBZ?=
 =?utf-8?B?WHNwdkJoVFhGcmt5UTQveVlydzg1SmRobDhzQmtubm42UThhUWlEK2NBQXNK?=
 =?utf-8?B?RjEvRUNwRVhmcElYRDg0TS9RZDNudFpUSUNlK0pFaFlGTDA3SnU4V28ycXcr?=
 =?utf-8?B?dzlFMi9aaXl6Wm1ORmE2TVlBOWJlRkxPckxZei9HazhZU2w3cnRKRC9NN0Ft?=
 =?utf-8?B?TENFenZCTThzbVNKQVRkRWtYV0NVWmsyNlowS0NWWjVRUG82QVNNZXdNYW5q?=
 =?utf-8?B?MDlsSjJzNUtZWUIwb3BzejNxejhta0NKcEw4OUMwZGtkcFkxOWtjbWtBU2Vl?=
 =?utf-8?B?dTlIekRSUC9USFVNbHRLSDdIcnJrWXgxd21JNGowZ1N6RjVWbFAwQUJOVEpk?=
 =?utf-8?B?RzNHc3ZPcnE5MnRoREdkWllnd1pSWmZKaXNrcXdlWjh0UHByYXpMbGxYanFH?=
 =?utf-8?B?VzBNcjQ3WEJzODY0ZmNFWFY5T1ZlZldzRWJkNE9VNytjNlozRk5KeDJRMUkz?=
 =?utf-8?B?d0xHeUtxNWh0UGs0TG8wMlNaOC9hdUd2UlFmUTNLdWo1MmQ5cHVSSU9EYWVB?=
 =?utf-8?B?cWQ0bW1GMXVNZXpPTTM3T1N2eXhOTyt2Q0tNNElOQUcvME4zWFhiWlovRm5Y?=
 =?utf-8?B?UGhNRjVMSkNqdW13VkVHQ0RIVFkzZ0hoL05YMi9Yd294K2xDNU10dEgxVVl0?=
 =?utf-8?B?VUtLZ2wwNWNvRzh4bmVTSHlBaVI3aUlTZnB1dTNSUGxYa1gzK3c4R2pabitT?=
 =?utf-8?B?aDUyazE5Q2djS0J1d0FtRGwyUGN0QnlvRUw0ak1scVRuNHJVZEtGSVlNYTFF?=
 =?utf-8?B?Q3FVL09QdXFKV0k1aFE3UWJQa0pYZTF5RGgrdUlwbStUaTRycFhnQm1Oai9q?=
 =?utf-8?B?cTlCczVtZ2Zjd1laZjI3K0krN1ZjMU9xU25VdE0ySUpIKzdvOFZMRHROaXcz?=
 =?utf-8?B?RTJBaVVqN3dJMDFRaWtKd0F4MVBtdHQyb1NUY1FwNFRNTVZPakdJVUNxUStw?=
 =?utf-8?B?SW1xT3YxSUc1MHhoRVNqUU9YUmdjcDZHQk0xbjJOMHBwTWhOb2ZrdGdaZkJK?=
 =?utf-8?B?QW15QzFydGlYMXhTN1JvTzRjWE9xZjF3T2xNV1dNNzZtTEhpU1pNUzdDWHJo?=
 =?utf-8?B?UkQ1elRGclNtVGdCUDVEcmxhNVNPeW96V2JhOS91NS9HVVVRdUdkY040RHNQ?=
 =?utf-8?B?VlpuaG5LVm41OURzd20zVThrYTMyNGhZY3NTNVZMYUpzc2l6dmJmMUw0RzE0?=
 =?utf-8?B?b2M2aXVqbTJ0bk9odW5aWVU2RDJUYmRLdXk3TEZ0OWcvRnl6NVorMkNGWGZI?=
 =?utf-8?B?MkRYSHptY1hnVkpvWm1pMG1qeGUyOCtWK1dmN2Y4Rm43dGR3Mk13RkpYS2tF?=
 =?utf-8?B?SUxTZ3BOU2VKMERYQnZsbTVIeVNEa1RGL0prc3lzbzRYamV1SjljeGp0amNS?=
 =?utf-8?B?Qzg3QlNVMTY3RmJiamNRZzdwSTU4VVQ3NUt4bWtKS3dPYUpoMXMyb0hYMHo1?=
 =?utf-8?B?M09LM2FPcGJybGdtdTcxZUJjVFFpRnVRRC9qY3F1UU5JU25HUnRDOEZyQlM2?=
 =?utf-8?B?Zkk2Wko3VTgxR1AxSndnekNjeklXLzBKQTNLZDluVEpMYTR1Q0tHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C328DE432344843851791502E0C23A8@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8c5738-f616-407c-2abe-08dee681ec75
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 17:11:22.4974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHIAlxUd1AoGWKbpBpZFO7/HWz7egUA9NGnTi08phDzKgnXgSC8CES7c1Nyv/Z7i4iHj2tAJXwmedpxOL257Gd9YXg2Uhevgi9XFsW5HM1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241431

CkhpIFlvYW5uCgpKdXN0IGEgY29uZmlybWF0aW9uIGZyb20gbXkgc2lkZTogVGFraW5nIHRoZSA0
IHBhdGNoZXMgaXMgdGhlIGJlc3Qgd2UKY2FuIGRvLiBDb25zaWRlcmluZyB0aGVtIGFzIGEgc2Vy
aWVzIG9mIGJ1ZyBmaXhlcyBpcyByaWdodC4gR2V0dGluZyB0aGUKdGVzdCBiYWNrLXBvcnRlZCBp
cyBvZiBjb3Vyc2UgbmljZSB0byBoYXZlLgoKUmVnYXJkcwpBZHJpYW4KCj4gCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzI0MTQxMyk6Cj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yNDE0MTMKPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMjAzMjkx
OTkvMzYxNjg1OAo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnCj4gVW5zdWJzY3JpYmU6Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWLCoFsKPiBhZHJpYW4uZnJlaWhvZmVyQHNp
ZW1lbnMuY29tXQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCg==

