Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9CCC3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:18:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.80])
 by mx.groups.io with SMTP id smtpd.web10.10651.1747394324191791788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 04:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BIoVEZm9;
 spf=pass (domain: siemens.com, ip: 40.107.104.80, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACWz1MMo7gO5sxFoJLCeDIY0bsso6L5T2nv9uZBS8dMfFC3N0GGJAm6adisq8Bhn30NMl/TfCUcNYZaMhiVJKcTt4+j87x4P6yVrvjvNqzBXx3XA+Cw6RkDCSXuAp4HQqeCvjaIuOdIWVfyFy3zBa6rsboqnbSD9hjJ6pg2sgF8xQOYF7k1bxVOZ+zs1IpH4P3QvoXB6v+9EQFh5dNXv2RgVDBZEM+A94cW6lCB4b93E1AaxiCyNJepSEDr41nxUG54kokFjYgvkURH8g5oKM+SHKNTzViK3eIouJHc5HrSb9PZYqwbUqQ9TctI6JBCpVmLSV0aHqZFfqPJUTODVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVxbTB8Z6L5/wjgQJiAYQxe9CoGKwoHRexLsdWJK2a0=;
 b=cjsE8Hmu8nBcczU/8d3h5kxI8fvicutU7Fg/2E0+Bc/0u+HXg7riCu1wRPo0rlHJydydZavZTAzVXQGo+VC5i2onpJZhX+JyfSV8AYyibJAucDbBB2C/vsr0jBdYkZH5Sohch7DlPSaO/30hcuI61AfPcEn+MmmyCgitiBvvfDAxznj2XOVMr3LBTvWhVKzuSLjPsdwzeqp8Xa93/baRL0cwMxVqT94edmwMBWETRIMFAzkcAv0zEs6uNWC1asJqZJ5ijzI/ase32Ixkz8JFoN8mh/tQIEAzeliupsZ3LMYT92JRSbecF79Hz9GmBps0pSPZqGtR+d0BcZOT5/oiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVxbTB8Z6L5/wjgQJiAYQxe9CoGKwoHRexLsdWJK2a0=;
 b=BIoVEZm94uw90jLVcHIrY7dEI/5Hb7BTeMThoYChdV++OGzeNZco0oCxiuO/mFyuncFP9HsX9gXYEeEZO020PKw4aHSpqexozDB8Tc2AjbnWQGP3vRLuSPwwDigWWoFIDHzCzjPC9tFj1mpBYcYg1oe7IFBkHKoslPaEobFJR8Ri7WDCPfwwhuKzjo7cDrsf4MAoxBUU3vjPT1Y4uc17n9T5Ne9F9xONqBNehwXbNahS37r8bLzTE34Yb0Gbd16ue3I/Fy/m4iUl40COx1ZsHxsWaAcsG2db463DHUf6PLLNRlCTqGQX3i3cvCax90Yn8MvAz3lDx72YEh3JTHwQgw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5869.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:514::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 11:18:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 11:18:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v4] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Topic: [OE-core][PATCH v4] sqlite3: upgrade 3.48.0 -> 3.49.1
Thread-Index: AQHbwoY/02FAr8jZ10GCzD8S6SXtCLPO5zkAgAY7mxA=
Date: Fri, 16 May 2025 11:18:41 +0000
Message-ID: 
 <AS1PR10MB5697540CDFAE09DCB8F094D0FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250511150526.2787050-1-peter.marko@siemens.com>
 <D9U62TMBWDLE.19I9VEKRPRRC1@bootlin.com>
