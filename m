Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F293CC48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 08:11:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web11.37085.1708330282737680870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 00:11:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MeNIOX3P;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708330283; x=1739866283;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=RZ1a5ZXj8TcC/qY9jZTg92UzgE2/db2MR4tfDMNFSqo=;
  b=MeNIOX3PuqijwN647uaBMRTrJ5GBhKNzvXBZTFIfBDERyEHBRujk4y32
   0MuAbkaq9rUOHgpWAaUKHGCQMDJqE7SFEp7PmnWx0+V1fMftMhzVaqN8E
   6fghC4MoJrnxLJC08xqCBD2l5xctqfQR80lGHYqKrBHJNP7wrEHvaVwmq
   LCuHu/WRywGSzqRAmFALRQ4D2XmrskCpmcLGQ2+cpG/8AiFCRcoh2DQvB
   L7qaV1zyMUf7L+bqTxzMVvFMB+hs030g6MCQrRvUd6NUasBT6Oox7jD03
   byiF/DxeVhXqbTkOfPCbg85zCpEU4Y2cgDD5grddCBR2/lssz5TMrwfIa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2270075"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2270075"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 00:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9030446"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Feb 2024 00:11:13 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:11:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:11:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 00:11:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 00:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUFKt1qeABQAP6wgjE7eGKndTEa2/vy4ct9LeZyV48bXtc1zO0CKhXRpoiIMfUhC3Fzw+dxdDrF1koUYzd7wrp6wmkfynPtjeAgo80LRqGR8qSQ8V8ioGs6DUlUnzCx+WCvaUl5K1JSnNvNvn7hOvlV9NIpi9o5SdZ1t3KVX6gyb9woVMsfZje2y5PGFolNIK1G9kTzRIER35wpE2gavZ23ql/nd3NdWpOzmCNBqaN1tdJTTFpQMh49jsVERKfi0Fuc/z7JZ8hd6V62GaQmN+hSMBlDbfttFQLUixUo8kAY40GVv8j92kCdd388+TKCQSNUjkOW2vWqkEXU+A1syTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ1a5ZXj8TcC/qY9jZTg92UzgE2/db2MR4tfDMNFSqo=;
 b=KOLtko1COuBfIh7OinywCb/c+8w9h90aW1AhA5BWUxuF62m2/gDbBn8DcJvvQfcYLSIH0PesB1AUuucmAXPexI/nTrRYSI52arLwmR3WbGVIIPDM8IxbCenlhiB2bFK2Wmb/L06lVCM1L7ViVslZ04cltujBB/BZBVmXgqskNoLaS+RkfBgU0Gw+papRsjWClJB6oHcyF+ab0sgu94kitfc+3lA2MYtIunuteNK8jKD2/zS+Bp7AqlPlHsft4q4b7qdqunKiYVvvSHSv5piYCAisB8iC4cAPOT88bosxdfHIXcPjRMKGsNtyQQeq1NxaZf/10iTwv7o4k+X8xHWb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) by
 SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 08:11:10 +0000
Received: from DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8]) by DM4PR11MB6430.namprd11.prod.outlook.com
 ([fe80::833:8a41:d2a2:ed8%4]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 08:11:10 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/9] minicom: upgrade 2.8 -> 2.9
Thread-Topic: [OE-core] [PATCH 2/9] minicom: upgrade 2.8 -> 2.9
Thread-Index: AQHaYZ5E3eqi31peEkS6k1YN6WnuE7ERUyaA
Date: Mon, 19 Feb 2024 08:11:10 +0000
Message-ID: <ad432017ab18b6716473771869036aaa3d34a026.camel@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
	 <20240216114034.109257-2-anuj.mittal@intel.com>
	 <778a5a81ba0d8a3a8fc725b69f96c5d2762a0bf9.camel@linuxfoundation.org>
