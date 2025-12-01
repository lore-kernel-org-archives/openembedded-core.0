Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A01BD116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 04:49:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13561.1764564548646080159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 20:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TdWxcHMJ;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764564549; x=1796100549;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ht4bDLRaNMetArDkPiJepdiOxX7CIm/K83YLIZLMHkc=;
  b=TdWxcHMJv9tOHe/wzUAPa1NfpdYm9+G8xhmJdsPk9seaXnpjPSxf8+mJ
   I1Y7LmWvDSv0atrMErF4DffR+0ZklkyAvexlQACJx355RY66HCoCo7PGr
   td18v0TbpLswNTZBQYkLtdqHmpXQ4IWgTWc6lnLkFM7E/SoWryBv/jgFp
   r20YqofvkMGbDE/sRCe/clwdY3OCEROAe1DrPX/Obo3piRdrWcL0+nbyc
   ONUt+i44yWuHbS1TXyMcEd8pJ4CiHD0tqIJWDilqu6boXTMZmgDD+bHId
   nhxabhQdB1zSJrTxVqKFvIJy3G5HALuI8a/C3NtdcCbGNbr0iNcI47onC
   Q==;
X-CSE-ConnectionGUID: X+PJOfHkQfOGvu0xjILBDQ==
X-CSE-MsgGUID: gZP6yZ+TQ+uz3qXAoRjoRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66208840"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66208840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 20:49:08 -0800
X-CSE-ConnectionGUID: KyhRLyVxSsGzWrhTe7RBvg==
X-CSE-MsgGUID: KYYeToRIQQi8igo1uwSG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193091981"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 20:49:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 20:49:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 20:49:07 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 20:49:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yH0safPHQprqNu2vXHTSi0gtlTDywh9HkE+RCvpHsgxEYnmXnaXbhi29EfZlHvIheu8g9tXVlUJ3CipEBgc4eEEK+5/X+ZpIf0fXZT/ewSi6BS3KVk5kTeo5VIJ+DP23lz/++8y5oq2FBgTeMO22nMu1DuuwGr8vIprXqKccozvmb4KH9aQO8vluZ4UIVWJj0+KptUmZncB0FCnzVVG8kVb6mssRT1DjyUSCWHTDyVYd7QqNVQZOa5mSY1O0K9BxmVZYRxqG/r8P4MbLdWEbVS83p8hzi9AHF/2WGKRPPBN1iTKHqrmylygPCCQDFl7Fz09ZTmI3ZmuL9ER9mQxdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ht4bDLRaNMetArDkPiJepdiOxX7CIm/K83YLIZLMHkc=;
 b=wTjhK1eXFeuAfMvmvfKxfYX4jssbGN0QkFMCeC/MQ33DwVVipO1l8aOHr+ygyxrzhc0ZDM355khtXV7SG7+pxUKKL0l5Jrx4r3Y9oknpszeej64BamSEzDd/W8V9j510mCBxFraOH/APP0hnbCgvqtzyIykIqaqXk+zbCXNc+hx9NpYMnAVknRA7xutAfJhgoe+64AEmxmxCj7K+RKANWhEIOgTaSeEPa42Flr1VDgEsulLj/JI7gWq7K7iKkIpX88b/GcB9vZ1Yzjq2oPgt/1jcYdni4LziBkBo8JNR/gCt7/DPER3wO7rKn22c5SvXO7hFKXYGOeWP2Np+hEI3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14)
 by DS0PR11MB8084.namprd11.prod.outlook.com (2603:10b6:8:158::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 04:49:05 +0000
Received: from SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46]) by SN7PR11MB7018.namprd11.prod.outlook.com
 ([fe80::3950:3558:6566:ff46%3]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 04:49:05 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: FW: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-5.3.rc4)
Thread-Topic: [qa-build-notification] [yocto] QA notification for completed
 autobuilder build (yocto-5.3.rc4)
