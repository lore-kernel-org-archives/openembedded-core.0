Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A18AC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 15:19:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.21172.1658935135918559268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 08:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=NZYOWh4Q;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658935136; x=1690471136;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hBjLoC+nb6gshXxjXnvFRWi24CMg51WteVPW5a1r04o=;
  b=NZYOWh4QE/X0DtDYQhF7FvQB4+LaLZIRgULDp0oZf3v/tzTbdd1TZHiP
   /Dg0w+57/LH/ZbzcfHU+1t2aPd83TPSQY8w9O0rJZkYZsZV6iq23Yz7Lt
   AfRHjdi8qk5ceODmPblaa9vIV7ImBULSApQoThDv/aaQRRmj9YC+c8JsE
   HYKAzlgNTdfgzKnne+7vHH6n5TlLefKiCe6ERDsCb3ltgHxzRv8gTDPxP
   2aOOgVGw+jTOPrCK+umA3Y4+M+ETE+c7WFtR6ywxJx7zhTI28yTXO00Sa
   c+C9SAXsasf8x2m2u/GofBhlxg78TNoFRPxgV+N9NqqWGZQekJntuu+q+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="289458670"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200";
   d="scan'208";a="289458670"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 08:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200";
   d="scan'208";a="846305848"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2022 08:18:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 08:18:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 08:18:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 27 Jul 2022 08:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFn7FbCdJk6E69mR0QdFW8loMyVl81wu1Cdx/I7nB/CqmQH2X53anp+fQJ/CjH3j3ZgzU6omi1PR16CaBTF/bb+h1EoBeAttoLu250CSDPeb797hJACEx0gqIzOgt0tYFh8TPKogIZ6lZ08kp9rxtf4Uhj1CMgoxO42xzoWa2nNwt+4HBxZ/MN1yAOBjm15BVgIvdtIH3BkX0c3UyQTmpoMn8ZDlY092oeN8f/zgBPvZ/vd9O7kep72u5gPh6N/G0s00yVGUG5nqWW50USdOCgbFTcHGdmCCjnWAHj8b1It62hhaOfxv/1A6H44z+qSDJhxeZx2t7csesfBvtsu6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBjLoC+nb6gshXxjXnvFRWi24CMg51WteVPW5a1r04o=;
 b=jm3ekFZ/O0IEaisGNZTEF7cmwqRlo2GrCE+IUkBLrnfGi3tZTl91ZoQ9hyg1HivFYeDJHCn0QjYVNJdx5zoTpZWTB/4uq2je2UDzeeJxJTX80bl0+KXbujCgA/Dcilt1/S2Ggc4i/nPhRqZ61/KUE9ALAa6ChIFfdsWjnfvkUeLrjucxS+Hvgs2NowBXAzSnT04jX/gMMphJdcwEvY3PR9SopntCFPRIBLfrEt6hLYUvuglyOXNNNNtq1bCV+es3N8u8eS9QpEvowuBKbgCA5bKA99YUdBFomPpqrQumvy6A9ho6wALnHnXthFnST3EtxPtobnrHQER65KI30ynkcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 27 Jul
 2022 15:18:31 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::70aa:d74c:1c6c:f8f9]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::70aa:d74c:1c6c:f8f9%6]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:18:31 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, "Ross.Burton@arm.com" <Ross.Burton@arm.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [yocto] [Openembedded-architecture] Let's drop x86-x32 (was Re:
 [OE-core] [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Topic: [yocto] [Openembedded-architecture] Let's drop x86-x32 (was Re:
 [OE-core] [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
Thread-Index: 
 AQHYnBW86wkPKGon4UCFSJjoKTaXKK2G/I6AgAABVACAAAY6gIAAAkYAgABf6ICACvO/54AABgwA
Date: Wed, 27 Jul 2022 15:18:31 +0000
Message-ID: <4391027448c6ecec1d61986e6a966d29fb4f5167.camel@intel.com>
References: <20220720084442.2940187-1-alex@linutronix.de>
	 <17037D268C38CE83.21682@lists.openembedded.org>
	 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
	 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
	 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
	 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
	 <CANNYZj_kuU9GQMYwQyPjvqv47PYq=o8LXNbHzAVWdOwN7DFeNQ@mail.gmail.com>
	 <7092d96e020932ff7c32a78b7862502bb0faddcc.camel@intel.com>
	 <1703942CAA78C370.2228@lists.yoctoproject.org>
	 <CANNYZj9w-bHhHYrbo2Nmf1rh2e=Q68Vo=mU8ykB_LYz4rEt4Mw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9w-bHhHYrbo2Nmf1rh2e=Q68Vo=mU8ykB_LYz4rEt4Mw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2824d13-4672-4a82-ebe8-08da6fe343f3
x-ms-traffictypediagnostic: BYAPR11MB3736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eFa+sjuQmbCJPNoKHpwRsBAesLVXWYGMTcITbJ1MFzxksweiyUkaSA3qrPj9aKaWCyx9ld5mHWAkPUDpYcu7EWXXMxp0CdMQirsYnU9zkhrCdSPkv3oOsJu588/b2kUrdcmhglrVy4v86G7xSZSc2xWEwxlAjmdQ//jpieK3ZpHTP51PA0GGVdTJR5uwOEVBFBU8ORWXChwY/ZC7xG5mDg5LJrS2HeaIwiY5gm3+SIkxl3wU/dddUKO3hQfdWg0OFOJ2+dkgRp+wI1muPY+VIgFIURnap+l8l+M3mgHNADKVECPcAiQZPcs9j6cRUE35KHB6K8eiDSQnUzA4sugL7SvgSDS+o3I0tDcYbztm35I7u4iapLagQ57QL8Jzrzjx3PmZkTNIHWdWEbrG6TnwkYEh0yv2EQZ/+RXGaWxWUAbrURg9RE8DatE15lL2E60G/PDcZLcwMBjqw0RU3nfZ80sAeBU7CDIJO1PhmxOLNu0qLkqWsi+ULdFRQvqKS5gSALTfmI8nRXvUM/Q+RuDw9V7ZijqEDOTmVxW+dVW6LMQNiaGTkh8up0GkujBbjvOdvqBQuKw3T26VCEFVq7WB6Ryi1aY4rly5TIM0wIU/mpcFIrl3UF2b65zIl2r0czxmbz8fG3XIH+TZufk+7NiDcuV30L8xl+jm74VL5tsKQ6T13l3KMHh2PMLUEWgP7zS8A3EDW+BdWpiEWqTrixZ8S6PdmutySPDw08c8t49T0ozMeC+j16A6q70WlxDYQqkSDFirPt1Ba6FhxV/RxJVhfcP94TWP/Kktd0u/XmU5xC/+nunaTty6+1l7w+IFY/Y29ncsOn2mqTx5WMdQ9gDiBA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(122000001)(966005)(86362001)(38070700005)(36756003)(91956017)(38100700002)(82960400001)(8936002)(5660300002)(4744005)(478600001)(6486002)(316002)(64756008)(54906003)(4326008)(66476007)(66556008)(76116006)(83380400001)(66946007)(186003)(2616005)(6916009)(41300700001)(2906002)(26005)(15650500001)(6506007)(6512007)(71200400001)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MXIxdUFVQ3E1djdNSitYQ2YraHI3Smd1ZytISEtCM2ZDeklNTGRTdk9SZjVi?=
 =?utf-8?B?T241dTBrMW5hTlVNU0lWekVjNmR0QVEyUDR3YWRXWkRCNW1YcExZNHpqZFp5?=
 =?utf-8?B?WEtheHh2bGpaZG9WeldOeWc2c05qQytlN1NBVE1MZGZucUh6RkltdlVpWWp6?=
 =?utf-8?B?cFpOeUlXVjlVWEV5MkFiU2x0T0E3SUtvSXlib0dTNmtVcTdMbWpuZ0RYc1Vq?=
 =?utf-8?B?M1o5YU1hR0lGdnVhY1pDMEM2WUVlRTczc1JSdGFZWWVPbnl6NTVUVm8rVE94?=
 =?utf-8?B?QzlFVFhoZlJhK0RwcDJSL1JwRU1hN2hvUE5ub2JwUEtQcG92TkJpWXRQYzgy?=
 =?utf-8?B?TGppbHU0eTJzdFJLeTZKQmZ1TkNwMGF3OEkxaFRDdUFJYy82bk52UlA4OS9I?=
 =?utf-8?B?UkVlUVFFN29SUFl5akRRNUhHT0tKMzhtMFU5YnNQdndRMmVuQ09HOExpZkFx?=
 =?utf-8?B?T1Q0eGJGWU9iQzcwWDBkeGMrVlIxZ3hpYlpvTm5ObDI2cjFwSDVUWnRVN2tl?=
 =?utf-8?B?T2h2ckNSZnpndVdMZGErVHQwVHVvU2tOVkVienZvSEs5eFFDL0hqRjhXaW9V?=
 =?utf-8?B?SlkzcXlxRjZDdnRIZmlUMUFLcXU4dk9va0ZTZnAyem1zeFhWM3B6UWdxV1FG?=
 =?utf-8?B?WFl2MXdNM1YzZk9sZXNDRmdUbzlDM0ZtdCt2MEp6UVczN2ZZdlR6WHVVUDBE?=
 =?utf-8?B?MDlEYml3Z2Y0K2RwanBER09XS0lVMW9Lb0VSeFhzWk9KeElpT1U5UTE3SVhL?=
 =?utf-8?B?Ym1WRENTRm8zTWhtNHhtTnlOS1E4SVRpR0RNYzhBSGR4cWFDd3A2N2Q0NmJC?=
 =?utf-8?B?UmxUL0wxWjRjdVYxMFlWOXlGU2c4c0FzYi9BdWJ6Y0hrNG8rTWRVMHRwNElI?=
 =?utf-8?B?UTJZZ20rdG5wTVBOeUQ2VklvandCaHFqSmFldVhFUzZ3c0ZaSURFQTN4eFBX?=
 =?utf-8?B?RUhTdGQzalh2L1ZHY2UyUDhTMHRSQTY1NzZOQklHSDAxVmxLWmNKYVhlUU5o?=
 =?utf-8?B?S21ka29aRjlyM1NOT1UyOUlxZ0RtUVI2NXFJQk0vajFOMmZFZHFjcDBpQ3dI?=
 =?utf-8?B?a1lQVDFtdm14RDk2TkVYUWQ2SXc0LzRrUHBYWVpuaFViVnhWOTkvRWFvYUNS?=
 =?utf-8?B?bm9VUVU0OHhBc0hteWk5NU1tWlpwem1CZk0vdlcxRmhZcFFaRWRvSi8rSlRv?=
 =?utf-8?B?UjJIQ283bHY2TmF2ZnJkR0gxbm9NQ3RYU1g5bHdEMlVudWNQNDYzQjg4WnNx?=
 =?utf-8?B?MnZlQjZTY0EvcWpjbUs2dFhnbTlzQlkvSnloWVR3WUswYzRvczY1RGI1cm51?=
 =?utf-8?B?a295bWZLMmlJTG02dEF5cDQzR1ZNay9qNGZTbjF6dnRBUURIenNVRmd4YVZv?=
 =?utf-8?B?WndERHptRFFDLzZMRk9YYVZneCtWVXphUGh3aWsxVStHaFdsdjFJdDBMWGxn?=
 =?utf-8?B?blp3ZERXLzZNbUVPajlrYWpaTE1kbllhUnhaSUttd20xbEx5MWFhNkRmRzFL?=
 =?utf-8?B?L2VzR3JrSjlBZ2NsYkw3TXZlUERpa0lVNnNjYjJGaDEwSzFLc2x4ZWtzeWxM?=
 =?utf-8?B?emN5M21zZDZDVzEwMGRzalAycjIwZ2hnUDRGYjJwV0E2TlJ6QVI4VkFaZjlJ?=
 =?utf-8?B?M2tMRjNmYVZuOU9vekVFamE3SjZSTk1XNzhPTkljbDMxS0swTCs0OU9FQ1Jp?=
 =?utf-8?B?N0lLRnpQd090VTJHcWdTeEJnQ2VXbWU0THJLdlFVNFZ5RVk4UkNUUjFUMTlU?=
 =?utf-8?B?MGswUHNWdWVOUWE5THB5ZEdUeUFrdHlVNk9tWmFWYS9SWlVZK0Qrb3BVNDRP?=
 =?utf-8?B?MEdCb3FtSnFmT0hlUFpteTVpYzVpSkZNY1I1aTVDQlZNYllBMk1jeXpUVzli?=
 =?utf-8?B?dHdFTU9qWHFETnE4VFJuVGo0NytXR3pDeS8rOUVPZmpQU0pvR05lNEpSNXZN?=
 =?utf-8?B?SFZ1MFZGWHJjVjc2anVjNjQ2TGJsTjIwTmZiYjZ6OWRiRk9nR05IeTVWYXJv?=
 =?utf-8?B?d1V1bDJnMVplQ09LRENvaUdyS0lraThHM0J3SGtzeVluM2YxZWsxb0ZibnBm?=
 =?utf-8?B?WnpxWHdzY085Nll0NVZRajZUTmpkMCtDV2NXcXZWY0h5eVpBcG9IM1lBTFR0?=
 =?utf-8?B?d3pzTk9IQzRtazhETG5LbGJTZ2c3S2d2Y1JKUEFHU0tVVWhrS0NLbzN5djBk?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59B33F3FB569784C86F8691032E0A6FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c2824d13-4672-4a82-ebe8-08da6fe343f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 15:18:31.4040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Ju1C0er4qviSaO73NmVrkAd0y9mJUIXNJy5Qnhc0h5Vz5pWVsniVh4fwVBKVaXIOR4VbjDGdEucbu+fOaj+lIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3736
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 15:19:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168568

T24gV2VkLCAyMDIyLTA3LTI3IGF0IDE2OjU2ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gV2VkLCAyMCBKdWwgMjAyMiBhdCAxNzo0NiwgQWxleGFuZGVyIEthbmF2aW4gdmlh
DQo+IGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gPGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gT24gV2VkLCAyMCBKdWwg
MjAyMiBhdCAxNzo0MSwgTWl0dGFsLCBBbnVqIDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+DQo+ID4g
d3JvdGU6DQo+ID4gPiBJIGRvbid0IGtub3cgaWYgdGhlcmUgYXJlIGFueSBZb2N0byB1c2VycyBv
ZiBpdCB3aG8gbWlnaHQgbm90aWNlLg0KPiA+ID4gDQo+ID4gPiBJbnN0ZWFkIG9mIGRyb3BwaW5n
IHRoZSB0ZXN0aW5nIGNvbXBsZXRlbHksIG1heSBiZSB3ZSBzaG91bGQNCj4gPiA+IHN3aXRjaCB0
bw0KPiA+ID4gYnVpbGRpbmcvdGVzdGluZyBqdXN0IHRoZSBjb3JlLWltYWdlLW1pbmltYWwgaW1h
Z2Ugb24gYXV0b2J1aWxkZXINCj4gPiA+IGFuZA0KPiA+ID4ga2VlcCBhdCBsZWFzdCBzb21lIG1p
bmltYWwgc3VwcG9ydCBmb3Igbm93Lg0KPiA+IA0KPiA+IFRoZXJlJ3MgYWN0dWFsbHkgYWxyZWFk
eSBhIHBhdGNoIGZvciB0aGF0IDopDQo+ID4gaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3Jn
L2cveW9jdG8vbWVzc2FnZS81Njg4MA0KPiANCj4gV2hpY2ggSSBqdXN0IHJlc2VudC4gTm93IHdl
IGhhdmUgY29uZmlybWF0aW9uIGZyb20gSW50ZWwgdGhhdCBub2JvZHkNCj4gbWluZHMgcmVkdWNp
bmcgdGhlIHNjb3BlIG9mIHRoZSBBQiB0ZXN0Lg0KPiANCg0KSXQgd2FzIGp1c3QgYSBwZXJzb25h
bCBvcGluaW9uIHNheWluZyB0aGF0IEkgd29uJ3QgbWluZC4gSWYgaXQncw0KbmVlZGVkLCB0aGVu
IHNvbWVvbmUgd291bGQgaG9wZWZ1bGx5IGZpeCB0aGUgaXNzdWVzLg0KDQpUaGFua3MsDQoNCkFu
dWoNCg==

