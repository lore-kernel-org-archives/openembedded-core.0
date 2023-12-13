Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18499C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:53:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.57])
 by mx.groups.io with SMTP id smtpd.web11.1868.1702504427062396277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=GzbFq8SM;
 spf=pass (domain: siemens.com, ip: 40.107.7.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEpN2cAGWOS4jjtIo4sks1HCdZ5/gbQcSxGCY3J6Efnibt4rYCO/m533zkMC34xLFs3reKz+qr/yRJgWC8rvmNInFej/VDKH1MBiLdLx5/edPnfrGf50dOTSuRDDsg6clo2KGqPBqpGBto8Da6Q9S4nr6P0uhguj19bu70S9TT8ekSKNebrws75zj+cWMsHWHaFG89i74hoAAVETqhjzrFLeqzSERKzOvJyFdfDp9yOFTTwVc+zzYjQfpopLjcC40Mmb2eRLUm6T2yQnrDa1IarQ9mCb0kp56IhkoQzUpNEPDSvJecw4kncjx1gVclek5rMmS4ggmF3Y6k9BEpk1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNl91XLEjVLqNAo/b/9NGJnInn62OdgaAVBMAc9Uxfo=;
 b=RSk+JqZO75n6oRK3fj4LqrVizogF70TC/esCoGts4eygxH/bW1OFvMMQ7EoVIzhNFWUYsVk4NwSI09NLmWWO5lzvEHbHBgIC6/KTH/+h/JAT3eUVqi9Qjdu/q9coOYdxBga5amoSm5h8Q2Qx+1H1yE3uX68EyZycvDAfu/7aiNinhyxhlIEVQbReuJlNGm6e6y5ufZURNWwTBtY8+W/0Qq7o4x3+mS+POAAxSMn86E5Quq5vdjR82K+O3qwbSoNaLUKQF+uhwz31GPq3Ya3YiqN++pulm0qLaizSSct0M4EI9YC5rHdDvzgwy3kKQBa/ivTKNraZOr/DtY6FJYwRLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNl91XLEjVLqNAo/b/9NGJnInn62OdgaAVBMAc9Uxfo=;
 b=GzbFq8SMfTLEj5nB+Vj3FEJ41/ay0tb5TnMKVlstDQKqZdJah5wcOzDnBbKQCdw2+o6H1MvfoojRepCD7H6KJIDIQpEQH3T0ZuT6aUKlPVGAvYuMvmxbHvnfEBoHuhwnZseSFR8tcp0oJvxVesdgaYs9avdv4g8vzFAkvO5XRMgzOpMlIEUYep+NEOVqiGXRDjGbq6zadRZ7HaetK0E/NsIGtM0c4dEK8Qgqw6ZCCFoI1SjQuotNGo37xrP6Y7atfztn8uhr8sfHDIH3hO6HAXpMJWXK+l7y1DHXAhGJwzFW2O9qoMvi8yZsNTGnwn4JJ7IKMLtTmgPT3ZbwNQ7sJA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB6232.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 21:53:43 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::238a:d0f9:cdcb:d066%3]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 21:53:43 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex@linutronix.de"
	<alex@linutronix.de>
Subject: RE: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
Thread-Topic: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
Thread-Index: AQHaLghqvY4g3DRDuEa9HK2v46vwZ7CntbQAgAAIf5A=
Date: Wed, 13 Dec 2023 21:53:42 +0000
Message-ID: 
 <AS1PR10MB56976720657BE061DEE39204FD8DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231213210703.667740-1-peter.marko@siemens.com>
 <182ad0e88ab88b269d5b256406ca9bfffaf129cc.camel@linuxfoundation.org>
In-Reply-To: 
 <182ad0e88ab88b269d5b256406ca9bfffaf129cc.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f82323fc-3cde-42e8-afd6-b0ca073d7d7e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-12-13T21:41:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB6232:EE_
