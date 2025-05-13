Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80EAC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 07:41:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web10.70565.1747122071835548922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 00:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=s/4W6Dqb;
 spf=pass (domain: siemens.com, ip: 40.107.20.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUWfuE2i/HIyynN4uemE2LC5NpzSO79e55sBxs/KWcahbZ2Jhj5ig6MX42D7Y6lHjsc1bqS+bjPU1GjstPWQ8GhMq8oNKr32TFNYgKL6huGG41veD4eTqG17o9yc6eq6z6VzIqppOZM9XcyEE+sb9JQUTiS6ejhGQTTMn7gWB4Oyuupn/WzDDygDyt7zkw8JUKbu8wyVuT2t9bChSGDxBv2z1ammtlyOadVMiZrDW+/AS3z7zhwVKdWYfSvnHiq+pdKgqvhfOcazUN8lqBn/zKhKRtauWi8tEoA8vUmKYQPw4pfAnH4nOm/wqKspg/8RzkR1xr1WpSs5/tMC3abp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Gp5QvY0cweq50IesxM2VQG6OWw3rQqlSmNbbpfiAE=;
 b=YPl9FMQeQI189Dg6LJWaN4whr48JC3Fke48RjVimNLLDmrUfeQMvjlb7oHHDitEWooe7fPWp/XTTarz9Xbqr8EUYtrcLWXr5Vueo9JurNPc0f4BMfuAq3tBbXU/iMyyZAu3DWR0Ox8N2udLZh7nHI+o0QuKX5lPbLCeY1kfTQqhMluxBaHa1lF9CwfXj0kpHrYerxN9dKJYd0xwpHqnAhNqxet6mAnufGzXgPS3JWHU6VTpwsgk51H+snGBGUyl66w044+ardPOXd25h0vVnwfhwrh1BxmE40X4dUeMBVAbZZNLgikzbB/7XobEhpWrljsNJPENf6SU9fX0zlJS3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Gp5QvY0cweq50IesxM2VQG6OWw3rQqlSmNbbpfiAE=;
 b=s/4W6DqbAI20gpoe487s6f3+CbSnn7txXRZLTvrQJCd47QRNw0croKi9NC+iQWZ9O104TDkqDrCgqHs6FO5xYBcakBNhJ6zFusgVmFcsy1bt1Im8t2Rvc2fxWrxGpMvRf2gAE4lX9be3atRHD7Qsjb8plzU7Ne+WKJuj7ljW5w0jvJTisYFqRt32nRNYNGo849JTzgYpPDzeshiLfcpCchzsUxyfgZLt/qmD2nUXkbKXzMIPkECcrPpE9hqqhlAQFSTK2A51+ml/KnaL2bJCQ2MXxSCbrftEQ4iBCSIOWbUKdi3JzizkLQZ6lu6qR2UCturhr7MU/jt2Ud2kTd0ajQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AM7PR10MB3924.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 07:41:08 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 07:41:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] testimage: get real os-release file
Thread-Topic: [OE-core] [PATCH] testimage: get real os-release file
Thread-Index: AQHbw1bOQ1MbKSBjckSIz00PPYEu0rPPkbsAgACb68A=
Date: Tue, 13 May 2025 07:41:08 +0000
Message-ID: 
 <AS1PR10MB56971C6618B781BEEFBA4711FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250512155835.9159-1-peter.marko@siemens.com>
 <18b89e1c8bbd57336060148b6d96ce809295c98b.camel@linuxfoundation.org>
In-Reply-To: 
 <18b89e1c8bbd57336060148b6d96ce809295c98b.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=1c0e366c-b6b4-4000-8a48-78dd9760730e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-13T07:39:31Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AM7PR10MB3924:EE_
