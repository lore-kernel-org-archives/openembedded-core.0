Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755DACD4F52
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 12:17:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7017.1779106656511056580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 05:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DGQl13rB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DGQl13rB;
 spf=pass (domain: arm.com, ip: 40.107.162.64, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y6eFR7g2/m0bPiFqjxscRDLHgIWlIcA0UY4L8Pr6MP1YlumPmfdyIxjlWPQKbsjf5URE94NckIDQu0C8ceYwhonXEOnWe3gSzd7zGJ2Ore89UcU+z61zn1C9txPozhddevWP12LlBrcq2tniM68nPViUC/sTJh+meS7VBAUCP6htDJ5BTLkNVjfPJ892Db++qTliWvjjMUqHMhRNEjqL4iaKY/bcmuXAk6809cA1ONW3uNtoS2RFdjRkLQgWGFbowJbrFyjNBUZFHkZuUDxJaE7VuBUVTxUhbf6eLwl07kGP4Rx5MROKtj7CsAnQ7qasyaMsTQ4uSfnicxm7gyb0IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCsjaGgpn2/FwOg2H/Ru4R9jbiIB7jP3I4uuT5Klt7U=;
 b=S35PZWiDzr2hBDEP84gHosGKgZuzBTICnanGg1QD43jkwTxZx3hofmgACin3Sh8WF083lpKUFXP4bebffQHxjccvWNaT9R8V8PDP/W5BNwGAjPPhITTpR/K8QN1im2c8FxpQ+S3JwRWnevhwuVda6++RaKewQpJ/rUeryZ9t+nO+YDYKLSj8mEsj7MPFgystvARZyyAUXM696xgwct1XJdW+notHwoEb07uaHQlTlj6S5p/0uTCNneSM8Y9eitMASsXKT5Z1lXPoQK2U4Go4K+wBu8tqlhxmWc92yAT9HKwW4NCGarGf2jxtlNLQjidiZPx5XyJRL5caOfH8eypkhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCsjaGgpn2/FwOg2H/Ru4R9jbiIB7jP3I4uuT5Klt7U=;
 b=DGQl13rBWo1n2gqpE7Ms1iIr+QZF6isr/kxh7RgRItGjTX/Wdogfwjy4WQIk8q7IwLSzDbIqx3OtncFzv6agLczC3JuArXOxHE/d5mHUMyNnMNbCLwUDU3MKt28lKhPMlHhUyrpxQrUUA+h/PN91ZW2YPARjzNVXblMu/PWIIk4=
Received: from AM9P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::21)
 by AS2PR08MB9022.eurprd08.prod.outlook.com (2603:10a6:20b:5fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:17:30 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::4c) by AM9P193CA0016.outlook.office365.com
 (2603:10a6:20b:21e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 12:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Mon, 18 May 2026 12:17:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOt49Vuv17G/sdCr2CEOSNLYmzaVdcwgrfwy61kMBGmUr/fmKxyS/+c9KLS4qXo7FEWZXNDByn1pHbr/dNLVebw4Eu3gnksnh9ng+pypTzhkl4kqXRZcykDYmCmZ2kkzHFpzvXp0qfC6NF4Ax3pcYrVC0RQprkpP7rRtB74fHOluMi5k7pQuZ+NGf7PdwrL/qUDxbXktGxa09/kMofQq7eqpvNkZjZGVwHTR+cHH3AI6IrE8CKbghqH1FycDItUJ/lP2N9vIPzn3ST+DU2lcjPmt/r/nHDCXue/vc9blrY9F4wvB8OVxEwlWoqDgnZmI4T65UCHR3ZhxnNeMg2k9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCsjaGgpn2/FwOg2H/Ru4R9jbiIB7jP3I4uuT5Klt7U=;
 b=IfCwE82VAXk60ra7oS3C9hpDVKFXQzGBV6twiZGPvSGPvkpSWn4iK0WIWsZ2HvG98wd5632RR3Xqhr3tx+cst7Vb6SWMWjD7SZ1mmLCYnVN9VXDO1lijenj3c6KaEz5GAJFwMm6X/dExBYfJS5TUGXZvldzWYM6eyhqFJIe72aJkIWnTfu2PbwoRsH4bIY1dW9WIp1cg5+ZJaYYeujOeQh5XBONhyLJ/H/7YbyuwAhxse7Lh6atkHZsYj8SURlYQEKnV4CfjFV7IxoPjP1gBPf79RykLziiYw9TfRI6s4GOptvnx2asIzpsgGp0z6bNYdR6WxZ9mzCPCjmASVBY3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCsjaGgpn2/FwOg2H/Ru4R9jbiIB7jP3I4uuT5Klt7U=;
 b=DGQl13rBWo1n2gqpE7Ms1iIr+QZF6isr/kxh7RgRItGjTX/Wdogfwjy4WQIk8q7IwLSzDbIqx3OtncFzv6agLczC3JuArXOxHE/d5mHUMyNnMNbCLwUDU3MKt28lKhPMlHhUyrpxQrUUA+h/PN91ZW2YPARjzNVXblMu/PWIIk4=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by FRWPR08MB11678.eurprd08.prod.outlook.com (2603:10a6:d10:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 12:16:28 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 12:16:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Topic: [OE-core][PATCH v1] libxslt: add ptest support
Thread-Index: AQHc3Tm0hcd0bYCrN02MQQP9mYS9ebYTxc2A
Date: Mon, 18 May 2026 12:16:27 +0000
Message-ID: <901B1CC5-1D3C-49F3-9BD3-BA18871B4D02@arm.com>
References: <20260506092057.27057-1-pratik.farkase@est.tech>
In-Reply-To: <20260506092057.27057-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|FRWPR08MB11678:EE_|AMS0EPF000001AE:EE_|AS2PR08MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: 0100aa5c-d4d5-449b-2118-08deb4d76ee5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003|3023799003|38070700021|11063799003;
X-Microsoft-Antispam-Message-Info-Original: 
 /75/Y0vCqdDUF6lNkQTiEje93POxNPHjltHDbCVFcYBILwIkvgT3lzG6oco4tsyaamZ2q6kdjoC7n5X1NHELA8GnKfSzvRPjmkce31fJBKuxp0yC+vN9SKPsSInY8Pq8sRdMS4yVNm+uCYdq8o1rFO0AVDhr5DdbrMF7LNXixGEiVSKHAIK0tw0prXF3Qn97z2wHiRHkGZL+sax8PdQ9gaHh+AsWjfZZUWiuyQhxuAJeePyREH4HvwTOwvn6Yy5q35vxuDLOI2jIKdYAxxOu0GGuja0AR+l9b2XPZkfXs6U0swB3p4E4jivoV7LY1v6NNNfG0ErkFas8ELlbu937kcgAkPn7FVtGmMyoA7qyb0C77tOZSzKYuT1UMhY6TYv8gel/igcIZlJkRNacMxb86eI96KdleXx9Va7fak9bJ4ETizm52Mu7IDORZ7Gzj9N8MHwIEYEsRyiqUFh2Ir4PY6v4WtensuGebxHYlCnqv8tl3g3pTtCZYMbpLHPjOmPbFsCgU+/2uMtnkQEeDLK5iH/4tUB3UPoznLzTmrtD6Lhcsf47FYsFO94YkmPfWgemhWlvrMpYp9ahF1O2E/XulhjmJXcKnmqTkdKItNVC+Tt9/5LDgyx1CQb7vgsHWzQ/Om4LMnAJR9BUWb9OPNRYI4wQGvLPnwHvmSZGd9ge+xUmgYNhi+Cr/7lQF9urqZhCnthnA4cPWdLJHxwppaudERCjBNTQcYrJaUvfr4H6cOEEML8E+JOl/QorxaMxozI/
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(3023799003)(38070700021)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29F62432F7EEF4499130A962B1AE520D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 X+aksVdmvv652ysJCFrNFBh11lZXfW57n944FYMgYvueeyvV2f7g3jPvdQLBfKsZCmyFJOsMwEUQRR9iF1wY+YjzTjXwBF+/LtZJ2CsGb1UCf/onFUfMzCP0Q+2+VpsnTRgTzgwr63b59+nxPQqQ26zqUK0+TBa/EZ5JQD7Ja1hl5Nr3N/LPmf0/N0MsDSrdPVwRKPHzYZ1lJq1smIK2t6aHbzj0f3e2a5oo5ob0DH4o3teCzXJ73ugc+viL/u2bRadiPzc/77Dzk62L+iD6Ndj4VryIU2+Kx4+thb7gFUp0wYKikWGMUGXFAeA8PBhOdgzEU/8BdPcvqM22An7Jyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR08MB11678
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f0c550cf-5276-4e1b-50bc-08deb4d7498f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|376014|82310400026|35042699022|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	JzrD45O7Js6XHG1tE2Nkc+mdltb0U8h1u6pDkSVCZpI9IUAQTYmoUbaVGsQqy96x9x08M1RSOHzyMw2X06suLMpFm/Be5+CHI0RlZSJAEQNDRF7tmrFJlRLREDAYRAFUcQokn3VKpW/c1GzYWcVHDt0tgxjJT7IIEB6R97ruG2kFM7g0faf6bYmyF7MmBk0aT8X2M0x24Lad/autsPmWVCugDqhnXImKJdJLezfndEZPHX/3EDYZ1LNlFeG7ukoVDGPQwPug94JTxu+96dQ/HcPoK4MIXqyHx7ndn2lNzl88OyhrxKYjUBnPvnQmyz4mq4WQdPWxoAIuie29Rk1MED+gD+CWJ7aQRjCOv7drB/TzfnLB6wuBoj6imJw6qA31ntgwWfzu00EvTYpI9RXjgekpFUBGvUMMoXHbYnY3awSXFqiq3TSj8zZATs14BE5sbuv0dfmeBLLB8GYdOH7Jz2xdD8JHoK3pvUiram3j/zkDLDNvv1Cxqrq5Q1FUJL+7DyNH4DhUBrnUBmPv00O5PAIn/oGHrTdAw2OUyIA5O2n701/P5H3nWLpyw0MoL3GCKaNYqGw57Qauo3xfpxz270AD1sqaTppXBOK99/5rZp07Fy0MagTwqpGArTVZVBvzmLQSnwgfTyTu4roLRAX+cQUKyahDC59LVtgB+xypqSf/nM1vQd0EqFWDQZbbPWLw2NI2zlrnY6btKdYzq9Ffu4tcOObGJfSOrC2PSv4Bbhk=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(376014)(82310400026)(35042699022)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SVMX2rxITki1LqtX7o4atD0pTba5RE95bwBhHQ6sYhD5gtByIYVg8EQoAnHJM4rs5AYnArJq876Tgh7jSHEicSmNEbT6ivqBWkV2mkt02wzIczFEKtNLpz7vWCHw8+SyAyLsOYaoaHlJXLKEBReZrReEzqBqcN6pX7hr40IhAFBlFm8wHQsXh8VnpNczPRm8jsL+cW3zP/CPKuseROLXCnGZ9r3KqDwteopZUtCoHx8k4NUlfSGTPiAylStjJoQ3yQ8OBZLS7v3GLHxpkmff1BvItTqVpruj0kYzavrGhd0hfbHNpbaefxfURSVnsNA1WKpGWu8OBoksTwdevLIYRlh5g/rSbfz6bFIZVO7l9LQvipQEP0ip61rsWby/CVKkK1Hjg0j+1OotMxrz3bQ+qq3Dwb381Cr+ZFIJoX+FBxyzxfFKjGhgBmPiAkn82RPQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:17:30.3506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0100aa5c-d4d5-449b-2118-08deb4d76ee5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 12:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237235

On 6 May 2026, at 10:20, Pratik Farkase via lists.openembedded.org <pratik.=
farkase=3Dest.tech@lists.openembedded.org> wrote:
> +output=3D$(./runtest 2>&1)
> +ret=3D$?
> +
> +echo "$output" | while IFS=3D read -r line; do
> +    echo "$line"
> +done

Why capture the output just to print it all again?

Ross=

