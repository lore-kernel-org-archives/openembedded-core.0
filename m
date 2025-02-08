Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0155EC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:47:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.62])
 by mx.groups.io with SMTP id smtpd.web10.9905.1739026013961878426
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=LUNBIXnP;
 spf=pass (domain: siemens.com, ip: 52.101.66.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMjE0E3/3GzVGdSM5Xmke38gyuV0DtoJ+NQyMedcmJGHBtFASTdeixmpafduzkwaDWSajb3oTprNtai4VN21Lbx5X59dk5vILoDuZDCYZP2LUYv/kxwVCFmt0jDHqnJLp9cMXIMtJQ95Ui3F7YleyVRScjfB9tX1NjaEzBFIMjR3ahxJNVoepM3DHxIfQudh0BNvE4u6wjM5qutc5bDKOvHdX7Avn/lzZh1JcXsUwXLHoA5ieiCkI6+RW5b1o64Vw4BbSdBpdJSUjFlpQZonEIw5nmZALh4TlCQTff7T/ok90roDFD2dSDGOrmSRCOfAtt3O8U6R6Iy7utehqswvUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6R8RSme+CZV7g4u7Hbws2yqAByVvv5DPCVIFuaUmnxI=;
 b=sDodjQ/P5gAR8PjVglwjwwE6KFactD+T0TmVGpBMkgBM/tVlS5EU9WbDT94i6zUw+W7gzvLugmqo18LVuhoc0QLLwREocQk5OmtwadWeB1t01puJdeeEnC50uCUAmM9iwLr71QMl+bmMtET/wMZVfM45B0TRSLXA+gZyGdfDBI0MdtRrY6bNTCBFVhqaozUvYkM9QtGRHQ4g9QqLAA7deSQIB0c/sxx2SdpTMz3D+bkPWOFxcQYOE1msjEd8eUWchDGtXaXJ1RBPp/0dIieYqtf28FLdmwI0rXqEqNuh2atgc+dkD8Si7pgmg0mHph8RYXdKPyiymYQmiecLsrjf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6R8RSme+CZV7g4u7Hbws2yqAByVvv5DPCVIFuaUmnxI=;
 b=LUNBIXnPWDLnYcFbccAvSQPhzNt9PtNSBfrH8jY5lzBA8zZe+qo7oLErO+y9x9TgwWsACf1ipeDsOOYfwZ17+XLlzcNempxehAEit4O8DmEXFWVRoRPyC1tDDyhMx7FxQeUp4m0euco1nusFIhdmkq1ajKOoPym787WL92bhjPvju120SVyeJi63rjsllRz898wOiVRTpXioPGpGixJTeuGCLjBNVoHtCXjPaHxzGwZjanEL2wjRHW0Enmq4XFi+MAKPO287mBCsvaebtTVCUnrL7acIQOXSoBGny2jWwn1BdtH2IpiRa88IcwAVxTNZwxFAD0OA8p+wYQqn7D8HpA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7213.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.8; Sat, 8 Feb
 2025 14:46:50 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8445.005; Sat, 8 Feb 2025
 14:46:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] curl: upgrade 8.11.1 -> 8.12.0
Thread-Topic: [OE-core][PATCH] curl: upgrade 8.11.1 -> 8.12.0
Thread-Index: AQHbeZ6SH3jzlJaU3UepE72Ai+GgkrM9d9YAgAAE6qA=
Date: Sat, 8 Feb 2025 14:46:49 +0000
Message-ID: 
 <AS1PR10MB569700A2E673C96A248A212EFDF02@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250207202537.2137371-1-peter.marko@siemens.com>
 <56d49621808fc61f0dec8c739d6870cb00083f19.camel@linuxfoundation.org>
In-Reply-To: 
 <56d49621808fc61f0dec8c739d6870cb00083f19.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d81d549b-a01a-4690-958e-1090b5329241;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-08T14:44:45Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7213:EE_
