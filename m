Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D382C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:57:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.86677.1684151851242304994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 04:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mm87UikL;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684151852;
  x=1715687852;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hlK5n71nGktO2CyE6+rbFcWvWkW7BzE5UYi2TvJOCgs=;
  b=mm87UikL7bY9qM1ZW9c21ezV0GZefhrIPPWpZEKRln4JpD2FwA1fN8Jv
   iSYkr0fc+rIBEGfQvwcoSZodwAisXdQMt8v8rhjvKA5T00+N7FthMV8t0
   cTcPgA2ny90CveLRJ0hEGRY4JZXdCnd2vjFEeAy1u8JeJoBZQH1tsy+n/
   60qlcWDNuCLLIjoGudEQLI3MzFD3H8m0P0Dk0H66LOr+OslDBYF/cKnLr
   Gvk0cZzzN9/0UjZViPq4bTILSQ/5kXs+jIoV04XNk/6yBjadI4WkpZsvn
   7DbRm/BM2jyPoVCC6A7KxEDVX9bvPDvdmFC15dXJ+zVXBnNKEPBn3QQmw
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESI4iXrcgTpGxk3KtIsJuBu65fOBEJAX3NWdUoa88ExtcEKMJOeKqaVQZXjXXKGH4EZWC0ZjhM9/d+5zj68gvQmY0TfWmrntO6hZuNA0Ky2ZdpmlAWStiFGuzg8O3r8ceENw1z3LLEUSt9P1k70f86yc3kM/kE5Q3RvaYvi9RLI/K93t/pdQOqXcAPI61KNKXJd0pDX3HrRN86vg1fi4yJpbNgZtsAcuh8OR/FH8VWq45fijRyxqTQPSZBCS9i5dh/IKNDbHbipJ8K8kyz+BtiiK/AZfdifZ3xqqXNbHcQUPuEiURX94C5GgOrL5lZbImH8FMF331oD5CbcutwsBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlK5n71nGktO2CyE6+rbFcWvWkW7BzE5UYi2TvJOCgs=;
 b=F/If9k/aG40gQdRKIP55u+LV9z6c5AvHgs6kJn6O2noEZpC/e0j083EYDfg1jL/hPcL0ZrOkBvAMYbdFarxLk9brKUvY2DuAWQfR2gJaiGebFs3Go4vI7jwmoYMNC33OqX2qP6Heg9Vgh25AAwBIqJAjAF3IKTqFVg+zB5CU7vP3wNT6NMCeZvjUf9s769r970u1hkPN7rh2KQ2Zp2lr0vfzFmkGW3mEOnbF0xUVXqBkCMHWvw888PC83TkDfsSJm+bD7xepNk9lT0RaBK6xoAzcsYwnVF92H98zaSvoCfG593xNxu8IE3+WfMGajRxIBtr094R+oF9yIGwB40841g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlK5n71nGktO2CyE6+rbFcWvWkW7BzE5UYi2TvJOCgs=;
 b=qg5kYK15qNSXc92fQYQb/b+Mm71csrqmVKjutBVedRl6iVRpOnKz8nMqP5YzXPFeUXwutAF/YmDe+0iBY4lw/9KY94YzlZDF5ddoOuLRD6JsL3USs+ntWaW0GT5lbayxt9zeURGg4cvEiP4Ap+gkh+WEbYS/IA+ozTLNRfU6h8Q=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Topic: [OE-core][PATCH V2] oe-buildenv-internal: remove path from
 previous project
Thread-Index: AQHZhIAdSAT3T+Y49EKlg/gO7irQgK9WhDEQgARFEgCAAHLVIA==
Date: Mon, 15 May 2023 11:48:24 +0000
Message-ID: <DB5PR02MB102136ADA8C20F28E76BBF933EF789@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230512031550.1715288-1-Qi.Chen@windriver.com>
 <DB5PR02MB1021377099AD45EEFECFF51E6EF759@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <f1f419aa-4c1c-8301-e61b-dcfa2e732c11@windriver.com>
