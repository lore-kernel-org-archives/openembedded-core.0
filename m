Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA064C369DC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 21:39:51 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.57])
 by mx.groups.io with SMTP id smtpd.web10.37154.1746394789696990271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 14:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=TwUl/FnF;
 spf=pass (domain: siemens.com, ip: 52.101.67.57, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx7dhomPakPu1k4qopswqp+HqEuIeABcf2PehrjYYMbHseiPBo6HvVD6Zy7rP0oIfzjrJGUCgkp9cWH2/GY3c4Q0qR4uqBfgYtDLDc9iz5HBQzrrGVOrNe3PMB7WlwziN4sgUogka+kKGH8PjIi6id1JPdw0gDBoL5ZVI+ITqrvCsnCTwcs32V817q8Wo3Qq4Zh+FMURo67AaDMZ3FhCku2R2D5LUj93DqM+ygtFHdv/wkLzAuWk5lB2vOauhcNzGXI6AEYK+emncFSpYCJMRPod18XbFCCllTH+G118eqlmufQvC2xe0pMjJxvchQfhYtsB2XWy/feQp7U2ov5Yww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoqxgdLjgiHXiTTbElu8vMrbFPz/aSd9vkNjVavqBmw=;
 b=ANB1sBl4j6bBVt+mUJvJc572ygGrbcoA8O963GCBNUCe39IzlchbvdrQX3f4qJCs9A2fKgUGUj1+R/AWtyoj3Bu5shJRS4N+zAL4j6vOnrYCZY9AW2veOq1qHfilLOt7HZ4gLbZFsSpIuBN+pRHmYczRW9VDNR0Ee8DOJNrSGPAe0B7u5+HtsWrSmPF60sc8/iSFUd3IzpaMION7+qNUfBm63Qtaj04ACDXxLN7fMb6aEVMpwSNmKwFES+V15optUq3nWZKn60YVmFRFAkql3mo1BhYpCNffQSZSNoG7Lae0N/Hp0eYSk3kARhueP4PIVGNZq81geVtUzYQfvdyT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoqxgdLjgiHXiTTbElu8vMrbFPz/aSd9vkNjVavqBmw=;
 b=TwUl/FnFTAF8ROYBUKsH66xiXv7V3LYYLEJyEUzJB6Ktmdk7heYnN9H7dXfyibzahdXchwHsVucNzfZfZkcfAR2JMAZ9+2BTe/zZ+6iyCWc8HWx4HyWoG3VYW9+2se4m6JRxlgSiQUT/+qnl4Y5lEocSKnRA7jwLummRyEsTANIMyZT93mN6Z8UWsYaPEsh86uP8TjkH/Nd+KkBFORIRWaBAwMI/E4Q8Ol+f/SWJB3DDEoZsMU4kxUJcu7wYWGlvNxA6EwuxnlWrXiI77+047cKCXlkECsgkH1bbxcNMooqsNw71dZHh+blqJgaKY8vpEtZSV0tZi1gTQTi8kbSlbw==
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::21)
 by PA2PR10MB8395.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 4 May
 2025 21:39:46 +0000
Received: from VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213]) by VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1bda:8069:a646:6213%5]) with mapi id 15.20.8699.026; Sun, 4 May 2025
 21:39:44 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "marex@denx.de" <marex@denx.de>, "l.anderweit@phytec.de"
	<l.anderweit@phytec.de>, "ross.burton@arm.com" <ross.burton@arm.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"rogerio.borin@toradex.com" <rogerio.borin@toradex.com>,
	"sean.anderson@seco.com" <sean.anderson@seco.com>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, "ejo@pengutronix.de" <ejo@pengutronix.de>
Subject: Re: [PATCH 08/20] kernel-fit-image.bbclass: add a new FIT image
 implementation
Thread-Topic: [PATCH 08/20] kernel-fit-image.bbclass: add a new FIT image
 implementation
