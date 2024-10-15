Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C60CFC501
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 00:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.2237.1728953012274212066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 17:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Iv0U9bX/;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728953012; x=1760489012;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=x+vGwKYldi0o0KthJKu9Vmp/vfJNOHHKbEjvpWFcC4U=;
  b=Iv0U9bX/ICArdyRYWLLzoLXA/jUEvu053KdD0LbT5Z8s9dtuOCRAZxYR
   Dx6v1SnWt0K6t+6Bk0lEMGKO/9DYBd5LwaZR/JhOPiXESLRra9ZsMnyhJ
   ZkMjU85oXETsMISoNwFnDY++6zzoFGoOAVewlRjUbdSAKExgZo8brNPNn
   VLpucXzuWUC0/BpG9JU24qVPttKo3R8y3p+DINbDI+5hzXynwWTwpTZU3
   POBUn4Y3Fz1s3PHuab2I2HxKLHxFcMmIFeaXdx7L/d9eNV/azYxPpzLTu
   rZe4o2uIkZ/uQJg/mYx9fGc7auCJ3kAZJYx936IN2z0jynGgKV9o5QayO
   Q==;
X-CSE-ConnectionGUID: K0TxWpNrSquR2pjvmDaEkg==
X-CSE-MsgGUID: 08lOub2cQnmj55GoKJ0yGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50856056"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50856056"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:43:32 -0700
X-CSE-ConnectionGUID: COgJd3CTSVuswwEwVXLtrA==
X-CSE-MsgGUID: uM8Bxf3dRpadMaIayO0N5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77812337"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Oct 2024 17:43:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 17:43:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 17:43:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 17:43:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 17:43:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2mdYmbtSemCQH5d4hlIC7cU4WNuiEqAtAT8WWIYSL87L8G5scwIa3W3yiQ0ph3gDrrYq92Y48zkTVRrnDEdGkQlUvhoU/dsxal7rxM1ZiiDzYfFiAZ6w7u3YxCRxUbxdB4LwC1DPXHL1pJWBPMlRk3akxu3QoJdzaH52nfVyw4xyRfChPFLrVdv/QnvL+M/I2o2cuy9rD0e3ymfNUz2OlS6nLKVYQk4A7jG0VgxJ8djX9ZZ2g6HwsaKYCE1dA/qV1QFCgNQh73nfwsQLvfbkKHld1D7VjAzORKCemAi6EyMQjZYjbv2ETDurVHas7izV9KkWLDkZYqLSvrp/U68uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+vGwKYldi0o0KthJKu9Vmp/vfJNOHHKbEjvpWFcC4U=;
 b=TOaBANSdpVGvUdapOHafBeudmPa9/4EIkrnLwMukm9fNMgta2FhcFVkt8L2snpfI3kSKWiKVKZjJwxpP6MSpeKHIoa7+CU2b+4dyvSJrqd4nOALF14RqPeLnf4niQqyWCohIK5NJJwEjGDo2EkrADAALHC/kfcZxr6+UCno5WV0GPH2WX06ZBnqsKRslkeEd20jozFtfBTY/Xu0xEzPQVGIzP/9iDCV1qllJCFCa3deCwo7mt7LN5wUG157ZmbTlUmWfKbvRo++xKMKB5O1rAkhivo7NxG5SKdPxk44KKjqO4rCYeHbdwBjKW2li9kzWrmxuZ9u6GQaeblUXfvIDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:43:28 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:43:28 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.22.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-4.0.22.rc1)
