Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04417E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:32:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web10.33396.1733477551955430486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bqInnD30;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733477552; x=1765013552;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rOkdMtmsz88QBAPyE5iKsP69VMK0CNTiTL/9R9Iq9ak=;
  b=bqInnD30yt37GjEb87xp3UrFYvSx2CZtPBJaTjXs3qnWQc45XP2F0oTn
   KAqg24TpUa4sP4TrUQvncc9PI2Asp7RoWXRmlPD1PwsqUKsvaRcfVuW9C
   slnJjaN9mk3OcZshldYI/UWR7UHgPOZ52+dEpgm63Ow03OrJaRpUgjGO2
   QWC1eCA1mccDHub1a37KkEr9eljTgOXdwHB29BEMjKvydepMUpzIQL7TX
   haiAMEQs01fhR3VwOr8WkkRdC6XOFgt2oPw3KJZFmjtjrOWHkmU7PQrFn
   wF3g3ZxF2AxbYJAoICu1FuFg46dQ2A/8hKyjeiZCDHoSaLGwPeyXQOmj+
   Q==;
X-CSE-ConnectionGUID: E9i2f0piSrqrIqu1S976Tw==
X-CSE-MsgGUID: DL3ZntGYRAWs/par1DTpfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="44843800"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="44843800"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 01:32:32 -0800
X-CSE-ConnectionGUID: 9QjnZ24WQASva5wEQtNyDg==
X-CSE-MsgGUID: kA1+zC3yQ0eMKbXmLXlc6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94171395"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Dec 2024 01:32:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 01:32:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 01:32:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 01:32:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7156y42zmbyq89cIYgKfdLm64Z5ReAQAYlfldGNPbZKSqubOAIm0q4CT3Koe5EGnftLmNqmZ1YsVPDFSH9zvKekEeJNeiWrST+0FHnPjNfUG8maRsAtK99pz5TGb/8xecu4G+w4G/SBVh/tapeFPGrMt84s16UybZ/jWM0AtFmd6G6nfyDnp5lWfktzcQQBACGfMDfGC+0BOAQmOgcPJx6bGf5tnUenwHfXRG4Z4F1ZDmYKHEBhybHm9w4irzP7h8ZFRuQWtpE+oYW6DyogvPXgTFX27cq2P0zUxVI/EWe3ePWD/m1iUl5So5G95Uesv1QKfsTENs4Vf04tsOFNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOkdMtmsz88QBAPyE5iKsP69VMK0CNTiTL/9R9Iq9ak=;
 b=L7yy+2WOGMzjv1KcrwJ0WTZmQNLRtbHQhrjlSRI4Z4BEUkg2gH2lDBCtpSAObYTnQvZLNIELett9mBh/taxdMfV/mREjMUeERgxS4c2ks4uGKKIwf+eOluJo5udTFkHY8tNWJy02mAmxvIYSkNEjcPTlkG0W+j3XjYw3347oXTuV44/GpFEobHunMFg5iV+mbeY/sGbrVF4nH+aiIGPniksbOOCmGF+eZ54+rF8PYvVpegxPzpF9LLkOY7nqG8cCuwAkosbEMid80J4GMzyzTqH+V4S6xtl+M5bU9n6V4qyDkF4zUYibabBz+19iA4bnTKnwBNi4lGRyKSR/yCgtFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SA2PR11MB5052.namprd11.prod.outlook.com (2603:10b6:806:fa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 09:32:27 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%5]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 09:32:27 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.1.rc1)
