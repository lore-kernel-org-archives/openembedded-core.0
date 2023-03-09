Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09F1C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:15:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.15878.1678374946301503056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=NI3siGsb;
 spf=pass (domain: siemens.com, ip: 40.107.22.84, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjW3cU0f8xRmc2rUYVZQ94/JxAKQ4MzWLvTj4ncC1jjm6Ae4x/kw+seJh+jYhbeMtPUkxT4/+usgU5kYguzaxhW2URzrAn9KdNeAaXFAK/HwKEGW+UVX9TbgfC5OAYwDLSqjvpr/95LHSihIoO1iw9yX9oSo/xRdRSibSKFRaNDLU0bZGZICxjwiqTthFYIny2xcaVurCyGZoroeoZTlrzVrZ6qsvLk0dMvbLFGo62qpXPXQbFXOgXMSHSv4KYBRxnBlAbKBYHLMqXGtyAoi2E1CJMDyj2C6z0NOnJktJnYJIU9xxrbQet7bIlQE793ZKeVl9pCr8PmShq3OR6j60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37ZJ9pM/j9oNN//k+3tuRtwrHCOg2u0X3GQBjBZ4GYs=;
 b=E/NNpu//Itb0dVT+Uuc/X400KObxk6vrpIFvvtC44NuLoQjCmxqqrRwhDy5q98gqQC02Oy2BqQtzvQ1Lx5gkMrL4dN5Qil4uGGif782Fus5e0nEz2hS0ThKNLOqJzKhm2v+Ui7HgBOf+YcCyJCwtGsQ+l8+v7unr+nZ1AVZUUa99Vpjjiw5mrgcyiQ3oj+qIwGT09kQcHV0SLzSZdqaDl6629iTWIso8z129yp2xJmeEpsbmOKbKY8nvRoMjeCKJQ1KZmykN4QacyBMlpu1pHcWftTmAruCaAtB+Eq+11YpwRrCmF8DD08wNlzO1MDY3GpQvz5Uo8xwXyj37/CRsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37ZJ9pM/j9oNN//k+3tuRtwrHCOg2u0X3GQBjBZ4GYs=;
 b=NI3siGsb1U2pAmu2ADxWZToGdLaTYFF6Z2BGzUQSFQeOunTW0ZW7BtStVPxTKPwRbKUpmeH4PkorHbRkZtARTvqXc7Cj5sBS2PHrcrONL/lPwSPguCBEqSJUUYvKPrFQRiamdqPjXNHk4cE/IehI1kOr3Q5UpaR+esb5FGm9OT7h+LPiV27V3cs85RW6muRO6QUPjq4fnX7thecR/nAQl3Yv1xf0RO1fwXfiB/byf++iykz/GrJPw3+yrslBUOaRP33D8AivY/J2JTD4mtUNEsEIHKkmyRmx81Bn7vGqSfmSQiLo3F2MajMB8GYLRJvh7zGFjisn1LyCBfZ/iEYDZg==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB8087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 15:15:42 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa%7]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 15:15:42 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: curl
