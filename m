Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E4EC369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 02:57:53 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web11.255.1745377068450000602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 19:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=f5VQ+4WC;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1745377069; x=1776913069;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sTHZ8rCTE+rwo8SwWEoeshbQiE46JHkXfKtLFyMi1j8=;
  b=f5VQ+4WC9kS5r03o++3cb6jddMidGnsazFBdlh3ebOqIq4xg/opp7vSp
   wlbmDc1kN6ehEdhLFw6aLygQyEznIV15vegBs5DJl2uDDkefF1sW/4x+h
   tg7d6HSrjQjLFt3Y2N1DF+PRMuw/xFDk6TSpnB99nk/srOVslQzHj+W/E
   xRwwhgjGKxeprqX0YoHE7mevRYTrY6uoSvFVFa8ITHEct+7oDmLHPscp7
   V4DzL/6RXx9T6bIZBoiQH3PKtHTLjvZsAifSyFLgpurbES8b38GarU5lU
   7btriw40AhLBDBVeLn5Iqo5yL3jsEq9fIJlIonc8pzRfU8SBhs/6AiWqg
   Q==;
X-CSE-ConnectionGUID: +P5WGWKuTU6kKL0BkHO87A==
X-CSE-MsgGUID: aIwcYvoqQvy2sKrxszXxkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="153105777"
X-IronPort-AV: E=Sophos;i="6.15,232,1739804400"; 
   d="scan'208";a="153105777"
Received: from mail-japanwestazlp17010005.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 11:57:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ketR8bQFAX3GKL0PnMQrYeO634pOLzfeXlnJ2N/pxEHArLLaSpPAtD8RDrDjYBqTaEQfAPHqbIHCzvCIWuT73o45oZtdqpquOjR+ZkK2YLQP4k2OFMu3I0Nijj1EBxRtBfgfFXm4FsoKp/kA2d4vw1PtsmCJlfps5dIlmMVtwUTTHXVlCJ8EcIw+92nRmHbN/0z4ORZVzudobXjji7Ya0Qb9leHUjk+Sm0HFXgUFfnPCNDZQBwkC2YNR9e5gOV1zbnpXwy7mAXp56W75RAYyB6Wgvu/G/TJRympr/jfLRNsyyA6rH3eWGT2RyxTRDD3HxIWlo/3cHPmenxB2KsKzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTHZ8rCTE+rwo8SwWEoeshbQiE46JHkXfKtLFyMi1j8=;
 b=gNcv83b7zyIj/mB/D7bLp0JI1UPRYVdks/8AB1ANtv+H/3ofM5yIyPa94GpBmyFH1pFfuEH9Rx7h4555gFYTTxp6BQs+x74v2JsnWBTANcBoXr0nk//7vLahfzm2/RjdwqlkMETKvrWivCpCzLi5phBXi3fjkvZCRlcIes0Fgxm/hyFGoAO5k8N9v5si8oZIpzEBmZIEuHAlH7PNEmgr43KN0SMAv2OhJYkRUUGv6QfUzgV47vdPN4v/UTt01BnwcWxFoPG3xLkT/lrvLykJZXUfXO4pNoYaINe6xos/otKaMt0a+7JEg0LSSggFQSIWoSSQMkaKtR/9A3PvGj+9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::12) by OSZPR01MB6988.jpnprd01.prod.outlook.com
 (2603:1096:604:13c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 02:57:39 +0000
Received: from OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014]) by OSRPR01MB11597.jpnprd01.prod.outlook.com
 ([fe80::cb27:d71e:9f8a:8014%5]) with mapi id 15.20.8632.035; Wed, 23 Apr 2025
 02:57:39 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?utf-8?B?5Zue5aSNOiBbT0UtY29yZV0gW1BBVENIXSBnc3RyZWFtZXIxLjAtZGV2OiBG?=
 =?utf-8?Q?ix_install_conflict_when_enable_multilib?=
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when
 enable multilib
