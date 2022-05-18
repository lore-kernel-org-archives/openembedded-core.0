Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB05EC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:32:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44])
 by mx.groups.io with SMTP id smtpd.web09.4382.1652877156903034079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Zke28Y6h;
 spf=pass (domain: arm.com, ip: 40.107.20.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lP+661EQCNok3a+2lcAOL10Cef9xVtJK6TyNdjTdk6BhLFoMPMXZmNOJsy7BzmONVeDyCY8v8Glix+Yb6Dehcd63CR3NcGv7XEs9hwmtqRPUD9cmN5SL91EcV2nVJj21QTiCDhb+VAGd3KYFwCHkj0j/S0D+3YWWjkg0nJb82DQGIUuTduM9ak8xqbj4jt4If3kkk5izymVuJ+EFDnuULzdtX2OGLo0QExwdpltobSg+I9jRZO6VxBcXNL+aD4nn6HfWdCC4iwDkgpruspWBGpQGpy7X/joxBHH/PBSssHlf4oEdmBp0ugEMoDoAPHfyWjs3yvCYxU0HIHXci4JGVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vnmrvFySmc2zmkCFt/qoHszyr7GmteibLYNSSW5I50=;
 b=Kh4Y6sUwNrnrcMVVaNZzk46zJVcvDGEL72WuVMFjHLI3ggWFB9TlyWi8jT1e7MPuOS2me+CXRhKQK3iKDTA85HdUdosICNQVSssoefzocD/GjFp4q/l4qREvhtavfM/gOFa7upBPOMBH/QXHicDyMMTRkUKdkgL8bBpyV8EoitoJ52urkZcOD5OmcJDMkSGJUvpJnpomxwHtTot0VP26jIJE2h+7OThqtJ85AAsEVi2ig1BA5pX+D1alh+Vxwp+UI6LvqulEIVyInv2Vn7w+YM/su2F1lEm7+EJOnhFzyZixB133S5b1Q0o4U25PD1WoQT4+wMx/8C1AJjjGqZkW1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vnmrvFySmc2zmkCFt/qoHszyr7GmteibLYNSSW5I50=;
 b=Zke28Y6hdgk7+XEEH8wCqwlV4vhvfwXFpGy5Oq95+ss4Vokv65sdROU9iT6fuFU12JwjpLMyv31KcOFxM8Wb1VPs3BqbfDZmPuKw24VOmXT5FxL/JMJKrI32SXiBk93uJmI4RXTjh67KAXdAxjEn3s05aI4/mn6yWwdwRXh4lRE=
Received: from AS9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:20b:488::31)
 by HE1PR0801MB2089.eurprd08.prod.outlook.com (2603:10a6:3:4a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 12:32:21 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::7) by AS9PR05CA0026.outlook.office365.com
 (2603:10a6:20b:488::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Wed, 18 May 2022 12:32:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 12:32:21 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Wed, 18 May 2022 12:32:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 444a88d0133a2dd0
X-CR-MTA-TID: 64aa7808
Received: from 098cc91ff547.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 030932AD-FC95-4A40-BB26-C57539CB09E4.1;
	Wed, 18 May 2022 12:32:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 098cc91ff547.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 May 2022 12:32:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH9cvDK3m2Wd5SjK3gDTgSamFC+Fq14iQHn6Huur1b6vzy+Bj9XHaz+dxb3/iEBOjecoH5pYJVsxdWSVxwtCBMOMH/Y+m7w1eEJkO93b7MoyLf9AATPM31/aSrg1D84VhsYARnj5mg2O8+c8G5K89q8xFszIB3fmYsQnCi8DA0uffLWGB3RhTYNXpkvGXytZCeZRET1UATY3e9kxFgdn94ad/cqIDnnMamhQNQ19T8bWKvpDKbRjHagsCQ5lrxDF8EYKMGmHxVyTdUKtvUlx7lOiAnhQO0ZR19KycFXwTns1WmtdoWQZheESoK/GQRfEWKDZW2TorIoMT8zUBnIk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vnmrvFySmc2zmkCFt/qoHszyr7GmteibLYNSSW5I50=;
 b=QZjNtWUYsfbuyM+QWr7NDLcffeG3jbTFZ0rGfMaOq/iQE3Tnb3hTfwdG5kDeSN6+00y/k34qP57gh0Sz/+erhP/CxWPjD3WTY2HOiNnGyOVv9ovdbLr67pTJXOsvS04lK81dPopOmhD9eV/ZF8BRzvZ7uJ67h98IrDkw9H31V8L3qGEIJ1JWggIkPAP0ls+Oo4IPG6377oYiVDP870w9d2+ur6sRUAKpglNyRpNm/H7jMhBuglfqw8XTnxHhCbvqAhWhL12fYjN00HYl95KifeRcpdkpS3k2VFikjKyWIYWBUSXuZJwpoW4JijXyuHvvJdaImhnfZUTyqEi4viWQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vnmrvFySmc2zmkCFt/qoHszyr7GmteibLYNSSW5I50=;
 b=Zke28Y6hdgk7+XEEH8wCqwlV4vhvfwXFpGy5Oq95+ss4Vokv65sdROU9iT6fuFU12JwjpLMyv31KcOFxM8Wb1VPs3BqbfDZmPuKw24VOmXT5FxL/JMJKrI32SXiBk93uJmI4RXTjh67KAXdAxjEn3s05aI4/mn6yWwdwRXh4lRE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI1PR08MB3567.eurprd08.prod.outlook.com (2603:10a6:803:79::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 12:32:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%9]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 12:32:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@pr.hu" <zboszor@pr.hu>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: =?Windows-1252?B?Wm9sdOFuIEL2c3r2cm3pbnlp?= <zboszor@gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools: Fix building python modules
 using cython
Thread-Topic: [OE-core] [PATCH] python3-setuptools: Fix building python
 modules using cython
Thread-Index: AQHYaoczCHS0Kv2NOkClVT4P04fhb60kkPKC
Date: Wed, 18 May 2022 12:32:11 +0000
Message-ID: 
 <PA4PR08MB741139CAFB8BBDFA572BA32DE8D19@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <20220518071525.4169607-1-zboszor@pr.hu>
In-Reply-To: <20220518071525.4169607-1-zboszor@pr.hu>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b6efeae1-19ad-432a-948c-08da38ca743d
x-ms-traffictypediagnostic: 
	VI1PR08MB3567:EE_|AM5EUR03FT061:EE_|HE1PR0801MB2089:EE_
X-Microsoft-Antispam-PRVS: 
	<HE1PR0801MB20892FDCA28BC6A8DE2DC7FAE8D19@HE1PR0801MB2089.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Hxx+qZW7ZFJ6KsbVeEBPaIOZn+RLzLq+rfV0/1PPlXWlvvKZro1VSRaPjItCkOiMBQUMakS1o4O0GrCmmGccYwo9F5n6TWXLFQ7pvyktpRMoYz4maM6RoDyOtKvkk6sfLv6O9M/Ir7wy0UkrrgwGLYF2l/X7OEGPN21/vBlleO9bwPuySZVZUpXoZJBQDi9wnQWWpv3EetI7DLTMAhRUEH/rjzlXEFl3mhoRMlvmx8wK4ArNu1iuQJJFswk+d+ndsK+RrJ9JcZ+iADdiTIvRrXZTYc0UhtjF+V/RWmwcYr62LcN3VRWQ8xQ2fiw44NKpcr45C9+EEDN/xuLe6YerLUEOh5gqmgBUPWfiMkM3+sEoZwKag3nhaZJIneLita1t/WvC83Vhx8dQV8qJH7modkrEFexImvxDVFMIhB82OQQsbbjmsmmqm9RmbtIdXXwvRvvtnMJSH7E0NqLuB8qs76E1ORL12NCJqQ+0UL/bhbgEoTrEhCa3YJl6y1AuEPdxxz5sWhU7TONxEx6aFrEs4nUP86G/E9uVLMuqWtrH690d+9JRQ6akIyjwpC4d6Tx9VG3DjCJZ59/aEiZ84nFBv7appb/GRD95EruuddyoePQtSc3far7M4DODcREkXjDF3uBduAj6gIm/5+FT5nsBIz4guVZg5TVk+qgJSIK5Y8vsiHTaCe1y3Xk02wEezLmaf9aVio9hN6A2yvF/fbRnhomXZ94pdjeafDJ+oRESyduTjSDFqlbgE4YRrHQtl3u5nFxjeqoj+QY49OLLFWl+2/sMQfZ5xb8Q6JkY055og6Mp9SzOgTOH2GtRZfE7qhim
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(55016003)(86362001)(5660300002)(110136005)(8676002)(4326008)(52536014)(76116006)(33656002)(91956017)(66476007)(66446008)(508600001)(66556008)(64756008)(186003)(66946007)(66574015)(316002)(71200400001)(38070700005)(38100700002)(122000001)(7696005)(2906002)(6506007)(8936002)(9686003)(26005)(166002)(21314003);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB741139CAFB8BBDFA572BA32DE8D19PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3567
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b2f96cab-a7b4-479e-3263-08da38ca6e4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A2vy4ESAGx/OIKZyzQamVt+lpcnGcoDWCvl3I/b2saGd0VGMlvM6OTNPmvUQ4sw3KQAKOOEnYK+RwnwDDEYgLrsfnOmPuhzL9ibUsOF1AJFGdiGb6f9aeidzWbU1K8irrFpsQh6drjlSQVFJ07uFm7ygssoDGu6rWA9VeHfwZgAs16AmkyyL8SrgdhfBgLseW5cxPfAdEeP744iKzKT8pT2Riy8+hB732arR0+WGRcBRnD0hPmviY5ILUcUoIJAdyYYqecvX3SnEiziM0A25jCE0ywDdb2X4lRil/AowAEBwKQv3X4nk/HcCcx8URsnzDSWB9bvPKr5GTAJb8U568I1BBcGJXtiHt9iwgyquBSh+TYP6XmnEJZOtEiIcoSkgh2uyolUiogv/JcVAgUg0jPexEZob9s7YX1tqloV2hQJGGwH5lWcBkEkoVCqj4wMMVeeyCyq7JT4FqausTMNMnruemgwK1n29xWN/FV9ZEJHN2STr4CWR6rkKbzFajuP63fxOA11nhS8lq6/QN5u2yLPGeE2bZBa9mcyEPsGI0UDFtMT5tci3pCYG9iAu8i7bIiwSvXg6SyVGIK+uwkBbcpBzvZYDXnToEHISDGMsDdeESp4FlZYjq4zekcO0vJcGpK8KPfY6Fh7tzYMeJF1BO4L0NRwRvHUQa0zwWQWCkRCL1zLDgS4XVU2e0HV5N7QlYUXRHc+4wqOtxfPG/+/3kWfQvUuoNDozLa7SsuFpntqJiCAyDMx0ZFLntjCTb9EHSyMbpZdj8d/uClOQPmHpZqG7LOnqLUlWOqtHsdNvpbY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(5660300002)(70586007)(186003)(83380400001)(2906002)(81166007)(52536014)(4326008)(8676002)(356005)(8936002)(316002)(26005)(107886003)(9686003)(40460700003)(6506007)(7696005)(110136005)(86362001)(336012)(33656002)(36860700001)(70206006)(55016003)(47076005)(508600001)(166002)(66574015)(82310400005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:32:21.0463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6efeae1-19ad-432a-948c-08da38ca743d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 12:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165850

--_000_PA4PR08MB741139CAFB8BBDFA572BA32DE8D19PA4PR08MB7411eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

I left a comment on the PR you filed, but the triplet thing seems to be a r=
ed herring as the old code uses =91in=92 so a compiler called arm-poky-linu=
x-gcc would still be detected as gcc.

If this patch is just extending the logic to consider clang as gcc, then th=
at should be called out explicitly.

Ross

From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Zoltan Boszormenyi via lists.openembedded.org <=
zboszor=3Dpr.hu@lists.openembedded.org>
Date: Wednesday, 18 May 2022 at 08:16
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
Subject: [OE-core] [PATCH] python3-setuptools: Fix building python modules =
using cython
From: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>

The function _is_gcc() was not taking a machine triplet into
account. Also handle clang and clang++ because they also
want the rpath option via -Wl,-R instead of just -R.

Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
---
 ...cross-compiler-prefixes-and-handle-c.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_59.5.0.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Fi=
x-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_g=
cc-for-cross-compiler-prefixes-and-handle-c.patch b/meta/recipes-devtools/p=
ython/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-h=
andle-c.patch
new file mode 100644
index 0000000000..7f91d8e6cd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-=
cross-compiler-prefixes-and-handle-c.patch
@@ -0,0 +1,31 @@
+From 695800847eb519209c2b45e26fd65d3117a4efcd Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA9n=
yi?=3D
+ <zboszor@gmail.com>
+Date: Wed, 18 May 2022 06:51:22 +0200
+Subject: [PATCH] Fix _is_gcc() for cross-compiler prefixes and handle
+ clang and clang++
+
+Upstream-Status: Submitted [https://github.com/pypa/setuptools/pull/3326]
+
+Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi <zboszor@gmail.com>
+---
+ setuptools/_distutils/unixccompiler.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/setuptools/_distutils/unixccompiler.py b/setuptools/_distutil=
s/unixccompiler.py
+index 715408f5..3a4d642e 100644
+--- a/setuptools/_distutils/unixccompiler.py
++++ b/setuptools/_distutils/unixccompiler.py
+@@ -260,7 +260,8 @@ class UnixCCompiler(CCompiler):
+         return "-L" + dir
+
+     def _is_gcc(self, compiler_name):
+-        return "gcc" in compiler_name or "g++" in compiler_name
++        cnpat =3D re.compile('.*(gcc|g\+\+|clang|clang\+\+)$')
++        return not (cnpat.match(compiler_name) is None)
+
+     def runtime_library_dir_option(self, dir):
+         # XXX Hackish, at the very least.  See Python bug #445902:
+--
+2.36.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/me=
ta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index f2810e18d3..20ecf5223d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-native =3D " file://0001-conditional=
ly-do-not-fetch-code-by-e<file:///0001-conditionally-do-not-fetch-code-by-e=
>
 SRC_URI +=3D "\
     file://0001-change-shebang-to-python3.patch<file:///0001-change-sheban=
g-to-python3.patch> \
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch=
<file:///0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch> \
+    file://0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch=
<file:///0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch> \
 "

 SRC_URI[sha256sum] =3D "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77=
573f6e2fa4fad0"
--
2.36.1
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_PA4PR08MB741139CAFB8BBDFA572BA32DE8D19PA4PR08MB7411eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">I left a comment on the PR you filed, but the triplet thing seems t=
o be a red herring as the old code uses =91in=92 so a compiler called arm-p=
oky-linux-gcc would still be detected as
 gcc.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">If this patch is just extending the logic to consider clang as gcc,=
 then that should be called out explicitly.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">openembedded-core@l=
ists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on b=
ehalf of Zoltan Boszormenyi via lists.openembedded.org &lt;zboszor=3Dpr.hu@=
lists.openembedded.org&gt;<br>
<b>Date: </b>Wednesday, 18 May 2022 at 08:16<br>
<b>To: </b>openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc: </b>Zolt=E1n B=F6sz=F6rm=E9nyi &lt;zboszor@gmail.com&gt;<br>
<b>Subject: </b>[OE-core] [PATCH] python3-setuptools: Fix building python m=
odules using cython<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">From: Zolt=E1n B=F6sz=F6rm=E9nyi &lt;zboszor@gmail.com&gt;<br>
<br>
The function _is_gcc() was not taking a machine triplet into<br>
account. Also handle clang and clang++ because they also<br>
want the rpath option via -Wl,-R instead of just -R.<br>
<br>
Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi &lt;zboszor@gmail.com&gt;<br>
---<br>
&nbsp;...cross-compiler-prefixes-and-handle-c.patch | 31 ++++++++++++++++++=
+<br>
&nbsp;.../python/python3-setuptools_59.5.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 32 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/python/python3-setuptools/00=
01-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_g=
cc-for-cross-compiler-prefixes-and-handle-c.patch b/meta/recipes-devtools/p=
ython/python3-setuptools/0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-h=
andle-c.patch<br>
new file mode 100644<br>
index 0000000000..7f91d8e6cd<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Fix-_is_gcc-for-=
cross-compiler-prefixes-and-handle-c.patch<br>
@@ -0,0 +1,31 @@<br>
+From 695800847eb519209c2b45e26fd65d3117a4efcd Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=3DA9n=
yi?=3D<br>
+ &lt;zboszor@gmail.com&gt;<br>
+Date: Wed, 18 May 2022 06:51:22 +0200<br>
+Subject: [PATCH] Fix _is_gcc() for cross-compiler prefixes and handle<br>
+ clang and clang++<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/pypa/setuptools/=
pull/3326">https://github.com/pypa/setuptools/pull/3326</a>]<br>
+<br>
+Signed-off-by: Zolt=E1n B=F6sz=F6rm=E9nyi &lt;zboszor@gmail.com&gt;<br>
+---<br>
+ setuptools/_distutils/unixccompiler.py | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/setuptools/_distutils/unixccompiler.py b/setuptools/_distutil=
s/unixccompiler.py<br>
+index 715408f5..3a4d642e 100644<br>
+--- a/setuptools/_distutils/unixccompiler.py<br>
++++ b/setuptools/_distutils/unixccompiler.py<br>
+@@ -260,7 +260,8 @@ class UnixCCompiler(CCompiler):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;-L&quot; + d=
ir<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; def _is_gcc(self, compiler_name):<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;gcc&quot; in comp=
iler_name or &quot;g++&quot; in compiler_name<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cnpat =3D re.compile('.*(gcc|g=
\+\+|clang|clang\+\+)$')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return not (cnpat.match(compil=
er_name) is None)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; def runtime_library_dir_option(self, dir):<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # XXX Hackish, at the ver=
y least.&nbsp; See Python bug #445902:<br>
+-- <br>
+2.36.1<br>
+<br>
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/me=
ta/recipes-devtools/python/python3-setuptools_59.5.0.bb<br>
index f2810e18d3..20ecf5223d 100644<br>
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb<br>
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb<br>
@@ -11,6 +11,7 @@ SRC_URI:append:class-native =3D &quot; <a href=3D"file://=
/0001-conditionally-do-not-fetch-code-by-e">
file://0001-conditionally-do-not-fetch-code-by-e</a><br>
&nbsp;SRC_URI +=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///0001-change-shebang-to-python3.=
patch">file://0001-change-shebang-to-python3.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:///0001-_distutils-sysconfig-appen=
d-STAGING_LIBDIR-python-sy.patch">
file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file:///0001-Fix-_is_gcc-for-cross-compiler-=
prefixes-and-handle-c.patch">
file://0001-Fix-_is_gcc-for-cross-compiler-prefixes-and-handle-c.patch</a> =
\<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;d144f85102f999444d06f9c0e8c737fd0194f10f=
2f7e5fdb77573f6e2fa4fad0&quot;<br>
-- <br>
2.36.1<o:p></o:p></span></p>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_PA4PR08MB741139CAFB8BBDFA572BA32DE8D19PA4PR08MB7411eurp_--

