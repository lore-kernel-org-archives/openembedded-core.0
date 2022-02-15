Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B5BC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 03:20:43 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.5367.1644895241744552812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 19:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kAHL7V+A;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644895241; x=1676431241;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NFL1V+UNRinsMO4vu+bGkbDfuoxGaaesvq96D6fR9Yc=;
  b=kAHL7V+AKHVaejdXDtwJffNcorUojlHLKe0IlytO+1BtK2+mHwaV2vH2
   2ZexKlPVBmp4Fe0FOzjKxx3OpDMpOWfsvxWdQvLL0MExzSG/ZyeetECwC
   f2F2070hRookTchv/QJ/fqtVitDLx3WF3XHbuGJed1i2bd0BnDSZUsB4t
   vzlZ+yjQrzLoiiv99FB2X2qPS2zMD42JkCrZEJA+kJCB/B8A1d5Pvh1qT
   APzgZTLfqQ9NGApngxr9rOBSLiTdX45ZahGI7Q30gBI84YDNd+XjE605/
   WMV75EZ8OTjb1ObRwXBFJ6PZQZs173ZhXIZQzqXHrJ6pUtKmCY4hMjsAW
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="313513283"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600";
   d="scan'208";a="313513283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 19:20:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600";
   d="scan'208";a="632504763"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2022 19:20:40 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 14 Feb 2022 19:20:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 14 Feb 2022 19:20:39 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 14 Feb 2022 19:20:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKXIkolrKAlUcP2tW2EXada1W1FOr6d6Jcfj9eoLIGZpbbx1syf7wbMMl4CePfgWrxyCAK8f30AnwtuPVHiKUUzXfD0vNDuEbtKXkNrbVgpmmHSZPr9xBA1zukaJ3mGfnHtDhIHiNfVQYtI4NjKMadJcPwWDxBDvMk09x+S2xaBYjhyaxMjHBXNTMiKnVHG952ayVhstPfGtb6BQcUBW6mF9oPlkdOw1kGoEZ2D7GAl3pPq79rkLFjdAXP5ARgFypkoC9gibT6MQ1evx1OmfkmRw2upDmFHQ+y0c/m2KVdCJslg3KiZ77Cf14gKpXRcjZGT0Vqxmt07lGs2hfbE+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFL1V+UNRinsMO4vu+bGkbDfuoxGaaesvq96D6fR9Yc=;
 b=JL6+an0CIq4mjwMZwrA9FFS/hruzL78TzBSwuJ7TwonS8AENGdGpbDntigt2YbiTa3ISMLPcbc0Bu9DtyualWSPvkTy14l+QZy16bBK/9ZxBiKiqmO1ITsbOLjQ3PfghHaEGXOcV2GE3xLnI3lkVqcpRYbkT8+yWixvUnlJU/uOufOJKo6JQz5kS2BsKr89miRU83VC5L9rdeLoyOw45Y1J3JEm5WxjehslkLOU47F1amEWxWGgnLoowDF3erX6E72q16u5INl0zrSlfj/vyOPqH6WedUnLIQjIgXL8fqEBBFa61gM/j6+9+ar4YMRnTkKG7mADSJDWdkd5x1oxirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by PH0PR11MB4853.namprd11.prod.outlook.com (2603:10b6:510:40::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 03:20:38 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::3caa:2b5d:2d52:8643%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 03:20:38 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-3.4.2.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4.2.rc2)
Thread-Index: AQHYIdIxgVJb038rrUysslIEu+1rWayT8gFg
Date: Tue, 15 Feb 2022 03:20:38 +0000
Message-ID: 
 <DM5PR1101MB2348E53B5F062E679B0A7069BB349@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <36320b3e89d2e21fb911f956d8c2cd21dd2c62a5.camel@linuxfoundation.org>
In-Reply-To: 
 <36320b3e89d2e21fb911f956d8c2cd21dd2c62a5.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7959e1d0-2472-4cdd-0e8f-08d9f032237a
