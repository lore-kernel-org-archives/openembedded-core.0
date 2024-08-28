Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2D7C54756
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 09:04:43 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web11.9200.1724835879460604337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 02:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=y63vWlnL;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1724835880; x=1756371880;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=txs6WNgeIOBEBkYjSe2SBGwmHh+XKRBskEE/oXKy+xs=;
  b=y63vWlnLbNniAakK57aeSYyCK3EZRMx2IeQ8/zey7YMpsrhTgORN7b2D
   MC255GXBTxO/lQp5kr3p5/bnaqa8JckNsEANiVU4C+8UYlmBX64deTU9j
   SYgRoE9LWLsf5/Zvt5Z68HSF6gQPe9HGY2q0P8Hda4o+F9njjUbnw7zxT
   jI7gRIvnwlGg3IebIX7kzdjoXaZ/QmdcFSX3jWMy6V+rNczPGAgZgxSsS
   iYwDtEs2Y+cQAEAcNVnWnRChOmeMxNsMfOHj/ANjvmWTqyKuEL8uWLG9J
   ZrEeVPsGeUb6wIoAYJpjZ0+Fu0P6BdklvYxEWcPCHuUCHsxYsiwGmoWP/
   Q==;
X-CSE-ConnectionGUID: JbrzT66EQuOgfrjO7+UpQA==
X-CSE-MsgGUID: xXWbGLOwRi68CZRCKc+71g==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="129578916"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="129578916"
Received: from mail-japanwestazlp17010003.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.3])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 18:04:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb699433ktsjH/bFAGhWMmdf+crqvKU3r8Fw6dz6bQbzhcoGlGXbnssQDTfdjmZ8XaKzOBE3jc6WY1kE2IRqx3YFjeP2ITzdVhD2+PknjBQ3vUAYcAdqmTYhKFVLC5HH1GAfKxtAhbkJtYpCud7mGXemNiDSAQ2iuAPbaCaDLoO61ZyuJw0wzuqrsgUZOVyCBJfbx85lUJXmi1hdxpTAgKNw+c3KVkTxNXapMEepOj2KqmQbZ7zcftVHEQV6bQ43CP3aX18fsShDug6Delsmz43r2ACeDrVLFLr3T56eYWpAe7K2qzZzdsW72uO2o7nqHzF3A/e21JXOMqH1uUdA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txs6WNgeIOBEBkYjSe2SBGwmHh+XKRBskEE/oXKy+xs=;
 b=i5813VXO6ASD7HiuKyE7eb7SpiU2Yysl88s3hw/XTMmuRdnH4VhJ5hYGkFpZXS6oASgG37THXnR65+dawc9aWrNFn/X8Wh/ItO5UcS0xBxZtWRHTaPsy8bFHkQU8KNbACAWqTp+zn4/5MbOglkDftbD2ZVyvKgktmX9haX0VwZmCyneyw2IeJqv2qg4Z62+1C1JLetSQ3NNWhE3Voii5KLT9OWoVCXc4AYaYmNDArSn0YoEpwuh5rnZLor4B2DUgl2MUXZpZSGmEaU94j2IXVQIrAa3edoQA2ZeESNNXukthTOAliiskIPU7W7tNK6egfBShXrhA68iWJRYBq5az2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS3PR01MB7828.jpnprd01.prod.outlook.com
 (2603:1096:604:161::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 09:04:33 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 09:04:33 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
Thread-Topic: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to
 solve conflicts with polkit
Thread-Index: AQHa+SVOBmoTIhBWCEaVtQtu7OseBLI8XT3g
Date: Wed, 28 Aug 2024 09:04:32 +0000
Message-ID: 
 <TYWPR01MB11861DF67DC120A05FD4373A6DC952@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
 <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9KSfNg=VOBHqFAFOHpoGTPJe7s8rEii-gDxp-t5K=Uig@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=36a9827b-e4c9-405d-abf0-accb31b155d7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2024-08-28T08:53:34Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS3PR01MB7828:EE_
x-ms-office365-filtering-correlation-id: 3354c9bb-cbd5-4279-4b7d-08dcc7406ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?T2VIeElUd1JjcUh5Y3hzQ2NjTWhQeVhGVVI1cy9ITjZJQldjMjd1MForTHZl?=
 =?gb2312?B?TDJjdE81aDc3NUNkeXk5Ykc2VyswUWdYMlVoV0VWRjhjUnB2Tk5JdGd3eDM1?=
 =?gb2312?B?TVVKWU5wSGJiRytsYnhaWHQxbSs0bUNDdUxzdmo3NUQ3V2tXWSt6bnhya28y?=
 =?gb2312?B?SlNXSkhNYW1aaDE1eFJoQ3dwSi9ETk4zNGI3VjluOE1LR2U1aVFyVmtYQitv?=
 =?gb2312?B?Vk5IVWJMb3ZWakx4WVRjU1AzZmRhaXMxT3pWWU1EQ2dkYTkzRTMvRDIyL1BW?=
 =?gb2312?B?Mmw4NGwrVmNPVFZsM1lPRG9BWnhsdjE4U3g1cDNBWFJtZlR2Z0x3ZjRNZXAw?=
 =?gb2312?B?UUZQc3NFdkdONmtZMmN0WGRCc042cXFPVkZnRVkyTW9lekI1MzFRd2JyK1Bo?=
 =?gb2312?B?NWRuaXlpNSszV2tjOGRaL3RHRWhnWkZ6Zzk4aCtCeVkyTDBjb21teE1ZbDZH?=
 =?gb2312?B?TitqMzBVdUI5dGR0eEh4WlNPOVB3Tk5jWXljOTkwTXJlTUNKSWh2a3dub2tF?=
 =?gb2312?B?VGQ5UzFZeUdvTDFOcko2RkxGYnp1eWlBWDZzZW5mVUVmdVh0OGwzTjl0cWdF?=
 =?gb2312?B?RSt2LzdGSzhlRW9OMllsclZJMEZ6aGl6UzV2S01taEsrT0dwdDJnZ1VNZ2pK?=
 =?gb2312?B?QVp3RGJsM1ljS3lJMTM4aStlL1JrU1loa2dPQmZlOEptK0o5dnlKNkNTSXBY?=
 =?gb2312?B?TklWUDRYRVR1ZHlYOGJOYy9LSEhZOW82aHIrbjU2WWFvWlhUck42S0J4QlI1?=
 =?gb2312?B?RzFIRGF2R2xEL2xZMTM5MzlQRDhSRmFtNnVwdkNOUnpINXRqbk1KbzRkcmwz?=
 =?gb2312?B?QUFLS1hwVWs0ditHeUEzVE9QVjR2WmNTTTJWMktxRXVZS3psa1lFb2lVa2h6?=
 =?gb2312?B?TlYxRWVlS21nMHBOV1J1VnR0ZmM4OWVYZ0tFbU5oeFpac0Q3S0JaTndiQW4r?=
 =?gb2312?B?SE9DNXFSSnpWUHEyRnpiQXQ2d3lsMmZOSitRdFRDMnlLMWZ2WEZ0ZDVET0RM?=
 =?gb2312?B?THg3c2FRaHd4WnluVFJJQmhGT1pVV1NlZldZSlhtNkxQWmR1a1lDNTgvZ255?=
 =?gb2312?B?L3FTb1JTV25rVXVYZlVlRE1xdVZ3UGJZeUk4Tkt1K2gxdFFxVHFwcEI3V05k?=
 =?gb2312?B?WjVYUktxZEt1Wnl2RWZyWDRPVjNMS0ROWHVYZzQ0b0hFUHFFcVN0VzgxME5t?=
 =?gb2312?B?K3NCRS9qcVFkS2RIVHpJYlo5K2hFYUYwSDRrTDN0MUtiYXBqa0I4dFc4VjJB?=
 =?gb2312?B?ZkRuelNWeldHL2ZUZ3I2eHBRVmhLV2g4NkNhdHNub3B1SFU1TlNTbGdsZ2Z2?=
 =?gb2312?B?Q2lNUitPNUlQZituTHMvN2tRc25vMzhqUWpHVUZKTHRtSWdvRE5mdFJkVzF4?=
 =?gb2312?B?WU1CQ05ZVXFrVllPYzYzQzFaMmVLZmV2RDl5bzhoNEpOSk5zaHNPRmU3bnNY?=
 =?gb2312?B?QlEvMjdxYndXYWxla2V5VWJ6Qlc5c2FqUnNMT3Y4azgrdk1NSWE4bXhNa0pi?=
 =?gb2312?B?cDIyL2xSeU5JQUs2NTk3OHQweXd6Q0dYMVlTWmhnTTkxZ2JpN0hxOVErK2Zz?=
 =?gb2312?B?UXZ1MmpmSGIrOElHZ0VYZG9RbkpUQXVRWlEyWHhVQWVTTFV1SEFDVm5hUGND?=
 =?gb2312?B?cXpPN3RJVXRBMU83L3BFaDVKL25VaWZwd2l4Ly9xUXJEV0wyOXg4TytGRkdI?=
 =?gb2312?B?NkFEa2ptRVFiYzBEenR2d2RLMU5SbHNncHd2NlpveGltVDlaUTVTWTdNcTVz?=
 =?gb2312?B?dHlyZ2NaK01reGluT3lLVWxiSm1meGhSZ2U2NUkvZzlUeGhkaFBDTXFzQUl1?=
 =?gb2312?B?S2p3ZTdGVTFQNjFSeklvVmk2RWZnSFpmdzZ1VXNPM1lqckg3SU95Z0dzcTQv?=
 =?gb2312?Q?WIcO9gsuC8BQt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RFRVR0hzWWdrbHdlQ1pxL2RiU2lhM0hnem05ZnpyTjM3OFBGdXMyeDYxWW9v?=
 =?gb2312?B?OEs4bDNKZE9xakwybEdQdU9PS0FTWmhBWkVvNnJ1cXBsRGdKZUlpQVhVZzVu?=
 =?gb2312?B?aWdjZjNweUtPcThUS01BbFVwTmV1NWxJNVY1TlpFdEJwUGVwOG1nNm1WVFRJ?=
 =?gb2312?B?STMwbWJtdGt2SkFMZGIwL0lPNG54dXFwWHVXK1BLRXB4b3dYaTJJNUtNMGpl?=
 =?gb2312?B?U3phUHZYMk5tUmxNczZTQWkxdFphQ0xnV1orcWpneUsxdDgwNExSNlBEbmdN?=
 =?gb2312?B?VEdOaVJMajJYUkNHenc3disyV0srQ2F2Qlk3YkJzRWhMZ3E0YWc4QTlEMWN6?=
 =?gb2312?B?b216a2VkdEVSclcra25jSzNpOVRqTnF0WWlsN1A1Vno1eSsyV3hKeHdOUDhH?=
 =?gb2312?B?SHdHb05taldlRU82Z0Q4bldSNURkamxlMEc1SDhnSkMxWjRFM1Y2SUVxbDJo?=
 =?gb2312?B?bkRrclJCSXhXYjRDU1M1dDVjSFZhaWkxZnUwME9VbUhoNFR0VDQwd2VoOXZK?=
 =?gb2312?B?OXBoeVkwSjNpc2RJVk0vZnh0YnQzOTdkWVpDZk5WcXE0L0JFMFZoV3huakRQ?=
 =?gb2312?B?UTg0ajRINWN0VHJPWHNTS1FSSnE4bnJJV0RJNDcxQ2ZFRlBLUnpCaTF4Tlln?=
 =?gb2312?B?SUlqRkM2eGY3ZTJsRXlodVhJZHpibWdXekFNQkd5U1BCQ3RxYXpKV1I1T0JE?=
 =?gb2312?B?emdvNkN2ZnBJN25hSFpFYWw1NVJtK3R4TTg5WjJaSk5McUlxN09nT0RZOHVY?=
 =?gb2312?B?Q2hkaGIwWFdROEc2OU4xaXp5UE16ellnNnduYUxDWi95M2M5VG5zcmdYZGZZ?=
 =?gb2312?B?QWFUdlVWakYyZUc2VWk4UHR6VFZKekhnSGsrVSt3a1FKbWVTTWZ1R2NzVEMv?=
 =?gb2312?B?bWx2UzBBdDlmbDdYN2VRdXFTek5haGRaazZ0bEkzb0oza3F3RkI2a1RiV1du?=
 =?gb2312?B?cTdMSUgyRDJKTy81S0QxR1FReGFUaUJxdisvMHVTTFh6MjBZRlRQK05nRHdi?=
 =?gb2312?B?c1ZBNDc1b0ZFdXVlRVdBZlBxK2FWcTFuZjVPa09DNnE0QnZxZlNNY0RtMk5v?=
 =?gb2312?B?Y0F3dlRvMXpuSWNIeG0vY3lKd0ZwUUZ3VnhnUXpyUDlvNFlERWhQUWxLN2xv?=
 =?gb2312?B?TXc4WTZWVXRNN1NQdDZhcWZCMGlHWW41ckdZbDhNRnRhd2VCc1FjOTFacSs4?=
 =?gb2312?B?cmd2RHFjL0pacXh0T25ZbEYwS011MkRHQjl5YWM2V1drM0ZJU21MZnE0MmhW?=
 =?gb2312?B?aFkxUlM0cGIyT01kKzEybGhpTjNMSTIvcFVqUy9qL3NJMFVLS3VoOXgwdkxS?=
 =?gb2312?B?R2RrbmcxS2RJL3BPVm5Sbnl4N0RSUERsRkVYZWJVZWFhbHVSQ0pJZVIrTTlD?=
 =?gb2312?B?cVBlMUt5Mmdld2pBN2FoVUd4S2tYdldKVWd2NWxtLzJIY2dTa1YzckRhbHYv?=
 =?gb2312?B?VmdldTFIOU0yT3Q4RUR1VTNHVEhnTmNaTzU1eW1mSEo0eHp0bzlxbzZyUzdB?=
 =?gb2312?B?UktYcnBaQ2ROTFYwZEc5Y1dUeFRXSkFCNzFPeEZKa0pocjJSd3NidWcrSmpN?=
 =?gb2312?B?Z1JGK3lqN0FMdlo5R0hrbnVQZHh2VzEzZUZvN29ZSHd2QXE1ME14bHU2VEwy?=
 =?gb2312?B?R0haL25JNEZXbGI2NzRIdzUzUFRzTW0zNmZScFlpTTdjZlhQYVJlcnluaFc0?=
 =?gb2312?B?ZEdkRy9IM0N1T21IZE9WdC9jdTVBT0ltTWlkeE1BWGZiSnllL0tPV1B6NmtX?=
 =?gb2312?B?UzlJUW5FMXRSbVU2aTUyUnc3SytTSmZNb05YcDZ1enlFNDJONmhqbk9WdW1q?=
 =?gb2312?B?TUdBV24yaFQvQitJS2VuY3dsbmpNZmlLeDgyOStEKzlTa1lqYk80QWdJZ1Ba?=
 =?gb2312?B?R0JMTmdlLzU0b1RVNHlWTVl4UzhFY1NiSkxIdGZ2cmNRV3pXQjlVZGVkT05W?=
 =?gb2312?B?cFRiQXhHVmNkWExLSzBwRlQ2eUhPRTlzTllnNDhTaWV2SHU0K1Y2SnFETmhK?=
 =?gb2312?B?VTZxVkFCZitKeGxKejdvZ0ZQcFJ6OGV0eEJmMDJCeE1BYnBVVVMyeHdCSElI?=
 =?gb2312?B?clFqNlMzQTlHR2NiQVBDOXNDK3NPaWpxZzRidkcxMTFFNnhqMi9WNURlenRT?=
 =?gb2312?Q?aqrVH9Eek3p0+aMV4+2IEiR5y?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Mrf9vsppjtfWxm9i/BQCLjMVseQUAWkRYHQLPzcGd0Rp3kJrO52tFLBZ1WeqXO2oswKPW6b9LBa0M6s20lmNhqEO5qKE9J0JzLPRg7RTgoAZHyUVV/NM8ECmmG0reylO9WO1L20RFvn6gPWS2p7QjtSZAJ+nE6rtYsktapB5p+ZzUFFeKL1XMMK6ZaJJ7pqXTDbgAehmreGDlTN0f9Ru0URss3AUcm8e5v1CFe9g/720sZaUfpLSkU/uv9p/eJpSYQQI9wkTV2Xs+Y4hx+4R+pjyNqm8liXqfBFpYULUYld7fRkoKcdr8YHm73tvtJfG1fWEMa+m8+XnSEd6+//WCOwTCHFGA/usBeNUi2pH5zg9zKAybuvMyAWcC8DqpTuCgyEIdj+HjgmcHK9X3yuXc6vZZhK8U1EEYwi8sSq3/kvCt/Sf2zLqVMP14Z+XkLnJp82GTLtLeR3GgG85vJxBjxyFG3w7I5FzsGuBdPW94fL9WotP2pBBXkMDbHJJcYHtTXWhYCyqfZ3jWLC5SZZvixhpsS496j94YkUoYejkgrvhvJUBWUIoqp9dOWT+bmx6sEjq+N9+WeK6ifC7yEUXmFUq8JdvOgIvNI9DAm6iTDsLNrXbL1mUsdSZKUadd7Y6
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3354c9bb-cbd5-4279-4b7d-08dcc7406ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2024 09:04:32.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q5dv/A0X4pXVN9Z5OSGpMlxIl6fxdq9Y1zXdAbdtQsS34LfwBDuZrVib2n8aFgj9Yi4KeCk7taYkCM1r7oTltg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 09:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203874

VGhlIG5hbWUgb2YgL3Vzci9zaGFyZS9wb2xraXQtMS9ydWxlcy5kIGFyZSB0aGUgc2FtZSwgYnV0
IHRoZSBmaWxlcyBjb250YWluZWQgaW4gdGhlIHBhdGggYXJlIGRpZmZlcmVudC4gDQpXaGF0IG1l
dGhvZHMgY2FuIGJlIGNob3NlbiB0byBzb2x2ZSB0aGlzIHByb2JsZW0gaW4gdGhpcyBzaXR1YXRp
b24/DQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNPRlRX
QVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFuamlu
ZywgMjEwMDEyLCBDaGluYQ0KVEVMo7orODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3OTk4
ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyOCwgMjAy
NCA0OjM2IFBNDQo+IFRvOiBXYW5nLCBNaW5neXUvzfUgw/nopCA8d2FuZ215QGZ1aml0c3UuY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBbT0UtY29yZV0gW1BBVENIXSBzeXN0ZW1kOiB1c2UgdXBkYXRlLWFs
dGVybmF0aXZlcyB0bw0KPiBzb2x2ZSBjb25mbGljdHMgd2l0aCBwb2xraXQNCj4gDQo+IFRoaXMg
aXMgcmVhbGx5IG5vdCB0aGUgcmlnaHQgd2F5IHRvIHJlc29sdmUgdGhlIGlzc3VlOiBib3RoIHJl
Y2lwZXMgaW5zdGFsbCBmaWxlcyBpbnRvDQo+IHRoaXMgZGlyZWN0b3J5IGFuZCBleHBlY3QgdGhv
c2UgZmlsZXMgdG8gYmUgcHJlc2VudCB3aGVyZSB0aGV5IHB1dCB0aGVtLg0KPiANCj4gSXMgdGhl
IHJlYWwgc29sdXRpb24gaW5zdGFsbGluZyBzeXN0ZW1kIG9yIHBvbGtpdCBidXQgbm90IGJvdGgg
bWF5YmU/DQo+IE9yIGlmIHlvdSBuZWVkIGJvdGgsIHRoZW4geW91IHNob3VsZCBsb29rIGludG8g
d2h5IHBhY2thZ2UgbWFuYWdlciB0aGlua3MgdGhleQ0KPiBjb25mbGljdCBpbiB0cnlpbmcgdG8g
Y3JlYXRlIHRoYXQgZGlyZWN0b3J5Lg0KPiANCj4gQWxleA0KPiANCj4gT24gV2VkLCAyOCBBdWcg
MjAyNCBhdCAxMDoyNiwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDx3YW5n
bXk9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBG
cm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4gRXJyb3I6IFRy
YW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ID4gICBmaWxlIC91c3Ivc2hhcmUvcG9sa2l0LTEvcnVs
ZXMuZCBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQNCj4gPiBpbnN0YWxscyBvZiBwb2xraXQt
MTI1LXIwLmNvcmUyXzY0IGFuZCBzeXN0ZW1kLTE6MjU2LjUtcjAuY29yZTJfNjQNCj4gPg0KPiA+
IHBvbGtpdCBhbHNvIHVzZXMgdGhlIGRvYyAnL3Vzci9zaGFyZS9wb2xraXQtMS9ydWxlcy5kJy4N
Cj4gPiBwb2xraXQgaGFzIGEgcHJpb3JpdHkgb2YgMTAwLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI1Ni41LmJiIHwgNiArKysrKy0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yNTYuNS5iYg0KPiA+
IGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI1Ni41LmJiDQo+ID4gaW5kZXgg
ZWU2NTZjODFlNS4uMWM0MDhkMDc1ZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWRfMjU2LjUuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWRfMjU2LjUuYmINCj4gPiBAQCAtODQ4LDcgKzg0OCw3IEBAIHB5dGhvbiBk
b193YXJuX211c2woKSB7ICB9ICBhZGR0YXNrIHdhcm5fbXVzbA0KPiA+IGJlZm9yZSBkb19jb25m
aWd1cmUNCj4gPg0KPiA+IC1BTFRFUk5BVElWRToke1BOfSA9ICJoYWx0IHJlYm9vdCBzaHV0ZG93
biBwb3dlcm9mZiBydW5sZXZlbA0KPiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJ
RycsICdyZXNvbHZlZCcsICdyZXNvbHYtY29uZicsICcnLCBkKX0iDQo+ID4gK0FMVEVSTkFUSVZF
OiR7UE59ID0gImhhbHQgcmVib290IHNodXRkb3duIHBvd2Vyb2ZmIHJ1bmxldmVsIHJ1bGVzLmQN
Cj4gJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAncmVzb2x2ZWQnLCAncmVz
b2x2LWNvbmYnLCAnJywgZCl9Ig0KPiA+DQo+ID4gIEFMVEVSTkFUSVZFX1RBUkdFVFtyZXNvbHYt
Y29uZl0gPSAiJHtzeXNjb25mZGlyfS9yZXNvbHYtY29uZi5zeXN0ZW1kIg0KPiA+ICBBTFRFUk5B
VElWRV9MSU5LX05BTUVbcmVzb2x2LWNvbmZdID0gIiR7c3lzY29uZmRpcn0vcmVzb2x2LmNvbmYi
DQo+ID4gQEAgLTg3NCw2ICs4NzQsMTAgQEAgQUxURVJOQVRJVkVfVEFSR0VUW3J1bmxldmVsXSA9
DQo+ICIke2Jhc2VfYmluZGlyfS9zeXN0ZW1jdGwiDQo+ID4gIEFMVEVSTkFUSVZFX0xJTktfTkFN
RVtydW5sZXZlbF0gPSAiJHtiYXNlX3NiaW5kaXJ9L3J1bmxldmVsIg0KPiA+ICBBTFRFUk5BVElW
RV9QUklPUklUWVtydW5sZXZlbF0gPz0gIjMwMCINCj4gPg0KPiA+ICtBTFRFUk5BVElWRV9UQVJH
RVRbcnVsZXMuZF0gPSAiJHtkYXRhZGlyX25hdGl2ZX0vcG9sa2l0LTEvcnVsZXMuZCINCj4gPiAr
QUxURVJOQVRJVkVfTElOS19OQU1FW3J1bGVzLmRdID0gIiR7ZGF0YWRpcl9uYXRpdmV9L3BvbGtp
dC0xL3J1bGVzLmQiDQo+ID4gK0FMVEVSTkFUSVZFX1BSSU9SSVRZW3J1bGVzLmRdID89ICI1MCIN
Cj4gPiArDQo+ID4gIHBrZ19wb3N0aW5zdDoke1BOfTpsaWJjLWdsaWJjICgpIHsNCj4gPiAgICAg
ICAgIGlmICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ215aG9zdG5hbWUn
LCAndHJ1ZScsDQo+ICdmYWxzZScsIGQpfTsgdGhlbg0KPiA+ICAgICAgICAgICAgICAgICBzZWQg
LWUgJy9eaG9zdHM6L3MvXHMqXDxteWhvc3RuYW1lXD4vLycgXA0KPiA+IC0tDQo+ID4gMi4zNC4x
DQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gTGlua3M6IFlvdSBy
ZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4gVmlldy9SZXBseSBP
bmxpbmUgKCMyMDM4NjkpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjAzODY5DQo+ID4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA4MTM4NTI5LzE2ODY0ODkNCj4gPiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS91bnN1Yg0KPiA+IFthbGV4LmthbmF2aW5AZ21haWwuY29tXQ0KPiA+IC09LT0t
PS09LT0tPS09LT0tPS09LT0tDQo+ID4NCg==

