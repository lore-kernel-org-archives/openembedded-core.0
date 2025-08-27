Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581FCCA0EFF
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 09:57:21 +0000 (UTC)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com [216.71.156.125])
 by mx.groups.io with SMTP id smtpd.web11.11078.1756288631693646344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 02:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=xg/zNv3T;
 spf=neutral (domain: fujitsu.com, ip: 216.71.156.125, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1756288631; x=1787824631;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fs3e1VNp20NKaMwnIwad2F8n0FXxOt4TOTECCC77Upc=;
  b=xg/zNv3TZByXg+6opT2QQolalPPHTzGj4+ITdkst9NRC4VtH8PhH94lL
   zKnZ2KKxrpbcWPT97mKg9C4QsdZxedDATQabGZuOW/14mBeCP3ZK4sQtm
   HK5y1vzxUUPAQyTAs/tlisHKE6eqU5ySKbgYlNnDjqpzjLrxwctuLC7A0
   6D6kZoTGbvJcEOu/GWJqwZNHz3qftFhlj8wtBxORkz9RsB8Cfy8x5lmTc
   Mndg3OsSxk8KkslH1gUwjU0td/q6aHIT3M6yaPMt5VPNGXHXeAeWE2CF1
   qQcxwrb4Z9NxF7pXBNfk9dX18wICjQ1ffSvaye29gynaF6uVPYP8ZWuQb
   A==;
X-CSE-ConnectionGUID: ChlK5ZHvSqWaEglaZXvA6g==
X-CSE-MsgGUID: g2eAFsJ7TZCZtzT0yRJtXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="166003724"
X-IronPort-AV: E=Sophos;i="6.18,214,1751209200"; 
   d="scan'208";a="166003724"
Received: from mail-japaneastazon11010018.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([52.101.229.18])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 18:57:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoTiNNuDQmFfg3Vr8pBsvezHF+tYphF0l8rt1DAuMKSRCWGhiSkLJWKgHouJosuEug9NXziywWSWSf5ghOtJx2CE3YIhb7HggQCXue9NUR3fdBYRAMOapZZCMi2YjGk0jTWutcfbSfd8JChWXenroKOn7WX00BAsOLM48eVaAYDaUU45nRCtWiznQJbsmqemRtnEceC4sQgOOwKzhmoSHVnbvqPl6hQZosbRpJCfGO1drqYYsJm7jyUr4G1sRME2bUcbTWrvLfoq9h1dZMthBuGSEI8qmPzwfkBL0rsO/FDwhpIjEyXgYxU850Y1ovoxhunWKwsuiHSOTlSbUIOmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fs3e1VNp20NKaMwnIwad2F8n0FXxOt4TOTECCC77Upc=;
 b=n/qC/ZW4ntvTM/FKP8viPGcnS81pbispS27C7R2oAiNkvueRLBOFbesBC9npQeYj1+pM/nP28DYg5dgMOfPAeg0+LRxP1VoxgxIiUAgC0OhqA9QGbpm1JYGpI2IPlRwc/JVwNF1Ph1retge+YT3ZbjGS0bVbNobDs45qNsOKhXLaAvXHbF5I1KWU+1MgPpTiDI2xnSyxzdr4moSU70OH/8+KlHUe2UzUpL0c+uae1DW9elQpub1E62zoUvoK+DbwjgNnKnI92q6vCWaO7nT7ZP3mXtgGFLxxws7NZm6MWRvSo9U7cWCWLIeF1Jhr4c7969lwZ+HQKR0rggrrCgn0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYRPR01MB12714.jpnprd01.prod.outlook.com
 (2603:1096:405:1ba::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 09:57:04 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 09:57:04 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] readline: backport a patch to fix issue that
 readline can't work with samba
Thread-Topic: [OE-core] [PATCH v2] readline: backport a patch to fix issue
 that readline can't work with samba
Thread-Index: AQHcFv9yWCQnPEDVW0qZPNcrHrty+rR2PMwAgAACkfA=
Date: Wed, 27 Aug 2025 09:57:04 +0000
Message-ID: 
 <OSRPR01MB11597A6291EC56E26434971F99B38A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250827030517.1402-1-liuyd.fnst@fujitsu.com>
 <CANNYZj_Bzg_q7-j+FNv_gGo43-tOYZYFerj35_h3PGfeNyX+tw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_Bzg_q7-j+FNv_gGo43-tOYZYFerj35_h3PGfeNyX+tw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjFlMjU2MGQtMDZlNi00MzRhLWEyYTQtMjY3OWE0ZGZi?=
 =?utf-8?B?MzUxO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA4LTI3VDA5OjQ2OjAwWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYRPR01MB12714:EE_
x-ms-office365-filtering-correlation-id: 388abf46-5334-426e-29ef-08dde5501390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VUF1QTRkWjdNSHU4ZlV0ZFNhQVdlRzJQYlpWM0pmYXV3WjVKMTNxUVdSNWxM?=
 =?utf-8?B?NUw1M0tqVnVVZ2xIdzVMbVpkR2J0UDBnWms0K2cxbzl0VS9UWUJzS0g4M1ZJ?=
 =?utf-8?B?M3FJb05Obnd2NERXVnZzN1F2ZmczK0xYWlpud2FHQnQzUXBTQ3djUytJZHJh?=
 =?utf-8?B?bVJEU25nOVZEdVc4MzFyNHdxRDBWcEJYYldUWHNEejBGUnVRZTdWeW9HY0V1?=
 =?utf-8?B?bnFmRVRoT25XRS9tSnZoaXJGL1BiMXU2YklPRS9jS1dMQmNnY3IzSUxqS085?=
 =?utf-8?B?MnVZbGhjT3lmb0hJWHpTRklUbFRiK0J0eGk3Q1duTDBJR1JiU053ZmlkaHNX?=
 =?utf-8?B?YXlleW56WHVlYTNaS0tzM2FqVU80VXRZUFZVUFVDSUVSN1l3YVVNNW9iR0tw?=
 =?utf-8?B?L2Rpd3JnYTU5Q1pjSm1SdjVZR1NJNGJXeDlha2E5M28zTGtONHp4UjIrc05p?=
 =?utf-8?B?ZWlBY1VaYmxoczNMZmtMU0dPUDFYbUR3M0pOVWI3Vk05d2t1QmZsdFpId29Y?=
 =?utf-8?B?RzFValBsUGVnOHJtWGgvV3BFbGw0UVNvVHdtN2ZmSUdJc3VIcEkwMDAyakJN?=
 =?utf-8?B?RTlQU09yWSt5N3Q1b2MwN1c3UGM5elY3VTl5YzNqZ0VpcStURlJtajZSaXZH?=
 =?utf-8?B?RklmQUJXNHBrL3NqZjRDZkdXdDZ5eWd4V3dwc3N5WjI4RmtwSVA0dTJFblZW?=
 =?utf-8?B?OGM3K2NqZ3AvMk9xejVWMWN5Q2VIanU2N0tLWEhpNDN2VlNTOTFBWWUzZEVv?=
 =?utf-8?B?bkxWbU5qWU52YjJhbmc0S3JEYURpQmg1QlluejR1Uy8wRFo5QTZPUm5EUjNS?=
 =?utf-8?B?NStmWGdjVFhnNTJaNG52djg1QzlhbEF6VHZYR0tsZG83NFprbThMTVd2WmhL?=
 =?utf-8?B?WkFjRHhsVG9sdXQzRzBSeURTOWZydmdOSGdRV0xDZjdMdzFsRllZdzJ2U0tP?=
 =?utf-8?B?T2RWNm42MzI4K01BdVF2R0NtN3J2a3JCdjJqREVmcnNyMHVPOTB4RUFMWjZm?=
 =?utf-8?B?OUJGVEFRSmR5YkxtalJaOXNhRlFyRG1VYSs3bUNzSXNKOFZzb1RLSDY0U3pu?=
 =?utf-8?B?cUhRYnplMThzUENHMU9oL21WdWV3S3FJc0hFb0gyZGRPMkZKNFV5VGg3UW1F?=
 =?utf-8?B?Qzl4R2Q5bVJiYlN0M2JYb2phVzFvaDRnZ2NVdktkMXArSnFEWWZnUCs0S0Jp?=
 =?utf-8?B?enJWNW5KbjVydE5jcldkc2IwRW9JSG40SVp1Q1BXZWFuYnBINDRpVDh0OUpD?=
 =?utf-8?B?VGs2c1Jud0VWR09EQStaYWNQaTVRNUJPaGl0SGtQbFkyVGd4bHdobDkxbkxn?=
 =?utf-8?B?RVpDWTNTNit0MjNZWTZ4dUZwa0xFWlRMczRTRWNSUEd0cG9iNHZMdG5FMG53?=
 =?utf-8?B?NmplN3o3TVYwa1Uvc2NEZWcxUmFCYUp3cFI2VkJSbkZ3TVVkb1plZWs0WkNK?=
 =?utf-8?B?bm5vbTJSZUZPTHJrWTNRbjNUUU5ZOXhvQllxU3JqVm04dDk3NWhDSTgrOHRZ?=
 =?utf-8?B?NDZNMGNoVktxR2FqVnYwbXpobTBuKzZNOENGRmRGaTRObEVTcnR2YkkzeGpx?=
 =?utf-8?B?TW5Ed2hrNDZqMnVRWUFpQUMybnVQUUVBL1BHRHlzZThOOTkxak9QUm0ySU5i?=
 =?utf-8?B?SXB1a1M4cEpBbm50VmhzZTZGNUxiUVpYc0toWGNiWTBDSHh5OEFzbmlBR2lJ?=
 =?utf-8?B?T2psQ1R1WkZrbzBOdHUrZkJlQVJCRnhVa0JVN3hkYU9LNnZJU1BBaVQ2S0ky?=
 =?utf-8?B?OFRRQm1YTnhXZTBXWGNnamo2K0hYVkFlL0puZXBMS05XTXgyY3QwSjVtTklI?=
 =?utf-8?B?RHNZM1BlR252cE50YkpVMFVWNnhqT3ZhV2hqc2JPSjVvZW5ETy9EdzBoNHdl?=
 =?utf-8?B?UVcyQlE2WmF6Q1RCNjBQUzhEWWxydk1iUTcvSWR4NFo2Rzl3YnljUGxhRHVS?=
 =?utf-8?B?VjB1MTUveVBWdGkwbWVpVEFFRVlrNG1sVWtBbXArUStMaEhWQ1QxR0s1WlJn?=
 =?utf-8?B?R2VpbElpUHJLdlo2WXFHSWlacTAyMXN1UHBDSVRnNWRpRklkQkEvYkRjVHRv?=
 =?utf-8?Q?vHy3rR?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGtxWWgxSTNxWW8rNUdUNmlwVGlkQ012ZG14eklOZG85UjRwMWFHMW0zNHlZ?=
 =?utf-8?B?d01ZalFmSEYreDYvaDdUR3J0OXoySHd6MldVL1N2ZGtZU1lLampReENSUDY2?=
 =?utf-8?B?R2ZNSElCNUVEcFNIWTZHNzVOVE5WWVlUSmdxZ0ppM3RHRStvcThGWFdBOTF4?=
 =?utf-8?B?UFFmcWNueCtBejVRSVFkUjY0dm1VMTBFSnNTRDBTNGNKMFRRNHJpNkN3UFBv?=
 =?utf-8?B?REsyUE1JanRoaitkQkRMbUFFMnJ4QjZyQkp3ZXFiY3VETk5TYnZHV2swTDc1?=
 =?utf-8?B?R3pwWnlnbGc1TTFOOWhrcUc1SWM4cnliMWYxVUNPSzhaMklPZXRIcFNJV1Ev?=
 =?utf-8?B?bEJEQXdJTENkY3pJWWM2YVR3eExKZkxzUi9aN1Z4c2tvN21pZjdGb0RWamdl?=
 =?utf-8?B?UWY2TE1HcndWOWVBbDFXRGdQMkdPdTM1T0hYMVVXSEZnYWltaVplamxFNnIz?=
 =?utf-8?B?ZWlianU4S3FkZUtiYVdQQzNnZUNIaTU3THpUSWtBelpMU05RQTB4UW1HV2lJ?=
 =?utf-8?B?Y1NLdjEyL1MyODEwcjRMZ3g4aXRCVlVWSUZqemxSTDZiZ1JlaEEvQk1TOFl2?=
 =?utf-8?B?THl1djR5OENhMnNreUJhempIeUJoK09Eb3dOcm5Lc0RxNFd4S3A0eXBaVUdv?=
 =?utf-8?B?SWhOR1pnT29TYi9wY2ZQY0ZiYVljTWpKVmpJSlRHRzVwSmRRRDVOdnV0L0RP?=
 =?utf-8?B?TTBobDBjVUl6YTdRNzRaTjEramNJa3ZoWXdpbERURUR0aGNEdWFxbWlGSlN3?=
 =?utf-8?B?by8wU3pGOEZtUDJRN3pzL1lqWVRzYVFIS2JjenQ2UjVrdkp5RGlXOUlJdEs1?=
 =?utf-8?B?YXJ5ajRhcFA1OWMwYXlkM0ViMjEySjVFaXhHcFFuSnppSEVpL1N4ZFlNaVox?=
 =?utf-8?B?K0hpOUVQV2hzRGRaRCs5YnpROVU2Z0o1YTdhSW14ZzNObXFneVZhbnkyRVFZ?=
 =?utf-8?B?RlpMQXd1UkwrZnE2U05Ec3hMdlBJVnJ6SXNCUjc2ZHFQbm1ic2VhYms4Q205?=
 =?utf-8?B?bktzUlliN0NlOHZUS2xTTWlsZjI4a1Nma1JkSWhFNmFjREJ5RVgwZ1FSSEZq?=
 =?utf-8?B?YS9Yem8vSlc5YXBmMWRjRWN4dnE5dnJ2QzU3Tk50aENqYlRJWG5lMkJUU1R3?=
 =?utf-8?B?QloyRys4UmhHK1ZQdG91YUtjTFZZdkJ5ZnN2UzF2OWtJUzcreVhWcDFxN2F5?=
 =?utf-8?B?QVFCM1BHSlQ2cWFXdGUrcE5TQTlsVU5QSVVvbUg3c2Y1WXQ2V1plTDRnM3Mv?=
 =?utf-8?B?cG9nL3hHZ3hLSFBCS0xBTS9VbW4vaGxQVXpLcGlPUDFKdXV4c0FlcHMxUWhI?=
 =?utf-8?B?cGVOY2M0aDgvWFpteUxOTkFvZURUejBrY1JsV09yT3FoSnZyTkEvV21UZmkw?=
 =?utf-8?B?b0xpVlNvNStFMG9wcXNFVmpSWm15akN2MEROd2prMDVDNlhOaWpKZmh0QnBw?=
 =?utf-8?B?RlBFMy9rQ1NpVnBRaFIrektQUHJKRkJieVZjUEVMOUtMbGhPUUVKY2tlWlJT?=
 =?utf-8?B?T1dvdXNhenFSditCdnY4ckVxdHJZWlNKZ2dONVRNc09SVHY1N2l2Si9Lckly?=
 =?utf-8?B?Nm5RSkIwM1FBNWdqbVdjbFhDUlNqNlEvTklIbkVXdUQzT3NtMjIveEVhc2hX?=
 =?utf-8?B?NXRYWUp1Vmd3cXduR00wbnY1d3JybHJ2OGhzVHdOVWhzb1FyaFpsMENvbEcx?=
 =?utf-8?B?TUQxSS8vVmFRRkl1ZDE4TUc3Tkd2YTBHVUlINTVhcDdqOFlrQS8xL3RVSHB6?=
 =?utf-8?B?b04xdk5YOWFqRWlieGhhUTViQmh6cDFWUGozVTZTZU9oTTMwb0h6RkNQb045?=
 =?utf-8?B?OStVT1RuczFHL0k0MXZzVDJ4MTZKLzZicmlRWXE3Ymk5UjZsM3BGZzROMExp?=
 =?utf-8?B?TkxOclpCcXlPMXJ3UCtzVkdpTE4wNVZob0M5MXpIR2ZBZlJ0ZGVGY2Rka1hy?=
 =?utf-8?B?Q2hBWWx6WkpZM1ZYendOZlA1ZlJiTUttQUcrZDlObnhFUk9MY1c1aEdDY1FE?=
 =?utf-8?B?SHJaai9VV2g0STFMWklJWE9sS3I1YWlZcU9TalU2WFNBdUNFWVZKVkVsNHpy?=
 =?utf-8?B?M1NkYWd5QU5mb2JnbjRBWENOZjdnZEY0Y1VPNXg5b3FUbGd1NENaTlJlYUk0?=
 =?utf-8?Q?L9CP3gF+6lqc1sZjkCw3qABXA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EBES6xDCnToJtczBQomzqpf83oiWs7Iz/NyDjXZLTNBK56DwoxqZMJh4Ee220/byrC/SgV3lkPn+mhiyMICGM460Mt1i60LsZKq/p59is4zRIBTfmx88lwnYu0C+EcIVvG7ccxRtKDbtcxSEJ+o4H9yFygoLQJKoo/96srwk4vNSJoNFMcFXKF9r3uYVuFwsfA5knHZL3YjDkD4Rko2WCfqHoIssR0j/NGXvrmhST3EAnmZDCMG6BMHk+4mseOCyHISj3Upqz/0iMP/XGWtTO9Cvl1vd23y7cMS0nKMZwCl8QhF/BwKkwUnPyhLTH4JXFHQ4nwl3gfnTt6NjzMaU1SmOHLxho4sAcqrUy0uByoGEuy0S0fLNyIoqr/Bm79WPOKf/lujggyMZfXEJTk8AetZ7CkOosFsnfto9ryWLftXdwLKOBHyp/MLekKmE7DcMETCh+RikXCwi1a82zEywSBtr6q6FEF7sxhOncc9wP2FZIg2W0hDzWliS5jow7f0djVBKgZYRUjNI0H5QCOA4JMaJ9EqxKXgWvP+wJxwI6+M525xvk6mF/RwAKCJW9tWfkq85INKHMYv4SiirPph3JbGyOy0QWBwdX3OC60VG/RxPVVKwZuYqieL818GyouV6
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388abf46-5334-426e-29ef-08dde5501390
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 09:57:04.4404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1O5HUb9GvzuOMS0/tcFzCLmjwKy9N0VEIWw2UPPp3hNkNuiS/DKgmjrKn1hK2++53cK9IBCIaTfxov7yRQTVNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12714
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222503

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDI3
LCAyMDI1IDU6MzIgUE0NCj4gVG86IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RA
ZnVqaXRzdS5jb20+DQo+IENjOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21haWwuY29t
Pjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIHJlYWRsaW5lOiBiYWNrcG9ydCBhIHBhdGNoIHRv
IGZpeCBpc3N1ZSB0aGF0DQo+IHJlYWRsaW5lIGNhbid0IHdvcmsgd2l0aCBzYW1iYQ0KPiANCj4g
T24gV2VkLCAyNyBBdWcgMjAyNSBhdCAwNTowNSwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGxpdXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6DQo+ID4gK0Zyb20gMTU5NzBjNDMxNTE3YTA0NjA5OWQ4
Mjk0YzkxZDc3OGIxZGE5YjI5ZCBNb24gU2VwIDE3DQo+IDAwOjAwOjAwDQo+ID4gKzIwMDENCj4g
PiArRnJvbTogQ2hldCBSYW1leSA8Y2hldC5yYW1leUBjYXNlLmVkdT4NCj4gPiArRGF0ZTogRnJp
LCAxMSBKdWwgMjAyNSAxMTo1MToxNSAtMDQwMA0KPiA+ICtTdWJqZWN0OiBSZWFkbGluZS04LjMg
cGF0Y2ggMTogZml4IGZvciByZWFkbGluZSBldmVudCBob29rDQo+ID4gKw0KPiA+ICsNCj4gPiAr
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiA+ICtbaHR0cHM6Ly9jZ2l0LmdpdC5zYXZhbm5h
aC5nbnUub3JnL2NnaXQvcmVhZGxpbmUuZ2l0L2NvbW1pdC8/aWQ9MTU5NzANCj4gPiArYzQzMTUx
N2EwNDYwOTlkODI5NGM5MWQ3NzhiMWRhOWIyOWRdDQo+ID4gK1NpZ25lZC1vZmYtYnk6IENoZXQg
UmFtZXkgPGNoZXQucmFtZXlAY2FzZS5lZHU+DQo+IA0KPiBQbGVhc2UgZG8gbm90LCBldmVyLCBh
ZGQgc2lnbi1vZmYtYnkgdGhhdCBoYXMgc29tZW9uZSBlbHNlJ3MgbmFtZS4NCj4gVGhleSBkaWQg
bm90IGdpdmUgeW91IHBlcm1pc3Npb24gdG8gZG8gdGhpcy4gWW91IGNhbiBvbmx5IGFkZCB5b3Vy
cy4NCk9oLCBzb3JyeSBhYm91dCB0aGF0IS4NClBsZWFzZSBjaGVjayB2MyBvZiB0aGUgcGF0Y2gg
Zm9yIHRoZSB1cGRhdGVzDQo+IA0KPiBBbGV4DQo=

