Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCA4C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:00:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8408.1784192401821747138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 02:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MrFw7O9G;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MrFw7O9G;
 spf=pass (domain: arm.com, ip: 40.107.162.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RlD2M3alBGwZfy/CE3x3AYs9R0PiDrf/4Y7PkCgninHWZ+smpBPopKSM7UL6jJUcSe5ZC4vHqLFJSfDRtSsM9W1R1gMD54jzsDs9hpzmvp2W+XGJGTSzq1iacuvPY/rclU2wTWjBvq6K25Wq5tddMovl4r6fQZNl9Fnrq49zIhT7awLnjXTfdSsdnXUiL8zeD0JJ21J4A5VJHnnvxmESzqRFrMUK8XETu17hYxSkJM+vL7Tq7qNNYacl0O8bVGaby7HKVG95QObPdN4DFsahtyom4l7+HJQeBxtNbOdX2jmQErm+3IU/YVwkrWMKRMQnK61jhe8ye4/ECkZST7906A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn4hVPTYgw/SsiGDI1WDtoR1HV9sMXLOfBnK7IqXTI0=;
 b=ZY+WKqesmXSTwECoQOWDopbUuDqARYFJZn2IJgMWrCP6bkYfobZOwonkPzKS8vdTsw7tjdVY3saFmiMQfBWB4Z1m4QP8NVIgbhBl5aZrUalMh1LyoRA5hcuS9Te7Qp4M8m+vz7+X0CuHcgHk0QZLTEVskTqMjkYRUE3ywkC09pYjI4LPccCjRt4Rs3b6dwlYtw4E3Qj84E/J0mTU6kpDMjIUQRPVOVlSPMpp+WHRonT61iagP9/VtUamLYoHPusp5g5vEbu/ZcCn+PIam0CYt1LiWegqTcUv57eXG3qpScR+t5rAcn3TNzwk2JFSidYYRVlcQ+7/+DY7Ll0LqLjW3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn4hVPTYgw/SsiGDI1WDtoR1HV9sMXLOfBnK7IqXTI0=;
 b=MrFw7O9Gy64JPXrYvt4GdPBlrOOo/C2JpT69ezoWlbZifKcGnsa5BBB4KA28jN+PopMeUaYGOurAVC1ixigC0QckHr4AHgVqM2C9DM3HsbuOMA4xtqngk72ThJa0ch/A3uD0Adw20fihuAhJ9nB1Azr5wHDiH20DzOlmdNRU+oI=
Received: from AS4P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::16)
 by DB9PR08MB7770.eurprd08.prod.outlook.com (2603:10a6:10:396::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Thu, 16 Jul
 2026 08:59:51 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::37) by AS4P192CA0024.outlook.office365.com
 (2603:10a6:20b:5e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 08:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Thu, 16 Jul 2026 08:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoQCo/9+2zAKl2+G7oP6S8HaMPytErxzHJsyw91Hv/iHMAN6Mh9aKlRSHOmbSFL3Fl1ZetIEPsRyYhCttp4bCU1Vx7n75HeXLsSjhgbcKWDX3KYf61XnEAPo9CcvzA1cjB57RLrCo2wrkpw95IqzruZPSrgBZ2IxtgKPKI/7phwn+r3bzpu05cwYVRROihP/AbrDaF9DW1lypFg/ghtE0TkTBGpXRKBUxmGi88PPG/bdw6TlsxjlvQU+BUo89rGX6iwMT9pHwcRoUlrD/bUe4r475idVv/3IhzqBDnKv9YzIbBgHXFL94uOIX/QzGGwRsjLX4T9Ufz0LLU/XRtI+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nn4hVPTYgw/SsiGDI1WDtoR1HV9sMXLOfBnK7IqXTI0=;
 b=qHy9SwzAxfjJDwyQBQhYHfH1SyId4F47E65k2KphJS+10p67VfG+VcP+LaHEvWC4oPMpPgOHEpZ5rJbLiPOaEr2MLhtnNvLO4cJZUvYPqmfHzcuKSlgbj5kZIPn9onvLmg184F9kNSUsjznXgeHs1nxVA62K4H0VABUfZF3tJwpG0QamRXkNeSqpEbQ/q9IuVsqcFu3Qp6kFrPVXzvx6TlBzrWX0E7cJLLyeMQuhk/BHWTetIzOeMJN27cYuHenjD5hfj2JTAalc/l2ZlVVx01KtF9Gl/yD573LrsNTkoJvCGcxdm/PxlMVEM20aOh5GEIT9hooXzSssaU/kyiQBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn4hVPTYgw/SsiGDI1WDtoR1HV9sMXLOfBnK7IqXTI0=;
 b=MrFw7O9Gy64JPXrYvt4GdPBlrOOo/C2JpT69ezoWlbZifKcGnsa5BBB4KA28jN+PopMeUaYGOurAVC1ixigC0QckHr4AHgVqM2C9DM3HsbuOMA4xtqngk72ThJa0ch/A3uD0Adw20fihuAhJ9nB1Azr5wHDiH20DzOlmdNRU+oI=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB7536.eurprd08.prod.outlook.com (2603:10a6:10:304::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 16 Jul
 2026 08:58:47 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 08:58:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] pkgconf: upgrading to 3.0.2 SUCCEEDED
Thread-Topic: [OE-core] [AUH] pkgconf: upgrading to 3.0.2 SUCCEEDED
Thread-Index: AQHdE1OpaTBPCUls70ODK0jcQ5d7ibZtOAoAgAKYiQCAAAtYAA==
Date: Thu, 16 Jul 2026 08:58:46 +0000
Message-ID: <F9107395-82C2-4E39-8AB6-E45E98CF611B@arm.com>
References: 
 <0101019f5f238733-986e42ca-2a90-4b8d-bc4d-61f5ac444525-000000@us-west-2.amazonses.com>
 <FCA04DC9-81BB-46D7-82AF-137560376239@arm.com>
 <CANNYZj-UAK3Z7LcMk0_+fLf-jy+wQ8OzJMmr2XR53hT2GnEp1Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-UAK3Z7LcMk0_+fLf-jy+wQ8OzJMmr2XR53hT2GnEp1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB7536:EE_|AM3PEPF0000A78E:EE_|DB9PR08MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b15855-2317-4996-52b8-08dee31897da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|38070700021|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 QlTedrE7938zKEcWoXBAnBHP9l0IcWpf9z2SR39GYacPEkm8nQ0ehR3xtnXyd6kHhG7d83JUUKFQKwWcVg+1ZK8Eo/tZmVmIdQgm6TY6fl304OtsHxr6x2jM7mCBhc5FS5hxbEN3G+1OTMEbwYTABuAfJ79nAmC+ZBpCONxjnbQv8+EDYEmGGnvabce/7Y/OVuxnuwt0KHQtQW5QA8vsh6LWkVbmaLHQvpDYn4nTeKBo4/RwjJ3JUD3sGw4P9VD2tr1hOj+B1l9T8Z7rUIrTYoaYlOPXG5SKUST3RJuAcRCLqC9G18rQRgDovbnbibNRMLMLXmKYT2A/l+dtjSdTJ6bhltHc3dDmX3sreH5ynbQhAdH41c4mrGst8iWbYBtHajVhnPafHidebN8X5exUQdnPl40cZodsZqNjjbkjiHeFRXO+x6X6AwLJJ7DdnWl4qUJORbiKJNxQd10NNGkeC4iVAMClDK0hX8V6I5rqwyXtGDVxMLXr6y34Dk3oH1dx6m5zepvBiWnB/GLiCHIEMbkm4xqnwRv0+q+czLi29qYukPOag2tFCHU2nKoawG/noyzQfkCz23uVT80FzJRSpgXDEeKh+Tw6VM6KdwgA8unhBklEK5xwKFS/ucaquaOb0Wd6npPQZcTJaDHnngqeC2a/HWt8jQgSpjgKCsIqXHlsdjjG0bNRD7jrfIORcOkEpeohkGLV28OOuS8MBwsaqWsfFeKiUD+gKjjnqXzE1Pw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38070700021)(4143699003)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99A5356D617BE047BEC70D1481B9B32D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 UYGy1FUXFLB8wHoq9/dWA/eak93FtNPBfO2kFXItX1YArbTGVsIg46ydhwtC7z1QZzjMF9dX4iYWygVApAGnqdGv3YGXX+NApidLJ8wxFv2rsxF6A4V0CnWRp2k7k6IR98IQ3Hhcfn3vgIP+cEtxG6a7IVXHST9kirQjipWZfpz2wn+Nk2hTmNZbwndHXoAyrn4LtU1MTZnJ+cy1skYwEsiHU3W4zLKbcOQHcdX9ub+JD4OPYR2jw4vcecHLqjDRjO+Z//P+YkkvGBAP+nQm80Msjx96Vjm4C1GlljnOccQ9DrkJPbzH/gVZWyY8QAvKubr2beTOl69tV45sN9S0JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7536
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9b70b54-9d11-40a5-e4e4-08dee3187248
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|35042699022|36860700016|376014|1800799024|82310400026|14060799003|11063799006|56012099006|18002099003|22082099003|4143699003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	0sfAUvndd/In3BhTihkFUe39LaMefEOX2mS3BymLOxzhkj8uS8+XA9z4c+sJWEewraSncyBsJ4UjtmALeg7XKczo9HSgOS2D+jYrryIXP0yM/UAB8U2JLHKILbkJ5KnRzp8A8VnVUrMbirfr7sTpTqTPLb1lWNOUJ0HPldOuNBK0N0uDvefnwVBcWoGaOzv6Q7jWK/dUQL6eju6WVPmMR9647AUkC7vNoPpd3rNkuiKfmcIiN3nLdO7AaK+Azq5LDnjai6lBP6vVU3uE/+MzmWZTWIW6Z65MZy5MHymFGfKJhvCHGA/mYdKnsQgUkPssD97Kv6bvs/AZ+TRvuQdbrrrrr88K7hUQvaLaOTLtwcd8Mmg6Xs7tI29lSymkW3t2BjmAbgNq8/P+0xI6zaEQERqy2PX3ByP2iZMpGPxE3ucMabYsy7EkssjKJHTZik71c/6N4ialQcRvCBQK1KHHq3u95xzFi6Bkh21dE3nX1BugNuv6o0ldYV4FHKxZK970dT9uqKO1Llm7im2TW0aRGlas92lrB+Zl7jUYj1RqZGr/D1nIJtFIVck6xZVQNRZwW+V4LhsHK7JhpEY0Ad5D/o3dbf3o1EwCMtgRSwZSh8ZHQj8auSP6xeQSthXh+2+qP93mXsYZWi4dQOUo916xjLJ7E4r8+IumQs/v39ngG/U8PIUmlgZ+ybJjnxNvj3copltxYJWh0MhNyA6Ba3TLIg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(35042699022)(36860700016)(376014)(1800799024)(82310400026)(14060799003)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PIYRNqpGl2GClIVLf5vKdBfVzo34hxIj7igHPPesQ+pshPc2JTeCYfMCTfJy7pOCDKH5DYuCNBPnjzFmL3cT+9SoF+pdG5eNFsZ1sbdbRl4O5QTDzjzTduft9Mg4hUlQFRGudvrTaambhIgRdOhpI+MN5eHhsVjop11NjVNO1cNMJ09OAX6hmjuIuDUMchyhQKfKBD7MeygePVcyxNGL4Er+OX7ueRR3SWPBJF7CQA7G8RHWm813OJ+bsHzINcwT/WSXkZ2KrN0uJ5racNGW5pHgOZizizqDD/t4JpXQjgUY2n1tL+t6urfUhBXDEibPD/324jAuYQsHVp4JCQiO+leRn2GQU2VE2TpXQTKaDvISxB38vcDN4rGL8qhRDow6vctr+wlLRehjf0o4Kt38wYbILRJa7TDDDtypyQgfor/u+KbFe3Qc2+4wkHbuiAiX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:59:49.9179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b15855-2317-4996-52b8-08dee31897da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7770
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241071

