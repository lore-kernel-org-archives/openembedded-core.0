Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE11EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 06:56:08 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.2424.1689663362297642518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 23:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=GODqRwda;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689663362; x=1721199362;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=EcMZyhmvW1u5JWi5z0wCn/tppbVK3LUC82OtkSBMNsE=;
  b=GODqRwdaH8WReVt6WjP5Ui/qn303Gm7GwAWhZC2NJyIVxGVre1DunkN3
   mP37+xCESt71krQliFSxn2MBWeaSVnnUxVvwhsV2IfDvQ/llVeJqvp37I
   l2yZaSNcSciLMsFJqWJ1ykZ3Ejb3wS/BRcWKwaNMG9UhADTU0JE3bdbNj
   FKmzdxxfE48/d/oi1ah/bw51lzIuvpiT08+CZFOPQ03OiREENN5kzEKXn
   HcYD8R3ADDvLqIM42zG2qQC3RonqyW6hI2kQoDXGaGL6LhM3VJHg+gIVH
   waOGh8OFuYFlDTwJVMYZscVt7sXep8XhecoHbDELuAX2DQZyvL3kyhQA8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432309961"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="432309961"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 23:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="753201464"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="753201464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 17 Jul 2023 23:56:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 23:56:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 23:56:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 23:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1/FhQC/SvPxDOu6zi7XyIvC48/s78pQFJiCFJy/tKrGW5Pp4DA8hW4LWzhzWhrdJHhntWJ/8rRPfJIEXBdr4Zl2efir2vfCqP3cyAJ2G4yoU27KVTkO5R3mzlvsoxSQ79D8ephWAxey43OiH9HIeYUZbg3Oem7M1L+/h3s9P0zYRfbAPX0pP9wLud2vQKt18w0HC4+vok1fGd9bKvWHI3BifHaBd2EuFxa8WG2hV685bCCLj39k69wsqO3vvftaTxsAxFkNffGnaRhRTWvu5nNcAKHTraVQBGS9Gn99aBoMusSSnmkVy5EDab0o3aynsSpdKqghdQRyIlDRoloCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcMZyhmvW1u5JWi5z0wCn/tppbVK3LUC82OtkSBMNsE=;
 b=lwu7s5aU6N73fFfLZlCPJkEEzikEvXBYgU44YcwhyPTyASRetiBj9Od/DgYxol0YtN91mGSGTGJFVxaBe/cJEkwUbe4cnakLTG/9G+tRbR/bVPzyR8nHo84kZjH/3B7pYBVpfi56Plkeko7GnlcPQqDuUFfOBwo7TJ5wSwoewGVw6W+Ds6meGaXFg+uyrb6eg1TWe0q5h+7SfwEYowIVgpOfEY2E8n8XhtG3vO4MR3LjTD8p44oYyBiKvJgZiCSRsVfoKqifesLwR2Enz9DfFHDJr3Yt6Zk/29h0SKO7b7WkowyC8zPHCeoXjbE8X3AhBknViqO0jj2Pz6yHyer3ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 06:55:59 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::1b87:b80a:6e3b:c2af%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 06:55:59 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com"
	<wangmy@fujitsu.com>
Subject: Re: [OE-core] [PATCH] libva: upgrade 2.18.0 -> 2.19.0
Thread-Topic: [OE-core] [PATCH] libva: upgrade 2.18.0 -> 2.19.0
Thread-Index: AQHZuI6dovha99shpk2A3v1orz/WGK+/GLIA
Date: Tue, 18 Jul 2023 06:55:58 +0000
Message-ID: <4571c99520874e298c34b056500210e7d93afc99.camel@intel.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
	 <1689585025-23731-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689585025-23731-3-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY5PR11MB6487:EE_
