Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06AED12D51
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 12:15:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13668.1764764140213967134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 04:15:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ik0+k4s3;
 spf=pass (domain: siemens.com, ip: 40.107.130.47, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXloGdn+KYZNUdL8uG0juG3SxHZZrif8UIMx8lTlqsbdaVLQguYeRr1TZn4E/FPwlx3nWi2K1zhBM41pok4K4LumeQq5I3571a2SSNM3tdsje9kffr6vd6JmOGzaZ8OpDixeZd1vMVSs0tJD7It0Bd8f+Li0X8oskBboJqOUqM7d490sdOtTwXKb167G6TixaxvA3urP9Wt82hnqjylxCGkUZJk2zTcNNevdlLZ9imYk4EbKg3/PrNm668cI82hdiMsGSh8iyxDSX5bfC4BISbro/Vfi3aR/4YZi4UfLcCDLuHF2KTajhoS4qWGT2UiNV1LH87KqBTMwt4IMn8f04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZcIOvXXJ6ESgwU3egI580DFmrWyz/wI3PeR1yTB/64=;
 b=c+ewul1E72sCbHrIYGf/CTJnyLspHH03LJRwDg1Cqyjnf2CZsLD3/kky8zqNjbkgwmohVGxBNOjKsQNWMmXmJd148wHelLJSpEt2/ov0/IdizkoEAGIRGVTElHz5BS4peMzyGui1bNFNLMyIHA5wTunGxiULVaX7GcwvDmRpWEtFqNFbjK3bcMQTZQadPaFAWg64m5tD/ABmqHYmwtRAtA10w015UsmF7Wvw5jkpXiHNggsWAXWhpEnBV970joXizPVvRCjd9YWUdo43Ljlg2MU8IW9LZGUuMWQPfRL89J+pDS/iw6pxeN5X+hY9yGwqUHONrhboXpis1WW2zUwJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZcIOvXXJ6ESgwU3egI580DFmrWyz/wI3PeR1yTB/64=;
 b=ik0+k4s31Qxgmnu3ANXl5HxDxyArT91iEaTzu2p3NlsIGXazxOI+HtySIcqc5GR5cXFP6JruziSFw6FdeXSOfYjr0bb7qflPTyWTZVM2MdlXKi8hN5I1SNonX3i38roipeS9R5LkDOecG4s9f/dPQdJQN1bRAbAvfrCDzeUrV11ICVmysXa371fNmZeTSHs5lTN0BgKLURHNgehhUYT/Zmb6NuqT1faP+RHceTos2L06+vs+C9q+QSbLXhTQx/bUmlQFF7B5EwFxZQqxcylMV41qo6ghpZrDXLG1Fs+mmIajIeAG5Gw4J7r/IBxDo9CLnve5TUPMFSQrCHt6jyQuow==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by AM9PR10MB4006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:15:36 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 12:15:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
Thread-Topic: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
Thread-Index: AQHcXy0wYJ+Jw6JWY0ij7T46/KFtdbUP3i6AgAAAWQA=
Date: Wed, 3 Dec 2025 12:15:36 +0000
Message-ID: 
 <PA4PR10MB57079BFF02DCCF78C2819034FDD9A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20251126233410.1243674-1-peter.marko@siemens.com>
 <DEOKMWAUSBXZ.3H75N1QP1X7EH@bootlin.com>
In-Reply-To: <DEOKMWAUSBXZ.3H75N1QP1X7EH@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ec553c6e-341b-4640-ad90-fc3273b5bc7b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-03T12:14:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|AM9PR10MB4006:EE_
x-ms-office365-filtering-correlation-id: 041dbc8b-5423-496a-85a4-08de3265aa66
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZXNLa3NZOEdFak9vUE4xYUoxNzJQMFZoOU5BZXhjNnVSeHlVaU02WnQ4bW13?=
 =?utf-8?B?OGlFVTJXdytWbmdES2F0MW15cTIvVzVOYUJEamxVVWtSRlZxNjhkZVdKdjdB?=
 =?utf-8?B?TXgvYnZXeDNrSndzSmUrSjdyZFYydEJRNVBhN1BYdkZaTHNwdVByY20xT25l?=
 =?utf-8?B?R2cya0IraHA4Wi8zWEs5azdmSkVCM2JjRkk1SEtHRjlmVmlpcS9oN2RFMVRv?=
 =?utf-8?B?OGlEUzZlUm41ZFg5eHpCM2hEVUFPMGNESzdMd3oxNVBpbWpLTnlZQW9XYXJE?=
 =?utf-8?B?NlA0bVZWcFNVdDdwZW9XamN0OVB2OHZRb2lsSzV1R3VwLzR6aUN6QTZVNzRU?=
 =?utf-8?B?T05WZWN3QkRQTzUxTjJQV2JTaVR6anNtWEJPSGJiZWpkdFpuWFdQYlNDeVhq?=
 =?utf-8?B?NytJRk96czNWYzRoQzhjZUZDOHVkZjdXSjF1VnJoK3JCOHpuN3N1U256UG9F?=
 =?utf-8?B?eGxvYm1PVmU5eVR4LzNJbE9US3ZWUzRCU1RNNThUV214SG8xaFgvbjl4M3Jn?=
 =?utf-8?B?V1BQNzg5cWhNVmkzTkUrRFhzYWZhV1lTOVNpSEM2QUdhSzlPaHFFTEM1enpG?=
 =?utf-8?B?cU9NYk5vNFJrYUdwQit5NUFtblVDbHluazlodWVuZjZSZHlLc3JSMEx1YXIw?=
 =?utf-8?B?MkxuYmJmUTRkVnFjQlNjQ25tSUs4eDVoc2pUU3lDUFlDSzg1K0o1aFEzOXZ1?=
 =?utf-8?B?NERDR21TZjlHQXp3cVNacEllbUQrYWRsMXRZNllEb3AvMTVwc1hGZXViN0sw?=
 =?utf-8?B?U0FWUTcwVnFOcFA3eGV0NWhQYndzN2lYeTJqdjB6L1FCY3NyK0hHQ3NPQ1VQ?=
 =?utf-8?B?SDVRaWFySytQU3dNeGhnblJQOHpXcDVaWDg5RmxOL2Vvc0VDd3NtT1dqUGpr?=
 =?utf-8?B?amVqdGhCWmpueHRQTGxzbXZwQlpBWm5NQ1diQjEyS1VaVEQ4WFE2blpuNXR0?=
 =?utf-8?B?QkgzVDR1M1ZDcE1LYWhzdGVkVEFzNlVZMlU0eEJJNXRKN3hVUmlySDlsS2dY?=
 =?utf-8?B?QjV3TGJOSDZiTUZ4LzVheEFIYTBNVHVSUk8xWk5XQWJsL0wzWmpaanBVK1BT?=
 =?utf-8?B?MWdrS1VSdFVvYmxOczBCcHZzVEFwd1hBM09BMGxTbHVhWHdQL0VhbW9URUMr?=
 =?utf-8?B?Rlk4cW5pNHhvbkdrejFqNi9PWXBVT2FiRFdLTW11S0JkS0Y2ZVoweTk0MXc1?=
 =?utf-8?B?SVZBSTM0cG9JSlRjNU4rS3lpNS9WMWhwNkdJOWNBTVN4azJUVEh2eVNJMlJR?=
 =?utf-8?B?YjlQMFBwQnhTc3RmZ0cyLzE4cXFVUlhiVUJBOWVRYnpZL1h4Y0xoV1Urc2h3?=
 =?utf-8?B?QmdtNUg4Z29IZGdzcGZFQ1FZV0o4a0hYRkYza1hjSUxodUpOcy8xbzJncEhN?=
 =?utf-8?B?N0VQTWZWQXNjcDliZHZBU0syRXNEWlQ3VFIvNTRlT29sY09iK3M2TXBmUDA4?=
 =?utf-8?B?VCtRWkNYUkU5VHlOQWo0SUFDU0tXWlVHZUxsVGU2cHR3S3h5UXRldjFYQWFr?=
 =?utf-8?B?WFY0SmlrbCtEMGlkakdHQi9kdWtjby9rM1NGakh4ZFh5MFpDQ05wUlg4dFJp?=
 =?utf-8?B?SnZ2anVUa0x2N2c4dzFKK2Rkb2pHM2Z0MkdmaFRxdG01dDhaUVZnaFMwSWQ5?=
 =?utf-8?B?blFHMGlQckxIeXRwNDNKNm5GenlFdXNJT0hma1ZvYUhNZ1U5VVdYemFaTDhq?=
 =?utf-8?B?REZLakJBVVo1YmJDc01mU1lYRXBEeFVTcEtFMmdXbStSQTdiR3o0YU1mRUl0?=
 =?utf-8?B?bjZiQWIvT0R0VjE3blUyeTUrZHVFRVVwZlF0ajl2ZDdKTTFKckRwNit5ME5I?=
 =?utf-8?B?VlFEaFNsL3Y4NW1WcVVYb1pxNkJaS2JXUDZLZ1Y3eDVzeUs0Wm1SZmxRdEVn?=
 =?utf-8?B?SHdxQnVCSCt5TUIxOXl2aS93eUFER0xVTUdxd005SFM2RWQ2SHNNRzRRb2R0?=
 =?utf-8?B?Zk5XUE1wVjRBRzlZcEgxemgrV2crQUwyNkxKVUhTbUUxckRkV040Q01MdUY1?=
 =?utf-8?B?eFFNSmljWkV3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z1RUYm9QWG9MVFhYMmkra0hPUEdkZlRVd3JGaWo0ekttcVRIdWV6MVNZdjRO?=
 =?utf-8?B?YlZJSEM0bDJwNUpvY25CcXZpTURpcVZCdFJYZlk5K0Z1cHY2VjRxNUoyd0dM?=
 =?utf-8?B?YjNJZHhSREFBa1FSTDJXa0M5Mytxa3drZElxYzNtTU1TYTNLQmZsekFIOXVI?=
 =?utf-8?B?UkpnTGZvaWV2cStTWTZEdDFSRlplL0kyQURVV0dvWUhZbWcwTXRpZEY2NDM2?=
 =?utf-8?B?c1IxckhHZnRHMkZqeEtKSXU0NjJmUGRwNmE4T08zQVgzTGVhR3RpdHN1R2FC?=
 =?utf-8?B?d3dlNjFNUmNmT1ZIeC92cHBaejJhczF0S2NENmN1WVdQTEp0M2dRdUZWeVNK?=
 =?utf-8?B?N2FWWVVGYW9jbkk5enlwajdZOWE4aTVzb1FIcFFXQkRuSkV3eHJnMC9JWDF3?=
 =?utf-8?B?MERyWUdDWTA4MDEyZFA3OUVwNFErTDZuWWhQK0FUaTRNNy9BWGFYTFR4V0Zi?=
 =?utf-8?B?cVI3dWNkeVM4WFNqM2F6bXRrT2VlWnhPSk5sMjhQYVZyNXlQclF5Q0JaRFVa?=
 =?utf-8?B?OGZzajNzSXZPYkdrN0lPOFZnelJKa0ZLVWo5cnJkU1VLaUJhcytSMVAxMXlJ?=
 =?utf-8?B?Z2pCam9MWFcvdnVka285U1NKRmdicTdNM1N6UWhDTWR5Znp0V2xQeFAzY3JD?=
 =?utf-8?B?c3JiMkZNak5XaXh0TkFhOW5hcmtrOVpiNXc1eFZuMWN1UHlRRk42Y3FucTJV?=
 =?utf-8?B?K0pHT3N5SDI4em44dy9RVmF1MlU3dEs3Q2lQT0M2MkJqa2hUKzIvYWs4YUtk?=
 =?utf-8?B?LzFRMHJUVTA4cThVOFVsT0VBbktKNjdBQ2o0YUNNYW1jaVdSSXkxVkZqZVpH?=
 =?utf-8?B?bFJXaUp4eFBzTWtUYU5NTVdhNTFQOTlWYUpINTMrTnlCdkMyRTBrYkE2QWkr?=
 =?utf-8?B?d3c0QmlrRk9CVHlmckdUWUVXZGdDcnZWMzY1bVlvdmhxbHJhVXdXQ3UySExx?=
 =?utf-8?B?UWI5cWx2dVpZdnRySGFhYTNEcDB2MU5WNFBQaGRmVldtTkJXNmNTV1lLS3cx?=
 =?utf-8?B?bGVqWHF6ekZnQUZKVTRKWFBwaWgyOXRJeWIwTzJ0aVlJd1NySkZJMldLQ0Z6?=
 =?utf-8?B?YTBSSVc5Zk4vMzl2Vy9QY0hBTE1yN255SFU4R1d1U0ZnQUtkMmpUMkgwenJX?=
 =?utf-8?B?QlUrKzN0YkxSQXB4M3hua3NxNElkbHhtdUhBMWttWk5nUTlsSkZSYk1rKzVr?=
 =?utf-8?B?c2ZvZHdWNk5La0t0QjRVNmFBbmZPOUFlT0RWZk1ZQUNuK0t5QzAwb29jbHRN?=
 =?utf-8?B?SHRLb09PS0EzbFNUVHA4UEFicXJpZHRlaFpNVlBQQmJGTFl4dE05WFBaZFNW?=
 =?utf-8?B?aDVzSHc0T1dCait5dWJmNHowMk9tc0RuTzg1eUNtZU82aVZaanFUSzJPcTl4?=
 =?utf-8?B?bTFFUGZncHlBbjN5WC9yUHJtRUtEaisyU0c4STdjT01KMitUQ1dyS3lBNDJk?=
 =?utf-8?B?QjVhRld4UVRzREkxNnNIMktyYUIxU0huQkhuM25jU2pYOFd6RE0zV0kreVZF?=
 =?utf-8?B?VldWWVg5U0dralZaK3orQ0dLbzcwUWVlVWF6KzlnS0FoOWZBRzBtZEpwT2Jn?=
 =?utf-8?B?VUhWTWxNZ2FtMWIxcWJMcThQcDlYTWdEa1VBYWNhY09obmRIUEpkYUVJYWpZ?=
 =?utf-8?B?QVQwMXNQWDJiVk9sSUR4aUYwTS9DYzhNNWhNRk80QjZaZzVIdE9mZU84UG1v?=
 =?utf-8?B?OWpXRHJ0ZzhkSU0wczQ4TVNqNXdjMzNrN1Y5dDU4MndPcVBucmp3cnFsRE9r?=
 =?utf-8?B?ZVlkc25lbDBNZWJmVHQ1RCtOWEtGUGNHUFNvbWJ1YmIwTkV6UGpvUmZ4Yy9z?=
 =?utf-8?B?RDV4Q3o1L0JtdThPUFRyNStWaWo4dDVyTEQ0YWdHYS9BRFFoQ01CQ29TT1VL?=
 =?utf-8?B?VVZJZWUyRFJmNjZkMTlMZzY4dTl0SGZNQWozZng5ZERldjkwbi8reGZDSzYy?=
 =?utf-8?B?YzBGeWR4SzkwZlZWSXRuUjJXQVRtVVNsYjFSbEpxUFk2VGhsOVZpQ3ZRZXJR?=
 =?utf-8?B?SWtBZTBjNVF1RHhIbStoYjN0RzJzZzgzOWd5R3pxc0JjWGRBODdoYVNrUzcr?=
 =?utf-8?B?L0JRdWhQR0plTlFPRCswbDJYNlpGbUVZU2J3bm01a3Z0a2VsdDRHZlhHSWV0?=
 =?utf-8?Q?k3Is+oRu0hxdXTuKeQ1PxTtzK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 041dbc8b-5423-496a-85a4-08de3265aa66
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 12:15:36.5006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPv5td6uZ/qQ2ZqSU7yE7Uv5bRFxUZ+IwIBlmkPoV7vsSTTzqnle3vLryOR/tpJwOGdQ666BMAjS1bx8nLpynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 12:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227221

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgRGVjZW1iZXIgMywgMjAyNSAxMzoxNA0KPiBUbzogTWFya28sIFBldGVyIChGVCBEIEVV
IFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0g
Z251dGxzOiB1cGdyYWRlIDMuOC4xMCAtPiAzLjguMTENCj4gDQo+IE9uIFRodSBOb3YgMjcsIDIw
MjUgYXQgMTI6MzQgQU0gQ0VULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5j
b20+DQo+ID4NCj4gPiBSZWxlYXNlIGluZm9ybWF0aW9uOiBbMV0NCj4gPiBJbmNsdWRlcyBmaXgg
Zm9yIENWRS0yMDI1LTk4MjAuDQo+ID4NCj4gPiBSZWZyZXNoIHBhdGNoZXMuDQo+ID4NCj4gPiBb
MV0gaHR0cHM6Ly9saXN0cy5nbnVwZy5vcmcvcGlwZXJtYWlsL2dudXRscy1oZWxwLzIwMjUtTm92
ZW1iZXIvMDA0OTA2Lmh0bWwNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxw
ZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gDQo+IEhpIFBldGVyLA0KPiANCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoLg0KPiANCj4gSXQgbG9va3MgbGlrZSB3ZSBnb3Qgc29tZSBi
dWlsZCBpc3N1ZXMsIGF0IGxlYXN0IHdoZW4gYnVpbGRpbmcgbmF0aXZlOg0KPiANCj4gRVJST1I6
IGdudXRscy1uYXRpdmUtMy44LjExLXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZiAnL3Nydi9w
b2t5YnVpbGQveW9jdG8tDQo+IHdvcmtlci9xZW11eDg2LXRjL2J1aWxkL2J1aWxkLXN0LTI5ODIx
NjUvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2dudXRscy0NCj4gbmF0aXZlLzMuOC4xMS90ZW1wL3J1
bi5kb19jb21waWxlLjE4MzQwOTQnIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAxDQo+IC4uLg0KPiB8
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSAuLi8uLi9zb3VyY2VzL2dudXRscy0zLjguMTEvbGliL2F1
ZGl0Lmg6MjIsDQo+IHwgICAgICAgICAgICAgICAgICBmcm9tIC4uLy4uL3NvdXJjZXMvZ251dGxz
LTMuOC4xMS9saWIvYXVkaXQuYzoyNjoNCj4gfCAuLi8uLi9zb3VyY2VzL2dudXRscy0zLjguMTEv
bGliL2NyYXUvY3JhdS5oOjI1NToyMzogZXJyb3I6IG1pc3NpbmcgYmluYXJ5IG9wZXJhdG9yDQo+
IGJlZm9yZSB0b2tlbiAiKCINCj4gfCAgIDI1NSB8ICAgICBfX2hhc19jX2F0dHJpYnV0ZSAoX19t
YXliZV91bnVzZWRfXykNCj4gfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBeDQo+IA0K
PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVy
cy8yOC9idWlsZHMvMjcyMQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcv
dmFsa3lyaWUvIy9idWlsZGVycy82My9idWlsZHMvMjYzMg0KDQpIaSBNYXR0aGlldSwNCg0Kb25s
eSBEZWJpYW4tMTEgb3IgbW9yZSBob3N0cyBoYWQgdGhpcyBwcm9ibGVtPw0KDQpQZXRlcg0KDQo+
IA0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHdoYXQncyBnb2luZyBvbj8NCj4gDQo+IFRoYW5r
cywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGlu
DQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290
bGluLmNvbQ0KDQo=

