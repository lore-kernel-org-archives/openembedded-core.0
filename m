Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486DFC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:20:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.460.1784499607692952532
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=y3n4TtYz;
 spf=pass (domain: siemens.com, ip: 40.107.162.36, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9T6dQiEBNiuOHXg9k3HTQtKretGzmiHLcuxYtZm41HLhOAtjT5SABjSJaNvVkf6jtPyRQjE31jTwqAsG4wSs3Ab048dIT1Jx0Nrp3j3u3O2o+kpAZAYxR+H2mogrqOuto/Sj5HnC3GL9RrRrO0ZjR6Nxd9v/+239E0PCqN7FK4E5+1fJlHRQdlwW92yKSFPFtso/L4z3Z+RVO9CRKP+kDR6la2jp+gPToXjLUIaVaIwqRMkGgCTgkHIthsZJkg121GSUNdLov4hZtq4B8LLkbK1wC9ED78BZqOMEKZBqM0NTw1w5bf17FCTcVCCRgBXClcdEwz+Im/6hI5/IsCQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLyIBP8OPO1ZGGavSigd6a7H1w4DQ0tN/pcIcSGFC9U=;
 b=BKPfRdy/WK3NW22yJp+tfCHfAhdkEe19jVjcGtClPiMyj9SDv2j5DLf+4FG1nRnfzy36fhwNIO3/pekxSZYYDRti8WgCWztiP4mbCiTNvuXa1Zo+V5XSlSEH0M6J+H7uGIE7S/nJtjcCBUbSnhSNtU2vtnL5tSCr5kGwqfX3aTiIOC2El6izqeBg0G+YY7deIV2dhJpL3LdmAdITcctYOmeYUyyMeuiae4PAbU7UdWOkUuJYHCXj4cGCW632F67V+22JvehK4sZ89kaOL3rx+hjl9cXh13/wzyq7ZhRYGeGSLdP2JcppLTWNcW0RKQ1HMA2RLN65iRM/VE6dU54m6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLyIBP8OPO1ZGGavSigd6a7H1w4DQ0tN/pcIcSGFC9U=;
 b=y3n4TtYzfaNxxeesWJi4RLLylo0RINkdOac0XsItp5bm1ftiVr0RVhbSqDQ15hI69DqrgpU+9zNHb0rBEvtVH+DJ8TPm3RrLbCVpnNmph0kTjJBy4xWeL1f3a7dubhN7QH8vVjNKGOUPJYRJJF9JX040zXl27+HuacQ0CdvFpDcx+hJG15BRxxph7Fs/USi8ZwE/kujb01D3NZhuzM/rdIVwsxiIYx5TT091tZjToAPLfMbqr+RTR/l3deoQkmvR3UD2duugSZ3H7xLIam+a3bz1bXsARBumBove9CJD8y0ScdjDD9NHWJuPo3fCM6iHnr2gCnU50c6eqFRR1cED9A==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA2PR10MB8649.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:420::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Sun, 19 Jul
 2026 22:20:03 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 22:20:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>, "deeratho@cisco.com"
	<deeratho@cisco.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
Thread-Topic: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
Thread-Index: AQHdFH5yuoZ9QbnTFkSiPN0EkFcFm7Zx3c4AgAOShbA=
Date: Sun, 19 Jul 2026 22:20:03 +0000
Message-ID: 
 <AS8PR10MB507315DE4004CB2A27B81297FDC42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260715172142.1146263-1-deeratho@cisco.com>
 <DK0YOQ6AB7SY.CQYLAG61QCB@smile.fr>
In-Reply-To: <DK0YOQ6AB7SY.CQYLAG61QCB@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=56dae614-e490-4e62-8c44-8cf3f6550bc7;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-19T22:19:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA2PR10MB8649:EE_
x-ms-office365-filtering-correlation-id: d405c91f-d4f6-4970-b630-08dee5e3e150
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|55112099003|22082099003|4143699003|11063799006|56012099006|38070700021|13003099007|10067099003;
x-microsoft-antispam-message-info: 
 TMnArkt1SyLTz/PEe8WJYHhHcbmbLG656PPphMOfRFWd8Uc0sHVS9kP0iSpa5lVIoof65g6pcaIeKEOehJEocXfnUIn0cxnKFcOXiZ/tJoK5nhonpUt0adQmi4g0lYLttstIl6PDIJW5JX3f5snHYM2eGf1MeY9CpsviT6oh4lgjE7qGneiErtEGVKnCf0nZbalnpTK+q2gmY7CuD1ppfxlaL499OCjv16jwFqJGdKGJJ2R+nFY4G0cw9/s9k5dYvTZOsioVHQsJKyJwlphNifBDUnBUmvC2QqWMu3KSf/nLETFDl9SJtjOSEN/7QQuMtnp1lsJXLJfQikapRbHztowO3jYj/ABX1aESaHUHXFLczwBRLyvlbX2nLhgkxKYg/tdmExO7uD6lcTYkm970rZVrzr7oD01ww1M42DRsJgAMKQPmWjalA6WdrRBQrkpnEdLVLvRUeHXa0Y2isLwS70YF19jZfV8dQmWi1IQVvZVQaU4bmTfDFDuRhI6dnhIkgYZxtUGvv0PLqdydkvlwUoukqbtunSSgVu7Z6bUMZhDjP8V+BUx2z6c/mhQEBGLy0r51R0iZUU7hWhNeE4aXPIcUhws+lDsQmtv/MV+yM8MhO1LdHRyYqL0VmA9RAuAo5tU+TCxArYpEzXCSAnRvsgvOoRJV4Bnu9RNy8ZnU45E=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(55112099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021)(13003099007)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnJjc0g0eVB4TTJqN2pEYWhUcDlrTkI4bzFFbTlOSUpNRTB5d2NMa2Fmc2lI?=
 =?utf-8?B?ZFJicTNlWUJtUWczczA2V29pSlo4bEQ3V1g1bmdMM0JVL3QwNjNXYk02aHcr?=
 =?utf-8?B?SEJ1T1NxZGZweFkyV1F2TlYvYzhrZHhKbGl4UGgwT2hUOGZaMlIzTHRhRE5n?=
 =?utf-8?B?dkZPL2xtNHJtQzYxdjZXNTlpRVVSblBzQXVTQ2tZaXJCRUdyUWtxSDNGNWxj?=
 =?utf-8?B?MVZjeDU4dXhWamd1MjA1aUxoanRMRXI0eW45eTM4TGtwTm5RT0YyMFBXdWFs?=
 =?utf-8?B?VkliR1dzSG00UHJKMEc5NFRNQVVYUzlRVVBmeEkvczlWTjRjRThsMDF3NExx?=
 =?utf-8?B?c21FTnNqcFNNYURpY1RmbFNQYURjU3NxWXIxLzNzVWFadnBTd253ZXBaWWZG?=
 =?utf-8?B?UnVJRng5cCs1Q0JUb1pvUXpWVzR6TTRPaTQzdHdJL0JUeFdBRFVzeDQ5OWRj?=
 =?utf-8?B?MUZScU9FMTl5cG1rNkt1OEU0dm5LRU43WUkydjVWVzNCQ0VDcVMzck91Ty9B?=
 =?utf-8?B?YnhzcE4xMWFOYlYva1M0YXNmNlYrbGVFOGdZeTl1SXFHQ3pzMy8reUMzdWIr?=
 =?utf-8?B?WEdtWEZyZENTUFl5M2NGckI0akN6cFlTQXBrTUZjME1qQnNUUFRKWGt2UlNZ?=
 =?utf-8?B?aGVYVDlmZUVVNm9Wb2pxbEh3RHBEREhORmtpbEsyMVZWakxnVVE5OFVxUVlI?=
 =?utf-8?B?a21nUXBKV3RVeWx6bVM0Q3Bvdk5wOEw0YWxVbFNUaHJkaEtqNFpWVzRLVlFH?=
 =?utf-8?B?YkRIenVoUjJybDhBVlkxaE55VXBRbDN3Vm5WOVI0R2FMaTRINWFYMng4R2ZQ?=
 =?utf-8?B?WkZ5d0hCMDdiYVVucjg2VmNDL0NVcWFPN0ZDcEhmczBBT1NJdFp5U3JvenFk?=
 =?utf-8?B?QUJabmdZQWFhSjd2aTlKZ0g2MkVMcUFOK1lXOGZDU2hQRzkwQmEreThaR2VR?=
 =?utf-8?B?b2NmcEZmbVRCVTBPdUhSWndFSmkyN0NmL3A1c3JuMzRqaVNRdnVxVkh4Q1Q3?=
 =?utf-8?B?bEZqOWJCWDJjTmUyOE1XYzJFaldmcTVtcHhoL0YzTUo5eFNyQ05LMkMyb1B6?=
 =?utf-8?B?RTdJVzlZa1lKbmtjWHA2SHRraGlQZ2VDMmc5RVFGYk50L0VQM2VZeHJ0QUVT?=
 =?utf-8?B?UktXL042ejd5MzdCVkdkbWtiZjVySi9rV0V0WFQ2NzVNdTZlWWxEMS82SHcx?=
 =?utf-8?B?c2U3Vzg0a0ltMTNpRExic1VCVFBxdEt6eXNWQ3hYS1UyNWNWOFY4aHBWcUlO?=
 =?utf-8?B?T2MzUGhSWHovMHpzWWhGdUI1YzJ1K1dwWnNGVHppUTUrVjlZTnBQSEVoWlla?=
 =?utf-8?B?aGlCVHRkUmhackFpVmJyZUdmK0JwUEN1c0crTXRNYThlbzUxeTZxZlJhMzVS?=
 =?utf-8?B?TDkwUmk4TjZSaUJWVHpNcUdMOG53K0lqajkyNEg2d09uUU1FU0lOcmJrTjRn?=
 =?utf-8?B?aC9pYzlGY2YzN1REWGVzNXFyS3lZNHVNYjlnaHVnaFFSZ0E4akJmejBhS2Y4?=
 =?utf-8?B?M0hodS9uZ2YvbjdiMXhhZ084RUNKd0pJTGh3T2VUM241MFZEbCtIMGlIV1ZF?=
 =?utf-8?B?OHo1akhINFRxTTdVck5xcDZ3dzFtYU02amlKNGd6b25ZeWJaVTcwU2hYZDBz?=
 =?utf-8?B?ZWt3YVNxQ1JMTG9JQ0pOeFh2ZXZvR0FSbE1wK0Q3RlhWZnYwbEYvQjNxRDBE?=
 =?utf-8?B?ZDFJWFRNYlRFaklTMGlOcUcrb0lmdnV4QXF3bDNicXhoalV5c2pqRzdwVFpt?=
 =?utf-8?B?cGlBM0lzSXptSUdtR081YXhxb2xBQUtETzRzeHBYYkxLdEMwcExyWlorWDFQ?=
 =?utf-8?B?YWJmeWNUVVM3WXhubktoMDE3YUllWDBuNmpBQ1ljVnRpR3F5dHNFUFY3TWVz?=
 =?utf-8?B?c2tyQVlPS3BEbHl4Uzd6UE4yWXQxZ1QrUER6SHJHSEFlQ2hzZlladUpzS05G?=
 =?utf-8?B?WEFnbkxiUlovZ3plTWQzWDVjM2J2eTNTUlRpM2pUbWNEak1WM2JqUHYrd2or?=
 =?utf-8?B?UkVPZmxXekRkS1pIS3ZlRjZLQWV6elFxYjVmSFRJeXRLREpoVW1yWis0RXRz?=
 =?utf-8?B?VFF0TmJCR1kvUGhJdEdVU1FyaDJjcUU3L3YzNzZ6TXFPdEhRRlpLTjRUMkNQ?=
 =?utf-8?B?aXJ1dlVZbFpkZm5NYitvMThCd05aaXFKVU02a2pVeWhRR2dROUZCclpWQjFB?=
 =?utf-8?B?aGRKditTb0d5SE5aU2FyVzVzSFlMYk4vZzlPOURabzJjRGNPRG5ldzk5SktO?=
 =?utf-8?B?UWh0b1ZkTTN3c3gwNDF3N0p6cGJEckdSR0ZlQmNkRVliY1dnd0RBZ0VNN2xV?=
 =?utf-8?B?ZnptZlpQZTl4Mm0vTHBjUGN6bEZ0MUkyT092MVJWQnpaZHlMcFZJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d405c91f-d4f6-4970-b630-08dee5e3e150
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 22:20:03.3255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLR9jhCT8DeK8eUzl893I5KNDsmgnG8CCWFWtyaQ/mQzZDMkoNf3Jco86DwhbtCJV4JLfkGVVNrR38HGXCgDeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241307

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogRnJpZGF5LCBKdWx5IDE3LCAyMDI2IDU6NDYgUE0NCj4g
VG86IGRlZXJhdGhvQGNpc2NvLmNvbTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW3dyeW5vc2VdW1BBVENIIDEvNl0gZ2xp
Yi0yLjA6IEZpeCBDVkUtMjAyNi01ODAxMA0KPiANCj4gT24gV2VkIEp1bCAxNSwgMjAyNiBhdCA3
OjIxIFBNIENFU1QsIERlZXBhayBSYXRob3JlIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IHdyb3RlOg0KPiA+IEZyb206IERlZXBhayBSYXRob3JlIDxkZWVyYXRob0BjaXNjby5jb20+DQo+
ID4NCj4gPiBUaGlzIHBhdGNoIGFwcGxpZXMgdGhlIHVwc3RyZWFtIDIuODguMSBiYWNrcG9ydCBm
b3INCj4gPiBDVkUtMjAyNi01ODAxMC4gVGhlIHVwc3RyZWFtIGZpeCBjb21taXQgaXMgcmVmZXJl
bmNlZCBpbiBbMV0sDQo+ID4gYW5kIHRoZSBwdWJsaWMgQ1ZFIGFkdmlzb3J5IGlzIHJlZmVyZW5j
ZWQgaW4gWzJdLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9n
bGliLy0NCj4gL2NvbW1pdC9iZTg1Zjk0MjliYjY2NDEyYTk3NzU0NDBhODhjYjExNTgwM2JhODk3
DQo+ID4gWzJdIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI2LTU4MDEw
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF0aG9yZSA8ZGVlcmF0aG9AY2lzY28u
Y29tPg0KPiANCj4gSGVsbG8gRGVlcGFrIGFuZCBBZGFyc2gsDQo+IA0KPiBZb3UgYm90aCBzZW50
IGJhY2twb3J0IHBhdGNoZXMgZm9yIHRoaXMgQ1ZFLg0KPiANCj4gVGhpcyBDVkUgKGFuZCBJIGJl
dCBvdGhlcnMgb2YgdGhpcyBzZXJpZXMpIGNhbiBiZSBmaXhlZCBieSB1cGdyYWRpbmcNCj4gYWxv
bmcgdGhlIDIuODgueCBicmFuY2ggb2YgZ2xpYi4gVGhlcmUgYXJlIHByZWNlZGVudCBmb3IgZ2xp
YiB1cGdyYWRlIG9uDQo+IHN0YWJsZSBicmFuY2hlcy4NCj4gDQo+IENhbiB5b3UgbG9vayBpbnRv
IHRoZSBnbGliIGNoYW5nZWxvZyBhbmQgc2VlIGlmIHRoZXJlIGFyZSBjaGFuZ2VzDQo+IGluY29t
cGF0aWJsZSB3aXRoIG91ciBwb2xpY3k/DQoNCkhlbGxvIFlvYW5uLA0KSSBoYXZlIHNlbnQgYW4g
dXBncmFkZSBwYXRjaC4NClBldGVyDQoNCj4gDQo+IElmIHVwZ3JhZGluZyBpcyBjb21wYXRpYmxl
LCBwbGVhc2UgdGVsbCBtZSBhbmQgSSB3aWxsIGNoZXJyeSBwaWNrIHRoZQ0KPiB1cGdyYWRlcyBm
cm9tIG1hc3RlcjoNCj4gZ2xpYi0yLjA6IFVwZ3JhZGUgMi44OC4wIC0+IDIuODguMQ0KPiBodHRw
czovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC0NCj4gY29yZS9jb21taXQvP2lk
PWUyMDYzYzI1MmQxYWIzMTg4ZTc0ZTllY2VkOTFiYzE3NDYzZDY1NTENCj4gZ2xpYi0yLjA6IHVw
Z3JhZGUgMi44OC4xIC0+IDIuODguMg0KPiBodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29w
ZW5lbWJlZGRlZC0NCj4gY29yZS9jb21taXQvP2lkPWMyMmE3YmQ3ZWNiNDYzZGEyMTJjMjVhNWFh
ODFhMTk5OTJlMTdlMWMNCj4gDQo+IElmIG5vdCwgcGluZyBtZSBhcyB3ZWxsLCBJIHdpbGwgdGhl
biByZXN1bWUgcmV2aWV3aW5nIHRoaXMgc2VyaWVzLg0KPiANCj4gUmVnYXJkcywNCj4gLS0NCj4g
WW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0KDQo=

