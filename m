Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC91FCE081
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:38:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70142.1772113110369339714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hdY5dptV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hdY5dptV;
 spf=pass (domain: arm.com, ip: 40.107.130.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RVMGB7iVXwjl7T7wTMQ30c0YfEvxcb95EAVU2bBZYME6PjUkS0I1IdrlmHjb8UUK2UEEK2Zk1kxo4hiVe2USstgTAOQGfmSMDTTY8+bw2T9FUeej1nz9hxUtiT/3PjJOTaBgZOzVZss+kKyXAqLR//6jutdqmoT1WAjXruMPgcYMGBRq9dVMk4LBiOW0Y1QL57YKpoozVHgTpGfYb0Bn35DVommSa8cjuGhqAte5EwMsHY9rPWccfkNEW0SHF03dPa//iipWtDk6P/Ptq7nj3oo32MZaikI51hm5zXkG7R+Y3b/hry6JdV53KHD57ptI/hGLsIF4l/R22+Bdac0z5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC8TauAvYmfTgAX+jKXjc1+PqATWosNJoTovXySwI/8=;
 b=fajisjcVyUP9ZMm22DEd20VfiwO1OhLw3scD0MnC5FhFP2YJgrEr3gXPoHsUavA+7E9gvZUFtwixAOk0ucxcvqW0IISpyJc86aBQuaxtxwQOF8dE1txc5tHti5trigHgE7pduM5kN8ymsym60cs8iYjh8Ny232PXZqvPXOECRd2g/rYFEXyT9QqeqI8q1VKM8JEaRhYxSV8TXEmjcQOMOiTaTOJF60rZWOtkwwESd549nujYaNNT1lPCIjkR10nFJndkI3oNOO9rlBbSPL/qSlr68MCWOuu/UyK/IPmKSG1H2WIGvY/rNgrJYDLFyRu+DrwSkoCN1u1y+Qv51lV02Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC8TauAvYmfTgAX+jKXjc1+PqATWosNJoTovXySwI/8=;
 b=hdY5dptVX/eSa7+Y7oYfnJt/1GY8e/bt69dADqWUQsPwiAEdQywve9GyCOdzwM1wuMiCa6VuCMRZgpSU1oP2tTgDv61q0p7M53tkvj6DO8ONbVRl/XUacUriY/KOpvvhVqVNk894KzwuPekb484YW5rZpN7SM4l5c0rsxjckO6U=
Received: from DUZP191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::19)
 by AS8PR08MB8015.eurprd08.prod.outlook.com (2603:10a6:20b:548::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 13:38:23 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::d5) by DUZP191CA0030.outlook.office365.com
 (2603:10a6:10:4f8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 13:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 13:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHTpjabtEQxV7NtRaOCoZmOQvmAUix+Kw+VYVflsyJph9kx/wRlUotxqgUZ8JnBOnL92sFgxSZyR+0I/c9W3a20/q9YenzVJ/OExkUT9iTz2buWJM5rqdzdcrOWkRRTRWAikikobtokFUl4WsgL5+lwOibTy5BhgznUWvlAOEh2ntIWviqt0xd6NF4NhasEZrw0nOQI587ywiRe2QbrJ2guh5Y+2GBf2nfVTs6IsppD3vl/xI0nvmQVJ0wu5a2vqNcdiQCjTjCAQ6t/fWQGO5KG99xfIY2Bwie7CchU32wxdeOF5yEzip4SmcAhyRuF7B6d6U3q6btb/fVjcKJRL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NC8TauAvYmfTgAX+jKXjc1+PqATWosNJoTovXySwI/8=;
 b=lanBvvTYQxm9pk0q7oJKTdEo0TfNa7P448X3POBhwwTizrihH1GLlfRp5ixehJEzkKLIVRdT+WmSF4ENE5e1+xICvi7i8oVyCFVsUj/mwg+aFjGBnTDzJjBnqTiU8wE6FtNk+Gik24vP1zIEAh5osFqMbrdqjDlhQC2XPVUEt+2QmU+6WmJKiuI0BfeOADNyQgNjLpfO8H5j1jb1rUAuTpaaGXa0wz5MHagXsfIf+mgN5DyzU7EaNxdriMoS4eQx0w4qV3B9aWr81XHFVVtZJlyUvvvMW0w+0hammIV2XEKTuzBtK4k6Y9+/mjDzNyZWWZBLkWezQCSl8t13PcGHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NC8TauAvYmfTgAX+jKXjc1+PqATWosNJoTovXySwI/8=;
 b=hdY5dptVX/eSa7+Y7oYfnJt/1GY8e/bt69dADqWUQsPwiAEdQywve9GyCOdzwM1wuMiCa6VuCMRZgpSU1oP2tTgDv61q0p7M53tkvj6DO8ONbVRl/XUacUriY/KOpvvhVqVNk894KzwuPekb484YW5rZpN7SM4l5c0rsxjckO6U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10315.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 13:37:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9632.010; Thu, 26 Feb 2026
 13:37:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] lua: upgrade from 5.4.8 to 5.5.0
