Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6CFC3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 01:39:03 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.1787.1743125940134132949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 18:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=lorhjZoY;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743125941; x=1774661941;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0rR2aJFtiowTSyd9CuEB3N7hoCoZEhDE3v3R9MBQ+s0=;
  b=lorhjZoY7f+lBs2V8Ug/ii40CGFyIAGKEiO8wwk1UeYnVrHAhN5Rk+xt
   Sb6PHA4b+AhJyNtGJ/7Aof9AkiJzKu3+sPnIZBnOZfIgwBSwBgLctYGsT
   JUNATMdzIroqaHTtjfiRSBsYHVp9zwyKGZnQJslTOiuai+yhbUV0jfZDn
   E3o0072yhu6XKQn5BA0YG6NMUYWjX90OQQPkag2RuRLkblD+CIioQStCs
   UsQjOP4WX6DsnYVE2QYFNYgr9WUdOohT9dFK28TYZDh6WhpwpBg6KMnLd
   PvCqforN4g61wxhR/Ryb7t6s7cimyhRp4pQ+HEIhTKVusqNV/BuWfVBEh
   Q==;
X-CSE-ConnectionGUID: IM8bmfNBS+uabESsUCo9ig==
X-CSE-MsgGUID: S+10QodGTS6CDsB7lWQMWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="150972924"
X-IronPort-AV: E=Sophos;i="6.14,281,1736780400"; 
   d="scan'208";a="150972924"
