Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD20FCCFA18
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7991.1762461973323349805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vzKBuQGS;
 spf=pass (domain: siemens.com, ip: 52.101.65.39, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxNOVtbAU3xx75jFherRD+owO+Zblwqw2iBzI9KEPqhrm1vkRf4jkLAB6uC5hebLlJOG73Sk6Tj6AJJJEA2Iwg/a5H8YETxW2Tn/ZBE4UKQL9w60aBgDHZbAwfg0eRaoKo2b8ouZXICA+fZF/BcUBAU1BGEVr11S09LgSAjBHgA/31isZrsioiQflnyqKeo+/xX5YtS8Xk44R6Eora+5wvkztItkqa48YwxU4RDfHB2Q9ZVt8P+8rf9MML1gTYdpkFkf2LhShwV3NjKG5y7pD53cCB3jj52s9JbVTptSK+65yUc2e9kA4+raMmYNwsRkJOqh3V0GIkmEgIAn1wBmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KYfwseW3XPoDW3zKXZ+69RK2NFV70KwJ2lgQEntuBI=;
 b=U/YG7nqQoj4YZgRVCZYjKzJ7jQIDWW861DmeBtqNXU2az1j5Q/g9J2tLB3Re0OpMhMVHRYlsvqWuLfoJSZ4iXd1oFriO65d/qvE0Xi346k5F97eQ1v5pvNYx5+bKqG/1ZJ5vvOfWXgIlukN3rEFshMBOloe9eGinwa4Zddd0jMjoKggTF5YTUxxF++nEfkrB/nxttzTUAmWBBNY1yHviNhX4vAu+fFIw/mluwzAZfWw5YcLRs8FhQ6T30ghFYUFfCCjU4oqKyaT55Ovs8vi9/DQW+ZEwmp24WUeC4+LAd967fMBmh9KzxZJfUrVzknDMiyK3vjlFuj9Kr4w07Kovxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KYfwseW3XPoDW3zKXZ+69RK2NFV70KwJ2lgQEntuBI=;
 b=vzKBuQGS7aq+TlaVWv5dQ8p5g4Twb5ZizJhfy4+6TSG63MOvRBVtoNsFX0w+7eXmTiGoa5xOngknz2yf48uR5J/jf121ZT8xp3XXD+ahP5Qb1csqiWGCj2uI37Ra7mP49i47RggaCN1DBjVqQyOWRKmHljWObGIRoiiMSaBWz2AeYbF7Pfl2Uldf/ozKgD+SrOd8AzjopDGwPHKF/4kHV6l9xRj+uayg564J5J6db7ll9Jek8W4eGEOQUMOj0ZJgc2D+/mZ3XG02rgrwImLB93o3xaJ4tx9W2tWs35G/okXJ7GdQFORdQBneiCFY3QsSy6aSUtktDobN303LetepKg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB3PR10MB6882.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 20:46:09 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Thu, 6 Nov 2025
 20:46:09 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
Thread-Topic: [OE-core][kirkstone][PATCH] curl: ignore CVE-2025-10966
Thread-Index: AQHcT1rNO4e1IHDDlUWI9a8yFB8OELTmHNoAgAAA3ZA=
Date: Thu, 6 Nov 2025 20:46:09 +0000
Message-ID: 
 <AS1PR10MB569749F18CF02AF8CD990895FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251106202024.3084674-1-peter.marko@siemens.com>
 <CADySD0Gi+0SdC9q3PMamqrB0H-m81fZo2yT9vm0rX5=L99++gg@mail.gmail.com>
In-Reply-To: 
 <CADySD0Gi+0SdC9q3PMamqrB0H-m81fZo2yT9vm0rX5=L99++gg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d3452545-07c1-4850-887c-6e2a8becfbf6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-06T20:44:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB3PR10MB6882:EE_
x-ms-office365-filtering-correlation-id: 86f270f2-8334-42a8-b0b6-08de1d7583bd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U0FQUVZJY3dHRlVvbXZSZHJMQUtMM1NKZ3R4VlpsaEZUc0ZBWVNjNG1EdStY?=
 =?utf-8?B?ZTJFMzhyV2VXNFc4M0NScDhnSkIrSU1ObUR2b25JWmgyMmVLb3gybnBMai8v?=
 =?utf-8?B?T0dFQlN2N1NnQmpVWk5KZkpsVlN0VFBFQWVwTWZVdkthTkN5Nk9yWHBMcWlY?=
 =?utf-8?B?d0UrS25nMTU3UjFtRVc0Lzc5dU55Yi9YQUR4ZVhPVnpsTFdDMkxNek9Ha2w2?=
 =?utf-8?B?TVRSZXV2b3YxaFVSbm8rVHZTZGQyTk9PKzl3WllPQ3EvQ3NZbE54MlRpT2Zl?=
 =?utf-8?B?cld4VGlCNjlGcUlseEpveCs4MDNqQ0EyL01jeVVWdVNOTHNsOGtxWUNMUlBF?=
 =?utf-8?B?UzF6N0JGV3RBeC9xTG9KdUl5SzlpdUtMclpPb0VhUFQzVWhXUml0L1NxNXpN?=
 =?utf-8?B?dkFrV1Bpb1FMVnI1UkVUYzN2WGtrSzA2REptVkhFaEUwRk1rWGVWK0FueDJq?=
 =?utf-8?B?NFBjQ004ekxSY2k3WVZsWml0Z0FqdStFUXZDMGhCTTV1RktYWEtmTG1ubmNB?=
 =?utf-8?B?NWlBVEdvOWM3Wk1oN2M1MmNUdGF4OTdvYTFtR01GRStZM29MMnpYL2NKQjFm?=
 =?utf-8?B?N2lRWU42Sk43bmNPNUNLMVhEcEh1RTR1ZFp4aEwvdmlPaksvaTQyei9zMWZL?=
 =?utf-8?B?MU5GRzN3NmhIaEhDalFjU1IrMHhzeVc3OGFhZEVpWGZRUXlJUFJVSWlEOHFF?=
 =?utf-8?B?ZnNnUWhMRFFNSTdnY3habWJvajFDbHU3RGo2aUFxa2g5WTNCc0E1WngydDhM?=
 =?utf-8?B?QXFPS0hSb3IxNU42dFVlSkI1TXBCa1Vqa3IwV3lwcWRZejZYWHRnR2pEaWd1?=
 =?utf-8?B?bUpEOTMxU1JVTHNuSWNyT00vNEhNTTFxYStZQmk3ZUt0VDRHV1ZIOXE4NWxr?=
 =?utf-8?B?NVVxMWpuZmhkOTI0Z1BiekpqZElvbExYUnE1NWRyY25wRFhLZnlqTG5JWUYx?=
 =?utf-8?B?M3JzaEdaSXlzWUZuY0pncFBwdkJFMmc5REQxRUpEak5uNnl4ZjczZGJPcGVN?=
 =?utf-8?B?ZTZ0cEtEUC90NXVmODJ4RDNxdnRITWZVVENvTHhmWWx0SkRFa2tQenRiNGMw?=
 =?utf-8?B?WU92Q2ZhWjJmVWFQQzd3aEpLb2NmeFVhdWd5MlVUYzUrdFc5RkQvWkRtRndr?=
 =?utf-8?B?N0tLRXR4L1B5VTlMb2pJUW9Cc0JKOWJ2SU5oSmUwOVdLSmdrcTBXZXc3MW4r?=
 =?utf-8?B?RFNuWGRIWFdra1Vvbmo3clpnYTBwTGRHLzNDUm1rZDdnZ1JRU0lHekhkSnJu?=
 =?utf-8?B?Qy9rL002akxMMDFuaU9hbnEvQjBZZEJFRXJQQ1h2MmUwLzZ1clBLUVZ2dDNT?=
 =?utf-8?B?SUVBSng4MmkralQ5SVpoMTVtb2lwZkRqdjJpQk1xd3ZuWjBpQzVndWpYbTgz?=
 =?utf-8?B?ZzV4U1diQ1hYZ0tZUFg5eC9Sdm42VVBJS3Y0MVBsajFYejlMU1B0YXpDaEIw?=
 =?utf-8?B?N3ZLSjZoRzhmNUFmMTBzVnJ3ZXRiTmllbVQ3YzNzS1FTa0lMZ3JsOWpsSVhj?=
 =?utf-8?B?TTZRVUgrTFllaENOWWRDNGlnM2VraWtlem9iWk1FcHkxYVZ1MC9EVzFVMlEx?=
 =?utf-8?B?L3RhbG1nR0hRN3AzM1czeHFncW5xWDNYWDl3VHYrM29qUDZEWmRyaGtwejFT?=
 =?utf-8?B?V1FyQ0RRckNLZWM2N1pHVWprVllTenN6RGpuU3doWUtJcitqYi9JTldsKytC?=
 =?utf-8?B?RS91T0tPdVFPZ3RFM2VheTJzbk1kdHNDeEtkQ0hoL05GUXBkUGU3c0grSzJZ?=
 =?utf-8?B?U0Z2MXhESmtMTGVUNWs4MHdSN2N2NjUyaUdYVEVTRTN6Z3F5NUp0WkJPdFJk?=
 =?utf-8?B?TnU1ZGg4a0JRWjBNYjhqdE51ZWVMNWxpREh4aFN6L1Q3eG1aWG85RDdIWGY1?=
 =?utf-8?B?ZTVlL0tRdlhYSXJQdm92ME1GSHBWV3RwTjV3M0JYbmZHaW5CY0ViNEVUa3Z5?=
 =?utf-8?B?Qkc3dUNYRDliOWdUUkY5UnRMczA0bmVCekRZTFhiY3d4dnZsMXlmazlrbXlW?=
 =?utf-8?B?YnZxZjBscGxBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SHBmSjgxc3pKak1DRWFnTkhCajYwN2FmeEZpSktaeEc3b00rZklldll6NkZk?=
 =?utf-8?B?eEdaV1JDRlBMMmVjamw5d0U5bDN4RXl4b2daOEpBLzhKUjEveFVybjFoc2Z4?=
 =?utf-8?B?b0Y2cXZyN1g5d3Y3TVlRdnZQZDdrc0xjQkM4SWxGUnREUkpUM2J5OStBUUlU?=
 =?utf-8?B?TWZvQWpHaExlK28xbUs0czh1dkZvL3kxL0NjcnFHVEw2M3JiYmF1ZkJJaUF3?=
 =?utf-8?B?L2RROFdLZjhtbmJQdWxueE9qUkxoeEEzY2tLMXFGSVF3WC81S1hiQmxBODls?=
 =?utf-8?B?NjNKSmdKVml0SHpsSUpqSmJRanUwb3RSczFYZUpQbS9KOFhlUFhWV0RUZFdl?=
 =?utf-8?B?c05hZ05mZGZyVWlpZjlrMGJsYmNsc21hT2VoR1dNcFJtbzVrbEh5YnRacUt4?=
 =?utf-8?B?SXhYWG4rVkF2YlZHandmQnFvazRZZm44RDVBOVl5bW1JT1lIcGZ6cTBFbGkv?=
 =?utf-8?B?bWU2OG5Oc04rWmJyMHVHQWZ0K1BldjByR2ZUMVhNdlFyaTBNUFh2dE41OGhX?=
 =?utf-8?B?d2xMRlp6U1UyaDhUcWNycWZxUzR4MndxVFlYY3FaTncwWnNkSXBDUnBsYW90?=
 =?utf-8?B?bXk1bzNBOU56eHdzOEdFcS9VL0ZmbDdsa21UWE1xRlg1bng2Mk1ZY2l4V1ZY?=
 =?utf-8?B?YzNVQitFSk9GVS96V3hPSEMwNUdQNWo4UDF4VzlNbklOMUd1WjZBaElZSmI3?=
 =?utf-8?B?aFJEZGx6MTRpK0U5d0x0aVJEbjBYejZPWis1MDRIaUsyT1N2dVcxZlZCTnRO?=
 =?utf-8?B?SXNpODB0YkxyQ2dGUHo4SlhFZlk5SlBjbW9ML3Jwb25IZmQ5L0wwLzBDYWt5?=
 =?utf-8?B?eXQ2TmNpSm50VzRSR3FDY1dHV0k0dURnQ3piOHpUd3ZGaEdJYWRpYVc4OER2?=
 =?utf-8?B?TURxMlN6Q0FBK1Q3ditVZmlqWWhSdVEzZGpPQ1JXcFpUblB3bUZwMUtubERQ?=
 =?utf-8?B?bHZGRjNRUVZGbjBZNU9GRlNreE5LK3RYUGNpd1J1NTF2cGowZlF6RlJwL1BD?=
 =?utf-8?B?TTI1TzM5alByaGZHM0E5M2VTRWE3WkpEL2VuWDF2RXZQNUN0NUVQZDlSSHM1?=
 =?utf-8?B?K1I1QzVyWnpJKzBCSTFnb3pFTmE0MXFRNGpCRk9FQk80cWlXTW5UK0pURm1w?=
 =?utf-8?B?VmR4YVk3Rkh1L1dpWXJGN3E4cVRkS3NsNUZZNmxGaEtlYlZwOXJHNm80azZP?=
 =?utf-8?B?cDFCV3lwQXhGK3kwT0NRODI0Mk5Cb2h6aURxR1F5N1UxWlpGcmgrSlZSUDFt?=
 =?utf-8?B?TjFVcmNsZ216OVRVc1IzQTJjbThuNEtvYVQ3WThoSXo3UTk5S3NiS3FtQTF4?=
 =?utf-8?B?bmtUSTRtU0dkRUVrNCs5THovU2xXRmxtQWQ4b05qWXVRRUJwMlRNeE1xVjRv?=
 =?utf-8?B?VS9DMWVSMllZY1BLRG8vQ2RlajdXenhyREtXdHNQL0Z1M29aem1obzk5YW9i?=
 =?utf-8?B?YjFENDYvYy9nbGxzbzBxVEVNQmQyTjVNSDBWT3JsbzRtSWppc3Nla0pnN0ZT?=
 =?utf-8?B?ZkdnQnJvWFpoMHRaM2F6M04wQ1NRTGNQOWY5Qkc4ZW9rcTdWenVQdGIvU0pt?=
 =?utf-8?B?RmtIR0Z0MTY1TXFaQ0g0QzNzclh4aFBSc2VodUhQejBZWEtFYXBtTi9PcWdw?=
 =?utf-8?B?ZUZ4SEQvQzBzM3JMWUljS0t2T3Q0UURjbVpPNnZDOTF0ZTZqM0pLKzgrMm5Z?=
 =?utf-8?B?ZVlsdGdMd1V1RjdHMWhuRkFaQUtQajVVazdMbU5CRGpIOFVRT1ZjOGFPZjFQ?=
 =?utf-8?B?NVkwZzVzYmRKZHoxbWxVRWRCRnd3d2gzUU5EMjZqcktwYjU3YzkxalJLanc5?=
 =?utf-8?B?R1FoSUF0alpmdk1ETVpUb0xhZFNBTExsQ1hFY29MUXZSZlhhSjlvSHNMOGR4?=
 =?utf-8?B?ekl6YmVYbVZwVzM4bHlrejNCSVZCZm1BUGxWNGxRUHluU255MzV4U2xTVFg3?=
 =?utf-8?B?M3Jnd1RIVUVUaVVXaytuZnRSc2ViTnhlVmloWmdEZkdibm0wUGF5YUdFbEtV?=
 =?utf-8?B?SjZGWXZhS1pjYVZGSTZkNlJjcTU5bjNldnB6b0FvUEcydzUwYUd4eWh4c1NL?=
 =?utf-8?B?MGMxS3hMRHJLM0FtUUdzMGY5TlJjdTFud28zbEQxOTFKTzBkUEdzWkRWckVz?=
 =?utf-8?Q?WZRqblG53bSDXSMQmdkY9JFwy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f270f2-8334-42a8-b0b6-08de1d7583bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:46:09.1513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XhVwch/cOJt5HyPZqVe3I8Th6dCUSL8EHA1k6vVPszvML6HAPA+ppcIuyYYbaAM5wIxRh8aSlltog1gimLCuTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6882
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5rdXIgVHlhZ2kgPGFu
a3VyLnR5YWdpODVAZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNiwgMjAy
NSAyMTo0Mg0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtraXJrc3RvbmVdW1BBVENIXSBjdXJsOiBp
Z25vcmUgQ1ZFLTIwMjUtMTA5NjYNCj4gDQo+IE9uIEZyaSwgTm92IDcsIDIwMjUgYXQgOToyMOKA
r0FNIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxwZXRlci5tYXJr
bz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+IFBlciBb
MV0gdGhpcyBDVkUgYXBwbGllcyBvbmx5IHdoZW4gd29sZnNzbCBiYWNrZWQgaXMgdXNlZC4NCj4g
PiA4LjE3LjAgcmVtb3ZlZCBXb2xmU1NMIHN1cHBvcnQgY29tcGxldGVseS4NCj4gDQo+IEJ1dCB0
aGUgcmVjaXBlIHZlcnNpb24gaW4gdXNlIGlzIDcuODIsIHNvIGhvdyBpcyB0aGlzIGFwcGxpY2Fi
bGU/IE9yDQo+IGFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCjcuODIgaXMgbGVzcyB0aGFuIDgu
MTcgKHdoaWNoIHdhcyByZWxlYXNlZCBjb3VwbGUgb25seSBkYXlzIGFnbyksIHNvIHRoaXMgQ1ZF
IGlzIGFwcGxpY2FibGUgYW5kIG5lZWRzIHRvIGJlIGhhbmRsZWQuDQoNClBldGVyDQoNCj4gDQo+
ID4NCj4gPiBbMV0gaHR0cHM6Ly9jdXJsLnNlL2RvY3MvQ1ZFLTIwMjUtMTA5NjYuaHRtbA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy44Mi4wLmJi
IHwgMiArKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuODIuMC5iYiBiL21l
dGEvcmVjaXBlcy0NCj4gc3VwcG9ydC9jdXJsL2N1cmxfNy44Mi4wLmJiDQo+ID4gaW5kZXggNTQz
NjJlNjk3OC4uMjMyNjM5MmE0ZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9jdXJsL2N1cmxfNy44Mi4wLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3Vy
bC9jdXJsXzcuODIuMC5iYg0KPiA+IEBAIC03OSw2ICs3OSw4IEBAIENWRV9DSEVDS19JR05PUkUg
Kz0gIkNWRS0yMDIzLTQyOTE1Ig0KPiA+ICBDVkVfQ0hFQ0tfSUdOT1JFICs9ICJDVkUtMjAyNC0z
MjkyOCINCj4gPiAgIyBpZ25vcmVkOiBnemlwIGRlY29tcHJlc3Npb24gb2YgY29udGVudC1lbmNv
ZGVkIEhUVFAgcmVzcG9uc2VzIHdpdGggdGhlDQo+IGBDVVJMT1BUX0FDQ0VQVF9FTkNPRElOR2Ag
b3B0aW9uLCB1c2luZyB6bGliIDEuMi4wLjMgb3Igb2xkZXINCj4gPiAgQ1ZFX0NIRUNLX0lHTk9S
RSArPSAiQ1ZFLTIwMjUtMDcyNSINCj4gPiArIyBub3QtYXBwbGljYWJsZS1jb25maWc6IGFwcGxp
Y2FibGUgb25seSB3aXRoIHdvbGZzc2wNCj4gPiArQ1ZFX0NIRUNLX0lHTk9SRSArPSAiJHtAYmIu
dXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLA0KPiAnb3BlbnNzbCcsICdDVkUtMjAyNS0x
MDk2NicsJycsZCl9Ig0KPiA+DQo+ID4gIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBiaW5j
b25maWcgbXVsdGlsaWJfaGVhZGVyDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3Jv
dXAuDQo+ID4gVmlldy9SZXBseSBPbmxpbmUgKCMyMjU5OTMpOiBodHRwczovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvbWVzc2FnZS8yMjU5OTMNCj4gPiBN
dXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTYxNTk5
MjQvMzYxOTczNw0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+IFthbmt1ci50eWFnaTg1QGdt
YWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

