Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60896CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:10:47 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.43])
 by mx.groups.io with SMTP id smtpd.web11.16220.1758287437717528592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=drdD6DYk;
 spf=pass (domain: siemens.com, ip: 40.107.130.43, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOGPl0CKUdNEZVRbHnZHaOIoSngMXsnvJju7XP0GX882XW8zVSn/fh1/P36t6HmeL234ZNrtC2+EIyiW5c1cE44zNPcumSdPw8ZctE8o7du/kx4SHstpcWDa0MCcfhyN8hmqMqyj1euv/EnW5mz4PFaUHXqeisMoe9lcE+OMy0yipk8KtEwDfKEsbCXh7Dl71ydpi2w31KjrudfnKDCzV8bp3f2u39EVl/T4LWTxpe18rM1qhUcJI/jXUsYCC2hRiNT1Dc2KhBVHqOo3/IrXTsuQ/ZD4kFsNOm2kKKBgksY5vJ6vcHfK5QEickW0HBTm8qbuH1HIbBoa71mHsealXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgO3KPwvh0XfKf4D0dZEbiormy2tpA7Vb13gx66dgt0=;
 b=kM6p22VCp+fzVYFL7Kc4erhKbvuwq5ipuT1tnzJ7sxW5f6T0RD4qEdj8pewKSAqku2mCf/OpGMDmXCRB7MAqDKQm4WLcestg5J+z5tr22apCCArgvcaTMZ18j/mNgYHEeCR5ef93k8W/FxI6C8upyoeTvvX0fTQyRQt6UgxZlKkkTAj/Ot60N7qFTZlPSF7ZAFH8NqBhL3GC2jBQUtn7t9Pw9e1btVL5gAuTknHtUEEM3L25SltK26Wih13xtqqnm4i7UvTgHTfccHEzOEZZEj/5eDbl2HgKksmYd+RFCBBOANJ62SCOiuGLfipd1uxqbQ9lhsGfufb+NFznxIwYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgO3KPwvh0XfKf4D0dZEbiormy2tpA7Vb13gx66dgt0=;
 b=drdD6DYkjasBgqhJTGOJHpKY2yNFD/MwFmrXXqkBYwZhfsoyAI7hVbNWGM3kSITOFQz0H+FI299jhsKXEgB4Ohp5V82NsAn5aBfOSWUfvHRsk8S7N89ANDUCz972EXxeCmb05/aSBYO1QAOkkkyEdGh8KQ4Q1Ffb3Ntym5H2WCXQv/Wu1sdNdXqkFN6RXxOSakNaNOLupKP13AoM0nvfFwBWPAFyzBlb/qUx145SGwv3IqVIqxwpmLIVuA6mzUoVBNyFMH4whBQ5QP5+sUn5CxoS6fAob0FcyRbQ82oRcxRbwVuZeJ58KteAlZ36bvAxKGEj2GfDs77Qh/vqeMqo8A==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by VI0PR10MB9010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 13:10:34 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 13:10:32 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Marko, Peter" <Peter.Marko@siemens.com>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
Thread-Topic: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
 6.16
Thread-Index: AQHcHn+CT0/uySgwXEWM2SQUTMWYW7SahqCAgAAD5PyAAAYKgA==
Date: Fri, 19 Sep 2025 13:10:32 +0000
Message-ID: <e4eb1f62375f337aed1e4215020f6a0b2369c35f.camel@siemens.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
	 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
	 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <1866AF8ECC88AFA1.22280@lists.openembedded.org>
	 <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|VI0PR10MB9010:EE_
x-ms-office365-filtering-correlation-id: 1149f84e-a0eb-4ca0-0a44-08ddf77dea3d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZzR2Yy84Nzl3Uk94MGZUTWtxUE83dUs2VDBnUEJhWSsyaU44NzlDVDd5OExC?=
 =?utf-8?B?ZVV5OW9OZUhWMVQ0VWVQUUgwYW5YVjFBL1d4dmY2djgzOGdtNTVvWHk3cnlC?=
 =?utf-8?B?RFN5QUkzMWpsSmFrdS9sUENvZU1sYzFtYmtMaFAzYWtjSG44ZnQ0aFJKY2ls?=
 =?utf-8?B?ZkpOMG45K0RsYXNRZ0VlUWd1V0hVN0lOanp3VUNVSklmQURLSUhoS1VTZmlp?=
 =?utf-8?B?UDZHTE01Z3V1ek5VMUJ3djd1ZWdKREdBL0FnV3VVSXVlYWVldTU4MkUyLzl5?=
 =?utf-8?B?endxVHFud01nVFFRU2RFcTRqVXBqSkQ0bzZ6WW5NSDNtcnVGT08zeVU0SVh2?=
 =?utf-8?B?dEN5MHZITUdnWk9XMWxXdkpvdGlXNlZWSVF2SkoyNWdMYm1IN0hqWHdjclZT?=
 =?utf-8?B?dzhsSk1YYmMwc2Q3UHRwamlrOEI0VXZOUU1CWDRCd0MvYUFKZ3lRMWJSeXU5?=
 =?utf-8?B?YTdKQ1ZmRzJyMHNmd0xWVTBVeDdQa0NVWnUwL2tidjZDVUtqZnFsYWlWNHh3?=
 =?utf-8?B?UHk5cUhwcjFzKzJFMGVYQm9QK2dkM2orZTFrRkVxTVIzRVhCdVdmOXFEQmhq?=
 =?utf-8?B?Rm5iL1lxcUZxLzZoZzQxVVhYeGt4c3VQdWt6TjR1ZGJPcm1EbVFocWtYK1pi?=
 =?utf-8?B?UFFNN0doeXcwY3pNMWJtelFic0tEQ0k1dm5EdGRPQ0FrWWIyUXU5UnJ3SHA4?=
 =?utf-8?B?R3F3eDdkTElJaFRUbm43Zi83ZXcwUWZrczl0eWVSRjNYMzZLbjVrUElzdTFE?=
 =?utf-8?B?MHB3ZTJJMUJqOWJLN0gwT1pqMVlGUDJTMm5uVFd4bnBGSmhSMnlyeUVTR3Qx?=
 =?utf-8?B?K0kwNkNDVnVuY1NXMWVpNTZaUk1EN2hEcHM1aElSUWNyaDBTb2RFcGVhK1hN?=
 =?utf-8?B?K1FVZCt6aFZ0TWVUUU9ubUJLeC81amVidDNlaFRYRmpzbEJFbDlVTG5xR25S?=
 =?utf-8?B?SFk1a0FiWUxNZWRnaU9xcSsrZCtMRko0VTZKS24wUzV3VjB0VlRpM2hISjR0?=
 =?utf-8?B?aXlRa09JR2V3Q3hDTlhOWld3Wld6aUtSZFU4NHZPQk8vSVRwelIyb0V4bmZk?=
 =?utf-8?B?c2lRWXhBcmwzeW9rS05OdlFENDIxbG8weTFGUGpmTVM4SkxtRWhmdG9vVndu?=
 =?utf-8?B?YTRjVk5aVWNYaHNLcXZoWitZL2NlcWU2RElOK2dxTTdGalNlWm5UbENiQzM5?=
 =?utf-8?B?TUVYTGFzU25MR2dqR2JIT2RTalp2N2tTbmVsbnBIejZWbS83aXZhRXpCRktD?=
 =?utf-8?B?Q0o3cHpJVFhuL1ZQSGVmOWF3aWZvQlA5UldOYmh0cmVpYXNCRjZ0QVd2TGc5?=
 =?utf-8?B?azBmNVpVaDRqVVRBMmNGZ2V0ZFNlVEtJNy9oOUlPbkt0NGtPV3JLajBGVnJP?=
 =?utf-8?B?cmQrZGMrTHE0RFZ1NkNMZ3VQTnhQcmlTMXFiTnNNdS9lSmNMak4wbEFMbEVV?=
 =?utf-8?B?TVE0S29vK1o4dmoxcWNOc1dITmhSbGY4NjRqaHVKNGwycUN3bFlxdTZuY1Z4?=
 =?utf-8?B?Y0NKSVVYUTZBUWlSQzZYNml2MDJEWkp1N3ZMKzliTUYwTWRYWllQaFZ5dVV1?=
 =?utf-8?B?QVBMRmZBcWpDQXpCT0RLSzcrdDJpTzFoMndjVUN2MFExTFRWUFZFN1ZXOEN5?=
 =?utf-8?B?M04ralFEVzVBWWRWUnluQVcvSEZubWpjaXUrV1dndTI2MjRzODhXbmV3bmRW?=
 =?utf-8?B?OVVoWkFkYWtWL1htUjVEcEhLUnhFMDdqTnp6TWM0V1NpYll6ZVgwNGdLa0VI?=
 =?utf-8?B?ekhuNDdHeWtDRFFydUZjMnNPOWovT2Q0MjIxR1BucFBNK2VKUENySlJtNHNG?=
 =?utf-8?B?L3FmVlkyWFlOSjRWaE1HSHRaMnZQTi9tTWtETDQyOVRpVldtaktPbE5BcVJj?=
 =?utf-8?B?Q3E2Ly9naCtJMnNMdG5ZTDBUeUVLdmNDQi9OcThOYjBjbTNLRENXRG95RVN1?=
 =?utf-8?Q?H4a+B5W+ZAc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q21nSTJHL2JBcDRKK1hkY1lUd0MwZndHSTlNUTB5QkdLeG8vQWNwczBqTVM2?=
 =?utf-8?B?ZE5ySS9BdEN5MW9BVUZzMkNqSjh1bS9jZVU1a0d6ZEViVDFNSkd3bVlERUJE?=
 =?utf-8?B?R3lmbUdacG9IUDZzajdqNnRFYzRPdlBsa1RrL0t6aVIrSlV6VURHa2tGVmRy?=
 =?utf-8?B?NXBvQWJkNy91Y3ZLdTFFck9lQ1dmb2dSSk1UcHI3TnpuODR5MkNLeWJiRDVC?=
 =?utf-8?B?OVdBOEZwWXNOUmFUdnlYbGN6ZWZ3clp2MXVyN3ZIbTdLMVpaYTFsQnhhVHRQ?=
 =?utf-8?B?Rm9VN1c2L0NCR1pqVkFNWElFSDQyVEk2anBGVU5CUGFzSkZPbm1tbUxVQlNT?=
 =?utf-8?B?cDVOU09oM2RUYy9xT0JEWkgyRlFqN2o5OUkxT2xkMkc5Nm13N2g5SDFBT21u?=
 =?utf-8?B?dkdpVmVRL1BNb3IvUVhHbE0vcm40cVVuSzEzU3pGVWlXZE5XZk9yUkFkRXpS?=
 =?utf-8?B?MDRWVXRlMHovSlhETmhYUStEQlkrbExmbjJZbkJycDVYMkhyMGxNcCthWFl4?=
 =?utf-8?B?Z0V0c3QrQkRVb0pzdWx1bisyckQ3VlY0M2I4ckExTitIVkUwMkNNMnpBd3hV?=
 =?utf-8?B?dmh6azRUc0I1Y0NCeEJNaS81VW5zMzBnc3dOMjVkeStKekRhTDkrU04xT09R?=
 =?utf-8?B?MjZvNEhOd1VDL3ZqNFFtRW5CNm4wUGE3emR1NmZjZ0hqczVkNzUyQjRHRmcv?=
 =?utf-8?B?UFIzazM1RWVGbjZSN21qYy9NenBMbXdIMGZxRTh3UG9IYnhvcHlXMzJFYmZV?=
 =?utf-8?B?YlpuUi9TVmt3emh6WGFyaC9VRGIvSHFxd3FIRk9EMFA3RFR3Zk1uaEhlUTFH?=
 =?utf-8?B?VkV3WFhYaE1HVVlQYmpkcjdYeWtRNCthQVhUdjdNbnN0eFhJTG9JSU1hK3JL?=
 =?utf-8?B?MHZXWjVpUWo0WWQvU0p2TGx1ZzRadFFmM3VsM2JadnM2NkFVeUNHT3hYVmdE?=
 =?utf-8?B?cEdjdERYRFVVUGZqMTRpZ0VpZ0FyK2F3bzhzbEltSGhJQkFRQWdYMXVNcWx5?=
 =?utf-8?B?K25RSzlHQzk4bXJQOG5TaURsMWhYclBoQlFMYlp0SDlEalI2cTJkdnJuT2Y5?=
 =?utf-8?B?WVM1a0VMWm13WlB0cmlERXNXWUpqaENudk83b0RaZXpRWWIvaVJTSTBUQWd4?=
 =?utf-8?B?U0s5NTl6UWowZXdrcVZRTTBSRzBEQVNPcUR5ZUkrZWVmOXV1ODVSRzVmVWtk?=
 =?utf-8?B?U2k0QkxaV3VoalBsdm0wNmE3R2FNcHlSczl2cTJma2RjSjNZc0s3QTlxN3Z0?=
 =?utf-8?B?bnBPeURLeHkrM0haN1VVd0J4cGhSMEVPZG4zeHhTV2VOMVE1cFVQbnNob0NT?=
 =?utf-8?B?MUdWbksreWtmTm1BT2E1NWFDam5ZSFg0YjlUc2JHOUpvSWx1bzRVRElqUThX?=
 =?utf-8?B?dVNQSmdUUUE2cllRR1hsSms4elo1Yk55TlR3NkYrVFlTWC83K2RsQ1pkYlNi?=
 =?utf-8?B?MVlNWG1vVDNreTRMbzRJYjFzZGg0bDkwMGVuSEV3MDRVd0dHMlkrN09xYTZI?=
 =?utf-8?B?T0hMT0NMaGZOQmozQnN3NVR2c2gyZWxFOFhCczI4SnBXRUE0RWx6eWR2U2FK?=
 =?utf-8?B?VWcrMHBFM0RwTDh5L3BZK3gxUEt0Z2t4MndrNU9tRzBVckxPWnpuekpCTysy?=
 =?utf-8?B?SG1ZL2R6NXVuUE5nNFN6Rm5ZZFNZQm1mNTZnbXRIbllOQWMvNmlISEV5UWpR?=
 =?utf-8?B?bkQ5L2ZsL3V4ZFZnZjlxMCsrb0pQeS81ZHh5bjBQL1UvU3pubVh4ejhmdGlo?=
 =?utf-8?B?OEhCVUFaM1JOZ0xrakRLMnlqYUlUYUExdXNNWktGTkcrd08wMmpLOEU2RG0y?=
 =?utf-8?B?T2FoajgxYmpqNDlFRGZJamhkTzdjMW5IUCtNR0NXMzM3V1FFM1Y2N0FzRXBI?=
 =?utf-8?B?R2x3TGtFazRIcDgrcXlTTG9QdEdpa2JLNmlCdWhsOVhLbjRFcFR6TDI1cWx1?=
 =?utf-8?B?YXVDTHo0RmFSTTkrYnVsd0FVcm83ZGZUQXhJUTd4Y3ZpZDRIbVBYNUg4NnZp?=
 =?utf-8?B?T240ZHRzKytabG00WnVhZDdzamR3MEFpWWo1bUhZeDRSTlNMRWpmVFZZRzJm?=
 =?utf-8?B?cjdLNnFZZld6Mm1uVnR1MmtBN01xMVI2dThzdy90aGZSbXlIdU1oOEphMkhh?=
 =?utf-8?B?YUpmR0dDRXZ4aG90WXFJano4ZXdtRjBNaUQ2ZEF2V2NCNU8yTmhac2t0QmNk?=
 =?utf-8?Q?93C7JLc4kJwYiHbIIVTS9To=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76AFB36E191CC540BDC7CB08C00405D1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1149f84e-a0eb-4ca0-0a44-08ddf77dea3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 13:10:32.8084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9E33AGVtHTjVQVBXSdbi9fkCDuNF6lmCz/1OvrbvQSyYFr9GtR9ZvenKDkTqUNNpOewRXcrJluPu0o8G0rdk0qO34vxoFsD96/zcRyp4K30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223748

SGkgYWxsLA0KDQpPbiBGcmksIDIwMjUtMDktMTkgYXQgMDg6NDggLTA0MDAsIEJydWNlIEFzaGZp
ZWxkIHdyb3RlOg0KPiBXaGF0IGlzIGludGVyZXN0aW5nIGlzIHRoYXQgd2UgaGFkIGEgY3J0cmVz
wqBwYXRjaCBmb3IgcG93ZXJwYyBmb3IgbWFueSB5ZWFycywNCj4gYnV0ICJyZWNlbnRseSIgKDIw
MjQpIGRyb3BwZWQgaXQ6DQo+IA0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3Rv
LWtlcm5lbC1jYWNoZS9jb21taXQvP2g9eW9jdG8tNi4xMiZpZD0zY2Y3NTgwNjEwMjViOTI4NGRk
ZmIxMjU5Zjc5ODYwNjY2NzM3MzAyDQo+IA0KPiBBbmQgdGhhdCBkcm9wcGVkIHBhdGNoIHNob3Vs
ZCBoYXZlIGJlZW4gcGFydCBvZiBzZXZlcmFsIHJlZmVyZW5jZSBrZXJuZWxzIHNpbmNlwqANCj4g
dGhhdCBjb21taXQuIEp1c3Qgc28gSSBrbm93LCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGhhcyBi
ZWVuIHBhc3Npbmcgb24gYWxsDQo+IHJlZmVyZW5jZSBrZXJuZWxzIGFuZCBqdXN0IGJyb2tlIG9u
IDYuMTYgPw0KPiANCj4gU29tZXRoaW5nIG11c3QgaGF2ZSBjaGFuZ2VkIHVwc3RyZWFtIHRvIGJy
aW5nIHRoZSBicmVha2FnZSBiYWNrISBZb3VyDQo+IGZpeCBpcyBzaW1wbGVyIHRoYW4gdGhlIG9s
ZCBvbmUgd2UgaGFkLCBzbyB0aGF0J3MgcHJvZ3Jlc3MgOikNCg0KSSBiZWxpZXZlLCB0aGUgcmVt
b3ZlZCBwYXRjaGVzIHdlcmUgcmF0aGVyIGJhY2twb3J0cyBmcm9tIHRoZSB1cHN0cmVhbSBrZXJu
ZWwNCnNvbHZpbmcgdGhlIGRlcGVuZGVuY3kgaXNzdWVzIGZvciBpbi10cmVlIG1vZHVsZXMuIFRo
ZSBjdXJyZW50IGlzc3VlIGxvb2tzIGEgYml0DQpkaWZmZXJlbnQgYW5kIGlzLCBJIGJlbGlldmUs
IGFuIGlzc3VlIGZvciBleHRlcm5hbCBtb2R1bGVzIG9ubHkuDQoNCkJ1dCB0aGUgYWJvdmUgdW5m
b3J0dW5hdGVseSBtYWtlcyBpdCBoYXJkZXIgdG8gZXhwbGFpbiB3aHkgdGhlIGV4dGVybmFsIG1v
ZHVsZXMNCndlcmUgYnVpbGRhYmxlIGJlZm9yZSA7LSkNCg0KLS0gDQpBbGV4YW5kZXIgU3ZlcmRs
aW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

