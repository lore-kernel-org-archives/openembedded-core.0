Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BA2C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:25:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11324.1783686312044689999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 05:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=d0uM7WGg;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783686312; x=1815222312;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=AVtEWtImohBEcoqrG3jO9OPHj4GnSL8bP12TcmAp3gY=;
  b=d0uM7WGgkoAaoG75T+OxEvUMHQU+4kTIPJKmB3fOOykWC1ldNsNb+1qD
   lAenlTwFxZH6yH/YcjP/TmzHZEht+vTamNyRx6LOMIh+G2x0PYk3cXAji
   w71C8va6q0MSoQWY0qCOxwBJhYCPWzFA9EDxq6WSuykD78EoBWlrwxA2a
   QYzHhUOFxztApmvimDgDEL+BTHZRUIYrlJBEY6aXhr42xgh0UcJBSK+YM
   0GumRLYwK2j5/f1I4/SnpQ2zsIMiF6m5UAS2B2/Zg5hh3VHFkgJLfXEfe
   6wJ7OmAzlI1dBufr+LlQc5fpg5Y3rGCNdi56oqMOmTuagN4IU3zGWlYRL
   Q==;
X-CSE-ConnectionGUID: uKlCBapGSISlt4xwQtB+AA==
X-CSE-MsgGUID: Wmnzlz6bT9mSz5Gbba0bDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101932015"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101932015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:25:11 -0700
X-CSE-ConnectionGUID: jS10UwbdQHKA6gRmN7MHBA==
X-CSE-MsgGUID: 4nO/4x2lRhKkFIGXdF2vgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250462700"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:25:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 05:25:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 10 Jul 2026 05:25:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 10 Jul 2026 05:25:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDGeR3mGae6EIXiFUWqApu3KnhjiXFJQT/TG6stUrNL435grfRSSLZpQ8CYWmPuGkcJPJSzrsw30j1mCwHtv352XGeMx/SDaDM25n3P2fYaXLgirqH/yIpfRaiR0Dbyz0Zame86nXzmk1pQF78h0SmclJNtqgTQBbnOjHKxsNk1MhNFxVgTjxAEt+VMFXtWJkMyz6YlvfxaD8o+0LmVfEEgpFzL8JMIcQDXzI+vA6Q/KLbK79qvLcBKu1vuE0VIZHlmjOZr5hEGYNOoGAsoibZXQvNv6C5DP0lJrxETVa0f8C4GVz+9mffXdR7tMpVTQNBAy2fn0vaXVcO+6tbux8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVtEWtImohBEcoqrG3jO9OPHj4GnSL8bP12TcmAp3gY=;
 b=AkJCLTJnugcLyI6JKk0i+91ZLeX9VcgvzwU6lD/UJ2QcWVDCj6QhFXu3eO6MI6uT0OoDkbALUrHOC1gdNkdvEBLEuVHL1fTLM5lpXYpuSFZe/2JBoxSpW57pySL4qadKLO85eCZAFyCUIGJA29WDLT0Dq57g7nqE7HczG/zkOtYe9B+LKJ33mQf9IsQ0TtdILS1oNhct7QQGyzBBLEr5aAGKQJ9Lbd41srdXv6VhCZ486im/1QvUJy+CJocPA4T1fmFUQSatIUU2nzo507W7EEwj1mXlfgsR9Zy2pRZCrvODQ3YdQVOUmduL1YwXsPcdngHE6vPchbkaznGQbLn0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 12:25:07 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 12:25:07 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.19.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.19.rc2)
Thread-Index: AQHdCk8LEdpvsxjp70GYgaUf4NGvVLZhiucQgAUuISA=
Date: Fri, 10 Jul 2026 12:25:06 +0000
Message-ID: <MW4PR11MB7029F6623817299603441B78F4FD2@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019f24094983-53d3f366-c7c4-4c6d-a05c-8c8377b42bac-000000@us-west-2.amazonses.com>
 <DJOAI4RT1KZV.3C0VW3WMNPM9I@smile.fr>
 <18BFEA8F77AF4795.1336494@lists.yoctoproject.org>
