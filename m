Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B1BBC35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 07:54:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by mx.groups.io with SMTP id smtpd.web10.6426.1742284476627591824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 00:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Yag5EWmk;
 spf=pass (domain: intel.com, ip: 198.175.65.9, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742284477; x=1773820477;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EPmz53qMDIBVppKQpE0K+kWo00m8YvxuBlXx/vmSiH0=;
  b=Yag5EWmk3ykBqjAyvQ64CYbeCWGbnzVEDoXw9ApJbDO1YN3IblgMAw5g
   fkBSU0T1lnFG/OXOwI4MgCyMkENtD5dH8/V9kSgzeYHVjB+VTCrLhcKhF
   IwWPh52+cHZZUKZtXItLPl6bSv9fHdRsnyDlMmg65+SuYAC2IfZcut6gw
   yEtVRbVLIsyU5JkLRUkhGGYj3VgILl2VlcOs4TEfzOChtmzYqFq50tLV6
   fXOfAgpZQrvVd48x5FkieldbwmyocJJ0N1U/wH5oLjWhH3s0i+9LqmUq1
   0r7CB+AemdK72sI/7ek9J1P1ksFexD+Y3aV3cyMYze2jUpzLP7CPOzIPP
   A==;
X-CSE-ConnectionGUID: /p6M31H/TpeJpO16uqXLng==
X-CSE-MsgGUID: GVS/veKmRDO58MfiNm8KfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="65869780"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="65869780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 00:54:36 -0700
X-CSE-ConnectionGUID: nSk0oVdnQr6IhDacUmuHuA==
X-CSE-MsgGUID: 9Rn630XSTLCIGsBhyvR0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127361208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Mar 2025 00:54:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 00:54:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 00:54:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 00:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEvuXbohlIQUk2mogDzqpt5T6plDhRzLRS6WFXsuGNjoeX3ZETI2+gNEBF6xiM55jP/hd2okOndS+TU8RV6DGp9EHJzpYKu2bT82GhjX+1tSPSQmc2w0P0EcKzIR5M1l0vcNQY1ol5Kprb5W2+goTwWeLhD7h5y/i4s6qxs6lCtyjvmLF1u4kPN1cOXo2gfI6hnzd1QV1uEUUVkXSTWvXO6DiZRVVDnbPh/ZiRCpAPvsRD0ofxx+tUj/bgBQarqrDY5G7A1c6RhJMmf/SstaLZxhahDKoCmxLRFZg4NDDOvz7VCLjJFAkldq7PLgaT9jvExb/QkF0CzLhVQSF6F3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPmz53qMDIBVppKQpE0K+kWo00m8YvxuBlXx/vmSiH0=;
 b=GOfyVdfOFlJsT7lcLSs7blyNIS24AplWUuM4tc7S1iJpkkMALUEgplCzNNhePJM5zD2bT9g7ft4EhBTtrKcUGo5EH+g+o7+0ja8TDaGDj6NO17gDZeCxQK+oxxLb8TyQx02DefXPk/mXLbPfZ9aJ6Jum03JMsSKpAyuMxUCotFcfzv/74H+RWN+gugEhPz5YDDnSRvBcJbID51hBC2ObFQ0TQI1CjlhhsOPOFyurev9+EFNBV6+kGZk3E4lopsGkeHA2EpXbmygJZIfqEulvyLMWBYvmy4KhIiBAh4rOvmh4wqz+tM6psCZKjlKPB20cEP/zrkyxff6BlTiyJbmTgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 07:54:31 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 07:54:31 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.2_M3.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.2_M3.rc1)
