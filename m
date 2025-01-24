Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A20C02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 02:11:09 +0000 (UTC)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com [68.232.159.83])
 by mx.groups.io with SMTP id smtpd.web10.2709.1737684663013460431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 18:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=zoP8IFyE;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.83, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1737684663; x=1769220663;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=BHr0Rtqe7duwTJS1I/w0K56PnQuVDK7ftWdwPvWffCg=;
  b=zoP8IFyEqr2mcEQ/HuPhikxL+m4OK+z9Skiz+a77wMaurro1uDW/y6ze
   Y9DN2rJvbjbzvFIDLFSn/GtOyrUr1BlbTgOSImFCPLa/8Cj8XxPbwQuHq
   lCiSnnudZga4SHn2GHkJNn2muIl58rSrXTWdVVfv1crHnZvlh8bckOTeu
   I3YN/dxBXzx69CGl019ofxzQrrto6HZwUrRv9bIcNbJXu+khwRV6mw8hf
   NFFQYmo9AX2Az1RDEYOJ11xuMlhyD4yw53l/0qoRFqcaFiK2S0KfFuxdf
   mDLp10pxNMEZcc+0M+swdTa7IYCAYeFqW1vUWuospBMOxEEVuIhhTZ3Fb
   Q==;
X-CSE-ConnectionGUID: y01UQ08sQcuONznnFljERQ==
X-CSE-MsgGUID: oRQHmzEtT72/tP7x5mzhIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="144013646"
X-IronPort-AV: E=Sophos;i="6.13,230,1732546800"; 
   d="scan'208,217";a="144013646"
