Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2049D41C15
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:55:01 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6035.1765446899998172372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 01:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=BS9lLlSN;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.16, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQNdxYZSbJV0iGUGVIVCI9qN3Nzbx54r/nsK93/btLFT4CYJI8R+5sP89Tij/Kp+NW5KRqcODMqCJkuq0WacCb31zCmRs6d5GkcgCPSgBakozw1s38lU0stYChzpgvtsK1tat6iRIWAzroWg0cCI/pectQCKtLzIL13+2ZKGeT+owpFZo43AHrbMMyhAOLeOWmu/b0OSjIT//JYSWztwjlbXTmre1F30VFNGIxnBB0UKZL4RTZC+T3CQvuhr+704tev531tNo8zrETz+79S06sAYd7Fd2IyS6ytDT64BY7ejvazQ/6JrTiCGod/iOfYqPwOMDOtrVfzNwvla8cBEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlyHH+uUWUtEzlYr37jEKiyyt9ZCaRJGkvXq585ZFUM=;
 b=mvEC1lKtPDymqHGyqTPd4NJ/CoUUUopaxwuW7uE3mrItBingVuwsTcTUlNTi20y8gdePmic7vwZxnQ0sYBQjZn3TCQtggAVDNK2cfDrKwW+4jTch5Y5V8wa/GvyC1MHvw78V1ltDwilo0jRKNK2rqYr3d6IVO+v7qmZGJmiWxuSwL/EvXyIKDU0VK3wtpCudTAnO+HbJMAnhlZnRVF0RwSWJ51yD8fqoebd6CxoZkMSQiaOYB7JgqwRfVYtzSl1y1R78csUNLlq4g7Uv95lYbKuJghR6lWKYPTgh6D021bou6gDNAGOP49fNhdORuethK3gWgS9FzLeOBOItkuiifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlyHH+uUWUtEzlYr37jEKiyyt9ZCaRJGkvXq585ZFUM=;
 b=BS9lLlSN8Trmoe72w7XkeQNir9hmCn3vs8RJouBeFDLcXlwQfwnWSPEhECFtQ5BCtNI8Slccz5pdlrGbYFIjjJmcLHMQ+GB3oqx+7nHGJ3FsjB5lCz31LrvBFOuNRwDYccN8CIkjELmI2yETdeKOS1eDRzHuS+SWNUk+3ctFnSdxACvwryJyIoZH9rSlbHXPkGZ5NYGiKHjAYuGjqVTjn33dU18O/Pz3RnJils/ihgICUzPfJ2gYeojOOxpcGUK7q+aC7IjLLOxIMhBB8MwcJK6gAt++FAMWOnKIMk6NCBjnY1q8wDBl7r1FWw42PJabkkv1FOjIle22j/+ijvyrUg==
