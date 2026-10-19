Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7E1CCF2DE
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 15:27:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37393.1792423627804645260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 08:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=RRNujDof;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792423627; x=1823959627;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SB7mGzUJ+eHd/cwLelGnAlbro+eh2YHzirxXVBgGoTo=;
  b=RRNujDofZ4E7grNqF934KvOl96FVCadiRVx0BYGwLRz3b+IT4UO5hes6
   hq8apEHgX1EnbmQzrEGAM5YE3wA+Bdz8Xf3Sw0s13kDr7xJsT/axaBYvy
   CzjysYsXvPgsftVxz5bm4ZLjkp2UxKTNu4qM621Y81yKsNX+sDZsOnSZz
   fw8Bi/+VjhqjGARCWs/d65QQ4S4Ys+PkC6JPIGGhkxX4Ehm9AaHp4smCU
   E5oJyyZb4LT56BY5uZqq48QZIavQtf2OAOksVhKSG4GUKdnBkTbr/sUI8
   F1y6Vl+Zu9GoG8yujvP72JntTbie024+QuQmZXTIPID58lXBHCseDj6Q0
   A==;
X-CSE-ConnectionGUID: Czqu1zjoSfe+uYzjdtCJTg==
X-CSE-MsgGUID: YmD9JjzhQbikJnlXcj1Lhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1214713"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1214713"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:27:01 -0700
X-CSE-ConnectionGUID: 63TrmwoXT/u1nxocePUKsA==
X-CSE-MsgGUID: esl8MOhhTnWHw1nlE5pSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2440612"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:27:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 08:27:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 08:27:00 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 08:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeJ+paq5yc4Pin7ckXmZUuOZeyrinHu1z6hgv7+ed8eFZvNEEV53aoZX9iKeVqaO+jqLYR6eVyXPOeSwPxLTfd7jAjOVeOYEskWi8b6uUE9bavkibx1lY1RDzzO+NguCPpy0cqNor7yPCksf/D+f+4LuKoUxNs4EYSnemtXaFsNMBUpQTDv5zUZAq8nqKc82knJJZ3eaUxfxAVE8vg+UEsrNkmpQzs0SuAQxvoSViQatKQDxCA7miLgpAC4r8YCVCbsbYKqtrNcqxXg4Nd3ijtIltUQ6vBZNFuTOpgMuE91/ZkieVmDT32FMG68dgYneub2WjLaqoke0J+F5C8GVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB7mGzUJ+eHd/cwLelGnAlbro+eh2YHzirxXVBgGoTo=;
 b=Hvsu2zYplQFg0OLBRTU0rPuQcttCTzWR4qvH05ySNVahdAEauE93CoAe2Nhlg/oQnRqFd+jNGx9iVpm2X7cTBaASg2rAGWE7Sa6kOe9lHw1RmZevXEe5EuCzkdGYAxiQfFdEsj1x8jueJZ4VBlHC+GhX1aF0M+k+x9I08D6AMtgf+Qzx93Cb7WCOviEXr0LT8Q7GD98w6TybOfmon7x8KKRQ375UcEJSe4PMJtHxoCYThvxGt6tHI3Hx/GaY5nqEwLYaZ3XWnq11ZJNgBO9vuEmf2rfAW6LfgbpGaAC/k370xmHNsUQt7Aj/kZ4fE9Xmc1yH/T/Bx365Ktbf3LIoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB352303.namprd11.prod.outlook.com (2603:10b6:8:50f::18)
 by MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:26:57 +0000
Received: from DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b]) by DS4PR11MB352303.namprd11.prod.outlook.com
 ([fe80::c82:2fc8:5d51:9a1b%7]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:26:57 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.21.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.21.rc1)
Thread-Index: AQHdVpRRtAXkfVckp061Q8xRmZ2sxbbyk1OAgAva9oCABqDGQA==
Date: Mon, 19 Oct 2026 15:26:57 +0000
Message-ID: <DS4PR11MB3523034F12BD2173A11B948580F4982@DS4PR11MB352303.namprd11.prod.outlook.com>
References: <010101a117e56e0a-bd01c028-29f8-4540-9e61-6d0598e33869-000000@us-west-2.amazonses.com>
 <DLYWXGKU0A6C.3P68DSH9ZX1MV@smile.fr>
 <18DEAC872DD740C8.2478941@lists.yoctoproject.org>