x-ms-office365-filtering-correlation-id: 8cf5a9a5-975c-4beb-2d18-08db875c0ac2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQ2meUTpIUSKFoBQKWZbDKMF7gKaaTu2pgxUbLNEyfK9U1bnRLGNDd270WUqTvFXey2DzXnuNUZNu4NkKeQICHnSN7N/oHKC0ijgi4wM+JnR+vj6US60+vFIKIYQSxXUVggQrChAMkA6HTV+Dl4H4bg39TsfmggL4JDuUoMxC0hUReS6EBdzEVFlWAWlxD+unpqQm4dLJJpAqzPCF8rra+29FCSATtbq9jSYt4bOZGEC4dje63Ugf6AVc0bnxrhC4IG2S+CeJMIN0LmmrOHirNQ/espliCHzpDm4T2IEZana+DoJS8VNQh2Z8/iT49w8DeC3wcp8yUFGptd2aokce6xtubCTUv4DN7oQW0Ax1eSMST+WAPqWCgyzGUBk1qeV1aVmqi+QFqOYiaVt2vtc2g9p8Q6vopFjPmxtZV9Ta2EIePOuQFlF4vyp4NdmrhE3mah8hrPigy8N01Poigf1xey/zw6LvmB7LR2tnDUQ1zrqOr1KKJUyWbmpfEheLAfgPcxDRAT2kjHLGquXgCPWYkyxIwz5CUvyxfAFf8n0/vb5aRdasZFvwbqITX6UBQXUUIA801qs9B18xWyWJD2HbsPPREKzBxSM01j41VJf+S3ms1JkFeJEaqDrHjMpnwl0m60gVNOwY//QV2vpgDy1tg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(38070700005)(8936002)(8676002)(38100700002)(83380400001)(36756003)(2616005)(2906002)(6506007)(26005)(5660300002)(82960400001)(122000001)(64756008)(186003)(66476007)(86362001)(76116006)(66946007)(91956017)(66556008)(110136005)(19627235002)(66446008)(6486002)(71200400001)(41300700001)(478600001)(66899021)(966005)(316002)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dHNU9zTGcrS1JxNDFUK0VJaVkwaWNDV2EyRlhBZmJ1ZGhVdkJUSVJjdDNC?=
 =?utf-8?B?RXpZcU1NRmZTWE9vSjA3MjN0SENxbWFnbXFvLzlYUWhjcmNmaEhtS3laNmc4?=
 =?utf-8?B?akV0bE51MGxwdjB4UW95aGJLa2NOVnc0eUExeWd4Qm5IMWljN0JHVjdqME5Q?=
 =?utf-8?B?a0tsU0dKdUcyZDhtR1BmQUZSNnVzN1oyVEpnWVFYSk01dm0zNDdWOGpFSC9R?=
 =?utf-8?B?TkNuNG5vZ2hYOG0rWHkyRGF4ZzlvNzhYMm9FTUcyNWJ5N0FRU3duOURGR0Ji?=
 =?utf-8?B?bUV2ZG1MYUJrd3ZscE9mOHIveSs1YzFuRHpkUmV1cUhLWGtMRXkzZmZDSW1h?=
 =?utf-8?B?UXQ3YVJnQS9vd1FuK3NOMmZJcXNiYVVnTzFzNXNRc0dvWENEWmoyK2d3YW02?=
 =?utf-8?B?M3BkR2x3MllPVVhnUUVVb0FuR1RPZzFWbEFMc0E0QTlOZC9Dc0s0K1JuUThW?=
 =?utf-8?B?Q2xLbllCSUcvbVNCZXV1ZUJCZ054eUV2N1A5KzhCY0swa1U4T2lBMGZ5bE1l?=
 =?utf-8?B?WkJEaFNmMHFhNXRwSUpZT21oV2thMmhWTWQ5aVdXQnp2bkpNcWxxRW1mVTBQ?=
 =?utf-8?B?bnNUZ053M0djUHpSNU5QcHp0YVcxODVXOTZ2T2FhVncyWFEyYi9zNWNVU2JJ?=
 =?utf-8?B?RzY0T2ZBUWNSd0VDSWtOYjR4MEc3dTd3dXVjQjlQOHlvd1FEekpuZTg1VWVm?=
 =?utf-8?B?WDRGY3h0TjNueWJqZTNOdHBaaFFHZndhRTUrT01pdzg1SFJCV3l5NG42MGVv?=
 =?utf-8?B?aHFkcFROVy9SMFR6QzdiNVRsbGpiYVJpYnc3MTB4NjR4M1pxdk1CMThLNENu?=
 =?utf-8?B?ZGs5UUJKYUlUR3B1aHh3Z3FVTk80SndBUU5CR3lOckRUVEh6c0dneElIZVRn?=
 =?utf-8?B?NDRNcHQxZWR3eXF5MzU0RlB0dG5KNjVQOC9qUHJyc3JzOEFyZmlvMmlrNWxw?=
 =?utf-8?B?aTVhYkx4Nk5KSjd6Z202b3hTSkhadFFMZzY3Zi9GRy9LYnh4RjVadUhzTlh1?=
 =?utf-8?B?TCs0bWdDVTdMTzVjN3ZTT3d6KzlhTmpZVjRGcWFLTzJ5S1gwdG5zbzFUYXQz?=
 =?utf-8?B?VlZ1QzRYREdPcHVSRVhRRDBNNGZFSkRGeHBjOS9wM1hKSy9CdzRDbldaSnNU?=
 =?utf-8?B?eDFZZ0xtT2Jkb3BLbUxqdmp0VjNPU3duUkIwVU9ZWFVZdkFHTmY2TXJNaHBv?=
 =?utf-8?B?NGU0QWlXMDVPd1BldEZEZlNLNHlOdTlOMk1KeXMrTXJsZDROTDhvdnZFS2Fq?=
 =?utf-8?B?RjhXT2ZzVlQwTU1PZFFQbmpkVVZGZXJhMERxcU1VOWM5dytCTlpTSnRPNWtF?=
 =?utf-8?B?NWllbG9wWFVkMi9tYjVFdDB3dUR1amtyY3pQcnZqd1RYeitNbm82N2NQdWJN?=
 =?utf-8?B?VUp4R0w5KzhWZ2E4QTFHczBJZUE4dkR2QWdWZVg2bFptbEFXdVZxUTdkaXhG?=
 =?utf-8?B?VE1NaHlmMm05Z1VNSFRyd0JUVmZwUW1PUkZsbTNQUzd2T3ZCV2xhdm43YXVB?=
 =?utf-8?B?bFVIaXd4ckNGaGFzUUN1aTNkM3d4eFhkbDA5NzBXenlvZU9qQWF4TzQ3OG0x?=
 =?utf-8?B?Lzg5dDVNVm5FbW9iUXNUWjI5d2QwL3FHUUdZd3RIQkVhVTRIdEdqc1RWbkxK?=
 =?utf-8?B?NWFiV3FQTi9VdGVlS0xPT2JySk1wUVUxV3pTSGFqZS8xMmFFWlBKV1pYNTdn?=
 =?utf-8?B?ZzVmSDB4Q0NsUm1XcndmRTM1emUxMndMUGJpK2hFQXVKaVhoQnNqVVRRWlQ1?=
 =?utf-8?B?VzF1MjNRM204R0hUSC8zZXFCaVRjakxpdjhWRnpWZ3JjN2xRMWU0VUMxMTJp?=
 =?utf-8?B?YTd0c3RnWHFRRjVTQVZNb0twM3RaRERxNG9icm03RHlLblN1dGJmb0E4WWRC?=
 =?utf-8?B?ZWlKK3B4dWF5bFRmMTBTUjd3bDB2ZFA5NlZqdk5McS9zbitTU2JXNTArMlgx?=
 =?utf-8?B?TVIrbzdkUjlZN2hOa0UrTnVvV0NnUytTaWdHT2RrRlVpcFk5eTAvWjg5RFZi?=
 =?utf-8?B?U1ZzMWhWMW54dkUwV2lVR01ZRmx5S3Q4L2ZWQnVnSHFFdTFUSVlVMDlOQzZo?=
 =?utf-8?B?SjFwVnR6SkFCalFaRll2S0ZDczlVWEdsd1FZbjJ3YUN2QW1MZ0M0b0FUYlQx?=
 =?utf-8?B?SlpvZUVzQ1lJUng0NUEvbnVuQmUza1ViWjFTMHVzckJrbjZWUFlEdng0NkhU?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D05892A6B9CCB4D9EAB43B5D78A1680@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cf5a9a5-975c-4beb-2d18-08db875c0ac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 06:55:59.0265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlE9pmgJEn/jhjUctmIqJMu48ZL4VHz1lDb+/jqLWTAGIodESZkpkoy8nJnuwyqnTWiH9HeRQHHR8Xu9Y6BJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 06:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184496

