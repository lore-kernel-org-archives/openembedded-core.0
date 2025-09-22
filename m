Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0AECAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 07:32:57 +0000 (UTC)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com [68.232.152.246])
 by mx.groups.io with SMTP id smtpd.web10.45969.1758526373366632971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 00:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=lLLnvw3e;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=XYJya54Z;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.246, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1758526373; x=1790062373;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=fvj3/Y537fXjZ7o+XA2QWmRg1x9CVfzRPBvcJyHTsbY=;
  b=lLLnvw3e9khNNMiwo2UA9nFI6YYE4v9HRAUQMGfoymz9YoAj9INr80Ut
   TD7bC4MI1YkXdS6WRPR13gusrrpqVZpiLfCudhEjKOCcqNsqjtqRH20V1
   cMt4gHI7IWJWZBh7GkPOSPE/iqURXRGYY7QiIPmBCuQsrExa22aWnHtey
   Duii3uTQgg10OQgRw2JZtLQDHueXPZ9KNKBIwUeyLFg8IwL9wkq+sCVl2
   SEwYWgazIK5IQvzI4cV2DyrvGwLRo25UbsXUWeJChC7frSkbP1rFR6LH1
   JQQrO9kgp4eSIK9Jsebv6jwvygcA9j7SWkF4hDnbvKPz3JiS+GGbgEC4n
   A==;
X-CSE-ConnectionGUID: Y9ca6nWjRGS5j+beF5h0yg==
X-CSE-MsgGUID: Zj9SESzvRayuTPOVwDxjdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="79431562"
X-IronPort-AV: E=Sophos;i="6.18,284,1751209200"; 
   d="scan'208";a="79431562"
