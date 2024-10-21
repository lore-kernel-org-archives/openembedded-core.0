Return-Path: <diego.santacruz@spinetix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D60D15DB4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 15:50:59 +0000 (UTC)
Received: from ZRAP278CU002.outbound.protection.outlook.com (ZRAP278CU002.outbound.protection.outlook.com [52.101.186.134])
 by mx.groups.io with SMTP id smtpd.web10.50040.1729525856383363750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 08:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=yPHcUg4y;
 spf=pass (domain: spinetix.com, ip: 52.101.186.134, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1t9Yc0da6ZtzPKrUHvRLn0SLkGXMggmcptddDakXbV1x6UeG6Wy7wC367jq8EGQsddY6D6/oLJpe7NlplXdKPxGJrEBJXhSeMa9ZAv1QtPdIdEuhELv25CEyBOCHIKYWzS7MmJ6KvjWjbSvIpwh2fyZSJctIijqt+hSQu22/0iuY+rnPNj+A4hQ5+WVEIo+Dm9aaJloiqfeNqmapfckzMd6kfTXNRc5mF5ttaQvoc3GNFo8daUQyn+aJy2RYpd5o6/zXemAZ/GZYgc5Q0C+s1nRS7/ke86ve9ziH5M34+Mn6WkO9gakgSSnq5ViMiq8fS/Jr5A6W+RPXvAXgOxnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iybsf/NgrRz0QaMgdVpwoyo7KW8HtLWsZOf8pdXLAU=;
 b=JmeCOTpgI+drTHCxpLpbSd8hvdL4hDq1zb3d6+k1OPDJ7t7FtNcRIAF8MaOcWqBWqHxPAG0cETFjVrklyebrq6MelauztkFp9FQTVzmpA9a8H5n4T/zA/UeEqu57Ys2J7gZnRP6CYoJGDexNBvg+l2JMouPEsc79OOidN7+kBVHSJKfmOukLknPLQLNB2Ad82jeoyfPahi1A66FHgIyfmQ/uo51oR3xI9bt4Iwkf8IpMBljucnHvSOxUzbORL4tzPcHOA/3NJM+PwPRhzy5RmaK28QQJ5SgjGR6chHK4TGq2BJabEymjl56ndJYdIxpz/9beTC3A4ihK0yhGA7rs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iybsf/NgrRz0QaMgdVpwoyo7KW8HtLWsZOf8pdXLAU=;
 b=yPHcUg4yc45rA3IB0sYCPCEiCtrl6mGpopdx/9mBvvN0L1/42y+YfSHYXCUpC2AyRy9mNgnUbLZ0CsMmgdzW/RmVWkEql7IZO1i7fbVu7VVw67A5BvYKoEwEUsvRjGY2UbZqnWx6jOOxPI2CZQIhT2kdjgcgalaXRkGo/bJCXSw=
Received: from ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:36::8) by
 ZR1P278MB1085.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Mon, 21 Oct 2024 15:50:52 +0000