x-ms-office365-filtering-correlation-id: 31ec1d5b-2ef1-474e-35d1-08dd484f6b69
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z1VSZHdOMjcyd3B6TWdOKzBFRHErdXMzVHZEU1lIOWI3bS84TThkUzRaOW9B?=
 =?utf-8?B?WTR1VUprWDkzbk9wYzF4aGh3czR0S05GMkRxU3l2ZzJJajZvZEh4ZzFaZG1i?=
 =?utf-8?B?UUdZRWlORlFXeGNqTVlPTmdET2NTSjVZdk1ha1VxQk52SC9YUS9aME42bEFE?=
 =?utf-8?B?SFhuREtLSUg3UDN4Q1dMWWF0bmxlWElmRlg5VDZrZ1l2b0RiNkorZ01DVDF4?=
 =?utf-8?B?dURlc01GK09CdlM4aElEd09IZnZ0TkFXTjBTTnZwOHF4MWlZMlFERnVucWpN?=
 =?utf-8?B?Z2ZEeDRyZmFBZnhiT254QmxBVVBkVnhFU0oxWXlQaExMYTd2NUkxZHY2ZkFQ?=
 =?utf-8?B?QlltMEs4c2FJbXhHenhHRFBiRnlSNzUzR2gxeXA3OURkaWovWlVIRUVaREUx?=
 =?utf-8?B?WkQ0c0Q1MU9VdXQ3ekV3K2pMS1BDekFPM1NBRWdtSDFtYnYwNUg3cTRROHRX?=
 =?utf-8?B?Rm9FR1IwQzdnV2ROVVBXaUF5bHYwNGtYKzIwZEdoK2JhbTlhU3Nud1drUnYr?=
 =?utf-8?B?bDVpREt4cTBwOUVMTTZsdWlSRzFZcCs3U2JLcHE2TG0yVXhkMjNNU08xWVRT?=
 =?utf-8?B?alNMQXZ4MDZsNEJOV3l1UE93OEhZNXhKdzJZSEg1NGJUUE5hZWpTNkZCcDNw?=
 =?utf-8?B?ZG1QVWpuSGk3bFhXK2FYTXhEcm1NNVJoYTVxbGxodVRMTENXVlpOTHZCcmxM?=
 =?utf-8?B?anNFZXFhZ1E0Z1N2SW56THoxaU1TVytKd2UzRDBUVU93RlZmY1E1dVJZZWE2?=
 =?utf-8?B?RVZCSnVONGVSNkxzcE1tVFpjRUVyTjdHQVhjTTlyYXZoSzR3WWw2WVpVUUJx?=
 =?utf-8?B?MXo3aUpQTVU3Y0l4dWlhTTZDb0I2K0JLNjV0Nkk1QUtvZ096cmV2cVZDVkhm?=
 =?utf-8?B?ZE1aR1FCdkw1OTY0eDZaK0JUeFlGRUNZRjZudExxSmZWOG9sQkR6RWJTY0ZD?=
 =?utf-8?B?cENrdFpNVDFBenlkcWoyRGNONkxtbWdQd3dzT3h5NnRGSlA1VUFDRzBUeGd1?=
 =?utf-8?B?ZEg4aHQ5UnZZV2FLcEt6SGpqTmdEOWtIK0V2T2wyTElzQzVWWGR6YTljekNN?=
 =?utf-8?B?eEJ3RXBaUmRZWVV6TlZVS0sxNC9UcEx5K01XVStTQk9wZnUxbStzd1ZDMVEv?=
 =?utf-8?B?RlYwV3ZSYkswYnVpczc3ZkVFT1NmTlg3Ri9aTjRSTWtDeGM5V2dwM0lsYzZx?=
 =?utf-8?B?UWxsYjl6MFdYK2hVWTg5Tm1jMjRiWjFGNE1hamJnVUVQcHIwamdHc0phTXRR?=
 =?utf-8?B?Y01SclVBYlFoRVRsUHozVU9qVUxUMWVPMmRMaDR4SDVYM0tLQTdUeDUyYmhp?=
 =?utf-8?B?SHpLSVV4WHNUd2VvSHlwdVYvaGpJazRvWGU3YVZlRlR5YlpTYlkwYlE5bzJN?=
 =?utf-8?B?dkpnNWZkZnZKWGZIWnE4SU1GSnVRQ25zR2NxazBKd2Q0LzRVckM5ejBvcUxs?=
 =?utf-8?B?M1p0VTVnUXlycXlpQW5CdHpaczRVbUlQQU4yT1JQT2tQMDg4UnZwYi8wcmdS?=
 =?utf-8?B?Q3FJQ3pJOXMxY3NDa0txQ25icGZ1OTQ0eFBSNjBEQ0lSZzcweHIwcHk3cUQr?=
 =?utf-8?B?dlAyT1BXTHo1Q1F5Q0ZOQUhKc3lqWnJTTWxvYUprbGp5TityRHd3MFJUQ2N2?=
 =?utf-8?B?dzRYa1FZTWtjZ0VISEJUcVpFaWpaM3p0c3E0ZTVMUUl2TU8xejJGNGNYRGRj?=
 =?utf-8?B?RHNRQ2VwOTYwSUdOZ3pQcUJST2pxQjFBSE1kbUVqN0E2Wm92RS9GUC9sM0d1?=
 =?utf-8?B?TGZ3NFRRektqNnZ5by8yR1krY1VKUjlhUjNmZjlWVU5HM2hvWDZMaWg1dkNu?=
 =?utf-8?B?eVRYRTIrazRKY2JIaFEzUEhhWU5pYVQ5amRHcExxTXlFVzYvS01kQkhUcGQx?=
 =?utf-8?Q?3q8VtjsZWMPJF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emlLb0VoWGQxUWkvbjRNNThnYXpzeEVCUWhKcXRQN1VmREpQMmR1VGwxaGhU?=
 =?utf-8?B?YlJUV0FnWXVvdzdjRUlNZVBkSVdUZlJlaXdVbVlGbnJxNHdxMDFVSHlxanN4?=
 =?utf-8?B?YS90WnVNeWwySVJXZjRheFVQUzhFY0t6ZUZFd1JYNDMyaDRBdUltbG1QMHUx?=
 =?utf-8?B?VzZGejM1SGtyYUZINjFHMktyRUxGSmhWNVo0dU5HMHdjN1Y2UlVnUTRheXpk?=
 =?utf-8?B?R0IzM1grZUgwN0RlVFNRUFJGL0wycDF0YXdHRCtwdkpVZjRya1BhNFM1MUgx?=
 =?utf-8?B?RXBPMWtwYjZJa2wyTVhKcW9pNEhNRDFCSHo0eFVEYm5kdUVKYnF1ZkMzMFpD?=
 =?utf-8?B?OHZ1bjFhTWFJMTZpTld5RklZM0JWd2I0c3EvRElrSS8yOU5PdTNad3krcUpy?=
 =?utf-8?B?b0xTREhZL2lwVWpLQ2k3VTdzSlhXaUo3VXhNRHMvSDFCdUhQd09la0FpQy9R?=
 =?utf-8?B?SVNLZ1NKVExPVk56NkxCYXZMNjFtR09EVkkzVVNIYkJlU3B5cFlFOVVKdkZx?=
 =?utf-8?B?MGFWL3NCRGJ4aXIzK0lSby9oYVluTHJGMmwyZmpYL0hqd2VPa0hTcG5WTGdC?=
 =?utf-8?B?Mm4wMnB3SGsyczhKemh0N1BQclZHRE1ENFE4TkZDUlMyYUhIU1lteDNyOWtV?=
 =?utf-8?B?TXVMRlJTNDBZZWV3VWk5VXppVkM1d0dxMGkzZ1krWngrTzZTSXVOclUrZzND?=
 =?utf-8?B?REJsL2Q2SzJUS1hHTzBpUzFsaUl5Vm94SVJNOERaUUtKcmdpbTM5cURTR0Va?=
 =?utf-8?B?aFIxS0dreU1aUFhiZm9JMjVqTU8zUUlmQWwzNTdhZnBlSktFVnYyRE9tYlpv?=
 =?utf-8?B?bjJtYjhBdWtVb0NsY3ppUWhUdDQ3K21BbzMwSDJ5eDlJRHdsUloycFM3NXBq?=
 =?utf-8?B?Z1lXVEQ1WlhBZHBDUGU3clJPdkY0ZGZudjYxZmMzczc5bXE4dXNEOFdYZWJh?=
 =?utf-8?B?Vk9LVG1ERzladnB5WkZGakYvTlprMlFZYWFRUmorQXpack9UU3oydWg5YXo2?=
 =?utf-8?B?MUc0a1NIY09RR3hGd2Q5QTRYcG9oT0Izekh4Z1hOZFZ1TnN3WEdaTUYxSkFQ?=
 =?utf-8?B?cTBMWFdobG42UTF6bzZ0U2doSWM3eER2UFZ4ekdnV3V3NVJnZkxyRko0WVJy?=
 =?utf-8?B?SmFGS0oweGdMTGpjd0ZnT2pJWlpjNHBET1ppOXEwRVVTRFUzN054UklaYlhT?=
 =?utf-8?B?QnNyUXJoNm5ZWUt5RTdCUlg4S1ZmZmhkUXZ1V0ZGNkdGTW9QUXM3akNxdVFW?=
 =?utf-8?B?WEhPOXpKOFZ4RGlDV041RFdhUWRiTXVLLzFuaVlJQkFGb2d0SU5zVjE0eW9Q?=
 =?utf-8?B?RHVZTjNUNFVOUjI5aEsvdVpwT2R0a2ZKUG54UkQ2RHhOM3luL1Y0dUJKY3R2?=
 =?utf-8?B?NXQvbDcyNEwvZUhiTk5US0VHWmt3ZUtQdG1OQTJ3dE81a2hGYTRrN1kzZUEz?=
 =?utf-8?B?MUFyaDFJNDhJeDQralY2VWVCL1FrdERjRkdiVFU5VFlyQ1ZrWE04ZTF6bk9r?=
 =?utf-8?B?SStYRUVWLzRBT2s2U3JkNy9VN0ZkcGhpWDZUN0VidDZwUjdoSTZXQzRrUjdy?=
 =?utf-8?B?M3I1WUowMDIxUURFc3RLb0R0NnVvTzBHQTVlaktzUFhLZVEvcEtEVkJxdGhu?=
 =?utf-8?B?YXQyVzEzNndnWk1LcDMzb2hyaWNWWUJqNi9oRzNPdnlPMXlObTdUZWg0ZEE5?=
 =?utf-8?B?YkMvNUJrdDlYYXBQLzRKNFpZY1JsUlE0ejgvV1VHZTFVRnZGME1JQUtVMU9r?=
 =?utf-8?B?VTNyaDBCTmd0cFU1UWJlRDR6aDk2YlIwQXlkNWxYekRsaWNtbmRBRFpaZStR?=
 =?utf-8?B?SmtCdXUwWWJnL0dFN1NhTEYxeC9YYVVEVHl6UTVVNWQwNzZRckNrUlNxRjBm?=
 =?utf-8?B?eWVlaWQzNVhWVmhnRjlTZ0l1bGxocVpTL3ZsUnBTLzJ5UGdacnNaaU9iS3hS?=
 =?utf-8?B?S0Jab21YME5mUi9pd3VVcTNyMEM3Zkx2RWdRTzZMclgybHNlcG5kWTJMUWJ5?=
 =?utf-8?B?S05QL0FYWlprd1pzUEFKaGxWTzdFT25TZk16K0VPRmFwZ0ExYmdyMDNaTnh4?=
 =?utf-8?B?VnRDMlNYY1piQWFHbFNkZ21keTlWSStPQ25yWDY2Z0RvLzlQMWwrN3pMN2RG?=
 =?utf-8?Q?l2S5fIXvGuhkhhUQ1hDKr6qa/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ec1d5b-2ef1-474e-35d1-08dd484f6b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2025 14:46:49.7770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIfFk4/NZld+VzdOYQfLOsTrkvaQ6qN//mv5fQL8be7QnmuQp9s7RMmaHXZyJY4dmvQbb2c7nIZRVGIFKtk49w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211038

