Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E4BCCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:00:29 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.37])
 by mx.groups.io with SMTP id smtpd.web11.1020.1759953624720295680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=SthVAkMy;
 spf=pass (domain: axis.com, ip: 40.107.162.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsSXNOVxyfLU+KTKOsEZze0DoyBNn/1E7tUva1jmc/pJgV1Xsfjv0VCfAN6iqy7vRtdgR6wyNyfwAoVhZEKwMJE3JOYnedX/5wuRpXgxf4Al/MSDMoaUAt30tuUx3cwwatv/AwlKCQrcdM/Aw++837yuO1xDq/9oK++WmiUbpbUICFwNeFjMIA+pwzLZFS72P8AK4aeBeDP81xFxBbllKK59CTzSm1koyt2bUheAcevJMsjQAEvQgH8+423qvSg0cH1Gxjgn8fH4H/y93qC4Tj2VQRNeajQp395sF3tX4rM+9ReYOGRzrKetESOF/H6KzYzSbMAZQmJYBpXB0Jf26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxMDI/MiT88gx3GB785KjCJXQIrjR0uEy8KiWsYog0c=;
 b=cRHfPDm1SmDPd8nbHoM2xPWU7SkJAovS8jLX/HAfpUWBT8sWywlc3a8Cj0ZiZchc4MHbHry4tfVZolYEggg8nZrZLDHoJ/cdnx4snT25KSuiQFkPz60N6ZlG1HRWGtLuNQ2N/VnO2AKpLwd8hVZdmxFV1Y+H3xtd8Dtm60Vv3r0VXEmPGRKM5oEH0PTplbJz/uyHBNb2pMwxE3ZaBNyIY0KD9KBQM8XdHTJepcERiZSzdD+GZ1f/u0hY4QdY4S4ONuhSCn0yNo3KElCwhTweHlifbgGs89dP6uKYqgTFQbOd+9uYNmBzshAh8vFDKnw5MPFtW8OO+Fod+Ugs0hbchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxMDI/MiT88gx3GB785KjCJXQIrjR0uEy8KiWsYog0c=;
 b=SthVAkMyn74WHovjqLrYIdziymlp7XdaE2wbieIRZtmSU09qlYxzaG8UTfUD+MjfdnZJaltoJ7WFj2UreZoDUAvawTMI9K9bARPHR0CXahGxkTJVIWCRbJb9G5rRfzgExiRhIfMzql7WjpZiBnEj0z4+VpjZKhM3wnXhjbn1ytA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PRAPR02MB7908.eurprd02.prod.outlook.com (2603:10a6:102:29b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 20:00:21 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 20:00:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>
CC: Adam X Nilsson <Adam.X.Nilsson@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Topic: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
Thread-Index: AQHcNv1FqXvGXlErD0+y7yUutUA0prS1ojSAgADbhoCAABIpUIAAEZQAgAICqoA=
Date: Wed, 8 Oct 2025 20:00:20 +0000
Message-ID: 
 <DB5PR02MB10213D6778251D61C4E68F1E0EFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
	 <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
	 <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
	 <BF7A5C48-4C48-40E4-B846-486473FE2D01@arm.com>
	 <DB5PR02MB102131C9AEB85566B1683DBCBEFE0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <77b7d645b235d4d145afdbea92667357749a7f36.camel@linuxfoundation.org>
In-Reply-To: 
 <77b7d645b235d4d145afdbea92667357749a7f36.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PRAPR02MB7908:EE_
x-ms-office365-filtering-correlation-id: 59caf939-7c16-4fca-5c6d-08de06a54fa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dHZYV0U2WTBlZHIyWXlmcURnNFNKNm9WWjg1YTFBOExyTzBtU1RpT3RxbkFV?=
 =?utf-8?B?TjV6dHFlenVoczY3SDZ1U2xIdVFlOXF2T0RiNGdqaXB6cCtTU28wampVK1cx?=
 =?utf-8?B?R1NTSjY4djZyUlZ3eVBNVkt0dy9pMTJ1S2tmZ2kwOCtWZGppb0ZxVW1zUk5x?=
 =?utf-8?B?U1RZL3hpdnk1Qjlnd3VoUEZjdzBDSWpVRG9jZ2VPdXpmQWhyY1JqeGo0Mlc1?=
 =?utf-8?B?UVZNVzMzazhwS2V1eS90N2ZJbGNIYzhsVzgyMlROWXpCUHV3VlRWRzlWK0ZZ?=
 =?utf-8?B?ZFpFS2VMVDJISFBibFg2SUE3K0tIRFZuR2hjSlBaM0JYU1BVNkh3MjcyM241?=
 =?utf-8?B?YitqVkhRWFBhSDdNekd4SDFycVZ6NlVEYkxXdGhLYUdHc1hPNlF3N08zN0pm?=
 =?utf-8?B?cGM1NjZaaGFGellmZjh6Ym4vNUZ2YXRmeHpwakZDQ0lEZzZHOWJLY1ZmUmdx?=
 =?utf-8?B?WVdXMWJ5OXJDZitHMDl4ZVdTSG02RW4zSWZmKzRzVUUxbFVqMVNEc2cwTHhj?=
 =?utf-8?B?SzUwTzBCNmJaNytSZ0x3dmJCQm1LRThCbmc4UCtpSmw2UzREajQ0Y2RUbWEz?=
 =?utf-8?B?NERZTjZkaWtvUjRoZXZIZUE2YmFlcUNkRkVRUFMwcCt5alJwV1cxNnRHZ3Jj?=
 =?utf-8?B?dlA5alM5MTlyd2ZhT1ZQSVhjWmN5YkJ6Mk5UaUZIcU5mMFFVTVVYMTJ0TjR2?=
 =?utf-8?B?RVBsV2NnTU9rcFY1RUhYY01hT20zb3VkM214RCtGWTR5NDVwTXo1bE1nUzN3?=
 =?utf-8?B?eThqWjdkcHhCY0JMVHZ6ZVI1UklPYmpSUEttYzk5dHcwTXY0WU14cUdEWkp6?=
 =?utf-8?B?eXdHZ1FJd1dnWjhFajhVZ21DQTA5cFZsNXZSQ21GQUdxMmFLbGJibVZHYjNT?=
 =?utf-8?B?eXlLbGZNQWU5TnVQQ3BTdGMwSmVnemVrcWpheEhSWTBQWkd2UWVhQTI0V0cv?=
 =?utf-8?B?aUFUZ1laZUtITXN4SHhMaGVOUEwwaW9YRzVYMGNZdWhLRHZmaEFmY0ovak5N?=
 =?utf-8?B?Q0tkalZDcjV6S1I3RFhlT3MrL0xQMm5vcE1BVnFqWFh4M0dzdE53WHZHVEtp?=
 =?utf-8?B?Q0dRenlXYjVsenFCbHYvb3Z1aUNLbGhYSHgrQUI3UlVmUUk1T0c0Q1VMUW5t?=
 =?utf-8?B?cmFZTWVtSm1QdWJtRWIyWndOeXc0WkNZR3FPOGdjUEpiS0NUUWdoWk92KzlS?=
 =?utf-8?B?ckNzRVl6SllqUlM4TU1jTDk4cXVTZXozU3Z4NC95OTZsY095TWNvYkV6RjdO?=
 =?utf-8?B?UTZQTS91UVZQeUFVYkppTCtxVVVCOTI0MTBxR0F4dVNJcjlNaDRrZHV4Z202?=
 =?utf-8?B?NmwxYTV2VEtscWpyNmZmRHludncxbXJvRllwdml5UjdoT25CL0JBRlp4MUMr?=
 =?utf-8?B?ejEvTHdhaWdSc3hDRXN6a3V4TTZpdC92RVlNL0s2WjZPUVNOTzRTbnR5OFpJ?=
 =?utf-8?B?ekhkdGx5OUliZmRqODJrT3REbkc1MkFsK0p2SFZsdG5xQ3ZLYWtuWEZTNlJh?=
 =?utf-8?B?K2FiaGIyWlNremlYaVZxTXRCNVFwczlmYzlYOFlSQ2VPaGFNSHBsVzVCcFJK?=
 =?utf-8?B?ZEF5WDZLQUIxY1pFMytWMkN2VktDWnFrZ3NFVjdsWDF5MUFyWmNjYmM5NHYv?=
 =?utf-8?B?ellXNnFxaG51RjdONHNidnhMUTBtTTFiL2FpdG1RaU1uZkFXMDhOZmI4RGNs?=
 =?utf-8?B?YVpJRktsbmtHTlIxSW1FS3lUSU53Y0RhbHE3UnRyL2xYRkJCWHpraG1raXVp?=
 =?utf-8?B?RVFmRzd0eGh3bEVKOWxqQ2I3YkhFS1JoU3RkU294T0w0U21RMHkzUXczV25i?=
 =?utf-8?B?R0lEWmxHazVhWm5zSjdQZ2hxTXVISER1RWVVV2FqS0ExSk10L1BmMjc0WkJl?=
 =?utf-8?B?SHdkeTNvaVl0K3N1S3U5aUJOZ2YwWXljZ1hGaTFaVGJUek5mVGNYY1RORGtw?=
 =?utf-8?B?VlFhMllXblVsQ3h6QlZCSkNvNTdZMllQdVNkMmVpREVFdDRTQmpodlN1bWRD?=
 =?utf-8?B?REkreWdzZVZmMTRXTFBiV3JvQjg0SmxjbGFtM2RhcWdUd0dLNWZSSTJmenVz?=
 =?utf-8?Q?/yXpGJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OEFaZmR2YVMrYnhNQ0tObXNyTmhyZGlvRXQ4dHg1aHJrcHFrR0Faek5lQ05j?=
 =?utf-8?B?RGk0Y0Jvd2kwZTlsQmtnNEhvaGFLT0FYcFF2bFBaQkxoTEUzcjlUNFJKekd5?=
 =?utf-8?B?V056Y2VUeHZWaitPT2pXZTZLT214ZFBqbWpSNWhhZDVHang3NUVwd2ZmVTBR?=
 =?utf-8?B?UHJLSDBndjZRMldJVmZ5VnN3ajlPZmkwcCs0YnFJSzh6Zi9xOFFnb0h4NGlI?=
 =?utf-8?B?bzEySWdTbGtBODIwVnIySy9hQzFLK0JzNjltcWdzUUgvRVRIYURWcGl1THp1?=
 =?utf-8?B?YW4xK0NjTDZpSU5pZnMvWWt2SEU2clQrRVo4cmZaQ0hSZ2JVajNLYmFsZ2VJ?=
 =?utf-8?B?WDlDS0syLzVpalFjSkxQNXBZWThLNDhheTY3bWp0NXBrMHdXRVNDWE1hUlNv?=
 =?utf-8?B?cllRcG10OFhBOERGbzFCYmQ4bWhValR6a05YRHVzb3V6NWpvdHBmcnNURStD?=
 =?utf-8?B?K2RETi8rUi85bDNkNWpCUXk1YnBIWEc0elRqTVhORHZMb2hhekwzWmN0dnhD?=
 =?utf-8?B?MTRqem5vUmV4UFlmdXFqS1NSRzEyc1N1aUVHQ295MytIUTArMkFEeDYzNUFw?=
 =?utf-8?B?cm1sY0E2OVVqV3ZXZGxxY1RQOHI4T1VmUEErbFprc1ZqMlNlYzhUU0RNUDRq?=
 =?utf-8?B?aVpiTmlYKytmWUdOUGh5WG8wdGx6OWx2dzhWdU1Wb3l1ajd0OFRUYkdOQ080?=
 =?utf-8?B?OEo5TXpBWkdScVJ5bDZQRGtVUm1mZE9aZ0w4dHM0TWIzeVBwajZFbXRkWlZW?=
 =?utf-8?B?UEJnZ0dWd2Y1dk5WN211OHFJSnFvaDA1QkVoTVBKdzliTURVUmhHQktZRXBr?=
 =?utf-8?B?M3kwYlJoUXJxUmU1R0swTllwTHU3RDhrTVVoKzdJaysyRTlraHQ5NysySEdy?=
 =?utf-8?B?RklOVXBPQ2ltc0tLNWZaaWpEVEZNZDZYVHJPU3Noazd4aFE4TTBWNVZDTDdJ?=
 =?utf-8?B?QnFwVCtRa1JzckplQ2FaT1JTUnluTXA0cTdpZ0kyYk5kRS94NG1jdmw1VDFr?=
 =?utf-8?B?NUxVaFNBZ1JDeCt5bm5lUjZqM1lkYUFkRGFZOHZISjFNV0Zlbk9NKzRZWkEr?=
 =?utf-8?B?aGFLclJXVks2UkVaU1gzSWlWTU1BWkxHcUszSmhNbEZlUXJaVFMwT1h6TzV0?=
 =?utf-8?B?dkNyaGJnOU9sRUpubFV1TWRHR3FXOHVPN0E5VXlBbXBSUnBJZTVhNWg3YTl1?=
 =?utf-8?B?VUd6QUhCZFJudUNDMExGSXRnL1JkT2VYRHdReXFjOEovR3ZURHRGbE5CTFpu?=
 =?utf-8?B?bUx5dFlNRTlNc0pBT2FEenZLbWF1R3QwOFJueDZOSGNReHgxSFh1MklRaHFn?=
 =?utf-8?B?Qm9pM0R5L29TUTZBTE1RYXNoQlcybWgzNnVZb05XNm9CdkFTR1FEdkxMMmtp?=
 =?utf-8?B?NEFYMmxyK0dTdDNGMSt0UnBsckh1K0tmRE1jajV5cVRVZ2NkRERDekdJcUVI?=
 =?utf-8?B?NXFVeXdBRS9jQncxT3dKTEhvWm9kZ2hBR291R1VnOWt0U3VuZEsyK0xBRlha?=
 =?utf-8?B?WjJ0c1UzdlhxdUloTCtIU3liakpGQlN3T05RQS9WUFBLZk1wSzJ3RkduQlhv?=
 =?utf-8?B?SHJsVFV1YmlUdmQ0aWpLYjA2aUM3bmdaaDVSK04ybTJCN3JJRXdMTlkrWUdw?=
 =?utf-8?B?MkYxVFVQb2Qrd2lDejFlY0dCTFQ2RjR2bms0VFdsVkw0UU9MRVJqbU04V2Jk?=
 =?utf-8?B?WE1PT2VjYUdSbVZaeDBjbHNERnJ3cFA5U1FVUzdIZUs2a2VRRmR5TWd4djBW?=
 =?utf-8?B?MGFSb3JGY211OHZXb2NqUnlBeHIvekhmMGdrM0hxSUhJNEwvTUxLaEl1YVpw?=
 =?utf-8?B?QStySkZ6RXZDQUZEMnJ1eWFYWHR6UngxWkUzOWkreWRxMlhBVTNCVFg1SkdO?=
 =?utf-8?B?QWt1MWw4RzJhaDVlZ1padmhmSGNudlpuWElObjErcll1UzgrSm5KUGxvLzdB?=
 =?utf-8?B?Qm9rc0RBT1hXVXRiR1JkQmY2UUVCcVBVbVhmNWZ5eFJuTzZUT25yMXRXL0xL?=
 =?utf-8?B?ZW1JRWVMZ2RrTGF0R1FsYTE3ZmFOb2thYnNNYWQzeEZHOGtLYnEvNklCQ0p4?=
 =?utf-8?B?bUVYVWNEWGdjN0oxNHRUNzd5QURSNlhJRDY0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59caf939-7c16-4fca-5c6d-08de06a54fa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 20:00:20.8648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wKTkYAzkPzPAFV7dIx5IkbjDYvoBNLQg7mvfZ9IRBaZxesjUhYBCMjHC/VtVWsR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR02MB7908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 20:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224600

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDcgb2t0b2JlciAy
MDI1IDE0OjQyDQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBh
eGlzLmNvbT47IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4NCj4gQ2M6IEFkYW0gWCBOaWxzc29uIDxBZGFtLlguTmlsc3NvbkBh
eGlzLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjFdIGNvcmUtaW1hZ2UsIHBvcHVsYXRlX3Nka19i
YXNlOiBBZGQgenNoLWNvbXBsZXRpb24tcGtncyBpbWFnZSBmZWF0dXJlDQo+IA0KPiBPbiBUdWUs
IDIwMjUtMTAtMDcgYXQgMTE6NDggKzAwMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gPiA+IFNl
bnQ6IGRlbiA3IG9rdG9iZXIgMjAyNSAxMjozNA0KPiA+ID4gVG86IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+DQo+ID4gPiBDYzogQWRhbSBYIE5pbHNzb24gPEFkYW0uWC5OaWxzc29uQGF4
aXMuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgQWRhbSBY
IE5pbHNzb24gPEFkYW0uWC5OaWxzc29uQGF4aXMuY29tPjsgUGV0ZXIgS2plbGxlcnN0ZWR0IDxw
ZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCB2MV0gY29yZS1pbWFnZSwgcG9wdWxhdGVfc2RrX2Jhc2U6IEFkZCB6c2gtY29tcGxl
dGlvbi1wa2dzIGltYWdlIGZlYXR1cmUNCj4gPiA+DQo+ID4gPiBPbiA2IE9jdCAyMDI1LCBhdCAy
MjoyOCwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+IE9uIE1vbiwgT2N0IDYsIDIwMjUgYXQgMToxMOKAr1BNIFJvc3MgQnVydG9uIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gMSBPY3QgMjAyNSwgYXQgMTc6
MDIsIEFkYW0gTmlsc3NvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8QWRhbS5YLk5pbHNz
b249YXhpcy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gRnJvbTogQWRhbSBOaWxzc29uIDxhZGFtbmlAYXhpcy5jb20+DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gQWRkIGEgenNoLWNvbXBsZXRpb24tcGtncyBpbWFnZSBmZWF0dXJl
IHRvIGluc3RhbGwgKi16c2gtY29tcGxldGlvbg0KPiA+ID4gPiA+ID4gcGFja2FnZXMgaW50byBh
biBpbWFnZS4gVGhpcyBpcyBzaW1pbGFyIHRvIHRoZSBleGlzdGluZw0KPiA+ID4gPiA+ID4gYmFz
aC1jb21wbGV0aW9uLXBrZ3MgZmVhdHVyZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ5IG15IGNv
dW50IHRoZXJl4oCZcyBqdXN0IHRocmVlIHJlY2lwZXMgaW4gY29yZSB0aGF0IGhhdmUgLXpzaC0N
Cj4gPiA+ID4gPiBjb21wbGV0aW9uIHBhY2thZ2VzLsKgIFVudGlsIGl04oCZcyBtb3JlIGNvbW1v
biwgSeKAmWQgc3VnZ2VzdCBwdXR0aW5nIHRoZQ0KPiA+ID4gPiA+IENPTVBMRU1FTlRBUllfR0xP
QlMgYXNzaWdubWVudCBpbiB5b3VyIG93biBpbWFnZSByZWNpcGUgaWYgeW91IHdhbnQgdG8gdXNl
DQo+ID4gPiA+ID4gaXQuDQo+ID4gPiA+DQo+ID4gPiA+IEl0IGRvZXMgaGVscCBwZW9wbGUgdXNp
bmcgenNoIGFzIGRlZmF1bHQgc2hlbGwgYW5kIHdvcmtpbmcgd2l0aCB5b2N0byBTREtzLg0KPiA+
ID4NCj4gPiA+IERvZXMgaXQgdGhvdWdoPw0KPiA+ID4NCj4gPiA+ICQgZ2l0IGdyZXAgRklMRVMu
KnpzaC1jb21wbGV0aW9uDQo+ID4gPiBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRf
MjU3LjguYmI6RklMRVM6JHtQTn0tenNoLWNvbXBsZXRpb24gPSAiJHtkYXRhZGlyfS96c2gvc2l0
ZS1mdW5jdGlvbnMiDQo+ID4gPiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGF0Y2hlbGYvcGF0Y2hl
bGZfMC4xOC4wLmJiOkZJTEVTOiR7UE59LXpzaC1jb21wbGV0aW9uID0gIiR7ZGF0YWRpcn0venNo
Ig0KPiA+ID4gbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2RfMzQuMi5iYjpGSUxFUzoke1BO
fS16c2gtY29tcGxldGlvbiA9ICIke2RhdGFkaXJ9L3pzaOKAnQ0KPiA+ID4NCj4gPiA+IEhvdyBt
YW55IFNES3Mgc2hpcCB3aXRoIG5hdGl2ZXNkayBidWlsZHMgb2Ygc3lzdGVtZCwgcGF0Y2hlbGYs
IG9yIGttb2Q/DQo+ID4gPg0KPiA+ID4gUm9zcw0KPiA+DQo+ID4gUGxlYXNlIHRoaW5rIG91dHNp
ZGUgT0UtQ29yZS4gSnVzdCBiZWNhdXNlIHRoZXJlIGFyZSBvbmx5IHRocmVlIHJlY2lwZXMNCj4g
PiBpbiBPRS1Db3JlIHRoYXQgY3VycmVudGx5IGNyZWF0ZSB6c2gtY29tcGxldGlvbiBwYWNrYWdl
cywgZG9lcyBub3QgbWVhbg0KPiA+IHRoYXQgaXQgaXMgbm90IG1vcmUgY29tbW9uIG91dHNpZGUg
b2YgT0UtQ29yZS4gQWxzbywgb25lIHJlY2lwZSB0aGF0DQo+ID4gY291bGQgYmVuZWZpdCBmcm9t
IGNyZWF0aW5nIGEgenNoLWNvbXBsZXRpb24gcGFja2FnZSBpcyBibHVlejUsIHdoaWNoDQo+ID4g
Y3VycmVudGx5IGhhcyBpdCBkaXNhYmxlZC4NCj4gPg0KPiA+IE9uZSBvZiB0aGUgbWFpbiByZWFz
b25zIEkgc3VnZ2VzdGVkIEFkYW0gdG8gc2VuZCB0aGlzIHBhdGNoIHVwc3RyZWFtDQo+ID4gaXMg
Zm9yIGNvbnNpc3RlbmN5LiBTaW5jZSBiYXNoLWNvbXBsZXRpb25zLXBrZ3MgaXMgYSB3ZWxsIGVz
dGFibGlzaGVkDQo+ID4gZmVhdHVyZSwgSSB3b3VsZCBleHBlY3QgdGhlIHNhbWUgcG9zc2liaWxp
dHkgZm9yIG90aGVycyBzaGVsbHMgKHdoaWNoDQo+ID4gaW4gb3VyIGNhc2UgaGFwcGVucyB0byBi
ZSB6c2gpLg0KPiANCj4gSSdtIG5vdCBzdXJlIHdlIHNob3VsZCBoYXZlIGxldCB0aGUgYmFzaC1j
b21wbGV0aW9ucyBvbmUgaW4uIE5vdyB0aGF0DQo+IHdlIGhhdmUsIHdlIGhhdmUgdGhlIGluZXZp
dGFibGUgZm9sbG93dXBzIGFuZCB0aGlzIGlzIHdoeSBJIHdvcnJ5IGEgbG90DQo+IGFib3V0IHBy
ZWNlZGVudCB3aGVuIG1lcmdpbmcgcGF0Y2hlcyBhcyBwZW9wbGUgZG8gdXNlIGl0IGFnYWluc3Qg
bWUNCj4gbGF0ZXIuDQo+IA0KPiBPbmUgdGhlIG9uZSBoYW5kLCBpdCBpcyBhIHRyaXZpYWwgcGF0
Y2guIE9uIHRoZSBvdGhlciwgd2UgaGF2ZSBrZXkNCj4gZmVhdHVyZXMgbGlrZSBkZXYgcGFja2Fn
ZXMgYW5kIGRiZyBwYWNrYWdlcyBiZWluZyBtaXhlZCB3aXRoIG11Y2ggbG93ZXINCj4gcHJpb3Jp
dHkgdGhpbmdzIGxpa2Ugc2hlbGwgY29tcGxldGlvbi4gVGhpcyBtYWtlcyBpdCBoYXJkZXIgZm9y
IG5ldw0KPiB1c2VycyB0byBmaW5kIHRoZSBpbXBvcnRhbnQgdGFrZWF3YXlzIGZyb20gdGhlIGxl
c3MgaW1wb3J0YW50IG9uZXMuDQoNClRvIG1lLCB0aGlzIHNvdW5kcyBsaWtlIGEgc2l0dWF0aW9u
IHdlIHNob3VsZCBiZSBhYmxlIHRvIGltcHJvdmUgYnkgDQpoYXZpbmcgYmV0dGVyIGRlc2NyaXB0
aW9ucyBvZiB0aGUgZmVhdHVyZXMgaW4gdGhlIGNvcmUtaW1hZ2UuYmJjbGFzcy4gDQpJIGhhdmUg
c2VudCBhIHBhdGNoIHNlcmllcyB0aGF0IEkgdGhpbmsgZG9lcyB0aGlzLiBJIGRvIG5vdCBrbm93
IGlmIA0KaXQgd2lsbCBzd2F5IHlvdXIgcG9zaXRpb24gYWJvdXQgYWNjZXB0aW5nIHRoZSB6c2gt
Y29tcGxldGlvbi1wa2dzIA0KZmVhdHVyZSwgYnV0IGl0IHdhcyB3b3J0aCBhIHRyeS4gKFRoZSBw
YXRjaCBzZXJpZXMgaXMgaW4gZm91ciBwYXJ0cyANCnRvIHNlcGFyYXRlIHRoZSBkaWZmZXJlbnQg
Y2hhbmdlcyBJIGRpZCwgYnV0IGl0IG1heSBiZSBlYXNpZXIgdG8gDQpqdXN0IGxvb2sgYXQgdGhl
IHJlc3VsdGluZyBmaWxlIGFmdGVyIHRoZXkgYXJlIGFsbCBhcHBsaWVkLikNCg0KPiANCj4gSSBy
ZWFsbHkgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIHdpdGggdGhlIHBhdGNoLiBJJ20gbm90IHBhcnRp
Y3VsYXJseQ0KPiBrZWVuIG9uIGl0IGFuZCBteSBmaXJzdCBpbXByZXNzaW9uIHdhcyBubywgZXF1
YWxseSwgSSdtIGJ1cm50IG91dCBhbmQNCj4gcmVhbGx5IGRvbid0IGhhdmUgdGhlIHRpbWUvZW5l
cmd5IHRvIHdyaXRlIGxvbmcgZW1haWxzIGFyZ3VpbmcgcG9pbnRzDQo+IGFib3V0IGl0Lg0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

