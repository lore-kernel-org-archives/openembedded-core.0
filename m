Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C60EC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 01:27:01 +0000 (UTC)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web11.3391.1743557217638234345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 18:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=dx4GrN9I;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.33, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1743557218; x=1775093218;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HgMGioQo3gGBdni02b51+mYwUKhNjzyB8V0L+jg+h2A=;
  b=dx4GrN9I1TjAvSby3uR4HpRIe7yujDOXK/U/7GpXuYQU4DE4Ldt2qYoc
   GuYoAfLYAjv6CO61sz8p29Q68N9U8wIzZf+bXW36i7oc22HuQecBDMfGH
   Af6GhxdI24FLmr5aGUBdHUv8gG1yDzu+UwcsnaaAo3wtYTTbmFRKuh5oE
   wpQ1XRRAXo6cS/VkhfQn+b57nQtMr9S3ZxB1A9HUfdBsbJgeCLJH53VJP
   VAdUlDdxKP9TRpJWszu/kTwpojWdb24wi0+XSjZ0Zxb4T/91JBMc9tmdK
   XObHfyZFh9XCk4uXZVuAvbTRAL6DSv9wghAhTR478+ha6IECNAoRrn1rF
   A==;
X-CSE-ConnectionGUID: ps14+a7ZShajP+XGVPoMPA==
X-CSE-MsgGUID: GsOW9FDoTjWCpAwKu9dnZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="151462641"
X-IronPort-AV: E=Sophos;i="6.14,294,1736780400"; 
   d="scan'208";a="151462641"
Received: from mail-japaneastazlp17010000.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 10:26:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsonncgBxpa6jKFkNbPxJOYWaepXk6/h5Tt2+/QxEbcirJ3wk/Rm+Qxka9UqTW/bgmRDEcoOPQ5ne2cssX3VBg5qFctEjPhDq4kniQ89M6pwlCeryBrExZU73waVCycVNiyzsAleJLm3cG2f+GUdwO3PmqtYZZQHyF+3YGdd2JHyamt3mdH5Yaac2YGjyWeCgvUzus7/4fTFfviXSlU390OaQFVvlVUovsRglXAx4B/SmE7qzByGBeQFp91+Zn6EmV9Uk3X3yRKVpfpQ2kEZ5tNEJa5xSTtNVcPV/zXLXoUl7axZHRMlYL03OL5Epx804Ys3P+VRcEALZ2jrwW0Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgMGioQo3gGBdni02b51+mYwUKhNjzyB8V0L+jg+h2A=;
 b=xLcnJvL0zQpSyPuN+nSEkVC9pP2cqP0dug/qxXCcsFSIDhZBUFpMB6r9arN+Y+JyGa3t70bgIJLmagTTVjvgUewRDxOtDunS9KoRNoYtQl1j1sWHmN0Iw/kFJtMQI3W0GUdLUaKEwkUsSObpkfPUBh5cGHhttoMzSQJxbuLOBBJuuh8O8EMBNVNhWXlLJgUP7vzcrFIeRJFh2aOnKziLvb4GqdEbouq5qtCSagWvq1KFhUkcQ1Ej6desQJP3psHG5/mi/o0oFGBgnPrO4Z72mewNcihOPPwiwvbpjnL556mnjF4NPqPjo2lrwkcYhTjxA6mY0qy4m/6xZhI8kj0a5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by OSZPR01MB6565.jpnprd01.prod.outlook.com
 (2603:1096:604:f9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 01:26:47 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%3]) with mapi id 15.20.8583.033; Wed, 2 Apr 2025
 01:26:47 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, Jose
 Quaresma <quaresma.jose@gmail.com>
CC: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Joao Marcos Costa
	<joaomarcos.costa@bootlin.com>
Subject: RE: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Topic: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
Thread-Index: AQHbogkGJxz1EXBtJEyQiTQWqmrGHLOM/biAgAGnlwCAAPHWwA==
Date: Wed, 2 Apr 2025 01:26:46 +0000
Message-ID: 
 <TY3PR01MB11056051FC9EDF182CC988670A0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
	 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
 <5699ede6189245680e202f9a9158e8f751a43b0c.camel@linuxfoundation.org>
In-Reply-To: 
 <5699ede6189245680e202f9a9158e8f751a43b0c.camel@linuxfoundation.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjgzM2VkMTAtOGVjYS00ODY2LTljNDEtNjBhNGVlYzFi?=
 =?utf-8?B?NTBiO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTAyVDAxOjIxOjU2WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|OSZPR01MB6565:EE_
