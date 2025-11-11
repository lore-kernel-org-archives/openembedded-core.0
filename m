Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E59DCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 03:38:55 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8981.1762832325748423781
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 19:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=W9qzBx5Z;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.70, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSMvQFtgMVxrrmh8ECF+5VORgiYct3uhiWaRiJx3wzp6tZbKoVDLunf1CkXdmoDKB8ZQ0x9v8GZ4f4gg7dWQKcAZxD7B+IsHPl0XB7tmSd2giCnbykPPr+l5iBOJrImRfx1VMbgxtd4ndxBFpjDlE/nJ7Z5eyOBJakQdRepxtthJ/Sy388k0mIOWy6ZZA+X5Zlk9kWpGQFSxiI5gWdDGTdZJkAsECXziVZs7k7MCBJ4VeZ/fDszVDs1BoEJXGD1je9rxPPkE7mCgiKCgAqYctmXQ+2z+kNlGSTGFFRff2ZdZxcSUkyNy/7rB6fcZWTSHAZPhE1mopQRUtC+/W84sHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NO4OZ72jThQO5szr3FnoK0K5lRWPbt4m7pQKAhlbfbI=;
 b=KoaRpkkvpwXCv078qHzP4JVqSYipW65Y8iB3RUvToacj1WOG15oAKgFejY3+2IQVQL/yj72pD0bOyf97vGaCcvxTwD/epwZY9216LMLKxShq6xaL6Q9mPf1vbdfY3DiVh+kpHPsRt76KmPBLXH3BOLFKz+rFX9qnSjXJ8RaVU2o9FW7MZ8ct9ikH1xcmX5fSEV/yqhWMvjUYfqeBPX+U0AA0aOkLlPMY2/PMFogBI+c7iGpmJMfIYTkeYE2pp3dP6YF+4cLbZp3PoCGFydc/ZciT+2v/NUlBLdp5GAIQTrZhESy/hzhE9UKMmAa4M7Ovn3vS+G1UhrwiVWfSQ/iB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO4OZ72jThQO5szr3FnoK0K5lRWPbt4m7pQKAhlbfbI=;
 b=W9qzBx5Z/D8UP75q9ozDcliwyf7kxu4rUISDU1Euj3Xdr/WQG0x9KjN57/axPFe0sV/gPXmArKe9BBKbXWZL2rao8QnleoVOPZggbn8ZFj1Fi1ayiS/Z+Nhct69BNzwF1F7ZnwdteuO9NPM7NjDT4R4eq8BwvzniEI+UGewauCpUQxJhQ8nx9IKIpN12spg1fZROAYM9WQYftI4IM6p7pWs7VKhQ4dW//b6T/vp16ul5ZWbDyqvW4M4iQNcdt0086KY9qVBbPXpRnrWxHBJeRet9j6B+82jChn6mja/6nvP9g2e+af++y8hH/DqbHCtBVTSAWinkUoVZDJNPSykx0w==
