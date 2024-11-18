Return-Path: <jing.hui.tham@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189F0D10F3D
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 01:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by mx.groups.io with SMTP id smtpd.web10.31138.1731894665147914803
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 17:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=kHeqY+qu;
 spf=pass (domain: intel.com, ip: 192.198.163.17, mailfrom: jing.hui.tham@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894665; x=1763430665;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=2Z5MQ4EyXBOazwKxSU9Aiq9mbjbxytjtpJmlLgsLw/0=;
  b=kHeqY+quiQHmXRw21fJAa85wXqpjZAy2K3Qi53nra7+fy/hX5CqpxeOy
   WG1NEUY4WJll66/pixsNvngbkCnMeExd8D9UFB6dQmjZLyZNMeA8Gx41Y
   wEfay9A2FWzuGkI/kVo1KP9sJOrVmGlkDjZYat7dNvTAem5loo6gkgC3z
   xEy8UHf2GWyu+Mo2VqLC8hDUrX0t4nNjreAiYbAH+QYWtq30bAuO/lg4v
   g+rmCQuNUR1fQhYBbWIstLuFNrf2kPh55MfSJfb4kWl2WXFXXdTydLliH
   Hcy4/hGUsmL/Aez48DOhPLQgVKiAij1ncSixCrx4527BCn7V6pD3Ynx1u
   Q==;
X-CSE-ConnectionGUID: DNReNI5pS/ijXe1OJyUFaA==
X-CSE-MsgGUID: CLA3mAOeShCYW6L8AB0Wjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31752306"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31752306"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:51:05 -0800
X-CSE-ConnectionGUID: 6te2TLWRSJO5GLgKxUC8fQ==
X-CSE-MsgGUID: QiK4uJl4SXW/TLWU7MmcXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89089538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2024 17:51:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 17:51:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 17:51:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 17:51:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mvz2LC2wuzZ0hdnMTr60sFhjErmYAWS7ll86iV8x8j6gEZ7yAIPvQ19kp7DJQSygCVJQjUjdpI97A04V7W4rAnwNT+/wzd7e8tzINyaHZszdUlIqht9u6mnupy1upUROuya9ZjM/l4frs+soRQNHCzBslEMsQMIbWC+GYsPqYQHNYNnaqXmNPcgwFMnmYY/PL/RpxvmPhbAkU6fD6pX1Ili3LjO8rKLouZwSH6Xgrxw/m1rzyr1XjVMChCj8/3WjIMuqLIE1AcOYse5jJJU58b7hJFsz9sixYLWdjp83Jahi4RYybnVLDZYcSJSLz/BDYQazfdPZN61p6ZCZIl6cPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z5MQ4EyXBOazwKxSU9Aiq9mbjbxytjtpJmlLgsLw/0=;
 b=qz8c6vPgqc6jxGklfJl1qeEI2rWDQ43FvXzotdGasWJl+A5MOj6c8lFDKMP/D7l81iKnclqhO+kTtwDE84ZwtrO1KFnbQyCSQwsOz7LB6/coRXqB0A4hTiWyPsgkB94R56QxCUakaneQ7hL2zW15sGI0SRA+n0iusm7Bdedva40Y+UiGOT4unAxMWbGKLgCl76pgJyEd1yA3cM8Oot4zWCmVblaLaO6lJjKUtYpzq0zCzmY+WiMpuWrQ7RV/K0WMf8rmyp0ojZsvxLLFnirVkcRymnK6s73Amu7cN8YZtBlMTUvL4++iW9dT+Prv2YZoBDLRncA61Ad7GULVXJZy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7760.namprd11.prod.outlook.com (2603:10b6:8:100::19)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 01:51:02 +0000
Received: from DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a]) by DM4PR11MB7760.namprd11.prod.outlook.com
 ([fe80::e210:b6a3:f037:f49a%4]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 01:51:01 +0000
From: "Tham, Jing Hui" <jing.hui.tham@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, "Yocto
 (yocto@lists.yoctoproject.org)" <yocto@lists.yoctoproject.org>, "Pokybuild
 User" <pokybuild@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-4.0.23.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-4.0.23.rc1)
Thread-Index: AQHbOCxXsjr6K4OdCE65KOhZlJS39rK8R9vw
Date: Mon, 18 Nov 2024 01:51:01 +0000
Message-ID: <DM4PR11MB7760F6FC0F6C4BA48BDCD7BFA1272@DM4PR11MB7760.namprd11.prod.outlook.com>
References: <CAOSpxdbKwz6Og979Mj0XUbxvrXtih5g-EY-prd4sypzLw-g8rQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbKwz6Og979Mj0XUbxvrXtih5g-EY-prd4sypzLw-g8rQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7760:EE_|IA1PR11MB8802:EE_
x-ms-office365-filtering-correlation-id: ee41d0f8-02ff-4ffc-8cff-08dd077374d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RFZRd21neFNsaXhyam1UaGZDUDhYN0toamdrOE1naHFBNnRXQnMyZERxdkRN?=
 =?utf-8?B?Ym1RRHBRQ0UySE4ra01zbS82YTdxc0EwNENwa3VDdlJHOE1JUVNVaDFkeHo0?=
 =?utf-8?B?cUt2VUMxQnA3cVBuQ0hEQ2c4b3R2TE1RTndlaEtENU1TVmw2NjZlVjdGWDRu?=
 =?utf-8?B?NkJMTEdEVC83YjBsY2hIaDlzRG9Kc3JIYktSR0tjaVJxczVYT1R5TTNJTkJi?=
 =?utf-8?B?ckhwbmRGZmhqdlBQVWhQbGdud29yRDlOb0FYRk52dDd3dXB2bjRZZ0poMHc3?=
 =?utf-8?B?ZXYvUkgrMW1ya0JNbEJyNWNiRUNac2JueFZFU2ZQRTJVQ0wvekd1YkpRVnZw?=
 =?utf-8?B?aHN6aWx5ZndQRnd0ODB2YkdRdUlVUVhkdVhHKzBBNFBoaFdacncwM1RLS3Jv?=
 =?utf-8?B?TTJxR2Jud3ZwWmUvZmJTOXAwc0tSSDVCYUt2YVBpbG5aMC94dHF4cXNXT1JF?=
 =?utf-8?B?RnVEdkhBSi9UMzF4cElFcXc0bFpXT3N2R1lVbzl2NCtxdmlQWnNWbm5RamFJ?=
 =?utf-8?B?Uld5aFdVM2lNQWY4VWdWK3h6blFyZEdBbVBEdE1WVWFLb3RxV1dSUVlYNWtn?=
 =?utf-8?B?L1ExR1NiTUNPM0wxUFB5T0JXd3Rid1BINndtSnZFcWlTM1IxSXp6T3g2SmtE?=
 =?utf-8?B?SWsrc1MveHJGVEI2M3ora0hOczltcDBIMkNZR2dHR0FZRFJUalpHZ0FNN3BS?=
 =?utf-8?B?bFlvSEZKQWNKbnBGajJsaUttdEl4WVBxc05XaXBFWWtxcFhFYm1zeVIxeHc2?=
 =?utf-8?B?ZDlIYjFJRE9oLzJqZWZaKzRyZHNNMHhTUncyTXdWR1hLQnR1NzFVSEgvQk9S?=
 =?utf-8?B?VWUxRGk5OWg0SE5PbzJQVndIaDhsNEl6L0JIbVFJZnJUL25uUDJCM3d1STZ2?=
 =?utf-8?B?dFI3VkM3aUtMQTJtV3ZBOTFCd1lzaVhqRHR4eWJJSW1Oa25XbnFYTGR2OVA0?=
 =?utf-8?B?T1dyaG5ZZnhpbTN2MjVSOTVna3VOREc3Tkp6aEhjL0QrYktlbENuMjJEcUYy?=
 =?utf-8?B?MHFMQStMdDFOUm9tekdBOVArU1lnYk9MVG10OUZzajRseDI5elBtLzBmaUxh?=
 =?utf-8?B?TWd1bmFnbTRuenREQndYLzZHUFVkbXdlTE11R3lJcStrQzhleGdCOW0rdzBN?=
 =?utf-8?B?Qmh3NnFrOW5yNkpkd3BvRGJFNTVHSkd2MmtDTjllLyswaThJZGwvYlpubmNB?=
 =?utf-8?B?S0dyT1hTTGxxSkU4dWNWemxxQ0F2T21DazIzSURTanp2WHkxdVBpYXlMNWNh?=
 =?utf-8?B?Ym9uOENDUXkzZ3dPVUgxTjJNbGdrTU5MMWc3RzlqRVJHN3pHczVIcUpXbUJD?=
 =?utf-8?B?RGpRbG91bjR5VEFJR2VWeFlTdjc0Sk14clNocXhYTTVEekovdWpVNjQ0MWxi?=
 =?utf-8?B?OFVKcVlIZ1BtVFJaenQ4NEJUT2E1blF5TWtteVE5MWFITVVYUVowbURtaEpl?=
 =?utf-8?B?Q0VKRDR0WHlSV1IyclJFMTBSelR5TWQrMTRVbERrOTF1ajBqaUNxUGo0QnhY?=
 =?utf-8?B?b0RvQzlJUmFQQ0NkeEdYWmUzQURYZWZ3d1NVSmhwdEVIblN0VkZUd28xTkp0?=
 =?utf-8?B?cUF3RDJQekNlR0FsK1djUnJlM1NKcEZXMmM0OGs5dHRGeUZhakppb3dzOWpP?=
 =?utf-8?B?L0RGNmUvNFZFd2tOZldBZlZmbXExMzZ6aE53L25zM1VTQXhOMWYvU3JyWkw5?=
 =?utf-8?B?UlNDM2VQVko5aWJ6SVVIczdVSmZkNDg2clNoZllXUk9sNGsyaGlCSHZVYnFi?=
 =?utf-8?Q?TSneTNyNNr7gRwwJJ1wgM/Asm09+dEjeEZoJHhF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7760.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2dIbDZQS3N3UTNYYlhlb3VEZlB1VFh5b0JLRUVTanBXamFEZGg0RDd4QTFQ?=
 =?utf-8?B?TmdFMHBkRHdlSVhhQUFGZVBXcTg3UlpQNkMrTEE2aXB1ekhPSUgwa2JML2ND?=
 =?utf-8?B?OUFRdTZPQzlFUjVCMTA2TkVLVFptZ2gzTm1ac0I0eS9iTU1UUFNrM0FESkM5?=
 =?utf-8?B?SklqcnphdlF2a0x1aDErdHJ3b2xyNms2cVVmTXdRWkovMEdra01HYXdJMklM?=
 =?utf-8?B?Y0s5WEhtVUQ4Mmh3bXpIQmdxeUQyeFd2Ymh4dHUyVjl0V0tXa0IzbFNsQ0lm?=
 =?utf-8?B?bjdRblYyRGZRVDBBRTRzTmkrNXp1Nk1wcTJrR1R2dW80Tzdnb3pkbXZyTytJ?=
 =?utf-8?B?N0Nyb0pPcG9MN0hUaHRPeWo0eVY4ZHREZmFyUStxQ2hDK1JxUFZab0FzaHEy?=
 =?utf-8?B?d0hCL0RvY1NQbkh0MjNINU5DNjhGV3ZyR0Q1dStJZWIrdjZ5UVNNUWVFUlZq?=
 =?utf-8?B?QmExTk5XUm9uWVQ1L2dMNGpldHhnNDJlcHAxdWl5dHlOTEdkeWpKZ1VSRThv?=
 =?utf-8?B?b1NmeVRTZlVVQVkrbnFEcUJ3clEzQXZwU2ZHSmdwMXZ4YlgyNEQzbk1palBL?=
 =?utf-8?B?TUFLd2d1cklQZUo3aXg3dlNnQnNvdEprbGdHQmtWYWlvS3JjbHowR0xoMTd5?=
 =?utf-8?B?YkYyT3RCdjh0STB5L0VENEU1MERUbVB6bEEzaFNVMlJGUXNGVW5LT1RGS1FE?=
 =?utf-8?B?V0ZhZ3NHa0I3TW4yV1Yzcjk2MkJwdXNFbkpqRUpJWXFncG5aVlRKeVhPWkFz?=
 =?utf-8?B?OVZnb0hnK0ZLTGhzY3hxQmJncHpXc091YW92NHVySTZGMDN0UCtZQWtGSkFq?=
 =?utf-8?B?czg1eUp1ZlpmbHFqb0doNE5NOFdZNy85aDhaVUxQS3A0VG1FYkRGemhnVUxY?=
 =?utf-8?B?YlB6ZzZyUiszMDNPRGxtTlpvM2E0Vkl3OVRzZGlhQndmTFhIdmRnZGhwcjV4?=
 =?utf-8?B?VURQS0J3WnVDaUgybDZYUmc0dlByQ01YdGVsVWhsd0N5eHpqb3V1ZWhwcVhj?=
 =?utf-8?B?N1Z2TUsxRU95bXN2OFBzUnF5M2RyQTByMzI5WFFWMUE1djlrMjA0UW16cEU4?=
 =?utf-8?B?QXJFMlg4NTZVUmJEaDNIaVJzV05zaDQ1dHR3NTBQVnN4cU5kbnZiQjg5UnV3?=
 =?utf-8?B?c01lKzAxVmJQSDBnL2xCeDZpRzFaTFgvL1pZRXZkNitPL1R6ZFQ2bC94QVpN?=
 =?utf-8?B?a0xMcHpPSTN1RkI2MmNjVGNaR1NyZmxzbWcrQ1JQMmZld05TV256bzVISFpR?=
 =?utf-8?B?OUZpUFhocWludnlROVlMZGRwK2JjK0R5a1BjeGdydGMybUtSS1lKeGZrcWFt?=
 =?utf-8?B?TjR6eC9FRVJoNHlBUkZMb2ZTTE8vei8zNGpwcXNTWlUyUHZIUTFvSkRyMGVX?=
 =?utf-8?B?bHp1NFhJRUNkbHIwWFNKbHp4eFBDUHZncFQ3TVR2UisvbFY1MWZkeHFzQVhu?=
 =?utf-8?B?czk2bm9hNjNhL1BNZVFieDVLZVFUcDB3K1l0cW82VzdmVUxYam5ZUlFuZEdh?=
 =?utf-8?B?QUtiaERtZlBjUC9vRWJmNHdXQjFyYUZzYk9pdFczZFBBZUl0bWJLMTVUcDBU?=
 =?utf-8?B?Zkd6Ym1jQ1JoOWYzSnBYSng5WHhUK2ZEelZ1VWFjU1B6QzNTNGdNemN2b3ZH?=
 =?utf-8?B?aEFTNFVWMzAzSjVRU2xURzMrYThmRTFQa3k5a2srZG03dy9YMHNXV3JXTzg3?=
 =?utf-8?B?MmwyU2JERzFvOGpEMFVBR1RSOUprenA0d25uVnZoRDJhT0E0THpwQUZmYTNo?=
 =?utf-8?B?Ujd5OEx3bWRoVDFHOHpHZDZKbUxHaWpLbHdpTy9idDhiSTlIYkpJQ0haNWRu?=
 =?utf-8?B?c1hnRy9EdEg3ZHRuOENGMDQzVmlkcDIrMTJldVM1b2JTUjZjT0NoN3UxOGVJ?=
 =?utf-8?B?OE41S2xodkhRUFpoL1pJMCtmY05nSnRNQVgzczYxTnJEcHVpWmhnVVE3UU9S?=
 =?utf-8?B?d1lBY1JvTm45aGYrNnV1eFJsYUNhaUNMaDArUFcwVEJFMkpOL2FYaG1KcW5I?=
 =?utf-8?B?RFZVS253bHE5ZmFManc2UVlDMmIvNlNRM3FSSUg4ZmYvdG1WMmIxcWQrK3Nm?=
 =?utf-8?B?K2hIN0VrS2YvMnQ1OVM4eGFQaW5ISHdTdnY2QTJRSWY5Z1c4MHlQMW9IOXRU?=
 =?utf-8?Q?zQh8O1pcnDNMfBiASVwThRCUl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee41d0f8-02ff-4ffc-8cff-08dd077374d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 01:51:01.9300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mF+4YQcaS5Tf3Gg14NmQL3YLaq8AamigMeaHkKo9rTuvQZ2qdEGdYAFfmHYrdHxdfK3X6qd7s3NQhR1eSEF1ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 01:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207199

SGkgYWxsLA0KIA0KSW50ZWwgYW5kIFdSIFlQIFFBIGlzIHBsYW5uaW5nIGZvciBRQSBleGVjdXRp
b24gZm9yIFlQIGJ1aWxkIHlvY3RvLTQuMC4yMy5yYzEuIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCiANCk9FUUEtbWFudWFsIHRlc3Rz
IGZvciBmb2xsb3dpbmcgbW9kdWxlOg0KMS4gT0UtQ29yZQ0KMi4gQlNQLWh3DQogDQpSdW50aW1l
IGF1dG8gdGVzdCBmb3IgZm9sbG93aW5nIHBsYXRmb3JtczoNCgkxLiBNaW5ub3dCb2FyZCBUdXJi
b3QgLSAzMmJpdA0KCTIuIEthYnkgTGFrZSAoN3RoIEdlbmVyYXRpb24gSW50ZWzCriBDb3Jl4oSi
IFByb2Nlc3NvcnMpDQoJMy4gVGlnZXIgTGFrZSAoMTF0aCBHZW5lcmF0aW9uIEludGVswq4gQ29y
ZeKEoiBQcm9jZXNzb3JzKQ0KCTQuIEFsZGVyIExha2UtUyAoMTJ0aCBHZW5lcmF0aW9uIEludGVs
wq4gQ29yZeKEoiBQcm9jZXNzb3JzKQ0KCTUuIFJhcHRvciBMYWtlLVAgKDEzdGggR2VuZXJhdGlv
biBJbnRlbMKuIENvcmXihKIgUHJvY2Vzc29ycykNCgk2LiBFZGdlcm91dGVyDQoJNy4gQmVhZ2xl
Ym9uZQ0KDQogDQpFVEEgZm9yIGNvbXBsZXRpb246IFRodXJzZGF5LCAyMSBOb3YgMjAyNC4NCiAN
CkJlc3QgcmVnYXJkcywNCkppbmcgSHVpDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHFh
LWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxm
IE9mIFN0ZXZlIFNha29tYW4NCj4gU2VudDogU2F0dXJkYXksIE5vdmVtYmVyIDE2LCAyMDI0IDk6
MzUgUE0NCj4gVG86IFlvY3RvICh5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnKSA8eW9jdG9A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0
cy55b2N0b3Byb2plY3Qub3JnDQo+IFN1YmplY3Q6IFtxYS1idWlsZC1ub3RpZmljYXRpb25dIFFB
IG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyDQo+IGJ1aWxkICh5b2N0by00
LjAuMjMucmMxKQ0KPiANCj4gQSBidWlsZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNC4wLjIzLnJj
MSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXINCj4gYW5kIGlzIGF2YWlsYWJsZSBh
dDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvcmVsZWFzZXMv
eW9jdG8tNC4wLjIzLnJjMQ0KPiANCj4gDQo+IEJ1aWxkIFVSTDogaHR0cHM6Ly92YWxreXJpZS55
b2N0b3Byb2plY3Qub3JnLyMvYnVpbGRlcnMvMjkvYnVpbGRzLzQ0Nw0KPiANCj4gQnVpbGQgaGFz
aCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IGZiNzNjNDk1YzQ1ZDFkNDEwN2NmZDYwYjY3
YTViNGYxMWE5OTY0N2INCj4gbWV0YS1hZ2w6IDUxMGE3M2Q4ZWJjYzU4MzljM2E5NDFjNjg2MTc1
Y2I4MzkyMmMwZjMNCj4gbWV0YS1hcm06IDkzNmMwMmVjMTM2NjFiZDg2YTA1ZjdmOTBlMWI5MjBk
NTA5MmQ2NzANCj4gbWV0YS1hd3M6IDU3ZTRjMWNiNDUwNzhlZWVlMjk1NzU0MjI2ZWI4ZTU5ODAy
YTEzN2MNCj4gbWV0YS1jbGFuZzogOGJjODkzZDczNWU1Zjc3OWEyZGNkYzM5OTI2MjFkNWFiMzcx
ODAwZA0KPiBtZXRhLWdwbHYyOiBkMmY4YjVjZGIyODViNzJhNGVkOTM0NTBmNjcwM2NhMjdhYTQy
ZThhDQo+IG1ldGEtaW50ZWw6IDg1MTRjNjBhYzFhOWExN2JhMjBiMTdmYTE3NjExOTcyOGE5MWRj
ZjkNCj4gbWV0YS1taW5ndzogODdjMjJhYmIxZjExYmU0MzBjYWY0MzcyZTZiODMzZGM3ZDc3NTY0
ZQ0KPiBtZXRhLW9wZW5lbWJlZGRlZDogNGFkNDFiYWVkNjIzNmQ0OTk4MDRjYmZjNGYxNzQwNDJk
ODRmY2U5Nw0KPiBtZXRhLXZpcnR1YWxpemF0aW9uOiBjOTk2ZGYzMzc2M2YyOTJkYTVlNzUxM2M1
NzQyNzJkN2RlMjNlYWZjDQo+IG9lY29yZTogZmI0NWM1Y2Y4YzJiNjYzYWYyOTNhY2IwNjlkNDQ2
NjEwZjc3ZmYxYQ0KPiBwb2t5OiA4ZTA5Mjg1MmI2M2U5OThkOTkwYjhmOGUxYWE5MTI5N2RlYzQ0
MzBmDQo+IA0KPiANCj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUg
WW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZw0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzQ4MCk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxk
LQ0KPiBub3RpZmljYXRpb24vbWVzc2FnZS80ODANCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTA5NjEwMjkyLzY0MjQwNDQNCj4gR3JvdXAgT3du
ZXI6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbitvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+
IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy9xYS1idWlsZC0N
Cj4gbm90aWZpY2F0aW9uL2xlYXZlLzEzNTgxODAyLzY0MjQwNDQvMTc0NjgxMzg5Ny94eXp6eQ0K
PiBbamluZy5odWkudGhhbUBpbnRlbC5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
IA0KDQo=