T24gTW9uLCAyMDIzLTA3LTE3IGF0IDE3OjEwICswODAwLCB3YW5nbXkgd3JvdGU6DQo+IEZyb206
IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBDaGFuZ2Vsb2c6DQo+ID09
PT09PT09PT09DQo+ICogZG9jczogZml4IHJlZmVyZW5jZXMgYW5kIGRlc2NyaXB0aW9ucyBzbmYg
Zm9jeWhybiBtc3RrdXANCj4gKiBjaTogYWRkIGJ1aWxkIGRvY3MgdGVzdA0KPiAqIHdpbjogY2hh
bmdlIGRlZmF1bHQgZHJpdmVyIHNlYXJjaCBwYXRoIHRvIGJpbmRpcg0KPiAqIHdpbjogcmVseSBv
biBjb21waWxlciB0byBkZWZpbmUgbGluayBuYW1lcw0KPiAqIGFkZDogQWRkIG1vbm9fY2hyb21l
IHRvIFZBRW5jU2VxdWVuY2VQYXJhbWV0ZXJCdWZmZXJBVjENCj4gKiBhZGQ6IEVuYWJsZSBzdXBw
b3J0IGZvciBsaWNlbnNlIGFjcXVpc2l0aW9uIG9mIG11bHRpcGxlIHByb3RlY3RlZA0KPiBwbGF5
YmFja3MNCj4gKiBmaXg6IHllYXIgZm9yIHZlcnNpb24gMi4xOC4wIGluIE5FV1MNCj4gKiBmaXg6
IHVzZSBzZWN1cmVfZ2V0ZW52IGluc3RlYWQgb2YgZ2V0ZW52DQo+ICogdHJhY2U6IEltcHJvdmUg
YW5kIGFkZCBWQSB0cmFjZSBsb2cgZm9yIEFWMSBlbmNvZGUNCj4gKiB0cmFjZTogVW5pZnkgdmEg
bG9nIG1lc3NhZ2UsIHJlcGxhY2UgdmFfVHJhY2VQcmludCB3aXRoDQo+IHZhX1RyYWNlTXNnLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4g
LS0tDQo+IMKgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyDQo+ICstDQo+IMKg
Li4uL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTguMC5iYiA9PiBsaWJ2YV8yLjE5
LjAuYmJ9IHwgMA0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gwqByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE4
LjAuYmIgPT4NCj4gbGlidmFfMi4xOS4wLmJifSAoMTAwJSkNCg0KUGxlYXNlIHVwZ3JhZGUgbGli
dmEtdXRpbHMgYW5kIGxpYnZhLWluaXRpYWwgdG9nZXRoZXIgd2l0aCBsaWJ2YS4NCg0KVGhhbmtz
LA0KDQpBbnVqDQoNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGli
dmEvbGlidmEuaW5jIGIvbWV0YS9yZWNpcGVzLQ0KPiBncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMN
Cj4gaW5kZXggN2VkMGM5ZWQ4OS4uMzM4OGZlYTMyYiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbGlidmEvbGlidmEuaW5jDQo+IEBAIC0xOCw3ICsxOCw3IEBAIExJQ0VOU0UgPSAiTUlUIg0K
PiDCoA0KPiDCoFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L2xp
YnZhLSR7UFZ9LnRhci5iejIiDQo+IMKgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vQ09Q
WUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4MmU1ZWYwMzUzNzgwMGYiDQo+IC1TUkNfVVJJW3No
YTI1NnN1bV0gPQ0KPiAiYTM1NzdlZWJhMGMyMzkyNDY4NmM3ZTJmMjAzMDA3MzczNmM4MjgyYTgw
ZjI3YjU0NzNlMzNlYTk0Y2NkNDk4MiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9DQo+ICI5NjNi
ZTc5OGQ1NTlkZjdmZWViZGE2ZmE4MWFhMGRhZTZmOTQwOWM2MzNhMzc5MDljNDRjNmFhOGFmMWUy
MTc0Ig0KPiDCoA0KPiDCoFMgPSAiJHtXT1JLRElSfS9saWJ2YS0ke1BWfSINCj4gwqANCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjE4LjAuYmINCj4g
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xOS4wLmJiDQo+IHNpbWlsYXJp
dHkgaW5kZXggMTAwJQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmFfMi4xOC4wLmJiDQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmFfMi4xOS4wLmJiDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBs
eSBPbmxpbmUgKCMxODQ0MzkpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4NDQzOQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDAxOTEzMDIvMzYxNjcwMg0KPiBHcm91cCBP
d25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBV
bnN1YnNjcmliZToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvdW5zdWLCoFsNCj4gYW51ai5taXR0YWxAaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiANCg0K