T0ssIEknbGwgY2hlY2sgdGhpcy4NCkFnYWluIHNvbWV0aGluZyBuZXcgdG8gbGVhcm4gLSBtaW5n
dy4uLg0KDQpQZXRlcg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50
OiBTYXR1cmRheSwgRmVicnVhcnkgOCwgMjAyNSAxNToyNw0KPiBUbzogTWFya28sIFBldGVyIChG
VCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQ
QVRDSF0gY3VybDogdXBncmFkZSA4LjExLjEgLT4gOC4xMi4wDQo+IA0KPiBPbiBGcmksIDIwMjUt
MDItMDcgYXQgMjE6MjUgKzAxMDAsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5z
LmNvbT4NCj4gPg0KPiA+IFNvbHZlcyBDVkUtMjAyNS0wMTY3LCBDVkUtMjAyNS0wNjY1IGFuZCBD
VkUtMjAyNS0wNzI1Lg0KPiA+DQo+ID4gTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFyIHJl
ZnJlc2hlZA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtv
QHNpZW1lbnMuY29tPg0KPiA+IC0tLQ0KPiA+IMKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC97
Y3VybF84LjExLjEuYmIgPT4gY3VybF84LjEyLjAuYmJ9IHwgNCArKy0tDQo+ID4gwqAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IMKgcmVuYW1lIG1l
dGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwve2N1cmxfOC4xMS4xLmJiID0+IGN1cmxfOC4xMi4wLmJi
fSAoOTclKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwv
Y3VybF84LjExLjEuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IHN1cHBvcnQvY3VybC9jdXJsXzguMTIu
MC5iYg0KPiA+IHNpbWlsYXJpdHkgaW5kZXggOTclDQo+ID4gcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTEuMS5iYg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9jdXJsL2N1cmxfOC4xMi4wLmJiDQo+ID4gaW5kZXggYjRkODBlOTY0My4uMGQ5
NDU3ZGI5MyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxf
OC4xMS4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzguMTIu
MC5iYg0KPiA+IEBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2N1cmwuc2UvIg0K
PiA+IMKgQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vY3VybC9jdXJsL2lzc3VlcyIN
Cj4gPiDCoFNFQ1RJT04gPSAiY29uc29sZS9uZXR3b3JrIg0KPiA+IMKgTElDRU5TRSA9ICJjdXJs
Ig0KPiA+IC1MSUNfRklMRVNfQ0hLU1VNID0NCj4gImZpbGU6Ly9DT1BZSU5HO21kNT1lZWQyZTUw
ODhlMWFjNjE5YzlhMWM3NDdkYTI5MWQ3NSINCj4gPiArTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJm
aWxlOi8vQ09QWUlORzttZDU9NzJmNGU5ODkwZTk5ZTY4ZDc3YjdlNDA3MDNkNzg5YjgiDQo+ID4N
Cj4gPiDCoFNSQ19VUkkgPSAiIFwNCj4gPiDCoMKgwqDCoCBodHRwczovL2N1cmwuc2UvZG93bmxv
YWQvJHtCUH0udGFyLnh6wqBcDQo+ID4gQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICIgXA0K
PiA+IMKgwqDCoMKgIGZpbGU6Ly9kaXNhYmxlLXRlc3RzwqBcDQo+ID4gwqDCoMKgwqAgZmlsZTov
L25vLXRlc3QtdGltZW91dC5wYXRjaMKgXA0KPiA+IMKgIg0KPiA+IC1TUkNfVVJJW3NoYTI1NnN1
bV0gPQ0KPiAiYzdjYTdkYjQ4YjA5MDk3NDNlYWVmMzQyNTBkYTAyYzE5YmM2MWQ0ZjFkY2VkZDY2
MDNmMTA5NDA5NTM2YWI1NiINCj4gPiArU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gIjlhNDYyOGM3
NjRiZTZiMWE5OTA5NTY3YzEzZThlNzcxMDQxNjA5ZGY0M2IyMTU4ZmNhYzRlMDVlYTcwOTdlNWQi
DQo+ID4NCj4gPiDCoCMgQ3VybCBoYXMgdXNlZCBtYW55IG5hbWVzIG92ZXIgdGhlIHllYXJzLi4u
DQo+ID4gwqBDVkVfUFJPRFVDVCA9ICJoYXh4OmN1cmwgaGF4eDpsaWJjdXJsIGN1cmw6Y3VybCBj
dXJsOmxpYmN1cmwgbGliY3VybDpsaWJjdXJsDQo+IGRhbmllbF9zdGVuYmVyZzpjdXJsIg0KPiAN
Cj4gVGhhbmtzIGZvciB0aGUgdXBncmFkZS4gVGhlcmUgZG9lcyBsb29rIHRvIGJlIGEgaG9zdCBz
ZWFyY2ggcGF0aCBpc3N1ZSBvbg0KPiBtaW5ndzoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIu
eW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzcvYnVpbGRzLzEwMDMvc3RlcHMv
MTIvbG9ncw0KPiAvc3RkaW8NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg==