Thread-Index: AQHbHN5zwJtg+LDbV0uOj4geWC58DrKG/CVQ
Date: Tue, 15 Oct 2024 00:43:28 +0000
Message-ID: <DM4PR11MB776007D808B050557A923A5AA1452@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdZTSL40AGzE-aNwEMSTQVOxaq4qyXZH5karUnmucaxFBw@mail.gmail.com>
In-Reply-To: <CAOSpxdZTSL40AGzE-aNwEMSTQVOxaq4qyXZH5karUnmucaxFBw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|PH0PR11MB4949:EE_
x-ms-office365-filtering-correlation-id: e3606849-04d5-4ddd-f7bc-08dcecb262b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z0V5ZVNRcUhoYWM2QWlROW1WUVVHcFdlN2pqeUxkdUFrRG92bjEyRlhFYVJV?=
 =?utf-8?B?QldlakRVOXFwRE5TOGU3aEJCSzRKR25yaWlRRm5kemJOZ3hzM1dEMzJTaS9C?=
 =?utf-8?B?a3Q0V213d2M5SmQ2cFBUbmVEZXc0RXhKY0UvVjVSbVVsSG1SVmlsZEFRSlc1?=
 =?utf-8?B?SzhOZUdtVG9yL3NOMDVVYjNISzdCZUx1bjM4dFJuYWt0WmRhb1BNT3JrYjkv?=
 =?utf-8?B?OGwyWVVtZlZaVzZhNUdGRlVsemVLaE40VGNKZHpueGgxcGJMeFM1YmsyUUdv?=
 =?utf-8?B?ZkZLenRIUUgya1JpVUkvdDlBMXFYZWxZaEZJc1pDT1NUeEFhbzhYOGJaelRO?=
 =?utf-8?B?bTJuUVVOcVcvd0xhejVwb2ZORmJiVDgvS2xnbUZ5ZGgwVUI2R1VlaGVqTU1I?=
 =?utf-8?B?OUVaeWoydW9NOUFUKzZrT1phV1RJK3FBQStPWXF6b2JNSUtsMHVXRDU2YXIw?=
 =?utf-8?B?ZGRja1k5dzUvTnh2SlFlSTl5dGdZTWYwMFpMWm5Rb3VTSFNad1g2bGNFaEYy?=
 =?utf-8?B?cnAyRjlXR2s2c3BaQ0ZPVEY2QVhDeDJOcENoSFJqOFVjVFVRdzlBNk9MOHhi?=
 =?utf-8?B?K2M5MDA4M3FnblVTYVNzSUJuUlh6Y1V6Yi9GekRhazZZT1gvZHJ6Tzh3UExK?=
 =?utf-8?B?MThRQXlVaWFNa2ZOUmxuTVJVS0NoK09ZR2EvTlVYMTEvZU55V0xXV1lEUXVk?=
 =?utf-8?B?cXErUDVscWlrYk12bUJqTWlEazhLS1RibW4yNlpMK21raHZJTFNtRVpjS1BC?=
 =?utf-8?B?QWR5c2x0VGx6SXVLVWxUSkNwQTFxL2k5WldaRlhFQ3JkY2phRnBlSjRiNDc3?=
 =?utf-8?B?K0ltNFBCYnMwM3ludlVZb3hjeFVvWVVDU1NXL2ZueUhQQkFzSURiMExPM3hj?=
 =?utf-8?B?ZmZyN1o0c3dDN1U3WDlWUmtjcmZzQ3QyVGt4ZUVRck5rcmh3bHVnbW1CaW9N?=
 =?utf-8?B?WDlUT3MzQU9uK1RlQlJEb0tjNmZRSzFONVpOVGZyZ29mN3pLWFZFbzl2OVcy?=
 =?utf-8?B?WVg2cmhlZ01vSmliak1FTG9DNEtBK2NKanU4WHpGcGp0Q3hSQUVsckFYcVN4?=
 =?utf-8?B?Q0t5bGxEYmwxelZuWVVTeWtIRUVvSUpsMkQ2MmxRZlJyNDhtdjNFWTZUMFlO?=
 =?utf-8?B?Qk5GRmZ6M1BCMnRqeE9aK2pPTWE3dVVwaEx4c2syQU91Y0s1NXVHS2hHMk5Y?=
 =?utf-8?B?WmhKMGc0SHhGSHVHcDlDU2dPZTJIbnN1MEwyMU4yL0xmTTZINlczb3JaMUhE?=
 =?utf-8?B?eEc0QyttNUU1bHMvTmgxSHZ6RTEvSzFIcHQ3SUVHWGhFN1pwTkVRV0hoK1ZB?=
 =?utf-8?B?WXJoaVEzV2RlazhodkFUQ3ZXc2xNYXJkSUtCYW5uR2ozRnFlNHhCRmVzUDMz?=
 =?utf-8?B?RlhQYnZOS2hWRUgvWktNME9BZVNaRE9OYlJrVlB6QmdDZHNFMzZxek80b0lC?=
 =?utf-8?B?aFd0ZWs0QUVCTXpZaEY4TWFmZ2c4MzJvL2tVSS91b2gxbWEvNTgyRm1rK2xm?=
 =?utf-8?B?RkFGUjRWa0xFNDljRDdPU0U1ZGMxZWdnS1V0bDJUQXZNdkhzc0x3YWlGZkhM?=
 =?utf-8?B?R0hNUjAyMXMrQTlHM1dVQWxQYVJhT2N0SUExbzEyUFh0VW44cEhpVHI1VFNJ?=
 =?utf-8?B?MUxpQ2MxbG1EU1p5SzAyeFhDYXJNQVpKTFlRVHFncHl2SkdFWmdWd045SGUv?=
 =?utf-8?B?SmhkTjFTczJkK1NVcU4rZ2RrUUxJcE5pVkJudXlmeVdQdzVFUjJPUldRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm5qOXFzWUpVUmhRQnZiVFBaRnhaVG05VU1sdkZJblNtTWZwd1hDT0h3UzlS?=
 =?utf-8?B?NGM1ME1Mbzd1SlBZT0Q5MEhRY3lSVUFJdmhzdks2dm1VT0VNOTh6MFllZkFq?=
 =?utf-8?B?ZnZaQ29MQm8xeWJtZEdoVE5sWUtNcUtIN2FhK0t3RlFaMGZQOHVaU2JXOC9j?=
 =?utf-8?B?LzNVZ0xkUytCbXpwY1M5aVdqcGhwTFNmN2JaQUJ1TGJDZ0tNV0V6ZmIzV2E1?=
 =?utf-8?B?RXk1RGorUXlSN0hKUTUzU1pkUHRnSlBHRG9wMnE4aFpGSVpJUjVXQzRRMEhR?=
 =?utf-8?B?Y0pmaThKZGtsZU5NbkpUMjBuTmExTGlCOXRVU0FYYWtJMkVTVHROaGI1S3VB?=
 =?utf-8?B?ZWJQaGlWQm5NbHRtZGVTWnhWMGhOQURwa3NTV1N5dHk3WTY0VEhsNk1IT1hH?=
 =?utf-8?B?Z0ZOOTB2dnM0NUszcm5zMWpwYVlNbXhyaUFMYmVOL2lMcWhYa1IyQjg0ZHJh?=
 =?utf-8?B?V0NzaHMvQ3V2SUNXSzRJZVliYWpJNHZOR0V0ckRIdUZ5L3ZzYnQxMG01Q0FS?=
 =?utf-8?B?STZGNHJJYXVCQXFxbVFrY2tOUDZPdWQ1ak1sdldiVzRxblhnK2pMMXM4UUY5?=
 =?utf-8?B?Tlo1SDFkd1c2WUdnNWZMSHJYQmJOYWs0ckc2Qlg3NEZ0UVBZOXYxWFErTHQr?=
 =?utf-8?B?WU1iV2FZNjVyanNyV2NZMmhXdXRIYkVXZElpckhYUEk1YjQ2YmtOa0RkWUIr?=
 =?utf-8?B?VU42TEkrWFczRU5kejRUS29UT1JKbmFJUyt6bkwvZ3ZMWFJyL2ZXY3hpM0Uw?=
 =?utf-8?B?T0l0aVlWZGh5WTgzaE1oelJKSEpGMS9sQk9laUhmM1JhQVhjN0RLYTl1Vk41?=
 =?utf-8?B?eVZFckJvb3FoSWhxcEwva1B4WE4wTEZhbU5vS2I5Y1REemJ0Q0ZJei9kQnp0?=
 =?utf-8?B?d0lkZVVOdG1ZbTQ0RFVaY00xM0JwVEhDSUZIaTE4b21YaTBraDkwNmVyVXdq?=
 =?utf-8?B?UzhXRWJzRlkwblY5UzFzTitONlg4WmkzRmxQR3N4aXQ3S2RyVmFSUkcrb3Er?=
 =?utf-8?B?VW5CdjN6UlpaelFFOFBtNmU2MlJESmc1SDlCTFloaE9OM1FENWF6dGp6dDly?=
 =?utf-8?B?TmZlTmsvZDhSMjZoTFVhd29Wa0V2cVc3QkRQdHErK1dxdmJiaEF1VzN2SVZ3?=
 =?utf-8?B?RVJkWEVVL1BJbU1aaW5MMEdkTzl5eHVNbWJNbE5YenRzYnZIN0oyZXFCdERX?=
 =?utf-8?B?K1ZwaTNuaDd6S3NZb2ZBclQwVWpsQVVrMU5XM3hiTTIxT3c2VWhtNVAxY0tC?=
 =?utf-8?B?VkNMSndoZDhuOFhhMFZTV3hFWWMxQ3l2cGdLZlMvZWUzbFI0NlVMVSt4ajk1?=
 =?utf-8?B?dmRIelo0UC9oQXJKY2FteGFwdEFVT0phSFVqYkdkUVdVS0loNjVWTFVXUTFW?=
 =?utf-8?B?TlhXVFozeVk5S1BVZGdrd1drL3E0VEd0WFVrbUFRU1FCeTZWK1Z4NExhcGpo?=
 =?utf-8?B?L1RUa3AzVkR3SzNieWlkQ0M2YWErRXBHbGpJTDdudVdLR2NTU1o5VmtWT3Bo?=
 =?utf-8?B?cXFZMjJ1VjV4TmlWblhZNkpmaGZSYkIvb1BXTDhNalRWZHQ1TmF5ajVENXkx?=
 =?utf-8?B?MW80Y1VCcldjUFFCN2krOE9XK042ZXNLTFZtUmVnUFdCRnFCVHA0cHJMU25T?=
 =?utf-8?B?ZmZIUFBaZDRqTTllTnB4WEFwSms4dG9TbzQ0dHVwTTU4Y0M4OHZ2YzI0KzNJ?=
 =?utf-8?B?bEx6aXg2S25YOElWTWx6NnhsSkw2Ym4vSTAwM05LQ3pSemdRWVdhNTBxT0I5?=
 =?utf-8?B?eDF5V0Ntc3hqdytrZUI1UHJjQ1ZvVFkxOWM0dVVZYzNDVTNFeDcybTlZeHg0?=
 =?utf-8?B?dDRoRGI1emwzMVJqVW02K1RzUkdEajlVSkZKbml6OG9BNVg0ZWFsb2w3cEZW?=
 =?utf-8?B?MjV2OW5UbWJJTlM0RGhmUXVJazFYSVg5dURBTUVSSG5yRCtDeVhkUkthRW1H?=
 =?utf-8?B?LzU1YWRlUGxnSk9ZM2FSejRXSzNHRFRSWEV1SWhyZHVZdWhCdFREZnR4aFE5?=
 =?utf-8?B?ODJxenc5Y2VITkNpVzQwSlZPeElURnQ3WllWZ1l5VTFPL2Y2aEtNZFhTM05H?=
 =?utf-8?B?NFIyNmRSQXJjd2R0VlZpRVNWRnB5bGppUlJlTzI5S3A3Wm4vUWlmQnMvcTRy?=
 =?utf-8?Q?/33MkPhIUzOe887erEzlgyBCN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3606849-04d5-4ddd-f7bc-08dcecb262b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 00:43:28.3493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TM/QuA8XfuvBoijZULpYj05Z/9iPdSNTRzE7BymnIu5QrrhZ20nBir1nkOsamgFgXfTVNEvxNZyxZ7j0bEdAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 00:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205796

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTQuMC4yMi5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCiANCk9FUUEtbWFudWFsIHRlc3Rz
IGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQogDQpSdW50aW1l
IGF1dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCgkxLiBNaW5ub3dCb2FyZCBUdXJi
b3QgLSAzMmJpdA0KCTIuIEthYnkgTGFrZSAoN3RoIEdlbmVyYXRpb24gSW50ZWzCriBDb3Jl4oSi
IFByb2Nlc3NvcnMpDQoJMy4gVGlnZXIgTGFrZSAoMTF0aCBHZW5lcmF0aW9uIEludGVswq4gQ29y
ZeKEoiBQcm9jZXNzb3JzKQ0KCTQuIEFsZGVyIExha2UtUyAoMTJ0aCBHZW5lcmF0aW9uIEludGVs
wq4gQ29yZeKEoiBQcm9jZXNzb3JzKQ0KCTUuIFJhcHRvciBMYWtlLVAgKDEzdGggR2VuZXJhdGlv
biBJbnRlbMKuIENvcmXihKIgUHJvY2Vzc29ycykNCgk2LiBFZGdlcm91dGVyDQoJNy4gQmVhZ2xl
Ym9uZQ0KDQogDQpFVEEgZm9yIGNvbXBsZXRpb246IFRodXJzZGF5LCAxNyBPY3QgMjAyNC4NCiAN
CkJlc3QgcmVnYXJkcywNCkppbmcgSHVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8eW9jdG9AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmDQo+IE9mIFN0ZXZlIFNha29tYW4NCj4gU2VudDogU3VuZGF5
LCBPY3RvYmVyIDEzLCAyMDI0IDM6MzkgQU0NCj4gVG86IFlvY3RvICh5b2N0b0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnKSA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1
aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFt5b2N0
b10gUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3Rv
LQ0KPiA0LjAuMjIucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNC4w
LjIyLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXINCj4gYW5kIGlzIGF2YWls
YWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVs
ZWFzZXMveW9jdG8tNC4wLjIyLnJjMQ0KPiANCj4gDQo+IEJ1aWxkIFVSTDogaHR0cHM6Ly92YWxr
eXJpZS55b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzI1OA0KPiANCj4gQnVp
bGQgaGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IGViNWMxY2U2YjFiOGYzMzUzNWZm
N2I5MjYzZWM3NjQ4MDQ0MTYzZWENCj4gbWV0YS1hZ2w6IDNlZjliNjkzYjAwNDhkOThkNzQyZDM0
NzA0OWRmMmM5ZTI3NDZlZDgNCj4gbWV0YS1hcm06IGJmOThlZjkwMmU2ZTcwNDJlNDZhNjlmYjJk
ZjZjNjhkMDBkZTI3NjQNCj4gbWV0YS1hd3M6IDY5Y2U0NzAzOTk0Y2RkOTVkMTRiYzg5ZmUxZTM0
NzVjNGYyYmUwOTANCj4gbWV0YS1jbGFuZzogOGJjODkzZDczNWU1Zjc3OWEyZGNkYzM5OTI2MjFk
NWFiMzcxODAwZA0KPiBtZXRhLWdwbHYyOiBkMmY4YjVjZGIyODViNzJhNGVkOTM0NTBmNjcwM2Nh
MjdhYTQyZThhDQo+IG1ldGEtaW50ZWw6IDFhYmM4ZWYwZmMxMTA0MWUyZmYxODk4OWRjZTViOTky
MTRlZTg5ZWQNCj4gbWV0YS1taW5ndzogZjZiMzhjZTNjOTBlMTYwMGQ0MWMyZWJiNDFlMTUyOTM2
YTAzNTdkNw0KPiBtZXRhLW9wZW5lbWJlZGRlZDogZGQzZDIyOTNmZmRmMjU1OWY4YTQzM2YyNDE3
NjVhOGFiNTBjZDA4NQ0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiAwMmE2YzAwZDkzNzA5OTJhNTQy
OTY2MzNkZTI2YTEzYTlhMDhjYTJhDQo+IG9lY29yZTogZjA5ZmNhNjkyZjk2YzljNDI4ZTg5YzVl
ZjUzZmJjYjkyYWMwYzliZg0KPiBwb2t5OiA3ZTg3ZGM0MjJkOTcyZTBkYzk4MzcyMzE4ZmNkYzYz
YTc2MzQ3ZDE2DQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJv
bSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3By
b2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZw0K

