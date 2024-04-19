Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81974C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 16:41:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.43])
 by mx.groups.io with SMTP id smtpd.web10.26211.1713544885703887204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 09:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=v38orYlL;
 spf=pass (domain: siemens.com, ip: 40.107.14.43, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxcsk1jPp3eDROA8f0Pux7Ow3hKpUbYXzzbXgeBLLRb3GTwSgF1hise1zmmSqag7qG9hbK7F0RwYmJNnS+LcVNu5lINf8zujOnkAiGk+UPFpmDM1QJ7OFuXS2K/D84uZFjhpcBbyuHidgTG3jvCJ6frLzVQrO/hAKkbLNSWMrptm0DFXesYO4SZ5GZjdcSDoIJoVCOa2V3HSDlR56qqkFh6gn7LvCgFMaq7su9x+w2YKODlG/5m7MJWBVuF/tLfaewmglLxzYJx1laSxr4d5Zw8X2tPDkiRfu9butQRKb0P0Nuys9ZfvgaL1FDFjCgQsTtw7923glUOrFV54DbJBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuAbbqTIaOeZrQmV9TaUpDo05XxxtSDjwwPgoGrL6Y0=;
 b=Y3fxhOl5pf4pxdVMuXtrNTn8VMHkg2Iid0vAJ5OiFI4dq0pISxDDgkngMEyctkK+TALZIRxhlG3AGwwE40JhwR48ai7drszqILjkgKw1na9cgCXph3mgR88WkKAUtjpf6HL3s3PkF7l6Ot+T69cbqce/r8NgrUuyRJKHttvep2oaVNM/NPMEFct3kZMZWY2J0itt7VA92P6oTWlZ5vs+w9Lw4opE/md2yzTDTH47sHWt4f8YV5osRo/yty0bVWaIo7Ed6FVVnQMXGDAsqEaa9nSszbhogBHYzlloTFZO5pZXA7QI9VMZhmhJcQzs1bWLWDqU4gAoZqbb8IvXkgdlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuAbbqTIaOeZrQmV9TaUpDo05XxxtSDjwwPgoGrL6Y0=;
 b=v38orYlLvWFsvdl8jJaDgTvg9iGruQt3p2pXoVXDCefkgnPeM/Xein2YoeKWv9jQKgq3IGqZ44cLIhfYMFmt8PsABomPS87yiP1XReabK8f2MlsxMg1RUaUBtDmGD+iEQ6HGXbxPtmc/0j+eSN485S/ix0eVG2ucXncEEveZrgc4a3iXmaY/XAXQp/gPC5Gfd3oSxw1W3X99pt//WAeyOIOtFcS7tFutQXz+8qYyFkXuCAOQ6F5fY/uGmQYZnnU4UMbsA9n84Hkev+LOe07RrA316bTVQPsHNVGqTx3mGUiObYaH7my0SR3GEnAmVjhzdu8WNSZel+wDcDrA9YTN0g==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GVXPR10MB8681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.40; Fri, 19 Apr
 2024 16:41:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.049; Fri, 19 Apr 2024
 16:41:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "soumya.sambu@windriver.com" <soumya.sambu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vanusuri@mvista.com"
	<vanusuri@mvista.com>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] util-linux: Fix CVE-2024-28085
Thread-Index: AQHakl6J6mD/1QPp7E619AtDjLkV2bFvyp/Q
Date: Fri, 19 Apr 2024 16:41:22 +0000
Message-ID: 
 <AS1PR10MB569780C784F31D36500770E6FD0D2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240419133544.3010310-1-soumya.sambu@windriver.com>
