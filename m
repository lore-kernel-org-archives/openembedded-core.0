Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD905C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 23:57:59 +0000 (UTC)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web10.21840.1737849472036062311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 15:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=IaTqhahZ;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1737849472; x=1769385472;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w3aOYlRIEE0CAz0QUQ3iR4iGsuO51m4/Gk+g0+jfUaM=;
  b=IaTqhahZny1f5C4OrvGuHc/ciLCcIIPY0FduDiwiog+y/oG/vGiQvn08
   NjC0ekpdfshMtKwQo5hDzv8nDYM6SFfmDLFuBj6UK7O72itg2KmV/MkjL
   KfzytLKG2X6fHHZhqNIF1zomDamWHQPjqzpOS8oNbtxYorkl9q74v5BN4
   7XOOkL5qm05Rvkif3pnIkmBrg3AgY/EAGoug1McqAP0Y8uhf6I6KxZiTc
   vVqgPerCoHe3hP1+XUdFa53FDRVUx+4S7xLYNv8mSyMipyNw7jnw/Awt3
   Dz3IrnI4vybw1z1ZeybF+O4VL2EUXwlWCgbVN3X7BuWcjauyXckZCLh6E
   g==;
X-CSE-ConnectionGUID: ykOjbPDnRziJ49emGdQ7eA==
X-CSE-MsgGUID: V13P4MKCSjyJD/jTig0AVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="143744784"
X-IronPort-AV: E=Sophos;i="6.13,235,1732546800"; 
   d="scan'208";a="143744784"
