Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F3CC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 01:15:55 +0000 (UTC)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web10.10293.1713489344546977069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 18:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Iv0lS1Ns;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1713489344; x=1745025344;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tv+XTpF4Amw/arDiq2t5QbphORoGWnH39Oopm7QC/9c=;
  b=Iv0lS1NsyudfQTL1bNsvABtFch/Rm2pRVhmECh0jANnkAwdtNrSZFVzl
   yBNN+CLMmqJUJbh4nhSoJI0mQj0RK5e3ZlIWU5A6qs+VZ3W8y+evmsvcM
   hoxGQo33Crlypvw3Tx51yzW5oUdoDfXzVBDwJjNTCUJwmDcjd6urYNKZk
   zCPs0JM/T0c51pFRYd+RurwWemk61pW4xGRBtbpSGZwWFMmUXOfzJ323o
   224aGliPQI6m1JswGKYjXyOsh7QRt5RDTs13rRTC6nIbT6zETvS9SYEP/
   tMkcu65FVV9hBRp+jrUUURCGAdwb+cEzV5Avz0LLr8jtJaSbvg5E++DSN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="121714446"
X-IronPort-AV: E=Sophos;i="6.07,213,1708354800"; 
   d="scan'208";a="121714446"
Received: from mail-japaneastazlp17011004.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.4])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 10:15:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRzcsm9i3CS67kXX7t7cr9VtLITZk63amCqhf7LiJL3192hr6QeBhJe7hpmVEYZZ/RDF4OGxQi7Bdun0n1TfyoJYRslZfIJ3IGSmSPq2a/hVGVo3AqcMbBNm7x2etacRt9F1eYSoSGxqMc7bHmW928s5a3oEA1f6Xxl+C3in375zR/ruww5GL8iq3/easUaGPt6ZPcE7GydioJH1119NMS+3cH4PbXw82dtxp3SXg6lpDYl76cvtkTgEwHQzFw91Cj5cSVjFYd/ZEWOrtI8UyhBmbPJHJOMnvoP+kpCNj7A+lo1tEG94pUlgbaD9d+bKFwkGeY2iGAm1kemeaWMtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tv+XTpF4Amw/arDiq2t5QbphORoGWnH39Oopm7QC/9c=;
 b=FbtJxUPZRyv12J4NHpoEkvMfiTEnuR/kBAMVZXA3YtAqPw98xpcaAvk1e8y/e3XEuwjQubx/pZ69SXY3QAf3No7C7gHeQckXagiYqn2zHzQb5RalMuusegz28mdRIF8Ic27Qq0m01kZvSVtZYXUpip8xdlHAS0ic490myUWniy1pEnu3oV+hr2Ix9VUDlwjYPu294Jg/YJZrd1nQEJfpHd7r8yvvgNB46MycFphnmdV1fnsH/qiWYXxZo/K+fxnJemgueVx9qdUxC8fb5c7OM0MImkxNSNynXmfgVp9f+42wUmPODNZObybsPhCyDlm/HJVEVNFOC+y5deDcFr0y5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OS3PR01MB9561.jpnprd01.prod.outlook.com
 (2603:1096:604:1ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 01:15:38 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c5a5:5492:4703:280e%6]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 01:15:38 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v2] libbsd: Fix conflict error when enable
 multilib.
Thread-Index: AQHakS7v5Rna/weS7EOZ/YW4RKkdqrFtgUuAgAFGPxA=
Date: Fri, 19 Apr 2024 01:15:38 +0000
Message-ID: 
 <TY3PR01MB11056E5A7E503AFDBE1B29194A00D2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20240418012247.490545-1-leimaohui@fujitsu.com>
 <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9YWExM2NhZDMtNTM5Mi00ZTg3LTg1NDEtOGIzYjYyYjIy?=
 =?utf-8?B?OGE4O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTA0LTE5VDAxOjAwOjMyWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OS3PR01MB9561:EE_