Thread-Index: AQHcYH33eP0MUdCOrESM0T/G/HhOELUMObTQ
Date: Mon, 1 Dec 2025 04:49:05 +0000
Message-ID: <SN7PR11MB7018123D9587279AF201B7CBF4DBA@SN7PR11MB7018.namprd11.prod.outlook.com>
References: <0101019aca98d702-1232ac58-8150-4171-beb4-d8721b8ea2b5-000000@us-west-2.amazonses.com>
 <5567edfe9ba69de67e43afc33bb69570902cbff8.camel@linuxfoundation.org>
In-Reply-To: <5567edfe9ba69de67e43afc33bb69570902cbff8.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7018:EE_|DS0PR11MB8084:EE_
x-ms-office365-filtering-correlation-id: 6a79c8f0-626b-40fe-5566-08de3094f4ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|7053199007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZGRuM2hRQUFYL0x2L244UU53cFdNT0NHMWI2bFhwZ2NReERid3pkL1I1M0Vu?=
 =?utf-8?B?TGkyTHI4eVYyUEdxcU9LdEVzWDhXRm1tNWZxN25VOTE2cmRZYzJFT25rUTdH?=
 =?utf-8?B?RUk0VU9zQ3FJVzBrcGdPOSs0ODdpU2hjOTY1Nkp1QS9tUnNnRE4rSXc1a0FM?=
 =?utf-8?B?K0tMQ214Nkt4SG00RTVleFNVcnVyZmNkQ1NMNUZrT2tvaFkzaklzTVhDNmpD?=
 =?utf-8?B?YkUrOFNJRDVlQ1dIRnVZR2p5OWwxZCtuNUoxTjIzVEE5bG9TeWVPejZmL1By?=
 =?utf-8?B?VndyOUJqT1VDUDFNL1JpT0FxNXByWUhXZjhPVCt0Wmd0SkovWUJkU2tHbTQw?=
 =?utf-8?B?Y1RxcTl3UHE0YklRMFUvcVNBWlVCa0NLVS96aDJ2Nk53clJKMTFoR3NPRFRJ?=
 =?utf-8?B?UEY2bUtaY0Z6dGZWVE9RZEFFRGhvVTF0Yk03OW5ROUxtMjIvbDE0dFlwYVkv?=
 =?utf-8?B?OEZFM2FRa1FEMytIZWZoTWkvQlRDdGVWY2RnWmhYQlE5ck8wa1ZDVnRhRjhZ?=
 =?utf-8?B?OUU0YlBTcEVQcnBQY2tPek1FVUxFZXJkZ3daOU5lZDIwR2ExU0pCVFZWVmw0?=
 =?utf-8?B?NHVHKytHWENVaGYwcnhzb0JaUDFINHFxdXZyMmh0RmVGajJkWHdOSEUyMG1w?=
 =?utf-8?B?aTVWbEhLZ2dOMnYzRS83RHVHSm5lMG1CbDEvbjFtS0ZzbFhwbHFLbTduUC9z?=
 =?utf-8?B?djQwcytKRlJhdGZuSGlnTTEyTFl3a0dVZEgyQm04OGV0eU9mWDlpVGNIYmdx?=
 =?utf-8?B?RGRtbkJ6WUxmcDBxMWxnWGd3QkYzL1RkKzdZTEpGM0hOVTdLNUpNdEZRMEl1?=
 =?utf-8?B?cjNPT245TytEWkRYUVJGQ2NsWFZ2NW5rWmkyR3dXOExCSlh3TmxGUGlXMVMv?=
 =?utf-8?B?SmpBNGwrNnhvalhwenpiV0xadGVLaUJTWjlUVnRQbnBpWDA1T3hBVWpOajFl?=
 =?utf-8?B?TGFJdG5QeGVJcWxPT3Foamw3dlB0NncvOXFPU1FTc3dNZGRiOFJlU0VFWDhF?=
 =?utf-8?B?TU5EOHdMZjdWSkwwaXhTdkRzNlF4bmJ0RmdLK2lzZ0tTamlDMDVzdTRFQzRh?=
 =?utf-8?B?WFQ2eUFsNmhzM1l5amtKajJpUnMxSXM5Z0g2amJpSEhKYUNMSlR5M1VySUdV?=
 =?utf-8?B?c2Y2UFNjMzZhcDVpZDIveHVHRHQvaFlzM1g5MGk3aG9ERnFvSGl5WEp4VmUw?=
 =?utf-8?B?T0ZCSmtFWDg2aUtsRFpZTzZpZVpmME10UHpyVEl3bnF2T0VQaFNwbkU2Qk5t?=
 =?utf-8?B?WUhOR0ZjNE1xT0pPdFNiS0lxMUhzUUl4Z3p2Skx1L1FMd1UrQTh4YWx3SUhx?=
 =?utf-8?B?dXV4ZzBwWnJvZHVYRTJQc2hTVWcxV1YyQW1tclU0VytjN0FRVUQyUjRYQ3BM?=
 =?utf-8?B?MjZDZUNJeDN6bm5DZmI4Y3cvQzVRM2lvMUN5bkdMRVNySzlaU1pNUzF6RE1v?=
 =?utf-8?B?TkdtSFJ0Z1Bra0FFNEZESkFXN3Y0d3ZraUk4dmxqR3NnMHlzbkx6ZHVWaXdv?=
 =?utf-8?B?NFpicDNtNXhJWkVCNlAxMEZtNEpuZXlVVzEzMExzNStIYmJReXVGeXEwb2FI?=
 =?utf-8?B?MEhBWUxWeGU2d1FuVitaWFFrMU8walEyRER3bmFPRi8rSnRTZEwwblNFR0hM?=
 =?utf-8?B?YVE1enZ1ZGVzRHgzSk4rc3pacFJ5ZTVkbXhJak1YQ1VvejdKV0VXdkFZa0VN?=
 =?utf-8?B?VFhBRVNYVVphV0MxWmYrelllZDNYbTlOTzI4WXI1cXU1OGprL1c3YjhFZ3B6?=
 =?utf-8?B?Nm45UFNTQUVOd3dSNlR0bGI2Qmw0eTJ6UTk2TzlqRWNSRkZLMy9TZzM1UTdr?=
 =?utf-8?B?RXdaQTd1Q2VlUlJiZDZPalVmWFRGdXV3aEoxSVJmbzZvbGdKUDVDc3VqcTFZ?=
 =?utf-8?B?Vk90UkNkVkg3WDlMYlAxaVpGMmQycUJRME95NnlWemo2SFNyUC8xb2IybUdj?=
 =?utf-8?B?OVlTYTlIbjBENFV5NzJVQ2ZjQWtnUEhwR3dEYngxREpUU0RUZ01RcGliYkpq?=
 =?utf-8?B?SUw0VEo0U093PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7018.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1NtQWlMN2RBYXo0NW5QNTdvSmZvNW5MM2pkNU55SXFZbHN0NkZuWkpNMTRj?=
 =?utf-8?B?RTdHZTZwcmpDZjRjQmxYOFVITndsV09VQUtaZWYweFA1RmEycE91NlBFek1Y?=
 =?utf-8?B?RWRQTEQ1MUxGT0hVUlZwcXkzejdlcVNISnJuelpIRUdtOExvQUdaOGxVSUJu?=
 =?utf-8?B?N2t2SzU1NVNqY1JLNjRPV3lYRjFCQkZ1dUtYam1Kc1dZSG04cXNualpjcHJu?=
 =?utf-8?B?QStiV1NPdU5xZ0ZGdCtlbVdHTW8wOFdQblB4SjlXOS9xcHlxOUd4SCtCZitF?=
 =?utf-8?B?YmZwQmdISS9KNmltajk2R1RTcllkZUNmZ1dmeVhrOFNuZVBEbkNydFJKN2FM?=
 =?utf-8?B?elc2TzJsWXZBRU1jaE9pMDJjWGd1cXpXSkR2NFU5L0xWclRZZytybnRZRGNF?=
 =?utf-8?B?WGZRR1VUYkZpanpwUUhmTXNHTFNTVWFWTkZINHpMVFovcGd0VkRFNnc1NU9I?=
 =?utf-8?B?LzBueGF1ckUzeTJPNnVkaThMczVORzhsT0g4UklRVVo1MTZIQW5BcnNJbnM3?=
 =?utf-8?B?SzllYnR1eVJwdFZXZklQaEtjTVVpS2RnaVdiSzlqOG1wWW5BSVBDMWJyVXRP?=
 =?utf-8?B?RGNZd2JJZEVFcEhTNW5vRDRzL0w3UHJKZ2ZlZ1hrUkY0UVJzWkpsUFZQYkpD?=
 =?utf-8?B?aEx6akFDNm9xMWxYYzhIaUVNamF3ZzNmUUtkTzZJWlJRTDVVNmhxQmVvM2JN?=
 =?utf-8?B?d3JWL1ZYSmhoSzRrb1hGSlhiT2hoMW5tbEZrSnBtSDZUN2xlR09QMURCQUg1?=
 =?utf-8?B?L1ZZOFFGMG1mcE9uMVlOYTVROG42YVZZdkN4WnN3ekQwa09UeHNjR2s4dVBN?=
 =?utf-8?B?cWw0bnQvNzV3dlEvZjhUK2pJT3ErYnc2cHJXVCtxNDY4ZnVBUjdldHZwVHZ3?=
 =?utf-8?B?d3dPL05oZkFPdGZRT2o0U2lOaHpEYjVHTkszRyswQWJ5dzBDNXJrTERsa3BT?=
 =?utf-8?B?S2tkanl1dVY5bTArck5Cd2VGeTNlaTNHcjYvRVcrTkpTT0s0TFIzNWJaVVZj?=
 =?utf-8?B?d3U1Z2QwakUyWHhvN2QvRUphQnBTaEhUaGtXMStIZUtlVlNxT2w5NmgxUGhY?=
 =?utf-8?B?N29BT21Md0ZLc3FETDhnVG9IMEJTSHV0ZjlHRHVrVjRkanFObU11a1VvcGhT?=
 =?utf-8?B?L2p5M2tGaWY5elA0QVVKS0I0dlBKTWgyNXlYRWhBRnhSNmZ2Z3grUjVXWkxp?=
 =?utf-8?B?S09tUmgyL3FBWXpIbis1WGdyWHFWMmFtRGYyakFaN2pFcWFPU0syQk5vcDVY?=
 =?utf-8?B?Z1VXTzFzaWM1T1RMMHJyaEMwRlcwMkpGWnhCQ0traC9yQVoza1hjckVDaFBi?=
 =?utf-8?B?U2dvWCtnV0NGYlRSc0R4bzErcmhTV3VYWkxvU2QxeWg4bjBEK2lBeXlNTDk4?=
 =?utf-8?B?VEFjNVdVUDZTREUzMXo4M0Q0R21CelpZd3hqZzJLRzd5RDhzSnJnaFNzWjBy?=
 =?utf-8?B?bk1USEVhZVBGQnBLZXNoOVdBYlI0REdSdDhCazBqOTBmSFlUaHRESXpOVk9Q?=
 =?utf-8?B?M24xUVY5ZFJxanoxV1lXQlpINk50eWhzV3FsS3Nxc0tvZXNvMEJPcXpvdFEv?=
 =?utf-8?B?WkZrKzh0c1hOYjFLS1pKRmkxUzZGakNaN3grN2FvWGxJRlo0TDU1ZCtJaVBq?=
 =?utf-8?B?TDZrZTNlQmhTaGpLcDk2YWpJZmprM3NPVTh6L0paaWl0Yk5wa21Ib2xFYU05?=
 =?utf-8?B?UklFQzN2YXdGOFJ6M2R5aXFhaUdsOU5DS0xqcWxvTzJYSU9Mb3VjNjdsSG5s?=
 =?utf-8?B?c1k1MktDbGtMelJvYjBaN2gwUURGY1pMUm51VnAwekRsZmZVOXhXb0JzM2o3?=
 =?utf-8?B?L09IMXJIdXh5R0xrNTVRMjVHRWV0WGpTY05JdFU4RGVZaCtDa2g4Tzc3a2FB?=
 =?utf-8?B?Q1U4SlFMZUw4T3R5OWd5OWp0Sm5QZml0M3Ivd2ZyVnVjcldCb0FDeWFROUJ4?=
 =?utf-8?B?YTloazQwTHRrbnU3N0ExUEtuOENmQ0V0c1ZvamFRd0tpSzZZKzNuYUdsV2da?=
 =?utf-8?B?bFM2bHFvcmhraGhtZ2hGRGFOczdudWFoNkFZMGo2ZjVVVkVGL3d5aUJ4cmZ0?=
 =?utf-8?B?ZDZESXhXd0dXOEVUTjlWb0JmcVJCRmUyY2JXZTNTYzNhVGliM1ppdTFEdGpC?=
 =?utf-8?Q?LFHDNK28H6EBtvFT/C3kMHDKM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7018.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a79c8f0-626b-40fe-5566-08de3094f4ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 04:49:05.0934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wakr4Ic2u1N0zSARONt1nq38Tdf2CT5FuaoNGFis9NVURvA43pLU8Ztj1NpDK14CFj+kjK1LJTU+SqhL3n09LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8084
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 04:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226955

SGkgYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1dGlv
biBmb3IgWVAgYnVpbGQgWW9jdG8tNS4zLnJjNC4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1dGUg
dGhlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQpPRS1Db3JlDQpCU1AtaHcNCg0KUnVudGltZSBhdXRvIHRl
c3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQoNCk1pbm5vd0JvYXJkIFR1cmJvdCAtIDMyYml0
DQpBbGRlciBMYWtlLVMNCk1ldGVvciBMYWtlLVANCkFycm93IGxha2UNCkJhcnRsZXR0IGxha2Ut
Uw0KQW1zdG9uIGxha2UNClR3aW4gbGFrZQ0KQmVhZ2xlYm9uZQ0KQmVhZ2xlUGxheQ0KDQpFVEEg
Zm9yIGNvbXBsZXRpb246IDkvMTIvMjAyNS4NCg0KQmVzdCByZWdhcmRzLA0KRGViYWwgR2hvc2gN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlv
bkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy55b2N0
b3Byb2plY3Qub3JnDQpTZW50OiAyOCBOb3ZlbWJlciAyMDI1IDIxOjE1DQpUbzogeW9jdG9AbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZzsgcG9reWJ1aWxkQHlvY3RvcHJvamVjdC5vcmcNCkNjOiBxYS1i
dWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KU3ViamVjdDogUmU6IFtx
YS1idWlsZC1ub3RpZmljYXRpb25dIFt5b2N0b10gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0
ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTUuMy5yYzQpDQoNCk9uIEZyaSwgMjAyNS0xMS0y
OCBhdCAxMzoxMyArMDAwMCwgUG9reWJ1aWxkIFVzZXIgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcgd3JvdGU6DQo+IA0KPiDCoMKgwqAgQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4z
LnJjNCkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgDQo+IGF1dG9idWlsZGVyIGFuZCBpcyBhdmFpbGFi
bGUgYXQ6DQo+IA0KPiANCj4gwqDCoMKgwqDCoMKgwqAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5p
by9wdWIvcmVsZWFzZXMveW9jdG8tNS4zLnJjNA0KPiANCj4gDQo+IMKgwqDCoCBCdWlsZCBVUkw6
DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxk
ZXJzLzI5L2J1aWxkcy8yODANCj4gMA0KPiANCj4gwqDCoMKgIEJ1aWxkIGhhc2ggaW5mb3JtYXRp
b246IA0KPiANCj4gwqDCoMKgIGJpdGJha2U6IDcyMGRmMWE1MzQ1Mjk4M2MxYzgzMmY2MjQ0OTBl
MjU1Y2YzODkyMDQNCj4gbWV0YS1hZ2w6IGFhMGQ2ODU3MmY1NGQyYTQzNTlkMDNjMGUwMDQ0NmU5
MTg0MGM1M2UNCj4gbWV0YS1hcm06IGFmZjY3Y2I1ZDc0OGFhZmNiYTFlZTU4OWE3NThkNTExOTFm
MDYxYzINCj4gbWV0YS1hd3M6IDhlMjQyZWFiM2Q0NGFjYWI3MGY5N2EzYzI2ZmU5Y2ZjNDQyMzky
MGMNCj4gbWV0YS1jbGFuZzogZDBhNjdjNzZiN2EzYjU4NWRiZTJiYThhZDUwOWRjMGZlMGU1OGFm
Mg0KPiBtZXRhLWludGVsOiBhZjkwNDI5MGY1NzRlZTliMWY2MmFhZGU5ZjU1ZGFjZGQ5ZmI2Y2Ri
DQo+IG1ldGEtbWluZ3c6IDAwMzIzZGU5N2UzOTdkNGY2NzM0ZWYyMTkxODA2NjE2OTg5ZjVlMTAN
Cj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDA5YzdmNzZjMTk2ODc2YTQzNjZmMjIwYjM2MGY0YmRiOTNh
Yjk1YzANCj4gbWV0YS12aXJ0dWFsaXphdGlvbjogYzIxODVjZDVlZjIyNWM2NjA2MzQxNzQ1YWQ5
ZmZiMDJlZmUzNjRkOQ0KPiBtZXRhLXlvY3RvOiBkMDJkM2ZhYWY0ZDYwNzVlYTAzZTllYjQ3NjU0
ZWM3NjM5ZjkyOWEwDQo+IG9lY29yZTogODUxOTk3ODU5MjQ4M2JiMDk2ZWQ1MTkyZmZmN2FmNmM4
ODdiNzk5ZQ0KPiB5b2N0by1kb2NzOiA3OWNkMzNiMDZlODdjMDRlNGY4NzNhNWFmZDlkNTM3MTRi
YzUwNDdmDQo+IA0KPiANCj4gwqDCoMKgIA0KPiBUaGlzIGlzIGFuIGF1dG9tYXRlZCBtZXNzYWdl
IGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4gR2l0OiBnaXQ6Ly9naXQueW9j
dG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1haWw6IHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmcNCg0KVGhpcyB3YXMgYSBncmVlbiBidWlsZCBzbyB3ZSBjYW4g
cHJvY2VlZCB3aXRoIFFBLCB0aGFua3MhDQoNClRoZSB0ZXN0IHJlc3VsdHMgd2VyZSBub3Qgc3Rv
cmVkIGF1dG9tYXRpY2FsbHkgYnV0IEkgd2FzIGFibGUgdG8gZG8gaXQgbWFudWFsbHkgYW5kIGhh
dmUgZml4ZWQgdGhlIHNjcmlwdCBpc3N1ZXMgY2F1c2luZyB0aGUgZmFpbHVyZSBzbyBpdCB3aWxs
IGhhcHBlbiBpbiBmdXR1cmUuDQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCi09LT0tPS09LT0t
PS09LT0tPS09LT0tDQpMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhp
cyBncm91cC4NClZpZXcvUmVwbHkgT25saW5lICgjNjI5KTogaHR0cHM6Ly9saXN0cy55b2N0b3By
b2plY3Qub3JnL2cvcWEtYnVpbGQtbm90aWZpY2F0aW9uL21lc3NhZ2UvNjI5DQpNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC8xMTY1MTQ1MTIvOTk3NjEy
Nw0KR3JvdXAgT3duZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3By
b2plY3Qub3JnDQpVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cv
cWEtYnVpbGQtbm90aWZpY2F0aW9uL2xlYXZlLzE0NDI2OTk5Lzk5NzYxMjcvNDQwMzM0NTUveHl6
enkgW2RlYmFsLmdob3NoQGludGVsLmNvbV0NCi09LT0tPS09LT0tPS09LT0tPS09LT0tDQoNCg0K

