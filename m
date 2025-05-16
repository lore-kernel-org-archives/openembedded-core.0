Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F85C3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:44:44 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.web10.9502.1747388680276515526
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Sip79INJ;
 spf=pass (domain: siemens.com, ip: 52.101.72.18, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGC7te2AlzLi3KUJXc2R5l3ewAlK+xBA9Tm2Gj3CwyiFFyXxBJnUj/+W4gwf4+a87ffb5xnYsKDguF+f87t7otmUBUXHQvhEASXJqq7DPVSTyLg3dEYSPbrByPWRDDOKyN1f7cFtdjjEbdfNocGHFy66ugRliOztIQQCwCqu23n2AiutgGAp3VxLG1PXNgcBsq5F2NrZ212zhMepeUo2y0oLMmSR8sh5w49+QZ4VFNWhW/pMSauDWaQr2Hv0PrBw6BxKrpUaqEvH09kVNrUDlrTVk8JGpbSUnggjexoKvKkPALPFaJ7Wj7X9zOd9nbOLK0xqRxZNdxIbdxIvftuOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq6WRlpg0uqpuTyH7nq4yMGXvI2CNvmG0WdDNU0iXSc=;
 b=nlv3PsSYBaERC5eSLUDoXiwjhPK5DNC64ezWBoh6P9Zk64RRZ4sJhAtG3qT53zzSpyuL8f2wqAfOaNnRXL9bJYda23xc7aFqMSNmnrY0WdkJUZYCeekvbc/q6f1UNygrFI0kngWYsiKm0zoK0v9s4xrYdZx552jd3B21S3C+XNvoo4Gcs+6hqTrMdKyioVGVSak3pj9HIPi47WqLKEX61EgfBsXCL+VDRTHb/+1PADWqlMbmD52D6kkjd+k6UOFgLWNqBklZzfgrEaqqytTSjJdsB1/LBtYNupAza54E9i+xckpHvcuDR6UzFGynDdlV/gqwpXW4mFoLV+PWNni3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq6WRlpg0uqpuTyH7nq4yMGXvI2CNvmG0WdDNU0iXSc=;
 b=Sip79INJO4Absi1YH0nY5JD0AANrfMJgKRRHysqlo3vW+B5rQ0hoctbPAgWU6+YcLvDRI/nRR1N5FNwkGvt8n9CDPvGsCBdIH2Xe+gpA4p5Nkw/CA5JFuYFkt2x3rG7UEnrzv0DO/5u++8iITsOjWn6BGcyGpvm6711zEsZmDmYp8b9Fu8P2Uttk9q9qZEBMyN5fdYXpJSJtdQap+va41OBdda3iC1yy8+qHq3MmLRi6Z+LY4coF+TtZ0gpcTVAW1akH+vBVDis9x5JQ4dVTguy/EVyyKtBh0IGgr7Xc9UT2JnCXZJGJxOLQrcuYHjoGF4QQZbDQngNsXUPZ6ywxtg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB4PR10MB6944.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 09:44:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 09:44:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
	"yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] procps: fix runtime version when using git
 shallow tarball
Thread-Topic: [OE-core] [PATCH 1/2] procps: fix runtime version when using git
 shallow tarball
Thread-Index: AQHbxkVf8b3TI8/41027RiJ07Bh/BbPU/3OAgAABfpA=
Date: Fri, 16 May 2025 09:44:36 +0000
Message-ID: 
 <AS1PR10MB5697B8FE4755F74E78629793FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250516093127.506158-1-yi.zhao@windriver.com>
 <CAMSfU+5Ef=BO7AnY-gTeFb4+m6ZmNJMA=R1DkAFZ3vStd6KicQ@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+5Ef=BO7AnY-gTeFb4+m6ZmNJMA=R1DkAFZ3vStd6KicQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=82969b49-69e5-4b51-aaf8-4ff8fe05b377;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-16T09:41:47Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB4PR10MB6944:EE_
x-ms-office365-filtering-correlation-id: d646993b-dd6b-4af1-1c00-08dd945e4510
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q0dzOXFBakEyNWxrbUhpQXVMb2FiZ2RoanJXcy81RnZlNXpicTQxazRlbnFx?=
 =?utf-8?B?YlNjZzdPNEx5d3FwK0ZzY3hqRmpLM0VGK1crN0x3a0xUZ1A1aWpKOHJZU0Rr?=
 =?utf-8?B?QVVXMkFkM2VTQUZTU2hXckVRRzMySkdsMFVKc0VIWXd2Y0NqSThBMzBzYVl3?=
 =?utf-8?B?ZVo3MnpXa1c1NEcyRVhDMVVQbHRXUGZhdkMzRmF0ZGladXA2eFRTSnRmTW1v?=
 =?utf-8?B?N0FlcjBBbWh6YnYyV1RqbVJIWGIzVm5HbEpmSG8yT1hsV09peldJd1JDem9l?=
 =?utf-8?B?UnI5eC8yaTc1Y1RjYjZESUxOQS9YTmVvK0h5Q2FYQnlsQ3dpWldENWN0REpL?=
 =?utf-8?B?WnlnemJNdEQ0TFhkNGFtL0YxbkYzR1F0d2NvTlR0b09RWTJ3R1pVVkZDV3hu?=
 =?utf-8?B?TDBGeU9oUGVZUVBCbzdWUnpkdmNPZjYwZ2JTL09wN21zZ2MvZG9yU1I3bGFa?=
 =?utf-8?B?WE1ucG40YkpMRmRPd0JqVUFVQ3cxdG1WKy92SzFEVXhZTmw5OGwxVU1MR09s?=
 =?utf-8?B?QzRRUyt6RmJxOTRzaldSOU1CMy9lWU9YWWI4UjJ3bXpWdVllcy9sWEYzdXl3?=
 =?utf-8?B?TURHNmx5VTh6S1NKZmZaL0pTenk5YTZ6bXR6SS83amR2QmVtcUd3cHgzWnQw?=
 =?utf-8?B?RDdpbHlqamZMUWZRc0o4Smp1VXgzZStNR25FcU5jMSs0TnJmb2kvZ25uTC9i?=
 =?utf-8?B?dGZRR1RNNVJ4WjVvMlRhQ0tWNUhSb3A1ZXpaTmFscUhBUFhLQ1lEazdNWEtu?=
 =?utf-8?B?ZTl3MFBxNGhhRytlUndhblJMVVEzazNEcU54YjNzSmRCYmhmOU1lZzVabDlJ?=
 =?utf-8?B?NEgyemNnd0dYZHp6QzRDbFJCR2RZcDFkT2lUYzR0YjBhNFBHVmkra2g3cmJ1?=
 =?utf-8?B?VDVTeGVGTDFQakwxcnFsdXkyWGFLMUZRMDkzK2NvMVc5U2lxd05XTmI4THIz?=
 =?utf-8?B?YkN0R2V1eElvWGdDbGlJVmJTMlVIZmZnNkU3cEFHV0F1SmQ1cUZNbDA3NldZ?=
 =?utf-8?B?aHlVVEdNY0VaWGI3ZjlqeWRoLzdnV09UNHdSZjd2d2M2akc2cWVURnNVcHRJ?=
 =?utf-8?B?Wm1WSjRWWkJ5V0djYlY2ZUpmYXZVWkd0c0Z6RTdqUU9yeWNwdjJDNTFLVXEr?=
 =?utf-8?B?LzhBd3lpTkJvUnloOGQrblJPNzhGQm1pLzZLUmtpVWtJbnBzWTdoNWJ5T0hC?=
 =?utf-8?B?OXpqWGZTUEJ0SjBQbXhyS2g3MGZuRFNWa2ZzUGVuWnAxcUZpQWdlR2ZySEdj?=
 =?utf-8?B?aUszODNlZjkxeHNWSzc4dlZEUGtIMnEwUUsvdUoxM2xuemVFaDlpZFBBYzBY?=
 =?utf-8?B?ajZIVzI2dDYyUTZuVVBtNzdCenRyMnJ2d3llejkvVjVjRS8rYVkyUk5TQ2Z3?=
 =?utf-8?B?bFZZbTVZcGJDOFVXWGtGczdNaGJ0czRTSmZORThuZ0Y0U3FHb0F4ejhQV3RQ?=
 =?utf-8?B?dVZ2Z0R5WWg3WVhMQ3hnUy9hbUU1S3ExeFZ1VEhjS2VSVmZ1TVVkNG9ITWxp?=
 =?utf-8?B?RHVrZENodU1Zb2xMU09MNEVtdTg0MG5qK2pVbmVmM1BSUkNZelY5VHhEdFlD?=
 =?utf-8?B?Tzd6UUJmTmYzMStaeldObWhwQ1FmSGplb0FGZ3RuOG40UDNwVmg3SGVuRmtF?=
 =?utf-8?B?NDFHYWpBVlNhK0t0SzNxa1V1TE1SYWQ4dFArTGdUZnJaK3ZxN1I0WkYvNXZq?=
 =?utf-8?B?V0ZIQmtvTWxLdGRIRmprbGxrNEFDbWNwditKb0lkbFladURnL1ZhRDNNc2ZE?=
 =?utf-8?B?ZHYvQmh4SHlHZnR3T3k2aVZlaGtxZXZXQWo4aXVhcTFqMkIwVEhWNDQ5d3JD?=
 =?utf-8?B?QmMyOElkVFJhOVJZYlpqRzdGNDNyUnUrdU5zWEo5VWVTWmN1MW1oMFVXS05H?=
 =?utf-8?B?RXlsTm1tMzNMOHdjUkh6VUFNa1UxT2ZjM0V2UUhqaXlmUHlHSFdLeWEvaVFQ?=
 =?utf-8?Q?/QodLyGIJPc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SHpzVi9qVWF5MHNnWi9kNXcrMWFlckJnT25oRzlhRW1tYjh5V2JjUWpGZEJw?=
 =?utf-8?B?eVJOUWMrVnhGbG5JaGNHT2lncVFzZ1V5L3E5eTJaeGxXOWtXZXZPaHp2Z2VG?=
 =?utf-8?B?L2hTcjRuVmhvaDBURE9EeUh1eGxsQVBHWUVULzFyYTA1YTQ3V3cwcXZRdnRo?=
 =?utf-8?B?MitCVXZGd0VvM3IzakR3S3h2WnZrbjRXZWpvN0pqaHpGZVg5b1I0Rys3Z1Nq?=
 =?utf-8?B?d00yTEZQaTA1c0xpY2dvSlZVNnBCM1BWQi9hTU9FTTg4MHJQeDA0VVA5cGJO?=
 =?utf-8?B?aUtxMFJvbUJvdis3ZTdlWmM4aWk0VGFyeTYyZXRtKzVHLzNaaUc4L2R1ZVJk?=
 =?utf-8?B?SWpGSURaUFNTdXVzMUxIVDNibGN2Vk42NWxFTkU1dkx4bzVzcHlWNkovTlpt?=
 =?utf-8?B?TVRZaVNONVpzQmg4TnVqMi92ZUFWdkZWU3NXUlhFekZFUmtEeTk5b1BGZUhL?=
 =?utf-8?B?ZFhqTTcyYzJ5bHp2UW9mZHN2czk1dDkrZVVOVUVZanhjY3k0VThRcTNWLy80?=
 =?utf-8?B?K0Y0WnZOY2Fsdzh0TXp3MnVBYXNYSzhrYlM2VTBPN1h3bmdyV2JoWUR4czJE?=
 =?utf-8?B?ZDVIa2xEZ1ZwS3lDM2JrSXo0cTh4WG5ZWUNob1gyQ1ZTdytRN1RFcnNvUk5x?=
 =?utf-8?B?eUVnOUhTRExJKzYvYmlNMjRkdWkwdlMyV3BldGlYT0J3R25zUThOam8zUFF2?=
 =?utf-8?B?a1lKWllVYVhJemVHUG40NXVnNGdxUGdXL2d4NmxlV09XMXptd2VzVlJGVWdq?=
 =?utf-8?B?a0dDZ2F0bXY1dC9sTFViK1RXYU9RVXZRc2VUV1E2djlmL09CdnFTa2RJNVAr?=
 =?utf-8?B?ZDN0blNSRlJueDQ5ZmlVVU5CT1BzQ0JxNzdtdXgwSWlVQW90MUpjM2UzWXJt?=
 =?utf-8?B?OHpQS2ZyTzNYRHRYa0kwWlJwQ2lCU3h3RGhCSkZ6dGF4MlcwU0FJakR1SUli?=
 =?utf-8?B?R2p0ZWdkL2d6aHNXdmVRNitObzE2cW9tRElpYnFhemk3SncyN296L2ZUTk41?=
 =?utf-8?B?T0JiRlAvQ1pxWDRwVUZVVmUxcDZIa3dmL3Z4b3FUUkxSYTZPV0VoRUlBTWdZ?=
 =?utf-8?B?VXpMOXFONTBTTWZ6dUEycVdtRitZZGY3SmhMdjNZZVlZQldyV1NQYUhFcmxh?=
 =?utf-8?B?WHhIM3BZMVJWOFRRR3Bsd3ZSTTBGT2Y2TVVnSFRlQVUzZllsbGtCZDhBYVdM?=
 =?utf-8?B?S2pYZi9scFFCRTR4WUtKanVjMFRJZ1E5M3pGRklVRU5IYjQvbVZYUHdSa240?=
 =?utf-8?B?SHBXSldWMmdHS3RBMURDbC9ydUJRYlRJdGVvMFVBNHBsRlZGUmNhSHBnSEpP?=
 =?utf-8?B?cnU2dHVRcDg1czhFN2lidldQOFpzanlqcFNNTUozaFlnQnE0Y3RZaW9xN0xR?=
 =?utf-8?B?SEoycnlJdVRVcm14dUxyTGlUcE1hTVI4MnJId1B0SVVia2ZzbXAxQjJVZ3hx?=
 =?utf-8?B?WHNwak1MZzJJUHl6SC9QOVh3SEsxdjlBN2Fhd3NOT3J1YVBGOGJyOU0yZFhL?=
 =?utf-8?B?T3dNZ0NITTRYRkw4MC9kSTJEUFU2THdQVzFSRmoyaDA1VTJ3c29Od0ZFdXVj?=
 =?utf-8?B?SkNoeTAxTUwyWm5mNFQ4R3BtQVRKemUrRkxZZXE1UDZ6VGJMR0hBaGNqOGhz?=
 =?utf-8?B?M0d5dmZZU3VrVzBaaytXK1Vpcm0zcjBIc1ljay9ZTXJzak1CdllOUDFUS1Jh?=
 =?utf-8?B?bGxOSE9tazhKMmhJYTJ1OGJnUUxKZzM5S2MrU1FobjVYM00rcUpLUTAyaWVu?=
 =?utf-8?B?ZEtBb2JQQWhlNHZKaHlsYzRBc0RPUnlLT3hSTnJYM1plYzJrbkY1TytwQ2kx?=
 =?utf-8?B?YWJOdVZRekljYnJDY2x4bFpTK1B4MVVqYmNXaDNxSHVYNFpWblA2cWNCbjdS?=
 =?utf-8?B?OHlYbVRWblIzTTZRSFJxa3czcDFCUk1RQUM5WktJYUQrQ2loNjVTWHlwekd6?=
 =?utf-8?B?NGg3VzNzdEZwSTlnVGVRcWQ5STdHbUU1WFV2V3hML242eVRPeVREOFNUQ0U0?=
 =?utf-8?B?RytUQkpwcHhKNGZzdlRtTEh4MmdPUmI2eERuaTZtTUhIOVZubFlrMnhwS3hF?=
 =?utf-8?B?N3EvOWhTcHN3TmdYMGNqT2NVd01nZGFoelFTUis5TW1USnoyWjl1eXA3ZGda?=
 =?utf-8?Q?F7oRCLq23c8Zd6JK/jtBDNzXS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d646993b-dd6b-4af1-1c00-08dd945e4510
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 09:44:36.2658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIJDkpNCrGdzlJ70s6XUER+PAH1WZwNQ3U3TyeVAczS4cyE3fXoEBlOX3z7ZZSDuGm9dRODyDRcjwMGHdC9e4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216735

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBNYXkgMTYsIDIwMjUgMTE6MzYNCj4gVG86
IHlpLnpoYW9AZW5nLndpbmRyaXZlci5jb20NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yXSBw
cm9jcHM6IGZpeCBydW50aW1lIHZlcnNpb24gd2hlbiB1c2luZyBnaXQNCj4gc2hhbGxvdyB0YXJi
YWxsDQo+IA0KPiANCj4gDQo+IExlIHZlbi4gMTYgbWFpIDIwMjUgw6AgMTE6MzEsIFlpIFpoYW8g
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0KPiA8eWkuemhhbz1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IDxtYWlsdG86ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gPiBh
IMOpY3JpdCA6DQo+IA0KPiANCj4gCVRoZSBydW50aW1lIHZlcnNpb24gb2YgcHJvY3BzIGlzIGdl
bmVyYXRlZCBieSAnZ2l0IGRlc2NyaWJlJyBjb21tYW5kIGluDQo+IAlsb2NhbC9naXQtdmVyc2lv
bi1nZW4uIEJ1dCB3aGVuIHVzaW5nIGdpdCBzaGFsbG93IHRhcmJhbGwsDQo+IAlnaXQtdmVyc2lv
bi1nZW4gY2FuIG5vdCBnZXQgdGhlIGNvcnJlY3QgdmVyc2lvbiBkdWUgdG8gbWlzc2luZyBnaXQN
Cj4gCXRhZy9jb21taXQgbWVzc2FnZXMuIFRoaXMgYWN0dWFsbHkgYnJlYWtzIHJlcHJvZHVjaWJp
bGl0eSwgc2luY2UgdGhlDQo+IAlnZW5lcmF0ZWQgYmluYXJpZXMgc2hvdWxkIGJlIGNvbnNpc3Rl
bnQgcmVnYXJkbGVzcyBvZiB0aGUgc291cmNlIGNvZGUNCj4gCXBhY2thZ2luZyBmb3JtYXQuDQo+
IA0KPiAJQWRkIGEgLnRhcmJhbGwtdmVyc2lvbiBmaWxlIGluIHNvdXJjZSBkaXJlY3RvcnkuIFRo
ZW4gZ2V0LXZlcnNpb24tZ2VuDQo+IAljYW4gZGV0ZXJtaW5lIHRoZSB2ZXJzaW9uIHRocm91Z2gg
dGhpcyBmaWxlIGluc3RlYWQgb2YgJ2dpdCBkZXNjcmliZScNCj4gCWNvbW1hbmQuDQo+IA0KPiAJ
QmVmb3JlIHRoZSBmaXg6DQo+IAlyb290QGludGVsLXg4Ni02NDp+IyBwcyAtVg0KPiAJcHMgZnJv
bSBwcm9jcHMtbmcgVU5LTk9XTg0KPiAJcm9vdEBpbnRlbC14ODYtNjQ6fiMgc3lzY3RsIC1WDQo+
IAlzeXNjdGwgZnJvbSBwcm9jcHMtbmcgVU5LTk9XTg0KPiANCj4gCUFmdGVyIHRoZSBmaXg6DQo+
IAlyb290QGludGVsLXg4Ni02NDp+IyBwcyAtVg0KPiAJcHMgZnJvbSBwcm9jcHMtbmcgNC4wLjUN
Cj4gCXJvb3RAaW50ZWwteDg2LTY0On4jIHN5c2N0bCAtVg0KPiAJc3lzY3RsIGZyb20gcHJvY3Bz
LW5nIDQuMC41DQo+IA0KPiANCj4gDQo+IEhlbGxvLA0KPiBEaWQgeW91IHRyeSB0byBhZGQgdGhl
IHRhZyBwYXJhbWV0ZXIgdG8gU1JDX1VSST8NCj4gU2luY2UNCj4gaHR0cHM6Ly9naXQub3BlbmVt
YmVkZGVkLm9yZy9iaXRiYWtlL2NvbW1pdC8/aWQ9MDM5NDU0NzU4ODZiOGQzMWM3ZWNjYzgwZmUN
Cj4gNTk0YWI1MzA2YmNmNWQsIGl0IGxvb2tzIGxpa2UgaXQgc2hvdWxkIHdvcmsuDQoNClRoZXJl
IGlzIG9uZSBwcm9ibGVtIHdpdGggdGhlIHRhZyBpbiBTUkNfVVJJIC0gaXQgc2hvdWxkIGJlIGRv
bmUgb25seSBvbiB1cGdyYWRlLg0KSWYgeW91IGp1c3QgYWRkIHRhZyB3aXRob3V0IGJ1bXBpbmcg
dGhlIHZlcnNpb24sIHlvdSB3aWxsIHN0aWxsIGdldCB0aGUgc2hhbGxvdyB0YXJiYWxsIHdpdGhv
dXQgdGhlIHRhZyBmcm9tIGFscmVhZHkgcG9wdWxhdGVkIGxvY2FsIGRvd25sb2FkIGZvbGRlciBv
ciBkb3dubG9hZCBtaXJyb3IuDQoNClBldGVyDQoNCj4gDQo+IA0KPiANCj4gDQo+IAlTaWduZWQt
b2ZmLWJ5OiBZaSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5jb20NCj4gPG1haWx0bzp5aS56aGFv
QHdpbmRyaXZlci5jb20+ID4NCj4gCS0tLQ0KPiAJIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9j
cHMvcHJvY3BzXzQuMC41LmJiIDxodHRwOi8vcHJvY3BzXzQuMC41LmJiPg0KPiB8IDQgKysrKw0K
PiAJIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IAlkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjUuYmINCj4gPGh0dHA6Ly9w
cm9jcHNfNC4wLjUuYmI+ICBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9jcHMvcHJvY3BzXzQu
MC41LmJiDQo+IDxodHRwOi8vcHJvY3BzXzQuMC41LmJiPg0KPiAJaW5kZXggM2JlNDBjMzhhNC4u
ZTNmNWJmNmI2NSAxMDA2NDQNCj4gCS0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9jcHMv
cHJvY3BzXzQuMC41LmJiDQo+IDxodHRwOi8vcHJvY3BzXzQuMC41LmJiPg0KPiAJKysrIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjUuYmINCj4gPGh0dHA6Ly9wcm9j
cHNfNC4wLjUuYmI+DQo+IAlAQCAtMzEsNiArMzEsMTAgQEAgRVhUUkFfT0VDT05GID0gIi0tZW5h
YmxlLXNraWxsIC0tZGlzYWJsZS1tb2Rlcm4tDQo+IHRvcCINCj4gCSBQQUNLQUdFQ09ORklHID8/
PSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLA0KPiAnc3lzdGVtZCcsIGQp
fSINCj4gCSBQQUNLQUdFQ09ORklHW3N5c3RlbWRdID0gIi0td2l0aC1zeXN0ZW1kLC0td2l0aG91
dC0NCj4gc3lzdGVtZCxzeXN0ZW1kIg0KPiANCj4gCStkb19jb25maWd1cmU6cHJlcGVuZCAoKSB7
DQo+IAkrICAgICAgIFsgISAtZSAke1N9Ly50YXJiYWxsLXZlcnNpb24gXSAmJiBlY2hvICR7UFZ9
ID4gJHtTfS8udGFyYmFsbC12ZXJzaW9uDQo+IAkrfQ0KPiAJKw0KPiAJIGRvX2luc3RhbGw6YXBw
ZW5kICgpIHsNCj4gCSAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtiYXNlX2JpbmRpcn0NCj4gCSAg
ICAgICAgWyAiJHtiaW5kaXJ9IiAhPSAiJHtiYXNlX2JpbmRpcn0iIF0gJiYgZm9yIGkgaW4gJHti
YXNlX2JpbmRpcl9wcm9nc307IGRvDQo+IG12ICR7RH0ke2JpbmRpcn0vJGkgJHtEfSR7YmFzZV9i
aW5kaXJ9LyRpOyBkb25lDQo+IAktLQ0KPiAJMi4zNC4xDQo+IA0KPiANCj4gDQo+IA0KPiANCj4g
DQo+IA0KPiANCj4gLS0NCj4gDQo+IFlvYW5uIENvbmdhbA0KPiBTbWlsZSBFQ1MNCg==

