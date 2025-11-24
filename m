Return-Path: <piotr.l.lewicki@hitachienergy.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6DCCFD317
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 10:52:37 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14206.1763981550940741525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 02:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hitachienergy.com header.s=selector1 header.b=1OzkpfWU;
 spf=pass (domain: hitachienergy.com, ip: 52.101.66.20, mailfrom: piotr.l.lewicki@hitachienergy.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYDrGywNALyUXrX6D2UgjORo06pV5VjmtUcy+sMcheMYsBeJgDTyJI+k2dwGo6of+PxFoS4LYsxlwMJUDBDokBFVS0PAhykZH5hWZDUY0yqE18j+3xetwPKt8fydinBBkxzNb+iBJBCQkPldg4dj3fm08ZTmEletu1JdBLIHR7d5VSCUWl30YXe9aXarZUGJ4cAq43CKOt4Dv+3/wrKCE5VtgSrR3hrCL2ut3N6d8DC7VFekkRSX5UCWdtH6O5kxJe7U9Ih97vxA5a7TPsd4osONh8I/yE+JE95zX15x7Bhz+tG8yx/4mIrSa8AHt41t80olZcl1X+pnvT3eaD+4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIcqc+xdN2pgxfkAeXjf4WEKm+2NqvyhWK17Oa1m/AQ=;
 b=E0hDXfTpZjO+a9a9eh0gVq2e2uEXdP/jorXZNuY5rXe6dTDq5zBaNN3gp+iHNR57KIanqIsEmflLODNEP64uIsTGzFg2WMqeJcuSEuiUusZO747JGTu8BF6KlmYkLdauMB9EyynacpABxhHEEZH9XB1Z+c7atyLbOOzHrN4fWqL35C/SwL95sejKN20lucmwW5UqYKQVTF8cLFP2RpTqcvhqtlMLLdSLzaIH3FZggTWg3GjfGUzAJblL7rRiDZ9X6+Ok5f6EPdjNb1P8r5p0DyA12PHzAH0LhphpuNac1bCysLl+V+ZeO9hCiUoTOf71T2RMXb/3vmQWv0QUVbdMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIcqc+xdN2pgxfkAeXjf4WEKm+2NqvyhWK17Oa1m/AQ=;
 b=1OzkpfWUohOi5AHtaz9cUdWretip+9QWHF8jpOZPhomXn15MKGVY3Nji85h0e15MZ2jovz+XeA0a90hQ64fzi8/PUCcjgwqjzk1XfQn7rZ+PHXdfvnERNWjqE2oTcDW5Xc0bbmvNj4/wYJx6dfQTLfL9S1/Y3atx3D54VELcK4Hjcw2inXnLa7Qg3BeEeJuT4x2pZIHtAvYsOda45VfGXV/tMYaBRGqiNreGmO1YxRwu5TGKO/Lk/yWhnODUYSWQg3LZF14T1uizAKGguhMNkn3g1Eq73O9S5U05ebiJS6b3VA98TfQ53YUySjrQjpkFKVkbJ2IgorgK8kSjVLnoPg==
Received: from PA1PR06MB9252.eurprd06.prod.outlook.com (2603:10a6:102:456::13)
 by DU2PR06MB8350.eurprd06.prod.outlook.com (2603:10a6:10:2e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 10:52:25 +0000
Received: from PA1PR06MB9252.eurprd06.prod.outlook.com
 ([fe80::3ef2:9208:5d49:e8c2]) by PA1PR06MB9252.eurprd06.prod.outlook.com
 ([fe80::3ef2:9208:5d49:e8c2%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 10:52:25 +0000
From: Piotr L Lewicki <piotr.l.lewicki@hitachienergy.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Peter Marko <peter.marko@siemens.com>
Subject: Is there a plan to update OpenSSL to LTS on Yocto LTS release?
Thread-Topic: Is there a plan to update OpenSSL to LTS on Yocto LTS release?
Thread-Index: AQHcXS+Il1vvbKtalEiQ6TQMdeEBoA==
Date: Mon, 24 Nov 2025 10:52:25 +0000
Message-ID: 
 <PA1PR06MB92523E3FDDFC687727432ACBABD0A@PA1PR06MB9252.eurprd06.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA1PR06MB9252:EE_|DU2PR06MB8350:EE_
x-ms-office365-filtering-correlation-id: 6c0773ca-9804-4628-cc5f-08de2b478d8f
x-abb-o365-disclaimer: PLPGS
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TlliYklyY3F6eUVpTkJwSEZGRVlVdWxjUXFWSm9NZWJHcG1kek0wbmhhY1JS?=
 =?utf-8?B?UGVDWXBsWC9ISk5DRExDV1FBOTUxdXVUWEZWbHVISXZ3TE95ekR5OUFneFlB?=
 =?utf-8?B?K2tRMGU4alFCVm9vcHN2SFNIZXRJb0hpeXNXazlxMVBhS3VPbndTUUJzbitm?=
 =?utf-8?B?Rjhmd2tIaDYyT20yNWlEMi8rd3JpRy9sQmdZS2xyVFpPSno4aERoTzFLSmVi?=
 =?utf-8?B?Z25oU2ozVktGVE0vS05nYkdDQzcwVnNGZ2kzOWFITWpaUENuWlBWR3htZmE3?=
 =?utf-8?B?Y3grQXJZZHRxYzNRYU1YSGdZQ3RWcSs0SC95b0djcGtCeEVSNkMxMXRVaUJK?=
 =?utf-8?B?R3ZMYkU0L1lLZHRxalhKT0ZWUndTclMyeHd3Nlk1cCtsaGd1Mzhwa0Z6NHNQ?=
 =?utf-8?B?TlI1TUFlaFNLSVVEZ1o3U0dnd0thS0RYUnFNR2R3M3Q5ZUk4TlhHa0pseGNm?=
 =?utf-8?B?SVcycUhRTXIyeWVxUDZqMUx2ZGVQaU5OTytHTENmUW9HdlIvNlNVeE5aRnZQ?=
 =?utf-8?B?Vm9lKzNOUGVLSENNb3R1UE1YV1pVR3lHdlZsU3ZuclBZSVN2T2ZRdktQM080?=
 =?utf-8?B?a0pIeSs0NjNHVFN5WnFsQWFOYXNROUhYMGkxWUpPOWJOdU00RnZYUmJ5OVZE?=
 =?utf-8?B?TUNnMlFNOVMzY2RMYW5ZZUlLMWhRNk9HZEpTT2hDd1pyS1EyREMzV2FSQmcx?=
 =?utf-8?B?M2REQXBlTjFhVWx1SEpaYUZlK0E0bGY4eDM5cGR2c2EyV1oxU2VvaDBhRm5V?=
 =?utf-8?B?TnJuOWQrM0NqVDFVbnhFMm5mS0RsSlRkcnp1T3dmTUl3bjUxUTlGZEdNYU53?=
 =?utf-8?B?K3pTOUVxODIycE8razhJd2NLZ3NjQmRKbjF6UlNaNDZpbU56Q2VxczVpdHVD?=
 =?utf-8?B?di9wanBOaU1iWGhpMzdWYmcya2lqS1NLL2VFd0R5T2lKamZ4aE9rVDFkSi9K?=
 =?utf-8?B?aDZNanpjSFBtK2o1UDRtR3NpaS93OWhmOUpGMHgrYld1NlA4eTd3Mko3Wkli?=
 =?utf-8?B?SGVyaUNGRmhydDRhUFJUeG8xUjA3eW92TEJ0VzQ5dUJRYTNPSWdwdXp3cDVI?=
 =?utf-8?B?bi8rMlo3T0Q1R3NsUzBTL1F1a0liRko5Uld0eE1TQUFMbWswcFpSYnhaWDY1?=
 =?utf-8?B?eXhkeElrejNYQVo2d2ZxSkRkdGtRL3k5eG83cVBibE5XcURPN2l0NDR3L0Zx?=
 =?utf-8?B?dTRoQjhFK3ZsMXpkTUgwK2RVTEorV2ZWOFptMTdmbkw0UlRWMUQzS1paR29y?=
 =?utf-8?B?REVLZmpURm1uOERiM25sYk9tT1RSMnAxY0QwSm1mbmVGdDEydlI1TlVBdzIw?=
 =?utf-8?B?bVZlRXVvOTRhMlJmTnZPU1hHaW1RTkRPREhXTjIrMXE1UURnOUFneTdoYnFV?=
 =?utf-8?B?c1NTVXRmUlZ3OEIvZHZSd0JQSTFNK1p1eXVRcU1VbGNTdnZ5L2Rnc0NtbStI?=
 =?utf-8?B?azRFWjBQajh0S1dVdFo1Mm52OHJuNGVMMnRhZVdSWjlMRjZQZnlHREp5elN4?=
 =?utf-8?B?SlZ0TWtNeXlEM1cwbEJaenNLVDF3bGJzWmJLdVc5N0VqT2wzK2JVWmN3QTlD?=
 =?utf-8?B?alk0dWF4dllEMkpaM3E4WlBoZzlNNG1UallRRS9UUk5xY2xOMVp4Qlh3L09p?=
 =?utf-8?B?c0oxQ05odWNySitaYlR4cEhlYmtEOURyUlc3Y2hCNXlVOVc4NXdQSjJQem41?=
 =?utf-8?B?V2x0VzBwNGxUaTZ1YlJpNEpRTHErNFBUMWUzd0J4QlViQUJVMnZmMmtYZFY3?=
 =?utf-8?B?dlFBOXArVENBWjlXRU5JY3RsSitzVTZJZzQ2dURxbnI5T2pVL3JjcmZwV3lK?=
 =?utf-8?B?YVRzNGVLSkwveVBNelVnMXdDY2tYdUF0WGMvRWxaZVlVMUVhelYwSjlNZlU1?=
 =?utf-8?B?VWplS2NBWEZYZklpd2ZhWXJTUEVXREtLdHJUd2NNdWlYYktzb0UyMzAxZG5h?=
 =?utf-8?B?ZzF3ak5Od3ZJc3NPYlRsdmN2ZTNEbSs3a0FjbDlLVEQ5YzJHOVVvWVVadnZH?=
 =?utf-8?B?MmYvSm5URStBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA1PR06MB9252.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d3hGV2JQOUxmOGNjdUhTbllWNlVIMWhYSzJLTUVnQlVpZkl2UTd6dXZZbWI1?=
 =?utf-8?B?RWN0aXFYR0twQ3JqbXQ0NWRRQThKQ1hReGZmVE13a2dOMDZGemVXMVh6UHAv?=
 =?utf-8?B?NDdKamNDaXVjVksvaE1KektBUVFDUlp1OFdoM0t3dkpJVXcyb01UZzlZeVdV?=
 =?utf-8?B?YXczekxOeUhCbmhwbWxiNXZJS0JvTmY4TFlVU0hOeGFMc3lJVzJTMGVGN1hY?=
 =?utf-8?B?QXZ2M3ROdGYvMDNLa2dCcUIwUlhWSFBDVmQzSWY3OE8xYytKMTkzeHNBajhT?=
 =?utf-8?B?djJ6QXJoOXgxbE8zVjUxdVB0SDFvdW5jand2YVVmVGNtcmRtSHk5NlVoS2Zv?=
 =?utf-8?B?QytxNXNpTnNLT2FxdHdxZjhtQ0lCWmRza2oxTTYxN2hrejNMWVhYdXRUNGRj?=
 =?utf-8?B?RlFTdFhxUjN3MWc3amNTNTUvN0crcWJheldYQklhdy8vakNkeFJvNW5BUnZQ?=
 =?utf-8?B?TENJZjRxVDh5NGdFYnZ3NmJHd2d6dmJGdUNzTVRSb013V2xqOWlnWmk2Slc2?=
 =?utf-8?B?UytwbkVpM2RhU2UxUkowUG9aTHlYOWVsTDdXSmgzR25jNTVhM01qSHZBWHpV?=
 =?utf-8?B?TkR5MlBGVzhVZVRwRlpKdFBVZjBDWmozRy9rMlJ6ODBROGtxY3lnSnRTL2Qx?=
 =?utf-8?B?M2NKZDBMb1M0TkN4VDNlM3FXSVFXQ0s0UUVXOU5zL2JyMmNwUUNRU0xTUGpX?=
 =?utf-8?B?L0Z3aWxaOFNaWG52MEdPWTl2RTVlbU5RS3dqckxqUFNubzhqN0dsZDJMUDNu?=
 =?utf-8?B?cWNZd0ZSVVdINk1kK0lRa0UxbXliMndGSGtOS2xlMWIwUGNhWWViZmRvMEVo?=
 =?utf-8?B?eEtGaU5tZlVMcG9OamxrdGJsUlBGYVRMZTBJUXhPS0s0SzludzdlaGVGVnJ2?=
 =?utf-8?B?bndIVmNJODBNbGR3TXhNYUtQS2U1QzdvRzZsckhRbm9TTWl5RUM3S3BIc1JF?=
 =?utf-8?B?T0cxZUlvOElXMlhqQ2tybS9WM0dpbG9pbmdPWS9jQ2xXMnhwRFA3MmdOWHMw?=
 =?utf-8?B?ZzFVUkNJWEpxd0RqaHR4a3dTdytyWC8zb0JldmV3TnZPbjN5NVNyT21wT0t2?=
 =?utf-8?B?NDVEVndVV1FmMVNBV0g3QUovTnZNNWlBNkRXNExwZzNTVWNuTVVYV3FrZUhl?=
 =?utf-8?B?UlpyZ0Z5WlNxREFxK1BTVGh6aURhY0xiVVl0YW95dUlPQkV6d2IyMnJJL094?=
 =?utf-8?B?cHZXenhoTWV4QzZxRlFNdUVGclNkdjBiZ3dBSm9aeTc1T3FZV3M5YmFvdVVx?=
 =?utf-8?B?K3d3MU5icDRRSUVnK1Q1T1JaTlBaZmMyOGdockFJVjczVTVRdmpDUUJjSkw0?=
 =?utf-8?B?YmdsQXdBT0xseWxXMk5UUnZnMmVNUTYzTU9OeGZCZkdmbFczYnMyUUhxUFVD?=
 =?utf-8?B?NkZxMlFoS09oSTE4U0Z3ZktrQi9EdDEyeERWRDl6c05YUXRnMnBENWNJTE9j?=
 =?utf-8?B?Q0RQVmh3bnkzaEpjWUdJSGlwNWdxY0RPRUJrUHFuSnlDdnBKQ0p6VkowSTUz?=
 =?utf-8?B?dUhCc2QwSzlDSUJ4cGZCKzN1YUl5N0l2YUJPNERNUEd3MXRpNVF2NGlxbkQ3?=
 =?utf-8?B?OWloejBaam5yeEY1NDRrSjh1eHE2RFpqaHVUVjZiY2tZTXRqQitySEhVR3ZC?=
 =?utf-8?B?K3VVSUVLT281eXZiTGg3T3VINUdxNXZIYkt1dGtZRE5XV2ZTVURHK1kxemg2?=
 =?utf-8?B?ZDZUcTBLMEdGWU1zbUQ5RUQ2ejBVY09aaUFwOStxOTZZRU0vQktYaE83d3Yy?=
 =?utf-8?B?dXpLNVZGRUlYL1RDeHNkbDd3YzRudU1kZnR1bmYrVVNRaFdXckRmQVFDKzhB?=
 =?utf-8?B?azgvUkZleVpTME5nWDc1ZVpaSklORUJnM2QyUjV5V3gvcnJkem54K2tHcnQy?=
 =?utf-8?B?UFYvWVZZbEF0NTZOY0hGaVdSOFBzbWpRNDRqTjJjcmNralJjMmFDWksrWHMr?=
 =?utf-8?B?MHVYZm9JeWF3ZmtqcTBha2JnV0VCZ0F6WEtWeDNSbFZvL0o2N1hHVFpYak1o?=
 =?utf-8?B?OVNlTUVubHVPN2dDbnllalNBWWxscXFxMXdaaGJWWUtxVUQzd1ZYMVA5Zno0?=
 =?utf-8?B?NEhlZGV1YU85eGIxWkZWdVRYNDExTnVFNHBUYlRDQnExbUZ0eEJIdGY2QSty?=
 =?utf-8?B?QmdDSyt6SHFPRExrYlFhRndVODcyMCswZlhCQ293SEZDaGdpSjB2Qmkxd3pz?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA1PR06MB9252.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0773ca-9804-4628-cc5f-08de2b478d8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 10:52:25.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6/nHLl311IIpN11TMjmdt/pT6LXjj5XhvorukH+rYUScKunT1lww3N06iMx0enbEdysK0GUtl6uRkXFDpF/NMvOWOsNqoIsaSioCJTg7NdjLs1VYWWmd/001Omhln+7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR06MB8350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 10:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226741

SGksDQpJIGp1c3Qgbm90aWNlZCB0aGF0IHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIE9wZW5TU0wg
dmVyc2lvbiBvbiBTY2FydGhnYXAuDQpXZSBzdGlsbCBoYXZlIE9wZW5TU0wgdmVyc2lvbiAzLjIu
NiBvbiBTY2FydGhnYXAgYnV0IFNjYXJ0aGdhcCBpcyBMVFMgdW50aWwgQXByaWwgMjAyOCwgYnV0
IE9wZW5TU0wgMy4yICJ3aWxsIGJlIHN1cHBvcnRlZCB1bnRpbCAyMDI1LTExLTIzIiB3aGljaCBp
cyB5ZXN0ZXJkYXkuDQoNClByb3BlciBzb2x1dGlvbiB3b3VsZCBiZSB0byB1cGRhdGUgU2NhcnRo
Z2FwIHRvIE9wZW5TU0wgIlZlcnNpb24gMy41IHdpbGwgYmUgc3VwcG9ydGVkIHVudGlsIDIwMzAt
MDQtMDggKExUUykiLg0KSXMgdGhhdCBmb3Jlc2Vlbj8gSXMgdGhhdCBhY2NlcHRhYmxlIHRvIHVw
ZGF0ZSBmcm9tIDMuMi42IHRvIGUuZy4gMy41LjQgKGF2YWlsYWJsZSBvbiBtYXN0ZXIgbm93KSBm
b3IgdGhlIFlvY3RvIExUUyBicmFuY2g/DQoNClBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGlzIHRo
ZSBwbGFuIG9yIGlmIHRoZXJlIGlzIG9uZSBhbmQgd2hldGhlciB1cGRhdGluZyB0byAzLjUgd291
bGQgYmUgYWNjZXB0ZWQgYXQgYWxsLg0KDQpCZXN0LA0KUGlvdHIgTGV3aWNraQ0KDQpFLW1haWw6
IHBpb3RyLmwubGV3aWNraUBoaXRhY2hpZW5lcmd5LmNvbQ0Kd3d3LmhpdGFjaGllbmVyZ3kuY29t
DQoNClBTLiBBZGRlZCBQZXRlciBNYXJrbyBhcyBoZSB3YXMgdGhlIGxhc3QgcGVyc29uIHRvIHVw
ZGF0ZSBPcGVuU1NMIHZlcnNpb24gaW4gU2NhcnRoZ2FwLg0KDQoNCi0tLS0tLS0tLS0tLS0tIFVX
QUdBOiBOaW5pZWpzemEgd2lhZG9tb8WbxIcgamVzdCBwcnplem5hY3pvbmEgd3nFgsSFY3puaWUg
ZGxhIHdza2F6YW5lZ28gdyBuaWVqIG9kYmlvcmN5IGkgbW/FvGUgemF3aWVyYcSHIGluZm9ybWFj
amUgcG91Zm5lLiBKZcW8ZWxpIG90cnp5bWFsaSBQYcWEc3R3byB0xJkgd2lhZG9tb8WbxIcgb215
xYJrb3dvIGx1YiBuaWUgamVzdGXFm2NpZSBQYcWEc3R3byBqZWogYWRyZXNhdGVtLCBuaW5pZWpz
enltIGluZm9ybXVqZW15LCDFvGUgcHJ6ZWdsxIVkYW5pZSwga29waW93YW5pZSBsdWIgcm96cG93
c3plY2huaWFuaWUgdGVqIGluZm9ybWFjamkgamVzdCB6YWJyb25pb25lLiBQcm9zaW15IG8gbmll
enfFgm9jem5lIHBvaW5mb3Jtb3dhbmllIG5hZGF3Y3kgbyBvbXnFgmtvd3ltIG90cnp5bWFuaXUg
dGVqIHdpYWRvbW/Fm2NpIG9yYXogbyBqZWogdXN1bmnEmWNpZSB3cmF6IHogZXdlbnR1YWxueW1p
IHphxYLEhWN6bmlrYW1pLiBEemnEmWt1amVteS4NCkluZm9ybXVqZW15LCDFvGUgcHJhd2Egd8WC
YXNub8WbY2kgaW50ZWxla3R1YWxuZWogZG8gbmluaWVqc3plaiB3aWFkb21vxZtjaSB3cmF6IHog
emHFgsSFY3puaWthbWkgbW9nxIUgbmFsZcW8ZcSHIGRvIEhpdGFjaGkgRW5lcmd5LiBOaWVhdXRv
cnl6b3dhbmUgdcW8eWNpZSwgdWphd25pZW5pZSBsdWIgcmVwcm9kdWtjamEgc8SFIHphYnJvbmlv
bmUuDQpBVFRFTlRJT046IFRoaXMgZS1tYWlsIG1lc3NhZ2UgaXMgaW50ZW5kZWQgb25seSBmb3Ig
dGhlIG5hbWVkIHJlY2lwaWVudChzKSBhYm92ZSBhbmQgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFs
IGluZm9ybWF0aW9uLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3Is
IG9yIGFyZSBub3QgdGhlIG5hbWVkIHJlY2lwaWVudChzKSwgeW91IGFyZSBoZXJlYnkgbm90aWZp
ZWQgdGhhdCBhbnkgcmV2aWV3LCBjb3B5aW5nIG9yIGRpc3RyaWJ1dGlvbiBvZiB0aGlzIHRyYW5z
bWl0dGFsIGlzIHByb2hpYml0ZWQuIFBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRl
ciBhbmQgZGVsZXRlIHRoaXMgZS1tYWlsIG1lc3NhZ2UgZnJvbSB5b3VyIGNvbXB1dGVyLiBUaGFu
ayB5b3UuDQpQbGVhc2Ugbm90ZSB0aGF0IEhpdGFjaGkgRW5lcmd5IG1heSBvd24gdGhlIGludGVs
bGVjdHVhbCBwcm9wZXJ0eSByaWdodHMgdG8gdGhpcyBlLW1haWwgbWVzc2FnZSBhbmQgaXRzIGVu
Y2xvc3VyZXMuIFVuYXV0aG9yaXNlZCB1c2UsIGRpc2Nsb3N1cmUsIG9yIHJlcHJvZHVjdGlvbiBp
cyBwcm9oaWJpdGVkLg0KLS0tLS0tLS0tLS0tLS0tLS0NCg==