Received: from TYWPR01MB9708.jpnprd01.prod.outlook.com (2603:1096:400:232::10)
 by TYRPR01MB16432.jpnprd01.prod.outlook.com (2603:1096:405:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Tue, 11 Nov
 2025 03:38:37 +0000
Received: from TYWPR01MB9708.jpnprd01.prod.outlook.com
 ([fe80::930b:343c:30f0:7a7c]) by TYWPR01MB9708.jpnprd01.prod.outlook.com
 ([fe80::930b:343c:30f0:7a7c%7]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 03:38:37 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie=linuxfoundation.org@lists.openembedded.org"
	<richard.purdie=linuxfoundation.org@lists.openembedded.org>
Subject: Question about contribution to openembedded-core
Thread-Topic: Question about contribution to openembedded-core
Thread-Index: AQHcUrcVSlHNCsmTo0KPG689jbLs8Q==
Date: Tue, 11 Nov 2025 03:38:37 +0000
Message-ID: 
 <TYWPR01MB9708FB23655928D428F25F1D9BCFA@TYWPR01MB9708.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2025-11-11T03:38:36.719Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB9708:EE_|TYRPR01MB16432:EE_
x-ms-office365-filtering-correlation-id: 580e058e-942b-42bb-b6ed-08de20d3cc7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700021|8096899003;
x-microsoft-antispam-message-info: 
 =?gb2312?B?Vmc0VGVZMi9BSWpzR1ZKV0RLSjZsRVlDN2hWV0NEajViWkZYVzVTeUcrTDF0?=
 =?gb2312?B?QU1YOE5LMmh1V3hQT2VxOXJsTG9Fd3J6ZTdTTU9VQ3FDM0FyL3BXaU9VTmV0?=
 =?gb2312?B?Zmh4TXRLR0t0d2tvODN0cmlyNjlZRWo0dWt5eVVCSDVKczY0T2VkZW1jOFhx?=
 =?gb2312?B?a2o0RHYvRG1HTGkxdk9MaUpna1BoczBGajZEWXpob0FrMjF2RGdvVWgwVmov?=
 =?gb2312?B?NkJVUVNRNDhBNXVaTUFLU2tOdmNvMURuK3JOaHZqT290OXVSVmZ1bUova2Ur?=
 =?gb2312?B?cVROa3FBSzhLUFRXYXFHSk5KRGJNU0hiWkMwRHBRS1loSStQMVEzOHNZMk5J?=
 =?gb2312?B?ZHZ1QVlXR2dLNEEyUEtaREkxQjUzaHIrc0ZDVkZ2bHk3WjZyOXNvd2hSdTYx?=
 =?gb2312?B?ZVVlUjVBUUhoYzgxZk8vL2QxYytHTlFsMnZkMmRoVS9xY21hdTBELzRHanoy?=
 =?gb2312?B?MStGcmMrTW1YbDAzVC84MmFlMmlIcjliaDVIbC9BamtBWjBaY0d5ekYvbk9w?=
 =?gb2312?B?ZHdjb3JLV01sMGJOekFLazFpZ2FTNzR6bnVpZzBlTklrTzJSNlhDRjRRY2NG?=
 =?gb2312?B?c0srZU1FZ1NjTEZOaUREbVl4cThJWWNJenRnaElnQ0ZVenZQRVh1c0ZiaUdG?=
 =?gb2312?B?L0dLbTRxbjJBOXhvTDhpUVdJODBQZkMzdW5BWndtUTQzbVRub1FFYm9zZ1pM?=
 =?gb2312?B?bk5zdGRUQktkVDBQRGc0aUpTallZRk9GdENibFEwSDQ0dy9TOUoxbWlzNWZD?=
 =?gb2312?B?bklCRklVRzZiNXZ1WDUyVm8vclNrNWx1aVlWZDUrQVg2dE9oL3Nua3gzMlpi?=
 =?gb2312?B?UnJ1Z21VcWZISWs5TkNPSFJMdkdmMXFMNUV6bnBRTllHYm93Q0RLanUzOGUv?=
 =?gb2312?B?M251bUxmQ2QyNDh5NXNpc2NFSklHdHlOTHJXM3g3aWY1Y21INDh3MitHNUJO?=
 =?gb2312?B?cFVaRlZTL3VFNWEvZzRqUk5LeWQxVWs3RDJkTVRnOGZSRVhPOFBEWlFhNnJk?=
 =?gb2312?B?Y2pPaldzSTZKenN6VEVMdUZ5L1hsbXN0Y2ErNmRFN1I5MmtOSW9lV3A4VExP?=
 =?gb2312?B?L0hBTThZUW03RloyaGw3cFlNUzcvOVB4KzFjdEhpVjB5bXI5TzM1TW4vYldV?=
 =?gb2312?B?aktjajAvcWRlSUtVc0ppbWdMbm5nVngyWm44T2FqdThOMjBndkIwamVBakNF?=
 =?gb2312?B?N0NEU1BLdXA2YkJBQTNaRzdtNXB2dXRHYW9ONVdiK0lKNEdLT1puaXBkbGcx?=
 =?gb2312?B?ZmVvaW53SndhR1laYnZjRUFGNWZXTGQ1YXNSaUZ5SXFybHI2YnNJYmEwMGFY?=
 =?gb2312?B?YVM0ZzBXT0ZZelVYVU1ESTd6L3NxQXNVTjJTVTRwVEo0QVZzcGYyTGJCbEZw?=
 =?gb2312?B?ZG4zalkxb3djN2lPV0NnalltTElKYWVpaUdYRU5VRGJhNWxMMDJhMTlQN2w4?=
 =?gb2312?B?WnlyRlMwS3RkdDk3bDZQL3ZDZVJONnIyc29rZVpPWlJGV0tRWmJWdi9UWGhI?=
 =?gb2312?B?MHlEL3J3YWxHc2dTaDhMaDBnSklLbzlnamVsMHFuVUJGVEJQUmtIMUhIZHBa?=
 =?gb2312?B?TFgwWkdUbERYWjlVaUpyNnRTamt0YjIzYThWNjZMM052SmRKVzJOcEJsVy9D?=
 =?gb2312?B?cGlxbU9VTDZGaXI3NlZYOVZjZ28xcDJ2TFZxS2pYSEFxZFlrRStSK3c5NDNX?=
 =?gb2312?B?c0VFM1Q3QXVSWXBFaWN1TE1qZ3JpazE3eDd4ZjI3TmJmdHNIeHJ2MWlxd3ZQ?=
 =?gb2312?B?dEoxN3dDakpVR2ovcXF5NHE3T2E3Q051ZnFjOVRRdDNHN1dseEljbEhBbFVw?=
 =?gb2312?B?S0xmMjFCUSs4d2FuRENjL0tNNThrWERwaDIreUx0aEJoY3RSZkZnK3czSzdj?=
 =?gb2312?B?aFhuNXk2cGpRV21hTFpoMWtBaXQ2NmU0ZzdpWjJXNXJkb2QxRWtOOFVtaGhQ?=
 =?gb2312?B?Z2YzcDN1ZEtBWExuNWJqR0x2djFFbTNtSEJQcmc3RnVPWWJBSmlaQlRYRW82?=
 =?gb2312?B?NHVpQ29yRWplMFFtRHoyV2hEOEM2dXZsczR6bDkzN2JrNVFIbFVjODQ5NWN3?=
 =?gb2312?B?akllV1V1V2F3TXRBTzVWTTh6dWE4SkpYQXFRZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB9708.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700021)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?ZHo5V0dqQnNSYUd4czBXS3FpWDVGV0VVNzJ4dGNZMVU2S0p1RXJ2L0gya0pu?=
 =?gb2312?B?YytTMVVNd280TmwyWlAraTExT3ZWSmNpS0dPOHRSejVrRys2WWFVYm9uK0RX?=
 =?gb2312?B?eTNuemJRRjdHU2FJbHBmUnBxUENaSDZ6QitkdjY4TFliNDVOWG1wa3kvcjNa?=
 =?gb2312?B?bUdJcEpNL0VRU2NMSEtITDhUU2t5dkFScHNNTVhnSkRvSXVSMWJLdnpFUTFs?=
 =?gb2312?B?REFTMktOYk5XM1U3djdFZlBDdlpCQ05nZXk2b3dyVGljUi84TWxXaStyZGFP?=
 =?gb2312?B?a01RenJPc1RVSmcwMzBKWnRnUU1FQWFWT2lpS3k5aDZncTRqYU4ydzZLSFE5?=
 =?gb2312?B?UzFUcThjSFB2WUJiSmJTR3BZcFlNcVNSUyt3Y2tPY2RaQm1DN1ZoZkZ0QVBk?=
 =?gb2312?B?a1N2aGFRblNuVmVsWERNWU5hcGJWZ1dERzFjTVhwRVN0VVVBTVR3RElTT083?=
 =?gb2312?B?cnZ6Z1dqMFhWTVo4UjF6Rzk4TVc4dzA3cVFYVGZaNVlNTWYxQWVzYWtDM3R6?=
 =?gb2312?B?aW5BWGVtSmNPdURCYUs3MmRFRWZTRXhPdFRHMkZOZWhLN3duWEV3L3FuSGtu?=
 =?gb2312?B?UDB6bU0rM0pHSHBpYkNQajZ2T2pKSEZ1V3FhSFpCSlM2UnlXOGdvVVZpZ3N2?=
 =?gb2312?B?RTJjMzU3ZkZuVDNGQURKVGlDcmtiK2huVE1ma3UycmlHTzk3aE9JZjlXRU5n?=
 =?gb2312?B?TzdpY3YzVXdrZ2Jwa0dzbEExYTg3cTV5WjhySzRIZlA5Y3BFQXRYbkhPSnFr?=
 =?gb2312?B?TXM2WEtmWnY5QmJGNDlEVnpxNjBVMjMwNnJDRTJHaSsyNmtBOG5uMDBqWi94?=
 =?gb2312?B?RGEyeDlXWmErblk0WWtFcjVhQWVRZ3FVTWtwT3hFNm1uUVVQUTBQYjAvY0pw?=
 =?gb2312?B?SWJNN1pHei9VYnR2a21YdUZ6dmIvQndiVGJHUmcyYWw4MG1HdHovNmVFYjZI?=
 =?gb2312?B?MmRtakNpR1UzMlRBU29rQzI2WVNzYU13U2ZRZzJiRVZRb0s1MXhCOWhwU25h?=
 =?gb2312?B?QWN6aytMVUVSeGhYYSs5bDg1SUpuNllibVhaY040MzY3Sm5HRVI0MllQaUJs?=
 =?gb2312?B?QVBDVXNyTGpCVXdMekNSNFc1R21yRkZFY0VqMmV6aGZpNUdQNG1PQ3pUM3g3?=
 =?gb2312?B?dkQyTitvUzNtUXdlRTkzMmFEVW9TaEdzeVFBS3VQU3FHdUN3M2tHa2J1TDFj?=
 =?gb2312?B?dzh5TnZGM2VwRUs3NndQaVpiUm9DSzlBTWNzZ1RBdlc3aXBrc28rRmVoenRV?=
 =?gb2312?B?bDUrRFFzcVhUU1FRNkFjL0NTaGdKNjlTcy9wYytmY1RhaXNiTXFTZTVRYUd6?=
 =?gb2312?B?eHJ2eldRckRlU1ZPaStWUXNYWFBocjR4Qkx3dGNmZlFtaHlWZE5IVWdhVURJ?=
 =?gb2312?B?d2xDVkhCcElGcTNGWWszaWZrcUI1amJBc2VRdEVHYmt5dW5IcjcrdTN5dnVR?=
 =?gb2312?B?WGtwOGozbUl3Z0ExYTZucGRocUdVeUVrRTZVK1ZPU3FydmVzaHVQRU9vRHZ2?=
 =?gb2312?B?UWpUMGMrbEorV0c3dStyNDhWMHc2VE01R2VSUE9DMnNkOUhBWE8yejZqK2Qy?=
 =?gb2312?B?eFRVLzc4YnFIK1UrYWlKeHgxSjdBWnJsaTNFQWpkY3NMZElhQkwvbytKdWhw?=
 =?gb2312?B?U0d6alh2QmpUemthR1NNZDAxZFRnS2lGWktyWWNYekxOSFBLbHBKYTZkR3RV?=
 =?gb2312?B?T3owZlFHMHovd1ZBc080a0J3NjNRY1RYVGZqa3BhTzFpczRTNzVBblUxejlS?=
 =?gb2312?B?QWRkNVlFa05rUUFHQ3JkRlJiYVMwaCtDdGloYld2SlZSUG5vTGtyVTlYd3hu?=
 =?gb2312?B?c1FNRCtrcW1odmxLTVgwK3FEOTJXdS95OUZuaG51VTE1dmRHcGlQSVdIQUhl?=
 =?gb2312?B?NUJnWVRSTDk4SENpMVBXY2lRL2pWK3BiWWcwREdsVE1IZ3Q5ZS81WUtEd2h0?=
 =?gb2312?B?dGorWGtzaHV1aWFtd1J2OVpldDlnMWdvdmFpR3FiWTlFSGlUdmE4TmwyaFJh?=
 =?gb2312?B?UElKSlJ3aklyeDdDTTN0M1ROK1hoNHBhWEVYRjFRRXE5dEZqak84VDFKQTJ6?=
 =?gb2312?B?WWxMQ0o4b0x2NmFUK2haTkdmeFVySjlzQkJYYXlydGVmYTJ1VkxCalJWK0Yr?=
 =?gb2312?Q?dUEjLlrneB/u4HNnxDCsLDUhb?=
Content-Type: multipart/alternative;
	boundary="_000_TYWPR01MB9708FB23655928D428F25F1D9BCFATYWPR01MB9708jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB9708.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580e058e-942b-42bb-b6ed-08de20d3cc7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 03:38:37.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDIveqaK0PrAaYVuWfXeXw+NfXui31QQZksnL0NN0tuV+SWC8g2j8oWeTcfFhQZZ+mu/gOwacs9eo0xEVxgrvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 03:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226142

--_000_TYWPR01MB9708FB23655928D428F25F1D9BCFATYWPR01MB9708jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQpJIFJlYWQgdGhlIGNvbW1pdCA3YjVmYTU5NzUxMjYyYjlmNDdmYTQ0ZGIw
Mzc0NjYyZDBmYTNmYTY3IGFib3V0IHBva3kgcmVwb3NpdG9yeS4NCg0KQXMgcG9reSByZXBvc2l0
b3J5IGlzIG5vIGxvbmdlciBiZWluZyB1cGRhdGVkLg0KDQpJIGtub3duIHR3byBtZXRob2RzIHRv
IHJlcGxhY2UgcHJldmlvdXMgUG9reQ0KDQogICAgYSkgc3dpdGNoIHRvIGluZGl2aWR1YWwgY2xv
bmVzIG9mIGJpdGJha2UsIG9wZW5lbWJlZGRlZC1jb3JlLCBtZXRhLXlvY3RvIGFuZCB5b2N0by1k
b2NzDQoNCiAgICBiKSB1c2UgdGhlIG5ldyBiaXRiYWtlLXNldHVwDQoNCkkgdGhvdWdodCAgdGhl
cmUgaXMgbm8gZGlmZmVyZW5jZSBiZXR3ZWVuIHRob3NlIHR3byBtZXRob2RzIGZvciBjb250cmli
dXRpb24uIElzIHRoYXQgcmlnaHQ/DQoNCkNoZWVycw0KDQoNCg0KDQo=

--_000_TYWPR01MB9708FB23655928D428F25F1D9BCFATYWPR01MB9708jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Richard</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I Read the commit 7b5fa59751262b9f47fa44db0374662d0fa3fa67 about poky repos=
itory.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
As poky repository is no longer being updated.&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I known two methods to replace previous Poky</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; a) switch to individual clones of bitbake, openembedded-core,=
 meta-yocto and yocto-docs</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; b) use the new bitbake-setup</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I thought&nbsp; there is no difference between those two methods for contri=
bution. Is that right?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Cheers</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_TYWPR01MB9708FB23655928D428F25F1D9BCFATYWPR01MB9708jpnp_--

