Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83147C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 08:26:36 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web09.31672.1644827194329297916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 00:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=PeXm1MaF;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644827195; x=1676363195;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uX+eeXcVTATZb7WC4Yn7lo95mf96jCWvEJLK4+Id7g0=;
  b=PeXm1MaFpJOAWLgf0ARktU/XnVLcQM7mYXqDjDZvGb1VfmtsdnKL3L9w
   GhIN76VrnIoknduHh+rwsHSzcT/1vsjSp4CTuGy0IivbUgaqZaeWqLkq7
   HvaH9Vo45v1ap4iUDhidf3PnUPo0ogrzfn4rdl2/W0VOg3BXSv7RNNwHe
   oBBVD9YeI9z72MVKr2Y+xGvVqnqC+mH2NNEBnjUO7CRMxVpDFYKRfJKgU
   Y3+ckia3557m1gQ7yZiNa53RyVV4q7W5wfN6Opimio/YzWeQ3ulxjaqda
   wqsChg3F4fWO2tCmx63wSLVaQCyg+xo+fTWt5lYz8qRy8LiOGEjx/aWYc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="310778877"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600";
   d="scan'208";a="310778877"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 00:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600";
   d="scan'208";a="495300878"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 00:26:25 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 14 Feb 2022 00:26:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 14 Feb 2022 00:26:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 14 Feb 2022 00:26:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCYgtpwvFOF4Z8I+HefJC4e20R9GryuGDojZFEp4/Q8YIErhPkhRsznxOH5Xlyq0q/9shhVLuUN6bITRmg61s+zo+OhEjQ1PAmThwDvCPpOc31TFlDq/tDfc9syG7X0qdqMTqJdLm1ctjItQ8dD9A4WWMQUUYKOShjN4pa+Ur7jPb9joOBDOIPrmO0T7PHro+TYgeUQht/6cvKqm4Qy06zagSc2TLTdwnlGeO/l+xhIakpW2wc+Lp9B4IC1yfG+WIH1GnMzLh+06s/pxs3HAsSmNluKXdIRF1+SBcIdO8OpTfMrmOVoy48a15BOmsMvpL3P7B1lZJikUFKjIS5wvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uX+eeXcVTATZb7WC4Yn7lo95mf96jCWvEJLK4+Id7g0=;
 b=Ta7TkxjFUpxAjzwrL8FIPKiWlXotuCY2kSneVOFKalpq8uOJAvd0D339hcGhbAcl2zu4uyQ7uN4+iRmSGjR3UzPkxJ6nsW+R7HQenYJFI1y9jkTKfvSmNGOZjlH02biEkdLEQ1JL39GHEFInlVg8yFtuwLseCaxqCGnFQ3eizdoUhmOnIWfV4bq50vxSXvfPX8QZKWSQwW2IslxKKLAhXcq5S/frWcAK48AzKC5LZxGeoiXfxi5PnVPDtBIwHmFexlPiVK7DP23ui3tjPN9ocQ7Pbwy3JflgzIydEtTvxB4H7aii7U3bzKMxCMdNn+iBnUkqI7iFDRv5bJiTC/L4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Mon, 14 Feb
 2022 08:26:23 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::fcf8:25a:89f:2006]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::fcf8:25a:89f:2006%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 08:26:23 +0000
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pgowda.cve@gmail.com"
	<pgowda.cve@gmail.com>
CC: "rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest version
Thread-Topic: [hardknott][PATCH] glibc: upgrade glibc-2.33 to latest version
Thread-Index: AQHYIXX4dZcXT6QjdkiZtqvyo80786yStiwA
Date: Mon, 14 Feb 2022 08:26:23 +0000
Message-ID: <598913e85781eee1989a7116c8c91747a14d5171.camel@intel.com>
References: <20220130062039.151292-1-pgowda.cve@gmail.com>
	 <CALY4984r-NMcFLM1tEO4ZhrySxve6Ye5Nxq7HCq5ufVaQYj6Hw@mail.gmail.com>
In-Reply-To: 
 <CALY4984r-NMcFLM1tEO4ZhrySxve6Ye5Nxq7HCq5ufVaQYj6Hw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9c1776c-8206-444d-152c-08d9ef93afa6