Received: from mail-japaneastazlp17011024.outbound.protection.outlook.com (HELO TYVP286CU001.outbound.protection.outlook.com) ([40.93.73.24])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 10:38:58 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwPBcIumTR/aqgq2hz1D7IKE5LYf9VYHq4fCpIOfmeXd6uWwH6CPBEBuFj9fSvIURGEj/LGxHv/ws3iK1jgAhK9k27qYnyUrQhOS0EW69tYNKPUjZtG0xgmLvk5n/xmgU/Wt1hLJxIoKOlOy/0PqiGN5Qb0t1XSqmMnNFlgtu1Q27C2jrjJvnlvrCTllxiuVPhM1IJImp1FDnn6RijRAjXhkH8sAa8DDhbYBY4Ep2+yc67ysmb8dRm6tT0qJussWiJNHQch5bgwnYVw46foOEQMIi+MrI1q9D6quY+PtzVALNCfMlJ60/k6duK9f29L8B37SGum3iSCJvUythxJ8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rR2aJFtiowTSyd9CuEB3N7hoCoZEhDE3v3R9MBQ+s0=;
 b=OgYqMILdzmHeTMeIgAFMPrR63fetcH2z+fF9HyBuLq54aAKps8z1CjUFasDoPX3MVqqKsVoaG4ihP1D5SRJAHnwzKGKGSe5XVOxWn8sSZ0LllB3KXKpepFGoZD0AQlbBqIDEvR4Lo0PD34yQPpRMs3VTBqSTPipBQHSYy9B691prQsdrFPyFJaEi2MrE92EN9KDBn3Z4SaeEzglHKRIf/Ux6AfhUKHGSuawmadFDKXosiGo5YwG5sR7sjn6IEGeRUmIUO7zaRHqUjVzHTm7PX4KqKUdMVwTNXnV3UmyD1HXKvar5qxTcPfc6WrrY6tMJc6ec/51SYB42msbO9HThhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS9PR01MB12510.jpnprd01.prod.outlook.com
 (2603:1096:604:2fc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 01:38:51 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 01:38:51 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Thread-Topic: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Thread-Index: AQHbmUSDQCtsiwQYuEyuTDfMbxuJ1rN7qmOAgAwnLdA=
Date: Fri, 28 Mar 2025 01:38:50 +0000
Message-ID: 
 <TYWPR01MB118618605B50AB18CCC8B118FDCA02@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
 <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
In-Reply-To: <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9OGViODMzMmQtMGEzMC00MzMyLTk1OWQtOWFiZTcwMmU3?=
 =?utf-8?B?ZjM5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDMtMjhUMDE6Mzg6MDRaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS9PR01MB12510:EE_
x-ms-office365-filtering-correlation-id: 1319b308-52f7-41b9-4ed2-08dd6d994ad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ME9tMU1GL1lSL0x2Q29nSjV0YmY5bFFHOGVENksvWmxwb1p1ZmtCRHcxenRh?=
 =?utf-8?B?d3J6cUdBMDZhQXVqbTBnQ1d6bnJnbnB5b2txVnZJNEVtWEI0cnVMZzF4MkVD?=
 =?utf-8?B?UzNjYWk3cFpHU04vZGJSNEgxN0xrVkZRWGhsTDZUWWZuVWtpVDFqQVFDb3cv?=
 =?utf-8?B?akludUdaWC9uMFpiNy9yMlVKNXpaSGxJZDlIRGIwbUxsWHFWN3JKYUkwUFV6?=
 =?utf-8?B?Y1NJbXRsbVM1S2kxQWE3ZHBhTFVjUHVSdWIyckgvYi9UYzZIeWhiVXBNd1FG?=
 =?utf-8?B?MDZVUklFZUoxcTN1OU1CL0RGbG1pZzdBQ1Z4cmV6MjMrcjVoK1B2SzdyYUlm?=
 =?utf-8?B?OGtMTkpTR3YvaWE0d0dXNDNvTlBraC9tM0xtSzZrVGxsTkdxcVlQZXJsQmww?=
 =?utf-8?B?dDhTbG1DSmMxRlkrL0VZeDlQWkd6allRQnBiOG9RYmliR2xpeGZpZXJ5THdq?=
 =?utf-8?B?WFF6aWlGNkVINUtaT0NyZ3dFWStKZUx5K25NWDJaOGxFTjdSeVlMMzIrZnR3?=
 =?utf-8?B?RTJ6WmFYcVhjNXRtZ09pcDBGZVlhb0p3bndNMWNxQi9XNFZWYVNXZVBBK2VQ?=
 =?utf-8?B?dGhiNTE2OHVvYVF3QjdPWXpVQURZWWNaMUppNnZsT0xsdHBBWGNqYWFwRUdj?=
 =?utf-8?B?cUJSbTVQTm5vKzJMbVNnZUVpMUlsOEpvWWVGeExmOWVXZUd5UlhhbVMxcG9k?=
 =?utf-8?B?MEQ0UllQMkJBWkdXa2tuQmlwbjFrNElLZkpzNERPRzl0V2RkN291WVFCVlpt?=
 =?utf-8?B?U1FzMHdSYkVKcUlaaVlrdlZraTFYbC9FTjh2ZWVhN24xcXpCdkRLdWs1SzIw?=
 =?utf-8?B?R2NzVWxsdFVVWGtlNHMxS2VsajN3SzdZUHltNGRPa3VxMkV6TzMraXNNUFdQ?=
 =?utf-8?B?TXRtV0tkYmszaC9xeHpOR1lQOGNSaFFYYWQzQjM0VFQ3V0sxVFVBYnJISmU3?=
 =?utf-8?B?Y2lyYkJyMzAya1NrLzhDSGMzT2svRTRRWDRiUGY2aGowams2YUM3bHVKWk5Q?=
 =?utf-8?B?TWJEZEI4UjdvL2ZHSEtPTnZBNDVtWVZmU0p2NFlLMThuYVBMM2szbHJXU0hW?=
 =?utf-8?B?MVo0MHl1aW1kRUZzdjY2ZWEyaUw0bkFRNUpWNXlwY3VxRFhueEFHNVdneGM3?=
 =?utf-8?B?a04yalppYjU4b0t6dWlSSEwvWHR3QjM3YnFBSkEzbmZjZUFCRDZOdHdHMkJT?=
 =?utf-8?B?akJiTmZBYXdlOXA4dS9tb2pwdC9CTUpYc0JnWmhyOFk2REZnVzhrY09GTFlD?=
 =?utf-8?B?SnBFYWt5ZWRVSE5pdEwwQmFrSWpZaUN2dElVR0t5bXZsNklXNHZ5Vk12S2Fv?=
 =?utf-8?B?T2tnYzdqejRKRVlDQlJQb3crWk1zQjlOUnN4TlR2dk5ncU5TZExtRkhOT1ds?=
 =?utf-8?B?WUo0TUZDeWdyUEpJbzVsVllCWmJmQmMxOVY1bDBIVFNYbGlVOFVsLzMxZG96?=
 =?utf-8?B?UkVXd01GUjNXOThYc1NwZmVRL1cwcXliRmgwMWE2WFZEY0FITWc1YzdjblBh?=
 =?utf-8?B?bitpVEt4bW5qR3M4aXhsWGpVTTJkTWVOeWpSRXpRV0lwajJuWUFmdGM3WXJ2?=
 =?utf-8?B?UXJFUnI3ckZXQmVLcjFUQ1l3WWxNYlovR1ZMRzBLa245MSsyczRIOHo3Y2Ny?=
 =?utf-8?B?bU5tcStzdlF0K2c2K2NldWpvVnhKRTlpL2o2M3UzUHhkWEI4RkdwY0cva29S?=
 =?utf-8?B?ZWFWZG0vV0tFb2JwNGM5ZGE3NlRLZmx4ekdoRHFEbDhFSVk2ZlZOWXRSVmNQ?=
 =?utf-8?B?cXJpcE5CVldieDF4SE9SV1JXY2NWYWhkdU4rQWRCU1pyU1NQSEw3M2l2UWxu?=
 =?utf-8?B?UHdwQmhVeDAydERncWJIMHJRVWVxSG90djF0Tm5zeFE3TDFpNzV5MW5pbW45?=
 =?utf-8?B?TDlKWHRXcTI1K0UvUjk4Z0xIYitIUS9xVGNLOWRpY0VzN0E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dVk2YkNoN2ppbDVMVTVDWjZkd3Y0TFB6dG9kSmd5djVCdHYzNC9MQ1BsSEY4?=
 =?utf-8?B?bHE5K1RwZENvTDRQcVNTcmM4YjlnTTJzcTNoWldGMEorR3Q1VG9NdEJjZ0V3?=
 =?utf-8?B?NlM5K0lpNkxoZXJ6QVRQVXVrRDg4eEM2UXREM3hRRHhRUTJPaU1PZHVIK3Vn?=
 =?utf-8?B?dG9RT3JhYVVxNXhRSG0wVFhNY1BuR1RrbmxTTnJZS2hrQ2xoVDNiQWE5L1J5?=
 =?utf-8?B?RTMrNTlWdDZzRll6ekVJQWpGT2JaSmh6TWVLM09qdjhsaUFJS3R5YzJWZ1Ni?=
 =?utf-8?B?Ly9aY2tsV1RuM3JXdmRwV2lhTTlGckR6Z1FNUVpWLzd4R2J1NE16NjVuTEJw?=
 =?utf-8?B?d29xa2M1dGM2ZDZmWXpRcE41UXpsd0JHSkMwMXFaV2tMVVdmYXFDNnJ5azd5?=
 =?utf-8?B?emZZQk5HK1lzWU5IbjF5QWVEWDR5Y1ltMDhPY0YyNHpsVGxMaisyckd1OG5m?=
 =?utf-8?B?d1FtOWZLRUJFeUQvdEVrUUtGSUtxQUp3cFFybnVaVXZwak5wTXZZVThKZWZM?=
 =?utf-8?B?MlBXLzJQSWNFWHl6V253RTFuZ2ltajBQNXR4bWxibHJoa1c2V2xFSnNCdys1?=
 =?utf-8?B?VEZxOVF1ZzZNa2pPRUxkeHhoTjhGUE9UM2hYcGZLSVZIOGZqZ3NlUmxNMUJ4?=
 =?utf-8?B?UTFrQzBGc2NSVVd2M1E0UXlVazVTblVkbFhnNEdwUzdPcGtjc3NNTEdURFFP?=
 =?utf-8?B?dk9WeW9seVI1QytHdzlaRDFmK1QxYXkyTHVwOXdCQ2pDVUFWUlp5NVYxcnBV?=
 =?utf-8?B?NmxZNExIUTkwUWdzdERTV0E3a1ZPTEw4RUU1VTlwTE1XQWRBaEFzakRrazB4?=
 =?utf-8?B?MFJQQUN3UkFJc1VGRkg1bno5Ynd0NDJYSTE5UUZKTDNwdjhuaExCRVA1Q090?=
 =?utf-8?B?aXhvS3VST1BqY2JCRU51RVBuV2g2a3hRSS90NENMNTg4YmQzdEdnaXNxV0Zs?=
 =?utf-8?B?bTFsWUxKYmFibTd3QTROSXZCdjJQTWZBSTM3c0VBWDdhNTh5K09lRzA1L0FM?=
 =?utf-8?B?cDFidkpuYk1hRExLNWo5ZEZpbWhvTE5OT3ZUbzlnVndGU3BpcUhZOGFKa3Z4?=
 =?utf-8?B?MkJzU1BrTHR3SGdoVUJXbjQ1eTNzVVNCRWVnZXFoZGM1Q1IrVUJ0UkV0Wjdz?=
 =?utf-8?B?WDM1Wm9ZOWFGbVAyUkJwUXF6eWROL2tpUHVRWE4rRnR6SmRGZDRWc1NEOHZC?=
 =?utf-8?B?YjFuOVNZK3VuUzJFRStWU01QQkxYeGFOdWxZZXA2VUNnL1dacmVIWmh0VlNU?=
 =?utf-8?B?SStPQ01wai9KanBMTlI5elMvcVVGWEYwdm9Dc2dIejJoOWNUWWVIUjVNZUNJ?=
 =?utf-8?B?SnhsU3JQYlZEekQ1RzlmTk9HdTQ5d0swcWxLd0F5UUpOVy9nNW9jK1dOUEdp?=
 =?utf-8?B?VWtUNVJuMXA4VWxhUnhoNURrUzQ1a2pHazR5bU40VTFqbC8zcFM5cFlqWWJm?=
 =?utf-8?B?MDhwS1oxNzlPQ2dJaWIvTHVFcWsvVjludE9LcWk2cmNkTlI1Q1Q0dzk4ZTZt?=
 =?utf-8?B?bGZ1NjBMcjczN1RWWDlPUnk0b1Z0OVZFeC80Nm5URXFyN0lScFJnOUE2eXVU?=
 =?utf-8?B?b2FaMlkrSzN6Q3NHUmFlZlZVUGkrSzJkTG8zaDh5UndTMHFBVnNiTDhkdXJr?=
 =?utf-8?B?SER2a3dWeUFTZ0JFdlFxZXpqSS92dDBiRDlFQjhTVFVTUm1Sa3BQMTFhOTlW?=
 =?utf-8?B?T3IyajV5NGMvVDBuQkhGWEczNTJpVUh4L0hJeEFPYnhDUjhhS0Zjbkd5YlRJ?=
 =?utf-8?B?cks0NTZYSUNUb3VRajNoYnhZNGQxT3pMV3B2cThuNTFuWVdzQ21tNy9leHRS?=
 =?utf-8?B?M1NJRU5DTEdoeXVWSmJIdk03RDJYcTRQVDk3OGNoc0Z3VFM4cDYwanBrdEZx?=
 =?utf-8?B?L1hoQXpVL1NZTE5haUxUTmdyT3dPL0JHMHBSaDVJdmZ4ZVBXcExyMitUN1Fj?=
 =?utf-8?B?N3MyS2dmcUVURDdUeU00bVQ1ME5tR2svK25EOS8xdXZ1NSs0NWJab283SkFo?=
 =?utf-8?B?di96Qyt0SEwvWHN2bkE1bktUbTRVaVlRcmFYSWlwcjVqTVlLTnZpQVZqYXlE?=
 =?utf-8?B?Q21Sck1SM2FieVRwcG1DQ3l5cExobnZJNkJLZkFxWnlKL015QnJKclBOUXB3?=
 =?utf-8?Q?VzzE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	chqrlLWD26Alkx0Qqpb6tMBoC2N+wHaeYMRvGeVQ3pUlSlVBbOvoQgIgochAJVXkm63XLE9R5icV6Jrqw68Uujz5MB6YooNE+VjleWTp2PL1cr+x3b9W/iH7sJq557kyGGnKTocHNQT98opZDi/5EVvIr2o7OhsvqsTDZvkQiOb2Nks1zJSgItc5fQVYSfqYrdt0/L4HcBauHO3gUQ1JCQtYLGgmU+wj1+pj3ZOB5TNLvmxIRkttfcUYBoJ+QtxqwGsM+B/kUmKpszXekKGcnO6xQjljfXbAV0IZchcilzSw6MRqvPqsMyBwTnkU3i08re8oj+bnTJENpTYYWTK+GKWlkTZLMrLzb531Wj2IuLTB6LtxxSGTtgx4jLofSEQyy6mK0Yue1LmYeXGLnH5GbvqgfvCnJyDy59t31OQNHcSFcssBce2BWqTMQxcYwYnN6wG+K6qvRSJuOmA9rQRkbwDQwpukSKmFTQeGWClWyP1fMjkaJ4xMojnhZAjShqWYOHez4wXIL4YydjABkYyLtUyv+NyIXfelgJXG+tjcavjXm67UB6ezKKMbWaYaAGhgnP6QWfbzPmjmF4xB6CP5Q90tFa9eSeplO8siZZoIcXDhP17KuS3gMLnTN43Mcsyl
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1319b308-52f7-41b9-4ed2-08dd6d994ad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 01:38:50.9111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3rtfA7leNSFFoKdHNxJ1jDN59W1D7a44gaUeZkSIkuwqmZvyVxvkQmjylYzaDXBGLxaABPY/DzmGkMB7hBfFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 01:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213805

QWZ0ZXIgc3luY2hyb25vdXNseSB1cGdyYWRpbmcgbGliZG5mLCB0aGUgaXNzdWUgd2l0aCBkbmYg
d2FzIHJlc29sdmVkLiBJIGhhdmUgc3VibWl0dGVkIHRoZSB1cGdyYWRlIHBhdGNoIGZvciBsaWJk
bmYNCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09GVFdB
UkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5qaW5n
LCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4
ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBNYXRoaWV1DQo+IER1Ym9pcy1CcmlhbmQgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDIwLCAyMDI1IDQ6MDMg
UE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0K
PiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIIFYyXSBkbmY6IHVwZ3JhZGUgNC4yMi4wIC0+IDQuMjMuMA0KPiAN
Cj4gT24gVGh1IE1hciAyMCwgMjAyNSBhdCA0OjAyIEFNIENFVCwgd2FuZ215IHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQo+ID4NCj4gPiAwMDAxLURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3Rl
bWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaA0KPiA+IDAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFs
bHJvb3QtdG8tbG9nZGlyLnBhdGNoDQo+ID4gMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxM
X0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaA0KPiA+IHJlZnJlc2hlZCBmb3IgNC4yMy4wDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0K
PiA+IC0tLQ0KPiANCj4gSGksDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBJ
IGJlbGlldmUgdGhpcyBpcyByZXNwb25zaWJsZSBvZiBzb21lIGZhaWx1cmVzIHdlIHNlZSBvbiB0
aGUNCj4gYXV0b2J1aWxkZXI6DQo+IA0KPiBFUlJPUjogY29yZS1pbWFnZS1wdGVzdC11dGlsLWxp
bnV4LTEuMC1yMCBkb19yb290ZnM6IENvdWxkIG5vdCBpbnZva2UgZG5mLg0KPiBDb21tYW5kDQo+
ICcvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4Ni02NC1wdGVzdC9idWlsZC9idWls
ZC90bXAvd29yay9xZW11eDgNCj4gNl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtcHRlc3QtdXRp
bC1saW51eC8xLjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZA0KPiBuZiAtdiAtLXJw
bXZlcmJvc2l0eT1pbmZvIC15IC1jDQo+IC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xZW11
eDg2LTY0LXB0ZXN0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4ODYNCj4gXzY0LXBva3ktbGlu
dXgvY29yZS1pbWFnZS1wdGVzdC11dGlsLWxpbnV4LzEuMC9yb290ZnMvZXRjL2RuZi9kbmYuY29u
Zg0KPiAtLXNldG9wdD1yZXBvc2Rpcj0vc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4
Ni02NC1wdGVzdC9idWlsZC9idWlsZC90DQo+IG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4
L2NvcmUtaW1hZ2UtcHRlc3QtdXRpbC1saW51eC8xLjAvcm9vdGZzL2V0Yy95dQ0KPiBtLnJlcG9z
LmQNCj4gLS1pbnN0YWxscm9vdD0vc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4Ni02
NC1wdGVzdC9idWlsZC9idWlsZC90bXAvdw0KPiBvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2Nv
cmUtaW1hZ2UtcHRlc3QtdXRpbC1saW51eC8xLjAvcm9vdGZzDQo+IC0tc2V0b3B0PWxvZ2Rpcj0v
c3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvcWVtdXg4Ni02NC1wdGVzdC9idWlsZC9idWlsZC90
bXANCj4gL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtcHRlc3QtdXRpbC1s
aW51eC8xLjAvdGVtcA0KPiAtLXJlcG9mcm9tcGF0aD1vZS1yZXBvLC9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9xZW11eDg2LTY0LXB0ZXN0L2J1aWxkLw0KPiBidWlsZC90bXAvd29yay9xZW11
eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1wdGVzdC11dGlsLWxpbnV4LzEuMC9vZS1yb290
DQo+IGZzLXJlcG8gbWFrZWNhY2hlIC0tcmVmcmVzaCcgcmV0dXJuZWQgMToNCj4gLi4uDQo+ICAg
RmlsZQ0KPiAiL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FlbXV4ODYtNjQtcHRlc3QvYnVp
bGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4DQo+IDZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXB0
ZXN0LXV0aWwtbGludXgvMS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL3B5DQo+IHRo
b24zLjEzL3NpdGUtcGFja2FnZXMvZG5mL2NvbmYvc3Vic3RpdHV0aW9ucy5weSIsIGxpbmUgNTcs
IGluIF9fc2V0aXRlbV9fDQo+ICAgICByZWxlYXNldmVyX21ham9yLCByZWxlYXNldmVyX21pbm9y
ID0gQ29uZmlnUGFyc2VyLnNwbGl0UmVsZWFzZXZlcih2YWx1ZSkNCj4gDQo+IF5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl4NCj4gQXR0cmlidXRlRXJyb3I6IHR5cGUgb2JqZWN0ICdDb25maWdQ
YXJzZXInIGhhcyBubyBhdHRyaWJ1dGUgJ3NwbGl0UmVsZWFzZXZlcicNCj4gDQo+IGh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzczL2J1aWxk
cy8xMTU1DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzUwL2J1aWxkcy8xMjQyDQo+IA0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRo
aXMgaXNzdWUgcGxlYXNlPw0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290
bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9i
b290bGluLmNvbQ0KDQo=

