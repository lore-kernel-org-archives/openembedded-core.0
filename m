Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B69CCC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 08:58:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34910.1792054714647658113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 01:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FOkDcE0u;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FOkDcE0u;
 spf=pass (domain: arm.com, ip: 52.101.70.0, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GF5TzhH2CGz7ExL1pm+cxw0fy4U+9yxrQQddHbiDi1VycindqW89JfzVqrT/gutKUr9uqOvaHEzHlssn7Pbdfs+BFxu/uFfNuy5mE28A0U8hDYJdp6JVvP+L+nOQkVrJRcRcCfuc8anWS26nxBGAvR9IT6GDOV3zb/AqYX8UeaXcyW6Y92+P+QJodQgUn7iUvPPKq/BuigIjapft/CXrBwnSm5Wppkj/9DdRNSV/6sIAZu/UZR2AAV5SbHkGruSHYwElSBJkB9qphQSOgJiGgtY9SF8M8xpnksqVZ5//mIjmiSQ7yLS+3UVefzOMyBqU/ZJso0QRP3BCROLQ9CSJfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gIIB/yHIQSxTVDziLgRLXzNiiWFykN8FVAsCEYD0wE=;
 b=iAEQuuALFm7lEJnKyWHFLERi6K7MdE5rqLzoE7WNaiCP3g9ZrHQYQdmHjDHRXrBWIwV5IoBslPwwSl81npkl1shgz7V011dgk1vQULjdSyb9UFYkcMK+Qa2K6EexqrcCvTuvxEIHGAECWGyroW3x97yxSRyDIh05/VKgq8AChEcBSViWTL+LPi6FL4jyQOl28a4B9TNHrkJiKSv8MtigeDt4UgnsFdP5V2VTIKnn7q4BwHgSvtfY2cDHEXKY9MLa7G6wnbxG+n04+kEh4Q5exG84rLCF4rON1oGPYuxdS+40HNJfImqZlyz6uiAUAfHZzuja9NcqpObPLhGcaYnLGQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=mvista.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gIIB/yHIQSxTVDziLgRLXzNiiWFykN8FVAsCEYD0wE=;
 b=FOkDcE0umU1wVrSjXdHm0UHqtw8yBLWhiHfEtv0el+Y9v7B9hM+MJVVs4Z5fQiL+bADoYL+OdMtGqMVBDg8szUoVwF7FOKoyZBI1p4/vR/gyeBZoWepeAKYerrAsFbseVT764onKCvx7lLUYcmDO5XNBKHtnqeye9g+NNuyNzxU=
Received: from DUZPR01CA0191.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::20) by MI3PR08MB665546.eurprd08.prod.outlook.com
 (2603:10a6:290:203::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Thu, 15 Oct
 2026 08:58:30 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::25) by DUZPR01CA0191.outlook.office365.com
 (2603:10a6:10:4b6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 08:58:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Thu, 15 Oct 2026 08:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8+Yjaxs4FLzgmtecA1RK+6EkMKka5C1MzD2rpSKyjQCqlyVgm+yYHco86i5QEugO1in87lN4P8EWH5vrv+Cg8IqXz7jpfqvPpuQTzsQJCYv4Wh8G6gLQOwehavTvikLGD43h8PpejdBQR9hJpd/wDB4V7FCGg/vLyFLtZ8OS8xWgLC08K6Ga3BfxYie3SJHZv2D+4yu97sBNuKvEkZgpcV2fNmcMlFJlojNwFGJs7wmfuAhZT0ovrrfnVpZ1zOItpv9MmPaGQNYeU5EYYeDOt5ww0dHSZFKsDTlfMbKlMfNgGFGnmaxDq8clqkW1pAaLG/aVTBp17ut1ybzFwWCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gIIB/yHIQSxTVDziLgRLXzNiiWFykN8FVAsCEYD0wE=;
 b=KKuvDZIzvCeNEXIVPzXuD5uUsb7LfLgMa3RKNXd679HFpgAtXOsMn+D3njhBtuvQniGpvV0CKvhx3sV8xl+M2cWjNdzBPkXfxRHfG7GEKvh5Ax95tpZfiU/JexPBgcHO87chIIZRlyCeN1BUNbjas4OXCpx1F6v7m/Us4wEy60npZnbLyZQO/8nltf1Vj1p9BECCZsHRM2wa7d3UiHdviO1UindSZO8+s9tA8T4bZLluj0K8ztL1fpoCLHEhlzdIXiL5MzF9NXvIY1/FBa76I7rRLKZv7wYkvGKlXtdyMIb7pl0Vmxxpy13IgTUfJd+OJhVJCbJmOTUK9q+HbA618A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gIIB/yHIQSxTVDziLgRLXzNiiWFykN8FVAsCEYD0wE=;
 b=FOkDcE0umU1wVrSjXdHm0UHqtw8yBLWhiHfEtv0el+Y9v7B9hM+MJVVs4Z5fQiL+bADoYL+OdMtGqMVBDg8szUoVwF7FOKoyZBI1p4/vR/gyeBZoWepeAKYerrAsFbseVT764onKCvx7lLUYcmDO5XNBKHtnqeye9g+NNuyNzxU=
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 by DB5PR08MB9998.eurprd08.prod.outlook.com (2603:10a6:10:489::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.6; Thu, 15 Oct
 2026 08:57:57 +0000
Received: from AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb]) by AS8PR08MB9410.eurprd08.prod.outlook.com
 ([fe80::1f2c:bae7:a4d3:fefb%5]) with mapi id 15.21.0546.006; Thu, 15 Oct 2026
 08:57:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Vijay Anusuri <vanusuri@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Topic: [OE-core][patch] python3: upgrade 3.14.7 -> 3.14.8