Received: from mail-japanwestazlp17011026.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.93.130.26])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 08:57:48 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY79jBrPIuPlW4tcFo1XrKPyWJ+4CnLd/rHPVaVslNC/PllNcakB8JvTz+S2u/bwmmgR1i5+Sv0fxV8PH5iUefWhGvxfaWrkvBaJhoVzl8NmJ5OgBjb6wYlZOG1gxoThQd6MCH1faXwN1c1aO4bHb6tulTziFCVrncf+dqpKiBTlUhrt+aWAf5sPhWS3mgxP9uMBYg03MSAICEOoPzCIErZ3l5Vi0UUNAMcpb9LkiyOgSIrBwa337grT+RjdPOL+majuQs9MgMI/y8GQuCuMJ3tA5CLGGJlShSBJV3tB4DrnF535CeHrFtsArRVI48oD5TA/x9bKROmlBERmMSfdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3aOYlRIEE0CAz0QUQ3iR4iGsuO51m4/Gk+g0+jfUaM=;
 b=NZI1w6go0hiKaQ2KS48PnqnsxhFi8OGqza0OFgya3KFEfs786NVPvgY0ziImOf/efx6kS7zVO99688OvQleMjkybHgf63iayzo5/b0D/qPwXMOBFSey82MIKmxzPn+Zg4PCHkgIcNtreHrIhG3zfbkrDXj9xcgM3IQ7R3Gm7/f0ZbJ3dQLrQjRN9VOHzXjfunhWfTPAL1bPG83SRodqgub0qp9+tmDA/Hqv3+BaRk3ivSMnQ1gvze3fqqg1BwVWrN5hT5wHw3rNV3WymjR5oeRicBtFWhH6EiTRiEmjEC41dPj8w/bH1rik6e6CB69Kmxxag9qZFWt/3M93uEQkS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYAPR01MB6476.jpnprd01.prod.outlook.com
 (2603:1096:400:95::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Sat, 25 Jan
 2025 23:57:46 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 23:57:46 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Maohui Lei (Fujitsu)"
	<leimaohui@fujitsu.com>
Subject: RE: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Topic: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
Thread-Index: 
 AQHbZ6xZzTsZ6qT/3Ey33XrVQ0r3ubMhY4gAgAACcwCAAJBAcIAAia8AgAK6NqCAAJDAgIACbwDQ
Date: Sat, 25 Jan 2025 23:57:44 +0000
Message-ID: 
 <TYWPR01MB11861A1294C76DA1211C6CE94DCE22@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
 <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
 <TYWPR01MB11861F43C751CA906A41A7AA5DCE32@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj-jKtRBwEiRK=d=jprA6A=gHJELEeT4NbQsPfHqkCOM9w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-jKtRBwEiRK=d=jprA6A=gHJELEeT4NbQsPfHqkCOM9w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MzRhNDA1MTktNDJlZS00Yjc5LWFhMjgtOWE2OTBiYjk1?=
 =?utf-8?B?MmUwO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTAxLTI1VDIzOjU1OjM0WjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?Q?81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYAPR01MB6476:EE_
x-ms-office365-filtering-correlation-id: ca8d1f47-8595-424e-4a84-08dd3d9c0fbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RVNJUkJ3WGhlNW5sU0FTRTlEV2pGV1pLdVlvZWc3anpJalp0cGk3dWduU0dz?=
 =?utf-8?B?TW54VWt2NFdtUGNOVldZR1NmQXk5eUtYZlYrZGhaNytQcDF4cGoxMmZwcHMy?=
 =?utf-8?B?VWM5b1hhNXpUM3NSeWwybFNERmplMzJvNTdSWUlDZFN1YjcrcWlPbVc1ZVNa?=
 =?utf-8?B?MGNNQStKMGxyM2pmTWNxRzdmeldFQncvVlQ2NnRvRXFFdzlNZnJsMksraDZp?=
 =?utf-8?B?LzdWVXBxbHN5UUVXYzBacldXTUkva0JtUDBSQkhBam9BdjZYRTB3YnA3KzdD?=
 =?utf-8?B?dGFOUUdQbExKNnBuOTdkTWxWUGtFRkMyZG8ybVIraVhNNnNMbFV1S0t3Z2Iz?=
 =?utf-8?B?M2tIbHdTalZDYVZWdWJUZEFNOWhzemZvTHpnanNKUXU2V3lvR2VWVWsrcDlX?=
 =?utf-8?B?bjRjUW1BL0NaOEFPYU8zUTVvMEJPbG9iMUt5dnJIdzM3MVBZSzBHa1NjZVF6?=
 =?utf-8?B?T0FaMnlPT0o0MFJyNjJsak94ZHVuaTR6NnVCRk5STGJhNWFlcWgyM2FOK0NY?=
 =?utf-8?B?NUZrenlUTEpBaDhwb0pmSm9zTWl4K1hpVDk0K0dXSFZ3aWx1d0ZxbG9WWkpB?=
 =?utf-8?B?dEloUE1ZVWJXK2h6K1h0N051UlZHQm8vU2w3UHdkK0dOak5qenFVUk9zNlhF?=
 =?utf-8?B?elEwYXd5bE4wSFBPWFhkb045clVGdTZPbDZaZHE4ME0zazdnWVhPMG9MQTVW?=
 =?utf-8?B?amE5ZTdYVDZod3F1ZWRVR2sxZXROQmZBdEdDWDhBVTNVT0ZTSjFkM0xua056?=
 =?utf-8?B?VittTS9HbTkyZ1ZxeTQ0d25ZNjNYUjkzVjlkR1ZGcm9oNSswNlJ5bXV0ZDhw?=
 =?utf-8?B?b3JwTjJLbVFQKzRtODlyNmNDNTR0dlpjZE5oWUlBMGl5cytGOGJKU0tJbmpW?=
 =?utf-8?B?VEEwS24zY1Z2OUp2eURHZ1NrT2VVOGJHaXUxdjNwUCtYMGgvbUY3SU9UTDdU?=
 =?utf-8?B?QjNwSEN5aC92T083NnBGaUpRZjdBVVhEM1FSWHBFdmN2ZjNaZGgrRmt1UWNO?=
 =?utf-8?B?Z0pzWVIyQzBOWHgyVE85c1R2MWlReStSaVlBbzBFR1ZJMzM1VkFvTGhyMzFG?=
 =?utf-8?B?WXVPRzNYL2x1d0hPSFV5NlJXempjRkRPYlBqbUVBNml6RU1hajlScjVIenVZ?=
 =?utf-8?B?Y3RmYnVCU290bUpuTkl0d3lpRmRmR3JqZWNNbkJjUGZ5MHh6NzNuRW9OQmRY?=
 =?utf-8?B?V3hvVCs4YzhBSmt5MUNpT3M2UVFLVFh6M0dXQWN3N0x2M1RkUFd2U2hUWFdE?=
 =?utf-8?B?b243UGRZWDhwcGYxREdsUjIvYzltbmZLSVhlcVRwTHpvR1gvYXQvNUVGUGNq?=
 =?utf-8?B?WGVsLzgwY001QVhoa3AydUtZWGV0M3NxQ0h1VXd5VkM5ejRVRGJIM0p6dVVw?=
 =?utf-8?B?b3JUL1ZIZDFacFBmL2ZTeFVINk80UDBBSmlqU1JqdTFMcW1NamhJS2dFRmVO?=
 =?utf-8?B?aW8rK291R20reHpIcHBxWmJ3SEl6OEJjN2R3M0V5RUMxbzRXQkVMTVRVYmZ1?=
 =?utf-8?B?OFdzSjFJTWppZjRHS0ZXOFh4R2diZmxaMkF3ODFueG42K3BLRStpVnFVVmNm?=
 =?utf-8?B?aklLTnUzVGJmME5ZMkFJZjBLOElKQWMxV2EvVDBTbDJnWWNvVG1uZUsrRzVV?=
 =?utf-8?B?VjBIZ1NIREYyenU5eTNweEpIdFFUUFMvc0duNWFyaVhUSFBJeVRacTNBbkpj?=
 =?utf-8?B?ejlGZnE3clFlaldkdUxieWtRbUVZeVlMLzBTbzNlRDFETXpoTk4wbjhrYjZv?=
 =?utf-8?B?cjdGTzVlRUNhL0JVT1h0S2c0ZldrdXZLWGZUWTRKNm9abGxZeDhwd0FxUE16?=
 =?utf-8?B?UStrb3ZMNW1ZZWJOOWs2aVlTZ0ozRHBUQm5BTklZdlVjcnBYK0dON2thS3Nh?=
 =?utf-8?B?emo5bGx0OUJNQmNaQWdwRzQ2QXZVb2Qwc1dHMHpPeGJwdG9PQ0FiSkc1VDBV?=
 =?utf-8?B?U1JXU0p1cXZxeDd0SHN0Y1NuSUI3WkFKTFl6Z3JaV3k3ZnU5b3RZQ2lDbnlC?=
 =?utf-8?B?Y0JNeEd1OUNBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWx0dHlWM2hwUHZKYTB6a0RzUTc3Nm9BSmhuaUVUYXdRWnpYK0pST2lpQmJT?=
 =?utf-8?B?ZG41VXIzNGlVd3BYdHgrSEFNTmFoYk9wTXV6Rm1oYnAvMjhaVy9JNU1yWUtR?=
 =?utf-8?B?R2tINnV1MlQ5Y0o3bnlZUEJCNWs1bUZYYWVMNlB1eHhrQ0FKa2t2SFgwWTdK?=
 =?utf-8?B?RitMbko1VDNLbmYxUHRiaW44MUJud3hlaUxkMHRKT21DMUpZM3k1YUR3Vk5n?=
 =?utf-8?B?VUpydFFCblZhZDI5a1hPd1BhZUNlM21HSHNJTHZIai91YkhXdVlZd0JMeW9z?=
 =?utf-8?B?T0xHRmkvVndlcUI1UWtLRzQyZ1FaeVh5UkhpdXVnRjl0YVdXZFUzU2grYlBp?=
 =?utf-8?B?dkdpaVd5MnVrWTBmOStxNkRvTHFMZSt2dmk2b0VzbFVYeURoZWZIbExNemk3?=
 =?utf-8?B?eUoybklqeWplZWJkcUVqanFQR20zdk9JdmNxMmxoTkJsNGxFRkc5Nzc5ZTUr?=
 =?utf-8?B?NEtaUEJZeTE5WlhjK3ZVNkxqNkwwT1pzeEZsY0lkTWd1ZzZVYUVEVTl6bVBT?=
 =?utf-8?B?ek45dmF1UVcrMEw1Wm9VU2lIbTZaUFdCWnd6TG1ZRmx2SzdHSEVDZ2owb1V4?=
 =?utf-8?B?TVN1azViK2F5L0FwYk56U2ExNjVjZEI1US9nclJEcGVwa1NlVEk0WU9XbjEx?=
 =?utf-8?B?ZUtVL1AwTUpscG40ckhacXl3Z3ZFWndtUlFJK1ZqZnQ4eW82eUpzY0hJU3M1?=
 =?utf-8?B?RkZMSkhlb2pkVjArNzV5cGRYankwbldRcWI0a1hhaHV4TGZGOGplWVNRajlw?=
 =?utf-8?B?NEZYaTRQL1M4Z0pjTEhSeWRRS1hKMjkrM1FBelBzdkU0WVAxVExOc2xYOENj?=
 =?utf-8?B?MDU1SU9pQTlWaVVqOE1MbXJJUElLWUlVSjVmRVBhZTdoNkhITTVCdWVFaGtl?=
 =?utf-8?B?UUplMitwdUx0SzFMTHM2RUd0REtpcnI4RUZ6QTloUkwyc1pPeWlHTmpwUWVP?=
 =?utf-8?B?Qm5qbCszc2Jxd3R1NWtRQ2Y3SkM0cWVERDUyZjFLNXQwRVErTmJXaFdKV0J1?=
 =?utf-8?B?Q3hsOWFvQWhtUnQ1aGdnRHk0aVVvOUw4VFBvZTNzZnVDN3dxWFBqRkNVN2I5?=
 =?utf-8?B?R0gyMFpCMUhsQk5jWW1ocWVoakFFbFZWczZVcHlnMmRFOTlqdVFjNVhpVkNo?=
 =?utf-8?B?UFpiSldwT1hpN1J6MVZZd3ROeHZtWUNpaWhuVFh6Sk1zdnZKelNiMllGWEdW?=
 =?utf-8?B?eXVOVEZNZ1AwMU5FUHNHZFFjNW4rUW91cFpRVFQ4NHRQU2pvQkNLUW9UampC?=
 =?utf-8?B?OUFmakx4b2JCYThxdWk4QW9HeXlmTHdZeE1JTnRxWHc1VVpMY1JLOUxKZzdl?=
 =?utf-8?B?RjR2d21VQXZZbnZBUWVPeUFBaU9SckgzOHBsemxMTUowV20xelRtZG01T0tq?=
 =?utf-8?B?YzRQWHBPT2FZTjVBeDBoTUFRQnlWeHFlSnZsYUxtWGF4VklKYU5XOEt4Rmcy?=
 =?utf-8?B?MzgyRlB6cEFraDN0alU2cVBGdlpYckF6WkVHMVhlOXFiaGFEZmFZbWtTMll0?=
 =?utf-8?B?UlBURUdoRUJncmVxa0x3Y29adjdiOFBNQTRRbXI2azYyV2hpaXlHOWRNMXNY?=
 =?utf-8?B?NTFLVTBwa1B2bDFTUDBua2Zjbm5TMHd6akZvNmd3THZKQk4za1BLeHordXpk?=
 =?utf-8?B?TGlVSmQxeHZrZGk1bXlhc2ZnSEZCbnk1a3J1MXJaaCtWOEhVUUdiSDhPbnF1?=
 =?utf-8?B?ZVNVYWY3M25uYjZqUWphMVZTM1Q5TUwxRmFXWjVRd3M3Rkw1dzFnbEJhQnl2?=
 =?utf-8?B?ZTNjcjJ0VG81cXFJTXA2bUxWbzkvNXdwRGVFOGs0emsvTzNzVVAvQTRic0dQ?=
 =?utf-8?B?RXk4VE1oQUR5c296WjBHQk9MU01XN0hkSXBHbFhPeFJmWXRDdzlLREtheVV4?=
 =?utf-8?B?T3o1SVQwU3MwN0xiSXZmcFVnVzZxb3lvMHI5bTNlK25CT2srbTBjalExcFQw?=
 =?utf-8?B?Y2hhTDJIN0w3SU91RmVwYnZlaytBbktJQkxkUmtuRGlod0JtTmFnR09paVBu?=
 =?utf-8?B?emRnaFhPM1liTHpmRXRMTVl0aWpYTzVOeWJTRCszNU42RlczYzVGVmZ6aXcz?=
 =?utf-8?B?cnoxQzMyUjZ3YUkwRGJzbVFZYTRDL3lmNkR3cXNQZHJOM1gyQzR3OEdUaGdG?=
 =?utf-8?Q?D7zBaTpAtZeAqgBFbRl9RtRc1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DCSlI8oiPOZTywn+VkRi12nGqFV+aPcton0b2TIVTJF4C3/w8ZzPYJaGMcAwo8+qaxvqoCXOjTxoIOTSHkEha5yLnNuDZi6rujQDlr+hDw3LBOaTceBJhBNxR3Kov+N1EcDwZIxfkS8YnQb7l2qn5vYmtMEXmerXYwB9wt0f08CAw9C60EDuXJupHaeiIyTO/U+w4C9Yjq8lPwzA7EFFvUUtF7lqtKK+KUF5BDKnqjAXS12uaMnY3TUWNfmhRaMDzGazsLlxEuHznYLaMj2UzvtCzHRQbT0eDXnz/FfOb4qzCOicnt/ReCsVJdZzSnMk5Pmskv8+KsfCyBgcGjNvx8OJDSfeKJILP/XdaD8Sfb6Zng+xszMoHrrRpTSR0u1tEVNDOQoW50NzsfI+vaWOIMVfstbez22buwJclrM0xyOSxKCvTHy8fUHmiosVZtaX0uqHkv864HkYOxq5VR9zbwBQiLhofHhQgHBC+6DtxORK1GDzfusVfVVob7070actRCo2tTd5U7MbGzbdqfnn84M+lHPIuInYFX3O+t9JkN8HymyQAXc9Hde+vGYQVXacEmAsz8fAPLPt5fI4EY3sQEZ/nEBwvkKln299RF3zbcLG3RcrCkL59N2mSkGftWef
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8d1f47-8595-424e-4a84-08dd3d9c0fbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2025 23:57:44.4086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXAbKEQPZVoqgtWu6ErFtHcrc7Hz8NzfQ8W8+GhfCKxcYSEhStkVJSwK30t55DTr9TZbsLAJPbGSyWOPYTgsJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6476
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 23:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210271

PiB3aHkpLiBDYW4geW91IHBvaW50IHRvIHRoZSB1cHN0cmVhbSBmaXggdGhhdCB0aGV5IGFkZGVk
IHRvIHRoZWlyIHJlcG8/DQoNClRoZSB1cHN0cmVhbSBtb2RpZnkgdGhlIGZpbGUgY29uZmlndXJl
IHRvIGZpeCB0aGlzIGJ1ZzoNCg0KQEAgLTY1OSw3ICs2NTksNyBAQCBXSElDSF9YVEVSTT0kd2l0
aF94dGVybV9uZXcNCkFDX1NVQlNUKFdISUNIX1hURVJNKQ0KDQogY2FzZSAkaG9zdF9vcyBpbg0K
LSAoKmxpbnV4LWdudXwqY3lnd2lufCptaW5ndzMyfCptc3lzKQ0KKyhsaW51eCpnbnV8bGludXgq
Z251YWJpNjR8bGludXgqZ251YWJpbjMyfGxpbnV4KmdudWVhYml8bGludXgqZ251ZWFiaWhmfGxp
bnV4KmdudXgzMnx1Y2xpbnV4KnxnbnUqfG1pbnQqfGsqYnNkKi1nbnV8Y3lnd2lufG1zeXN8bWlu
Z3cqfGxpbnV4KnVjbGliY3xsaW51eCptdXNsKQ0KIAkgd2FudF94dGVybV9rYnM9REVMDQogCSA7
Ow0KICgqKQ0K4oCODQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5K
SU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9h
ZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpD
T0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRz
dS5jb20NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5
IDI0LCAyMDI1IDY6NDYgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQo+IENjOiByb3NzLmJ1cnRvbkBhcm0uY29tOyBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBMZWksDQo+IE1hb2h1aS/pm7cg6IyC5oWnIDxsZWlt
YW9odWlAZnVqaXRzdS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIFtPRS1jb3JlXSBbUEFU
Q0ggdjNdIG5jdXJzZXM6IEZpeCBpbnN0YWxsIGNvbmZsaWN0IHdoZW4NCj4gZW5hYmxlIG11bHRp
bGliLg0KPiANCj4gT24gRnJpLCAyNCBKYW4gMjAyNSBhdCAwMzoxMSwgTWluZ3l1IFdhbmcgKEZ1
aml0c3UpIDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIHVwc3Ry
ZWFtIG9mIG5jdXJzZXMgaGFzIGZpeGVkIHRoaXMgaXNzdWUuDQo+ID4NCj4gPiBCdXQgSSdtIG5v
dCBzdXJlIGlmIGl0IGhhcyBiZWVuIGNvbXBsZXRlbHkgbW9kaWZpZWQuDQo+ID4NCj4gPiBJIGNh
biBzdWJtaXQgYW4gdXBncmFkZSBwYXRjaCwgZG8gSSBzdGlsbCBuZWVkIHRvIHNwZWNpZnkNCj4g
PiAtLXdpdGgteHRlcm0ta2JzPWRlbCBpbiB0aGlzIHBhdGNo77yfDQo+IA0KPiBVbmZvcnR1bmF0
ZWx5IHRoZSB1cGdyYWRlIHBhdGNoIGlzIG5vdCBhY2NlcHRhYmxlIChJIHdyb3RlIGEgc2VwYXJh
dGUgcmVzcG9uc2UNCj4gd2h5KS4gQ2FuIHlvdSBwb2ludCB0byB0aGUgdXBzdHJlYW0gZml4IHRo
YXQgdGhleSBhZGRlZCB0byB0aGVpciByZXBvPw0KPiANCj4gQWxleA0K