Thread-Topic: curl
Thread-Index: AQHZUpoDxthLdCJVYEG3WzwJCMpgTA==
Date: Thu, 9 Mar 2023 15:15:42 +0000
Message-ID: <3cb18f22193455d52f5f30c837a2694719d6ae70.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|VI1PR10MB8087:EE_
x-ms-office365-filtering-correlation-id: 3f66789a-2d7b-4470-3a0e-08db20b125f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 USpzt0cZogKH8eMa4/KqZ88kGxamY/fv762RCL1dL7CcwYils2t1bbw0mBu+gjAAlyglr0lZluIVd6QNaK0vwptyDvsjl1c08H5jZVUyMl2QrHdqN5uS0L0KI6vhaulbcxGrat66jx7jdhGzXXuRdgGyqxSmD0MvjCK52pi2cEqOd3l3oCRQXqg6q9bMMQZQB9/Ie0ilj1WHKnk2wYp4s1TVK2VfBEmoho0//Qs1+6/LosAUHphFMb2DxxyLREqD3BGsi+tyKit1G8gPQDQ/9Vhi1+XhWcBoCVf1aLLTiUUUM8i3F1vB3l0K7saqyPOKSLOJWpPL9Ns7l29gH0zuFOOWd/O40KDeH7TIFOvzYrXNhlWiUWXP8OxtARVQf2KSco7Da1w32Kcxyp0DAyQa9Ry08fbrB5//DFqsEeUGZiCzD8leGFFE+pnksoq0mcciXmMM5b40nL4vPl0s+/LEYDIB7GEMcI+Jw6dLqNYMs94As1BVgly7thOj7AUQVRhf2h5XmmtIbEwa9XW1qzhSJMCdAlkZvJQfyJ0wupEruYtLs/p4DM1JPg+qMnc6HHge1gjBKsH3TgLzDOV8gQsp6TP8AZ+xHuXh214aHunjTYHRrA6n4Ds2GsE3+u2PGzAFiyJLeidVWxMTbGtmSzL7/FA8k0dXZ2blqtZt0/I4iE3BEht8Pn/4vt64h95wjuWVtTnQqUSQycNglN+puHtA7YS17++ImT4szxy9/g13Qn0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(36756003)(558084003)(478600001)(6486002)(316002)(71200400001)(5660300002)(2906002)(76116006)(8936002)(66556008)(8676002)(91956017)(66476007)(66946007)(64756008)(66446008)(4326008)(6916009)(7116003)(41300700001)(122000001)(3480700007)(82960400001)(38070700005)(86362001)(38100700002)(186003)(2616005)(26005)(6512007)(6506007)(220243001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckxOTGxCU09sN2dUdW5mcXNIeU1sRTRRTEV2Tnpoa21TbWVBSDhSY2lzTmU1?=
 =?utf-8?B?YmZwQ1MzSlB6R3RObE1Na1E1S1pYRFgwUGNtUnQvS1FjRmovY2twU01sdmly?=
 =?utf-8?B?S1dnRkdwdTVZREJiT0lGdHpQV2d6dmNlRnE2Y2MyU3RUdkdDZE1sWDBKanpx?=
 =?utf-8?B?K1h2WlA0cTY1N3B5N0NnMUlNWk5NYnM4WEF6YWRtZ2syOFJyajluVmdoU3hT?=
 =?utf-8?B?Ry9GV2pBS1E0WU1UUDFRTkdURWttVXl0S1lDZTlrRTdOaEJaK09uUHQwZUVD?=
 =?utf-8?B?NkdPWHI0V21Uam5PWFVxSWdoVEg0ZndaY2ZiaXFNVUIydjRKUTVRUXlJVXFl?=
 =?utf-8?B?Z2VXY1l6bHRLb0JxNGJ4elRPam9uV1lDZWVPZXVEWDUvKzJxMEdtWkpDMWM2?=
 =?utf-8?B?NS8wTDhwTFU0Sy9zeWZoWmJVaFBIREd5U2VPSEdyUncrN2lpTjI2dGJqaERl?=
 =?utf-8?B?RHFaOEZFTG05UTBMMHVGUTkzMVN3eENJM3k0ZHYvN2ZKdTAvdkxVQzlFVG1q?=
 =?utf-8?B?T0EyUXYxa08vZVhZZm4xb3N6OVAraU1keXNFbHc0MmU5RXJFUXJuT2ZLRnYv?=
 =?utf-8?B?NDZ1RGpURlYyUXJTQkNWUHYvU01HU1ZBMVpTenNFZitPdTVTVUhMQ2hiYU42?=
 =?utf-8?B?OUpwQTR4RWRmUXVpMEJDZVBxOEJzc2VrREN4VGo0MVpTMlQzNFE5bmN0dTZr?=
 =?utf-8?B?TkdBMmlaeWsyVU0zWjkvQWx0QUc4QURXSXRSSHMwTCtTVy9pRnB3NmJKK1ZB?=
 =?utf-8?B?MlVBcUUycjB5ajRqWC9VSnFKaTRhaHRKUldoNndLZTJLamVvaXlQajErZ0tV?=
 =?utf-8?B?eEgrVlNsOGpjU2ZXV2lWbytLejIxcnNobnl3ckN5S1daV09nK0U0VFZyNTJ0?=
 =?utf-8?B?WWE1ZDVKOHMyY2UvLzlPRzM0M3VjUXRqdWxQOFRMaWI0Q0dpUVZkdjdNZXpP?=
 =?utf-8?B?VTdBTmU0SCtMa28rSHJxdHRMNXJkVnlMZnRHdzlETWxIcXRSRVlmUDhtelZX?=
 =?utf-8?B?NDJkZ1phS3QwbWd2bU1ROG5hZVY5dzM4V0VDc3ZZTnkxa1NITU9kVU5FQ1Fx?=
 =?utf-8?B?Z1JWS0hrSkEyWGZYVHRPZStNMUI4YXpIVlhUM2hiUDZ0bDJoTDczazIweUNG?=
 =?utf-8?B?d1ZSV1d4OEZzWHZFL1JvaVNkeTI0TjFMNTZoTExSM0dWdjZRQWhKQ2tOTXl1?=
 =?utf-8?B?ZVBnMGZFeExyWTIwVHFCR2l5aDJCcVJ2ZUQxcFFVU0dSUHRKYWs0K2htencw?=
 =?utf-8?B?eENEZk9Eb0dQTE9PbGt3QUJRN096ZURWSnNMZXFjZ2crSDVadWI5ZjBpa1Fq?=
 =?utf-8?B?V2FLY1JYTnVFeElXKzNpdmNaTi9RWXZ1cGRHRWNXcGQvaDgxdGhDNm1lZjhp?=
 =?utf-8?B?MnlYZDA1S0QxcmJBWm4xM2lsOVFreXQ1WmpuOEtMZEp1eXJ4Zm5Na0hNclZG?=
 =?utf-8?B?S2NFaGxDWTF2dTJYRVR0QmpQNGl3NlRUNEtIRjJxblUwZGhKYXFrRzJralhq?=
 =?utf-8?B?d240Sk9QaThkZm16WitZL2pzWUdxQlpLQ093VXJkV0J6U09mVE1yQ3lhb3BD?=
 =?utf-8?B?TklNT1ZWaCtPQkVCSi9iQjNVYW9VV0F4L3FBcnJ3aGdydHBRUkpHcjArcUZJ?=
 =?utf-8?B?cVAyNVlBNDhQdm5TNTFJRzB4djdjTXZWZEhGR0JPNzNqQjJoSFJlc3J3RWlX?=
 =?utf-8?B?QmNGektLRitkUEo4WWxuL0JhL0M1bHRTS2t1dmxQUmFwbHVXVm5KT0xGeWRZ?=
 =?utf-8?B?R25hZXNSQ1ljOUxoc1NTdFZIeWllSC9wOFVZcitMUHI5YmdOU1ArNjcyVmFN?=
 =?utf-8?B?MnRiazR4WGR3V1lmcE1Kd01aaUVVaGpOZzBYY3FaUWkrSkZQbUhnSGliekVT?=
 =?utf-8?B?Y1dQNGhHMHY5N3c0ZVNPSGgrRTBmUGRlRmdVSUtIMGdsUndQaUhMaGNpTGEr?=
 =?utf-8?B?MFRGV3U5WmIvQTRrL2NhUmc3Zjdid015c3VJU2JpUzBPMzRFVHlyL3lnWlpw?=
 =?utf-8?B?VHNzeE5WK2VrZWhkSlozOHVTZGIxam0xUXZONVB4THpHb0RaejZ5U0dsNkJH?=
 =?utf-8?B?Ty9mL1luMWhVSHRHMUliKzIyMVNsOGlYUTFnUTFldENHZ1hoN1dLZFJhUHVO?=
 =?utf-8?B?TlMySEUxb3pETUIrUlMxc0ZXTFNuQ1hjcFlKNFhzaEFVNnlyMjgwNFYzZldU?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9301A645835A454EB66ACE8E15D5A3DB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f66789a-2d7b-4470-3a0e-08db20b125f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 15:15:42.1003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8giF1NIFTEJi/aBCzLuEPHC1kjKGHTDfiLhAoL4YOl6O9yl6hzrmnQp9RAqFtb4I1cXJS0iBnGLIZeM9u57u3bs7SVrnW2WR72NWXcJovrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178225

SGVsbG8gU3RldmUsDQoNCkkgaGF2ZSBhIHF1ZXN0aW9uIGFib3V0IGN1cmwuIFdvdWxkIGl0IGJl
IHBvc3NpYmxlIHRvIGJhY2twb3J0IHNvbWUNCmZpeGVzIGZvciBDVkVzIGZyb20ga2lya3N0b25l
IHRvIGR1bmZlbGw/IA0KDQpDVkUtMjAyMi0zMjIyMQ0KQ1ZFLTIwMjItNDI5MTUNCkNWRS0yMDIy
LTQyOTE2DQpDVkUtMjAyMi00MzU1MiANCkNWRS0yMDIyLTQzNTUxDQoNClRoYW5rIHlvdSwNCkFu
ZHJlag0K

