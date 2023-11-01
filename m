Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A509EC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 02:48:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.48923.1698806901408504400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 19:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=NHFShOTf;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698806901; x=1730342901;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EhReZSUMUxbbHsIwWBR7SG9tpcGs/h2hkPZPfdb6c4k=;
  b=NHFShOTfsWJhYTNYB2ALNkkzHXPTwFTvMZjEo7OYKbIqV/54Eeg7lgdt
   2ddoEoB6U0ApNeXovah4fTCcYipX/iGOIOD6Z//HZnJczapIiJmb68mbj
   RPuamKrHqnleLTiVOJSoLR2E7vCEn08ly45q1VoOuHjqHGGVu/396Eh0/
   4BxUS5pj4YsLzjrv5sgEokUcVov6mOdYEGc1mAKag5jngBvC21JCUHbyy
   tJTNkI6WjKqanhCEyR+8a/rvGWG6x9fJ8sqOkZaYV46iJdp/IPfJyKDQ6
   K83v67BrJfXzg6TRRW59GjrQYv0aHBqQc/DfxLCP+0DNAwgeO/sWXuGz4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368626868"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="368626868"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760809365"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="760809365"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2023 19:48:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 19:48:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 19:48:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 19:48:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 19:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKY9fFozG7taE2TmcFZcEkP9jP0CZOO7PjsKLPSJkkFKteNC2Cyn1K7c46upzEMt7mRQ782Hm8Ql5aFjQKTQWBIcnI83BrzLVSJf/wkqy2MM/l/c2d4MXNOYdtIHpzPFT7A/74arhYPWtSvnA7y3MenCOpvASC1IuELgcTqPRze/X62W7ap//6uoyRCTOoENa8p8483ujmr7xLF2sHStwWqqBJSnD6POpZt0tqwf7rlIp3rkOde5aAmCz6nlmBzTLvY2CITzNthH94SJQmg7w7MVWBb+f8+BaEVkyj793Yk52uN+M1eZh3f4qWFY2O0/fVzgI19bkzX2tl+BDAsi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhReZSUMUxbbHsIwWBR7SG9tpcGs/h2hkPZPfdb6c4k=;
 b=emolNuysMp12tOQp7LSupYJ1DNPvpstevqug73A4LpSA1+n+ZXo3/UwNWwoIJAMpBtSZ2w51pByicgGoJzpqVEgXZorIp7Af8n789PCWBGdd+vQd18BtRDybhFjHUZifF1CKYuGMKzIl5Ic15KeD0L9qG4DWQ81kAv9Nia8XYOponIjA3tdAEzrbdApTAWoAbdjU7Wf45uinzYgweIgzuOKK6fvuJnwf5whiSpG/BRs6FmOo70PTfVtzCmdX8gRUp41onsEQV3uUU4PwcVi0ODHIjQAI6O5ptADGL2tSiwpuDOYKTFjaPR/n/1lA095DCW3n/us51/ftkF5flxJqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Wed, 1 Nov
 2023 02:48:15 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.6933.022; Wed, 1 Nov 2023
 02:48:15 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "ticotimo@gmail.com" <ticotimo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Thread-Topic: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Thread-Index: AQHaDAWDiVcKG+n4aU2dc+AGcm0t9bBkvaEAgAABzYCAAAQ5AA==
Date: Wed, 1 Nov 2023 02:48:15 +0000
Message-ID: <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com>
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
	 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
	 <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