Thread-Index: AQHbkZwwuZ+WnD+AVEirYU3TLENCHrN4ki/g
Date: Tue, 18 Mar 2025 07:54:31 +0000
Message-ID: <DM4PR11MB776002CC332E50DA59FF03A0A1DE2@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <c4b1b122b424616df3cd7de3dd91131c01ffeda4.camel@linuxfoundation.org>
In-Reply-To: <c4b1b122b424616df3cd7de3dd91131c01ffeda4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|DM6PR11MB4596:EE_
x-ms-office365-filtering-correlation-id: d8a4536a-7bab-46df-91d8-08dd65f21db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZDlXVWRBbGpXdU1TbHVRYlFFTUlVWmpsMG4yMlJpcy9wYXRBdy9SclBrWDgx?=
 =?utf-8?B?ZlgvOUhmMVliMDlOK3d5K3lYU25qb09YQWxNWVNQOHZEN0twU2ROOFhFWnFq?=
 =?utf-8?B?Q3BWUXo3dUZxY1hZcGtweEt5S0xxZW9Sb1ZmQ0N1STFlZkRSUmg0UnVPRTJu?=
 =?utf-8?B?a01lazBWOGF2L2x1MkR0eDZWSTZoS3Q4dUEvZExHaWoyemVpQnRkV1lvNmFR?=
 =?utf-8?B?UHlRaHl3dGRQMzgzRFUrZktKc2VnMlBWaDlMd2VWMlgyOHFJMy9OZ0dXMkFn?=
 =?utf-8?B?SG5WaWRkcUI4U3UyaFBucjJISXQ5Z1BxdjJLemtVVGRWMTlxYkh5V2VPZzRa?=
 =?utf-8?B?eGp5L25nc09PWlJKMTZqdlN5YVFod0JrOWhBRHlUTEN1QmkzZGR5cit3SnRX?=
 =?utf-8?B?V2VYSjk2dkdkc3BsZXpGaXhHelRTOUxiNysveVZjRk5Vc01tQ2pQdXUwU2dV?=
 =?utf-8?B?K1FCRHpzeGxjTzFGUllSaHcvME5jTUJnZHFBYklxek1COW15UlpqOE9FQitV?=
 =?utf-8?B?am8zdlEya1B4eEZONkpHTEtjdU83QTRqUWI0UlRBeVdZQlFMQjhmK3BRUjgw?=
 =?utf-8?B?cStvYjY2QTJMRXp2RlhNZjlDNFRmMFBWanBsZXpWai9GQ3NPNGJVSFR6ajdE?=
 =?utf-8?B?QzY3aHhPV3dlMEwrZUdUN000eTJ6OVNiZmsvZVU3VWlyUXlpY2E1R2JoUzR5?=
 =?utf-8?B?MXdqbDFyOUI0Vm9PTTFmZmRnNTcwejdPZk9zWEJuWWExaDdrYUo3RW1XZnAx?=
 =?utf-8?B?OWpXb0Fsa0pxRHVMb1kweFNQZTdDOXBUVzNnWWZTcXd4MTBvZE4vYlZRNVFC?=
 =?utf-8?B?RmRpbndpL04vSktzRkRVcG85ZERNcC8vZEhON0x1clhIVm1Xd08yZHQzTDVN?=
 =?utf-8?B?YlJwRnpHVGd0K2Vrd21Na25XZHZwVCswTDRoN2YrSGc1SFdGZ3FDaHBoVCtB?=
 =?utf-8?B?UFprOFdxdms3Wmx3amh2MGxUb095U3NpSW9SbW9DWG92NTN3d3FsenVneTUz?=
 =?utf-8?B?a0U5VERJci9WbXVEVlRLMUhOWWRJeUFEVFNlak1ETWppV3hLSFRVZ1ArQVhQ?=
 =?utf-8?B?K2xidkN5MDU5M2l2S01SUXFveU9vdmNwNnVrU3NWb2Y0WkdlNlAwWmFqUjNU?=
 =?utf-8?B?OHVtOTYxcFJYWjFzeGlQT0hLT2d2emU1dUhKQXlBNmFYWkgrOTU0NVNvN3pY?=
 =?utf-8?B?NEdSYVptWFFTMlQ5NU0vUlhxY3NsR2p1UXNjV2sxUTNNSGtnS2N0WE1FUGhM?=
 =?utf-8?B?SUd3Z0VNNzRxVlZtQjR5UTVnd2VORW9zZE4xZnVmZ0VQYVFZaCtINjhmT2U3?=
 =?utf-8?B?Rk9oT3lScG84azg5a2xwYkwvbWlJcTJPWjg0b1Y4cTI5MEdUenhaeU1wVEZH?=
 =?utf-8?B?cXpGdGt3b1pGZ1JYOEtqZ2ZmY0ZtYkMvODFBUGNQUkdObHVJVHlVWFJtL1JW?=
 =?utf-8?B?VWYzM1psMUlmT0E0Y2NENlRXL3ZhL3FSSENSdkpZU1dCekY1L0dJdU93bFc2?=
 =?utf-8?B?bXdHR2xnSVlFMmh4UG5kbWYvT2hBMWE1V2FyYVBWa0dNZSsrZVROR3RpS1Vj?=
 =?utf-8?B?ekIyZ3JNZFFHT3Nlcm92UmtocjN6NVF4SkVCZVp4UlVIWEg2N0dRZTNWOG1w?=
 =?utf-8?B?N3hCNDg1THhaU2NydU9BVWNYdnpjWWpmblliTmhLNmVtdVFBS3R2Zm9qY0c3?=
 =?utf-8?B?bDlKakdGd0hQWVpHNHpYY3ljQmpzdFNUd2lNY09RV1BiUTBqN3Jnamw2MWRt?=
 =?utf-8?B?dnZhVUYraGZEZEFsYmdWL2xhTFJuQm1qVnBsZnE3VGVBanJuVWpQdU52ejNq?=
 =?utf-8?B?ZDhsNUdRdkc5eEVKQUFMN2Q2UVhrMEszQUUrUjRuUmJkRjRNZDFkb0NFUlQ4?=
 =?utf-8?Q?+D9RpCpIfI4Yu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE5RdzFVWWUvdm9JalA0N2s2cmhSME9rL2NQTVN6eTlnMDEvWkRPdDFkTG5q?=
 =?utf-8?B?NjZnZ2Y1ZndiQWpGbEdYNGJVSk9FV05ZK3NzREVqRmVkd0JUeWhDblQzUjB6?=
 =?utf-8?B?S1doSVF2SkVLK0pXLzFYVmxaU0c4UmJmdENCcjFqZ0Y0aE5NZHlacTI1NXgx?=
 =?utf-8?B?Rm9adTFGb2RJM0YyMXloQzBBT3Jibk9uSXMrNEw4RmpGTkw0VXI4cFlMV2Rt?=
 =?utf-8?B?NW5BeUl2ZWMrTFFIMVBELzlwakoyYmdCTzQyeVRTdmdNNnpubGpkemhCTWxP?=
 =?utf-8?B?V0NESnlWcTlmWXN1OVpZUi82MTd0RCtLUFNCd01JTzd2MEtNWW53QkVLWVNI?=
 =?utf-8?B?VUt2TWpNb25kdFBWcGt3SGlUNEVrdkhZRSsvd1pBVE1vd3Q2azNZUk94LzJx?=
 =?utf-8?B?ZThQcWhwaFViRHZ3VStHd0NRc0hzbEgvcGh5cU5UcmVDa2gxb2I1QllGcjdI?=
 =?utf-8?B?N0RhMEdvWU9WMnJCS1ZjK2Jyck84NzhXVGJXL2tEQ1JWTkQ0d3MzeFJyc0hj?=
 =?utf-8?B?TDBJTDZBTWNSdnBxSFd0SkQ5SVE2eTRTOTNtdnZjTlhGUHhONjgybkJMZFA0?=
 =?utf-8?B?ZTFlU20xK2N5ODZkd0pZTTkwRHlqWmdXcXhhUVF0RG92NXhKN3lTRjd1R2lY?=
 =?utf-8?B?WUZhUUtLcE5PdGxHZlgzZmpqTlQzWVZsSmxBZmpsdGdVWXA1akZLUms1eUFX?=
 =?utf-8?B?RjZJdUlNY3RlTGNtaVI0bzRzUGJEU2dFMElZNHZnVU9BcGtIVnFSck9sTngz?=
 =?utf-8?B?UG1CeDY0c0RLVUt0VG4zUHJiRDllaEJKY1ZOTk5HVlgwaHZaOGh2Z3cxZXRF?=
 =?utf-8?B?QnhrQzJuKzUzTmpZdTlMNXpVK0k0MkZ1MGdVN0VwQ3R0MkhjRHRHQktkMHUz?=
 =?utf-8?B?N1BGTU91dzRzc3lab29KQUp3TmxvY3d1UDA0a1hXSlltNnVzM3ZRMFVvV3dX?=
 =?utf-8?B?bmZyNXI1d2ZUR2xCZkF1QnBvMUJhaFJjaklXOHVZMG16TThnY0h6eUt4ZDlq?=
 =?utf-8?B?b2w5dXJvamQzbFBPeTUwWHRpWDl2dmdFRkJTc01BWkV4Ti9LVmEyUGVJQm1z?=
 =?utf-8?B?S1ozY3VNYm94cUVWUDNiRVNrOGFMaUFuOUlVbmowRzhOL1lJMjlJZ1lxNGM2?=
 =?utf-8?B?cC8rL2Q3dE1CUkV3cnJBUEJWdzk4WFE0VWVBMWk1UU44T3U1ZTdYYmlhbWZH?=
 =?utf-8?B?QVdKc2RWdFM2NE02dEFXZVR2dHdBS2RkUDVTSEl3SDc4N1BWcjQyeFlKSXJJ?=
 =?utf-8?B?YzA1WGFxOHY3QUpMYW1YL29PclQ1WWF3dTBGQjMvSiszdEZGcGtDNC80cm1G?=
 =?utf-8?B?WkxkbjAzR1Q5T0VWWVpsN2tscENlSHpBM3NibE92UWVOWFZZUjZoeTA1VWla?=
 =?utf-8?B?U2JINDNNTHZHaC9EYkY2TS8wTTFDOHFxVkFIMy9YZ2djU3BERnIrY2NFdFRR?=
 =?utf-8?B?YWVYZ1A1RWRlR3duRUlwazlsNkp1TExmc2tSdHdaQm1CMGVBanBFNkVxZ3Mx?=
 =?utf-8?B?T1pFbEQzcC9oczR6NUhSUUpYdnk0OExvMTl6STk1UDFkRC9yWlVvNElSYUc2?=
 =?utf-8?B?QkJoSzFHWXdGNVc3OWJMUmdRekVLbWRlRGZYZnNhcndqbDg5ZzdWVzY4UjlH?=
 =?utf-8?B?RTZTWnB0K0FLdy95Qm1ZZDBtSEhwUmNCN2dtVmRaRlg2QzE1NTJkWUZuMEhG?=
 =?utf-8?B?Ync0LzQwZ3MwTTduWXd1aWtZZCtMa1FZM01yTGNKL1Q1WnE1S0doSFJLaENT?=
 =?utf-8?B?VW1KN0t2UEphTitpTnhkSWVBdTFFSFZUWXlhWlo2OUpxZzlaVGJaZGdGSWVQ?=
 =?utf-8?B?VXV3eTNUVlllVE9ZRzcxQWxyVGdWWGR6M3BPbE5ST2VZc2lOTEpZVGRscndF?=
 =?utf-8?B?QVQxRlRvNlM0MUJVMUtxQTFzOU4wVHFVS3hvWFZLTnlRNmRyYnFhbjNqaXkr?=
 =?utf-8?B?c2pvbkpXOGlNOCs4aWVoclhGNVh0ejVBTk5QODdhalc5UDJrTHc1QWZieURU?=
 =?utf-8?B?Q0drcUxuUkU1NkJ5TmljMEIrbFZQM1ZScjcxQS9RWTlyR0k0U01zYms4bnFq?=
 =?utf-8?B?eFFHM1h6U0NwUWtIcmUrbUliVXBQa1lZd1hRakFEMzA5NW1rVm1adGg2NTg3?=
 =?utf-8?Q?uBAm4Qs0/RnyJneL+hxYVQGAq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a4536a-7bab-46df-91d8-08dd65f21db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 07:54:31.1188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNuOpOqQTAp+ZlL6zlF0RzuyiHSu47voS2KjtIT5tQCJ7etgRxH2js7P+OhsH2/7uBNglwHSQLAlcot+Zyr8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213184

