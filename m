Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256A0CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:13:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83452.1778613223125073605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWlfOfZF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWlfOfZF;
 spf=pass (domain: arm.com, ip: 52.101.65.0, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EYKvd5WB9H4zBYsyOt8ecL4bsLGVjAYhYPlYBK7QouGRLQM+VmMjIhiwQZxAGAbG4X1ZF0FSX5yGd2zaiTdJCG9JIt2hr7e7mudJIhLFADxYbbi7eNfhmiWBhX0sawf6U0lA3g811Pep1XwvwR+O011RiIbcC7jg05T4Dh3PtvRNnsaDqA3gTJxkpwGBDfkaH54WSY0wg019AYrycB1XNX8UEnkg3w6rvxAzYnZX8NwiIebyAvXPIJ5YqeLuKo5RdRl6UtlXjf8dpqoaO+8RlPEDeYjhebkhtpTQOXPwzKzGoYOseK43xBnEY2HTvsHmrEKDAWxFPVbQrVHXQD9CqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWlzBAf1vjgBMqbGZkQqATdA78/UnD/XJmSP11RfRJ8=;
 b=SGDIyeb9H/KVR071hxWquDjEOe0wpcREHPWevmvnJaLK16g08A3A3fG1pZn8Qv4x26Z6x/+tqRUOggQ8mfOyEMtpiO6mlTTQ0DhCuDXBo6O26ZdahaBBEGbVQX+yxnSWBufEbGxwi3dSxtPQBAsPTV/cOQrfCcO/iP7wEYyezUdG1R9EcN1xwi1gvi+EtfiIZ84O9roJQ1JoO41zviHgKQq7lFKwV9jTGMGZ60dBH8KSvKJo/qGtwTKTxWgbISHGw6K1QPw5ak0bIHE+k3QkL69BLC039zTTLi2VsikodBqdQp4WUAPE3tyJYk2Tz5VL5jShgWnHYEdRuBAhoDz1PQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWlzBAf1vjgBMqbGZkQqATdA78/UnD/XJmSP11RfRJ8=;
 b=WWlfOfZFvzG14e9usUNIp8Wk1C/PsEA4fLdHmH24+gEV9jlJqi+mgg09pam9Yqm3U07311AIH88F7OE71BTazusU1QVxJYfVULKMU9TfEszZndMREq+oJeUUyMV5fZz6WaAcXsVhze0YNB5MNIQngOK1qReYF8M21pT7sfxgm1E=
Received: from DU7P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::19)
 by AS2PR08MB9986.eurprd08.prod.outlook.com (2603:10a6:20b:649::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:13:37 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::9e) by DU7P189CA0019.outlook.office365.com
 (2603:10a6:10:552::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 19:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 19:13:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euNhZtPbHvvTkpowKU5DpprPdbMviw5sVkg/FP2KWHMhTg7QmUzGEhq6L8L4Ja3naGp4iRcID+f9V8H0awdOiVUQ/GeWIN+Wer5xHlFFd1ySMmWsKuQxxp2R5/zPiIHltJT+iRFYc2GolUz+yhHTjuT49F8J90we69GrSG+teqLVY4BeWxm858AlHoH/1/zMA5ErxKicz/CjXcTWzpHBIpHWxslLghhA8dNJAEzIGbZZLv18bna4GZprQeUAPcKjUDWnITHZjV1j5hvt/Hl/nz0v6MBq6hfFYKhl9ZQMDwwDh6DPDXpYuXFPj/W1NOBYtZop0QFY23vyoltqqy+kZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWlzBAf1vjgBMqbGZkQqATdA78/UnD/XJmSP11RfRJ8=;
 b=dMtNyWYM6bWlRyMLrtIaPvwvVmGyYOnI1ZTnB64wJ3W32wi4Dno7lJNEBkh6LN4lWS83+aRrt05LbTFXNEUQlrl6pjsbK4nkJwtE6QFAkDp1en/gIJoNJyqk8PriUgnf4IioqLSxFl4fUGgPVBYC0KldmYNH9Gu8suYLQKZSfWZKMe2gCAP+07rkPp1dc2YbNVabCDsJFFJngEKML4zHXQyXb+Rn8S3nuIYXBWRMGGEGoF0V/YQ+uez2tvfBWe/FcJTpazQwIT3Ux3KGhILDMu8X8zG0T+31ymjI48uKhbMkLO7cRh/Jcpspw+19Z8PqRZo7LDsmOeXBFWwqAqo6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWlzBAf1vjgBMqbGZkQqATdA78/UnD/XJmSP11RfRJ8=;
 b=WWlfOfZFvzG14e9usUNIp8Wk1C/PsEA4fLdHmH24+gEV9jlJqi+mgg09pam9Yqm3U07311AIH88F7OE71BTazusU1QVxJYfVULKMU9TfEszZndMREq+oJeUUyMV5fZz6WaAcXsVhze0YNB5MNIQngOK1qReYF8M21pT7sfxgm1E=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB7628.eurprd08.prod.outlook.com (2603:10a6:10:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 19:12:34 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 19:12:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patchtest results for [PATCH 2/5] libportal split out gtk libs
Thread-Topic: Patchtest results for [PATCH 2/5] libportal split out gtk libs
Thread-Index: AQHc4jdCPWpaKO/v7UeYo3D4/YoqU7YKwhgA
Date: Tue, 12 May 2026 19:12:34 +0000
Message-ID: <33420B02-22C6-433D-8653-50C48560C80F@arm.com>
References: <20260512173702.4114193-2-ross.burton@arm.com>
 <0101019e1d4c08b3-1cbce957-130b-485c-a707-8cb48fb14c3c-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <0101019e1d4c08b3-1cbce957-130b-485c-a707-8cb48fb14c3c-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB7628:EE_|DU6PEPF0000B61C:EE_|AS2PR08MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e78691-9715-4451-ac9c-08deb05a91a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|38070700021|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 cPawwZxJ2HDP8FJDM/qrbKlCV4bvSB7toXKLPJydiJE1xb68nJvh/b4zf2Ru7XZf8K7scxrWftUOp2PzPZTx/vukuSkWfrUj/dLu+9CIu489sMr45OPPnseAwPZ86pRhQ7oa81sXnSt2is4nChwf6SY4NlrMcs6HUzYFcKjF26iWTMLwWIeNKF7QBOa2LqN1mJUdb3/QnY3+Gn7XlXlkyWnaQ8EmeH4xHdzY355gggNtaNJ231gFqg2tZx8BsYS1P+RBrkeelkxdp5u/qT7VeOIT3Iffe6jNsLywSYJSYgHxPvZVMugc9bifI2/VJGfTi1k/A9azGFnhVWBq6dMQeduZmysiOHsoNzrZFhrDxZWUnYRHnRWOteNOZPUgJfBVrTsd1kP5Z/7OUvUG+uFlUwzHlOhVr4hliP9Ytt1jz3LJcDQotgqxVrKGfYNjxqh2iOrNl4F499i0hBwyTVaU6T9Zb7fHgYp8zaA9mwifEPo7NNwvv2rAx8pS5ifWIHl+SgcB1I89/pB4sZBBg9qtSlvMzG/xu4RjalIm1Wkrx0OS0pUzpZ0foNRCVqM4sJIBiQYBUwTkX9pkdjGXOahcCqQKzCFM0zsJaU9gi/K28vw4Z8rjBEX/+oZHZ1v5qb5Xkhx1njJymX2bkMs9KFF6R71xHT9cnTf4n0onWKBscX3uI32iR4bGUbg1sp+SEAKi
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(38070700021)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <62111E15DCC24E47906933F9C0B4F3F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 Y0Zg9XcTkDW4wnrwVJNFTMc86oCdqSbiMiw0AijwkUptckU1lx5mBWWXAZS/h35N5wRC1ZfxJgfNjxuqTxE52YnfO79T2Z7Z7m5Oad0zqkeQRiLQzf1WfIuQbV8vsZ9j0f2kdRtOnhgS60z1DrSLcwPprSDJNhWaNQ1t14p/Xh2eEhw2n2CcieOkeUcE5mK5M8mFflKqUYMF5haQEmE3ZxeSXYDXzOowZ5VT4HC9sSzvJJIyYOoOL7s71VsmZPX8PYJoGTPLFSVXwJ6FypKodFhd4U6MMVJuwKvZG2vhM3mWvcwRHSSQbBD2ATSMUOx47suZp/vo9jrTna/DGrcRkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7628
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f713a0a-b2e7-4c87-6792-08deb05a6c3f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|36860700016|376014|1800799024|13003099007|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	bAiXekKk5qDlOl1Szd/fHFpBgLqt8boiw1v4eDTzc3rZFgvSwV9VPHw7sMwVlu4u6ivAdwCbVYWlGN31KcQv5vdCWTrCcbwn+y2sEYWPgsmpTeKpkN1EM7wyT3Cj0EgBz9tNPbHiJk9V5c6Xoa8xiLgILZL/VFBPJQRMhUH+KmF5zY9unDuhEBQGzVVf0FIE7lzGzpr/PzgnixuQzGUoxgiSszS85caIViuULqnKzQiomJeWreP91j9w8uzxqNqDnmeo7Hv4bxRkS2dcNCgnQMFTjS65DwBoOug8Z6jOG21uSHx5SWLIuLdg02BY6CV8HBr6B0ahEQEUxd2Ue8Y8CHaAYpvEsGu0VBe0cc+PPWWrxNc+igkDauPWF49jNzLVVGS07DkcKpeB866y+Uq8m6qSxsof7qayE6rgB1/U50IcmlfoQUDRgQ5yRZf6IgT3Js+W0Eg6PJwVvdy/EbzWjRDbr12wsFCSCSjcVXjqg8HljT/pJ93Sb2e5K7Il/3mNMaEVM5+9rufVx/KJ74QYaUafa+PIMEJRC7fzlzC6awF66ruGf802r9dRbH2JOnG4LqDPwKHT0eWWSfqVXduGUKy/wrJ5wWe0sofihjW729DucxbHAjfL1MmMEjgBKhMhVmN3d920zZZ72w4G6tdcR7mjTkUjd/WNmNyNYLM+21Un+WgyM/aiFDV2zZIEd87i
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4jl0GPYp+Sz0FBzFuGiAlU634PgDiI21WHTGvWkl48pYNcMkjQSHQWHx60PAIegXLF6Ezqg947MO679hRvFwiMQeK8fgmcbs1p4ROe6GkyrSgN3INjfoNbeo7uhOcRZmykZV3HHDMLrhivMsTCzNhkcHBnPkjMcmIg+nVZW7H4eQoobWMpVdQ5Tm0y1stXDlI5HGuG2rcX27eVVzsOTY+Qon0zdrVvVb4adLD1q0hSA1De1OZfDG9Tkwa0PrBIiBPnArEWA/mJGzL+LYA9Nm3lG8k0IBlBiESrN+Bys0TTU6Tju+PtMrxilarkQHT0eF+iZyd7fYSbFS3LkT5Lb6clSgI6rbmWbWmzNbNP6vYC5wMMX+steIe0g0gsTJLt9PN0cxxfLbx/F9Fp8xEpJIS3+YNAKoZP0FJZJSSa0CgURqb+icKh9xjsWjmW1vzdv0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:13:36.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e78691-9715-4451-ac9c-08deb05a91a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9986
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236910

V2hvb3BzLCBmb3Jnb3QgdG8gcmV3b3JkIHRoYXQuICBJ4oCZbGwgc2VuZCBhIHYyIHNob3J0bHku
DQoNClJvc3MNCg0KPiBPbiAxMiBNYXkgMjAyNiwgYXQgMTg6NDYsIHBhdGNodGVzdEBhdXRvbWF0
aW9uLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgc3Vi
bWlzc2lvbi4gUGF0Y2h0ZXN0IGlkZW50aWZpZWQgb25lDQo+IG9yIG1vcmUgaXNzdWVzIHdpdGgg
dGhlIHBhdGNoLiBQbGVhc2Ugc2VlIHRoZSBsb2cgYmVsb3cgZm9yDQo+IG1vcmUgaW5mb3JtYXRp
b246DQo+IA0KPiAtLS0NCj4gVGVzdGluZyBwYXRjaCAvaG9tZS9wYXRjaHRlc3Qvc2hhcmUvbWJv
eGVzLzItNS1saWJwb3J0YWwtc3BsaXQtb3V0LWd0ay1saWJzLnBhdGNoDQo+IA0KPiBGQUlMOiB0
ZXN0IFNpZ25lZC1vZmYtYnkgcHJlc2VuY2U6IE1ib3ggaXMgbWlzc2luZyBTaWduZWQtb2ZmLWJ5
LiBBZGQgaXQgbWFudWFsbHkgb3Igd2l0aCAiZ2l0IGNvbW1pdCAtLWFtZW5kIC1zIiAodGVzdF9t
Ym94LlRlc3RNYm94LnRlc3Rfc2lnbmVkX29mZl9ieV9wcmVzZW5jZSkNCj4gRkFJTDogdGVzdCBj
b21taXQgbWVzc2FnZSBwcmVzZW5jZTogUGxlYXNlIGluY2x1ZGUgYSBjb21taXQgbWVzc2FnZSBv
biB5b3VyIHBhdGNoIGV4cGxhaW5pbmcgdGhlIGNoYW5nZSAodGVzdF9tYm94LlRlc3RNYm94LnRl
c3RfY29tbWl0X21lc3NhZ2VfcHJlc2VuY2UpDQo+IEZBSUw6IHRlc3Qgc2hvcnRsb2cgZm9ybWF0
OiBDb21taXQgc2hvcnRsb2cgKGZpcnN0IGxpbmUgb2YgY29tbWl0IG1lc3NhZ2UpIHNob3VsZCBm
b2xsb3cgdGhlIGZvcm1hdCAiPHRhcmdldD46IDxzdW1tYXJ5PiIgKHRlc3RfbWJveC5UZXN0TWJv
eC50ZXN0X3Nob3J0bG9nX2Zvcm1hdCkNCj4gDQo+IFBBU1M6IHRlc3QgYXV0aG9yIHZhbGlkICh0
ZXN0X21ib3guVGVzdE1ib3gudGVzdF9hdXRob3JfdmFsaWQpDQo+IFBBU1M6IHRlc3QgY29tbWl0
IG1lc3NhZ2UgdXNlciB0YWdzICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9jb21taXRfbWVzc2Fn
ZV91c2VyX3RhZ3MpDQo+IFBBU1M6IHRlc3QgbWJveCBmb3JtYXQgKHRlc3RfbWJveC5UZXN0TWJv
eC50ZXN0X21ib3hfZm9ybWF0KQ0KPiBQQVNTOiB0ZXN0IG5vbi1BVUggdXBncmFkZSAodGVzdF9t
Ym94LlRlc3RNYm94LnRlc3Rfbm9uX2F1aF91cGdyYWRlKQ0KPiBQQVNTOiB0ZXN0IHNob3J0bG9n
IGxlbmd0aCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfc2hvcnRsb2dfbGVuZ3RoKQ0KPiBQQVNT
OiB0ZXN0IHRhcmdldCBtYWlsaW5nIGxpc3QgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X3Rhcmdl
dF9tYWlsaW5nX2xpc3QpDQo+IA0KPiBTS0lQOiBwcmV0ZXN0IHB5bGludDogTm8gcHl0aG9uIHJl
bGF0ZWQgcGF0Y2hlcywgc2tpcHBpbmcgdGVzdCAodGVzdF9weXRob25fcHlsaW50LlB5TGludC5w
cmV0ZXN0X3B5bGludCkNCj4gU0tJUDogdGVzdCBDVkUgdGFnIGZvcm1hdDogTm8gbmV3IENWRSBw
YXRjaGVzIGludHJvZHVjZWQgKHRlc3RfcGF0Y2guVGVzdFBhdGNoLnRlc3RfY3ZlX3RhZ19mb3Jt
YXQpDQo+IFNLSVA6IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVzZW5jZTogTm8gbmV3IENWRSBwYXRj
aGVzIGludHJvZHVjZWQgKHRlc3RfcGF0Y2guVGVzdFBhdGNoLnRlc3Rfc2lnbmVkX29mZl9ieV9w
cmVzZW5jZSkNCj4gU0tJUDogdGVzdCBVcHN0cmVhbS1TdGF0dXMgcHJlc2VuY2U6IE5vIG5ldyBD
VkUgcGF0Y2hlcyBpbnRyb2R1Y2VkICh0ZXN0X3BhdGNoLlRlc3RQYXRjaC50ZXN0X3Vwc3RyZWFt
X3N0YXR1c19wcmVzZW5jZV9mb3JtYXQpDQo+IFNLSVA6IHRlc3QgYnVnemlsbGEgZW50cnkgZm9y
bWF0OiBObyBidWcgSUQgZm91bmQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2J1Z3ppbGxhX2Vu
dHJ5X2Zvcm1hdCkNCj4gU0tJUDogdGVzdCBweWxpbnQ6IE5vIHB5dGhvbiByZWxhdGVkIHBhdGNo
ZXMsIHNraXBwaW5nIHRlc3QgKHRlc3RfcHl0aG9uX3B5bGludC5QeUxpbnQudGVzdF9weWxpbnQp
DQo+IFNLSVA6IHRlc3Qgc2VyaWVzIG1lcmdlIG9uIGhlYWQ6IE1lcmdlIHRlc3QgaXMgZGlzYWJs
ZWQgZm9yIG5vdyAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rfc2VyaWVzX21lcmdlX29uX2hlYWQp
DQo+IA0KPiAtLS0NCj4gDQo+IFBsZWFzZSBhZGRyZXNzIHRoZSBpc3N1ZXMgaWRlbnRpZmllZCBh
bmQNCj4gc3VibWl0IGEgbmV3IHJldmlzaW9uIG9mIHRoZSBwYXRjaCwgb3IgYWx0ZXJuYXRpdmVs
eSwgcmVwbHkgdG8gdGhpcw0KPiBlbWFpbCB3aXRoIGFuIGV4cGxhbmF0aW9uIG9mIHdoeSB0aGUg
cGF0Y2ggc2hvdWxkIGJlIGFjY2VwdGVkLiBJZiB5b3UNCj4gYmVsaWV2ZSB0aGVzZSByZXN1bHRz
IGFyZSBkdWUgdG8gYW4gZXJyb3IgaW4gcGF0Y2h0ZXN0LCBwbGVhc2Ugc3VibWl0IGENCj4gYnVn
IGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy8gKHVzZSB0aGUgJ1BhdGNodGVz
dCcgY2F0ZWdvcnkNCj4gdW5kZXIgJ1lvY3RvIFByb2plY3QgU3VicHJvamVjdHMnKS4gRm9yIG1v
cmUgaW5mb3JtYXRpb24gb24gc3BlY2lmaWMNCj4gZmFpbHVyZXMsIHNlZTogaHR0cHM6Ly93aWtp
LnlvY3RvcHJvamVjdC5vcmcvd2lraS9QYXRjaHRlc3QuIFRoYW5rDQo+IHlvdSENCg0K

