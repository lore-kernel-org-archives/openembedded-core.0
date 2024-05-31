Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EFDC25B74
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 03:03:32 +0000 (UTC)
Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web11.3040.1717124606696673382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 20:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=CXRfqFQq;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1717124606; x=1748660606;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jTStgiPt2S+04JxjcJkxF16sSUd7e/UIFOa0tNJnKag=;
  b=CXRfqFQqqlXTeT3HgKy5D0QlG3hQTmHqmelzoejpoEZYiGxc4ROAKzu+
   WhN5WcJdy+4KS7Tw/amh/asMijT0DwZehrlKvafA2ATuGmh42En94vntW
   Sy2XWbs9K1oUzhApj4olumB9auHPEbqFMciRypyXzk7eMYv+V5tJIpMn5
   P+AI8bglmknlvYVMyTYw9QPkIw4aUT/YU6aZln3RLhkOkog1o8o1yFuE3
   n+YH5K/7APKnPol6c0eUU5VPDScrFBhvUfmS8Dq+Uk+YU4YUg/GVNSBVs
   qkrHfqGgx1hvshCbN79rK0++lZSkwuEPedhEdQvzvf6LCrvyW+kI0KJ5a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="120974266"
X-IronPort-AV: E=Sophos;i="6.08,203,1712588400"; 
   d="scan'208";a="120974266"
Received: from mail-japaneastazlp17011005.outbound.protection.outlook.com (HELO TY3P286CU002.outbound.protection.outlook.com) ([40.93.73.5])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 12:03:23 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeeaMiDDtodsQ+XfDs2whbwLUD9JgT10u6kGowgN4PAEgk+N6uBsL6f2xC5bdk5Yq+lypNsWoXTTPtPKCPwIYNL+Xn1dNkRD82gjXm1WXQVa1tDjgWOaYhvXNUPTFkItR3cJZUmPrVJBlNKKgtHeg+FwgWQpGSRuMS3saMFOrKgKhBeQffvYTTCzULKwiUw9zJF18wl1JY34SS2POcDduv7XoXXO2e/OY2uIG81rgMNul/0YPByv9GR3bNrgdbe7kpUk86CGJDfjFHva+s346NYgzzpJdhgY3DMl28wvLYEjzSqfG6veENLaKyx3yOK2QVWjA4baYFWZtnFGH9YYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTStgiPt2S+04JxjcJkxF16sSUd7e/UIFOa0tNJnKag=;
 b=CGWT5iSmVT/kdGJPTmoLHW8S+CXcYmOX+uecEiLITw711G8H0mLLs79gJMvYTLegh0Qjwhpqxfk5jyeV+tkt4ZhLDxLDF/CTmqNO+yWmfvmo3dF0ry57YKzOH6dwNF2VKZMaIZSxBLF6cgMQrdfi8gJ4cV6/IogC6ktbKEtqoealNZLhLJI9kXY4neco4oXJH3sfhOC//0Wvyr5puKgabOWvNXYuVbqmmxuU0cjZoEeJr4cntGV9TezQXjeVzJ/u3rZ6+LiVo5HN29+QNtkLq96yEkbOwrsPOWaCBI5GuQZiNHwe01yrwlwWBYojDo2EojN4WOUhEmOnsMx52w6BOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 (2603:1096:400:3b4::12) by TYCPR01MB10509.jpnprd01.prod.outlook.com
 (2603:1096:400:306::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 03:03:19 +0000
Received: from TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc]) by TY3PR01MB11056.jpnprd01.prod.outlook.com
 ([fe80::c451:240d:2c34:96bc%6]) with mapi id 15.20.7611.031; Fri, 31 May 2024
 03:03:19 +0000
From: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
 multilib.
Thread-Topic: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
 enable multilib.
Thread-Index: 
 AQHamthAA1WlsJSKE0i8b52cEJCNw7GPumSggAB8LoCABC+IYIAZOzLAgACF/oCAAq8hcA==
Date: Fri, 31 May 2024 03:03:19 +0000
Message-ID: 
 <TY3PR01MB11056461A7E69405A9B616722A0FC2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
