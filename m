Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87116C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 18:48:01 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5185.1789411678125708334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 11:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rCbWZHZb;
 spf=pass (domain: siemens.com, ip: 40.107.130.37, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntvA962JntBJkeuMHVbZ5VatpYRYpOD1UYODClKsLXYxzdDa87DF2wwF9LXAerOY7paP5j+xH9aPq5do0X9DlgBuX8stlNmxA12ixPRuKdHHnrkAJTiPVkCTdxFP/03jjaTC7djpjYWWJGajYNab+1FT6/iZOw1LdJ74vvbKWwcFQ5j8VTwskw/gdEXRkHBDf0lLqH+Oh2RAPID7vlMTVmaK5G9oOnDZFlJ3dVlqhNh93pAIbbj/YoVhLcS66pcJ/AOrVihNFeivEq/mBc9cLG++SkvoiiMonDQ5XnMAAusIS9Zfkug2x0gh6qgykBeTphu4r2JAzJGhWIJlgl8PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8IV9XpVrpX14+ETnVaoW5X3bwr7VW5oC1jb6l0enn0=;
 b=GoIp8XYcRHmBIzKwHyYexYFFZQQcbLFy8HpYuK5i0NyNv5wYPn2FfTJ9oO85bgxmflxU/ZshAp0+ZlN4qnBIM/ZswtxW28xX+VtztwYHdezYRdQuSmVndJgZEovsABU5fIOHYzGGMrI7iQbgbMM0XTglhC+BidCnl1R5pyX7/hEZGVGVLzlan37LzEKQ2pu/ZGvG9NwYJ+kCUzULYLqIU1U0tcvNgg2Bwou1vuTHPal8XxjhtTFssVzVzGRGhiobuMcFOeUY13JX+9fU0ncBxoWJvKgbq1mx4Ya4mWloqsrBDUqLcSa1M3Pnzz5WWE0oC38OTboww6C3m4h4y8VmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8IV9XpVrpX14+ETnVaoW5X3bwr7VW5oC1jb6l0enn0=;
 b=rCbWZHZbSpODzuBq8Gl9sSpZXcNMUAd4PbGe4TXpE1XL/H1FxzKXLfqJ/Nu6aldQg/kUjBkzIh6SWtlrEDb4aNWqYUbrn7kkykJOC9TGf/9wBDrB/bwrpq3Y/ZuTYReYmfIKyYrAEUEiPyPdYVJu5dt9/R51JbnG2S8PYUoaPWjxyTtQ1IQ3jT/Ysp4cKy+GbEfn3emKZufwcqmaoD0KfYIFFTd+/c6nsBoxTPpN26Ry6eHACNWHU/NWEnS8+MTQPb1Mi3KrsdbPURWQkIo+iuw3I+VYgxmGac9vOyxHE3gCZ3YMKh7S9+xQtLIrZnEZpepKStUHybIBLEuSv4lvUw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AM7PR10MB3733.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 18:47:53 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 18:47:53 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>, "benjamin.robin@bootlin.com"
	<benjamin.robin@bootlin.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"olivier.benjamin@bootlin.com" <olivier.benjamin@bootlin.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Subject: RE: [OE-core] [PATCH] python3-sbom-cve-check: update to version 1.3.5
Thread-Topic: [OE-core] [PATCH] python3-sbom-cve-check: update to version
 1.3.5
Thread-Index: AQHdRGkFcSz9OWvbZkKuTsddRqXyarbOX+uAgAAHP0A=
Date: Mon, 14 Sep 2026 18:47:53 +0000
Message-ID: 
 <AS8PR10MB5073092F4DE38249EF095DCDFDBB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260914-sbom-cve-check-update-1-3-5-v1-1-5d2d69902368@bootlin.com>
 <DLF8PKQZWT9D.QFDCJVVGNT03@smile.fr>
In-Reply-To: <DLF8PKQZWT9D.QFDCJVVGNT03@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=37434904-8b99-496a-925c-00cfb0360e80;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-14T18:36:44Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AM7PR10MB3733:EE_
x-ms-office365-filtering-correlation-id: 6d6ca738-f3f3-4f18-a080-08df1290af55
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|6133799003|22082099003|55112099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 b6ciGHIIGklM4nxwlxhvY0TMWTgXBuCfDfQjX6LeCQEkJtjAp/jCNGz373ryacrDUXJucxtSaoYTQY1NTdWc10WPDe3lrTzuqsw3krvt61NZIUto1rFDz6EQGXxqP9FvkE2XP/NLZi6ORYSzX2EKYf88cPB9sqvNBLaI6EgktDNipQp40Y/24fhDdJbo3K3TrA+us/SJSiMppqRIx49eR8cGz267H7fL+fTtS6JOVAgSjxKCwytAhEK7ETIQu6JY5+ld6tB2mGgv3AJffCCjFNBWI9jtHxnyoThRy2iBjK64doDnJbrZG6lblHg4Y6FFc8D93oneePbzCs7OvPl7PH+v5PnYNsTQ5dHYnVMTAxPZQ+nBYKL+lECTja6vefOE7ZUXmpcjx+uzD/l/6VD6mX7lNPt4NhPfqSNUiZNVJNNpVhA33lDhoEeJ/bgn3OV9/Cgelu7PEVAAvQ7XTcRWKEfT37DrxHhKf+djhalu4oru3GabV7lPukiD/0qL/R6iVVuU8xP/Bl4q7yU07AWwVnRTAtVWCcuumZMvtlTolQB32x/M3RXVFjfSlhC7/8Ni5CiQKQLL6W1Czy6bfdJdzQuOgT+Ru7veCL1axxvA2vidfSyX6ooqpdrHjNAoVProDbQe7eai4XcGixT1QeS2W/QsHpLh0KOyjCyGgX87m2OQXDCbO6UqWGUf3e6Z63G1u+26rkwxJMNhTU3diNQkOPePUJB8J3zOKPaaRZXXlIs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(6133799003)(22082099003)(55112099003)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VG9ZNlN3UFZyVldjWlEzN3d5alBqNHd4TWZBZGorNlZHMEtEU0RVUVA0Z2Zi?=
 =?utf-8?B?T1ZwR0RaY2hldlJnVUVpV1RjRkR3NzY3TUU4TjJBS3ZwemI0eU1XTEhCUDhW?=
 =?utf-8?B?VzhrVDNHRnBFQ3lJUnhadHJkbitkdGh4c0pMLzZ5aHRxdFRoaklNN0pHZFI3?=
 =?utf-8?B?aVkzcFU2L2V6NzQyZUNGY2pxekNFSk5zbkhJQlI3Kzl0b1l3bDFKbXdrMGxN?=
 =?utf-8?B?M2xycURNdkFEcHdUYVMwai9IRENMYVRjSkhDdEhTNlRtM0UyWnY5dldnemtK?=
 =?utf-8?B?L3VtUDlrdDhvUlM4MmVJSnF2WU5wb2U0amxQcWkzV2QwYm92eUFkeFV4VVor?=
 =?utf-8?B?WnBMcUFSVHVrNUdnOXpaUHVqYVpQZVNrcmthbWNzcE1xS1NHeEtVMC9DK0Ri?=
 =?utf-8?B?ZnU5MmJUdVJzVkt5bWVrZkNDRFJ0OFBGVkI1Y1U4RG9BV2cwTUc0ZEdKME9C?=
 =?utf-8?B?WVRyMWhEMEN2U0xqNmFpUlR2U28vVTNEOU9uRDR1WjF0SUxVYzFTVkxGUHRS?=
 =?utf-8?B?dVhyZVdIT3hMM0U5UVdqQ0ZyYzA4RXFEK1V5ZjNuYWFGc29KMDUyamE0c2d5?=
 =?utf-8?B?N2pHQkhmWWh1OUdPNjRnNFFsTUtWTUNnbUVsbVBHL3Q4MU85UTZoRGM2bXhR?=
 =?utf-8?B?ZkFsTEdXR0hGcXFOcng2dmN3WGJIcmxhZThjSEo2ejJxWXRTdlVkR3haSlhJ?=
 =?utf-8?B?aGxUdnlaQmI1dEczeUMwNzYwMWNNN0QyeUpQVDNYSEpWcWJxbGVHejhROGJ2?=
 =?utf-8?B?NGxvbjd2Vlpxa2dhS0JDWmNIZVpvb1p0UE5rbTJwSmp1c0s5QWxTeTNwV0Zz?=
 =?utf-8?B?bC8zRnYyNkdaVG8vOU5ZcjlCZjkvZ2g4eWo1L0F1R28zWHp3dklKOXF1eHNw?=
 =?utf-8?B?UWJ4cDYybFFrQXY0RnlnakppMkgvdWxVamhaVEo4ZDVOcS9mQ3c0dFhvdFBP?=
 =?utf-8?B?T0E5UURTTWVqM0M3MFRCTllNZ1QyN0orWC9FVjQwWlhSZ0RkNTdBWTVyMzFw?=
 =?utf-8?B?b2NIOW5Ka0xBZ3RtQ3lWK0grZllCaHJnU2F4WWVjYnN3c20wZEhhZ3dycStt?=
 =?utf-8?B?R0JhZUx4bWlmYnlrUStCZTNkd1JNMFdGcDZpb2JzK1E4aU9yZURCK09HRG5r?=
 =?utf-8?B?V3ExMWd3MmNQL0Fpb2UwR1JaWGZVYytva2w1eWRxdE1OQnpUM3poZzYyS0Fl?=
 =?utf-8?B?cUxHWW9uYWVCc01ta1l6eVArQUFWaHRNem1TNFY1WmpUcGRxOG9XRW5mVGlr?=
 =?utf-8?B?dHdyWFJ0LzlscGdKeGcra3hoRk83UzZMYVNTVStiYzI5dU5uZzBIRm10QUlM?=
 =?utf-8?B?R25hT0RGaGNwNzNkMlh2bHdKblYxSVQzVDkzYXNEaEpLSS9DanlPdU1ZMVlM?=
 =?utf-8?B?Q0hvT1ZWNzBzb3NLcERiZ1ZWV3Q5YlFNcDdSYmh2OWtubVQ5WVVMNHZXSXVj?=
 =?utf-8?B?YVJwUkZ3VHkrVzk0WTNKWXBCVzUvNFVwV2E3aWQydEM5bCt4YmtqcGlkcVox?=
 =?utf-8?B?cWpFc00zUmU1QnpFc3JUdVFyeGZzUkx0c2ovTUVmNDVrZ3NIV0hnRk5uYUwx?=
 =?utf-8?B?ZEFpenFmSEhWZ2dQZW8zY1ZYYVZpNFRlMHRYRHk2U0xPSmdQcmx4WG5EMWFi?=
 =?utf-8?B?V3dRa1I3UGtLRUsxa3gzWkFhUWRMV0laanpDUTVud1VBL29PcGVpS3RlZjA2?=
 =?utf-8?B?clYvQXViZHdWak0xT0dsQVBIM0JtVjY4SjhUU0lrNTRsMmFCdnFZUVZHazZE?=
 =?utf-8?B?NWF2aHNMWUQrN2xhQng2Q0pPMEduVVIwZmowYS81OWg5dTFlWG42Y0l2cEhl?=
 =?utf-8?B?b0NQQ0pINjR3QTlTZjl6ZGdMYW5JZWtJb21iVW50TXhnaDFvNzZPcXpqTmV3?=
 =?utf-8?B?ejFLTnhIZWNOQnVRZzN2am55cUQvNnliN2FCcnJnbk91Ris2MHUvdU9LRXBX?=
 =?utf-8?B?T3hXeG1aSWJIVFhXeWNmekM2TG5yRzFKWXEvNTRJYUNub3pMcjRxb1lPakp4?=
 =?utf-8?B?UG42K0lnUjVWY29EU0FqaURENHZJT1V5MW1QMXUwbUd4cThYRGd5TEdGY3VS?=
 =?utf-8?B?c3Qweko4UHhKVG0waGtpdmlFSTJ4YUNZUUlCeDl6YWt4WXN6STFBWFdHVExU?=
 =?utf-8?B?b1dmZG1WS0txWjR3TzdzZ1I3R1d2Rm1vS2NnR0praENQanRFeUc0Y3FMQ0RY?=
 =?utf-8?B?alJpMnZzdFY4UjF1eW0ydXRWTG5aaFUyNEgrNDR6eWZDdUtKQk8vTUJ3R2R0?=
 =?utf-8?B?UUVxTkg2cWF6WjhTaTZINmthUDI2M21Ka1VyNHgxZy84UFBCY2I0bFh2OG9E?=
 =?utf-8?B?dnJVblJ6TjRwWFV1ZWx1ZUZiMXZUd3FQL1JqaTFrNlplMllwNWlWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6ca738-f3f3-4f18-a080-08df1290af55
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 18:47:53.5555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oj4E3v9fUN5n05hPkaKC/B7M031kKRnpWcgEu0F2FobW7fpypLPUoHx+hPdzwFvQ9AuoUJQ3489k5LSLWKQYqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 18:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245793

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE0LCAyMDI2
IDg6MTEgUE0NCj4gVG86IGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tOyBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiByb3NzLmJ1cnRvbkBhcm0uY29tOyBN
YXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkNCj4gPFBldGVyLk1hcmtvQHNpZW1lbnMuY29t
Pjsgb2xpdmllci5iZW5qYW1pbkBib290bGluLmNvbTsgbWF0aGlldS5kdWJvaXMtDQo+IGJyaWFu
ZEBib290bGluLmNvbTsgdGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSF0gcHl0aG9uMy1zYm9tLWN2ZS1jaGVjazogdXBkYXRlIHRvIHZl
cnNpb24gMS4zLjUNCj4gDQo+IE9uIE1vbiBTZXAgMTQsIDIwMjYgYXQgNjo0OSBQTSBDRVNULCBC
ZW5qYW1pbiBSb2JpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToNCj4gPiBG
b3IgZGV0YWlscyBvbiB0aGlzIG5ldyByZWxlYXNlLCBzZWU6DQo+ID4gaHR0cHM6Ly9naXRodWIu
Y29tL2Jvb3RsaW4vc2JvbS1jdmUtY2hlY2svcmVsZWFzZXMvdGFnL3YxLjMuNQ0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmVuamFtaW4gUm9iaW4gKFNjaG5laWRlciBFbGVjdHJpYykgPGJlbmph
bWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi57cHl0aG9uMy1zYm9tLWN2
ZS1jaGVja18xLjMuNC5iYiA9PiBweXRob24zLXNib20tY3ZlLWNoZWNrXzEuMy41LmJifSB8IDIN
Cj4gKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBIZWxsbywNCj4gDQo+IFNob3VsZCBJIHBsYW4gdG8gdXBncmFkZSB0byAxLjMuNSBv
biB3cnlub3NlIGFzIHdlbGw/DQoNClRoZXJlIGFyZSBhbHJlYWR5IDUgY29tbWl0cyAoaW5jbHVk
aW5nIGJ1bXAgdG8gMS4zLjQpIHNpbmNlIG15IGJhY2twb3J0IHNlcmllcyBpbiBtYXN0ZXIgYnJh
bmNoIGZvciBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc2JvbS1jdmUtY2hlY2svDQpJIGNhbiBzZW5k
IGFkZGl0aW9uYWwgc2VyaWVzIGxhdGVyIHRoaXMgd2VlayBhZnRlciB0aGUgMS4zLjUgdXBkYXRl
IG1lcmdlcyB0byBtYXN0ZXIgKG9yIHlvdSBjYW4ganVzdCBwaWNrIHRoZW0gb24geW91ciBvd24g
dG8gc2hvcnRlbiB0aGUgbG9vcCkuDQoNCkxvdCBvZiB3b3JrIHdpbGwgYmUgY2xlYW5pbmcgdXAg
YWxsIHRoZSBuZXcgZmFsc2UgcG9zaXRpdmVzIG9uY2UgMS4zLjMgaGl0cyB3cnlub3NlLi4uDQoN
ClBldGVyDQoNCj4gDQo+IEZvciByZWZlcmVuY2UsIHRoZSBjaGFuZ2Vsb2cgaXM6DQo+IHwgIyMg
djEuMy41DQo+IHwNCj4gfCAjIyMgQWRkZWQgb3IgQ2hhbmdlZA0KPiB8DQo+IHwgLSBSZWR1Y2Vk
IHBlYWsgbWVtb3J5IHVzYWdlIHdoaWxlIGJ1aWxkaW5nIGRhdGFiYXNlIGluZGV4ZXMuDQo+IHwg
LSBDYWNoZWQgY29tcGlsZWQtc291cmNlIHBhdGggdmFsaWRhdGlvbiByZXN1bHRzIHRvIGF2b2lk
IHJlcGVhdGVkIHZhbGlkYXRpb24NCj4gfCAgIGFuZCBkdXBsaWNhdGUgd2FybmluZ3MgYWJvdXQg
bWlzc2luZyBpbXBvcnRhbnQgZmlsZXMgaW4gTGludXgga2VybmVsIGJ1aWxkcy4NCj4gfCAtIEFk
ZGVkIHRoZSBgLS1yaWNoLWxvZ2dpbmdgIGNvbW1hbmQgbGluZSBvcHRpb24uDQo+IHwNCj4gfCAj
IyMgRml4ZWQNCj4gfA0KPiB8IC0gUHJldmVudGVkIHJlZHVuZGFudCBkYXRhYmFzZSB1cGRhdGVz
IHdoZW4gbXVsdGlwbGUgYHNib20tY3ZlLWNoZWNrYA0KPiB8ICAgcHJvY2Vzc2VzIGluaXRpYWxp
emUgdGhlIHNhbWUgZGF0YWJhc2UgY29uY3VycmVudGx5LiBEYXRhYmFzZSBpbml0aWFsaXphdGlv
bg0KPiB8ICAgYW5kIGluZGV4aW5nIGFyZSBub3cgc2VyaWFsaXplZCBhY3Jvc3MgcHJvY2Vzc2Vz
LCBhbGxvd2luZyB3YWl0aW5nIHByb2Nlc3Nlcw0KPiB8ICAgdG8gY29udGludWUgb25jZSBpbml0
aWFsaXphdGlvbiBpcyBjb21wbGV0ZSwgdGhlcmVieSBzdWJzdGFudGlhbGx5IGltcHJvdmluZw0K
PiB8ICAgdGhlIHBhcmFsbGVsIGV4ZWN1dGlvbiBvZiBtdWx0aXBsZSBgc2JvbS1jdmUtY2hlY2tg
IGluc3RhbmNlcyB3aGVuIGEgZGF0YWJhc2UNCj4gfCAgIHVwZGF0ZSBpcyBuZWVkZWQuDQo+IA0K
PiBSZWdhcmRzLA0KPiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUgRUNTDQoNCg==

