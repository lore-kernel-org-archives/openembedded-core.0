Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BC8C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 02:26:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.48517.1698805607619874111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 19:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=K+Z4z7uS;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698805607; x=1730341607;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=5aEesj/Dq88LSEFLHdqITdyDvwikmMGiYOD8fdqBn+Q=;
  b=K+Z4z7uSN5kiJWgISQvLS20mcM/69HWH5gcQtlXEq5NOBF5gsaRP1OZi
   kFM5zjowWwyIUfydh5eVcbvkvBkdlYhtFw+WWd3NMU16dGbDRHeX04VJL
   AOgLXU5VIj4xHYcfrQVhmetsoOcZ76wBs+K9vQ6vhD3InTnzZMQITNMOD
   FvQpV0WWxtuo3c1dijfsIXmMIa3QIpnGGMV69cqpjL1UxVGM8EPBZfmO6
   xxI6jr6Eb2HXcHWvYPiz418puBOXWYW++tVt7GOyDZENggwT7VymOQZgc
   qK9JIsR8rmQLjA9npqEdvjo2C24eHJ4garSqiJTxgcyD93EhdPEgpLYZb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="367763236"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="367763236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="789968854"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="789968854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2023 19:26:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 19:26:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 19:26:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 19:26:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 19:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkXDjigJJn2MvCsfwMj7/31mkypZZAILG/LMggh1Dx3daVfnxRW+4/QbBupqCEJH5R8NXmUqc/pfkFWe4+yaMCABQxKkZiozILrYPH5JVdKghu62D8kifuArCZXaXptX3K2NiaRfgA9Y9mJMbGtGY2uL9iwj2NE3r9CcHP3DDeAkikZx1RfINBut1D0ZHqmxEE/84EWmha1DQL7MPtKU6cwDluTEO0Z0f25ao7mV28XogBJ15+707Is8Yc+BD5sv7CtUWb9M5z2Oh47ipvR/gqk1xj/ciLHCy1vIP7lMQZdjuaMdCb+mbEukU2b6BIWa9Xjkhw45q3cE49GtA1WH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aEesj/Dq88LSEFLHdqITdyDvwikmMGiYOD8fdqBn+Q=;
 b=iJyhJ22IS9iN7x6T8BBwNS+Ad+8F0nm04Ir4FVGXUU0/fNiyT+5h4lBuhLFgHRu+ASQnNn6l3BOUzOo/YpdzgRUzcOm/agbfmzZ7r2iE9mZ2a0sV+UBKNYqi0yrh56vbvvdo5gAWAREKdWeUYPKu5h6gWd9bV61eq2YjS2i7d8MzTrhLkfOnLdxaI1dI7k//Xf5nN+WDV5VlW/zy+HaPPFo9/4gUqUXS+KM3JCR1dn/fKALcUYvSdZsCPqF34Q1bwvFzhkRfpEixG42hRnRWJmFd4/pSwkeNRF7AA6pbdj66cqCuV1CyWypvBuZNUpSeVLeR1mRlvqKal/lzpngowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 02:26:39 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::775f:2197:89f9:105d%3]) with mapi id 15.20.6933.022; Wed, 1 Nov 2023
 02:26:39 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Thread-Topic: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Thread-Index: AQHaDAWDiVcKG+n4aU2dc+AGcm0t9bBkvaEA