In-Reply-To: <D9U62TMBWDLE.19I9VEKRPRRC1@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d17e6b1b-2668-470a-be33-5f806dc630ab;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-05-16T11:16:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5869:EE_
x-ms-office365-filtering-correlation-id: be52ac8c-8e65-4880-7de1-08dd946b69a9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dnJTSjhKMmhKTW13S093OHJkeUdOYXhYUUhrZ3pWYzlKelBFdnpLNjFFa2RG?=
 =?utf-8?B?NG4vNTN2eDBGbkpSM2tGem9DZzRJSE9JMmFGbTJpdlZaajZ2QnZiWHB5SHk2?=
 =?utf-8?B?ckhnNlFSOHFVYmtia2xMUkNnUkdvQnM1MFJPQng1dzhSRG9IOERHWWVMZnpN?=
 =?utf-8?B?WVdscXpKY2h3MzdQVENSbVZZalZaL09NKytTeGtXY2JvMlJIT0x4MHBYL3Iz?=
 =?utf-8?B?WE1JMzFSU2dJUFpRUHo4YVU4QzIrNDRscWpTdUx4TU1SMlMyYUxTSXQyUVJZ?=
 =?utf-8?B?Umk1eTN3dHl4THBDT29rcm9Mdm1GaUFqbHI1cXdHd0wzSTVkWkt4czNmTnR0?=
 =?utf-8?B?T1lQT2xNWTkxVkNyUm1NTGZZV0JIM2Fmdm1Pc3hITTl5MlBIemE5aGJTQnh5?=
 =?utf-8?B?VHJwVlduQkVxNW4rcXo0VkJtd2JEaS9MTWtIQ2l6UUYzbjNpbGVwSjFMc1d5?=
 =?utf-8?B?VXNGUEd5VWxreHdZemF0T2lEVFVmTVl4ZGN3MW8zMCt5STdXcUIxeDYxbVFu?=
 =?utf-8?B?bUU5amNmK3hQSEFzdDhZUUQzZWNsK1oveVlmSXlsY3pIVktGY1RPN1BlQkxT?=
 =?utf-8?B?RnppMFB5Ulo1Q0NUaUtFMEsxRDRYWm1wV09RQmE5eElVdjJRSTM4a2dEdXBk?=
 =?utf-8?B?OHErRDN1WDJISzl5eFlMQTVoMFVUM0FyMG9FTXU3NFdCU1VoM0ltZkFrUTFV?=
 =?utf-8?B?S3ZlNENoNUQ2bGVWZmlseUlzRk85bUFCeG9HSm5zdXpqbWxiNjVseDNZaE95?=
 =?utf-8?B?K3REVktrTFRIVk9UVXZnalVEUURUU0hQMjBYNHlIL2JrRW83ZEdSNjJJSzYv?=
 =?utf-8?B?dTVObnhZU2IvNE9ySW0xUGdtbTZJUWw3OXhtR2dFMTNySElhUlgxZk82ODg4?=
 =?utf-8?B?WXpBenlkQ1owaHpVR3AzUHE2ZEI0NnBaRlQ3RVJQb3ZnRnNpako3VUNYTnNn?=
 =?utf-8?B?TnVLYVBacU04aGVtdGZJZXd3RC82SDhUdkRhNWRjSVBWSHBzcnEzbjdtS1V6?=
 =?utf-8?B?Sk5hM3VaMEVWV0pDYjNtSW0wZmtOS0tEaTYwaGNwT0dxYVc3dWxleTBwYU53?=
 =?utf-8?B?bTU3U0RIMEpxMnduNlovSE0xUW9GRTN1clFWU09ZWURaeS9VQ0lmMDJoRTRD?=
 =?utf-8?B?dlJPZFUwL1ZiQnp5Zk55UTJrdERsNlQ4cTk0WGlZOUdnTWl5US9xSmpSdmk3?=
 =?utf-8?B?QURjWm9uQUJIOTA0ajVuYzFFZVRSaGpMZHdtN2dqTks2d3Ryb2Rvc1k2S0dO?=
 =?utf-8?B?REJSLzluSGFMQXoyN29QUERjeVI0bFZCRlhDYmVCNm81bHdnU0lGM3kwZldD?=
 =?utf-8?B?L0pwSHYyeUwyTnovNjZmZnh0OXJ5elN2eEwwTjBiZmFQdHh5WEFsc2VwQStB?=
 =?utf-8?B?S0FuZzgvakhETWhhN1g1Slo1V0RQNzh3cUZoU1o1VTMrN0RUWUVOM3d1YW5O?=
 =?utf-8?B?eFA5dnhoY3FweHM5NHJjYWxkWHlDM3g1MEJQNFFIMnhwZWVsQmdSK3FqYVFl?=
 =?utf-8?B?VzdPcjZKbzZSMGZPRnRhYm5neVVncmVycDBZcnpxRWF4Y1U1eVU4dEdGYWlX?=
 =?utf-8?B?ckNrNFpyU1dmcGtRMjZwdGhQQ3hrVW1YQzdKMEJOeFdvUU5FamFOZitzTXYv?=
 =?utf-8?B?dGxJaFJYa3VQc3d1Rm9EZTZOcXdGVDFPQWFKK3dzeUxjVFBydnZUU0s5SkJQ?=
 =?utf-8?B?RjFldVRUeThDdnIrN0JPZk9vaFUvVXBLSVVrL2dGSUVya2I1T3lIZVFJS0JH?=
 =?utf-8?B?a1h6aTBRUEJvcVI2cXlyRTBzaWlTS1UzT3dlV2ZhZm13SlhXd2VNOGd2eXpG?=
 =?utf-8?B?WUNVS3c5YU5Qc09MMHFCeVdoaHBzY05JalF4WTJkeURKRnRncmx0aSs4bFY0?=
 =?utf-8?B?SFllUmV1REZrZURxQ1VPcGsxaWZPNXhxVXJpeFBYRzZXZFNUOXp4eEdSRWl6?=
 =?utf-8?Q?SA7rPb/bTQI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkFzSHM2bFVUWHJuNTBFR0wvWjJNdWVnTXdQZHUzQzc0SUt0WHdmM0l5cDMr?=
 =?utf-8?B?RVR6bU1uaUFsTEgvM0QwSXYzMEhZbElhUGhVVGhtUkRYOUpjK1ZoM01xTFY0?=
 =?utf-8?B?MDdVeGtTcXJOQlUxZjdFRHByaFZnU3FyV0VzMkdnUC9UQ01BWWFtNFIxN1hj?=
 =?utf-8?B?NjluMEYyQk1XUFo0VXovL1pOV2JmcTcySkx0akI5Ly9aOE1DbEN2blJ1OHRU?=
 =?utf-8?B?NTh3ZFo5dmdGSXJXUWZzWkRrU1VPNkwwMDJIVmFYZEJEcjZwTythenlvQVhO?=
 =?utf-8?B?dWNqSVBXVU1JWnBhTzg5YVdIdmVYZ1EzeVVqTmFuS3FsWXFhdHk4emhBOVNN?=
 =?utf-8?B?WkR4bThmTzdjZmNLVHpydktzbXhDdlFpMzhsTmtRTkpEWnJPV3lXUkZtWkxE?=
 =?utf-8?B?Q0ZxalpLVjdrYkVTVGlhWE1IdVdES1A3cFJUNjFYd1laa25ZRnZPZDhhUlJN?=
 =?utf-8?B?eGNtOVlONytkSlh0ZUcxOXp3Mi9FUWRxaDlaQ3g5ZzVHR210Nm9zTFg5MTFI?=
 =?utf-8?B?N0YzeXpJVFhNVnh3d0pvSTRCdk5wNmQrWTZtU1o5L3F6VzE2c3FBNXpIZ2dj?=
 =?utf-8?B?bGlIRXlxRmZNMXFoQ0ptdXJJTUxac0x3TGpXb00welcrQitac3JjYXdPUVNP?=
 =?utf-8?B?NjhUaWNDSDFLV3Q2QmxhSTR5MjBqZHhzQXdmUHpjMlBFQzBvRlRlY2xsbEpQ?=
 =?utf-8?B?S294L2QydUhjQS9HeVhwYjczZ0s1elRWOXBUWDhiV2JxN3FSbmdCYWRZbEtS?=
 =?utf-8?B?WENVNU0zaHVkclpKd0plT01rQkFRTUR5NTh6RGhFNHowRFA5TEQ1Sit4MUx6?=
 =?utf-8?B?Q2JSSUsvekxEc1lpcWFITWlPS0VCbEFBSXdNbHlSWWwzeGo1YjJrY3c0MUkr?=
 =?utf-8?B?Vm9WRmRQZ3RPNkpXSGpEL0czMkhxbmU2YVhqM3BmM0pmRzA5dDJTTkxQYkJm?=
 =?utf-8?B?TDFxM3cwdWZXTHVsaGwvWXRpdUxGVDhLYVNaTEZ4dml3bnZqRjNaREU1TENC?=
 =?utf-8?B?cjBKdVVXd0VTUE5qME5HVElTbVhaS2ZjRFZENkRqWTVBcTRDMmQydHhIcnB6?=
 =?utf-8?B?MDg3Smp1VnlZb3lUUDBWY2xmY2xieHRNYVdGOG9NNXMrN3ZBRlptQTVwNXo4?=
 =?utf-8?B?bi93RWpNOGF6R25ZTWNlcXptc3Fid0RFaUpaM3luaDFTMEl6VzBmWGtpcldX?=
 =?utf-8?B?aVB2YzlXZU9kUzBxUks0djJuWmR6Y0xlUEtSeW4xcWwxYjZNWVRoNHQ5aEM2?=
 =?utf-8?B?amdLSEZlK1N1RGVJUUNnV0JWN3pnZkp3QUZVakpzKzg1VzNWZjVpem5NTEQ1?=
 =?utf-8?B?S0V0U2MvdnFSbEwyN3EyL0lwUU1LZTVwSTQvMUVYVUV0amFkeWxIOUUxVCts?=
 =?utf-8?B?Z2dqYTMzbDlHNjMyMnJGeWNSeGROTVYxZkdGY2xJM0wrYWg3SGxzNHVTY1Jv?=
 =?utf-8?B?Nm1HSVFXM0VlQUZSdnNFYy9XcllqWXZzYnNwdjNqSXlkeFlsa3pRdnFiVmdw?=
 =?utf-8?B?Wm1kS2VUcmxRVEFCaG9FQXVnMFQ4bmZMcE81dGd6TmI3R0xia0tFVERDMXZ6?=
 =?utf-8?B?Q1VQTUZVdUNlQXFqa3Z0UXJhWWVIb3pURm9BaHNLYW1jem1kcDE4N2x6bTZj?=
 =?utf-8?B?cHRMaXdmbnNGYkxjZTQyMTlZdStQWDk0QW5aQjdUTElWV3JUL0Jjdm1kR2RY?=
 =?utf-8?B?eUIrNHVPeTRlaml5NnZyRXZ5NDlEbk9WWCs4SUYvRlZ4eW5EM3JjYzQ4S0Rk?=
 =?utf-8?B?azVjcXFlWXNCcThjb0tBbENwbXVIRkJxK25oaG16Tkk0VGxEUVdtZGpkaGVE?=
 =?utf-8?B?MjRnMXJHSEFZUFNla1lHUHRIS0hQdWh5d2lsd3VrTk1pZGZRQ3ZTZDh4VnZQ?=
 =?utf-8?B?NStNSnB0djBiN0txZnpZUFlmTk9ReEFwc1AyekdpQzdISHU5WTVTRDB1OUZa?=
 =?utf-8?B?TENTRzJNU3RlOGM4Mi9DRmR4YmN4a3UzaTVEREhhZ2NBTDE1VjhoOUhGMmdF?=
 =?utf-8?B?dGYzTlF5enRTSzNEelVuODNVNStKd09iRGhxVUE2aGE2ZDRDeGUwdlplZzZS?=
 =?utf-8?B?ditWVzFMcCtwYzBhdzZmcUlNWlZMQy9iSENOcnZ1c0QyRnhKSkJ0MlBNanpF?=
 =?utf-8?Q?pouajdbmr1SlmZ0XYYBHhFSMa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: be52ac8c-8e65-4880-7de1-08dd946b69a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 11:18:41.1446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihp/cgMXcIvFd2S3ogz3ULe+OL8viOIDaWQjcouTHy22YN8S8NjXSnGHSqDr5h6VtL2QwLPrcNMDb/wGdA4VHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5869
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 11:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216747

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTWF5IDEyLCAyMDI1IDE0OjA1DQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZT
MSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIIHY0XSBzcWxp
dGUzOiB1cGdyYWRlIDMuNDguMCAtPiAzLjQ5LjENCj4gDQo+IE9uIFN1biBNYXkgMTEsIDIwMjUg
YXQgNTowNSBQTSBDRVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4NCj4gPiBIYW5kbGUgQ1ZFLTIwMjUtMzI3NywgQ1ZFLTIwMjUtMjkwODcgYW5kIENWRS0y
MDI1LTI5MDg4Lg0KPiA+DQo+ID4gVGhpcyB1cGRhdGUgaW5jbHVkZXMgbWFqb3IgY2hhbmdlIGlu
IGhvdyBpdCBpcyBidWlsdC4NCj4gPiBJbnN0ZWFkIG9mIGF1dG90b29scywgYXV0b3NldHVwIGlz
IHVzZWQuDQo+ID4NCj4gPiBBdXRvc2V0dXAgKGh0dHBzOi8vbXN0ZXZlYi5naXRodWIuaW8vYXV0
b3NldHVwLykgY2xhaW1zIHRvIGJlDQo+ID4gKiBSZXBsYWNlbWVudCBmb3IgYXV0b2NvbmYgaW4g
bWFueSBzaXR1YXRpb25zDQo+ID4gSG93ZXZlciBpdCBhbHNvIGNsYWltcyBOT1QgdG8NCj4gPiAq
IEludGVuZGVkIHRvIHJlcGxhY2UgYWxsIHBvc3NpYmxlIHVzZXMgb2YgYXV0b2NvbmYNCj4gPiBU
aGlzIG1lYW5zIHRoYXQgc29tZSBhdXRvY29uZiBmZWF0dXJlcyBhcmUgbm90IGF2YWlsYWJsZS4N
Cj4gPg0KPiA+IFJlY2lwZSBjaGFuZ2VzOg0KPiA+ICogc3RvcCBpbmhlcml0aW5nIGF1dG90b29s
cyBhbmQgZGVmaW5lIEIsIGRvX2NvbmZpZ3VyZSBhbmQgZG9faW5zdGFsbA0KPiA+ICogZGVwZW5k
IG9uIHpsaWIgdW5jb25kaXRpb25hbGx5LCBhdXRvY29uZiBjYW5ub3QgYmUgcHJlY29uZmlndXJl
ZCBpbg0KPiA+ICAgc2ltaWxhciB3YXkgYXMgYXV0b3Rvb2xzDQo+ID4gKiB1cGRhdGUgcGFja2Fn
ZWNvbmZpZyBvcHRpb25zIHRvIG1hdGNoIG5ldyBzeW50YXgNCj4gPiAqIGxpYmVkaXQgaXMgZGV0
ZWN0ZWQgd2l0aCBuY3Vyc2VzIGxpbmtpbmcgb3B0aW9ucyAoYXMgc2VlbiBpbg0KPiA+ICAgZG9f
Y29uZmlndXJlIGxvZykNCj4gPiAqIGJhY2twb3J0IHJwYXRocyBmaXgNCj4gPiAqIGRlZmluZSBz
b25hbWUgdG8gYXZvaWQgZmlsZS1yZGVwcyBRQSBlcnJvciBkdWUgdG8gd3JvbmcgbGlicmFyeSBu
YW1lDQo+ID4gKiBhZGQgaGFjayB0byBmb3JjZSBjcm9zcy1jb21waWxhdGlvbiBpbiBuYXRpdmUg
Y2FzZSB0byBsaW5rIGFnYWluc3QNCj4gPiAgIHpsaWIgaW4gc3lzcm9vdCBhbmQgdGh1cyBhdm9p
ZCBjcmFzaGVzIHdoZW4gc3N0YXRlLWNhY2hlIGZyb20gZGlmZmVyZW50DQo+ID4gICBkaXN0cm8g
aXMgdXNlZA0KPiA+ICogY2xlYW4gQiBmb3IgZG9fY29uZmlndXJlIGFzIHRoZSBuZXcgTWFrZWZp
bGVzIGRvIG5vdCBzZWVtIHRvIHByb3Blcmx5DQo+ID4gICByZXRyaWdnZXIgYnVpbGQgaWYgY29u
ZmlndXJhdGlvbiBjaGFuZ2VzDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8
cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+IA0KPiBIaSBQZXRlciwNCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIG5ldyB2ZXJzaW9uLiBIb3dldmVyIEkgYmVsaWV2ZSB3ZSBzdGlsbCBo
YXZlIGFuIGVycm9yLCBpbg0KPiBvZS1zZWxmdGVzdCBhbmQgYnVpbGQgb24gQVJNIGhvc3RzOg0K
PiANCj4gMjAyNS0wNS0xMiAwODowMToxMywxNDkgLSBvZS1zZWxmdGVzdCAtIElORk8gLQ0KPiBi
dWlsZG9wdGlvbnMuQXJjaGl2ZXJUZXN0LnRlc3RfYXJjaF93b3JrX2Rpcl9hbmRfZXhwb3J0X3Nv
dXJjZQ0KPiAoc3VidW5pdC5SZW1vdGVkVGVzdENhc2UpDQo+IDIwMjUtMDUtMTIgMDg6MDE6MTMs
MTUwIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gIC4uLiBGQUlMDQo+IC4uLg0KPiAyMDI1LTA1LTEy
IDA4OjAxOjEzLDE1MCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtDQo+IHRlc3R0b29scy50ZXN0cmVz
dWx0LnJlYWwuX1N0cmluZ0V4Y2VwdGlvbjogVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOg0KPiAgIEZpbGUgIi9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC0N
Cj4gZGViaWFuL2J1aWxkL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvYnVpbGRvcHRpb25z
LnB5IiwgbGluZSAxOTEsIGluDQo+IHRlc3RfYXJjaF93b3JrX2Rpcl9hbmRfZXhwb3J0X3NvdXJj
ZQ0KPiAgICAgc2VsZi5hc3NlcnRFcXVhbChyZXMuc3RhdHVzLCAwLCAiXG5Db3VsZG4ndCBidWls
ZA0KPiB4Y3Vyc29ydHJhbnNwYXJlbnR0aGVtZS5cbmJpdGJha2Ugb3V0cHV0ICVzIiAlIHJlcy5v
dXRwdXQpDQo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy45L3VuaXR0ZXN0L2Nhc2UucHkiLCBs
aW5lIDgzMSwgaW4gYXNzZXJ0RXF1YWwNCj4gICAgIGFzc2VydGlvbl9mdW5jKGZpcnN0LCBzZWNv
bmQsIG1zZz1tc2cpDQo+ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy45L3VuaXR0ZXN0L2Nhc2Uu
cHkiLCBsaW5lIDgyNCwgaW4gX2Jhc2VBc3NlcnRFcXVhbA0KPiAgICAgcmFpc2Ugc2VsZi5mYWls
dXJlRXhjZXB0aW9uKG1zZykNCj4gQXNzZXJ0aW9uRXJyb3I6IDEgIT0gMCA6DQo+IENvdWxkbid0
IGJ1aWxkIHhjdXJzb3J0cmFuc3BhcmVudHRoZW1lLg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRl
ci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVpbGRzLzE1NDENCj4g
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
NDgvYnVpbGRzLzE0ODINCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3Zh
bGt5cmllLyMvYnVpbGRlcnMvNDgvYnVpbGRzLzE0ODINCg0KSnVzdCB3YW50ZWQgdG8gc2F5IEkg
aGF2ZSBub3QgbWlzc2VkIHRoaXMsIGJ1dCBJIGN1cnJlbnRseSBkb24ndCBoYXZlIHRpbWUgdG8g
d29yayBvbiB0aGlzIHVwZGF0ZS4NCklmIHNvbWVvbmUgZWxzZSB3YW50cyB0byBwaWNrIGl0IHVw
LCBwbGVhc2UgZ28gYWhlYWQuDQpPdGhlcndpc2UsIEknbGwgdHJ5IHRvIGZpbmQgc29tZSB0aW1l
IGluIEp1bmUuDQoNClBldGVyDQoNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwg
Qm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBz
Oi8vYm9vdGxpbi5jb20NCg0K

