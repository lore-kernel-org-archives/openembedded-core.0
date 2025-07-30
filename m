Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E7C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 05:15:27 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.28141.1753852521057096674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 22:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=Lj2rkPXQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1753852521; x=1785388521;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=805DEiYNgl/kPYkiED6nU9dwDLYkN+FaF/qde6YgcY4=;
  b=Lj2rkPXQLu2CKD+T0FSyexY0dLySBV4h64IT3yBppgLJw2miEnCJJdUn
   QFR8KIdprzCcXXHkRakI45cNG0lLXz1k6lPVL/ssl+AFz+PQwHMWROZJj
   DSb/jzhsUpp1ERm7UCEcfH4PAOkQy9ETsKUZgjURwf6PlM764f6u+0Qnq
   FDFVAipk33Q+2Jt98eN4dut+ZJ+XDmCk6kgM4/4PwCP2tc72NXpo+4kfj
   Qd0VPO5+Icr63p3WkrhY7T/2SFczrtfbIQjKClNOkr7QcGEro8sgU90Ve
   aN6mydz5fTsNw8ZGVAtg4LPJ5Uv3sEldSGkHHdjQ6BwpwHFtph5DBEuiH
   w==;
X-CSE-ConnectionGUID: JT6o6HKvTquRMVgUnfH41g==
X-CSE-MsgGUID: ZTCCB+4ATQGbB3SA7xndMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="162681088"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="162681088"
Received: from mail-japaneastazon11010058.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([52.101.229.58])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 14:15:18 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nke4c2slTajJcEfxkNYPINcYjzgeyqoiac9cLOxKQH0Yk11FjhohP3e0Syg6SQHgSqK2WYQMh7p/3Dmy6yQgTwKZNlHLeMZTIh+ofFOGaDFi9ZsSP7FppMw6suHX3g20MTJd9slvHyiCiFQsUB+iq3WCmj5kgA8CPZHFt4XytGJq/zbJzeH3qlxDiL0t4Sn2H6mOUDRhxikQXLAXiqW+hY2zWVMrtOWkgF9vWbXaK7GmUjb1hRRvOnUU9mYHgfoazKUYWzxmzNQZ9VfhvNvXiBYqk0RQCRoY6NTTpF7fKHpoDhCNhRT4rSzMue1JuKmQPr4S0JvMHhZrk+dCN55lYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=805DEiYNgl/kPYkiED6nU9dwDLYkN+FaF/qde6YgcY4=;
 b=jb/9vk/XMMO/Tb0xbmAHWfP0/DS+sowOXMS/4iDFlminNXDJxkPHiKM/3050+o/0uO1bTleFQ6NVv6kDDAes9+jmfQ03u4slL9OLUhoLI9VuNKL9v2MpN3bGzUyrsWjVXxf/KnVax84Je/UO994486KNNmqXtZw77ZqDptYWnMb6HSK3z4UEUNKb1SB3OjpsN5/TMiUdFmy+rMy95qYaXJQtEbtf/biUQTh3Hd1KDuZNZOS3Jd589sADFYHHz0cg5g+eGhFh5UJ/5Z9csjGd5WCoCszI1GS12y/qaRHdu306s3UO+dlcvtKTTK+iEl7S9pzKHXFLA7aHxnVzu9JooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by OSCPR01MB14386.jpnprd01.prod.outlook.com
 (2603:1096:604:3a4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 05:15:15 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 05:15:15 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
Thread-Topic: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
Thread-Index: AQHb+24YWpMAbwp9dky6RwPCr3v5jbQ/c+yAgALyfvCABohpAIABOwFw
Date: Wed, 30 Jul 2025 05:15:15 +0000
Message-ID: 
 <OSRPR01MB115971E6C52DA78DDE508A7639B24A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
 <20250723010614.926-7-liuyd.fnst@fujitsu.com>
 <DBJC0QX4FJ0A.EVEZKMCNWFYQ@bootlin.com>
 <TYCPR01MB115906739A3DE3638C6308F499B59A@TYCPR01MB11590.jpnprd01.prod.outlook.com>
 <63D021C8-74E4-43D6-95AC-60138D222EB0@arm.com>
In-Reply-To: <63D021C8-74E4-43D6-95AC-60138D222EB0@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=7b7c5658-4f69-4057-9ec3-4cf28b5562a3;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-07-30T05:11:07Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|OSCPR01MB14386:EE_
x-ms-office365-filtering-correlation-id: 7bd24988-e91b-4322-0135-08ddcf281134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?RjhZeEEzQnZ3bSt5SDhFa1NwdEpEcDBNdGpTeHptSUVqdncvQkIyR2NjM1o4?=
 =?gb2312?B?Nnl1UysvUkpESUJZMTA4L0Z3YzZFeDBxMngxMEF5ZEl1WkZHK3krQkU3REps?=
 =?gb2312?B?Q0VQL01rOWV2eDB3U2RjcVpQMnJ2ZDhaMzZ2eFpsaGN4OXNXUTJsamJuR0tS?=
 =?gb2312?B?Skg0L3lnLy8yVUg1WWdsN01ITlVXTHFXcjNIcXpTYmgxbG5ObEFxTm9wM1p0?=
 =?gb2312?B?M0gyRnlyVGU4TmFwMHV4anBRSmp5T3B6OVNRbnA1RzYxY2FnbjNwVlo1WGJB?=
 =?gb2312?B?cGRsZXVNMWdudWdMdmNmbUFLUjBmVXN3M3RiTllITVZ3SzJSUTRUSTVya3NJ?=
 =?gb2312?B?Ny9UdENIa2tpTXB3Z0E1SGRCdlp2T1c5eGNqNkdjOEhVY1lCc01QVlA1ek03?=
 =?gb2312?B?K0s4MEdNdVNBRnhMRzF4WDNlUWNPZTlVeTN3aElwMXRoSDZHRTRtcFRwWjFH?=
 =?gb2312?B?aEVrUUN5dU81WGRVUUtyOVozRmNTVW1STm44TEdTQ214eDB0REwyQjdjRElo?=
 =?gb2312?B?OFFUVXQyd2RLZ1AvTFRsRHUyeWYxcWh4TXJKbzdacitOam5pRGp6dkRDeWFQ?=
 =?gb2312?B?eTU1MENIR0dhTGltajRaOU9URDd5TXZtcHkrdExnN0FpblRVM3h0MFNodHJM?=
 =?gb2312?B?NU9aVjViV1dkVFhYekEzdnZvUGhkSDd5NUJ5dkVQd0ZucFdPUXY4MVFiSlQ1?=
 =?gb2312?B?RUZzSnBuOUIyR21NVGE3QXBUcFdPWEpuaUROcFRQVndyVHQzSnRmbko4UXJ6?=
 =?gb2312?B?VVZzVDBQRGlrdGFQWmhPMlVpblhmRjhnNm85TzNPakpUZUU5NXhSWVdjNmtE?=
 =?gb2312?B?Rm9OcWZFaUEvZ3NaOXY0TlBBRFBmOEhzYzgzcFV6ZCs1N1Z6TzA1S25ieUl5?=
 =?gb2312?B?emlWL0ovcy8xZEpjYmJqOGVjM3c4c0ZCYUgwZnF4RnZRWkdmYURrUklqN1Ns?=
 =?gb2312?B?MENyeDMwTmxNUmQzY1NmRHg2a0NKekVLbnFCMitUL0lTVlU1TTVFVy9GWGIz?=
 =?gb2312?B?L3NuWE52TFhrT2tET2I1dkdiUHMrTnNPV0ZwQWI5ZWtPUTdFT3UybHVWTWxQ?=
 =?gb2312?B?WTdhdDhNcFNIWmVKV2dISVJsTE5QT1RWZ3JsRzFNTzFuM3ZiQzZCWktXVi9z?=
 =?gb2312?B?TFNGd0hybmRPaDNBQms3dFBWR0tmbjBuR2FNWXg4VStJTERIMG1DM2dRcTJI?=
 =?gb2312?B?Z0VCZzRsbTNyb1lOS2hKMGlDNXBMUm5ybVZJQ0hDUVN1eGY3RWFWUWlNNnlC?=
 =?gb2312?B?MVlRYkY5L3pmQUpVVUk0WUtkZkFkbDFyVEtOelZybW5EQmNyM1NRcTFYb2Fu?=
 =?gb2312?B?QnNBNWJyNzYzQnoyZmRxUjZVcGRlNjY0d2lJVVpRbGgwL0NRVWUrbkMyL3Ur?=
 =?gb2312?B?ZFVVWGNUM1hoL2F5MXZVYjZDbCtEK2d0SzFGMjlocTh4SXdqYjU1VytmU0U5?=
 =?gb2312?B?d0R0RHZKNFJQR29raitZcEtRbk9iei92UHJDUzJrS1R3MktkbG1pREZ4OStF?=
 =?gb2312?B?Yno4RG40QU1LcXRCSENtWThWUTJDa3dQbDExQ2xPYUQ4LzZVV1JMNGpzTTMr?=
 =?gb2312?B?d2xqNWNnMmdwUk9PM2p0cDhwTExrK2h6aTc3YWtRQ3RIclkwaTYxZjU4dUJJ?=
 =?gb2312?B?U3FDRFZLVldYdWRMZ1JkRjZpTXBMVjg4cFprUWN6em9QT2lianZyQmY2aVpR?=
 =?gb2312?B?UVMvNU9uUjd0ZFBYeHB0MUx5MnNJZm15d3ZvU1hKWTY4OG9EOE80UUJwV0tL?=
 =?gb2312?B?Zmx5cmN6V3dwR3JiMEkvelFLeXpoQTJWSkdRbjYzQnZpdnVyclRJU29iMFB3?=
 =?gb2312?B?U1k3Z04vNEVqSEtMbHRZdlJZQXVDc0t0Z1h2MVF4WlBKSFU1bzZPajhCVWhT?=
 =?gb2312?B?NUtReXV1NHQwdDVXYm9yd0RzNWNVMEZoOWVDYkN4aVNoNVI5NEthVmRXdHMy?=
 =?gb2312?B?U2MyL3lob2RsVkxPNWt6M1NuWXVRSG5ackNwUEtUYTM4ZmZoRi9kaitkVUZQ?=
 =?gb2312?B?aVZRQ3NLcFlwaFpZSTJ3Ty9mTDAwUFQzcjFUR0VwNEYvc1V0THJ0Q1cvMGVt?=
 =?gb2312?Q?7Czz0V?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?czBxU0RNUFdqZWVFMWkzYWo0U2xhd1VxSEVldFpCYWxaa2hUZktENWhaQjh2?=
 =?gb2312?B?L1ZaOFdMSmp0WUY5YkZuRUpzN2RjMCtSRGxITE1uSmx6b3F0ei9ZUGNxYUNq?=
 =?gb2312?B?c1ZERUZLK0NQS2ZKRzhCc3FnNUhTTkUzZHJ5WjBseThYeldhOSs2bEdCY1J2?=
 =?gb2312?B?eUphTmRGQXgxdURSYy83Q0Y4cTJzRjdvTzFTbmVVVU5PdjhhcWdxTGpoaklv?=
 =?gb2312?B?alFtWGdRUFZCUFhLdGRUTHVsVGhkK2NSU1BVcHRiMWZ4UTFlYjlkajh1MkFk?=
 =?gb2312?B?R1VwMGt5L0M5OEJnTit2NVZ4RWttamljbFBPY2o1WVBVekVmdWY3bTczWHF4?=
 =?gb2312?B?czhuSEh4UU1Za2ZvazIyWlhGSmRlNGVscUl4WGRHOVhXaVlydVlVbWJRS3hY?=
 =?gb2312?B?UFZUdHJuZjQ1elhaUEJ4WG05KzhGU2svUVRtK0dxTFlSbWpKWkcwK1M1Mms4?=
 =?gb2312?B?b0NLUzFzVGFESnJKdUJLMi9ZRWxPTDV2Ky8wSDYrYVlHZktPNG0wRnM2aC9h?=
 =?gb2312?B?VCtqSHBLc2R0ZGdPYjNmTXd1cG10NXoreWV6Q2p1L2ZJNjZEZ1RyeXNkWS8z?=
 =?gb2312?B?cHFZamJFZ0VkWGh0SGc0U0EvNEQ1RVNoOHBCL0lYb1BUNzhPb1JEeHFiMTNs?=
 =?gb2312?B?MjF1VUMvWFpsTkVWK2NyNnExZnI2Z1ZZMWgxN0VmeHJNTjlxamhpUjE5UCtw?=
 =?gb2312?B?eWN0S3llZlBuWUQ0aFdTQVV4MHJveEtSczJTQTV3RXVCVlh3VkhYRDlVRG5H?=
 =?gb2312?B?cnNkcnZVR1k1YjdiYVllRS9RSDBIYWk3a25WSXg2SGlWL3pKNXNPSXIvT1NL?=
 =?gb2312?B?VXQ0YU5sYmYvcGIxSDJraEtIRFI4cWdWYlhxcDRIWlJtWmMvbUZ6QzdkTU1I?=
 =?gb2312?B?ZW9rd1l5Z0FCcWEzRW8yYWg3SVNIcmNoTmxVdXBaQnNsbXhnaHpvbm9yVVQ0?=
 =?gb2312?B?cHZmYUlyVmc2SFlxM2dIeXV4Y2dwS1dHUnQvaUMwc09OMVZBVlRGSUFOeHFs?=
 =?gb2312?B?c3d2TEkySHFURzBzeWhlemNLelN3NEhwdy9iQTUvWjNLOXlxK0o4aU5sZFlW?=
 =?gb2312?B?MjBvM0pnU2oycTVlMGtDRTMwblhoSGhsWFd2YjVMWnlWL2NvSjVFcXk0a2Rs?=
 =?gb2312?B?eTkvR0xDVHJPd0M2dGJHaUtUdnlQYngwTTUzTjM5MWExZ3FQNWsxUVRiRWs0?=
 =?gb2312?B?ejYvT3NEV1VGS3EwYlZ2V0U3dFlqL3VTbjFKM1dUL2c2WlhyZnBZSmhSL3VF?=
 =?gb2312?B?c2V2VmxwTmNDK21QYmY2ajN1bnM5UTJnWnJqNjlQVkl5S1N6ck0yalN1dSt3?=
 =?gb2312?B?SjdEbys2U0tIcW54K2J1YW1yWEovaXFVdFNLRkIrbEQzNk1JdnYzbElxSVpy?=
 =?gb2312?B?ZS94RmVnNFVQUXJXbEdFODgxcE5RaUIyQXZkNTlvSGduYSttVGQwOW5QaU9Z?=
 =?gb2312?B?YlJRMm5oYUxYNmtGa2JDaUZIUnVWK3VlZnNlZGtaRnlNaGl1N3dTVytEbUUy?=
 =?gb2312?B?MTF0aUF4a3FkNE4rTkJyTUFnRFdzRzc4ck5NbTFQMkpmTlNSVEgzTlJOWTB4?=
 =?gb2312?B?dVNRVGFscEErOVpkVlpZYnc1YStjMTdmeldrcmlUMDdaclBnbm13UDNMK3lI?=
 =?gb2312?B?OXhpTHh6Yk9vMlJwd21vb2tHbnBValNkM1Joa0F6aVBWK2dHOGtYVzFoRmYy?=
 =?gb2312?B?QUZQZ2pKK0JIMFhiNWRkYWhTbHkzNFFtTDlJTk9VWUg4a3dvN04rZE1OdWZn?=
 =?gb2312?B?YnBla2ZGTlNjcmlVcGNLbXVxUlVpMDZJaFVqaWNRZGpQSWJ6TWJubXRBamV2?=
 =?gb2312?B?bVlqSEozRkgwR1Z4c1RDNkhCZlNFOExvbGNtNm9HdGM3cDhjS2IvV255dzJK?=
 =?gb2312?B?TDk0Z3RSTnEranBrb2NQZ3dSZ3RPd0JjcW9FYmEzT3dZTlphdmNIQVVjMUJx?=
 =?gb2312?B?eUJVY2JWckRYT2VoM1pIYmY0YXY2eS9YaTZaK1VwS3NZMjZ4a0dtVk1aSFcx?=
 =?gb2312?B?Ri9qN1IyTWRyUFJPaTQxTms2TURYUDVTdXMvOVNHTzVDZHpENHNNSGxJM3h1?=
 =?gb2312?B?dmtXeTk4djlqdFFJL3IwTFFLTWU0eTIrQkFBdWdXdGxCUFlLamh1bFZMRUpO?=
 =?gb2312?Q?r/nQg7mbzhabEjiqrs9dw2w/F?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	tjMagyY+ICo+STttmMcZHuf2IaqHSim/miPSa2MpsfFV0qsrCgs0E3b7mlVOl3OLdt3uI1h7YEpln627AQeUEFWX3e0NDeH+QOsXBMgEPDGSYaMG9zqu+KXr9gYXdFMf8GSI3ogRUvr8Gq2wBr18TfF8Xb+3XsZJC9mR42oT2t6DKrtiW/uN19kdjWrqwts/x3kCYWtNco2pD1TZgstb0tQOo4OX3Cip2/Afp+gSqUuxYhU4Y2o+WSA89XhCQr7O4U+jaWSb9UVzOlv+aNjQHDWjkjzz6Jkxz7L42XVsfYiYFC8mwuwdALnj8wcqKFhLkQ7MbuX5jgQtgJdfpdJLwqk4zfSpHNd2vXWSJ/JO3H+rrnivqFxEX7oduKTMv28QPhJIX11j1PbsnciFykVGgrX82+LkQjkdmmdoEKUC6NtZnMjXjhYP1fbsFJ/KW/4X9PkZvK8TtCdr8Njun0J+KkjyMoPAwBi2gXVaERDKEDfa3uT8i5gs2ZK0nWBiiR+Z/ypqETeifhOsnoykVUnV25yw5WjSjNsYFNnn1RzOtJfRj81qAj+PxdoT+QcakY1tTq8isEtXb4wtNWFtGkSe+PcDdOVFXjXGvuM+wX/ubdczHsOI725pnM5wMEDxS6D8
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd24988-e91b-4322-0135-08ddcf281134
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 05:15:15.0402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YVi+xo+7uFnwD0deSduBauDC0KwWWspL1UI8Zb8S0xIM6xwwEAypa0masj1fa4tK6foGPx1Dm5MGLe5UieNPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14386
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 05:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221102

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSnVseSAyOSwgMjAyNSA2OjI0IFBNDQo+
IFRvOiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KPiBDYzog
TWF0aGlldSBEdWJvaXMtQnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+
Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIDA3LzEyXSBsdHA6IHVwZ3JhZGUgMjAyNTAxMzAgLT4gMjAy
NTA1MzANCj4gDQo+IEhpIFlpZGluZywNCj4gDQo+IE9uIDI1IEp1bCAyMDI1LCBhdCAwNzozOCwg
WWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGxpdXlk
LmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gSSBo
YXZlIHNlbnQgYSBwYXRjaCB0byBmaXggdGhpcyBpc3N1ZQ0KPiA+DQo+ID4gW09FLWNvcmVdIFtQ
QVRDSF0gb2VxYS9ydW50aW1lL2x0cDogRHJvcCBpcGMgdGhhdCBpcyBtb3ZlZCBpbnRvIHN5c2Nh
bGxzIGluDQo+IG5ldyB2ZXJzaW9uDQo+IA0KPiBPdGhlciBjaGFuZ2VzIGhhdmUgbGFuZGVkIGlu
IG1hc3RlciBzaW5jZSB5b3Ugc2VudCB0aGVzZSBwYXRjaGVzIFsxXSwgY2FuDQo+IHlvdSByZWJh
c2UgdG8gY3VycmVudCBtYXN0ZXIgYW5kIHJlc2VuZD8NCg0KT2ssICBhbmQgcGxlYXNlIHJlZmVy
IHRvIFYzIHBhdGNoc2V0IEkgcmVzZW5kIGp1c3Qgbm93DQoNCltPRS1jb3JlXSBbUEFUQ0ggdjMg
MS8yXSBsdHA6IHVwZ3JhZGUgMjAyNTAxMzAgLT4gMjAyNTA1MzANCltPRS1jb3JlXSBbUEFUQ0gg
djMgMi8yXSBvZXFhL3J1bnRpbWUvbHRwOiBEcm9wIGlwYyB0aGF0IGlzIG1vdmVkIGludG8gc3lz
Y2FsbHMgaW4gbmV3IHZlcnNpb24NCg0KPiANCj4gVGhhbmtzLA0KPiBSb3NzDQo+IA0KPiBbMV0g
IFNwZWNpZmljYWxseSAibHRwOiBTa2lwIHNlbWN0bDA4IHdoZW4gX19VU0VfVElNRTY0X1JFRElS
RUNUUyBpcw0KPiBkZWZpbmVkIg0K

