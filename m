Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A09DC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 06:35:37 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.web10.17547.1747895729957172750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 23:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vhIEoXt7;
 spf=pass (domain: siemens.com, ip: 52.101.84.13, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUZK0sBAoNm191UKCxTZ/6oB2r5W1rNkLtuD2ZJtPQeiUVw8phDNWZURtrcfURL/NybztJMjIPICs4oyh0xEvZdCVjXuYUdpkvzWtqfYISGLsDY5m24glO2ULtqXvjPe3ttZogKwJyaCPWk4rtTb/qyLoaZp99SLBLbCRLrLurtichyPyA1YSMpeWc5W623I7lXpxcB6YklxMthDViRaTz5zSMc2eCkU0HIl2hDJN+iioiUu0f9VLPd1+wt4TCqpTytv0hYFQYpSHISt7acah0B6WPU1+i0obmqn9u+x/67HSKs3TdKhS7cnaCq5WjuPxUKFciwC0EsnxLe1aMu/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7e0HylCfVcSXpsr8+/+GuhinxYNkW1I+KC63PGNfdA=;
 b=fUGVHAMgeSpMplMJJ+6kxVOcSJP7ig0rkdIkjz30PedW8sW5QDgqGeqB7yPsYcJMAaULjlCIDqm2JHPFMyDtNJClatl0HPNAZLl4nYSuSWPgiyGA396nbkhrwpQ+3Sttt0qZ7k3YARBe7TWYrHdTT0JZh5zgMLpLbGRtlqZwM+ymuRZd1PhqchsXtTkm+1wpoaJu1asoA0EaLwBzBL9hOZFq2eGDaOifp0QWPaGprv5tBUvnkGK7bJmr+hmV3V49v1p2NN5fRoxu9QmABUbAdlHHcqOPzseq3/8ptFEOUunaaFXjNT/Lon6/Zj5UG2d/E7bdJpVT7F7Ub0PfC+kvDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7e0HylCfVcSXpsr8+/+GuhinxYNkW1I+KC63PGNfdA=;
 b=vhIEoXt7kihUnTJMvI78BdKumHxDIXXfPIJv7j4Xxhx+Hrq8NGUvcGjGNcRqbguw5QVCC/8JLSdDEfVxzlk01c3+7UELR97E0EpO32RZ8g2J12+hQG+sc9mDUKzx5I+JSUWdylyeAZD8s09mXD2uJYao94Fuv5lz7ciPaVXdC5yhUIXSJeeme23oU1k665YZT5zWXDJaWSFst2+/LjVPUC7z0qe1PmObq7VMTUFm73BVe21BbCO7tHZeJAzDn7rAF9gtuyW7MZGqevPXkv7RkGhPplOwPBfcr5U0hNNdemEW1LYpFlCA16pd3R4HdSw7M7J17/Q0F89uUjAeE4Ra8Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 06:35:25 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 06:35:25 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Topic: [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
Thread-Index: AQHbyiezz4/hWYLLWUu2UN/JWqui2bPeMcAAgAAAPDA=
Date: Thu, 22 May 2025 06:35:25 +0000
Message-ID: 
 <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
In-Reply-To: <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=86ba1eb4-9b32-4f46-922a-7aac8dbad2fb;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-22T06:31:28Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6354:EE_
x-ms-office365-filtering-correlation-id: 6cf853c2-0c82-4b62-a9a2-08dd98fad5d7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y1o4ZkNwMFJlOHJhQThhVmF5MHRXYVRwRzVxUlhaRUZsOTl2NmU5WDFCenlG?=
 =?utf-8?B?NWZIa3BCeWZrcUVZdERXNXFXUEd6d2Q5cWZUUnhtT29uRmU2eldZSGVmOExo?=
 =?utf-8?B?a25RWVUxQTdHdjZmTnJVWVpRTm9LcmJNZEprREtqU05ycHAycjc3ekJMS0dw?=
 =?utf-8?B?cGNxbUpzcWJKZWEyQ3F5Z0xQd3RSYURGWk9DZVd0RjZzYW9velN6TlhtUWdI?=
 =?utf-8?B?RDcwRnMrNmdBZXJTdDgrSi85QTBFcDNJcDk0WFo5Y0V2SjI3ZkFpa05DdHJw?=
 =?utf-8?B?VFNBUUJSejdVNEQrMkNhelF2MnFwLzZ6QnVtQWhtSStLM3lTWTlCNjc3UGRP?=
 =?utf-8?B?Nk1nM0FKYmtVYTlLOFFHMUNHdGNCQkpJUFJFSGlOVHhsWEFRWjBjRmdjMUZr?=
 =?utf-8?B?MzRkbm5wRG5UNzhKcnhBR1FUcEtvNFExeWhFQWNUREdNVjAwSmsvM21tZjFw?=
 =?utf-8?B?dHo4Vi95TmVtblcxZzlUYmtoaXphTklUZWx6SnZua3ptdDYxVlk3SSsxbkp6?=
 =?utf-8?B?UlJBNEd2ODgwQUh1cVBrMGpaM2FrRVNOSURrNmFSeFRraTBBdk4zYmNLVkJo?=
 =?utf-8?B?eEFaYTVLU0Fhd2hqdU5Ga3A5aElzb2lURFVtckZ6OVcvMW9hTWRmSHljMGtj?=
 =?utf-8?B?amtOSjJtL1pkMXFtaVpEa0gxQ3pmVi9NRUg3Mnp1MngrMDZpUjhJMFp2cUZJ?=
 =?utf-8?B?Y3BqT3ZNNEtoRG5SZlRIQldCcmUwS01QQUx1VWZNTTNmU29aR0dNdzNvM1lN?=
 =?utf-8?B?cmhFUE5TRW84RGEyZE42WHJNL3VqUjFZejY4eGZHOHhnTklqYzFpaDZpOGE0?=
 =?utf-8?B?dCtySnJDd3BoekRkaUlMWkpyWkxTWjJRbHE2aU04cmJ4bElTK08rdTVRQUky?=
 =?utf-8?B?alFlVzd2NWJ0RFpzVUZsMWhEOEwrRnMwbUVEbU96cUszUHVaV1RGQlMwblpO?=
 =?utf-8?B?VWtMK2VydFhPU2dPSmx3clpoN3N3cDZLcUJpcVJNWnhGenN4TkpPN3EyWTJS?=
 =?utf-8?B?di9xNEFBRmduY00zUDY4ZWJsTEtrNGI1ZERaS1o4L1BZaHJtMjM4eEVEZk5i?=
 =?utf-8?B?R3lWY2ViOWl1QW5xdzhsbHFtSjVaZmx2bHB1eEJHM1ovTi9NVFZid2pmb1I3?=
 =?utf-8?B?U2I0SWlWNFNUa0F6bU9zNXh3NWJUajhLYTgrUUhzOGxuc2xWZHpLZzMrWU5L?=
 =?utf-8?B?SVJzSGVEZUJKUE5pc0RpY21tYXFWamJoR0xQVi9Gc1Y1dWhEYnYyeXJUNmdL?=
 =?utf-8?B?bDlkYlJFZms1TVFVSVU2N0x6SWdjQ3FGMXNrclZzNGY2cEdNeXBkMytKTmhN?=
 =?utf-8?B?MFdiYjFQeHRwQzlQVzBEK3pBVFZKQ3hJa2RFUzFzdVFJeTAyZWRUVUF1eUFG?=
 =?utf-8?B?b0RhKzA5ZmNqSm0xUzl6aGh4cyt2MkhKcys2UllZRS85VlpxSWtMRDJBU243?=
 =?utf-8?B?N2o3SjhIUTJyeWN0dTNyMTB0dVZWeFZjUDFCNnNKZ2draVpUWEg1SnRNY3Rt?=
 =?utf-8?B?ZWNXV3huVWxzNFNYOUF1THEyYnF4WUV6UlBMalVnY1FSMFVjcHA0bVZkTnRu?=
 =?utf-8?B?WDNXS2xRTDh2UnY0cm04anYzUklYNVdYM3NobDRoUEdlM2g3WDNWUGVjdWN1?=
 =?utf-8?B?UzhFVFlCT1d1UG5ZalhLSVRoVklHQmxtRGx4ZHRneEd0Z3IyQUhaVXc3V2Rz?=
 =?utf-8?B?SGFNOTR2MW1VOTJvT3FUR21iNm81L0NZSk5uNkJzZFoyOWswbmJwSjE2a3Rl?=
 =?utf-8?B?TWZnMjZXRkU1VS93Rk53VjByVnJadGw3R1NDQmkwUXRRWGt1ckpBcEpqS1hi?=
 =?utf-8?B?dGN5NGJsMHc0ZENpSU9ReUpqNjJlUzBpZksyc3d2K2Yvc3NubUxKYlhQeEs2?=
 =?utf-8?B?Zk5tMGIvRzRDZnJoUEZJVEQ3ZUtTOVk4RWZrMnpXYVNWSFh1ekpnTVpkRWxy?=
 =?utf-8?Q?BEun6UhphzY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkR6T1FoSE1hNzlMZTNtaURBc0FLS1dHazhSNTJqQWFsaHhPemZES1c4RFIv?=
 =?utf-8?B?Y1hBNGtLeXo1RzdTYWVvczlQU241NFAxbFpySTBTR2VBdnlEQkovcjBsODBJ?=
 =?utf-8?B?aTdoY3JseVRHbGJ6V1B1RFJqNlllM1hMcTh0MzJnTXJEYjNleU9ZRVJzUWhY?=
 =?utf-8?B?Nm8wQ3NEK3U0TnZKbWZkaStVR3dBTmYwNlU4d0lxZXozTzQzcUY1aWFwMmFQ?=
 =?utf-8?B?ZVM4TVIrTlc4dDhnY2g1WjdaWm5XRG1xczRZeDZtYVQ1d2xadHp1dnV3MDRj?=
 =?utf-8?B?YTdQWkZuQ1BhYTRyVk9IV3ZFcEZDSWN5Q2luRy9Zemg3cE4vaXcrYmVJM2t5?=
 =?utf-8?B?WGhvMGZCRm9MVmc1a0NCNjZyRm0xaXpQclY2OHhvVVpYN095N1UrQTluQ3V6?=
 =?utf-8?B?eEV4VWJyVmk3aG4zd0xFcDdVVDBMSGVGQ1RzekVrWTB1Z0trei9hTDRjNTRu?=
 =?utf-8?B?eWNWYmh2VXNObDNreVRRZlIybmJhYkR4amdyWHk0MDROZ2VwcmI1VHo1RkI5?=
 =?utf-8?B?SEZpS05rZlI4MjRsRStMajV1OVFjVzJpVFJXa3c0SEc1UDVOVTFWQVBWQlIx?=
 =?utf-8?B?ZHUwaVh5dUtzN013RU5jNzhMYUZHMjNTZk5PMG5LQWkwbVlDd1k3WWVoU0xY?=
 =?utf-8?B?V1ovelFKVTRnbnF1ZnpSSUJqQmF2Nk10eVIxSWtaQ0dFRHhqNU9CSk4zODNn?=
 =?utf-8?B?OGtHNXUvTlR4SmFwM1A1MWUyVnNwRStncEhvMFNNbldRT01SYmNhVzZISWhh?=
 =?utf-8?B?c1VwOWdVWVdLTU9KNm1kdDFDYkFkeVV6MlI3VTRqZmtTNE90bGYrbzN0V3B0?=
 =?utf-8?B?ZVR3TFB3SWc5ZTdMQXFrOXJFbkdvb1NMT09GajhBak53WWFJV3dLK1RKalFa?=
 =?utf-8?B?RUpkd1Npdit4SWhSMHZJbE02MjlWN04wVENHMHd6YVluVVdOYU5EMDk3Und6?=
 =?utf-8?B?NXo1RzF6MW1UelJQYzVtUVhEZCt2aWhEMVNHYTFBeUpXV1NSRHFLMlpoM1oz?=
 =?utf-8?B?UXZwRkQrSFM2T2FzTW9ZQlRMKzhnN25OR2lQMnU5YXRYeXp1alJ0N29zNFov?=
 =?utf-8?B?ZFprb2RMemhnRHh0TjM0MW96cytFdHVrVXlaUktHQkU0S2dIb0NjTWhpRXBi?=
 =?utf-8?B?R1NZTFZqZThJYTBzRTFhN2w2cUhLa1FraTMrS1V4UThueC9tY29XWUZJWmJU?=
 =?utf-8?B?RTRLRlAxczQrOUFaV0cxMUxLeC9KaUIzdkRJZzM0K0lTVUNzZGVLZTgxV3BL?=
 =?utf-8?B?ZlY5YVFmbEd6QVo1aldKMWo0TnVkaStqS01LVGRmZEU3aW83VUk5MUJKSUdY?=
 =?utf-8?B?MWV3VjFKbm1TazRjaW9FQXYwNDcrN3FnQnlKc2pMbmp4aEFkVVpyemdVUEJV?=
 =?utf-8?B?OWlLM052WHgreFZTemFlWnNaZjVmVGxEeFBlemtHaUZDREFTWDl0M1o3Qkxm?=
 =?utf-8?B?ekJUWnBrVWdwYXB1L3poU25YVDVPSFV5TFBVZ2dtTE10SE00VlR5ZkFnVzlv?=
 =?utf-8?B?bTZaa2RNR3pSeWdVYjdnMldJbHlOR0NRQ21BbjV5SnRqeWtsWWkzQVJBS3Z5?=
 =?utf-8?B?MnYzMUVSTkFqVFRaaks3RkVFVHNJOEpIWExmOEUxZkNLVVMvTnpPQ3k2OWx1?=
 =?utf-8?B?SGszMFlDVnhPZmdLRTVMQ0xoU2sycG5NU1BEbThWR2d3VkNaMWJ4a2pmakFP?=
 =?utf-8?B?NmJHUWt3WVJlMzgzY0ZSd0hoTUljWG8wSDNremFqZnVrVTNHbSsxWktsUnM4?=
 =?utf-8?B?UDUrUmxVeFNVUU9CZDBjMkVMb0xHZjFVdEl0bGxpa2R5SUVuaGYzU2tVY3ZP?=
 =?utf-8?B?SzFBNFllRFB3Wm9ldW8yU1FuaEVaTDZlVzRHT1padG1Bb3J5US9LVUFWeU5E?=
 =?utf-8?B?MVkxUHRPd2NFUTBDOElwWG8wNSs5YmJQMSt5c3pwU3A2QUMrdk1iMVdRZXNo?=
 =?utf-8?B?ZWxYUUUzM3dTTmg5OEVHUTJVdkN4ekpoemlFaXR5RVN4N0k0U291NndkYnBv?=
 =?utf-8?B?dzJma3IzRCtlWEhzaFNvczRKN05kSDJabTJpWmFmb3hkaU9aTXc4ZmpyS2Zp?=
 =?utf-8?B?K292VjNlam5rdkZ5Sng4Y1lNYnBMK01tSXkyRk0xb0hTZlB5RVc2eGlnczlE?=
 =?utf-8?Q?tKhkC2t5d71uycvqI/vKwhBLN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf853c2-0c82-4b62-a9a2-08dd98fad5d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 06:35:25.2874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m09Uxcfg0joeug24gHT/pxUEB3pZ4tabtIRb4UENpe548v1L6qFMxT9xG46aoCI+58A7Fk5YytrtBqXbTVeeIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217065

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBNYXkgMjIsIDIwMjUgODozMQ0KPiBUbzogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5k
cml2ZXIuY29tPjsgTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47IGFsZXgua2FuYXZpbkBnbWFpbC5jb207IG9wZW5lbWJlZGRlZC0NCj4g
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMS81XSBs
aWJ4bWwyOiB1cGdyYWRlIDIuMTMuOCAtPiAyLjE0LjMNCj4gDQo+IE9uIFdlZCBNYXkgMjEsIDIw
MjUgYXQgMTA6MDkgQU0gQ0VTVCwgSG9uZ3h1IEppYSB3cm90ZToNCj4gPiAtIFJlYmFzZSBpbnN0
YWxsLXRlc3RzLnBhdGNoDQo+ID4gLSBSZW1vdmUgLS1lbmFibGUtaXB2NiwgZHVlIHRvIHVwc3Ry
ZWFtIFtidWlsZDogUmVtb3ZlIGNoZWNrIGZvciBJUHY2IF1bMl0NCj4gPg0KPiA+IExpY2Vuc2Ut
VXBkYXRlOiBNZW50aW9uIGNvbnRyaWJ1dG9ycyBpbiBDb3B5cmlnaHQgWzFdDQo+ID4NCj4gPiBb
MV0gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvLQ0KPiAvY29tbWl0LzRi
ZDY2ZDQ1NDliMmU4OTI1YTc1MmUwZGFhYzNhMTg5ZDJmZWM4ZjcNCj4gPiBbMl0gaHR0cHM6Ly9n
aXRsYWIuZ25vbWUub3JnL0dOT01FL2xpYnhtbDIvLQ0KPiAvY29tbWl0L2RjNmY1NWNmNmUwM2Fl
NjNhNDBlM2FmOWFkNjg3OTgyMTU1OGQ2YTcNCj4gPg0KPiA+IFJlbGVhc2Ugbm90ZXM6IGh0dHBz
Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwyLy0vcmVsZWFzZXMvdjIuMTQuMw0KPiA+
IFJlZ3Jlc3Npb25zDQo+ID4NCj4gPiAgICAgcmVhZGVyOiBGaXggcmVhZGluZyBjb21wcmVzc2Vk
IGRhdGENCj4gPiAgICAgcGFyc2VyOiBNYWtlIHVuZGVjbGFyZWQgZW50aXRpZXMgaW4gWE1MIGNv
bnRlbnQgZmF0YWwNCj4gPiAgICAgc2F2ZTogRml4IFhNTCBlc2NhcGUgdGFibGUNCj4gPiAgICAg
c2F2ZTogRml4IHhtbFNhdmUgd2l0aCBOVUxMIGVuY29kaW5nDQo+ID4gICAgIFJldmVydCAidmFs
aWQ6IFJlbW92ZSBkdXBsaWNhdGUgZXJyb3IgbWVzc2FnZXMgd2hlbiBzdHJlYW1pbmciDQo+ID4N
Cj4gPiBCdWcgZml4ZXMNCj4gPg0KPiA+ICAgICBzYXZlOiBGaXggc2VyaWFsaXphdGlvbiBvZiBh
dHRyaWJ1dGUgZGVmYXVsdHMgY29udGFpbmluZyAmbHQ7DQo+ID4gICAgIGlvOiBGaXggbGlua2Fn
ZSBvZiBfX3htbCpCdWZmZXJDcmVhdGVGaWxlbmFtZSBmdW5jdGlvbnMNCj4gPg0KPiA+IEJ1aWxk
IHN5c3RlbXMNCj4gPg0KPiA+ICAgICBjbWFrZTogRml4IGluc3RhbGxhdGlvbiBkaXJlY3Rvcmll
cyBpbiBsaWJ4bWwyLWNvbmZpZy5jbWFrZQ0KPiA+ICAgICBtZXNvbjogSW5zdGFsbCBsaWJ4bWwy
LnB5DQo+ID4NCj4gPiBJbXByb3ZlbWVudHMNCj4gPg0KPiA+ICAgICBwYXJzZXI6IE1ha2UgeG1s
Q3R4dEdldFZhbGlkQ3R4dCBkZXBlbmQgb24gVkFMSURfRU5BQkxFRA0KPiA+ICAgICBodG1sOiBB
dm9pZCBIVE1MX1BBUlNFX0hUTUw1IGNsYXNoaW5nIHdpdGggWE1MX1BBUlNFX05PRU5UDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
DQo+ID4gLS0tDQo+IA0KPiBIaSwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGx0dG5nIGZpeC4NCj4g
DQo+IEJ1aWxkIGlzIG5vdyBjb3JyZWN0IHdpdGggdGhpcyB2ZXJzaW9uIG9mIGxpYnhtbDIsIGJ1
dCB3ZSBkbyBoYXZlIHNvbWUNCj4gcHRlc3QgZmFpbHVyZXM6DQo+IA0KPiBGYWlsZWQgcHRlc3Rz
Og0KPiB7J2xpYnhtbDInOiBbJ3Rlc3RUaHJlYWRzJ119DQoNCk1hdGhpZXUsIHlvdSBjYW4gdGFr
ZSBteSBsaW14bWwyIHVwZ3JhZGUgaW5zdGVhZCBvZiB0aGlzIG9uZSwgdGhlIHB0ZXN0cyBhcmUg
Zml4ZWQgdGhlcmUuDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzIxNTU1OQ0KDQpBbHRlcm5hdGl2ZWx5LCBteSBjaGFuZ2VzIGluIHJ1
bi1wdGVzdHMgY2FuIGJlIHNoYW1lbGVzc2x5IGNvcGllZC4NCg0KUGV0ZXINCg0KPiANCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjEv
YnVpbGRzLzE1NDENCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5
cmllLyMvYnVpbGRlcnMvNzMvYnVpbGRzLzE1NDANCj4gDQo+IENvcnJlc3BvbmRpbmcgcHRlc3Qg
bG9ncyBjYW4gYmUgZm91bmQgaGVyZToNCj4gDQo+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8v
cHViL25vbi1yZWxlYXNlLzIwMjUwNTIxLTk1L3Rlc3RyZXN1bHRzL3FlbXVhcm02NC0NCj4gcHRl
c3QvY29yZS1pbWFnZS1wdGVzdC1saWJ4bWwyLw0KPiBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlv
L3B1Yi9ub24tcmVsZWFzZS8yMDI1MDUyMS05NS90ZXN0cmVzdWx0cy9xZW11eDg2LTY0LQ0KPiBw
dGVzdC9jb3JlLWltYWdlLXB0ZXN0LWxpYnhtbDIvDQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

