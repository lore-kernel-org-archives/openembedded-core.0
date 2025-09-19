Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BBBCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:03:06 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.12055.1758272583949192365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 02:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=K8wh0e8C;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=Qb+587h1;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1758272585; x=1789808585;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UFVKMHXCoWsRUX5HiwPleQ7GZYvphlLgebrrxYxWNb4=;
  b=K8wh0e8CqdqsDJfs17Dq2RyqNKDsj64Btne4HLifV26rhTNobz4kedND
   uh+p5IlAbJC+uc62VIKw8A76d/y0Wu+Kl6WgSaSnVBqSKn5GXA+X7iih2
   FxQLUawV6w9DdobP6Te5yz+zmg1SxEgWKN7MzIP4TEecEnzj2aBec5knN
   U1XB5SxXzYctdXD6ptI2kKbDi/m9TG9CaBKvmluA9cuoxOaGJlyfFSw18
   8XLJQLdFLmGx0QizDZnGoTeTEr+0xpNhm18yK61XCGTshVy9J7EJxpVsx
   9OLM/9OVbRt9LARHEgpdMZs0Sm6HH8s/ltBRiO53YBHJy5NSr7blAfsg4
   Q==;
X-CSE-ConnectionGUID: Oboi76noSairjwlBB18dKw==
X-CSE-MsgGUID: e05A4gR8RiOyrMd8gVa9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="167918002"
X-IronPort-AV: E=Sophos;i="6.18,277,1751209200"; 
   d="scan'208";a="167918002"
Received: from mail-japanwestazon11011066.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.66])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 18:03:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLDqPGhNM0z5now9Dr6NsOw3Mg4ed4N3aGOchK7qcRKFc70OslZq1sVQ2hbC40pxzDeu7B/YbbM/fb7EUfpARY5IA0Sko6DXq+Ekc6De+bFvM/ivnH0bRRWhnugCEL98SoDMed6g5wOiHaV4+sxR+S37GrM8RWOyHIlu2Bq32k7/E3NgdVN4NjAWMC6YwBeGEUVV+qV7u27CjeZprH37xS+EBFinC4P0FG3lOY44GxMjMOCmhM/NBxF1DYySIufDS2ekxYM60k7H/sohRDjHDPihTw49XXRgTCn0mo5WKkr31+B6miLr6js11w27K1CW5NvpqyyjWikUGBWxe5pjew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFVKMHXCoWsRUX5HiwPleQ7GZYvphlLgebrrxYxWNb4=;
 b=D0931Y+ZttzXKstnU/pBSqTjvAGfaw7I4VdOYzgh6Y2VRAl3vyJrNQtAwTIn+1phI/B3OngdaglvlMh58AZSKhmY7fOylqo6w7oLwqPwbMOOkg1IfhAlpYx431sSCjhOfjYSj+YuIYFmIUzHs0w7LZ0W1QiVlEYImRmLftjQk45FIdpcVBraF9nywVMGf8liODl33FrEA1ZYzbF4lxe2J7nPRHZSdWRNkV/6O29xKkoKh8u0y3OQY1Q+FIF/nSk+pjHd4TtXSUrd10jL0oymQy0nnEwZDL336LXRje7LWNYVT8NORFMoDjZveuL0ZzBwB1R8kVVJTvTWWxaLmITqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFVKMHXCoWsRUX5HiwPleQ7GZYvphlLgebrrxYxWNb4=;
 b=Qb+587h114VJ5CAIMNtv1fAsLvSgA1YXGoZn6YICXqtqJL2yVWDMu7S/yHIQ4qNNSGKhWrGGa5Vi1iofhavzWzJ5SsYgak0xLA3I6sC1UVfcjzLfmR4gF5pkvZLdaTG0pEndf72T/YJRWaVfHnZBmsO7+B7F7a7kMHJigcnK7JGWZCdiC2VTpHw4Drhr97u2D6pFYacu3gJaQzS9M9r+U7glEi62RRlK0QIl4PeS5Kv2Z8ewwDPMYy6nSvIe9YhimP1JvK6TWSrSAnkxF3F6PtgYrgDs78unZl34yT7HmovXW9qJpL1LIGPDXNvzM6j4n5oBuNokQMpb3WaodJaWng==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY7PR01MB14405.jpnprd01.prod.outlook.com
 (2603:1096:405:23f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 09:03:01 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 09:03:01 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 39/40] tcl8: upgrade 8.6.16 -> 8.6.17
