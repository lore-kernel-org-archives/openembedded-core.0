Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C363AC54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 01:23:05 +0000 (UTC)
Received: from esa15.fujitsucc.c3s2.iphmx.com (esa15.fujitsucc.c3s2.iphmx.com [68.232.156.107])
 by mx.groups.io with SMTP id smtpd.web11.39069.1747963377071363082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 18:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=L8fSM8HT;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.107, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1747963377; x=1779499377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d1SNSjE+rbR+fnORlHXzrspzNbDrMjoCPoLaIVQ6X+4=;
  b=L8fSM8HT90iPzr+EOUOLnl5KQAZX3mPiQ97tnF0GEJPxW+VTNmRlP2mD
   CjlZb8gChWWu5mjCrvUh24vYP0zbIth0St1U3bOnO1CQnVh1h0wtIrzDr
   FqydW4PEY4st4bczJN7Nnl0f5Vz81pbHeDo8hSZ62r2OvHUkU0cz80/7K
   R3oPnHLqVOCEYeKD7K7SoWpDe0JMo+C77jqsO6N+VFHjVgtITz8PPIfes
   Wig2VrVStlu+Abwg+rsbBmVagFSlUNN5tWlo5ofHPaOGrXHRUZLgNP5Sh
   6ucVzPdwPPm/8SirRnA0M5+6qhqWu7uF77YHJNEqMy4ReHu3W0peEsQWX
   w==;
X-CSE-ConnectionGUID: GCovsv0DS6CmVcjS4/3zPg==
X-CSE-MsgGUID: NAL5bB9LTDydK1EqIcPe1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="156833256"
X-IronPort-AV: E=Sophos;i="6.15,307,1739804400"; 
   d="scan'208";a="156833256"