x-ms-office365-filtering-correlation-id: 5864aaa6-a527-4649-9d11-08dd91f1868e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZVUxd0F0Z1FnRURBcGpwT1RudmhaM3h3NmxHTk1jNUVCOUUwQm1OcTE3VnZC?=
 =?utf-8?B?MDZFRDJBeWdnRmFNc2dhZWk0RzVaYlR4emdMWmtwMXpzVGs2WjBVUnk0UHNS?=
 =?utf-8?B?RkpqWnVMNGlSOFRiU05RZzg1dVByd2N4SUduMFRIMU4xSFE0UFBEeHdyQkcy?=
 =?utf-8?B?UDdYL2ZKRVFiSGU4d3dZMWptR1JjUGNDWkVzNHlsU0tFOHh1eHRidXgzcUxO?=
 =?utf-8?B?bW5JRHovNnMxSVkyQUFKWEVZTEJuZm0vZGtnWWFYWlBIV0pySTF1QWJ1L2ph?=
 =?utf-8?B?ajZKT293MUpjTnUrdzdRODVDMHQ5cGpxcGNsU3JVMk5VRjg5aVl6NzhTcUlG?=
 =?utf-8?B?dWlOVjlibS9vbE5jeGxFeGw4Tjlad3RvYnFtL0RaNm9IQU1ZMkRZNGU5R3JP?=
 =?utf-8?B?ZG45THpSOHU2L1NFUGRhTG02MUlFR29EN3lIR0d1WkVjVHB3SmNaOTBEdGUy?=
 =?utf-8?B?SDZad1pNOTVwSzRiUGNUNnVSOExseUY0VCtaR2VMSTIrOEdUNmtQTkpnbDR5?=
 =?utf-8?B?MWFGYkhvT1JCTmZTMFJEYlMvdUtzRFI0eWp6Vk1WUC9HRklLNlVQSnlSVXY3?=
 =?utf-8?B?RFlveWFPMm4xN0VGcVprOExaMDVtcVU3U2pUTnBESXU2eTEwb09JY291dWs4?=
 =?utf-8?B?ZlFZVWtQZG1pOEpteUJRQVZKWUNqc21kTkZJQU54M2phYTBNeE1xTndvMk9Y?=
 =?utf-8?B?czZhT3RvV1hiUFFjdXNrYysrSGpsVjlvRTNjT3dWRnh5YW9pTkcvYmUvNENP?=
 =?utf-8?B?aTZ0ZW9Pc0FJRjhiNjRpUXJWSDNCbC9iazRZc1ppbE9oTi9hTG85TkZYNE0r?=
 =?utf-8?B?OFZGZndvWHhuVDYycXZ2MXNHT01FeFBYTkJlRnhoNFhkcFE3aGtzeHRBZVlr?=
 =?utf-8?B?QTNXT1ZTWWZwbnVEaHlvNExGQVoxc0NEUnQzTnZIUGZWRTFVbHl2MXVLU3Zx?=
 =?utf-8?B?OHBBcnczTDdoTW5lYXNONjE0TGxnamRsaTg2YkJqWjh0SWFrMXgxWU5FQmFV?=
 =?utf-8?B?K1BaREJJRzdQVWxRcUpFT1RTRWowN2N5ckFRL05UZ3N0cGpqdVZFZGxRbDNY?=
 =?utf-8?B?dkdoRFJRV2hqTGlBOGFYTDFFemxrUUxjSkYrVzh3eEdUZGJXM0ZBcFFuZFhm?=
 =?utf-8?B?VGVwUXloWWlNTXdxVEkyY3JRNThBckh2ZVg0YTRXSjV6RDltNWNGY1NwdEh1?=
 =?utf-8?B?NUdoSFNPNjdLdHUyNzJDZGRyaGpWR3EvWHcrSHo0UTN0TlNvNGQzSEsweEVu?=
 =?utf-8?B?bXh0TFRObEkrRzJSOFVoTHVVU0c2dm1uR3psWnVBYmZZWnVwRU1GZStwWHFT?=
 =?utf-8?B?RHhrREdlbFhBTHI5MSthWWhCSkt6STBwMEthUmpsNU1oTDF0TkNXSXc0RjRx?=
 =?utf-8?B?Z2hVeDhIMUpPZlZvbzhwb09aeEFwYWZQOTYyT2M4Z0xOaXhvUGdDRjRsRUxT?=
 =?utf-8?B?RFRmNithWDE1TmUzcHZpTWxRMVpOTHN5ZmhlZGwzUlFKQytRemFObnlEaUs0?=
 =?utf-8?B?S282cE4zdFlCT1JiQXRVQS95all2YnVZYW1CTCtORG9lUStMNEFDVjhQYUxY?=
 =?utf-8?B?QnN5SFhUOXcvU044OTdvVTVlV0F2WlFrODdHZk12Z2ZSMTFjUDU2ZUlVeHVI?=
 =?utf-8?B?S012L2IrdFRKVCtGNUNxSitOSzMwbDZKZUJXanpnSnVxS21kZ1FQMXY0ZmhM?=
 =?utf-8?B?MlA0RzJBcmhDcXVuN0xlcnU1S3JhZVAvK2h5UytCMFdEbUtQOXgwSGFTSW1N?=
 =?utf-8?B?OVpxQlpuSml3V1ZYZlRPYkJTdmNFeFA3WHB1VC9TSTJmbGkxQzQzSm9JWEJ6?=
 =?utf-8?B?VEx0TW82ZDlDQjhXOHRNWDBHamtyRzNKMHE2VlBWSlNiVTNEdUNXYmd4YzYr?=
 =?utf-8?B?eFA3TjZGYUF4RXVvdzRVNlJibXpWMklUZHQ3SjhhTitZVXYyOEd1V29wLzN6?=
 =?utf-8?B?NG1vSFAycnJDcnVMakcvV0xrLzVUanVsbHgybm8rOG8zWHpuektleHNKZTVC?=
 =?utf-8?Q?snhtfA9f9RYLaiI585BlDxvnX2IVGM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TkJBZUtLQnFGS0xQZmxjUXFidTRCbjQ3dGhMemFFRGt5QXVCNXlRb2RBNC9t?=
 =?utf-8?B?RU1zZm9od0FDOWlZazUxV01Yb2hHNGw0OTQvT01RRWJha2pOK2VRRUd4Ukcw?=
 =?utf-8?B?MXlhSm9EZ2NLZVhlRXFuVmN3bnBFTHUwSEJJTU1RU24vd1pKcStXNnRTMld3?=
 =?utf-8?B?KzR5aEJSS2grT2FHMFdTQ2VmUm4vTjFENXRUVkJ5bm5rc1VFMWFXcTY0aURV?=
 =?utf-8?B?YWZ3b0JkNVZURThuNDduT2kxSWhQQm5DQXM5TVJWQVdrVU5yd25pcmFHd0t0?=
 =?utf-8?B?ZS9VZ2ZkYzErRVg2b3dXWXNpeUJjbnBHK1VYSURybEs3UjBTMWd1QXMzM3lI?=
 =?utf-8?B?V1ZQcS8vaVJlYi9vbnorNUppbU40R29hTDVLcklsTjkxRW81TWdoRDdiaUxi?=
 =?utf-8?B?RFFjWkgwUm5UL014MmIwRjFrdnovTUtQR3JTUWp4K3ZKM2FKMHJhdnJTRU05?=
 =?utf-8?B?VTlMeGF0SGxSQ1ltbUpHMldjV0twNXc3eUs3K0p0RDN5U2pWeEhITFRvOVJ0?=
 =?utf-8?B?M0t2dHROZytlTTBwME90Z2U4TW9PeG5iVU1NSFVhVmI3ZWtIRUMrQUhpVENW?=
 =?utf-8?B?NG4xbml0ckxaZUJXS0VUSHhKMEd1N1VwNW5SY3dNQ2tyNjN0VkJTTEJHdElR?=
 =?utf-8?B?T1dwV1lsZGxETFNpTXpEb0xYVlNWdmxQRVdNbTJMaE9oZEJRZThjSHRsaEIv?=
 =?utf-8?B?SERrVzBKRnRCMUpma1BNQXVVRTI5c3pjMitRT2RPZlV1VkRKcVZ6VGZOMDdL?=
 =?utf-8?B?dlJxbmZHTDlXY0lpSGhHVlFRc2kyNkxRRzdDcUJYQ0xYRjNPYmRhKzNpT3BO?=
 =?utf-8?B?RVN0UmRZSEM1WGRMRlJybzcrQUlKUjdhU1BuS0tGbm05MzJkSjBaeFVaVXVN?=
 =?utf-8?B?RWQySEVmNEhnaGt3c0ZqdEFHWkwrK25FVDVEbXlOM3lKYUZ5NkFodlNBOUhr?=
 =?utf-8?B?amljSml0dkpsS0hUMlFJc2FRVUt0WFJ2a1hoNWRHNmZ5T1B5eHFPRXozZUtO?=
 =?utf-8?B?eXBqT0xDWEVGcUtNbTVpanh5dzV3MEZObFhZalFMN05TUDhoRzloSzlpaVMv?=
 =?utf-8?B?Nm5JbzZxclZ0eXFFNFVGb3VqZ0NuWW44ZlJrbkM0dlkzcFBXN05jR1FVb2dQ?=
 =?utf-8?B?elo2czFlTXNkemJlMkJLNkZtcmZIMTZOeTRSbkNIdVBaVmExNTJ3cUxNS2hH?=
 =?utf-8?B?VzFKLzkwU3lNTkJwNVpxRTN6V0RmbGZ3dGJLWXZJbXozQ1UzMXZaaFkyRFJW?=
 =?utf-8?B?V2RoMDc5Q3pOUUdLaWloR2xHQ0trY3IxWEtrcVU2RjlhWEEzVm9vT2t5V3gy?=
 =?utf-8?B?bHZZeE94SFpNdnRob0wzbjZFS3Uvektja2xLL05sOGRqM3dHSnE2dHNYUjdn?=
 =?utf-8?B?aG12Z3BwSm5pak5CWm9zT01oVkliRHZhYi9DeTZxNW1aaXpXTmp1ZU1oWnNQ?=
 =?utf-8?B?Yi90eW56YUJGV2IzQjdFQ2UvRGJZR214QnVHTzNObzZ5bmNrdGZob3lCOWpm?=
 =?utf-8?B?c0xvSWIxYUd5M3RVWDgwSm9hSkJKUnRNbXlKWFNIUEtTa2N0VWJXblRQeXpJ?=
 =?utf-8?B?ZEhKZHlnWVYzVUtGUE1Sc1Bwc0tpNTQrTDhpdGpCbkRPcjU3Y21mUnRRdGZy?=
 =?utf-8?B?YUkwNHdHZ1lVZFAwMGt6VzNWc09wZnNVUTFkQ1YxVzl6aTBLK3RMMXR3b2o2?=
 =?utf-8?B?R3hVemlzRjg5MnVFc0pVTmZCV05ZdGx0TFFLOEFKRWltdE9QeW5RTFlnYkEw?=
 =?utf-8?B?WWNUNmM1aFZMU09RZDV0ZGdabFlETWREVnBjSU0xeGx1UDdzUFpYWEVpOVRM?=
 =?utf-8?B?dnRHVU1QejNtSkpWV2FuRUt1VHVBOVYzbXVFZmxFVGg3QjNOckY4bllMTHls?=
 =?utf-8?B?dFBLMEhlVUYveldUaFJtRlNqREFpYUVyYkxEU056YTBMYXprYXptaWpGS1gv?=
 =?utf-8?B?WmY0WWNYR0xCQXZvamVOUzZweG1MR0F3Z1haRmVZTThrVEd1K00yUkNhRGJF?=
 =?utf-8?B?VG82aWxVNTZmcjFSbXpDRjJCaHpzczJHUGx2WTkzaU9xSkFuK2JHdDhUNVRw?=
 =?utf-8?B?Y1VBTlhjVThLWFNqd0Q1YkJYbXhHWXBpMm1FZS9UR2l6cXNaVFd3WGIydHRK?=
 =?utf-8?Q?olPxhHqK/lz1vDFvbKVtSfAcq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5864aaa6-a527-4649-9d11-08dd91f1868e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 07:41:08.6819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uEfprKbmR5cxyjb2rmyVg6974sszghCkjmPvG32dY4O/x0HYHxU+XZ2yRtb1A5ofvTCg30/3jCx2DatMwolOVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3924
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 07:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216400

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1h
eSAxMywgMjAyNSAwOjIxDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBl
dGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdGVzdGltYWdlOiBn
ZXQgcmVhbCBvcy1yZWxlYXNlIGZpbGUNCj4gDQo+IE9uIE1vbiwgMjAyNS0wNS0xMiBhdCAxNzo1
OCArMDIwMCwgUGV0ZXIgTWFya28gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6
DQo+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+DQo+
ID4gL2V0Yy9vcy1yZWxlYXNlIGlzIGEgc3ltbGluayB0byAvdXNyL2xpYi4NCj4gPiBTeW1saW5r
IGlzIHJldHJpZXZlZCBhcyBhIGRlYWQgbGluayB3aGljaCBwb2ludHMgdG8gbm93aGVyZSBpZiBh
bHNvIHRoZQ0KPiA+IG9yaWdpbmFsIGZpbGUgaXMgbm90IGFjY29tcGFueWluZyBpdC4NCj4gPiBG
ZXRjaCB0aGUgcmVhbCBmaWxlIGluc3RlYWQgb2YgdGhpcyBsaW5rLg0KPiA+DQo+ID4gQWx0ZXJu
YXRpdmUgY291bGQgYmUgdG8gdXNlICJ0YXIgLWgiIChzdXBwb3J0ZWQgYWxzbyBieSBidXN5Ym94
IHRhciksDQo+ID4gaG93ZXZlciB0aGF0IGNvdWxkIGxvc2Ugc29tZSBpbXBvcnRhbnQgaW5mb3Jt
YXRpb24gaWYgbGlua3MgYXJlIHJlbGV2YW50DQo+ID4gZm9yIGZhaWx1cmUgYW5hbHlzaXMuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5j
b20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2NsYXNzZXMtcmVjaXBlL3Rlc3RpbWFnZS5iYmNsYXNz
IHwgMiArLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS90ZXN0aW1hZ2Uu
YmJjbGFzcyBiL21ldGEvY2xhc3Nlcy0NCj4gcmVjaXBlL3Rlc3RpbWFnZS5iYmNsYXNzDQo+ID4g
aW5kZXggZTA5MGIxZWY0Yi4uODYyZjNlNTNhMyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNz
ZXMtcmVjaXBlL3Rlc3RpbWFnZS5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS90ZXN0aW1hZ2UuYmJjbGFzcw0KPiA+IEBAIC0yNiw3ICsyNiw3IEBAIFRFU1RJTUFHRV9GQUlM
RURfUUFfQVJUSUZBQ1RTID0gIlwNCj4gPiDCoMKgwqDCoCAke2xvY2Fsc3RhdGVkaXJ9L2xvZyBc
DQo+ID4gwqDCoMKgwqAgJHtsb2NhbHN0YXRlZGlyfS92b2xhdGlsZS9sb2cgXA0KPiA+IMKgwqDC
oMKgICR7c3lzY29uZmRpcn0vdmVyc2lvbiBcDQo+ID4gLcKgwqDCoCAke3N5c2NvbmZkaXJ9L29z
LXJlbGVhc2UiDQo+ID4gK8KgwqDCoCAke25vbmFyY2hfbGliZGlyfS9vcy1yZWxlYXNlIg0KPiA+
DQo+ID4gwqAjIElmIHNvbWUgcHRlc3RzIGFyZSBydW4gYW5kIGZhaWwsIHJldHJpZXZlIGNvcnJl
c3BvbmRpbmcgZGlyZWN0b3JpZXMNCj4gPiDCoFRFU1RJTUFHRV9GQUlMRURfUUFfQVJUSUZBQ1RT
ICs9DQo+ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3B0ZXN0Jywg
JyR7bGliZGlyfS8qL3B0ZXN0JywgJycsIGQpfSINCj4gDQo+IFRoZSBkZWZpbml0aXZlIGxvY2F0
aW9uIGZvciB0aGlzIGlzICR7c3lzY29uZmRpcn0gYXMgZmFyIGFzIEkga25vdyBhbmQNCj4gSSdt
IG5lcnZvdXMgYWJvdXQgcmVwbGFjaW5nIHRoYXQuIFdlIGNvdWxkIGxpc3QgYm90aD8gRm9yIHRo
aXMgZmlsZSwNCj4gcmVzb2x2aW5nIHRoZSBzeW1saW5rIGlzIHRoZSByaWdodCB0aGluZyB0byBk
byBidXQgdGhhdCBtaWdodCBub3QgYmUNCj4gdGhlIGNhc2UgZm9yIGFsbCBmaWxlcyBsaXN0ZWQg
aW4gdGhlIHZhcmlhYmxlIHdoaWNoIGRvZXMgbWFrZSB0aGlzDQo+IHRyaWNraWVyIHRvIHNvbHZl
Li4uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCk9LLCBJJ20gc2VuZGluZyBhIHYy
IHRvIGZldGNoIGJvdGggZmlsZXMuDQpJIGhhdmUgYWxzbyB0ZXN0ZWQgdGhhdCB0aGUzIGNvZGUg
d29ya3Mgd2hlbiBhIHJlcXVlc3RlZCBmaWxlIGRvZXMgbm90IGV4aXN0Lg0KSWYgc29tZW9uZSBj
aGFuZ2VzIHdoZXJlIHRoZSBsaW5rIHBvaW50cyB0bywgdGhpcyB2YXJpYWJsZSB3aWxsIG5lZWQg
dG8gYmUgYWRhcHRlZCBpbiBzdWNoIGxheWVyLCB0b28uDQoNClBldGVyDQo=