Received: from mail-japanwestazlp17010007.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.7])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 11:11:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xq1KPp+VT5URqILbfLLhXvbLcTWB6QXjw7SlYVjxhWln/QCMgT+wxf8ATXfckMSxaP8pQBlIwFKjTQZ3kUz8egHBzgL6V+ydoF1aC0zNg9bYJwUrS0cyHoc56yh0q9+FGNw6jHf/1r5me3GV3VmuvF4dbzPufsAVTC3rhTQTupwpYAojSBTM7i5A0z4OvBYXD+/8hqLS9eDNApD3buNe/yNv6Ho239jODxB/RmCRD4PwAI/kymjD4UcQuDV5wCQHIvNZMxhcjJGy0NlhvjXzhtTAJKDEKuiYxcAcZIlssxX1AFYMRLUCMUx/NYzIq0y2j7hm1APm+pMoplygCQOcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/LZdPKa4O6svGx+hIyvly2Ghosindnun9yM2MF3FL0=;
 b=mQc+BaiXmIx2Cvb9Zs2cMpFewCvKcMTfM1XMHCTf9wBQU32oh8sbqwtJxjzrjuDLGNmR9X0so/q+T8QtqmQJbjyv+/AdkOFBLScyTKH4tJG8pB+hLTyWvo7l0QmmYtOSElPa07BYQ6ksgJNLYbmVfbvm8PKt80DE5ZPqAQjbd+zYyjJVHm9sxIbMXDJbXg1kXj+LnZGtPruf5L86KKEl+VrOOpJKYKmvx1qCpcWQqRTMyTXeflvrGXNZ46cVzeVE0Ba6XTJTQH8fRQZ2CjHdmwG8ZnMKeqrDrAwsvveGcU1IUAHblYoXUmzfCIUGDBv+k1XjuFZCrx8NVaz78c0Rtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TYXPR01MB15292.jpnprd01.prod.outlook.com
 (2603:1096:405:279::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 02:10:56 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 02:10:56 +0000
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
Thread-Index: AQHbZ6xZzTsZ6qT/3Ey33XrVQ0r3ubMhY4gAgAACcwCAAJBAcIAAia8AgAK6NqA=
Date: Fri, 24 Jan 2025 02:10:55 +0000
Message-ID: 
 <TYWPR01MB11861F43C751CA906A41A7AA5DCE32@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com>
 <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=bc7f3ccf-48ed-4dbb-8cdb-6a27efddfc07;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-01-24T02:07:41Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TYXPR01MB15292:EE_
x-ms-office365-filtering-correlation-id: e1ed1b95-a24d-4027-0140-08dd3c1c5643
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007|8096899003|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?QXA2Q0ZSdHZ5bXJSNjlxemZPMXF6Uy9qL3luOXA2Z1RPMW1JTVpnQXYva1hu?=
 =?gb2312?B?SGZQL0VtOThVOHhVdXVKa05iZ0pQSG9MUVl1YmQrR1czWVFCQVhJL3B6bHox?=
 =?gb2312?B?S2RGVE1LdXZVTWZSeFNUSHFia2dRYjdGbDV1RHBWeU5ETU9OOW4wKy9KZFA0?=
 =?gb2312?B?cjBONHo5bnd5czRrNWR0WWJGamF5dE56UzhGSGc4VW53TkNMaDllMENwbnRM?=
 =?gb2312?B?d0dINlV6bDFGNE4wTS96blp3SnpzTHI3K1J6NnBucFZtS3hRMmpsT01iUy9s?=
 =?gb2312?B?eG1nNUxOa2pBeHNwSmNKWnBZUEpmNUZlK1JuQkh1MU5jSEJVeWVwUXZCekMw?=
 =?gb2312?B?ODBvb2Ryd3VDV01LYVpuZVBONjFSZy9lMzhiUFJtMmtUaS92VytveGtwbGZO?=
 =?gb2312?B?eGVxZ2NwZS9tbFMrMnp1amVlclQ1d3orcjZDaStEbVJVMFJ5aExMcnhKZXNj?=
 =?gb2312?B?Z3dFTWt4dEtsZlluMXlLM2RHTmJHZERtM2FXQ2hPM2t6bkZWZ0g3V2hVcmVq?=
 =?gb2312?B?RW8zR2lRcXo2aERWeWtJVEFrNVF5aGZpUW14NXBSUzlCbFMxNEhYZFVzTk9S?=
 =?gb2312?B?eEZBL3dCZ0hSVkhPeU11YStncldyOVBxcnkrQlo5QklLb1VnRVpKRWpNVkhC?=
 =?gb2312?B?L2U2dTE3R1BEVFYveG9jNGI5Ykh5UkRSVHhSOWFndmNySXV2MUpHVnFPd2dC?=
 =?gb2312?B?L2loMHVJRmp3aGJjVk5uOU05dUZiOUNTS1RZM1N3bSt6Y0tKNGJWNEV4N1Z2?=
 =?gb2312?B?RElkaFpaWm13TE1USmltK3JGRHZVNVBadjdLWldKQzZ3ZHExQ05pK2tBb1dU?=
 =?gb2312?B?c0tmWURkQ0k5eDNPalpEVlc2N1RycjJOWHJjcWxJN21xVGtYNkdOMGhmWHhR?=
 =?gb2312?B?U0R1bjdrZnFxdFhOaGVyRHdOaUxWYklyQUdJaER4di9Kc1NBSnR4V0l1dkRN?=
 =?gb2312?B?WnBzcWh6bXc1elZ3YjJuSmltTHdtdlJSNkpFMS9mNXVVSytqZFRjZ2pkd01r?=
 =?gb2312?B?d0FjQjAzL0t0WjI5NzAvOExFYkxpUzJzbGVCZzdTTC9ESllvQUNHdkNiWS9w?=
 =?gb2312?B?cHJSWmRteXFqdFJXdGRFcWpnYnBGRG9NRmFsZldLVWxySVkyVDJhSkhhWkFo?=
 =?gb2312?B?SU12ak4xblNwb3VhVFFWYnBEd0RFRDdRb1VUTExzRDFESGpqWkZYV3NGVDBE?=
 =?gb2312?B?ZzU3YjBpSVhEbzZEZXhxZU9sT0Q3Mndyem5ZYjBOL2NPQnJHSDYyTHROS2JL?=
 =?gb2312?B?aHpsTTNzR3RPVGZIL1hNL0tzaTBZd0pBSWh3K3VhRE5IUDcwQkM1RU4yNG5w?=
 =?gb2312?B?ZFZ1dW9zdjhHV290Z3J0N2taNkM3VStBd3BtTXhKZTg5eUZsbm1pc0oyOHg2?=
 =?gb2312?B?VEJpTmJ3M2F5a1NrNC82OVJnQ3F4alNsU2dDRU14QWJ2djU2bzBxQ3NMdGQx?=
 =?gb2312?B?UlhuRC9DaUs5QmZ0MnFLdXR1aFRiKzN0cUJLdTYwR2RUNzRqK0FDTm1pdmZX?=
 =?gb2312?B?WHkzK3BkWjJrY0FDcC9VaUN1ODRidjUybXVPM1VRRnA0L2NzOGhyZG1lZ29G?=
 =?gb2312?B?VUpuWXFhS1daR3hNMWkwaC9XVjVYSkFyU0lZUFIrQXRSTWxieXdzNWN3VGoz?=
 =?gb2312?B?SDYxMXh2aklOTnc2NmdOQzc2emk2Q3kzREFmeVVzMDY0RHlUcnVkbWN5RCtR?=
 =?gb2312?B?ZExJM3NlNi8zMElqSk8yalAwZnBUVkdSZTdaUVoxcGd2Smx4YzU0RG1FYW9X?=
 =?gb2312?B?N1RybDNrU0ZMaTI1WlI3SjJQN0xER2laNEJpMS9iY2dKdm1WZFJGRDJhTENo?=
 =?gb2312?B?NGFPeStWZkpOejR5R2xHOXFBZzFXd29ZQ0p4N3BnSEJTMjMvVjFLWi9JNmpZ?=
 =?gb2312?B?dzFZcVowM1FKNDd3MDlxMXhkckh2ekp2N2QwK00zMEdNYWpHRHZSOVBsM3Nv?=
 =?gb2312?Q?Q831HnN532I=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007)(8096899003)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?MlhVOURUTW9yTEkrR3U0cmIwTkZXTUtNU3luT29yQ1lTalV5YXFLVTBrTFJz?=
 =?gb2312?B?TE5lUU1EVVhhNmtBdmtaOWd4eDl6M3FzVjNUeW1GVG5OTHFFc3JWM0ZjNE1z?=
 =?gb2312?B?ZHN6dndvVlVUWGliNEdMeXdzSDZGUGt1U3I3WDBMRHdidGQ4TTZ3WlVvczlj?=
 =?gb2312?B?S2twcjZjRHRwY09TelIxMVhFYWJNMnRPK3dmMTJpb1IvbU9WQ1FDWEs1Q2Vl?=
 =?gb2312?B?RStaRzFMc20xVjJPOHBUV0xFaTQvNElXaXRsS3JoaHB6N2ttRkVtSDMyeHNu?=
 =?gb2312?B?R2duVU9PWjZCS1VtV0YyV2V4V1pCNnM4Zjg4ekNqWGwvSUtnWnFwUUZwUjJR?=
 =?gb2312?B?L3loUkFTYjN4bjdmcEc1ZGJ2MmE2eUxIMEdWUTNHQkpmOEVpYXE1MGNVTzl6?=
 =?gb2312?B?Y1JhZkxuQTBCSTRlaGdUc0NXKyszNitmc1FhSkZKR3NIZkExN3VFdHJISmF2?=
 =?gb2312?B?YTUxdnpOaytnUDZRc1piNWNpeVFDeml4bmxpOGVhVXRrc3ZDOUZBcFRNS3Vj?=
 =?gb2312?B?cXVOQXRxd3grK1ZoWmNmMW9CaFIxQjZkNzg3ZWtORVluRW5OMi9aQnFpRy9S?=
 =?gb2312?B?S2dqRHByV1dRUWhLekVjTUxXMXpndGFpbmo3d3RZUzUzL3U2aHRVY0kyZWFz?=
 =?gb2312?B?bnVvY2RWODVsUWF5M1VMUWIrR2YrMTVWWnpTR2xsbDlIMEVuSml1NTJ5Y3Ra?=
 =?gb2312?B?TWFncGpVbW9Vd3IrRlI5bGsxdEs1LzBoeVVSdko0MnJ3VFVBdXRmb1VycUt4?=
 =?gb2312?B?KzlkNTZZV0Fuekg3d2lwbXVpdTMxWUdBejkzREIzMVljYWN4eHhyaGwxdFo5?=
 =?gb2312?B?REMxOXpsL2RDQ2lXcjdOdXVESUxwbDlRTHdLUVdUdStqNzN1YkxrTlN0cVpw?=
 =?gb2312?B?RklTVnpJWWxCdkV4TWhXaWtBZ2t0ZzlzSHpvNCtCU0dnNm9sTEFnRmlYVnZy?=
 =?gb2312?B?M1JBTEVpSytaTVBnZXc3UUxvRUoyRGdidjFHN0pXVnZKUTN2a0JjZkwzZnBE?=
 =?gb2312?B?OUZBQllsUlRsdzJUYUFHRDYrYWs2YWpMRzY2MjJIN2ZvSlF4dmEzS011NEVP?=
 =?gb2312?B?SERlYmNXejE3MURLOGFUa2N4aGFtdnNkS1dEcWJqTUVnbEJMODdZOVIwSWtR?=
 =?gb2312?B?NkdFa2xxY2lGWUVKY0svayswNllsNjhnemtlckR3YlZVRHRYZjd5eG1vSXBF?=
 =?gb2312?B?NlhiemJGMkR3bWxNY2YxQWg4V21tamJYL3RhUXlGdktReEFKeVl6eGRsNkda?=
 =?gb2312?B?WExDbjVLcTV4VUp2YmtmZU1ISlpobmcySmwzZUx2ejJVYUpMR3N6N0JDeS8x?=
 =?gb2312?B?OHI4WStQRGFKSHBQa1VyWENEZXYxRE5MUjh0OU0vSVB1SW8yM1QyTUhwL1BE?=
 =?gb2312?B?LzdQQTYrWnZpU2RabzFkT1JvTGk4Ym54QXFFbHczYW1RNGtpS2VERlk3R1BF?=
 =?gb2312?B?R1BFSFJzSUt1cXovWkJEQjNyR0VEQUk1MlZjTUY4NlZST1l5UUIzK0J4Y1FP?=
 =?gb2312?B?ODVxWitJeVgxVC8xcEk5bjJIU2lOa2xJa2VUMGhqVW8yaFlqOEcxM2R1anQ3?=
 =?gb2312?B?T0NHbXFuUHNwOWZrV2M3bmVyNnVGaWM1ZWt1d0RxU05CWDQwOHQxbW1pbDgz?=
 =?gb2312?B?cFpvT0E0UkhzaUFQL0t5Mm5YK3RjcjJQQ1JzMHl2bENuM080cVY0RkJrK0w5?=
 =?gb2312?B?OERLenV0clc0Z3NhemI2QWRvcFZoZTV6QldSUnVyUEtIRnIzNmpzYzNyNGph?=
 =?gb2312?B?aGZUMXpPVVV1UW1uTHovQ3NjV3M3V2tyK1FwTzhoR2ppRUdGZ09Qb09tUU5R?=
 =?gb2312?B?bEI0S3hDYmh5K2swR1JVNGY1QTZCTzFsay9JSDhLQytNeDhXc0kzbVpsZnNn?=
 =?gb2312?B?cUhuOXZrL1pCc1dEUzhQamFqSEFhQ1RJOXNDcEdGVWtHcXMybnZyb3o3eDRF?=
 =?gb2312?B?WmswbGk3ZGxkbTcxb2tjWmJKM2o3ZXlIbE9rcnVzN01BaE1EOWs1dm5aU2Ra?=
 =?gb2312?B?TllhN09ON3pNVkE1d2Z3Z0xxckxDb25pS3FrM1JhZVcvc1ZQZmJZREJNQVY5?=
 =?gb2312?B?VE5BUlZFT0w4b0hBMkwzRXgya1hZTElYUEh0R1g5b1JHQlcvQURFYk9KRnhT?=
 =?gb2312?Q?1tsqc89Q47JKcDmu/XaAgPL39?=