x-ms-office365-filtering-correlation-id: 43c5ab93-13e6-4f6c-dc2b-08dd71856f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?akZNMTVIczNFeTFNUys3ZGRNRXM0SVRSRTZaTTdyMW5FQ3lTd2tYejNMZVhO?=
 =?utf-8?B?SkIyd0lwNEVMNUtYcm5KR0NyOGpybE9Uc2hZL2lPZ1dvU1F6VTFEVUVaTHMy?=
 =?utf-8?B?cUFCeXd1a2VYZVcrRGNKSEJXelNGU2RQYStSbTM2bzAxK3NjK2tPZzVNYXZm?=
 =?utf-8?B?S0JRZml0MUFNQWJkVHZpTVN5SEZLU1BQNmRoTk43a3d4MjVtdG9UbDA4ZlRR?=
 =?utf-8?B?SndwZFNhbzRYamM0TEN4VVYwVWFPeDh1S2xTRk1qamNOR2I5eGVGYWlVc1Fr?=
 =?utf-8?B?WVpFT1Y2aDJJcGJ5YUdoSkpCZS9ZSEMvczQ4Y09VdEFvL255UW1MYi9XSmVG?=
 =?utf-8?B?MU5BOGtaVStxdndVbG5aT3NXVFlBOHN4dVBrQ0o5UmtuS2lvYUJJK1hOYysr?=
 =?utf-8?B?TGYvQklYeEIrb3BEREFoY3ZCUGZ5MTE0bmZ0aTk3N3czUXRjOFlScWdYV3p3?=
 =?utf-8?B?K1AzdFoyc3hzNmF5T21ic1YrVzRCVnhHdStROWEwZDRLWFZnVGZmTmpHZWhX?=
 =?utf-8?B?SUk3dW5GZStET25qekU2b2FGSjBrbTd6enZ5OE1Wd2JwNzYwb3c4aXFWakl3?=
 =?utf-8?B?czVNWXlBSEFFZ2QzUTVGeTlQRHRkU1VPUFhCY0lRaWw3RFdxL0pxNHB1MFNU?=
 =?utf-8?B?MTlxN1BDd09nNkJtMGFpUTZlNHVicDU4Lzh4SFltdk45OHc2Zm8xeEZxWUph?=
 =?utf-8?B?QVJMakxJQWZOSDdUQlVnM1ducFBOTmlGekY3b3JFRUxzSWIzOU1CMEdzcnp0?=
 =?utf-8?B?S1BXTXJ1VGQ2U25PS1JUMjZDT0ZUZWVIZ1ZZK1Jyekc4YWxzQy9DMXl3dTV3?=
 =?utf-8?B?c1RBTUp2Y3AxM1VtY3dkb0RoTEhqaWNiVnBDZ3ExeUVQOEEybTNjcEwveFBG?=
 =?utf-8?B?RGpYckdJdUVLV1Q0dlFFcFc0RExiMDBSYUlPb1NKVFZwSnVFeTBEZVMxZW11?=
 =?utf-8?B?M1BKZTk4ODVHbkZpZ2kySDdEcnA0U2szTDUyc3ZtRk44ajlDSlRKK00vREZn?=
 =?utf-8?B?WDlhYjZ6d1NGSVdudG5NSS9HRG1udXlxaFh2Q0lqenhlL3JFK3liWlNsaFEv?=
 =?utf-8?B?QVJ1c3M2cW1iYkZwcy8xYlNpNHJIZkNKKzlYN1JoOGpudEJEb0ZjSUthN0Ey?=
 =?utf-8?B?YnFqOWtjRk9lZUltV0ViU1FDVjBWZUNxelBXZHI4VkhzT1V2NFlkM1lGanlK?=
 =?utf-8?B?VUtSNm9SbnE5Mi9PRDNGWnNxUTZFMk5paGxsY01FeE1JcGpuYXgrMFdzMnBP?=
 =?utf-8?B?U01ROVdndi9zcThKZHhSN3h5bW1meFVZL0JDNmRFUDJSbzlweTlmR2x1VENo?=
 =?utf-8?B?YjRHLzZvVlhhcVRaZGV6OFRlb1RsZm1KL3NtTkI0WkdWYWtVakEvNXNrQ0No?=
 =?utf-8?B?Njh1cnVaQ1cwQVpwOWtXSXhxbmNFZ1hoK1c5dUtkTGp6ZkxLNDNJUjhFdnlT?=
 =?utf-8?B?bE1xUG9FOG1UTE5wYTFoT1VpeGtjNXJHY3ZGVmNnYU1FS2NTLzRKTm5VRFA1?=
 =?utf-8?B?dnNDb3pZUzlsaWpZYzFUNWtXMGFucTNsYXVMWm91RkgyY3JBck1qL1RIWURk?=
 =?utf-8?B?YTFrUXRWY3k2eGo4bUdOVDdLVC9NTk9VV0VYVnZlZGYybjdwOXNXTERqOGI5?=
 =?utf-8?B?Z2hyVVc1SnBGcWpPZVA0ODhDWGZCcktWNGtvSUVMOEp2SWc4amYyM1JxOXVR?=
 =?utf-8?B?Z09ZZGhYejZidkJkS0JoSnJwc1NWUkZ6bHVzMlJLSVVuU3FIdzVQRGE3MGp6?=
 =?utf-8?B?VjlLODdnZHlXTmNPa1lBNXNBTDNoRVdOM3o0ZjU5UCt6dWY3RU85L3N6WjM2?=
 =?utf-8?B?TzBKMzZtc2pPWk1oUGJvL3RmQjg4L3R6VmJ3VEZxMHFZQ0NxN0Z5VExEcGVi?=
 =?utf-8?B?elhKYUdiaHBzbzVoQjdkV2RFVTR4VTRTN3c4c3d2OHZEZ3duWkRNVUkvOEl2?=
 =?utf-8?Q?eqA9foPiwK8l/XHcyPxT7WbOK0RjPEsU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDdBSTQzOGdoaVQyUTA5N3F2Ly9wbGV6a3RwdmIxRG1lRElKZloxQmxFQkxw?=
 =?utf-8?B?Zjg4UGpYSlZBcXBTTkNaR28wY2xKaU0wR2VXUlYyT3E5N1hzbFdBR1ovSnRt?=
 =?utf-8?B?MWd6Q1BCTmphTFQ5QXQxcGRkZ2FpRWVTcWdxSG5MQ01tSXp2anFSMzhLZFhH?=
 =?utf-8?B?MVJ4czh6aE1SdDFnK0NmeUttUzVKbTBYeGs5R3h2eE5PczhVSUNBSUU0akRk?=
 =?utf-8?B?a2FzQitkNG9ZQ080TXpwSWdPSW9QWWE2Tlpab2t5L1h6ZTNKSDVraFVxTHVn?=
 =?utf-8?B?d012R3hmTUdwWHNscCt6VkRrcXJ6ZW5UN0NBTEZISFFHV0FSa3d1NnBCTHA0?=
 =?utf-8?B?T2NycXVFQmdHWjJaTndBbisranU5blRDeFNSRFBXMDNjREF4NUdjbCtSaVlU?=
 =?utf-8?B?Wjh1cXgxM3AyQ05IcnNDdURTRnpnV2l1Wm1UVUg3Uy9XSzg4M1o2TDM3RVIz?=
 =?utf-8?B?ZnZ2YW1zSHVST2tPY2d2RXBKTDFBNWltMjZPZFhFUG5FL3ZXSnhKWEpFVHF5?=
 =?utf-8?B?NEswV0JCMEhCTUNlMzJYU05raEFoc3ZTOXEvOHByNkpNM3hrYSthUW9IVk81?=
 =?utf-8?B?cVNHc1Y3d0xZd2h4UDFxeXc4elBRTHRXSlJSZnNZeXg5U09ySW53ZDQxQm9O?=
 =?utf-8?B?dDM3VXpqWm50c1NRUUJWbU9nZ1BvQTZjWVl6ZzRmODNTQlZVZGplRnY4dm03?=
 =?utf-8?B?OFZ1TkFDQjgrWjdxWnR0VU8wcXl3VkNOT1pMMEs5THlwTTQwOE1zWUthRHhq?=
 =?utf-8?B?ZnlnVlpSSzZwQVppV0YyWlN3OWNDU0Yva2x1cUFkNThONVhrTjhNZEFCTmN0?=
 =?utf-8?B?T25GRGl3bWl6TjR4NUFXb2ZnMUZxNVp2RndzT2FYcnNpNUVhSkdrRmtiRWVq?=
 =?utf-8?B?YUs3c01xRXE1TjBEMXNnS3B1KzZQQW1QeFZaWnZPMy9zK1VlN0xkeHhoaUxX?=
 =?utf-8?B?ZzJ6V09QbG15NFpSbkxWckFRVHdVSkxYemdjajIxc1NLWEU5bDhCazRLNzdu?=
 =?utf-8?B?TjhBSjFkNmMxb00vTTlCaG5sbE94T2NEZzFsL0h4M0FRQXdwOElpWG4xSEZr?=
 =?utf-8?B?L2tvTXNzWUNXNWxxSGNMUTQ0NkdzQk9NQWF4N2svVno0MUFQMDNJdElVcGtu?=
 =?utf-8?B?U2xOcThkMTBuRktRVCtab2k1YzlYTjZRR0xJMGJqNVdNUFE0ckJyTnBqVlBT?=
 =?utf-8?B?L3hPdVZHbkk4N00vZDE0eSttVmxUck0rR1ROdmdyenVRbVFQV2lLNXpFMlBu?=
 =?utf-8?B?SzR3UDJTUHRQbDlVcno5bW5zYjUvK3ZUVzc3Vlk4UlNCNktxd3lTWWtuZWpi?=
 =?utf-8?B?eDRUZ3RKdi9kY3lHc2JSNndBT2tjc1dsVVFBTXVJbmR1K2lpREpmZ0JTZlZK?=
 =?utf-8?B?dC9SVmRlc0lVNEhiVXN1ZnJyUWQ5YWhGQlZ4cldsZVkvLzZRRzFPZTBuM3ZI?=
 =?utf-8?B?Z3c4d2hJQjhyRUlBcVJBTjNxVW45Z0ZWbUEvdTZoYWJzVUFQUDJGa1J4L3Vt?=
 =?utf-8?B?WmZLeU84RFNlZXNPUDVmbGhmZkZ6eGpOU2szbDFlL01xMEY0Qit2UEh4QTJB?=
 =?utf-8?B?RHRYRmJXb0YzeXZMZGhUWnZ1T0t3WnJrcFJJdGorZEFnUTdEZWdGRVZidmIr?=
 =?utf-8?B?VzEwNmdSYXRoS3BNQXBiTVJxSHA5YUpDakY2TlRhNFZPNkp5TG5uU3ZEQk5v?=
 =?utf-8?B?UHhVek9yOEVXbTFBSlArVUMxZmFFV1NyRzIyVDZVaGJ0TlpRZTlQQ3FoblBN?=
 =?utf-8?B?VllZcElSczZCQVExdnE1a0wvbzdTbnhOVjVnZURySit1aXdaZFlOZ3FBUlRq?=
 =?utf-8?B?UHNLemRQVlJiVlJxK0kvZHZaU1dLNDNYTjFvbTdJMTdmemVibGwwOXNWenMv?=
 =?utf-8?B?c2oyRUNsNmFtbHcrbVh2Y29WOUFUT2pmZ2gwbG5IZXE5Um1lT2xTR1R0WmRk?=
 =?utf-8?B?UXA2RGs3ZlFYUEl5Sk1yWXFDUDI0blVCUklQRUdxVHZDWnhKblFhLzRnaXlF?=
 =?utf-8?B?Q0REY3lQRjJFektrVUxVTXlpeFlHZUpkck9tQVhGWUdENTIvU0NkaWZiVjA2?=
 =?utf-8?B?R2tlR1o0b2tmMVVWQVJNR1Ywclh1bVQzM04yZzMyNzBacEJJcGduWThBb3pI?=
 =?utf-8?Q?vErt0jccpey8EU7cJjMbrkKkK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OUaRNOD2qxupRmzCb3NOnD1yjXPejhidr8YFd85mx2+kM0hjpoe1f1kH16QQM5H86Ux36zXm2Mk4xqn9oAC84uGZiTN/BC5grOUycAWogbNOugMXTA8oFKqKtYCB66wR8cSlFk+bvfOZxgzHbDRho5mwcRCVPYBsjDlCz4BnYZ5wxnx458/H5IC4Dd5XNO5mD7BJQceayHrq9gMfnAG2KYtygOrto+Kp6581c+NYZTQdf7IK4lxJ7kPosoCENtfMWpSfPuyuQxUHrpCW2eCtiiwv7RVBHv6gNOfliue9L9FS7Nb5Dta9qpZUluuTECal7+Ke1b4uPwWRZySc5yu1k82GM6SDi5OwipWsQxf1Zg9MRX1ub8CFR+ftpRB8qNlJUtgbXnIKDybjgNw5IuODS7YC8iv3Xd2hJ+VMTV2zRtAUHyIvHxAeSmD4l2LrNw3A5nZfM1kzbIIf5yPIMI0MayWL7yYPA/FxxgWuLkrn7/74zhZ6WN2DwdaJIQSY21A1L4B23TnEIjPEwgfiOeMvfnyHL+MHsJRLDtGYKRWGL6LIBOcHQXptPOyzQ6gVbdci0pinGDBQrwjpcRyDJBuEZVb30cK88AT5c12NWV90DW32Uc38T8vZ/8sAYvVzTxe5
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c5ab93-13e6-4f6c-dc2b-08dd71856f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 01:26:46.8857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVhtd0+a/qYj5jwjR0ySyraZbuv9h8kVdrSKuMNqmI9TyVmnWN7d4dbq+B87mHGWmwlACz84smQ8RgYEVqSRlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214163

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFw
cmlsIDEsIDIwMjUgNjo1NiBQTQ0KPiBUbzogbWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4u
Y29tOyBMZWksIE1hb2h1aS/pm7cg6IyC5oWnDQo+IDxsZWltYW9odWlAZnVqaXRzdS5jb20+OyBK
b3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4NCj4gQ2M6IEFudWogTWl0dGFs
IDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnOyBKb2FvIE1hcmNvcyBDb3N0YQ0KPiA8am9hb21hcmNvcy5jb3N0YUBib290
bGluLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUGF0Y2ggdjMgMDEvMTBdIGdzdC1k
ZXZ0b29sczogdXBncmFkZSAxLjI0LjEyIC0+IDEuMjYuMA0KPiANCj4gT24gTW9uLCAyMDI1LTAz
LTMxIGF0IDExOjQwICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gT24gTW9uIE1hciAzMSwgMjAyNSBhdCA4OjQ4IEFN
IENFU1QsIGxlaW1hb2h1aSB2aWENCj4gPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0K
PiA+ID4gRGlzYWJsZSBuZXcgbWVzb24gb3B0aW9uIGRvdHNfdmlld2VyDQo+ID4gPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4g
LS0tDQo+ID4NCj4gPiBIaSBMZWksDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+
ID4NCj4gPiBJdCBsb29rcyBsaWtlIHdlIGdldCBzb21lIG5ldyBwdGVzdCBpc3N1ZXMgb24gZ3N0
cmVhbWVyIHdoZW4gYnVpbGRpbmcNCj4gPiBvbiB0aGUgYXV0b2J1aWxkZXI6DQo+ID4NCj4gPiBG
YWlsZWQgcHRlc3RzOg0KPiA+IHsnZ3N0cmVhbWVyMS4wJzogWydnc3RyZWFtZXIvZWxlbWVudHNf
cXVldWUudGVzdCddfQ0KPiA+DQo+ID4gTW9yZSBkZXRhaWxzIGFib3V0IHRoZSBwdGVzdHMgZmFp
bHVyZXMgY2FuIGJlIHNlZW4gaGVyZToNCj4gPg0KPiA+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8u
aW8vcHViL25vbi1yZWxlYXNlLzIwMjUwMzMxLTUyL3Rlc3RyZXN1bHRzL3FlbXUNCj4gPiB4ODYt
NjQtcHRlc3QvY29yZS1pbWFnZS1wdGVzdC1nc3RyZWFtZXIxLjAvDQo+ID4NCj4gPiBDYW4geW91
IGhhdmUgYSBsb29rIGF0IHRoZXNlIGZhaWx1cmVzIHBsZWFzZT8NCj4gDQo+IE15IGJ1aWxkcyBw
YXNzZWQgd2l0aCB0aGlzIGluIHNvIGl0IGxvb2tzIGxpa2UgYW4gaW50ZXJtaXR0ZW50IGlzc3Vl
IDooDQo+IA0KPiBOb3Qgc3VyZSBpZiBpdCBpcyBhIG5ldyBvbmUgb3Igbm90Lg0KDQpZZXMsIGFj
dHVhbGx5IEkgaGF2ZSBhbHJlYWR5IHJ1biB0aGUgZ3N0cmVhbWVyMS4wIHB0ZXN0IGJlZm9yZSwg
YW5kIEkgd2lsbCBvbmx5IHN1Ym1pdCB0aGUgcGF0Y2ggaWYgaXRzIHJlc3VsdCBpcyAnUEFTUycN
Cg0KU28sIGFueXRoaW5nIEkgY2FuIGRvIG5vdz8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hh
cmQNCg==