In-Reply-To: <18BFEA8F77AF4795.1336494@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|CO1PR11MB5169:EE_
x-ms-office365-filtering-correlation-id: e428e840-7fec-4267-0ab0-08dede7e471c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|23010399003|376014|6133799003|4143699003|18002099003|22082099003|38070700021|56012099006|11063799006;
x-microsoft-antispam-message-info: sgRLJTH+yZUXxaiIoN4q0sPfSLTKvqkf4vHSHKuoRm0NOKWfOIC2wFS1zA+eWI4K+zhtel0oFF7CGElworDhv8RkDk7NopLTRiaxxGjhvLGM09rO4VAUeAv3oqfTk1wfNg2f7p/VpVljHzYAZjHNsRWkuUqyrvZZpStOlLI7TqIJJfnnhJFsTHNd/FfqrRk4WcltnwQwpljNGroKJvEsBxufv8h5t35lh2I12QrEBSy720uP022i7Y4JHX9N4/mFlET3o/X8qjmTZYSreP86wx8X+QfZO+u8mqgQJox0xgNumDiI7BOzj/u5y5oR2Jj1jPt4WkIIscaXDwfMQTmfcq8DjO7Cd7wJluJym0NW3WTYCvfKpmvMP+fYnDDq2wzVPCXCmvPuCf8G6ncwosqeMMJXjrD4J1CDMl2s0F5uTeBl+n4JRrC8zdhkhYPBQEpdOmISn5PXWsVLizZnuc6ILdEPq+PvNbJF+jXPI5O4oYG8ec5lWigs94wH1U7L5/wNZ2vG8zZmpfpiFbzHUT8oZ9EaUMrpILFZ9PYbJsKw5x8wAAovYMi3I0a9x1owsIn0NICzokrGY3bCELLLclIHQX6/O7rJM+WJS5L3H5wD/mJxGAn8XTILEbt7Wptme2XwQgObnN77oPRfs/5cMeRP4tbGvdTQUG/7afCwwfMcHZU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(23010399003)(376014)(6133799003)(4143699003)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0d2bjlncGllUjhINm1hZUZMV0U1OGp1UzFneFJod3dvYmM0LzRobWhqWita?=
 =?utf-8?B?aHpKRVVzZ0Jod3U3bURVbU00Z2MzcTlaaVRSK1BhcXdhT3ZIeXlhWVk2Yzk2?=
 =?utf-8?B?NXo0ZGw3NENDMlp2dXcyQUFDQ2RxOVZlVVBVMEtvc1FSa3ZQOVFRWUVWOS90?=
 =?utf-8?B?OXdMQjJuNlhmai9oNFRjSURiVC84Y2dXcXlWSFhXaDZmVUhmekVmT0FwdGtU?=
 =?utf-8?B?WkMwMzdHNmlJU2RmSE9EY2JwTTB1b2Rpd2hFbXhMMFhPQTBPOFByelFQVDh5?=
 =?utf-8?B?Y0VNR0lqOWdXM1drT000ZloxaTcyUUoxd2UvMkdkbVVGdW54VE1vdW1uZHIr?=
 =?utf-8?B?K1c0a0ZPVVNqYUk2RXoxWnZ4TDJmR2dVRnFycCtOc3FReERkb0ZReFdHRWV4?=
 =?utf-8?B?djN2MWNpSUduTUtFM1V2am9meXJsd2RoTHdiKzJjbXNlaWJMQ0l2MmFFNU9r?=
 =?utf-8?B?RnFuU3FNc2pjYTVBckpXRWU1Z3dKQTh5dG02Z0J2ZlVXYUZKS0p0cXJ4cmlS?=
 =?utf-8?B?d1p4REkxbzdtVGZOdjVRTXNxUW1uS3dwZnJPWUk1ajUzTkM5cExJcUYvKzJP?=
 =?utf-8?B?QkJNRy80V1BmUVovaEFhd3VCWTlJTmxDTzNRYk5QRDdicFJqY2gxbHZBbitW?=
 =?utf-8?B?anRMWTVSZ3hsSnBRMGFEOVkwdHMvM3dvd3pCNm9aZisyWE9QMzduc3ZQQlZs?=
 =?utf-8?B?M2JwdVFnc3BiSjI5STlCMWp4eXpTeDBjTWNmZ2JnTk5jNnphTTRldHh3bjZ0?=
 =?utf-8?B?Vm15K1JkZlFRZkovMVc1L1pocFd4NkkvaXFCZHMrVjYvRWhEMzhIcjhPVWZB?=
 =?utf-8?B?TU9PbHppM2Y1bTI5eWhkQ0lmNkN3dWl5cjlOMnRTNkxkYkN6Vy80VDN5cDhk?=
 =?utf-8?B?VDZQUytWVldDaEdiTlMzSFhCMlAwWUdDc1gzMGR6dTkrOGZ5aVRkQldpMDQ3?=
 =?utf-8?B?YzJPbkVxSU1rK0JwR1ZNbzZ1L1NMb2lVbGdDT3RmUnhZcjZ2TFpHVUdUZmg3?=
 =?utf-8?B?SHFRQjZqb1NEa2ZPYU90ejRFMUtjdUN2R0JaNTRTU2htRFdpRG9TTFd5QVdY?=
 =?utf-8?B?OE1sbmVHTmpQdXpkVkxDRzQvUDVHKzlnQVZaZFFzRFZBUUU3YTZCcWFpM2RE?=
 =?utf-8?B?b0FaZnRpRHd1bGtaR3FJMFVwbUw1RXoxZ1RReVMyYkRJSGdyZW8vT1laSndI?=
 =?utf-8?B?dmlmUzErdUlDa3NHVlM3Y245Rmlmb29OMVMvaTkzMG9QS0lMZFJURE5nS0I2?=
 =?utf-8?B?RUp5TEU2SWJhTVNNZ2NiYnplSVBaVzdYU3YzZDlTek50RFJnWUNVenVVdGhL?=
 =?utf-8?B?cUVOeWNHeCtXcWR1RTNPYXJRVHN5OXhIb0Y3bEZUSng5bG1TUHR2WThCTUZ3?=
 =?utf-8?B?d01HdkdKa1NXQ1paVEQxSGQrZERZMytxWFB2b1VKV1cyNHZHNCtmdERsN0Nm?=
 =?utf-8?B?N212bFpBSzJYNWE0cW1hYWEzSWVYOHVydEJpL1dpU1BvNmpubldNeStqVjVC?=
 =?utf-8?B?WUtUVnA2MUNHbW9nRzJDdnpLOXNpNTRNalJSQVhOdzFHVFBoM2FKVVFvN3VL?=
 =?utf-8?B?UStFcmtDREZDTllIbW9oczViMkVQMVp0Tm84Q2JKQWZPVHhOS1pXdm9RNEMx?=
 =?utf-8?B?cWIyWXNQdlU2MmhQS3Z0VmFoUWlmUzhORHBxclExSVlDMXlPbENXMVFLYU1z?=
 =?utf-8?B?aEJkWkxlQkZ6Y3F6NzgzYjVtUytHSjJ5ZWJ5MGxwUGUvUS9xMHpYTUtSa202?=
 =?utf-8?B?eUxmQ3F5cXFhcjFyYmJQK1BpV1pvQW5Zc2pkQTNpQ2N0QXh5UnJiT1RObU5a?=
 =?utf-8?B?UGlSZWR5Q2lVblVtNXJpcjBSTHVHTVFkZjM2a2tyZ3hKRzJGbkVSRjEyL2NZ?=
 =?utf-8?B?aDhVUUtwcW4xc1RDY1Y0SExwQ25SRlBjWFEvVjFqdzV4SklFWXk0MFNDTmRH?=
 =?utf-8?B?azk4bStuV2hUSXNOUEw0UG9DaTBCbkJPNVFtbmdPUVljdjZVUFltWXdVa3N4?=
 =?utf-8?B?VDI5K29tdFNkWW9yQlUyaUVEZlF6Y1VTdXFpL25HWWo2WmRVbE5Cb1NzcGxi?=
 =?utf-8?B?RFcwcnRxNXJSWU9rcCtleVJNTFV3MzRuSlJxUm1yZVNKMC81cTBWbkFHa21v?=
 =?utf-8?B?d0UvbUp0NTNFeFFmYkEvR0NTUjJYNHRQd2F2UUR4bUtXN0E3ZGROVzhmRGFh?=
 =?utf-8?B?NVArdHp0RncweU5ueEpjOElwZEgybFdXc1QyaXl4V2dMdnNDUEkrb0E3UmQx?=
 =?utf-8?B?THpHbEVxdmszOGdtNlpmL3ZGOW1pbit4WEpWNkFVdjJqa3VsTmY4QlJ1ZHN6?=
 =?utf-8?Q?b7gM5KkE2ea6L25tw+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NVeJeQEgQnx2rkZyiHJWdJJ5915aUn9Dz4ZgZKNNi+dytR6Fnh6etJGTAnv2cUTUaUVUP6j+PmBM/el5UGxfmlPiEs5ozrc9P4b3P1YdAaUciC9e5geTjDxBrG29B79gUCx2MyWEf/O7un1yE943Jy/XoCRAXrv3D0nDD5woOkYMgC9r5AF8va5KydfgF57SC52/SoPHmMngJO2SDNap54+11+eQpnpViAkNMgc5x0sSiU2rG9BhcqKtr3sgOPlWoMBNqSEynqP8st7DboMEvMXYUaBsOajNYFTCsLYgNQrAD8vIk/FSfjG8LPVx2zFirVBJgP1KNFbP0v9MM+XcPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e428e840-7fec-4267-0ab0-08dede7e471c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 12:25:07.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TcktYKuLzjiZo5ATM4rX65mvluMLVdKQ0mxoXmUGaugxAnjQecVJwal+SNvidR3+NEVF+wL9TTuIgDVoy7VJuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 12:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240634