Content-Type: multipart/alternative;
	boundary="_000_TYWPR01MB11861F43C751CA906A41A7AA5DCE32TYWPR01MB11861jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	44RRUEXQt7VognUsJzCP1BAsLnTFfWMaZRc0UIVRx0OHIy2OokG2WVAsML9lbelH9fseC+FDMLvtKaHehXoBg75KerCRHB//vpiVlodm1iajOypUKvBFdsT+YjGqSvN0h0hV2GtTvaBVP4VLQmbacj8E1jhsiM3zV79hcNKbtYpbU5RrYpz2TWMVHIWpcDIi5sMrHHQzMFjTb1vDRaR97Am5CCvN18mhJTULd5kRAICtilhRTGiZh70yhk96Tzx7TuCfiyEzQNqeJAqXOlBB5gXPQNufz+iln5wplf5CM8fMq4AcuJ4V2pfqaS8wORpyznJJf/Zs3NHtbb/8XEBUrfXIehWo9h/ciyMUFn2QyY4lA34LfFbv89OYUY21imWCHZGKJmVFst1/B3D5eMAFprXXblA1yooHovpFuDlCJWfCB1uFLT6S3M2FjHacrLPdeQHuxohuL9s0zVvBfPXaORcGdRYK6G8VUWiwhgYa4oVgLhVz27fJE0iTY5ma7uPJveke0e3QVzHBu1oLv0S/zCRAOrfIc8uKfg+ZgAphZUPLZVOuWRL3sk/jWMth9He7aC005d42pgcMHvcqr4u5RxaFIisrklWa21VTR35txhMVjDST/vKy/uCbFy9R88Yb
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ed1b95-a24d-4027-0140-08dd3c1c5643
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 02:10:56.0113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/+0F5s4XmCHAFvORvCdD9eGCNfFP0BR0xTadfKOLDd43dARzctFKXDh5/vz593cZ700+CiCo197PksOjA7bRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 02:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210216