SGkgQWxsLA0KIA0KUUEgZm9yIHlvY3RvLTUuMl9NMy5yYzEgaXMgY29tcGxldGVkLiBUaGlzIGlz
IHRoZSBmdWxsIHJlcG9ydCBmb3IgdGhpcyByZWxlYXNlOiAgDQpodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90cmVlLz9o
PWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQogDQoNCj09PT09PT0gU3VtbWFyeSA9PT09PT09PQ0K
TmV3IGlzc3VlIGZvdW5kLiANCkltYWdlIG5vdCBhYmxlIHRvIGJvb3QgdXAgb24gQVJMIHBsYXRm
b3JtLiANCmh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTU4MDINCg0KDQpUaGFua3MsDQpKaW5nIEh1aQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3Jn
IDxxYS1idWlsZC0NCj4gbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJl
aGFsZiBPZiBSaWNoYXJkIFB1cmRpZSB2aWENCj4gbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBT
ZW50OiBNb25kYXksIE1hcmNoIDEwLCAyMDI1IDU6MTAgUE0NCj4gVG86IDx5b2N0b0BsaXN0cy55
b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFh
LWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJv
amVjdC5vcmc+DQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFBIG5vdGlmaWNh
dGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyDQo+IGJ1aWxkICh5b2N0by01LjJfTTMucmMx
KQ0KPiANCj4gICAgIEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTUuMl9NMy5yYzEpIHdh
cyBjb21wbGV0ZWQgb24gdGhlDQo+IGF1dG9idWlsZGVyIGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+
IA0KPiANCj4gICAgICAgICBodHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95
b2N0by01LjJfTTMucmMxDQo+IA0KPiANCj4gICAgIEJ1aWxkIFVSTDoNCj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzEx
NTQNCj4gDQo+ICAgICBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiANCj4gICAgIGJpdGJha2U6
IGQ1NTYyZTAwN2M3YzY0ZTg2MTNhMTE4YWI5YTZjNzNlZDIwNjMyNjMNCj4gbWV0YS1hZ2w6IDE3
ZmQ1MDFmYWUyMzYxNTg4ZjJhZjcyYzIyOWQ1NjYxMmNkY2E0MGYNCj4gbWV0YS1hcm06IGI2MjI3
ZTI5NjI1YzI1MDliMDgzMDkyZTVlMTA5NzVjM2IyZDAzN2INCj4gbWV0YS1hd3M6IDg4NmRlYTg1
YTMwNGI1ZGIwMzQ2NDk0YjJlOTVlN2M1OWNhYjE0ZGENCj4gbWV0YS1jbGFuZzogMzY2OWMyOGU5
MGFkNzEwZTM4YWQyMzgxZWYwMjkyZDcwNmZhOWZmZA0KPiBtZXRhLWludGVsOiA4MWIxMTBlNGZh
ZTNjNDdkNjU4NzJmZmM2MGJkYTZlOTIyNzFiM2Y1DQo+IG1ldGEtbWluZ3c6IGVkY2U2OTNlMWI4
ZmFiZDg0NjUxYWE2YzA4ODhhYWZiY2YyMzg1NzcNCj4gbWV0YS1vcGVuZW1iZWRkZWQ6IDc0MTEw
ODY5YThjMWM1NDI3MGMzYTkxOWVmN2U4NGJlZDg5NmUxNjYNCj4gbWV0YS12aXJ0dWFsaXphdGlv
bjogMmIwZTExOWQ1Y2U0MTA2ZTc4YzIxNGJhYmZjMWM2ZmUwMmY2MzZiMg0KPiBvZWNvcmU6IDYw
MjdhNmM2Y2YyODNiZmI2MzliYjZjM2JjMmYzNWIzZGEyMjUzNTINCj4gcG9reTogMDQ2YTkyZDM1
MWUyMDI1ZTBkYWRlYWQ5ZjcwZjg1ZWZmOGY1YWY3MA0KPiANCj4gDQo+IA0KPiBUaGlzIGlzIGFu
IGF1dG9tYXRlZCBtZXNzYWdlIGZyb20gdGhlIFlvY3RvIFByb2plY3QgQXV0b2J1aWxkZXINCj4g
R2l0OiBnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy95b2N0by1hdXRvYnVpbGRlcjINCj4gRW1h
aWw6IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcNCj4gDQo+IA0KPiANCj4gDQo+
IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCM1MjIpOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0NCj4gbm90aWZpY2F0aW9u
L21lc3NhZ2UvNTIyDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL210LzExMTYxNTUyNC82NDI0MDQ0DQo+IEdyb3VwIE93bmVyOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0
cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qub3JnL2cvcWEtYnVpbGQtDQo+IG5vdGlmaWNhdGlvbi9s
ZWF2ZS8xMzU4MTgwMi82NDI0MDQ0LzE3NDY4MTM4OTcveHl6enkNCj4gW2ppbmcuaHVpLnRoYW1A
aW50ZWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg0K