SGkgQWxsLA0KDQpRQSBmb3IgeW9jdG8tNS4wLjE5LnJjMiBpcyBjb21wbGV0ZWQuIFRoaXMgaXMg
dGhlIGZ1bGwgcmVwb3J0IGZvciB0aGlzIHJlbGVhc2U6IA0KaHR0cHM6Ly9naXQueW9jdG9wcm9q
ZWN0Lm9yZy95b2N0by10ZXN0cmVzdWx0cy1jb250cmliL3RyZWUvP2g9aW50ZWwteW9jdG8tdGVz
dHJlc3VsdHMNCg0KPT09PT09PSBTdW1tYXJ5ID09PT09PT09DQpObyBoaWdoIG1pbGVzdG9uZSBk
ZWZlY3RzLg0KDQpObyBuZXcgaXNzdWUgZm91bmQuDQoNClRoYW5rcywNCkRlYmFsIEdob3NoDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1idWlsZC1ub3RpZmljYXRpb25A
bGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3Rv
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBHaG9zaCwgRGViYWwgdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcNClNlbnQ6IDA3IEp1bHkgMjAyNiAxMDo1NA0KVG86IHFhLWJ1aWxkLW5vdGlmaWNh
dGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyBZb2N0by1tYWlsaW5nLWxpc3QgPHlvY3RvQGxp
c3RzLnlvY3RvcHJvamVjdC5vcmc+OyBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IFBva3lidWlsZCBVc2VyIDxwb2t5YnVpbGRAeW9j
dG9wcm9qZWN0Lm9yZz4NClN1YmplY3Q6IFJlOiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBu
b3RpZmljYXRpb24gZm9yIGNvbXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZCAoeW9jdG8tNS4wLjE5
LnJjMikNCg0KSGkgYWxsLA0KDQpJbnRlbCBZUCBRQSBpcyBwbGFubmluZyBmb3IgUUEgZXhlY3V0
aW9uIGZvciBZUCBidWlsZCB5b2N0by01LjAuMTkucmMyLiBXZSBhcmUgcGxhbm5pbmcgdG8gZXhl
Y3V0ZSB0aGUgZm9sbG93aW5nIHRlc3RzIGZvciB0aGlzIGN5Y2xlOg0KDQpPRVFBLW1hbnVhbCB0
ZXN0cyBmb3IgZm9sbG93aW5nIG1vZHVsZToNCg0KT0UtQ29yZQ0KQlNQLWh3DQoNClJ1bnRpbWUg
YXV0byB0ZXN0IGZvciBmb2xsb3dpbmcgcGxhdGZvcm1zOg0KDQoxLiBBbXN0b24gTGFrZQ0KMi4g
QmFydGxldHQgTGFrZQ0KMy4gVGlnZXIgTGFrZQ0KNC4gQWxkZXIgTGFrZS1TDQo1LiBSYXB0b3Ig
TGFrZS1QDQoNCg0KRVRBIGZvciBjb21wbGV0aW9uOiA5LzA3LzIwMjYuDQoNCkJlc3QgcmVnYXJk
cywNCkRlYmFsIEdob3NoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBxYS1i
dWlsZC1ub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZyA8cWEtYnVpbGQtbm90aWZp
Y2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBZb2FubiBDb25nYWwg
dmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNClNlbnQ6IDAyIEp1bHkgMjAyNiAyMzo0Nw0KVG86
IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnOyB5b2N0b0BsaXN0
cy55b2N0b3Byb2plY3Qub3JnDQpTdWJqZWN0OiBSZTogW3FhLWJ1aWxkLW5vdGlmaWNhdGlvbl0g
UUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlvY3RvLTUu
MC4xOS5yYzIpDQoNCk9uIFRodSBKdWwgMiwgMjAyNiBhdCA4OjEzIFBNIENFU1QsIFBva3lidWls
ZCBVc2VyIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIHdyb3RlOg0KPg0KPiAgICAgQSBidWls
ZCBmbGFnZ2VkIGZvciBRQSAoeW9jdG8tNS4wLjE5LnJjMikgd2FzIGNvbXBsZXRlZCBvbiB0aGUg
YXV0b2J1aWxkZXIgYW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4NCj4NCj4gICAgICAgICBodHRwczov
L3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9yZWxlYXNlcy95b2N0by01LjAuMTkucmMyDQo+DQo+DQo+
ICAgICBCdWlsZCBVUkw6IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxr
eXJpZS8jL2J1aWxkZXJzLzI5L2J1aWxkcy80MTMxDQo+DQo+ICAgICBCdWlsZCBoYXNoIGluZm9y
bWF0aW9uOiANCj4NCj4gICAgIGJpdGJha2U6IDA4ODA5NjNmZWE0ZDkxYTAzNGU0YTZlMDA3ZDIz
Zjk4NjU4YWI5ODYNCj4gbWV0YS1hZ2w6IDc3MzhlNTE3MDY2NDJkMDYyZTk0NWRkZWFiNTBkMTBk
MmM0YTU3YjQNCj4gbWV0YS1hcm06IDIzYjU3MmM0MGVhNjcwOWFiM2Y4YmQ3YWJiYjVhNzk1ZmMz
NjMxYzINCj4gbWV0YS1hd3M6IDZjYWQyYjE3OTVjYzc2Y2M4ZTk5NGQ0NzI5MjYyNTY0ODU5NDNm
YzYNCj4gbWV0YS1jbGFuZzogN2NmNTRmNzBjZWJlODk3ZDg0NGY2NDkwMjQzMjJiYjA5NmQ3Y2I1
MA0KPiBtZXRhLWludGVsOiA1ZDE1M2UzNWI0ZTc1MjUwNWVmZWFlMzY4ZjE4OGZhYzVlMzFjZjMz
DQo+IG1ldGEtbWluZ3c6IGJkOWZlZjcxZWMwMDViZTNjM2E2ZDdmOGI5OWQ4MTE2ZGFmNzBjNGYN
Cj4gbWV0YS1vcGVuZW1iZWRkZWQ6IGIwYzJjNjQ4YTFhZjg5ZTdhOGRkNGMyZWM4NDFmM2JjMGVk
MGNjYjkNCj4gbWV0YS1xY29tOiBlYzgwYTM2YmNlMTFkODE4MmI0YmIyYTZmYTAzNTlhZGZlY2Nk
ZTBhDQo+IG1ldGEtdmlydHVhbGl6YXRpb246IDlkMDAwN2EzNjlkZWI0YTYzNDZmNWFiN2E5ZTZk
NDMyYThlZDE0ZmUNCj4gbWV0YS15b2N0bzogMmY3NDlhZTQ3N2MzYjk0ZGNlNzEwMzhmMDI1MTgw
ZDdmNjEyZGFiMA0KPiBvZWNvcmU6IDI4MTRmMDk2MmY1NmM4ZDFhZmE0ZGU3NmQyODk1YmE5YjVj
Yjc2N2QNCj4gcG9reTogYmI5ODM1NDY4NTc4MTI5NmUzYjM3MzdlNzc2MjQxMjEwMGYzNTljMg0K
PiB5b2N0by1kb2NzOiAxYjgxOWQzMjQ3ODBhNjk5ZDkzMDdhMmQ0ZTY4YzY5YjU3NmFiNzQ4DQoN
ClRoaXMgd2FzIGFuICJhbGwgZ3JlZW4iIGJ1aWxkLCBzbyBPSyB0byBwcm9jZWVkIHdpdGggUUEu
DQoNCllvYW5uDQo+DQo+DQo+ICAgICANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBm
cm9tIHRoZSBZb2N0byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcveW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnDQo+DQo+DQo+ICAgICAgDQo+DQo+DQo+IA0KDQoNCi0tIA0KWW9h
bm4gQ29uZ2FsDQpTbWlsZSBFQ1MNCg0KDQoNCg0KDQoNCg0KDQotPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAu
DQpWaWV3L1JlcGx5IE9ubGluZSAoIzcyNyk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zy9nL3FhLWJ1aWxkLW5vdGlmaWNhdGlvbi9tZXNzYWdlLzcyNw0KTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvbXQvMTIwMDg3NjU5Lzk5NzYxMjcNCkdyb3Vw
IE93bmVyOiBxYS1idWlsZC1ub3RpZmljYXRpb24rb3duZXJAbGlzdHMueW9jdG9wcm9qZWN0Lm9y
Zw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3FhLWJ1aWxk
LW5vdGlmaWNhdGlvbi9sZWF2ZS8xNDQyNjk5OS85OTc2MTI3LzQ0MDMzNDU1L3h5enp5IFtkZWJh
bC5naG9zaEBpbnRlbC5jb21dDQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQoNCg==

