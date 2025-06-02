Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CECC5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 19:44:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.7])
 by mx.groups.io with SMTP id smtpd.web11.4409.1748893460724191605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 12:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=iTLF0v0c;
 spf=pass (domain: siemens.com, ip: 40.107.130.7, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiYrIPTYLgAMX7XSMaVqn+HSkgrxHdcfCByhWypTWzpFw1n5qvOVPaGJ0485nid9r86tbnsNhqDlPDD1rLdx4cyg+P57qojAMHDnozF8jCb8teovit37OHCBYSxzRyOwlBnGxw7ztx5hc9AzNCPWvYPvHl8p9q0+euOzkrWiNUMoEYFSB3vusDQ/uUYxfvP+Hi1Wwo5M5JdmJRnu43HjifoWIPYnLrCc/QnIFuBKwl8cHkaIid8WBvPF+786UKS/PRTdPKPIqzbj0+FuWYicH1LMKIr0iKkA6PMpLlHkgEubtroV6YkWbbs4cv9/eYp2mH0DW/btWji7LrCaFzjBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTL3tWIYTLoqYMrogvakB2F57uNGLrNKmrU38elCsUs=;
 b=UnuDYerF0GPbXtIXzNTnaqmiYPgp+3pfT/QwXxFjLrJacb7eVy0Kv6Qy/hO+mZFh2l/9mrEJUM/OF89FN0CDANe8ycP+ZBCZhcd1znqKYINfCcbqt1gNIXNMF7J3Q+uM4Xgv6q9+aeFa+73rYQnnTBNuN+xpqRoIo6vjZ9mlPnbAHeiwjn/lw1LIOAzPmKHu5HMNL/i5r2a1+tE5VRyWQc2u+Xm8KUIk9fTOaUGpyvau5yJJBlMsEHCN1aPC7WX6atQ1kSR4DkuvKJsN5q5Z/09q269LBTIjM41cSsV2p9vtoqR7rJbuO84DhYlj0fBev7XKkOyt1J7qkr+Qe+yU0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTL3tWIYTLoqYMrogvakB2F57uNGLrNKmrU38elCsUs=;
 b=iTLF0v0cJOh9Omg7g01k78tcAOrTMiLmOChwwNmRr+aiTmkT+4aurSrKs/oWETWKZGJiAeEA5/44rshS8Pxk5mUs4gp4idd6AJ56LWfgW5zYlkesNAUO8Ctrl8U6tsbck7XsYRR0kcH1tyOF0pFd63XKg4Uf0OpGQ0b7K8kTEy+IMMGgLLqWHX9ANZPGvL4hakmH8uE6b1QLORTgxgYSsOXZsEM7nFoCIFSI8VS4kMZXDE/Av/2rYzjaZI9j7DQOl0qU8s3bulmh8M65r6qjUQ4Jflb5f/lrm09VibsRBs3chW2JE/+U5GW0ETTdtQSmI6GT3AVjQ8qkjbCckFbvXg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS2PR10MB7688.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:644::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Mon, 2 Jun
 2025 19:44:17 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 19:44:15 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "marex@denx.de" <marex@denx.de>,
	"a.fatoum@pengutronix.de" <a.fatoum@pengutronix.de>
Subject: Re: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy the
 vmlinux kernel binary
Thread-Topic: [OE-core] [PATCH v6 10/21] kernel-uboot.bbclass: deploy the
 vmlinux kernel binary
Thread-Index: AQHb05P8rWPXFCHk7kOxmQNtEsW8iLPwN5MAgAAOkIA=
Date: Mon, 2 Jun 2025 19:44:15 +0000
Message-ID: <54382081fb7bfccb83b8ebbd96942f48e3c3e56d.camel@siemens.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
	 <20250602075714.32122-11-adrian.freihofer@siemens.com>
	 <aD3yuMnWwfPcUs3p@gmail.com>
In-Reply-To: <aD3yuMnWwfPcUs3p@gmail.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS2PR10MB7688:EE_
x-ms-office365-filtering-correlation-id: 6ea5354f-ebff-4b94-cd64-08dda20ddb89
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YWpicFI4aTFER04xTDN1MGhZQ3dZaXp5MkI2bzAwTDlBMGNnNW5lcldtM2tT?=
 =?utf-8?B?blQvdVVoTHdoanNla3poYVFOWmZ1MitpaEFJMUN6Vm1ta21JVTZFSC9wNFFt?=
 =?utf-8?B?cmtkeE9nKzhIM0I4SHd2Z21vV0VNbXdiQ255aXBTUjlqUlo4OXNMejRLM0tx?=
 =?utf-8?B?NDlDWk9NeEEzKzRsZ0RhMXNYaVM1WE80dkErbm4zSmFzYUlPK1MveFhSRmVv?=
 =?utf-8?B?WWpIZ201ODRSYWlzSjFLRjNRVFBJME9WTVJQYWRjbmpIdXd0b2VVZkVuc1o1?=
 =?utf-8?B?VFdyTTFVbXBzVFp4Vy9FMktBMjZFcFZyNkcrMzIvNzdBTENidTNjNjBuNmtY?=
 =?utf-8?B?dVgxUlJIYUwzcTQ5WTlPVjRoQ0RCdXgwYzcxYUpackZSVXlkMzZrT2hYZkVM?=
 =?utf-8?B?RlBGSlFOaEEzeEZzYTc0cUVtQ1Bmb0tDTStHM0x2bU9vNUp0aStKdXJTY0k5?=
 =?utf-8?B?blJONklVeTE1Z3ZyVDFjZGE1OUlzRXByZWdxRUt4Z1gvMDRWYW9qajJ6d1BC?=
 =?utf-8?B?R0MwMFZPU2V5Z2M4V09NNnV4d3BpNzNPTmgxQTBENDVvRmQrb3JJaUluS2NY?=
 =?utf-8?B?bUc5Sm5kVXJFZXpOd1NJV21JbTdLV1M5QXVCWnlWc3A3dTdyQmhhUEMwVDdR?=
 =?utf-8?B?S3VTU0k0bXZyWE1tZUV3L2JLTHhSS3BUeWQzbllqMDVBRHFFOTU2d3RrR3h6?=
 =?utf-8?B?Z1ROMzBHbEliSFlwMHdnRys0NFgwN0hiZWZkVTRVNm85VVNpK2JIOW9iM2x2?=
 =?utf-8?B?TFF1UFpncHNEZXVsR2lpWlFFakozalUyY0t3OXVVb1A2UEE2MTNQMkpFNmtn?=
 =?utf-8?B?N0E2dWZERldPdlF5R0R4UEx3bXZNaW53REtaRmx6dHd4UTNKNFErZXJ6YndN?=
 =?utf-8?B?UDJVSWdaOU4yb0NwT3BDc1hET1BuMnBpb2c3NVZha00vZDRnWU9scjJ5cmdL?=
 =?utf-8?B?a1IxVVJrcVlrNXdVVjhsbzZxWHFDdGxxUUFmMWFNU1pGVDUrL05IUHNLZjlL?=
 =?utf-8?B?c0tIVXh1L0FPZ2ZtNSs1a1pOZWRjbEVwRjZsVGl5RVd2WmU1Mk0vaEtjWFdr?=
 =?utf-8?B?cUJnVG1ncE5PaW1wS2NNYUtEUUpuZm1yME53NmdWNGl0aDA4eXdaM3c3M2c1?=
 =?utf-8?B?Uk1CMUIvY0ttTFl3SDV2ZXRMVFU5S2U4NjE1RFR5SmZpN2ZNdzRiOWpMZXdq?=
 =?utf-8?B?dk9yUGdBaE9YL0NMemFvY29rYTd2L0t5akh5VG5jeU1UUW1kTFhkZkhmbzFx?=
 =?utf-8?B?a2Z4RkZFem5QRnFzR3FxUDcxR1h2bHRqWVRMa2cvU0UvVGZGQUJldElLSlhI?=
 =?utf-8?B?RlFENXYzZHNoUnEwcGlnbHJRQ1pzM3M1Lzh6T1E4ZXRVZzlCMmhmYzljeVRa?=
 =?utf-8?B?TS8rRlF6OVVQTEd2YXpHandEY0EzYkpHY2k2SGlmbGk5TTc2REtweHExcEZ3?=
 =?utf-8?B?MCtoNk1mdWpRVDhDd2lIbXFhYVVadDMrUlpOZHU0aE1pYU91OGVqV1BSRVpi?=
 =?utf-8?B?VndLYlVhakphRDl0cHozSThRamtsbFBVME5YdnkyT08vVWVxNW9QUkJVT1cy?=
 =?utf-8?B?RVA0M2tXYUR3NW9CMGpqbWIrVmpoSWpPRVU5SlNERWVkQjJhRXhEVGdwSlNk?=
 =?utf-8?B?Ui9BQ3BNaFZqRmRJWDdsQlJsNjl5RzlWQWVFc1FndDF0M20vRFphVWJOcys5?=
 =?utf-8?B?TGlPTGw1MWdicTlUNUo5bnpxdllGZy9VWmszVkZMdjdDN1dqV1R4dDhWWjZU?=
 =?utf-8?B?czNVUWVpWkZuZGlPN2IrU20wZjVZSnNmeWk0aWN6QlQ1Q3F3RnUrOUIxU2t6?=
 =?utf-8?B?aDFzNitrUnpDRVkrZXVkUVhmY284eEpQQlpsWTFtSmxGQTE4aDFrVVRoU0hN?=
 =?utf-8?B?OFJPRmVYUmJld09CRjZBeEdUUFFCWlpUQy9QNkdVdms2UWJjakdtUlRaYy9W?=
 =?utf-8?Q?vrTvxA3q6Ac=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dDBwVHVqYzQ1OWRUV0dJRVlMMXdheVNYREt0eVRFN1FoUnRTc2Q3VjAxVVBN?=
 =?utf-8?B?blN0dDA3bGppWU52Mm1RQ3RGTHV1bmJyZDdjVkV6bHBYVnRYU29hMjI1cHVo?=
 =?utf-8?B?aUUyVmIwSHlEZmVzNXdaZHVHNEQ2aGlWNjRZRU5HdFhCVWJzVC9Ocm1KR1lm?=
 =?utf-8?B?d3pUU0Y2RWg4UWpyNHlpdkhyL0x4M1poZ1puaWlIRWY0aGxJNUR2VmJNMXFX?=
 =?utf-8?B?K0VFc3g1Z0tSV05DVTJHK1R2amVxdXFsQlE0MzRTMkJ2V0JVbFY3MXc1Zjdi?=
 =?utf-8?B?cHdyTUVuT2M1di9YWG53UmtrZVlFK2VFSmVqSWRHSjQzeGV5WFcwVHZHZWZz?=
 =?utf-8?B?OEp2ZU9FeFpRZS9JUlBRWDBJNGhjOFlUWHdld1FzcHNYOTNpQys1Vk1sK1NW?=
 =?utf-8?B?T1ZnTXZ4eE9NTXVNTkdOSHcxNDU2UzVRdkl2YVZyTE5RcjRWS1hicmpOekdG?=
 =?utf-8?B?UDlrQ0lhQ0ZJVWhxSXNDMkd6UDRqRzU0QnpicWh4RGk1Z2hNSnBMZFpnaXFR?=
 =?utf-8?B?d1FLYko3RlFIMEZwSFRiU0d6SDdRYVpON0tkNHRiNUh5RFp6Sit2d1dkazZN?=
 =?utf-8?B?bWhKMFY4QW42NDlpZEVIRjdyNGxJcDNCSTBSZ2VQNm1CODFmaVhSa3NXWnVt?=
 =?utf-8?B?L2tPMk1EWmQ0aFJ3MnpjNlp4QzhOSDUvOExiY2NtdFJOblhrRmd4UkpUdXhQ?=
 =?utf-8?B?UHZIQWZIajdpWE10SXVvcVVIZ1ozNW1SUDk2eGtLRmpuUUdPVnZic1h3Qll3?=
 =?utf-8?B?OWtOYVhWdERJeU5WbG5LeUNoNkg3UnpJOXBaV3JpTDNxUFhiWDgxRVNmY3BU?=
 =?utf-8?B?ZEVxSXgvMk92SERTL3BaS3IrYjJ1blJsUmQzY3hlT3R0MWgvWHNVeXloVWMv?=
 =?utf-8?B?Zk03NWM0cUgxOVc0Q2Y4YW41Tk1aME1Td2Z4WjNTZ2hmSnVlR0o4M0c0V2FZ?=
 =?utf-8?B?NUN4dVB0R1dlb2xZZlhGZVFiYjZlS3ZCeXVEdWYvVndTaXBHZnZqY1JUcG1M?=
 =?utf-8?B?dnBYbmJuQStQRkhGcnBVY0xhUEdKbmUxK0ROR3krS2ZxZHYxVkxaeXJwYWFp?=
 =?utf-8?B?OE13TkZxa0VhT0tSZWFpK3hYM0g2ME5maW15eUhZKzBnNHM2V1dPNFRpYzRS?=
 =?utf-8?B?ZVkzWXo2a0NleFl1bXVWSmFpTCtXcVdZSk9rU2RuUi9LQ25sNnJ2RE52NU5U?=
 =?utf-8?B?emJiV2ZJZTdCNHljemFIWWUrQVJyUnY4WTdrK3gvci81N3E3QWE1c21HOHRk?=
 =?utf-8?B?WXVJTzBCZXZJVnhQbE5RVHBBU0Vhc3lqUVJIZGxUajRJQkRkNmMxMFFYcUlu?=
 =?utf-8?B?cXoxME9xcTZkSTF2bmFLZ3RJTjVLQ2NpUktlUnRwRzdVZ2RIR0phdDhmRms5?=
 =?utf-8?B?Z0VsTXRjdTVaRHRqekdIK2tZdU51bE9HZ25zSXYrQjJNb2t3OVJyODYremJl?=
 =?utf-8?B?Mml3TVhQa1lvWlhrckpZeVF2S1lBWk83MlZJeXhwUTg0aWRYQ2hzM3YwWG5a?=
 =?utf-8?B?TFk3REx4S3NBMUtqMFJ2Wjh4NmRacVNFUlltL0NvOFc5ZVRIV1ZjWUVRNng0?=
 =?utf-8?B?cWc4bG43SUpEZVBna05IUmdaaFZUTDhxaTF6b2luNGdzazRzME9idkh6dUJS?=
 =?utf-8?B?YU1vQm1DR0pnY2dzUVNjajdBdjR3SUo0Qmg2MXcvaHRBaEE4MGppUnVtVTY1?=
 =?utf-8?B?WXg5TlJ5UUNUeFRKTDlNaU5KN3IrS05Ya3NjWXdHS1FMSEZKV2J3SExkUVF2?=
 =?utf-8?B?elNxL0gyc2lBcUZhVlBNdklCV0lJblBPZG1MWDc2b0QzbittZHdyWWJ2RWNi?=
 =?utf-8?B?VjJORVZ5OHpVL1c2MG5oc1hVS0tWWjVUVkxjYy9FWmI4WldvUXhWZkwydVFE?=
 =?utf-8?B?QXJZVVVyV24yVHVTZ05KaEwydVA0ZFhGRnBOd28ybVo3ZXdWNDNBZWtLYTBM?=
 =?utf-8?B?WG1hREpuZkVhK2dTU3VaV01TOUxkb2NaZ0pwNUJSOERzT0xKeFFTMVIrTEZN?=
 =?utf-8?B?VGU0VngyTTJnSVZKZGlaYk5CbUxoNVRRMHpRNTVZYmZOTWVsL2Qrcm1USko0?=
 =?utf-8?B?MyszYUhRbGdmRDYzRTQ4bnVlbVJQSWZLZU1mZ3pWV0E1R0NrbVhxUTgvVUhi?=
 =?utf-8?B?Mnc0eUdyOEhuL1pxbG02S3pLZkMrYnlKU3pRM0ZUelRkSWczT2FaM1Yrd2Yy?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09C7A8830E6C954E98A2243D53B3E958@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea5354f-ebff-4b94-cd64-08dda20ddb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 19:44:15.7501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EWLCCw0P2XpvM50rniUItexO5F+SEZtGngmG4F4FMdzWA+m4G5s9hAJNcsX17ZuOx33Wnx/UN/DLls5hbjg6zjkYGGfQd3NqhVJ4alp3EhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7688
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 19:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217729

SGkgQnJ1Y2UNCg0KT24gTW9uLCAyMDI1LTA2LTAyIGF0IDE0OjUxIC0wNDAwLCBCcnVjZSBBc2hm
aWVsZCB3cm90ZToNCj4NCj4NCj4gSW4gbWVzc2FnZTogW09FLWNvcmVdIFtQQVRDSCB2NiAxMC8y
MV0ga2VybmVsLXVib290LmJiY2xhc3M6IGRlcGxveQ0KPiB0aGUgdm1saW51eCBrZXJuZWwgYmlu
YXJ5DQo+IG9uIDAyLzA2LzIwMjUgQWRyaWFuIEZyZWlob2ZlciB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4NCj4gPiBGcm9tOiBBZHJpYW4gRnJlaWhvZmVyIDxhZHJpYW4uZnJl
aWhvZmVyQHNpZW1lbnMuY29tPg0KPiA+DQo+ID4gRXh0ZW5kIHRoZSBrZXJuZWwtdWJvb3QuYmJj
bGFzcyB0byBidWlsZCBhbmQgZGVwbG95IHRoZSBrZXJuZWwNCj4gPiBiaW5hcnkNCj4gPiBpbnRl
bmRlZCBmb3IgaW5jbHVzaW9uIGluIGEgRklUIGltYWdlLg0KPiA+IE5vdGUgdGhhdCB0aGUga2Vy
bmVsIHVzZWQgaW4gYSBGSVQgaW1hZ2UgaXMgYSBzdHJpcHBlZCAoYW5kDQo+ID4gb3B0aW9uYWxs
eQ0KPiA+IGNvbXByZXNzZWQpIHZtbGludXggRUxGIGJpbmFyeSAtIG5vdCBhIHNlbGYtZXh0cmFj
dGluZyBmb3JtYXQgbGlrZQ0KPiA+IHpJbWFnZSwgd2hpY2ggaXMgYWxyZWFkeSBhdmFpbGFibGUg
aW4gdGhlIGRlcGxveSBkaXJlY3RvcnkgaWYNCj4gPiBuZWVkZWQNCj4gPiBzZXBhcmF0ZWx5Lg0K
PiA+DQo+ID4gVGhlIGtlcm5lbC5iYmNsYXNzIGluaGVyaXRzIGFsbCBjbGFzc2VzIGxpc3RlZCBp
biB0aGUNCj4gPiBLRVJORUxfQ0xBU1NFUw0KPiA+IHZhcmlhYmxlLiBCeSBkZWZhdWx0LCBLRVJO
RUxfQ0xBU1NFUyBpcyBkZWZpbmVkIGFzOg0KPiA+ICAgS0VSTkVMX0NMQVNTRVMgPz0gIiBrZXJu
ZWwtdWltYWdlICINCj4gPiBTaW5jZSBrZXJuZWwtdWltYWdlLmJiY2xhc3MgaW5oZXJpdHMgZnJv
bSBrZXJuZWwtdWJvb3QuYmJjbGFzcywgdGhlDQo+ID4gY3JlYXRpb24gYW5kIGRlcGxveW1lbnQg
b2YgdGhlIGtlcm5lbCBiaW5hcnkgZm9yIGluY2x1c2lvbiBpbiBhIEZJVA0KPiA+IGltYWdlIGhh
cHBlbnMgYXV0b21hdGljYWxseSBieSBkZWZhdWx0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QWRyaWFuIEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtdWJvb3QuYmJjbGFzcyB8IDExICsrKysr
KysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtdWJv
b3QuYmJjbGFzcw0KPiA+IGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtdWJvb3QuYmJjbGFz
cw0KPiA+IGluZGV4IGQyYTYzNTI0ZWNlLi5lMjZiYTZmMGFhOSAxMDA2NDQNCj4gPiAtLS0gYS9t
ZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC11Ym9vdC5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9j
bGFzc2VzLXJlY2lwZS9rZXJuZWwtdWJvb3QuYmJjbGFzcw0KPiA+IEBAIC01Niw0ICs1NiwxMyBA
QCB1Ym9vdF9wcmVwX2tpbWFnZSgpIHsNCj4gPiAgICAgZmkNCj4gPg0KPiA+ICAgICBwcmludGYg
IiRsaW51eF9jb21wIiA+ICIkb3V0cHV0X2Rpci9saW51eF9jb21wIg0KPiA+IC19DQo+ID4gXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+ID4gK30NCj4gPiArDQo+ID4gK2tlcm5lbF9kb19k
ZXBsb3k6YXBwZW5kKCkgew0KPiA+ICsgICAjIFByb3ZpZGUgdGhlIGtlcm5lbCBhcnRpZmFjdHMg
dG8gcG9zdCBwcm9jZXNzaW5nIHJlY2lwZXMNCj4gPiBlLmcuIGZvciBjcmVhdGluZyBhIEZJVCBp
bWFnZQ0KPiA+ICsgICB1Ym9vdF9wcmVwX2tpbWFnZSAiJGRlcGxveURpciINCj4gPiArICAgIyBG
b3IgeDg2IGEgc2V0dXAuYmluIG5lZWRzIHRvIGJlIGluY2x1ZGUiZCBpbiBhIGZpdEltYWdlDQo+
ID4gYXMgd2VsbA0KPiA+ICsgICBpZiBbIC1lICR7S0VSTkVMX09VVFBVVF9ESVJ9L3NldHVwLmJp
biBdOyB0aGVuDQo+ID4gKyAgICAgICAgICAgaW5zdGFsbCAtRCAiJHtCfS8ke0tFUk5FTF9PVVRQ
VVRfRElSfS9zZXR1cC5iaW4iDQo+ID4gIiRkZXBsb3lEaXIvIg0KPiA+ICsgICBmaQ0KPg0KPiBJ
c24ndCB0aGlzIGFkZGluZyBleHRyYSBzdGVwcyAvIG92ZXJoZWFkIHRvIGEgdXNlciBvZiBrZXJu
ZWwtdWJvb3QNCj4gYmJjbGFzcyB0aGF0IGlzbid0IGJ1aWxkaW5nIG9yIHVzaW5nIGEgZml0aW1h
Z2UgPw0KDQpZZXMsIHRoZSB2bWxpbnV4IGlzIGdlbmVyYXRlZCBhbmQgZGVwbG95ZWQuIEZvciBz
b21lIHg4NiBtYWNoaW5lcyB0aGUNCnNldHVwLmJpbiBnZXRzIGRlcGxveWVkIGFzIHdlbGwuDQoN
CldlIGNvdWxkIGFyZ3VlIHRoYXQgdGhpcyBkZWZhdWx0IGlzIGdvb2QsIGJlY2F1c2UgYWxsIHRo
ZSBkaWZmZXJlbnQgdXNlDQpjYXNlcyBqdXN0IHdvcmsgKGZvciBsaXR0bGUgb3ZlcmhlYWQpLiBG
b3IgdGhvc2Ugd2hvIGRvIG5vdCBsaWtlIHRoaXMNCm92ZXJoZWFkIGl0IGlzIHBvc3NpYmxlIHRv
IGFkZA0KICBLRVJORUxfQ0xBU1NFUyA9ICIiDQoNCkJ1dCB3ZSBjb3VsZCBhbHNvIGFyZ3VlIHRo
YXQgdUltYWdlIGFuZCBmaXRJbWFnZSBzaG91bGQgYmUgY29tcGxldGVseQ0Kb3B0LWluIGFuZCBj
aGFuZ2luZyB0aGUgZGVmYXVsdCAoaW4ga2VybmVsLmJiY2xhc3MpIGZyb20NCiAgS0VSTkVMX0NM
QVNTRVMgPz0gIiBrZXJuZWwtdWltYWdlICINCnRvDQogIEtFUk5FTF9DTEFTU0VTID89ICIiDQp3
b3VsZCBiZSBiZXR0ZXIuDQoNCk9yIHdlIGNvdWxkIGxlYXZlIHRoZSB1SW1hZ2UgZXhhY3RseSBh
cyBpdCBpcywgYW5kIGZvciB0aGUgZml0SW1hZ2UsDQppbnRyb2R1Y2UgYSBuZXcgYmJjbGFzcyBj
YWxsZWQgJ2tlcm5lbC1leHBvcnQtdm1saW51eC5iYmNsYXNzJy4gVGhpcw0KbmV3IGNsYXNzIHdv
dWxkIGJlIGVuYWJsZWQgYnkgYWRkaW5nOg0KICBLRVJORUxfQ0xBU1NFUyA9ICJrZXJuZWwtZXhw
b3J0LXZtbGludXgiDQoNCg0KQW55IHByZWZlcmVuY2VzPw0KDQpUaGFuayB5b3UgZm9yIHRoZSBy
ZS12aWV3Lg0KQWRyaWFuDQoNCj4NCj4gQnJ1Y2UNCj4NCj4gPiArfQ0KPiA+IC0tDQo+ID4gMi40
OS4wDQo+ID4NCj4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6
IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9S
ZXBseSBPbmxpbmUgKCMyMTc3MDEpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE3NzAxDQo+ID4gTXV0ZSBUaGlzIFRvcGlj
Og0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTM0MjQ0MzUvMTA1MDgx
MA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWINCj4gPiAgW2JydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo+DQoNCg==