In-Reply-To: <778a5a81ba0d8a3a8fc725b69f96c5d2762a0bf9.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6430:EE_|SA1PR11MB8427:EE_
x-ms-office365-filtering-correlation-id: 841e4e37-829b-4184-9c96-08dc31225500
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qcgNBpsEd4vfZGQo5n6F5srT0OUYUWO9K4/kCt0A9InGue1qVmEWy2naBfO+v08WOj0zFglHrdoGI9CB/XwHJd6BASKuvc4L39koufFFLDWrX+iNz9cTh6lXjewismbLKNsf2+3NIvRa9p9i0hi+RoWXDN6DbE9icpuMjDdorzNClmuNIhxvnDu+2fU8jzgOuiKZf0mVa32eROuihEdCNneQ8Dd00O71sbHFRiTEiqO1kZctJnnglNYsZox0K+l0lr1Rls8dRfAUlEqnhQ4wJLHkfSCs3chP3Y4FXl6+d0/Lv8kcEgWj0y2llaBzJY1JAqF2AdcCq4jfj5rf/O56A+Ods6k5cPkLDpTca/hpqcul71IwBEXY4yypP5crLOOmE530nJj09s8OVUxqshXLJHnG5IMD/xfcmfZi0Wa0Xmn6nc7wmipaN1cotCQ19zZK5rb7KtxSU7XoRaKn9G6Nj5Av4ZgZq5OD9GhNJpu4vRsntmuORdWJq9qiFH7pl2TKSU/N635BgTWrSCix9eVg3ZZNCjfDuSfCwryn/KXyFTREG+SopfVz6tGMmLWGcOqClvHGhkk8x0qTKFE1qYCqN7e6NizDPIlwvIVFBCsKFRY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(86362001)(2616005)(36756003)(38070700009)(110136005)(71200400001)(41300700001)(316002)(6512007)(6506007)(6486002)(5660300002)(2906002)(478600001)(66556008)(66946007)(76116006)(64756008)(66476007)(66446008)(8676002)(8936002)(966005)(122000001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhxa3FQbE9aVnpNbFFRM3djRHhNK21QN3UzSDNKbWorQTl0cnMraGpVLzYv?=
 =?utf-8?B?VTFmbGVnbmJJcndYaFQ0bWxJYkFnZ2hITlFpMnM5Zzl2ZDcxMjRobExndVkx?=
 =?utf-8?B?QkNWazl3TFBZdzRkTnpCd0lUa3N2a2NDY0lRcFh3M3UwOGdNa2d1YWQzUmVF?=
 =?utf-8?B?UzJnM3ZKRlFWLzRnZDJVejZiZmF6WkVnSFJDRkVWOFpYVDRhSHlzL3ZpUlZ6?=
 =?utf-8?B?MEVwbGJ5dVFZbUhua3hEaENjZDNaTWN0bmJyd244RlFlRC9QODFiZHQ0UmxM?=
 =?utf-8?B?cXkwVkltK1JXZG9JQmQ4QTAzaWdhekpGMVFLTEZ5MUZHYVZERzVWNEFJcENp?=
 =?utf-8?B?VjZnT0hwUjNKdTdUbklybFprUjEya204MUJISkNwZHlFU2Q3WnM4eS9vc1Rh?=
 =?utf-8?B?M2p2Uk1xb1U0RGlyRm41ZnVLcTNsOTVmcFl5aUlmKy8yQnYzMUc3UVVab3hm?=
 =?utf-8?B?MWVjcWNZWE82eThnVkw3dW5SUkRrOHBTdlRZYmRLdFZxUEx0cGUyOW5xV0VY?=
 =?utf-8?B?M3pGZmhJYS9mSStGTXhEZFkwWTVqUWg4MUZxNEpBSVpFT1JBVEVWZU9YUTdC?=
 =?utf-8?B?MTFRU2UrajV1TndoK2Y2VzZ2c0pZaFJzME1Ud1NxVWFWRmRCYXdETFZvcDZn?=
 =?utf-8?B?Z0g4SkQzVnZhOHo2UXEzdFREWGl1SE5IWVlDbTRjcFFtVnprSjMwMmNsYWF3?=
 =?utf-8?B?U3djVS9QWWpGbkE4a1FFNDN6eWFmRnIvRUlXTzVMVExqUERUK0tkek9ERFpX?=
 =?utf-8?B?R3JTaHhaWjg0ZHBrZVdIcDNFNFgxL2FrY01Ga3JvN3djSlY2NzlCdGk1Myty?=
 =?utf-8?B?bE1ISWFnZldZS3QyL2JtUmlyVlBzRHpQTFlKc3NDalBYaFd5TTZwczMwN0xL?=
 =?utf-8?B?Uzk2dU5XRmMwNC9ra0M2c3NTMjVDd1NNQ09jUUVvV25DYzRHY08zQmtuN1I5?=
 =?utf-8?B?YnYxOW9CMVovSHlXdEdmOW4rMVVGU042T2lrUk43VEhrRlJYZncrTDJhSWVE?=
 =?utf-8?B?YVp0Nzk2cXo1QXhxL1pjb09rTlE3SjYyK2tGYW9CaVFNUnErbXFSamtZY3B6?=
 =?utf-8?B?UUFXVnlGS081K05hUDhXMFV5NE1hSFJ3MytCdEFvUGpyZDdDSkNXT1hFQi9r?=
 =?utf-8?B?OXg1cytIaWFlV2lyRkU2eWtXTzA4b3A2eXE3RzZwSDJhNWFwMVIrYitVWm5l?=
 =?utf-8?B?eHF6eVJEMzAyL3V3MVZXTE5lZWorOGcxaUtPQWVpS3NDWlFBUmlFTzZweEJU?=
 =?utf-8?B?Tk5lWXN0VFJHR2Y2Zm5GNUx2MkNlcmhicFpiWm5rYTVyV3p4WTczOFNaOXEx?=
 =?utf-8?B?NGdXNmJ0bEttd1puVE5SSU1BL1hocGRGVjJINThaMWhuWUFkbzd0NEwwVnlS?=
 =?utf-8?B?MHFTS09NTms1K3hxRk0rRDJEVjdiWHF2b0tmVDlaN0FPaFVqeFVLZzhlOXRQ?=
 =?utf-8?B?THI1VUM3VmdoTDVZYzh3WnpnOVlXOW1qdTZraHhOSy9kV3ZpTHBrVnFFRTJM?=
 =?utf-8?B?TnhHTkxyWFNnRGt1T0h4TDg3cTBNc2RhQit4TWlKenptTFl2cUM1WjIwUjBi?=
 =?utf-8?B?RlNDNlNPcndYdUZORkJtOC9GTldEZ2pZTWg5NkVwdHNUem9CZXB5VVBheGdt?=
 =?utf-8?B?QzhabEJydHAvV3lyeHF1Nlo1OEp6TlRJSUZaT2xEeUpOV1F6OXU0TGgwNnQx?=
 =?utf-8?B?R3RBYUxGOXZnK1ZQa1JGQUIwYWdBRnRXTDBYTEZzaVo4U2RhU0x1Z3BXcTVB?=
 =?utf-8?B?R3dPNXB2ejQ0THRYQm9ocHc5S0FEeHdLNlYxbFZabEhyN3VXWWtHZ1RvSlZD?=
 =?utf-8?B?dmh3WTltcC81V3RuQkJmM202a0xyai9ISGNyWXNoazRyanFMZnNaYWhtS0sx?=
 =?utf-8?B?dm5Ed1pjbmJzaXVCd3RGaHV1enFWMFVNMi93NXRUaG1yU0Q1QkJhYnlQdXVu?=
 =?utf-8?B?N1hJanNYM292WTRhUnVZQlVFdGQvZnl6VWNtN1lwcUFGL2czVTI2VEI3eVFY?=
 =?utf-8?B?ZlFuaWpqaEdpdldOSnJncXRmRDV1akN2ZEtkTGxNM3NFVVYxR0RtanZtQnVy?=
 =?utf-8?B?L3hKVHM3RTF4U0xQRUoxbFVtbEZqa2tFenlnY2pGUjhOdmFsaWtJeUVMVVVt?=
 =?utf-8?B?V2RndHhGTHNaQzI5MjIzZGJUWWpxZ24vYWFVcVNYc0F5eDVtcmo0NEIzenhw?=
 =?utf-8?B?T01vb2x0SEZCaE5tV21OVVgyenJqd2VhNVhXQWVRQXlpbDlLa0dyUzBIblJw?=
 =?utf-8?B?S0JqeERMN1M3b3dodjZMSHdCbmpRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59DB2D22EB18804CBADD400F786861D4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841e4e37-829b-4184-9c96-08dc31225500
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 08:11:10.4285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dpk4WmzWnOkRpl7E3153M8NGI7gg9J/9FAB8ImLzhE0T0Zkft0W/39PTjsTiODU4hjF+EVRp8pW9Gzb2SVEr5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 08:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195865

T24gU2F0LCAyMDI0LTAyLTE3IGF0IDEyOjM4ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDI0LTAyLTE2IGF0IDE5OjQwICswODAwLCBBbnVqIE1pdHRhbCB3cm90ZToN
Cj4gPiBEcm9wIHBhdGNoZXMgdGhhdCBoYXZlIGJlZW4gbWVyZ2VkIHVwc3RyZWFtIGFuZCBhdmFp
bGFibGUgaW4gdGhpcw0KPiA+IHZlcnNpb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQW51
aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLml4LW1p
bmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5wYXRjaCB8IDMzIC0tLS0tLS0tLS0tLS0t
LQ0KPiA+IC0tLS0NCj4gPiDCoC4uLi9taW5pY29tL2FsbG93LnRvLmRpc2FibGUubG9ja2Rldi5w
YXRjaMKgwqDCoCB8IDMwIC0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tDQo+ID4gwqAuLi4ve21pbmlj
b21fMi44LmJiID0+IG1pbmljb21fMi45LmJifcKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrLS0NCj4g
PiDCoDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkNCj4g
PiDCoGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5p
Y29tLzAwMDEtZml4LQ0KPiA+IG1pbmljb20taC12LXJldHVybi12YWx1ZS1pcy1ub3QtMC5wYXRj
aA0KPiA+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy0NCj4gPiBleHRlbmRlZC9t
aW5pY29tL21pbmljb20vYWxsb3cudG8uZGlzYWJsZS5sb2NrZGV2LnBhdGNoDQo+ID4gwqByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20ve21pbmljb21fMi44LmJiID0+DQo+ID4g
bWluaWNvbV8yLjkuYmJ9ICg4MCUpDQo+IA0KPiBJIHRoaW5rIGRldnRvb2wgdGVzdGluZyBpcyB1
c2luZyBzb21ldGhpbmcgaGVyZSBpbiBvZS1zZWxmdGVzdDoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1
aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvNzkvYnVpbGRzLzY0MjIv
c3RlcHMvMTQvbG9ncy9zdGRpbw0KPiANCj4gYnV0IGhhdmVuJ3QgMTAwJSBjb25maXJtZWQgdGhh
dCB5ZXQgYXMgdGhlcmUgYXJlIG11bHRpcGxlIHBhdGNoZXMgaW4NCj4gbWFzdGVyLW5leHQuDQoN
ClRoZSB1cGdyYWRlIHJlbW92ZWQgIm1pbmljb20iIGRpcmVjdG9yeSB0aGF0IGhhZCB0aGUgcGF0
Y2hlcyBzbw0KdW50cmFja2VkIGZpbGVzIG91dHB1dCBmcm9tIGdpdCBzdGF0dXMgaW4gdGhlIHRl
c3QgY2hhbmdlZC4gSSB3aWxsIHNlbmQNCmEgcGF0Y2guDQoNClRoYW5rcywNCg0KQW51ag0K

