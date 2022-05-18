Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C74C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 00:59:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.833.1652835566708654304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 17:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dElcM20K;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652835566; x=1684371566;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0Xys9Ais68BTcJ0KPaW2J/AOIjEmJ5Dp8BjrJ+1DAXQ=;
  b=dElcM20Ku+vIXaizzjEReQmRRMn03Wnnnvw6JErYk6vik5ETWF4z4Ibt
   BSAl2nI1TFDQSOFIymdchbIBQ7MZ9USg11ANvsl8zyMx8hLb6uxgS70vz
   SyMzCj/EodqGn3G4hvfaPl1OvaZULZ4gblikHmcBBh2pMue4Y2tvYPI3S
   vmHGWpNeTyso1kFUhPtnz/nFpg7eEadu1LWE+Mq+MBU1ZOk2pQt8RR2M8
   4F6T+VxVVsBnMc/Z9t3B01J7i0F39W0inujVsp3NaOKB78VFKdn1jsvN2
   gyIidT3oGCJDkom08HWx7a3JV+MNK1eUXuRc5500b5crBeZErNWmn0qgu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="268993221"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600";
   d="scan'208";a="268993221"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 17:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600";
   d="scan'208";a="897953354"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2022 17:59:26 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 17:59:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 17 May 2022 17:59:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 17 May 2022 17:59:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 17 May 2022 17:59:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKMj17IFCRGYWPRaYxReCgeU1aL7khHMSKxRjKY7XEis3S9OqAtyZTDTMCF+ANzFhl2vgfOVgOmsBtjElShAsIi6ErnyYQPyPionpChOTjC9trusu/YxhsdGqUmLZQPoFcpZRzuG9ltnHQ6WMqcy6ZOw25R8+WXhHzEH82qX9Y1hrLrGKt2VmK+pe95mNwe7xBKAVGJ2f/IR1T6+qczbDxdc/S/pLQNUOW9W8H6sWC+Svq73Ziar3He+QdF3mjc5XLerU6v6zuw/OdFhvYsIbPUmXh0RZ14ps05mVM38Az0Lfy2zNmnIvHL5f1TeLujQrQxS96mPz9tqDz6Vj0n6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Xys9Ais68BTcJ0KPaW2J/AOIjEmJ5Dp8BjrJ+1DAXQ=;
 b=ds/en0d42H3q94PTyB0NQstSy5sIQWwUbnuHa77iKlJ5GQgStJBWXn4frDWzEs3hb5hgx0yZGYSVujnhFOM8cLxIfuxsnp9Nkrb8mGWZxJvnZUuOtv4tIYAkCg+jjts0eaQyIrkBcj+YrtKP+GgnyKpgee3PkcusvQFYBYXBbnVFF44rBU8cvAAp7mhfjlUlGb64RhcyyQ7z1d7DSAjY1JGdVoEcKHI3BZUKkwQVrSFmzZaHp44q1fhX9GmUEH2A0oQOqnfmNkATlkgr/dIbtxWcn4mXOErqaje0665YLInqoS31IqOB4Z/j82ZtfA2Iwcmona5TR8QW4QUpjHVhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (2603:10b6:3:a8::16)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 00:59:23 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::c8d8:e76d:b1a5:f26d]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::c8d8:e76d:b1a5:f26d%11]) with mapi id 15.20.5250.018; Wed, 18 May
 2022 00:59:23 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.1.rc1)
Thread-Index: AQHYaK2LuGVa+14YE06lXvEf8wssAq0j0zUA
Date: Wed, 18 May 2022 00:59:23 +0000
Message-ID: 
 <DM5PR1101MB2348D685018A1E5FC90F5BE6BBD19@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
 <c78ec7cfcd93591fecd8bcb305f2226b088b512a.camel@linuxfoundation.org>