Thread-Index: AQHbQ37BxpRbo+OG0ES8J3/IPACDvrLY+lJg
Date: Fri, 6 Dec 2024 09:32:27 +0000
Message-ID: <DM4PR11MB7760C69B7068A3F756BA3852A1312@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdbJZ7MT7Bz8RAKmXLQhkHTMr8daWWRiq8yY9Cz5FU0LRQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbJZ7MT7Bz8RAKmXLQhkHTMr8daWWRiq8yY9Cz5FU0LRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SA2PR11MB5052:EE_
x-ms-office365-filtering-correlation-id: 50a78d33-dc69-4b0a-a99f-08dd15d8e603
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGpCNkx4VzQ5M0pxR2xWZTdEVzRJYjdCalpsRnA1TUJmUnlEV2VrSGIvZXYz?=
 =?utf-8?B?YU8xU1dYK29lK21QYzBKSW84VldtNzMwZTRmREJGbEY0dlUvOFl3MUNOblRt?=
 =?utf-8?B?ZVo1dCtkWFNwbWthcjV6bVhlSVIrM2ZhTnk3SHlYR1UvZ245SUlUZzBxTW15?=
 =?utf-8?B?NkUxQWN5bGdnN0haQjc3Wmt5cnRRcXQ0bWJCWVNmMTJTTGlNQjFPUXlkcHE2?=
 =?utf-8?B?WUl0YXhKS3JrazBPbHFxY3ZVK0NGUjFZWXNEUTNXV09aT0x4SVYrK3pvYkFn?=
 =?utf-8?B?SzdJS0ttOGd6NDk4NUQ2Zk8yemZjY0VVVlJFOWxqMFFxKzl1aWJBZXF2SUkv?=
 =?utf-8?B?Tk9iOFV5U1RGcGdoSHQ0R0JwL2FqeXZzNzA5dTBNNEVjeVVMRHN0a0c3VDBZ?=
 =?utf-8?B?Y2srbEZhQjVYa2F6NkJnVGJSQ3FXTUtxb3hORnY5ckRFWDJzTGoyMjFXbXdG?=
 =?utf-8?B?aWpWYXlscTZBVk9HSUdvOTZHV0tFV25JMjRPZkZaenIrQnZOWUQ1VUIvZHhy?=
 =?utf-8?B?VHpETWh0NlVEYytBSlR0L0hhNkFiWDVqTFdwYjdxOW9NZXBPNk9ZVDdzN0tQ?=
 =?utf-8?B?NFFxT292UGdtRHZuN3J2VFBtYU1qcVhFb01aRmVDalVKNnFPRnFBUHJVWXVL?=
 =?utf-8?B?VEYzRmhNT3RzbytGRWg5bi9rZUhUSVIxbFUzUzc3d0V1UXlaM2tRZWFHQ1FN?=
 =?utf-8?B?SjhWWWFpdllLR1pNbnBUZU1tN0pDYVZ3SU1MZWdRVkVnV1RKZmF4L3BQQ1F3?=
 =?utf-8?B?dDBURW9oc3dHTnlvRjNrWGs0aEpYR3AybkNPWFB6cmpnT3dYL0NES2FkSUhl?=
 =?utf-8?B?L3pjWWhqc0JTSnlPSllsenJnZUxydHB2Kzd2VkRqcjdkWmRrQ0RmMUltOUpM?=
 =?utf-8?B?YXVEeitTVVpLekhLVlRsU3ZkY25wbmRCc3JJQ1FwMW05Mkx6ZVJQdzNYdWdD?=
 =?utf-8?B?WFF6NXBONEZ3bXpXT1dYQ3c5SUs2SE16NHZkWFRhRmI2VUFYcnNXaG96WUQr?=
 =?utf-8?B?QklLRnJRWitrbFZqbEJhTk9UN1VFQTVPNWVDVEpKYld3bGdwV1J3RjdmZVdQ?=
 =?utf-8?B?TEF1Q3liMlV0VXJrQVVZdEtwSEZHMDMvTWpHdUdmZE9qZ0pkNk1DQVJsZ2xv?=
 =?utf-8?B?cVFqVlNycHlSOS9Va05aZWZJNGJjVmkxcExYSTdEOVVmSnlSdGRWZjBVanpO?=
 =?utf-8?B?Zi9JVThXbFlNeTM1UHNvbzI2MzZweHE4czdCV2k3SUM3ZExubjIraVY1VGsr?=
 =?utf-8?B?MmRYUlNLSHkxWHRZMytyU1lrNDExYytTU3BJaHhxWFUvcDBsZHQzSUdpSFd4?=
 =?utf-8?B?S0VKLzZZOFJHMVZ3cW9UQlNORitBRi8yL2Nzbkoyb1l0SUhFQVU5S0VLa3Zi?=
 =?utf-8?B?bFU4YWE3NHA4QTEvV1pLb0lGM2ZBU0lCNDc5VjV2Y2dhM2dtOVlvZUZSV3ds?=
 =?utf-8?B?cjE4TVI5RVRMcjhTNWFRSEU4b3VFTHpxaitJV0dXQjY1TjVjSW1iRE1KUzAy?=
 =?utf-8?B?L0Z4ZGphdFdnR3VaSnk0ZVJ3SG4zNlNGb2NjM3dUQnFwQjdoSVBiTjdSMG5v?=
 =?utf-8?B?eldSRldOaHk1cDJHSTR5SFFRbHdoUllWeStYd0lMNjNTTjFuc3kxTTFodUQ1?=
 =?utf-8?B?dkVXZlM4SGxqTkREUkM3VDNHUElZK3JyWHdPT3BBSkdHZG5hUndVb3pxZXo2?=
 =?utf-8?B?L3MycmlTTkVPaEl1cnZXSTk0N05aeExWSDk3VVVDTmh4OVBWRHFpUHN3dG1N?=
 =?utf-8?B?ZStNMWdTTXFHVklCTnN3ZTNHRDNYN0VZOGZLS2w4UEZLWHBUTFdtcVVaTjNq?=
 =?utf-8?Q?v+E9VsJ9CmL00HSn5/k8dsa4y/ikZOqH4hGkg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWZQNkExN0FoTkltUGpzV0pRNnUrTGZNZlZNMkxjRXo2YzFtOWc2aE4zaHE3?=
 =?utf-8?B?RkY0S1EwL1E4c1RlalhQTk9TUVIwT1l4eGFVMm04QVlHU1JpL3l1ZUtJYTRo?=
 =?utf-8?B?Z1RnN2RSV3l5NUpueXRVT21XTWFEWVVvcVFJaUhUVUltaG9DcmR1K0d5RTB1?=
 =?utf-8?B?bkh6aUsyNC9UdmRqUTdtcWZncVkzSHBza3FMNzR5cEkrUGFEMitXc01WNWNG?=
 =?utf-8?B?TkNvOVMrdFJVL3NZc2ZSd3lZQ1FYb1JHU2hKMzlBdCtJK2xIeDJaK1hhSEFs?=
 =?utf-8?B?cFBRZHB5L0FVWlNPdU1FUVBjWmFKMHlJNVlNMk4zb0xXeGpheDg1R0IzRWJD?=
 =?utf-8?B?SlBZNzdoME0zQU8wM3JmMkN3QXhZeGhueVVwTTFHTnYzYnVOd3FsOWloR0h6?=
 =?utf-8?B?K2VkNGY0SkkyTHFoTHBWSXlxUllEaFE5T1VCNHVZYnk5L1l6YmtSWTA0bHNm?=
 =?utf-8?B?WWJ2enJ6azE1OStCdkl0Y1IvTStmWTU5RVFqREhtQ0Ywa1F6TGhmWDVMZVRY?=
 =?utf-8?B?b1pENjNFN1lnM3NrT0VZUExxWGFiQlBGckhRKzRud1ZSSjI3d1BvdlpFdFRs?=
 =?utf-8?B?Qk5qcUpFMnQvM2lTWHd4UVNLMERHeHRZYk90VU1XQzBwNHFESWhIRDNxaUQw?=
 =?utf-8?B?K3JyY2I3VmQ0VDZLRmpadyswL0xwcG5lc25nY0s2cThOR3RBL0RpZGxjQjFM?=
 =?utf-8?B?d0VTSEhUaG1Udk90N2VqWXFJb1NQbEcwTGo2T1I0QjBmY3Q5S2lQYURWUzh3?=
 =?utf-8?B?RFRFMFJvcWJyeHNHMCtpWSt0aW9kaW82endUbTN1NXF0RldlTGxEcUViWE1a?=
 =?utf-8?B?UGVnOU5RVHYxZGhoOU01WWZrbVZGTWRQc29COTkxL0FQVGtpbVVxNHNzT3JT?=
 =?utf-8?B?QllabjdFRkhXeGdrcjZ5NG1XbG1UUEhaZC9nSXAwb2VMWTFNZGYwYWJqZGZw?=
 =?utf-8?B?Yjg4OVZsczZsQTlnZXgrREphRzVCalRTSXZSaVlBMEh1QndCejQ2cldvbFVG?=
 =?utf-8?B?LzhYQmplWmpkRy9ib2dUNnZQdXhkVHBTY1pjem50RDNiMWQrOHNZTDQyNHlx?=
 =?utf-8?B?SVZmODBnekZTV1lVZUFNeFE4OFdMZU1tWG9mTUNFMDJtZGhONjNSbGQvTW1O?=
 =?utf-8?B?QmY5am81Vlo1OHZhQmNrRWcxQ0tHRUJVa2dQRFZ2SE1EM2FTUDI4Q3pDVFYw?=
 =?utf-8?B?K1NvZzd2bHFiSDlXdFlEcm1rVytSaWVCbUEvcFJ3T0lSVldXMjY5SGtJRVNl?=
 =?utf-8?B?dVB4UWU2WEIzYnIxY3hFcTBFNnI5WWJBbnphanRWMzBpRitydFFmZXVGMUEz?=
 =?utf-8?B?eVpGWmQ1Wmc5OEhwWGVFZWFsSkRZdWU0angzZ3NKT2p0T3FKektGQlVyRFFN?=
 =?utf-8?B?c1NVVlJMWGJaVGNpK2dsNENDRFl1L0hlRHk0TXJUM0NqUUxZTXlHTDIvUklF?=
 =?utf-8?B?NkRWaHZ1QXhYZ3pFeXVQSGVZcHhqV05aU0dOR3ZkZ3ZzUERZMmhXVWEwRW5r?=
 =?utf-8?B?MVBmNHgwUGJlbEpsQmVSUmVmRUMvS1NOaWR2M2s2NlF0Qk56a3RaU2t1UUZi?=
 =?utf-8?B?bEZyTFhoeXV3QkV3UTRZVTJIU2krenNnOVh0dHBVcm5IWVprdTJEazR2bENL?=
 =?utf-8?B?bjJLa3VBVWxyRWZwTmlOVVNLd2JBTnNhbFZiaGttNEsvclJCVTJYMWpiTERC?=
 =?utf-8?B?aFNaNHR0Z3l0QlRMaTIxQkRVZjJka2doVDV1M1pWMDZ0S0IzVG1taUZEanF3?=
 =?utf-8?B?YTlhUmpOenhYQmVkNGhDWGp2Y3Nta2RnOWJXYmM3UXVUUUlHSkJRUVpsc2M1?=
 =?utf-8?B?T0M3UGVhSE9XYUJKTXg1dG9FMlpYSnNiTzMreFpvd2s5eE80U08za05seEFR?=
 =?utf-8?B?N3Voa2dqTkZIcmdTWHJCakRtYzBpOXBPK2NSdWxzNTR5VHhmNzQwYUQxT0Nn?=
 =?utf-8?B?VWsrUUNVVW5Uc0JPdXNEYW5YMURVR3U3RVJ1MHRZN25YdXRwUkN6OWVwQkRS?=
 =?utf-8?B?cnlkSUhLRUZLWGZOMDdEWW5yNVNoSE92ZzlGY2VocnRxR1RsWmxBUzRTSzhG?=
 =?utf-8?B?TVpqMkpObE1ZTmJ4S3ZnM0V0RkdwR0Vpb0ZwRVY0K00rSFk0cHFyT09GdUYr?=
 =?utf-8?Q?x+BtjFQVWdCznenQVVI90mAAY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a78d33-dc69-4b0a-a99f-08dd15d8e603
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 09:32:27.2205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XofSBemhxp45nt83goxtUNjzC5th2CJy6buNSQ/VIdTn/HMej5D8DxtIxRCM6KeeWDhO5MTlBA5EHmeKzvq8Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5052
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208409

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTUuMS4xLnJjMSBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6ICANCmh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvY2dpdC9jZ2l0LmNnaS95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9
aW50ZWwteW9jdG8tdGVzdHJlc3VsdHMNCiANCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8g
aGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4NCiANCk5vIG5ldyBpc3N1ZSBmb3VuZC4gDQogDQpUaGFu
a3MsDQpKaW5nIEh1aQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1aWxkLQ0K
PiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFN0ZXZl
IFNha29tYW4NCj4gU2VudDogU3VuZGF5LCBEZWNlbWJlciAxLCAyMDI0IDc6MjIgQU0NCj4gVG86
IFlvY3RvICh5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnKSA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlv
biBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyDQo+IGJ1aWxkICh5b2N0by01LjEuMS5yYzEpDQo+
IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5b2N0by01LjEuMS5yYzEpIHdhcyBjb21wbGV0
ZWQgb24gdGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4g
ICAgIGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTUuMS4xLnJj
MQ0KPiANCj4gDQo+IEJ1aWxkIFVSTDogaHR0cHM6Ly92YWxreXJpZS55b2N0b3Byb2plY3Qub3Jn
LyMvYnVpbGRlcnMvMjkvYnVpbGRzLzU1Mw0KPiANCj4gQnVpbGQgaGFzaCBpbmZvcm1hdGlvbjoN
Cj4gDQo+IGJpdGJha2U6IDk2MDJhNjg0NTY4OTEwZmQzMzNmZmNlOTA3ZmEwMjBhZDM2NjFjMjYN
Cj4gbWV0YS1hZ2w6IGJlZTg4ZDUwZmJiMzEwODZlYjcwZDI1OWNmODZhNGU0ODA0N2MzYzcNCj4g
bWV0YS1hcm06IGFjYWZlN2M4OWYwNGE4OGVmZDhkNDI3ZGRkMjFlNjZlYjRiYjdmNTQNCj4gbWV0
YS1hd3M6IGRhNTk1Y2YxMDlhZjZhZWI0MGQ0YTU5MjM0NWNmNDRjNjQyZTYxZTINCj4gbWV0YS1j
bGFuZzogYzcwOWE1MTk2ZjFlODY1NDQyNWI0M2I0NzgwNjQzOTUzODZjMzZkNA0KPiBtZXRhLWlu
dGVsOiBkMmUyODk0MDAyNzgwOGVhNTZmOWQzOGRlYWRiMjAwYTk5YTg5ODA1DQo+IG1ldGEtbWlu
Z3c6IDc3ZmUxOGQ0ZjhlYzM0NTAxMDQ1YzVkOTJjZTdlMTNiMWJkMTI5ZTkNCj4gbWV0YS1vcGVu
ZW1iZWRkZWQ6IDVkNTRhNTJmYmViNjlkYmE3YjhhZTExZGI5OGFmNDgxMzk1MWZhNjENCj4gbWV0
YS12aXJ0dWFsaXphdGlvbjogOWU5ZjYwZTk1OWYzNzEwZmI3YTE2Yjk4MjlkOTUwYzNkOTRjMGQ0
YQ0KPiBvZWNvcmU6IGI1MTFkMDE0NmEyZThmMzE2ZjRhZWNjOTBjODUzMjE1Njc0MDEzZWENCj4g
cG9reTogN2UwODFiZDk4ZmRjNTQzNWU4NTBkMWRmNzlhNWUwZjFlMzAyOTNkMA0KPiANCj4gDQo+
IA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3Qg
QXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRv
YnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4g
DQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM0ODMp
OiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj4gbm90aWZpY2F0
aW9uL21lc3NhZ2UvNDgzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL210LzEwOTg1NDYwOC82NDI0MDQ0DQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1u
b3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTog
aHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlv
bi9sZWF2ZS8xMzU4MTgwMi82NDI0MDQ0LzE3NDY4MTM4OTcveHl6enkNCj4gW2ppbmcuaHVpLnRo
YW1AaW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