Received: from OS7PR01MB11486.jpnprd01.prod.outlook.com (2603:1096:604:249::5)
 by OS7PR01MB14489.jpnprd01.prod.outlook.com (2603:1096:604:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Thu, 11 Dec
 2025 09:54:54 +0000
Received: from OS7PR01MB11486.jpnprd01.prod.outlook.com
 ([fe80::9b80:35df:fb95:1593]) by OS7PR01MB11486.jpnprd01.prod.outlook.com
 ([fe80::9b80:35df:fb95:1593%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 09:54:54 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
CC: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIXSBnbnV0bHM6IGZpeCBwb3N0aW5zdCBz?=
 =?gb2312?Q?cript_for_${PN}-fips_for_multilibs?=
Thread-Topic: [OE-core][PATCH] gnutls: fix postinst script for ${PN}-fips for
 multilibs
Thread-Index: AQHcYDSnsYFy0V0HdkWpW1YJRmWKELUR2SeAgAUtPr6AASplAIAACcUAgAQM9aQ=
Date: Thu, 11 Dec 2025 09:54:54 +0000
Message-ID: 
 <OS7PR01MB11486702E8368904865CAA2EB9BA1A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
References: <20251128065949.7462-1-liuyd.fnst@fujitsu.com>
 <6F4CEC32-3094-4B06-9C62-89C97A07649F@arm.com>
 <TY3PR01MB11483B8E76FD565C2B2BE38749BA2A@TY3PR01MB11483.jpnprd01.prod.outlook.com>
 <DB5PR02MB10213BDFA0F45360B27487270EFA2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj8ruGgfaDju0dpnch7Qmum2ZYTnEechW8HbCgXqj3tEkQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8ruGgfaDju0dpnch7Qmum2ZYTnEechW8HbCgXqj3tEkQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-12-11T09:54:53.431Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11486:EE_|OS7PR01MB14489:EE_
x-ms-office365-filtering-correlation-id: 53b10f40-cfcc-4493-a9b6-08de389b55e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|1580799027|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?VUYxL0drMDcxdE9EckNZZFdzaTJ6Yjh5WkxVTW9LMVh2YUxWUmJDTjlLWGRP?=
 =?gb2312?B?N1ZpcksxREtHeVJKUnBxOExJMG90ZXZLN3o4Z2RiUU85QmkvcFo4QVk0eGwr?=
 =?gb2312?B?VElqRTJBRVlFeTB4dFZGS2FlTDRnanJGYzRZNExic1p1UytuN0JseEtySW9F?=
 =?gb2312?B?V1V2b1FmOHZ1YkhzNE9JT2FqMkhuV1hpSUNaVDduSFlkQjh2SVpkck9aUldq?=
 =?gb2312?B?YkUwcm5FRkd3NFdocVIra0sxTElMUW4zVzhzYTFsajdYUlpYZ09OLzJrdDFY?=
 =?gb2312?B?TjJxUVYxM05ZTVdDQkY2YkdtQW1uUjhKa3VZWkwyQlpWc2VVSEd5M2hhUDla?=
 =?gb2312?B?YSszK0lxbWsxRG00K1NCK2tRWVp1SE9mWUxwb0tIZGpsNXVVSlkzbmV4cW9S?=
 =?gb2312?B?RzdBZTVxR2xVZE1XU3NsNUJqTC9sekJveXpRSWFNQ205MnlRU0pyc3plNmNW?=
 =?gb2312?B?bmRKZk5tNTdvb0NQL25LYmJIR05BOFhLb3pNclNqaTVIVGpsdkd6VzNleVJH?=
 =?gb2312?B?akdxY21rMzVpSDBPRW5NYm52dXAyU2gyK1FHZDE2cHN1RWRzc21KSEJPWnkw?=
 =?gb2312?B?QVMxektKdCsxd291YVk1K2FtZ1JLUmdQcnl0NmdETXVpdkpLUFRtK0JZVE14?=
 =?gb2312?B?UUFGdFlpRStrc2IrSjhKV1IvNnNxeXRXU1hqRkZqbnhsK29PUVhZdTJZa1Zl?=
 =?gb2312?B?YjVycmZGeWNGaG9XNSs3Zldzb3o1ZEwxeUtBWVppaFZGa2VWcEJuc2R4S2hU?=
 =?gb2312?B?MjlKWFNjTEhJay9uTmVxVVkxTFk5VFZSWnF6N3NvclZ6VDF3VzZkRHdwc1Ft?=
 =?gb2312?B?L0Q3MkhOUUQ1ZjlIajhMWXBaaGx5T1c2RHQxNXYyU3FCY25HdUZ2emNjYy8z?=
 =?gb2312?B?OTV5Vkd1SFVqYUJqNSs1R2lVVndZRjJ5clBhRmVKUkpnVHBvSHgrZ2d3S0E5?=
 =?gb2312?B?ZUpEKzN3S29XQ3lCWXF1Y1h3ZUVudVdmZkp5b2NsQmtycFBTT2hUVVRZbFVl?=
 =?gb2312?B?NVRvemNza1VnUzNrTHMrLzJpTWh2czF1eFJRblFLN3VURWozN3Q5K2c4QXVS?=
 =?gb2312?B?eiszRTk4cjR2Y3hOdG5haFZmNldoeHF0bHpqT0dVWWlPWkxsNm0wUlRRZ1hs?=
 =?gb2312?B?RCtTNEFPeGZVYk95dDlXWklFVEZlMG11akZLb25LQzgwbE9XUFVnV1pVd3dt?=
 =?gb2312?B?U2hSNVo3dVhuUGVSai9QMUV3Mitxa0MwU0EvTlVROWNjWU1NQ1N1aDFCZ1hk?=
 =?gb2312?B?WjEwY2Nwb1ZsL29uQ0tJR28rZHV4d2cvNkVWa2YveDF5Ly9hOVdFUTRTMGhY?=
 =?gb2312?B?VXhhZHc5YzRmVnQ2VWR2V2xjSmdSMkxxaFoxTEhXT3ZqTnBZNkNnSWhQdGQw?=
 =?gb2312?B?UVlXVUF5ZFYzTkdkZ0w5V3JTWmwwdDNVQS9FWTVKbk8xelltYlRDd3JLS3Uz?=
 =?gb2312?B?bDRmY1VudmtsdC96dS9qSTlOcVNHeDd2RWZJdTdZQ2hzTGJndklJZVFSV3BO?=
 =?gb2312?B?ckNIbGI2NW0zMS9aMVFJZ0pybDRUeDhlTmhDUWNyTDEzeHVsbkhYMUpxallq?=
 =?gb2312?B?WnMvQktaTytBbzMvR0Y4aGhQUHdJdWNZOTUxM1dMOGQzamw1aXh0K2ZaU2R6?=
 =?gb2312?B?OUNjVjBqRjIvNUd1L1B4ZFRLN3Uwa0lPU1ZLZTRiVjJXbCtBU1RQb2d4Wnc4?=
 =?gb2312?B?T3RydVZUYjNyZGlMUFY0UDNYZitYYy9LM1FJb0NiNGZ4YmNpUG0wZHdWSzB6?=
 =?gb2312?B?RVAyRWxudTdRRVlGajI4R1A2dEY1NHRTbE8zWHhTRzFUREl0MGJDUHFnbitS?=
 =?gb2312?B?NGozaXE1c3VBNHFCSDVUa0Rpa0xNam1qUFh1WlczUjBWZm12YVdnaVI1Sklm?=
 =?gb2312?B?bUEwM3YzWmNvUXcvbWZCWGF5dVhWcHhxOWVOcXFNQVUyUzZtb3VONEsrRWtO?=
 =?gb2312?B?elNrRC80RmQvLzV6aW5GeEZQaHdzOXIvcS9oMHB3eXhneG5KTTRtbk04V1dB?=
 =?gb2312?B?aDFqZURCa3I0ODlXZ0hiUXRhaFBrQnY2TjMrcWc1bmhIY2tGN2w4bGdoTGlD?=
 =?gb2312?B?VFhMVzVjVFVQVnJBSWc1NXl5V1VsRk5hSXdBTDlkZ3ZxcStmY05Rd2pEaERr?=
 =?gb2312?Q?c0/o=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11486.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(1580799027)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?dlQrN3pFa3hZc0ZLMitFMThrbEFhTkFRNUlBcHh2RGpERmxxZXNKZTBXZXR1?=
 =?gb2312?B?RDBkeURtaVlTWjNuYWozUm13SnJMdno3MXZrcFc5NEI2bXRMOE16K2ViYzJ2?=
 =?gb2312?B?OVNXdUtiN2cvU0Y4MWQrdThia0NGY0NJMkpKb1ZSUFQxWHU4dFhqOVg0SE03?=
 =?gb2312?B?UzViYmdNYjF0RWF3Zlo2VEVzejdkRVUzeUFrQU4vZ3k2UWR0WjIwTHM4b0Zt?=
 =?gb2312?B?N1M3OU5qdzVDeXRabE1hTXRSK3RkdTN6OVl1VkZDVVAySU1MdUZoK053NWpH?=
 =?gb2312?B?Wml3Ujg3RnkrVCtQUHdxdytvMTF5alJwcnFHajhNRDhsZUY3d3A2dEhsbkJ5?=
 =?gb2312?B?alorQlpTL2liTlJZSGFreHcyaFd4d21RaWhlenMzODRZbm1NY2pXNXdXb2dl?=
 =?gb2312?B?c0pVWkhMZnF1R3IycDduMUVFOEc3TVkyd1R6T0hsMmNTZm1xTC9VRnNuM09q?=
 =?gb2312?B?dzFZa1NMSEVwNzV4Z2tNMnVCOStxcVl6OWFteDlPOHV1K0l1SzZzRE5wVHR2?=
 =?gb2312?B?ZzAydmw3Q0RXQ01XNnk1VlY3NTRCdHllYlRuUXYyMThHMVNTdXZLcGF0Yjh1?=
 =?gb2312?B?QnhFNHQvVHhYNU5Fa2p2Y0Q3RWJiamRRU01NRGhMVUQ2ZDRQMzlNMjE5UGI4?=
 =?gb2312?B?aTJSTWlxSkJIMFpmQjY5cjJJdHVESEtTSFZLYzl6ejJnd05GdWZSMUpGS2V4?=
 =?gb2312?B?ZUxnZ3U2TU5NVmVORmZuTm1DZHErams1R3puc1d2TzdpWEhpWkhDZno1UHRl?=
 =?gb2312?B?MmtubnlYbDdiVTVYblRkM0VYNzJieVpDRzg5aXdVK2I1emFpVUVXUWJzZEVh?=
 =?gb2312?B?VWtQUDJaTEd4aGdtaSthZzV2UGovT1NQeGIrY2tzWUJJVHVHTm5mMXpTL3lQ?=
 =?gb2312?B?cjRKMk9pY2tXRHMvQUswd29EWVRUMkpDOW9rQ0wzQXhiMXpIQW4vMHRIblpD?=
 =?gb2312?B?cEg4aGFlVWYzcHRnUy96eW1pZnJRaFIvamtNd0NVczg0K09Ha2l6dXlDSUpy?=
 =?gb2312?B?dzdnbTdPYXdKbmxaK1YzeUNTZHFUd2JnNzRNeFJpUnBLTjJuclJEZjk3QzBN?=
 =?gb2312?B?YkNrbXkzSU1FcFl4UVZzcVV4WHM1ckltNU9tZDRBb1JkWlp0MGhpZ3hhWVI5?=
 =?gb2312?B?WFc1djdjRjNDdFN5VE1OdkFNSFpEZG5YNmFMbXNIUjBWVysxOEJQb0dGbW1I?=
 =?gb2312?B?T3luQzQ0QXd2dkFMZHo1TEthdzFJVXBnSmxTajB0OEpSZzFqNlVlNHJtQktk?=
 =?gb2312?B?c2pHRnpxS2hXd2dyeHhGcHJ3NzZkQUhPSktTaUp1NUZDVkhxdGhyUkc0b1Vx?=
 =?gb2312?B?Y1dqY0laZVNpL3oxOS9vQTVMYjJYZ3MrWWxvRjdDQ25Zc3BBaHVwd1B0MzNL?=
 =?gb2312?B?cnFTTTRHczJNOHhUUXFHV1VSdUN5S0dZUVB5VmVYYmNxakdGanpKSjJTWWlh?=
 =?gb2312?B?RlFxVXp6YjFuRmlvZTFhTHVnOWJwNHMzdWVUWUdRaGZFSFlqTUxxZ1BPT2gy?=
 =?gb2312?B?WUxnSU81eWhKS0dGaGlUdlZHalJncW8zVTJrKy9md0N5d1NzRGxUSmxLTElY?=
 =?gb2312?B?WmJwdEVLRnZNMkhEQ0NEaWtZbHA3TnUwMERnbWxXeVM3RXZZRFBobVp4OEJy?=
 =?gb2312?B?RWgyclhPQ3BUcVoyVFhVM2c2N2tLZGdRRFBWdkx6NjZLU0QwWjlONXc4VXFl?=
 =?gb2312?B?K3lGTjE2b3JhMkVQem9JOWw0SUlRT0JHUU1xWHJNaDdrd0h4UXA1SHprRW4r?=
 =?gb2312?B?c2tneGhLWm1VK2lsdFB2TS95UW9RdmdBTHVUWnl5c1FSSmhzd1ZmYnVkTlMx?=
 =?gb2312?B?YWZxQSsrNmxzUEtSTWVwbE1YcUlXVVZoSVZMdk1pcmpmRkpTQk9iQm1RVitk?=
 =?gb2312?B?YmVWbWN3RDJaYWJLOS8yclBtZ2twS3dNQlBYdlhUZ01CV1gxb1J2cVBCWkpI?=
 =?gb2312?B?SzBQUmUzcnRaZGFUU0FLT1RPcEFmMTJuaVJCNW5icU9Ea2VWcmNZMmZ5enZn?=
 =?gb2312?B?VW9nb0piVUtYYzhxeDdZZGthVE1NV3prZ2ZmUU9GM2E3Z0NQRkR3elE3RWgy?=
 =?gb2312?B?U3JHbE56QkQzRXNBTEJuY3FDVStpVDV1dUxCUEpzN3lsWkIyRXlaTis3MW5k?=
 =?gb2312?Q?A+A5GoVlt8P1jcV1vnmzXgiHw?=
Content-Type: multipart/alternative;
	boundary="_000_OS7PR01MB11486702E8368904865CAA2EB9BA1AOS7PR01MB11486jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11486.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b10f40-cfcc-4493-a9b6-08de389b55e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 09:54:54.5471
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TEYEUJVIbTpB1hgV4fQnhsDrJEwsprm53aiS8WKMHREKShUt3gEGmoBU5ISYsAaiXLCJKRSWTP4KKYhKQqjjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227516

--_000_OS7PR01MB11486702E8368904865CAA2EB9BA1AOS7PR01MB11486jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQogICAgIENhbiB0aGlzIGZpeCBtZXRob2QgYmUgYWNjZXB0ZWQgb3Igd2Ugc2hv
dWxkIGZpbmQgYW5vdGhlciB3YXkgdG8gZml4IHRoaXMgcHJvYmxlbT8NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQq3orz+yMs6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPg0Kt6LLzcqxvOQ6IDIwMjXE6jEy1MI5yNUgMDQ6MDENCsrVvP7IyzogcGV0
ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tIDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQqz
rcvNOiBMaXUsIFlpZGluZy/B9SDS0rahIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPjsgUm9zcyBC
dXJ0b24gPFJvc3MuQnVydG9uQGFybS5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
1vfM4jogUmU6IFtPRS1jb3JlXVtQQVRDSF0gZ251dGxzOiBmaXggcG9zdGluc3Qgc2NyaXB0IGZv
ciAke1BOfS1maXBzIGZvciBtdWx0aWxpYnMNCg0KT24gTW9uLCA4IERlYyAyMDI1IGF0IDIwOjI2
LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhDQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo8cGV0ZXIu
a2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPg0K
PiBUaGUgZXhwbGFuYXRpb24gYmVsb3cgZG9lcyBub3QgbWFrZSBzZW5zZS4gVGhlcmUgaXMgbm8g
ZGVwZW5kZW5jeSBiZXR3ZWVuIHRoZSBta2RpciAke3N5c2NvbmZkaXJ9L2dudXRscyBjb21tYW5k
IGFuZCB0aGUgZm9sbG93aW5nIGNvbW1hbmRzLCBleGNlcHQgaWYgaXQgYWN0dWFsbHkgZmFpbHMu
IEhvd2V2ZXIsIHRoYXQgd291bGQgbWVhbiB0aGF0IHRoZSAvZXRjIGRpcmVjdG9yeSBkb2VzIG5v
dCBleGlzdCwgd2hpY2ggc2VlbXMgdW5saWtlbHkuDQo+DQoNCkkgdGhpbmsgdGhlIGVycm9yIGlz
IHNvbWV0aGluZyBlbHNlOiB0aGF0IC9ldGMvZ251dGxzIGFscmVhZHkgZXhpc3RzLA0KYXMgaXQg
d2FzIHByZXZpb3VzbHkgY3JlYXRlZCBieSBhIGRpZmZlcmVudCBwYWNrYWdlLiBUaGVuIHRoZSBy
ZXN0IG9mDQp0aGUgc2NyaXB0IGlzbid0IGV4ZWN1dGVkLCBhbmQgYmVjYXVzZSBpdCdzIG1hcmtl
ZCBhcyBvbnRhcmdldCwgdGhhdA0KZG9lcyBub3QgaGFwcGVuIGluIGRvX3Jvb3Rmcy4NCg0KQWxl
eA0K

--_000_OS7PR01MB11486702E8368904865CAA2EB9BA1AOS7PR01MB11486jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Alex<br>
<br>
&nbsp; &nbsp; &nbsp;Can this fix method be accepted or we should find anoth=
er way to fix this problem?</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alexand=
er Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2025=C4=EA12=D4=C29=C8=D5 04:01<br>
<b>=CA=D5=BC=FE=C8=CB:</b> peter.kjellerstedt@axis.com &lt;peter.kjellerste=
dt@axis.com&gt;<br>
<b>=B3=AD=CB=CD:</b> Liu, Yiding/=C1=F5 =D2=D2=B6=A1 &lt;liuyd.fnst@fujitsu=
.com&gt;; Ross Burton &lt;Ross.Burton@arm.com&gt;; openembedded-core@lists.=
openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [OE-core][PATCH] gnutls: fix postinst script for $=
{PN}-fips for multilibs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, 8 Dec 2025 at 20:26, Peter Kjellerstedt vi=
a<br>
lists.openembedded.org<br>
&lt;peter.kjellerstedt=3Daxis.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; The explanation below does not make sense. There is no dependency betw=
een the mkdir ${sysconfdir}/gnutls command and the following commands, exce=
pt if it actually fails. However, that would mean that the /etc directory d=
oes not exist, which seems unlikely.<br>
&gt;<br>
<br>
I think the error is something else: that /etc/gnutls already exists,<br>
as it was previously created by a different package. Then the rest of<br>
the script isn't executed, and because it's marked as ontarget, that<br>
does not happen in do_rootfs.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_OS7PR01MB11486702E8368904865CAA2EB9BA1AOS7PR01MB11486jp_--

