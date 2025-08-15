Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2E6CA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 15:29:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.57])
 by mx.groups.io with SMTP id smtpd.web10.10774.1755261183699483545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 05:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=By0cCMA7;
 spf=pass (domain: ericsson.com, ip: 52.101.84.57, mailfrom: tony.rex@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaLCSLWvMbL0rmT1gGXC8ut2rMUZieAsm063kIPCB9gRuO2Mh0ph9K4LgYKxf3zKqNgO9RQvR2h2tBWdz+MXj0Zx77ymZ0yz4cW8NT5k2V7lU77vx+GZPbVQIhDMK4f8NqaW9gh/XCzoH4wXKQ3LCKrXTvOdC5HrPYOdiHoUCFy1n9PbfgiRwtIOaDMGPbsdZ3KDdpzs1Gl+2XXWueCUXLEIqZe6ITucVrb6eoKbl5ES6OGFdLNMugWm6cwb3upGm8WFON9CYycVsxOjJzhnjeP83d/cw2oSTLuvGvRRbFK3X+dd9w5Z30QBRbfJ53sg1QMIGPzov9dUTUe8X04c5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlMNDsiJJEpLeMZ9Jdud4TErXqHtaHAK4rhAoIApVAE=;
 b=sRS8nK1OJvOsCBiF0YXVGQBPLKVTprR776pGfo7miNXBLNLiC+PisWo96x3s0UcTs5oJfX8q6+YBfNPZH3M9bY8OPKzgvvzFLCZt9Gnd4n6RxJCdzBOoLW1y40In2lvEAlkY+hY2GNFneJO471kncdTK/RdIqaLBZ3Y6+/F087YylUmi6vNGN0K7KOp1g9eJeu8nWa9tad7u73rVOFYkrVXSL77gcNXWOpDfc/PrMggADItC83ieUFj59SdjPTlD+oHLRa3ttuGbi/gxFYlDttmd1hqc0bqjU1iCUZNCPoH/o+cui3BKDcxZRKRkTcrcQ54ciqTy5q3joYbQzQQj5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlMNDsiJJEpLeMZ9Jdud4TErXqHtaHAK4rhAoIApVAE=;
 b=By0cCMA7Hf8i8zVSBdKCXdb0OkYi5rYAvdCtxDs/IS0/h4i7QjL0lzxc2ARcuSG//Zvbz4BhyAJIPkBADUWBjP4bcdiLt/ohTadzHQOdSDykp4XW1QbHiRC67b2OPTykW/U4rG+bv47qS/nT5FfQ/qCyQYorXB/fZx4OwyeWRJYsKe3P6o3SQySzcmNUmqh7TmNik/2LhB+sZBo+FVTNvzEG8HkpLCQBEw5zzc1zLY2+ghTBdmDH47QMHq9q6cOF/ZxUZZIvxFkq90cwdyzru3Cx8cdeYJKe9dXjfqg9dvraj7+cokuMprMW0w5lPuHmo/PNDdf5adUcYkkGQVQ93w==
Received: from PAXPR07MB8470.eurprd07.prod.outlook.com (2603:10a6:102:2b8::17)
 by AM9PR07MB7969.eurprd07.prod.outlook.com (2603:10a6:20b:302::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Fri, 15 Aug
 2025 12:18:04 +0000
Received: from PAXPR07MB8470.eurprd07.prod.outlook.com
 ([fe80::7a3c:6ab1:cc5f:be5b]) by PAXPR07MB8470.eurprd07.prod.outlook.com
 ([fe80::7a3c:6ab1:cc5f:be5b%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 12:18:04 +0000
From: Tony Rex <tony.rex@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] base.bbclass: Fix the recipe parsing race issue
Thread-Topic: [OE-core] [PATCH 1/1] base.bbclass: Fix the recipe parsing race
 issue
Thread-Index: AQHcDUA+SUfIcAG6m0qi5Oc/WaK+4bRjbMMAgAA0BjA=
Date: Fri, 15 Aug 2025 12:18:03 +0000
Message-ID: 
 <PAXPR07MB84703EAD7BB8D4C8DAB6C5DAE434A@PAXPR07MB8470.eurprd07.prod.outlook.com>
References: <20250814172348.3882586-1-tony.rex@ericsson.com>
 <20250814172348.3882586-2-tony.rex@ericsson.com>
 <CANNYZj8WU_gjQsf8GhVcFg6371UK+T+ePUcT9Oa6QjKjRE_nMw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8WU_gjQsf8GhVcFg6371UK+T+ePUcT9Oa6QjKjRE_nMw@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB8470:EE_|AM9PR07MB7969:EE_
x-ms-office365-filtering-correlation-id: f76ba0a6-25b1-435a-6f8d-08dddbf5c8da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RHYvWFVDSVAzaDhnOWpTamE0NUlJZWFSN0FYUnVEWjVhSVdwVEM0M3hkQmtm?=
 =?utf-8?B?V2JXTlUwcVFJdWt6N2Z2Q0ZzNDNYOEoyOEVRY252VEdHamlsSUxSQ1ZlVzNq?=
 =?utf-8?B?akluZWZZTlZBcmtPK3dSUjY3SlMwekN3ZmVVVC80aHY2bGRvZkhVZVhmSFps?=
 =?utf-8?B?NU81MjRxZ2VaSXFWYWVkM0VnbVZKb2pPVlRpY1dHbWFmMStUbXhCU0FIK3BF?=
 =?utf-8?B?OENzREoxTU1kdXJ0WnRUS1ZpNWRnZ0RaT2c2dGVwWk9mcHZ6V3NmSGJPNUI2?=
 =?utf-8?B?RThycHFVSVQyZkpHUTlsWHE2V1Z0Y0NhK2p3OFlNdGp6UjlIcjRKSGZGOC9H?=
 =?utf-8?B?QlFaVUhvZUVRd05xajVYa2oyQTlpaHMyam1qTGRKL3Z4UzZtSXdlek9RMC9n?=
 =?utf-8?B?NTFCYkl4a2dLb293NlZzRFF6Z1NTS0srWkFmb2ZQNEhIRklDUkswNTUyL2tz?=
 =?utf-8?B?bGVBYm80dytwUi9rQWtqcnUvaXoxajNLdThsS1EyZWJBVUIwS2hpQWd3Y1Mx?=
 =?utf-8?B?d1pNSFIrR1lJL3RoSzJFaWM3MUQ4Wm9xZ0owaVYvM2pMMmhWY1oreVczbk5T?=
 =?utf-8?B?SHRQUEd4Ky96cy9JMVZ0ZmRGVU9xNlJiK3R1OGpLSzRIRERtL05WU3prRUk1?=
 =?utf-8?B?am9SZEd6a2hiUk5EMjMySys3V1Rpdi9sUW5kSnpMbHRDaDhid3JXMUJqck9V?=
 =?utf-8?B?UUhTSG8wUnljMTRoMExSVGxnbitNZVpWVndQcGYvM0YvR0lpM1pVeTFYSXZr?=
 =?utf-8?B?RjhUQVRUQzdmWGRJSjNMdmF6Y29oem5tVjdBbFlPMnVJa1YxcTZJMHp5Sm53?=
 =?utf-8?B?Y3A1UVJzb1haNmpSRVlVRzNCRzhoenQ3bHo3cFJDVG13QVZkUGJxSHVVYklK?=
 =?utf-8?B?TVlFZENRUE9WallDWEVxMHhEMmpGVnliaG1GZytHV0dpR0FWQmtSdkloQm1u?=
 =?utf-8?B?MVA1RE1KbUMvc2pBby9nSGl1RE9qMFNmc0lDQnY2R3I4WVZRNUkwZzlic200?=
 =?utf-8?B?dUxTSlcxbEJNMDJLeEp3T2NXYnJEK2dQTk5oQk9QSS80bTdxTXNlTHVENklK?=
 =?utf-8?B?RlFZMit5dEdMbTNlRG9HT2Zib2VQSkJlOEFMRzBVeVltcythaStWZHJwN1VB?=
 =?utf-8?B?U2JRRVlyVWJuR0I5YktyYXlXUTZFUWhYUVRPZCtqUnZVRzhVK0dYRDRUVTZP?=
 =?utf-8?B?bWJndzRPVTdYWE5TVjNkNTVYUitwdk0zbm9qOERhaHNZUVQ5Y0swaDdLeVRD?=
 =?utf-8?B?L0xMK3E4a2xtUDlTdU13ZWFhL280Nkl6UnBXY0t4YngzcFdXNHAzSjBSWmJT?=
 =?utf-8?B?ZjVtK0M4Y1B1UlhQQkY2aldDQUV2NWM0QWhxbEpEa0JvZUlrWVFJTTRzZ1dz?=
 =?utf-8?B?OGc3NDRsZGptenNNM1ZFNDJkOGVXNlFkTDdQalErZ1JNVGU4a2ZMYmFGcS9J?=
 =?utf-8?B?MEt5MkZnaXhLOHd1NzdCRUpiNGxoU3loQ0tVRzhJejYxeUpDc0dIR0Nlc3BN?=
 =?utf-8?B?MXdwMU1GTVNScndTaTRqZ0g5Q1o2VXZVc0xMaWw3RFVZYUUzVmFNbVdCZnNK?=
 =?utf-8?B?SFYyVnhWZG96eTB1NTVGdHFYRlhBbDlTNUREQ3hUbVQvQXRLaGtEL0xQRkl2?=
 =?utf-8?B?U2w5TlJ6d2VaRmd0WU9PS3ZlQzFKc0lHeU9yOUIvN0Jvd0l1QkVBTkxYUlhC?=
 =?utf-8?B?cmxOV0ttbFlVcklmYXIrMks5b3RlY0lxVWdMNDVEWTg5ODJNcXVSaTdhbzVL?=
 =?utf-8?B?cE1jdlJ4ZlhHN292WVh5a3dvdEsvTTBZOVczTWxHTFNkOXBVeXVQVEtMVkUz?=
 =?utf-8?B?OFgxZnFQcDdDWEJWUFRNWGFVQXZrc0FBaTYyV3J0TEdoNG4xdjZLVUw3NHc5?=
 =?utf-8?B?UWJlaDliNFZXTDlVVHduQkJkVFl0UjhzYWJTUi8wQU05cmF5Q3YwWDhtK2FH?=
 =?utf-8?B?N3pabzhvL0ZZVDl5TWxXNG9zWkFGTHB1UzdLWnlQRmFxRFp5d29LKzVmU0Zv?=
 =?utf-8?B?c0lXSWNFOGFnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8470.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MVNyM3FiSXdkVzFwK1p1UnNtcU5uVmRqbG9zTlVkZUJaNUtQbUZ0cEczempD?=
 =?utf-8?B?UVFRUVVVZlIyQWZCYWdBTElkNUZKbGY3dldYL1ZZRmJpUTlhY1lXNU41QUpj?=
 =?utf-8?B?ZVh3ZHhSY3dESzd3WDVqcWFpZW83bEREaWdHczVMUERmNzA0RWhrUUwrSUly?=
 =?utf-8?B?Ry9iWG1sR1VvWGVRWHc1UVJBNFJBZ25HemlrQ1l0UFVhSHkvMFZ1UGErQjJT?=
 =?utf-8?B?S0E0ODRvNHFic2Rsdm5uTEJhRTU5aFhOVjVESXJ2c1VGclFyeXpUajVaU05F?=
 =?utf-8?B?ZU52bHBCWTdVOVVzY2p2Z2d4bEVJNE1lUW5zWUpCV00ralpTSnlNazVGSnps?=
 =?utf-8?B?TzA1blY3N2VxaTkyUWZRM3l2WUZjajhzTUJJVEZYbEg4dHljM3oxR2N6NG1a?=
 =?utf-8?B?U25RMitZdjB5czJQQzJwaU1LV0pHb25FRWc4ZXd1ODZxNWlpOEJWYi90TEI5?=
 =?utf-8?B?N2RRSjZlYWJNRlJXQ29TbXE3aUNBNUxhaEtzeXNFbEZqSXUvS3pRWmtIQjdH?=
 =?utf-8?B?R3VHN1ZkQWFXem5RWlBXZGFsdjk1cmV6SG5iZzJ6SlFOd2xFdnhjV0VpYVlY?=
 =?utf-8?B?b2F5QWNXUnRNYXBlMHlnSXE2T1BWYmh5TVRBVGVpQ0tjNzdsd3puMGh0b3Fz?=
 =?utf-8?B?R25hUHhtUEZoNDg0cE42QnZrSmxvM0tIcS9XdmlIeFJXdjNrdVlIeHBjR3JM?=
 =?utf-8?B?Q1FrQ2Zhd2hLUWJGQlpHcks0VWtWbXdFRjVFdThhMlJxV2Vsd2ZKOGNKV3hV?=
 =?utf-8?B?eXdtbGk4N2poZjkzQjRqRUc4VHVJdElhblhFS1FzU29xRXhaT21POTVtY25z?=
 =?utf-8?B?NEpaWi81aVFaUHZ3Y3hJYjBGc0NONVNoQ2g5dEtRajZDZ2ZFLzF3ZEV0ejBx?=
 =?utf-8?B?RWUzblVuV1JRa3lFL0k4NlB3Q0EzRXZkRy9HRjFFdU5sVG55WFZ2ZlZOZVNO?=
 =?utf-8?B?S2plQ0NQM2ltNzR1ZWZ6SFc3UG9vVTZIbDdkOG9zTUVVQnVpSDA3NjJWLy90?=
 =?utf-8?B?NVFKSGROUnBZR2I4L0NCV28wT0tPVHNiU3RnTmE4WWZ6L0UreW9Ha0czZXIv?=
 =?utf-8?B?SkZuRnhJbVM0eEMxU1k1SkdmRWkxMXhvaEE4V00wMkVrWkw1TW1iS3JtUk1o?=
 =?utf-8?B?Lyt4d1dCVW9PUmR4WGFiNFVtWmxFQTlsaXlyZEdFUkV0STZ6c0owOXZvZ1RI?=
 =?utf-8?B?Q25NQXk5bno4OFppWW5sOGw5S1lybDFXTTcyQy9RcFVjdWJTMU1pSWU0T1JK?=
 =?utf-8?B?OHExc1FZbS9DVDNVUzNQQnZBZXhSUWZlclBzZnNKbngwU1hBMG5hSm9wanhs?=
 =?utf-8?B?Q2xOTTUrbXpodzRrL3FCckhxUUtoNlFEYi9Gb1oxTGN5SjdIajdzZExrNFdP?=
 =?utf-8?B?VUF5bC9PRjRlRFZ2ZWFmYlFicUt2UlFFRFBSTGZWUkJUK1hHemY4NVF4ZmtW?=
 =?utf-8?B?V251V0tlejZxQmUvNFNuRS81R28yQjVpUmhZQWNQdzlNZ3FNUXJFV24rM1JQ?=
 =?utf-8?B?RHVLYk1Vd244aTR4aWJySWpSek1lMzFrQmwwdS9qNkhJODdkOTVzYWxBZWZX?=
 =?utf-8?B?eTRwdWlsbDJFTFZLK29nOUxtUmZObzVldENjbzZ1ZldHakhRVGx1bnJjUnlC?=
 =?utf-8?B?OWpHMVM1NlhRODA4SjBlRnUyc3Z3Wm1KcjRrKzhRNElUZGRlSURVd0NTdEU2?=
 =?utf-8?B?dEw2cndhZk96eXUxblpyMHdDM08zNi9ObzZTOUYxTnphazdCSk1qcGFVOUt2?=
 =?utf-8?B?bVJlakxlMnkxeTFCS0NBc2ZKcjdBVTdGbVNQWjdkOFA2M1ZGUXZQNURaR2hC?=
 =?utf-8?B?SFYvUngrUWhnNlBKaG8zTU94enZkSUVzWitDNkxUcTErZDlkMEMzT3MrWUlK?=
 =?utf-8?B?Uk96bktTOUZKOWRMVVo0MnU3RzRVN2RnS2V1alF6QXRPeUxiTW9LbnhCenJU?=
 =?utf-8?B?TUdzYWtpZnpIZmwvQ2U0cDFldUFGUkR3VVdUS051UTdnaGxHUmo1dmV4Nmg1?=
 =?utf-8?B?dXVUSjJBRVlVRDNDeC92aHJ0UlJFekVUcisxaVlCOEpySEROM205VkFHeTJC?=
 =?utf-8?B?eS8zbTd5WGVORmZ4VUFGRUJVSWlrWjBkRGh6SlI3UWxtNUVvT0k5T3FlN0lI?=
 =?utf-8?Q?oWVmgW6vIuNMi3rsMMUrQZj6D?=
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8470.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76ba0a6-25b1-435a-6f8d-08dddbf5c8da
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 12:18:03.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQIUbyemn/Wjb+RKzFwbL97eq0h5duH4rHBMgmGCaenlb7mWrAW3e51ZK4mt/hRx6jU7w3jV1AWNEBOQcU7inQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR07MB7969
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 15:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221975

SGkgQWxleCENCg0KSXQgZml4ZXMgdGhlIGZhdWx0eSBwYXJzaW5nIGFuZCByZXNvbHZpbmcgdmFy
aWFibGVzIGluIHJlY2lwZXMgYW5kIGFzIGEgc2lkZSBlZmZlY3QgdGhlIGZsb2F0aW5nIHRhZy9i
cmFuY2ggcHJvdGVjdGlvbiBpcyB3b3JraW5nIGFzIGludGVuZGVkIGFnYWluLg0KDQpJIHB1dCB0
aGUgdmVyaWZpY2F0aW9uIG9mIHRoZSBmbG9hdGluZyB0YWcvYnJhbmNoIGFuZCBhIHdheSB0byB0
ZXN0IGl0IGluIHRoZSBjb3Zlci1sZXR0ZXIgKCBbUEFUQ0ggMC8xXSBiYXNlLmJiY2xhc3M6IEZp
eCB0aGUgcmVjaXBlIHBhcnNpbmcgcmFjZSBpc3N1ZSk6DQoNCkl0IHNlZW1zIHRoYXQgdGhlIHJh
Y2UgY29uZGl0aW9uIGhhcHBlbnMgd2hlbiBkb2luZyBkb19mZXRjaCBvbiByZWFsbHkgc21hbGwg
cmVwb3MgYW5kIGl0IGNhbiBiZSBkaWZmaWN1bHQgdG8gcmVwcm9kdWNlIHNvIGJlbG93IHRoZSBv
dGhlciBjYXNlIHdpdGggZmxvYXRpbmcgdGFnL2JyYW5jaCB0aGF0IGlzIGVhc2llciB0byB2ZXJp
ZnkuDQoNClRvIHZlcmlmeSB0aGUgZmxvYXRpbmcgdGFnL2JyYW5jaCBpc3N1ZSBoYXZlIHMgc2lt
cGxlIHJlY2lwZSBoZWxsb18xLjAuYmIgYW5kIHNldCB0aGUgU1JDX1VSSSB0byBTUkNfVVJJID0g
ImdpdDovLzxyZXBvc2l0b3J5Pjtwcm90b2NvbD1odHRwczt1c2VyPSR7VVNFUn07YnJhbmNoPW1h
c3Rlcjt0YWc9djEuMCINCg0KcnVuIGNvbW1hbmQgYml0YmFrZSBoZWxsbyBldmVyeXRoaW5nIGJ1
aWxkcy4NCiANCkFwcGx5IHRoZSBwYXRjaA0KDQpydW4gY29tbWFuZCBiaXRiYWtlIGhlbGxvDQpF
UlJPUjogaGVsbG8tMS4wLXIxIGRvX2ZldGNoOiBCaXRiYWtlIEZldGNoZXIgRXJyb3I6IEZldGNo
RXJyb3IoIlJlY2lwZSB1c2VzIGEgZmxvYXRpbmcgdGFnL2JyYW5jaCAndjEuMCcgZm9yIHJlcG8g
JzxyZXBvc2l0b3J5Picgd2l0aG91dCBhIGZpeGVkIFNSQ1JFViB5ZXQgZG9lc24ndCBjYWxsIGJi
LmZldGNoMi5nZXRfc3JjcmV2KCkgKHVzZSBTUkNQViBpbiBQViBmb3IgT0UpLiIsIE5vbmUpDQpF
UlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogaGVsbG8vMS4wL3RlbXAvbG9nLmRv
X2ZldGNoLjMyODk5MzINCkVSUk9SOiBUYXNrIChoZWxsby9oZWxsb18xLjAuYmI6ZG9fZmV0Y2gp
IGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScNCg0KIFRvbnkNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PiANClNlbnQ6IEZyaWRheSwgMTUgQXVndXN0IDIwMjUgMTE6MDUNClRvOiBUb255IFJleCA8dG9u
eS5yZXhAZXJpY3Nzb24uY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gYmFzZS5iYmNsYXNz
OiBGaXggdGhlIHJlY2lwZSBwYXJzaW5nIHJhY2UgaXNzdWUNCg0KW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBhbGV4LmthbmF2aW5AZ21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBp
bXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
IF0NCg0KSSBkb24ndCB1bmRlcnN0YW5kLiBEb2VzIHRoaXMgcGF0Y2ggdHJpZ2dlciB0aGUgZmFp
bCBvciBmaXggaXQ/IElmIGl0IGZpeGVzIHRoZSBmYWlsLCBob3cgY2FuIHRoZSBmYWlsIGJlIG9i
c2VydmVkPw0KDQpBbGV4DQoNCk9uIFRodSwgMTQgQXVnIDIwMjUgYXQgMjE6MDUsIFRvbnkgUmV4
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDx0b255LnJleD1lcmljc3Nvbi5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+DQo+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgc2V0
dGluZ3MgdGhhdCBhcmUgbm90IGRvbmUgaW4gdGltZSBpbiANCj4gYmFzZS5iYmNsYXNzIHdoZW4g
c2V0dGluZyB1cCB0aGUgZG9fZmV0Y2ggZnVuY3Rpb24gd2hpY2ggbGVhZHMgdG8gDQo+IHBhcnNp
bmcgaXNzdWVzIG9mIHRoZSByZWNpcGVzOg0KPg0KPiBiYi5kYXRhX3NtYXJ0LkV4cGFuc2lvbkVy
cm9yOiBGYWlsdXJlIGV4cGFuZGluZyB2YXJpYWJsZSANCj4gZmV0Y2hlcl9oYXNoZXNfZHVtbXlm
dW5jW3ZhcmRlcHZhbHVlXQ0KPg0KPiBBbHNvIGJ5IGZpeGluZyB0aGUgYnVpbGQgZXJyb3IgdGhl
IGZsb2F0aW5nIHRhZy9icmFuY2ggYnVpbGQgZXJyb3IgaXMgDQo+IHRha2luZyBlZmZlY3QgYWdh
aW46DQo+IEZldGNoRXJyb3IoIlJlY2lwZSB1c2VzIGEgZmxvYXRpbmcgdGFnL2JyYW5jaA0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBUb255IFJleCA8dG9ueS5yZXhAZXJpY3Nzb24uY29tPg0KPiAtLS0N
Cj4gIG1ldGEvY2xhc3Nlcy1nbG9iYWwvYmFzZS5iYmNsYXNzIHwgMiArLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9t
ZXRhL2NsYXNzZXMtZ2xvYmFsL2Jhc2UuYmJjbGFzcyANCj4gYi9tZXRhL2NsYXNzZXMtZ2xvYmFs
L2Jhc2UuYmJjbGFzcw0KPiBpbmRleCA2YmUxZjVjMmRmLi5jOTU1YmI4NjFmIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL2Jhc2UuYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNz
ZXMtZ2xvYmFsL2Jhc2UuYmJjbGFzcw0KPiBAQCAtMTQ3LDcgKzE0Nyw3IEBAIGRlZiBzZXR1cF9o
b3N0dG9vbHNfZGlyKGRlc3QsIHRvb2xzdmFyLCBkLCBmYXRhbD1UcnVlKToNCj4gIHB5dGhvbiBm
ZXRjaGVyX2hhc2hlc19kdW1teWZ1bmMoKSB7DQo+ICAgICAgcmV0dXJuDQo+ICB9DQo+IC1mZXRj
aGVyX2hhc2hlc19kdW1teWZ1bmNbdmFyZGVwdmFsdWVdID0gIiR7QGJiLmZldGNoLmdldF9oYXNo
dmFsdWUoZCl9Ig0KPiArZmV0Y2hlcl9oYXNoZXNfZHVtbXlmdW5jW3ZhcmRlcHZhbHVlXSA6PSAi
JHtAYmIuZmV0Y2guZ2V0X2hhc2h2YWx1ZShkKX0iDQo+DQo+ICBhZGR0YXNrIGZldGNoDQo+ICBk
b19mZXRjaFtkaXJzXSA9ICIke0RMX0RJUn0iDQo+DQo+IA0KPg0K