Received: from mail-japaneastazlp17010001.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.1])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 10:22:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z57BNp6tv+Tz6liKbilsFQszGIl84TPuUmUc+qhx5culPiB2v4umnPnXdJHbrE0dfF7wuTSABbJbQlQON1yK1k5up9spr76LRgbZ0JUeXQtO7zUmwcTkBDmNxUhc0M74zqLgRH+3V7JDPxbsau0gYEWCFeyhTY2n3JWvfBFHDBdP2re9WXcZgEXchJxW51OoicAfotbIC//7hH44b5+xDr/MGMNLRS4yrt4cj3JmB+YXdKM68OtMEjZHcIoFN0Gl/x8EEiksmWmMp9OxZkPTAOfWirdYnDTcNDRqQ+dUKrxq8+pZopewQot/AoHe8JXSofOsgl0PsA/V+coEPgwpIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1SNSjE+rbR+fnORlHXzrspzNbDrMjoCPoLaIVQ6X+4=;
 b=ThKfRAyBxGYDo3jlCaLum+7Cq7+7yubWETS+UhxhnnZ1iZrKSIjkMep9nMXfYoUj8JtcqiDdYo2LJR39d4maZOj2996ZnCZxhkef6hVBEY+VljUn216r+W2CMdfSipxYKntkzglMkgEXhbYJNerc+qbU4q69nkRzR2/q3sraDYkIn2lUNyVpjFaQjueMi5AF1vXDrtYTLgnHCbUmw1RkAt0HFa104rmrJR/6I751s5gO5oTIRphep23Wo7Y14lLU8rk2zqRqI9TcHHTAEHEn+1aBK0+t4IqIQPBKmctthFoCZPE82qgsO3lJM/w0GqArOOL9S2OAeUVS5W9sBvR7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TY3PR01MB9873.jpnprd01.prod.outlook.com
 (2603:1096:400:22b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 01:22:50 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8769.021; Fri, 23 May 2025
 01:22:50 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
Thread-Topic: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
Thread-Index: AQHbyf523verdRZtlEScX7K3/CWRZbPecpsAgAD4KeA=
Date: Fri, 23 May 2025 01:22:50 +0000
Message-ID: 
 <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
 <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NGZmMjAwOTEtNzRiNS00ZmFhLWE5OTktNDI4MjY2NDk2?=
 =?utf-8?B?MDk5O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA1LTIzVDAxOjA5OjUzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TY3PR01MB9873:EE_
x-ms-office365-filtering-correlation-id: f4ae7ffa-0340-4fc6-d5a0-08dd9998556e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eXpiSWpaNWNDV3NjZ2VIV3AyV1RMQTdKc3RNMTBkQ3U1RUEyRWNZVnRLY3Ry?=
 =?utf-8?B?YVpNRkxqbmFYaXZrRVhEYkxqVUlCa2VqUVFoVTdkd0IzRFBpVFN0S3BMR21x?=
 =?utf-8?B?S2NNcWxON2Nvd051M1Y5aXhqU0JCYVBGekhyTDRTWEFnQmNlMzBVSkRkNk84?=
 =?utf-8?B?TzhZTjd5TGxpNHRDa3VaQXcrcTVKMmlIOXF0c3E2ajZ0REJNY0pLM1FSTEM2?=
 =?utf-8?B?UHRwWE11aklkNTg1bEdlZlpNanhha3pvdWpwbTI1WlBoUFFYSEQ1cTdqQ3J5?=
 =?utf-8?B?Ukt4YlpMRzFtbVc0MFkvLzNWY0NQUy81cXplamo3YTFWb1FtVFV0Ti9FSFhh?=
 =?utf-8?B?L3kzQmk1MHZyOUVpeFBJVFNjeGE3b29VT2FVemxFdS9lOXBVNEhCL1J0SDVa?=
 =?utf-8?B?eWNNVVZqVXdZN01XeUVUZUs5THdVc3Yzc0RSQzRjNVpEdlE4MUhXNjNCNjRJ?=
 =?utf-8?B?WHUwc25KMzNQbEhGQi9xUGFKbkxIN3JKK2JCT2d6bmtpTkx2VGdQTVBDK0VP?=
 =?utf-8?B?MjdadEJzRGo5YjVvUjhBTjdKQ3B1MFBDYlp3Ry9EQkFEOFJqVFpGeUYyQkor?=
 =?utf-8?B?aXFZVndYZmxXZVR5MHZ3dUdnbUxjVXMxYTRGQk5IbDZ5Z3FEek4wY3hseFph?=
 =?utf-8?B?L3BCamQ4Z0EyUCtvOFVPdkJVT0ZxVk1GdnYrelBOY0lvbm16bVZYUWJ6Ympj?=
 =?utf-8?B?MHVWYkFIZEJyTmd0MmRiaVlXNzRSb3RiN3V1a2VCWWFnai9vcklTcUNjM1l4?=
 =?utf-8?B?bXJSZmdjdGJDNG5EdXYwcDI4dmhCVkRqSWpHNy9iTWFXSWpkNWdGYXA4YWt3?=
 =?utf-8?B?Rk9ocExJd1k1bFFFbE9sa0dmMDh6WWlMQzRkSjk0ejh6UEpFWkpMK0xTNVB1?=
 =?utf-8?B?ZnVHYXh3VkVYY1lxSWxGZGVLZHlsTEJmc0srR05Cc3c1RmsvMVJQQnBWbkF0?=
 =?utf-8?B?R1p3c25UTlA4Vm45bkVsMUtyTW9yamNQOEIxdEI1ZWQrK0JuVnFKY1Vub0Fu?=
 =?utf-8?B?WW1qL3BidklVamhvWGR3Um5jR2tqeWtTNG96cHQ3UmwwT2Z4bkRha242RVVV?=
 =?utf-8?B?SHhGcDg3VmQrUitRaUNsTlVLM0FVZVRxU2o3b0dIdHhoTU5DZXFGOE0xa1BN?=
 =?utf-8?B?L2JxenZ4L291ZVJGZEFSZWV0OUxRbkJzdVl3RVJpRzdLNng1a1g1VDM4MmdO?=
 =?utf-8?B?eStkdjRYT3NrcVA2MGJsRDM3UVFibk5JRnU5Y01hMzVMRUJmUlBRZFprQyt1?=
 =?utf-8?B?c0VLS0N3Z1N3THR6WGJrMlJPakVzcENvMzE1SDk4eE8wS2UxU0JKaTQ3UjUw?=
 =?utf-8?B?cFFJdko1QjMvZnpUL1RNUmgrZ090S0xBOWFjS09udUdNWnV5cHp4bWt0MEhL?=
 =?utf-8?B?U1BzRmIyMEljdlllNnk4TGw0eEhIZDlNOVpVbkg0cXZMeGhFdm0ybjBXdVRl?=
 =?utf-8?B?SlByelBFeVg0VXFHQjdzeFhiUHY4K0hLVG4xL2Qxb2I4V2ovUzFLRGEwSWtP?=
 =?utf-8?B?OW5aVXdXUmN2SmF1cG1tK0VwUnJzSkU0ZG9ua1Rra2w5WTV2eE5rbXc0eXZj?=
 =?utf-8?B?OFpoclcxTmpQYXVYQ05mWXdKNm1kbjJUQ2ZmN3FSZ2tnV3ZPakZrZ0lUS3BQ?=
 =?utf-8?B?NkE5S3MydEwrU3hyZHNFekxBTTJCRGl6dGVMTSs3NXF0Vzl1S1Y0WHVUWk9P?=
 =?utf-8?B?TTR3S2gxdW93cUpyYXAzaUZxR1pVcFU2VmxIdWNNY3JyVWJUZ2l6Ym8vdkYw?=
 =?utf-8?B?MXQ0QWpGaUJxY3k1REFUbkxYQm84SGZMQ1ZPT3JiU21JUEpMa3hzTE5aVnJu?=
 =?utf-8?B?MUpLRzd3azd4YzY5aDNMbkQ3d3BJdVVZaXFHWnEvOFI2RXk3cU5FOFdwaG1U?=
 =?utf-8?B?YTNwaHZiYkxLeDVQMG9XZFVubUR5MW1SUzJaNnJLbnVpQTU4eWFEQmNuR21D?=
 =?utf-8?B?dE1xZThnQndDcnhiV2hXVWtUVkNnZHdzcDBSK1QxMG9lVmZYSlRYazZib2Yv?=
 =?utf-8?B?U0JMTWx4NHdnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VlNTMVU0Q2kraE5aWjFlZ3VvQWN6OFg0OTdqTGYvZXByWXcvWFRKYlU0My9D?=
 =?utf-8?B?b0xMVFFjQmZyYnpPa1A5WUI0bGVvY2pISHJ2ZW1QNnMweEdRdEFIeUFyc1ZR?=
 =?utf-8?B?dVp5aG94bEwzV1VMY3NVZnYxOFEwV3lYTUFEMkwwVzY2TmhYYVR5WHNHYjh0?=
 =?utf-8?B?L0cyL0ZPcDI0QlVNdGdqUGFIVEZ6eURUcU1oS1VaOU1ucEhoMG5GQmt5VXZ2?=
 =?utf-8?B?TERpOXB6bVdlbUNqaTlmSmIwRGhRYUNiWGZLdjF4cDJIajhjWThaWlZnK3RY?=
 =?utf-8?B?S1k0VXE4QWtNUVJWQStwVUZIQms2Kzh2TmI2ODR6V3YyVEdiZDFlaG5YTk1v?=
 =?utf-8?B?THp2d3c4YWtPaFJyOWRhUktTOVBkdDNtYnZNWHRocVpqZi9NcTBVVHA2ODQ0?=
 =?utf-8?B?SnJ4QjVxWmtzZGxuV3NwL2JaQTkxUVFKemlzVVlqQU5Ib3p5SFlmZU8wUU9z?=
 =?utf-8?B?Y0U1ZmY4Y05US1RYRjFoL2l4cTBDU09ZRno5WTNWSTJIS0tSbHpPY0lUbytR?=
 =?utf-8?B?YVI2eWhNMFlvb2RaaFNPYU45U1RieDhyMllvZ1BEMi9NSzRubVBRZWJRSlYv?=
 =?utf-8?B?NldWL1VRRVpIODFscm04RjhWb3hTaVo1MWNZN3AxTk9PWmtBRXM3NzRPaW5J?=
 =?utf-8?B?a29KTlQ1LzdZL0dZUHl6c1oyN0pvV1pKRTdDdUxoQThKMG83RlJOejg1MStl?=
 =?utf-8?B?bXlaVTRGUWNMN2Z3WHRzTWw4a2xnTjYrZXkrZy9pMk8yTzFaaDFwREorMGwx?=
 =?utf-8?B?bk1JSFVXV2xWUjNxUWZZdWJuSCtKVTdMYm0zSGdDMzRTb2ZBRTF5N0w2RjYr?=
 =?utf-8?B?ajF5dTJaSGNJcVZZTnJxT1dFOTJKazgxVDRVbFdCNituMmxuc2JLcnFCdGpi?=
 =?utf-8?B?V0dLSll6U3AwMTJjU2dDT2hLdjljOHN4T1IydTkwbERXb0w0YTBpUlg1MnhU?=
 =?utf-8?B?ZldNTWlyc0YyK3BLa0RMOVI0TGtYRHVVbE42Wkdka01rWTdaUnpGYVRQR3NT?=
 =?utf-8?B?NEg5TU5HMTdreWlxQ1NxbDZWMWUrbDlLWWx2SEhETTNSZkV3RDJtL2liZVF6?=
 =?utf-8?B?ajJWU2pKWHdLdlZwbW55MmZESWtZekVhMWxKTUxKTFE3cFVha3Mya21heHg2?=
 =?utf-8?B?TjFpcFdCdzljdUhUVDZ4bWNMRWJySVI0WHVzSXdjU2xmajJKSTFBbGxwdHYy?=
 =?utf-8?B?a0I1YXFXSnl2VmR0VXl2OW95N0JhQ3JUNDNWTHZ6cXVGZ0xmd1gzRjYydXBu?=
 =?utf-8?B?KzlZRW9PSWN5V2h0UW5Ic0plaUFhVXVsRGNULzdudXQ0UTQrTDRqb1pMd29E?=
 =?utf-8?B?WXh2VzF5NUdmMCtOYTZTRDQ3cUl0WExsejgvc3AxSGRNZHI2bEVWckcvN1Bo?=
 =?utf-8?B?b0xkdkhqelRsZmJ1V2NsYllEOEROM1E4dzZJaGVEckJXNTZHelYwU05IWTYv?=
 =?utf-8?B?K0Zwd3dkNDN2NzRvNWJ5NXdJQTRiNktGVlZZNWU3RHF1MnMveUQ1Y0dqb1FR?=
 =?utf-8?B?VExQelMvaVRlMWpHUCtaYTh3M3lJenpIdXpaR21MNzhXMURxbnYvOXVXSGxF?=
 =?utf-8?B?Ni9sTGQzKzJBSlY1OUVUZWFsNDQ1bThTaU9hV1pXckQ0SFFyenEzSXJESWJR?=
 =?utf-8?B?WmMraWlEaS9OZWVQU1JOeDJyekZROEI2S00veVljNGh6OE1XZDA5WEZHaXhB?=
 =?utf-8?B?SndwUUpRTkN4REhDTWl6Z0xzMWtZN29kT2FoNE9GZUpvV0xoaFBmVldnYmFB?=
 =?utf-8?B?d05TMiswOXBnT0w4MGVtT1BWZmJnMjNrZnBIbFpiYVJmOEsyWWFFb1hoMXla?=
 =?utf-8?B?NXY0dWh5SGhEc1dZcWc2QVFuSWY3UHFydUllNmh4dzJHL0hjTnBwZWZqeXBv?=
 =?utf-8?B?R004VjVvTy9sZit0THlNcUJFVnU3c3V3OUJWS1VYcHg1TkowMVpPaCs4Q245?=
 =?utf-8?B?V0VHcHlMSm94aXZsRTdONTFwRklubVpZZHkyTmhta3VnYkpBU1laV05SbHZP?=
 =?utf-8?B?ZnBRMHA5b1hEQUN2ZFNMV2hkMkdVa2dnMFZXVW45ZUhRdU1jQm5vK1VpUy9p?=
 =?utf-8?B?Qko2VXB6NGgvTHE2WUlHWXRpUWw3SnN1OFdtVldFaklqUzhwak5sYmhrQWpp?=
 =?utf-8?Q?DhLyNphbf25Mcg/aSOePhXXXY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3JFBLlX4mZ0I7roFPASMlj5jjoBp4DaCzaYc4I8eotPIhqWy9FiUE1KHTO7tcpqXVk7H+JjVRVADRPCDIBvg7Ogv2I0aBG5J6LSBZ3Tsqm3KW5UTTqaul1Znr7oWz8xVFxZZsvDhDdUySRkFDlbowpgxXSGMB7IPGjjQvr/8b3yy0jNyLMqAhqghvX6SGwKNphoUTHfvJDYE/JZg1hqiVvjphr8VXtW5N/vooL7ow7NaY7AVzklBWnPFvLbn3k+PTcvqH8q0cEQYw1IfcenbLg4WfeLlnia6WhZPWNz09U6WJHLj2JcM2VizPleEqA/HmC3NKm+W2vN/JOdKe1Ay/k2YiZT0USKphXW83Q6KTpUnzw2B5ujMM6Sb8F/Slc/D/jeEY5RRJ9DyBJMc9UKsdNntbPUhtLk/PMUTXXnQ13iiw3M4n9F1YeWqTe7HYNHzmYL8VRX6M7fKNNbso4O3wiwwZG0knpWHd0FP9WPYuo/WZOYn7WFQ+3o3h5cK401XcjRIqmxOlUWJFVfDp8aGhyJhu7iUG58W5wdJdYrZe76qL1dcU/v6ZFpV5bJKefKusHgeVOyl3EPM6z/1KtgbiMJpTfMIMuuU86N6QWwQr/w4VZMNnC6g8CO7r4nMrSrc
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ae7ffa-0340-4fc6-d5a0-08dd9998556e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 01:22:50.3831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU/A0a7dAjuF3PiCPl/c8jrGWK0pwcPGbz+aMqcBVFk/JluEG7AKUYLUHFWGr2ipwWxLLK9BFosr//8FpScZFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 01:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217156

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlcg0KPiBLYW5hdmluIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IDIwMjXlubQ15pyIMjLml6UgMTg6MjINCj4gVG86
IExpdSwgWWlkaW5nL+WImCDkuZnkuIEgPGxpdXlkLmZuc3RAZnVqaXRzdS5jb20+DQo+IENjOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY2xhbmc6
IG11bHRpbGliLWhlYWRlciBmaXggZm9yDQo+IGxsdm0vQ29uZmlnL2xsdm0tY29uZmlnLmggYW5k
IGNsYW5nL0NvbmZpZy9jb25maWcuaA0KPiANCj4gT24gV2VkLCAyMSBNYXkgMjAyNSBhdCAwNTox
NCwgWWlkaW5nIExpdSAoRnVqaXRzdSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGxp
dXlkLmZuc3Q9ZnVqaXRzdS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6DQo+
ID4NCj4gPiBFcnJvcjogVHJhbnNhY3Rpb24gdGVzdCBlcnJvcjoNCj4gPiAgIGZpbGUgL3Vzci9p
bmNsdWRlL2NsYW5nL0NvbmZpZy9jb25maWcuaCBjb25mbGljdHMgYmV0d2VlbiBhdHRlbXB0ZWQN
Cj4gPiBpbnN0YWxscyBvZg0KPiA+IGxpYjMyLWNsYW5nLWRldi0yMC4xLjQtcjAuY29yZTJfMzIg
YW5kIGNsYW5nLWRldi0yMC4xLjQtcjAuY29yZTJfNjQNCj4gPiAgIGZpbGUgL3Vzci9pbmNsdWRl
L2xsdm0vQ29uZmlnL2xsdm0tY29uZmlnLmggY29uZmxpY3RzIGJldHdlZW4NCj4gPiBhdHRlbXB0
ZWQgaW5zdGFsbHMgb2YgbGliMzItY2xhbmctZGV2LTIwLjEuNC1yMC5jb3JlMl8zMiBhbmQNCj4g
PiBjbGFuZy1kZXYtMjAuMS40LXIwLmNvcmUyXzY0DQo+IA0KPiBXaGF0IGlzIHRoZSBhY3R1YWwg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBoZWFkZXJzIGFuZCB3aGVyZSBkb2VzIGl0IG9yaWdpbmF0
ZT8NCj4gQmVmb3JlIGFueSBtdWx0aWxpYiBmaXhlcyBhcmUgYXBwbGllZCwgdGhpcyBkb2VzIG5l
ZWQgdG8gYmUgaW52ZXN0aWdhdGVkLiBUaGlzIGlzDQo+IHJlcGVhdGVkbHkgYmVpbmcgYXNrZWQg
aW4gcmVzcG9uc2UgdG8gc2ltaWxhciBwYXRjaGVzLCBhbmQgaXQgd291bGQgYmUgZ29vZCBpZg0K
PiBzdWNoIGludmVzdGlnYXRpb25zIGhhcHBlbiB1cCBmcm9udC4NCg0KTGV0IG1lIGV4cGxhaW4g
aXQgbW9yZSBjbGVhcmx5IA0KMS4gVGhpcyBmaXggc3RhcnRlZCBmcm9tIG15IG9yaWdpbmFsIHBh
dGNoIGluIEFwcmlsDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzIxNTE5Mw0KDQoyLiBUaGVuIEtoZW0gUmFqIHJhai5raGVtQGdtYWls
LmNvbSBtZXJnZWQgYSBwYXRjaCBzZXQsIGNsYWltaW5nIGl0IHdvdWxkIHJlc29sdmUgdGhlIGNv
bmZsaWN0IGlzc3Vlcy4gQnV0IGluIHJlYWxpdHksIGl0IGRpZG7igJl0Lg0KDQpGb3IgdGhlIGRp
ZmZlcmVuY2UsIEkgaGF2ZSBwYXN0ZWQgaXQgaGVyZToNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE2ODExP3A9JTJDJTJDJTJDMjAl
MkMwJTJDMCUyQzAlM0ElM0FyZWNlbnRwb3N0ZGF0ZSUyRnN0aWNreSUyQyUyQ2xsdm0tY29uZmln
LmglMkMyMCUyQzIlMkMwJTJDMTEyNjI0MjE5IA0KDQoNCkkga25vdyBtdWx0aS1zY3JpcHQgb3Ig
bXVsdGktaGVhZGVyIGlzIHRoZSBsYXN0IHN0ZXAgd2Ugc2hvdWxkIGNvbnNpZGVyLg0KQnV0IHJl
Z2FyZGluZyB0aGlzIGlzc3VlLCBpZiB5b3Ugb3IgS2hlbSBSYWogaGF2ZSBhbnkgZ29vZCBzdWdn
ZXN0aW9ucywgcGxlYXNlIGxldCBtZSBrbm93Lg0KDQoNCkxpdSBZaWRpbmcNCj4gDQo+IEFsZXgN
Cg==