In-Reply-To: 
 <c78ec7cfcd93591fecd8bcb305f2226b088b512a.camel@linuxfoundation.org>
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
x-ms-office365-filtering-correlation-id: 25d108b4-10bd-4508-c849-08da3869a619
x-ms-traffictypediagnostic: SA1PR11MB5779:EE_
x-microsoft-antispam-prvs: 
 <SA1PR11MB5779F6C331F00BA040FCF7B2BBD19@SA1PR11MB5779.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 i4mVTytH48YkqeJL7R87l8TkOq7vH4Q1fjXWtivubCtc7GKYWycZXamBfL8hyl6CUXfuCfEaTIMpkZivwHuO4Y8Z1OcuHaOjFYdGCfsJU+/u0GJyEq7pn4qBvJBLTThywGB4SlqQvP/6UuCTZeIePOV/IJg2AptmlVyNXMviViah3dEuqHBl494m9VmprX4q1fXlew/L/HS3BeJ6ll1/m2MECwMAgItQfBlw/D+0N8WnGIcBe3AbjawR2yx6W1VGxtpAHUiTynBKZ/psbm2rfCI8fMiUmYjpGRPo2ZD4ndofLOlyOm1p8wZvpZSkudKbbsLTiOv8QAx8vgUtzdxzFsLFO55mV2xOrSIAfyYhbYTlF0ohURtdBTH1sBEXRkiLxIOuEDJgFZcp2Hd7LPZkcpT2PdQIPW4WJMmkQgx4I6xHrsBgTddu0NjEi4bexvb3hOTuaXKo/EILIy6reXewwgL7fHwKIcsJKrDycKsmGR8gwHKXE3+hOzhncTXXE2ULvKrl2kVyVo4BW0TbVH97dsSnKG7LzWIskXsvamk1ry32kabsq+XHEJAgg1YNXyq9SVKde8aWDKeXE3YAepiJfTWJMIPXeNkD1wSYbWGFNvofwBVICtMdhdIjqMh2twWe40btklHXewlSQPLKo0RE46MKS6a8GeRAubM5DMThZxTvKGWUMvPRR8sEvdLIkkyBZEWxe/j7Uw5ZEnxxXv9IxgVW6h5FdkVzApAFQ26oMZ0R1m4wLyAAuKYdiNDlo+4Z8VLm/g0urLKshrgn0wHAYC4Ri3AdGrYnxQFvGu3il28g1lg0VmOjbKXr6e1/xHVZETieFr4FoFLumu72EeTZKg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1101MB2348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(15650500001)(966005)(26005)(9686003)(38100700002)(38070700005)(316002)(82960400001)(110136005)(53546011)(7696005)(5660300002)(8676002)(8936002)(76116006)(86362001)(55236004)(33656002)(71200400001)(66476007)(66946007)(66556008)(64756008)(66446008)(52536014)(83380400001)(186003)(55016003)(2906002)(122000001)(6506007)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MjhGdjZLMHhLazZmWnNQTlVmWUk1RTh5RTE1cE4rRis1MjlHOWM2ZWY0ZkJu?=
 =?utf-8?B?SFZkY0x5TlF0UjZRa2J3VmpvS205YnozejBKT0lnWi9vODJEeWZlQklQblB5?=
 =?utf-8?B?elNXQUlZL0FRRWw4K21CcGVsOGxOMzQrWTZ3K29VRTg2NmR2bUFUcys0dFN0?=
 =?utf-8?B?RklVVlpOWXlQT2FleWY4RnNHM2FZUlVuT2xkazhObWJBbkpjcW9XMm81ZjVT?=
 =?utf-8?B?RW9PSy95VE8rY0g0d2cwS2Z6K1VCV0l1WEdmMlE0WU92ZVl1TldReU82dHhy?=
 =?utf-8?B?bGpUVFJxMjdiMDZqbiszUngxSDNETWZvalJ2NU43alFJTnlPanlmRDB4SlZz?=
 =?utf-8?B?MmUrN0F5UWNtTTkyN0tETi83amVadndua1NieEROUnRNUVBhd2xwQlZ1Smdw?=
 =?utf-8?B?R3dnVHN3WU44ZUVHdERjREZxRGQzM1FaMWFvM0RnakdoWWpDT3d6N01BWUZt?=
 =?utf-8?B?dWVwT0tEMDNHd2lmWldxTEllYzhVV3F0UkFYSWo5dTRqWllOSUVxNTJIc0tH?=
 =?utf-8?B?VGpUV201Q0JDVWM4MktjaXB1cWgxczZxSDdkeU1kU3Q0Q0xsalZ3TnZKVVRF?=
 =?utf-8?B?THJNdFQybTA1eElpUHhBM21VQXJKV1B2Tmw2ME9UWS9KZ0l4dmJ6bmtCSjhl?=
 =?utf-8?B?V0llYm81VU1zYnJGckQ4WnRaRzJBampWOVE2WG9iTVgxYU9hZytud1RuSnAv?=
 =?utf-8?B?OXpMakZTRHR2RnZUanY1TDhkZVdGZnZrQXRHWkEwVlNqaTlxRkkrdlFWU0Iv?=
 =?utf-8?B?MVp0T1h3eXlraDhrS2w1N0ZwUXVReWMxTjNFM1BBK3FINHdSUlNFT3VoK0dk?=
 =?utf-8?B?U0hDQmJncUpZWlFKQjhhQ1RISTUvWDdINDRTdFpXOWxzS2wrVEY4VHp2R2hi?=
 =?utf-8?B?UnJSdWZoU3RVaWhjdHpYUDBXYUZmc1V3azJyRWNmUnV0WW9od29sS1BtVlVp?=
 =?utf-8?B?YU12SjcwQWNNd1lFK2NDRktCdHBXcFRXdTdBZmFoVVBaakt2Q0NvUkY2VjNt?=
 =?utf-8?B?RmNwb1lmVkpBc0cvOGZvMzlyYktqd0x0TzNaWlJSV0g5dElIUUxvU0NtTUpr?=
 =?utf-8?B?NnllZWtCaGlULzc4d1RqYkR4cDUwYWxuaWxMNUR1MDc0YVlJRDJyemhkTnFq?=
 =?utf-8?B?V2JKeXI2MU5sQ2FQLzdaSHYySU84RCsyLy83bmhqNkg0K3NhNkxQSTM4N29h?=
 =?utf-8?B?TTdvSk45MjlmbEh2K2tRejhqQ09lRHVENmtVU1dZenJLSUkwdHJ2SXEwQzJz?=
 =?utf-8?B?SkJXVG9hQW5EYW1UaGJMQlVFOFJ0eHphU1NWemV3UDRmdkEvM2lsdXJycm1K?=
 =?utf-8?B?dWprT2hibUwvNmF4K1NacXlmOUtLc0tzWm53bjhnbGt2bEdpN2cwRmVnZkpI?=
 =?utf-8?B?MWVkN1VmRnNFZ3BqZnhwUjJOTWh6cXVYekRvWUZLT0dkTkZGVXJnVHlOTzJN?=
 =?utf-8?B?VG9rY1hZWmhBZnF2VnBhdExBQzNXaXlCVS9abmFpOWdhelZ1ckxvWGdmaGVU?=
 =?utf-8?B?cXJsZGRwblVydjF5MVZMMDZ5dC8yZzhSNW9DK052NXI5OVZzc1ZXMXNYTGFZ?=
 =?utf-8?B?WmxvenlmSlI2b21EY3UyaThFcmhuS25LRjV2NFJOaDB2VkRSeFZpNi80cUFu?=
 =?utf-8?B?L0k0aVVkSDdJOE5mVHNrVTRsZjhZaVRncmV1QlZWcDFYWFhmSUViZGFCUXpw?=
 =?utf-8?B?OEFIdm5DR3FkUno4V2xiZ3ZJK2ZSR04rRTE5aW0zd0pMcHp0Mjg1djVnbTF0?=
 =?utf-8?B?U2VQOVlrNEZMcHN4R1F2ME9RbTU3YWlDU2R5djQ3d0dycnlyQTBYemVTTGlp?=
 =?utf-8?B?RHp3c2tXSEdOUnpQWWFhb2J2aUEvOTc4dDFkMm02dmRCSWlmQ25KNVVjbGk4?=
 =?utf-8?B?L3ZkQm1pQjZGUkNvcXBKZzBmOVBEa0NzbEtNaXdFWGdWZU1BYmV4VVdodGJn?=
 =?utf-8?B?YkU2VHJzOEhiTUFNWUNEOGFDUWE3RXl1Qm9XR2RXMzFrNW1XcGtKcWNNdW9u?=
 =?utf-8?B?TFpwSllwNi9aMjR4WmNqRmh2dk5mZk01ODlEazBSMTVFWUJBdVdUdWRpWGtL?=
 =?utf-8?B?YzdQbmZIdDkzMTRSV0IzUlFRcjJWQ1J6N25ESWUzRzlIMVNaV0NCZEdGS1RM?=
 =?utf-8?B?Tmp5TE5aTDZPNU5lbjEzc0RJQjJWdVRFSlMrYmNDVmlwWU0waFI4eGphTVRT?=
 =?utf-8?B?R3ZkNEV2ZjdUTFVjd3RSWUV2R2VEK1U3MmtUMkoxNGpZaTZjMDlKazlIQnpI?=
 =?utf-8?B?dWFPMUx3K0JnWFRYdUsxZzdRR0NKeXo4QmxCeTdhVEZBMyt0QVhXYU42OHhr?=
 =?utf-8?B?QWZnU1lQaDBBYmExV1pZZlo1bWEzU3N6TkVOTDNQZEkwYWZZUTVzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 DM5PR1101MB2348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25d108b4-10bd-4508-c849-08da3869a619
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 00:59:23.5306
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 sV+jNmwlqCfVDPqWRJmfkbkcqbx4meHsOmFNngk3pvbuaWzPKIXaCdvqRfp/Yxtobp2Q5YT2UJ4z+/3azDuFdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 00:59:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165780

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgeW9jdG8tNC4wLjEucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhlY3V0
ZSBmb2xsb3dpbmcgdGVzdHMgZm9yIHRoaXMgY3ljbGU6DQoNCk9FUUEtbWFudWFsIHRlc3RzIGZv
ciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQoNClJ1bnRpbWUgYXV0
byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KMS4gTWlubm93VHVyYm90IDMyLWJpdA0K
Mi4gTlVDIDcNCjMuIE5VQyA2DQo0LiBFZGdlcm91dGVyDQo1LiBCZWFnbGVib25lDQoNCkVUQSBm
b3IgY29tcGxldGlvbiB0aGlzIEZyaWRheSwgTWF5IDIwLg0KDQpUaGFua3MsDQpKYXkNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbkBsaXN0cy55
b2N0b3Byb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogTW9u
ZGF5LCAxNiBNYXksIDIwMjIgNjo0NiBBTQ0KPiBUbzogeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZw0KPiBDYzogcWEtYnVpbGQtbm90aWZpY2F0aW9uIDxxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogW3FhLWJ1aWxkLW5vdGlmaWNhdGlv
bl0gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXINCj4gYnVpbGQgKHlv
Y3RvLTQuMC4xLnJjMSkNCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTQuMC4x
LnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXINCj4gYW5kIGlzIGF2YWlsYWJs
ZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9wdWIvcmVs
ZWFzZXMveW9jdG8tNC4wLjEucmMxDQo+IA0KPiANCj4gQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoN
Cj4gDQo+IGJpdGJha2U6IDU5YzE2YWU2YzU1YzYwN2M1NmVmZDIyODc1MzdhMWI5N2JhMmJmNTIN
Cj4gbWV0YS1hZ2w6IGJhMzUzMTNjMDg1MmViYWY5MjRhOWI3MWQ4N2E0ZTNmNWU5MGFjOWINCj4g
bWV0YS1hcm06IGI4MzhkNDBlZmUwNmM4MzlkNThjZjM5Yjc4NTE3NWQwYmE3NTE4YzYNCj4gbWV0
YS1hd3M6IGIwN2E3NjlhNDM0N2I5ZjQyNWNmOGM2MTA2ZDMxOTE2MzQ3OTFmOGMNCj4gbWV0YS1n
cGx2MjogZDJmOGI1Y2RiMjg1YjcyYTRlZDkzNDUwZjY3MDNjYTI3YWE0MmU4YQ0KPiBtZXRhLWlu
dGVsOiBmYjIzYmMzZTY2MTY4NTM4M2VkZDMwMjZlMjFjYTI1ODI1YzQ4YmM0DQo+IG1ldGEtbWlu
Z3c6IGE5MDYxNGE2NDk4YzMzNDU3MDRlOTYxMWYyODQyZWI5MzNkYzUxYzENCj4gbWV0YS1vcGVu
ZW1iZWRkZWQ6IDUzNTdjN2E0MGVhZjhkMWJjZjdmZjU4ZWRiYmE4ZTk1MjdlNDBjN2QNCj4gbWV0
YS12aXJ0dWFsaXphdGlvbjogYzU3ODkyOWNhMzkxMGU3OGEyYjU4NzZjNzA3NDk1MjA3OTExMjRl
ZQ0KPiBvZWNvcmU6IGNiODY0N2MwODk1OWFiYjFkNmI3YzJiM2EzNGI0YjQxNWY2NmQ3ZWUNCj4g
cG9reTogOGM0ODk2MDJmMjE4YmNmMjFkZTBkM2M5ZjhjZjYyMGVhNWYwNjQzMA0KPiANCj4gDQo+
IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3Qg
QXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRv
YnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4g
DQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzE0OSk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBu
b3RpZmljYXRpb24vbWVzc2FnZS8xNDkNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3Rz
LnlvY3RvcHJvamVjdC5vcmcvbXQvOTExMjkwNTIvNDg5OTQ2Mw0KPiBHcm91cCBPd25lcjogcWEt
YnVpbGQtbm90aWZpY2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJz
Y3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3Rp
ZmljYXRpb24vbGVhdmUvMTA0MDY4MDUvNDg5OTQ2My83MTUzODk5OTUveHl6enkNCj4gW2pheS5z
aGVuLnRlb2hAaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