Date: Wed, 1 Nov 2023 02:26:39 +0000
Message-ID: <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 475946fd-6a46-4d08-9788-08dbda81fae1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DBbzAs81XlvEFF8Ievpu8WLFsqDOLZB3QJ4TArXcqGmNmfSycPepEOtPq/00ePgtCtpasZrclJi1X+nCqVv2ZHfc8pflSUtuFx+x/ic7vW6k85x8BlgRhg48Dsiv52Mm5JuqiGgeERDxoWRdpKquDMiSc38K/cfsfsLMwGfOrjVKfAZ4b9F2LOk8J5UzxLGKeVy0OPnQ1LqNAuQBC9SfUaGnK8xfslTSqkg41wkbDzSuhcbyBhPhYZmPC+NJNeYhajzG8nmhhDkbGjy5WkDLw5slzbuos45tgDle49Q+3EUW/CrHuJSeIlKSpyes+mN/T4XOvXq1rTK00dyuQoYFwNlM8VhueHlzgvHd0oXqGR1IomDFw2GzCcWP5Fu8syQ+BUmfNJvfgo+9P207/3F7rTLcf5yAjVqAdY6pjTTIo+q8Mk71z3pL5lo2wLKpBszeQmNIhwFHXGB0jBKRW2Ee646oG4MldwslYtfEYrE9jsbrErZXcOzLyHSkaubIA2WRISWuvJAmAqpqO/JbaY36rDB9sIhv8F6SI+/9GHC5KjIyc1LZ4wMhEy9npEsJH9NCHapc4LK0ejBnvlmEuEs5AnCxzCWuRHlgn8zwqGBZPd0kR/zKBlML3jFnSR0aiRROD6IpG9NcJ072JjKP3AWcPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(136003)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(8936002)(91956017)(66556008)(6916009)(316002)(66446008)(66476007)(76116006)(66946007)(4001150100001)(64756008)(2906002)(478600001)(6512007)(6506007)(966005)(5660300002)(6486002)(8676002)(86362001)(36756003)(71200400001)(41300700001)(26005)(2616005)(83380400001)(66899024)(82960400001)(122000001)(38070700009)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTROWU5YR3V1NDdKYys5NU1xSDhLYmd6YUp6ZnlzWlpXQkJCUGFydmNzQzR0?=
 =?utf-8?B?dmNkbmdPclR1dEQydzdPRnVGTVdsTnkxc3lKenhtUEhJV2FEc2tmeEpHVjht?=
 =?utf-8?B?RXRKb0ZVaFEvSkRpaTloTjVkZFd4STI2MEswaVJta081RlNrYmhhZXlNcWFN?=
 =?utf-8?B?cVhVc3dONytMNGhlWUppWWRuQlJlbmRHd25hdXNJenJ0aS9aUXM5bks1eEZo?=
 =?utf-8?B?NDdFNUdEUmpKUGFKUjBocmh0WEgvQng1RjdhVmdzN3dLOTdCNmdPSDlzR0FI?=
 =?utf-8?B?WDg4UWdDcXF6VHI1RTZscXNCN2tLNWNRYUEvcWlodWoxbWgvWnBPN0doaGlX?=
 =?utf-8?B?NUMvUnVHY2IrQkdFZVlrNEx6Tlg3UmVkOE8ycmZFQ2VqcTNyamlzbTJ4RlJl?=
 =?utf-8?B?YlJsT1JUNnZQQkJEeU5qdHBBSjFoUzhSeHBmUStXUGJmWlNyOFdWTWpnS2RW?=
 =?utf-8?B?Si9QOEliTWtnczdEWmxOSlBNbDNSUWw0Mk5kM2dnZ2JSN1QwYWYrVW9nTHQw?=
 =?utf-8?B?RjVyMlk1NDZnWU9FOEJQcmEwckVZdHdpWitCVjBkQ2lVWXZkTDk5VUM1UG9H?=
 =?utf-8?B?NHArSjIwUWlnbEJmTkhNRHFFWXc1M0lkQ2lhejh0WGROOE1xWmFOV3hCaU9Z?=
 =?utf-8?B?NDVXKzRsUEVKcVFSTTVGMmw5aWkyOE1iN3UzVTB3YlRpa0xjTC9BK1RwczVB?=
 =?utf-8?B?NzA5MnFSdWdGQ0xwYVZQdzZTS2NBTUNhMDBaajQ2RkJtWkVWZVdoNHVrOFkw?=
 =?utf-8?B?Wkx4aVVEbjVQM3ZZNjZJaWlXaWRsSlYyQWZZQkJKaGpUMEdjeUVaZFZSUXVq?=
 =?utf-8?B?NXpWb1Nza3VhQms1RTZ6U29wcFpNeDZweTVma0NOMXBYZlFzMmsyOWQ4d0VZ?=
 =?utf-8?B?Qk02OGdVVmNwczk1UlI0eGlBQm9zNVJlU3Z3Y3FoNWtBL09vL21TQ3ZoeTB2?=
 =?utf-8?B?U2M4Mmg3Mm54RW9HRjB1SG5sSGdBTEZhMno5RG5CWmtuakdBUnRha3VjN1h0?=
 =?utf-8?B?eFYybDRrbVh6N0o1SFhFK0RTVlJmZ011SlFpNGk3aWk5cWtDOGFnMHlPWnY4?=
 =?utf-8?B?Tk9lQTFLdk9JaEJ0M2N2VUVmcWg4eFNyc1ZhT1VNU1ZhempCbmdwaFkzU1lR?=
 =?utf-8?B?WmMzK0oyTjJEV1pZQXBLM0VsMGhyZUlpYnFMMVJKYlJUVjhaS3VVbktWVkp2?=
 =?utf-8?B?cy9WSWZrdDlzZHd3M2ZOb0E4R1B2bXVaYUVHL3BZM3dlZmthclFyRXBSbmhB?=
 =?utf-8?B?bGFQd0hVeWo1Vll5Nm1oU0pBNUZhalhVUThUbE5KY3hBWU53d3hRTTJyRTly?=
 =?utf-8?B?RllvK25uU2QxWWRhSkdMSXMvU1lJY2FHZFBrR1c1c0l1TmJScExQVlErSUdR?=
 =?utf-8?B?QWJZeWVDWVl3YUk4R05QdnBmVlN5aktqL1lzQkZ2QmJRODBzYWpxeG9RS0Qz?=
 =?utf-8?B?Y2tGcXFtSzdCdkdNUVBkZ3ZxQ0ZVRzZTaG1ZMmo5MGdrTStrOHh0QkFjMXZo?=
 =?utf-8?B?RXFlVVRydVdIamd1elh1bWRjRldRZks2MTNoelloY3E2c01aem9VTEtEd29m?=
 =?utf-8?B?UkVlQ05yaitzSFVLK0orZXBpSzVHZm1FN3dxUzVRVmRtMW1VVWg4VnMzKzZQ?=
 =?utf-8?B?VnlLVWs3dm5tMEIxV0tORXlncm9YaCtMRmF5Zk1QQUkvUWhmL29lKzRyek9V?=
 =?utf-8?B?ajJqNzBQQklMTzdOTjJvUUdVaU82OCt1UkVZeW9QSk9mMDNOR0RVYWtrQjl6?=
 =?utf-8?B?bXZyK3pXcWdqRXdjQ0VkaUQrbHozLytSWmdLa3g4VzN3amhreVBSNlNKMjRK?=
 =?utf-8?B?NDAwdFcrMFpTQ3ZGL0kvdTVHeWxmVkpRd2dMY25IMUo0SVlYclhMd0ZYOUx2?=
 =?utf-8?B?RE8wQy9TZ3FsMnlBYnQzY2NRSGxYcUFQVWZsaTRMS0VyYmE1aUJoM3E3S3Zs?=
 =?utf-8?B?S3pKelVrVHlmTWhxQVNIYjU4ZFhGbE1iUHdnQldGeGl1ajNwOTJVUm1LQ1lN?=
 =?utf-8?B?UlU1Qk5weFJGekh0K3BNQkU5TGM3WXk2eWRpbUQ3cGsrVEhnbVlLbG5PSFpI?=
 =?utf-8?B?Q3B1L0FKbGgxQzBpZG9vS1orS2Z6bFFsbm44OE5TYjI5d1R0d2UyRnRlbTBK?=
 =?utf-8?B?a1EvSFFzMVl4VUsraXlPRUZWdHpYeXNjNkd0WkY4eUNIRWlQVDVvT3JxU3lN?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <03C272CC3079BB4387B7117E67FABF2B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475946fd-6a46-4d08-9788-08dbda81fae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 02:26:39.7691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q2tRzq+mdvnjXz9SIsbk+Rs7VVvaZAoHTvmJ71MfZr99iPOF6+l7aQKKBacBuK6cLFl6zqU+NYHmUnUHrtPv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 02:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189893

