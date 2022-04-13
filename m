Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77E5C4707A
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.3385.1649833183366516743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 23:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=H8z/40Of;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649833183; x=1681369183;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fFUUxKwOZB3dGho23QYImVHRUlOuok087Kyr+QP8xvs=;
  b=H8z/40OfkMD3USG9lrw5K8ux0Cq6/cYN27I9cBpG5FSoycjxOlUOGnHV
   8bjyVShWk4BxnhJmvG4FvREEvQ5NrHnaqDDXceorJMt+sAJSlD0r4Myil
   NM78CHijAXJVD1+jaPHzFoisNZ7zR/CkwaJcNbrrhqzEMAhygcsEwmyE1
   2ednwriNhi8BD4AUDNRytvyZfB65UgUmTQhppt+YY0tqb2MZgb1g/2IcN
   WPIKGom9fH13QFo0SSztCIdW2ZH2FIsr0D25LxvYAcj1uRdd9um00zmWp
   3pViheJxaqHEcbDT0/rXhGC/sdjpmrWfBY23wzXzQw9uvWfyrIBLBnUZg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262772092"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400";
   d="scan'208";a="262772092"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 23:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400";
   d="scan'208";a="611770321"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 12 Apr 2022 23:59:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 23:59:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 23:59:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 23:59:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 23:59:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEgoBH2XEEdLvZsrPSxDT6QHmBl1+nqIVqUA+iExTi5tOQ2NqwlRjd/I7EUkp67pHww2FU1kz5YhafbDTWOf6WljY3fL5nDbnjVriaeR/+za3tOAU45AAuLJa7pfzl9A9HaihEG9CEs8zhQhED6LV8XdPXIjmygOFhgEkVKIp+SPHFI8WH52qJPlaRyaO5+Tqx7GOVIkryiZoReSiZ6QxrlC23W5wycudkJ5YAUc92e5hwaRpYmFck4tZqmJK4O+Zex+ugBI0CHhfoUa20v3YHd6BWW/IpteNWBYzj/bDrKrY+lFXyOj2rJvDDRP1AOYk0bRgqT7iAomgcQlG5x1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFUUxKwOZB3dGho23QYImVHRUlOuok087Kyr+QP8xvs=;
 b=lODJYZOOaHB+E13SyH4EHM6pObDAWoDSmercocGGAl9lKZ0RkCkVl/WcIlF9C6K6I+W5/G6NHCfvtCe9LMDQRnyamW7QoG5W4g29fMTkxFI6XN8LqO6druNlqT8wWkWUJHp0y0Dv/tvAQMosDCzgde1ErGyLThOcV5OPAmcTarTd9EEo+ETJ5rfzbNvCeZ98ELjeh9X2xLYsq9Zb0f1VeE1vnNrp64/le2snrl8AWehOUaW8J9rgsGdBEJMkxN3QOLrsYmmPxucggLfKDcQT/Kgtv3CHFeTlwMEz3I7NvaJofIBdT6JeRDdQ6tW39sOgXvWWIFz0Pxik9QY8EJO/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by DM5PR11MB1579.namprd11.prod.outlook.com (2603:10b6:4:f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 06:59:35 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::657c:6a6e:4f6e:8efc%5]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 06:59:35 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Pokybuild User
	<pokybuild@yoctoproject.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>
Subject: RE: [OE-core] [yocto] QA notification for completed autobuilder build
 (yocto-4.0.rc1)
Thread-Topic: [OE-core] [yocto] QA notification for completed autobuilder
 build (yocto-4.0.rc1)
Thread-Index: AQHYSY3kljykFFYuAEOfzCEZffNzI6zsfv/AgAAKLYCAAKg1UA==
Date: Wed, 13 Apr 2022 06:59:34 +0000
Message-ID: 
 <DM5PR1101MB2348B383BD9E7C091E054DD3BBEC9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <0101017ffded4843-210c9da1-5b3f-4ed6-bcbc-1f63610acf6e-000000@us-west-2.amazonses.com>
	 <DM5PR1101MB234872284B26AF1D53F311F0BBED9@DM5PR1101MB2348.namprd11.prod.outlook.com>
 <732ad1690ed9616981f1ab5821d38fe192911f1b.camel@linuxfoundation.org>
In-Reply-To: 
 <732ad1690ed9616981f1ab5821d38fe192911f1b.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 27570926-e94a-40c8-b672-08da1d1b2b10
