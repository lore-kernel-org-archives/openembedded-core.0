Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BCFE6C5EA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 01:41:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by mx.groups.io with SMTP id smtpd.web10.9611.1733190091213066413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 17:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gGB2NWcO;
 spf=pass (domain: intel.com, ip: 192.198.163.15, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733190091; x=1764726091;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6oKOTFTqbeCZe0sx/Xd8gfPk3bzPsbYirMydy1stKhs=;
  b=gGB2NWcO3TvSQRFqg72XHOC27demAh+3kGSqDQ4KSZEOjjGYUOpDILwQ
   QPgjf+J5F6dl2IvpEprYD8cE4/CsxRyyTlRSRdK1zdhCK/hGeaEDVa1kW
   h8dOpL8wIg7VnZ8RhEpc5DBR0IKBW0k68oiwFM/bi/Wqmi0p0JeuQNKju
   sBiG7Gp8QCUyLfKDsiquXoFaB9zu/V79KYUmHuyysv5WGPx5WeKfIAlyq
   rXFZPuhRV+E/tFKK10lKfks6QXBF7/SBpI2RKkCpZsB8gYcpGwyL2mtn7
   rZbhG5Q19fSYukalcYrql5E2ZNU/SyAp/hOjGgiaGE1VAf1v9vRwHtWMh
   Q==;
X-CSE-ConnectionGUID: qdS3P3jkRwWez/nkG0hXUg==
X-CSE-MsgGUID: KJi12oc2SZarK9TI0cGeOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33517249"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33517249"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:41:10 -0800
X-CSE-ConnectionGUID: sa0x1E6qRa2dRANn+oIgNQ==
X-CSE-MsgGUID: mAezqGPnQJqgdzOyv82dMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97346386"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Dec 2024 17:40:38 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 17:40:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 17:40:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 17:40:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI67h7sW3Q3k8ROipw8N8X3KVwbx1EFt5HPT7aRRJAAMuHJO6gxjQ3hkJi50fH0j184q/svUxiL69UyUvW8QZsDtJ99GELS2g8mWi/hpu91k8EaM5I7yve9wPjbyfVJiVjFNeKz2fau/ys/Xb77/a4valr2TK0AJs06yhjqcJIqZs4koNFw8HN7HqmLeLyqB8Y2YDZfsEw7NbMeCBbiG6WvES5RXGyD/8xs46kRJryXOWPzy7+/8klRCrKs+TuRmcChBUvx9Ac6zsYc+fhLqpooAuwGZPK59qP6z5DIMbckdsy3HgMHIQBXLlBMADqMTVX0unPZmf+gJWevhQrnGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oKOTFTqbeCZe0sx/Xd8gfPk3bzPsbYirMydy1stKhs=;
 b=E90P4fSNLJ0kyJYALptjeDodP/8XYIFXwueUfnesTskocr47fv4e2CMdN29mNjfHlp+T+c6Owm5lArB1BE0CTGg51OdZauGZpeAElNSMGbPm+2Nca2VWqM2Dk4tmXikRQSbQvL26fbP8v3rHQFyGj57KSEEm87tPW/LXYf9cBSvLU4Tw1u+NoaPTlOi6TAQ8DyzcaUxeum7m3d6opnAySRbI8zhtPF0AK6ot90yvs+DSxlc5arovPLL+Hn/jgUO7EWJ15mD2LWvSqCj5J37uCKD+1mpIjJ6eNnq0ntg+ZhUty3fzP3nUHZwnH6oKtotASFBl6W9W+h8mrqMniC1n1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 01:40:32 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 01:40:32 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>, "Pokybuild
 User" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.1.1.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.1.1.rc1)
Thread-Index: AQHbQ37BxpRbo+OG0ES8J3/IPACDvrLTwU0Q
Date: Tue, 3 Dec 2024 01:40:32 +0000
Message-ID: <DM4PR11MB7760E9AE696CED60DBA2969CA1362@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdbJZ7MT7Bz8RAKmXLQhkHTMr8daWWRiq8yY9Cz5FU0LRQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbJZ7MT7Bz8RAKmXLQhkHTMr8daWWRiq8yY9Cz5FU0LRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|SJ0PR11MB5770:EE_
x-ms-office365-filtering-correlation-id: 905299d7-22b2-4300-8547-08dd133b79ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnN1S0JmTGFlWFNad2x2NHRHRUxlTHdOZ0x6L1FvYVNJb3FiSkl5clJWbzNz?=
 =?utf-8?B?SmdkWUhVbS81Ky9hb1BzdXNpSVJmRHBHMUVZLzRvdkhVN2QxSEJFQnk2Uk45?=
 =?utf-8?B?eFJSbzZvb1ZCK3dRc2ZJMms2WGRkV1JaTUw4dTlHKzRrS0hpQkZRcVNScXZl?=
 =?utf-8?B?Nk1LeHliU1ducUxjdkNLRDhVN1U1NFV2aWhlZ05ncGdRY3hpUjdadEpUL0h4?=
 =?utf-8?B?MlA3SnpRb2l3TVJyVm1ndnlNa1JOR1BsdGZZb0RpeVVCbnI2eldHN2R0K1BG?=
 =?utf-8?B?Z3d5Mk9MYkViL20vbC9CaDFiWC9xeWZPSk1tUHphYzFYZUJMYk5ENnF6QlNp?=
 =?utf-8?B?Ymw4ZkFJWllpdEdiNXJ1enFuSmdhVXVrUC83VHdRUmIxNmJLOEFwelNDSEtm?=
 =?utf-8?B?NGZ4YzQ2dHBidTBxRUpES3g0dEpNbWtZcXJEUjgrbXFKL3lxc2VzRFRWM0xW?=
 =?utf-8?B?Yy9QQ3l0NDR1bnUvY0FWSkcyenF0Z3ZOUWU2cEpaOVhxUVpobmFYaGlwTEUy?=
 =?utf-8?B?NlhsY0JLSHRJTzV1QzFlNHVNWlFDb3M1dXJIQWR3YzVlaFRTZDNweEh5QVdQ?=
 =?utf-8?B?OTNSWTgyeC9lVmZOL0lrK0RtUG5tcE1CZjViMmdNcXhXZ0twdVRrd1czMTVj?=
 =?utf-8?B?NVpKQURLVS8vWGFicGZGQXpmY01qbnZKUm53SGtCNXl2UitSdEExRGtBMmpi?=
 =?utf-8?B?OHkvdHVTOWZJellvMHY4TEtwN3RTM2h4aXRzRHlRNnowcGc3NnNEU0FxRWU3?=
 =?utf-8?B?dTJUNWY2TE1hOG1aOUlOQ0cwclNRbVNicFd2QjJwK3FVM21MWXBXK3ZRR3JN?=
 =?utf-8?B?Yk0yS29VSmVSMFBzQk9JQStqRlZaWDM3a3BoTmRzWFJtcTNMR2U0NHNhVEVX?=
 =?utf-8?B?SldjcXc5S29oKzdXbm9xaGM1a01rT3FkVHIyVVFMdmFiMzczV1dKb0xXS3Yx?=
 =?utf-8?B?UmpkV0ZmRFFxWUFoVEdGZkMxQ1NiUVBRN0phc203cGNhTzBLMklkaFEvcmdH?=
 =?utf-8?B?ZExSV1l4L29DV1R3MGpDdWlvMVdITmwyZ1psUS9vZGNDeTM3S1RWZUhndHhU?=
 =?utf-8?B?dzVNSXJxQTkvMzU4aVAwNVprYWZJS25rSEJjVEcwelhPV01vYjVBNHFPMkE4?=
 =?utf-8?B?QjJDMFloK1JpdjU1Vk9YQnJwRnZMSGRacFFNTGZZU1JrSUZpVjJmRUJqK2Rs?=
 =?utf-8?B?c2IyUU03TVlPTzRaZEloRFNwRTFrU1dCaGVYWEp3a2k0LysrM3JsWjhCUmVp?=
 =?utf-8?B?TUhtRXJtaXZTUlEvU3dTOS9QbzBnOW9Jb1EwUkdzTWRwRmkwcWlHQVZMMWdj?=
 =?utf-8?B?VUNJSU1HcEJ4T0hvbmcxdVFaQmlCYjNxVFBMZk4wR0NURFRJZUpNN3dGZENX?=
 =?utf-8?B?a1JKd0M4ek1nb0VMRGpSTDhXQi9RdTMvMjlJUnh5MExXKzZhSndHSGNGMmxl?=
 =?utf-8?B?dS9Yb0llRkVyQi9mTkVhWFJPZ255Nk9TQ1JlTGJjWTZWc29wVGlLYXVxMTV6?=
 =?utf-8?B?ZHdpZXRSQlUvSUpwMFE4UDBKTGhaVWY2OWZYTDRrRDFPanFkdno3TnRyNFdO?=
 =?utf-8?B?dWFWQjFwemVoeDBidElBdU9RQTFSRTNpWHdrQi93bis3TENRbWswZ1hra0pm?=
 =?utf-8?B?a3AraDF3aWQraVVOeGZ4NjIrT0dwZUtQV3V6cEI1NFY5L3ArUDJNUVk5Snhp?=
 =?utf-8?B?bGI4a0lYZ3lqcmdzUVNFdW5pYWdWTVcrYjFlcmVCNFp6ck45bnM2QmVTcDFI?=
 =?utf-8?B?VEtlSEJPU1YyektQOVE4Z2hqL3I2RlU2NDQrNVN2bTVGd09CODBoZisrN2FU?=
 =?utf-8?Q?zOLsZx6+JOrhgFkIx7x/k1bqzOMTe+ww06Pj0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnNnTjNIS0xMOURDa1pFbGZGSG95amJ4VWRmVzdLVUd3Umt0OTlrc0NKbTZl?=
 =?utf-8?B?WmZLTlcxeU4rd2NWUS82SFdRTkE4STUxWTVWZDkra2l3MzVveUpXL1pqbFlE?=
 =?utf-8?B?Tmg4TXRPaXVBRTFUYnR1dWkySmVxT3BXdUhFaHZ3YnNLZ0RTVHNkVnREU2JN?=
 =?utf-8?B?RUhQdjFPYkRVRVRDdlRGQmZwR1ZtS3F3NDZuWXE1TitoQnZKaDJKRm5SL3BV?=
 =?utf-8?B?WU9ZWEtENVoweGVOYUhIUzFyQ2JsK0tCUWpuSHB3T3ZGaUhmZWRRa21HMklU?=
 =?utf-8?B?UC9DUEdnekR5ZDltMmxlRXFHTVlMSmd1NnliOWdzVEhoS0hSeWtVMGFpQzd4?=
 =?utf-8?B?RkVFLzFBeGM3NXE3RkdGQzhYWXNEM0VTNjhEUW14Zks5dy9mb3VFRVNYVGMx?=
 =?utf-8?B?N1BkY0pwK01jczB3NnN3VFpXeUxUS1p5QkRNSGVOMlRDT2RIQ1E1VDJqWXZo?=
 =?utf-8?B?ZEZHUEVDOHN0N3gzdjZ1SDBPWnN6SkdpOVhEQUVjTzhIbThZRktBbmMyU1FB?=
 =?utf-8?B?dXdmaVlHdXNNNndkYTBtS2xDc0p3RDhEMDRYbThWalZaSEhoQWtST2V3T00y?=
 =?utf-8?B?YXE5dlpCclEvUnpRTE0rY1BuWnIxcE83VnFOZWw3RzM4RTB2bGJ5d1hHeUEv?=
 =?utf-8?B?VGJUZURKaVNwQkc2cXJ2OHJkWWY3RjRGWkY2cEVqMlhsazM3Z0JuV2Z5bk1P?=
 =?utf-8?B?dW91MHN3SW5JRUU2dHRISjdlaCtFZUYyeStIQ0cxVXlmMGNaSGo3OXVjNnl1?=
 =?utf-8?B?R292ZXhkVXNoUEJqRGFqQUh5Wk45dlVXWWVPWXU1Tkt1Z2V3S3VlMUd4MUdQ?=
 =?utf-8?B?aW5yelI1S3hSV2dmUEtWVTcyNlZsRW1qZE54aG92TVVlV1Y0c1BzMXRBZk5v?=
 =?utf-8?B?K214RHR3bjZGVkxDaThHbW5KZjZIcjBYMzFDNGhYQVB3VEVDVlFLU3NIOXBK?=
 =?utf-8?B?VzAzWlQrdmw4NWhWRVZoa0Y4c3B0RiswcUxGenNXcFZobW95YVhNZGpBRThE?=
 =?utf-8?B?OS91NmZIVzZ0MkdLOTlYa0p6WlhSUTBOZkh1c3FMb2FvOXFGWms2V1dTSHQ1?=
 =?utf-8?B?ZUZZdWthS3NpQWZpMGlDZjVGVkh2aE9paGlCN1ROVmFqeHN4VnFBZUhXLzdl?=
 =?utf-8?B?Y0hJbVBha2J4MjBRK3laK2JMa1lxQ0g4M2xabGcrNmM3WXMvNDhHei9HNGxv?=
 =?utf-8?B?T1M4R1ptL0kraXRqQUFQeUEvMlhNT29PWWM2cGwyRkdZanQva2QxenJRMWVN?=
 =?utf-8?B?K3U1K0NsSlNVTk5yQ3d4SlFBV2o2cFNFeWdBRGpVWXpsOXNyUEVjZWZqNzU1?=
 =?utf-8?B?TVAwNW5NWlJVd2xpQnhpQllwRWNzSFlVcG9nYU56cVBHZVVJQ01uQXpNcUtQ?=
 =?utf-8?B?akYrdmE4L0ZTU0g1enBVZ0dsUWR0aVhVZ1VuWDhpd0hnazdJdjV3N0xiMklG?=
 =?utf-8?B?dHNDM3JnSTk4cDNDREIxNFVMYlg1a1RzSm40STFMRnhCUHRpVFFFL3ZPamxa?=
 =?utf-8?B?UGhCSTk1Y0U0ekwxSWxKeEcxYi8za3ZueVQ1ejBmVWU3ckFHYmZKOFRJVXpL?=
 =?utf-8?B?aDhIcHZqNDZoNVNXV1FVaGdRRkZHSFVoVS9vUFpDcnVRUVpxcnpSd1d0Y0s2?=
 =?utf-8?B?eTFRQUU1R0U3MFlDWDV5OG9kWDFGaTRWMGV5QmxabUx3UTM2UDF3bWxobTFH?=
 =?utf-8?B?N3BISkJ5SHl0MXZXMVFWVGZkMWR2S3JIRVQxTEJmdHhGQ0J0cHVsQkt6MEJU?=
 =?utf-8?B?NUQzRjY5RVZqS044cHQ1eGhRWFBTY1ZrY0hXU09oWWJFWXBsUjJ0NGRqQ213?=
 =?utf-8?B?MmpzWFNUbC85NWpFNklLSmhKVWl0Z0dlcHVoOEZwamRjaTBJcmwwUjhCNUt2?=
 =?utf-8?B?bVVjRFNtdHZ4Vk9rU0VLOUZIVjh6MW8xVHFsQ0l3a1laK0h6Nmozd1JNVzFo?=
 =?utf-8?B?b3NBOUwrcENXVnd1MWc4L1VrVEp4NVkwM1hGY2lDdVpjTWxJekFhY1BHbWs5?=
 =?utf-8?B?RlRnSTJ0SHpIRWhuMi9IN2pqZ2N1ZWc1djU1bFZMbHZkdXp4YUhuazBFZ3FV?=
 =?utf-8?B?TlZ5bXlVeW1jbEIwMW1meVdqVkNNZEhjR0Q4RUkyeVl4OHg4OEEvSTNqZW1I?=
 =?utf-8?Q?21qzvtVPKrDkG/Jb1MUDTyLOt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905299d7-22b2-4300-8547-08dd133b79ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 01:40:32.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFfBMEUaETVHLmaLhSZjH/cJ8qda/gj8VkFEsOVojFiqhTukEeKZF8vfQpovjpKDpdl1w0bVnt93DTdseIUTKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 01:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208169

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTUuMS4xLnJjMS4gV2UgYXJlIHBsYW5uaW5nIHRvIGV4ZWN1
dGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KIA0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCiANClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KCTEuIE1pbm5vd0JvYXJkIFR1cmJv
dCAtIDMyYml0DQoJMi4gQWxkZXIgTGFrZS1TICgxMnRoIEdlbmVyYXRpb24gSW50ZWwocikgQ29y
ZSh0bSkgUHJvY2Vzc29ycykNCgkzLiBSYXB0b3IgTGFrZS1QICgxM3RoIEdlbmVyYXRpb24gSW50
ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk0LiBNZXRlb3IgTGFrZS1QICgxNHRoIEdlbmVy
YXRpb24gSW50ZWwocikgQ29yZSh0bSkgUHJvY2Vzc29ycykNCgk1LiBCZWFnbGVib25lDQogDQog
DQpFVEEgZm9yIGNvbXBsZXRpb246IEZyaWRheSwgNnRoIERlYyAyMDI0Lg0KIA0KQmVzdCByZWdh
cmRzLA0KSmluZyBIdWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxxYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBTdGV2
ZSBTYWtvbWFuDQo+IFNlbnQ6IFN1bmRheSwgRGVjZW1iZXIgMSwgMjAyNCA3OjIyIEFNDQo+IFRv
OiBZb2N0byAoeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZykgPHlvY3RvQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRp
b24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlcg0KPiBidWlsZCAoeW9jdG8tNS4xLjEucmMxKQ0K
PiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4xLjEucmMxKSB3YXMgY29tcGxl
dGVkIG9uIHRoZSBhdXRvYnVpbGRlcg0KPiBhbmQgaXMgYXZhaWxhYmxlIGF0Og0KPiANCj4gDQo+
ICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by01LjEuMS5y
YzENCj4gDQo+IA0KPiBCdWlsZCBVUkw6IGh0dHBzOi8vdmFsa3lyaWUueW9jdG9wcm9qZWN0Lm9y
Zy8jL2J1aWxkZXJzLzI5L2J1aWxkcy81NTMNCj4gDQo+IEJ1aWxkIGhhc2ggaW5mb3JtYXRpb246
DQo+IA0KPiBiaXRiYWtlOiA5NjAyYTY4NDU2ODkxMGZkMzMzZmZjZTkwN2ZhMDIwYWQzNjYxYzI2
DQo+IG1ldGEtYWdsOiBiZWU4OGQ1MGZiYjMxMDg2ZWI3MGQyNTljZjg2YTRlNDgwNDdjM2M3DQo+
IG1ldGEtYXJtOiBhY2FmZTdjODlmMDRhODhlZmQ4ZDQyN2RkZDIxZTY2ZWI0YmI3ZjU0DQo+IG1l
dGEtYXdzOiBkYTU5NWNmMTA5YWY2YWViNDBkNGE1OTIzNDVjZjQ0YzY0MmU2MWUyDQo+IG1ldGEt
Y2xhbmc6IGM3MDlhNTE5NmYxZTg2NTQ0MjViNDNiNDc4MDY0Mzk1Mzg2YzM2ZDQNCj4gbWV0YS1p
bnRlbDogZDJlMjg5NDAwMjc4MDhlYTU2ZjlkMzhkZWFkYjIwMGE5OWE4OTgwNQ0KPiBtZXRhLW1p
bmd3OiA3N2ZlMThkNGY4ZWMzNDUwMTA0NWM1ZDkyY2U3ZTEzYjFiZDEyOWU5DQo+IG1ldGEtb3Bl
bmVtYmVkZGVkOiA1ZDU0YTUyZmJlYjY5ZGJhN2I4YWUxMWRiOThhZjQ4MTM5NTFmYTYxDQo+IG1l
dGEtdmlydHVhbGl6YXRpb246IDllOWY2MGU5NTlmMzcxMGZiN2ExNmI5ODI5ZDk1MGMzZDk0YzBk
NGENCj4gb2Vjb3JlOiBiNTExZDAxNDZhMmU4ZjMxNmY0YWVjYzkwYzg1MzIxNTY3NDAxM2VhDQo+
IHBva3k6IDdlMDgxYmQ5OGZkYzU0MzVlODUwZDFkZjc5YTVlMGYxZTMwMjkzZDANCj4gDQo+IA0K
PiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0byBQcm9qZWN0
IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcveW9jdG8tYXV0
b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQo+
IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFs
bCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjNDgz
KTogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNh
dGlvbi9tZXNzYWdlLzQ4Mw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZy9tdC8xMDk4NTQ2MDgvNjQyNDA0NA0KPiBHcm91cCBPd25lcjogcWEtYnVpbGQt
bm90aWZpY2F0aW9uK293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6
IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxkLQ0KPiBub3RpZmljYXRp
b24vbGVhdmUvMTM1ODE4MDIvNjQyNDA0NC8xNzQ2ODEzODk3L3h5enp5DQo+IFtqaW5nLmh1aS50
aGFtQGludGVsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