T24gVHVlLCAyMDIzLTEwLTMxIGF0IDE0OjIwICswMDAwLCBUcmV2b3IgR2FtYmxpbiB3cm90ZToN
Cj4gVGhhbmsgeW91IGZvciB5b3VyIHN1Ym1pc3Npb24uIFBhdGNodGVzdCBpZGVudGlmaWVkIG9u
ZQ0KPiBvciBtb3JlIGlzc3VlcyB3aXRoIHRoZSBwYXRjaC4gUGxlYXNlIHNlZSB0aGUgbG9nIGJl
bG93IGZvcg0KPiBtb3JlIGluZm9ybWF0aW9uOg0KPiANCj4gLS0tDQo+IFRlc3RpbmcgcGF0Y2gg
L2hvbWUvcGF0Y2h0ZXN0L3NoYXJlL21ib3hlcy9wYXRjaHRlc3Qtc2hvcnRlbi10ZXN0LQ0KPiBy
ZXN1bHQtb3V0cHV0cy5wYXRjaA0KPiANCj4gRkFJTDogdGVzdCBDVkUgcHJlc2VuY2UgaW4gY29t
bWl0IG1lc3NhZ2U6IEEgQ1ZFIHRhZyBzaG91bGQgYmUNCj4gcHJvdmlkZWQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlIHdpdGggZm9ybWF0OiAiQ1ZFOiBDVkUtWVlZWS1YWFhYIg0KPiAodGVzdF9tYm94
LlRlc3RNYm94LnRlc3RfY3ZlX3ByZXNlbmNlX2luX2NvbW1pdF9tZXNzYWdlKQ0KDQpJcyB0aGlz
IGEgcmVxdWlyZW1lbnQgdG8gaGF2ZSB0aGlzIGluIGNvbW1pdCBtZXNzYWdlIGluIHRoaXMgZm9y
bWF0PyBJDQpkb24ndCB0aGluayB0aGlzIHdhcyBiZWluZyBmb2xsb3dlZCB1bnRpbCBub3cuIEEg
bG90IG9mIHBhdGNoZXMgc2VlbSB0bw0KYmUgZmFpbGluZyB0aGlzIHRlc3QgYXMgYSByZXN1bHQu
DQoNClRoZSB3aWtpIGp1c3QgbWVudGlvbnMgdGhhdCBDVkUgbnVtYmVyIHNob3VsZCBiZSBpbiBj
b21taXQgbWVzc2FnZS4NCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gDQo+IFBBU1M6IHByZXRlc3Qg
cHlsaW50ICh0ZXN0X3B5dGhvbl9weWxpbnQuUHlMaW50LnByZXRlc3RfcHlsaW50KQ0KPiBQQVNT
OiB0ZXN0IFNpZ25lZC1vZmYtYnkgcHJlc2VuY2UNCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0
X3NpZ25lZF9vZmZfYnlfcHJlc2VuY2UpDQo+IFBBU1M6IHRlc3QgYXV0aG9yIHZhbGlkICh0ZXN0
X21ib3guVGVzdE1ib3gudGVzdF9hdXRob3JfdmFsaWQpDQo+IFBBU1M6IHRlc3QgY29tbWl0IG1l
c3NhZ2UgcHJlc2VuY2UNCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2NvbW1pdF9tZXNzYWdl
X3ByZXNlbmNlKQ0KPiBQQVNTOiB0ZXN0IG1heCBsaW5lIGxlbmd0aA0KPiAodGVzdF9tZXRhZGF0
YS5UZXN0TWV0YWRhdGEudGVzdF9tYXhfbGluZV9sZW5ndGgpDQo+IFBBU1M6IHRlc3QgbWJveCBm
b3JtYXQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X21ib3hfZm9ybWF0KQ0KPiBQQVNTOiB0ZXN0
IG5vbi1BVUggdXBncmFkZSAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfbm9uX2F1aF91cGdyYWRl
KQ0KPiBQQVNTOiB0ZXN0IHB5bGludCAodGVzdF9weXRob25fcHlsaW50LlB5TGludC50ZXN0X3B5
bGludCkNCj4gUEFTUzogdGVzdCBzaG9ydGxvZyBmb3JtYXQgKHRlc3RfbWJveC5UZXN0TWJveC50
ZXN0X3Nob3J0bG9nX2Zvcm1hdCkNCj4gUEFTUzogdGVzdCBzaG9ydGxvZyBsZW5ndGggKHRlc3Rf
bWJveC5UZXN0TWJveC50ZXN0X3Nob3J0bG9nX2xlbmd0aCkNCj4gDQo+IFNLSVA6IHByZXRlc3Qg
bGljIGZpbGVzIGNoa3N1bSBtb2RpZmllZCBub3QgbWVudGlvbmVkOiBObyBtb2RpZmllZA0KPiBy
ZWNpcGVzLCBza2lwcGluZyBwcmV0ZXN0DQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS5w
cmV0ZXN0X2xpY19maWxlc19jaGtzdW1fbW9kaWZpZWRfbm90X21lbg0KPiB0aW9uZWQpDQo+IFNL
SVA6IHByZXRlc3Qgc3JjIHVyaSBsZWZ0IGZpbGVzOiBObyBtb2RpZmllZCByZWNpcGVzLCBza2lw
cGluZw0KPiBwcmV0ZXN0ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS5wcmV0ZXN0X3NyY191
cmlfbGVmdF9maWxlcykNCj4gU0tJUDogdGVzdCBDVkUgdGFnIGZvcm1hdDogTm8gbmV3IENWRSBw
YXRjaGVzIGludHJvZHVjZWQNCj4gKHRlc3RfcGF0Y2guVGVzdFBhdGNoLnRlc3RfY3ZlX3RhZ19m
b3JtYXQpDQo+IFNLSVA6IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVzZW5jZTogTm8gbmV3IENWRSBw
YXRjaGVzIGludHJvZHVjZWQNCj4gKHRlc3RfcGF0Y2guVGVzdFBhdGNoLnRlc3Rfc2lnbmVkX29m
Zl9ieV9wcmVzZW5jZSkNCj4gU0tJUDogdGVzdCBVcHN0cmVhbS1TdGF0dXMgcHJlc2VuY2U6IE5v
IG5ldyBDVkUgcGF0Y2hlcyBpbnRyb2R1Y2VkDQo+ICh0ZXN0X3BhdGNoLlRlc3RQYXRjaC50ZXN0
X3Vwc3RyZWFtX3N0YXR1c19wcmVzZW5jZV9mb3JtYXQpDQo+IFNLSVA6IHRlc3QgYnVnemlsbGEg
ZW50cnkgZm9ybWF0OiBObyBidWcgSUQgZm91bmQNCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0
X2J1Z3ppbGxhX2VudHJ5X2Zvcm1hdCkNCj4gU0tJUDogdGVzdCBsaWMgZmlsZXMgY2hrc3VtIG1v
ZGlmaWVkIG5vdCBtZW50aW9uZWQ6IE5vIG1vZGlmaWVkDQo+IHJlY2lwZXMsIHNraXBwaW5nIHRl
c3QNCj4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRlc3RfbGljX2ZpbGVzX2Noa3N1bV9t
b2RpZmllZF9ub3RfbWVudGlvDQo+IG5lZCkNCj4gU0tJUDogdGVzdCBsaWMgZmlsZXMgY2hrc3Vt
IHByZXNlbmNlOiBObyBhZGRlZCByZWNpcGVzLCBza2lwcGluZyB0ZXN0DQo+ICh0ZXN0X21ldGFk
YXRhLlRlc3RNZXRhZGF0YS50ZXN0X2xpY19maWxlc19jaGtzdW1fcHJlc2VuY2UpDQo+IFNLSVA6
IHRlc3QgbGljZW5zZSBwcmVzZW5jZTogTm8gYWRkZWQgcmVjaXBlcywgc2tpcHBpbmcgdGVzdA0K
PiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9saWNlbnNlX3ByZXNlbmNlKQ0KPiBT
S0lQOiB0ZXN0IHNlcmllcyBtZXJnZSBvbiBoZWFkOiBNZXJnZSB0ZXN0IGlzIGRpc2FibGVkIGZv
ciBub3cNCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X3Nlcmllc19tZXJnZV9vbl9oZWFkKQ0K
PiBTS0lQOiB0ZXN0IHNyYyB1cmkgbGVmdCBmaWxlczogTm8gbW9kaWZpZWQgcmVjaXBlcywgc2tp
cHBpbmcgcHJldGVzdA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9zcmNfdXJp
X2xlZnRfZmlsZXMpDQo+IFNLSVA6IHRlc3Qgc3VtbWFyeSBwcmVzZW5jZTogTm8gYWRkZWQgcmVj
aXBlcywgc2tpcHBpbmcgdGVzdA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9z
dW1tYXJ5X3ByZXNlbmNlKQ0KPiBTS0lQOiB0ZXN0IHRhcmdldCBtYWlsaW5nIGxpc3Q6IFNlcmll
cyBtZXJnZWQsIG5vIHJlYXNvbiB0byBjaGVjaw0KPiBvdGhlciBtYWlsaW5nIGxpc3RzICh0ZXN0
X21ib3guVGVzdE1ib3gudGVzdF90YXJnZXRfbWFpbGluZ19saXN0KQ0KPiANCj4gLS0tDQo+IA0K
PiBQbGVhc2UgYWRkcmVzcyB0aGUgaXNzdWVzIGlkZW50aWZpZWQgYW5kDQo+IHN1Ym1pdCBhIG5l
dyByZXZpc2lvbiBvZiB0aGUgcGF0Y2gsIG9yIGFsdGVybmF0aXZlbHksIHJlcGx5IHRvIHRoaXMN
Cj4gZW1haWwgd2l0aCBhbiBleHBsYW5hdGlvbiBvZiB3aHkgdGhlIHBhdGNoIHNob3VsZCBiZSBh
Y2NlcHRlZC4gSWYgeW91DQo+IGJlbGlldmUgdGhlc2UgcmVzdWx0cyBhcmUgZHVlIHRvIGFuIGVy
cm9yIGluIHBhdGNodGVzdCwgcGxlYXNlIHN1Ym1pdA0KPiBhDQo+IGJ1ZyBhdCBodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvwqAodXNlIHRoZSAnUGF0Y2h0ZXN0Jw0KPiBjYXRlZ29y
eQ0KPiB1bmRlciAnWW9jdG8gUHJvamVjdCBTdWJwcm9qZWN0cycpLiBGb3IgbW9yZSBpbmZvcm1h
dGlvbiBvbiBzcGVjaWZpYw0KPiBmYWlsdXJlcywgc2VlOiBodHRwczovL3dpa2kueW9jdG9wcm9q
ZWN0Lm9yZy93aWtpL1BhdGNodGVzdC4gVGhhbmsNCj4geW91IQ0KPiANCj4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRo
aXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTg5ODQ1KToNCj4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODk4NDUNCj4g
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAyMjc1
MDA5LzM2MTY3MDINCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6DQo+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+IGFudWoubWl0dGFsQGlu
dGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