x-ms-traffictypediagnostic: SJ0PR11MB5087:EE_
x-microsoft-antispam-prvs: 
 <SJ0PR11MB5087366DF7E1EF1680B5815EF8339@SJ0PR11MB5087.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UorrG0ey9KPBgVjPHT4C2geLUgkO7F4/yDeXxcpQXsXy2WwTHyNBG5Y+WDIRaEfgJuT/fQXtyUuC3iEROXgqKv8IVP0mXKxKNWLmjn/f0R0U02gjJ/V4ZOsVf4VyL4K2L8CDMEgOW8ofkUNmDaKaG3e4/cmwA/Kk5NI/AFW7j6s1LAe/jxN7AFHKERw6yDoiCj6za627+kfrRQC0OZB9iHg77FIi9NfEYV30wu6SAxu/RuYLcWH8K3KHzerw4Gi1RMeWIvON4E+3tFkTDPgcI167ExVnD1Uk0vANE0udPuCEJLaVKIPsyzHHxKYWrETzibN+CDQGVGiSHxxTn03amdmWr2EZVnlbON2ItnTQtsLWmwEsVlrAmLug9OZxIc5kqcKleYeh/mc/EGw3IfjabXupHX0du8wWhzywHLWdx6aWsHUdljrbD/mvcADJrc3I4xhQhOCs9b2zE/Keebo9DcO/uHWR6EQDj4Aj99nXZTGyX4yrqejqZjr9Bo1uZ09+/hvX/kALyH/cpl3CzWn07zpWzp7gq0+6aaL5Jdv/fl5euDjm8AshpwHFHMeBQRV9uvszp2ZUq/0AAwatG3W1G+9HLicafsfiR+/p7gsAlVB5P1TPAzAjb4Lnk0lsUYNpe4rUsQo13vngm+hgBzF9mL0T8Rcu1XNi8iuN+5y12LnXb2N+tJ6mkEJGQpz/UVF9e6R0cuJjekqMoSpoM7vAFQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(91956017)(316002)(64756008)(4326008)(8676002)(66946007)(66446008)(66476007)(76116006)(53546011)(66556008)(6486002)(2616005)(508600001)(71200400001)(6512007)(86362001)(54906003)(110136005)(186003)(26005)(36756003)(122000001)(2906002)(82960400001)(38100700002)(38070700005)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VW90d21YYi9GeHZLSUpieU54VEg0MjVFWFdRem5UNzQvRTVwMmVxS2hNQXdE?=
 =?utf-8?B?QlM4aUN6cDZBQ0FKaGZyWnpVZW5LOGNmQlRmL3E5WFlkV0JzMi83ZlZzd0x1?=
 =?utf-8?B?M0F3MmIvVHhvN1dVUFpGY2MzWjdtWnlwVWJmMXExRThaajBIV0I1KzAwd1p5?=
 =?utf-8?B?eWdmeXNWcnljdlpybk1TVFBHbDE1YzArZVBMbllaMStlYXV2Y2VYQjN2MXd3?=
 =?utf-8?B?N2FmN2EzSjhWOTU0c0pxY2RyTFE5TFhZcXlJcGI0LzhwUzd5WTQyNFhDVlZp?=
 =?utf-8?B?MXArUGlHT254UnMwTFFyOXQweC9LZ0p5OWdQekZRWDRKcWh3d041TitHZ2Yz?=
 =?utf-8?B?STc0SGZXeEkvRm9kYTZtME96aktRdEZiNmhVUXFCVDh5L2doWlJ1TDQwZ09W?=
 =?utf-8?B?VnI0ZnY0cHZuT0ZMYTVtYUs3VEpLbWdxR1dPUUUyL2lveVNjRmV3SU0xK056?=
 =?utf-8?B?aHdvdzF1MmY3a3Q5bDF0RldCWVQ3bURFYTBrejZMVTcvY0JmdE5DY2VxRTRi?=
 =?utf-8?B?bjNoS1VRM3FwNlJZM1dNQVAwdzhJN0JPdDJMS2F5OHM3VkZ1VlFZeDIvTmRW?=
 =?utf-8?B?WW56Sk9DdVlmbnJyT0VjWjdmRUZhd0RLTzcyNmNHaXkrTy9IaERYaUJodXAv?=
 =?utf-8?B?ckgrTHVxUnk5K0dXTXNHNTA0TnlYQ2VnNTlrdjdrOFcvaC93SHhPem9GTlg5?=
 =?utf-8?B?dUlUTm1OTVNOVnV4NmtmMzI2eVNzVVpCaE5INmNMSWl4bkJIMU5aai9XUkpG?=
 =?utf-8?B?bkdnaU5XcDRtWnlXRlVaWVhvV1FtSTRFTTZmYnNGUFgxaUZTL3pCN096MDRQ?=
 =?utf-8?B?b1ZtQXlGRGdmZVVXeDR5TjlzVEp3U3RVVnkzNkRLV1gxeVpnc0NTMHZORHZU?=
 =?utf-8?B?TmljeVVWTnlPV0VpVVNZV0JWaW9UeEhnTnZrTElzVnRuR0hkYkg2Nk1YOHo5?=
 =?utf-8?B?NTQrWk9RZUZQZlVLTEN6ZlRGaTRKcWhMNVRJeU9hN0JZSStRS2F4amVrbFBt?=
 =?utf-8?B?SGZKeFJKMTJzVG5xTk9kWFM5Vnd0K3BLZTUwY0gwMjZqdWVCR1hTRGxBaVky?=
 =?utf-8?B?a1M5UWZ6KzhOM2liWGRIeHdRWlJhOEErRmJBL09MOWVNY0RrZXdRWWt3cTBw?=
 =?utf-8?B?cy9OTFhOelFFTUIzdUVrbE9GQmRjRGVWNElVWERnU256VW5RTng4QnE5aUxG?=
 =?utf-8?B?MVZuOTlLUzRiMG1KMW45N2s1aS9YT0cweExyd3p2QkVyVU9rMFcwL2RiaVdy?=
 =?utf-8?B?Wmp6L2ZZY1plYlNIZlRISWNIdnM2bFV6ME5oK2k0U1E2UVBBWHRTZDJCSko3?=
 =?utf-8?B?TjdUNnBtOGZYWHZzT2dlY202NW1hd29HdTBVOEdaYUFPbkpnS3RyaU5hZHpp?=
 =?utf-8?B?RCtwOWVXYWRpOFRtZzhHU3B2WW5FOElBRDhYeGw5L2Q0elRnM2hZVkk1YUhh?=
 =?utf-8?B?YWh2YklEVDZoOElodEVRYkl1dDRjMS9iNjk2dEV3dmRmRHpzRnhncWllMllv?=
 =?utf-8?B?dFdRUmV5dE1vNHRCMUcyOElObHlEU1QzR24vNnhSZFppem9qaFNZS29OQ2ZX?=
 =?utf-8?B?RFpaWVphWXpFOHNUdWpkcmhIUWFuazkvS2F2V1d2Tk10K0p3VUpUTGk5Q1l1?=
 =?utf-8?B?UTdBZW9ZSFNrOHVDR2pGYjl6YnRYNUlMTzRCczljRTJKZXNBRW5Pd1RCa005?=
 =?utf-8?B?WS9xY09MeVR2ZXNNaHFKaGovZXlhY0k0djlkU3JOWW1mVGVMbFp2RTNNSTVZ?=
 =?utf-8?B?UGQyanh2cDFxd2ZlRVpFTFFHK0c5aGJWbGE2d2FqeHhXRlVqK1p2WHlQMkpn?=
 =?utf-8?B?VkVnYmJlUjJ1T2VscjRxc2hjYWEvRjdkTVFhSDA0K1VhQVE4UTRvdVFsN29l?=
 =?utf-8?B?L2ZpcGZ4UUI0c05BVCs5YXM0NjlxaXRFSU9XYzFyWEVLT04yQWJhbWtHcVRU?=
 =?utf-8?B?SzJMbXBYeHgvNmQ3OUU3UjVaQWYrQ1o4dk8xMlVqWGQycTZxSGx3T2d6TGhJ?=
 =?utf-8?B?YWZRQVFVRXdiMmhQVVl2VG1PL2h2MmVDTEttZm9iMGttVjNqdEY0TXB6WGFG?=
 =?utf-8?B?TWdrSUFqaUx4eFJSamUzMEluTWFFbXI0UjE1OFpYZCtDVHdGWlZUMmI4bC9L?=
 =?utf-8?B?UVZ1dVNDWXlTWXpweVo4ajRBQ0dqMEVHZm9KUW5acjB2aUxXZ1RYWlkrZDFE?=
 =?utf-8?Q?zXACCyze+O5azGbyV0gSYVr/7XLLmq/cDAf+HGGKM2yl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEABE6A8C652F14EAC53564653415C71@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9c1776c-8206-444d-152c-08d9ef93afa6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 08:26:23.5139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 HFubV3P8KYC8SRrea33sO12B9z5NAYBnVUx23p1RtpbuXZpZ6ao65JmsfW7Qhv5Y8Kf7vnWJOs0Hkin6GykqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 08:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161696

