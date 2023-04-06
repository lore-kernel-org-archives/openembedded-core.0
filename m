Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E270C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 09:06:24 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.154024.1680771983567914415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 02:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=aKna9dvM;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680771983; x=1712307983;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=VWhzo1zcbEK1CALzDoTokRChhJ9JwbRctdxe5UcbA8k=;
  b=aKna9dvMfM+k5+1+gE7YiYnNv5ax+shrM9NCeOeVIe7cg8mUmCrL0PiK
   po/HGJE4YeYDcVaghoVuE6UInJCTBtW9J5uAkJuDHzSHBgVB7+TkPTD+D
   HWh7wbmhVAW6MKgrmUZiA5mwBJhZnsPLko5ZaPCBioKSmSzB6fXxd7T2m
   XHBKXDoos6B8ud0TDzKDQZFZhVf8CoOhZAA7lSmPT86khDUamROEKBHW4
   Ze0heyB1OEa7TE6ENL+S8slxgaVeoojOA19QCwQZvm5oDw2XDz3GQ8dcF
   VLYTdnu5iqOHDiZoOok7Djv6o8MWuJOjmBHXv5BI2Z2Ov/kDbbCaq7pfI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="428972961"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="428972961"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 02:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="830680737"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="830680737"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2023 02:06:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 02:06:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 02:06:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 02:06:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 02:06:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2NNSlQiv0u7YTYgHxIMck+8MPiAw4BWiTWP5wyDy+fnXnbsMUNf8iReQU52BSu+AqOH2QvnKr3Hddl2jUZ8REjl1lVS+of6AHd3pZXY317meDY4UWcxXS/hZ7WksjtC3JRhFyabWTpHXP7MNSHwuFb+zYJR7jJ941EFIvV/3XZZ+fnoICA69bUpjQKUbA/iDgWfZrowk2YqNvRZdh/xQvE9bBDMgrEKJiiW+67nBCKSCKuy30z8bECDyWckwPLfmD/SPQ4tkuUeZVX0ibzxF4hJd/n/Z/wK7opUXmn54BVIVm/+yuDkPF/9rDy37M52DwDfSoIaKfQrv03fyaMb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWhzo1zcbEK1CALzDoTokRChhJ9JwbRctdxe5UcbA8k=;
 b=eKDUKvM4sbTK5nvanRGCY2rwJR6O0y2woljzq9XTPc27wYEJsx+3qddYR6lj8asP30zut2CTvVwoQ/aSG0hocFzcXIv8dVHdRjA47WM6dp1yWY4RqXBmDObOoKxSjIQ2V9qZsMHdQBt1ZIhlw3o5UHWIsuqewJczl70vx4c8qGZSmSLw/uDvZrs35VsrSwkQYMBrXNQYz1k+iPbG72J3Jq64i4Yy0MWRL24ALkUdr7tG3ty/jhPAjfoLrIGQ9LIv/cZh4BU+lrgrSbUyQ9ftyV9sv/BR+CN2V6mxhAENq/y8y0gLDQNzjyaIpObR5zEjPRmD49v8jdrqQ6bxpEOesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 09:06:04 +0000
Received: from BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::6d26:3010:a724:eb68]) by BN6PR11MB4145.namprd11.prod.outlook.com
 ([fe80::6d26:3010:a724:eb68%6]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 09:06:04 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.2.rc1)
