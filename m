Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C360CC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 09:03:36 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web12.3776.1640077415017552812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 01:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=p5AIkzuK;
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BL6iL6d031541;
	Tue, 21 Dec 2021 10:03:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp16032020;
 bh=Re9THRmXjAh78+N+Fp1sdeGjBKv7fQflVGYcVo2ofZE=;
 b=p5AIkzuK+PbKLNT96T3K3lpF9gJdIEic9SUWrPgohip9uSpFm9i2r6ifsc889vlajn9K
 fm1WasIvMfYxITQ96lLUcZt2oGpIPm6R7CR5KQ9nHyDOZkAgQ1v3sdGMKd3EXiBfoha8
 5cOoPR/AKqc+vB+A4jr3lnFbmEtP41SDiLs96bVUaWva5IrfyPN1k2sGFP2tkTELi3Q6
 K55XOxLZz0VtLm1DUXzzq2bRmqiDgTAamES9Kjm20XFLqBKReqx7LTteYBppRIlFeevG
 4RwLbNlV2Q1mm+xNce0m70dAz94y4U3No1OpdxGQfwOaH+I7R+uLenEMnMOg0fiJs5Vi FQ==
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3d39wvgyja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 10:03:32 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gu+YSEq1fyaKDTBCRHfqal2yv1o9+PDIEH96VedK9Poy0fktUfLGtM3NW/WaJQEDPgUAr7qcAUi7nQfTlTaoaMmpwesGHLBzN6kTh5ZxKHeOKQtzmC/q6BPgLJezhDnN4VUxmt44krY1DzxfO5+Y4CRHwoaUrjoyynyRtrUJGZjj45E+yeOgAqVr8GsDDDl/QnkYzkCy0jZEk/k9Ryi7DIW9FR7WwEiIvf1HtaH/mZ0SwrNWwaFRt8WDRc4pVdT9ABV8vkmXNBVsn6bBTiSCU6t9po61Zu2KOgUU+jF9ctBaa1CQMwxICoO9SPy73hCVGmcIyD+HSX0ugvmXFWUZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re9THRmXjAh78+N+Fp1sdeGjBKv7fQflVGYcVo2ofZE=;
 b=A8mwlrLEmUxCfJ3rjIA9H3y1EePA2r7O+kvGZwnBOjgQqSqbjJt6iKlGbllzzRwomO0GustcJNiajYiwHRtzIvwdQeJ7HJ095YraVcvUPxeNe/ke2oFaZ/kHRzHh90KuLHpvnRQm3mdOIdq9JN5UnVruSfC4dJqNcwsVg7eHCOvbrjaBFeiIBij1yAoUhDwAnOLpEvGlRB/vu13vJV63J4yNPNyWUbAW0T1rQ1RWOACDW83ftDvgkE23DYHEUmUixlG6S/L0srfWlxBNqFuqSJiW+qJYaxbtIulMqhyU9fUhd1cr8LjJVo0I06kT35dRIr2J7w5ogttlmodAwPXMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AS4PR10MB5174.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 21 Dec
 2021 09:03:30 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:03:30 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?=
	<ernst.sjostrand@lists.verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "steve@sakoman.com"
	<steve@sakoman.com>
Subject: [dunfell][PATCH] dropbear: Fix CVE-2020-36254
Thread-Topic: [dunfell][PATCH] dropbear: Fix CVE-2020-36254
Thread-Index: AQHX9kmfUi3YDTvgu0qkTbrAJfuhZQ==
Date: Tue, 21 Dec 2021 09:03:29 +0000
Message-ID: 
 <62703ef9115b2028f4e57328cd1abc02f2f784e3.camel@lists.verisure.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5123ff42-9966-43b7-47ac-08d9c460c1ff
