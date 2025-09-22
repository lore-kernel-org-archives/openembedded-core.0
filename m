Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EB8CAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 07:02:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.29])
 by mx.groups.io with SMTP id smtpd.web10.45531.1758524522852238985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 00:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=bH02mcoK;
 spf=pass (domain: siemens.com, ip: 40.107.159.29, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCQ/tCAtQRkt1CxRO1X9LR4oXD4HNlESmrpQt08tEr5Ecr0UcurmNy5a7yPJroJEoRsD+nUpy8KUDBmDOfS5cksqBiWSjTwKxXNySMIRV8/jGC9PO4jgMIpqXq0rnrEZLzExfujbwvezOWWqKuwR0tYnCrygd6hE4N3WdNyloubzL+MYf75GNx2VYWmRfI+5ooCwidHqyO/16BJSJRb6OXZUo6CG30jN4jZ3+in5GXcuPH9KHEumJwgmtgYF3sLP8X8yjHEobGQ7fFwqhCdV6niQtFzNO3lDUOxrufMOA7D/oZjyfG65bKD/gLTDGhyvjDerjlJbazNtmLKGUMXQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVA7X38iRzSRvqWKzpdN3UmdYVfRJDlqMHWWH8nZebM=;
 b=MYLRLUf5hSgZQAdfPfmzKw+eflPBVznXH2azY0jBKc52CEkv9l5iFiTTOE+VpZ4MvgPgXx0n3Lm3ykn+MoORe19biwQtzgOTEgsC78DqirRd7r6X9bnivPmaCNgXu+jJKrZ6yUrNf51MZ9pSAW4nDkpF2Q9jIE5vL9YZaP+kFdrXG1Hc/mziGVmYclKmBxuKOqfUeiCCAI5HuNwGDE7YuFVFyBZskoxCz/h0wFSYlz/rXInFmY4mz8DhfeEoww7SkoxB5OW9fY8ecEuWX3oSVFClZLj3s3pnyzMTwBeY1cPLKTjaG5R7FExurpvSeRlSshAgha2qbP1ZLNxtYwmdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVA7X38iRzSRvqWKzpdN3UmdYVfRJDlqMHWWH8nZebM=;
 b=bH02mcoKhpNY5qjdnVxyzssDBmN6uxeiGSIRqom1QXq6fugz/o/+EdzW/tqw9Usug59p9siPh4QwYb9dffdmYNBltlBKvB231LiuRIe9oq4BpXMpFVvi8ryWvMUBWBsewxUWBPEPb/8A9TiVU4jyczktREdV1jfZc0+ApwvfwFB58ztA8n5dsOoUkkN05jbLwyFVcgtK8FYkg3ukE08ixgRxNIfszK2ID854Nc8/JF86W5LVcyIxIe3t72JpnS9lSpWmYfzM90a3+nwTgBPwCt8El5meSCaiGjfdXq1qqAkAuoZWKuL048+V7Q9bKpc0VT+JQ9Q7nBQbZPwK1GcMmQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by VE1PR10MB3933.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 07:01:56 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 07:01:56 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Antonin Godard <antonin.godard@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/19] fedora_essential.sh: add
 util-linux-script package
Thread-Topic: [OE-core] [PATCH 01/19] fedora_essential.sh: add
 util-linux-script package
Thread-Index: AQHcKOBYGHRVpFP7Wkmx0aHVSu9mNrSaIRSAgASquoA=
Date: Mon, 22 Sep 2025 07:01:56 +0000
Message-ID: <436f75405ae8a0b24ef5329367815c3ad4e309fd.camel@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
	 <20250918210754.477049-2-adrian.freihofer@siemens.com>
	 <DCWLYWUK8G7M.3O4CV1EP8CAGP@bootlin.com>