T24gMTYgSnVsIDIwMjYsIGF0IDA5OjE4LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDE1IEp1bCAyMDI2IGF0IDE3OjQ3LCBS
b3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJt
LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IFRoZSB1cGdyYWRlIGlzIGVh
c3kgYnV0IHRoZSBmYWxsb3V0IGlzIHNpZ25pZmljYW50LiAgU3BlY2lmaWNhbGx5IHRoZXJl4oCZ
cyBhIHJlZ3Jlc3Npb24gaW4gdGhlIOKAnHBrZ2NvbmZpZy1tb2Rl4oCdIGJlaGF2aW91ciB0aGF0
IGJyZWFrcyBvdXIgYnVpbGQgKGh0dHBzOi8vZ2l0aHViLmNvbS9wa2djb25mL3BrZ2NvbmYvaXNz
dWVzLzU3MSkuDQo+PiANCj4+IE5vYm9keSBzaG91bGQgdHJ5IHVwZ3JhZGluZyB0byB0aGlzIHVu
bGVzcyB0aGF0IHRpY2tldCBoYXMgYmVlbiByZXNvbHZlZCwgb3IgdGhleSBmYW5jeSBmaXhpbmcg
aXQgdGhlbXNlbHZlcy4NCj4gDQo+IEknbSBjb25mdXNlZCBieSB0aGUgdGltaW5nIG9mIHRoaXMg
ZW1haWwgdnMgdGhlIHNsaWdodGx5LWVhcmxpZXIgMy4wLjMNCj4gdXBncmFkZSBvZiB5b3Vycy4g
SXMgdGhhdCBvbmUgb2theT8NCg0KVGhhdCBtYWlsIHNob3VsZCBoYXZlIGJlZW4gcmVjZWl2ZWQg
aG91cnMgYmVmb3JlIHRoZSB1cGdyYWRlIEkgcG9zdGVkIQ0KDQozLjAuMyBoYXMgdGhlIGZpeCBm
b3IgdGhlIHJlZ3Jlc3Npb24gZnJvbSAyLjUuMSB0byAzLjAuMi4NCg0KUm9zcw==