Thread-Index: AQHdVwOq0F6jJlZMqUakWhdNdSrGZLb07/yAgAg8NYCAACV3gIAAv2cAgABHZwA=
Date: Thu, 15 Oct 2026 08:57:56 +0000
Message-ID: <C192710E-7C15-45C4-B754-FE87B19E8EF7@arm.com>
References: <20261008090135.1485765-1-vanusuri@mvista.com>
 <DM070UI0TERG.1A3WINVYE19HJ@bootlin.com>
 <7E3E512D-59C7-42EF-896C-257A336EFB0D@arm.com>
 <60CE1C5A-B892-472C-8F35-848E8D0C4791@arm.com>
 <CANQUz18J+UFKBu3t15b9bUyyj3BkCY9ouofUawG0uVKT-25Sbg@mail.gmail.com>
In-Reply-To: 
 <CANQUz18J+UFKBu3t15b9bUyyj3BkCY9ouofUawG0uVKT-25Sbg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS8PR08MB9410:EE_|DB5PR08MB9998:EE_|DU2PEPF00028D11:EE_|MI3PR08MB665546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c092046-280e-48cd-63c0-08df2a9a7bc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 lK9e83IFRIUOLQqR/4qTo4dAUgVlsmACXGzUZqI+AETKZSl138ZQ1OEmcMcl8n/ydxlWxjqJ8IZHmdqH2qRfjOdAfN6K20s+VE8ulA7MA2SCPecSNMJdCESzhi6HmkqkTA7YnDuDXLVkideF9QwalAH17j4LrbSJzWMUa6XG4ElXrW3Isa26zvAclvTl4JwQ0kCKrN20qqPhzkUBfWVR7wuWbZGfP6u5fPDmnFZIqP0E9B54op8l8mLyPbvRDxnLaIVX+7s/KSGjfD6K0KNcMVk6Pq+ciFsrxQxfuH9Yl00SfeDpSv8IE5ZPNeSbZyhj7hGMykry3NNSuiBDYANMg3/geHzzW96QWIbCRogn+reMRsRJzHKSPSMHzGMUMpxPB3aeBEQDIc6VmD4PR8zf0Ec3/D8wLmZ0mofF/wgDzx1wJBDvg2++YcOdsuM3zLpYwBZmuAN25bgZUUTYUTdGZ4pf11taW0y8bjwuDKOa6qR6yvCrtb+D1glJOtWzGsH9FV1bOZ3AqXqVagSJ6pibyCWS8kJhYJdirPWMa5CxJuxpkHu4Ds2zZqHipX8FOYQ2Z8XGx2E4uQvvejpu0QM7h8omc4UHjZ66hdWf6VeK1kcJHxRWQ+M6LAqP3aNSuUatImzUuMvHJ27Jco9K3knp21X+2DFVbG8TtFk88n+RoOAdEKK64aj4gNGLhKPOiq6/j+l6JSkwMn7cI8arCHlN1cf7PZOjzv9aHT/2WZt5RJ4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB9410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED2BCB393FB2D94C96CC5BA12C8BF28E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 hKlWHoSOtDd8kfnMZKS4e8NPlENKmL+DwC5IBBCfJXt9kURQ8P9+xHnz16y1u6Fb43Ae3TlxJdS2FvEeJFUGCeOqvY0A2vt3vTXIAY2v7ZMGwhGYAavot7UTZoUD9KuNsC2eBwbSj7ayxCCO8UF5XtICGhzI1CrnCowauJZrC4YR4i8gemTpOm5eX8DzetiiWCgIOpCnDRBzWbs2VzcF97RjkiDWc5+thV+5TUy5JvO3yT2u6UjiGNlELnAuksp8NW54CUH1EVDxZ+e/deiu5sAV/USRhkP3beho8phNskUaRxo8l4nvDaVcTjVo09QGFKdoGy3St+NLIVXUbEy5mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9998
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	52574852-539a-4a3d-d8e1-08df2a9a6805
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|23010399003|36860700016|14060799003|82310400026|1800799024|56012099006|4143699003|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	u9QJnTs4ArHiFvxmM5r0/gB5SSxbmLRu+5qJ5ZZjWPXwUM8INV9/v8as37HbDCaS+DPUBRP8x/ukttZbzgDKNAUrH/FaUQO1ndrLGDzJJqlRAmtZ8dGSh361e3Dkf7H836WtvFtDtRyNeEmKybZD3YxXA/2H5bvRo2RTPAcbIEi0mpJaoTNo9Xt4fpfnsVLy72sTM3cAY3N1p/GvU+9FI8Cw3x+E8GL10+MrhOSVPY0om+641TgdRAib0T6DLktABoRjINL6/MMhOT1OaLjo579F5wTlWBLVmP8OU6+MH6+srrP2Yz0Y36HtHOnKzgwehQcE/ehRW0FbMiMwWdhSlEZXC2GMdCbF+6CxKpDAgDYZ9yBK4oSbcEmV12WUxoaCq92nz8AXdy0QReL02vteJpNmkOzEMbZ1ZVnic+H39Qwlo/YRYjrJGt4E9zP9+WyW7f/nuqPfe0jTrrWr8yiRZKPGOEL1Zdso0KMuRN7rdkFq6z8g+1ykskAJ8D3nnUVYFjw7IPuy+v4bUnEtB+bn7D3Jmk+xRSw9NvD7rH+YTO/dY5xVFjIanXNXUYatwPAgpdEHz47MvwbiAFHholhn/AvEUutQO83JHW3muZHtXS6pY0tbAJvNgV9NEUYjLwudLAhDxHHUq1xyzC4TTSUtfH/70Il7xoqkQhCQv0WaMbGRXOk8pDUEbBQsfQm2wtbKFmOqMUZwbpqi7JaGnf623Q==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(23010399003)(36860700016)(14060799003)(82310400026)(1800799024)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TbLuevAdI/3N8ZeYq1JGWWHAkdiJlTB/KnAkLAF/DXej1cj05EUuusWsp7QLnwbQ4mcjsrxtDcCHHId5QyfpLkW8x1wsA08aW2TWmmS0ERkEcmwC68I2uv+9QzgeJ+0Rp13cJEPE0iSVWwXRF1sMjdGwKBwYv4cfDwc/Vl1JppGFwusprCnMCjHUNQSncyTH/l5y69Qle+ZJlV4Iqe+p/jn6XqxffF8etGFuZnpXeogBI5MXzcPbgIP4z8Y31J5ilIkgldLMHG/c/Uvm7H6Rfi53weQukMzWpA82WwuHCAZjHmvrZ1p22/EaXCrEe/TFHFRvl16U4SE+A35Pc3MlqztwxDSeOsmENlEJRc2+Yhihs/tX8ktnz6Tc9iOn98Mvv6vUfGcwFfPX6bA6+qJGhTWiOMx/hW0eateZ4H4DRk3/SD7/Nvm2r9oMcZIe8lsY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 08:58:29.8863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c092046-280e-48cd-63c0-08df2a9a7bc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR08MB665546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 08:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247870