Thread-Index: AQHZaF1srQJDKyqaP0ialoLSGc/Sy68d/ILw
Date: Thu, 6 Apr 2023 09:06:04 +0000
Message-ID: <BN6PR11MB414551F130849522F32006C5A1919@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <3f837f0f6dc5a6670ebb2d3a6e074fa614c387c3.camel@linuxfoundation.org>
In-Reply-To: <3f837f0f6dc5a6670ebb2d3a6e074fa614c387c3.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_|MN2PR11MB4584:EE_
x-ms-office365-filtering-correlation-id: 48814746-906b-42ab-c616-08db367e2689
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfjklLNenpOwtssU7wga6iClI4JiLSu9V4CcVGm6TiOyz67rjniA1U/y+/YhCr0M3hxZlaw4C1W10ftCOTL+OdEGXtdstW8GNGRVStCvG5ihxWCaNkSbwnOY0bao0x/Q+HtB1g/0FwCgInIuFlzF0UsizaOLt+CVqr3E2bNr8o82zOz7WAwMh86IRH5Qq8vvbk8LWAy6+t9sc5GKN4HR/ok2wuYet4xHGnw1UgUt4tyRUO96JbQ+ck2rFvoy60RZOhUeehW5eqse/f2ZNx4d0nfKAee/q2GOm8ZAfIiSWKzKdI0JwU60lyQqUO1b9GgVfLDnW7pZIkS9ZmhxqfM+DecN6PAcrcbpyXnzABvpk0lYy4zA4cj/ZzFUED/ORsNzzf+/xZSVDeHxdsUmFb+zKnyl0INOuWs2vihNKBJz8kyDtDGf+d1JERbiuC8QaMOogSAzH3G8AKmQXm1f5KKMcltmO58VUw4mGX9yScAL5LxGkt8jSKizGI11dEsFztfxd2UQQeBUZtgWUHalGkxHxPn7mvNTq8fY4o7skPb6dBKxYiNJG5nkKRTw7OYRt1UOaM6xI+iqYxccbu8tQYwpduiNvoVyPvtgO2VtEbrJEX4d75pOrjV2NxCDBhkmIpGVCWV0rvWZowXxDbyMmiIA5Ks2evB+jKmC6tN0G+laDwU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4145.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(66899021)(33656002)(38100700002)(5660300002)(2906002)(15650500001)(38070700005)(8936002)(55016003)(52536014)(66446008)(64756008)(122000001)(8676002)(82960400001)(86362001)(66556008)(66946007)(66476007)(76116006)(41300700001)(966005)(83380400001)(9686003)(186003)(26005)(6506007)(53546011)(110136005)(71200400001)(478600001)(7696005)(316002)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWVPZk9uM2FRb1dVTVdEaWlTMTZwMDRSZCtMeHpzU0dwK0FINm1qNUpWbE5I?=
 =?utf-8?B?YWRJZ3BKanpCclMwRW1GVGw3bmdLcDdFNTNEbG13QURURGRGcXJTZDFsanNr?=
 =?utf-8?B?Y0g4WkhKMlJYbkRPNjBxWC9XL1ViQVRtbm5tWVNuM3lWTVlDeCsvNlBjVW5L?=
 =?utf-8?B?ODAwbkpqVEc1NzNjMG5NT2ZGNExiUEVVQllFbEwyMWQ1NnpxYVd1YndrVkoy?=
 =?utf-8?B?bERHQzBxaTNFVTM2OTBhNjlMcHhmQVN6a3lGK1Y4alRpdCtrRzBjVFRuckVj?=
 =?utf-8?B?dlgwQ1hMcCsrdk9PWWpNcXhSRlNIZStLdmVSL0dUYW1ZMXNYWWx5ZnJ6T0Jv?=
 =?utf-8?B?aERVaHFiRDlKTzcySDFGUU4zNDZ2QndyUElLbDFvNEJKdXJQeGlYUFJhdU5w?=
 =?utf-8?B?ZHRnam4vZkpUcTRiUWR3RmlBVG91dDE5ZDk3UXBHb1hlUGFFYWdxYkV0UU9v?=
 =?utf-8?B?Zk1DNWhvQUNYWHdtL2FvbFNWV3dtQnFWMlZUZmNJUDcweTJqYStYREc1RGxa?=
 =?utf-8?B?UEhiSGlVTXArZzJjNE9ENGx3d3hiNHlTRnFUd2tUMWlKT1htdUp4TXlSVzhY?=
 =?utf-8?B?NUMzd1ArT29ZSXlQcmZlNVZKMlYxYmw4aS9kalVodWxFbE1YMkV5UWhIcjRU?=
 =?utf-8?B?U2tiMGpQZ3NyMXo3dHJiWXZnRTB5TCtxMFJwcVM2R2FRNEdNajgzVHJZN1Zo?=
 =?utf-8?B?R0wyMXk5eXNrZXdjUm5SV242Y1lYd1lWZm1OTlgzMVhzMkhHOGx3UlQ1WTRv?=
 =?utf-8?B?YnVOYWN2UHZxWWpNZmZHVkhlYjFQSko5aXRpbFY5SENNcFdzeC91a2tCc1A5?=
 =?utf-8?B?bXBRQ2d0Q3hkWW5GblFRaHc0RDV3MUE2eUdGemtxQmt2VTYrUVJYbnVsbWpa?=
 =?utf-8?B?cjZiNGVHVEtjYmRaMkNJcGpheXpsZHJ3NStacXVxMC9NMTA4ZVF3clJNZzIr?=
 =?utf-8?B?d2dHTTFtRmE3b1lwT04rWktVS1AzcUFENmdnaEJKNS9pUnR2M0JDckdiZWYx?=
 =?utf-8?B?SVNaMFZCTU9uZml4RS9xN2JJZzB1ajJvS1dvd0FMWkhCOTVCdU5Nc0FUZGxN?=
 =?utf-8?B?OG4xWHJtUy95eFl4WkVkSndwUDB6dTFOb2t1K2FBVjZJcW4vTVVONVJLYVVo?=
 =?utf-8?B?YlBaTUxDaWc1Y0tmVlptdWFhYVlFWFJuek5hZkFQZ24rdFlwRHRQWTRnN29z?=
 =?utf-8?B?RWhBU3VDSUtTd2lhaHJSVWtyUlhVSlpXL0ljTit2UDZMVVM5SWRJaFFPNDlz?=
 =?utf-8?B?bVBlZ2oxYWJXOVMrOGRackxEUUpSN0FoWGd1a2ZJUm1IdnBIM3RodDJicmtm?=
 =?utf-8?B?YlJHMEMzYldWdFdrUUJCVGZYVTVvbHo1UEsxaklEOTBzZTV0YUNHVGlTSUtZ?=
 =?utf-8?B?ZHhlRDlDcDY2YnJCNFhoK3ArSmhvM0hORzJoZkNSd2VBU1ZkT3ZKdWpreElu?=
 =?utf-8?B?WmdNajZXK2dZdjV4VEM2bnBsU0xPaHJJbEt2RU1nWEVxcm9FZTU2eHUzQ3VT?=
 =?utf-8?B?Wi85aWVwSEdzci90RmFwUzVGM1FFaklDc0ZwdHl6dERQa3g5d1dqbXlDOExD?=
 =?utf-8?B?VDZZMjJaRXY4Y2puSzFiQmFaUmg1bGRaOWpyYWRvbnJuWGpNbTY0TktRazgz?=
 =?utf-8?B?c1FCeWN0ZCtQSEZWTU9rbmRLNFdlcE1ZTm0xTldwVVZNNU1zY282bU91K3hl?=
 =?utf-8?B?aklKNmFmTWt0MlJFZXpmeXJMRTBXanAxU0JTcHhuRG43UFJQY2xzd3Vyc0hO?=
 =?utf-8?B?RjR5NTRGdjZHa0NQTTltTmllejZmL0xCeUZ5RDZCdnBxRUFocGRwOVpRd3B1?=
 =?utf-8?B?RVE5U1V5MkltdTl6cGNlZmpBMnNsOXRMTnk0SFBydDlOMUthUlF1cDUzSTF3?=
 =?utf-8?B?WUdhdGFUSzRCaFpJWDRYajBiUjh4NkkrYndobWw2a0N0ZlJRblYxL1dmbUJh?=
 =?utf-8?B?N3lPMXpPTFg2Qk1vaXdITHFlYzNZQkwvNzk2UnFaWWNHak45NU11a1BvY0hD?=
 =?utf-8?B?S25taEU0aVVBSVorbXVjNGw3QktFczJJTVNhdUpmYXNueTQ2eC85S2ZMRDZ0?=
 =?utf-8?B?ZXNHakU4YmovaHJzQkhwWVE4ak9iVjFCTTZLZ0RsUVNsbXF3SXpZMUdMR0JF?=
 =?utf-8?Q?t8dJ+fkSZswl1dN7S4Hysj+MU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48814746-906b-42ab-c616-08db367e2689
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 09:06:04.3188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQ0rCfl+fpWXyEeRnCnn/16cN5TOHlckkddlZXP7tVCz12a+13N7B03s2704hzZZTlrhx+/YlMM4+EDlECskVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179764

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTQuMi5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVjdXRl
IGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCiANCk9FUUEtbWFudWFsIHRlc3RzIGZv
ciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQogDQpSdW50aW1lIGF1
dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCjEuIE1pbm5vd1R1cmJvdCAzMi1iaXQN
CjIuIE5VQyA3DQozLiBBREwNCjQuIFRHTCBOVUMgMTENCjUuIEVkZ2Vyb3V0ZXINCjYuIEJlYWds
ZWJvbmUNCiANCkVUQSBmb3IgY29tcGxldGlvbiBuZXh0IFR1ZXNkYXksIEFwcmlsIDExLg0KIA0K
QmVzdCByZWdhcmRzLA0KSmluZyBIdWkNCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcg
PHFhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVo
YWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA2LCAyMDIzIDM6
NTcgUE0NCj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9AbGlzdHMu
eW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQt
bm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFtxYS1idWls
ZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVy
DQo+IGJ1aWxkICh5b2N0by00LjIucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAo
eW9jdG8tNC4yLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIgYW5kDQo+IGlz
IGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5p
by9wdWIvcmVsZWFzZXMveW9jdG8tNC4yLnJjMQ0KPiANCj4gDQo+IEJ1aWxkIGhhc2ggaW5mb3Jt
YXRpb246DQo+IA0KPiBiaXRiYWtlOiA0NmUxZWEyZTlhMjAzOTkyYmI0ZGU0OGVhMjFhOGU3MzY0
MTlhZGEyDQo+IG1ldGEtYWdsOiAwOTEzNTE2NGEyMWEyMTZjNmUzZTc1ZDdkZWNjZTg5NmI5Mjk2
MmYwDQo+IG1ldGEtYXJtOiAzYjRhYjQzZDJmODJiOWRiNjgyYTg4ZGZmNDY2NTgwN2I2MmQxODcw
DQo+IG1ldGEtYXdzOiBkMjQzZmMxYWQ0NWRkZTU3YjRjYWExODJhOTJiNjg1NTQwNDc1Y2IyDQo+
IG1ldGEtaW50ZWw6IGVjMzE0N2FiZGQwNzI3ZmVkYzcwNzMzMGQ1ODU5MzA5NzM1N2Y5NDQNCj4g
bWV0YS1taW5ndzogMjUwNjE3ZmZhNTI0YzA4MmI4NDg0ODczNTliOWQwNDU3MDNkNTljMg0KPiBt
ZXRhLW9wZW5lbWJlZGRlZDogNjBhZmE1NzdlNTY1NmE3YzgyYzkwMmRhMTFhZGMwMzFkNzFlZjhk
Yg0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiA0OGMwN2E0OGEwZTdkNTYyNjZmMjBhMDFiYjBjOGVi
YzEwODU0NTNiDQo+IG9lY29yZTogNWE5Njg0N2U3ZWYyZmY3Mjk1OGQ3MzlhOTFjOTBlMjA4NWMw
NGJjNg0KPiBwb2t5OiAwOGQ1NjRiZDkyZmM0NzZkN2YwYjRhNjIwMWI3NTJlNTFjZjkzNzc2DQo+
IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0byBQcm9q
ZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8t
YXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
DQo+IA0KPiANCj4gDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6
IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVw
bHkgT25saW5lICgjMjM2KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVp
bGQtDQo+IG5vdGlmaWNhdGlvbi9tZXNzYWdlLzIzNg0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC85ODEwMDUzOC82NDI0MDQ0DQo+IEdyb3VwIE93
bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQt
DQo+IG5vdGlmaWNhdGlvbi9sZWF2ZS8xMDc2MjQyOS82NDI0MDQ0LzE3NDY4MTM4OTcveHl6enkN
Cj4gW2ppbmcuaHVpLnRoYW1AaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0K
PiANCg0K