x-ms-office365-filtering-correlation-id: d286cde6-7853-4d48-8a14-08dbfc25f8dd
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6LbmW0stMUYK5tg/GVO6xYcc0dbxRM+KTaE4e8kBaTzZLxNTOzEFXwFBZfk0Lkfss31Wcf8CWs8aiomJKswQlPmVw1te3fK/YcCROrK8pdUlwA4ihju9EifiXosUv1wpiv8wsUtYD4MvSzQHg23rj5GPLtRL9LgXyaWC8SLMLzw5HkqKfv7xETxwiDePHUgme2hx4jlXc0C4ivWRxA9kYop1CZnMh9aqqwnypP0CXYh3oWvhq/Jztn6rvKUQ5OTxeXC00UJBjQ7T2pvT8ez6rXRUATwag9q6t1SsS7JGhzu5uwlr+qpHWBCrEiVMMd0xUlthGvkfAY72RvFQOmLcpXtpNlvCuwKciaztVSqoGq61Iij6RNePczjj3SnY0U1CfiJiOrJnS0uy023sWEMQIQml0cH9IKD88Y7GXZU2CTlPq7zxnRHsCIqbkaSTQlsuOm0NV4K93406gaaoURW1a63V6iOUDOcAK2eQy+X8tCnwszwz0UntFcKWRy07r81tX8eKQBUidnFLjrwtBfDApcNxOKehbAgY4f3tZbRwakIWNkoM/+i98/UJPwgcA7e7ki/WPn41AxPuVXleuhZDavDfJSeuRNHwZy+JuYrK39B2VFhk0W7X+izrbYstC3Mi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(396003)(346002)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(55016003)(38070700009)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(82960400001)(33656002)(86362001)(38100700002)(83380400001)(55236004)(53546011)(26005)(9686003)(6506007)(2906002)(110136005)(4001150100001)(316002)(71200400001)(478600001)(5660300002)(122000001)(8676002)(7696005)(8936002)(41300700001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VE9QODJMYjV1cGtnbzNSYm9seEVVRExwaWhYUkpxOXZUKytwekQvOGVncExI?=
 =?utf-8?B?VE4vOXNTRGFPUVYwZ3NPN25TTmpFRWx3Tm9wK2xiSkx5ekFpSUptd2J2Nk9i?=
 =?utf-8?B?Yk5EdE1IVWJ3NFdIYVQwNjI4OFJ2T0tlUEZLQU0xRVdJdFo3SW04QXJXaExu?=
 =?utf-8?B?NHdiV25SSEpSb1h3bXZNdWRydzhrNURhVDlYM2lXRHQ2aGZINlV2UFo3ZjNY?=
 =?utf-8?B?V1lCdXQ0bGVhWXBqT25Zb1AwL2hiMjNidnNwWEpwVXBvblk1emFYMHlIRC9N?=
 =?utf-8?B?c1FMUitaOVIreldMclJkSCtGN3hoZ3NaV2lVa0ZkOWZHSjR1cUxjOXpQeWpy?=
 =?utf-8?B?VGVZSUJRckhPazVmSVlvSXQrREJzM1NoK0REcUZYK2poMFpPcVphdFJxZnhz?=
 =?utf-8?B?QVUyaTRqRHpOS0E2ajdhb01KWndXazVHWjRpeE9EajNJTHd6QWFxYmlvWUZT?=
 =?utf-8?B?cUloV1ZlUSt5VXI4b1QzZGNwbmpPWG1BVUxoRlV4VUlEWFpuK1loU1kxVHlh?=
 =?utf-8?B?b1JrSHpHOG1qcStMNUJnZ3BoWDNjZFdOZFV2U2xxUjlvUDRraTAvUEJyUGEz?=
 =?utf-8?B?U01ldlJMUllNbm5WY29MN2lnWTZYT1JMY1oxZE1EN3hRVG9lSUVqQlRWVGNM?=
 =?utf-8?B?VW9RbEtWOWpoUXl0bUZEWDl1M0ZVaFFQM1FCWnd2R2JVL1hxekYzSEF1QU8y?=
 =?utf-8?B?R205dGRpOHF6VStNVnZIYldoNlQ1bS8vc0RpdDlBN2JLeEkzYnFlYStnSk50?=
 =?utf-8?B?c3puNzF1dVg4bWh3U1lVYi8vVUhyZUVmWHhuNG16Y2lDR09sT2FEbWl5K3hZ?=
 =?utf-8?B?YVRtMEpRSWZyWXRpc25lbnRmcVM2dVQxdTZZVWMrM01WM3B1SWxEOXd1T2Z6?=
 =?utf-8?B?TDh4Qkh3cnVkK1hKb0VFZlNYRUxYWG9kbWNnRDNZUWJ6Y0JabHVUZVltNEFP?=
 =?utf-8?B?anhBanZSd2x0bk9HZEFqbUpHZGJaK21tYndMTk5UUkZlZW9RSnB2V1ZJa0k2?=
 =?utf-8?B?blpXa2JmLzhNbHR0SEFnTkVJRVVyeXdWeXV2RWtUYnZ5SEM0SFJ4Mzh2TTdR?=
 =?utf-8?B?cHFIZXRVOEFjZUEyS0cwelNNSnkwc2hpQUYzSkxmWDRRNU5ubW1qWllHVmZ6?=
 =?utf-8?B?MFQ3RkkyRVNUODJuZzFZTGZOMmdyWklvTHNDSnBaM0ErbkduajBudW90Mk1h?=
 =?utf-8?B?WjFPdXI5bk84RmJjVjdmeW5KcncrOS9nRjhJYXNLK2RlaU16K2xjZmc2QVV3?=
 =?utf-8?B?SUhkdW53UVNLakJSQlpETTUrUmtCN0NrTlNJSVpqOFg0K0ZpNWhlcTlJOG9G?=
 =?utf-8?B?ZmpUZWk2SWkyRWZNUnFTWVdROXVKMTFWL0pqcm1PTUZSVk93akhFaG1aeFA4?=
 =?utf-8?B?Q0dHZWxOY1RiZldZS3JEOWtzaEJJNWZCbU9POTFiSzJKc2lXWVNSZkxyNGsx?=
 =?utf-8?B?SzJaS0t6bDlpNnBIKzFEZzZQY0t0QlAwWWVTZHpBL1dlOTZXVDFUMHNFaXNy?=
 =?utf-8?B?dzYzblZhaXlWblJIM0krK25ZR0F2RUVKNUJ3cFNiTElQVzJBQ3dmeXkwV21B?=
 =?utf-8?B?b0VLckN3V3R6WkJyZktaUEg2Yld3UGpCMU1TdExiR09mYUsrcW1sdXRwOGNu?=
 =?utf-8?B?WWdESCtRSUk0a3F4VGVqbVA4Y1hTNm9mNlFMM1dJcjU4bXRXQys4L2draHZD?=
 =?utf-8?B?SjlhSC9vSlRkWVJPQWtyWlBhdjBOc2huMnI4b2hBaTd6RWFlRUhaVGlSWVdL?=
 =?utf-8?B?OE5NWVpTZUhaVjY0Z0JoamM1Qnl1SE53cFdLWnN2cnRLS3ZnSC9TVTJCc2R6?=
 =?utf-8?B?OVQ3SkpHS0xjY0VnTTlUcjVQSkU5V0RtVS96RkhibUk3R1hXbHlmQ2ZqS3Bi?=
 =?utf-8?B?SnB2VXVzNkNvMi9tRDlPSWJnc3JDc2xtalB2dDdpWjkwOFpVeXpqckFQMWZ6?=
 =?utf-8?B?TUZBVFJBRCtKOVB5ZXNuRko1a1BSK3B5dFY3V1Erbm9PdkFvenNZSWZZQi9N?=
 =?utf-8?B?K253Zk5qakVZZU11a2dFdGpQampPQVhxZXJET0RZZHFZMmJWbVIwV3JuaElz?=
 =?utf-8?B?STUxUWNkdlIrbnd0Uzd0RHNVYU5QL2tLWXcySjcwbmZ0cjB5ZmRKMTZnZHdo?=
 =?utf-8?Q?ZjFyiiwB2JjxRW12wbL1Ur3L+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d286cde6-7853-4d48-8a14-08dbfc25f8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 21:53:42.1770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HoaIg/LcM7AZl5dZ7eW34MqeNh20tmWRcxvsb29xKYIhPAUgYEQJkNprTEjh65VZI0S0zj8+j9fF6nb1QEih7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192329

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIg
MTMsIDIwMjMgMjI6MTENClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRl
ci5NYXJrb0BzaWVtZW5zLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIGR0YzogcGFzcyB2ZXJzaW9uIGFz
IHBhcmFtZXRlciBpbnN0ZWFkIG9mIHF1ZXJ5aW5nIGdpdA0KDQo+IE9uIFdlZCwgMjAyMy0xMi0x
MyBhdCAyMjowNyArMDEwMCwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
d3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0K
PiA+IA0KPiA+IFNpbmNlIHN3aXRjaCBmcm9tIE1ha2VmaWxlIHRvIG1lc29uIGJhc2VkIGJ1aWxk
LCB0aGUgdmVyc2lvbiBpcyBubyANCj4gPiBsb25nZXIgaGFyZGNvZGVkIGJ1dCBxdWVyaWVkIGZy
b20gZ2l0IHRhZy4NCj4gPiANCj4gPiBUaGlzIHdvcmtzIG9ubHkgaWYgZ2l0IGhpc3RvcnkgaXMg
YXZhaWxhYmxlLg0KPiA+IFdoZW4gc2hhbGxvdyB0YXJiYWxscyBhcmUgdXNlZCwgdGFnIGlzIG5v
dCBhdmFpbGFibGUuDQo+ID4gDQo+ID4gRXhhbXBsZSBlcnJvciBmb3IgdHJ1c3RlZC1maXJtd2Fy
ZS1hIGZyb20gbWV0YS1hcm06DQo+ID4gZHRjIHZlcnNpb24gdG9vIG9sZCAoMDM5YTk5NCksIHlv
dSBuZWVkIGF0IGxlYXN0IHZlcnNpb24gMS40LjQNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLm4t
YXMtcGFyYW1ldGVyLWluc3RlYWQtb2YtcXVlcnlpbmctZy5wYXRjaCB8IDQ5ICsrKysrKysrKysr
KysrKysrKysNCj4gPiAgbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4wLmJiICAgICAg
ICAgIHwgIDcgKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gPiBtZXRhL3JlY2lwZXMta2VybmVs
L2R0Yy9kdGMvMDAwMS1tZXNvbi1nZXQtdmVyc2lvbi1hcy1wYXJhbWV0ZXItaW5zdGVhDQo+ID4g
ZC1vZi1xdWVyeWluZy1nLnBhdGNoDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCANCj4gPiBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvZHRjL2R0Yy8wMDAxLW1lc29uLWdldC12ZXJzaW9uLWFzLXBhcmFtZXRl
ci1pbnN0DQo+ID4gZWFkLW9mLXF1ZXJ5aW5nLWcucGF0Y2ggDQo+ID4gYi9tZXRhL3JlY2lwZXMt
a2VybmVsL2R0Yy9kdGMvMDAwMS1tZXNvbi1nZXQtdmVyc2lvbi1hcy1wYXJhbWV0ZXItaW5zdA0K
PiA+IGVhZC1vZi1xdWVyeWluZy1nLnBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwLi5kNzkwNmJkNmY5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Yy8wMDAxLW1lc29uLWdldC12ZXJzaW9uLWFz
LXBhcmFtZXRlci0NCj4gPiArKysgaW5zdGVhZC1vZi1xdWVyeWluZy1nLnBhdGNoDQo+ID4gQEAg
LTAsMCArMSw0OSBAQA0KPiA+ICtGcm9tIGYzMjA1NmY4MjViOTI2YjU4MjBkNDM0NzhkMTFlOTJl
ZWUxZWM5MWYgTW9uIFNlcCAxNyAwMDowMDowMCANCj4gPiArMjAwMQ0KPiA+ICtGcm9tOiBQZXRl
ciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gK0RhdGU6IFdlZCwgMTMgRGVj
IDIwMjMgMjE6MTg6MTQgKzAxMDANCj4gPiArU3ViamVjdDogW1BBVENIXSBtZXNvbjogZ2V0IHZl
cnNpb24gYXMgcGFyYW1ldGVyIGluc3RlYWQgb2YgcXVlcnlpbmcgDQo+ID4gK2dpdA0KPiA+ICsN
Cj4gPiArV2hlbiB1c2luZyBzaGFsbG93IHRhcmJhbGxzLCBnaXQgdGFnIGlzIG5vdCBhdmFpbGFi
bGUuDQo+ID4gK1RoaXMgY2F1c2VzIHZlcnNpb24gdG8gYmUgZ2l0IGhhc2guDQo+ID4gK1RoaXMg
cHJldmVudHMgYXBwbGljYXRpb24gZnJvbSBjaGVja2luZyBtaW5pbWFsIHJlcXVpcmVkIHZlcnNp
b24uDQo+ID4gKw0KPiA+ICtFeGFtcGxlIGVycm9yIGZvciB0cnVzdGVkLWZpcm13YXJlLWEgZnJv
bSBtZXRhLWFybToNCj4gPiArZHRjIHZlcnNpb24gdG9vIG9sZCAoMDM5YTk5NCksIHlvdSBuZWVk
IGF0IGxlYXN0IHZlcnNpb24gMS40LjQNCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogSW5h
cHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdDQo+ID4gKw0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gKy0tLQ0KPiA+ICsgbWVzb24u
YnVpbGQgICAgICAgfCAzICsrLQ0KPiA+ICsgbWVzb25fb3B0aW9ucy50eHQgfCAyICsrDQo+ID4g
KyAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICsN
Cj4NCj4gSSdtIG5vdCBzdXJlIHRoYXQgaXMgaW5hcHByb3ByaWF0ZS4gSGFzIGFueW9uZSB0YWxr
ZWQgdG8gdXBzdHJlYW0gYWJvdXQgYnVpbGRzIGZhaWxpbmcgZnJvbSBzaGFsbG93IGNsb25lcz8N
Cj4NCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJkDQo+IA0KDQpJIGFjdHVhbGx5IHRoaW5rIHRoYXQg
YnVpbGRpbmcgZnJvbSBzaGFsbG93IGNsb25lcyBpcyB2ZXJ5IG5vbi1zdGFuZGFyZCBzY2VuYXJp
by4NClVzdWFsIGJ1aWxkcyBhcmUgZWl0aGVyIGZyb20gZnVsbCBjbG9uZXMgb3IgZnJvbSByZWxl
YXNlIHRhcmJhbGxzLg0KQW5kIG1lc29uIG5pY2VseSBoYW5kbGVzIHRoZXNlIHR3byBzY2VuYXJp
b3MuDQpTaGFsbG93IHRhcmJhbGwgaXMgYW4gaW5jb21wbGV0ZSB0aGluZyB3aGljaCBoYXMgc3Rv
cmFnZSBiZW5lZml0cyBidXQgYWxzbyBtaXNzZXMgdGhpbmdzIHRoYXQgYnVpbGRzeXN0ZW1zIGFy
ZSByZWx5aW5nIG9uLg0KQW5kIEkgZG9uJ3QgdGhpbmsgSSBjYW4gd2luIGEgZGlzY3Vzc2lvbiB3
aXRoIG1lc29uIG1haW50YWluZXJzIGFib3V0IHRoaXMuDQpUaGUgdmNzIGZ1bmN0aW9ucyBhcmUg
c3RhbmRhcmQgYW5kIGhhdmUgZ29vZCBmYWxsYmFja3MgKGUuZy4gdG8gaGFzaCkNCkkgY291bGQg
bWF5YmUgY29udmluY2UgdGhlbSB0byBhZGQgb3B0aW9uIHRvIGRpc2FibGUgZmFsbCBiYWNrIHRv
IGdpdCBoYXNoLCBidXQgdGhhdCB3b3VsZCBiZSBhIGxvbmctcnVubmVyLg0KDQpNYXliZSBJIGNv
dWxkIGFkZCBhbiBvcHRpb24gdG8gYml0YmFrZSBnaXQgZmV0Y2hlciB0byByZW1vdmUgLmdpdCBm
b2xkZXIgaWYgbmVlZGVkPw0KDQpUaGFua3MgZm9yIHJldmlldywNClBldGVyDQo=

