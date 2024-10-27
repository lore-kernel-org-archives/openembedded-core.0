Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C65D10C0B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 03:12:50 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.23665.1729998761143590685
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Oct 2024 20:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=E9TYizXr;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1729998761; x=1761534761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dvX+TrAamkGdN+5dyC28MY5vJW03dcfwUWkcYM0jD0Y=;
  b=E9TYizXr41XPFJbrL7T2ad4xDG9f5qgM1FMEDDDXzVMI+DAXckcPjuw+
   6FXLfTJd/ii5P1tvb/muTuRwwN1X1ZeQ+O3R9GpNPwmdN1QDUmMiST4YI
   ndU3rruSJb08h2fFHoQAAzwUdMGDwyuiTHJWYDIEG2JcHZDX08eSB8nzs
   ZQWCbHEddzSiC4BIpqvNF2ih1DrrkirOkmg+RyU9tZafaOLfB0RfQk4Xq
   4Q6GrNvi/xVN3y+jymT17fK2HrsJy3heOhYi4BSN1KWlCnj9HqVXADsBh
   GSvsbHA15Xgmm4kSvVrEaJWa/kpx03gsHo9G2yJ5Dm16WwwWiCRQGNL+J
   A==;
X-CSE-ConnectionGUID: tzwea2gWT724oQcEpGOqDA==
X-CSE-MsgGUID: 5sl4J+NZQ2OuWOcgGJR8nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="134451098"
X-IronPort-AV: E=Sophos;i="6.11,236,1725289200"; 
   d="scan'208";a="134451098"