Thread-Index: AQHbszGEH9kKtmbjvUuy0D4qNO16KLOvidWAgAED7rA=
Date: Wed, 23 Apr 2025 02:57:39 +0000
Message-ID: 
 <OSRPR01MB11597919FA3CED6340A6AE10A9BBA2@OSRPR01MB11597.jpnprd01.prod.outlook.com>
References: <20250422025127.605-1-leimaohui@fujitsu.com>
 <0603ED6B-9982-493C-9E7F-038240C4942A@arm.com>
In-Reply-To: <0603ED6B-9982-493C-9E7F-038240C4942A@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MzYzNjNlZDQtMmNhMC00N2U0LTk3ZWQtYjM5OTI1NmI4?=
 =?utf-8?B?ZWZlO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA0LTIzVDAyOjQ3OjQzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSRPR01MB11597:EE_|OSZPR01MB6988:EE_
x-ms-office365-filtering-correlation-id: c0b3b502-4d3c-4b9f-fd4f-08dd82129bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OHRwWVM4cnhqQXVIVEdnQkNiMVdoamxPbXZJNXcxbUVYOXNETXNybEpXbGlt?=
 =?utf-8?B?Z0QvekxnR1lRV3lhYWxuSEJSSG40TGkxVFNQcndad3VUYjd2TnU3NHgvNWQv?=
 =?utf-8?B?ditrUWpZRTRHa0pwTFdBRmxPempPWDdHU1dDdXBoRlVER3pZc0xhVzN1TXkv?=
 =?utf-8?B?SWsvNzdaR1NZUTg4aTZrTTlNaHhQWitDRzJGL3NDVmxKb3B3eDd1K1BONThX?=
 =?utf-8?B?SDJ0dnVKb1luTkRPVFNVOVlUeHZMa1l5TjZQRDNiK09SbUxCVkoycFowYnJj?=
 =?utf-8?B?SWhvcTJYQm1FZlFRdTFWVVMzU0N5L205cFlKeS8rL3BWY2lQUnc2MTJ2b0FV?=
 =?utf-8?B?RGx2ZlVLdU1oNnlwSVpMRnZYczlNN1YzTDJCZ3FlOWVBY2FzbUVNVVFPUFVw?=
 =?utf-8?B?ekNTRm9kQ0dWUU9mVEtOTHErcUc4U1kzTSs2TGJOc1lkZHZSZENRQzdzZEV5?=
 =?utf-8?B?bVlXM2MvM1B1eXA0SUhkK3I2TTBPN2ZGRWR2STlGYW1wSzUxUEVNNnZsa1Z6?=
 =?utf-8?B?Z2VkT2lQQllMMWR6dWJpSjFTL29PY1M5TUJVeU5XeVZTRWpTRmR4ZS9rM0tY?=
 =?utf-8?B?T2hoYW44YVdlUE5oWThPdkZTRjhua0huL1Y0QXJZNXg3NjlSUi8yV2hnaUdv?=
 =?utf-8?B?M0FuSDJ2eTBqQW41VXIxTEc3RnNFZlFnR2M4dUllWllqVW1TaituMjNadXA0?=
 =?utf-8?B?Zm9ZYVJIZlptMHE2T2JLTTZTRFlNMVF1SHNTdW1STEYxTVZXRFhNSWl4WUsy?=
 =?utf-8?B?MU12UlUwZ3dsV2RUaGo1d2JwVmJkMGhvVjlsdjVTRGJSTU1KV1hlb0Jqeito?=
 =?utf-8?B?NktWNW8vSUdobEZ1ZDZFK0VuYUZwNmlNTzJabEhvUWJRTUl4TWJRa2paaURI?=
 =?utf-8?B?YWh1VzQyUWJNdWxia2xkSDZScE5EVFo4djlRbmtQR0tEVWYyeTQySys1azNV?=
 =?utf-8?B?UDNJcmp3Q2RmcEJzWGdBQzBNb1ExUlI0NFhwTDc4Rmp3cm5rUzhhN2ZjUXk4?=
 =?utf-8?B?UElrb2s5ajM4OTFXSDA1TTNLc3A5N1Y4UWs2My9MQ1NpZWU5Q2JoRGo5NVp0?=
 =?utf-8?B?NHVUOHl5ZWtFRkJhbWIzTmRMdHdXbmpWcXU1UVZZeHNqSVhPRWV6TktlQyty?=
 =?utf-8?B?dld2N3docGgwVHdRMUF2emJlUjBCTVFRV2x4dmF2TXptOXlnL0JCazdFMlNK?=
 =?utf-8?B?azhTaU1nL1FYMTNoY3J0VFNFLzZodk5xenhTR0FNOWxrNTRFSkRoUC83YUN5?=
 =?utf-8?B?UU1WRVAvRHdVMWlBaWc3M0d4d1dkK21UYWhHZFVFcmpzVEVHdGxjVW8vTkRR?=
 =?utf-8?B?bmhFY3h3emFReFVvM0tSbGxSSFdYLzk2cGVtT1ZsbWszcEFoaHJsSXBQMGRE?=
 =?utf-8?B?WmhFeElHMlBCdWlQaXZpb2d2a25EZ1hFOFptbCszeHVHK3diY3ZOMVlaVUJQ?=
 =?utf-8?B?b1NMdHp2ZW5Ca2tIeFJXWCthNUxPWGQzVzB1VTl3ZHhLUXFxRWI5S01NZU9o?=
 =?utf-8?B?NlFtRTJ2S01qQjVEYTRkcUg3U3M2YTRPQVNQS0dQU3BpMnBUekJNT0t1RFZY?=
 =?utf-8?B?SkVKbm5pYmZRcStsaWJyRjFlblE1OXNaWlkvcmRBYTRHQlJldzh1ekhjSnBU?=
 =?utf-8?B?MGJockltMlNidGFmK0xVWU9LNGNTZk5VR1lVRzFEWWcwSFBJeTZKNkMvK3o2?=
 =?utf-8?B?c2JDbWlaai96azNIanlpaTl0RS91WTRSS2JwK1cvRlgzNmJGZ0lXY3d0SFFF?=
 =?utf-8?B?N2JzQnk1WXB1cENtRm5VbHlVZXFlRmxXN2oyYi92S0hpSHhpMFpidnFuQUtS?=
 =?utf-8?B?ZlNRK0VDaFR3a0VHQnV1U3dEQTY1UGFNV3Y4T2hTUmY5L1JXUTl4SC9vYWc3?=
 =?utf-8?B?YTNoM1N2Tm1UR0VHVlVoMm9yeXAxeDdQdHlKc1Awd3dEbm9RL2lsK2JSVHlo?=
 =?utf-8?B?bGhSNEx1aU1VUTFlUjdRZnptYXFDMHBUbkJoaVVrcVZlYmczdmJPZENIcGZ0?=
 =?utf-8?B?QnRUZENaN1NDeGVWNzZpdDdkNjNxTE1lZU1UZUZMLzdkUndtNVpPTVVVN293?=
 =?utf-8?Q?rNmtEO?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11597.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTlBZjNRTC96OHNiaTF1bzdVazFBc3h4YjFrM1drdldDUTVjRk4vVXdlV0VM?=
 =?utf-8?B?b0ozVEx3dUE4OXlEckJJNGtXVHh0UUxCbnU1VWNKaVlDL2N4OU9IM2JFR0lF?=
 =?utf-8?B?UXl1NWVPUE4wQnlmTVBGRXFPU3RweWRuUmw1T3g0akZvUTFyenV2a3VqVjNo?=
 =?utf-8?B?N1k1MGhWdmg5WU8rOWhSWS9MZ2NKSUl5Sm81dVpoUEJOeHA5R3UvTm1GMnE3?=
 =?utf-8?B?ZktnTWdSanUrYVNiRlZLam1TeTlUN0NqNzNsZ2FidklLQUpiaXVKN0xqUklr?=
 =?utf-8?B?bkpBaTI4blRSZFpRQ2trRHZmdWsrRDZZbzc5UFZXVFR3RnhoRFlhcFhJQTRU?=
 =?utf-8?B?UnRuaUVyelBXYWJQOE8zWkljRi9NQTRsdFFKaG5VMlZwZG1CRjRDZXFuVWli?=
 =?utf-8?B?TkxwbVBBUXIvQUpFVFV5UEt5NnkyNlY4K1pTeHlkdllDUzlUNkE1YXlyZ3Ey?=
 =?utf-8?B?eXcxRmtjQ3FEY2RDZTVUU0JoTXhhUU9SNGZpYWxrSGVOL3hJcHlKYjNOVS9L?=
 =?utf-8?B?TjZVdDR3L09zSEhmTSt6RmtZOE1KSnJ4SWpXZm54U1hvS1pqZEVaWnpvY1JX?=
 =?utf-8?B?SkloZ2U3TFltWmMwY0E1MVlTRGx1KytiV3FsQ3A5OGZoZitIb0ZCNWhRTU84?=
 =?utf-8?B?ZVBjWndoVE1rVFQvM2ZRUVdZWmQyai9PWG1xcytJdUZGSWpNaXVKbnlnSkc1?=
 =?utf-8?B?a0IvbFUva3doTkpaYmFSNzluSVl3WnpVY21DWGYzRE9BUENkaC9ET2k5VzJs?=
 =?utf-8?B?UGZGR0VpWm9RYzk3dDhDdjJTeDFKYk9KL3dMNjZyOXNOMkI5dDVyNVJrUTZJ?=
 =?utf-8?B?OFNGK1puUW42eEluSjhEbkt5QWRqbDQ2YmxNWnVRamRVMlM0ZGFkanRLTGVh?=
 =?utf-8?B?MDUvWWZxWXE3T1VENHBDZkdiQkp0LzJTckFDWVlVRjFFUW5WUE9TNFRrMUgz?=
 =?utf-8?B?QUhlU2p5VGR2OWdHcHVqRUt5YVV2UmV5SkxVSVJ6dDFHSGsydnY4Sytab3Fm?=
 =?utf-8?B?ZE1weng3ZnBDdHJ0THd3Z1B1QTFEZkhDaHljamNkb1VFekhZN0tWS2pUbGZQ?=
 =?utf-8?B?SFh2N1VoYTVHSUlEb2FGdW9jNzY1TlZiM1B2bDRSWjhHQUp6N3RUNllnaVNI?=
 =?utf-8?B?QXFOZnlMTXdCQ1lLV0ViTmoxQVBSZnI0UmI1bHhVVmJSL3RPcjU5K1RvL1pu?=
 =?utf-8?B?RTlYaWwydjBQdXVJQjB0TE55VnJ1aDRQSkU2WWRLZlhyWlI0ZWVjQXJRaVlx?=
 =?utf-8?B?U1orRGQ0WitEbW5aNmdjYlBUV0xuNWJGY1UvaDJ3Z25iZ3lnMTNWWTZYWkdD?=
 =?utf-8?B?ZGtENG5ZVkFaWjk1dk5hNE9jbVBMa3FIaXZ3eXJvV28rQllaV1BRTjVzdGxD?=
 =?utf-8?B?UkJvT3pvM1RScjhDQkh3YVBaYUloeGQwVE02YU5zSXVxOVprM0hSMDcySk9a?=
 =?utf-8?B?OGIyMnZlUk85WVZ4S3ZSTVlXTVpiUml2c3psdVljR08ydjZ4VDYrK3Avcnhi?=
 =?utf-8?B?VTN1TkhUdXByUnlQMjlrcjg0ZkNBQW1IWjdYK3dlN1hHd1NMejhkMStzNGdl?=
 =?utf-8?B?OU5CcklxaWpPeVFybWdVR1Ntak83SFJFb3J2RDJSSE0vT2hCbFhHRzVRSmhj?=
 =?utf-8?B?eG9NcWppMHV3VVhnWW5zT3U2cTJONWF0NjRkMDAyNlBXOUxETUxPMEdSM1No?=
 =?utf-8?B?RUJseUdtUFRYRjY3eDVvNy9iTUtYRjg2NGtSaEpBVGcrY0lLWTdDMmlZM1hn?=
 =?utf-8?B?UTREMFlEaXJkbFBUeXNkUUJTUXZaemFTVlhyVktIdlNreWdsU2FoSkZRSm1Z?=
 =?utf-8?B?dXhmQmo4TjRRRytQenphbjJMbFNuZkcybEdQZExocVdQVzZENisreEtvMW9K?=
 =?utf-8?B?VjltYi9VZ1kzMlZWdEJZTmwra1ViVjJQdjlPOFpWYXVPNllwYllVbDg5RDVV?=
 =?utf-8?B?MzJEbTY2N2xKUHRSZy8waTc4ODF6dWtqSTZaWTVQblJ0cXYyMDhyMDBydmFz?=
 =?utf-8?B?NlNMc09zL3l1b1VqNnNRVWVxNGRtaUxCa2Nmb0VJOEpCRzBQRlhiclJvQ284?=
 =?utf-8?B?TCswZUZGYzlSbkFsTm8vWXpvOTlMWHlrY2REMnJRUXl4VnFMZUN1TlFjbnpP?=
 =?utf-8?Q?fNFNR/zOLfFC+s+Lwu4MOuvND?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Z8Na7Hf0+BhAVwCVbArYV4RzlXQ3ygg9fHrWtajV2Y7F/6nMg32nH50NQ/lR7ClB5N5CxW1UQBQns4UrZSH6C294NcYZHpFh0QUx4w8yb6VcuOmvk7G7asQY6uggTYx+gV5rbUPyJfANL6ZjwdhZpRJg7qkEJU5ZXz33f3WMmF9lWbTf3//OgK9OOEk7AzFKeHlenGVOWtlA1pbpS5dXLLZ0vWpPjNc0kmq+AnoMFv8jMXePFhAly6K/7heXUowgUzjcPgzYhOB0Jx9r4Y1AX1RCykvFWDMw+DTl2riUUoo94rIt/mloQrFxEThZjPsRnWUHpSF7km5zuQdcvqR/R7Q4nsS+SpAuEbBXs90a6ydNAJgD9V5QaA2WFd7I5MOkxUzyfmGriwQAqBIT9zahte8bgXRK722SgCzPXJ+/OI3/578/0CbLmOhusQyteZbaDvRDKZ2P+GyKKqPzJAMgITztp4Vcy0fR4zCu7Ubh+5wmwXkoPgWurDi4p6cDC3L1w5tNYwWiJKothNUtHMv5FOevkdglDE4gqiHUe1B13AA3ioos+2RtfmLTU6pEWHAtiDM4P7g6Gl4/I7WlU+++ky6ZLjUmiOrm1EJiUl43YPKRpy4ptheHbGWyw5wT8xuE
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11597.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b3b502-4d3c-4b9f-fd4f-08dd82129bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 02:57:39.0466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0oEufVPmog/d86++1T0pMHDuVF1uRHZ2aS98qjhK/VMrbRzkOOCkhg2zqJpe0c8Gnq7HDi3k2UOQ7+cPMA6Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6988
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 02:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215258

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IOS7o+ihqCBSb3NzIEJ1cnRvbiB2aWENCj4gbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiDlj5HpgIHml7bpl7Q6IDIwMjXlubQ05pyIMjLml6UgMTk6MTcNCj4g5pS25Lu2
5Lq6OiBMZWksIE1hb2h1aS/pm7cg6IyC5oWnIDxsZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IOaK
hOmAgTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiDkuLvpopg6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnc3RyZWFtZXIxLjAtZGV2OiBGaXggaW5zdGFsbCBjb25m
bGljdCB3aGVuIGVuYWJsZQ0KPiBtdWx0aWxpYg0KPiANCj4gT24gMjIgQXByIDIwMjUsIGF0IDAz
OjUxLCBMZWkgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
RXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJyb3I6DQo+ID4gIGZpbGUgL3Vzci9zaGFyZS9naXIt
MS4wL0dzdC0xLjAuZ2lyIGNvbmZsaWN0cyBiZXR3ZWVuIGF0dGVtcHRlZCBpbnN0YWxscyBvZg0K
PiBsaWIzMi1nc3RyZWFtZXIxLjAtZGV2LTEuMjYuMC1yMC5jb3JlMl8zMiBhbmQNCj4gZ3N0cmVh
bWVyMS4wLWRldi0xLjI2LjAtcjAuY29yZTJfNjQNCj4gPg0KPiA+IGZpeGVkLXNpemUgZGlmZmVy
cyBiZXR3ZWVuIDMyIGJpdCBhbmQgNjQgYml0IHN5c3RlbQ0KPiANCj4gQWxzbyB3aGF0IGV4YWN0
IGNvbmZpZ3VyYXRpb24gYXJlIHlvdSByZXBsaWNhdGluZyB0aGlzIGluLCBhbmQgd2hhdCBpcyB0
aGUNCj4gc3Vycm91bmRpbmcgdHlwZSB0aGF0IGNvbnRhaW5zIHRoZSBkaWZmZXJpbmcgc2l6ZT8g
IEkgY2Fu4oCZdCByZXBsaWNhdGUgd2l0aA0KPiBxZW11eDg2IHZzIHFlbXV4ODYtNjQ6DQo+IA0K
PiAkIGxzIGNvcmUyLSovZ3N0cmVhbWVyMS4wLyovaW1hZ2UvdXNyL3NoYXJlL2dpci0xLjAvR3N0
LTEuMC5naXINCj4gY29yZTItMzItcG9reS1saW51eC9nc3RyZWFtZXIxLjAvMS4yNC4xMi9pbWFn
ZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLg0KPiBnaXINCj4gY29yZTItNjQtcG9reS1saW51
eC9nc3RyZWFtZXIxLjAvMS4yNC4xMi9pbWFnZS91c3Ivc2hhcmUvZ2lyLTEuMC9Hc3QtMS4wLg0K
PiBnaXINCj4gDQo+ICQgZGlmZiBjb3JlMi0qL2dzdHJlYW1lcjEuMC8qL2ltYWdlL3Vzci9zaGFy
ZS9naXItMS4wL0dzdC0xLjAuZ2lyDQo+ICQNCg0KSSB3aWxsIHdvcmsgb24gdGhpcyBwYXRjaCBv
biBiZWhhbGYgb2YgbXkgY29sbGVhZ3VlIGZyb20gbm93DQoNCnJlcHJvZHVjZSBzdGVwczoNCjEu
IEFkZCBpbiBsb2NhbC5jb25mIHRoZSBmb2xsb3dpbmcgbGluZXM6DQoNCiAgTUFDSElORSA/PSAi
cWVtdXg4Ni02NCINCg0KICByZXF1aXJlIGNvbmYvbXVsdGlsaWIuY29uZg0KDQogIE1VTFRJTElC
UyA/PSAibXVsdGlsaWI6bGliMzIiDQoNCiAgREVGQVVMVFRVTkU6dmlydGNsYXNzLW11bHRpbGli
LWxpYjMyID89ICJjb3JlMi0zMiINCg0KMi4gYWRkIGxpYjMyLWdzdHJlYW1lcjEuMC1kZXYgZ3N0
cmVhbWVyMS4wLWRldiB0byBjb3JlLWltYWdlLW1pbmltYWwuYmINCg0KICBJTUFHRV9JTlNUQUxM
ID0gInBhY2thZ2Vncm91cC1jb3JlLWJvb3QgJHtDT1JFX0lNQUdFX0VYVFJBX0lOU1RBTEx9IGxp
YjMyLWdzdHJlYW1lcjEuMC1kZXYgZ3N0cmVhbWVyMS4wLWRldiAiDQoNCjMuICQgYml0YmFrZSBj
b3JlLWltYWdlLW1pbmltYWwNCg0KTGl1IFlpZGluZw0KDQo+IA0KPiBSb3NzDQo=