Received: from ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
 ([fe80::aa8b:647a:9e00:6193]) by ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
 ([fe80::aa8b:647a:9e00:6193%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 15:50:52 +0000
From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] gzip segfault with mandb and qemu when building rootfs
Thread-Topic: [OE-core] gzip segfault with mandb and qemu when building rootfs
Thread-Index: Adsi7OGZWcIvyorDRvm6I4ocOYEeXgAuO/2AAAq5GNA=
Date: Mon, 21 Oct 2024 15:50:52 +0000
Message-ID: 
 <ZR0P278MB025233D1C2BAAE810423918888432@ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM>
References: 
 <GV0P278MB0241B5BD9E5305D57A7EBBAC88422@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
 <CANNYZj-QhbtH7zzDp_pMV+EeX=qmQLx+e6MKKohqEttpL53XQw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-QhbtH7zzDp_pMV+EeX=qmQLx+e6MKKohqEttpL53XQw@mail.gmail.com>
Accept-Language: en-GB, fr-CH, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spinetix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0252:EE_|ZR1P278MB1085:EE_
x-ms-office365-filtering-correlation-id: c24e8907-f730-486c-84c8-08dcf1e82451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bS8rNTNncWszRWh4MDFEMWd2K1gvVVc5dkZySXRtZzJJUFp5TkM1ZFRmNlUz?=
 =?utf-8?B?bVBkRDZISExuMGV6V21kUGdObXFwM2JTZVVNSUpsUkdkRXlnZ2oySHZGQ2pY?=
 =?utf-8?B?a3RPeDRCeG83Mkg2L0NjNHd5QUc5djY5ZGNMUTJKdDNLekhGYzFDZXp1RDhq?=
 =?utf-8?B?MHMwckFWQXl4a3FYWTFDSzBWdWQwWGN4SWNkTllFU1ZIU3BOb3prNTdHd3dC?=
 =?utf-8?B?dTJYN3J3K2FhaDJXbmFOZktYeitiMjAzZVQxU05QamRobW5CckNJUFUvd0dK?=
 =?utf-8?B?MVU4Y1dkLzFEMlUrbUo5TmEvUVR2NDBTWlZnL2doS3JFZGhpSnA5R1lxY3lz?=
 =?utf-8?B?MlNCYlVXUlRXd1dPTzRtaXVQTEpNR0xwMVdmL2hRLzlGT2xOZSs0UlJDZ3pS?=
 =?utf-8?B?T1BUYUJGVE93WXdqOUVMSDVvTGV4ZFZqaVdqd1hUZktCMVdRQzZjVzFEV3Bx?=
 =?utf-8?B?SytSWVNDVEVQVXEybzdBd3NNVk43cEtBRHFJV203Y3ZLT3RNek9wQkpNb2xW?=
 =?utf-8?B?UzdhUDJISEc3YnhEVUt3Uy9CNkx6ZHppa25Xbkd0ZVdZUnMxMEd1OUttbG1t?=
 =?utf-8?B?YUtUSG1udDl2L0EvYVdPd2gwb3NoU2JjbDk1TEVJelhqZktxQXdSSHNUKzhz?=
 =?utf-8?B?N0JRb3FOSlJvMTM3MGxlVzA4WmdmVDJIUm1VN3ZqVzBLbkdIci8reWtQUnhY?=
 =?utf-8?B?eGgzQVRDL3FmbVNiTkhTQm1MRVJsVS9mb3FWWG1oZTVkNnpoZ1VZVzQ0N2ts?=
 =?utf-8?B?MjhjY2tpRFo5cmc5N3MyanFkU3pRbmJ5eGI5R3dRWWZyWkpvcVE0SHVWUytw?=
 =?utf-8?B?ZGt0MUtpYzNHUGo0T09uVmdYOWFXbE1LNU9COWNuSTBqTU4rendRT2E5bHls?=
 =?utf-8?B?TWMzbHdHRklCWjRVa3NDQzhRc0tIbHZpZDIzY0creVlKTHM2U3RkNVRyanN4?=
 =?utf-8?B?Sk1LeFdlN1BRY3F5TmZXdTd6bUhVcy9TZHdSeWFjeTNYNGQvQ28vUDFYRTU1?=
 =?utf-8?B?SEVLYVVIY1M1YTBzdktKRzN1WlliTDdlU1dmS1RqR3RDeUpCVkFsQzBWSFE0?=
 =?utf-8?B?bGV6R25LeXIyYlVmWm5TQm9HMDZrVjVQV1MzdktGUUg3RjBTaCs2RGg4NUxo?=
 =?utf-8?B?OFNua3pLVW1JQlVqL1d3UC8vM3E5dFZzNjNQTjhZeEdYSUIzeGFlS1pZWHpM?=
 =?utf-8?B?TVZ6bzl5RkJ3akd4eXhCSU5ReCtjNXYxL25hZ0tSMm5sMDVScENBcnU5YlNK?=
 =?utf-8?B?aTFGc2w0V09acnpHODhXVmVXNHl2c0pFaVlkNWlWc3JkWndJR1c0eFZMa3dm?=
 =?utf-8?B?ajRvNW1QLzE3Z3A1eFFDM3EzSlNSb0ZmejIrQnU4MDVwTlVUTUFZNzU1Mzlp?=
 =?utf-8?B?TkNGS1lkTlN6SWdPWUpsNkpzTDd2UW4xc2VpSXI1MDJQMGNhVnhTYXhIbHpq?=
 =?utf-8?B?OTlYSTgrUEx5d0RuRnFRcnU1NHNvU1ZscUNJYU5VZ1MxcVNidjFMVUx6eEFB?=
 =?utf-8?B?QklFcTlXbENwZHlXUVRUbkE4QUM5ZWZpVDFJOG1XRC80RDUwWEozM1JFUDc1?=
 =?utf-8?B?MmQrMWRsblo0Y3FCV2xqdHNBNUtIZ3RWUmNnNUZxdVRRcnZQeWQvdnd3eXE5?=
 =?utf-8?B?QUtyNlZuMG00aG1pSXVUaTNuMUIrbnprMFBkelRadzcrRlc3YnBSRm5kSWRZ?=
 =?utf-8?B?b2JyQ1hQemxjRmw3TXVNNGV1ZmRjNVFpMnAxUml1Y3hFUlZyRHpmZ3RSYXpE?=
 =?utf-8?Q?35GCxiDnmap/FhVGZ4uDUHz4t+gNLoNwJNf1Kaa?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFZvbXl0RWRrUVA5emNpUktZT2ZPY25oaEpsVXcwekJ3a09yc3FzdnlYcklB?=
 =?utf-8?B?ZXluaGlYeUtEcmNrOGZpN2xFRzFKS0ZyaHZjTlI4Z3VxUlJjSERicTJYcSt4?=
 =?utf-8?B?cnc0UUVVOEZjUlA1dk0veDRWNlZGMXRLVHQ0TThRN1k1VTRQOFBUZklLajV4?=
 =?utf-8?B?US9wL3BEOHZLQTNLVUR1ZC90cnFiUUdrSTcxMkVUT3Bhejc2UWpzZWJJV3lp?=
 =?utf-8?B?U0xlOWlIV0NZS2tNZ3I4eFNpd3hFZ2VQSENoWjNidm1wRVV6bXoxTzgxaWtU?=
 =?utf-8?B?dXNLUUlVbjN2WWI0TDVTSjZsV0JHc1dodml4YWt6Q3ZJTTE3THlYS24wZE1i?=
 =?utf-8?B?YXJiOWFESGxjazhxT1NoTHRHcFdLNUZyWmhCZnFxaWJkRUhkVnAzNXl0dUV2?=
 =?utf-8?B?TXYwakkzQ1FxZ0VjcW1HaGRBV0V5NWFCOS85MmJQaHM4WVNneVB6SExsMmNu?=
 =?utf-8?B?NHVSTzNUb1h0MUtBYU9WeGNpNVVMSWxPN1dYT1UxaDJmSTZUSnc5MndkMGxJ?=
 =?utf-8?B?K0pWRzFDWE5IM1dhL3pZUkNIZysvY05BclBzYzlqNnpPM3ZiUHpUelAxd251?=
 =?utf-8?B?VldOK2krZlJ2VmprT0Y4SjlXYnYyTlZlaFlzbDRHcTMxbWxnRDRjU0NLaG1i?=
 =?utf-8?B?dGFtYlJETEkwb1pCUXhLazd0QnU2NHlUMWMrRlZ1WDFkKzRXMENwRmxPRHpz?=
 =?utf-8?B?ckxvVDlVSUthOEo4eldZOFRldzdiWFNFdml6dng2dGdDbmxHZmxYbzZObEhl?=
 =?utf-8?B?MFBtYVROYURRS1pjOGVBcjNiMk5ETzdYL1ExaWZzd3VhTldaUGJmMm16V003?=
 =?utf-8?B?T1NTTHBHREQvUU8wZVZVQ2Vtb3psaW5kbHVLbmZlNy9MZzF3dmQ1dUU4SjlQ?=
 =?utf-8?B?bHA0Uklncm1wNFBPZGUxU0xKdGQySnJMRFdwL2Zmamp5YVBrYStqUXlPa0U4?=
 =?utf-8?B?SmtHbVFJNVkyV0JGMHVvQVNQMUVzMS9pNnVwV1V4ZkthOGF6WEZnSlRlSlJJ?=
 =?utf-8?B?ZWxCUTlYc3RmS20vL0JCd2EyMVA5dzc3ZzgrYWd5Wi9ISzZNaE1lckw4KzN0?=
 =?utf-8?B?MExCNFh4T2J6SkNDem9vanNBUldVWWd0ZWFYVFlvdU9nWG5iV1A2SUtWYWRO?=
 =?utf-8?B?YUtpUjcvNEQwMDcva2xlZXVHZzY4SjJ5RW4yamk4QlRwSE44VzliMEJOSkwy?=
 =?utf-8?B?cjhMV0hXdkl0dXRaNGYzWXBzV0FNZTJZR0RmQ2JxRmp1TG5Xa094RnI0SGhH?=
 =?utf-8?B?L1didXlBamd5ZVdRTWIxU21keHprOGVLWTN1aVNHRnJxOFZGVkdvTmZ2WS94?=
 =?utf-8?B?VGxoU0dUNjZuUG5xMXNQME5BNng1SWRHcHF0WE80OUdrRlZzb2pQZVFBZVg5?=
 =?utf-8?B?MWZJb0MxWS9BcFlVb2ZWdTBpUUlTSEZUQTlmNi9DVldDRCtoalNFaHBlVUND?=
 =?utf-8?B?Z3l0TmpZcllVTUxlUHJQaTU5cVRGamQ3TWw1cE54VHNHNjZzWlFabXRLcHM4?=
 =?utf-8?B?YVRFU0FHTzBiK2toSVdnMm0yazNpN2Q4MFFlV3ZiR0U1ZytKU1BJYW11ZHdt?=
 =?utf-8?B?NWhsbkZsQVRpNUlhWkZJZU0yOWhKTmVpUU1MWmNsVlpyOGh5WGhsRGxXZmxD?=
 =?utf-8?B?a3U4MUhic2ZGc0pWN3BWckY2VE92ZEtJaXJoQVZrL2lZdlBKcWRRNlJBSzhD?=
 =?utf-8?B?UStUUkhWdGcxR0RoU2xXd2Q2R3Y3YXFWREtURGgyV1dYdVhFSjNRbnI1L2Zx?=
 =?utf-8?B?d1FueTFTYmp6ZVpZNFRwWlA0WURjZjgrNVljMHdNZk1STlh1aEJFUGVjTzJ6?=
 =?utf-8?B?ZnJUTXg3L1VxTjVVQ2xEREw0TTQzczRaUUlBeXlpaVdWM1g4NGlpOWpVNy9Y?=
 =?utf-8?B?SHdiNUo5QzVNbU45L2RqTVk0UGxZRTI1UlJZdDhpekNTVVpUKzBkWWtlbHFu?=
 =?utf-8?B?RWZvTlg4Mng3ZDdLOUxGRzhabWhORGhDRUVCRWNJWFd3aWdmNWJpK0JQSXFm?=
 =?utf-8?B?NXNQZ0xYN1JsZko2U2hoZExsdlRzeHdoNThTOFlmVzNMVm5IVU5PcExhVHlo?=
 =?utf-8?B?Qjk3ekFRdCsxK2VQem1uWGVHbkhUbHJkSjlxUlNvVHZYUi91MHZiZkRJQ244?=
 =?utf-8?B?eERqUkhwbG44dXQ1ZTRpZGc1NzlIOXZzT1U5RTNsTDRmYWkyejRKUi9ZRFV2?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0252.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c24e8907-f730-486c-84c8-08dcf1e82451
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 15:50:52.3534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNmC6TckmKuU14Fl/nmxLFOLxF+tyzE7Cu0g1CXrMBvvazVcVxBoXrGWW2HXNrM2FkQsM6+NY9i1zqTSL/YPmMKNPEdAd5IwKtqai59f2zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 15:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206125

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogMjEgT2N0b2JlciAyMDI0IDEyOjQyDQo+
IFRvOiBEaWVnbyBTYW50YSBDcnV6IDxEaWVnby5TYW50YUNydXpAc3BpbmV0aXguY29tPg0KPiBD
Yzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIGd6aXAgc2VnZmF1bHQgd2l0aCBtYW5kYiBhbmQgcWVtdSB3aGVuIGJ1aWxk
aW5nIHJvb3Rmcw0KPg0KPiBJdCB3b3VsZCBoZWxwIGlmIHlvdSByZXBsaWNhdGUgdGhlIGlzc3Vl
IG9uIG1hc3RlciwgYW5kIHByb3ZpZGUgc3RlcHMNCj4gdG8gcmVwcm9kdWNlIHNvIEkgb3IgYW55
b25lIGVsc2UgY2FuIG9ic2VydmUgdGhlIGlzc3VlLg0KDQpJIHNob3VsZCBiZSBhYmxlIHRvIGRv
IHRoYXQsIGJ1dCBpdCB3aWxsIHRha2UgbWUgYSBiaXQgdG8gc2V0IHVwIHRoZSBuZWNlc3Nhcnkg
dGltZSBhc2lkZS4gSSdsbCBjb21lIGJhY2sgd2hlbiBJIGhhdmUgaXQuDQoNCj4NCj4gQWxleA0K
Pg0KPiBPbiBTdW4sIDIwIE9jdCAyMDI0IGF0IDE0OjU5LCBEaWVnbyBTYW50YSBDcnV6IHZpYQ0K
PiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxkaWVnby5zYW50YWNydXo9c3BpbmV0aXguY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gSGkgdGhlcmUsDQo+ID4N
Cj4gPg0KPiA+DQo+ID4gV2Ugbm90aWNlZCBtYW55IGd6aXAgc2VnZmF1bHQgZXJyb3JzIG9uIG91
ciBidWlsZCBtYWNoaW5lIHdoZW4gZG9pbmcgZWl0aGVyDQo+IGRvX3Jvb3RmcyBvciBkb19wb3B1
bGF0ZV9zZGsgZm9yIGltYWdlcyBvbiB3aGljaCB0aGUgbWFuIHBhZ2VzIGFyZSBlbmFibGVkLg0K
PiA+DQo+ID4NCj4gPg0KPiA+IFdlIHRyYWNlZCB0aGlzIHRvIG1hbmRiLCBydW4gZnJvbSB0aGUg
cG9zdGluc3Qgc2NyaXB0IGluamVjdGVkIGJ5DQo+IG1hbnBhZ2VzLmJiY2xhc3MsIHdoaWNoIGlu
dm9rZXMgZ3ppcCB0byBzY2FuIGNvbXByZXNzZWQgbWFucGFnZXMuDQo+ID4NCj4gPg0KPiA+DQo+
ID4gT3VyIGRpYWdub3N0aWMgaXMgdGhhdCBtYW5kYiBpcyBleGVjdXRlZCB2aWEgcWVtdXdyYXBw
ZXIgd2l0aA0KPiBMRF9MSUJSQVJZX1BBVEggc2V0IHRvIHRoZSByb290ZnMgbGliIGRpcnMsIHdo
aWNoIGlzIGV4cGVjdGVkIHNpbmNlIG1hbmRiIGlzDQo+IGZyb20gdGhlIHJvb3Rmcy4gSG93ZXZl
ciwgUEFUSCBpcyBub3Qgc2V0IHRvIHRoZSByb290ZnMgYmluIGRpcnMsIGJ1dCBpbnN0ZWFkIHRv
IHRoZQ0KPiB2YXJpb3VzIHN5c3Jvb3RzIGFuZCB3cmFwcGVyIHBhdGhzLCBzbyBpdCBpcyBnemlw
IGZyb20gcmVjaXBlLXN5c3Jvb3QtbmF0aXZlIHRoYXQgaXMNCj4gZXhlY3V0ZWQsIHVzaW5nIGxk
LWxpbnV4IGZyb20gdGhlIHJvb3Rmcy4gQnV0IGl0IHR1cm5zIG91dCB0aGF0IHRoZSBsZC1saW51
eCBhbmQgbGlicw0KPiBmcm9tIHJvb3RmcyBhcmUgaW5jb21wYXRpYmxlIHdpdGggdGhvc2Ugb2Yg
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlLCB3aGljaCByZXN1bHRzIGluDQo+IGEgc2VnZmF1bHQgaW4g
bGQtbGludXguDQo+ID4NCj4gPg0KPiA+DQo+ID4gSSBmaXhlZCB0aGlzIGluIG91ciBidWlsZHMg
Ynkgc2ltcGx5IGFkZGluZyAtRSBQQVRIPSREJHtiaW5kaXJ9OiREJHtiYXNlX2JpbmRpcn0NCj4g
dG8gdGhlIHFlbXV3cmFwcGVyIGNvbW1hbmQgbGluZSBpbiBzY3JpcHRzL3Bvc3RpbnN0LWludGVy
Y2VwdHMvdXBkYXRlX21hbmRiLg0KPiBIb3dldmVyLCBJIGRvIHdvbmRlciBpZiB0aGUgY29ycmVj
dCBmaXggd291bGQgbm90IGJlIGluIHFlbXUuYmJjbGFzcyB0bw0KPiBzeXN0ZW1hdGljYWxseSBz
ZXQgdGhhdCBvcHRpb24gZm9yIGFueSBxZW11d3JhcHBlciBpbnZvY2F0aW9uLCBhcyB0aGUgcHJv
YmxlbQ0KPiBjYW4gcG90ZW50aWFsbHkgYWZmZWN0IGFueSB0b29sIGV4ZWN1dGVkIHZpYSBxZW11
d3JhcHBlciB0aGF0IHNwYXducyBvciBleGVjcw0KPiBzb21lIG90aGVyIGV4ZWN1dGFibGUgdXNp
bmcgUEFUSCB0byBsb2NhdGUgaXQuDQo+ID4NCj4gPg0KPiA+DQo+ID4gV2UgZW5jb3VudGVyZWQg
dGhpcyBvbiBraXJrc3RvbmUsIGJ1dCBvdXIgbG9jYWwga2lya3N0b25lIGJyYW5jaCBoYXMgdGhp
cw0KPiBjb21taXQgYmFja3BvcnRlZDoNCj4gaHR0cHM6Ly9naXQub3BlbmUvDQo+IG1iZWRkZWQu
b3JnJTJGb3BlbmVtYmVkZGVkLQ0KPiBjb3JlJTJGY29tbWl0JTJGJTNGaWQlM0RmYmQ4YTU3YWEz
MDdiZmRhNzBhMDhjYjc4YWYzYzk3ZjA1YzM5YTNhJmQNCj4gYXRhPTA1JTdDMDIlN0NkaWVnby5z
YW50YWNydXolNDBzcGluZXRpeC5jb20lN0M1OGZhNWEyYmE1ZDc0OTYzZTA4MjANCj4gOGRjZjFi
Y2ZjMGElN0M1ZjQwMzRmYWVkMmQ0ODQwYTkzZmFjYjFlOTYzM2I5MyU3QzAlN0MwJTdDNjM4NjUx
MDQNCj4gMTE4NTYzMTcwOSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3
TURBaUxDSlFJam9pVg0KPiAybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdD
MCU3QyU3QyU3QyZzZGF0YT1vNHk3dUNaMw0KPiBBcWhVb0MxUmNrQ25LSWlpWkhQcFM2V01rNjFL
Y1cwdnRFWSUzRCZyZXNlcnZlZD0wIEhlbmNlIHRoZQ0KPiBtb2RpZmljYXRpb24gb2Ygc2NyaXB0
cy9wb3N0aW5zdC1pbnRlcmNlcHRzL3VwZGF0ZV9tYW5kYiBhbmQgbm90DQo+IG1hbnBhZ2VzLmJi
Y2xhc3MNCj4gPg0KPiA+DQo+ID4NCj4gPiBUaGUgcHJvYmxlbSBkb2VzIG5vdCBvY2N1ciB3aGVu
IGJ1aWxkaW5nIGltYWdlcyBmb3IgbWFjaGluZXMgd2hpY2ggYXJlIG5vdA0KPiB4ODYtNjQgYmFz
ZWQsIHNpbmNlIHRoZSBidWlsZCBob3N0IGFuZCB0YXJnZXQgYXJjaGl0ZWN0dXJlcyBhcmUgbm90
IGNvbXBhdGlibGUuDQo+IE5vdGUgYWxzbyB0aGF0IHRoZSBzZWdmYXVsdCBpcyBnb25lIHdpdGgg
dGhlIGFib3ZlIG1lbnRpb25lZCBmaXgsIGJ1dCBnemlwIGRvZXMNCj4gbm90IHJ1biBzdWNjZXNz
ZnVsbHkgc2luY2UgL2Jpbi9nemlwIGZyb20gdGhlIHJvb3RmcyBpcyBhbiBhYnNvbHV0ZSBzeW1s
aW5rIHRvIHRoZQ0KPiBhY3RpdmUgYWx0ZXJuYXRpdmUgKGUuZy4sIC9iaW4vZ3ppcC5nemlwKSwg
d2hpY2ggZG9lcyBub3QgZXhpc3Qgb24gdGhlIGJ1aWxkIGhvc3QsIGJ1dA0KPiB0aGF0IGlzIGFu
b3RoZXIgcHJvYmxlbSwgYXQgbGVhc3QgdGhlIHNlZ2ZhdWx0IGlzIGdvbmUuDQo+ID4NCj4gPg0K
PiA+DQo+ID4gV291bGQgZml4aW5nIHFlbXUuYmJjbGFzcyBtYWtlIHNlbnNlPyBJZiB5ZXMsIGhv
dyBleHRlbnNpdmUgc2hvdWxkIHRoYXQgYmU/DQo+IEZvciBpbnN0YW5jZSwgZXhwbGljaXRseSBw
YXNzaW5nIHRoZSByaWdodCBkaXJzIGZvciBQQVRIIHRvIHFlbXVfd3JhcHBlcl9jbWRsaW5lLA0K
PiBsaWtlIGl0IGlzIGRvbmUgZm9yIExEX0xJQlJBUllfUEFUSD8gT3IganVzdCBpbXBsaWNpdGx5
IHNldHRpbmcgaXQgaW4NCj4gcWVtdV93cmFwcGVyX2NtZGxpbmU/DQo+ID4NCj4gPg0KPiA+DQo+
ID4gU2luY2VyZWx5LA0KPiA+DQo+ID4NCj4gPg0KPiA+IERpZWdvDQo+ID4NCj4gPg0KPiA+DQo+
ID4gLS0NCj4gPiBEaWVnbyBTYW50YSBDcnV6LCBQaEQNCj4gPiBUZWNobm9sb2d5IEFyY2hpdGVj
dA0KPiA+IHNwaW5ldGl4LmNvbQ0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+ID4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8g
dGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIwNjA5NCk6DQo+IGh0dHBzOi8v
bGlzdHMub3BlbmUvDQo+IG1iZWRkZWQub3JnJTJGZyUyRm9wZW5lbWJlZGRlZC0NCj4gY29yZSUy
Rm1lc3NhZ2UlMkYyMDYwOTQmZGF0YT0wNSU3QzAyJTdDZGllZ28uc2FudGFjcnV6JTQwc3BpbmV0
aXguY28NCj4gbSU3QzU4ZmE1YTJiYTVkNzQ5NjNlMDgyMDhkY2YxYmNmYzBhJTdDNWY0MDM0ZmFl
ZDJkNDg0MGE5M2ZhY2IxZTk2DQo+IDMzYjkzJTdDMCU3QzAlN0M2Mzg2NTEwNDExODU2NTI1MTgl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXkNCj4gSldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3Qw0KPiAwJTdDJTdDJTdDJnNk
YXRhPWdSSlV2b0tMRmpsa0ppJTJCQzMwZ1RqZ3Zma0tLbU5iMmU2VUdDbmljbzhlSSUzRA0KPiAm
cmVzZXJ2ZWQ9MA0KPiA+IE11dGUgVGhpcyBUb3BpYzoNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZS8N
Cj4gbWJlZGRlZC5vcmclMkZtdCUyRjEwOTExNDI1NCUyRjE2ODY0ODkmZGF0YT0wNSU3QzAyJTdD
ZGllZ28uc2FudGENCj4gY3J1eiU0MHNwaW5ldGl4LmNvbSU3QzU4ZmE1YTJiYTVkNzQ5NjNlMDgy
MDhkY2YxYmNmYzBhJTdDNWY0MDM0ZmFlZDINCj4gZDQ4NDBhOTNmYWNiMWU5NjMzYjkzJTdDMCU3
QzAlN0M2Mzg2NTEwNDExODU2NjQwMDElN0NVbmtub3duJTcNCj4gQ1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0oNCj4gWFZD
STZNbjAlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPUNTajVDc2x2Snhna3Q2U01jelI2bWdsbmc4SlhH
bGRFSWsNCj4gNG1rdUF1T0FvJTNEJnJlc2VydmVkPTANCj4gPiBHcm91cCBPd25lcjogb3BlbmVt
YmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJl
Og0KPiBodHRwczovL2xpc3RzLm9wZW5lLw0KPiBtYmVkZGVkLm9yZyUyRmclMkZvcGVuZW1iZWRk
ZWQtDQo+IGNvcmUlMkZ1bnN1YiZkYXRhPTA1JTdDMDIlN0NkaWVnby5zYW50YWNydXolNDBzcGlu
ZXRpeC5jb20lN0M1OGZhNWEyDQo+IGJhNWQ3NDk2M2UwODIwOGRjZjFiY2ZjMGElN0M1ZjQwMzRm
YWVkMmQ0ODQwYTkzZmFjYjFlOTYzM2I5MyU3QzAlNw0KPiBDMCU3QzYzODY1MTA0MTE4NTY3NTE0
NCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMag0KPiBBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMCU3QyU3QyU3Qw0KPiAm
c2RhdGE9djZDJTJCUG5UQmdYR1JoR0I4ZFhnZjZBclpJenhrOHVKYXR5blp0V3FXZkpjJTNEJnJl
c2VydmVkPTANCj4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4gPg0K