Received: from mail-japanwestazlp17011027.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.27])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 12:12:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdP4UDHgMNMJ+TRrtJCGF3CLd8H8UsEX+O+45Mnkj5Qpekt+bjXfR6x8ZJ+VazgwmS/OLj6dfHShfcAYJxn+ciq3zTIMA9LdIEjoq7rPvM2apuR4S9Ifu//i398U3D5mR+IUL4KZL5mNdjlGGqLZS2TyijXmo4UGiboMQ+OFaVTRnBCSrVRXDRZjYLuFRAGHIsoShXuI2H8ERRM6yAuGZw0lCdbb4hu9lyxrs0vID8Fi5aGsycGGnDyc6stnr+q6upuFi9TV8Q8uSNW1JYVCU922jZ1AG2aOXwtL+yeTFItsZTUWOB95iF6ygz8gwpbLF5TCKTWAZAwHfM1wuDVxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvX+TrAamkGdN+5dyC28MY5vJW03dcfwUWkcYM0jD0Y=;
 b=P1KNUIuBCY+1zffPD8HIykqP7yBhIApGaVdwdv6fKqbUyGLtXhjQnchZc139zO2gdYk5vb9aBpLERkFT+ng/Iw2dXloy/LNC2ciztWUyrOVTb4d3t/EEoNTda/KqvkZIBTEspSlvlLsvcI16i6UtfxkUvS8oz0gKAcmSJoFTIi8sSaMF+IvjzPmS6hEB49+fjOSsBDGQ4rVepwdtdv4YB0MIQes4YrbMLs+Cc+81oXTC8ICw9/4Cns9WXAUaXLu44aXCl/O3Q5QxE7ImmBLreNzHsfu6DFGev3cGJsDXBXLAGyUYrlczoHaexpJqyQbrZ9FBI2PBvgQPjZE4pdZt6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYCPR01MB10052.jpnprd01.prod.outlook.com
 (2603:1096:400:1e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Sun, 27 Oct
 2024 03:12:35 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8093.014; Sun, 27 Oct 2024
 03:12:35 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
Thread-Topic: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
Thread-Index: AQHbJqBUz/8BRKtQXk2FCNrcylyzNbKXLuGAgAK/D5A=
Date: Sun, 27 Oct 2024 03:12:35 +0000
Message-ID: 
 <TYWPR01MB11861A53BDFF03E210AFB60E6DC492@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
 <1729834769-4717-14-git-send-email-wangmy@fujitsu.com>
 <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MGMyMGM3MzctYjhhMi00MDk5LTk4NDQtYzQ1NDM3MTFl?=
 =?utf-8?B?NTI0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI0LTEwLTI3VDAzOjA5OjE1WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYCPR01MB10052:EE_
x-ms-office365-filtering-correlation-id: 1ec24117-b0db-4f44-09c2-08dcf635344e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NzVGQ2k3UXRhajhGM25zS3FLWjcrWHZMT0E5TUFKTmFMYzQ0SmplUUdRVmRT?=
 =?utf-8?B?TklnbVNFTWd5eGRXMVhTc2lRdzc4bWZPOVFGVTNvZWNJNUY3M3RLZmdFckVT?=
 =?utf-8?B?Z3RwVWh6UHJlTHdnb01RbmQvQnhJbHdCbUpFKzh1bGIzdDlvWXc3dUQ2L0xm?=
 =?utf-8?B?KzhuVjdqeDZPbnhkMGlGQnc1a01manZQMjErd1ZnZFZkSndycU1WTUxkTWdW?=
 =?utf-8?B?bUZkTHVEQXdDYU1ON1NFWWkxR25XV0N0RlZLaWRWeVpQa2pXU2toRjlWZFRV?=
 =?utf-8?B?VW5iWnRRV3RMVVdjWGtoUG1JNVNYOXEyTGpMWm5GYUR4K2pnZE42Yno1aWVV?=
 =?utf-8?B?dE9FbWtRaWVvbWJBUUw2eVYwOGQ5bERWS08xdENvd2NpWVdsbDVWeDY3cmow?=
 =?utf-8?B?eGlJREhJT05aK1lKWlFTM3JWM1c1MDlLakg4NVBQYnRuU1ZVQjdJaTNkQ0ZH?=
 =?utf-8?B?UTRrY3htYlU4cmhjSmpLVm11UUhPV0E5cjJkajcwdnc3R2pLbHRWOHdLcjJQ?=
 =?utf-8?B?L1kyQnNTbXdrTzRGV1dCRVNmdVVsSFRYNGMzcDNFWE1FbnVQV2F2NGh1ZThp?=
 =?utf-8?B?L3A1ZExzbHpjbzlGZmIxWm9LQnNtTG1tM0lXUWFyQlRKR3BrRnFITDZENGJx?=
 =?utf-8?B?eWJPaWxWZCtTU3hqdW84YjFvK21mRlQzVmhERXpyaGFZd0xRQmZqalRlbG5D?=
 =?utf-8?B?aEx1VGMrdkg1b2pobUNGV2JlOS9uWXNySlR0ZHU0SGg4Mit3OVljeXBHaDBD?=
 =?utf-8?B?OUpxaVoxRmxUQnM2MWhVNE9JcEM5NDNZWGp2aXk0TU9Ebkh2WG02YU5xUHZ0?=
 =?utf-8?B?NEJBaExvelVFQXdLNHRmbkZESEZyamZ2cW4rT01OMUVLaHAvdGh1bjk3bjMy?=
 =?utf-8?B?NXA2SE10ei9LSmtJelZ6eE10R2N3SkZnUzhSWDQvck9TanBWZnhlN3FlR2tX?=
 =?utf-8?B?K0VBek96U0NGSkdiQnJpTTVpcXFmTUVnQVkvUVEwTlFseG42cjYzSlpBd3ZI?=
 =?utf-8?B?TUtDaGh5UTVLV3R3VHFFWWU3UUVoZEpWUDhITnI2ZU9YalNDYitsZTBIYlZ1?=
 =?utf-8?B?bnBlZDR4cDhNVnNrMnRacTQ1S1FwRXNzY1dCaDVacjdheVo0THRJaFFpWjMz?=
 =?utf-8?B?cHBubFExTDZEd0NMWGRjdkhXMEIyMDJSYU1XWkdqc1dOdG8vWjJGQ2N1TmNY?=
 =?utf-8?B?K0daa3ZsNk5qRzRaUHRpQ2oxWEtKM1hVc2hwVUdtM0FwTUk0ZHRLeFdSQ3FR?=
 =?utf-8?B?b05mMUNUY3ZndERGT2NkR3JIWmJLcUFBSWoza1g5akh6YUl0RDRTbkFmeXBq?=
 =?utf-8?B?Y0ZZSmVxdU9iL1FSdEFmUGpySUhlY29mMjk0cjJlTWh5ZEwxQ3dCWlNTenB2?=
 =?utf-8?B?NU9ZODVRNW1Uem56OG9RMHJRTEFzU3U2R1hFMzRsV2VRUUVLemx4OUVIQWFi?=
 =?utf-8?B?N2d6Ykw4WDUzUHBhM2wrSVdvTy96dGRpb0wxY3lYRytiSU9RYXQ3Y3YyOG8y?=
 =?utf-8?B?cDNGYXdYMElKeExXMWFkTGhpL0ZkZDNnUTJkN1VNMVdWQUhMc1N3MDh1SENM?=
 =?utf-8?B?b01aRW1iNlAwU08wT3c4RkNuK24xdTFiVzBFQmJCMks4T1BWakdxbHdadVlP?=
 =?utf-8?B?TTNOUFRNdHMwR1ArdUdPak1UREErazFJN3N0QzhFamZpbWdRYlhqdmwzb3RM?=
 =?utf-8?B?SWZ2VlMxY2UxOGhVdHBDT0ltd011K1h0WStvYjd5M1h1eHJWZENCM2NGRzl5?=
 =?utf-8?B?VDVWRnVpSDdMTDhqYzVOTFBmbEpwVGd1OE12enR6ZUNkcVEyV2VIZXJDVDVp?=
 =?utf-8?B?UnFGNlA5aHkyalNXdlRnUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkF1QmRLOFYvUGNrM2YyWmhPQUpxLzNXaFRtWk41SVNQcCtEbnBqWHdpMVFK?=
 =?utf-8?B?Y2VTYzlmNkNWNWtHdXRIanhEUURnbzRUUnlKc2ExZWRyTmZLMjRJeVBkWFp2?=
 =?utf-8?B?RndtUlBLSTgxRmZZWW1JRXh5ZGp3WTUvSTA5UkF0S3pTZmdKRjFXd0w2Zk1r?=
 =?utf-8?B?OTR6WExXMGt4cU9lbE0yTTkyZ3hzbEVOTUlxanRJUGRJYmlPbjJtalg4amNW?=
 =?utf-8?B?dGpQUFJBb2tjWG5DeERkVGdOMWc4UEFnY3dNTVJpeHhvQnZQWC9ZVkRNbitE?=
 =?utf-8?B?WlE4OWVueEN0SzdsTlB2MkxXTnJTMmw1aEdPZ3E5WGdabDhRYVlIOWNRRVZW?=
 =?utf-8?B?K2Zxbkxybm9vMCtpclM5ZzE1SE1WNjVRNFJSSERBaGVzb2pwTU1xNkMyNFpy?=
 =?utf-8?B?aVVjUTYwcWhIR0hZV0FPdklaNk0zenRXeGphK3NJRUYzYkJnZnFUQWRJYUZI?=
 =?utf-8?B?UDFBWDIwS1NvMEJYT2lQNWJIaEJ3VERpVzRrTjE2RE9YcU0xTFhZUFpyVFY3?=
 =?utf-8?B?a1diSjZUWHFtUWQ5RmFqL3lldXJweWhSNUVLUGY0VTdKRFdER05xWmlBdXlX?=
 =?utf-8?B?ZUYrNnJjYXFzQ0ZaZkxrTEI5MmptdUZWRW10ejY2c0hvSVdFTGVJK3cvTnNR?=
 =?utf-8?B?NFhCTk1ueHZCZGRaUXJyYUFXYytRVlZ2Umk3cCtqdUZMemQ5SGs4aGNwQnZG?=
 =?utf-8?B?NjArODlMUTBFVEdjb3duMnFac3hSMUdrVjdDSy9mWDluL2lTWk8rWlhuZS9a?=
 =?utf-8?B?Rk84RjM5UWhINHJySUc1ekRMUkR4U2MxekV0dWh4QzkwcnRKRDdKUGhidTZ3?=
 =?utf-8?B?ZUFnM0hJdHZRbXhwdlJocnFWSnBnZFpjaExwV2o2dTAxTmJNdGgxTUd4Ym93?=
 =?utf-8?B?akV5WnVvYWdmeXBHcGQ2TkhmS0x2YVk3WXhUR2hWaEE0Nk9TakFCdXRTU1o3?=
 =?utf-8?B?d3VGUG4yMkZwOHdnTXJ1WnpGdHhxMjZ2MEdXSUJtZldrbGt4ZWVGUHNCNmZx?=
 =?utf-8?B?TU9GanpST000aUkxaWtBY2dDVXdMalk2T3EveDN3MldXaGFtQ200VWtvVTAr?=
 =?utf-8?B?Y2ZOQWMwcnZOcWl1MVdYWmRPcnhnQXdOZ0NRNldySG5pS0p0TDg2NnFKdm9O?=
 =?utf-8?B?bHZzVVIrakxwbXZ2TVU4SmFjaEdsM255VHUzRTEzY1FGZWFJaDZ3NXhLQng5?=
 =?utf-8?B?dTFQWGpPQVUrWVorbmh4WXJxVkNFK2s0bVJJZE0vSXNzQ3BCN3ZGNDg0STYy?=
 =?utf-8?B?N2QrS1JoS0xxRkJKZzFCUStRNWJrRWFocTM3TGZOZ2FKbHU1cE1OcEZoNGo5?=
 =?utf-8?B?cFoxeWxVZ1hFY2tGRjB3Z3RvWHNBNUowU3RXdzFiOVpKOWVoY1VaS2JSQUFQ?=
 =?utf-8?B?dTZIb2VZUlFvNkFjOE1UdjJrTENWaEsya2RaL3NYUU1iZmg1N0FqWHhldEhZ?=
 =?utf-8?B?TmQ0NkdlcWx1NmZrVHNZRjNzeklKRDlhS012aldRZFlDVjBHVUpLVXVOSjF0?=
 =?utf-8?B?b2hJMmJyMkk4UVdNZHNKT3EvOVN3TjFqSFBpenBwT1M1eTdMbHVhajVCRFVt?=
 =?utf-8?B?emhMNnd0NVF4N1JucVBQN0xYTkd1VTE3ai9kUDRVd3B0M29TdEtGTDBJNEFJ?=
 =?utf-8?B?YjBrUXdidEZrdzlkM1FMa01pUGNScXVCV1N0ZDQxSU9BaU1QWFZ6OGl6aitl?=
 =?utf-8?B?UHlBbEdNb3dhTXNUU1NNMHJjWnphMW5uVFhVT0Y2UHFva2dqS0FBaDlPT1Jt?=
 =?utf-8?B?bUJ2Mmc4VEdhbFZTRUhPU0djZEpXQ2lxMUc4a2pxYSs3M1lkSTdOSWJyd1ho?=
 =?utf-8?B?aGx6bWpEc3Z0TEI0TDJYR0h1Z2Vobm9GLzBINTVkWGFKOWNXUWVuM1kwYkZj?=
 =?utf-8?B?b2lXZC9sei9CYUltc0tXdGtUSU5hOEd6YjBCQ2FiZloxeTBFdlgxMjNHTGdn?=
 =?utf-8?B?UXJEcEpJR2hQdHZRNXdialV3SWpXanJaMXcxVzJvS3FTbElyVHFOeDBtMFln?=
 =?utf-8?B?N3F4eExhWXhQVzdQVFgrclZpOW5GSGw3SlRYQWVEZEdxNTB5NHR0VWlSaW9U?=
 =?utf-8?B?cjk2VHdvUVI1RWRZS2RsNTRXanV4UEJJOUhWMlNZNEJndjhJbFJGK0xHZjgx?=
 =?utf-8?Q?pa6inRDLE07VumRL1AAENelcD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	T2z5d0HdRV/bDjA3gmIPOcthD1ZiifWODLjzN90Wz0a79UgJ09ZD6YRPyYERnPLQDWVo+wZ7r9G26BJAxyiKZlKoh5gsNvE04iplVdFp4xQdrGvv80CcrMNwXqP4HNYYc4XbS+5hblwyvNKlTTIFyWJcDsIZwcGnimu6Do36UB+m8rxJNCsvTq4TSXNv68/uq9GpXy1kXg1pBYKDglzxluqWi7SiRnJv6totq3gZrU845prZc629UAwhquW5Rj3g9K2xAWX4esx/z8LILg9KQsqaXC+/yAqD1dLaP4RVvizpVdPTC15IcwXU5/2zJCWpXhdticRyQKpoRLhYx0kYFL0vLVRCdIKlwjL+DtFRCjjCmSrbgrOAvCIM8gsTWxuTD5nrXBNZ6IDY3k2HahFqYElcXdBv5pfz9w++tn/+vic4PNPMm4PGlZhXoAUjNmjlaQzt0hyRBKBP+PluAivVfz+OQ72vIEn08zpZB2bfvt7sX9P6ISkO8NoAF9ieERbhps8M0eups6WNeOfgYinTZsjTow5DSHxS4SsPNcF7ljqcoa7hVLFyu7KKHl1wkM45frRR2dlHRtMzi5637HViJV1W9te2ClFipfExMbYsY7LZakevcxlEaqZMg/sbFMUX
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec24117-b0db-4f44-09c2-08dcf635344e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2024 03:12:35.0535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cazU4w8UddF0Oi70byGE090wudVeAW00JLclHT+eg6TU5GuY8Q7uSY8wv3M1ttY7B6d+JJADFvUkjX/VKji2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206390

SXQgd2FzIGluZGVlZCBkb25lIHVzaW5nIGRldnRvb2wgdXBncmFkZSwgYnV0IHRoZSB2ZXJzaW9u
IG51bWJlciBvZiB0aGUgcmVzdWx0aW5nIGJiIGZpbGUgaXMgMi41LjEuIA0KQWx0aG91Z2ggdGhl
IHZlcnNpb24gbnVtYmVyIGlzIHJlY29yZGVkIGFzIDIuNC41LjEgaW4gdGhlIGJiIGZpbGUsIEkg
ZGVsZXRlZCB0aGF0IGxpbmUgd2hlbiBtb2RpZnlpbmcgdGhlIGNvbnRlbnQgb2YgdGhlIGJiIGZp
bGUuIA0KV2hlbiBtb2RpZnlpbmcgdGhlIHBhdGNoLCBJIGZvcmdvdCB0aGF0IHRoZSBhY3R1YWwg
dmVyc2lvbiBudW1iZXIgd2FzIDIuNC41LjEsIHNvIEkgbWFkZSBhIG1pc3Rha2UuIA0KU28gc29y
cnkgdG8gbWFrZSB0aGF0IG1pc3Rha2UuDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0K
RlVKSVRTVSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8u
NiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMw
NTY2LS04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3
YW5nbXlAZnVqaXRzdS5jb20NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBPY3RvYmVyIDI1LCAyMDI0IDU6MTMgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij
55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDE0LzIyXSBw
dGVzdC1ydW5uZXI6IHVwZ3JhZGUgMi40LjUgLT4gMi41LjENCj4gDQo+IFRoZSBuZXcgdmVyc2lv
biBpcyBhY3R1YWxseSAyLjQuNS4xOg0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3B0
ZXN0LXJ1bm5lcjIvbG9nLw0KPiANCj4gSSBvbmNlIGFnYWluIHN1Z2dlc3QgdGhhdCB5b3UgdXNl
ICdkZXZ0b29sIHVwZ3JhZGUnIChvciBvdXRwdXQgZnJvbSBBVUggdGhhdCBpcw0KPiBwb3N0ZWQg
b24gdGhpcyBsaXN0IHR3aWNlIGEgbW9udGgpLCBzbyBtaXN0YWtlcyBsaWtlIHRoaXMgY2FuIGJl
IGF2b2lkZWQuDQo+IA0KPiBBbGV4DQo+IA0KPiBPbiBGcmksIDI1IE9jdCAyMDI0IGF0IDA3OjQw
LCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHdhbmdteT1mdWppdHN1LmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFdhbmcgTWlu
Z3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1p
bmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4ve3B0ZXN0LXJ1bm5l
cl8yLjQuNS5iYiA9PiBwdGVzdC1ydW5uZXJfMi41LjEuYmJ9ICAgICAgICAgICAgfCAyICstDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSAgcmVuYW1l
DQo+ID4gbWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3twdGVzdC1ydW5uZXJfMi40
LjUuYmIgPT4NCj4gPiBwdGVzdC1ydW5uZXJfMi41LjEuYmJ9ICg5NSUpDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0LXJ1bm5lcl8y
LjQuNS5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0LXJ1
bm5lcl8yLjUuMS5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXggOTUlDQo+ID4gcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0LXJ1bm5lcl8yLjQuNS5iYg0K
PiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9wdGVzdC1ydW5uZXIvcHRlc3QtcnVu
bmVyXzIuNS4xLmJiDQo+ID4gaW5kZXggZDI4YWU3Y2E5MS4uZTA3ZjVkNDQ0YiAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9wdGVzdC1ydW5uZXIvcHRlc3QtcnVubmVyXzIu
NC41LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcHRlc3QtcnVubmVyL3B0ZXN0
LXJ1bm5lcl8yLjUuMS5iYg0KPiA+IEBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9DQo+ICJodHRw
Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wdGVzdC1ydW5uZXIyL2Fib3V0
LyINCj4gPiAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIg0KPiA+ICBMSUNfRklMRVNfQ0hL
U1VNID0NCj4gImZpbGU6Ly9MSUNFTlNFO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJhYWJhYTg4
MmJiZSINCj4gPg0KPiA+IC1TUkNSRVYgPSAiYWVhOWY0MmY4N2YyYTc4YTk3M2FlMjJjYWRlOGU0
NTI1OWY3NTRlMSINCj4gPiArU1JDUkVWID0gImM5OWU4YzI3MzdmZjgwMmYxMTA2MTJjYzJkOTBj
NjAyMzNjMzMyNTUiDQo+ID4gIFBWIC49ICIrZ2l0Ig0KPiA+DQo+ID4gIFNSQ19VUkkgPQ0KPiA+
ICJnaXQ6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wdGVzdC1ydW5uZXIyO2JyYW5jaD1tYXN0ZXI7
cHJvdG9jb2w9aHR0cHMNCj4gPiBcDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiA+DQo+ID4g
LT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3Nh
Z2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIwNjMyNSk6
DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUv
bWVzc2FnZS8yMDYzMjUNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9tdC8xMDkyMDM1OTMvMTY4NjQ4OQ0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gVW5zdWJzY3JpYmU6
IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3Vi
DQo+ID4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gPg0K

