Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1109EC02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:23:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.46])
 by mx.groups.io with SMTP id smtpd.web11.40708.1736844214946117793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=o+oKGyMe;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.46, mailfrom: catalin.popescu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOIR44Keytrgem6ltqbgtDKUN1yYGZaoLjXc5qq+N3PXKnBw1zf//DFacVgATCFm3ZWNl6nphxbxTDo53UIJsSwJAay0kug6KqWpNn1XnvfBftd/O2BOLnZX+/WPhjK4siGK/TvzEjmYQ64j774YYu3LafgKgLMrEg+XRru7CajlqOpgLJY5Br1a4eseqyDc+xsbD9176c/GwRstTACnBYMIv1mIcwao0l8HZTPe04kT4Oovw5X9HyphWVkYkdcrttXhQax6yh70466aZwWRul7zOp8++/n26+OYfXr+7wzB0bX8ZyTItsuIo50FdebohVqyW7hrHjTmDDm7eE9Gwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww2zow5MIPmVhXCaEYPIypRN3c9CiNYbzVoOMiqVYRk=;
 b=gGyXS7crt0EzPOmuK6H1DgIQeYaBrn+mpensap9J4A3p9a/gcf8JFwQ26dwxRV+Ggry1ZM7PjklBnVrmUoJ+A75D13kOcrm8jaCcsfvKBzX1P2CKZS2Im6B4Ewyrx0IR87fDq9Izez8jirbMDMp9tR+7gZbGza4IGOOlV1Iy3Tm4Qd2X64rmWN46Fp7KViBTSPL6WOHcKDJp+EfrBu5HMbvixIloYfevyQuy3NaRI/x7TBh6+QyMtCSNk1j7HNfKd54+yke32WxcgMcZ/8RY4/TOMxynwacQZEQDAsGlfaQJvO9Y4H++5Ih9wRUhzdkJ7QgsLMUm6aHtJ5IkEhNfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww2zow5MIPmVhXCaEYPIypRN3c9CiNYbzVoOMiqVYRk=;
 b=o+oKGyMecb93a3kHH8zEheHYdvlmhv8+yIKcTj8/FQrO4FpBO20W/GLtgTBbGha/mZrCjwV2mIk7X62lR/4mu15dAZzN+dWbW3GECtcE5jisSjDCvbwJ5aS9IUvEpyMSk0bt3Y4NCAAO33zu4PIiJUVBkQcSWfAIQWWaxVe6BHE=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by AM9PR06MB7250.eurprd06.prod.outlook.com (2603:10a6:20b:2d1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Tue, 14 Jan
 2025 08:43:28 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 08:43:28 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file shipping from 5.73 to 5.72
Thread-Topic: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
Thread-Index: 
 AQHbYb2xfJ/q8Va8aE6fA9r66k6ItLMTN4SAgAFV3ICAAAoqAIAAHRsAgAAA/oCAAUejgA==
Date: Tue, 14 Jan 2025 08:43:27 +0000
Message-ID: <b6068398-1474-4a1b-bde8-c4b64764e2f9@leica-geosystems.com>
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
 <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
 <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com>
 <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
 <CANNYZj8r3j3tuaOKcNKZkV5AiLjOmPGbVYMK30hGvfSf8mezaQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8r3j3tuaOKcNKZkV5AiLjOmPGbVYMK30hGvfSf8mezaQ@mail.gmail.com>
Accept-Language: en-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|AM9PR06MB7250:EE_
x-ms-office365-filtering-correlation-id: 97e993a4-f5a4-472e-5878-08dd34778435
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dUJ4VFM2eVdtdnRCSjdORlZaUFU4RFZZMC9abURyT1RzK0NvVlo3NmlsSHpE?=
 =?utf-8?B?elZaUDV2QWowT2RQOVJqNXR4dTNFSDNETklSTE85UXNveWdwcTNiSDJTSnZs?=
 =?utf-8?B?dmtnSk56c3B6aEhWY200UEc3L2lOSW5LWm12RTZZNmQ1a1Yybk9xVHNFZ0Er?=
 =?utf-8?B?U2o2NlFLaGF4WTJQaXE5TnJlOXo0bllNMS9iemdtSmU2Zm5qSEQ3NXN0UTY4?=
 =?utf-8?B?WmJ4UjNpbmlBK3g3bmJEQnUvU0NoTlJ5QkZrNHlRVlNxNUhueWZxZHZMRk43?=
 =?utf-8?B?ZFRHU29tdllMTDZLU0dvR1IvcjV5ay9hTTBFY1l6NE5OZzJlOGRFckdMa28z?=
 =?utf-8?B?TWpjYVRRV1RxQU4wNnNtVjhSOThYaXhmcWxiQVdSNW5pK2UzNzMvbXI1MHpR?=
 =?utf-8?B?dXN2Y0kwc2xzanpJQThLejJhRkk5NFVwL3FvL1dhZGF6Um44YVpISTRZQ2t3?=
 =?utf-8?B?amNQV0c3TWtNLzBjZWY2SmdNZTQwbk9NdmxYU2tqTGVubS9QNDFQODE2NC9S?=
 =?utf-8?B?S1ZKdGl4WjhaSXdKanZRb0kyUXVCaG9xdVRFbEkwSVpwdDVFeW9nbGJMSWN5?=
 =?utf-8?B?TEE1TkY5TDBRZHNaelVmbGVETVlabWljWXVZcGRNMHZscUFMbVJ2VGNoR1oy?=
 =?utf-8?B?Zk12SkUrVWxwTi8vRGQ0ZjB1OXd2WGRsamdveXdxcHlqcEZuTnFleWZ2ekNy?=
 =?utf-8?B?cnJkQ1RkOHlHR2JCUGo1ZzVpVEpMUlB3VE0zbGlDYS9UMGZxRjFQU2VTbHV2?=
 =?utf-8?B?NlVSLy9jam5vYm9vRCtkaDlrUXZiaEVvOGR2WmNmOWZaa1ZWVWduMWkvNVc2?=
 =?utf-8?B?TmFMbkZnTVVjNGlkV09zcHZPdERZcTF4dGoxRS9RZHdvalBQMXFNVm5HMkxn?=
 =?utf-8?B?cnkxVElDclU1Tnc5SVhQUUw5Y3plZ1piRTkxcFhUQjZQUEppNmtnRlRsMGRl?=
 =?utf-8?B?bnNYUmFPTEJCKzVPeEJkUEcyaXl4MUdXV2Y1R3VGdktmclpPZ0NlV0N2Wmho?=
 =?utf-8?B?cElsOHhNdWZFZ0NpYit0dnZkbzQ2QXNTUkozMXVhN3o2VC91c2dmbkd1UVdV?=
 =?utf-8?B?VVh2MDAzQ3VuNWNoTnJvVmQvbnozb21WQm9rS3llUjVoSDZVVHl5WmE5OFRx?=
 =?utf-8?B?Tzh5U2JmVGI4VHZ6R1VMV3hlOFZVckFlbDZwdjd1cUViMGJnMm9RekhKVjNS?=
 =?utf-8?B?aE9yZ2xkYlZDb1lpb2ZhUjZ3OGNUNXRua1A5TnRCWW5xOFZRNExyTjhnbWxD?=
 =?utf-8?B?UnFGYW1wQTNscFF3bG0zVnlKZFJzSy9odVBGMUo1RTM5Ky9QMDBkUWJCUFZU?=
 =?utf-8?B?TzNBTy9nQ2JOL1ZaUnlON1pWUk5TSURCc1pYZWF3V1o0VUZ4QzdjT28xSVVu?=
 =?utf-8?B?ZEVZa25XYnFYbFljYWdKNUllaGVLTGdBa053SW5ZNmwyVDI1N0gvdmE1RmVN?=
 =?utf-8?B?ZE5rbEUvZ1pPQXB1citlYlZ1VUZGT0VJMVg0djd6ak9saWlzaUUwNmFxT2Fz?=
 =?utf-8?B?QXg2aE5mVjRtVjdnUWoxeWREYmNmTFV6SmJPelRMMUJFWlZZSjFSSVR0SlRq?=
 =?utf-8?B?SURVbUVEKzNRWFZtUElvcjJnTGhySTZyZ2Y0K1k3cFdlcUIyaENORHNiUUVF?=
 =?utf-8?B?aWhPQkZ0YjI3dDcwa2pDV0x4TlZwS2pQcXlONlI5WWptZFhqd1pXRmpPN3VU?=
 =?utf-8?B?RGdFVmZMRlptQTNpZVl3bEtlYmtvVDIrOUxBZXZDNDhwa0ZySXRBYjBYamIz?=
 =?utf-8?B?L256eGxZSHlmOGxIRnltK3FVajZXcWpTYktKOVkzdWR6b0FIcHlzeVpFNlFl?=
 =?utf-8?B?VEVrNVdqeWp1bGQyUzNtcEtWYjBWYzkwcUs1NFY3c204bFJkaU1TT1ZueSsw?=
 =?utf-8?B?blJzbzlIM01GZDBkWU4xVkliVU91TExRMkdYQkkzUG5lZkc3Ny9sS29MWDVy?=
 =?utf-8?Q?6/Sb1xCvIxULsrzmv2cSCTSn2y97MEHw?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTA4dXdYWUovblZYc0phd1hJbzdocENwTnFHOEg5SithV1JXTWZiaVcvYWNB?=
 =?utf-8?B?SDRUNC9LbG11YmpyK2xtUm1qeTIxM3pXN0dqKzZRNkhBMjhONlRPQWxOMGxw?=
 =?utf-8?B?YmdieElXY0pWOHJtN21Gckx4SXFzM2FaalpkSm9ySlI0ei9QY3hlRW5RVmZm?=
 =?utf-8?B?a0VGeUFndytBWWZRVUpFRHBWZWJRV2VocFQzYi9UUmNQeDJHYStTekM1dmU1?=
 =?utf-8?B?T3JOUlpLNTMrVEJnTFNtd0duUzVFUy9aeGVGdjJUTEJqeTBxMDZCNXRMK0pm?=
 =?utf-8?B?b0FvdVUydUpkeVRsdUtzaFRGbzRGS2xoY05hVlpYMXYrUHpBMXhzaDF5Nmp4?=
 =?utf-8?B?YVhnVjBabjIyazcycmwwMGJqUTJwaG9xeGNLZTBIcTNjd2tkYjVNdW9MUHBZ?=
 =?utf-8?B?a2owWXJKcXE2RkVYdXZMR2RIQUNaK29ISExQVXdWZzJaeG9vWVlvNTY4VXlV?=
 =?utf-8?B?a0RGdnRUY2RYMU5oZm1jc29OQlFma0xYZmpqZXVwZVhvQTI5dTEvazdieDlP?=
 =?utf-8?B?QzdPOXFtL2VlTUdrK0dBOWJtNERMWkE2aDROOUpqVUJwaDI2NDZkaGNIN2RZ?=
 =?utf-8?B?bEplOGQybmJhclpEcVFiK081MnBmeXNrUDlOUCtydTc4dFVBUXRlUFNOWU00?=
 =?utf-8?B?U1M4dXY1ZlYwenU0em5VSExVVzU2a0dlOUZKYlAzTEFpaldqZnVuOEl1VXdY?=
 =?utf-8?B?ajJYaWdOSERZRUNLT0doYkZ2bEhvZUtEeVhNY2RQYmY0MFI3U3YrY0xTOXB4?=
 =?utf-8?B?ZTd1aVZ3SDVlcnpzZW5sNVNFa2hzam41ZEJWRTNSdFZjR1lrMWxFUitUUTIr?=
 =?utf-8?B?UnFadHdBWGxkeDRHRlp6dHhmU09nbGxzckRMcVR6cVVUeVhzNWxDRHJ0ZW5n?=
 =?utf-8?B?b3JLcWY4U0RvaXdvMG03NUp6Ly9UYUhWQ1FuS2lQOXFoM3RKQ3RrSjczaXJn?=
 =?utf-8?B?bkUxNlpsaU9tRFNFd1ZEdFJSWEVRa1E5WGZWczY1emVjZzhzWlJUQlU4VGNm?=
 =?utf-8?B?eHJrM3o1clZSbE8zMXFxaG9nR0JqRzViNDhkMXkrZ0xLK2NxaERzZ0kzWnlk?=
 =?utf-8?B?QktlUFcybUhYL0hsSjkxS2gxaEpMWE43YWhHNE9IT0FkdUlOVDVVQnNqYkFl?=
 =?utf-8?B?bGFnbit5bDFoOGVWamY4d0xyNWZ6a3I4cnVUYUlwdHBIMy85VzFNMXJpcWJ5?=
 =?utf-8?B?V0NHaGZ2MUs2ZUVQemFBY1pnVTdBQW16cmFPWDBsUjlwVDU4M0VsbGlwMkY3?=
 =?utf-8?B?TUJOMUw1b3IvS2Y4RUMyVGhLSmtRRDhiTXpkVnRXbXZPd29aZ0N5WG9kbE5G?=
 =?utf-8?B?Vk5GYWx4emtmK3E5ZlJpUHBkZzlkcmFwNEZUcmZPOENDVkdqNU5SZnFsaFV2?=
 =?utf-8?B?Y01tOVFPQzlPU1FQV1NXQ3B3WjR0L3I4QWlVaGFhUElvMURKVktvL3Vwb1ZM?=
 =?utf-8?B?UHZwUEZrTVVsMHRFcXR5L3dDMUM4Mk8yWmN3Rnp0Z1Byby9Cak9mU0RBZFd6?=
 =?utf-8?B?cXJLNFAxWm0wV1hYZU5PTC85czk4eWV1ZitNZWdncFl1YjNyQzU4ZFc5RGVR?=
 =?utf-8?B?aVlmdDd3K2E4YTM0RUIxSk9EUWRUcGhaa1FoWTNhNmZlNFQrN2VzM0RhUDk1?=
 =?utf-8?B?dWJFUjlwMEpMQ2JhUUhtdDg2QXREWUl2bHhuQjhzYVppRUZVczVURXRNb09i?=
 =?utf-8?B?TEgySWlzM1lwR0dhbWRrT3RHQTg3cVZvOG9YdWFqWndleFR0RkpZOWdaQ0JZ?=
 =?utf-8?B?V1hyV0lvaDRvMFo5aEJ6aHZuWFUxQ0lZRXFHaFRubm4zQXFwSUJYSUhQUTJV?=
 =?utf-8?B?SFp6ZmJ1RnZOSlBYTVNZblJzaUZnVmh1QllLcEFncjhTMFNKbjVkb0FCQk9D?=
 =?utf-8?B?eUozK3RrK2xub3ZZZVNGNzFqWUdvcUVqYTVJTnlWZ0ovRGZYNDhWeUllRVNC?=
 =?utf-8?B?c2VSb2s1US9wQ2kyRGFZYmpqMGxFOGlTUjE1RXlldWtqQmVuZXZwVEpvSk9Y?=
 =?utf-8?B?YmtKc2VaSld0QlZQZ21vSElBUmJwbDZpR1V0anE1RUl2L2tPM3VYeG8yMi9s?=
 =?utf-8?B?Rk9VbFZlMXgyclk3ay9TQXpMMFZxSHBZeDNNeDB4cFhzcUEvWGR0YVFUYWNk?=
 =?utf-8?B?MElOZ2g2ZnRtdU4wNlhKTERhVjA0bCs1RFd1b2xxdUJ1amxYdFA0TytzZHQx?=
 =?utf-8?B?TXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e993a4-f5a4-472e-5878-08dd34778435
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 08:43:28.0088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u23+oZOjIYRs/n6C9nhuZckq/bypMiDjmkOI2BpS7Kge/mEHXBRf4f+kuJOEq4ra776sP75cOVK1Pave0jHHVoZ3MQQgxr9ztGlf8q5/nxNxVQ/N3SW21HG3KRVZo1df
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7250
Content-Language: aa
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CBE0B290E127F4886A6BE6ECFB5D058@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209791

T24gMTMvMDEvMjAyNSAxNDoxMCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IFtTb21lIHBl
b3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9t
IGFsZXgua2FuYXZpbkBnbWFpbC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPg0KPiBUaGlz
IGVtYWlsIGlzIG5vdCBmcm9tIEhleGFnb27igJlzIE9mZmljZSAzNjUgaW5zdGFuY2UuIFBsZWFz
ZSBiZSBjYXJlZnVsIHdoaWxlIGNsaWNraW5nIGxpbmtzLCBvcGVuaW5nIGF0dGFjaG1lbnRzLCBv
ciByZXBseWluZyB0byB0aGlzIGVtYWlsLg0KPg0KPg0KPiBPbiBNb24sIDEzIEphbiAyMDI1IGF0
IDE0OjA3LCBQT1BFU0NVIENhdGFsaW4NCj4gPGNhdGFsaW4ucG9wZXNjdUBsZWljYS1nZW9zeXN0
ZW1zLmNvbT4gd3JvdGU6DQo+PiBJIGRvbid0IHJlYWxseSBrbm93IGhvdyB0byByZXByb2R1Y2Ug
dGhpcyBlcnJvciAod2hpY2ggSSBkb24ndCBzZWUgb24gbXkNCj4+IHNldHVwKS4NCj4gSGF2ZSB5
b3UgcnVuIHRoZSB0ZXN0c2RrIHRhc2sgc3BlY2lmaWNhbGx5Pw0KPg0KPiBBbGV4DQoNCkkgZG9u
J3QgaGF2ZSBjb3JlLWltYWdlLXNhdG8gYXZhaWxhYmxlIG9uIG91ciBidWlsZCBzZXR1cCBhbmQg
dGhlcmUncyBubyANCnRlc3RzZGsgdGFzayBhdmFpbGFibGUgbmVpdGhlci4gU28gSSBjYW4ndCBy
ZXByb2R1Y2UgdGhlIGlzc3VlIHRoYXQgZWFzaWx5Lg0KDQpSZXByb2R1Y2luZyB0aGUgaXNzdWUg
d291bGQgcmVxdWlyZSB0b28gbXVjaCB3b3JrIGFuZCB0aGVyZSdzIGEgYmV0dGVyIA0Kc29sdXRp
b24gZm9yIHRoZSBpc3N1ZSB3aGljaCBpcyByZXZlcnRpbmcgdGhlIGNvbW1pdCB0aGF0IGludHJv
ZHVjZWQgdGhlIA0KaXNzdWUgb24gc2NhcnRoZ2FwLg0KDQo=