References: <17CB016975A375B8.19032@lists.openembedded.org>
 <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
 <17CEE5C1836CC254.26216@lists.openembedded.org>
 <TY3PR01MB11056FAE92F3B29F3EA1C55BBA0F22@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <CANNYZj_rm0zNF9kFZa-TJ9j7W0sGLfB66LFH0fVMOo3Fo7ahiw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_rm0zNF9kFZa-TJ9j7W0sGLfB66LFH0fVMOo3Fo7ahiw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NjlhMTViZDMtMmVhYS00ZGY2LWE4NzktZjRiMGI1Nzcw?=
 =?utf-8?B?YTg0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDUtMzFUMDI6NTU6NTRaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11056:EE_|TYCPR01MB10509:EE_
x-ms-office365-filtering-correlation-id: be44404e-840e-4f28-5799-08dc811e396b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|1800799015|366007|1580799018|38070700009;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WTJsK1V0NlVMQnpRV0hWZXpkd2FWYWU1VkwxejFMcncybmhGOEpvdjJ0L2Nz?=
 =?utf-8?B?a2g3N2s1N3JZV21TTVI5VFY4WmZHNzJiUmhMMGxDOTZUSkxJQlVCaUJuYnRo?=
 =?utf-8?B?QUc4Wm84RmRtNmNTOFQxWlNXUFhGSUxSOGZzQk52dWNXTk5XMWhMa2dSV2FE?=
 =?utf-8?B?cFpOQjcxVU5Oc081T3BXOVNoOFMwemRoZDZQbkx1eCtOQzBQSWNuMHE5STVZ?=
 =?utf-8?B?TDFTakc3NlNpM1p0S1ZCR0RRNG9RYytwY09qTXdVcFVRUzB4bVJGRjNySUtj?=
 =?utf-8?B?ZVJPK2RKazcvUzRWMW1kMFJjT2xtODdUOVJpVGk2aXprWmIrMXlxU3ZISEZF?=
 =?utf-8?B?QkFQcHFDaVdyRWZoOGUzRncvMkNESzM0WFJuY2lrNzJsWWlmNHBlSko0Z1lF?=
 =?utf-8?B?aW5WZ0RySnpTTWE2Y3hqa3FJYVhSdmRNL05KZ0RKaXV6VXRXai85ZTZQa3Az?=
 =?utf-8?B?UjNpdGlLelg3bDdFL0FkaVJsOUM2bW94ME4wajVqUUNtT20xaSszSEVEaXlh?=
 =?utf-8?B?ajZjRUhPajdzUG56RC9pWlZIYUV3N1QvcjFNOG5TcThBSEJSaFZOOTQ1REkv?=
 =?utf-8?B?Tkpma0QwdVZscnhWdkI0U0ZSTFlKZUtXdU1IRnI4NzBWT0RlVmNLM3VidmZB?=
 =?utf-8?B?dG9jRFB3RXhDTjNsSnA1L0luazRZa2MwRDEvZWZvVU90SmhNdTlIMHlNWTVF?=
 =?utf-8?B?OHh2OUtPbm91cEVNSVBPWllLYnJiYTI3eU04UmdzRXJhVjFwd1pmblYzQTZN?=
 =?utf-8?B?WHFrWGhxVTd4S2MwTUtjQUpiTjYxUmRuTE5PT0RMQXNZQmQ0ZWFEcEt5T0JJ?=
 =?utf-8?B?MjVCQks2V1RnbXFBNjNxTEhxT0plMUlMTmZobk8vSzZ2dmxGWEJxUFg1dzM5?=
 =?utf-8?B?d2hWYkNIOWtzNWZYK1dWZGFtYnVtYWFZMHhkRDJ1aEkzanpjZVFaWEtMTGFr?=
 =?utf-8?B?R1YxMzdCRklNMTUrajJnUU1mODJXRFd4N3ppeHJXWnN0am1wUGZaZTZYbis4?=
 =?utf-8?B?UlJOWkRIVHFnN01KUXBFMTR0UmswUmhxWktsOWpQSjVzOG1YU1pqQUtFNDNm?=
 =?utf-8?B?M2ZsVEorNXdmOHY4NHo2d1E1aWQ5K1orbWV0SFQ0SGVmU2loeDJMUzhKVmJZ?=
 =?utf-8?B?enFaTGsxMmpRUlZrcmljU1pwcVBzZ2UxaDBUQllaYjlmU3ZVQ2xMOW9vUGdG?=
 =?utf-8?B?TDlYT1hRd2JlVGdjNVcwUXpOR2FKZnBIaW5CS29yK1BtVWc3WlhhNHF6Tk5Q?=
 =?utf-8?B?RVJiVWhLbzkrVVlTK0hINDZyR2pTTzY1YnZwZDdacU9kWFFuSEFnV3lmUnJG?=
 =?utf-8?B?b2NaZXF0SmxsWjBYc1F3cUFabmRiRXhRTWFGNWhFckVJLys0SVZ0VnpzNExs?=
 =?utf-8?B?VHgwUHl1OTBJRWxIRUZ2bnZEMzJTaDBMbVdzTFhZNG1tQVNHZDRXT2V2Ui9Z?=
 =?utf-8?B?cjhrUmVsY0kzN2kzdkFURk1WZmNLTjFLSG42R0R0NmsrUEhMN0MxYU9XY2pY?=
 =?utf-8?B?aXVPay9sWkprNDVGMTh6YWFSMVlmT2VyYU1sLytsWEJVQnlGR1lMWXd1Tm9m?=
 =?utf-8?B?SnZsd00rWGhGeWhmQ2xMTkMrSFNzaCtCcDVpT2Q1dnZ5SlJOUm1hNU1Oc2Jl?=
 =?utf-8?B?bGZwNHJGemQzODNnRUdGK2hKa24rUjlTS3JoMW9WaStxSVMzc08xaXpMc2VH?=
 =?utf-8?B?WU5UejJTOVBqaU1rUjYyMTJrSUdFZVBiMzM0enk3amN3UXZKdThnamwvSDhu?=
 =?utf-8?Q?uE+3itxIn2KocCdtC8JDaWYcp/czJOkrDHjSiVX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11056.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(1580799018)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aHh4RCtIRlR3ZWVGbVh4NEUyRXdyTEpRc2FuR2REeUowVy9xUk1vZTNhVjQy?=
 =?utf-8?B?OUpTSk0zKzdmNVR2WU1tQWpocXd3REdaS1E2VWVIQ0RhenNOOHVwZmpnd0dE?=
 =?utf-8?B?dkVMRjJJcUQ5cXFJTXRKbUtmd1ZycW5rY20ybTQveVUwYm5wR0xOTnVxekNS?=
 =?utf-8?B?dDdLcGZOaVZMdlNmSXJ2UHRIcDRyZW9KVzNLaXptTzlWV0dIVnphLyt6OFN6?=
 =?utf-8?B?RFJvV04vL29EdUR2VlMwb1l4SEpmWTBKMkU0QzdqOG14TXNmMjdRcmxYaVZO?=
 =?utf-8?B?bHVkTkdwelUrM1BXMmZ3SmhlQzlDM1c2cW5oVDk2Ykl3MzIvZXRUSVJvQ0NL?=
 =?utf-8?B?TTdIbVVYdDJsRjBGZ1lVaHF0dXQ0NDdtaUpWUjdYOFRiaDlvQlUzVkVZSnlJ?=
 =?utf-8?B?R1hYVG1hV2ZOWjFKcmxsM0ZxL3JTWHBvMUl2a2dsNnJjbk9rL1RLSlJvNU00?=
 =?utf-8?B?bTkxVVBqai93MW55MzdldEZwWXorcjVkU0VPYkJSWWlubTBMbVMxdnFYaFZU?=
 =?utf-8?B?WXliTEZHM3NseXV1RzlrVzBNay9vVjZNcW1OTGhLZGhTMzJWTTd5MlpOdHNL?=
 =?utf-8?B?YUtDVWZvV0NFZ0NEbG9icWpQaER5VGI5eWx6NndhQzA4R3dvUTdGUzhPRVRs?=
 =?utf-8?B?eFRRbkV1dzFaWmlmYzRsa0VVMnllRUFJSzI4TE43L2h5TDhiMTJ3b1FWNzlO?=
 =?utf-8?B?djNsdk1TOWdqNVl4QTVQdlp0c2VMMDFGZTJla2dsSEpxa2tMcVRBS09rNkM5?=
 =?utf-8?B?cnYwNC8rWEFzRkE5L0wxWklFaDVFYlAyNTJVSXE2U2ZKSWFXcklUN3UwSkdD?=
 =?utf-8?B?VDFpSnc0emdxNjFoZ2F4b1NSRk4wblhGYms1blN1azIzakVDR1ZocjROd294?=
 =?utf-8?B?WTZRK1VyampTWmxONE5iQmMyOS8xRjVmc2xvekp5WWNZTjhvd1BZMm9qMnp0?=
 =?utf-8?B?emp5RjI3aWpHcVZGNmxJOE8ySGN1bHJLZVJETmR1aHZyUHBFL2xUcmk0eFE4?=
 =?utf-8?B?a293MDVCSGJIMG5kQTV1TXdWVGpHR0NvWC9adkFaNmpldHdyWGgrOEdETldL?=
 =?utf-8?B?QVVCQlBCeGZuK0lpT2h0MDkrOXMwWmROdDRSWWtGVGhjOTlzZnNEcUhQNlM3?=
 =?utf-8?B?UmYvN1VqSUtxMDhSYmVmTE1oMjNvMEJoSzNjaFVFNXhGeDE4TEZzNlNvNlNQ?=
 =?utf-8?B?VzV0Yk5LcE9kVTVRWi8rN0tWdEtneWw2M0pkV3Z5ZHFvdGk4NllUN0l2dUVu?=
 =?utf-8?B?M1k4K3RzT05DWHVHczVCTFdEeUlLaXNHYW1PT2ZKTFd3bVFJc0o1M3M5dUJ3?=
 =?utf-8?B?dHlBK01WZDV1VzIyMDlWOGxjUzBLY2g1ZGxoWmh4cVFDT2tjdXA3NHhiYjdv?=
 =?utf-8?B?RUNJVjNZeU9iTTJLenc4RkZ1TWlVaWErS0hEOTBhV0tXYU1jRXlUdjFKR0pD?=
 =?utf-8?B?bVVBREZBRzhNaWRET04wczRwUW1YSWhBdWw2SGlZV2R5NlVEUE9mY2hFN28w?=
 =?utf-8?B?emtxdlZ1TU83NTB1cTlZeGpWRUFyUHI2Z1pocmdQbjFvUitEeTczTnZ2Mkd4?=
 =?utf-8?B?YjVTcG1UcmZ0SVorS3Q0QW9Yb0dIVHZjTElJenFhVm8ySXVadk81T1R4NlY1?=
 =?utf-8?B?REVoa05WUEh5TnVJRVUxbHEvbm1CL3ZNTzFZNkhvVVlPU1lMcmJ6NkhJaFk4?=
 =?utf-8?B?VllvbERuNzdtd3RBUjlLbWhvaUtFNWI2K3FuYjBjTzl5b052bnp4T2M1ZXY2?=
 =?utf-8?B?Y29DSFJUT0JlKzlVTWVHYVlWTjB6NHhXcmwyNXZCanpMR3ZJcThzYTc1cVIx?=
 =?utf-8?B?RDlwRUdVU1lCUy9nd200TzU0aTgyK1hyNVVWbkNJTGtPQVpJanNmWXBGZGhq?=
 =?utf-8?B?TDkyNGU3SWZCM1lPcUVMYUlwNFkrNFlEbVF6bmo1ZnRPdlVycFVmVHEzQ2w0?=
 =?utf-8?B?aS9KdmErS2xaZStzQ043b2FXckhjbDhtNVBWdmRseUxacDY0cjZQSDVOZStL?=
 =?utf-8?B?M3JZbFhhbUJ5cVVBWEMzQXAwUkxYU25OcitiRytjcTNiUnRhT2NiaVNvdnFo?=
 =?utf-8?B?SEpGNFVscDc0YVZjcGNEZXAwSndTNW1DUkpBbitiSUV0UlZ2YU8vL3dCU2lD?=
 =?utf-8?Q?K6QPfK+qRVoZU0d5rZcYglzwt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bZhFEsQF9639NBQPQVHniTUXmPfWBgsKCUL1QZ3fx8u3K8yXgkOJ7h/KCmBOXOwm4ZbgPgtKZeglvxkmnbJe9qp6XWbZzuwnWJ/fq1ypmCOHjgSgWATYjCkR04HsqAvexuN2AOulUaJlBl0z+842PrC2BuYzxPfiUlS3VKaos7Y1kt3f7febs6N8HqItxc+HWC5Dys7QFclosNdQi3w/MRGlBdwWSSV/l8HCf6E1IdFtCPyBjYjbDnjF0IhmcNCLjJwL/gvqjEfjiR23r9BCZpNejA2le2Y8101KUVIaJhBiWQPI7FNo7CoRrQix1IbCz5oju8SDuNuSimp6Oyz9eXB/lWM3eWo/Gly68BsfLUl1oUXwuOkoribTg3FuB/h6s6RjGvvNUhVkqoM0TatN1psvzLCt3VhKba2MbjbQRKLVwm3m58gEJB5LnTEc2QhjDMwpij9EbgRcR0W+N+sOA6iFkpGlv13sB3nLxqmo+5y0zWJgQ2kgNtdF9jpfPCJp9q8UJCaXfibrigPkdb3LBxrByoGWLDwzX+F8uvKNvnqDNHIVi/XFUJofTpk9kEBw6qjcram658B812neaPmfHKHcrAujjCiojmiOQ9TzyrB6xHyaAAYpsFBZQZ46rRzf
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11056.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be44404e-840e-4f28-5799-08dc811e396b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 03:03:19.1592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zo3c4UJUcw4WIIKcgu0O4g4KcAASoFEjfFRUk63Icgk2gar+rXhx/qFqEn5bUBuJRWYJdPt59WUwpAIIGls7vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10509
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 03:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200052

