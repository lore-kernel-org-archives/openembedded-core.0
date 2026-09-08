Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11DEC79FA1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 11:05:55 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4646.1788865548819527412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 04:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iax0qrh9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iax0qrh9;
 spf=pass (domain: arm.com, ip: 52.101.66.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iIFMrUwTfhkgdupLSn5pt4envID7YxuPk+6hyaiRt4vr8RCopGlvESxlTRvMlOI+lo0sBrvwtNDd7BGgxfFZxUzNeW21L7ojgV+Ddeh4l2C35k+R567LXbLK4wMEINvCJ5MsrGiYeiQ3DmQ8FXgag2OcM95ZzadruQko+zC0RMcKau94N9Ot9KNVdscqGSPvVr+1ETrVk5SayDzofaMUfPD5TvNLE82E1E9XC+YWhzG7gCJCD/kzGBDUGiCp7f8Mcp/YclTxmRn4L2m8oKo3IE1dpCbEW6DdEDUgal+48RJ9BXJmItprkkh/nE72ZYZluR11gx6Hc+R6hv5wZkwYgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70CofgZBhAXFCb8tYHMWu9L9L3HtDjZJopb0StoRQ9c=;
 b=v1l+SK+3oY0cATk/bfHg0QhjTu8HXts/nK4+0iXwUQHWdYpIEMKCnh8JT0etgke8jIAaCDvPAj1JLewC9q6JMPc3swei7mSYd98tsLXCckpXkN+Lb8QQYyG2qb/PR+L54jIl4nfuD0nK9g9aHT+THOTEEFaTkCKvgGU5KvKFRPmHjPZYKQe5zD3gEhPlTHOgu3d0N4mOldoiArPqaC1LVWRVga7PRYPo2vTeSZ+yKguzpdPEg6A8Uk4CPbGiL4dCho52BUzx3KXCb6iKUpLHRuzSPUg7pr0uP0iJyVall2aqUXedzPQ0WRJQeqb5YfTV8APNMD1UNgBMb2P/HrR9yw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=qti.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70CofgZBhAXFCb8tYHMWu9L9L3HtDjZJopb0StoRQ9c=;
 b=iax0qrh9BDHSE8tQw8xahuB2VeMW0CwBPm65mzalMAXPyyzZBDcndVsIiGkxSOSA+905Z8Gw3Tz1hWjxNaMGUWqwXWK+2BUwRswsQNaTFC/ugHd9sPOk2sxpiIcUmXEZHV73bjUO02VAxIo8eagA32NUKCIyciwIIc19Ba/4br4=
Received: from VI1PR07CA0143.eurprd07.prod.outlook.com (2603:10a6:802:16::30)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 11:05:43 +0000
Received: from MI3PEPF00008480.eurprd02.prod.outlook.com
 (2603:10a6:802:16:cafe::60) by VI1PR07CA0143.outlook.office365.com
 (2603:10a6:802:16::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 11:05:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008480.mail.protection.outlook.com (10.167.240.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 11:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZHCKMDCHNK4wzVokPFYirbWsueGK9DFs8bNGNfLLzOZwytsOHKWCpgFwd7NHpYUF/UVKQt/089h76JLdy4R5b4BWXvHJsITwDzeFKtnxsdtX8SOvFAYVh4Wt02zvUENp6JYtNNiurQnjOB94HhKQnFxVqD96Ot8/Djn6KdsZe/vcWi7f6B8w+5GpJ0VZTQhj4DkvevZoB6yyjXCIoFZFJ9O1FFmFR68raHqqSKA8VswaqErhK7ao2/WtFBapPqyIy8Mkz1DoMj0k8gD7xX+JvrY18PG6sny3C2ZjipWv4u+AKvTpdkRxRDeDB4v0MHKMurFNhRYcRflX9TH/4OsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70CofgZBhAXFCb8tYHMWu9L9L3HtDjZJopb0StoRQ9c=;
 b=N2YXg6B7SozwdHgwGvRCNFvI0Yc0QzDsFO50nukYQXY/eppfB/OLI0Wg77p8Y3hbEJXrBbRpOUqYPPDRI0azGmVytV/60id0+K/13mQNgfZu7a4HRNIZssBJvQHk+yvmMI9CqYgoCLLSzkYpfE7oOe4UrA4LJ2yWVhfT6IdG+qc8l6HMWJzEGP35sNAWhboA2f54VmXiMbqAVrtlRnh45/MK5aisRyrjFnEzCZ+sTwRuGQQh/CPYtjVsEkTXpejFO9aSO7G6caZSZk7MdxGoP8rt5NZUgJ9NVzVZJa9s3LcsBvAK68vNvSvoeCAlmqybOSQVCEuJJ+39KSIRwEj/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70CofgZBhAXFCb8tYHMWu9L9L3HtDjZJopb0StoRQ9c=;
 b=iax0qrh9BDHSE8tQw8xahuB2VeMW0CwBPm65mzalMAXPyyzZBDcndVsIiGkxSOSA+905Z8Gw3Tz1hWjxNaMGUWqwXWK+2BUwRswsQNaTFC/ugHd9sPOk2sxpiIcUmXEZHV73bjUO02VAxIo8eagA32NUKCIyciwIIc19Ba/4br4=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DU0PR08MB9464.eurprd08.prod.outlook.com (2603:10a6:10:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 11:05:09 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 11:05:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wenwfu@qti.qualcomm.com" <wenwfu@qti.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] initramfs-framework: support LABEL with
 root-only udev trigger
Thread-Topic: [OE-core] [PATCH v3] initramfs-framework: support LABEL with
 root-only udev trigger
Thread-Index: AQHdNvmCJcPOPNdW9kqSRR5RPsOuebbEldAA
Date: Tue, 8 Sep 2026 11:05:06 +0000
Message-ID: <FD9EE9E8-BD86-423B-92E6-2CF074B387E2@arm.com>
References: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DU0PR08MB9464:EE_|MI3PEPF00008480:EE_|DB8PR08MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b5d5ad-a8f4-4035-570d-08df0d991fce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 CzOk5PKBWncX8EzDC8VQHoWQp8Rzhn5CL6/7b/ya+vmOBIrVulsQKCgpBaVjILEVYT6oXdY7220hpIB8T3yQ8CYLUe1C5asH6LlKq5rn4wwIl/Mq3BHNDgXQmrOwesAqksxbdYz1vpbH3DkKpVult0Rzmanp1Y5P+JQ/FwVxqDRMe2tdpFC8b9P4twl4ZqsjnArXV6uG7tkoq4Vk9XWyeHOEprA5HML/fRCjzx1rANVxUxgBtM2Lvm5+x2xvMKg8LkrfbMW1sJH/e7yemJwTaugVA1UncdFJIlxR9aExLHyo84nCphS+8Im9xpFDtBT4kkPD8pyO7HQPrEScTYJhAQi8lQ3+sazWykxHvLKA2PjAGx6AUfry9Xf7cSVRGib9igHjbWkJxxry3r7Ing1h87kQfCxN0mat8nZ3AO4KUr0fg0q1lq6CVcpVGoQjXWGk6ixH+I9rHvzW9pJng+Wq0+tj2ThNi/UaTzAPtBYJc3/wD8+ru2YQJi1XTWK+kDozX+/vDryuJ6vpHOCz8hYzo/s6r01bW9BYy4XtfbwuHVpkB2TU2pQyhF4fw9J813SKFlcS/Rr5CkW4pY1jEQtR6O50wrkH5/9pciXKoVs8UNaKPBxLYPP4rBdZqSXTvzPgpahtXWyuHpvhSsKFE207r69U/eauPCF29foWnIE4IrkTS6O9kOB/dr7578blmsQwk5qQSmbUOXt8ElNvrh1toa1AcTELq2fIoMMtWvBGfX4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99AB5DECA471DD48890448A7496507FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 L3JV56K8uMY04Jb+SE3tVn/TptO5NnHbbMP1J4M53H6uDLHCOjdZWdRIQIo5s/Wi+jiXZM9xHg9uM3dA866pfR7BK2nbQZ1xD9M1IV1XyNhtlGjkn7GYg+Hdnr6Wuy5WDy+5wrj7lTF3fk24EpGzZKmWDVOmdaa4KvhBlmZMlYKN6ViQxZyWy/8+tgBPBMPKxqvrc+sYKOX1dF5ndNoyrA3WlAc1fV+6RhdUgdwlmWMJ4weYBYS16kiw/CJaPgcwn8FXowsTZtMUqyeyWJr4/r+8urMx9ZTvVuvRK+IM5/CBFn8/lUq2ifWKTOacZNqPTDKI6BMQHyDp13sFwSYf0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9464
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	95125a24-aca8-4f05-ef44-08df0d990a63
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|14060799003|82310400026|1800799024|23010399003|35042699022|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YJQ0XuDcATej+4xQtL2lJy3yxqj8MbOJPGV+YoWR0jRqZxsDsIQcQb9N5SOtia+DNbU1YWhZi3zwsI9xxbRT9PS402DOyfV7x0rLVotY20aHNHW2JQWm6MkvtT+mmeQmEiPIQq0OZi9ok1+6uglmUxxukczjJrGmojcFkRcMKYJH3yo3y5TclCA26xpPgHMAw7EOe8gAyA1gGueVFlflQIsTgvMCmBIVdU1pqxSjqEHU46RD/8Vjcu7S+zdP5GIAd+oI/quNo+tSJscbGoSdRmLVLJBaawQpK8La0FVGt8E2p+SNkN9v3BwsybJxWDe7b7id1WJKlPMqA5f7EXRBcUWRuoR6rLwm20rvNKEGb5MrQkpvstwsX034KLSKinrLQWbDfxE2ywKOx86UHhb3UlK6PJwBR6ERdygZCEIqXr80aWSQDPzC4qPBsEQ4Ux2uy1ucBrEsB5uRPf1Z3xwzXTnL4dZedRCKqUDWU6dZ8ux7EwvuE9tp3w/dNB3CkwD46mcAxxu8iW1XTkiYNYDj3ASLYU24q+aMM8Y8lI18nBcpg7xnKwHYHs3kODHR3QJ+iQ/7VvrbVxI2lliZGZIo53WDhP7W6PCOA692Rs2YapSqk+F8/0EQmL30opX5xDXGZtkERSvaOsi9ildwJYgT/xM8SJvUAEbdTlbDvUQQJ5joRqQ/con8qbEWlskRrWEGw7G5BBQ6+wymFX7IT8uEHg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(82310400026)(1800799024)(23010399003)(35042699022)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b1L9/kC+bf7gNf+9X4knAQGl7MwaEgITcdCsS9MDPkpHF+nJ1PyoM076C3+A32EBY15iCe0iPp1JDuy9lHIBaUcA5HF6hzOhDWfC6N7N+v2k0oGfLNj1I1HASSeV9o45vGuYgxDsAl8BGRBuN2qVjAJhr4fr78QsU/iPuuV5HmVZ4iZxYA7pnrJCpgEa+cVrkf/i1kuyymGaInuuU4MebsDftt1gUcVuppOHE1DjN5J70kbLZX3M5Gc44AZRdhi7Dj1llyVmPbWCKSok9wTWUs0OW3xMVbEfSTwxv5lldVLfNY0slHKfYZh807p/LUeNGLpC7+GD/KcOfSY1pYnkqp3Sd+U/FG1eyV95O40YQno7EBf2wA0SKlZgUl6krj6leUH4D6GU/OkeVfUXcCHVTTXNbE5SXpgaBz5rqUQJmpKigRob+OyphxmlW0VmWn7t
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 11:05:42.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b5d5ad-a8f4-4035-570d-08df0d991fce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008480.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 11:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245360

SGkuDQoNCj4gT24gMjggQXVnIDIwMjYsIGF0IDE1OjIxLCBXZW53ZW4gRnUgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHdlbndmdT1xdGkucXVhbGNvbW0uY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBLZWVwaW5nIGZpbmRmcyBvdXQgb2YgdGhlIEJ1c3lCb3ggZGVmY29u
ZmlnIGF2b2lkcyBpbmNyZWFzaW5nIEJ1c3lCb3ggZm9yIHVucmVsYXRlZCB1c2Vycy4NCg0KV2Xi
gJl2ZSBtZXJnZWQgdGhpcyBwYXRjaCBidXQgY2FuIHlvdSBjb25maXJtIHRoYXQgdGhlIHYxIHlv
dSBzZW50IHdoaWNoIHVzZXMgYnVzeWJveCB3b3JrcyBqdXN0IGFzIHdlbGwgYXMgdGhlIHV0aWwt
bGludXggdmVyc2lvbj8NCg0KSeKAmXZlIGRvbmUgYSBidWlsZCB3aXRoIGZpbmRmcyBlbmFibGVk
IGluIGJ1c3lib3ggYW5kIHRoZSBpbmNyZWFzZSBpbiBiaW5hcnkgc2l6ZSBpcyBuZWdsaWdpYmxl
LCBnb2luZyBmcm9tIDcxMTc2IGJ5dGVzIHRvIDcxNjQwLCBhbiBpbmNyZWFzZSBvZiBqdXN0IDQ2
NCBieXRlcy4gIEkgdGhpbmsgd2Ugc2hvdWxkIGVuYWJsZSB0aGlzIGFuZCBzd2l0Y2ggdGhlIGlu
aXRyYW1mcyBiYWNrIHRvIGJ1c3lib3ggYnkgZGVmYXVsdC4NCg0KUm9zcw==

