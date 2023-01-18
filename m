Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4702C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 05:19:11 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.8930.1674019141595592262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 21:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=m2WWfSmY;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674019141; x=1705555141;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xARWc5jzswqAnvaz+E/6+Kn33Tmqkzfer1huSH0OnLc=;
  b=m2WWfSmYUUea70JodN3oVsLOczpKiDcf3nhRj+RPSt0tgLMFd9F8/INx
   LzcHsrkU0xv5u3opPYAK3UFUkyv8oUewtfgxuSHv8S4seCAgx7xf9KCt2
   /rLS00bsrXYwjtTHv3HPO9wvmYXsq5Z2AejtT/tEstI3wxGQyDgxh5C5k
   6YMEzHjJ6KmR1E5ugYwZXdiAw7SQCHSfomxYz6qVrTKdZpEY3I0yqu4G5
   AHrXbIcougI9wU4fvGEPz1rFiK1ISmg8//lZAxw+0wjbRe3pibV842naV
   Zx+Ek9S4cO+GTeW9autIbavV1wc1mJ7btqUWBXxc8vPDl5+T2Fyvy5tJE
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352147114"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="352147114"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 21:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="748314403"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; 
   d="scan'208";a="748314403"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2023 21:19:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 21:19:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 21:19:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 21:19:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRo8b0k0VO1EWUI5vlv2TqIWUrlOKogYe1EPtf0CWn8f0XDMOM69ssotPyVZhB/l+93NrisjS+KsbTOyuemNLmkekrQHQJuvthA1EF2pCYVtxBP8UwmoDVNsOvRMSN1W3BoXHyXVzrPtL3AjvF70SiLxv9oxOZ9B2fr9me1GArf1xTiLS54gV/03bKBxaQ5nQSJPel25XDurR2rccyICfvQf7l8+OGiPNr5rMFZfV6lw9T4rgz9V4M7WF5o2oa3eMI+TyTaG3MLcrMxBX6jlgbsKoIh/G5UZ4QQgTI9lLa+qPY004pDVfJQ2cu/7Y/w22EKVsWSSEdfCwONNHINgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xARWc5jzswqAnvaz+E/6+Kn33Tmqkzfer1huSH0OnLc=;
 b=D6rei79ur+lX1WSOmdC9nnA3TcL3alPj3ZXeKCnbdZ9eMKteEF/+mM24l1bcjb7nw4tfbOGmQesTnURRdZ1ahPgKWfs3E+isjqYZGv9TMIJg4OC58/Wl0gwmI7MGeMlWpMBMIZWCEu/QrDQ6pI2uC7RjuS5BRh22sLqMwi15c3RscWMggKpKnQ0fToPQZ8kf8R+2eiuVUXRbg+AxxAsRDtLylMg+LAkpOtJjtjJzYBR4sAj57Y138Mm+yGjoBSYCAE/H6w/qCWKOsTud3ES2PuLdu6jp5NgIjW3+pSWbxus3ERVvqACT8AuisPcwUhLuVRFqTQFObq4y9+1md6J3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com (2603:10b6:3:a6::21)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 05:18:53 +0000
Received: from DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::4b28:81c2:96f8:acc9]) by DM5PR1101MB2361.namprd11.prod.outlook.com
 ([fe80::4b28:81c2:96f8:acc9%5]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 05:18:53 +0000
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: Takayasu Ito <ito@lineo.co.jp>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] 4.1.2 Releasenote : The CVE in bind has already been
 fixed in the 4.1 release.
Thread-Topic: [OE-core] 4.1.2 Releasenote : The CVE in bind has already been
 fixed in the 4.1 release.