In-Reply-To: <DCWLYWUK8G7M.3O4CV1EP8CAGP@bootlin.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|VE1PR10MB3933:EE_
x-ms-office365-filtering-correlation-id: 0147f590-870d-4f7a-5a68-08ddf9a5eb10
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NHhtcVRVcm42Wmt1bS9lZlB0dDJWTG1PekZyOUlFdXdwbkhVdWdkYTU5RVdU?=
 =?utf-8?B?cVpCbVl2Njg1YUJVUjZ2ckU3K3hlZ01lN1VGci9NRHdRWThUS3IzKzFkaXU3?=
 =?utf-8?B?Y0RIS2ExV0JJSjJWNXBUaWJrVlREUUJJVTNwZThldmMrdmJWdjdZZWo1LzZH?=
 =?utf-8?B?bWl3OG5TdmFGUzJCM1pYNVlTZERIcHNOZmN1aFAvQWlINVhxU3VSWlpud05q?=
 =?utf-8?B?cklKRzZqelFVM295elJxdVE1WmtkZThuRTMwV1dJaExRV2Jjc0c0MUgzeVU1?=
 =?utf-8?B?aUgrK2JtOUJRRGsyamFEbXdEY0lHOThyeGtmVW15VUJMeG5QYnNSWU9GYW80?=
 =?utf-8?B?SCtMVmdBYXZucjl3eDRYTDRESW5Yd1UwNXdOd1M2K2FKMlpLOFlpcWdrTHBK?=
 =?utf-8?B?ZlhicW03UmJTQitlbUoxcUtYSFE2ZG9zcit1Nkg1Wm9Jc2dxZncvaGx3SkJh?=
 =?utf-8?B?N0lJclpMQ0dQZlhUa01mRVVmOVhiVnViMkxxb2wyKzlNQnB6dU5uTUV2RFRM?=
 =?utf-8?B?WmNRc28wSWJnWXlHalY2eldYbUNRRjBNVENvZ3VEQ1o3dUdwcE03S21jckhu?=
 =?utf-8?B?VytIMjdCbi8wL2hadkxQZkZpRE10aTh5SHo0K1orOGFHeFEydVIrMExmYTB4?=
 =?utf-8?B?eU9IVFk1ZnJPYlJLOE9VUXd3clFpWFNoamJlVHE3d0UxNjY3T1JwVE9qb2s0?=
 =?utf-8?B?YTkyWGN0eXVnS3dFbjVqTkVZanFHNXVtOTkwN05iMDZWbTJpOXlyU3JZTHZV?=
 =?utf-8?B?eDhOay9WZEQ3OGlBdjVuYncxMk9yajBLcjNpVHBLcTJkK0V3d1ZyV205VTBF?=
 =?utf-8?B?U1hsOUM3anM1M2g1WGFGSThIL3ZRZ0dnbWI1WGxxK1lDZHhsakFnQVZnSDl0?=
 =?utf-8?B?S2xBQUh2aER1azUrRjBuMFF3R3Q3cmhXQ25JcTFVUmc1TUZaakhoVVlBRkRT?=
 =?utf-8?B?NWlNM2RKcDMxM21OWDlyVkRaZGJReDdjRmpnTG1jYktNWFFHN0hDQ3hkMHFF?=
 =?utf-8?B?b3ROSWF0aWZDSjU5ZzM1Y1JsdnpvUjhnVHFaMVdyMWF2TkN5dEJDSmJ5cllk?=
 =?utf-8?B?T2Ftb1ZrTWpwYi8zWFhsTkc2dnQ1aGVRMXlBUDE5YXVmdXAyN2hqRE93Tjk4?=
 =?utf-8?B?QXZMeWczVzRxc3BORTFiWnYwOGhIOFhQc1NlVHFYbmc5M2lTZDJjM1U5NjNp?=
 =?utf-8?B?Kzg4RFppcEZtVHBKQjdVbWNseHI1UHFaMzNPNy9PUU9maDZQbkNMdUp0OTkv?=
 =?utf-8?B?NDZyYmpzTitwNFUzam1NMWZ0cEVsbHFTcFNZeXFzdGRueGsrQjR3cElnWkpx?=
 =?utf-8?B?YnVFV1hEbUFkWWgvMGY1d0Y1TjBDZU4yZ1VUR2NIcXFMTXJnUWtacGhOTWYz?=
 =?utf-8?B?YklwRGtpN0FmbFNYWCtGalhvYWJ1RXdMQUxXWkJ2YUlpaktQeDJPYVMxczVD?=
 =?utf-8?B?UzZnNEpjTWtOYWJyVkxrelVnbU1XZVEvcVQ2K3F2Q3hRZGZEd2pPR0d4djlR?=
 =?utf-8?B?MXZRVTBtTDdwakVlMHNnM1NxNVpQS1dTNWwzb1Bhdk9NN0dFL1lNYStIRUVM?=
 =?utf-8?B?N0M3SlliUHZwYUJvdzhFVnpudXRkRm0yK3JSMEFYV21OSW9pV0NhdUVqNWtR?=
 =?utf-8?B?M1lJaUh4aTlkMHdHaWF3azVJcngrYkJ3QStOTEFMWnB0SGppZXZhNmdTUnhL?=
 =?utf-8?B?WXJsNjNLQm43OUpoUHBQSEo0MVRFdXB1UXp6WUdScG5SNnhtenJkNHllWU1R?=
 =?utf-8?B?QTRlZW5Qc0s3UW5BT3NVanZwNzlxcEY4bUpBaUZUQ3ZBODFJR2czNS8xeUJC?=
 =?utf-8?B?TUJhcGtiUENtb0YremVzSXA1Z2QwT1o4eVN1eEtERkFWODlZTnYrUWQwTW4x?=
 =?utf-8?B?YVFpS3NhcEMyQmFOR1dpRUhwK2haTHZGMStwT1QxVjFzNDVTL2pBQ1NoUGk2?=
 =?utf-8?Q?XZ7fip7hcfo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWFaTlNDbDU3aGF1Z2F5dXVZRnV6NlVLdmF1ekE4aEszeml2alBkNmhsNDNE?=
 =?utf-8?B?ZGtjbDErcFNUODVKYWFpUHJ4ZkcxTjlJdm9zbko3UnpnNFlYOGhsWG04TmlQ?=
 =?utf-8?B?T0lXanl6QmdBR296aTBCdVpEbTdqU2ZWYWE4RHBkUEtBOWljZEJ0UlRLWWdG?=
 =?utf-8?B?SUpHZ3F0UlFEZ2lvalRkQlVaVkRULzRCeVUxSVFMT09HRXl1L29PUHlpYjh2?=
 =?utf-8?B?OEQ2YXJZMTlzc3dSNVROV1BlZXRCK2JwQWljSmR5Z29GQ3F1UGswMkV1UGFq?=
 =?utf-8?B?NUE0NmJ6UUpZelJFeTNDNnhNL0NEdVh4akNTVnYwSnVEbWdqcTkrVFVzNjZy?=
 =?utf-8?B?bmx2UU4xKzBrMENDZFVQN09qb09ZdGdYT0lmT0JGTWFOZzNwMUdxUHpmaytG?=
 =?utf-8?B?SkczT24yRkdFUDJEMVVzeEJubFI4dFg5UGV6VWpaRnV2YjRnRFJ3UkpoRSt1?=
 =?utf-8?B?S09RR0Q1MDNUd1BiZnNQVHRqeFRrbXh0aWhTUVp0YWZQbnFEQStGc3NxS2VS?=
 =?utf-8?B?NnZnalhVeGZLRDhWd3JPamNnTUtuaXVaMEVIWk45aFB1bksxVHZBRm82NGRl?=
 =?utf-8?B?QlQzdS9seWREY0VVMGJtS1VNc0hrMm1WQmRqQUV6YnFyZ0REMWlBbTZHM3o4?=
 =?utf-8?B?RnBqTExRVUpMSldRelc4UHVhekp0SUloTERpZlY5cVZlNjRWMnp2ZFZoMkJ2?=
 =?utf-8?B?WmJDbGM4Q045NkRpUlNGUTVvT1hiOVJGT2liNGxYKzJld0QyZEtwLytKSVk5?=
 =?utf-8?B?eDNuUW9waXhHWTcwdlJqa21abHoyS3lna0xUdzQvQmhWc1d6UjN3RStzZys5?=
 =?utf-8?B?NUNZTzNidG9ZRTNYNGJ0SlNTaE1LeUt2TGdDT0RpTHdOOU50MzUzRE9YS0Vy?=
 =?utf-8?B?M0RKWmpyQi84SzY0MHdrOFp0NWYyQ2MzeExVOWhEMUpZL1hCVG9RdHkzdjNh?=
 =?utf-8?B?T1hwR0xHeTZsNXc2REdNeFd2Q0Zia3l0VmwzdHBlbzJkSFlSMElUU0VJK1Vo?=
 =?utf-8?B?a0llMk03TDJESk9WdFI1MXNvaXFScWtqb2R5NHVJaFkycWY4WlFmdHlHZVVL?=
 =?utf-8?B?c3ZDYVR5NlJpWXA3WmFNb1pjYkF6VURSS3BkTkw3Q2VncW1uTEFJTWxRWmRQ?=
 =?utf-8?B?YWd4SEY0eUdoRnp5bXMzTDRjdW14cXRJdjZ2cExwc2J5dW92Sjg5YkswMTh3?=
 =?utf-8?B?ZWUzVi93THhFcTYwbHBCeEg2a3Vrb3JHM3pCVWMzSzJXalJrSThjSEhwWWw2?=
 =?utf-8?B?eStrZzZKRThiRm1heTVxbFp2U1ZTS05pQ1QxR0xxQ0RpOHFhSGJyNjREWUxP?=
 =?utf-8?B?MGJLV2RDbXJrWWRHems3VTFXdEd5SE1WU3NxMUlNajVDckYrVnYxaXRLaW1O?=
 =?utf-8?B?eEVoN2psVnVSSDhNWDNrWkN2NXhVYllObUVYWlErcVg2eUZkZGhtM1htRXpa?=
 =?utf-8?B?UFMyRFh3bGs2UHQ2OFoxY3pjM0xEUzc4UWRDSzdsWG1NaHIzRzNQdE1rekxk?=
 =?utf-8?B?NS9LajNybWtIZXUwMS9HNDdnN21LTnBKSXNWNlM2NEdHczExYW9uaXlmUU5z?=
 =?utf-8?B?dW12SGtxK2haeU1KUFR2eCtuYkRhU0Q4b3lFZWRPOW1GTkhnZERnTFJOeEU3?=
 =?utf-8?B?N21SWENhSzNMYXF6WVJVRHJqdDd5QkQ1dUJidEo4RWVjOEhscmNjQldORGRQ?=
 =?utf-8?B?UUNucFc4dnVkeFVFUXM1d3FZcjUrK1VRWjNEVW1sSlN0UzBsME9qWTkzQUVG?=
 =?utf-8?B?UnFqejRHME43OUszNlYxckRHbE9lVUtUTVBXTlNMVHlET0tMb3RwMitNM2xp?=
 =?utf-8?B?VFVCT2dNelFtNjBCdGxLcERRM1ppQUp3S1JDUzk2ak9SRTBnMzY2WHZyc1o5?=
 =?utf-8?B?RzBub2s1OFBhdk1QdTNiWmhIeU9lKzMvL2VvaEpXRUtROGVEejhsUytrWDZ6?=
 =?utf-8?B?S0V0SE4xQ0FqWXJyZGdUd3Joek5QcmJIcEhIMUZlYlQ0VktnZUlCUThvRkUw?=
 =?utf-8?B?a29wVUcyQlY4cXI1RlRDaWVtRnpLMmx4ZnNRVU05aFpVVGI2b0FiQjJPanVF?=
 =?utf-8?B?Y1U3NTV2NHZ5QnpmTGNTU21USjFJdGExZzFrTVQzMS9HOXR0ZVNobmlHL2lw?=
 =?utf-8?B?Rkg4a0hOeUg1N2R4blR1R1NoWWVEbWFYWE1lU1F6bkNRZFpUeVlvc1dTajJo?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF6FB6425F4F20479E7E433777B527B5@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0147f590-870d-4f7a-5a68-08ddf9a5eb10
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 07:01:56.4614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUnRRXTlYjhjFUDDX9ceqrMlHbZwHWn1szf5QHy9eSVu7Zy0/ooVGrBX+GGuJe7z1Z46M/PTDcFV59yX+IiHakiASS/6UbYTbaxV6g2A8yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223808