In-Reply-To: <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6461:EE_
x-ms-office365-filtering-correlation-id: 19ef15e7-2a70-4c40-1675-08dbda84ff69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWH75Y8KdNs576vThWtn+q+QYhUY77MHsOFVvKeBst37VTDRXTheUkk7VGnPXhOUNcn6iOKLesijQea/PmjWeRPU54Om/qzJ8CAaRoEuK4mKQQ475jjal/aHoPH0F4Y2QQoMfV43rVmHBVxgmQ6oddWSZAPcz+STnFuV2m+Fh/GvgDiofCLK4VwN2APioGYFD03FyFDyBh9lia18jqG+9k70wn/Vl/M4/hzDrCNXs3Vpt1Jk03ll4MWf5PWRAkvBhErAw7OE+lZBFcUlqRDkTowFNfoEiT11asX9hWc5wBoJmQUQTTbiVphjUBB6Vki/Y1/dKJ8B4Vct1DWWhizVRpstufN1h7htsbUgRGUUn726yExz12YXwl1OaJoC/tArCLpLW/u0wN6OMgudWMHkDEHPHlI3Xm5sAD4PntedYpC6QyGKix/QCMp36h/JiM/Lrzeyws55CH3mCWoIwHyQ1ny1ISX5Bx6wlh1F9x6n2cWbJ+//CoVEsWh2tC9rkNd3SSQgFuHJ2TT7GBAdeKpC5tdWOgmZ+BQH8mSGdRFGnuU0cmeqplAJzsFdjmZT2R7/gYMaUA+5fLa1XM6zTOKRoxNN17LXDBWVIIWt/DjyaLnlguiwR8PT2TIEzstxdtjhR7vMb71z/plky2+BbCF/iA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(66899024)(41300700001)(4001150100001)(2906002)(8676002)(8936002)(4326008)(5660300002)(38070700009)(478600001)(36756003)(966005)(6486002)(6512007)(6506007)(38100700002)(122000001)(71200400001)(53546011)(66476007)(6916009)(66556008)(66446008)(64756008)(91956017)(26005)(82960400001)(66946007)(76116006)(83380400001)(316002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amRzV2Znd2lCMGhRd251cnVYUEMvb2J6bzAzN3JPeWlYakhrbDEyL2wxR29Z?=
 =?utf-8?B?Wm52QjBmM3ZTTy9jYTdZOWhNb2prK0U5ZDBKaVlFRTV4YTFjWUFSR1VESUt4?=
 =?utf-8?B?ME5WVkowTm5Pdlk0aFlyQ0JLWUNmNUVaZXg1dHlkSXFVcEJiSVZwR0hrdjhO?=
 =?utf-8?B?Z3E0VTNrYlVUdnFQcURycGdLZFJQYUxiSkV4OFVUR3ViaUhKd0dlN3A0TCsv?=
 =?utf-8?B?a0s5ZkJLZWpkSDJ3SUt6bk5mMDF3bWtMZncwNVFyVm0zVnRoZUFzbHgrVUpw?=
 =?utf-8?B?eXhVQk1aUUVKUEhYU3VDR3ozalZRc24yL0ZuN2dGeEs3QjNpaXJFYy9EREQz?=
 =?utf-8?B?MUhlZHBSeGdUMm0vSHZsT2UrU2Zvb2lhTVVidGpJdk5xSmFCUXBzcDJzY2Qv?=
 =?utf-8?B?TzQvUGxkOExvcnlPbnBJdG42RzFHK3R0aVNiazdTSjU4czV1OXRBOXF1ZURR?=
 =?utf-8?B?bkpSUnhvUGU4ZXZvWC9yeERFRUZacmI0QVRVMXpJV0V1Tzd3enNKOVV6Tkxx?=
 =?utf-8?B?NDQzVnRLQmpIOHp1VHBuZ3c5dW1sWnA5WmlucnRoeDZLbG1VVnVIVTF3WW9Q?=
 =?utf-8?B?K0dWOTVJaS8yRjlrbXdETGtjbzB0WFBWaE1VQWpyMmVtUkJBcC9oOFBmMERq?=
 =?utf-8?B?MWhZb0d5UVJQZFVheVoyaVVCZFJoWUZ5MytIVVgxL0tuaWtaNlVQVXlNaUFr?=
 =?utf-8?B?QWZCdGJVUTZCcVJ5SFducVhMcklCbm5pUzZRLzhpa2o2TGZYNFhMTW91SSs5?=
 =?utf-8?B?ZXh3RUdSdnlRSkIvbXpnN21yY0VRS3JGc21mQ0xpZkRXY1NSQm1aWFdQWWlO?=
 =?utf-8?B?N2g4M0RJZXMwVGlmZmt3MXEzcEtoSVdBRkpPOGFPNlJpWWRCTkRYN0w1RG5Z?=
 =?utf-8?B?NWFTNlVBS3c3NUVPRSt1cCtTRjdRNDhjSUwzTm9QSzNmVjRRWWI0OXV1Y1ow?=
 =?utf-8?B?ZU45YmMrWm56T1pjbEg5Y1JZMHZERVZEQUozZ1Q5bW1pSmNad0U0TGtDZG5h?=
 =?utf-8?B?WU1ZMkNEaEY1N0VrTDlGZ281dVBrL01ZVGlxRWJENmxGdnpBYnIrTFQvei8w?=
 =?utf-8?B?ci82TWFTVGdBVXpMOVp0ZDcvSWVRZmZvd0hCVUJrNGNIZWE0cWlkRVNkYWRT?=
 =?utf-8?B?Z29GL0VzeHRVRUZIQ2tRbmloZmRsdzFxZEk1Rm42bEIvaE5abVUyaytDS1BH?=
 =?utf-8?B?L0VJdXpiOG14elVwWWJ2cWgzbG5HQXYxUDQ5UlNtWlRVL01hM0VHLzl4eUND?=
 =?utf-8?B?REtYWmxhZ0FlVFFkeXplalNQNHJxdXhqZVZxK05rMjFuVlhMaVBKV01MMkx4?=
 =?utf-8?B?ajRQMlVEOEkzeXVsYUd3QWM3ZklZTzFCd1pzUHB3aTZnWjhrbzM3a1RmOHNK?=
 =?utf-8?B?NVFTYzlRcTUzcGdoWSsvT3R2Q3lwYzM1Qi9NeEdmUFRDZkpJSXRRZ2p1Z3FT?=
 =?utf-8?B?SElab1I5U2VaMmtJQ0ZsNnF4STgyRlRBNjVlSWtyRmYrRjUrK0FoRkd2WTV6?=
 =?utf-8?B?TU54UkFvUFRxWGxPUmlVcktzamtnaHZCSjdTWGlBS2ZtVjhjSENYVXB4Q1pD?=
 =?utf-8?B?ZG9qWmN3bGtWOGlSZzN6WGVocm8ySCtrVWg0eWpjVllFSlJDMUZ4SGRSMjBB?=
 =?utf-8?B?MlhsdjB3N015WnFRbDVLeW9BMUZzdHhqU3JuYzlObElmLzVrQUwwVXNoT045?=
 =?utf-8?B?cVJqUFg4RWZpZFBxY2RHN1ZabTQ5VGNNZkh3aUV0QlhqUG5PU3hxeWJiRTJt?=
 =?utf-8?B?TFYwV0tlVDBEMzNkSjVUOE5CQ2Nmb0YwbTZPY0NhbytFbE1RSVdoais2bGk5?=
 =?utf-8?B?RmYvWGo1RHZBbjk1SS9yUndWWVNVbnhUR2VBL3lNWW5CMU02K1ljTCtzSVAv?=
 =?utf-8?B?cmcxVFRhbnl1QmxOZGZQZm9hVThabnlKaFIrNG9ib3dHeFpMdzdSclZLeUcr?=
 =?utf-8?B?M01QdTlvT1ZBa2JBbm1BMnFmSlhCaStiajRWOG1PcUt0UngwLzlSa3ZPM2Nt?=
 =?utf-8?B?V3FvaVRwRWFPMkpMUWdmSHh3OG00MFdYKzYzN0p1bk5OSVU5MmJ0UmJXdVdO?=
 =?utf-8?B?U0dmUXViUTBhQjFra3R2allDbjJHTzkrbkd2bDg1OXRVcGUvR3BGUHNXRU9K?=
 =?utf-8?B?ZGFPRitsVThaaXVmY000YmpQRytCcThFWEtmMW5BRWRMK0grbWpKSkNMUkg2?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E74141C09DC09C40A706E40A679D4038@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ef15e7-2a70-4c40-1675-08dbda84ff69
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 02:48:15.8419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaRW1Uma+mS7aMb9305mPRQPBMQLp1Ei8FisR3VXUQHz8jhxEriGavaNotewTJzL5oQ2C7S3UbEnTGPESCOJag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 02:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189895

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE5OjMzIC0wNzAwLCBUaW0gT3JsaW5nIHdyb3RlOg0KPiAN
Cj4gDQo+IE9uIFR1ZSwgT2N0IDMxLCAyMDIzIGF0IDc6MjbigK9QTSBBbnVqIE1pdHRhbCA8YW51
ai5taXR0YWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjMtMTAtMzEgYXQg
MTQ6MjAgKzAwMDAsIFRyZXZvciBHYW1ibGluIHdyb3RlOg0KPiA+ID4gVGhhbmsgeW91IGZvciB5
b3VyIHN1Ym1pc3Npb24uIFBhdGNodGVzdCBpZGVudGlmaWVkIG9uZQ0KPiA+ID4gb3IgbW9yZSBp
c3N1ZXMgd2l0aCB0aGUgcGF0Y2guIFBsZWFzZSBzZWUgdGhlIGxvZyBiZWxvdyBmb3INCj4gPiA+
IG1vcmUgaW5mb3JtYXRpb246DQo+ID4gPiANCj4gPiA+IC0tLQ0KPiA+ID4gVGVzdGluZyBwYXRj
aCAvaG9tZS9wYXRjaHRlc3Qvc2hhcmUvbWJveGVzL3BhdGNodGVzdC1zaG9ydGVuLQ0KPiA+ID4g
dGVzdC0NCj4gPiA+IHJlc3VsdC1vdXRwdXRzLnBhdGNoDQo+ID4gPiANCj4gPiA+IEZBSUw6IHRl
c3QgQ1ZFIHByZXNlbmNlIGluIGNvbW1pdCBtZXNzYWdlOiBBIENWRSB0YWcgc2hvdWxkIGJlDQo+
ID4gPiBwcm92aWRlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2l0aCBmb3JtYXQ6ICJDVkU6IENW
RS1ZWVlZLVhYWFgiDQo+ID4gPiAodGVzdF9tYm94LlRlc3RNYm94LnRlc3RfY3ZlX3ByZXNlbmNl
X2luX2NvbW1pdF9tZXNzYWdlKQ0KPiA+IA0KPiA+IElzIHRoaXMgYSByZXF1aXJlbWVudCB0byBo
YXZlIHRoaXMgaW4gY29tbWl0IG1lc3NhZ2UgaW4gdGhpcw0KPiA+IGZvcm1hdD8gSQ0KPiA+IGRv
bid0IHRoaW5rIHRoaXMgd2FzIGJlaW5nIGZvbGxvd2VkIHVudGlsIG5vdy4gQSBsb3Qgb2YgcGF0
Y2hlcw0KPiA+IHNlZW0gdG8NCj4gPiBiZSBmYWlsaW5nIHRoaXMgdGVzdCBhcyBhIHJlc3VsdC4N
Cj4gPiANCj4gDQo+IA0KPiBUaGlzIHdhcyByZXF1aXJlZCB3aGVuIHBhdGNodGVzdCB3YXMgcnVu
bmluZyBwcmV2aW91c2x5LiBJdCBoYXMgYmVlbg0KPiBpZ25vcmVkIGZvciBhIHdoaWxlIG5vdywg
YnV0IHRoYXQgZG9lcyBub3QgbWVhbiB3ZSBzaG91bGQgbm90IGVuZm9yY2UNCj4gaXQuIEl0IHNo
b3VsZCBiZSBkb2N1bWVudGVkIGFzIHJlcXVpcmVkLg0KPiANCj4gVGhlIHRhZ3MgYWxsb3cgZm9y
IG1hY2hpbmVzIHRvIHBhcnNlIHRoZSByZWxldmFudCBpbmZvLiBBbnl0aGluZyBlbHNlDQo+IGlz
IHB1cmVseSByYW5kb20gYW5kIGNoYW9zLg0KDQpUaGUgdGFnIGlzIGFscmVhZHkgcmVxdWlyZWQg
dG8gYmUgcHJlc2VudCBpbiB0aGUgQ1ZFIHBhdGNoIGl0c2VsZiB3aGljaA0KaXMvY2FuIGJlIHBh
cnNlZCBieSBzY3JpcHRzIHdoaWNoIGFjdHVhbGx5IEkgdGhpbmsgaXMgYSBiZXR0ZXIgd2F5IG9m
DQpkZXRlY3Rpbmcgd2hldGhlciBhIENWRSBpcyBwYXRjaGVkIHJhdGhlciB0aGFuIGxvb2tpbmcg
YXQgY29tbWl0DQptZXNzYWdlcy4NCg0KSWYgaGF2aW5nIGl0IGluIGEgc3BlY2lmaWMgZm9ybWF0
IGluIGNvbW1pdCBtZXNzYWdlIGFzIHdlbGwgaGVscHMsDQpzdXJlLiBJdCBzaG91bGRuJ3QgdGFr
ZSB0aW1lIHRvIGFkZCBpdCBidXQgd2Ugc2VlbSB0byBiZSBhZGRpbmcgdG9vDQptYW55IHJ1bGVz
IC4uLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiANCj4gPiANCj4gPiBUaGUgd2lraSBqdXN0IG1l
bnRpb25zIHRoYXQgQ1ZFIG51bWJlciBzaG91bGQgYmUgaW4gY29tbWl0IG1lc3NhZ2UuDQo+ID4g
DQo+ID4gVGhhbmtzLA0KPiA+IA0KPiA+IEFudWoNCj4gPiANCj4gPiA+IA0KPiA+ID4gUEFTUzog
cHJldGVzdCBweWxpbnQgKHRlc3RfcHl0aG9uX3B5bGludC5QeUxpbnQucHJldGVzdF9weWxpbnQp
DQo+ID4gPiBQQVNTOiB0ZXN0IFNpZ25lZC1vZmYtYnkgcHJlc2VuY2UNCj4gPiA+ICh0ZXN0X21i
b3guVGVzdE1ib3gudGVzdF9zaWduZWRfb2ZmX2J5X3ByZXNlbmNlKQ0KPiA+ID4gUEFTUzogdGVz
dCBhdXRob3IgdmFsaWQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2F1dGhvcl92YWxpZCkNCj4g
PiA+IFBBU1M6IHRlc3QgY29tbWl0IG1lc3NhZ2UgcHJlc2VuY2UNCj4gPiA+ICh0ZXN0X21ib3gu
VGVzdE1ib3gudGVzdF9jb21taXRfbWVzc2FnZV9wcmVzZW5jZSkNCj4gPiA+IFBBU1M6IHRlc3Qg
bWF4IGxpbmUgbGVuZ3RoDQo+ID4gPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9t
YXhfbGluZV9sZW5ndGgpDQo+ID4gPiBQQVNTOiB0ZXN0IG1ib3ggZm9ybWF0ICh0ZXN0X21ib3gu
VGVzdE1ib3gudGVzdF9tYm94X2Zvcm1hdCkNCj4gPiA+IFBBU1M6IHRlc3Qgbm9uLUFVSCB1cGdy
YWRlDQo+ID4gPiAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfbm9uX2F1aF91cGdyYWRlKQ0KPiA+
ID4gUEFTUzogdGVzdCBweWxpbnQgKHRlc3RfcHl0aG9uX3B5bGludC5QeUxpbnQudGVzdF9weWxp
bnQpDQo+ID4gPiBQQVNTOiB0ZXN0IHNob3J0bG9nIGZvcm1hdA0KPiA+ID4gKHRlc3RfbWJveC5U
ZXN0TWJveC50ZXN0X3Nob3J0bG9nX2Zvcm1hdCkNCj4gPiA+IFBBU1M6IHRlc3Qgc2hvcnRsb2cg
bGVuZ3RoDQo+ID4gPiAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfc2hvcnRsb2dfbGVuZ3RoKQ0K
PiA+ID4gDQo+ID4gPiBTS0lQOiBwcmV0ZXN0IGxpYyBmaWxlcyBjaGtzdW0gbW9kaWZpZWQgbm90
IG1lbnRpb25lZDogTm8NCj4gPiA+IG1vZGlmaWVkDQo+ID4gPiByZWNpcGVzLCBza2lwcGluZyBw
cmV0ZXN0DQo+ID4gPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEucHJldGVzdF9saWNfZmls
ZXNfY2hrc3VtX21vZGlmaWVkX25vdA0KPiA+ID4gX21lbg0KPiA+ID4gdGlvbmVkKQ0KPiA+ID4g
U0tJUDogcHJldGVzdCBzcmMgdXJpIGxlZnQgZmlsZXM6IE5vIG1vZGlmaWVkIHJlY2lwZXMsIHNr
aXBwaW5nDQo+ID4gPiBwcmV0ZXN0ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS5wcmV0ZXN0
X3NyY191cmlfbGVmdF9maWxlcykNCj4gPiA+IFNLSVA6IHRlc3QgQ1ZFIHRhZyBmb3JtYXQ6IE5v
IG5ldyBDVkUgcGF0Y2hlcyBpbnRyb2R1Y2VkDQo+ID4gPiAodGVzdF9wYXRjaC5UZXN0UGF0Y2gu
dGVzdF9jdmVfdGFnX2Zvcm1hdCkNCj4gPiA+IFNLSVA6IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVz
ZW5jZTogTm8gbmV3IENWRSBwYXRjaGVzIGludHJvZHVjZWQNCj4gPiA+ICh0ZXN0X3BhdGNoLlRl
c3RQYXRjaC50ZXN0X3NpZ25lZF9vZmZfYnlfcHJlc2VuY2UpDQo+ID4gPiBTS0lQOiB0ZXN0IFVw
c3RyZWFtLVN0YXR1cyBwcmVzZW5jZTogTm8gbmV3IENWRSBwYXRjaGVzDQo+ID4gPiBpbnRyb2R1
Y2VkDQo+ID4gPiAodGVzdF9wYXRjaC5UZXN0UGF0Y2gudGVzdF91cHN0cmVhbV9zdGF0dXNfcHJl
c2VuY2VfZm9ybWF0KQ0KPiA+ID4gU0tJUDogdGVzdCBidWd6aWxsYSBlbnRyeSBmb3JtYXQ6IE5v
IGJ1ZyBJRCBmb3VuZA0KPiA+ID4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2J1Z3ppbGxhX2Vu
dHJ5X2Zvcm1hdCkNCj4gPiA+IFNLSVA6IHRlc3QgbGljIGZpbGVzIGNoa3N1bSBtb2RpZmllZCBu
b3QgbWVudGlvbmVkOiBObyBtb2RpZmllZA0KPiA+ID4gcmVjaXBlcywgc2tpcHBpbmcgdGVzdA0K
PiA+ID4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRlc3RfbGljX2ZpbGVzX2Noa3N1bV9t
b2RpZmllZF9ub3RfbWUNCj4gPiA+IG50aW8NCj4gPiA+IG5lZCkNCj4gPiA+IFNLSVA6IHRlc3Qg
bGljIGZpbGVzIGNoa3N1bSBwcmVzZW5jZTogTm8gYWRkZWQgcmVjaXBlcywgc2tpcHBpbmcNCj4g
PiA+IHRlc3QNCj4gPiA+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X2xpY19maWxl
c19jaGtzdW1fcHJlc2VuY2UpDQo+ID4gPiBTS0lQOiB0ZXN0IGxpY2Vuc2UgcHJlc2VuY2U6IE5v
IGFkZGVkIHJlY2lwZXMsIHNraXBwaW5nIHRlc3QNCj4gPiA+ICh0ZXN0X21ldGFkYXRhLlRlc3RN
ZXRhZGF0YS50ZXN0X2xpY2Vuc2VfcHJlc2VuY2UpDQo+ID4gPiBTS0lQOiB0ZXN0IHNlcmllcyBt
ZXJnZSBvbiBoZWFkOiBNZXJnZSB0ZXN0IGlzIGRpc2FibGVkIGZvciBub3cNCj4gPiA+ICh0ZXN0
X21ib3guVGVzdE1ib3gudGVzdF9zZXJpZXNfbWVyZ2Vfb25faGVhZCkNCj4gPiA+IFNLSVA6IHRl
c3Qgc3JjIHVyaSBsZWZ0IGZpbGVzOiBObyBtb2RpZmllZCByZWNpcGVzLCBza2lwcGluZw0KPiA+
ID4gcHJldGVzdA0KPiA+ID4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRlc3Rfc3JjX3Vy
aV9sZWZ0X2ZpbGVzKQ0KPiA+ID4gU0tJUDogdGVzdCBzdW1tYXJ5IHByZXNlbmNlOiBObyBhZGRl
ZCByZWNpcGVzLCBza2lwcGluZyB0ZXN0DQo+ID4gPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRh
dGEudGVzdF9zdW1tYXJ5X3ByZXNlbmNlKQ0KPiA+ID4gU0tJUDogdGVzdCB0YXJnZXQgbWFpbGlu
ZyBsaXN0OiBTZXJpZXMgbWVyZ2VkLCBubyByZWFzb24gdG8gY2hlY2sNCj4gPiA+IG90aGVyIG1h
aWxpbmcgbGlzdHMgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X3RhcmdldF9tYWlsaW5nX2xpc3Qp
DQo+ID4gPiANCj4gPiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiBQbGVhc2UgYWRkcmVzcyB0aGUgaXNz
dWVzIGlkZW50aWZpZWQgYW5kDQo+ID4gPiBzdWJtaXQgYSBuZXcgcmV2aXNpb24gb2YgdGhlIHBh
dGNoLCBvciBhbHRlcm5hdGl2ZWx5LCByZXBseSB0bw0KPiA+ID4gdGhpcw0KPiA+ID4gZW1haWwg
d2l0aCBhbiBleHBsYW5hdGlvbiBvZiB3aHkgdGhlIHBhdGNoIHNob3VsZCBiZSBhY2NlcHRlZC4g
SWYNCj4gPiA+IHlvdQ0KPiA+ID4gYmVsaWV2ZSB0aGVzZSByZXN1bHRzIGFyZSBkdWUgdG8gYW4g
ZXJyb3IgaW4gcGF0Y2h0ZXN0LCBwbGVhc2UNCj4gPiA+IHN1Ym1pdA0KPiA+ID4gYQ0KPiA+ID4g
YnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy/CoCh1c2UgdGhlICdQYXRj
aHRlc3QnDQo+ID4gPiBjYXRlZ29yeQ0KPiA+ID4gdW5kZXIgJ1lvY3RvIFByb2plY3QgU3VicHJv
amVjdHMnKS4gRm9yIG1vcmUgaW5mb3JtYXRpb24gb24NCj4gPiA+IHNwZWNpZmljDQo+ID4gPiBm
YWlsdXJlcywgc2VlOiBodHRwczovL3dpa2kueW9jdG9wcm9qZWN0Lm9yZy93aWtpL1BhdGNodGVz
dC4NCj4gPiA+IFRoYW5rDQo+ID4gPiB5b3UhDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4g
DQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzE4OTg5Myk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZS8xODk4OTMNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDIyNzUwMDkvOTI0NzI5DQo+ID4gR3JvdXAgT3du
ZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBV
bnN1YnNjcmliZToNCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1Yg0KPiA+IFt0aWNvdGltb0BnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPiANCg0K

