Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC3EC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 05:32:54 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.6718.1651210368763609341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 22:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dcoe7v/w;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651210368; x=1682746368;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hnbTK8uPq6B52y/0aIK85NjUivaO6YNjudRjK4ftZXM=;
  b=dcoe7v/wMVqtQNCEvNPa9b2kTHJwPEXn6aA28zLo+EZFR/jlwhIm1MTi
   5wQN9ypRNYqL5Zfm2LicySUvD+H1c7QT1+wNnSXUZR+D7a6ZcYH2aOlXb
   v8WFSqwGbB2TQ8iA4n/f+3P2sLxBjkpMPoQYbTTxWmH4EMU0CSMS5Zm/o
   phKwXYY10ahGzQdbmivE5KL/udwSQwdk/hyHJ3UvSU3TW0dUD2VyILrVZ
   U01iLBZouIj+VzVQaShsfvnO5N+5KKgaKwvxRBbFXWrdM0qGwct/XgGiB
   BABKBRcx1iXG2CNTSJNLpnO7JNRUv+5G+s8OPHExDv1mLQVQv7plynjjh
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="253921392"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600";
   d="scan'208";a="253921392"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 22:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600";
   d="scan'208";a="514665592"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by orsmga003.jf.intel.com with ESMTP; 28 Apr 2022 22:32:47 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 22:32:47 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 28 Apr 2022 22:32:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 28 Apr 2022 22:32:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 28 Apr 2022 22:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SisH2jUohIRP4NocnYUNhY1lf9sCum5jajlQ9K8XuhETVxbJcIujo0HaNqpl/vbRY8ks6TsdaZpvWu/g6JN/Z/za3Vbuhc1z2GnRNBnrwxr5cZyzBErLr4ARWg5oSVORDv8Jz2nBKJBajvJVaz862CofKFulgAwAI4zc/Z8fS6NoMKfbi17oiDmE174u6c8p9uscXdr2HzJj/zf9Z4q4CF1jS+oRc9ixwnTwa78tYSTEsHzRro49ZurZIJzxV68oGnWjQf6CkpmuQn0Muvw50zx4VPF6pm8EfMWVN1K5koPJ28I8xjbw8wlKpJrjmt2SbHLads3/VmF+Ch6DJfWIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnbTK8uPq6B52y/0aIK85NjUivaO6YNjudRjK4ftZXM=;
 b=BU/A9SvPMl+T9SjsAXvSMzXheF0X895OhhGvYlPPfqvoDBmYZa2BVyRl6pwjx9eZvsi6Uk+5FeJGKdbmTjVPfgXkJe/BAZ8fWdPC9+T+ruWF4Q1apYN44hfMyAA7BH0Xaravo1MYyMMUkammZ31A0eq8Vx1NWr1G5uTVhgIy5qfRj/oJ9uvixv2RYDt1t5y5Ww3m3K1euwPsgtCHuVCDsseueAUAy8YgcdtD0ed7euNKPPpeI73sWo99NmU57DgVmo3QeZhqc/cmXepvVICrBeOeiPh1ysK3jPjldbogNE/Emqf0CZ5jzHoMMdQiC2naaFYODHrswPsYPIryuSBISA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 05:32:44 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 05:32:44 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.16.rc1)
Thread-Topic: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.1.16.rc1)
Thread-Index: AQHYWVxaj3E3gP/+AkWVx8rHFaIFJq0CGLsAgARJfoA=
Date: Fri, 29 Apr 2022 05:32:44 +0000
Message-ID: 
 <DM5PR1101MB2348A19B6BC4935A96FE48A4BBFC9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101018065844051-3f135aa2-6cb1-485c-aa27-2c921567884b-000000@us-west-2.amazonses.com>
 <3c965c4de0252fed6b817deec761713addc6fb5d.camel@linuxfoundation.org>
