Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E71C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 21:56:41 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29388.1784930191580004485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 14:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W2Uf5Tz/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=W2Uf5Tz/;
 spf=pass (domain: arm.com, ip: 52.101.72.31, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tTehgCUZVbD9BtemoCOQxdVgb8m2xn9DeH7vdSqQx4jnlJ7TqxeGENhNhaAP37XlwVsv5w8a4z/zBnnXkFxLAOHa15nfxaEQ1ox5T/ttDx2wXS4ogrvw8JRAYr8ZHuTkh05mYD+p9VSLryb8UenRDTVzPHQnFftuCdpjN0p3fW304WwQ2ws4KRzuXdN3W1ednG3bFXLH/3z5pDPN50rZ1wgjW4iNeRCRBQp2Ci73q0CT0mWxmOM2iowC+qO1CusdIjUwAMxxv08veL6iwjibJW3UH0kraUlPVK/75SQun+hjTfEALpQPUjY4CYjGnf4SWbA3gdbyhXhBdpRV2FsJzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPd8lwVjJtVnlWcc6GZnH7yo1cFe0w1I4CXQPKXsrMw=;
 b=pop8j5kZPN2YzEsByoeb9aRqH+gXkygHq38vvvx5GofyUVR3U0PjhbVkcmO5Vk5kJ/qjUurls0hd4rsUxci9vzCyprquQPAkDIv61Mb/cMqwcdmHhvhc9gGo5ZtivdMsiryQ2KIQRb6Kcvhh4arXUlZh+zvJJYt6ApuHfSs4kyTgwgb7X3d7EJZ0A8UrbbEkKgINoL1AlVPN5wU5dAwAMBsD4MMj8+xMmWKssCLyxthxdKIWcUnYBjnRfxTNF31nWDId75oDfYUS5wFkzOkJS2nCFQXPVgGw/J9pGCvOFVf09nCwYPO3lQczmobXvd3/dbo05+QKPnv4tUMLz8dr4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPd8lwVjJtVnlWcc6GZnH7yo1cFe0w1I4CXQPKXsrMw=;
 b=W2Uf5Tz/8Dd2U4+TDaKHFwLJG4zTf2Figm6kFHZUIEW2Imm8YuvKK+SsPqhXY4OO1OtTEmOns6/TvhDTTFsfS6GBs8aZnHX15BJTw6u6bIpsd5gv79Szj9FnxFddtQ6SfbxhpYulPWA2cyEEVkkNlpNU68bUHlg958mXzJbY8tk=
Received: from DB9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:10:1db::28)
 by DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 21:56:25 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::a1) by DB9PR06CA0023.outlook.office365.com
 (2603:10a6:10:1db::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 21:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Fri, 24 Jul 2026 21:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxa+KWRoZnApKAwv2b5Ag706oZ7imca1cxzbi7pT/3IQCXP0btorXXJIzLE7jehm8AWxtdgKInQstnmz3hw1K8M0gbnAIONO+6OMNKDXP7HThbrccyM7EeR4ns8VJVxq3FaVN8fIkt1g1up/OOJqurN7eIF9bCIyHVC3Y7a9+6mJ4bMsbwwwkyPPJ2+T223SjKOLZy6wOZREjOUBTPghCJ5d4yCBFgtBKPJFfTRuY+gswTBUq5jnaTJK9l44CHcm3ovJwx53nLS56xj3RQtcjL9Snk9bEyeoNxtHvpsB8dZmtnlGXjQhF3YkdWib+C0TqETMhZHYnl1EAUbmr6vouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPd8lwVjJtVnlWcc6GZnH7yo1cFe0w1I4CXQPKXsrMw=;
 b=VPnRN3pI6zOFQ3KlD8eGSe9oUjISPNOHHm3r1xavwDyQq5WPqzkodARR29YA/7xcWMrADfhH+1VygP/eMRw+AD2Q4iOGNLQ7q04PW+koL9iCDcfutaRbozxj9Y4WOxx6LLaUHiPX5nbKFlBS2wChHbZ6jl/E9S8p2foUzNINyN3/iUXUKvel5nu5Ky0l7jevoD0F23/+Hp75nv7p/0mQb6hkvcsC2zQ55v84dDGStm5+5Uo6qU2Y/o0K6m7wrAhXTepEkmfS2NmmiBTV2+qe5ZlknzcHGteIThxrblw1hqCBMa4ceWarxN+j2cjQp6PlMrYX3jiwhyoc3JU9AAh1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPd8lwVjJtVnlWcc6GZnH7yo1cFe0w1I4CXQPKXsrMw=;
 b=W2Uf5Tz/8Dd2U4+TDaKHFwLJG4zTf2Figm6kFHZUIEW2Imm8YuvKK+SsPqhXY4OO1OtTEmOns6/TvhDTTFsfS6GBs8aZnHX15BJTw6u6bIpsd5gv79Szj9FnxFddtQ6SfbxhpYulPWA2cyEEVkkNlpNU68bUHlg958mXzJbY8tk=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AMBPR08MB11886.eurprd08.prod.outlook.com (2603:10a6:20b:761::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Fri, 24 Jul
 2026 21:55:22 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 21:55:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH v2] kernel-yocto-rust: add clang toolchain check
 and lld dependency for riscv64
Thread-Topic: [OE-core] [PATCH v2] kernel-yocto-rust: add clang toolchain
 check and lld dependency for riscv64
Thread-Index: AQHdFRzyQHks/2HiiEuw4MWXgKWya7Z9Q/iA
Date: Fri, 24 Jul 2026 21:55:21 +0000
Message-ID: <B80E539E-ABAF-4BBC-ACA7-F29A2539A22D@arm.com>
References: <20260716121533.2966763-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260716121533.2966763-1-Harish.Sadineni@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AMBPR08MB11886:EE_|DU2PEPF00028CFD:EE_|DBAPR08MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bb29b5c-4cde-4a6a-3297-08dee9ce67eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|13003099007|22082099003|18002099003|38070700021|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 161/B+DyWGC9723rjZzL+ALCg2Ar3bHGjr3Lhyh1JKyBIrI/yU/SBE+jsXdwYO2uErQz3NgE5Nf95vxE8zglIl6WulMHFB3CuXSh3PClYAvrh6vyb5gKPH9ZtPYk2JSuFd8yGLJur9iroqI3GABy/Lj/yQHGkVUECGZMUHEn+dTEW+XDv8XyT5jbErjkelfOC19Mf6bEIALJvmSB5vpfA+dtOQHtVnE0V37hN1O9tbxXWOiAQ1ZRRGvILXGqa8t/uarBtTtWEzQY88dH5yc/c252lWHalMKBk+5rh7FtFGy5NCIg0UlDUlPimOrMSW9jw8/oxX6fbLpb4uZLPpBB+uyTIoUUIxzzTnZS47P8m6KdT3aCgdrjfTjBBbqMcxnxX8LKCWJ6iZFcl8x3n/inDZkhyJw3R4fVd+YqJQzha/50T2dTwPWlVFcDdzLiYLd2ZBIT/YD9VVacclQ49E4mXmQnXG3q/H3+kpIRNy0ufivxo9UxEWJr30BU1f3MUL7Ttm6v0yerglqOI/Fgenj4NKLsXwtc/pmgK/V8C18nSXoOUJdqdBYV4je8HKNxTXjbGRUoEDpjhxc4mV9wgSF7QwbSvxooXXUQU7Fh/BUK5byvRKSS1KvLwzOeS8j13sq3f1x6mIjOHzvsf2o4NAfzRJw3GHgsz4FbL1SFrlTNapk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(13003099007)(22082099003)(18002099003)(38070700021)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <167B6F598ECD4246BC5362636797605A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 MwNk/LVBc1bwMVhPpq5gP/27qGyR3uyjyMugvAL+IpEVwky9FY5D9ji4wm/ND1td5ycWpY0vv1gMNgL2ypxGqr4CUoJjlKKt8uolh4kfVeK1pT1nx2nIF5RaLGRwy119x8Zuhqhwj976VkvjCa8bZn2b7wUkjA0l22vAhG597lMGa7fAG+YC0CwsFx65HGd0xgh+MInrXOi3/I06Ydr7WUN24w7J/PtDytl51FU1DXjUqtYTCvJOMLqVJm+iuOge+Edqr5IoiVauWw5F/Wa33XiYH980YxPDLq1Q4Q78ohevK5tXSSy33x90odCUHspAb3EmvtRMDhqam7m5SGJ0Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR08MB11886
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	91e9048e-762f-44fd-6cf1-08dee9ce4218
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|14060799003|35042699022|1800799024|13003099007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	M4ArX9s60B+1LvTrXGtDu1FUShHWmMlq7O76B/241pC3UzMSyPxs9CLgPkBGDaaE9LFB4H5dq+p54uXNCSEy+kcIu8e3Qj7ntVfabKvJOq9nH8U5qmN+B9Ux/LN+HLMoHsgtv2iBMT+ao+fer/9yg79O3gTnKhsO+W7H+sA45wVn/NihU5fzQUbsbxMQgpwLMSoJa73tH7UhANETYu7qS0HxRWHo5gQzG1HnGLbJJm9TDAPtThLD1GQOCrVIwUD4ztdpOmIKAUlsVpkiSxLVJyG/m2AELoZnQ3OY/PsZkGjqv4T00wESdYzcC24ye8D05iBYNpC8zxy2+KY/MxbQgwCEVR/if9t7NRBNhP8xJmHl+YjHlutOJhagQ72s2DkL9INDCDk09l1K71Jy4IE+vDMNF8inXfnv4w45Y4IEcAilbt1ReVnaUZ+wTmf2hoa2geG147c4lFj1VDFRfWrkqJxA6xOBp5LvDHH5151FNAjWItP/QvI6L2UYSOYZZQHg0ioORp58SSCN+mxxo69X6Cuqb1OOhSFDhk8FpUBaQ2O7KR0/9NtpPiO7OMn0tbkCaj8LUjUDk4HMd8m645AW74dx9CoLB+GrMVQPZzHhPcw3hyJKiHfIjs743YIKKxzVn4ZZi0pBqO1ya29u7fyLfw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(14060799003)(35042699022)(1800799024)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	i7mA9Gt8i1jxxhHHGFrmBunWt1t8rmXsWBiTKnBVfEvL+ad0luRv2QhXHZg0WOOA6v9BFsfVwrJXdGbf7SQmRvDeAX4YjOXQiYtiwGqTXRkHL/ulnH9yhuGInqnIlzZkWhHg68ul/rK8bF0BYCXLL0E8cDl2vFhqPX4YhN8YOWMRS8HcA+kABp5ose7gGX+BN+zcgdVunFj6hGLw0o+9dLmLROfx6vDw+aAZJnP9r9M6k24Krg0kxROPq4MyPnptpB/kxavhdaEO2jvlD4dFYbW3A4zeKcJnS4DYAjyhd1xcsKqtEwzGTjwTbC5Uy/x9HSorOOFlyU94KaVjKfjl1ItscetKE0Vz38k2hD51oPvVd4BYRPde07zUaAaMZ20Pbv7Dv3cWG0G9igCFc2B7e7vAzzx6MTn7RaF+Shm6uYK+wSrN/MfXUjjTrGny7pwx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 21:56:24.8181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb29b5c-4cde-4a6a-3297-08dee9ce67eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 21:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241952

Hi Harish,

> On 16 Jul 2026, at 13:15, Sadineni, Harish via lists.openembedded.org <Ha=
rish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> +# Rust support in the kernel on riscv64 only works with the LLVM/Clang
> +# toolchain, not gcc:
> +# https://docs.kernel.org/rust/arch-support.html
> +do_check_riscv64_toolchain() {
> +    if [ "${TARGET_ARCH}" =3D "riscv64" ] && [ "${TOOLCHAIN}" !=3D "clan=
g" ]; then
> +        bbfatal "Rust support in the kernel on riscv64 requires the clan=
g" \
> +                "toolchain, but TOOLCHAIN is set to '${TOOLCHAIN}'. Set"=
 \
> +                "TOOLCHAIN:riscv64 =3D \"clang\" in kernel recipe (or) s=
et" \
> +                "TOOLCHAIN:pn-linux-yocto =3D \"clang\" in local.conf to=
 build a" \
> +                "riscv64 kernel with rust enabled. See" \
> +                "https://docs.kernel.org/rust/arch-support.html for deta=
ils."
> +    fi
> +}
> +
> +addtask do_check_riscv64_toolchain before do_fetch

Adding a whole new task for this seems overkill.  Can it be refactored into=
 anon python that raises SkipRecipe() if the condition fails?

Cheers,
Ross=