Thread-Topic: [OE-core] [PATCH V2] lua: upgrade from 5.4.8 to 5.5.0
Thread-Index: AQHcpTffkoccBV0gMU+GB5IXYFfs/LWU/4mA
Date: Thu, 26 Feb 2026 13:37:11 +0000
Message-ID: <39D9B021-BF4B-4050-8D22-53C33E84F8C9@arm.com>
References: <20260224024638.1146564-1-changqing.li@windriver.com>
In-Reply-To: <20260224024638.1146564-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10315:EE_|DU6PEPF0000B61C:EE_|AS8PR08MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce72089-d157-4e1d-5535-08de753c4cd1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 ROzVYmcRP0YI1udq+SboENe/USx1gc5ys6cn0xwkKBehXyQx2oX6I4vtBc4BJDPwqASHRGohdZCu58CYrDdKY4zkIVtl4hrm44ou2MviBbfSQJy5/LNXu6XSPNi7ZVYPqtXBwlDNLMgS80PQLcd1A3RazpPTFe5vMqFwwYoXJ9zURnVYAFABGRG0Y8rTTePuNnbECo/02r48l6Mh8I6kb33Xfhvunvuo8CpoPV/VA/JobKNcixyrbR2V5LXZyYoY6/9MWkn+LJWY5FA18KX5tVC48O75tv5A+NB405FH5N0wd832XNrOZEm//LrhtpF3x66A/dGFa9qTTtoE9yDiTRf62z/069DUbZpGDySRwVk9cqPHKPnvp9YCxCCSe4Jf9gyAAu86VbIUdk37Rp5NdrafXHeMFpAsbP90gGEbhTmt+bL/Pu2buO/dOu36eCWcMmpSuLVErIEXBK9/E6ekwejL1vDzDSQIhC2Klc7nBgPVm2cgvIyqHXlDWvbxllOjFZTvZcZhtrSvL/8UlCvUwzN4OcnEW5AQzUUZeskN1qhe8M7/BOkNOe/oOTLl1cjym0V8DtSMDC69lxFpNQMH29EhutctB647P+PUa+MaagoB/vyFSDfAYieqVJ0yVy+C2MozFKmlo7XcIkQc8rND1wQOcWA8KrnWtejvNcDIFQr7V8PaOv62D1XvdvJc9rFmlS/A37idoVvI7ceX90vtbQqivJHnqxz9lusMNhjDEH4U4Pa28q8dilEna2cvsPSqTE+C+3i/vALVsK9cg+Tpf0mGd17Uzej5EGGXi6ANjyU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B97F56B3ABAF54683C2E7E8E68B4EA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10315
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d24d29a4-25b6-4163-0488-08de753c254b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	bZer8ND4tlBM+2QUTm1GZn3uCk1QhBm1ibM6ABtyJrWY2jlKsicgu5VYC4pywSUUevdwukJwU40mXK4/3xYUsKLVmGEXoV6O5dTbi/JXL3yA+Y+HGRKu+M6g4xXUVkDADc2uobu8oJOzqIDtjTnsiO8JY25MopqJMsYXzzITWN7vb5yEUlCMbdhTUg93r+k1oIOk4jFjuT/b11l4o7si9kB01NYti1kcIGeEIQbnOK9p+8zI9IF6MpMl+Kfnz3iLCbps7wVVEZCBmVf+IyDC1WoqN3R2lLlHm6IW78qYbg98XWoXe/eUBc+nzpqWqJtxd+BQzLV6Zp7eiXBrujbtSLzqNq6vfcTSKp2H9ktd94jIA2dUP4ygqyxOOumw/8tVust0GkdnSP5BYnRUk5JTw23s+rmffs076ynBLHcLCokyEI0J01GofmtR8fCA8+sj9naPBDYK+L2d/fkYyQd7dWpaorf+x8Enp+rPsuYkRT0OBJS2oY5YB+OJAVBOiDL67D4VipCplpnlhVpurbFsohMn5yPIeGAfFnLoioMLzg1FDUu0yIVv+jymiaAHlzNdpSb+pPoqmh9UICHYP8Ux2xG+c/pl/uMdLNrgk+RrMIqDrt/yqPW8OLQLISfGt9ScnZN712dFFHT93VsJ/mJntahiYhIuVWN2BsVtycOPCDTqYleoxeSGrI/42WYuGPHP9G3Qp2mv2vYbtBzdLj0JBMdszWpUf1/QdqBnTZvm/F1blKtb650TLZi6TgCDpLR3uC997OOQEZdBz5m9b2G1RoVpfpZTPWny3XPNszM4BlKgUPtzV90B9XOmdsGzQZhfWscWMZcdrhfBVqiHdxWzXQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	DVuMn6X0AE67yYxU9xye+70aIaV8SiT3EFADDnLXIDhenVpuRUhGxTFVNiuKp5Sl+6rETtt38cuTyx+idlNHZdC/mK1hNnvh13mv7cge5jCzMVkaxnuODZO/ptBzvTVzkBnxUxqCr667A54DzoYe17yVle2hkLrWWL2kz9sA4TqC0y0bZ+ZNnLihH7uz0LifVxbgj/I9IC6ajAnRfkEjXfUSApY5txKDQFb3W/eUjEOp0UemTQ/QJhu5Kgrh/hMEoe4HQ+zKKpQw4i/rVuMPHSWXl9PkAnwMxnuJdP5bZ7/Y/R1Bmb5CCB06OWh9LMDG/QbOElbn+slGBLCi+xqdV8s6vad1TI0N+w8bnxpS7p6HxJmBJD/s5e5IAh6GStaze4L/g82KTXWNQTFv9E0Ag8jv7du68EDwQE12MUGQTNQoR0p95P8oe5xPkv4kvyS/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:38:17.9991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce72089-d157-4e1d-5535-08de753c4cd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232024