Thread-Index: AQHbvPVsLHEd/KW9gkuymcry1y61V7PCuAmAgABIJIA=
Date: Sun, 4 May 2025 21:39:44 +0000
Message-ID: <3f9eebe18f951e6325c1c2acad1dcde0ceb5312f.camel@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
		 <20250504130507.717954-8-adrian.freihofer@siemens.com>
	 <764880c5403b06cc31af471249e7131cc78ee9a3.camel@linuxfoundation.org>
In-Reply-To: 
 <764880c5403b06cc31af471249e7131cc78ee9a3.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3535:EE_|PA2PR10MB8395:EE_
x-ms-office365-filtering-correlation-id: 916994ce-68fa-4c6b-d3df-08dd8b542f79
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TGpFUWdPZVYrSmFnOWU5ZFoxSmlUb3JtYjVWemVYNjZTSDhDQkRyNHVTTVB1?=
 =?utf-8?B?QjFuNEtrVzBsUVpGRkxqRG9TOVYzb05CN0N1UXozRE02TTd5QXM5dGVockVo?=
 =?utf-8?B?amV4QXg2TjAraGtGWVphKzFtQmVQcVpSY0J0a29vbmlZOGpscGwyQXJud2J5?=
 =?utf-8?B?WWRWMEFMYnBld3RsZmxrRWRmajBBYzFOK1ZKQXRxb29RbUs2U3ZMTkVQWEtE?=
 =?utf-8?B?anpXQ203c3h4OVdoNURKbHBrYlBHb3oxNG9KUmd6Y1RUa2hOK3FvUmpISlpE?=
 =?utf-8?B?MTVIOXFiZERDeVRLbjVWUysvczd6UExkcmgvWkpkaDFsM1lYRk10cnRRQUcx?=
 =?utf-8?B?RmU2bzZpTXZnblN1SVd5WEZ4a0tRRklpWHArK3F1ZVdQNXFJZnpDQVdkaE1V?=
 =?utf-8?B?ZjJEQS84Ykc1OXdvcDdFNE9kbXQ5L1JobFltSDlmVFVEU3BnQ0tqRTJvSER4?=
 =?utf-8?B?aEZHWXVJbHFhaUxaN1NFVDVZTzA5RWdaSmg4YmlSeFFkUmtXMytLTEo5anFh?=
 =?utf-8?B?d05mMGEzdzY1dURGSWZQLzdQZzlNdEFpUEdXU0hGUVMzQUprZEhSeEFIUVor?=
 =?utf-8?B?NE1xeERoWG02c3JwQjFxYVd5NCtvbjV1blpVWXhSUmxHcTA0SnhHQXZpV1li?=
 =?utf-8?B?NkJJVVBub3V5cGtMRW15WXhjSUtsY1U3WHQ3Q1I3bWhVS0ZFcCs3ajFhWG1G?=
 =?utf-8?B?K0NwUGlwYkhtcmcwd05VYnZqZzhBNmFOcVQyeHlkeE9tWlBzUDl0Skxob0VW?=
 =?utf-8?B?RzdFSVJFOWY0OVJzZlpzQXFMSGpFbFlvS29UcVBpMFMvZ1JKbDBDNDVDVFBS?=
 =?utf-8?B?OGFwcUdXVFI1TS9IeUJFOS9SSENPcmdacjVjMWczZzZaZ2tkNWlSWDZNQ1Ri?=
 =?utf-8?B?SVVJOTVjdXYvZURQbFZDRmY0TENoVk5mV0V3WUZzUDlWakpRSE82c3l6VFow?=
 =?utf-8?B?UEo1QkVsc0NOMDZJL29uQTJhYkF5dytzbTdMK0N0bkU4U1g3Y0EvWGVicExx?=
 =?utf-8?B?MVdidWwzSnRBNE5UOWpubWJTdDA3YkhUSkFxMWtQUkt6OVRzU2hEb2orSU9v?=
 =?utf-8?B?cWFraUxqTkhlU1lFbTdrSSt1VW9YWE1TVUU0VGVWWFdNSjRqS0RNbnRKMStD?=
 =?utf-8?B?MXh5emRyck51c0xHNE9sS3Naai9nYjdOWlNOZGJabDN2d29xRnNVYVZCZS9v?=
 =?utf-8?B?Y29QUFhHQWxraGk3L3ZWb21pa3I1Rm5neU9KK0Jvb2RWYzMxVjR5VW9GV0tu?=
 =?utf-8?B?Y3l4OGRET0MyNEJIOFF2RzJSVGJLOFFhalZNUWkvWHVXa1FRNEdzYUJ6eGdK?=
 =?utf-8?B?QkZ2dkNRQndOeGpZRjRvZHdLWUxWQktoWDRsSEc2am9rS3hvbzQwNVNoUW5B?=
 =?utf-8?B?T1YxQk5kbkx1dmxRbG1HQTBUYkUxT1ZmL2JVT0NmQU95M1g5TnN3eU1yWm9D?=
 =?utf-8?B?REQvQjkvY1gvRmlXWGtyNVNqWWxFTlEzdHk4bUVCVnN0aS8vTlMvVU4zeldU?=
 =?utf-8?B?WGg5NE1zQkNSMW9HUHdRQkRobnNYUDN4VGRQbWE5eUNpVzhiS2lkZG1IK2hi?=
 =?utf-8?B?elNDbHRoWHdXRzdvZkVoZ2xVaFk3ODh4MVdRc0tQZTVRbFhGcGxISU50T0Fs?=
 =?utf-8?B?TXdjbzNJSTMySEUyeVh1RXVzWGV3dGlSZGFmSVlRcHNCMjFBSDMwZ2tpSWNM?=
 =?utf-8?B?bzdVVno4L3BSYzloQ2dsZzM0L09CbExuTlRMMkRmaW16bGxhbUdpQjd2akdw?=
 =?utf-8?B?bkZySXN3czJlZXdQSDVVcW5xQ3RUWlBlQkZtUGl0a3Z3T0VtTFJzZXRUUTlJ?=
 =?utf-8?B?eWZ5NDYwK0ZlMzczSmlpcG1jRHJVVlFRRS9MYTlZOUFINlVQTklaQXJOeUNj?=
 =?utf-8?B?eDRnNzdVbC91R1JVcVJEWWNtRUtWSFVRT1REdERIRTRaZG1GUEx6MHpvYXFQ?=
 =?utf-8?Q?RjAByycv8Ys=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WnBFSE1pWkFoYTM4bEV4WDhuQUQwYWcxUWdyblBYM2tqOXhLR05vMytMZk1k?=
 =?utf-8?B?MmZ5VCtoa2lVc1BpOHREWHdNYlByQmZZb0krVzBkKy9RS0lYTmNmTGRXc0VW?=
 =?utf-8?B?ZGtWbmlqK2lCK1lBRkxZTzJqWTZJSVYzSHBaOXFOTmZVNUs1d1RSNnl4SUZK?=
 =?utf-8?B?V2VDbTE0SzhuRURhcG81QWlZSGZ5Z2VMMHBKdlFrclJzOVdHSlJSSEI0U2Ns?=
 =?utf-8?B?NGtDYUdlaWp4NWtXVjVMcWF5eTViMlZPSnZubEl6aUpUcitsVFpHYzhaUDBP?=
 =?utf-8?B?OXVRMXlwQWNEa0t0c0dVMlN2SzFOTHF4TElFYnJrSlI1eDZDZlAwZUVEL3pl?=
 =?utf-8?B?K01LTjNxMUVNMjFDNk1OaXQ0RndXMWliL3NZTU5zUThqak9sUGo2K0tyZ2No?=
 =?utf-8?B?Uk9RRWlsSWFlR3Y2Uy93RnVGTGd0VnFMR3Q0SXdKR1VPaGhCNGprR0Y3M2tw?=
 =?utf-8?B?RytTR2JKZGx4WmcyYktnNXNIVFcrUUp4RmlydFhMeTlTNUxKcGRpaVJOTGdp?=
 =?utf-8?B?bnFxMDBDaTBQOTBjNkwwbFdMK0Q3MUIxQi9lRnN5Z3l6andJVWk2SmJ2bkxo?=
 =?utf-8?B?ZjhRanFJQllJMWFlVGtPTlBoc3Y4clFqV0V3KzhlWmVDQy92WXhRcnJQbjlL?=
 =?utf-8?B?NENBWGUrUHZjVlZGNnJMV2pIRmE1Nlh6NnhOaWFsaFhpWW5kdXZmanpveW5U?=
 =?utf-8?B?TUh3ZW1nL0d5SmwrcUIyU0xEYmtKWlQ2ejNyRzFxOEhJQW9VZEdYUmpna1M4?=
 =?utf-8?B?SXNzelhZZTJCSm5iaFRaQ1Q0S3U2cHhjV2ttUGNEUk5xSUVFaktVeUFwTEdw?=
 =?utf-8?B?bmJGU1pEZVdJYXZMSkFpaTlwQndhSE9ucGFUY2FIWkJvY29xbGVBZmlmVk14?=
 =?utf-8?B?V1hkNzAzTTkyTkJmVjlCZlRURXlBNEpGYmNyNlRPT0c0MWZqQ2xtbmNMUkRy?=
 =?utf-8?B?NFZzUHZqejNaYUNxZFJPWlV1S1c3Uzk3YUtQUStxem9vQTNLVUY4YzFZVmVM?=
 =?utf-8?B?bTlia0cxUVk0T01iWCtMV2o4dzMwUEYzUEJ4VUpsM3piVzZKNmlDYVBiN1Ru?=
 =?utf-8?B?dnp1RXFLYXpxdjg4WUkzYXUyZVd5YzhWNkpobk0wQ0Y4SFlObDlFTDV2MUhI?=
 =?utf-8?B?VmhnU3F4eEZnOERCTHFpRUZtMFdqTDEzVkhFWHlpMDJmQkhKeVBjRDBNOEM3?=
 =?utf-8?B?emNicjFQbVVScmRPZFJSdGlQSkxLdmpjUTZHNGxoYmtVTDI1L2dMa2JqbjU4?=
 =?utf-8?B?R2ltTmdlMmpwOWJZME1URHljdHBpUDZoN3g3RzBwZWkwUHFnZUZYWHV4QjNM?=
 =?utf-8?B?RzI3RXE3SUdHcUNEOC9Ma3o4bXNpWnM4OGgydjZqLzNSKzlINmd5bmN5cDht?=
 =?utf-8?B?bGErSFN5TVlrd0RPcEpvcWxKdGphajFGTmtQd1pyT25yWTdDVXhGWjNEd0dO?=
 =?utf-8?B?OTRZcEFDM3YxUXpXZ3FiUmFUWXdVNnJzTmlIdVhIY3B6dlpFVjRpWG82VTdV?=
 =?utf-8?B?c0FubmVYYkdKeVJ6Ymhxc0tzZnhIVGFPVWF1NVJQaTZTb3dHY3I0bXhUbkp5?=
 =?utf-8?B?OTFVdjIwVjViaTliSjdIRGRzeVAycytjaG12WGZwbW0xTlJVbWpLOTlLRGZ6?=
 =?utf-8?B?NXgxZUFBalZGMzFZTXBWUGpJbE4rcmI4N1lqM1pOemVVU1RjUG9oK1ErM0ht?=
 =?utf-8?B?eXVodnFsNVJHWmpmY1JtRTk5blZwMUtVSnVZd1pScUdKd2tRdmFRREt6QW9K?=
 =?utf-8?B?MzRvclpzVGNDaE0rbU10Q1kyUlg4eDhCKzZoNlNuMUFVdFVyTXBGSmxWQ2p6?=
 =?utf-8?B?QlNNbng4S1Q2b0s2KzNTQ284eFBBSy9VZ2l0K1JrTGFXNmcxZXNOVXFtSGNa?=
 =?utf-8?B?ZVRqTktnNkxXcHErRE5GeFJGMTVGU29oaDZhS0RyUW1UZ3oyYTY4dTFZTzJX?=
 =?utf-8?B?OTJ4NllYbmgwOXVyUjF4cThCcHZGc1VaUzdJT2pRdzN2VkorLzZPY0Z6RU9H?=
 =?utf-8?B?VndmRjNJUE10QnF1bHpFaWNTb3Z0d1JWbEtxSjRtZ1cvN2htNHZFbTFMamRv?=
 =?utf-8?B?WmpvZUFBM3gwMTFQckFROWY5TEN4WTZ1ZDg5cCtVdEVwdUd2WEdUSEQyemdu?=
 =?utf-8?B?SHhBUVJMOXNWMDhHQzUwaGRwK0FVVzlSelJ1ajRxdGhSYlhkTWhYQjRBdGQy?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <319ED01FCC549E408317C34D32834FA9@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3535.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 916994ce-68fa-4c6b-d3df-08dd8b542f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 21:39:44.6292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1uBQ6t7fR5v3LIDieqB6sxNeqEXFr6mJQ/LjGWp2zGZefyW5bWD7MKJQrFQLRczkJczmhYV8PRfPUFqFQVh9xfWIBh0WXsZA06S0vDiBLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215974

