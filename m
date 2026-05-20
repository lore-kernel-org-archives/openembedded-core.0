Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6E4CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 16:35:32 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16801.1779294928807626935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 09:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W5mOnPnn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W5mOnPnn;
 spf=pass (domain: arm.com, ip: 52.101.83.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zAkGodNUDjGdHZZ+fubURXTCIRzYxhbCo38kjYGbVGXQ9e37TeUdirFrvFnXcORAp/0s41aRk+3cvjE0jUqdu1E5CXzK6SE7J5MVzSozAH4L2pMxPvVpAkM9pg7S0RZcTTVhic4DIjTvUcuVGLYsDkGHFieqfNhM5Abd83JH5UO5INlqcGCD/8KH/SiALR5ZoyvTGT96CHwuthbFrIB8eoqDxsCGA8VRIUIjL2/HiqHzTDM0rLzlMYW7nTzkWaSkbjWd4CUdjFZrD5b34v8RGDmdZXSFyAoeVDDNRHmDTQMy+gxxih9JGHUUvO40nHXWN2l9eBBf1ozOC4ji3CX/tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWMKsCuZob6tlr7rwKrNnzh5low+tjrwzqv/Mfdx16E=;
 b=kRP1vsMTusMV35oA5AyEZuJME5oi8t9M6Y5sNDelAIAHQW9y+CkhyQviYwD1FmxlOl5pAgMwSWrxnzLtMKE0iiOE7v+QnQLPuTYL/cEXJEu8uG03QYL+ErKTtEgIL+kw/RfKJuY6NPQIN7syStpHgPcpE+m0qumy8E7yqU7SB5PRCTFA2Ow7M/yTMBnhusRm7aq7/AIRp2Eh520ehMQmT6v3r+fVIq6Bibb+pPVXe/5lFZ9ct0J/GCZyJoPNFx/HRj6qH3Bk2TFJpr23JaCIT9sW+d8GYJxsK5fu7MORz1zlAJXlEE7u94Gi5qZnlRt/ZWhGCCc7PBOZkYpdkUYwsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWMKsCuZob6tlr7rwKrNnzh5low+tjrwzqv/Mfdx16E=;
 b=W5mOnPnn9vKVhrS0hTmiD4XYi5qu0mi3t9c+OP6gI8SaBtBin1mFoQ88tGPo4d9r1fG7d8hGk60NcI2WWI+rkVwuWImFwIxLE04KaygHhLGt3k/dclM8g0DiHMVQNo1g7wM2cN0aWMLQ9/iH8dQGHNoMV4/P0Ht449h9fJfrOjE=
Received: from CWLP265CA0511.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::16)
 by DBBPR08MB10412.eurprd08.prod.outlook.com (2603:10a6:10:535::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:35:21 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::cd) by CWLP265CA0511.outlook.office365.com
 (2603:10a6:400:18c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:35:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxcmdAIr2cB77zIvVL+7Bc88NTxm9KFgPP4yMZlgKojBiQXu7A0W4l0wQ1hf0IyvruQIFmf+L7DnRZCBixtADHI5pHxfjTq0MbksIyy8enl38r9/XEhl3LRX0hMTYstvu3XcuS+6/cnWZUiIDOvHd1GhwjkyOwWYdlflNvYTG9GbRlGnj+yrElTKPYKO8ZV//rh5loZMZC7hgyT1U8rEgq5v1WsYGMxRbrMsWYMcnbPStH0wuB4l6G6kCdqkqcdwjJc2DGVMB6RBQpVtf7OdA6V/eWYo/4pHvIvtj13UEouuQiQrbYyxFejnQQaF+3FKXg+y1aHY1BvvOxcnjk4skQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWMKsCuZob6tlr7rwKrNnzh5low+tjrwzqv/Mfdx16E=;
 b=QGQOJDVqeYym6Q3j1UsIEjsDFnzRwNbMvKonGGrKfvD8s3YKMTRqR99NpfOlc13GZFDXT/ukIBIRiiFgapCgjkCzOylyLhKiF1wq3fbLZCeDxhzNXf8cMkxFFrBo926sMl6exRFC6oyoqX4KgMbEBzx3bK0G2nz0MTkW3MYhtvt9y4aFPQA39CggRajWYu05Qjp3tsC3gLUNO64rHkBaA62bibVq7A7wgW2jv1jVSQlx62mPa/47FCStEaACqZX4l0GqmJj+8drRsvvO1Y3oTB2f5eAL5RoKfIom4A+swdmWyiLGu6hCmOa1gQS2EsmXCRuZD6DltIdNtaW7NgfmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWMKsCuZob6tlr7rwKrNnzh5low+tjrwzqv/Mfdx16E=;
 b=W5mOnPnn9vKVhrS0hTmiD4XYi5qu0mi3t9c+OP6gI8SaBtBin1mFoQ88tGPo4d9r1fG7d8hGk60NcI2WWI+rkVwuWImFwIxLE04KaygHhLGt3k/dclM8g0DiHMVQNo1g7wM2cN0aWMLQ9/iH8dQGHNoMV4/P0Ht449h9fJfrOjE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB3PR08MB8916.eurprd08.prod.outlook.com (2603:10a6:10:428::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 16:34:18 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 16:34:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] libatomic-ops: add ptest support
Thread-Topic: [OE-core][PATCH v1] libatomic-ops: add ptest support
Thread-Index: AQHc3S8WZyLaeZGb4Uqc62ySajWhZbYXMpaA
Date: Wed, 20 May 2026 16:34:17 +0000
Message-ID: <E1BDC2E7-0672-4BB7-987A-97BDC2E9483D@arm.com>
References: <20260506080459.21650-1-pratik.farkase@est.tech>
In-Reply-To: <20260506080459.21650-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB3PR08MB8916:EE_|AM4PEPF00027A5E:EE_|DBBPR08MB10412:EE_
X-MS-Office365-Filtering-Correlation-Id: 87da34fd-86a8-4d94-dc40-08deb68dc93d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 UiJa6jPL8pNt8SOKdRb2HnFXrxNBcD60mIuD6pJdsg4xRB5uVynl1CAjjSIqzseoOk4XqCvfwNNmkS7DhGZRnLjTpYiOHzXco9IPDcWIOr+jY70bSbw87cn8zF97lnkgiW4/UVfbsuHioqlEq8KeFoqG+TpXWqPShNOIoWfIAACyXWpOCkE3A0BgoWlk2FREEDEA3uyonBmbNCNrFGZt1pQDnfQpvRYWxM5ZYBeVm5U+kPKz4fp5zgqgqLRVRhhP3DcLQWLIQSQriNBfgoyRXvnMOv92mHnYy3W7+XK/Uhg/KTaw21Q+U9wOeyXj1y46cqs1LBwDAhDuTfJjPuQxd43tdfwTGRvpXWX5M+DWACHIJSDu9ltkaMmAJMH24srYgsOsNt/HvIYrjBHSUOuoxnV21b7n5Fqm6EcxDNmDI8auHnke9Jsq0XCG701w1IZcArN1+I751yJsmxDER5+EGOXa92+jVpn/q5BErQ/R2+mp/5ga0OVwXNrIHmCWYg2C36ITi5czdGhWcFcAWa5qAr/aX7Xd3eZL3b0SUYzcXMyYq3r5RKB9pMQJ7bfo9xdreHBaRAqXXitI1+UAF/geueqvs+opSQjN27xW42Q2sXSvY8VCTHyBcG1b/EhyifsDXGRv5Rem6UJopTelRizlKfISCMOjU6eY+hHRNGYcX70wNXA1/3BRptwa8YONpCua8Z4zhAF8qRNInHY9YV9UHwfOk80nr7ZV7daQ3xIJjbWepMOMNj9VdpDgqd4PVvrT
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3BA568BBD0098448832BA66067144357@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 BWn2Fk0FJrZ5Avux40HDxsVF0hinMEJ7hJOmJxrzHfkUDam75Mzw/MBz7eH+zjtJhNgupL0P3TEEmk7eLx5O1Rk2ElOO1u0mWxs8g9WOXp3AGY6GdqolXcee+Hib0hmVUnB/B3hcP34oWsNvjtZ9kcFA6rtKSb7LOKm4l+wcHxxf9bohft4Esg2h2bwcl2i12uOT5EUWYFit2p0pZtbuDTs3BVM81rsSQYTu4JLXUIUDVtWrX+j3zUQlh9uCPqTCHjPdH3Kx6XBo+nSbpozrOBqT2i1rvdTPhjSxKVruaAO794v1wcaAR43Y/WTwRXIDu3JjkIksGptr7tD36iLp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8916
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f435caf9-59c1-4104-78b7-08deb68da34a
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|35042699022|1800799024|82310400026|376014|14060799003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	2SWc5FvIRzD3nEIrufGk6CxAhJ/BxWlR4jrGpyWBb+sJcPAPxvp+aoItqDHHT5pD0704uKFPo40ynDOeeaZHwXtlbJcQmIBMv4hv6qSvVhKPqtb+jVNin9B5Nbg9YiEZ0YC2ZZZYLiAsJx9/T10Hm0XKMX0wLb3ruRo2hb7o6DXqwkdl4J66GAVaOdqXTfQ1R2d5BFWVDmqvZuzkxfligwt45MSIm8w6s7NuACwwND8lXpI0ZgTW3UJBl0He6QlJb8fneCY2+J+MmbcyucVwhp7kSj+Ymep1bIrnIRUVtVOyTZpGPXMEzoeqMozD1dol99LBfW38gSsHWnHh6t9kpf8gyZ5ZFQEHQrYg3rfCjblweiwnSkr/Kv7zMat5j7VB+0gzQqdGHHqnOQS3rAllk3RLFxtb28S7gTMjFSbPM7pWg/PW2IATrNOCK29G9hNxjdlO+0R2Ff3yX46o6vU1FMZ4G0hkqRAb+TLax7WTLCPoG4UpjU78EO+uG1UineRaLxn58F8HvMIgifGoWtQqEuNOkVezKr05wmW7mk9PK9tbW5bKfkGpzp8fCKhEIT8hyVUztX7Iewohzwcq1ewncVHkx3cmXpaELfCRAZoZ9IKiPoVCLWc5IZcXfSXQPT30UCOngFdjhq/3IhwbVGacq8XMwPQ3yOFSzbj0eb45GJK0k5gySdNFTAy4/YrZmuzV5yI8/342rwM8BrKeB8L0IH32qp49Jk4oFD8mQeWcCFc=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(1800799024)(82310400026)(376014)(14060799003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	cLN5Ao6si1Qi+ZjlEWuAtFZSQLLWX5s/U+FoG05pBQuOX4plPJqG2IYhpH/dhLJ0o4Kfl/DL8N20ubhgdhHPMBFUMdPiXIuy9Wvl1WgMgVV9bipA2yoW1k68x93lBg/Hfw1h1++k5OQjO4dQUiwxBdfpaekjlRvM5MoLdPpsYbcKE/lKri1iRyAJdSu27PNuKm/briOFWx0P/dXXrPGd9B/k5E3oSqOCYEAyqec0tCGfPLskapE/nDffgqaWegZ7P+rdK53+AhcB/XOmEoIcHNPAHo8vrbl1znp23u04eC/2SRf77gb5WR47o0dP1/SHSECIBdgIwNju13/gbLXJSMjv5NtAGT1hJDkS8g8wApXsx1Ve9qYJrl/CcRHODzUA2Dgp/CPBVZA+mxUO8QPAfLGzN/zVpEInSonHticMuyOBGaqOL5I1LWc00fWO0nUk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:35:21.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87da34fd-86a8-4d94-dc40-08deb68dc93d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 16:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237456



> On 6 May 2026, at 09:04, Pratik Farkase via lists.openembedded.org <prati=
k.farkase=3Dest.tech@lists.openembedded.org> wrote:diff --git a/meta/recipe=
s-support/libatomic-ops/libatomic-ops_7.10.0.bb b/meta/recipes-support/liba=
tomic-ops/libatomic-ops_7.10.0.bb
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    find ${B}/tests -maxdepth 1 -type f -executable \
> +        ! -name "*.la" | while read -r t; do

Can you use makefile-getvar to get the right list?

Ross=

