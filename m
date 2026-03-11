Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7DD112580E
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:40:44 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21211.1773236436420519021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=sP8OVxkr;
 spf=pass (domain: siemens.com, ip: 52.101.84.38, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJPt82p82NJDJMq/Mx0evZEUHV3oOSONinok/jKyNEDSoR0dk06SJEr2KdNdLG1qwLVsKYz3nlt4t5E+OWYlpHR+tPjbFm6dQwdeaUhwDvy5GZSHPgL/XZQCAn068mKTyIKOkgHNNvb9+RMCIBb3C0rOemSYUVnaYV6F2kowxcTpKtHCt4eEHElL16IoIzfiVhlvPkLwnFDdkTEbfcq/DEAuER3hw7wB9XMtBLrNjfbYGjUlWyBQi8K7lNLmEYb5TW7U4ipAEMh9Ou7/uq/3NY7PXwgtuH3Io55wUYNbZs9JEVy6xeLWW1THCPsKzzpo4uMOvuuDYJuxXuE/0y92xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMMV0y5h0Y/oJORZ8aBxoYtNOzc0CEsHR/xQFH/ZP8M=;
 b=hgGb0tXDdCca3CDT0akNDfu7/Q9ocdfdcGogicCcrWZqY3u7f0b9RcF/tycnpgSBOYUS+7x9QpDb/ATG4GrqsFul4SoKK1JXQf1WyUehdKSdO92cKfgWa0Yfw6s+ScWjUjWRh9ZWRgE/mDFg9/TEAGWbs0339m6on1G4kLMtRsiNuQb5BlhKNMkHkbnAu8eKGMLlFZAMSfJIXONyBqVay84oNlyFrGBd+UM3Ipeisu8aUv6y1ZYBOFhMNjMyX5JqZj2rHHHZRpapgLp/iVvtug9TMOVn3MhnNrQByiEHFVMJH5ZuENadh5byCvUm2hden6oIxAuivQMfp8UhuFrZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMMV0y5h0Y/oJORZ8aBxoYtNOzc0CEsHR/xQFH/ZP8M=;
 b=sP8OVxkrEheRGGXGWjV5aD6z2oKcXwZyeQ2p7lflM770Js14Hl0nGjqQQIbF7/NaMCkddtTx2QyHMBkjrm8ANbHM6Vr7IdD4TpXjsq8gtKzbTr8t41TIpPrWXRUGxghyObvrCYxTBvJGEEmObFpR9zBnCIe7mh60xrP4cPw2WVG5PUeu/DUNG6yBAiPnr0PoV6LV/jGqLuGkwPSJx7Z1uo9SWTybLYmlNRwdzDEuva//J5cmYtput9LY0fbPZnYUKqJ5vl+j6Ik1bCNEdvbzn3eXTI14baT6RfXSZ4Z5Zfi4jnq9xJB0rVv+dQJ//srYg1wG7WFvRyL8jj2myzBSUA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:348::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 13:40:30 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 13:40:30 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Topic: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
Thread-Index: AQHcsVK5X2TpsUomhEOtITNyffU12rWpRWBQgAAJWgCAAAdjQA==
Date: Wed, 11 Mar 2026 13:40:30 +0000
Message-ID: 
 <AS1PR10MB56979EB1C738893C31052E3EFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
In-Reply-To: <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e2ccc5fb-0cae-4b2b-a3e7-7427a9518378;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-03-11T13:38:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB5220:EE_
x-ms-office365-filtering-correlation-id: dc6271fd-a50a-43ed-fab5-08de7f73c2ea
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|55112099003|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 HZ1SqTPH48tugR08B5cReHOkHBilASnuSVZXTKzG0abpyVSSJZ2Cb9jfrw+mart7oNbq/Dsc8iS9Xf+x1vuJPdKlaFljq9bZS3IAlLQhnHfEchphJY2MV/o0oSFZ+soHHxr83pCzQu0d2pdeH9Mx5RxYyJmykeWOojfnXgNOS9dL1jlmHKe3zSj7OUYjYIvk2GEStp2tj1EWotSxHfBYuD6AI24iU5o8B7dqwYhls/o/xtMI9vc5ZCHx9XqtvXRRxEJWrQOKxju78CcbCt+jceNnqqGUaB1vrpL56Fhvj10+l/UnqNwgM1L6/PMky6aJPanKwYgJDl2oMAUtnsZCluoySsOqpBNQI9ITzHUW9YiREBffKTAJeBMOCCc+bB5UI73Rv4XvIcAc4tBCN1LMaiEXMOtwjxxt8HNMnOMql+wx9/jxUE9A+bxUfvGDzkyN7z16U9szGIxqCTsdsJFlFtpQ1sk+QB48Aj4lWwTnOGm8bahtYpUl3En+Xx6TYDPvw9+0nJg94p26Vo76H5XjSsfVmfWkdtGgasUbhURUH+OVywwBg8NTed0PgcWaqJATRVaGrUFv9Yg7b/1N6Prt/7N/PEQxcKSXlmtbzT4mPvK1UrdVogOP9/U+uTYIh0BFM8LblMcKxxHp6kKkccT8h5uk4zEvO8kWiRvQWN+j6ApLeVmCKjAKFE4rYKnmCFvewhLGbELCHn+DaQRGg0RQS7bUv1/VSU3bneKP4iaxg/v494cSFvh8LZRd2cvwmTKq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(55112099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?djE1SWZva3JnaXFuVlpIYnhtTjZXcyt6dktmUnlscVdmdFJwNnQweE1jOGJH?=
 =?utf-8?B?WWZtTTJ4Tm9UQ2dPZnVnQloxYklHdEVkdEZib2hLWWdqUnp4amluZFRKQVdS?=
 =?utf-8?B?Tk9iVUxKTS9namFvWVcyMEJXLzFCVWhKVjVxcU9sbDRXSDQ4TXJncVJ6Rlkz?=
 =?utf-8?B?Zy9FcEtmK2RKcm5QUnBGaE1GeVY2eVVLdkdOdXhub2pYbXdaUFRUM1lsTGZR?=
 =?utf-8?B?VTZoMjFXL2gzQXpwMnA2cVVqems4TnlpMkNCSjN1RGNQR2FzbW5XTnJoVW1D?=
 =?utf-8?B?RHFxUmxrbmhSRFhjZ2ZuTTFuaWFjSUU1Wm9TWEpwcjVqSkJGcXVZWjZ1bDhM?=
 =?utf-8?B?N2NjZngzeGE3QUkyME9VS1dLNWVVY1kyTHV2cDBDU09CL3ZrUGhIeWZYZFE3?=
 =?utf-8?B?N0FZMzhsbVgvR2ptM05QaFRyOVYzQnRvNkQzWEs4azlaelJxOHl1YjR3dVJS?=
 =?utf-8?B?TWNXZUJ6K3F0V1FYdEtyVmxmb2dlRVFvZFYxNEZ3SGxqejhzYU1kYjlTWUhL?=
 =?utf-8?B?U1llOTFuMVZZeHh2TzkrZGJRUGRUaWlneXVOUE9qcUowQ2pvUU9oL3dBZVdh?=
 =?utf-8?B?cEFFR3lKOTNMTmg0bzFJQlM2ZjZFSG1yWVJCN3AvTTFzeWFQUjVKbjZzWjJP?=
 =?utf-8?B?TDNMTnd2bEZOcWVENDB5T3docWpLZndDZ1crWE5OS1haYk05MVhFbFVkWUlD?=
 =?utf-8?B?VVowakxVanFtNDUrczFtSU14M3JRV0lmczJ2YmJBNVN0U3ErUmJhck5hZmNt?=
 =?utf-8?B?aUR0aUlZbWV1U0htRW9aeGhrT1A2VFJjbmlBdWtFd0xxbjhIK2l0SGNTZ01U?=
 =?utf-8?B?QkkvYytzdzY5dTZQZ3pGTUdQb3FWTVdtUnpHNkZtbFhDWnc0bDB6SWI5TjV6?=
 =?utf-8?B?NS92K0p3VjBUdE4rdXBGV3E0SVpOT1VlSnNVcmY4M1dVRHp1empqWXRSRjJh?=
 =?utf-8?B?Ynd2QU01T3BKRFpaV3daWHkwdG5kUHUrQjZDbmxrNmhZYXBrWHVZWWxUZ1RC?=
 =?utf-8?B?NzZyemV2NnJaQXBRNmNuNGNzRGsrT0VDbkF6Vm55MVpmSEpXbVd5bVNacFpJ?=
 =?utf-8?B?NXpxUHhGcmpiMU1ib0Y4OExjemVjRHJQelI1V3RnR0xoT3ZnaENIM3g3bUdi?=
 =?utf-8?B?V0kyZ01VSElZdk5tclVobVdUQ1p3L3JUUFMycVlmS2wvQzNBWnM2THpjbWVJ?=
 =?utf-8?B?WVhrb0prVnQ1MkE1OFptR0MrRzVUelUrNXkyUzZnbzAxMjROa0MwQkMzbkVm?=
 =?utf-8?B?MkV0Q0F4TERyQW5RTlBBelgwSS9jZDFCckVWRlJkZ3NJMXp4V2w0M2o2RjJ1?=
 =?utf-8?B?SGlPdG9scG9sbnhTa0RpcUhrVW1MaG92QitMSUVzczJZQ3B6THUrNE5ncVhM?=
 =?utf-8?B?SlRiaTBiTStqdm4wcVdHTHU4Ti9MU1VYd09hVkhMKys4VHNWMG9LQ0pZOStp?=
 =?utf-8?B?Y3k3SS9aeFRCSG04RXk0b3RqTU5DaEU4MWlnWGRpNm5PTXZPZEdQZjJsZlRI?=
 =?utf-8?B?dEZ2WHZHbVZPVWxzcmszZE1YVS84WG53KzRVbUwzRmExWlpvREE2LzlTQmlW?=
 =?utf-8?B?K2lxd0F3KzByQTBUMnltNUgvZEt2TTIzSlU2N3RRanhWeCtNZUk4V2Q3ZU1G?=
 =?utf-8?B?Y3NmMFF6eE11RmJBZEszZk5lbExkTXZhbXR0bVJBMHdaU2IwdVRKbVYvK0xx?=
 =?utf-8?B?R0I1WlZzV3NUVzh5UVMvUVgxb01KYi9ITXVLaDZDOElGWHdmQUtaOVVmREdV?=
 =?utf-8?B?eUlNWVBSdlhJTDhvak5IZW5TZHV6TEZDUnRJNzMrWHBXclJQNEQ5dFZ3NjF1?=
 =?utf-8?B?SFl6VWlRbTBUczFXTmEyQWw2U2tEYW5ITEg0Mkk2ZXJJeGtKQ09tSkd1RlpK?=
 =?utf-8?B?NjhQMDZ0bzM2Mk95anJCWjBxQThYY2RQaERLU1pWb0gvRE9YUGlzWHVxTm5y?=
 =?utf-8?B?VitpOU94YTdmVHg2b09Mc0lFRHRXZHFVYlJDZGJBRzJMbUlMclRTTlN5TFVo?=
 =?utf-8?B?MmoyNEVMRWwzL1ZyY0tzTXFxTDdkcmRYekJHVGZFWk1kMTJMdGgxWU1yUmtW?=
 =?utf-8?B?YkJ3K0VjZHFSU1lYOUdtcnpMcFBPME4ydmJLQnE5SUZxR0FJZzBRRndSWWwx?=
 =?utf-8?B?NzlTV3lPQ3lTNWlFeFAxckpIMS8zUjBESFovREU1U3lwZ0FML2JCOTQ1dlNo?=
 =?utf-8?B?ZDBiNFNPZFhyN0N4eTFTT2E0Vk9pcWxkMHhIN0tiQWJRS3FnUDNNWnppcHBl?=
 =?utf-8?B?WFdxTUNrOUJlS3NDQStNdVd3dFJKWXVEa0ZuOXV6UmFMUGxYVTFNZXYxdjV0?=
 =?utf-8?B?a1dTMW1kWmlhdUlKQTJTNllxbXR1TUFNcXJNZk1DZ2FvWHlMSFRtZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6271fd-a50a-43ed-fab5-08de7f73c2ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 13:40:30.1058
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ehMwKjTWe+cUBz/nluo7swIcnnMdXnZyvYZWkwi9H9OmvgdJOCd4Na/bwdiVnN2S6WG4oGAs3DF/N13KTPcPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232881

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQsO2c3rDtnJtw6lueWkg
Wm9sdMOhbiA8emJvc3pvckBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTEs
IDIwMjYgMTQ6MTINCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIu
TWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvNF0gYmFzaDogQWRkIElO
U0FORV9TS0lQPWJ1aWxkLWRlcHMgdG8gcHRlc3QNCj4gc3VicGFja2FnZQ0KPiANCj4gMjAyNi4g
MDMuIDExLiAxMzo0NCBrZWx0ZXrDqXNzZWwsIE1hcmtvLCBQZXRlciDDrXJ0YToNCj4gPiBUaGVz
ZSBJTlNBTkVfU0tJUCBhc3NpZ25tZW50cyBhcmUgd3JvbmcuDQo+ID4gVXNlIEdMSUJDX0dFTkVS
QVRFX0xPQ0FMRVMgPSAiYWxsIiAob3Igc2VsZWN0IGp1c3QgdGhvc2UgeW91IG5lZWQpIGluIHlv
dXINCj4gZGlzdHJvLg0KPiANCj4gSXQgZG9lc24ndCBoZWxwLg0KDQpJJ20gbm90IHN1cmUgd2h5
IGl0IGRvd24ndCB3b3JrIGZvciB5b3UsIHNpbmNlIGl0IHdvcmtzIGZvciBtZSBhbmQgZm9yIFlv
Y3RvIEFCLg0KRGlkIHlvdSBhZGRlZCBpdCB0byB5b3VyIGRpc3RybyBzZXR0aW5ncyBhbmQgbm90
IGp1c3QgdG8gYSByZWNpcGU/DQpUaGUgZXhwbGFuYXRpb24gYWJvdXQgdGhpcyBpcyBhdDogaHR0
cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLXlvY3RvL3RyZWUvbWV0YS1wb2t5L2NvbmYv
dGVtcGxhdGVzL2RlZmF1bHQvbG9jYWwuY29uZi5zYW1wbGUuZXh0ZW5kZWQjbjYxDQoNClBldGVy
DQoNCj4gDQo+ID4NCj4gPiBQZXRlcg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PG9wZW5lbWJlZGRlZC0NCj4gPj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhh
bGYgT2YgWm9sdGFuIEJvc3pvcm1lbnlpIHZpYQ0KPiA+PiBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTEsIDIwMjYgMTM6MjkNCj4gPj4gVG86IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4gQ2M6IFpvbHTDoW4g
QsO2c3rDtnJtw6lueWkgPHpib3N6b3JAZ21haWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbT0UtY29y
ZV0gW1BBVENIIDEvNF0gYmFzaDogQWRkIElOU0FORV9TS0lQPWJ1aWxkLWRlcHMgdG8gcHRlc3QN
Cj4gPj4gc3VicGFja2FnZQ0KPiA+Pg0KPiA+PiBUaGlzIGZpeGVzIGEgUUEgZXJyb3I6DQo+ID4+
DQo+ID4+IEVSUk9SOiBRQSBJc3N1ZTogYmFzaC1wdGVzdCByZGVwZW5kcyBvbiBsb2NhbGUtYmFz
ZS1mci1mci5pc28tODU1OS0xLA0KPiA+PiBidXQgaXQgaXNuJ3QgYSBidWlsZCBkZXBlbmRlbmN5
PyBbYnVpbGQtZGVwc10NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogWm9sdMOhbiBCw7ZzesO2
cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9iYXNoL2Jhc2guaW5jIHwgMSArDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvYmFzaC9iYXNoLmluYyBiL21ldGEvcmVjaXBlcy0NCj4gPj4gZXh0ZW5kZWQvYmFzaC9iYXNo
LmluYw0KPiA+PiBpbmRleCA2MzQyMDljOTExLi5iNDNiMWNiZjg5IDEwMDY0NA0KPiA+PiAtLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoLmluYw0KPiA+PiArKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoLmluYw0KPiA+PiBAQCAtMzIsNiArMzIsNyBAQCBBTFRF
Uk5BVElWRV9QUklPUklUWSA9ICIxMDAiDQo+ID4+ICAgUkRFUEVORFM6JHtQTn0gKz0gImJhc2Ut
ZmlsZXMiDQo+ID4+ICAgUkRFUEVORFM6JHtQTn06Y2xhc3MtbmF0aXZlc2RrID0gIiINCj4gPj4g
ICBSREVQRU5EUzoke1BOfS1wdGVzdCArPSAibWFrZSBjb3JldXRpbHMgcGVybCBzZWQgc2hhZG93
IHV0aWwtbGludXgtc2V0cHJpdiINCj4gPj4gK0lOU0FORV9TS0lQOiR7UE59LXB0ZXN0ID0gImJ1
aWxkLWRlcHMiDQo+ID4+DQo+ID4+ICAgUkRFUEVORFM6JHtQTn0tcHRlc3Q6YXBwZW5kOmxpYmMt
Z2xpYmMgPSAiIFwNCj4gPj4gICAJZ2xpYmMtZ2NvbnYtYmlnNWhrc2NzIFwNCj4gPj4gLS0NCj4g
Pj4gMi41My4wDQoNCg==