In-Reply-To: 
 <3c965c4de0252fed6b817deec761713addc6fb5d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.401.20
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52fbd40a-660c-4096-7918-08da29a1b027
x-ms-traffictypediagnostic: PH0PR11MB5045:EE_
x-microsoft-antispam-prvs: 
 <PH0PR11MB5045996C4EF46A674DB75791BBFC9@PH0PR11MB5045.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BDtRUGYILpEOeyRgvgKY3EBcAjBYHgYNJ2zhnbzJanwEXH24FpPdN1fVtZEXbgo9HJIE57+xKWzGSDzaCCrM7SuxBtE7TYET0tZ+8wE/qVuxtTGtYZqijK9bu6x/C/N/KNSYxNn6tiK4PJ/4jZ2WdEsr2lIEQERGxS9zAOj7erpmayn9lzVDDRoJKqv1QvXjvF3m8k3AgTVTxOno2p+WMruezzD+5xjibtdmwr0dhDFIKYHA0wrSnW7yKh/fz/0ThjOKw7lsKqNn3kfNlqSuDXG3D2EWUaRA6oShUSOeGBXS3bmTCJK3AyosLQv+SP2CoQE59DJ8jj8AKMFXfY9klDTFKABH+BZySA3Y4GKevdVkTSMk5cCMTx3urgjY2rwrvOFbu1udu/2d8Y6X+6ADCf8pkdDuYGKh79BI7TWVozloZMuhRGnbMAomgLsv/ybmJOyvObcj+iSpO2gy/eLB/Unds9/JyjqjxSWJSzx184wv8u1USWPFcguY2BWwF1MHeLN+laN9qKm8oqH1M4klPsB19nMNc6buMuAm0a8z3yWFb4ogjx3qK1jsH2muGLRtIZM5cPdWQYYJ7riStno1HlFHpc2fIAHcHbeZReVmbbrKYjkEtT6+BxZU/J3EF+ZNzalMkeff9SIkq6hOoQRnQ54niYDmvogoJkNWRSbOZNEuzRMwxkn2iyWdKm2wsYvzvm4uiYxc3IXPt5wY05En3hVDFOwx4pxRnHdd+BEjTVvuRyRfK+Jl0eK0bZFn/698grRhRzlc5tLHxWGaTtYYS0UYkkYogaNiTY6x2Y8hhkiFEcV3qBVPg2gVVTIDjur3Ba5G0nKOlFWRDIjaCJtTjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(7696005)(66556008)(66946007)(5660300002)(33656002)(2906002)(316002)(66476007)(76116006)(55016003)(52536014)(8676002)(66446008)(64756008)(83380400001)(15650500001)(110136005)(8936002)(71200400001)(86362001)(966005)(508600001)(38100700002)(38070700005)(82960400001)(9686003)(55236004)(26005)(53546011)(122000001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THFTaC8zVmlVZW1sakZmL1dDanhaUEtFQ2swcTNGRHZKdXpTYjZqYzVHWjhu?=
 =?utf-8?B?MjM3QXJ4WmpGWHVEVFh0b1pQUDZxZFpKUUxqYmxSN1NBUzM3NnQ5MFc5L2lE?=
 =?utf-8?B?VWxLdUlJb1RlZDcyVjU3a3JqNUp5aEhzdU1INi9tQ0hPZkRtam9lWmwybnJ0?=
 =?utf-8?B?YVB2RUhYVWFPOU5yWlRiNXVwa1Z2dUlUaGNkelBraEp1REsydHFLM3o2QkpO?=
 =?utf-8?B?OFl6aERTbmc0cTArenlJamxsN01TUS9jRkpVSnJ1cUZCSDJaWlpzZzVNeEJ5?=
 =?utf-8?B?U0plQ1JsOFp1dHJQUFMyMGtxSU9RQTRBb0FYYmc0eDJxOWtoV1d0azZaK0s4?=
 =?utf-8?B?UldUYmMzS0tOZGszck92QVRuYUI4cjdUeU5ZcXVydTExQVMxSjgxSnFZMEI0?=
 =?utf-8?B?UGREQ2xFRDQ2Sndmc2dNMGJEeWRBWEhVRElVZCttakxoZSsxUTNybGxPT0dY?=
 =?utf-8?B?QTZXUzJhekozTXhoeFpleVYyYitDd1FXaXJyV0RLZnhSMGNyVFF2REh4alZL?=
 =?utf-8?B?cktMMmUvNEl4b0ZFdFBYOFNjWUphcGo1d1NHZkZxeEVnUTdZT1MrVVA3ZHVE?=
 =?utf-8?B?dWEwTGs3UXNLS2JDWE9FMUU5TG1ITWRYMWZha09BYWhpRUUvQ2xQTXpCTzdQ?=
 =?utf-8?B?aVViSXFsVEdHMWQ5Q2h0R3N1QUlzM29NdWRyNXFLdVQ1dFJxWHZrK1RvdmF2?=
 =?utf-8?B?TCtJV2FEMWJyT1c1T1lkRTVmT0Z5TTdBZ09SeWVMSFFwamJucmFXNGJqL25x?=
 =?utf-8?B?d3NWZDJqWTRyV2Roemd4c3ZHMDFkUHBaaHRmQTNBYWwyTnNEMlVZUWVqNnJo?=
 =?utf-8?B?aU9DNkQ1aHpFd21LVDkyVjFvZWtNSWl2eWJ5UlE4TGhJWk5MeE1hcnFPRUpL?=
 =?utf-8?B?TisyaldHTzV3UHJKb0dxYnJQZEZta25sSXcyUUFBWFRlQnIwT2VzMU5GVzBu?=
 =?utf-8?B?MFowRzFKaGtQRTAxLzRFZ3lUcTZpbW5WNm56S2hEd3dEQ2U1UVJSQUJoZVA4?=
 =?utf-8?B?bkZMdmloYjN5S3RTUzNSZGhtc0tic0IwOXFpeGw4MTJzMWsyZUVvZTUwTzR5?=
 =?utf-8?B?d1NnZTE2WlFkc0dKZHJ1WlZnc0JZSnFSZHVqS2NTaUk2RUFwQlJZODJkYUlM?=
 =?utf-8?B?TlRiZGVIS2ZpSVJ2aDZEQWRPZFo0VldTSzBoaGNFaTRRMjZNZ2xubnJjVGpm?=
 =?utf-8?B?aHh6QnpnMmEzbHpLQ2FKU1RRMTdQQzJZcC9rR0NKbk5KdEthd05jcTRPWFZB?=
 =?utf-8?B?cEtpalZCSGZJNHQ1aXp4clJtSjlOM0hxc2g4dVR0TUFoanh1d21BR2dIUEtr?=
 =?utf-8?B?dTR3YkozSUIxRkVmYmRiQ3BIL01pK0V4M05zTVFvTGUwdmhHaGIzRDVqTEtN?=
 =?utf-8?B?R2xIMVd3a2pFd1MvemxaUWEzRHBpNnJ1SUgwbG5iS2g2KzZ4N3NGT1I2dDhB?=
 =?utf-8?B?SGNqekRWUXd3bjZteVc3aFRlYkMxeldIVlRYMDNudWVlRkJqc2hIUHczNk9l?=
 =?utf-8?B?bUVvNFVDbjFja1pvNm13Z3VYYStLNDFlK0YrekJsc0kvSHhwUm02YXpRUjd2?=
 =?utf-8?B?ZytkNHU4NzZ2Tlo4clVJWVFWK1lTVHJOWCsvSDNvRDBvVndMWGRsZVdyR0xS?=
 =?utf-8?B?L0FsNzZqaEtVaXVoTGNvUFUrNnQwcmF1cXdYZEREVjNreCtUb2F1RzdJZGI0?=
 =?utf-8?B?bGhtTGJXRzFISFpUNVdIQ050UHNiUzRlbVlwNWtYazZDSUFPZytuSWhCcHY1?=
 =?utf-8?B?cEF6TUpMU2tMVTN2SHhDMmljbjFGVzJ3Y2dROFp3MEFmQVB6cUkyRHlTeThK?=
 =?utf-8?B?c2grYmVFSGo2Qjk3dEE1ZVJZZ1FTUXdNQ3RwcVMxdUVVK2ZkK0tyTkJtaFhK?=
 =?utf-8?B?aVVDRUNlOGh6R0N1ZWQ4R2grZWFPR1dJTmREYnEyRE0zV0VzQksrZHpudVBo?=
 =?utf-8?B?SlFIVmN2Rm9QeWlQaTNnb0RoS3FlUmdFd3lMZjI0ZVVOYVB5M3ppRUpQdW44?=
 =?utf-8?B?d0c4QTVnTC94ajcvR3k2NG1CK2YyTnFQQ21nOVJtejhnV0s2TVArMS9pdWh3?=
 =?utf-8?B?TVQzRkkwUElPbEtwdkl3RWpvNGc0MEYrN3FWZGhIYXc3bzlta2tmZlBsSU1I?=
 =?utf-8?B?UGg0NW5rOG5VSmhkK2tiY0lxUmo3VGJvZHRtVHBldzdHSUtkZUg0K1huN2x1?=
 =?utf-8?B?TUpoRVlUbFUxZVZReDRvM0dWWFAvWmpLM1RpNXA4SkxYSjZzNlJnOUFxQi9Z?=
 =?utf-8?B?bytMMzN4WDRudW5rZjRWZmRuak1naUczNm1FSndYWWdIa0FLMlRhMjlFYTRX?=
 =?utf-8?B?S1FQeDRiVHAwNHIvUU9zY1ZLRFE2dHJOVzR4KzlvQklyc3FlMXNwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 52fbd40a-660c-4096-7918-08da29a1b027
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 05:32:44.8040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 LFSaKPJ1PQR1T4VEG5W0SubLhN+vE/oEYL1pcNPjK5MSixEVZdXd/tCVi3BKSzyhutKgiZKYD87/2fuBouzFtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 05:32:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164991

SGkgQWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjE2LnJjMTog
IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRlc3Ry
ZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09PT09
IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuDQoNCk5vIG5ldyBp
c3N1ZSBmb3VuZC4NCg0KVGhhbmtzLA0KSmF5DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8eW9jdG9AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IFR1
ZXNkYXksIDI2IEFwcmlsLCAyMDIyIDg6MDQgUE0NCj4gVG86IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyB5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IENjOiBZb2N0byBUU0MgPHRzY0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPjsgU3RldmUgU2Frb21h
bg0KPiA8c3RldmVAc2Frb21hbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBbeW9jdG9dIFtxYS1idWls
ZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkDQo+IGF1dG9idWls
ZGVyIGJ1aWxkICh5b2N0by0zLjEuMTYucmMxKQ0KPiANCj4gT24gVHVlLCAyMDIyLTA0LTI2IGF0
IDEwOjU2ICswMDAwLCBQb2t5YnVpbGQgVXNlciB3cm90ZToNCj4gPiBBIGJ1aWxkIGZsYWdnZWQg
Zm9yIFFBICh5b2N0by0zLjEuMTYucmMxKSB3YXMgY29tcGxldGVkIG9uIHRoZSBhdXRvYnVpbGRl
cg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPiA+DQo+ID4NCj4gPiAgICAgaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tMy4xLjE2LnJjMQ0KPiA+DQo+ID4N
Cj4gPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiA+DQo+ID4gYml0YmFrZTogMDc4NGRiN2Rk
MGZlZjZmMDYyMWFkOGQ3NDM3MmY0NGU4N2ZlZjk1MA0KPiA+IG1ldGEtYWdsOiBjYTUzMzA4Zjg4
MDNmYjUwNzA5YjNmMTdiYjFmOWU0NzYzNjZiYjYyDQo+ID4gbWV0YS1hcm06IDVjMDk2ODQ4NjNi
ZThlODAzZTNlOTg3YTVjZTQ5NDA3MjFjM2YzOWENCj4gPiBtZXRhLWF3czogOTk3OWNmYTY3NjEw
NWNiNjhjZmFkZmRhZWFiZjA0NGQ3YzkxOTMxOQ0KPiA+IG1ldGEtZ3BsdjI6IDYwYjI1MWMyNWJh
ODdlOTQ2YTBjYTRjZGM4ZDE3YjFjYjA5MjkyYWMNCj4gPiBtZXRhLWludGVsOiBhZmZkYTEwNzI0
ZTVlM2M3OTQ4MjAwZTg4OGE5MWZmZGI1ZDMyYTExDQo+ID4gbWV0YS1taW5ndzogNTI0ZGU2ODYy
MDViNWQ2NzM2NjYxZDQ1MzJmNWY5OGZlZTg1ODliNw0KPiA+IG1ldGEtb3BlbmVtYmVkZGVkOiBm
ZGQxZGZlNmI0YjI0MTJjYzUzNmMyNjQ1MGNlMTI2Yzk2MGQ4MTA3DQo+ID4gb2Vjb3JlOiA4ZTgx
ZDM4MDQ4Yzk1M2QwODIzYWJmMDRkNWIyNTA2Y2Q5ODhmMGJiDQo+ID4gcG9reTogZjE0OTkyOTUw
ZWI5MGRjMTY4ZWI4MjgyM2FiNjk1MzhmNjY4ZjhiYw0KPiANCj4gVGhlcmUgd2FzIG9uZSBmYWls
dXJlIGluIHRoaXMgYnVpbGQgb24gYSBuZXcgcGVyZm9ybWFuY2Ugd29ya2VyLiBXZSd2ZSBqdXN0
DQo+IHN3aXRjaGVkIG92ZXIgdG8gdGhlIG5ldyBwZXJmb3JtYW5jZSB3b3JrZXJzIHNvIHdlIGNh
biBkZWNvbW1pc3Npb24gdGhlDQo+IG90aGVycyBhbmQgYXBwbHkgdGhlIGRhdGEgY2VudHJlIHBv
d2VyIGJ1ZGdldCB0byBvdGhlciB0aGluZ3MuIEkgZG9uJ3QgdGhpbmsNCj4gdGhhdCBzaG91bGQg
YmxvY2sgcmVsZWFzZS4NCj4gDQo+IEknbGwgd29yayB3aXRoIFN0ZXZlIHRvIGdldCB0aGUgY2hh
bmdlcyB3ZSBuZWVkIHNvcnRlZCBzbyB0aGlzIGRvZXNuJ3QgaGFwcGVuDQo+IGluIGZ1dHVyZSwg
dGhlIGlzc3VlcyBhcmUgdG8gZG8gd2l0aCB0aGUgaHRtbCBlbWFpbCByZXBvcnQgZ2VuZXJhdGlv
biB3aGljaA0KPiB3ZSBubyBsb25nZXIgdXNlLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFy
ZA0KDQo=

