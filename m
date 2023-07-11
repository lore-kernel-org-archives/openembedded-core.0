Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B6AEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:31:18 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web10.1421.1689118272270542864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=g0kQ0j7J;
 spf=pass (domain: welotec.com, ip: 40.107.22.65, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idNzD/3AQM+Y9DfxrUUI0gFj3w7i3XwkX4ID6ajrREVhqXyhvSucaKFjiKIjNbXboKyU4AKIJ+W7y2SpgKMcRZ7f2OfSyRo+RealSMS5e2HfNoYArlmmKsw05YKLavec/9fWa77jJTIZWzNYzg/VmhdF2mdLZlKOHn33qS7Xb+EzCu2UyjWxtTa/OmFlYfXpM4QDbPnPUmekKv1BlJAbBsgJsm8L6wfcllYs2IQiUR6vNA/1MBEAYnhDYqkl0s34XzxI2DX7KPQENnH1Th/v2CDsAYkG2BIYfJNmccAChKje1DmMJCEAJjROp0J4ES37kYSiGIw0xioGOZtDHEqU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIH/grqts+Dah2GaX9hLZ77oIC9xHdrYv4UIpX68Ydk=;
 b=iTjHTMmIyjLkLjGPETEq8eJVf/r/vAHi3RBI7qgsto/KSGC21QClNUd0S3/OfXSN2FatvsIvcYzfKxLyuppVIj7D9YtN/9Oxc+sGKGZCEHPT/MwZ3vwgk9vLAxZbsKrQOvK60k5Ef1rwyUMa3g9iR6nGcPKqu+O/4FzMHVfHa8We+2ysZfKMVsECcSmrdw9lrxbXB+MEJLuHeyGSy6qfCUrweQY3DJ0osFnKiZaLTaV5Co9ooIEnMaCF1yq8aHrTGpAR+O6SZAMtMaA6DnkJPf4rTN0F44oBXmdh5cauTFqKhSZdcOXZDNd36wfz0YRz4cvH8uJO9/Gu1N8a0TLHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIH/grqts+Dah2GaX9hLZ77oIC9xHdrYv4UIpX68Ydk=;
 b=g0kQ0j7JKT6WpwY56RWUXEqgNPn8U8c79lsYo//sKV1Bgw065IMwkLhCe0vYXL1cYI4q13J9qitCC1jRIBSV6PX/C+U88FeF8c8EOP5srJT2l70OyOMbCCcgwav9v6qD3BmXwwJce9gKaTr4VBxpsztljYhHh1j6xmZRsOzcyjM=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Tue, 11 Jul
 2023 23:31:09 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 23:31:09 +0000
From: =?utf-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Topic: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr distro
 native features support
Thread-Index: AQHZsxUxLTW0Sb4E3Uu/U3gcvSoAYK+0yWeAgABvnY0=
Date: Tue, 11 Jul 2023 23:31:09 +0000
Message-ID: 
 <VI1PR04MB53735FA68C578149BC056C5E9131A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
 <CANNYZj8fmhzEn2tcHsYpwuMHUwEzXajGH9vYRfevsuh82+T0Gg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8fmhzEn2tcHsYpwuMHUwEzXajGH9vYRfevsuh82+T0Gg@mail.gmail.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|DU2PR04MB9132:EE_
x-ms-office365-filtering-correlation-id: 28362dad-eaa7-421c-4cab-08db8266e7cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /cl6cG42EZJG3khB9MziXA7uFXbWEZBs4odsKVeCOgDB/bfnwi5VcIBtt4ejwpgyuWc3HtvVICCYwEYdiP4FTWaYurx3r7a6X72mZnZLPmkXM2Ms9ruUlhbjATyaQf4lN/QBIoPkCVtbtWFWAesYuHpkZQi2Gim5LqwcM5h6jtmyLf3TRpEaZUUDh1USvHsOqCbDwbxb7jchKsNEYZ0txM8BAB8kXvuj2wPBeJpxW2BPUty1byFH1eTmbnr/im4B6dle5vzJvRRb8c5wHnGYwa6AcUKkJCflExb0SpOQnQgu+hmLHtZvkrqDgMbeshGqihnhZZ3ijvRGA5R/vC3Y9J6LOlVXzmYWK9yPWDaE6O2SGQ/mx7a0mX4KmN87/QoC97Xxochj1aG9iWDC7eIr+3vO/fkPhN6XKZndnvIYxakvc+TmYhPW9ZMfb5TMpaIXK87g/E2SI/YWQe8wnNTOxzNDkZet8nlAtoSRZQDZa547+Hm6Lj+Vf+uNRVZuxY1+aH40ulJs1QzTauG6058TS0F48A7I48/akv1FyV5Qm3VG6z+ZMKLysy+OYMEBfDxaH7aPRFHpYDq2CRTP+CmysjMBBMBASklXw835KcDb2bsyAHxTUhzz/YE+bLfuikHg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39830400003)(396003)(346002)(376002)(136003)(366004)(451199021)(19627405001)(38100700002)(38070700005)(86362001)(85182001)(55016003)(85202003)(7696005)(71200400001)(66946007)(76116006)(91956017)(33656002)(122000001)(6506007)(26005)(186003)(9686003)(5660300002)(52536014)(66476007)(2906002)(66556008)(6916009)(478600001)(66446008)(4326008)(8676002)(8936002)(64756008)(316002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NCt4MGxsVC96WWpYZlhvQm12aFRNQURtanNWRlFyam5qYjFJL2xjWTJqSEJK?=
 =?utf-8?B?RGhhaDh3d2pxUW1qRDA4cmJzV1k3UTVWNWh2ZC9EcTNmSHFuNG85bFVYbERQ?=
 =?utf-8?B?MWgxNkpDMWViZ0lmKzVobExTTGdnSlRPcThNWnI4Y1JhTXlqVFhlRm1ZZE9z?=
 =?utf-8?B?SVI2MElUY282WGtsUG5sS2NabUQ4WlJRMmZCbTFydWsrOXYreHpXRmJ3bW5Z?=
 =?utf-8?B?UkpMTXE3M3kzMlNHcmtFWEpDY0Y2elZUTlVRc3hTcWFxQ0tJZEFmVWpRTkcz?=
 =?utf-8?B?eVl2T1loNjNDU3BQVHh0cXNsVWw1K2Y0ZFhTd3l3d3RnVkdPc3IyemVuRktL?=
 =?utf-8?B?QU5mOTRLTXlKdDN3OXZ0bHdhbFhITnNMbVQrTDF0MFpGQXhUM2F6L2tkM2wv?=
 =?utf-8?B?WmdXYXpWRUtOTGw0WUI4QXZSOHN4aWliZUVHZDh4OS9ucFlqSW1LMlRYMGpv?=
 =?utf-8?B?VGZFcEFVYUViNCtacS9zT2VENUpzZld1SjVOY0ZkQkFKNGM0SkpkYU9CZmx3?=
 =?utf-8?B?Uk05U3B6bzQ5UUZhQUVjYUgyN1N1aFo3YTEzWGx4UW45T1ZHK1NlZWlYZk4x?=
 =?utf-8?B?Y2h5OWF4UG4vL0RYNzBQbXd3T2dCYmMyZEF4OEtCMWQ2dnVLeFczZEQ1bVVY?=
 =?utf-8?B?dDM2WCtFbXc4dDR4cmNVTnZlU25DTm9WVlAwQTdhZlNaN05LTHNEZ01jTlh0?=
 =?utf-8?B?dmVmL3NYRmRaTWVIbUs3bXBDWGJ3OWdQanluaERqZDRYRW9uRXZFUm9WaGJx?=
 =?utf-8?B?SlNvV0p5ZnpLWGtBamdCYlBycG94MXhZQWpJUWluVUhpMkVLOG1uQkdCQ2pJ?=
 =?utf-8?B?UG9TQmo4ci92YlN2blB6Y3FhTDU3K3AzbVUzYkFRZlBoSm1NcTlEZHRxVlFZ?=
 =?utf-8?B?WU0zWC94d1JPYzlWRmQxbm9ueU0vc2ZDUEtVakpoREdveHJ0T21scjVtR25v?=
 =?utf-8?B?b1d3SzFSOXVJZDdyeTM0bHBFQ28vNCtBNHRnT2p3emhDN2N5N1ZSRXc2RmUy?=
 =?utf-8?B?Z0pROXA3b2srVDZyT1dZWlFtMy90ZFQvM2dicUJmTmhQUDlLVnAvQ2xQbWxt?=
 =?utf-8?B?L1ZvVlVaajc1ZVZxRkJpQzhEZ0JjcFk1cUUzVWZBQk91YXpyUjVScGp1UHBw?=
 =?utf-8?B?UDhiYUxOQ1pNNHJqOGxxZ3pPV2ZtLzNVanUzNmJseVd6K21pM3VOeDVvbmd1?=
 =?utf-8?B?MzBKclpMK2JDN2lLQnN4ZUoyQy9OdHZIclVRbisxNVEyN1F2cmFtWk1USmdh?=
 =?utf-8?B?WG50STNxRnE5M3RqZUVGVTlMSHhYQ01selgyMW1XNS9HM2lBYkdvVitSdG1E?=
 =?utf-8?B?RzVodG9TNm1LaUc3QldnLzlvYnFHdWFjeS91N2FSa0dVbms1UkpnTkIrNERz?=
 =?utf-8?B?TE5ZNzFvRWtubStkaGV6S2trTlJMTHNLKzRsL3RDeUMvWUFmeHhNZzJ5RGFU?=
 =?utf-8?B?aEpCeFpNaDFxelZhNFpidEU4TTdmOCtiM2Vtbzg1ZlMzVUxZV0xjZjRycnJq?=
 =?utf-8?B?QnM2SXd5a3lRLzZMSHNPS1FuOU1wV3QxUDUwbk83N0VhRkFuZzR2V1pkU3Fu?=
 =?utf-8?B?RVQ5U2xtQ2hUN2pNUGZEaGcrS1ZuamxoeUtEYXB4cDJ0ZVdXc05HTmN5NENz?=
 =?utf-8?B?K2JKSnhyMGtsRW53ZW00VVN0dkNVR2dhS2ZYbUZlMlduMnBTTzJIbHNIcnZj?=
 =?utf-8?B?cCsvOXpOY3VtRUhWOXdaUXNWdTFrcXVXOEsyQ3AzQTJoVFR1SlFhaCtlTWh3?=
 =?utf-8?B?SStIQkRJS0hRUFFiSWNTNHUya2M0S2d1eHh0NUR5UzNlK0dVcUxnWDJsVCta?=
 =?utf-8?B?VzZjaVhodzZkZVRRZ3RycW5oT0llT1hjUnpyS2ozRWtNVzFKMTRnM0UrNU00?=
 =?utf-8?B?dDNCZlF4ZGpKK2JnOGlTeHEyVFZQWXZmeE9yU3Uvc1M3N3RTNFJNVTBVNU91?=
 =?utf-8?B?U0ZLTGRJMFIxcWtvdk5FSHZkVmZoaS9kR0hIWExWd1RZa0dBQ0c0RkhUclN4?=
 =?utf-8?B?OGFINzNZVU5xZXRJV1ljL0F0UkZmVVF1UDQ4RktreTZQR1MzK0ZFVTM5U2hq?=
 =?utf-8?B?cy8yNVpPN24zakJVa1RZWTcwUTR4UUsxZi9JbzZjYlZnWjYzaDA3bzFISEZj?=
 =?utf-8?Q?0Dn0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB53735FA68C578149BC056C5E9131AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28362dad-eaa7-421c-4cab-08db8266e7cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 23:31:09.0317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: almbBZ5QYDsQTbp38abScNgU90+8GLeXF6LJL0FA7wBHnOx2BieNKq0CjC+Gwo1gnj9AJd8LhljD9W5dW0tvWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184161

--_000_VI1PR04MB53735FA68C578149BC056C5E9131AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleCwNCkkgaGF2ZSBjaGFuZ2VkIHRoaXMgcGF0Y2ggYWNjb3JkaW5nbHkgdG8geW91ciBz
dWdnZXN0aW9ucyDwn5mCDQoNCkJSDQpQaW90cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCk9kOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCld5
c8WCYW5lOiB3dG9yZWssIDExIGxpcGNhIDIwMjMgMTg6NTANCkRvOiBQaW90ciDFgW9iYWN6IDxw
LmxvYmFjekB3ZWxvdGVjLmNvbT4NCkRXOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KVGVt
YXQ6IFJlOiBbT0UtQ29yZV1bUEFUQ0ggMS8zXSBiaXRiYWtlLmNvbmY6IGFkZCBhY2wgYW5kIHhh
dHRyIGRpc3RybyBuYXRpdmUgZmVhdHVyZXMgc3VwcG9ydA0KDQpPbiBNb24sIDEwIEp1bCAyMDIz
IGF0IDExOjU5LCBQaW90ciDFgW9iYWN6IDxwLmxvYmFjekB3ZWxvdGVjLmNvbT4gd3JvdGU6DQo+
ICAjIE5hdGl2ZSBkaXN0cm8gZmVhdHVyZXMgKHdpbGwgYWx3YXlzIGJlIHVzZWQgZm9yIC1uYXRp
dmUsIGV2ZW4gaWYgdGhleQ0KPiAgIyBhcmUgbm90IGVuYWJsZWQgZm9yIHRhcmdldCkNCj4gLURJ
U1RST19GRUFUVVJFU19OQVRJVkUgPz0gIngxMSBpcHY2IHhhdHRyIg0KPiArRElTVFJPX0ZFQVRV
UkVTX05BVElWRSA/PSAieDExIGlwdjYgJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVS
RVMnLCAnYWNsIHhhdHRyJywgZCl9Ig0KPiAgRElTVFJPX0ZFQVRVUkVTX05BVElWRVNESyA/PSAi
eDExIg0KPg0KPiAgIyBOb3JtYWxseSB0YXJnZXQgZGlzdHJvIGZlYXR1cmVzIHdpbGwgbm90IGJl
IGFwcGxpZWQgdG8gbmF0aXZlIGJ1aWxkczoNCg0KLi4uIGFuZCB0aGUgbmV4dCBsaW5lcyBhZnRl
ciB0aGF0IGFyZToNCiMgTmF0aXZlIGRpc3RybyBmZWF0dXJlcyBvbiB0aGlzIGxpc3Qgd2lsbCB1
c2UgdGhlIHRhcmdldCBmZWF0dXJlIHZhbHVlDQpESVNUUk9fRkVBVFVSRVNfRklMVEVSX05BVElW
RSA/PSAiYXBpLWRvY3VtZW50YXRpb24gZGVidWdpbmZvZCBvcGVuZ2wgd2F5bGFuZCINCg0KU28g
eW91IGNhbiBzaW1wbHkgYWRkIGFjbC94YXR0ciB0byBESVNUUk9fRkVBVFVSRVNfRklMVEVSX05B
VElWRQ0KaW5zdGVhZCwgd2hpY2ggaXMgcHVycG9zZS1tYWRlIGZvciB0aGUgdXNlIGNhc2UuDQoN
CkFsZXgNCg==

--_000_VI1PR04MB53735FA68C578149BC056C5E9131AVI1PR04MB5373eurp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KSGkgQWxleCw8L2Rp
dj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBz
YW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiPg0KSSBoYXZlIGNoYW5nZWQgdGhpcyBwYXRjaCBhY2NvcmRpbmdseSB0
byB5b3VyIHN1Z2dlc3Rpb25zIDxzcGFuIGlkPSLwn5mCIj7wn5mCPC9zcGFuPjxicj4NCjwvZGl2
Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSJl
bGVtZW50VG9Qcm9vZiI+DQo8YnI+DQo8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KQlI8L2Rpdj4NCjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNl
cmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVu
dFRvUHJvb2YiPg0KUGlvdHI8YnI+DQo8L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9k
aXY+DQo8aHIgc3R5bGU9ImRpc3BsYXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9
Ii0xIj4NCjxkaXYgaWQ9ImRpdlJwbHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxp
YnJpLCBzYW5zLXNlcmlmIiBzdHlsZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48
Yj5PZDo8L2I+IEFsZXhhbmRlciBLYW5hdmluICZsdDthbGV4LmthbmF2aW5AZ21haWwuY29tJmd0
Ozxicj4NCjxiPld5c8WCYW5lOjwvYj4gd3RvcmVrLCAxMSBsaXBjYSAyMDIzIDE4OjUwPGJyPg0K
PGI+RG86PC9iPiBQaW90ciDFgW9iYWN6ICZsdDtwLmxvYmFjekB3ZWxvdGVjLmNvbSZndDs8YnI+
DQo8Yj5EVzo8L2I+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgJmx0
O29wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcmZ3Q7PGJyPg0KPGI+VGVt
YXQ6PC9iPiBSZTogW09FLUNvcmVdW1BBVENIIDEvM10gYml0YmFrZS5jb25mOiBhZGQgYWNsIGFu
ZCB4YXR0ciBkaXN0cm8gbmF0aXZlIGZlYXR1cmVzIHN1cHBvcnQ8L2ZvbnQ+DQo8ZGl2PiZuYnNw
OzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9IjIi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0Ij5P
biBNb24sIDEwIEp1bCAyMDIzIGF0IDExOjU5LCBQaW90ciDFgW9iYWN6ICZsdDtwLmxvYmFjekB3
ZWxvdGVjLmNvbSZndDsgd3JvdGU6PGJyPg0KJmd0OyZuYnNwOyAjIE5hdGl2ZSBkaXN0cm8gZmVh
dHVyZXMgKHdpbGwgYWx3YXlzIGJlIHVzZWQgZm9yIC1uYXRpdmUsIGV2ZW4gaWYgdGhleTxicj4N
CiZndDsmbmJzcDsgIyBhcmUgbm90IGVuYWJsZWQgZm9yIHRhcmdldCk8YnI+DQomZ3Q7IC1ESVNU
Uk9fRkVBVFVSRVNfTkFUSVZFID89ICZxdW90O3gxMSBpcHY2IHhhdHRyJnF1b3Q7PGJyPg0KJmd0
OyArRElTVFJPX0ZFQVRVUkVTX05BVElWRSA/PSAmcXVvdDt4MTEgaXB2NiAke0BiYi51dGlscy5m
aWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdhY2wgeGF0dHInLCBkKX0mcXVvdDs8YnI+DQomZ3Q7
Jm5ic3A7IERJU1RST19GRUFUVVJFU19OQVRJVkVTREsgPz0gJnF1b3Q7eDExJnF1b3Q7PGJyPg0K
Jmd0Ozxicj4NCiZndDsmbmJzcDsgIyBOb3JtYWxseSB0YXJnZXQgZGlzdHJvIGZlYXR1cmVzIHdp
bGwgbm90IGJlIGFwcGxpZWQgdG8gbmF0aXZlIGJ1aWxkczo8YnI+DQo8YnI+DQouLi4gYW5kIHRo
ZSBuZXh0IGxpbmVzIGFmdGVyIHRoYXQgYXJlOjxicj4NCiMgTmF0aXZlIGRpc3RybyBmZWF0dXJl
cyBvbiB0aGlzIGxpc3Qgd2lsbCB1c2UgdGhlIHRhcmdldCBmZWF0dXJlIHZhbHVlPGJyPg0KRElT
VFJPX0ZFQVRVUkVTX0ZJTFRFUl9OQVRJVkUgPz0gJnF1b3Q7YXBpLWRvY3VtZW50YXRpb24gZGVi
dWdpbmZvZCBvcGVuZ2wgd2F5bGFuZCZxdW90Ozxicj4NCjxicj4NClNvIHlvdSBjYW4gc2ltcGx5
IGFkZCBhY2wveGF0dHIgdG8gRElTVFJPX0ZFQVRVUkVTX0ZJTFRFUl9OQVRJVkU8YnI+DQppbnN0
ZWFkLCB3aGljaCBpcyBwdXJwb3NlLW1hZGUgZm9yIHRoZSB1c2UgY2FzZS48YnI+DQo8YnI+DQpB
bGV4PGJyPg0KPC9kaXY+DQo8L3NwYW4+PC9mb250PjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_VI1PR04MB53735FA68C578149BC056C5E9131AVI1PR04MB5373eurp_--

