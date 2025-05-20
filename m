Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274C5C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:58:01 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web10.16245.1747731471728597231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 01:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Y2Zbiz1U;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747731472; x=1779267472;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EyTQdvIlr74Jn5ZBamUPkc6O1jCt6Q21P7N0HVKCHxI=;
  b=Y2Zbiz1UdiFKxT4e3OnwHNXYNU7hFKXxFOq1/za973++7Uib/RbmXVD2
   IfGn1/ajmhQBBOf++LZi6iF34Jd3F0lZttLk0up+xw+Y74R+Vb72eM0yA
   nvoQnL3VkLhJKP7Vde3I/4ALbS3VnbKE6J6EFgbtSgneOcIKM5TFzUWVJ
   SHoXUebSLkVPM5CD8dhRtyAmvhoz3hL9xpIg+1k3mCj59Nu/uwi1y4nZ0
   sJDfU6Lc2BlPusvC6BCLMtGYHjIN+0Cr9o06snPRGKfD2VcC9TbmdiHyY
   65WWF0GPVab8H0pX/Hz4zP5KS5XNIn3QisGhHJ/822DJbyhv5wn7O/zpv
   A==;
X-CSE-ConnectionGUID: B4Wh3SmfRa2U3jRrkCkUBg==
X-CSE-MsgGUID: zy36eB79QFqplEKG71kGow==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="156494260"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="156494260"
Received: from mail-japanwestazlp17010005.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:57:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8YnaYADRoyyuS/OWBqaS77FNoMmEk1T9w4QYTuOH1UHasyL75/wusjjEqip1WoZYEt+FfG4sbc4XU/ZpbFVdDmtRNmB+EbGbIgkdQ4FFal+6tmuxTru/b0ABL/P8O020mc3dpH/1XaZnqow7SUJjXZv/KjtD7eFLiz+6OrGKAZ1YMYvIUgFbZPsS61ZfbG563MGOay9dIWpSgIAUkh5HzjHwIXAr85Ca8w1+PQvIS/Xa4sMMzfC2Ls6SWET0MReBnelRrpxkJKb1+zkI+PwxzI4dNvEPsJyFbn4+VfOXeuZaj9dXPWtZTBKTxW2+4ueVhB8ifaZ6Qc4SNlsJD/jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyTQdvIlr74Jn5ZBamUPkc6O1jCt6Q21P7N0HVKCHxI=;
 b=iZkrwrnU/eJWh7lzn8u3ATTxZ79qulXNcFwDSHCD55uNFm6VOtWAEgZyaYNS6eRczcop7vkt4co4tA030+nihrO4FA0IptmjsKTAUd44ImXEzOxDzqJhot1J/d8Ulnhm1AzTbUzawbnK6/1/SlXegVABQdMBFqarI/aeZBu4/BZc9BAz49HmgQTcH35f/og4S6nQQPYMxL8j765JGgnLbGvZFc2Mb8odkAq0EpRjeYMgegwV+K68J9Lr4YHXm4nW2EMjcQxX1KaXRa9ZvalJu8VhuqVLYPJLKD+mpItonqrBye86M2gE+PjDpW/nXFW1JdBUoRPNPlYz3zkStrc9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by OSAPR01MB7198.jpnprd01.prod.outlook.com
 (2603:1096:604:140::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 08:57:46 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 08:57:46 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Topic: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Index: AQHbxkQgvGR62EwISkC4dP6cxmz0dbPU/nIAgAY3O8CAAAYCIA==
Date: Tue, 20 May 2025 08:57:46 +0000
Message-ID: 
 <OSRPR01MB11597F34C48FDE22AA2AAA2359B9FA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
 <5625AB89-3201-47B0-B698-9039CE2BC553@arm.com>
 <18412F1B5788A5E6.30463@lists.openembedded.org>
In-Reply-To: <18412F1B5788A5E6.30463@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MGRiNDBiOGUtYTU0ZC00OWM0LTgxMTEtYTdkNmI5MWZm?=
 =?utf-8?B?OTk3O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTIwVDA4OjI4OjA3WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|OSAPR01MB7198:EE_
x-ms-office365-filtering-correlation-id: e6f9155a-39ec-46c2-0812-08dd977c63d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S2QxbDcrZWZoUzlvYzQ5OUt6S2pwZUMwRFFWRzU4RnQ3L3hOVTNmVU9hNTNV?=
 =?utf-8?B?N2VXdXVUMTdweXArRUVsblMzdHh3V1kxQUNIWml2SWljNXhhRlRXQmZFblJE?=
 =?utf-8?B?N0ozdVcvSVU5Q2cwam5kWDR0cUUvbGFYZEovQk5pOXNBcEJaTGVqZEllS2J3?=
 =?utf-8?B?TXIvSkhHWjZaaDhRTDhqb2pjMXJyN2IyZTVJRHRRU0lOdkg2Sk1VaVdDcjdm?=
 =?utf-8?B?bVY1MEI4VjFWdWJQTjBWdmVwK21zMHhsYVBHWnRNcFdyaEpVWVVtd0wxcmto?=
 =?utf-8?B?bWFLYmxRY2t1NU5TbVdJak9hTGc1c3JlWVVhQTI0Z3Q0V0hGQkxXNmFtazUx?=
 =?utf-8?B?d1JyTS8vT2d2aGFPZEFyL21yYTdRN0EzdGNKTmpsSlBXZEdhMDZQZkV6THpk?=
 =?utf-8?B?Uk95WEtOOFRKV3VwUWNFMDZaSHVXRmtlQTRHanJTWFZFRUo5RkFxVGk3NzFx?=
 =?utf-8?B?emhkdEtqRlRjaDdGTGRMc2ozMXA3YUdhbVp4UjFuNnJkY3cybEc1RmxTcUdO?=
 =?utf-8?B?OWY0blMxbGJDbjUxaXBOTkV4dWJIdGdGdlVYZ1pSMENQZDY5OXdObmZST1hs?=
 =?utf-8?B?WGR5SEU1elA2b2V0VjJTYUdGYXlJOVVON2RwL2lrVmg3ZllLUGtKYnlSRzc0?=
 =?utf-8?B?dzNMZWZsWGM4dHYrN1RMR0N5VGIxb2owc29JQkhTdmlsZTRuaStQLzAyVEk3?=
 =?utf-8?B?WWxESElxM1kxL1ZCcG5Zc1RyS2VQOU1yQ2Z0RVhiTGtTZzBRR0FIMVA4WC9B?=
 =?utf-8?B?V0p0TGdETnA3bXd6TllzcFhVdW9aMmwzalpUK1FHSVlPVUgxd2RoYTdkR2RB?=
 =?utf-8?B?T05nSWtxQVlBOEtXV0x0cHErSEtETEpUWEJtL1ZGWTJLOXpFNGpLVUhMaE5X?=
 =?utf-8?B?N0huekNmUDhjQ1o5aGNJNXBDK3ZEVk4vNzBaQ3VYdTZib3FtWnJtQzlMdzZE?=
 =?utf-8?B?VEdoQ2xtL0FNU2hsS2FtczI5cXFZTmIzSTBnNGFYY2I1cWRrcHhzcU81b0ZK?=
 =?utf-8?B?eGZ2YVQwbC9QSzZsRmNjSTVqNHp5WjNKVTBmTCtHN3BWZkFadXVXcUNrWGxY?=
 =?utf-8?B?UXdEWjNMSGRBOUs5UjNNd0o3QTQ0VWpTTkNhclBPUHFYd2kxbjhCaDdyTlZx?=
 =?utf-8?B?VGhuR1dQaDBBR1M4RUJ4ZDF0c1BGaERKcmk1bU55RGpiRU83NjIxNVd6d3Vi?=
 =?utf-8?B?YTVEbkxzNmdtb2kyZmVZblRzMVpuVmx5ZUVwMDBZQ3N0c1VvU0tRTnZaeXRB?=
 =?utf-8?B?UU9MdmdyOVV3cXNYR0JMMTFBWnRvNytzbUVlWm9FM29WdXVFR3MyTmZCTEZn?=
 =?utf-8?B?eGc2cWZQMnZqd2tWNk43TmdOWHFPUDZCRmlvKzVRdzJXTHYzTTc3MklsOHNw?=
 =?utf-8?B?OVRPM0xvU1pqN3dZQ0JwQ1F4WStzbEpzZEZHeVQvRk8zaGdlUmtKRDlWbUdj?=
 =?utf-8?B?bnVDWWQzUEswMjROaFUxcUtFODM0SXh3Sm5qMHB3eUpwbjNwbnFTRHFMaC9x?=
 =?utf-8?B?WEUrTzhsUWRPeU5ldHlyNEp0T01kUlNUSUJEdXBsMHhlMWIvL0Y3K2diTXRH?=
 =?utf-8?B?c01qSGZlS1AwdmNEV0E2aVRGWldYQUszRzVKK1RvYXJtbnhJaEFablBocXBn?=
 =?utf-8?B?dU9NK2xJV0dzTzFRK2Y4Q0Z4Z1pSRWJ4YkpPRjlXb1FFbTB1TkpaQ0RiR0Vu?=
 =?utf-8?B?SVhQSCtNbVRxOUxMeVdid0JhMmxUMVgvOURmSFk4OWJsdnN5aDRsbFFKMXdU?=
 =?utf-8?B?WjhBUzU0cjRIN0NwcEhWZ3RBYlV4VGF6NDhlWnpMYzdUZDB2NVVKZ0tUY2tP?=
 =?utf-8?B?d1lJKzltbmdMdHJ4TUtiakZWckZkZW1wZmkrdUs1MGM2cmV4QWpoeDY0SkhO?=
 =?utf-8?B?NnVkMUFoOE9Xam5yb2ZCeXZlUTc1Sk05N1VHRWRQOUpNOGMzK3V4MmtLcWlG?=
 =?utf-8?B?RjArb1diUGZLSXJSbi9tbmNwcklPMFV3R0Z1eVluYUo1OStsVnZ6bTllVVhY?=
 =?utf-8?B?cTRhVUpzYjVKSnJhNlE4cy9DL3hCKzR4dGp6eWtXNU4vdnBneXlYeHVScFBz?=
 =?utf-8?Q?MDy3nH?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RDRQb1dkbkQrbUZrUnN6dnU3ekxFNExCcC8zQlVlM1c2dFY2TlJxY1l0TEF6?=
 =?utf-8?B?MzZENG0xR0ZEbmgwZzN5Tkx2cFg0M0dLSzRWdU9kYTRlOW5ibk5SdkhMRWdm?=
 =?utf-8?B?ZEVwR29lVG5CajViZFN6RzNidzY3NWNxS24rcWx0d254d1J0dnFaSkZFaElh?=
 =?utf-8?B?VWtCR3VyOXl5ZEdLdVlvMnNwVzdFRXBiZFU3cklOZW4wZy9SNkg2dVNyeDZK?=
 =?utf-8?B?dEt2ZHNYc0lreUw4ZDR3SnBoYVVMZWtrUW9zdy9qNzhmYVhzdDVsR011eDI0?=
 =?utf-8?B?RExpZU1MZk5xUTFLeWlXd1U3UWpMb0lPc3hFeFFjR3lOWUQ2VXZ6enB4c0Fk?=
 =?utf-8?B?OWNEeEw1QUROb2tiUGsraVNlT3IvWW5USGFUelBwTWl5S1h6K0ZVUDZpb0dD?=
 =?utf-8?B?SWJUTk5tallxNFZnbU5nMS9nOE1FV0pLck9ROWE2M0RCYTQveVZBZmhtYzZm?=
 =?utf-8?B?VFhVemdVZG12UXJSNzhvSGRmMDFSTWRVSWJyMEgwT2Y4TnRkMFd3R3ltRy9D?=
 =?utf-8?B?eFJmU3p2TnBYcTM5dWRJV0MwcXpOU21rdVhYOUJ1ZkxWMFhPVlpKeGgrblNT?=
 =?utf-8?B?amkyM04rZlM3bXZVYVM2TFpFYUFReGNKOStrajlZM28xZHRUcm9tS2FmM3Bw?=
 =?utf-8?B?K3lSMUk2akhpRHNPVUd6aVpXdi9YcnhYWmFGZ3NRUW10L1JuaE5LQ1hjWlZ1?=
 =?utf-8?B?TTNrMkJEYWNGMzA0L0Z3MnAvK2l1NUIxTXU5Q3p6aEMyM25FWGJLTkY4Q3Vi?=
 =?utf-8?B?aGR1eTJpTkRKcDhDZnhCZUxNZUtWbmFtaFYyYVVxZmdxZTRPOGtEeDVjMmZ1?=
 =?utf-8?B?MWFGTm5QVVpnWVZNcnppOEkzQUc2cGVnT0hwSS9jaklsVjFQZHk4Z1hHUmlC?=
 =?utf-8?B?MDhwTlNESG9rV0h6RjJSNjNCVUFtTWpjTDByaHJCbDdqLzlmR1lVSmxYTjg2?=
 =?utf-8?B?YTZ0R0hjaDZ1RGQyZXl5K3BLUHNOTlMrZmtPODJSekpxM0w0VC9vR2FIQXY5?=
 =?utf-8?B?NHJ1WTIwcm5qVWhxQVRaQzNXUHFnYkJLVWtKMldDeGJJUlRTR01CUURtZGlP?=
 =?utf-8?B?bm8ydkVoQi95TkZaS3M5eXdNMTN3ZVdDU2cwNGFrMjB0N2ViVERzci9WWnFR?=
 =?utf-8?B?Y0lvd2FadzNtTUNITGx6Njc5NnZQbFdtaXpLeEJTZzFYVmFzVjZCNG1zMnlY?=
 =?utf-8?B?UUljNkZPRFhDbGJtOVExVXJ1TFhhcUs5Q0hjdlMyazFBR2syWGc0Z2JPT2dx?=
 =?utf-8?B?NkFDUEVaMVl6bmpVa1VkSnE1Wnc1ZVRVS1FGUzBlejczbXNJVWJHMVpQV2Yv?=
 =?utf-8?B?czNwZy84VWFCYWFHVEZ1eTd5TWtyWk93N2tiakhQcjE1ai8yZjBldFNLOStp?=
 =?utf-8?B?OUkwWXozcUNKZi8zMHc5UWIxVE8rbXlTcXRHNWxhcVJYcUdJWWZWbXRsWDhz?=
 =?utf-8?B?enJvWkhRc0hSSWVuVGtiTmtvblFndWtKTXNxZEpaOGlKRG5FN1pPMDdublow?=
 =?utf-8?B?V0xEQ3VDbXJSM2ZqaWtuUW5pYy9iTFJWV3lmSHNiVFZSREIvMldFblVMczVE?=
 =?utf-8?B?Y3FjVHFMOVBmWStwWFhZaXVxTTFpdU9oV0x0S1RlRks3Sm1jNXIrZzB0VEkx?=
 =?utf-8?B?aFRMTEtaOE04T3NsbEhnRVYxT0tpZkJQTUZSVGR4aWl3NWZySkI5Z3kzNUVR?=
 =?utf-8?B?bGtwbGdTZTNwNmJvUDh4VU8xY214KzdGSmVDOE1SbW5UQUxFZGN1enp2cVlL?=
 =?utf-8?B?S2VLNU1rckxXamIzdVBRL3ZPZHVxMzFxVThiaWl4NHliQ0RWTzg2WHNMdDNF?=
 =?utf-8?B?QXVobHJKM1NILzhNL3U3YW1oY3dTUmJYU1ZVS0Z3bUJrc2sxUjVhRjJWY3RW?=
 =?utf-8?B?b1A0S2p1VWgwQ294UHZPNGpmNEcyb1k0RWlSYXE2SVE0QkFxNjNFVWFwalJo?=
 =?utf-8?B?dDBNMjZ6VUdRaVdkRHFhNzRCK0tNK1JpUTZlWmlKQ0V3ZjlBYzkyZ29RK2xl?=
 =?utf-8?B?SGdlb21vUVBkZDJJc0t2MUNrdENqQVBZOWZyVlZ2RThXSmxIc1VZTGh5aWhj?=
 =?utf-8?B?R3p0eUx6bmFrUlJhK1oyMFJITTZVc2VHckF1Nm15cmNLaDYvS213UWNRMHBX?=
 =?utf-8?Q?5hke4OnDT2Zf6zlc0NUz4XstN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FKNHybZtz+tozkdKRnnFaYIi5bYNB8bXHfjK9cQS1kSXnucGzR/XUgSfDWFWDKkkayaIwNShHXNZpoc/dVyFo5zucnaz/gvGA5ZDnRlpzfwP/3fBGY5y7xyYKH5UDAfhXkHQiAhp0GpdFSFR1iky6CoTyJN41spKpWaVU7RECcrm43yO1ao7UcKMArICsFS5ci/dLFxSZefrCzF+elm9aflSdSpHORBocyW/CN6MIJybVknT+YDl2FnBY3C5WqhCjam4mZPJhK0vUIzISL53ETxnaY0J5Tx1JM2ZNYuow4cvjiprlnlEk9dbAe1r4ZJufQw9C8sVyU6y8qrFGg1U3TK2DEhmF1H8f6L2jLm9kT9t2Nm7H3DYq3/OhjaaR+LvvTu+oGvBMCC82fAX96MK3VLqZGZN3xdBZ2JL+Lm+Aef9XMgWlblEj1yq139z8vl1MU2zTmiNa8RDoPlvfBSlpBCxip1feoUVEFeZ7/GsKoO+57i2qvF1NqZVM/L+d0wlKcqsbLWc6e9TUM1l+Z50tpgBx4xmHjXovHfrydaqQjIf7lKeF8fiNIto1gXZdHsOJUA64nPUT1DTAY9b9p+B9E0m+oB3npK1FmpE1QD6XnO+p7pa0uBCeut+9rvhQ7Tg
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f9155a-39ec-46c2-0812-08dd977c63d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 08:57:46.2664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdOXqJ7t9FgIcgbp9XXh1iJ3kN/4aMQQ9MWP7rZHUGG3rshc9QmcXOfp8Kk6jNLOwI510joB9XCxCJs+sh7mkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216894

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFlpZGluZyBMaXUgKEZ1aml0c3UpDQo+IHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IDIwMjXlubQ15pyIMjDml6UgMTY6MzINCj4g
VG86IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KPiBDYzogb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCB2Ml0gbGlidW53aW5kOiBmaXggbXVsdGlsaWIgY29uZmxpY3QNCj4gDQo+IA0KPiANCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFJvc3MgQnVydG9uIDxSb3Nz
LkJ1cnRvbkBhcm0uY29tPg0KPiA+IFNlbnQ6IDIwMjXlubQ15pyIMTbml6UgMTc6MzMNCj4gPiBU
bzogTGl1LCBZaWRpbmcv5YiYIOS5meS4gSA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCj4gPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBsaWJ1bndpbmQ6IGZpeCBtdWx0aWxpYiBjb25mbGlj
dA0KPiA+DQo+ID4gT24gMTYgTWF5IDIwMjUsIGF0IDEwOjIyLCBZaWRpbmcgTGl1IChGdWppdHN1
KSB2aWENCj4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxsaXV5ZC5mbnN0PWZ1aml0c3UuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IGZpeCBpc3N1
ZSB0aGF0DQo+ID4gPiB8IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0IGVycm9yOg0KPiA+ID4gfCAg
IGZpbGUgL3Vzci9saWJleGVjL2xpYnVud2luZC9jaGVjay1uYW1lc3BhY2Uuc2ggY29uZmxpY3Rz
IGJldHdlZW4NCj4gPiBhdHRlbXB0ZWQgaW5zdGFsbHMgb2YgbGlidW53aW5kLTEuOC4xLXIwLmNv
cmUyXzY0IGFuZA0KPiA+IGxpYjMyLWxpYnVud2luZC0xLjguMS1yMC5jb3JlMl8zMg0KPiA+ID4g
fCAgIGZpbGUgL3Vzci9saWJleGVjL2xpYnVud2luZC90ZXN0LXJ1bm5lciBjb25mbGljdHMgYmV0
d2Vlbg0KPiA+ID4gfCBhdHRlbXB0ZWQNCj4gPiBpbnN0YWxscyBvZiBsaWJ1bndpbmQtMS44LjEt
cjAuY29yZTJfNjQgYW5kDQo+ID4gbGliMzItbGlidW53aW5kLTEuOC4xLXIwLmNvcmUyXzMyDQo+
ID4NCj4gPiBUaGUgY2x1ZSBpcyBpbiB0aGUgbmFtZXM6IHRoZXNlIGFyZSB0ZXN0IGJpbmFyaWVz
IHRoYXQgc2hvdWxkIGJlIGluDQo+IGxpYnVud2luZC1wdGVzdC4NCj4gPiBQbGVhc2UgZG9u4oCZ
dCBpbW1lZGlhdGVseSByZWFjaCBmb3IgbXVsdGlsaWJfc2NyaXB0IHdoZW4gdGhhdCBpcw0KPiA+
IGFjdHVhbGx5IGEgbGFzdCByZXNvcnQuDQo+IA0KPiBDdXJyZW50bHksIGxpYnVud2luZCBkb2Vz
IG5vdCBzdXBwb3J0IHB0ZXN0IHlldCwgc28gSSBuZWVkIHRvIGFkZCBwdGVzdCBmb3INCj4gbGli
dW53aW5kLCByaWdodD8NCj4gVGhpcyBpcyBub3QgZWFzeSBmb3IgbWUuDQo+IA0KPiBCZWNhdXNl
IHNldmVyYWwgcHRlc3QgY2FzZXMga2VlcCBmYWlsaW5nLCBhbmQgSSBkb27igJl0IGtub3cgaG93
IHRvIGZpeCB0aGVtLi4uDQoNClRoZXJlIGFyZSAzIGZhaWxlZCBjYXNlcyh0b3RhbCA0Nyk6DQoy
OCBub3Qgb2sgLSB0ZXN0LXB0cmFjZSByZXR1cm5lZCAyNTUNCjMyIG5vdCBvayAtIHg2NC11bndp
bmQtYmFkam1wLXNpZ25hbC1mcmFtZSByZXR1cm5lZCAxDQozMyBub3Qgb2sgLSBjaGVjay1uYW1l
c3BhY2Uuc2ggcmV0dXJuZWQgMQ0KDQpGaXJzdGx5LCBJIGFtIHdvcmtpbmcgb24gY2hlY2stbmFt
ZXNwYWNlLnNoLg0KY2hlY2stbmFtZXNwYWNlLnNoIHRlc3QgY2FzZSBuZWVkIHRvICJubSAtZyAv
dXNyL2xpYi9saWJ1bndpbmQuc28iIGFuZCBjaGVjayBzeW1ib2xzLg0KV2hpY2ggbWVhbnMgd2Ug
c2hvdWxkIHBhY2sgdW5zdHJpcHBlZCAvdXNyL2xpYi9saWJ1bndpbmQuc28gdG8gY29yZS1pbWFn
ZS1wdGVzdC1saWJ1bndpbmQuDQpOb3cgL3Vzci9saWIvbGlidW53aW5kLnNvIGluIGNvcmUtaW1h
Z2UtcHRlc3QtbGlidW53aW5kIGlzIHN0cmlwcGVkIHRoYXQgIm5tIC1nIiBhbHdheXMgZmFpbC4N
Cg0KDQpMaXUgWWlkaW5nDQoNCj4gDQo+IA0KPiBMaXUgWWlkaW5nDQo+IA0KPiANCj4gDQo+ID4N
Cj4gPiBSb3NzDQo=