In-Reply-To: <20240419133544.3010310-1-soumya.sambu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b9f6f6b5-f233-42bf-acb7-f72d9e52c8bb;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-19T16:36:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GVXPR10MB8681:EE_
x-ms-office365-filtering-correlation-id: 6024f901-b240-4337-81e0-08dc608f8be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YU1FK1VZV3MwLy9zeWQ4K2lRRGNpRCtjMzVrMkFnZTdCOG5zczE2c1V3WHMz?=
 =?utf-8?B?Umsxdm5KS21PT0hoOFpydExYdlhpRU1tNzU2dVpnWGF5eWNRM2FUZEFLeS84?=
 =?utf-8?B?UUtSMlBHalRNQzF4NCs3dU1COE83TkxaeFQzVGVDS2R4cHFPdmptd21XcSt4?=
 =?utf-8?B?YllCU28zZjNFTkg1ZjVTUVRhNTBMMzNyOVZPR2VWa2ZrcVJHUDlIWUt1Mi9i?=
 =?utf-8?B?MnJPa0tpbWxOdkdhQ1hpV3ZhZmtHVldYanhqd0I4QUQ4YmZndUo5VWVZbVIz?=
 =?utf-8?B?Q1BVNVBleUtMYlZuNDhqVk1vNkVVb0FCRUpQVXI0VGlSbVVZVzFzTGVIL0Zt?=
 =?utf-8?B?THgzWjRtS0tRcG8wYXJDcDFrRGtwNUJ6RXJmaU5tOGpPNkRJMElpTjNnaDU2?=
 =?utf-8?B?Qm5IdFJFRHBRbXJoSEVzQlZ1MHBhNjhIY2Z0MEpKRGgrcUE5U2hSQVhKVlFB?=
 =?utf-8?B?bENPVmU5bngraE9ZZ1dFTzVtNVNYM2xaMHNCUUFkMVQ5alFGTDBSU2Q1dFJl?=
 =?utf-8?B?alFDV0FTSjQ5eGl2aUVjaDhzSHEweXFMWmd1ZW1CT3pQU3hGVmJvVWZPTFNn?=
 =?utf-8?B?UHNvc1VSMiszSENBSXBOMHIxVzFjcWhZbE1Tc1lqVy9Oa2VoMW83SlZ1ZmJU?=
 =?utf-8?B?Qzkza2dSUDVXV29GNzBJTGVWNUNpQTFMWFF4V3pPb2t1b0MwTHROYjVsVFhK?=
 =?utf-8?B?VDNyU0NGaGRiRWpwNnh1Z2dPMWpENmNxV0dESnNZSFk4SHU1TlNTUTFrbjlj?=
 =?utf-8?B?NEZBSVFDRGZFMXZPbFI3UjFkODRZK0MycmhrVGdOQTdTYmZWbHZEVUU5TFQ5?=
 =?utf-8?B?TUp6dlJrcUtNb1cxQUQ5TW91MlZpc0RTVTFsSzJMcjkrYlpOT2FmM1I2SXFm?=
 =?utf-8?B?OUNza0t2UStDUFo4UWxRcy9qM2hoL0lRSTJHVHZsWmVwWVhncG1MZTlKSSs1?=
 =?utf-8?B?cHdXT0tWdml0NmprRHoxUWxkL3ZQbnk1OTREVEI4Y2RBVUFKYjRIU09EMmV6?=
 =?utf-8?B?ajJ5S2RRUjZFMUpzdFFWRkoyQ3pTUEpCYityQWJMTnIzdTlkUVVjcU9UN2Fa?=
 =?utf-8?B?U0dmK25BRXNTeitzWFFoQU9mNGVKMWlVQlpnRHk4RkpuWUNqc1NvK2ZoMldm?=
 =?utf-8?B?NHhhUkVHWFMremlVZ1NwdDBtQzRaSzRVZXRsbHJJWklGZUhtaGhwQlpCMCsv?=
 =?utf-8?B?bXNBNVBqdU0rSmpxNTFSdlJ0RExlMVF1cmM3UjkxY2lCRUMyTHFpRWg4ODFD?=
 =?utf-8?B?TFp3RnVvbG4yUlNCQ3RiZXBMTEZHWXNWOVRpNk1ibUxNTEx1dDBXOWJGQjZn?=
 =?utf-8?B?SGg3OFFoOWVvQnluYmdCTFJoRHFXbVl2TUVWQ1loUGZxZnMwREFrdWpvTWx5?=
 =?utf-8?B?cm9UMkZwMTN2d2Evd2pJanRiaVdpQmVubWE0M3RrWmFmMTVpeTh0TTI2OHpi?=
 =?utf-8?B?cVVuL200VHpJWngyV2dlNHgzK0cwTGVFbWMvTGRqNm5TdStkaGJWZ0twakxW?=
 =?utf-8?B?KzJFQU05bEZkbnRzVDVCaklmTWdObDVJZzlEd0tYMU1tRUNrSjdGV3JkTFRG?=
 =?utf-8?B?czdxQnFwc3VtT1l1TkpjRlhxbWtrVnVBQkNBR0c0SjRoSE5qNXYwTHNqMFQy?=
 =?utf-8?B?RUIrL2Y5RTI5SU5pUUIyODE4cUt5UzhXck80aVBwUmZSS1VyN1pRcW9SSk0x?=
 =?utf-8?B?SVk0MkVQcDNKNnVpcWFQMVRMazZiamYxMHdnVFpOeGxXczBWWWxPYzdRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3lwb2RrTjk1OGZxV1VyYlZHbWdIVENQMlpnWkM4L2lOaURKK0lQZzlOZW9R?=
 =?utf-8?B?V0NNMjVDQVMvQUs3WlJOZGVUTWkxV3NFelJIZE5Cd3RJc0xzUjhsaFpRZW1n?=
 =?utf-8?B?UTdObmp2VFJIdVNjYjhOUlJWR0U1Zkh5ektTbTRUZVdlSFBaRGFMYTNzcThS?=
 =?utf-8?B?Y2pOaHAxL05sU2F5N0w4ZENIQk1JUitmQTNCZFczeDZQby9Cd0kwREh5by81?=
 =?utf-8?B?NVZZazNNL2NiSHB3YUZYaTQyRTBVM29sNFczQjNNczVmZ0IrTENmdEsvNFpC?=
 =?utf-8?B?MXQ1SnRIT2x4blVMRkJqdnh4YUw5U2kwK3lwc0RlUXBEU2dON3FnRXYrWkwy?=
 =?utf-8?B?SGNxM00xSlZFTXBQdkk3VCtYWm80TE01VVpINm9xcHhyL05ROFBFeE1HWVU1?=
 =?utf-8?B?TVFQNGtSUjVNdkhBR0UzRXp5a0xDNk84eSttV2xoQUkvWjE0QjRQVVhienRB?=
 =?utf-8?B?bUROem4yTGZpR1pYaWdSQXk0VWZWZG9jRnZMQS9INmRibWlDdmhJUFltaUN2?=
 =?utf-8?B?dEh4T0RBK2xERU0rSWhpM3IvZFp3REczNmNManJLMnhCZ2k0OFRCMlp4VEZD?=
 =?utf-8?B?OHR6ZUJDdGErZHRNZm9wUGRHcUsyUnFtYUN4ZmFTcXhpSWo3dXAzR0dYNHhU?=
 =?utf-8?B?dWZIS0VGWldTdnlNNXJDQ29IOG1zZVpGdTkyS3IxeXRaa1EvbCszUG9hQVZL?=
 =?utf-8?B?MHJySlBMbEJSOTFrL2F3T3Q4L0VFRUtLd0ovYXk4MldGTmt2S0p2UmtjeFNV?=
 =?utf-8?B?QWR4Unp1Qy9uNC83QXFvd1QwRlBlOVJ0UWQxR29xRU8wN1RlK0REOWFWOVdj?=
 =?utf-8?B?UlJVNnlsZE5IZytQcWJhSDNYUjdxd29LYmVUaWZxVUlvZUk3UXNtM1loeldR?=
 =?utf-8?B?NzlhbDIrZWpaaTRQL0hRbDA0d0xqQ3B0N09WbEFtb1Vld3duOVl4clFmMUZF?=
 =?utf-8?B?UFFMbExQb0U5dTJPT2E4WGhtNDB6c2o5azRaN0s3anhUSTVROXVpTzkvaDhq?=
 =?utf-8?B?bjNuWFRJUTlqTWRXaDBMdlA3bXpBeVZDeW5qazg0eXBjQTh3aEVJa3U1WCtz?=
 =?utf-8?B?dHZaMm9tV2JGaHZ4VUdWQ3FicWkrZCtmekhtOWpnbENGSnZyR1RkQ0NWSEFT?=
 =?utf-8?B?L0g0cWswZ1AvTFFYMzRhcTlRRUZNdkxlY0RhY1ZWQnZLeEFxZ1owdEU4V0xr?=
 =?utf-8?B?WjQyOHM2TnVZQWdSWEQ1MEtVUDNzYlBwcUF3eGRYR0dUU1B6REhLOVFxTlA0?=
 =?utf-8?B?ZndTYWJSZkZkM1BDOVZFMFgyUXdOQlRNQnpHK2ZPYlk4ODl3cmNhNkxQUjlu?=
 =?utf-8?B?UVVlUGF3TkxNUVBvcTlzYmR3em9VZTlEOUNlRlFnUkxUMzJhOUdkTVRjWFla?=
 =?utf-8?B?QlRoMTVyTndSU1l4aFVpL0RLeHFIWHp1eUtIaGI3ZW93S1U2K1pFdEwrM0tm?=
 =?utf-8?B?d2dJekRhQk1maWltcVkyVU9NUXRpY2ZiSGdveHloT1hFczlyR1JUYkl6TG83?=
 =?utf-8?B?NGhDMCtNektvVy8zOFlQSjlGTS9DZ2k4SXVJZlFkTWZ5L0VlYmpoRDVPWENV?=
 =?utf-8?B?S0RjWDQzUFJDZDhadklKQzQ4Unc0cmEweTMxdVdkL1ljZFRZczBVeVJYbEtR?=
 =?utf-8?B?cHI5Qmw2QnZyRHZiaVEvem1iYkUyVEJKWWcrZ0RObmFnS0ZLL095TE1VMnln?=
 =?utf-8?B?Q09aRDJzTXZ1c3ZLclNRQlRuWE56eTdhbjRLZHUrQUdncWpXRjFtWDVkdkVo?=
 =?utf-8?B?L1VYM0JTMUtjRTlVRkI1VXRETWdQSVVxMkJNZE9vOWZHMzB0dDcwQU9zZ0RX?=
 =?utf-8?B?djRZZWpxV1AzQkV5b1AzTG5uSGZBc1RxbDBWajQxTFBZdER5amdnd1pob1Fs?=
 =?utf-8?B?Z2hZd0M4Vm16VkNYbS9zTWtheU5oZ1JZY0ZkajQwWkk1K2sweXA4YTFCeThY?=
 =?utf-8?B?TGFremF6M0x6QnRWRVd2SzRGZkd2ZWl0WmxyajcvajBwaUpCQjZlVW9SNDQ5?=
 =?utf-8?B?QWJaUUR3ODdMT3Bja2RNZUx3SW5RM0VnYzVVREJHSG5sNzNwYnJlbmxvNU1M?=
 =?utf-8?B?K3B5Z3BSWTUvMlhqc1FPK1ZoSWZPN3VoSExJNGVkQnFjNVNsYlRNNGh6Y0FI?=
 =?utf-8?Q?XNtAhQDjxbTUgLN8BbiGibboR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6024f901-b240-4337-81e0-08dc608f8be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 16:41:22.3028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JoJW0YEUQH3qr7dN9w/X+Khnni4dDiu/gtZ6M+lqsZgxgvAcjWY2Pi9+pFgLEGR2zvOd+WagPSmlYtfVtuOE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 16:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198557

