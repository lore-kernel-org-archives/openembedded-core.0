Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C87CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:27:52 +0000 (UTC)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
 by mx.groups.io with SMTP id smtpd.web10.1941.1761110866727904198
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=zMj6sOLv;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=Xm3dSxTP;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.87, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1761110866; x=1792646866;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=iSiQDpRDMhJNJyPc/JWFsZFuXxRAlMptdB2beh6mb4g=;
  b=zMj6sOLv4xcP8P18j0T3J8Ij35ySopBHFYE+iwI5YN2ByIX9yrRSDVIN
   qex8PDS6ybkSRab3xHhqMP7CKJj4oKJwXbl+5HavszCAHFkiJi7PkbbiO
   ps5FQL/iQuqqEMBZa8wtSwxULrRco3zKsAQKC4r6/uMFL9tx0PSHZAR9z
   vP9i6ZDa9kkNWCCyzTZgBGtL2FhUYVzPuhU/7NXVhPk3G4M5Pf9OvKkpn
   KsesQNFJdOpvrFZz8UIFDpkdUccHE3N/129xwjawW54UcMz6Z8E8G6ONr
   h8/p3oQYMdJjKhH8R2WKNeLvhRVA98dmxVYX1Y/u8lBneHjb2xeOzhVSn
   g==;
