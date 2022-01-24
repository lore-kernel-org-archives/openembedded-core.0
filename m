Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8963CC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 08:19:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web12.993.1643012386205093376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 00:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I1gG1E0a;
 spf=pass (domain: siemens.com, ip: 40.107.20.57,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1dfn5et0CDKE67Ic+4bCBjkHmKvX7C1QBlf79PEyeHpIEFx3DX86jfyiJiUIceoHjQWcrQZiAWSoJ8KX8+hUWNpD4bIa8HqBZwSci0Prn4aQVbalxqQfpfDuyo40TAepTMhujNlVUnMqwPAwciKGmeLSOgb5JDLT7Zo0jw1NGMnjfIHBl1DvolYgqVjaCc8kBSEiHvhesW94qv6AEKsrPlFXGStE0cEHfwV6gkJrIPe6cbyS7YXRBLmMz9LaBLDwybJxz1mHB3XU5hocrCgTTZZjAvy2qZTBtYFHOqODygyPOTRux3JbUpYTGJ48rwliK/Kn5VnZDj+g2GVn0/Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2b6oxqAMUG4+2mYqr0+CIk8FYRkvu6jtvPaFb2eXlRs=;
 b=Qx/8utMlMzfmgs5dZu/Hm2bf7IMH9N0prP8MVD9XQPCFqbpWNEBdxeWp3fpIqxoR+940O4WqJtnYkxUXVSiFwfK+tAw+5hzuFK9hfqMuJFo5KXfpbrdyKLTiibmcb6hxpHToC1fYEQ7k2jMYlPZfgivEp582zljumdy8UW7XTR1NIQKJdjWgRSAv1C6sJzrtflOu5SdCmQQ1ShLhh7Uos0UZMjfoxeZeN0Rlu7PyGZyn+ioVyRixjbAKYCEyy2/SWjDwsXmQl4NZV2SbJcYI3P1j6BxGv35YK6YMRn/5s/IRJrPQoTJc0Wg+dnrwZ3bFAb4fQzoJWh5RvC67HS+ebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2b6oxqAMUG4+2mYqr0+CIk8FYRkvu6jtvPaFb2eXlRs=;
 b=I1gG1E0acqoo/9llcNoWqaSmTQzaBqHfnjIl06Hy1TUdS3AlIe+QJwb+GLEF+2mkYOvdkkHACcT989PQk+IrasX2R9IMwxDRRQeljahSFGjsUDumoEMNlK8AbHr9/ZjCtOtGDhGetKWkW9MCVVGIJ4Uraeb575cSNYWu8mOp1KpsTkYNqSTKEZakle7cA8BA5XGBytCJGiMWf7rs2ugXk0l7iPVaWuC1pdpT8hz1Vj5A70c74H2kIXxITb3SfOzhWB4wCx9AkV88dljUYvH7S1cL7pGxEGtYbwVx4QEbxpIPu7QaJsJpdLWTSemZcjsFcCJxTwm+Vt396AA9ceel+Q==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by PRAPR10MB5398.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:292::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Mon, 24 Jan
 2022 08:19:44 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::111a:bb31:64aa:3088%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:19:43 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "michael.opdenacker@bootlin.com"
	<michael.opdenacker@bootlin.com>, "saul.wold@windriver.com"
	<saul.wold@windriver.com>
Subject: Re: [OE-core][PATCH] kernel: add missing path to search for debug
 files
Thread-Topic: [OE-core][PATCH] kernel: add missing path to search for debug
 files
Thread-Index: AQHYDSvbMbSu3cRT3kyq2iUrLp2vLaxqjosAgAKm4QCABKaDgA==
Date: Mon, 24 Jan 2022 08:19:43 +0000
Message-ID: <485a964c58cf3b4f0c91167dd5906c95f4d20594.camel@siemens.com>
References: <20220119115759.1390792-1-andrej.valek@siemens.com>
	 <59f559e8a8f7a1ec6fccb9de63002c781cbe7acf.camel@linuxfoundation.org>
	 <9d5cf8f9-e2db-0d25-4e6f-cab32111b0ee@bootlin.com>
In-Reply-To: <9d5cf8f9-e2db-0d25-4e6f-cab32111b0ee@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3970fe2d-b853-41e8-b28b-08d9df1246bf
x-ms-traffictypediagnostic: PRAPR10MB5398:EE_
x-microsoft-antispam-prvs: 
 <PRAPR10MB5398DAA67AE263A1E5781A13925E9@PRAPR10MB5398.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UyKLaeXHXigef0SpYIhp+p7eSJj6xlCam26gTBHd72dtkDI2lv2ofnd9+cVX2tx46gvbpmu9qPYDkDKYJw7gC1c6eMdVGmsZOiFdBFC56WwISLrFHO7WcTAIcA97d52k4OhkX4TVpLp2MEvTA2HS3PFyMQFsc2Wg48ZxXVpIdZCpwRH2VEgNKk9vNT8Fm3gtqF1KIYyAq3D0ZHUIotfeYHFxbXGAd7Ar6upFknExH9bG9agnk3Nvvb+1PHf3WogFU03b2zoMFyhy+oKseBs3QQbrB6RUm9bR8EN/yRA42E+RgrNRqWB6AxDjLcLWpm7INDz9H29ugmDMJ5zqmGRB7yLKlPRMHJTHd2SK4xQelop4He1yqZJ15RXHvk/EVs5tpB7TWRbq28Yji6ft+KUsj+Sd3s21ydXEd3EF89y7iKG5bJ8SpCP+Kt1L9Y72lRx9KQogFZ42qaQx6c8vfD/rIsI4dQmmWjqgbhRBVXLgD83URUfWsMW0eswELqIM2pjixAxlguSrZRlwLrhm1XotmYDEb8r7nFiadMdnvC8BEzAtozrJSZfXsymIq4nvxwWlpGcew6cQn+nXlnDBRxn5kUWU5PgLvFqqCTyPUJRjAt6/yUgYGGwz5lxTQtIixKtyMeuBB+CCvKiQ0UdQHMJliFVYxFUdX/8CTPTKkl/wp/PRmeUyX/FN9GnvBnZm4WupDLGPDV1IWkP8QOBD5yadn3Bw4kZaNVuWLM8wQtvEBZ8Cjfkn37fc6ndBthQXZuxQ/2NW/aB+gd+MRG/FpfzDDQqj5CGz1dZJp3K4eTsoVwI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(2906002)(8676002)(2616005)(8936002)(966005)(508600001)(82960400001)(6486002)(36756003)(53546011)(4326008)(38070700005)(6506007)(122000001)(316002)(26005)(86362001)(186003)(6916009)(71200400001)(66946007)(91956017)(54906003)(76116006)(5660300002)(66556008)(66446008)(64756008)(66476007)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bEtOclFLZGMrSHRENGFSME9GRmw2MVhQYXF5dFNLV2doVlJ5dnlMZHRJVnZz?=
 =?utf-8?B?VEN6UGhYZThHTkNhbndvYmF1Yk80MVN2bWVUSWcxaXR0b1AvOTNPNlNpUlo3?=
 =?utf-8?B?cDNzTDM2TTBaN0dmU3pZdzFIUXZ1cjR5c0x6SVV1enFhalNyZEZ0RDR3VTlr?=
 =?utf-8?B?cUxnd2RKU09KNlVqK2lwV3VvYUxQRFJ4QUJ1eUpXQktPQzZ0K3Y3NEhXSzlr?=
 =?utf-8?B?RFU4eThJZW51Tk5MWUlaZ0wrQlhBaHE3V2pLa1VEU1RwbnpmbXZMRjBZQVhD?=
 =?utf-8?B?dnVrVVpEeWx3c2xKZ2Y0a1A4bHVSNmY3Zkdra0ZHZ2UrU3hQa015NkRLRXJt?=
 =?utf-8?B?eXE5SXNZMFd1cWovVE9tUkxDbDJLV1Q3eEZsaU1sUnA1RGIrRGxzN3owZ0Zh?=
 =?utf-8?B?dUp2UjU5U2NUejhIRmZMaFJjeW5Za3pVbU41TkVtZFhhb08rbnFDaGdHZTA5?=
 =?utf-8?B?eGc1SVRldFIrYU5TYW9pY1lhdTZlaS9lOXdXZHI1U04vTTR6ZEY0Tm1qTDNu?=
 =?utf-8?B?WjBEUk5LTHFGby9CSlBMa1ArNndCNTFCUVNRR1pWSVIrWTBPTnJ0YndaYU9z?=
 =?utf-8?B?QTR5bkthTFVSRnVqUHRyektONDNoZERxQUcrVmVrZ1VTVkgrVitjbXNwcGhj?=
 =?utf-8?B?SUR2dHB4MmRUTTVaV01WSWxmVEcrdXlpZkRYTXJiRVQzVjhuaWZjRUxlaEpz?=
 =?utf-8?B?UWU2REg4c0U3bVA1RFNyTGtSRm5hOHFCRjViakltdGdxbmJZZFA3TnVYUThT?=
 =?utf-8?B?UFF0dzVxMm16UjdLcjQ4bVptQlN1NDZ4aTdkK0xGT1l0bkZwUUNkMDJ1UEpE?=
 =?utf-8?B?bTl0d1RrV3FKd0k3SnhQU3BOdElOMFhkUjN4blZoaGV6TzZDZFVKL2xoM2dD?=
 =?utf-8?B?WEFtdmgxbXRQSVNvSEk3YWgwdkc5b21sMzNSbWg0ZjIxcjFXMFlsWXRIczBT?=
 =?utf-8?B?dkx1bVFNTnRMYlJtaldNNVJNZVpuQjM0TjlTdVJqM282czVxMGhubm16WW5n?=
 =?utf-8?B?d3grV1oxVTliNHVGV2c1eWErY3JVbld1ZGdSTHYyVEJTazB5Y01UVWdlWkZI?=
 =?utf-8?B?V0h4RUpQYnBvWEUxSy80dHd4U1BiOERRSC90dWJuWmNLRXJObGNqclhnMDBW?=
 =?utf-8?B?WFNOcnRKUkpFRmdoTnU3U1JHQ05VbHVMd0w5YzVqd1B3bGM1L0FVektjaFdH?=
 =?utf-8?B?V1dEMnRKd0NjcjV5WCsrR2xoemwwYXdOVjdNQlFWNlI4V3FOakhIc3ZZOXdN?=
 =?utf-8?B?bWdLZ1FZWWdSUU5QV2VVd2xLTHhubFRsMEVrVFVLbjExY1hod1RHdTM3eEpQ?=
 =?utf-8?B?T2hOaXdmb2daYXJwV1FjclV6QUdyRVVrakFYZkxzclh1RkJjMVB1MjFFTnhG?=
 =?utf-8?B?WnFBZGZkT3RhM3MxYnUrNnNSa044eTBtSEc0RVo0a2ZxaGRITTg4cjFIRTZJ?=
 =?utf-8?B?NFRtbTVZOTlDNlg3ZllvaWFVRUU0cG9XL1drd3pZTktYRDhJa2IwUm00Uk40?=
 =?utf-8?B?QkpTeDBWN1VMVzdsN2Zyc1Z2NlhwZzg0R1hmUDM1azRIS3lGWGxmdVNhbFpS?=
 =?utf-8?B?V3YrRXBScWZ6ektWS1hDaVZ0YzlUcE5PdjJHT0t0dVBpRzJuU3YyeWEzSjBq?=
 =?utf-8?B?SDgxVXAwRUlvQ2dkbDhMWU1VaGFXejFReWlEWlU4cjhCUUgxMGpYRVVZOTIz?=
 =?utf-8?B?NFpBYnBldHQrdG5RZzREeUNBZlZvNU5SOFlHU1dpYXNyU0Y2c3F2bHpTYXRk?=
 =?utf-8?B?QjQ1cXlIUTJveG9lSlJnWTNXQktLSXlya3VQRXBHY1ozUndxaTk5bXNJU2R1?=
 =?utf-8?B?SElwZjk4ZzZDNnJpUlNUOWNDQlBXamdOWm9tbGhFWDRXYzVEcVhnSTdCNFR3?=
 =?utf-8?B?cTlGS1dRN0tHQmI1VTVJalpaaFhJNHFIK2VxdUlwdi94WHY0eWVwRktJV1ZH?=
 =?utf-8?B?L1krd1NtY3BabFJDOWo3YVYvdmd5QTAvTXJoQjB5Y0hQaXUyV2J5Zm5TZndk?=
 =?utf-8?B?QWx6RjR3TjNaZmhuM05NRUJRdC9ML3oyd254SUI1bVhuZWd2SkRiekh2eUZQ?=
 =?utf-8?B?aWNZTjBzc1M4cXRGSXJpQ1BJOVJJc3F5SllZLzU2SitYZStQZGFPdHVtSXQv?=
 =?utf-8?B?SGl3Uzlua2IrZVZpNVpsT0dGTHQ1ek16ak1nYmRqcWhxbTJCVFdKUlNyc1h5?=
 =?utf-8?B?VDZxeHBoWHl5d2plcHk2MlVaRWZjY2RQYTQwdFdhaDdEbmNCZGVvY2VOUXZr?=
 =?utf-8?Q?zexu3+6R6mGqTA6OIOR6aq8HjvMiAWsUI/O7kwoiYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C99E9B3E69EAE7489EA91DE75B228A4F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3970fe2d-b853-41e8-b28b-08d9df1246bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 08:19:43.7447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 c62enA+8BVRrP1BaBJ+EpAAaUKcxTazdP4SjmM+mOafeM3l2MqAIQV5vRUZuY0uD68spYWV1HNOu2xiWnA33vLR2UHlQ9migUjvDmNXyc9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 08:19:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160872

SGVsbG8gUmljaGFyZCwNCg0KRmluZSwgdGhhdCB3ZSBoYXZlIGl0LCBidXQgYXJlIHlvdSBnb2lu
ZyB0byB0YWtlIGEgbG9vayBvbiB0aGUgcGF0Y2ggOikNCj8NCg0KUmVnYXJkcywNCkFuZHJlag0K
DQpPbiBGcmksIDIwMjItMDEtMjEgYXQgMTA6MTggKzAxMDAsIE1pY2hhZWwgT3BkZW5hY2tlciB3
cm90ZToNCj4gDQo+IE9uIDEvMTkvMjIgNTo0OCBQTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+
ID4gT24gV2VkLCAyMDIyLTAxLTE5IGF0IDEyOjU3ICswMTAwLCBBbmRyZWogVmFsZWsgd3JvdGU6
DQo+ID4gPiBTaW5jZSBleHBsaWNpdCBkZWJ1ZyBwYWNrYWdlIGNyZWF0aW9uIHZpYSAke0tFUk5F
TF9QQUNLQUdFX05BTUV9LQ0KPiA+ID4gZGJnIGhhcw0KPiA+ID4gYmVlbiBhZGRlZCB0byBrZXJu
ZWwsIGl0IGhhcyB0byBjb3ZlciBhbGwNCj4gPiA+IFBBQ0tBR0VfREVCVUdfU1BMSVRfU1RZTEUN
Cj4gPiA+IG9wdGlvbnMuIEZvciBleC4gd2hlbiB0aGUgdmFyaWFibGUgImRlYnVnLWZpbGUtZGly
ZWN0b3J5IiBwYWNrYWdlDQo+ID4gPiBzZWFyY2gNCj4gPiA+IHBhdGggaGFzIHRvIGJlIHNldCBl
eHBsaWNpdGx5LCBvdGhlcndpc2UgaXQgd2lsbCBub3QgZmluZCBhbnkNCj4gPiA+IGZpbGVzLg0K
PiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWogVmFsZWsgPGFuZHJlai52YWxla0Bz
aWVtZW5zLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqBtZXRhL2NsYXNzZXMva2VybmVsLmJiY2xh
c3MgfCAxICsNCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPiAN
Cj4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MNCj4gPiA+IGIv
bWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ID4gPiBpbmRleCA0NzNlMjhiZTQ3Li45ZWEy
MDFjOTM2IDEwMDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+
ID4gPiArKysgYi9tZXRhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MNCj4gPiA+IEBAIC02NDcsNiAr
NjQ3LDcgQEAgRklMRVM6JHtLRVJORUxfUEFDS0FHRV9OQU1FfS1pbWFnZSA9ICIiDQo+ID4gPiDC
oEZJTEVTOiR7S0VSTkVMX1BBQ0tBR0VfTkFNRX0tZGV2ID0gIi9ib290L1N5c3RlbS5tYXAqDQo+
ID4gPiAvYm9vdC9Nb2R1bGUuc3ltdmVycyogL2Jvb3QvY29uZmlnKiAke0tFUk5FTF9TUkNfUEFU
SH0NCj4gPiA+ICR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9O
fS9idWlsZCINCj4gPiA+IMKgRklMRVM6JHtLRVJORUxfUEFDS0FHRV9OQU1FfS12bWxpbnV4ID0g
Ii9ib290L3ZtbGludXgtDQo+ID4gPiAke0tFUk5FTF9WRVJTSU9OX05BTUV9Ig0KPiA+ID4gwqBG
SUxFUzoke0tFUk5FTF9QQUNLQUdFX05BTUV9LW1vZHVsZXMgPSAiIg0KPiA+ID4gK0ZJTEVTOiR7
S0VSTkVMX1BBQ0tBR0VfTkFNRX0tZGJnID0gIi91c3IvbGliL2RlYnVnDQo+ID4gPiAvdXNyL3Ny
Yy9kZWJ1ZyINCj4gPiBUaGlzIHNlZW1zIHRvIGhpZ2hsaWdodCB0aGF0IHdlIGhhdmUgbm8gdGVz
dHMgZm9yDQo+ID4gS0VSTkVMX1BBQ0tBR0VfTkFNRS4gQXQgdGhlDQo+ID4gdmVyeSBsZWFzdCB3
ZSBuZWVkIGEgYnVnemlsbGEgZW50cnkgZm9yIGNyZWF0aW5nIHNvbWUuLi4NCj4gDQo+IA0KPiBE
b25lOiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE0
NzAwDQo+IENoZWVycw0KPiBNaWNoYWVsDQo+IA0KDQo=