T24gTW9uLCAyMDIyLTAyLTE0IGF0IDEzOjA4ICswNTMwLCBwZ293ZGEgY3ZlIHdyb3RlOg0KPiBH
ZW50bGUgUGluZyBvbiB0aGlzIHBhdGNoLg0KDQpJIGRpZG4ndCByZWFsaXplIHRoaXMgaXMgc2Vw
YXJhdGUgZnJvbSB0aGUgZ2xpYmMgdXBncmFkZSBzZW50IGVhcmxpZXIuDQpJIHdpbGwgaW5jbHVk
ZSBpdCBub3cuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiBPbiBTdW4sIEphbiAzMCwgMjAy
MiBhdCAxMTo1MCBBTSBwZ293ZGEgPHBnb3dkYS5jdmVAZ21haWwuY29tPiB3cm90ZToNCj4gPiAN
Cj4gPiBnbGliYy0yLjMzIGhhcyBiZWVuIHVwZ3JhZGVkIHRvIGxhdGVzdCB2ZXJzaW9uIHRoYXQg
aW5jbHVkZXMgbWFueQ0KPiA+IENWRSBhbmQNCj4gPiBvdGhlciBidWcgZml4ZXMuIFJhbiB0aGUg
cmVncmVzc2lvbnMgYW5kIHJlc3VsdHMgYXJlIGJldHRlci4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBwZ293ZGEgPHBnb3dkYS5jdmVAZ21haWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmMgfCAyICstDQo+ID4gwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmMNCj4gPiBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjLXZlcnNpb24uaW5jDQo+ID4gaW5kZXggNjMyNDFl
ZTk1MS4uZTFlZWZkZWU0OSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGli
Yy9nbGliYy12ZXJzaW9uLmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjLXZlcnNpb24uaW5jDQo+ID4gQEAgLTEsNiArMSw2IEBADQo+ID4gwqBTUkNCUkFOQ0ggPz0g
InJlbGVhc2UvMi4zMy9tYXN0ZXIiDQo+ID4gwqBQViA9ICIyLjMzIg0KPiA+IC1TUkNSRVZfZ2xp
YmMgPz0gIjU1Yjk5ZTllZDA3Njg4MDE5NjA5YmQ0ZGNkMTdkM2ViZjQ1NzI5NDgiDQo+ID4gK1NS
Q1JFVl9nbGliYyA/PSAiM2UyYTE1YzY2NmU0MGU1ZWU3NDBlNTA3OWM1NmQ4MzQ2OTI4MDMyMyIN
Cj4gPiDCoFNSQ1JFVl9sb2NhbGVkZWYgPz0gImJkNjQ0YzllNmYzZTIwYzU1MDRkYTE0ODg0NDgx
NzNjNjljNTZjMjgiDQo+ID4gDQo+ID4gwqBHTElCQ19HSVRfVVJJID89ICJnaXQ6Ly9zb3VyY2V3
YXJlLm9yZy9naXQvZ2xpYmMuZ2l0Ig0KPiA+IC0tDQo+ID4gMi4zMS4xDQo+ID4gDQoNCg==