x-ms-traffictypediagnostic: DM5PR11MB1579:EE_
x-microsoft-antispam-prvs: 
 <DM5PR11MB157986B1F41009EC89C3BDE5BBEC9@DM5PR11MB1579.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YOpvgsWWlXH0l39AUiuHMD5rLb3nHR0D+icY9mmmd1zmCb6X7LtJu6QqdhaZQF4xF69e0qmdwjiZ4dRiKfWdctcB2/RiakcTqAin/rGU3meedkAH+4/HrfaLsNEB7pvM4X0IbIz1XlMAlmcAtpCgP36CMHPpeZ/AQsrIwCQfrE1N3874+EGgUIeZZg2NGUm1k+3XZZCEDQ1c3CLSdGxl2PRh0itKlh2+vy5biUJ53jZwe2gZNUL7NRg5FhRwYK7ZgBUrd8+MGXNN+POzn/zxDPkwKEDhzB9ls03juFlRLNtoBtJAWo6SxSzru9hLAwHclYK8Si93/VjNkqZz8GJsBeho/b+y1UFstUBj5e5Z647F/FS/L/OX3kjFFmtj7UrJe1excTJv/K4D47aaPEtt+apt899R6f6OQ2HPoaGdrs8N18iVJZP7i+7topIqiUWKnowV4PZn/YsLg43cdIcgLCaGwg5TyIqOW+FK5itCnUnp+cLBJ1bCpdl1d3M1sP7iIeWHPdEFBCxFG9yvsXRzqKjycXMxtgXeqoDQJiYQC/83l0nVdgHk6Zu4km7vJTcjdO8NZMYYrIF/XIjdM1bFize294mIhWOOt73f78GMnm1MHed6kp2BXGR9A7x6l5W8czKwLeMkV0xScIko+UqBYnuPW9TT4mxAZJ2PMWtRKu+xny+4vb/LaBBQdzt2gDs9LOfchGBA0dpODqcvrPv+KqOJkIDg9paPSz885JmaWZ+I3qxzuMO6D7YPnmA2HNUli4Z0Fx40tK9V7TTGw99bB/8QokbWhORB7KPWwRugFFk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66446008)(8676002)(64756008)(66476007)(82960400001)(5660300002)(38100700002)(8936002)(55016003)(52536014)(186003)(66946007)(76116006)(83380400001)(4326008)(9686003)(26005)(15650500001)(122000001)(33656002)(38070700005)(2906002)(6506007)(7696005)(110136005)(53546011)(71200400001)(966005)(508600001)(86362001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dlRuczM3R2lvT0I1bGFhU3ljQjF4Wngra0t6cEpWNkZpVEtnREQxbXBHVUJL?=
 =?utf-8?B?VW52cnRPcmVZNmllZCtnb3d5akFpSDZaRXZmM3BtZ1FLKzZMa0dMVzJjUUtm?=
 =?utf-8?B?L2FQaWwrWlZVcGMySFVwSlZMWHJjbnBKRk5GZEgzaWxJVXNnQ3JQeW5NTTA4?=
 =?utf-8?B?c3k0VnNaZmE4dU1VUmwzQ2FzbXpsU0NINmkyL1c1a1k3T1d6WWJ5alViMVpk?=
 =?utf-8?B?cTlRYVRiYjhFTSsyTys3L2hWbnExVXF3ZmZFdVM4NmdVK2VDMk5mSkUweEJ0?=
 =?utf-8?B?U0R6RTFqZ25PYTU2OFlkckg5aDU0RE10ODNkMDJsTEFkSDU4R2N3dlJzbm9S?=
 =?utf-8?B?MWFCeHFWL054WEowNG4vSU5zdDJ5MnY0QWpObCtXRU5odGJuZEJkR3hLdXpR?=
 =?utf-8?B?Z2szTzZSWDFvVjZpMUIzYnF0NkFVTVg4b2RPaUl4SkM4WTJoTGVBeTBjS2oz?=
 =?utf-8?B?ZkEzdFZqSmRsVlJObWI4U2FrNFo5eFlENnpyaHBlYjc3aElIQ2E4eW9Xd3gv?=
 =?utf-8?B?QkZCRFdMNGwxVTJYaiszY3Z3RjdDTzB6UHZwMzZZdGpJSTJoWkVxVXFCSkdK?=
 =?utf-8?B?T1laUTNKMkRkSDZZU1drWmphclNveXN4Q21WQTd2dFFwd2pvWE9IeGxDdXIr?=
 =?utf-8?B?aHUvd2EzTzJnWUJaREZmekI4YnNiODVhMHF5QlFrM3JoT0pmb1BqVTFqN1RE?=
 =?utf-8?B?Qm5DbGdzSEo4a0J5djZVZi9lSUltYUlrcjBIbDNESDJNclJIbXhUM2syR2dz?=
 =?utf-8?B?VktxUFRyUHVLN3VyVTEwU293VHBMQWVRaDZKZmpPb2VsNjNxYzFKelhnMnNm?=
 =?utf-8?B?QnBNYmNUOS9ySnFNUnJBblhZWWUxb1lRWm5iUG9BZ2JBbG1WUWdQZDV5d1Jk?=
 =?utf-8?B?U2Q1ZUs5bTBUckZZNlBnVExvNGs3OVY0QXVRd043WEU2Z1JGRDZjSk5tZXBM?=
 =?utf-8?B?Yy9ZcE9tNjN2NjFGRGpWVW1VM3ovSExObWJPa2htSC9MWGkybThPb05UdThO?=
 =?utf-8?B?RWFkQmpIK1UwdDdBUy9kM1djdWZ3ZmNOTVFmQSthYmpGRXFtMWRKRnZPNDkr?=
 =?utf-8?B?S3FsRmRLckxtSEpGb052d3FNNnZYTnlDOHREUUVZeXZ1NDNqL21ldVdiWmRa?=
 =?utf-8?B?M0Q0UkpXb21xeWpMWndhelJka1RoRlpyV1dxZ1NOa2VoNE5zZFZ6ZW5TNGxq?=
 =?utf-8?B?MHg1dU5TME5CZmJwdXpVbzFkYTM3S240VldSdFZ1ekxqY1ZRNGFseWo4VSt5?=
 =?utf-8?B?dmVpcElJK3p5RlA2WG1FQksrNjZaY2s5K3MyN3pZZ2M0Vm8vWHo0VnI1SkIw?=
 =?utf-8?B?aDBYTjRWZUI2aXBPcEpDSjd0NzRUUjVFUExneGhzalg5aHUzTk4ycisvY1pU?=
 =?utf-8?B?dmRaWkw2ZDJIeTVuSHFMTXp4OTRrak8wb2szZ0Y0SzVLTWlhQW03TVU5NnpR?=
 =?utf-8?B?N1VjUEZ0R2plc1FVYWo0YVdvWlc3eWc3R1JYLzE2OUtRUGtlSmJ2VTA5bGFJ?=
 =?utf-8?B?UFUxaU5mbmRGZ3orY2hudlE2WTFwQTRYZ3R5RTlvRElLOGZFVnUwYU9wdnhy?=
 =?utf-8?B?QUV5alYvU0NTaGViVGRyNGwwY2EzL2I3c3VsWkhnK1BjTEpWVUFiMkY1QzZT?=
 =?utf-8?B?TFFBMXNXM3lkNW5LaVdnTDBPOFcwbStJV0JtL3c4YXNYdFlxZlRCV0xOWm0w?=
 =?utf-8?B?Qkdpc2pzMGFsZjhhUlVOY1ZYeHIzUEozcEgyQVpTanBtMURvdGdsMk1HSlRD?=
 =?utf-8?B?YVdGajRDd3BwUXRxMGZMTkFuL0tSbmlSVnVGWmFVakhuNzVOMTROVEg5OWUv?=
 =?utf-8?B?ZGZiSjUxS081SGgzWm1KcVBieURva0hWVENLL0RaOTNtYytxUklrdStQV0lL?=
 =?utf-8?B?V1l2cWdzWENDdjlrL3lFdjlmVWowUi9IQXkxckhoMnJ4RTIrbU1NMzN0YWVZ?=
 =?utf-8?B?R2JIYnFId2psWEhJVnBSdDlSZFFpY2xLYjdFeXlOb0ZpQU12UTNSWmNMaHdC?=
 =?utf-8?B?R0pmYnpGMXg3N3QyUHFMc09sU1cvc2F6Smw2QkxJS281V0lFYUhacXNVMFFa?=
 =?utf-8?B?NUJ0Qm41cU9jc2UrdnVRSGdXNUtLQTR2d1ovWkh6cVFNUkN3YTQxUjNrK1BT?=
 =?utf-8?B?dnN6SDJjbmlaNU9lZ3JLMzdrcU13MzE3R3ZvSHEzWll5SURnT09tNmJxOHp2?=
 =?utf-8?B?R1RpY3hhUm9BYW1Vc3ZUci9zL1JnRmpIeWtMR1RBY2RyY0srM3o2SHpYYWtR?=
 =?utf-8?B?ZjhSS1NCZ2MzV0hyQm9xblQzTDNxMXJBQVQvL1N3T2xWOXpSNk5HanhHclJt?=
 =?utf-8?B?dW5ZR3l6TzJOcS9aUGt5TmdGbGNtODJhODJYNHFNTnRGZHJBVWhtdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27570926-e94a-40c8-b672-08da1d1b2b10
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 06:59:34.8934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 7fpmjBS+QYyaVLp1f0Xi72jhLQW4csooWAL2J9I5ETSDAW0gSDLZPMh/nJf6ehBJpHyAMcslPgRQ1L2SSYsVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1579
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164302

SGkgUmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+
IFNlbnQ6IFdlZG5lc2RheSwgMTMgQXByaWwsIDIwMjIgMTI6NTYgQU0NCj4gVG86IFRlb2gsIEph
eSBTaGVuIDxqYXkuc2hlbi50ZW9oQGludGVsLmNvbT47IFBva3lidWlsZCBVc2VyDQo+IDxwb2t5
YnVpbGRAeW9jdG9wcm9qZWN0Lm9yZz47IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IE9F
LWNvcmUNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IENj
OiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFt5b2N0b10gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0
b2J1aWxkZXINCj4gYnVpbGQgKHlvY3RvLTQuMC5yYzEpDQo+IA0KPiBPbiBUdWUsIDIwMjItMDQt
MTIgYXQgMTY6MjAgKzAwMDAsIFRlb2gsIEpheSBTaGVuIHdyb3RlOg0KPiA+IEhpIGFsbCwNCj4g
Pg0KPiA+IFRoaXMgaXMgdGhlIGZ1bGwgcmVwb3J0IGZvciB5b2N0by00LjAucmMxOg0KPiA+IGh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS95b2N0by10ZXN0cmVzdWx0
cy1jb250cmliL3QNCj4gPiByZWUvP2g9aW50ZWwteW9jdG8tdGVzdHJlc3VsdHMNCj4gPg0KPiA+
ID09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KPiA+IE5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMu
DQo+ID4NCj4gPiBuZXcgaXNzdWUgZm91bmQNCj4gPg0KPiA+IEJ1ZyAxNDc3OSAtIFs0LjByYzFd
IEVkZ2Vyb3V0ZXIgY2FuIG5vdCBib290IHVwIEJ1ZyAxNDc4MiAtIFtRQQ0KPiA+IDQuMC5yYzFd
IC0gSWNvbnMgbm90IGxvYWRlZCBwcm9wZXJseSBCdWcgMTQ3ODMgLSBbUUEgNC4wLnJjMV0gLQ0K
PiA+IEFibm9ybWFsIHJlc3BvbnNpdmUgdGltZSBmb3IgRmlsZSBNYW5hZ2VyIFBDTWFuRk0gYXBw
bGljYXRpb24NCj4gPg0KPiA+ID09PT09PT0gQnVncyA9PT09PT09PQ0KPiA+IGh0dHBzOi8vYnVn
emlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQ3NzkNCj4gPiBodHRwczov
L2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTE0NzgyDQo+ID4gaHR0
cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDc4Mw0KPiAN
Cj4gVGhhbmtzIQ0KPiANCj4gMTQ3NzkgbWVhbnMgd2UnbGwgbmVlZCBhbiByYzIuIERvIHlvdSBo
YXZlIGFueSBpbmZvcm1hdGlvbiBvbiB3aGV0aGVyDQo+IDE0NzgyLzE0NzgzIGFsc28gb2NjdXIg
aW4gcWVtdSBpbWFnZXMgb3IgYXJlIHRoZXkganVzdCBvbiB0aGUgbnVjIGhhcmR3YXJlPw0KWWVz
LCBpdCB3YXMgb2JzZXJ2ZWQgb24gcWVtdSBpbWFnZXMgYXMgd2VsbC4NCj4gRG8geW91IGtub3cg
aWYgYW55b25lIGlzIGxvb2tpbmcgaW50byB0aGVtIG9yIGhhcyBhbnkgbGVhZHMgb24gdGhlIGNh
dXNlIG9mDQo+IHRoZW0/IA0KTm8sIEkgZG9uJ3Qga25vdy4gDQo+SSBwcmVzdW1lIHRob3NlIHRo
aW5ncyB3ZXJlIHRlc3RlZCBpbiBNMyBzbyBzb21ldGhpbmcgcmVncmVzc2VkDQo+IHNvbWV3aGVy
ZSByZWNlbnRseT8NClllcy4gVGhpbmdzIGFyZSB3b3JraW5nIGluIE0zIGFuZCB0ZXN0ZWQuIFNv
IGl0IHNob3VsZCBiZSBhIHJlZ3Jlc3Npb24gYmV0d2VlbiBNMyBhbmQgTTQuDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiBSaWNoYXJkDQoNClRoYW5rcywNCkpheQ0K