X-CSE-ConnectionGUID: SOr02q3XQ4iTpYbFnBwkNQ==
X-CSE-MsgGUID: jYz0X5nCR7+PzaGP9NqT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="171573257"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208,217";a="171573257"
Received: from mail-japanwestazon11011005.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 14:27:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRdO9s/qtmeOu3h6bGplkAN3muoGAjreaMExicPLL00oJRSggl2JIWgpP5XsfvKbx4+zq7058/YXE3lqrrjhla/Kmaru8sfwteGd/QEYZKrP3FnoSzhVpK4GKKyreA80zqYg9suxwJ8f3u3VBGknMFReAcKcPmwgFMi1d5Zta7a3deNZkY8ONsToYg1vpfjAkqkO1jzXsfULpQqYXbK4V4qlz/8QXR0krurgNDZuLpjX6uNRp3HXrmLNphoKzJKET5kV6DyDwfQb0OPcpvEW8PtEA/g4awhVU3XjkY9+zVJHxH1rdrLj9QNZTVh3sbusLmC5rqME2V0IL2+rE1lv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSiQDpRDMhJNJyPc/JWFsZFuXxRAlMptdB2beh6mb4g=;
 b=ObkXxgZ6u2QlT1piy3pd3nOkulVhdS+SkXVwnHM8kBWu8qJeITEMnk6s0JTUtaPDyYWmlzOFpDGXcCjaqyEE4eemp2AtvasyTmo8NTeSPZa5oghXGU4YxOZIPMcn1YjxzIFEZYVKeGU1oahRF1HidrPk6HRnJlbzy6GAiZ4h9LPElf9MP7hapJDuexWIxbI56RCChyHZhuCgqBnEcpUpuCFAWsztZMhF3e/YkVwT6MRHgzMoa4kwe/sldrzKwODPUP/NRxGchn/FyD/pTQ/JrZHE8IPGMkSK7eOZXhaWURNe7bBCV9OoroRGQuk5jSo/xAqpLbkJVXcG2Flf5neu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSiQDpRDMhJNJyPc/JWFsZFuXxRAlMptdB2beh6mb4g=;
 b=Xm3dSxTP1N9ba3b69SLWzjqWQHJs2ouF3brRxT7QBjCAuX9kiy5oxrZs568QpvsO4/z/cpozneSJwb9J134Ow9oFktXseoH82cmdlkH6K8LXSUGh+s2CF/fCIrbj1fcsV7wUBZm8Zpm/QRkg3CNY0pCFzgZSjlNg4WjZBKdFCf0pMzPcOrhBKE5GYjelcVv/QoP11DVFuKrMexOJuzJmS5KQFW7oNVMNKyZJPc2MHB6lSdiv8+dfUVxjS/rdRc3sgKLWuZG9exnYLsde5Be+OrDn1Ec8YV+2r+vajH4RDLs/Xifcy0cXuc19ijPEs7I7AQ+miQX55IaHfM9HnkZUDg==
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by TYCPR01MB8899.jpnprd01.prod.outlook.com
 (2603:1096:400:18d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 05:27:40 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 05:27:40 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: reply: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to EXTRA_OEMESON
Thread-Topic: reply: [OE-core][PATCH 1/2] kea: fix EXTRA_OE config to
 EXTRA_OEMESON
Thread-Index: AQHcQxSVUH1w2oND+kiaUShUANeL+A==
Date: Wed, 22 Oct 2025 05:27:40 +0000
Message-ID: 
 <OSRPR01MB11597C7F6613BFB38B068B92A9BF3A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20251020023955.2962-1-liuyd.fnst@fujitsu.com>
 <20251020023955.2962-2-liuyd.fnst@fujitsu.com>
 <4ded0bd1-425a-4434-955b-c8ce480a01bd@cherry.de>
 <OSRPR01MB1159720651684F40F7339218E9BF2A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
 <968c2772-4289-44ab-ade0-c11cd52cb832@cherry.de>
In-Reply-To: <968c2772-4289-44ab-ade0-c11cd52cb832@cherry.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-10-22T05:27:39.545Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|TYCPR01MB8899:EE_
x-ms-office365-filtering-correlation-id: 02c97b2a-7ead-4319-1cdf-08de112bb809
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|8096899003|13003099007|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?TytQS3R2QTVPOTN3QzZ4ZWhGeUx5OTQxN21YYURLMEZkeDB1eGhqNmc5WnB1?=
 =?gb2312?B?SDJvZVdDVzR3em1ldkFZSUw0ZlBtQ3c3SzV1Z09XOE52K0lQVUpJUnhoc3R2?=
 =?gb2312?B?ODlXVGVlNFA3RFpuYXBENmJ1ZEp2WC8zeUtvYUlCMFdNTlkwWnNGbG9tR29O?=
 =?gb2312?B?c2VBWTY5V0g0cDczZmhlWkdiMlBZMU5ZcmVRdUp3c2NXYVRxdlVjVVBXbVEv?=
 =?gb2312?B?RnlpS2NIN3Y1ODNDZWEzeXdVcGlCcUlVdXRDSllzajMyTXpOckdHY2RieHhT?=
 =?gb2312?B?YWMyL2E1T0Jld0RsVFAzVW10WnU1dTJ5S2tnSTRWRDBqYW9Cc0dYTHdyaUN3?=
 =?gb2312?B?MmR5V1o1dWZoNklMbm9PWURyb0o4emVlaEdOUkNIS09iRDMza0hIczRJeGIr?=
 =?gb2312?B?OHJmOWozazFQUG5nZmNSTGtKNzBDZkYybnVBc0hWTFM4RzdRY1p4b0xFQzg0?=
 =?gb2312?B?S3loc2N4eU5MdkZadkNDR1o0M2w4Yit1Tm04S3pPRkFGbWJtZG1XQll3THRD?=
 =?gb2312?B?VUtUUzQrQzMxeUMwTGRlRUE1Y3pUN2lZb0ZEcThJaCtXSXdEU0tWQndEUzFm?=
 =?gb2312?B?OWVTTFlxUmQ3YVBCa0JoekcycGY2bnNrV2QvUERXekZoeVlZWk5ob2JkT0NS?=
 =?gb2312?B?RDdUU1JCUUtOZ2hzY0RkU3R1MjV3R2FSdklRUmFCamRGQmZ6SDVoaVdyWFFY?=
 =?gb2312?B?V0Rac2VkaEFteHVzT1EyckI2a2pZeG5MYk45SUZPeTRUeWorOWxpSXloWGlW?=
 =?gb2312?B?OW5DUzBFaVhwSWVzV3RXVUExcE1KUHFoNEVqend2WXNNaGc4cEFnR3ZMZUps?=
 =?gb2312?B?M3lGcm9kb3loa0ZRWjBDUUp3cFl0cG5wRkM0SnU5SVJTS21wa0JlUGVOT2kz?=
 =?gb2312?B?K0dYWDV6ZUxlRnluNkJkdXRmR25vZlcrMXNrS2FqQ1BZT1NyK3dpN1dqS1Bt?=
 =?gb2312?B?SDNkcUdOUm5vQUxPd1g0djBTd3huckhuZFhITHUyRi9uWkswN3FEQVQ5aU0r?=
 =?gb2312?B?dzZ4cGdqaTRGM3hBRnQ0dW96am9HY3ZyR2lXQVcxQlIwUXZqL0xaWHNod1hx?=
 =?gb2312?B?eENPSTJXNmZJUGljYnUzSURkWm9Fc3ZOTDUwR0xDdUUvTkxUNndDVGp6NEZZ?=
 =?gb2312?B?eGd4bG1uQm0zSEFHT2Vld29NM05HdDhqeWk4Wm1ENk9HVEVzV3U3MlIyTDA3?=
 =?gb2312?B?emtSNmV1ZVM0YllET0Q4NDlTMDd5b1M0dVF2QlU2ZWtHZXd0MGhabXNLV2NQ?=
 =?gb2312?B?RnpyOGFqeVhubkVkblNlV3JEYzY1TlI1MmdlK3ZqV3lBS3NFZDBFeFNGbVBX?=
 =?gb2312?B?WkRmWm54Y2tlVk1Fd1VTck96R0JJanJ2ZlV1cTlYS0tNUHZab3I3L0gvUits?=
 =?gb2312?B?c2hRUlJvQkRVam5GbldkQjdnYjlKYk56OFNZMjZraWJBOEhySDU5NDdBdjl3?=
 =?gb2312?B?Qy84aWNES2NHYnppUm9rai9qY1NVSUtOS3BtSFc1SGJLbVFuL0tkcFNOZGcv?=
 =?gb2312?B?cjFncDFSTG81YXM5ZVZJZThPZWRVeWlBN1pkd0JmN2plWlIvWjlBZFEyZ2g3?=
 =?gb2312?B?QnB6a0Q5YWcxUUpLRy9wM1NoeHBjVjFrNzU5UGFpY1RpU1VyWFV0M1Z6SlNi?=
 =?gb2312?B?QU1FZlBjNXg5Z0NnZUFOTzcyVHVSWTFWTjFTcU80RWhZNUhVSGZmNjJKSzdt?=
 =?gb2312?B?QlRRZ0tuTlRWdkxxVS9KZ2xWcm1PRk5kSkhkb3ZTYmYzTkVRL1JMNmVxbi83?=
 =?gb2312?B?RDNXaWVRZGdSVVM0MnFVczhBWjZLcGx5MXVISlJkRUVuaXorYkpodDc3b1hZ?=
 =?gb2312?B?MGM0cmo3SjlwRnlXMmVzMnh0TVNXWXB6VnhSNVE1NlE0SE5YNERyWHY5MmdG?=
 =?gb2312?B?cThzWmJTRVR0ZVFlQVUxTkJZR05XVDh1N09ObzE4S241TnlmbnVHWE5vMHNC?=
 =?gb2312?B?S21XbDh3c1VnSk44aU1JaysxS2Noa3dEZ1JsUklnTFY0MDhFT3kya3gyMkRL?=
 =?gb2312?B?K0NZbWlhMUZNOUQ3Z2FnMmhRd1hudmVoVmFvRGhrTVBWZDJvTDlMRlBGbWhl?=
 =?gb2312?Q?4D32iI?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(8096899003)(13003099007)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Q0tSY24vWWNMNk5ER1BVOTEvSXNPNFcwQW53YjRwOTc2M1NVSk1yVWk4T01q?=
 =?gb2312?B?S3VMNUNwMWlBMzBKZE9aSlErZ3A3bk05dXNYZkNoREd2VWovRHFxdGREdFky?=
 =?gb2312?B?ZjYxSllHaXhVYnZoZUJ5RXhIcyszUHRMVUZ5UERpS05Xbm45Z1RPN0NxNkoz?=
 =?gb2312?B?VWMrMTl1OVc3R20yOFhpWFpzbkFVK0x5ZTNJVXdIcUhzQkpDaVJWbVlJS05t?=
 =?gb2312?B?c1JIblF2WnJBdjJiZTlyb2tzaHpkVVpsc1ViTUlhSTE3YnJHTTJYMEpHY1Fl?=
 =?gb2312?B?SGpZWnRLRkVqUlE1TCt3UVBWSi9aekNMcmFKNWFRQ0wybGdtRDlBY1RwTVpx?=
 =?gb2312?B?b2hpYXBlYkdBTTdqdCtlTlh3Q2FxcVBiWFEyMHY3T3l2dGFhZkJrU0VWcnRC?=
 =?gb2312?B?Mm9ONXpZT08zMU1BdmFCa1ZhT0ZJMGhsS3NwMVNFUkc3MFRxelQ4dWJ2VnUw?=
 =?gb2312?B?U1c0QU5uaGNTOXlFdmpqVVdYUVRDSXl4bmp5VVIrbk96NmlxZEt4cjRPVGVa?=
 =?gb2312?B?Rk5PQzJ4MCtFRVRkcVBhTWJ1SG50RURCZGFGQmpKQnJGcGhlTW9pV0gzNW9M?=
 =?gb2312?B?L2ZDWjIxTVU5cVhyVzVpVGhmaHNxdFU2ZjN2akIwWUFiUXAxZXBMZlQzMDZD?=
 =?gb2312?B?bGszNkxNSW5xMmtBczk5d2JpQm0rRUJjL3VKYXdHdHptNXEwb2hCVFJXR2x2?=
 =?gb2312?B?WEEwYktBVm5wTFd6dEd5QVlxVlh6QkNUbUVDUVRpOHZtZUJISDVVK2J6ZU91?=
 =?gb2312?B?TkdTVWdIV3Zpam91aGJxLzdBZ3VQQXFlOWZXbklIYTBrUlZwMDVrQzFPS0xX?=
 =?gb2312?B?Um52c1FrRU5ucWZzZUN2ZUwrYkNXTnZjL3lJU1htS0JkbFJlK0VOQUc2dVJi?=
 =?gb2312?B?VVlKeDFVaXU4SUs5VCt4QkRSZDh3U2h1L1hZU0FIOWhVZ2VBbmhpUGlkZlJQ?=
 =?gb2312?B?L0kyUzd4MTVyUVJySEZPVGZSREFxRHExWnhDRi9jUS85dTNDSTZpV21ubGFW?=
 =?gb2312?B?NktVLzgvUDNiRDRraDdVak10T2ZwM3JoMmhFbUJxKzFEV2xnV2RERVFvTDd6?=
 =?gb2312?B?WmVKS0hNYi9jYXF1NGt4RllOMFkrc3NXc0xBL1JhYzl5OXJVOWRZRjRzV21B?=
 =?gb2312?B?M0hQTklyazQ3aU0zS3BRT094cEw4WjhlOVhwVnFzeE9ienRKTzNtSzB1RzVG?=
 =?gb2312?B?ZVhJcy9rNTk3ZkFxRkdNZ2puRUpnaG92THZ2WEI2dG9qdmVsUGFidDFOVUha?=
 =?gb2312?B?S3lUanVpOEtLekIvUlJPanFNWEI3MmllZTBHb2FGZ0ZLNDFhTStjb0F0MitB?=
 =?gb2312?B?bkVkcndHajRaNHB4bEY4ZUFCRjZrYTZ4dTdTUko2andyclRldWljcVZ5ZEpT?=
 =?gb2312?B?VXVqU0NwWDZHeFQwaDQzdkMxaHF6TVVPWUJVcnF0dzZMbHlDK2lseWxoY1E5?=
 =?gb2312?B?dENPOHpaM0hObG9BU1lFRXgvSHJHNFY2TzdlSUZLZ1VwNEEzMkQrVVNRTW9i?=
 =?gb2312?B?T2Q0eHEyZ0JGZ3JXMnpUYVlCSGQ4aUlqQjIzS2tFRGM4SXNWbnpSOVNQQVg3?=
 =?gb2312?B?RnhhRDVHQmV4UGQrMXVYd2M2QTNCRzcyODBXa0o0R3MwNk1kbjdpN3RLbzJr?=
 =?gb2312?B?dFBDMmpuYi9jemQ5Q2JsU0ZrNkd5UnlpeEdyNEo4cXZMaEN0MTBva3ZickhU?=
 =?gb2312?B?YUJYZk9jWXU4aUFkQXFoL1BSM095a3NiZC9JaUZkWmpLRlNOV1BYUXp1bnRv?=
 =?gb2312?B?MVVMVi9XSWU3Z0piRlg4UGlia0RENmN0UlhoUnR0bXc4LzZWUS9OMW5JWE8r?=
 =?gb2312?B?aXdCdkZSU2VjVXIxVmNtTWVRRU5QOEZzNHR4WWxhcE4wOU4zTkdWL2xCUW1O?=
 =?gb2312?B?L0JQL1U4ZXh1NEdacjhwbUgwNEs1OEdWSHNpVEx1YW45RDd0Zm1OMWhBR2k3?=
 =?gb2312?B?dDhoaDNCejBCeEkyeVdxNkJqYTcyL2hXMmxZRStqVHRSQS9SbXpHWkJCbDV5?=
 =?gb2312?B?NUtmdldiWVhUYmJkY0xrWHIrRFBmWXhUOG13aUgwOSs2S21GZGY0UHZVMzFn?=
 =?gb2312?B?MXAxK2VzL2haTWZscWdRQUhadG96UjdndEFMMHAxOWUyaUtIQk8vVVQ0cXhC?=
 =?gb2312?Q?rOHArbJOiVXx3V2eyeqwzl3KX?=
Content-Type: multipart/alternative;
	boundary="_000_OSRPR01MB11597C7F6613BFB38B068B92A9BF3AOSRPR01MB11597jp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	aBFIlHjpbIesgxFnnBIPOtJKITFQtiaDD0OfgDvYp41uVNC4PZ+Rbw5Y01FIA7Zzi4xX56DVWQa+DoSX4HSNYzNNXW5c9BoRJXXLvcYxhVgzfaJ3fj559loLeY4bD0A5KJAyIYt/PTzLC8e2x6RjCe/bOJKosVaALYMh7/sRAh1q5BX+DhieTqxoidf1fIwXlzlC9mwLshZ17ZylsFa/MOIcEN6deSEHmfTpLGUPJbmGc/+BsLLu3GSzBowUHhS6mlaNTOcB0pEcfMrekVQQy6qtc4EtzRMnv3BD9hxu5ukLiudYqKWJ9rpLs1PQ+r/3lK+M9sDCG10NPw64OxSILG0CWDsHPNlLdTBoOpQiD/ItXbPe6ns/FuEphCW/iUCKOkFhtIWp7CU9+dW5fPzfD7NeeT3pcTllOWZ95qHV80yhaASDy0b08HqAgBg1k3R3K/lj9GwfNBwlklybK8kpZmaF8PsNgfVabGR5lWPVlGVlaFA3jawvSh0y8sP69XPFLtvLpn+SX6m7ftjJ0gXr3Mo6/8IjE6izSXerDUyOuLzBrgSfLLJHlHkZGYbuYQzIHYgI7o0dY7lBw8INF6pMwY4BjvQoH+gBsGGai5mOyvykSwOzxKQqfiBQkJyr9ugC
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c97b2a-7ead-4319-1cdf-08de112bb809
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 05:27:40.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhb6ZK119dbmLZiqIIgfqjtV1GI/+2R7CGtpmEdSRS8diO2lH/Kzg4rNdnto0ADFFyh9VQxTpr3ALH9cEpcnQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225176

--_000_OSRPR01MB11597C7F6613BFB38B068B92A9BF3AOSRPR01MB11597jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

IEhpIENoZWVycw0KDQpUaGFua3MgZm9yIHlvdXIgYW5zd2VyLg0KDQo+PkRvZXMga2VhIHdvcmsg
cHJvcGVybHkgaWYgdGhlIGRpcmVjdG9yeSBwb2ludGVkIGF0IGJ5IHJ1bnRpbWVkaXIgZG9lc24n
dA0KZXhpc3Q/DQpJIHRyeWVkIHRvIHN0YXJ0ICBrZWEtZGhjcC1kZG5zLnNlcnZpY2UgaW4gcnVu
dGltZSBhbmQgdGhlIHJ1bnRpbWVkaXIgL3J1bi9rZWEvIHdhcyBjcmVhdGVkIG9uIHN0YXJ0dXAg
YXMgZGJ1cy4NCg0Kcm9vdEBxZW11eDg2LTY0On4jIHN5c3RlbWN0bCBzdGFydCBrZWEtZGhjcC1k
ZG5zLnNlcnZpY2UNCnJvb3RAcWVtdXg4Ni02NDp+IyBscyAvcnVuLw0KYWdldHR5LnJlbG9hZCAg
ZGJ1cyAgICAgICAgICAga2xvZ2QucGlkICAgICAgbG9nICAgICAgICAgICAgc2VwZXJtaXQgICAg
ICAgc3lzbG9nZC5waWQgICAgdWRldiAgICAgICAgICAgdXRtcA0KY3JlZGVudGlhbHMgICAga2Vh
ICAgICAgICAgICAgbG9jayAgICAgICAgICAgbW91bnQgICAgICAgICAgc3NoZCAgICAgICAgICAg
c3lzdGVtZCAgICAgICAgdXNlcg0Kcm9vdEBxZW11eDg2LTY0On4jIGxzIC9ydW4va2VhLw0Ka2Vh
LWRkbnMtY3RybC1zb2NrZXQgICAgICAgICAgICAga2VhLWRkbnMtY3RybC1zb2NrZXQubG9jayAg
ICAgICAga2VhLWRoY3AtZGRucy5rZWEtZGhjcC1kZG5zLnBpZCAgbG9nZ2VyX2xvY2tmaWxlDQoN
ClNvIEkgdGhpbmsgd2UgY2FuIHJlbW92ZSAke3J1bnRpbWVkaXJ9IGJlZm9yZSBkb19wYWNrYWdl
Lg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQoNCk9uIDEwLzIxLzI1IDg6
NDYgQU0sIFlpZGluZyBMaXUgKEZ1aml0c3UpIHdyb3RlOg0KPiBIaSBDaGVlcnMNCj4gICAgICBX
aGVuIEkgY2hhbmdlZCB0byBFWFRSQV9PRU1FU09OLCAtRHJ1bnN0YXRlZGlyPSR7cnVudGltZWRp
cn0gd2lsbCBiZSBlbmFibGVkLA0KPiBhbmQgIGl0IHdpbGwgcHJvZHVjZSAvcnVuIGRpcmVjdG9y
eSB3aGljaCB3aWxsIGNhdXNlIGRvX3BhY2thZ2UgUUEgRXJyb3IgYXMgZm9sbG93czoNCj4gRVJS
T1I6IGtlYS0zLjAuMS1yMCBkb19wYWNrYWdlOiBRQSBJc3N1ZToga2VhOiBGaWxlcy9kaXJlY3Rv
cmllcyB3ZXJlIGluc3RhbGxlZCBidXQgbm90IHNoaXBwZWQgaW4gYW55IHBhY2thZ2U6DQo+ICAg
IC9ydW4NCj4gICAgL3J1bi9rZWENCj4NCj4gU28gSSByZW1vdmUgJHtydW50aW1lZGlyfSBiZWZv
cmUgZG9fcGFja2FnZS4NCj4NCg0KcnVuc3RhdGVkaXIgaXMgIlRoZSBkaXJlY3RvcnkgZm9yIGlu
c3RhbGxpbmcgZGF0YSBmaWxlcyB3aGljaCB0aGUNCnByb2dyYW1zIG1vZGlmeSB3aGlsZSB0aGV5
IHJ1biIuIExvb2tpbmcgcXVpY2tseSBpbiB0aGUgc291cmNlIGNvZGUsIGl0DQpzZWVtcyB0aGlz
IGlzIHVzZWQgbWFpbmx5IGZvciBjb250cm9sIHNvY2tldHMgb3IgUElEIGZpbGVzLiBXaGljaCBp
cw0KY29uZmlybWVkIGJ5DQpodHRwczovL3d3dy5nbnUub3JnL3ByZXAvc3RhbmRhcmRzL2h0bWxf
bm9kZS9EaXJlY3RvcnktVmFyaWFibGVzLmh0bWwNCndoaWNoIGlzIHBvaW50aW5nIGF0IGJ5DQpo
dHRwczovL2dpdGh1Yi5jb20vaXNjLXByb2plY3RzL2tlYS9ibG9iL21hc3Rlci9DaGFuZ2VMb2cj
TDIxMS1MMjE3Lg0KDQprZWEncyBtZXNvbiBleHBsaWNpdGx5IGdlbmVyYXRlcyBhbiBlbXB0eSBk
aXJlY3RvcnkgZm9yIHRoaXMgcGF0aCwNCmhpbnRpbmcgdGhhdCB0aGlzIGlzIG5lY2Vzc2FyeSBm
b3IgdGhlIHByb2dyYW1zIHRvIGZ1bmN0aW9uIGNvcnJlY3RseS4NCg0KV2UgaGF2ZSBhbm90aGVy
IHJlY2lwZSByZW1vdmluZyBydW50aW1lZGlyIHdoaWNoIGlzIGRidXMgYW5kIGl0J3MNCnJlbW92
ZWQgYmVjYXVzZSAiUmVtb3ZlIC9ydW4gYXMgaXQgaXMgY3JlYXRlZCBvbiBzdGFydHVwIi4NCg0K
RG9lcyBrZWEgd29yayBwcm9wZXJseSBpZiB0aGUgZGlyZWN0b3J5IHBvaW50ZWQgYXQgYnkgcnVu
dGltZWRpciBkb2Vzbid0DQpleGlzdD8gKE5vdGUgdGhhdCBrZWEncyBtZXNvbiBjcmVhdGVzIGEg
c3ViZGlyZWN0b3J5IG5hbWVkICJrZWEiIGluIHRoZQ0KcnVudGltZWRpciBkaXJlY3RvcnkpLg0K
aHR0cHM6Ly9rZWEucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2FybS9zZWN1cml0eS5odG1sI3Nl
Y3VyaW5nLWtlYS1hZG1pbmlzdHJhdGl2ZS1hY2Nlc3MNCnNlZW1zIHRvIGluZGljYXRlIHRoYXQg
Q09OVFJPTF9TT0NLRVRfRElSL0tFQV9DT05UUk9MX1NPQ0tFVF9ESVIgaXMgdXNlZA0KZm9yIHRo
ZSBjb250cm9sIGNoYW5uZWwgd2hpY2ggaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBidXQgbm90ZXMg
Imhvd2V2ZXIsDQptYW55IGNvbmZpZ3VyYXRpb24gZXhhbXBsZXMgaGF2ZSBpdCBlbmFibGVkLCBh
cyBpdCBpcyBhIHZlcnkgcG9wdWxhcg0KZmVhdHVyZS4iLiBTTyBJJ20gd29uZGVyaW5nIGlmIHdl
IHNob3VsZCBub3QgcmF0aGVyICphZGQqIHJ1bnRpbWVkaXIgdG8NCnRoZSBwYWNrYWdlIGlmIGl0
J3MgYWN0dWFsbHkgbmVjZXNzYXJ5Pw0KDQpDaGVlcnMsDQpRdWVudGluDQo=

--_000_OSRPR01MB11597C7F6613BFB38B068B92A9BF3AOSRPR01MB11597jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
&nbsp;Hi Cheers<br>
<br>
Thanks for your answer.<br>
<br>
</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
&gt;&gt;Does kea work properly if the directory pointed at by runtimedir do=
esn't<br>
exist?</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
I tryed to start &nbsp;kea-dhcp-ddns.service in runtime and the runtimedir =
/run/kea/&nbsp;was created on startup as dbus.&nbsp;<br>
<br>
root@qemux86-64:~# systemctl start kea-dhcp-ddns.service<br>
root@qemux86-64:~# ls /run/</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
agetty.reload &nbsp;dbus &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; klogd.pid &nbsp=
; &nbsp; &nbsp;log &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sepermit &nbsp;=
 &nbsp; &nbsp; syslogd.pid &nbsp; &nbsp;udev &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; utmp</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
credentials &nbsp; &nbsp;kea &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;lock =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; mount &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
sshd &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; systemd &nbsp; &nbsp; &nbsp; &nbsp;=
user</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
root@qemux86-64:~# ls /run/kea/</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
kea-ddns-ctrl-socket &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kea-ddns-ctr=
l-socket.lock &nbsp; &nbsp; &nbsp; &nbsp;kea-dhcp-ddns.kea-dhcp-ddns.pid &n=
bsp;logger_lockfile</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
<br>
So I think we can remove ${runtimedir} before do_package.</div>
<div style=3D"font-family: Calibri, sans-serif; font-size: 11pt; color: rgb=
(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<br>
<br>
On 10/21/25 8:46 AM, Yiding Liu (Fujitsu) wrote:<br>
&gt;&nbsp;Hi Cheers<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When I changed to EXTRA_OEMESON, -Drunst=
atedir=3D${runtimedir} will be enabled,<br>
&gt; and&nbsp; it will produce /run directory which will cause do_package Q=
A Error as follows:<br>
&gt; ERROR: kea-3.0.1-r0 do_package: QA Issue: kea: Files/directories were =
installed but not shipped in any package:<br>
&gt;&nbsp;&nbsp;&nbsp; /run<br>
&gt;&nbsp;&nbsp;&nbsp; /run/kea<br>
&gt;<br>
&gt; So I remove ${runtimedir} before do_package.<br>
&gt;<br>
<br>
runstatedir is &quot;The directory for installing data files which the<br>
programs modify while they run&quot;. Looking quickly in the source code, i=
t<br>
seems this is used mainly for control sockets or PID files. Which is<br>
confirmed by<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWAcfb7fa3a-dd09=
-bfa4-3cfd-0f20cf282c53" href=3D"https://www.gnu.org/prep/standards/html_no=
de/Directory-Variables.html">https://www.gnu.org/prep/standards/html_node/D=
irectory-Variables.html</a><br>
which is pointing at by<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA54833a6b-1c3f=
-c3ff-eae4-807c2fa16fcf" href=3D"https://github.com/isc-projects/kea/blob/m=
aster/ChangeLog#L211-L217">https://github.com/isc-projects/kea/blob/master/=
ChangeLog#L211-L217</a>.<br>
<br>
kea's meson explicitly generates an empty directory for this path,<br>
hinting that this is necessary for the programs to function correctly.<br>
<br>
We have another recipe removing runtimedir which is dbus and it's<br>
removed because &quot;Remove /run as it is created on startup&quot;.<br>
<br>
Does kea work properly if the directory pointed at by runtimedir doesn't<br=
>
exist?&nbsp;(Note that kea's meson creates a subdirectory named &quot;kea&q=
uot; in the<br>
runtimedir directory).<br>
<a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA47d4cc76-a9e5=
-50bf-d9cb-d0158b00f3b6" href=3D"https://kea.readthedocs.io/en/latest/arm/s=
ecurity.html#securing-kea-administrative-access">https://kea.readthedocs.io=
/en/latest/arm/security.html#securing-kea-administrative-access</a><br>
seems to indicate that CONTROL_SOCKET_DIR/KEA_CONTROL_SOCKET_DIR is used<br=
>
for the control channel which is disabled by default but notes &quot;howeve=
r,<br>
many configuration examples have it enabled, as it is a very popular<br>
feature.&quot;. SO I'm wondering if we should not rather *add* runtimedir t=
o<br>
the package if it's actually necessary?<br>
<br>
Cheers,<br>
Quentin</div>
</div>
</body>
</html>

--_000_OSRPR01MB11597C7F6613BFB38B068B92A9BF3AOSRPR01MB11597jp_--