Thread-Topic: [OE-core] [PATCH 39/40] tcl8: upgrade 8.6.16 -> 8.6.17
Thread-Index: AQHcIjPcSSpsTzqn3E6FudWx7kntSbSNhv4AgAy8CQA=
Date: Fri, 19 Sep 2025 09:03:01 +0000
Message-ID: 
 <TYWPR01MB118614AA7DC72CC6EF86117DEDC11A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-39-wangmy@fujitsu.com>
 <DCPRDM0BB7WS.1HR2FA1OV8AJ3@bootlin.com>
In-Reply-To: <DCPRDM0BB7WS.1HR2FA1OV8AJ3@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ActionId=5ae25e1d-b7c9-4236-a0a3-47874644d081;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_ContentBits=0;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Enabled=true;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Method=Privileged;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Name=FUJITSU-PUBLIC?;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SetDate=2025-09-19T08:59:37Z;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_1e92ef73-0ad1-40c5-ad55-46de3396802f_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY7PR01MB14405:EE_
x-ms-office365-filtering-correlation-id: 38ec7fda-cf66-4560-de03-08ddf75b5603
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?gb2312?B?blgydFIza2k0QzFNNmdUMmF5K1RXWVlLaHEwQTE2YWtQaHVyWG1jakNtdEcy?=
 =?gb2312?B?cGZyWDEwWFVHVUhsbWhQTm4vSXlZUXhQMDRhZWp3RUNyUUxLQkVuN3VjbERI?=
 =?gb2312?B?aE5hT2NYbE9WdUl4amJsT3RMTnFMcGFoTHRQWUMxNG9ESUlxWkNLWVlodXlk?=
 =?gb2312?B?Vk4ydkhOZlZzZ2JIUGtVVWR6VWVselNmb1orSEcrMTNEb2UyRDA1dW5EUDZn?=
 =?gb2312?B?bkNNazROc0puYXFtb1dRK01JaUg2dzFtT1FnN281S1BNNGFRUTNqVk5uNzFn?=
 =?gb2312?B?TkhoZGk2NUh4cVczcVFWN3pHeHVpd2xnSHpSRk9VbDFsb0xWb29idmhJcVJS?=
 =?gb2312?B?MnI4MHVrc3RxS3lsZk5oZk5wekZRbDlMS3ovSHA5V2pNTTNkVFd3Qk9pVmdY?=
 =?gb2312?B?V09wSjdxakxhWHd5aitoRjR3dHg0Y2hEM0hZdm4wcUJxYjZOVjgrSHVqaTlY?=
 =?gb2312?B?amJkMzBLUnBJbE5wcWhPeXJBQWU4SERrcFJ5R2dLdDk1bU5KcXkrTUtGU0Nu?=
 =?gb2312?B?VGdhb0FJZHNPZUxINENvbklJU0VnbkFUeHdMbStkaS83bEZmM09PWG1jM0Yw?=
 =?gb2312?B?Y0NvMS95MEE5QzEyeGF1RDZnNkduVnNxVlpsaXBPK2EzUjBGTy9yRm9TOUdj?=
 =?gb2312?B?QVAvanZ3Nk9wazZwVi9zNzRHS201L3EwNDJrNnhQWDJEQ2Z6ZkJjWkdKUGJP?=
 =?gb2312?B?emZDYUZrRlMwWXhmRUxha2RHZFNiWjMxVnN1dW5LellMKy9qdTdKY0F6Y243?=
 =?gb2312?B?OE4xRi9tb012K3RXbkJrMnAwYTYyVTJGMG1hTnR4RmZhWnowRU0zUGxlTUFQ?=
 =?gb2312?B?Z3N4WlN1VkZWSnFQZHBPMlNyR1pJOTZ0eGRFeUlESkN1ZW1SVW4wbk9vSEla?=
 =?gb2312?B?WHYyeWNJcWY4V01GSjNKR0VyOWpHekYvazd5RUxoeWlUSGZxTUtqWlBxSjA2?=
 =?gb2312?B?enlNTlpiaXljQURGbHdWa1V4RUIxdlZyQ3R2MnphdkQ1aXl4S1FCU24yNDIw?=
 =?gb2312?B?aFVuRWlaMzFDRDNXVmoyU09RL0pIam4wU0x2dEQ1WFM0Yno2Mk9CRVlLaFpD?=
 =?gb2312?B?NVJnTjJONE5nQnRMdzBKalBpc2VsMHJiU3F0MHljRTlqSjlHVmF3R0J4bWZZ?=
 =?gb2312?B?L2U4Rk8xc3p0b0l4U3lIdlRCOGp6bFNjNGZaQm1JZXJmKyswUHdYV2pFdHRy?=
 =?gb2312?B?VnhMWkpGMGtxTytoeFg0OGg3NGdYeGdNLzc4WEFwdXBKanJnNFpPRnVFaytk?=
 =?gb2312?B?L1NsSE9VL2FpeHZrb2EyRGsyOEpLaFlZMXJBSWQxRTVaMnpkYkwyRGtSOXFQ?=
 =?gb2312?B?dE5OSXNLL2dTaVgxZG9IaWM1aFI3ZlZOZTZnNCtmK09MaGVQOTRXTkRYVmNN?=
 =?gb2312?B?OXBFRkVJcXVwa3cyRE10SEI5WGpuRkJuOCtEdFBTaFoybGhLb3V3UFpQYU1P?=
 =?gb2312?B?a3pyNWZrTHhWLzluS2VGRVJDSmJSbTdjSTlMaDRNZVhRaUVHN0UvcExEYmp1?=
 =?gb2312?B?VnNOUkU3UWJGY1JsYnZmRTN5dlJEMno5YTZpek0yU2U1M1ZHTmlUc2pJQkk2?=
 =?gb2312?B?cXgrUWZZZVdldEMwN0tNd0Jud1ZvcFR6RkkwcnF4WHArNmJCVlc3TGk3RExV?=
 =?gb2312?B?dGkrVEd2emNWZnlPdU1Mc1M2TU9XLzFDUE52NCtEeTRjTFBKN2twUUMzeS8v?=
 =?gb2312?B?TktiaDY1QWh3RnZxZjdLK2E4TllqeHJBdVZXYytORVJSd2loY1lkWG5qSUdG?=
 =?gb2312?B?Y1UrbWpyV3dFS2QzT1lvQ1dSU3NZdHpZQVV1L2dYdG41ZjVuVk5WSGlZVklM?=
 =?gb2312?B?WWJPT2k3VWZkR1pQZFc3L3NtVnZVOGY0cVVpbnNFTzBKTWVlWk1KcXJBTlVO?=
 =?gb2312?B?V3hRNUlxN2loeUhYSDdnQTlIaUdWdEwzL0xCMjFRU085NWxZVzZRbkV5c3lI?=
 =?gb2312?Q?ix1cSQeJzeK7r9Sd5CCGp0LnSkB0OoJx?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Y29QWTNlamJPN3pQV3NucHFHTlRxUDRibG9nd1hnZG9sdTFkcUgrdmhPN2tK?=
 =?gb2312?B?L0hBTVBpNzFYUUY5aFNMSGNzWjY2TzFKK3ZkR2oySnM3QXZiOVFGa0tMbnBL?=
 =?gb2312?B?YW8ycERqVWovMWlMdHFMQmpDL1I4ZHNoV3VvN0UvVmh3dXJHUnRIMlJvdEcw?=
 =?gb2312?B?RFhvQVR2VWFBcHJORmdrMmNzRkhsbk9tallUUUlrR082V0dhWFExVDVwdUVG?=
 =?gb2312?B?NVZTZHV3VGIzckN0QTYyL0xzOEI2ajI0NzlKVXdDYlZHSURGNFQ3Mi80Qkpq?=
 =?gb2312?B?RUVGVjBzUUFwZ2NHZ1ZmY1pHU2xYSFBmekZRUjVzS3ZZQ3JYbzA4TXNwdEo0?=
 =?gb2312?B?YS81eUR5YitXdDJmVXh2dWtXbHJyb1ZlcEszMWphWFQ3TG1VR2ZybXV1SW9i?=
 =?gb2312?B?U3VvYUhIWi9jQ0VjR05nUysvSWFhNCtmNmlkcnM3aENrOURhcm1PWHRRamdz?=
 =?gb2312?B?RnZFQVAwTWxUdTlzWnp1MlN3VEluOGJtSlpaVjZvbEMzWGtxM2g2YzJkdzJN?=
 =?gb2312?B?eXRzeHBIQTI2RFlRV3RrVEJXL0Y3NjVFWDhiR0VYYVM3QlozTWtHVTc5T0Ix?=
 =?gb2312?B?dXBkVng1cDU3N2psWlRZYkpmQ3ovSlY5U0gwUEVTeUw1WEpkNmxGUE1yZTlo?=
 =?gb2312?B?NjNaRVBrYytaTUJMY2JlbXNoYzIzd2hwMEh2YlFUanRRdmM0RTdZVzlNNmJG?=
 =?gb2312?B?SzVWVTUzR3M3ZjRzZE51ZG1ZeHhlVG5oOGFrZDloUFhlVS8zdzVhbHZHQUJo?=
 =?gb2312?B?U1pOYXhVaWtsNEJvTUkzQVhDdXpKSVllYWlmTzVYRUV1ZFlJbzFIMXlLT2Jy?=
 =?gb2312?B?VnIra1FoRG81bXlYT2srdVZSUFFIWXVROFFoWWtjMnZHZ2ZXVkpBTTNkN0Rk?=
 =?gb2312?B?SE5QcTYyMVVpYVVaaUpSeTE0cEROM3l1cXE3TDRLRzdwd0dvekZwQ0xHQ3lH?=
 =?gb2312?B?V0Z6K3h6cVVzenhzblE4NERtWXR1eDI1ak13ZXJ0MmswOWYxdThFcHo2WWdZ?=
 =?gb2312?B?Yjl6blpURmtTQ1hieFE5TG0wN3EzQzBqdmgxSGNKbU1weXpnZXlUSDlwUFZx?=
 =?gb2312?B?aWtSQXRVTUo5dXU3bThRQlRyTHlaSStVVzJVZEhtMXl0S1huS2NrRmp5ZDRo?=
 =?gb2312?B?elRxSy9ZVGJRTUNVSEtYVGZFNVVXM3c5Z0ZkOTF6TVc0VW5Xb2p2WVlGOXlR?=
 =?gb2312?B?QTdCMGc4cXdoamtkdXNGRXlYNEdPa2Qxczl6WDFsYUNtRENYMGZkMVNuVjdk?=
 =?gb2312?B?V3p1bUtWOEpLZVMyMVFYSnB0U0VORVhoa09uRkxiVzIzVUJFN1FKVVFIdXNQ?=
 =?gb2312?B?N0lKS1F6dFpOSkVNQmlheXAvRjRaclNoZ0cwY1NhbDVvZnkydjE4Z2x1NWFi?=
 =?gb2312?B?Rk5GeGI3Qm0zbG9MWGlMUU0zaVlGZ2V6TDExU0ZnS2VSeGoyRFR1YzQraE9p?=
 =?gb2312?B?K2o4NFFSNVJOTHByRURXVGhuN0RRdDQwaG1DVWR6a25RbUZYVGE4MGdwSXdV?=
 =?gb2312?B?eVY1SnM5RHJhTlk3eXNDVFVDcFdGaWE0bjBaU2RtRy9lclFkRW5WRStZOXVt?=
 =?gb2312?B?VjFOeE1MRUppTitwcy9iRHIzWENEejBsYTJBUm5XeWVNVWRFK1BnMVRzVWRB?=
 =?gb2312?B?Z0dLMHhQSEkvQ0FVT01pOUhXcDFXSkhoN3VxSitPWENSZ05jZnAvejQ2enF2?=
 =?gb2312?B?K0IyaHRqU0kxL2pDUlZ3K1VlSlh3RGZzRmRkMm1VTXRsY0EzZ3R1bUtxc2FI?=
 =?gb2312?B?SHp1WUFVaGJqWGNFQkZzcHIvdXdnTWxDS0VyOFNlai9lZ1dkTjZidFF5citN?=
 =?gb2312?B?RlRST1ZqaXBlcFM2a28rQk1Yb0lLN01PYXRTcWdSaFdkWkF0NmQ2cnFCSWFV?=
 =?gb2312?B?NGwvMk5NMDhkZDRrZG8vblhIWXRiNXdhc21KMnFSUkJXd3NYamxtMkFSUzFm?=
 =?gb2312?B?clpmZGxadjlaSHd3WkhnQ2NWcEszSGN4bmlYOGxFcmxGWC9wbzZKZTMwSzM4?=
 =?gb2312?B?OUR4NEF1TElvK3hnWStjanVLYzA4T281REwvZzkxRWRPSFJmaXpIdmJvYU01?=
 =?gb2312?B?MjRtNk5KL3RhcGJsa25IaE1nRDd4aEo2SWFKd2FnYUNxZGt0cFZRZ1A2L2Jz?=
 =?gb2312?Q?wDmI2v/h2aufMUiZtf61zbu2L?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rghpjCbCRvkuNMiAGPwjtXm0QZ5VYP2H7hFdiE4glmNqI73Ds0Rhy8K+gHZ9JDK0FwkzzL90zicVYn9C2a7VKyDDu/5rGbz21Q42vCIirZKIDuSnnA+kOuziKrDocGDQt9LJtptlWCwMiYb3y9J7fPNsmtnM4piC/C+Pkoe/SHZ4v5O3Go8DAYpI9+X+2MLk0dFss2hb98yaJYIoWFIrCCbXuqxy96PKVD7i/d1w8A0Ga4kgoG9Isw897TEOYftuBi/2AV76mxaadh8fsUl8x5wwP5N4bD6aAs3bR4zwA0vH22ASjwIzG9sj/Cst+5eG7DTtW/z/zQYP818iOE7tFyyd2WmgOfFnGqeMEc7dz/4KjOEg+GXrZDB+AdbTYZNOJPZWw1tJvqOl2Swca/Gkb+apXP9WWE6+zcLFZ75ElcFawzxodZ+Sc2UnXKWgi1m+jdcTsy8HeI1mMli52DyQwxizTbb5gVQh+p0M5rZ8i0b6HzulHd89m378u1RxuqkDWfcGoLNz9J+DzHfsrrPW1DJWIkxuFTgkzPE/dC2Wru+h1M8vxa9RDIfJCNOOKW4X1KUfQuB0NgiU9ID14Sk4MgUsn/4/Q+L8DrfYVNcvwbQLdRZ6pxL2i7KG5KDNo7V7
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ec7fda-cf66-4560-de03-08ddf75b5603
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 09:03:01.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCm7JeSGKhibIKWwQ1KdczFu+7tvl7XMyZipzJzPjwNbYe/pE5VhIB+Q3UUFEuLROynLLSSpBtYqKUcDsP/uZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223733