Thread-Index: AQHZKvBtd4q3b5+HA06tzbCX7zNeO66joVrg
Date: Wed, 18 Jan 2023 05:18:53 +0000
Message-ID: <DM5PR1101MB23610DEB398A295D825C0053B9C79@DM5PR1101MB2361.namprd11.prod.outlook.com>
References: <db8fbce2-29e9-35a4-b544-ff5e02e078c9@lineo.co.jp>
In-Reply-To: <db8fbce2-29e9-35a4-b544-ff5e02e078c9@lineo.co.jp>
Accept-Language: en-SG, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR1101MB2361:EE_|CY8PR11MB7340:EE_
x-ms-office365-filtering-correlation-id: 67570853-474b-41de-54a5-08daf9137d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aw3TXvT63LzSF2jAfGZ3mnJOykUzCoPzgHvuaVfrTT13Y0njSVQKJHV6S3p0/CM1zUGAywuIrsR2nUtEQMS9n91vH/sw9SwHEGkuBZRb4LYNoD3R3aWsUwtGOCRaOs7yNmYXWqiHSq4JscTbt1cFRWUb7qvhMMsgrnh0DdMl5cjo3kyK835whvxqj1wXN82bIIVQR2zLAiqD5z7yRd/uC9mZ2FExnZaoVhtqgTPMik1gFVogh7hkh0yT4AaV884hhJLA6Zmff6pkTXyBdOlMSqEa1O4QH81A77gwOwcy1j5l27QseS+Js+JM7Z12mVFcdohvqg4dYNnqa0gHkNwOkwebtklLqhArHy1DQ9sFhfmXcvo6+P71CoPKzc6bEftxxG8JGRJPIBi36qCFMVyjCM9PoNq/Skrt5VYobcPDyVDajuccWbJ2kuof3+QcQNMheEhO7cCC+KduX7jQc1+k6Du9a/ZEKmNDXENfAEj29Q0uT14LbGIBoDmg17TRPVEsg2g8ZQbfZG20v/Tezqj0/yr6Tf45oeADBgQtGZpdZtg1B1Bz2kvklj6qub2Oso1cnCFSeVGCYxFf4CxWQT98I0j77T4rQN+NlOAoe7t8z2RtuqS9SmDKemMR7XcRFaAfPIFqoCHeb6eW4IDkRL0q4O9NnGBYxgSYX6VImQKUazpY2g1GyIAb+7a1PwqahpQrk2IogRd2XzeEYMq1LRwU5nrUv6MnhFjvz1icFBZHLGg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2361.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(53546011)(33656002)(83380400001)(86362001)(64756008)(9686003)(66946007)(41300700001)(186003)(8676002)(66476007)(66556008)(66446008)(76116006)(55016003)(71200400001)(316002)(110136005)(2906002)(7696005)(478600001)(966005)(122000001)(38070700005)(6506007)(38100700002)(5660300002)(8936002)(52536014)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkNlRGJRZ0l0K0RZQzlraU1TQzBWUEp2WFdFazdvUXBwaXkyM3VLdUo1U0Yw?=
 =?utf-8?B?Z3FFdmZDcmpNcXhNSUw1b2FhRmpiVDNLWlFZZ2NIZjlURTB6Ym1WV1JueWtt?=
 =?utf-8?B?YWE4Ynk2NGx1aUgrdlRnVFdwYS9rR0c3WmFmZERmOWdpaE9CbVNoQ0t1aW84?=
 =?utf-8?B?VmtwVlN0NFoyZllxZTV1VlpKNFZwcnZOSlBzRisxKzZBbXM4bHNXNThKK3Rh?=
 =?utf-8?B?aDZMaUVwSDBxNnlrcldFdzlha0RLTTNwR3JkNTlwZTFKTmFvY1BPcnNXeHpC?=
 =?utf-8?B?M2d6WXlENGlXUTV5MnRiWnNNM3J6ay9QL1dZNWdPTWpKVW5kZStvM0lrZm0w?=
 =?utf-8?B?eUhrU1VCbzZjOVA5bEx5ZE1qYkh5OHd4MU5FM3BlUXR0azEzUXUwRnRVeTNj?=
 =?utf-8?B?cXl2K2FSYW91c3NBVHpjbWU1ZDAwWGFDaGJ2VU5WU0dvbjVjelFrZ0hhK0pJ?=
 =?utf-8?B?KzRTa3k5N20wcWFmZ21xUU5EenZ3VHExdWF4TmEzSnRSa3NpblpSQnRTdEhr?=
 =?utf-8?B?R3lOR2krbDloc1JrK2lyVGZ4Q1lsbko0dFFxd2RQMWJ3UEVUMm5NeW5JaXkr?=
 =?utf-8?B?ZmViR2JseTExU3BlV21RZC9ZbVZHM3laMkVZRURVMHpnaE12VnNrWUg5VVpk?=
 =?utf-8?B?ZjVzc283TGVIR1VNc0RMNXJScnlaWEhaQjNsamFZZldJSlBZMUtVVWdoazYz?=
 =?utf-8?B?azBrTjJXazVyekZIODAvZ3NaQ0lrclNiOWFxK2NjNGJYSjNGVUJzMkpGWnZQ?=
 =?utf-8?B?QXlseVNXZ1dJb2h0ZEgyMkNCaEkyNHRrY2VGTHZOaE1XM2h2NVUwNit0ZlQ5?=
 =?utf-8?B?YmNzSUZNRmZxb1QvMDFsMzJqVlNmV25XTkphRGY5TVd0ZzJ1Z1BQak03ajN3?=
 =?utf-8?B?YTJwRTFMaHNHUCtFVnNvTDJlK0lEek10ZjZ3TGtOZGJ2dHZaZHJ5Unpja0V3?=
 =?utf-8?B?S3BtWllPS3lGcUVOM0FRdVI4Zy85VkNYR2NtaG04cDNwSDVjZU5mc0N2R21q?=
 =?utf-8?B?ZExUMWpPZUV1dXhlblROYm9FS1RrNTRyTS96eE90TmJ4Y0M1L3NMRUlNWmdC?=
 =?utf-8?B?NnhtQjFRcmJHN3dITzNoV09aWDdCVExtd2JUbW9EaDdXZjF2Vzd5bWpiajlR?=
 =?utf-8?B?aGYzUmtnWm9jQnY4V0ZrU1VMa1YwOFNJalczN2tDRUI4cnEvdjA1TlhHb21a?=
 =?utf-8?B?d2hoM3ZvcUtueDRmUUdudFJ5Y1JLTEdwM2FzNU4xTmtYcmtRUzU0NU9yamNF?=
 =?utf-8?B?TExkOTg5U2lRcXNmZHBpZnh1K0p4aGxkQ2cwY2xXOTFUQTBZNmJQZmk2V2lm?=
 =?utf-8?B?WXVCL2JVWElsYWZLWis0N1FHdTN3cXhXNmhLZGtnY0RvMHk5cUFlUk43Ylpo?=
 =?utf-8?B?T3FuL3V1TXhUUnYyUy9UeisxM0Q0ZytYZUlTMWpCQUZ1RzhSTHlLRkdkMHZq?=
 =?utf-8?B?N2ozRXpvYVBUMlhXSGtqdWtwTTljTTYvMWllSzZ3VmNlbEFSUllhZGUzU2xq?=
 =?utf-8?B?R2g3MlpMNDBXMHVBREpXZWkvamxna0RjMXIxK1BIdDlva0tTTklTMk9yQkts?=
 =?utf-8?B?WktLZTZJbTFwMnlBZjVLeUI0bFl0cXhrZkhWM1FVemsxRlJFYStQeUtLTnhz?=
 =?utf-8?B?SlF1WkliVUwzTy9hemMwYjdveXRiUER4aml3cHAwalVsUjFGYlZKWGJqNktp?=
 =?utf-8?B?T282UnMycVRoWE5SMmUyLzQxOUxrdGVYcW5oNXFRUU9pa1IrRUk0b0ZEL2JP?=
 =?utf-8?B?M3BvNVdXZXJlbGlvN1VaMk5FUHgzT0RDQUpYK0dURkd0RGFFbVM2QVUwakVx?=
 =?utf-8?B?SGF6VXZud2djMUhkRFJVc1JkNTl0TXVxYXhPd25aYm1MbDZvWGh1cXBSRjlv?=
 =?utf-8?B?WkZjWUJtWTA3ODdoa0dVTmJ4VGpFWGlKaUREWk1Qd1VKanN3Z3JsalJ1M3d4?=
 =?utf-8?B?Y2hsSGV5SnhnUlR1NVBBeGtyQnhWaHZJK3NuVlBlQ05GdHJRVVY3amdXZnZO?=
 =?utf-8?B?SjdUOEFUTHpmUEFZS1lnSkh3YldXZ0dabjlBOTB3VzI3Y1kzMEhMbGU1dE1h?=
 =?utf-8?B?RjRIcjBkZVFaRC9DY0tkRjVQY2ZvSEhaTEt3cXdVQ3NTUnJ1VEdjeCt6LzRx?=
 =?utf-8?B?NHBNUFFBOEJBcS9HenV1Wk5qR1NrUG1nSXRrSDB1Yjk3NzlMU1dyb0NNelJv?=
 =?utf-8?Q?iCZ0Lbl0qDPtnbqJUWq4q9A0wW8okIVtAo5tQOFuHm5H?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2361.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67570853-474b-41de-54a5-08daf9137d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 05:18:53.2692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vYvon3LX3QRG4hi8gErkmLRAPZkA9+rgjFw3VaiFk5lNo0N47LC2VQND/AY6fzIvtu5LeXx+O5mMStYUr2kwGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 05:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176073

VGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLCBJIG92ZXJsb29rZWQgdGhlIGNoYW5nZWxvZyB2ZXJz
aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFRh
a2F5YXN1IEl0bw0KPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgMTgsIDIwMjMgMTE6NTMgQU0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogW09FLWNvcmVdIDQuMS4yIFJlbGVhc2Vub3RlIDogVGhlIENWRSBpbiBiaW5kIGhhcyBhbHJl
YWR5IGJlZW4gZml4ZWQNCj4gaW4gdGhlIDQuMSByZWxlYXNlLg0KPiANCj4gSSB3YXMgY2hlY2tp
bmcgdGhlIGZvbGxvd2luZyBSRUxFQVNFTk9URSBjb250ZW50cywgYW5kIHRoZSBDVkUgZm9yIGJp
bmQsDQo+IHdoaWNoIGhhcyBhbHJlYWR5IGJlZW4gYWRkcmVzc2VkIGluIFlvY3RvIDQuMSwgd2Fz
IHNob3duIGFnYWluLg0KPiBodHRwOi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmcvcmVsZWFz
ZXMveW9jdG8veW9jdG8tDQo+IDQuMS4yL1JFTEVBU0VOT1RFUw0KPiANCj4gVGhlIGNvbW1pdCBm
b3IgdXBkYXRpbmcgYmluZCBpbiB0aGlzIHJlbGVhc2UgaXMNCj4gaHR0cHM6Ly9naXQueW9jdG9w
cm9qZWN0Lm9yZy9wb2t5L2NvbW1pdC9tZXRhL3JlY2lwZXMtDQo+IGNvbm5lY3Rpdml0eS9iaW5k
P2g9bGFuZ2RhbGUmaWQ9OTAyNDZlZDA0YmRmNzU2OGMxNjFlMmY1Njk4Zjk1NGUwYWM3OA0KPiAx
OTENCj4gDQo+IFRoZSBjaGFuZ2Vsb2cgaXMgZm9yIDkuMTguNyBhbmQgd2FzIGFscmVhZHkgZml4
ZWQgaW4gdGhlIDQuMSByZWxlYXNlLg0KPiANCj4gDQo+IC0tDQo+IFRha2F5YXN1IEl0bw0KPiBT
b2x1dGlvbiBEZXBhcnRtZW50LCBMaW5lbyBTb2x1dGlvbnMsIEluYy4NCj4gaHR0cHM6Ly93d3cu
bGluZW8uY28uanAvZW5nbGlzaC8NCj4gRW1haWw6IGl0b0BsaW5lby5jby5qcA0KPiBZb2N0byBQ
cm9qZWN0IEFtYmFzc2Fkb3INCg==