T24gRnJpLCAyMDI1LTA5LTE5IGF0IDA5OjQ1ICswMjAwLCBBbnRvbmluIEdvZGFyZCB3cm90ZToN
Cj4gT24gVGh1IFNlcCAxOCwgMjAyNSBhdCAxMTowNyBQTSBDRVNULCBBZHJpYW4gRnJlaWhvZmVy
IHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IEFkcmlhbiBG
cmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGUgdXRp
bC1saW51eC1zY3JpcHQgcGFja2FnZSBwcm92aWRlcyB0aGUgJ3NjcmlwdCcgY29tbWFuZCB3aGlj
aA0KPiA+IGlzDQo+ID4gcmVxdWlyZWQgYnkgZGV2dG9vbCBmb3IgdGVybWluYWwgc2Vzc2lvbiBy
ZWNvcmRpbmcgZnVuY3Rpb25hbGl0eS4NCj4gPg0KPiA+IFdpdGhvdXQgdGhpcyBwYWNrYWdlIHRo
aXMgZXJyb3IgY2FuIG9jY3VyIG9uIEZlZG9yYSA0MjoNCj4gPg0KPiA+IC9iaW4vc2g6IGxpbmUg
MTogc2NyaXB0OiBjb21tYW5kIG5vdCBmb3VuZA0KPiA+IFRyYWNlYmFjayAobW9zdCByZWNlbnQg
Y2FsbCBsYXN0KToNCj4gPiAgIEZpbGUgIi9ob21lL2Fkcmlhbi9wcm9qZXRzL29zcy9wb2t5L3Nj
cmlwdHMvZGV2dG9vbCIsIGxpbmUgMzUyLA0KPiA+IGluIDxtb2R1bGU+DQo+ID4gICAgIHJldCA9
IG1haW4oKQ0KPiA+ICAgRmlsZSAiL2hvbWUvYWRyaWFuL3Byb2pldHMvb3NzL3Bva3kvc2NyaXB0
cy9kZXZ0b29sIiwgbGluZSAzMzgsDQo+ID4gaW4gbWFpbg0KPiA+ICAgICByZXQgPSBhcmdzLmZ1
bmMoYXJncywgY29uZmlnLCBiYXNlcGF0aCwgd29ya3NwYWNlKQ0KPiA+ICAgRmlsZQ0KPiA+ICIv
aG9tZS9hZHJpYW4vcHJvamV0cy9vc3MvcG9reS9zY3JpcHRzL2xpYi9kZXZ0b29sL2lkZV9zZGsu
cHkiLA0KPiA+IGxpbmUgOTgwLCBpbiBpZGVfc2V0dXANCj4gPiAgICAgZXhlY19idWlsZF9lbnZf
Y29tbWFuZCgNCj4gPiAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fl4NCj4gPiAgICAgICAgIGNv
bmZpZy5pbml0X3BhdGgsIGJhc2VwYXRoLCBiYl9jbWRfZWFybHksIHdhdGNoPVRydWUpDQo+ID4g
ICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXg0KPiA+ICAgRmlsZQ0KPiA+ICIvaG9tZS9hZHJpYW4vcHJvamV0cy9vc3MvcG9reS9zY3Jp
cHRzL2xpYi9kZXZ0b29sL19faW5pdF9fLnB5IiwNCj4gPiBsaW5lIDQ3LCBpbiBleGVjX2J1aWxk
X2Vudl9jb21tYW5kDQo+ID4gICAgIHJldHVybiBleGVjX3dhdGNoKCclcyVzJyAlIChpbml0X3By
ZWZpeCwgY21kKSwgKipvcHRpb25zKQ0KPiA+ICAgRmlsZQ0KPiA+ICIvaG9tZS9hZHJpYW4vcHJv
amV0cy9vc3MvcG9reS9zY3JpcHRzL2xpYi9kZXZ0b29sL19faW5pdF9fLnB5IiwNCj4gPiBsaW5l
IDczLCBpbiBleGVjX3dhdGNoDQo+ID4gICAgIHJhaXNlIGJiLnByb2Nlc3MuRXhlY3V0aW9uRXJy
b3IoY21kLCBwcm9jZXNzLnJldHVybmNvZGUsIGJ1ZiwNCj4gPiBOb25lKQ0KPiA+IGJiLnByb2Nl
c3MuRXhlY3V0aW9uRXJyb3I6IEV4ZWN1dGlvbiBvZiAnc2NyaXB0IC1lIC1xIC1jICJiaXRiYWtl
DQo+ID4gb2Utc2VsZnRlc3QtaW1hZ2U6ZG9fYnVpbGQgXA0KPiA+ICAgY21ha2UtZXhhbXBsZTpk
b19pbnN0YWxsIGdkYi1jcm9zcy14ODZfNjQ6ZG9fYWRkdG9fcmVjaXBlX3N5c3Jvb3QNCj4gPiBt
ZXNvbi1leGFtcGxlOmRvX2luc3RhbGwiIMKrDQo+ID4gICAvZGV2L251bGwnIGZhaWxlZCB3aXRo
IGV4aXQgY29kZSAxMjc6DQo+ID4gL2Jpbi9zaDogbGluZSAxOiBzY3JpcHQ6IGNvbW1hbmQgbm90
IGZvdW5kDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gRnJlaWhvZmVyIDxhZHJpYW4u
ZnJlaWhvZmVyQHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkb2N1bWVudGF0aW9uL3Rvb2xz
L2hvc3RfcGFja2FnZXNfc2NyaXB0cy9mZWRvcmFfZXNzZW50aWFsLnNoIHwgMg0KPiA+ICstDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvZG9jdW1lbnRhdGlvbi90b29scy9ob3N0X3BhY2thZ2VzX3Nj
cmlwdHMvZmVkb3JhX2Vzc2VudGlhbC5zaA0KPiA+IGIvZG9jdW1lbnRhdGlvbi90b29scy9ob3N0
X3BhY2thZ2VzX3NjcmlwdHMvZmVkb3JhX2Vzc2VudGlhbC5zaA0KPiA+IGluZGV4IGVhMTQxMzQz
OThiLi5mNjViMDQ5NGU4NSAxMDA2NDQNCj4gPiAtLS0gYS9kb2N1bWVudGF0aW9uL3Rvb2xzL2hv
c3RfcGFja2FnZXNfc2NyaXB0cy9mZWRvcmFfZXNzZW50aWFsLnNoDQo+ID4gKysrIGIvZG9jdW1l
bnRhdGlvbi90b29scy9ob3N0X3BhY2thZ2VzX3NjcmlwdHMvZmVkb3JhX2Vzc2VudGlhbC5zaA0K
PiA+IEBAIC0xICsxIEBADQo+ID4gLXN1ZG8gZG5mIGluc3RhbGwgYnppcDIgY2NhY2hlIGNocnBh
dGggY3BpbyBjcHAgZGlmZnN0YXQgZGlmZnV0aWxzDQo+ID4gZmlsZSBmaW5kdXRpbHMgZ2F3ayBn
Y2MgZ2NjLWMrKyBnaXQgZ2xpYmMtZGV2ZWwgZ2xpYmMtbGFuZ3BhY2stZW4NCj4gPiBnemlwIGhv
c3RuYW1lIGxpYmFjbCBtYWtlIHBhdGNoIHBlcmwgcGVybC1EYXRhLUR1bXBlciBwZXJsLUZpbGUt
DQo+ID4gQ29tcGFyZSBwZXJsLUZpbGUtQ29weSBwZXJsLUZpbmRCaW4gcGVybC1UZXh0LVBhcnNl
V29yZHMgcGVybC0NCj4gPiBUaHJlYWQtUXVldWUgcGVybC1iaWdudW0gcGVybC1sb2NhbGUgcHl0
aG9uIHB5dGhvbjMgcHl0aG9uMy0NCj4gPiBHaXRQeXRob24gcHl0aG9uMy1qaW5qYTIgcHl0aG9u
My1wZXhwZWN0IHB5dGhvbjMtcGlwIHJwY2dlbiBzb2NhdA0KPiA+IHRhciB0ZXhpbmZvIHVuemlw
IHdnZXQgd2hpY2ggeHogenN0ZA0KPiA+ICtzdWRvIGRuZiBpbnN0YWxsIGJ6aXAyIGNjYWNoZSBj
aHJwYXRoIGNwaW8gY3BwIGRpZmZzdGF0IGRpZmZ1dGlscw0KPiA+IGZpbGUgZmluZHV0aWxzIGdh
d2sgZ2NjIGdjYy1jKysgZ2l0IGdsaWJjLWRldmVsIGdsaWJjLWxhbmdwYWNrLWVuDQo+ID4gZ3pp
cCBob3N0bmFtZSBsaWJhY2wgbWFrZSBwYXRjaCBwZXJsIHBlcmwtRGF0YS1EdW1wZXIgcGVybC1G
aWxlLQ0KPiA+IENvbXBhcmUgcGVybC1GaWxlLUNvcHkgcGVybC1GaW5kQmluIHBlcmwtVGV4dC1Q
YXJzZVdvcmRzIHBlcmwtDQo+ID4gVGhyZWFkLVF1ZXVlIHBlcmwtYmlnbnVtIHBlcmwtbG9jYWxl
IHB5dGhvbiBweXRob24zIHB5dGhvbjMtDQo+ID4gR2l0UHl0aG9uIHB5dGhvbjMtamluamEyIHB5
dGhvbjMtcGV4cGVjdCBweXRob24zLXBpcCBycGNnZW4gc29jYXQNCj4gPiB0YXIgdGV4aW5mbyB1
bnppcCB1dGlsLWxpbnV4LXNjcmlwdCB3Z2V0IHdoaWNoIHh6IHpzdGQNCj4NCj4gSGkgQWRyaWFu
LA0KPg0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gQ2FuIHlvdSBDYyBkb2NzQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmcgbmV4dA0KPiB0aW1lIHNvIEkNCj4gdGhlcmUncyBubyBjaGFuY2UgSSBtaXNz
IGl0Pw0KDQpCb25qb3VyIEFudG9uaW4NCg0KU29ycnksIHNpbmNlIGl0IGNoYW5nZXMgYSBzY3Jp
cHQgSSBqdXN0IG92ZXJsb29rZWQgdGhhdCBpdCBpcyBwYXJ0IG9mDQp0aGUgZG9jdW1lbnRhdGlv
bi4NCg0KSGVyZSBpcyBhIHYyIHdoaWNoIGFkZHJlc3NlcyB5b3VyIGZpbmRpbmdzOg0KaHR0cHM6
Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvZG9jcy9tZXNzYWdlLzc1NzENCg0KUmVnYXJkcywN
CkFkcmlhbg0KDQo+DQo+IFRoaXMgaXMgcHJvYmFibHkgbmVlZGVkIG9uIG90aGVyIGRpc3Ryb3Mg
YXMgd2VsbCwgYy5mLg0KPiBodHRwczovL3BrZ3Mub3JnL3NlYXJjaC8/cT0lMkZ1c3IlMkZiaW4l
MkZzY3JpcHQNCj4gLg0KPg0KPiBDYW4geW91IHRha2UgdGhlIHRpbWUgdG8gc2VuZCBwYXRjaGVz
IGZvciBvdGhlciBkaXN0cm9zPw0KPg0KPiBUaGFua3MsDQo+IEFudG9uaW4NCj4NCg0K