In-Reply-To: <18DEAC872DD740C8.2478941@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB352303:EE_|MW6PR11MB8411:EE_
x-ms-office365-filtering-correlation-id: 7dc0bc70-c4da-43b4-7971-08df2df569bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|23010399003|366016|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: lLU2h/gm9AuRVynN+Yjp2Uf+ffS4XS7nKpNOcSf9bdcjKTAo7n8tkDIAd93lq1nCcbZrbiHxjerrC253SE2ref9rA+EfzALzIulMrSB/LEFPST+J+MbtgylcJEnjl0LCbF/MIgWYDL8wyw1JRcgT94G1p8UmCU6l93AkEiZwG+VupGjgyiuZr9nSQoFP51gmUAHcFm27JUMn71ThCuLQr8XWF8CKzcx50jMIH8ycP+qc0J9y+V6Gw7U2ySS60gDg+MWghwvHcTvfcsW5KUSCteK8xN83gN6W2NAIYTgENs/8CgDbuSkTK+LRwL1s2BaKcuLb4c87JO2RqgVW2gQ2zGTQW9OoaUEzUIPeVPgY6iAA00/vCeEyjCrzttcSwQezu4p6Sg3ZNudGJs2CZWQpmRlBnJacx6dpHofW1kOaHW/5shRXoPrDZnnhcepKuivI1J95WbsGTtE9a2JMViHEGfJymde81BCXJKWBr2g2bmMsHP2LmnGYNa43qt0cMZ1SsHQSzIgbBjtM3xNuM+kYAN8bSGpp9YJIZRqnNnUFnGlI9JdqSv7w060Sy+I8KKCTrNRGDv4KRGJdXOzAawlNDc+UJh6GQLrLm0huxV6S88dRF/ekLUfAcCbXoXXTPZ5e74kPf/57yrNvRic/Y9O2YQmLba4EfM9/oUVn2QFNH7A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR11MB352303.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Unl4TnVRMGpUakI5ZzBOVElqU1RDODRrSzFNZjJYZnZVdzZHYW50b1F6S2ty?=
 =?utf-8?B?MlV1c2UzeGpDNWFucXJ1bVJrUDYwd3dVaWN5OGNPSEk2SHJLY2ROMEoyR1hl?=
 =?utf-8?B?ZUpJN090QThhRXhqUzFrelphcnRzcGNSZ3ZOMWNkRy9hRWpYTUJZRXZuSFpK?=
 =?utf-8?B?cHNFUGkvMWNWSVVEZW13UklPeEFTQmRSUTlJOHFjVnhVRHhDbTNyRFlxMlBP?=
 =?utf-8?B?NjlDQy80eVlWMVFMazN5dEJvZGtrOEM2RmRadGNsTE1ndUo2WFBOeUNJZXhX?=
 =?utf-8?B?cmZXaWQ1cE9TcG1vUm83LzR5NmQ1N1FxUVFMUmtWalJ3eFpRMS94TWtHTHhY?=
 =?utf-8?B?VmNxS0RIN2NWMi9UdFR5bmw3QmM1RTB1d1NTK05HZDBtOEJMN3lwTmZqdHpi?=
 =?utf-8?B?L2RFcGtVNWhZU3RHOTdUZzQ2TUxHNTd6anNUNFNWMnFBR2Y2RnRkamd3Nit5?=
 =?utf-8?B?L01XTklMK1BFNldHVXNmUjh0QitWcFNTd2dtL1E4RS9yYUFZdVBHcWdNR1k3?=
 =?utf-8?B?aDRZUlhEUWJ2ZVYrOTJRN01aR3VPc20rYlAwS3U2aHlQK3pMaThPYUpDbDJF?=
 =?utf-8?B?WGpvK0lRdXVkTjNWSFFQdFpacWxYVE8xanVTQVpsbjNyUS9kdXhnSEEwblFW?=
 =?utf-8?B?a1hvbnlEemI4S0YxQmJmdlY5K3ZXeG8zZ3BqNDFIaElFODFlZ2F4bTFYOS9E?=
 =?utf-8?B?UEhEVlJVT01MWThreEUyQlF1dGU4bFBwYWtDek9LL1djQ1BYczdSQkg4ZVB5?=
 =?utf-8?B?Y0h5MXVLdiswcGJITEdaVXBYVzNoTmFiRndzZ1h5UmZBV3pTWE1HcnFPcWxa?=
 =?utf-8?B?L3h0Y3ZNV2FMRXN1d2ZSRHU1VG9FbHFvbDRRdkJJbTZId0lqK25hVmJlL2Zy?=
 =?utf-8?B?Z3NSU2dJSUUxR0tFV1VRRGlxUEN2WWIwTXN2QTk5VjdwNFNuWXh6ajFGUXVj?=
 =?utf-8?B?TUh5OStZVHFXb2FaRGRmSVlRMXEwM0RrRU9Xa1V5ajZ0TDRQZm90a2FScEZk?=
 =?utf-8?B?QnoxazM4VUFTb1o5OXBNVUlhRFFjL0dxVnl5OXJaZ1hzNXpWZ1pIaWtLcDBS?=
 =?utf-8?B?TGxnQ1pNcTV4c010VkIwc2s5VHZPZlV0aXJodFMvVWpYNWRrblNDanNpcnJw?=
 =?utf-8?B?OEJZOEc3Ujh0bzZjRkVIaDBSM2s5WDdERzZmRDhwQmc0dGpxQWJNNmNjMWNH?=
 =?utf-8?B?QXBvam9hTEQzVHZ3a3p0b21kU05aY0h5Qm5YNTRRK1djTHRWbHdKMmErYmo2?=
 =?utf-8?B?OWg4V01PTTNLUnM5TmpBaVloR1NRYlFOczM5a0ZyYmxkNlJveVZHWW4zb0lZ?=
 =?utf-8?B?ZWI1Nm4xQzkraFY2OWVYZUY1Ty9UZDB1ZzMrQWVzMHVTeXhvU1RtS205bUJH?=
 =?utf-8?B?SHVwZlg3NkZBMG9KTUFTSzRVR2IxNDN0S2tkUHRNclRRdHFURTdxSlZsbWtm?=
 =?utf-8?B?TWNOZTdmZzBVNHZoZHNXVkZKOS91SEF5b2JQSmp6WTlxQ0F4SXBaUWxKVFV1?=
 =?utf-8?B?ZkdCbHhPYlpXTmR6a2ljbU5xQWNXanRPaEl6OXB2Y1NIQkltSzZvV1duV0Fx?=
 =?utf-8?B?ZGUxcy9LUDJoeXA5T0tpWWlSc2VNV3FOdkdJREt1Tlo5eVFrM2Y1bDRNMU5t?=
 =?utf-8?B?R0xEU3ZqbzNJeFdpQmRtYTRlY1Y5Tm1OQkY2aFlrRnpoMnlpZG1uOFpRWkxY?=
 =?utf-8?B?ajQyaTZsYXdrUlNQZlBLWkFUUGVYY3lYVEJoZjZTMDNmYkVTNVk3R3BJNVM3?=
 =?utf-8?B?dzRqaUNUbmtnci9oOEU4aWRwMXhwV29vWXBQWEs5bmV4U0xJWHlQSGNvTENj?=
 =?utf-8?B?U1F6ejhXZG84SjZRQ3dtRU9PQkNKWDV5WHlsRmh4c0NqSXpodlRHUm9idndS?=
 =?utf-8?B?UGFHZC9MSmk4Q3RFY2VReFpma2dGdTBMc3dlNStQNTlVdEs4SjcybGkweVl3?=
 =?utf-8?B?VW9tckJ0MW5DOW1XOXdKZHVibVVkenRneEZ5aVQyYU94UzJpZEI5M0xZVTZF?=
 =?utf-8?B?Nmh6d3ZUMW5VZWJySFJYalErR2J5eVJ5MXVyOFVxWXA1eGJ1ODJzd1Jha3pZ?=
 =?utf-8?B?VldGaFNtRy9mRFJpNW5jTEUxV1RMKzhxc1dCdVRyQSs3MzJnUXY4dEVwMnNQ?=
 =?utf-8?B?Vll0ZEVhSHFwbEJmNVF4dGd6azJVUmxyQ2YrY0hzK0M3RHgrZlVFR2ZmaW01?=
 =?utf-8?B?YW1DWXFuODVwd0Q1ZDl0ZW14VUM3bTZzYzNOZWZ3YVU1MURzV3h4bmI4Z0xU?=
 =?utf-8?B?ajBvYjA1dU91cVFZTnFmaTJKa21od0NERm5GS21Oa1NrUEd1bENSbFBTTVJw?=
 =?utf-8?Q?uIrvzM6YJw0y1LS6Ym?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: W+BrJy5DFhp/ZP2jsZNxmBbF0KyJJa+3ifRo+Q4kyY4eOkVC/bVHa0XDWdwbHIHNzwana6WYjD/FMLPsWam7MYxv0EccSSDd6vGGjCZK371jTWi9mViLPn5vByNvyoFzI7A+lLCswU2IByKZQmdUEiMH/mfbZOTHcWf44OKy9a69aZZkrt3NvVd19xZO+QBkoBoleGRQt1UcxZLqpzGRGn2D1O+p6jnVyBBqSf6JpvDjUWKbw4cAKcqv6erL8mVBiM1iVyQOykkkTA6mCbBOlCZ5P40NSHGN3Jy9fsxY+xTSLHBizkjasOiWReLKh2sfyjgHaEO8u0s3EK5qA+hrCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB352303.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc0bc70-c4da-43b4-7971-08df2df569bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 15:26:57.1935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1efkfglwiwzIosAr5VlAYxDG005kGhw/+p1TsI3mJr/ipy66EpCrwSL0ENplTurSZ6H39EMIKNWuePFv2+GbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 15:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248193

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNS4wLjIxLnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9aW50ZWwteW9jdG8tdGVz
dHJlc3VsdHMNCg0KPT09PT09PSBTdW1tYXJ5ID09PT09PT09DQpObyBoaWdoIG1pbGVzdG9uZSBk
ZWZlY3RzLg0KDQpObyBuZXcgaXNzdWUgZm91bmQuDQoNClRoYW5rcywNCkRlYmFsIEdob3NoDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBHaG9zaCwgRGViYWwgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNClNlbnQ6IDE1IE9jdG9iZXIgMjAyNiAxNTo0Nw0KVG86IHFhLWJ1aWxkLW5vdGlm
aWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBZb2N0by1tYWlsaW5nLWxpc3QgPHlvY3Rv
QGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+OyBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBva3lidWlsZCBVc2VyIDxwb2t5YnVpbGRA
eW9jdG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBR
QSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNS4w
LjIxLnJjMSkNCg0KSGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhl
Y3V0aW9uIGZvciBZUCBidWlsZCB5b2N0by01LjAuMjEucmMxLiBXZSBhcmUgcGxhbm5pbmcgdG8g
ZXhlY3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVh
bCB0ZXN0cyBmb3IgZm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRp
bWUgYXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQoxLiBBbXN0b24gTGFrZQ0K
Mi4gQmFydGxldHQgTGFrZQ0KMy4gTWV0ZW9yIExha2UNCjQuIEFsZGVyIExha2UtUw0KNS4gUmFw
dG9yIExha2UtUA0KDQoNCkVUQSBmb3IgY29tcGxldGlvbjogMTkvMTAvMjAyNi4NCg0KQmVzdCBy
ZWdhcmRzLA0KRGViYWwgR2hvc2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1u
b3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFlvYW5uIENv
bmdhbCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU2VudDogMDggT2N0b2JlciAyMDI2IDAy
OjQwDQpUbzogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc7IHlv
Y3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZp
Y2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAo
eW9jdG8tNS4wLjIxLnJjMSkNCg0KT24gV2VkIE9jdCA3LCAyMDI2IGF0IDk6NDQgUE0gQ0VTVCwg
UG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+DQo+ICAg
ICBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by01LjAuMjEucmMxKSB3YXMgY29tcGxldGVk
IG9uIHRoZSBhdXRvYnVpbGRlciBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPg0KPg0KPiAgICAgICAg
IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTUuMC4yMS5yYzEN
Cj4NCj4NCj4gICAgIEJ1aWxkIFVSTDogaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qu
b3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzQ4OTUNCj4NCj4gICAgIEJ1aWxkIGhh
c2ggaW5mb3JtYXRpb246IA0KPg0KPiAgICAgYml0YmFrZTogZDNiMzI1ODdjMjMxNGZlYmY5Njg5
N2Y5N2UwMTcyNzkwYjRmYzFjZg0KPiBtZXRhLWFnbDogNTlkYWQ5YWY2OTIyODNjNjRmZjE4Zjky
NTEyYzM1MDI2MDlkMGRkZQ0KPiBtZXRhLWFybTogMGE0YjkxMWQ5ZmQ2M2FiMjljNDUzMmE5MDdm
YWUzMjgyZGJkY2ZlNA0KPiBtZXRhLWF3czogNzVkYjRiNDg5YzIxZmU0OGRkNmYwZmYzZDBmN2Y1
MmFkNjcwMzNmYg0KPiBtZXRhLWNsYW5nOiBjYzI5YmViMjEwYWI5NGVhY2M1M2JiZDY3ZTI4N2U0
ZTMzZWRlMzQyDQo+IG1ldGEtaW50ZWw6IDVkMTUzZTM1YjRlNzUyNTA1ZWZlYWUzNjhmMTg4ZmFj
NWUzMWNmMzMNCj4gbWV0YS1taW5ndzogYTIwNjVmMzIxYTNkYmNhMWU2OWYwNzA1MDI5MTdjNzY2
NTNkOTEwNQ0KPiBtZXRhLW9wZW5lbWJlZGRlZDogMGYwMGY4YjlhMjE5NTA2NDBkYThjNTcwNzM0
M2U1NTQwMTMzZjg2ZQ0KPiBtZXRhLXFjb206IGVjODBhMzZiY2UxMWQ4MTgyYjRiYjJhNmZhMDM1
OWFkZmVjY2RlMGENCj4gbWV0YS12aXJ0dWFsaXphdGlvbjogYzE0MWIzY2Q2MGFkM2ExYmJhYjIy
YjQ4ODQ3NDJkNGMwODJiZWRhNg0KPiBtZXRhLXlvY3RvOiA4MTgzYjU1NzgzZDQ1ZGQ0NTY5MTk4
M2JjMGI0MDc3NTJhMzQ0OWY0DQo+IG1peGluLXdyeW5vc2UtbGludXgtZmlybXdhcmU6IDcxZGZi
ODFiZDk4ZjU5Y2EyMTI3ZDM5YjEwMGVjYmI4Y2UxZTBiYTMNCj4gb2Vjb3JlOiBiNGYwNjMwM2U1
NWM3MjcwYTg0ODJhNjEwOTI3YTFjNDFkNWRiZjljDQo+IHBva3k6IDRmYjcwMTZhMDc1MDc2ODMz
NTllYmQ2MjBmMTk1MWZkNWVhNDRiZmENCj4geW9jdG8tZG9jczogOWQyY2I3OTBhYmY1YWQzN2Iy
YjFmMzU4MjNkMjM4YzU3ZjRlMjFhNQ0KDQpUaGlzIHdhcyBhbiAiYWxsIGdyZWVuIiBidWlsZCwg
c28gT0sgdG8gcHJvY2VlZCB3aXRoIFFBLg0KKExvZ2ljYWxseSwgcXVldWVkIGFmdGVyIHRoZSA2
LjAuNCBRQSkNCi0tIA0KWW9hbm4gQ29uZ2FsDQpTbWlsZSBFQ1MNCg0KDQoNCg0KDQoNCg0KDQot
PS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzc2Mik6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdlLzc2Mg0K
TXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTIxNjM0
MzEyLzk5NzYxMjcNCkdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2MTI3LzQ0
MDMzNDU1L3h5enp5IFtkZWJhbC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KDQoNCg==

