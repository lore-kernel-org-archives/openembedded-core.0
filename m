Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D74C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 03:54:14 +0000 (UTC)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com [216.71.158.62])
 by mx.groups.io with SMTP id smtpd.web10.871.1745380445608434248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 20:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=bZL7ZmoW;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.62, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745380445; x=1776916445;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=89/FWI7REyVTqMAWMyclXpmY2XO/9kM3gWXJ1EP5uNo=;
  b=bZL7ZmoW1fIwvVa5mdlIYE0G0lsS3/JcYpghIZGWx1jnw9gaL2zLtkPD
   wMgjbpoG8iySVQ28b5HkvIN0XlDvaTnWxCV8pG30NYHQJ5k5WKU/vhM4l
   OrjbLMavZ+JldvAu3hOQHZ6T3bWCeSvb1vJs3raGwopwJ6VnwYROuaDYT
   X5sqkVAFKlf0HbOerttED/TAbp8gitebplIAoQv/poxoC9OvEd89J3Tik
   ezKL5IFV8zDJl9s4X7s+UnRr53x42K3HRuoTYdZ3s91WMyYu/EHz6Jugx
   h5bGq/iVcJLpjR6S8RR5B/6zCKKivYw2N/0bf2LOLQZNj7Py/UyhLKaRr
   g==;
X-CSE-ConnectionGUID: iD/3j0elSlyXuA7tjrfxxQ==
X-CSE-MsgGUID: hCfVuPqKS5qLVx/rlUi6ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="153049154"
X-IronPort-AV: E=Sophos;i="6.15,233,1739804400"; 
   d="scan'208";a="153049154"