x-ms-traffictypediagnostic: PH0PR11MB4853:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB4853634A620ACA43F3D0ED30BB349@PH0PR11MB4853.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nSqKA07qjS5P2yjZnnI2ulw41RlhRhgGKYz1r7SNEX26F3nipOZcSw7ahWhJK9fJ7WMIudKpGCQjVjeKvcNYZswNNH5yrJLuDSVYEn+S7MQ10NBO+xmEnXjh4FA0ahaf/I/FLg3yFynN2XpNmmh5QKsWW7nWDjRHuBjmaRf+sIL0gQjCpDIgnPPj0FqUv8bbUkca8eQq6HtU4YaJZJ3osrJ2SGOtOi58ZJMbMUpEGm3GNHCW63gbQ7j/NyWgBsm6ODLUcZYRWaODHg07NTDSnpPaEEs4hOeDjsMTTyCkoN52KiwRRKSz+WYYgVPOuXXxhLOuiOwF06tkV8qh58kDlsnUnINa/rLsHgSq/rRC+aARQzctw1cNCBTbeexEzv8jLkxXAry/gjPjHr06bnE0v7qa4nc7CbanwEGyw3Ev6HW0RV4Mi8y3P7t3AHAimn3FiQKqb7hSeLXjU/xZ6fW+nLZRve2K9k1UMyIXXnhX5xI+qC3Z22c/nrl7jpxb31k//GAjET+V2U6Z4HaLk1nczGWOcBL065r4HTECMZSM+26fICU3ozAFThzzlHVvUTWzNswmzFcx80rg8ekfinDJfTOtQcTlDBHU3I/rPicZ9uXFW4G4wkKlHmSgQYfDy/UHzC6lawC64227Joa6sPnLhTh/SQcjm2ZvOFtptshqR9AkKpZWhaa1yufwDAROvpgRRtdA5lye/2SSbWKcvPleRxHyEDzg3WfBRb61eqgizlZfHp605S0/1Uoqnmb8+v2O/k81pG/lKR4SSRHlDKxKi1D9gWUTG2MtnNL0sQ6VwVWw+TLji/eWrUb1prpeSnmKHPPBuDOHfD3BgPbs1bKduPGkh5go3nybLs33+7gh+BY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(55236004)(82960400001)(9686003)(6506007)(7696005)(966005)(53546011)(71200400001)(55016003)(83380400001)(508600001)(26005)(38100700002)(8936002)(8676002)(86362001)(66556008)(76116006)(66946007)(15650500001)(64756008)(66446008)(66476007)(5660300002)(33656002)(2906002)(52536014)(316002)(110136005)(186003)(122000001)(38070700005)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L01VV2tPSVExb0xCcHB2ZjV0bS9sWU12V1BnTlkxYjVxRjVzTGxaaEdNbVlK?=
 =?utf-8?B?Z0creE9wUzFmM0pSazJnai9FK0tWMVNtSFF1TU5iVEFzdkFpUHhneHljMFZ2?=
 =?utf-8?B?TzJ0OEVFQWJKQy9reXhITnVVOFlDYWVYNEZTcmppRjhmM3ZTRmFFbVhIakYy?=
 =?utf-8?B?M1d5bXRzN3g5MkNpOTBuWDlHZ0tWS3FOMVRqdE8ycjBsS0JtV0lLbHVReXg3?=
 =?utf-8?B?R21Yak5wNDlMZmIzdWswT01GVWVUMGlDY1NQdURaUmkzNmtnb0ZFNHhjQUNG?=
 =?utf-8?B?MVQxRTE4MkpFWWRPK0pUeFVHL1BVQmRSbHcwUXo3QlR6RURYUndwV3Y5OHR6?=
 =?utf-8?B?MktLdjVoeG5nYkZIUUwzdGplT1Y2NjhnYjIraUhFR1kyZk9ramJLNUt6cmtT?=
 =?utf-8?B?aEdKMnlkR2V4clBEc2ZEWW1sdjV0b1hpQThGVVNQSlE1blBGK3NoZ0YvY25M?=
 =?utf-8?B?RlhVa2RDQzdPUkJsemxnUmd6ZUswZnRmTVB0QkhIUGM0N0JUUGw3QXJ4d3Rr?=
 =?utf-8?B?UTV6b1lQKytOSzVQMTFKbDBmTGlJN1IyWHN1aXdFVy9MVktxdll0ZzVxczVp?=
 =?utf-8?B?K2xlYkYxZjJqY3dTMXdNUWU5MkE0a1RYS1NOdkZFWXU4WnplQWlab09iRE0y?=
 =?utf-8?B?Y3FNSmRLMU56RjJOQ1pkSC9XcjBrejFrcWRhZTlvY2FyMk1PSEtOY21ncVMw?=
 =?utf-8?B?K0xDc1FCU1dVRk9GNjZOVTZWTU5PcHVDMjFTTjRjejZMWUhsUDZNdExFYnBD?=
 =?utf-8?B?eE1oK2VBQzdpZUh1V0N5bG54WU1kbWlQWXNlMGlocTlpUTBVUW80M0hleSth?=
 =?utf-8?B?Rm9jZ0NmSjFDQjFhaE5kVHZ5YUdvSUhYY3RPdTFKSGY2RGlQNSsvWTNBMFN3?=
 =?utf-8?B?Y29DNnZuQTRwVWlTcm5PdTdGQytYY25WS2JYeE5QWEFKYlFET1FuOEE1MTA3?=
 =?utf-8?B?NVlFZFlKd2M4VE51eVRVam5rYXViSjRlWEM4V2N5TnpTUGIzUnZVUGlSQXNw?=
 =?utf-8?B?Wi9IMy9rTFUwcmtBYUpueHljV1pCRlZ4M0hLS0U4R2J0RmF1eG84ME5OL095?=
 =?utf-8?B?bW1EM25nclllNVh6MmlpVWNGNDl4Q3hRdUNEQWpsR0xEbFBVeHR2WDBBbjFa?=
 =?utf-8?B?VkpXWnFEWVJaaU9KcVJ5cU1yaFRtNG1Nc0JpYXpkazlreGU3UEhVeS9wa2E2?=
 =?utf-8?B?b29rZ2s3Q2hLL3RQdUVZdlB2Y2F1c3VhNHVHbjFkTy9BVWlOdU9yTURQZzNT?=
 =?utf-8?B?bmg5TnhsajlhaGo5T0o4NVVKbmxjZ0Nna21PaDhQZGN4UmJZbHQ2Tjc4a0Yz?=
 =?utf-8?B?SExmcVdMbmFnaHVvZDJQd3B0ZDRvMmZRdHRXNWRtOWNJZHFWbkhJNEdWTVQ5?=
 =?utf-8?B?c3c3VEEzTXR3YlE5WUtOUklJQWtzMllEYWIrUG1vU1FMTVJyMmtQTkllRHNP?=
 =?utf-8?B?WFllSXd3bmdvNVRVenBNcEdiaWdSRTlnNk1mU1E5K3NYM0tXem1kTVN2NTRB?=
 =?utf-8?B?dUhPQTRYQWZTT0h0Q2dhNTd0QjJ6Q1ljSFMzUFlzNGlWa2s3SS9Beks5eXZk?=
 =?utf-8?B?L2dSSWV6d0NXQ0tTV04ySldNRnBFUlJhVkdWZkpMQ0owRlhWL1hPT2hJN2t4?=
 =?utf-8?B?dG92M0JXbTIya3BWeVFKMVU3WjJlUjNwSFUxSkRBeVJpSkJjOUovZUo5S1NN?=
 =?utf-8?B?dFp0SDlZcUF0bzBWQW1EdXBsYkFFYm12NnVGTThkbEVSRDNlNDZnNU0wbWl1?=
 =?utf-8?B?U3FMYWRMVFduSmdxNFBkTFR1dHp4ZmF3RytEbkY2L2Vndm5KZmtrTnFaQnBr?=
 =?utf-8?B?ZFNuMWZDRzVCQytxbjh5cVZSOUI4Mk5rNE1FYytoTHRmUW1TQThEaGxzSFVH?=
 =?utf-8?B?alplajBVYXB4Q2tNVDlHL2grOEtxdmh4SGdKdjBRNXdYRHAvVXdaWTNrdTBw?=
 =?utf-8?B?Sm5aREl2UTR1cU5ydzN1SmNqYlZNU2JFN3J3SzNhQWNqNG95VEZWaFpScG90?=
 =?utf-8?B?THhUU0NSVndWRitraEI5SDZhbmdiVTRmU1NPd1J5SFZoam9WN0o2bnZtV21x?=
 =?utf-8?B?dTZrQWhoZkVhVHIyc1kzaVhkQ2g5QmN3VUJtM09nN1JrSlZSSlhlMkFIWHlw?=
 =?utf-8?B?bEVGL1ZjSXhxdFliMWVTTUN4M3c4bHEvNncrUVRqdDQzNGpxcmRuQkI3U1NV?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7959e1d0-2472-4cdd-0e8f-08d9f032237a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 03:20:38.2618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 +6B4RTNIFNcu20mbXOmvuBKiCs3g3359fs58z3Tniax2RHEjw1Sl3p45nh5KeY1i7kqK+ljovVMbrlnlCAmWsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4853
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 03:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161740

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tMy40LjIucmMyLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0
ZSBmb2xsb3dpbmcgdGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRlc3RzIGZv
ciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQoNClJ1bnRpbWUgYXV0
byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KMS4gTWlubm93VHVyYm90IDMyLWJpdA0K
Mi4gQ29mZmVlIExha2UNCjMuIE5VQyA3DQo0LiBOVUMgNg0KNS4gRWRnZXJvdXRlcg0KNi4gQmVh
Z2xlYm9uZQ0KDQpFVEEgZm9yIGNvbXBsZXRpb24gdGhpcyBGcmlkYXksIEZlYiAxOC4NCg0KVGhh
bmtzLA0KSmF5DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHFhLWJ1aWxk
LW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0NCj4gbm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRp
ZQ0KPiBTZW50OiBUdWVzZGF5LCAxNSBGZWJydWFyeSwgMjAyMiAyOjM5IEFNDQo+IFRvOiA8eW9j
dG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+
DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBR
QSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBidWlsZCAoeW9jdG8t
My40LjIucmMyKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tMy40LjIucmMy
KSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0
Og0KPiANCj4gDQo+ICAgICBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvLmlvL3B1Yi9yZWxlYXNl
cy95b2N0by0zLjQuMi5yYzINCj4gDQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiAN
Cj4gYml0YmFrZTogYzAzOTE4MmM3OWUyY2NjNTRmZmY1ZDdmNGYyNjYzNDAwMTRjYTZlMA0KPiBt
ZXRhLWFnbDogMWE4YWJjNzBjNGYyMzM5MjAwYjYxMmQ5NmQ4MWM0ZWVjM2FjMDUxOQ0KPiBtZXRh
LWFybTogNTFiNzI4YTUyYmRlN2M2MTNkNTg1NWFmZWFjMGZhNmEzMTc3MWJkMg0KPiBtZXRhLWF3
czogYzkyMzQ0OTM4YWI0ZDM3ZGU4YmQ4Yjc5OTE4NmRiYmUzMDE5YTA2OQ0KPiBtZXRhLWdwbHYy
OiBmMDRlNDM2OWJmOWRkMzM4NTE2NTI4MWI5ZmEyZWQxMDQzYjBlNDAwDQo+IG1ldGEtaW50ZWw6
IDVhMzBkY2VmYTU0MDQwZGQwNTA5OTU0OWE1NjE1NmE4MzI2MzU1NGMNCj4gbWV0YS1taW5ndzog
ZjVkNzYxY2JkNWM5NTdlNDQwNWM1ZDQwYjBjMjM2ZDI2M2M5MTZhOA0KPiBtZXRhLW9wZW5lbWJl
ZGRlZDogYzA1YWU4MGJhNjgwODg3YWM5MjRjMjE1MzYwOTFiZTdhMTE3MzQyNw0KPiBvZWNvcmU6
IDQxOGE5YzRjMzE2MTVhOWUzZTAxMWZjMmIyMWZiNzE1NGJjNmM5M2ENCj4gcG9reTogZTBhYjA4
YmI2YTMyOTE2YjQ1N2QyMjEwMjFlN2Y0MDJmZmEzNmIxYQ0KPiANCj4gDQo+IA0KPiBUaGlzIGlz
IGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXIN
Cj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4g
RW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiANCj4g
DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM5Nik6
IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRp
b24vbWVzc2FnZS85Ng0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9tdC84OTE0MzUzNi80ODk5NDYzDQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9s
ZWF2ZS8xMDQwNjgwNS80ODk5NDYzLzcxNTM4OTk5NS94eXp6eQ0KPiBbamF5LnNoZW4udGVvaEBp
bnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