SGksIEFsZXgNCg0KPiBJdCdzIHN0aWxsIGluIGFiZWxsb25pL21hc3Rlci1uZXh0LCBub3RoaW5n
IGhhcyBjaGFuZ2VkLiBXaGVyZSBkaWQgeW91IGxvb2sgZm9yDQo+IGl0Pw0KSSdtIHNvcnJ5IEkg
Ym90aGVyZWQgeW91IGFnYWluLiANClllcywgaXQgaXMgc3RpbGwgaW4gYWJlbGxvbmkvbWFzdGVy
LW5leHQuIEkgZm91bmQgaXQgYnkgZ2l0IGNsb25lIHRoZSByZXBvc2l0b3J5IGluIGxvY2FsLiBQ
cmV2aW91c2x5LCBJIHNlYXJjaGVkIGl0IG9uIHdlYiBwYWdlZCBhbmQgZGlkbid0IGZpbmQgaXQu
IA0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgTWF5IDI5LCAyMDI0IDU6NTcgUE0NCj4gVG86IExlaSwgTWFvaHVpIDxs
ZWltYW9odWlAZnVqaXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjRdW1BBVENIXSBs
aWJic2Q6IEZpeCBjb25mbGljdCBlcnJvciB3aGVuDQo+IGVuYWJsZSBtdWx0aWxpYi4NCj4gDQo+
IEl0J3Mgc3RpbGwgaW4gYWJlbGxvbmkvbWFzdGVyLW5leHQsIG5vdGhpbmcgaGFzIGNoYW5nZWQu
IFdoZXJlIGRpZCB5b3UgbG9vayBmb3INCj4gaXQ/DQo+IA0KPiBBbGV4DQo+IA0KPiBPbiBXZWQs
IDI5IE1heSAyMDI0IGF0IDA0OjAxLCBNYW9odWkgTGVpIChGdWppdHN1KQ0KPiA8bGVpbWFvaHVp
QGZ1aml0c3UuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpLA0KPiA+DQo+ID4gVGhpcyBwYXRjaCBo
YXMgbm90IGJlZW4gbWVyZ2VkIHlldCBhbmQgSSBkaWRuJ3QgZmluZCBpdCBhbnkgbW9yZS4gSXMg
dGhlcmUNCj4gYW55IGlzc3VlIHdpdGggdGhpcyBwYXRjaD8NCj4gPg0KPiA+IEJlc3QgcmVnYXJk
cw0KPiA+IExlaQ0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBsZWlt
YW9odWkNCj4gPiA+IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTZW50OiBNb25k
YXksIE1heSAxMywgMjAyNCA4OjQ1IEFNDQo+ID4gPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+ID4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCB2NF1b
UEFUQ0hdIGxpYmJzZDogRml4IGNvbmZsaWN0IGVycm9yDQo+ID4gPiB3aGVuIGVuYWJsZSBtdWx0
aWxpYi4NCj4gPiA+DQo+ID4gPiBIaSwgQWxleA0KPiA+ID4NCj4gPiA+ID4gSXQncyBpbiBhYmVs
bG9uaS9tYXN0ZXItbmV4dCBvbiBwb2t5LWNvbnRyaWIuIFBsZWFzZSByZWFkDQo+ID4gPiA+IFJp
Y2hhcmQncyBzdGF0dXMgZW1haWwgYW5kIHRyeSB0byBwYXkgYXR0ZW50aW9uIHRvIHRoZW0gZ29p
bmcgZm9yd2FyZDoNCj4gPiA+IEkgZ290IGl0LiBUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQo+
ID4gPg0KPiA+ID4gQmVzdCByZWdhcmRzDQo+ID4gPiBMZWkNCj4gPiA+DQo+ID4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiA+ID4gPiBTZW50OiBGcmlkYXksIE1heSAxMCwgMjAy
NCA0OjQzIFBNDQo+ID4gPiA+IFRvOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29t
Pg0KPiA+ID4gPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIHY0XVtQQVRDSF0gbGliYnNkOiBG
aXggY29uZmxpY3QgZXJyb3INCj4gPiA+ID4gd2hlbiBlbmFibGUgbXVsdGlsaWIuDQo+ID4gPiA+
DQo+ID4gPiA+IEl0J3MgaW4gYWJlbGxvbmkvbWFzdGVyLW5leHQgb24gcG9reS1jb250cmliLiBQ
bGVhc2UgcmVhZA0KPiA+ID4gPiBSaWNoYXJkJ3Mgc3RhdHVzIGVtYWlsIGFuZCB0cnkgdG8gcGF5
IGF0dGVudGlvbiB0byB0aGVtIGdvaW5nIGZvcndhcmQ6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4g
Pg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtYXJjaGl0
ZWN0dXJlL21lc3NhZ2UvMg0KPiA+ID4gMA0KPiA+ID4gPiAwMw0KPiA+ID4gPg0KPiA+ID4gPiBB
bGV4DQo+ID4gPiA+DQo+ID4gPiA+IE9uIEZyaSwgMTAgTWF5IDIwMjQgYXQgMDM6MTksIGxlaW1h
b2h1aSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiA8bGVpbWFvaHVpPWZ1aml0
c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gUGluZw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4gRnJvbTogb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiA+ID4gPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+ID4g
bGVpbWFvaHVpDQo+ID4gPiA+ID4gPiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4g
PiA+ID4gU2VudDogVHVlc2RheSwgQXByaWwgMzAsIDIwMjQgNDoyNyBQTQ0KPiA+ID4gPiA+ID4g
VG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gPiA+
IENjOiBMZWksIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0c3UuY29tPg0KPiA+ID4gPiA+ID4gU3Vi
amVjdDogW09FLWNvcmVdW1BBVENIIHY0XVtQQVRDSF0gbGliYnNkOiBGaXggY29uZmxpY3QgZXJy
b3INCj4gPiA+ID4gPiA+IHdoZW4gZW5hYmxlIG11bHRpbGliLg0KPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+IEZyb206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBmdWppdHN1LmNvbT4NCj4gPiA+ID4g
PiA+DQo+ID4gPiA+ID4gPiAtIEZpeCB0aGUgY29uZmxpY3QgZXJyb3IgYnkgb2VfbXVsdGlsaWJf
aGVhZGVyLiBUaGUgY29uZmxpY3QNCj4gPiA+ID4gPiA+IGVycm9yIGlzIGFzIHRoZQ0KPiA+ID4g
PiA+ID4gZm9sbG93aW5nOg0KPiA+ID4gPiA+ID4gRXJyb3I6IFRyYW5zYWN0aW9uIHRlc3QgZXJy
b3I6DQo+ID4gPiA+ID4gPiAgIGZpbGUgL3Vzci9pbmNsdWRlL2JzZC9zeXMvY2RlZnMuaCBjb25m
bGljdHMgYmV0d2Vlbg0KPiA+ID4gPiA+ID4gYXR0ZW1wdGVkIGluc3RhbGxzIG9mDQo+ID4gPiA+
ID4gPiBsaWJic2QtZGV2LTAuMTIuMS1yMC5jb3JlMl82NCBhbmQNCj4gPiA+ID4gPiA+IGxpYjMy
LWxpYmJzZC1kZXYtMC4xMi4xLXIwLmNvcmUyXzMyDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
VGhlIGRpZmZlcmVuY2Ugb2YgYnNkL3N5cy9jZGVmcy5oIGJldHdlZW4gbGliYnNkLWRldiBhbmQN
Cj4gPiA+ID4gPiA+IGxpYjMyLWxpYmJzZC1kZXYgaXMgYXMgZm9sbG93aW5nOg0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ICAvKiBEZWZpbmUgdGhlIEFCSSBmb3IgdGhlIGN1cnJlbnQgc3lzdGVt
LiAqLyAgLSNkZWZpbmUNCj4gPiA+ID4gPiA+IExJQkJTRF9TWVNfVElNRV9CSVRTIDY0ICArI2Rl
ZmluZSBMSUJCU0RfU1lTX1RJTUVfQklUUyAzMg0KPiA+ID4gI2RlZmluZQ0KPiA+ID4gPiA+ID4g
TElCQlNEX1NZU19IQVNfVElNRTY0IDENCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtIEFmdGVy
IG9lX211bHRpbGliX2hlYWRlciBvbiBjZGVmcy5oLCB0aGUgcGF0aCBvZiBjZGVmcy02NC5oDQo+
ID4gPiA+ID4gPiBhbmQgY2RlZnMtMzIuaCBpbiBjZGVmcy5oIG5lZWQgdG8gYmUgY29ycmVjdGVk
IGZvciBvdmVybGF5LW1vZGUuDQo+ID4gPiA+ID4gPiBQbGVhc2UgcmVmZXJlbmNlIHRvDQo+ID4g
PiA+ID4gPiBodHRwczovL21hbi5hcmNobGludXgub3JnL21hbi9saWJic2QuNyBmb3IgZGV0YWls
cy4NCj4gPiA+ID4gPiA+ICAgQEAgLTEyLDE5ICsxMiwxOSBAQA0KPiA+ID4gPiA+ID4gICNpZmRl
ZiBfTUlQU19TSU0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgI2lmIF9NSVBTX1NJTSA9PSBf
QUJJTzMyDQo+ID4gPiA+ID4gPiAtI2luY2x1ZGUgPGJzZC9zeXMvY2RlZnMtMzIuaD4NCj4gPiA+
ID4gPiA+ICsjaW5jbHVkZSA8c3lzL2NkZWZzLTMyLmg+DQo+ID4gPiA+ID4gPiAgI2VsaWYgX01J
UFNfU0lNID09IF9BQklOMzINCj4gPiA+ID4gPiA+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy1u
MzIuaD4NCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8c3lzL2NkZWZzLW4zMi5oPg0KPiA+ID4gPiA+
ID4gICNlbHNlDQo+ID4gPiA+ID4gPiAgI2Vycm9yICJVbmtub3duIF9NSVBTX1NJTSINCj4gPiA+
ID4gPiA+ICAjZW5kaWYNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgI2Vsc2UgLyogX01JUFNf
U0lNIGlzIG5vdCBkZWZpbmVkICovIC0jaW5jbHVkZQ0KPiA+ID4gPiA+ID4gPGJzZC9zeXMvY2Rl
ZnMtMzIuaD4NCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8c3lzL2NkZWZzLTMyLmg+DQo+ID4gPiA+
ID4gPiAgI2VuZGlmDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gICNlbGlmIF9fV09SRFNJWkUg
PT0gNjQNCj4gPiA+ID4gPiA+IC0jaW5jbHVkZSA8YnNkL3N5cy9jZGVmcy02NC5oPg0KPiA+ID4g
PiA+ID4gKyNpbmNsdWRlIDxzeXMvY2RlZnMtNjQuaD4NCj4gPiA+ID4gPiA+ICAjZWxzZQ0KPiA+
ID4gPiA+ID4gICNlcnJvciAiVW5rbm93biBfX1dPUkRTSVpFIGRldGVjdGVkIg0KPiA+ID4gPiA+
ID4gICNlbmRpZiAvKiBtYXRjaGVzICNpZiBfX1dPUkRTSVpFID09IDMyICovDQo+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGZ1aml0
c3UuY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliYnNkL2xpYmJzZF8wLjEyLjIuYmIgfCAxMCArKysrKysrKystDQo+ID4gPiA+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2Qv
bGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiA+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJi
c2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiA+ID4gaW5kZXggN2Q1ZTg4ZjI5My4uMTc5MWQ5
N2RmZCAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJz
ZC9saWJic2RfMC4xMi4yLmJiDQo+ID4gPiA+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJic2QvbGliYnNkXzAuMTIuMi5iYg0KPiA+ID4gPiA+ID4gQEAgLTQwLDggKzQwLDE2IEBA
IFNSQ19VUkkgPQ0KPiA+ID4gPiA+ID4gImh0dHBzOi8vbGliYnNkLmZyZWVkZXNrdG9wLm9yZy9y
ZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6Ig0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICBT
UkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+DQo+ICJiODhj
YzkxNjNkMGM2NTJhYWYzOWE5OTk5MWQ5NzRkZGJhMWMzYTk3MTFkYjhmMWI1ODM4YWYyYTE0NzMx
MA0KPiA+ID4gPiA+ID4gMTQiDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gLWluaGVyaXQgYXV0
b3Rvb2xzIHBrZ2NvbmZpZw0KPiA+ID4gPiA+ID4gK2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZyBtdWx0aWxpYl9oZWFkZXINCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgREVQRU5EUyArPSAi
bGlibWQiDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gK2RvX2luc3RhbGw6YXBwZW5kICgpIHsN
Cj4gPiA+ID4gPiA+ICsgICBvZV9tdWx0aWxpYl9oZWFkZXIgYnNkL3N5cy9jZGVmcy5oDQo+ID4g
PiA+ID4gPiArICAgIyBJdCBoYXNuJ3QgYmVlbiB0ZXN0ZWQgd2hlbiBsaWJic2QgaXMgdXNlZCBp
biAnbmFtZXNwYWNlZA0KPiBoZWFkZXJzJw0KPiA+ID4gPiA+ID4gbW9kZSBhY2NvcmRpbmcgdG8N
Cj4gPiA+ID4gPiA+ICsgICAjIGh0dHBzOi8vbWFuLmFyY2hsaW51eC5vcmcvbWFuL2xpYmJzZC43
Lg0KPiA+ID4gPiA+ID4gKyAgIHNlZCAtaSAnczojaW5jbHVkZSA8YnNkL3N5cy9jZGVmczojaW5j
bHVkZSA8c3lzL2NkZWZzOmcnDQo+ID4gPiA+ID4gPiArJHtEfSR7aW5jbHVkZWRpcn0vYnNkL3N5
cy9jZGVmcy5oIH0NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4gPiA+ID4gPiAtLQ0KPiA+ID4g
PiA+ID4gMi4zNC4xDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4N
Cg==