x-ms-office365-filtering-correlation-id: 00fa44c4-b12b-4e45-18fa-08dc600e3938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J3Alz03DDXSmKHHsRl/TcON7dh9Zh4pLyzuuOL0bcaVAjc9pJw5FF+QJ/PpxCVNkOtN0vTU3uTbAzNtRTIoEEUKQLOTLsm5Z6q7Kqw0Fdec17MuEtnm8TAA2xC4NwugHwQ5RLLGupaRem2+tJHHjOc7UBkKb9V+iC4vs3aUXj8SRqpkgCWzuP+rGrBHSG9C33UnOa+OLmdRLHl5Vbh4ru6hXhirMK+nhrMR7ggGVsRgFN+BN7uubMCoSJowO4V8EiHmaEkD+TCjQueO9y6gP003IwGA5MSgQXapULd4nAbnoM9MlWezWrSJkV1z03aNBlGIqh1FBsaxHvn2Ex4gdSHEkcl6/Serz6mSlWqNsDztXOb4tnDBWe1Hv67RfSGGNMd+9oHK6JMj1IRMA27Aa66UnKI4DhP6eGem1iCYOTP7wx2MFMu1kDk5fuybO06ehSnFsikmpfiSnbJXSQ5Svlu1ldCgM2qUjDrVsBJEajPQuVHMJwpZfW7omdyrIvR53oJWVFzEtk+7WOiNrPTrOcmNAhCMEgGQdU9UE7++d1h9sAYlbvR3Icz7RKyffrYxIwz0W8DPBN5EwxgnwPXw3Z78pO6eiYcARcxpW28uRy08FtGFzFwYm7xAaNfs0+ueiJ6NxWQm1ZVfxwrv1D1Ks7BqYwBMrcf2qJwO90acQxXsAgdA8rDP74QGkyzYB41X5Zx87MtzgAzTagJGtFqWTl6UWwNNLnsXfnAf4tyE9jghgEf1KkQ/xdaN1t0PUVkuo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009)(1580799018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K3I2UVBJRkplaW0vQXdUUEJRZm5jd25qczdOU1lCdTU3RDBDZlIrUm0vUmEy?=
 =?utf-8?B?RTdSOHk0REJBRnREZWJicUhndDFMVjEySU11U0JsVDNJb2xLVTFxZyt4UDh1?=
 =?utf-8?B?NTNiZms1NVovRlloT0FxV245cmpJcXhMb2tiMjlBdXdxMTN0amtBblJmUm82?=
 =?utf-8?B?bXJnOXZMZ09HQjdZYWFVWERnSUlNR0x0RFV1L3J4WDR5dkU4ZmhuQTYrdDFW?=
 =?utf-8?B?amZmUGw3eWwvWmIyTTBOMHFSK3kvNmljaWR1TFJHMmROcEREeVZmZEt4ZGNj?=
 =?utf-8?B?Z0R3RWFhc0NRdkhTWWhDODZ2TUoydUxFMFRYNklaN3doS1FTcWRqWk1mcWxK?=
 =?utf-8?B?QmpZOHd6RXVVRElrc2JjNTh3OWs5N2pIRFVDbU9oblJWRS9mcWFESTFEblNm?=
 =?utf-8?B?SHBUSVgvcDNOKzlEM3p6T1k2RWJmSFlHSGRMVEpmWThNUS9oN2E3ZWpaSDdq?=
 =?utf-8?B?djJjcW1BbEc2WHg4RUp3VGYxaGE5R1ZJRnVrR0QxcTZZRmxML0piRCtKUHcw?=
 =?utf-8?B?TFM1RzkvVUY1bnB3UXRadGVnRStvM0RPeWhuL0M5SzRzY0MvQkxxekdTajc4?=
 =?utf-8?B?cE9teC9nYzRTamlENjdJaWhES3BBaHJTWU5GNkRTY0tmUGZPV1UwQUN1YjYr?=
 =?utf-8?B?RU92ZUl2N3NFSmU0Z3FERlQrOCtzOTdBOFZWSCtPSWdHRzhYWC9TTmFCOXFv?=
 =?utf-8?B?UGxndmlnRU9wTHpGRWtRTTV0NlZidFVvRXA4eWxnU2M2bU1lLzNEZVdOWVFh?=
 =?utf-8?B?dG5xOWlDZE1DK25LdkhqcmNjbEttTmowYk9CTnVYRHd5ajRmcU5wTTVOVyti?=
 =?utf-8?B?MzQwWWNoUW9aRFUzY1hCLzlhM3hPOUQwblpYMUx3bUQ1Q0wyRXZDRTE2bDJN?=
 =?utf-8?B?VWxYQ2Nza1p1aGUrYmZ6Z0xUUHdock83SVoyb2krVkVKc2kzWTAyR1JUWits?=
 =?utf-8?B?ZVQvSkRWUWRDOXZlczU4TEJieHlHYkhwVUtNc1o4S1dUWlI0QXFqT0FnZXBk?=
 =?utf-8?B?dU51b00zYWtwUjZ5QVRFVTZ6OUplTEFuOWFmOVRyWGxyTjRXeTNvV0FyZDht?=
 =?utf-8?B?MjVHY0cvMXMwbjBRck42MlczeWcxNVhjczV2aXRZWUlCQklqc2E0NG9JdnRB?=
 =?utf-8?B?amtPUGxjaFdKNmhkK2dqaGZxZFdJaFhic2E2Zys3RGJWNWZTd3FUTjZFSHd1?=
 =?utf-8?B?WGFZZTI5MjVudkZtbXlzaFc3a1JyelgxYi85OXZueGIyT3QxaUZZUWR4SEs5?=
 =?utf-8?B?VEFLTW90d1lJc09ydng0Q2xYV21PbU9FSGppK3VTNWZ4RnBWZjI4QjNod2J1?=
 =?utf-8?B?eWxSTTJRR21SUm4zWVZSSHlsOFZRL1JXcmlxZnh3VUlzVWl6OTNtNFpweVAv?=
 =?utf-8?B?VzFFVHRodyt5eEtTR2dsVXV5UEZ6YVFFcElrc1NhNHF0ekM3QjllQ1diaGRT?=
 =?utf-8?B?c2N4UkIydWtvZ0JHbkV0cEJEd2JZdUVEWVBkVWNhM3lkQ0czcnh5ZGhRcUdv?=
 =?utf-8?B?bDBDYzZVdElCc0RPTHBIenY2VHFpc0VJZlVmZGtoU29xbnJhYlJTbzhLU2l3?=
 =?utf-8?B?UHZhMDNHZ1ZEeHNnKzVYTVMvLzAwK2VDK2k1K3JlZXR4RnJ4VmlFZDE3Zll2?=
 =?utf-8?B?bUpEYUozelN2a3poME5RTmE0azNvTEFWRDJVZmQ2a3BLcGRQK21zcFQ1a2FU?=
 =?utf-8?B?RTBpZ3ZId1lEUmVNQzFDS1B6dVBsQUdoQU91QXVFa2lnVXM2MkRZbVA4Z1Nz?=
 =?utf-8?B?M01sUmNBSTZKeUpUYzZoUXIzb1BRQWdNQ3lLNFZHWFM0MVBvYktEdmhvWWNC?=
 =?utf-8?B?d3BFdlJSOUVKeVBkK0I3MzBSWjM4LzhPa2s1TGlSSENvdVI5R3FmakJORFdm?=
 =?utf-8?B?UUYzckVoT1VyMlM3dlJJQ0ZuOFZWMWJLeHc1cDQ3cjFsdVZFNUdCNExwSDlv?=
 =?utf-8?B?c2tWajl0YXVFZWRLSy9WMjNnNkZKWUVpaDBQVzZDUGxMQ2MvbHFJRlVFOU43?=
 =?utf-8?B?RlcwOWNmbEZRMkREYmZBbEY0cXZScFlZOWhsenZkS3hPY1FQM1NIdTh1c2VC?=
 =?utf-8?B?NVcyelFMY3FsSXJ5Y1RjNHRYNDFOcVRBcFM4ZEJhYmJQSzRnRUltdXpybUli?=
 =?utf-8?Q?i2WL3NrUHWtSmEekEe3VMHB31?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Utiz4TzcK1rVYM7wRdgEyXpQxqzcY2vRhIQ5aajKytyumazesMdDFmbpUyp+oIzAkXGQ1uMaQZDGM1Ih4h/jPIT4fUUmmRL9RMq5tvkSsZx+qhAjiv20eyJpAOB3gEA2p16SHv4q5PtKylOIRAmC2iLrADTAJWKVni2m4kfiL8usU+E5DR3U/H2iajqyoCtTKznDpaQqzsY7EB+q1Ow0oOix/DUYTi6AqjB6f5I8k0HaWV+jxshDOmbdu1uMMqD1Ke6XeI8lHOk/UUhc0C5OTwenOHxjWe1c01yOmEmq3WDouwFkD7JemAL7MtG5CfMwyt/wzyKaBjJCKnNeyd6F5wLOQPpjzEIVfu9HCtrMxUBQ1EJa/lSQkrbGRBokHITIQJuefT0h0xE9Qqn+owxdfI2c3ByBIJAN6IJl1m+Kito8QSdZK+xpA9xMPiryAyvlYaxpnfg8IM99uMZjLNAoYlDDksjOvDEuXW4EpqKdXDSjeUBM350MgpLpx5Ho5GmStnYltGDD/404pqNHgdYIXYozsSq3Be2MwNCj25O3gOyVo/yhXLETlcKvlGzDEj3iGbIQ4Ud+blMr5LAvQ6V2pE9TDdZ+l3epRY35V1hUxshmZN5YeXkv5tS05zKg8TGQ
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fa44c4-b12b-4e45-18fa-08dc600e3938
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 01:15:38.5437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQACvDL/WAq1l/74PulMkdbWRrobY3Zzo8Zz1Fv7KTQvXmtR6NwGYDjw63xc6MO8vVivJLHJCWVx/+66nBwaYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 01:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198526

SGksIEFsZXgNCg0KPiBDYW4geW91IGV4cGxhaW4gYSBiaXQgbW9yZT8gV2h5IGFuZCBob3cgaXMg
aXQgbm90IGNvcnJlY3Q/IFdoeSBpc24ndCBhIHNpbWlsYXIgZml4DQo+IG5lZWRlZCBpbiBvdGhl
ciB1c2VzIG9mIG9lX211bHRpbGliX2hlYWRlcj8NCg0KUmVmZXJlbmNlIHRvIGh0dHBzOi8vbWFu
LmFyY2hsaW51eC5vcmcvbWFuL2xpYmJzZC43LCBieSBkZWZhdWx0LCBsaWJic2QgaXMgYnVpbHQg
aW4gYW4gb3ZlcmxheSBtb2RlLCB0aGUgaW5jbHVkZXMgaW4gdGhpcyBjYXNlIHNob3VsZCBiZSB0
aGUgdXN1YWwgc3lzdGVtIG9uZXMsIHN1Y2ggYXMgPHVuaXN0ZC5oPiB3aXRob3V0IG5hbWVzcGFj
ZWQgd2l0aCBic2QvLg0KSXQgc2VlbXMgdGhhdCBsaWJic2QgaXMgc3BlY2lhbC4NCg0KQmVzdCBy
ZWdhcmRzDQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgQXByaWwgMTgsIDIwMjQgMTozMyBQTQ0KPiBUbzogTGVpLCBNYW9odWkgPGxlaW1hb2h1aUBm
dWppdHN1LmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2Ml0gbGliYnNkOiBGaXggY29uZmxp
Y3QgZXJyb3Igd2hlbiBlbmFibGUgbXVsdGlsaWIuDQo+IA0KPiBPbiBUaHUsIDE4IEFwciAyMDI0
IGF0IDAzOjIzLCBsZWltYW9odWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGxlaW1h
b2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiAtIFRo
ZSBwYXRoIG9mIGNkZWZzLTY0LmggYW5kIGNkZWZzLTMyLmggaW4gY2RlZnMuaCBpcyBub3QgY29y
cmVjdCBmb3IgbGliYnNkIGFmdGVyDQo+IGVuYWJsZSBvZV9tdWx0aWxpYl9oZWFkZXIgb24gY2Rl
ZnMuaC4gSXQgaXMgbmVjZXNzYXJ5IHRvIGZpeCB0aGUgcGF0aC4NCj4gPiArZG9faW5zdGFsbDph
cHBlbmQgKCkgew0KPiA+ICsgICAgICAgb2VfbXVsdGlsaWJfaGVhZGVyIGJzZC9zeXMvY2RlZnMu
aA0KPiA+ICsgICAgICAgc2VkIC1pICdzOiNpbmNsdWRlIDxic2Qvc3lzL2NkZWZzOiNpbmNsdWRl
IDxzeXMvY2RlZnM6ZycNCj4gPiArJHtEfSR7aW5jbHVkZWRpcn0vYnNkL3N5cy9jZGVmcy5oDQo+
IA0KPiBDYW4geW91IGV4cGxhaW4gYSBiaXQgbW9yZT8gV2h5IGFuZCBob3cgaXMgaXQgbm90IGNv
cnJlY3Q/IFdoeSBpc24ndCBhIHNpbWlsYXIgZml4DQo+IG5lZWRlZCBpbiBvdGhlciB1c2VzIG9m
IG9lX211bHRpbGliX2hlYWRlcj8NCj4gDQo+IEFsZXgNCg==

