Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D9CCAC59D
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 11:42:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.10])
 by mx.groups.io with SMTP id smtpd.web11.20536.1758109315281808146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 04:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mY7uVHnE;
 spf=pass (domain: siemens.com, ip: 52.101.84.10, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAECkjX9Gr/yqoI6A4F7FnKlAf4oCAObKAgIHktGneBL5E0Y7t2bKpJovSHggR6uC9RKMUgB6Yx+e1b2A8qGLda8/6M8qVnZ77JBhTott6hCpirWOTPhLb38WMbky+2diqT0tNrak9edWxV5bOAfkWrQ0wkBFXHG2y459mV2sDrCePdL7lD0PHIvwHXzocKpD9L/FbxuE1HDHttuvplqoqw1gaftUEkzpH0rHEIYbQg3JR/vEZrcvyr6uFLehsIHysy7O0sTO3UglQ8F0b+zDl90IIzztuwQMVeuWJ+W6xKBKz0AVF317G/6Afjj8BN/qkM9x95/ji2E717ohguxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1xZ3ddWTfowf1UhHSoGkLkycVKquWZcYpI1mP99eKE=;
 b=pW5bea0kHUOEj6c5HMm1bJWs/ciQ1adlbGMMIQu0YQIaLVgl+iAIb6dxdc8BBQXf6fDL8wnAatuq/7wiUNcMRNBw7eN8/KdoTXccNAZ/y/a1d0pvJfy4O4y3kRODSvQ2/+WtHURhaPGSVECY06vdODRMCwSlFTL+GBW7tsYxoeXvRNUvRpHLbEIsjJf6a3pp0JKEg2WY0My95ywi6II1cYdXy0c1hjFYznf4wvpCLheJj9zgYc7EzmxPwzSvc8j1jPcNy9yboo8uvb0vGv3CEBV8G0G54WI8v/lob4mcEHoHjrAtl9ps4DGKBxh1OGTNQ64NX6UELF+lcBA4YSgzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1xZ3ddWTfowf1UhHSoGkLkycVKquWZcYpI1mP99eKE=;
 b=mY7uVHnEmMvTwZC0ZI+044j70mZUuuB6bXBz9ry01oiBkZkiSccIDTaNc3TphJ9VW2jHHI2xg6DEqBWHKnUXV5Ps2dRBHJL9IqzZx7A/oDTGhYbCsFrf02ttn4hJl4VJz2h2HSoDaKGHr0tMh3QWdTFMiO1FgnFMLKfgYEl+A18y8Ep2D/NplvnT/Fh36nKGcYZobeHShd6u9SywUGWm+W63qJs3Ot+vqcNBAO5UUosrAMPW6MeJv+ykKxJp9cv1myLaxi8yhjjyWvEhmqRC5XEGYpFFESouCu9OPPIZVeTuBzBr2EMyQk2QleUJFSwIvzMnfTwW4Q0TpCJZB2CuBA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB9181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 11:41:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 11:41:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcHSH7LwGpFd3oNU2f86SvOYVM2LSKvd4AgAyV51A=
Date: Wed, 17 Sep 2025 11:41:51 +0000
Message-ID: 
 <AS1PR10MB5697FFC77C82557792481E4BFD17A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250903222658.3929743-1-peter.marko@siemens.com>
 <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
In-Reply-To: <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=5e9cdc25-26ff-4c47-b06d-80309551bbe2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-17T11:34:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB9181:EE_
x-ms-office365-filtering-correlation-id: a0b4da2f-2c50-478f-2379-08ddf5df31d0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Nm83ZFN5ZzNwbHh3NEkzdmJaM1JCWjExMFJ1YWNBZEdaTWpFRXh1STBKMzZh?=
 =?utf-8?B?RjcyRE9YUHFjcGxpdXdWQVlCc2NxVSs3ejhnVDVzeUpvdDlOdDhYZXpBc2l1?=
 =?utf-8?B?VDN2Z3g5Vml3T0ZVRGFtTUovTEk4YjlUc04xUFUxNTRlOEs2eUdHZVlRb3hl?=
 =?utf-8?B?MEs1OVVYZXN3MXp1TGRQNnNlcDhPUFNDZE5pOVQrcTFoemxMTlR0Q2xNYkZv?=
 =?utf-8?B?TXZlWFNUWTY2cU5VQThuWFI0WFYwVk5IVkUrWFB3OHRHYnQxUVdYTGduYkZQ?=
 =?utf-8?B?aFpXUXpWajdBU1J5T2hXQ1FpZGxmYXB1bjZyVzlHdXlEUTNSeHZEUlM5VXRQ?=
 =?utf-8?B?NmNsaWszUkRUU1pzUnZnV3hsekhUZkpoOGRzNnNqTUFUSmlVRDR3WmlySmpp?=
 =?utf-8?B?eTB0d2tZNW5uSDZuV0gzNmxzaVNqcFJtOXRjcUdibHY5akFodXJudUp0bmlm?=
 =?utf-8?B?MzdBS3lKblk3eGF1bmdhanJwK1JvVm9JelhVQkVGNW50bE5Pb1BBWGowM1A3?=
 =?utf-8?B?V1p6aHdKRVBTVWJWQWNLbktvdm4zSTQrTlBHQ1k4RGM3c1FiNmNKQjU4V1Yx?=
 =?utf-8?B?eEdCL1lHM1J6QUJaY1ZXOXBPcEx6NHhESEZOVjUveTh5L3VLZit1L3cyQ2Jr?=
 =?utf-8?B?VERxSE8yRXpjeFA5bml2Wm9veFhjOWRlVnRjMEVqbEtQNytxZEtyWmZWTHBW?=
 =?utf-8?B?UTc1d3lkZkFkUTdHVzNFRUd3bUdzeittUDluUHVoemNBOXpnbTFIWE9NMnFh?=
 =?utf-8?B?cGRYQUJxV25RODZnRk9mR1RmdlVEWENqQi94K2N4ZjVPTHVCNURDRjliWmpw?=
 =?utf-8?B?ZUFtQ2l4U2NkNHBSSWkvL01ZOUc2RDA0Q2RhSzRYVmo0anhIbzZqQVpsd1NO?=
 =?utf-8?B?anFxMUFKSzNleDl4VmV5MHgyRGg4bHZod0RpM0xPODUvOGlkRWI4cUQ3WUlu?=
 =?utf-8?B?WDJaNnBuc2ZRZE9MZHEwSStWRE4yR2h4VHR6c1NVYmx5cGpRSDdGb0VraEVu?=
 =?utf-8?B?a3NPbUVUeW1OTWtMSzVrZ0owaVpweld4dHFIdHRONnZickZMbjV1akszdXVz?=
 =?utf-8?B?RXpzSGdvaXhOUWxNd3hxdzJ2Q0Q5c29MMFZKTGNVYmhWVGExNUkxcGwvaEZz?=
 =?utf-8?B?UGNsb3lXck0ycWQ3dDdrenlYVGFzanlvcld3T0pjdDVYSHkxWU0vb2NUZU1E?=
 =?utf-8?B?RDFpc21wcXh0Q1dCeTFPc0ZQeHBiS1Y0MlZ1YkdlUHU0UCt6ZFg0OHBZVWFS?=
 =?utf-8?B?WlhqVjBoeE1iTnF5TFNkS3FLcDRpQ3ZQREk5eEhEcVRXOGRWTGdaOGs5LzJy?=
 =?utf-8?B?a3BCL1RKdENHalJnWGV6UXJjK2xSeEZTVTFMVHBRUjJ1UjREajVpV0RqYXBn?=
 =?utf-8?B?OEtSTWpKaGcyT1ZsbnFKbkZya3lNS1dEc0NyNkpwVzJIYVRDUzcxQUg0R3Az?=
 =?utf-8?B?WGMrNHZSbmNCZkFuZDR2Q2h5SzZUUHZzRnNzaUlWOTU2VGJnOWtKR2x3OE9T?=
 =?utf-8?B?ZUdHV2Q1ODRtdjdxc3JTUnJsYXBFSVlyN3ltRGJUN3RBNlk2MnJKWU45eTJj?=
 =?utf-8?B?TlhTamtaZzNaMFVaTmYxR1lQUlJ2ek9OVEdaajlwTGQyRUVtSzdVRjkxZW5j?=
 =?utf-8?B?YmpZNUh0WGFxSkFKK0lxSDlVbGs4Ui96QXliRVlTZFZ0eWh5aHFYcDJYclhx?=
 =?utf-8?B?cU1CQXQ5NElQSm1FMDE5aVgyT0hpdStHRVo1M3RsMWNHSTFhU1JqOVdsTHR6?=
 =?utf-8?B?N3JyY1Jmazc1aUdUbjlpR1RZdENEb3UyZWFyNnZNZGZqMG5WUVN6U3IrcGFG?=
 =?utf-8?B?MXVqUUtzRWxMcnJuTWx6NjdFOFhKMUUrQmRHeWlKcnhjLzNjN1krL3MxVE01?=
 =?utf-8?B?Z2lXMFNPaFIwYloyZVVxMmQ3RnYwU2Y2bVN2ZHZ4OVBmTE1yUnQ4b2QrNzNx?=
 =?utf-8?B?R1pyQ21EM0JrdjlmYjdrZmlTbGl6MUpYOXpnSzVjNzkrdFJWUjVuREppZDRz?=
 =?utf-8?B?d2ZjQzYrZmZRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MWs4azFFRVVUV1B0MXd2czZFVUlad3JpRHZvbEJkWTcrMEtpUUFDcTFXdlI0?=
 =?utf-8?B?VkxhK1VlOTA5UU5WNUVlZE8zaC9DNmRRcFVSSEkzSitmUEpnU0VOcXgzNHM1?=
 =?utf-8?B?TlpabTJGMnN3SHdpS2FZU2tMSHVpcjdFTzB6VDd2akI1SnJvM1owZTRFRDRO?=
 =?utf-8?B?ejk0aG9lVTA3ZHVHcVcvSEdJcmR3RC9Qdm9MOERzZVhqM244d1ZJWGxOWEVr?=
 =?utf-8?B?bzR6azFGb2VPdkZodGtQcHA3eUM5Y3RsY1VacEMrTWhjSDhxTmYwOVdZNGd3?=
 =?utf-8?B?elFmSXR5b042eFJYdHFqcHQ3bHJBbnR4RWhES2g1QTJQQ0lOOGVmbXFjTlRM?=
 =?utf-8?B?OHRTTkJvTWt6Q1JzU2xjMkVXb2JOU1hoRzg4SFM5S3g0aWhXTnJpdm13ak43?=
 =?utf-8?B?YzI5dGVnampvbTlwVW4xSmpGVlE2RUd2VlJHTHZPT1Zwd3Y2VmxtY05GYXll?=
 =?utf-8?B?b1pUMndhUTN3cWFNSVlUWUNzeGVlTEJkYjJuclM1cXhvaWVMOW51NFNrbkZn?=
 =?utf-8?B?WkhUUVUydTYyLytkZFBBM1Y3TTVYb3RlcGdXeGRnTXdONUxCdW1MczAvVmV5?=
 =?utf-8?B?TlJnQkxJZmVYNThnNlNJK1IvMUlXcVRHSEdveS9RdTh2Qk9hSXNqS0hHS0hD?=
 =?utf-8?B?VDNPTk1INC9Oc0ZwbDVLaWd6SEJuN0hsbjBEc2hDYi82NEV2ZG5jL0U2SHNL?=
 =?utf-8?B?V0cwWUUvbVFZT3pWMmRwellWOS96cUlvRStmalRlQUhmeGdXZTlWWXcvVHRi?=
 =?utf-8?B?UTl1YzJnSnBoa1A5S21PcUVnaHJtUURpdC9iZ0QvT1dLV29hVWFVcmhOUERL?=
 =?utf-8?B?TXlyZWV2eDBNeVlsSE8zZ3ZuL0hGdWZYeEoxNURvTElXeVVXUi9jNmJCQ0NT?=
 =?utf-8?B?U2VjMHBycDlSL0tGNWlZcHo2bGdXN0x3dGdYdURaOTZDQ3FVTXJkbU1lUWdS?=
 =?utf-8?B?WjVRaTl2NGJubU4xUkgyQ1ZhSkROR3FHMW1LTTM3U1M5RWwzL3BoVVpxeFRZ?=
 =?utf-8?B?UlllT3ZCaktjUXV4VFVsVWRvaTNPQ3JwZlFEVkRtREY5dm9KS2xVMHQ4OEVZ?=
 =?utf-8?B?R3k3Q29naS9VUCtrUnVHdFVWQksrMlFRWTlLeWJMR1VoVXV3WkhnQXBjWjFx?=
 =?utf-8?B?clVCUys1Qm5kSFJ0ODdGRFduQ2o2K0h1RUdpV3AxemVTNW5FVnJUMGpJeGFu?=
 =?utf-8?B?MFFKVzd6dHBJUHNxVVlsV29nNTBnR1pZRXc5aDdZeFJTVFlxcGRMb2QxZXRW?=
 =?utf-8?B?UGJoUC9rWU04eGlkZTc3UUJkTWE3QTBLWHZBT0lGc1BoSkovanZrQ2VvZlNW?=
 =?utf-8?B?TnlYckM3NVEyM05UWjlkVjJVQzRZVlZhb0FIRHA2Q290dVI5MEJBWjI4Si9i?=
 =?utf-8?B?SjVnc2lQT0R2dDY4UHhVQ3JJaTdFNjQ2MzJjVXdyVFkzR2h6Y1NuOWlaaVVH?=
 =?utf-8?B?K1lqUWNFQjVPV1Btanp3RmlFbEVGRUlpRENuVWU4cm1uZXdWcm0yRUpLM0NF?=
 =?utf-8?B?Yk5KTVJnZ1hHQVIxeiszaWIzT0FHQzlsSHdFdDI0cmhydFl1anRXdHRHdE9s?=
 =?utf-8?B?WlM4c3NPTGdkOHYrUGlOc3JhYS9JUVptaEZyQUhZczFxLzFGTFRvS0pWSVRx?=
 =?utf-8?B?WEtQLzNReDNGdHRQd21ienVobUpRR3ZkdjU1WTcxVmJKS05pc3dQMHBTaStG?=
 =?utf-8?B?T1JzQjZRaGI5OU8zNGtBbWprRlBmR2JadENYRjJUK2hzek1JdEVnVDNLRkNG?=
 =?utf-8?B?elJpWG9TOE0rM2hDcU1ydTVkallZSDZOcDlBWHpRNUpxbWRrV1pENUxQR0JW?=
 =?utf-8?B?Uzl4L2ZaMkNOTWYzWko0ZGdLcGtlU1kyL0N4SHlqanlUUHh5cWdiQTFxQWRE?=
 =?utf-8?B?Y1NtL2ZBaHVKdldDUFpLVHFoSzFOeXYrMGFpYWRWUFp1Rk5UeFE5YmIyNzJr?=
 =?utf-8?B?RGFtcEpUKzEwdU56UDh3b0h3WHdzSi8xakVyMzVSN0hONDk5Uk52aXBYclBQ?=
 =?utf-8?B?N1FrVmc3SnpNYVhMYis1L3RxY1NsQnVXYi9JVmx3Q3VUZC9lcjNjY0ZpbUtV?=
 =?utf-8?B?YitaL25SVTFzK3F0aVdUSkxIYUdMSjJMNTB5dEdleXlTR0o4WFhLeUQ5cU9B?=
 =?utf-8?Q?Iw0eitiD/HTizHafZrtLQQjg1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b4da2f-2c50-478f-2379-08ddf5df31d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 11:41:51.8393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/e+e/pr5eCU+RZRQlsj2dMcRixavPS2H3JB/MgifxNHeSbc3YAlSBXK5Jm8RHHoH5LltbE+aY60tnrcGup5sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 11:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223595

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9zcyBCdXJ0b24gPFJv
c3MuQnVydG9uQGFybS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciA5LCAyMDI1IDEz
OjIzDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNp
ZW1lbnMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBzcWxpdGUzOiB1cGdyYWRlIDMuNDgu
MCAtPiAzLjUwLjQNCj4gDQo+IE9uIDMgU2VwIDIwMjUsIGF0IDIzOjI2LCBQZXRlciBNYXJrbyB2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gKiBkZXBlbmQgb24gemxpYiB1bmNvbmRp
dGlvbmFsbHksIGF1dG9jb25mIGNhbm5vdCBiZSBwcmVjb25maWd1cmVkIGluDQo+ID4gIHNpbWls
YXIgd2F5IGFzIGF1dG90b29scw0KPiANCj4gV2UgZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIHBhdGNo
IHJldmlldyBjYWxsIHllc3RlcmRheSwgYW5kIHRoZXJl4oCZcyBhcHByZWhlbnNpb24NCj4gYWJv
dXQgaGF2aW5nIHpsaWIgYXMgYW4gaW5kaXJlY3QgZGVwZW5kZW5jeSBvbiBwc2V1ZG86IG1vcmUg
ZWFybHkgYnVpbGQNCj4gZGVwZW5kZW5jaWVzLCBtb3JlIG1vdmluZyBwaWVjZXMuICBXb3VsZCBp
dCBiZSBwb3NzaWJsZSB0byBhZGQgYW4gb3B0aW9uIHRvDQo+IG1ha2UgdGhpcyBjb25maWd1cmFi
bGU/DQoNCkkgY2FuIHRyeSB0byBzZW5kIGEgcGF0Y2ggdXBzdHJlYW0uDQpCdXQgSSdtIG5vdCBz
dXJlIGFib3V0IGlmIGl0IHdpbGwgYmUgYWNjZXB0ZWQuDQpUaGlzIHdhcyBub3Qgc3FsaXRlIGZl
YXR1cmUgYWxzbyBiZWZvcmUsIHdlIHdlIGp1c3QgaGFja2luZyBhdXRvdG9vbHMgdG8gZHJvcCBp
dC4NCg0KPiANCj4gPiAqIGRlZmluZSBzb25hbWUgdG8gYXZvaWQgZmlsZS1yZGVwcyBRQSBlcnJv
ciBkdWUgdG8gd3JvbmcgbGlicmFyeSBuYW1lDQo+IA0KPiBUaGlzIGlzIGEgYnVnIHVwc3RyZWFt
LCByaWdodD8NCg0KSSBkb24ndCB0aGluayBzby4gU3FsaXRlIHVuZGVyIGF1dG9zZXR1cCBoYXMg
Im5vbmUiIHNhIGRlZmF1bHQgc29uYW1lLg0KTm90IHN1cmUgd2h5LCBidXQgdGhpcyBvcHRpb24g
aXMgbWFya2VkIHRvIGV4aXN0ICJmb3IgcGFja2FnZXJzIiwgc28gb3VyIHJlY2lwZS4NCkF0IGxl
YXN0IGl0IHdhcyBpbiB0aGUgZmlyc3QgcmVzcGluICgzLjQ5LngpLCBJIHdpbGwgY2hlY2sgdGhl
IGRlZmF1bHQgaW4gMy41MC54IGJlZm9yZSBzZW5kaW5nIG5leHQgcGF0Y2ggcmVzcGluLg0KDQo+
IA0KPiA+ICogYWRkIGhhY2sgdG8gcmV3cml0ZSBuYXRpdmUgYmluYXJpZXMgYXMgbmF0aXZlIGlu
c3RhbGxhdGlvbiB3aWxsIHN0cmlwDQo+ID4gIHRoZW0gdW5jb25kaXRpb25hbGx5DQo+IA0KPiBU
aGF04oCZcyBkZWZpbml0ZWx5IGEgYnVnIGluIGVpdGhlciB1cHN0cmVhbSBhdXRvc2V0dXAgb3Ig
c3FsaXRlLiAgSGF2ZSB5b3UgbG9va2VkIGF0DQo+IGF1dG9zZXR1cCB0byBrbm93IGlmIGl0cyBh
IGJ1ZyB0aGVyZSwgb3IgaW4gdGhlIHVzZSBvZiBpdCBieSBzcWxpdGU/DQoNCkFuc3dlcmVkIGlu
IHRoZSBvdGhlciBlbWFpbC4NCkknbGwgcmVtb3ZlIHRoaXMgaW4gbmV4dCByZXNwaW4uDQoNCj4g
DQo+IFRoYW5rcywNCj4gUm9zcw0K