SWRlbnRpY2FsIHBhdGNoIHdhcyBhbHJlYWR5IHN1Ym1pdHRlZCBhbmQgdGhlbiByZXF1ZXN0ZWQg
dG8gYmUgaWdub3JlZCBiZWNhdXNlIHRoZSBpc3N1ZSBpcyBhcHBhcmVudGx5IGludHJvZHVjZWQg
Ynkgb25lIG9mIHRoZSBhZGRlZCBwYXRjaGVzLg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTc2NzANCg0KU2luY2UgdGhlIHZ1bG5l
cmFiaWxpdHkgcmVwb3J0IGNsYWltcyB0aGF0IG91ciB2ZXJzaW9uIElTIHZ1bG5lcmFibGUsIGl0
IHdvdWxkIGJlIGludGVyZXN0aW5nIHRvIGtub3cgd2hlcmUgdGhlIHRydXRoIGlzLi4uDQpodHRw
czovL2dpdGh1Yi5jb20vc2t5bGVyLWZlcnJhbnRlL0NWRS0yMDI0LTI4MDg1IC0+IFRoZSB2dWxu
ZXJhYmxlIGNvZGUgd2FzIGludHJvZHVjZWQgaW4gY29tbWl0IGNkZDNjYzdmYTQgKDIwMTMpLg0K
DQpQZXRlcg0K