--_000_TYWPR01MB11861F43C751CA906A41A7AA5DCE32TYWPR01MB11861jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhlIHVwc3RyZWFtIG9mIG5jdXJzZXMgaGFzIGZpeGVkIHRoaXMgaXNzdWUuDQpCdXQgSSdtIG5v
dCBzdXJlIGlmIGl0IGhhcyBiZWVuIGNvbXBsZXRlbHkgbW9kaWZpZWQuDQpJIGNhbiBzdWJtaXQg
YW4gdXBncmFkZSBwYXRjaCwgZG8gSSBzdGlsbCBuZWVkIHRvIHNwZWNpZnkgLS13aXRoLXh0ZXJt
LWticz1kZWwgaW4gdGhpcyBwYXRjaKO/DQoNCi0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZV
SklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYg
V2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTKO6Kzg2KzI1LTg2NjMwNTY2
LS04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5n
bXlAZnVqaXRzdS5jb208bWFpbHRvOndhbmdteUBmdWppdHN1LmNvbT4NCg0KRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQpTZW50OiBXZWRuZXNkYXksIEph
bnVhcnkgMjIsIDIwMjUgNDoyOSBQTQ0KVG86IFdhbmcsIE1pbmd5dS/N9SDD+eikIDx3YW5nbXlA
ZnVqaXRzdS5jb20+DQpDYzogcm9zcy5idXJ0b25AYXJtLmNvbTsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgTGVpLCBNYW9odWkvwNcgw6+72yA8bGVpbWFvaHVpQGZ1
aml0c3UuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gW09FLWNvcmVdIFtQQVRDSCB2M10gbmN1
cnNlczogRml4IGluc3RhbGwgY29uZmxpY3Qgd2hlbiBlbmFibGUgbXVsdGlsaWIuDQoNClBsZWFz
ZSByZW1lbWJlciB0byBpbmNsdWRlIHRoZSBsaW5rcyB0byB1cHN0cmVhbSBkaXNjdXNzaW9ucyBp
bnRvIGNvbW1pdCBtZXNzYWdlcy4gVGhpcyBhbHdheXMgaGVscHMgd2hlbiBhdCBzb21lIHBvaW50
IGluIHRoZSBmdXR1cmUgc29tZW9uZSB3b3VsZCBuZWVkIHRvIHVuZGVyc3RhbmQgdGhlIGlzc3Vl
LCBkbyBhZGRpdGlvbmFsIGZpeGluZyBvciBvdGhlciBmb2xsb3cgdXAgd29yay4NCg0KSWYgaXSh
r3Mgb24gdGhlIG1haWxpbmcgbGlzdCwgdGhvc2UgdHlwaWNhbGx5IGhhdmUgd2ViIGJhc2VkIGFy
Y2hpdmVzIHdpdGggc3RhYmxlIGxpbmtzIHRvIGluZGl2aWR1YWwgbWVzc2FnZXMuDQoNCkFsZXgN
Cg0KT24gV2VkIDIyLiBKYW4gMjAyNSBhdCAxLjE3LCBNaW5neXUgV2FuZyAoRnVqaXRzdSkgPHdh
bmdteUBmdWppdHN1LmNvbTxtYWlsdG86d2FuZ215QGZ1aml0c3UuY29tPj4gd3JvdGU6DQpUaGlz
IGlzc3VlIGhhcyBiZWVuIHJhaXNlZCB0byB0aGUgdXBzdHJlYW0sIHdobyBzdGF0ZWQgdGhhdCBp
biBhZGRpdGlvbiB0byBsaW51eC1nbnVlYWJpLCB0aGVyZSBhcmUgbWFueSBvdGhlciB0eXBlcyB0
aGF0IG5lZWQgdG8gYmUgbWF0Y2hlZCwgc28gdGhleSBoYXZlIGluY2x1ZGVkIHRoZSBtb2RpZmlj
YXRpb25zIGluIHRoZSB0by1kbyBsaXN0Lg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUN
CkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5v
LjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTKO6Kzg2KzI1LTg2NjMw
NTY2LS04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3
YW5nbXlAZnVqaXRzdS5jb208bWFpbHRvOndhbmdteUBmdWppdHN1LmNvbT4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbTxtYWlsdG86YWxleC5rYW5hdmluQGdtYWlsLmNvbT4+DQo+IFNlbnQ6IFR1
ZXNkYXksIEphbnVhcnkgMjEsIDIwMjUgMTE6NDAgUE0NCj4gVG86IHJvc3MuYnVydG9uQGFybS5j
b208bWFpbHRvOnJvc3MuYnVydG9uQGFybS5jb20+DQo+IENjOiBXYW5nLCBNaW5neXUvzfUgw/no
pCA8d2FuZ215QGZ1aml0c3UuY29tPG1haWx0bzp3YW5nbXlAZnVqaXRzdS5jb20+PjsNCj4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxtYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IExlaSwgTWFvaHVpL8DXIMOvu9sNCj4gPGxl
aW1hb2h1aUBmdWppdHN1LmNvbTxtYWlsdG86bGVpbWFvaHVpQGZ1aml0c3UuY29tPj4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gW09FLWNvcmVdIFtQQVRDSCB2M10gbmN1cnNlczogRml4IGluc3Rh
bGwgY29uZmxpY3Qgd2hlbg0KPiBlbmFibGUgbXVsdGlsaWIuDQo+DQo+IE9uIFR1ZSwgMjEgSmFu
IDIwMjUgYXQgMTY6MzEsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPGh0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzphcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
PiB3cm90ZToNCj4gPiA+IFRoZSBob3N0X29zIHdoZW4gZW5hYmxlIG11bHRpbGliIGlzIGFzIGZv
bGxvaW5nOg0KPiA+ID4gaG9zdF9vcyBvZiBhYXJjaDY0IDogbGludXgtZ251DQo+ID4gPiBob3N0
X29zIG9mIGFhcmNoMzIgOiBsaW51eC1nbnVlYWJpDQo+ID4NCj4gPiBTZWVtcyBsaWtlIHRoZSBw
cm9wZXIgZml4IHdvdWxkIGJlIHRvIGNoYW5nZSB0aGUgZ2xvYiB0byAqbGludXgtZ251KiAoYW5k
IHNlbnQNCj4gdGhhdCB1cHN0cmVhbSBmaXJzdCwgb2J2aW91c2x5KT8NCj4NCj4gVGhpcyBpcyBh
biBvdXRjb21lIG9mIG15IHJldmlldzsgaW4gdGhlIGVuZCBvZiBpdCBJIGhhZCBhc2tlZCB0byBz
ZW5kIHRoYXQgcHJvcGVyDQo+IGZpeCB1cHN0cmVhbSwgYnV0IHByb3ZpZGUgdGhlIG9lLWNvcmUg
Zml4IGFzIGEgdHdlYWsgdG8gY29uZmlndXJlIGZsYWdzLiBCYXNpY2FsbHkNCj4gYmVjYXVzZSB3
ZSBkb24ndCBrbm93IGlmIHVwc3RyZWFtIHdpbGwgdGFrZSB0aGUgcHJvcGVyIGZpeC4NCj4NCj4g
V2hhdCB3b3VsZCBoZWxwIGlzIHRvIGluY2x1ZGUgdGhlIGxpbmsgdG8gdGhhdCB1cHN0cmVhbSBz
dWJtaXNzaW9uIGludG8gdGhpcw0KPiBjb21taXQgbWVzc2FnZS4NCj4NCj4gQWxleA0K