U29ycnksIEkgbWlzc2VkIHRoYXQgdGhpcyBwYXRjaCB3YXMgYWxyZWFkeSBzdWJtaXR0ZWQuIFBs
ZWFzZSBpZ25vcmUgbXkgcGF0Y2guDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVK
SVRTVSBOQU5KSU5HIFNPRlRXQVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBX
ZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVMo7orODYrMjUtODY2MzA1NjYt
LTg1NjgNCkNPSU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdt
eUBmdWppdHN1LmNvbQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
dGhpZXUgRHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0K
PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDExLCAyMDI1IDI6MzEgUE0NCj4gVG86IFdhbmcs
IE1pbmd5dS/N9SDD+eikIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IDM5LzQwXSB0Y2w4OiB1cGdyYWRlIDguNi4xNiAtPiA4LjYuMTcNCj4gDQo+IE9uIFdlZCBTZXAg
MTAsIDIwMjUgYXQgMTE6MTYgQU0gQ0VTVCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IHdyb3RlOg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29t
Pg0KPiA+IC0tLQ0KPiANCj4gSGkgV2FuZywNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSwg
YnV0IHRoaXMgaXMgY2F1c2luZyBwdGVzdCBmYWlsdXJlczoNCj4gDQo+IEZhaWxlZCBwdGVzdHM6
DQo+IHsndGNsOCc6IFsnY21kQUgudGVzdCddfQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjEvYnVpbGRzLzIyMjcNCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNzMv
YnVpbGRzLzIyNjcNCj4gDQo+IFB0ZXN0IGxvZ3MgY2FuIGJlIGZvdW5kIGhlcmU6DQo+IA0KPiBo
dHRwczovL3ZhbGt5cmllLnlvY3RvLmlvL3B1Yi9ub24tcmVsZWFzZS8yMDI1MDkxMC0xMDMvdGVz
dHJlc3VsdHMvcWVtdWFybTYNCj4gNC1wdGVzdC9jb3JlLWltYWdlLXB0ZXN0LXRjbDgvDQo+IGh0
dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjUwOTEwLTEwMy90ZXN0
cmVzdWx0cy9xZW11eDg2LTYNCj4gNC1wdGVzdC9jb3JlLWltYWdlLXB0ZXN0LXRjbDgvDQo+IA0K
PiBXZSBhbHJlYWR5IGhhZCBhIHNpbWlsYXIgZXJyb3IgYSBmZXcgZGF5cyBhZ286DQo+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjIz
MDUzP3A9JTINCj4gQyUyQyUyQzIwJTJDMCUyQzAlMkMwJTNBJTNBQ3JlYXRlZCUyQyUyQ3RjbDgl
MkMyMCUyQzIlMkMwJTINCj4gQzExNTA3ODAxMS4NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0K
PiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