On 24 Feb 2026, at 02:46, Changqing Li via lists.openembedded.org <changqin=
g.li=3Dwindriver.com@lists.openembedded.org> wrote:
> -LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D305;endline=3D3=
26;md5=3D0e573c143cb6491b41cf02cfbcb8c267"
> +LIC_FILES_CHKSUM =3D "file://doc/readme.html;beginline=3D299;endline=3D3=
20;md5=3D0e573c143cb6491b41cf02cfbcb8c267"

You need a License-Update: line in the commit message explaining why this c=
hanged.

> -PACKAGECONFIG ??=3D "readline"
> -PACKAGECONFIG[readline] =3D ",,readline"
> +DEPENDS =3D "readline"

Why is this no longer conditional?  Readline is GPLv3 so there are people w=
ho want to disable this everywhere.

> do_install () {
> @@ -40,13 +39,13 @@ do_install () {
>         'INSTALL_MAN=3D${D}${mandir}/man1' \
>         'INSTALL_SHARE=3D${D}${datadir}/lua' \
>         'INSTALL_LIB=3D${D}${libdir}' \
> -        'INSTALL_CMOD=3D${D}${libdir}/lua/5.4' \
> +        'INSTALL_CMOD=3D${D}${libdir}/lua/5.5' \
>         install
>     install -d ${D}${libdir}/pkgconfig
>=20
>     sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#=
${includedir}# ${UNPACKDIR}/lua.pc.in > ${S}/lua.pc
>     install -m 0644 ${S}/lua.pc ${D}${libdir}/pkgconfig/
> -    rmdir ${D}${datadir}/lua/5.4
> +    rmdir ${D}${datadir}/lua/5.5
>     rmdir ${D}${datadir}/lua
> }

Maybe use 5.* to avoid having to do this on every upgrade?

Ross=