In-Reply-To: <f1f419aa-4c1c-8301-e61b-dcfa2e732c11@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8596:EE_
x-ms-office365-filtering-correlation-id: 4f94c1af-1e8e-46c5-2668-08db553a4a54
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MOkfmu2mc5B6dWvnMOHyi0gdbuiC6LNFxgf7fKQagkqD/JwEOkGGmNNN73VG/vffJP655HJSjKTrEbgsbAa2dBDVl7EaVvVXAkv4tlq5kgnxb1Yq1nlj9nW3GA0bXyjsUwXePtb60RavfE7tETXkcoPZMjY0n0EsJDyxMU1XVDCx0b+hr04DRKNsnf5wg3nrK4HpKN/42cdxBMuHqDXGzXl7ntWpGNRO6f9bJPE6Gog9vCWBOem4AZrb1MYTVSU97VzDSjM8kJZOkKIM9Ohc7oUvWH9Atz6Fq1p5HhX7FcfyAVZ5hJ3AgB6Cu48sf+s1MNxyskttPN7xHKpb82YpmyWBPz2Scdqj+P9W6gC3UqFVy3rEC14xqe04eQetbjEfKZi9vA1FdqD+XdCpfeOQm72Qw7BzdG3VHl9z2SPleVXQh9gvBb5Xjt5RwFlYK+cu1dGWWYiYZJgZqwKqQqNb0qSPX/Dm/x8I3MHu9ESQXCU4Q9X1+WincGhkT9/7cIV40ZOJczKjvKKy6n7C4AYvOt3JCEcrODfTrlHqB79Aiz9HBVJjaw1DvpTCG1XimZ1PuqIfidJ1S1rtsHBMyxvDWXUoCKpqCYAZdEE876pbD9NzStydeKLa/EF9XGm+Ubdr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(66946007)(66556008)(76116006)(83380400001)(66476007)(33656002)(38070700005)(38100700002)(86362001)(110136005)(122000001)(7696005)(9686003)(26005)(53546011)(186003)(478600001)(71200400001)(6506007)(2906002)(55016003)(66446008)(5660300002)(316002)(64756008)(52536014)(8676002)(41300700001)(44832011)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WExKcUlMUS9JZURtY0hLSlVNa3JpaDFHQ0JIdVRQekwzN1NiazRyb09rN2pp?=
 =?utf-8?B?ZUNSRmVPWC8yaitEUHI5WFhXS0FqUjIraW03ZE9IUzlmNzhDWnN0dktWZUQ0?=
 =?utf-8?B?YXY3ajc1b2dOSE9LWTArRVJ5aVQycUdsR1hhSnZTMlE1cTVkTUFWc3hTMjB3?=
 =?utf-8?B?MzVHejliNjhnSjdnVkI4WTF3K0JaOVJtanE4b0cvNWhuSGFxd1BJd0poa3BO?=
 =?utf-8?B?MWlMcW9QZGc0QUcyK2NyUlRGVU01YjB4MTZOM3g3UGszRDhCajJGMHpLdnZG?=
 =?utf-8?B?TmRsWFBLdVdHSm5rSGJZM2xQbURqamR4S2ZUalJKZ1JLYVh3Tm5vaThDSnpL?=
 =?utf-8?B?Mk5TTkxVNi9sd2NEcnZ6M2pPV2s3QnN1dHIwY0IycTFadEc1cUpab1RQSlNI?=
 =?utf-8?B?VXNjZ1BKVXFMRnpXbDhtdy9rRlgvRW1ZcUdURXZhVXBwUGYybkcrbCtpblQw?=
 =?utf-8?B?bWxWbEcreUd5QWdyNFJxRi91N0x2SUpVQlZybUJoRCt6djNyY1BjQ09xQ2pI?=
 =?utf-8?B?eldjbTJSem8yTk1IZFl5dnBrck9uR1VrdGkrQWZEajlaaWdodGhsQkxycGVR?=
 =?utf-8?B?ZFhlZSsyNFRKcGd3NnAxMFg5MG9EN2RuRThXRXRMeUlNNUpoUW80Ny9rUEwz?=
 =?utf-8?B?RUI0US8yaGdwVXdCdEtIOXhsTFl2SE5CRXlVRjcvaGNENjRKMnRuUVVDMzBn?=
 =?utf-8?B?aUM1ekpxUXJndEViQ2Y4UFB3Rm1scmYvcTh3SlIyVFdPMm5YV1FxRWdmR3JQ?=
 =?utf-8?B?Mk9BQVRlZzRHVVFxenZHMTJna3hrN01La09UdmNDdnNDWnRyem9GYlpNcTls?=
 =?utf-8?B?d2gzSzdMZTNSWkI0RVZETDgxN1l1ZUc5aGNTajY3SHlFdjRsU3lPSHlsQWZx?=
 =?utf-8?B?UkJNdTAwL0NQL0xGK1I1aVNKK1ZhMjRJUWFTSnRrVXJ2SzhyM1Nwc3FMZWFo?=
 =?utf-8?B?azhmMmxzY1Y5OTVvNDBpeXUrWG1pYldLRmlHMHcxTDZvS293UjlCUVJYKzlS?=
 =?utf-8?B?OGhkcXVKMEM5TVM5WCt5Qlk0MVlibllORHVSYWRGdjZJOHJkakFnNG81L05l?=
 =?utf-8?B?ZFdlUzdCSmg1dUJuY2piTWhYQ3VZQ09iWVFIdHIrVERaUHhhVU9EbVMwRjds?=
 =?utf-8?B?dHVyMXBQK2FYRDFWYms4L1JrVGxmSEhkenIwT0NCRFNtRHNQTjBvR0VhOTVu?=
 =?utf-8?B?d055b0pNd2M2V0RocGI2VUg2NnFYRDBhU2dHaW52YTVWTVB3U2N1eFpaNFN6?=
 =?utf-8?B?SEpER2JTOC9CbGx6ZWVIWjlZWXA0OW9MV1Z1QU5tVllXMEtVYzBXeWNid21X?=
 =?utf-8?B?MEJxdXlrSEpVRDkzZGNDWThtekRqVzUvZUpFRXZmaTRxUnZjeldUb20xRzJU?=
 =?utf-8?B?em9wbnFwV1IwajZhdWJuR3BISkxBZWlyVS90V0NiUXZDckoxOHVuMklDU3lD?=
 =?utf-8?B?MVVrZXBOUmc0WnVVSC9MSy9wdllUTjM5T0xEQmZEODBITytJOE5pVS92eEda?=
 =?utf-8?B?SUJhOG5IR2xVRm85dXZTZ0J2N0VJbjlKZFVqOEpQVyt5czFqM01jUEdDR1gz?=
 =?utf-8?B?bVprUlZ2cW9LaGJ1UGE0NERMbW1kMnd5ZlE0eER2MWZ3b3A4ZUJiSGYwak91?=
 =?utf-8?B?ZkJYRCtOekQ3Nm9ZWVVZSmRSblVUQ0NFNWdRdlE4Wmh5QVozak5NbldYNFFi?=
 =?utf-8?B?Zlh0WDlPS0g3UmFTeERCblVhSFMwa1NOWjhacWFTMlFvZVozUlI0dEpoYkN1?=
 =?utf-8?B?U2x2Z21peDFoZnJ3UHQwakhFaEhHUlc0ckNMYTBMNlMzaU44Zkd6dGV1eUVt?=
 =?utf-8?B?Sll5UkdHekYrL1hzc0duQjZaS2dseW5vSGc2ZFJnMkZtNlZmQ0thaWczcWx1?=
 =?utf-8?B?MmgzOVkySWljbnNpWm9nb3Z5d1lWQy9hbVVCL24vVHdWK2czeGZ5NEFMbzRh?=
 =?utf-8?B?aUpGMDZpdU0zYmtIU0wwZlNITVpIenNONUpiaWx2TnVqeDZkcGhkd1d4Z00z?=
 =?utf-8?B?bXVlTnNNN1lEVHRzR1R2Um1IM3NYKy9QdERKak9aOGZuQW4xUU8yeHFIZ1ZB?=
 =?utf-8?B?MVVRM000bG9OVmpCaVJsOFZ2K214N3BWRExkZ2J5S2E1eWs0UC8ybmkvVmNo?=
 =?utf-8?Q?45yA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f94c1af-1e8e-46c5-2668-08db553a4a54
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 11:48:24.5961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c1UAUUrUbZ5ff0zLsFqZJJdSyvlDXPQ0foSeQI6I+oaho/PgAg9oYLSWbqakZYrW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8596
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 11:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181246

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaGVuUWkgPFFpLkNoZW5Ad2lu
ZHJpdmVyLmNvbT4NCj4gU2VudDogZGVuIDE1IG1haiAyMDIzIDA2OjUzDQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRD
SCBWMl0gb2UtYnVpbGRlbnYtaW50ZXJuYWw6IHJlbW92ZSBwYXRoIGZyb20NCj4gcHJldmlvdXMg
cHJvamVjdA0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgY2FyZWZ1bCBy
ZXZpZXcuIEknbGwgc2VuZCBvdXQgVjMgYWNjb3JkaW5nIHRvIHlvdXINCj4gc3VnZ2VzdGlvbi4N
Cj4gDQo+IEp1c3Qgb25lIHRoaW5nLiBJIHRoaW5rIHdlIG5lZWQgdG8gZXhwb3J0IE9FX0FEREVE
X1BBVEhTIGZvciB0d28gcmVhc29uOg0KPiAxLiB1c2VycyBjYW4gY2xlYXJseSBzZWUgaXQgaW4g
dGhlIGBlbnYnIGNvbW1hbmQncyBvdXRwdXQuDQoNClN1cmUsIGJ1dCBpdCBzaG91bGQgcmVhbGx5
IGJlIHNlZW4gYXMgYW4gaW50ZXJuYWwgdmFyaWFibGUgZm9yIHRoaXMgDQpzY3JpcHQuIFRoZSBv
bmx5IHJlYXNvbiBpdCBoYXMgdG8gYmUgaW4gdGhlIGVudmlyb25tZW50IGlzIGZvciBpdCB0byAN
CmJlIGF2YWlsYWJsZSBmb3IgdGhlIG5leHQgcnVuIG9mIHRoaXMgc2NyaXB0LiBOb3RoaW5nIGVs
c2Ugc2hvdWxkIGNhcmUgDQphYm91dCBpdC4NCg0KPiAyLiBpZiB0aGUgcHJlZml4ZWQgUEFUSCBp
cyBjYXJyaWVkIGludG8gc29tZSBzdWJwcm9jZXNzIChlLmcuLCBhIHN1YnNoZWxsKSwNCj4gIMKg
wqDCoMKgwqDCoCBzbyBzaG91bGQgdGhpcyBPRV9BRERFRF9QQVRIUyB2YXJpYWJsZSB0aGF0IHBy
ZWZpeGVzIGl0Lg0KDQpUaGF0IGlzIG5vdCBob3cgdmFyaWFibGVzIGluIHNoZWxsIHdvcmtzLiBU
aGV5IGFyZSBleHBhbmRlZCBpbW1lZGlhdGVseSwgDQpzbyBQQVRIIHdpbGwgYmUgc2V0IHRvIHdo
YXRldmVyIHZhbHVlICRPRV9BRERFRF9QQVRIUyBleHBhbmRzIHRvIGFuZCB5b3UgDQp3aWxsIG5v
dCBzZWUgYW55IHJlZmVyZW5jZSB0byBpdCBhZnRlciBQQVRIIGhhcyBiZWVuIG1vZGlmaWVkLg0K
DQo+IA0KPiBSZWdhcmRzLA0KPiBRaQ0KDQovL1BldGVyDQoNCg==