x-ms-traffictypediagnostic: AS4PR10MB5174:EE_
x-microsoft-antispam-prvs: 
 <AS4PR10MB5174B300738BF59A6DA24BD2CB7C9@AS4PR10MB5174.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:127;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 02Jvta6WKZ8NQFfTTBi23jXqhNmNrmhoDu3jh/9hnuL6bB4bgAeQ58C2SltDS47giyLG/wz4ERUqFLZeZzE/xrhLc6PMsiR7QWAdRUyaygR3DRV9SZFpAiAA2Z2lhkmMxGH/iRsdazW4fXbt8jC/82YoyOjLh74LJPhYjOOhZc4jUpKZkwRLqfP7gdVdlHX2LdqYM3fdTJ1nA1YqeU69kTvCt1yVPXrxC2s4XQKaK4tZX7ghSw2hnW4/QZDSyTHvSBJdTSImJiXFpmG7Ih4lW8oRQ9zCWUowplUBeC14TdhI71OBFdiC9Y3qO1clB5Uf+UKHM/fsQhOmN3gY6SK0sPVgWCMJ5S2YjYvHmv32bSQbEj5UGuold8VObgrD8+d/0QMVl3PX/XWhXS/1fFUvDLEjysmgK4KMxOnHcRY2zFELpIrQ6d47tAnaT8vvitJSns1tXRYJhyvLwnxNlFOEEYWULkdk0EYgZor4LJAnVybqzJT3etGqUpIVa2xbm2ntkSgB7AFKYTXqQqiFhcloX3Rz3hYHPh29u2X6RWQT7DjWiizp89RFc+5B9UK/8Eb2sA77Xwbj1TuB4QQE9YAmbk29aYS0Iehb5GVNutwwmYj6AbTFrw8+WnF7OlRIG817p2781+HTbg+hosXxp0DTnRh+cTL8z9lXDnMMnMHynfTUOSE+f1p86R58HKXbJNTjFzyWaSXQdBZzCRnXF272osGFVUj9iDoERAmjwJqxgTnrrFSpfsHHjZk+02vwNZdtZ/mfF0skhS9De62SUShIVwPkDQGCm58PZtHhLs0GssQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(2906002)(76116006)(38070700005)(5660300002)(508600001)(110136005)(85182001)(6512007)(71200400001)(6506007)(38100700002)(26005)(66556008)(64756008)(66446008)(186003)(19627235002)(122000001)(8936002)(66946007)(83380400001)(66574015)(316002)(91956017)(966005)(2616005)(85202003)(6486002)(8676002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YStqcURoMjNFYk1ZbW1JUW1GNnhBa3pzc0tzbER3OXZrOXBsUHNVVnFuSk16?=
 =?utf-8?B?Z3NCMGVuUGdaREc0eWs0VURsNktPY1JHVm1jU1NQVFh0TlNGR0REbFE0Z1Na?=
 =?utf-8?B?K3NXYU5TUzNPd2I2UUVESUNqdEJKbk9xdm5xVzloaktDSWNvWVhwR2J4Nlhl?=
 =?utf-8?B?anB2a3BIWHZYWUlPMFhKZjl0RXJ2UFVPTXZ4UHpGYmxpTStUcUFuY0RFbU9B?=
 =?utf-8?B?VmRybWdsUEtURXVQQlZWbFJHNm1ONmtpUVM1Q2cwVklYaHFaS0VJWkgvNm4w?=
 =?utf-8?B?V3d3YldjbzdkMG1PelBleXQxSnZzWGxnUzVheE11cmtoNDFBc1pMazA2Z01n?=
 =?utf-8?B?WTVzRml6RzhpazRrdG5rRi90OGJCRXduTHNVdHF2NjR0bUM2OHZZM0RZWDZB?=
 =?utf-8?B?N3M0SVdxc3pLSVJRSkFSOXhnK09neTBVY0VxTkRDdy8wQVZpbEhrUmkzbTY2?=
 =?utf-8?B?SHZvb3p5czB6UXZkTGJuOXJweUo5R1NoamV5TnNKRGsxRUlQcEZaOUgvK2hC?=
 =?utf-8?B?UHJ3aGJwM1Z0SkFsTWtkTFdoTGU0bnRneVNvcEhjSWh3eEpRWXRSRDFoLzRU?=
 =?utf-8?B?QXRxU3ZtMFE4aCtYQVZYaGxCMThxeTJxUU1yQ1h6dTB3a3JIbktUUFozZ1Bm?=
 =?utf-8?B?NmNqbXZZVldIUm9LM0I0dG9qaytVUVFDdU9xYXMxSURxS0FnaVMzY0wyUVhk?=
 =?utf-8?B?M3Vlc3FSakRrRDJqNHp5WVB3NTJad1Z0SHh3QjJDQjVDMTZlMTh3K3hLNFhB?=
 =?utf-8?B?Z2I3Y2ZCUFJrWC8xUmRVQUhPaEk4ZmFJU2R0NlpZdm5NUlY5TC8yMDFFcTJE?=
 =?utf-8?B?Y1JVdEp0UW9YWGlLUnlXTXNnUUU5ZHlRUFlBSEtYcWVCaU5SNE5HbzlQWC9u?=
 =?utf-8?B?cVB4R28rMXgybXBrZStlMlRwR2V1L3JzNVgrK21Pcy91b1JLa3Zmb2tZSTVD?=
 =?utf-8?B?QzhnaHpTM3k4WHAwVUhVSkd0UGFkTm1kR2l2Ujdib2JadU5mS2xCaVlMbi82?=
 =?utf-8?B?elZ0UytEOGQwdkRXeXE0cFl1UFNkTTV0Z0dnMlpwdzZFK3hYT2tkNmhLR2ly?=
 =?utf-8?B?cjJPQjhmUC9KekRHbkZKUWUrNE5jVTI2bUdSWUhWV01IeHg1OWNLRm1xY2tI?=
 =?utf-8?B?amlneWlUVHl0dGhZczlWb1N2ZFBVOGFRcGVjY0xhZklkMEQxaTZQamR4cmxY?=
 =?utf-8?B?MXd1Myt6ak4wa2NCRlVXbTlObk8wbG1SN004U3d3VCthcTFkRkgrZnk2b2tu?=
 =?utf-8?B?cGpjaXN1VCsxWVNCK2JrL0pRYTU0VGdKcDR3eHNOMy9tNlY4NXF2OGc0cGNl?=
 =?utf-8?B?L1VVS0xvMzhWdHVkTFNTK2VzTERkSXB2SHpTZUhRWWFORFpVV1NuNnA3TXJR?=
 =?utf-8?B?S3RISllCUHJQUmRrOS9GbUN1cDluNmF5V1llOG54RlNleEh3NStwaUs3c09o?=
 =?utf-8?B?ZDNaK2czU3NoU20zMFRiUjVNQW1ScFFrMEJwRE9ycGNKaXdpWU5uTDlFY2cy?=
 =?utf-8?B?eUppSEdUWXRKTmhKaTlpQVRyNG9RbnVodTNzMWVldXBicUJuV1hnK2trZXRq?=
 =?utf-8?B?U3ZlTlNHS1JjNjJkd0drVGtrcFRhZTZadFBsdytqZ3B2Z0h2UEJhWG9teEpC?=
 =?utf-8?B?N2lMbDNlVVl3S2JFTWtpcXMvdVQ2d0FmR3lSVTlkVkZmeVpOWmJaTTVTNGRi?=
 =?utf-8?B?RFNKT09mYkNaM1ErVkNJRUdlTGVBTjI2c1BHSVVxNEYzUERoMVl5UGlVNnE2?=
 =?utf-8?B?WUhPT3Z0OGFhOHpKYnhEdkkvRUxWYUc5Y0k3MVRLVUJORTBibEkzamxIa3Nh?=
 =?utf-8?B?ZGx0eWZZNG1ub3dIV2RrTXNGbUFDbmNRMFNFSjA5RkI5Y3JRN2JuZ1JtcEto?=
 =?utf-8?B?TzlYRzRPOGc3RmRjZUhiMTJraTJWZG04U0l5Qm4rSnFqYlRiZDl6eWNiL3ha?=
 =?utf-8?B?Y2g4QTRTZ29pcTc5bk82aHZFbVZZQVkycUhVaC9SbnZaL2lmc1A2cWJxTjM2?=
 =?utf-8?B?aHFHeGp1NlJ5clZsalp6aEtuaGxIdXNGWWdJNk1aMnlUN1JhYjFuL2JlS015?=
 =?utf-8?B?aWMzS3dneTFKMW9ScTZnck5pQ0VhY0pIc3lxKzZEUUhPWURKeU5ZRXV4NnlD?=
 =?utf-8?B?MjJBRS9weXM5bUdLU2ZNVHBSd2tsRmNhamI1UUplT1liRUU2eUlmWVBsQjRL?=
 =?utf-8?B?NUtBTURTWWtrcisxMzJSb2FPVFBJRWRFalEvQW1sWnlkbkU5ajRuZk43UlA3?=
 =?utf-8?Q?RSI53q+XKnRNVFTLchWifh22sX3LFYMdiQ5ZC6Repg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96AB5FBFF70DAA4183BC9508CAF35AFB@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5123ff42-9966-43b7-47ac-08d9c460c1ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 09:03:29.9804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 R2kVtmkHLtoakR4z5adtbVdxwhWGQ0xsTia5reRkIaqDbInCjzwNiFq0HILnNQW/iQKN1ji631CHeWTiTNitvj/by0eugzdtWBGqwBh+/28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5174
X-Proofpoint-GUID: opxzrY8ZUtssVx0TLz3Cn-_6c9RhsEi5
X-Proofpoint-ORIG-GUID: opxzrY8ZUtssVx0TLz3Cn-_6c9RhsEi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_03,2021-12-21_01,2021-12-02_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 09:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159908

RHJvcGJlYXIgc2hhcmVzIGEgbG90IG9mIGNvZGUgd2l0aCBvdGhlciBTU0ggaW1wbGVtZW50YXRp
b25zLCBzbyB0aGlzIGlzDQphIHBvcnQgb2YgQ1ZFLTIwMTgtMjA2ODUgdG8gZHJvcGJlYXIuDQoN
ClJlZmVyZW5jZToNCmh0dHBzOi8vZ2l0aHViLmNvbS9ta2ovZHJvcGJlYXIvY29tbWl0LzhmOGEz
ZGZmNzA1ZmFkNzc0YTEwODY0YTJlM2RiY2ZhOTc3OWNlZmYNCg0KU2lnbmVkLW9mZi1ieTogRXJu
c3QgU2rDtnN0cmFuZCA8ZXJuc3Quc2pvc3RyYW5kQHZlcmlzdXJlLmNvbT4NCi0tLQ0KIG1ldGEv
cmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLmluYyAgICAgICB8ICA0ICsrKy0NCiAuLi5j
LVBvcnQtT3BlblNTSC1DVkUtMjAxOC0yMDY4NS1maXgtODAucGF0Y2ggfCAyMyArKysrKysrKysr
KysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3Bi
ZWFyLzAwMDEtc2NwLmMtUG9ydC1PcGVuU1NILUNWRS0yMDE4LTIwNjg1LWZpeC04MC5wYXRjaA0K
DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jIGIv
bWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJvcGJlYXIuaW5jDQppbmRleCBkNDFlOGIzNmRj
Li44M2JjZGJjMGExIDEwMDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZHJvcGJlYXIvZHJv
cGJlYXIuaW5jDQorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9kcm9wYmVhci9kcm9wYmVhci5pbmMN
CkBAIC0yMiw3ICsyMiw5IEBAIFNSQ19VUkkgPSAiaHR0cDovL21hdHQudWNjLmFzbi5hdS9kcm9w
YmVhci9yZWxlYXNlcy9kcm9wYmVhci0ke1BWfS50YXIuYnoyIFwNCiAgICAgICAgICAgIGZpbGU6
Ly9kcm9wYmVhci5zb2NrZXQgXA0KICAgICAgICAgICAgZmlsZTovL2Ryb3BiZWFyLmRlZmF1bHQg
XA0KICAgICAgICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdw
YW0nLCAnJHtQQU1fU1JDX1VSSX0nLCAnJywgZCl9IFwNCi0gICAgICAgICAgICR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2Rpc2FibGUtd2Vhay1jaXBoZXJzJywgJ2ZpbGU6
Ly9kcm9wYmVhci1kaXNhYmxlLXdlYWstY2lwaGVycy5wYXRjaCcsICcnLCBkKX0gIg0KKyAgICAg
ICAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZGlzYWJsZS13ZWFr
LWNpcGhlcnMnLCAnZmlsZTovL2Ryb3BiZWFyLWRpc2FibGUtd2Vhay1jaXBoZXJzLnBhdGNoJywg
JycsIGQpfSBcDQorICAgICAgICAgICBmaWxlOi8vMDAwMS1zY3AuYy1Qb3J0LU9wZW5TU0gtQ1ZF
LTIwMTgtMjA2ODUtZml4LTgwLnBhdGNoIFwNCisgICAgICAgICAgICINCiANCiBQQU1fU1JDX1VS
SSA9ICJmaWxlOi8vMDAwNS1kcm9wYmVhci1lbmFibGUtcGFtLnBhdGNoIFwNCiAgICAgICAgICAg
ICAgICBmaWxlOi8vMDAwNi1kcm9wYmVhci1jb25maWd1cmF0aW9uLWZpbGUucGF0Y2ggXA0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtc2NwLmMt
UG9ydC1PcGVuU1NILUNWRS0yMDE4LTIwNjg1LWZpeC04MC5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b3JlL2Ryb3BiZWFyL2Ryb3BiZWFyLzAwMDEtc2NwLmMtUG9ydC1PcGVuU1NILUNWRS0yMDE4LTIw
Njg1LWZpeC04MC5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAu
LjcyYWMzZTY2MzANCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Ryb3Bi
ZWFyL2Ryb3BiZWFyLzAwMDEtc2NwLmMtUG9ydC1PcGVuU1NILUNWRS0yMDE4LTIwNjg1LWZpeC04
MC5wYXRjaA0KQEAgLTAsMCArMSwyMyBAQA0KK0Zyb20gYzk2YzQ4ZDYyYWVmYzM3MmYyMTA1Mjkz
ZGRmOGNmZjJkMTE2ZGMzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCitGcm9tOiBIYWVsd2Vu
biBNb25uaWVyIDxjb250YWN0K2dpdGh1Yi5jb21AaGFja3RpdmlzLm1lPg0KK0RhdGU6IE1vbiwg
MjUgTWF5IDIwMjAgMTQ6NTQ6MjkgKzAyMDANCitTdWJqZWN0OiBbUEFUQ0hdIHNjcC5jOiBQb3J0
IE9wZW5TU0ggQ1ZFLTIwMTgtMjA2ODUgZml4ICgjODApDQorDQorLS0tDQorIHNjcC5jIHwgMyAr
Ky0NCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KKw0K
K2RpZmYgLS1naXQgYS9zY3AuYyBiL3NjcC5jDQoraW5kZXggNzQyYWUwMC4uN2I4ZTdkMiAxMDA2
NDQNCistLS0gYS9zY3AuYw0KKysrKyBiL3NjcC5jDQorQEAgLTkzNSw3ICs5MzUsOCBAQCBzaW5r
KGludCBhcmdjLCBjaGFyICoqYXJndikNCisgCQkJc2l6ZSA9IHNpemUgKiAxMCArICgqY3ArKyAt
ICcwJyk7DQorIAkJaWYgKCpjcCsrICE9ICcgJykNCisgCQkJU0NSRVdVUCgic2l6ZSBub3QgZGVs
aW1pdGVkIik7DQorLQkJaWYgKChzdHJjaHIoY3AsICcvJykgIT0gTlVMTCkgfHwgKHN0cmNtcChj
cCwgIi4uIikgPT0gMCkpIHsNCisrCQlpZiAoKmNwID09ICdcMCcgfHwgc3RyY2hyKGNwLCAnLycp
ICE9IE5VTEwgfHwNCisrCQkgICAgc3RyY21wKGNwLCAiLiIpID09IDAgfHwgc3RyY21wKGNwLCAi
Li4iKSA9PSAwKSB7DQorIAkJCXJ1bl9lcnIoImVycm9yOiB1bmV4cGVjdGVkIGZpbGVuYW1lOiAl
cyIsIGNwKTsNCisgCQkJZXhpdCgxKTsNCisgCQl9DQotLSANCjIuMzQuMA0KDQo=