Received: from mail-japanwestazlp17010007.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.7])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 12:54:02 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ca8nVWiljawazAZfS8cZhluXpPYkpmoi1dlN9Vs7LUgPzoojPRHonI7WSxesuGtEHYvhmXk8ieILLW9A9kfvkWHpRih+GVFeK/biln54ZHO34gW0NnoD/zGne894L+LM8598FlUdVbg5yw7e6a6lCGERlE8R9qcDzIVK4WZQmWtwAiS9ptFaY5G5tcZ0I+g7TFaI+CfJ33QRkv9c+JrwsxbA7aMlWdGs4FI9UJZbQexrga0lFuUGyNJpNCCPsCOmNU5C5jVqPc2DMnhDFPFPfpFCLeP6O7u4gRavI2uCKEEJCaRLjdSEYkmoHoMYpcEWzr8h7uV1rFzmWFHTvda8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89/FWI7REyVTqMAWMyclXpmY2XO/9kM3gWXJ1EP5uNo=;
 b=mofZorGT0gkwxLGUZxT1aUGN/Rbi1XooHwfeuROZkB2YEfqOBwhBkpBm8j8zpbVwtWZjBB2PpSTXEEQYW8wdtJRKfW09B9lHtLe0eHqQDLWJNILMaOuoJbwnIWI9/kgMF9tn9GXCdVrRqBtzsPjLEFkJboMYoAA3Rdxnzk+NNbDksSIo4dEg+5rdPR7Ji/X9iRMOgm6lGXcQKnMD9N2ppBDouQKhhIMo0ndkWzgc/06QvY2RZYotx+tEjQRzjWrjnS2m9uZ7YUHZVJcqHC21dZiia2Fa5+z5shMOeYfvjtlpvdYpl/w6w2UUQeG0QID4j4+yiQK7oFmZyoWBaPFmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by OS3PR01MB5781.jpnprd01.prod.outlook.com
 (2603:1096:604:c0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 03:53:47 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8632.035; Wed, 23 Apr 2025
 03:53:47 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBnemlwOiB1cGdyYWRlIDEuMTMg?=
 =?utf-8?Q?->_1.14?=
Thread-Topic: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
Thread-Index: AQHbs5rA1x12pWUPQ0GMaF72EP0tTrOwmFWw
Date: Wed, 23 Apr 2025 03:53:46 +0000
Message-ID: 
 <OSRPR01MB11597271B174135C69A00BCAE9BBA2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250417102130.800-1-leimaohui@fujitsu.com>
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjkxODQzYTMtMzZlYi00NmMxLTg1YmEtODk4ZjlkZjdm?=
 =?utf-8?B?YjIyO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTIzVDAzOjI4OjMwWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|OS3PR01MB5781:EE_
x-ms-office365-filtering-correlation-id: b5ed47cc-9aa9-4c3e-7752-08dd821a733b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TmpSNXQ3bjFjV2ZuUFBSTUNQaWJId2Znc0tYcTl1WlhncnBDOVJOajJDZnY5?=
 =?utf-8?B?MFFyck9zbEhzdm0vRjhlaTZ5b25ybmZQTW1OeXdkMGNKcElGKy8rZkcrSWJt?=
 =?utf-8?B?OUJ2aUVNVGxjR0tKbEVESVM0WFBPcnJDUVBVRlk1bFlCSEcxUGZHSjl6TzFh?=
 =?utf-8?B?VDJJNmF1U0dIdUdhQzk3ZURGNGUraEczVWxtZE12cmcwVEVuUy9SVjlVaHpj?=
 =?utf-8?B?UDNnb1ZHS3MveDZkNkxNYi9obk9VRlFKYXpyQkFVVUhjZUxWRUI1cEE3NWlu?=
 =?utf-8?B?NVpOZFI2Qlk2STRIQkNheWNpYVNZUWh2UmVaU2UweThKR1lxcmtNVTNPSEov?=
 =?utf-8?B?SW5jVGxwT095a0tlN2k0OGFEOVFObDV2dVBMN0VWMnQveTFSWDBDbjh2azlD?=
 =?utf-8?B?NTRveEpteXdWeE91blBLSHRjT2tEOGlQQm5tN2NnRXpEdFBCK25BSXdHOFVk?=
 =?utf-8?B?Y0ZFbHlvWDQyQk5aNEd2bTJRcXJ1K2pteW1yWmNRZ2NWNDZiV1pXaWhlTWxp?=
 =?utf-8?B?bUs4U1VzMzcrZGc5SWtaSCthdmhxQzFhc0t3WDJjZCt6NW9HMVdhYU5aYm1k?=
 =?utf-8?B?TFlpSzEwZjVNOEYrNTlCNFhjNTNxMGJsemNnbFhlZElvalJ6Rms3d2RMTXQ5?=
 =?utf-8?B?YlRsbFNFT3RON1A1SWlGekdQV3YwTTQ5eGRVUWZwWVZGZDA4UVBnOGpvcHY2?=
 =?utf-8?B?WXFManZINEVyaWdVcERCMHNad3JyS0FaQjBtSVB1dStqdTg2MHlka3YrODR4?=
 =?utf-8?B?bWs5eFdmMTUra1ZOTlk0MEJPWFJDa01EY2JGeWxkKytMZk1ZZzlaRnRod2FK?=
 =?utf-8?B?ZnplM2RPbFp3YWNETUVWZjhOZS9iYmpjSmZKK2FnSi9sWWVtU2RhOGw3YzJi?=
 =?utf-8?B?emMxK01sSlZ2b1JvM0dvZW9INmRUWG8rUVZwaEhTQ21hbzMwZ2NzdlllOWFP?=
 =?utf-8?B?WnZMdVRkM1lOOHYwWTVVZGNFOE9ZWEZQUU4vT3hVZExNR25NWWo4NmU5Tm5Z?=
 =?utf-8?B?VHhsRHVNbTBHSUwybkRHMFh3S1JXMy9SN2plRGtNQjBDRnVpekd6KytPb3hx?=
 =?utf-8?B?ZktmMjRKcG1uMjVMWFBndFNNdmF1bWxDRkdBb0p4eG5EdUFtV2Q5M0xlWVZJ?=
 =?utf-8?B?dDdtTFovSzZtOWg1TVVyWlkyYjk4MHR2bEN3ajg3YzNPcDMvaHkvdytvUjBk?=
 =?utf-8?B?WnkwNy9EK091NXA2TVNSSVZqZFhXNTZrVFVmRTVDNmxlcFNVZWQwVnNnekhW?=
 =?utf-8?B?Q1ZQVXlQbHV4aEVzeEI0UHJrZXpWbHVNb2N3Q0xuVGh4eDZIeDBLQ0F0ZnRX?=
 =?utf-8?B?cnBEalpjUHdGcVZSMkExWDRKSFFkQ3NiQjFOQlJReHNtejQrUkw0YXFxS09Z?=
 =?utf-8?B?TU95eURZcHc3NGlmN2V3eEZPckl1SzR1eFN6VFdsZm9zeTRZVTk4NUV4MWJr?=
 =?utf-8?B?UGJmYUNpQk41T2RwTDZpcE01RTJDN21UaWR5UTVuck42ZE9CcE10VW9oRkdh?=
 =?utf-8?B?blZTaGVHeGxLU2Z1YTlwdEZNTkphaXpETk45eUxHbjRrMGlGUVN6VThtODJC?=
 =?utf-8?B?c0F3eHBDVkp0dXJUNTU4ZFdDUWJDVWFzQjFhR1VlODR0QTJ3ZkkvOWc2VFcz?=
 =?utf-8?B?ek1NMmtsWU0walIzLzRJT0FEdWlLS0cwL0dOV2VqUmpvZ0VvcklWRmtPOTB0?=
 =?utf-8?B?THYxVzdweDNnUHdRTy9nMUxKQ0hhemxnQnl2TGRzbDVEZzZkVFZNVkZ1Z3BU?=
 =?utf-8?B?UUlZQjNJYzFMVnBWQjVGTXZPSzU0emJxM09iUWlmWVQxVHUzeE9FOGIzQmYy?=
 =?utf-8?B?STZpaGlkK01IbHJrbFVBQXk1Z0hLYWNpb1FDVWk2MFQvZEN0NGxWQWtNd1E0?=
 =?utf-8?B?YXQrSnVIQ282MzhNN1ZFK2tiKzlMNFU4dGlxNVcvY2RjcXNibnovVW9pbnZy?=
 =?utf-8?B?M2ZSZEhScTJ2Qm9WWERuUUJYZ3J6ZWpNcWRuV2VTa3ltV0hGNDdqcCt0b2hS?=
 =?utf-8?B?K3loYTIxQkV0alFoWk1pQ3pKZHo2ZXZBckQ1SmpIWDJRdDZLQXdhMFRJVXNQ?=
 =?utf-8?Q?3kbHcj?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bTN0c0h2aTlzS24vZHhtMzh5MXJjVDR6cWtzZE1vNnQ5NEhCR0svbW1ZK2RV?=
 =?utf-8?B?bVhCOEhDQmxVNy80ZDM0VnJMZ0c2UFZaaG52cjczMGtmVGJsd3o2Y2JQYTIv?=
 =?utf-8?B?WVd0VTR1SWY2K2UwdFdNTXhrWTBzdy9LSk1PUC92SG05WkZXaEE2SjY0WERs?=
 =?utf-8?B?M0xZMURtWmhmT2ErcXI3VklVaEU1amlQMGdMMTZMTERvVFpobWJQL1NuZUZV?=
 =?utf-8?B?SjVLK0Vhb21qRDFBWSs0STNEZ2tqL3FvQ2RPTDRRS3Fydi83OGRzbVdaS1NV?=
 =?utf-8?B?K0l5VmNBOEpxakZtK2tCNFNMNllqN1VvSlRWbFgwN2ROME1iSUI4aGhHRCtS?=
 =?utf-8?B?NklkOFlmbXZEc3BNOXlwZ2diUjdrYWhUazFaWmloQ0owTVFTTVRBVnBNa2Ex?=
 =?utf-8?B?NHFDMUROdUxYL01qZU5mWk9xNklUK2hMWWFXTGUrQndNMFdzeG5FbU1RaDhy?=
 =?utf-8?B?RUtoTkN3U3lGK1k5dEJtMFlMTllSa1IwWlA0eVplcW9EUzc4bm42YThSdGVu?=
 =?utf-8?B?UHMvQVFBOFJ4SUx3ZGFPT3BFNG5qR0o1ZGtWZmg5Smk2MWtlanRRamhsMWdx?=
 =?utf-8?B?cVlOS1dZYTNLNnFjQTd4VHk4bUdIVSs4eGx2bjdrQm1JMDJ1ZzVPV0ZrTG5R?=
 =?utf-8?B?b1dlM00yT1NyRXo5SUVDZklzVjFxSVdLRExLQVJaRXMxV0ZYVXFkd1J6b0I5?=
 =?utf-8?B?ekQ2WnFrcjZ2Q3crZUN2UjhkVnVPcjNkVWV5bFlLa3J1blhCSmU4dEIvY2ho?=
 =?utf-8?B?emgyank4OUZkVmJBVHdQTGU3YjdOWVNlM1RPeXVHV2t6eEc4cTBuSnFjcC9l?=
 =?utf-8?B?TWxGUDBkckxMODE2alN6a0VmSi9tU1BsNUlHT0ZZSXdncVc4eVdxOXlyQUYr?=
 =?utf-8?B?cnZ2WVNUYjIyNUdFdWNYWFlWRlNKRm5DSmhhb3hEbWpLaGkzd0hhNER6SUU0?=
 =?utf-8?B?RGtnREkxd2JSWVRodC9ZV3RsN2UzYkFGZW5maWZCTEc0dTZKUjlwejRUcWRZ?=
 =?utf-8?B?cFJ3ZGRoRDBwdEhQUjF5MlQwcjl2eVU0NE85ZkthRWxJL2Ewbm1KQXhrSjNn?=
 =?utf-8?B?THlsNmIyaGh6L0t5L3lTb0pLWW1sQ2huU0tZVzNaOE1TOHl4SFlLNSt5cWlB?=
 =?utf-8?B?Q1MyNXlYY2hvcTUwYlB6ZHJZelRlOTQrdDhqMGxSOXpLdFMxd3RmZWZNOE1x?=
 =?utf-8?B?bHY5dW9NMFVZak1DeDBMdGp1SGovMEVIcDdlbXRySW5CK2cxSXZiQ1F3OC9i?=
 =?utf-8?B?eEJNMWVvVWNqMEZORmJ2R1RkYVpCdEoxQURCcHpEcnoybFdzY0dPZXJ2dXAv?=
 =?utf-8?B?Y2tLVXM2ck9XQ0ZuZ3Ezc2lPS2szNmtWVFVLN05Ha1BPVE9tWWZYNFRWNEcx?=
 =?utf-8?B?a1AwZEN6VHVyY3ZXTUN6Z1U3OHduYWMvRUxqWTdudCtkRm5IUk9TS2NEbWVr?=
 =?utf-8?B?Qjd4aTI4TUl6ZjNNRkdaWXV4VlZncjdCVTBmZW9tM1Vhb1duUXgzbHc2QThi?=
 =?utf-8?B?Vjg1b1lKUFJnclhNMEh4WWNJWjFsNDJ4WmdrNkg2Nk13VVR5Z3UvTXZ3by9X?=
 =?utf-8?B?dEhEK0tmT3lBZjR3YjdqODFXbm1oTHFRdi9udkg1ZnNRcWhkaVhkWDR5U3RS?=
 =?utf-8?B?WURwUkFjYVptTFM5cStxeWhYbzRaWFpJSkM3NDRzSmJDT3VKWU1NdXlOVGZN?=
 =?utf-8?B?MHkxM3JzaTFXZFhXVFlQUHhuVE9qbU4vM0syNTN2bnE5aHk2NHkzWUZKQ1Jz?=
 =?utf-8?B?dHVtVjZKNE5UUlJPTGExZk5oWHpqS3pGOWJlZUUyZ3IyRVNEeFdlMHNKZ3Bt?=
 =?utf-8?B?YVpmVC93MEYxTWdKOStQMk5JeFlKT1JXN1hsblhvWXpJK0NqWXM0WEZycFlp?=
 =?utf-8?B?bFdhT3BBVlF3dm02Y0RkN3hLUFBUSjVEZHowdHlhcXM0b1hEQXRiSDF2cDc5?=
 =?utf-8?B?RXBsMTVmU3c3K1JERHJBWTByQVhMRy9peCt1QnVGanZOWC9wWXRlZCtsMmtm?=
 =?utf-8?B?ejdpb1FDVGhUVzlVSzFZSFEvK1NUa2NzVldsUmgrT2R1WWtrWElpTlRLNHNn?=
 =?utf-8?B?eUIwYXpDTkUvZHJEa2swKzg3ZG5aWFlneGlMY25wa2o0ZTNSVmtKTUluVm9p?=
 =?utf-8?Q?FjiqyYInMrHiyqTvXEV8vZbEd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Dec+/tmVQEdhka6Cn0gCvBKQpOduXEzbaFQ4GULeVxHIi1pkWqDwy+oZHyW8s5im+p/OUwx0j9tTG6dNxh6YalQGKR/1NdT05HxGmxMDskYXDSs96Gr0C5ofYyCCHZsgpdg6UMobLSkRPBtl7BtAFQIFaNJ0XyWFVgJ5Y0i8103qzYUDHs2/5utpjnWVxo5HCI3A/w2qTvQWmW9DBiMoyA4hHi7bNuto34udIJK7MBBsP8obAoMnTyK2zvAnVRQtM/L+7LINcFlEyN6BAB1O6pIlxikzVHvWutQTs3PdcDBseBJcKQYWtMpDRVOxA5DXScRazRr7fx6nhu4+EaFNyvdx0N1QNRyll06bKo7iSL5qN/JZIE5vdPojl/uyNkFpNegCB0s/AWuuLV1znWgzUWH+Pg3Zi2+cHLCwevc06V19pUGx6sd6QrY8T5abWrZrTdcojWDv09rPp6dRSJKokBoJgDt4q74TMstnmsLqqGorCsU048xzEdAc8KE+48VBX2vhn3CNN+LPYZrYL+UthYOldWHA7z0kRjcGtM33iBzjSpvZOLrGZhQ41gw/wPbvdu88LR0tw6K05vTtka3PM28jiSzAygW4SDhsB/8VaCjaUfuVry51xNjGPbSyBq3K
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ed47cc-9aa9-4c3e-7752-08dd821a733b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:53:47.0000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5nFDqGg/0F/BzkHU3YmkVAKnSl4s5gGGV9M2WByL0jP3r33I9g1Djfn/DPPQZgU7Ln78kOzo5nKvwRDAK7uLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5781
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 03:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215259

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IOS7o+ihqCBBbGV4YW5kZXIgS2FuYXZpbiB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiDlj5HpgIHml7bpl7Q6IDIwMjXlubQ05pyIMjLml6UgMjM6MjUNCj4g
5pS25Lu25Lq6OiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnIDxsZWltYW9odWlAZnVqaXRzdS5jb20+
DQo+IOaKhOmAgTogRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9yZz47DQo+IG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g5Li76aKYOiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gZ3ppcDogdXBncmFkZSAxLjEzIC0+IDEuMTQNCj4gDQo+IE9uIFRodSwgMTcg
QXByIDIwMjUgYXQgMTI6MjEsIGxlaW1hb2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA8bGVpbWFvaHVpPWZ1aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiA+ICtTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3JlZmVyZW5jZTogZml4IGludmFsaWQgb3B0aW9u
IG9mIG9kIGlzc3VlDQo+ID4gKw0KPiA+ICtwdGVzdCBpc3N1ZToNCj4gPiArfCBvZDogaW52YWxp
ZCBvcHRpb24gLS0gJ0EnDQo+ID4gK3wgQnVzeUJveCB2MS4zNy4wICgpIG11bHRpLWNhbGwgYmlu
YXJ5Lg0KPiANCj4gSW5zdGVhZCBvZiB3b3JraW5nIGFyb3VuZCBidXN5Ym94IG9kIGxpbWl0YXRp
b25zIHdpdGggYSBwYXRjaCwgcHRlc3QgcGFja2FnZQ0KPiBzaG91bGQgcmRlcGVuZCBvbiBjb3Jl
dXRpbHMgdG8gcHVsbCBpbiB0aGUgcmVhbCBvcmlnaW5hbCBvZC4NCkkgd2lsbCBjb250aW51ZSB0
aGlzIHBhdGNoIG9uIGJlaGFsZiBvZiBteSBjb2xsZWFndWUNCg0KVGhhbmsgeW91LCBJIGtub3cg
YWRkIHJkZXBlbmQgb24gY29yZXV0aWxzIGlzIHRoZSB1c3VhbCBhcHByb2FjaCB0YWtlbiBieSBv
ZS1jb3JlIGZvciBzdWNoIGNhc2VzLg0KQnV0IGhhdmUgeW91IG5vdGljZWQgdGhhdCBnemlwIHNv
dXJjZSBjb2RlIHJlY29tbWVuZGVkIHRvIHVzZSBwZXJsIGluc3RlYWQgb2YgIm9kIiBpZiAiIElm
IHVzaW5nICJvZCINCmlzIG5vdCBwb3J0YWJsZSBlbm91Z2giIHJpZ2h0IGJlZm9yZSB0aGUgZXJy
b3IgcG9pbnQNCg0KDQokIHZpIGd6aXAtMS4xNC8gdGVzdHMvcmVmZXJlbmNlDQo0MiAjIEVuc3Vy
ZSB0aGF0IGNvbXByZXNzaW5nIHRoZXNlIHNpbXBsZSBzdHJpbmdzIGFsd2F5cyBwcm9kdWNlcyB0
aGUgc2FtZSBieXRlcy4NCjQzICMgSWYgdXNpbmcgIm9kIiBpcyBub3QgcG9ydGFibGUgZW5vdWdo
LCBjb25zaWRlciB1c2luZyB0aGlzOg0KNDQgIyBwZXJsIC1uZSAncHJpbnRmICIlMDJ4ICIsIG9y
ZCgkXykgZm9yIHNwbGl0IC8vJw0KDQpMaXUgWWlkaW5nDQoNCj4gDQo+IEFsZXgNCg==