T24gU3VuLCAyMDI1LTA1LTA0IGF0IDE4OjIxICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gU3VuLCAyMDI1LTA1LTA0IGF0IDE1OjA0ICswMjAwLCBBZHJpYW5GIHdyb3RlOg0KPiA+
IEZyb206IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+
ID4NCj4gPiBUaGlzIG5ldyByZWNpcGUgYW5kIHRoZSBuZXcga2VybmVsLWZpdC1pbWFnZS5iYmNs
YXNzIGFyZSBpbnRlbmRlZA0KPiA+IHRvDQo+ID4gYmVjb21lIHRoZSBzdWNjZXNzb3Igb2YgdGhl
IGtlcm5lbC1maXRpbWFnZS5iYmNsYXNzLg0KPiA+DQo+ID4gVGhpcyByZWNpcGUgaXMgYW4gYWx0
ZXJuYXRpdmUgaW1wbGVtZW50YXRpb24gb2Ygd2hhdCB0aGUNCj4gPiBrZXJuZWwtZml0aW1hZ2Uu
YmJjbGFzcyBwcm92aWRlcy4gSW5zdGVhZCBvZiBpbmplY3RpbmcgdGhlIEZJVA0KPiA+IGltYWdl
DQo+ID4gcmVsYXRlZCBidWlsZCBzdGVwcyBpbnRvIHRoZSBrZXJuZWwgcmVjaXBlLCB0aGUgbmV3
IHJlY2lwZSB0YWtlcw0KPiA+IHRoZQ0KPiA+IGtlcm5lbCBhcnRpZmFjdHMgZnJvbSB0aGUga2Vy
bmVsIHJlY2lwZSBhbmQgY3JlYXRlcyB0aGUgRklUIGltYWdlDQo+ID4gYXMgYQ0KPiA+IGluZGVw
ZW5kZW50IHRhc2suDQo+ID4NCj4gPiBUaGlzIHNvbHZlcyBzb21lIGJhc2ljIHByb2JsZW1zOg0K
PiA+ICogc3N0YXRlIGRvZXMgbm90IHdvcmsgd2VsbCB3aGVuIGEgZml0SW1hZ2UgY29udGFpbnMg
YW4gaW5pdHJhbWZzLg0KPiA+IFRoZQ0KPiA+ICAga2VybmVsIGlzIHJlYnVpbHQgZnJvbSBzY3Jh
dGNoIGlmIHRoZSBidWlsZCBydW5zIGZyb20gYW4gZW1wdHkNCj4gPiBUTVBESVIuDQo+ID4gKiBB
IGZpdEltYWdlIGtlcm5lbCBpcyBub3QgYXZhaWxhYmxlIGFzIGEgcGFja2FnZSwgYnV0IGFsbCBv
dGhlcg0KPiA+IGtlcm5lbA0KPiA+ICAgaW1hZ2UgdHlwZXMgYXJlLg0KPiA+ICogVGhlIHRhc2sg
ZGVwZW5kZW5jaWVzIGluIHRoZSBrZXJuZWwgYXJlIHZlcnkgY29tcGxleCBhbmQNCj4gPiBkaWZm
aWN1bHQgdG8NCj4gPiAgIGRlYnVnIGlmIHNvbWV0aGluZyBnb2VzIHdyb25nLiBBcyBhIHNlcGFy
YXRlLCBkb3duc3RyZWFtIHJlY2lwZSwNCj4gPiB0aGlzDQo+ID4gICBpcyBub3cgbXVjaCBlYXNp
ZXIuDQo+ID4NCj4gPiBUaGUgbG9uZyBzdG9ycnkgYWJvdXQgdGhpcyBpc3N1ZSBpcyBoZXJlOg0K
PiA+IFtZT0NUTyAjMTI5MTJdDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gRnJlaWhv
ZmVyIDxhZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tPg0KPg0KPiBTaW5jZSB0aGUgYXV0b2J1
aWxkZXIgaXMgcXVpZXQsIEkgcHV0IHRoaXMgaW4gZm9yIHRlc3RpbmcuIFR3bw0KPiBmYWlsdXJl
cw0KPiBzbyBmYXIsIGJvdGggZHVlIHRvIHdvcmxkIGJ1aWxkczoNCj4NClRoYW5rIHlvdSENCj4g
aHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
NTkvYnVpbGRzLzE1MjENCj4NCj4gSSBzdXNwZWN0IHRoaXMgc2hvdWxkIGhhdmUgYW4gRVhDTFVE
RV9GUk9NX1dPUkxEIHNvIGl0IGRvZXNuJ3QgZ2V0DQo+IHB1bGxlZCBpbiB1bmxlc3MgY29uZmln
dXJlZD8NCg0KYml0YmFrZSBsaW51eC15b2N0by1maXRpbWFnZQ0Kd29ya3Mgd2l0aCB0aGUgZGVm
YXVsdCBidWlsZCBjb25maWd1cmF0aW9uLiBTbyBteSBndWVzcyBpcyB0aGF0IGFsc28NCmJpdGJh
a2Ugd29ybGQgc2hvdWxkIHdvcmsuDQoNClRoZSBmYWlsaW5nIGJ1aWxkIGNvbmZpZ3VyYXRpb24g
c2VlbXMgdG8gdXNlIHRoaXMgbXVsdGljb25maWcgZnJhZ21lbnQ6DQpodHRwczovL3dlYi5naXQu
eW9jdG9wcm9qZWN0Lm9yZy9wb2t5L3RyZWUvbWV0YS9jb25mL2ZyYWdtZW50cy95b2N0by1hdXRv
YnVpbGRlci9tdWx0aWxpYi14ODYtbGliMzIuY29uZg0Kd2hpY2ggYnJpbmdzIHVzIHRvDQogIGJp
dGJha2UgbGliMzItbGludXgteW9jdG8tZml0aW1hZ2UNCndoaWNoIGxvb2tzIGxpa2Ugc29tZXRo
aW5nIHdoaWNoIGNhbm5vdCB3b3JrIHRvIG1lLg0KDQpJdCBpcyB1bmNsZWFyIHdoYXQgdGhlIGNv
cnJlY3QgZXhjbHVzaW9uIHNob3VsZCBiZS4gSWRlYWxseSwNCmxpbnV4LXlvY3RvLWZpdGltYWdl
IHNob3VsZCBidWlsZCB3aXRoIHRoZSBkZWZhdWx0IGNvbmZpZ3VyYXRpb24gYnV0DQpub3Qgd2hl
biB1c2luZyBgbXVsdGlsaWIteDg2LWxpYjMyLmNvbmZgLg0KDQpBZHJpYW4NCg0KDQo+DQo+IENo
ZWVycywNCj4NCj4gUmljaGFyZA0KDQo=