--_000_TYWPR01MB11861F43C751CA906A41A7AA5DCE32TYWPR01MB11861jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@MS Mincho";
	panose-1:2 2 6 9 4 2 5 8 3 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.5pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF">The upstream of ncurses has fixed this issue.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF">But I'm not sure if it has been completely modified.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF">I can submit an upgrade patch, do I still need to spec=
ify --with-xterm-kbs=3Ddel in this patch</span><span style=3D"font-size:10.=
5pt;font-family:=B5=C8=CF=DF">=A3=BF<span lang=3D"EN-US"><o:p></o:p></span>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">--<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">Best Regards<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">-----------------------------=
----------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">Wang Mingyu<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">FUJITSU NANJING SOFTWARE TECH=
NOLOGY CO., LTD. (FNST)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">No.6 Wenzhu Road, Nanjing, 21=
0012, China<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">TEL</span><span style=3D"font=
-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso-ligatures:standardcontex=
tual">=A3=BA<span lang=3D"EN-US">+86+25-86630566--8568<o:p></o:p></span></s=
pan></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">COINS: 79988548<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">FAX: +86+25-83317685<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS M=
incho&quot;;mso-ligatures:standardcontextual">MAIL:
</span><span lang=3D"EN-US"><a href=3D"mailto:wangmy@fujitsu.com"><span sty=
le=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;color:#0563C1;mso-=
ligatures:standardcontextual">wangmy@fujitsu.com</span></a></span><span lan=
g=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;MS Mincho&quot;;mso=
-ligatures:standardcontextual"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:=B5=C8=CF=DF"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;
<br>
<b>Sent:</b> Wednesday, January 22, 2025 4:29 PM<br>
<b>To:</b> Wang, Mingyu/</span><span style=3D"font-size:11.0pt">=CD=F5</spa=
n><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-seri=
f">
</span><span style=3D"font-size:11.0pt">=C3=F9=E8=A4</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">=
 &lt;wangmy@fujitsu.com&gt;<br>