T24gMTUgT2N0IDIwMjYsIGF0IDA1OjQyLCBWaWpheSBBbnVzdXJpIDx2YW51c3VyaUBtdmlzdGEu
Y29tPiB3cm90ZToNCj4gDQo+IEhpIFJvc3MsIA0KPiBUaGFua3MgZm9yIGludmVzdGlnYXRpbmcg
dGhpcyBhbmQgZmlsaW5nIHRoZSB1cHN0cmVhbSBpc3N1ZS4NCj4gDQo+IEkgd2FzIGFsc28gYWJs
ZSB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZSB3aXRoIFB5dGhvbiAzLjE0Ljggb24gb3VyIG11c2wg
YnVpbGQuDQo+IFNpbmNlIHRoZSBpc3N1ZSBoYXMgYmVlbiByZXBvcnRlZCB1cHN0cmVhbSwgY2Fu
IHdlIHRlbXBvcmFyaWx5IHNraXAgdGVzdF9hcHBlbmRfbGltaXRlZF9oaXN0b3J5IHVudGlsIGEg
Zml4IGlzIGF2YWlsYWJsZT8NCg0KT25seSBpZiB3ZSBjb25maXJtIHRoYXQgdGhlIHRlc3QgY2Fz
ZSBpcyBicm9rZW4sIGFuZCBub3QgdGhlIGNvZGUgaW4gcHl0aG9uLiAgVGhlIHBvaW50IG9mIHRo
ZSB0ZXN0cyBpcyB0byB2ZXJpZnkgdGhhdCBQeXRob24gd29ya3M6IGlmIHdlIGRpc2FibGUgZmFp
bGluZyB0ZXN0cywgd2hhdOKAmXMgdGhlIHBvaW50Pw0KDQpSb3Nz