Received: from mail-japanwestazon11011038.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.38])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 16:32:51 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYIlByY0QsOegV2URh9PEcLwl8SZfrXpvTxEhzB5rTGU9QoC0gs3dNqrZiG1/SxBNpl5nJZU/HaoD2tv+4dlybuVUkqU1JRNhp2sS+10l4OUWQhzydjjawDQO2L9tRhqCILZSHXfFqXQ9FG1DjCzfI11Iia31wmh6GZhnSJxEUfJmZ12QUzyur89wcHQwMlxg5Scs5VlKl5dYWA9GDXaHqtamSQH+eRwfVL2byfMHAkG03E0o+KQiQF34JqMEJhul5GCgTjMUS25bPRa60yJcVWx7201mljmE3VVb8peg97m3lNGgzTBKHblG5w7Wl0xRJ53gkCqn8j/gqQc5CbfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvj3/Y537fXjZ7o+XA2QWmRg1x9CVfzRPBvcJyHTsbY=;
 b=Qcsj18VrT+2AW+851nAcK8XkAWNhBgtU3siWIsEhmQ5W39EdFaW2E9qI2n9Gy9iZJthUe6q7ugS4NS4xJQyhumWwMlZiJEnMAQq3Ow+oaVqFe6iiCYe4eCfoFYxlaiIEXbpdqY+++j2qk1lFIkBlP+UXN1xXR74bA/YjzL+wxJaEsLavw2P7U1slJgwS4FD60Hh5dER1LgqdeVnouo4jx/hNp8mwvgohNTduZ9RJHXoTwbBAzmro2YmXPaSjmrN2Sy5LfbhHtXaq5mygAzhGe0YAuOGwzGwgZnkSFy26ULx+BdMVsgG6Jqiz48LUjOXi7TGWyDZE2uYqG53zbC/TCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvj3/Y537fXjZ7o+XA2QWmRg1x9CVfzRPBvcJyHTsbY=;
 b=XYJya54ZmtGxIUW/iGczpQIj/dPeP3eWCm+rF3cMBMy3TqWRtT3Wy+/MOeEY2YXpyYvARjKG3aqdZaQooRw7t3ly80c93mb/HeR6XOnuBg6cRhxN+fYeKox2EsFksT4+qQ2hw3y77Sv6eqRp1JS2R2TzQWEjn4FgZAtmbY4LSB5I8OwXKEWlLY9ToWMdq10C6VfXtLE/TB2LbncXh1V1HFtUbRNC8TxBHS4w7gfmdXfTYlmOneh/S2WzoSrO2/xCmqvoVynRJB8s8aL7LjOTN/Up/j2sAZw5ZO7xUAk2snClfURQ5rJslQGHBWjIr0bCa1pdDYdgUOo7+dxBudFXjg==
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 (2603:1096:400:3a7::12) by OS7PR01MB17110.jpnprd01.prod.outlook.com
 (2603:1096:604:455::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 07:32:47 +0000
Received: from TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::7de5:ed1f:f149:174c]) by TYCPR01MB11055.jpnprd01.prod.outlook.com
 ([fe80::7de5:ed1f:f149:174c%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 07:32:47 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Topic: Why nativesdk-pkgconfig isn't installed into sdk?
Thread-Index: AQHcK2E1CjJUNHz/B0y+ZeKdZ92XeQ==
Date: Mon, 22 Sep 2025 07:32:47 +0000
Message-ID: 
 <TYCPR01MB11055F8440AAD67D3CFEC64F3A012A@TYCPR01MB11055.jpnprd01.prod.outlook.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-09-22T07:32:47.545Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11055:EE_|OS7PR01MB17110:EE_
x-ms-office365-filtering-correlation-id: 5c2118db-1179-480b-82c1-08ddf9aa3a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?Qk1vcjI1cUFDanBKcGVCNWtKWWkyQ0JoOEJYWDlyM0xrcWV4OVlwRXAz?=
 =?iso-2022-jp?B?ZnlpUWd5VHJFR294M2wzODJQZWxzeU9yaUo5WFdqRUdsUDVmdFNjT1ZO?=
 =?iso-2022-jp?B?SlBVSU9iYlRFNnlxUHpZVy9RUVpCT09zOEYzWUR3UEh6T1BYRFFZT1Zm?=
 =?iso-2022-jp?B?NDhHSEs3UlZvWVVJT1pkdW1aTm9iNzkxdXFReU1xR1lSSGNwS3BDMjM0?=
 =?iso-2022-jp?B?aVowcHVpY2NhcnR5b3N0c3llMUUrdFhFeWNYQ0czSlE4WXRyY3Izdkp2?=
 =?iso-2022-jp?B?TWkrczZIRldsYmlLdXo1VjZZTWo2MmZISmlkMTZ5NXAvMUFQbjJVdHU3?=
 =?iso-2022-jp?B?NVhCaFlOeWtXUmREOUZmRjlWTHV5UVpNWHdvNXVBRHdyS05LazkwVEx3?=
 =?iso-2022-jp?B?NGdvaXEvaGJ5b2lINklsa2VycEFDWkwvZWtyMjdrdURlS0dBKzRPZlFQ?=
 =?iso-2022-jp?B?Tk9JdWRqTGdOSzVEajczNHVvaTZtbU0ySUpuLzRKR09kNDVpWlpSZmNL?=
 =?iso-2022-jp?B?dkZNaVI1MVBjWkwrTzhSb3YxNDBocE1XSkJldzUweUdtSjRTSDJOL3BO?=
 =?iso-2022-jp?B?N2hMNS9PeEpQNXZ1S2xZVTZ3ZWk3NDdLU3YyQ3RtMkduUW84M2tMMUlz?=
 =?iso-2022-jp?B?RVZORmRtNXpSa1YyTUtMSUtWd1VsNWNVeTh1K0pienpQTFVJOUVvRkQ3?=
 =?iso-2022-jp?B?TWs2VzJZb1RlUU5VamNIcXB4ZW4zVmRseG1TNGF3Nmltd1VuYmdqYSsx?=
 =?iso-2022-jp?B?S2ppR210cEJhS3k1bUlnRmpYS2puMlYrTjVVc0NObUF0SGVabmI0R3NB?=
 =?iso-2022-jp?B?d2w5eW1YVG9qN0UwQmREazdsNDN2VlJtYTRpVHdVUllDMHdUbWdMSHRz?=
 =?iso-2022-jp?B?M2M4TThWQ05FZWZFbkU0UjRJVCtIS245dVloaVFkZDVKOTdaMHNXVFBL?=
 =?iso-2022-jp?B?eWdkTW05Qkd4NXgreGp6UmdmQ0hqaHRiMWVGczdmVlBFSHdmYWkrT0Rv?=
 =?iso-2022-jp?B?MkVlZ1BoZzlVNTlXdVJWUmhRU2R1RlRHbC9Nb0grenY2RGJ0NkZ3aGJx?=
 =?iso-2022-jp?B?aXU3ODRUNTZEL05LM2JFVXR1clhDZGVZQ1JZYmV0TkF5MkVqV2h1L2JI?=
 =?iso-2022-jp?B?cGx3bjFDdUlIZGFZa1JmeE9UVG5RZUYzT3dMQ0VEZForcGlpOTZKYmxn?=
 =?iso-2022-jp?B?RTZoZTJzL25JT0lMR2hPbll5T1FFOTNwNU1JMFBBN1JCWTl4NFMyUS9P?=
 =?iso-2022-jp?B?Z3BLcEhGQSsrb2NwM0kvcDhacUtxZzhZYmZTUGRKbk9zWFFwWU1xdEJ0?=
 =?iso-2022-jp?B?b0Y4dzZhUkwxTDMyVERMS2dISjc3WktSZU5NbW45Ym9HNHdnVTJVVjUz?=
 =?iso-2022-jp?B?WUo2QklyRXc1c2p2UXFlZWpZbG1sdVk2cGlDNGQvNzkzald3V0dzRkZv?=
 =?iso-2022-jp?B?eEV3R1VTeGs0aTlLTjV3cDZORXpuSFpWd0hKRUlscFdaQ1doZXBmNG1F?=
 =?iso-2022-jp?B?QncwTlIzU2xTRW9OUURraldueGhLWnVmK3JJRlc5enhXYjVQd3RqcFpT?=
 =?iso-2022-jp?B?UnRQby8wbVhYK0piWHJwVnI5VTBlY0NTdTBlS0ppei9OVlNmOGQvUXVB?=
 =?iso-2022-jp?B?ZCt3OVkxWkZtcFZpQWFGQ1NXUkpsQmxFb2czRmY5cVZ6NDZjY3dIUnRG?=
 =?iso-2022-jp?B?WlNDQlp0R0ZBWXR4bmxaTW1aVlNTcmE0OElISHBRSW9yNW5wa0UvVjM1?=
 =?iso-2022-jp?B?eStMdzNZOXdIcW1pM1RzR0QxbFUrdFJyMWg0UWNWVjFRTnFzSXNDSDQ1?=
 =?iso-2022-jp?B?OHkySGVWVWhSd0xQbkFEaHJQODF3THBQelRWNXFVSWl4K2dDRW9SUFpL?=
 =?iso-2022-jp?B?MVVnMjFhRktMUmJ4MW9UUTZpU2pQUXZxSzdORFZKazBHM0VDcWI1am93?=
 =?iso-2022-jp?B?bUZJU0J2SDVKMmVUS1VVL0lMRURaZ1drZlBzVFg1c1FvcG12dUI5bVRY?=
 =?iso-2022-jp?B?bHJETGdvNlg1S2wzb2dJeSsxYlVud2pFaFptSFZwdFcyMzk4TGNvQVk0?=
 =?iso-2022-jp?B?SlBROUhvd3gvaS8yK011YXFmRXM3ZmUrckZJd3k4bFU2TWhaUXd5RTdU?=
 =?iso-2022-jp?B?SU1nZGMrMnRhR0tFSXlhN1RpUE1lY1RuRjlXRGttZ3RTMVRTeXBDYmhF?=
 =?iso-2022-jp?B?TmhSV1BrOFZNWnBuUnZ1RTFLa04wTXBm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11055.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?bXV1di84QWRjZFJiTExEREl5bmtqZ1pyRFVwWEdRY3lvaXU1MDRRaHht?=
 =?iso-2022-jp?B?bEpFYnlNZjRNZXBoWWRQVXliVndTc3RCK1NJM2wxU29hdXdRRENlZHlw?=
 =?iso-2022-jp?B?M1dsd1FpWjhuc1FNVDJGUEtyVUlMdnpRSFdaa0xrVjduY0xZNlNtV0JX?=
 =?iso-2022-jp?B?WGthbm12a1lOM0VIRUlhR3pwNUN2NVJWcUtnemlVQ3RQNHd1ODEwc2pP?=
 =?iso-2022-jp?B?WFN3Vk1SL2h5ZW8xZWdVWGUrUVhTNXI5YkhpTlBGWGxVNFpxQ3l4bDJj?=
 =?iso-2022-jp?B?NXdlSWRRUXl2Qit0WVFDOUt5U1dTRjhXdTVhZWxEUktFb3JzODdQK0Ir?=
 =?iso-2022-jp?B?SEhyNUZUQnErV1RyaExXVUdTUHRYR3FVa21BYkJjRExNRmVsYkk5WkhM?=
 =?iso-2022-jp?B?OWVMbzNGQ0FVaC82OWdGdi9UVVdnV1ZFbExmM3hHM0wydHRmVDNrV1Js?=
 =?iso-2022-jp?B?TDROK0h4UHJTM2JjL3lZcnpaOFE5WmNmaG44Y3lKYlVybGF5Q0t1Zlpz?=
 =?iso-2022-jp?B?Y1lWd1U1YTJxcEFjRzZLRHFSeDJVSUxuR1NURmpqaC9FdXZUcW1mZ1BW?=
 =?iso-2022-jp?B?Um1iWkRiWWdJVDMwcFU1NTBZalMwaU0rcUF3MkFiSlV2dWFHaGRhSW5O?=
 =?iso-2022-jp?B?WXYrL0pLVFl5ZXNzeWJMRDlmV3g1ZVZFUDdvVjBnUURqRlNMOFVOTm9C?=
 =?iso-2022-jp?B?emJvRnNhWWMzczFOYzVQL2dWUkQzdGVTbXU5N0EzVDJlYWl6YWF1ZFdr?=
 =?iso-2022-jp?B?dFYzL0pBTEtWOWpiUkNyNXN6K1o2M0svT1VyeHQ4WGQ4TTNDNS92R2JY?=
 =?iso-2022-jp?B?QWJaa0FaVTdscjVPV0ViZ2xOc2JoMDEyVjJHdmdrUXZrdnZWT3pBWld2?=
 =?iso-2022-jp?B?SEhiRTJuZFpCVlN5U2hacUJnOHNkQmFPaDFrd0dpZW1lUjBFVEEwNUlE?=
 =?iso-2022-jp?B?VHo2YmZFd2tKbUpqSDJ2NitOeEprS29FVFRuL1R5c285L1Z2UDE4M0sr?=
 =?iso-2022-jp?B?UDRuaXNnR0tBS2ZPSExRMWlHODFOcTVwWC9IYnFSdURjOE9lQS9BdjhX?=
 =?iso-2022-jp?B?eHl3MThCRjN4Ni9yQXdyWVp6bHpTNFcxOE1RRzhJR2RPdnZPbi9BNDk5?=
 =?iso-2022-jp?B?cFZ6UjBRa0JKZ3J4bnRwK0MyNVJzcms4SGNoaS92MjlUM0ZtY3VqMEtp?=
 =?iso-2022-jp?B?R01FNERjcCtMUldadFdPQ3U4OFpULzdQYk9GOFBlZzZ1L0hIdTY4Sit1?=
 =?iso-2022-jp?B?QTNUTE05STl3eEtCMW5BeFBGVUdDT1ExRjV5S04zVEZWelR2V1p3NmVx?=
 =?iso-2022-jp?B?L3RHQnQyTm5vL3VHMytNOTlvK2JCUGhmaWRKSGU3OGlYRC9ZZ1prVzJM?=
 =?iso-2022-jp?B?bHFQRjVZZ2Q2THpKbi9vS3I5bnBqcENjNlh1WXNYVnBOODBINEtlTi9T?=
 =?iso-2022-jp?B?bjJJc1lqSXZtVVZ6N0NVYlRjTEdjYUdrbDlpb0hveVhQZnN2aVpjcE5p?=
 =?iso-2022-jp?B?OVRRVVU3UHF1V052ZEc5OVRZclNpMU50cUtLbnJ5bXorNDhCSkhFWkpU?=
 =?iso-2022-jp?B?bFNrcG9IeEhjSVllTHQ0Y201dDVhRHM0eFRYNGQvdEFEUXYwQ2Vwek8r?=
 =?iso-2022-jp?B?aDN0Q09vb2VESFhjTFhkOEx6dkFlcEx5YlJLMVRTckxZQ3VncnZsWUtN?=
 =?iso-2022-jp?B?Yk9DSDgzbUNtNEUwZWx0VEVhYjh6dW5GRlQ2c2dlNWkvMzZia2taaGNS?=
 =?iso-2022-jp?B?elpmL3ZaVm9BZE5mRjR5d2d5UDdGanVyVDJMVjZ1QTNLRGdvUHY3LzZR?=
 =?iso-2022-jp?B?MU83V3dRVHlMaTVZZjVRR1c0aHpFcEhvVEtJK0lqMnpEakFEMFRkdXg4?=
 =?iso-2022-jp?B?MElVSE0vUVBHV0N0OGovOEU3anduT1BZRkhJSE5IbVhoZEY5QlV0Mi92?=
 =?iso-2022-jp?B?UnRPU0lQaGY5WVdmOXFxRXVwd2JZVHdkRW16KzZYaWNMeWpOdi9Vb1NY?=
 =?iso-2022-jp?B?eWdjeC83Yng3N2x2YmNycGUrM0ZPdG5qaGYwS1hsZVM3MnMwSVdWZ0NY?=
 =?iso-2022-jp?B?ZlpwRFFXYWppSytLRFplM2g1N1ovZmp5Q0FqSk1JN3RnVTVtcjFpN1JD?=
 =?iso-2022-jp?B?akZ2VFhqbHFBMGxpWTAxbjVMa0JqV2hPSWl1b2Z0NGo3SEdDWjhvQm5a?=
 =?iso-2022-jp?B?b2VEWHdzNmthK05ZeU9jbWFnbkl1aVl1MWhBUlhDNHhZL0VrdVU3WGN1?=
 =?iso-2022-jp?B?bkpWUXdDQ2UrdUhSTy9OcU1aTGxBRVRmVU1Mb1pwRm9xbTIxUXQ5RDRi?=
 =?iso-2022-jp?B?WkNkaw==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	cUG/ykSMoK6uMoyr1i6rWV7spC5ddbpLEGC0uB+95L/yZKyFppKM0BNKooFhUkTfPG4BZ6H32un1+9NEqtuGVuFqqwZ3H29FPUdRuQYNCqB+m7p0Xu1sfHRJuuPa4JhioTH5yUVHXh0GOsVAPoncHU2tnKw2FnK1ceJnANMhT5SZ1wUKnvZ+r64RmLi2ri5AfY/8vgbP9wJnAp8J21X3LCsScVbmVzml9I9NTEBRbeYMfTqhSh6/CP2eLFgXlwhXleVqGIz5VdbNGxDml3YA7XHsoEMHFI3wq6JjKuYrnI2yZfuQg/4nL4/ijSSyICZl+QiFeCk+6406a4KZReP2p6atO8HUMs5cdIIrIfs8+W130RmqDdFTRe2rtg3l59+KezVbBy/LfNTOHalPaU4yYvQjNn2PNLMp0ywBN+weJ0nUrqKH3w+B/xK2+Sg/ZvJCF3giqmjt8UkOa4gEfr+uRngbcTO+v1SPlWbFRxSuYz14yd/5Y5QfgvHwGIs0XzbMIiU5d77rPGju1jI+bcDUHtSqRjAzv59NH14a5hYIdzEdV69tHRq9BzZoUPIZUUY5UaQmGg6ri6xl/NK5AptcHFg+RV0UWShWJYyvtw2sxTUPYfAkUhnc/rYXrgApD2+5
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11055.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2118db-1179-480b-82c1-08ddf9aa3a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 07:32:47.7627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLq18NREWb8qx6qN0tRr0So10Z8Lc9gA5/lGb4J2NRX2WMsLU8ECJ1pMFV+tYcTGE5xTXLqk4wWViQVKR2BLYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 07:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223809

Hi,=0A=
=0A=
Recently, when I created an SDK using the latest Poky by "bitbake meta-tool=
chain". I noticed that nativesdk-pkgconfig was not installed into the SDK a=
ny more. However, I checked the RDEPENDS of nativesdk-packagegroup-sdk-host=
.bb and it did includes nativesdk-pkgconfig, so I understood that it should=
 be installed into the SDK. Is this a bug?=0A=
=0A=
=0A=
Best regards=0A=
Lei=