<b>Cc:</b> ross.burton@arm.com; openembedded-core@lists.openembedded.org; L=
ei, Maohui/</span><span style=3D"font-size:11.0pt">=C0=D7</span><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">
</span><span style=3D"font-size:11.0pt">=C3=AF=BB=DB</span><span lang=3D"EN=
-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">=
 &lt;leimaohui@fujitsu.com&gt;<br>
<b>Subject:</b> Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install confl=
ict when enable multilib.<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please remember to include the =
links to upstream discussions into commit messages. This always helps when =
at some point in the future someone would need to understand the issue, do =
additional fixing or other follow up
 work.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If it</span>=A1=AF<span lang=3D=
"EN-US">s on the mailing list, those typically have web based archives with=
 stable links to individual messages.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alex&nbsp;<o:p></o:p></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed 22. Jan 2025 at 1.17, Mi=
ngyu Wang (Fujitsu) &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujits=
u.com</a>&gt; wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0cm;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US">This issue has been raised to t=
he upstream, who stated that in addition to linux-gnueabi, there are many o=
ther types that need to be matched, so they have included the modifications=
 in the to-do list.<br>
<br>
&nbsp; --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL</span>=A3=BA<span lang=3D"EN-US">+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, January 21, 2025 11:40 PM<br>
&gt; To: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burt=
on@arm.com</a><br>
&gt; Cc: Wang, Mingyu/</span>=CD=F5 =C3=F9=E8=A4<span lang=3D"EN-US"> &lt;<=
a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</=
a>&gt;;<br>
&gt; <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"=
_blank">openembedded-core@lists.openembedded.org</a>; Lei, Maohui/</span>=
=C0=D7 =C3=AF=BB=DB<span lang=3D"EN-US"><br>
&gt; &lt;<a href=3D"mailto:leimaohui@fujitsu.com" target=3D"_blank">leimaoh=
ui@fujitsu.com</a>&gt;<br>
&gt; Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflic=
t when<br>
&gt; enable multilib.<br>
&gt; <br>
&gt; On Tue, 21 Jan 2025 at 16:31, Ross Burton via <a href=3D"http://lists.=
openembedded.org" target=3D"_blank">
lists.openembedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; The host_os when enable multilib is as folloing:<br>
&gt; &gt; &gt; host_os of aarch64 : linux-gnu<br>
&gt; &gt; &gt; host_os of aarch32 : linux-gnueabi<br>
&gt; &gt;<br>
&gt; &gt; Seems like the proper fix would be to change the glob to *linux-g=
nu* (and sent<br>
&gt; that upstream first, obviously)?<br>
&gt; <br>
&gt; This is an outcome of my review; in the end of it I had asked to send =
that proper<br>
&gt; fix upstream, but provide the oe-core fix as a tweak to configure flag=
s. Basically<br>
&gt; because we don't know if upstream will take the proper fix.<br>
&gt; <br>
&gt; What would help is to include the link to that upstream submission int=
o this<br>
&gt; commit message.<br>
&gt; <br>
&gt; Alex<o:p></o:p></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_TYWPR01MB11861F43C751CA906A41A7AA5DCE32TYWPR01MB11861jp_--

