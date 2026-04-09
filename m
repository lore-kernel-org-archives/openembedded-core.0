Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDACF31E5E
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:20:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.136427.1775751599595759402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 09:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kHS74AAA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kHS74AAA;
 spf=pass (domain: arm.com, ip: 52.101.66.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VhyKgWNVtw+3Uz2OVXlOlpyytQCvOyA7uxnGGHDAEFGMtZVQpQgtnr/zDg3LnaSAY4aJMwGhSYhHKyoxHUlJd6gwaalbAe7kfhpAu9HUHM2+aQ2VwdqSWn846iAhWCub5AyXWYAIWYmtIUujiVFAESm5/G6KAwaROreZ5FaZUSev2j7sd9A1B5syroizw5q8iReCmRezk1qsnb+hvQq1Y1caMbGmh3uaP++hgA1MMEfdmx78j+X+Zfx9Xv3jji4cK5dphQT38quPftz2p3Whx64l7YT1Fk6N/n3rUmrS/YYkMqLi33ZhZemrd6lOBRierQHGuAsfPZRH+pC6B+ubwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I8H1uIksh3sXdKhff5NTsduPlZnxsB39+rpRnuDTYo=;
 b=Zlyj4wEP9U5GtR1QsfkxhJft1iQlVRcFzZEc3B9oF4GVoxDGrOAKd7upSw28xKr8zSEsRqYD01YN1immvsnAAFqZ+n0hBeew2qv7e5CtBuFzY/NgmfRsQ15qfftEzacrZI9Ppo1hFrOENQyYFeABbRurP5cArkovoOhXZvQhulLyM8YxjVORf1rpUJY+4MeSx1rkKfT9zCRL5c8PdRrond0wttQURhDH9YRRlO368s10oD/83z1B+F8NCu7ge+DfzoaeunJZH66+bbz5Qg6PXkD0QATwcf7Wb/9r10KILliMwczjQTmAkEUmhL+YQuagR53zJklraxkuKkOQrHhtHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I8H1uIksh3sXdKhff5NTsduPlZnxsB39+rpRnuDTYo=;
 b=kHS74AAAmYpAJAs/mvsJjM1InVWwoGCXHHj7CL9EpSzzq9Yn1sJBjV/jgJ0AZVDhGLc+hnmfJTb5mlxdFYal/1kXxdc5w4R/oeXsi+ZM2NgOzo1gFrSDb+WCKChHLMBi43mpffIB4pTGfJGbrvCd/AU579HlGQ5pznPfwatILCk=
Received: from DU7P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::12)
 by AS8PR08MB8087.eurprd08.prod.outlook.com (2603:10a6:20b:54c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 16:19:54 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::e3) by DU7P251CA0028.outlook.office365.com
 (2603:10a6:10:551::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Thu,
 9 Apr 2026 16:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Thu, 9 Apr 2026 16:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPvzw2P8QYYgNN5QhxiX5yS1VIxokln5n+Drs5U8qGQYsTqwTUgPrNmsl/USOJevq4fafrdG9PhQrZuhWITbcVmAUg48x+DDxOEKd7bNSP/umrzNIHWH2OvNYKwPDQz2I/guJSy+ZabSAixgT/13X30vscJ8tHRbtnjX2R/Y2W+mXW/AYwCmorTozCPt4xSnEf2l+cHYaPDnV3zYckhtW3IY+YX80Te/vV3VkvwhrdDGlA8nxdFN+umw2KX+Fzs0u8egYoTUfQoFM5ZGe34wSmKEMgOqEkQHO1ANheE0/citC9UQRqUq3bS/ezez4sC3QfsyiIRMfCl2woQvN6Q/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4I8H1uIksh3sXdKhff5NTsduPlZnxsB39+rpRnuDTYo=;
 b=wGKGgtyR2Hj3JKAW/s0JH0TAbomlUF7J2pZepqird3Cp9HMaMqwhIpEMGuzl3pXRAg8i4KXhbMh7Ble0RfnZhduqm5PQyQWz7J+sHyXmg4t4/q/sIUrAkv5bp9rkgCp0DSI6UyOWLkMOKX92DIV/jvjDyZHhWIL8F+lAgtAXp63HMaChvc/kQSJ9Ilj2wbgUeKyIu+cDP2YTj9jWjR6kKRD4VWruab510DV59o0IXRejlxBIm+7ILNk8rAKRaqSmYt1PP+YDOG6KAWRZYxz0EumbRiCpsHGNs+7bdhvP+wiuoyDDgWeZDURf5ikNwXtLCw8IxbyemrpB4U0Xaoj0UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I8H1uIksh3sXdKhff5NTsduPlZnxsB39+rpRnuDTYo=;
 b=kHS74AAAmYpAJAs/mvsJjM1InVWwoGCXHHj7CL9EpSzzq9Yn1sJBjV/jgJ0AZVDhGLc+hnmfJTb5mlxdFYal/1kXxdc5w4R/oeXsi+ZM2NgOzo1gFrSDb+WCKChHLMBi43mpffIB4pTGfJGbrvCd/AU579HlGQ5pznPfwatILCk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9917.eurprd08.prod.outlook.com (2603:10a6:20b:55f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 16:18:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 16:18:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mohammad.rafi.shaik@oss.qualcomm.com"
	<mohammad.rafi.shaik@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sbojja@qti.qualcomm.com"
	<sbojja@qti.qualcomm.com>, Tejas Kanfade <tkanfade@qti.qualcomm.com>
Subject: Re: [OE-core] [PATCH v1] pulseaudio: split pactl into a dedicated
 client subpackage
Thread-Topic: [OE-core] [PATCH v1] pulseaudio: split pactl into a dedicated
 client subpackage
Thread-Index: AQHcwrzVhliSSMCQH0yp2EPE0+u6A7XW84UA
Date: Thu, 9 Apr 2026 16:18:42 +0000
Message-ID: <65900E7F-3917-4D0E-81D7-D5EC15FC4930@arm.com>
References: <20260402162109.3523797-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260402162109.3523797-1-mohammad.rafi.shaik@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9917:EE_|DU6PEPF00009526:EE_|AS8PR08MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: bec985b5-2020-45b0-2f56-08de9653d556
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|38070700021|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 Cl46Wl7vkw503Lw3z3gSn5/hlO4GcbIzSPnWBi5xK+9g+OnvI1UxTiAMAWVlMbm6Bsc7r7SNZIfyhooXKkE8+1nP2Nc7jzdBcnV8ycg8ikbnjH+3YpIUtGN6qSoCkwaRZEBhBcH+1edDRtYX//z4pzUtXSW6hVE7V6/ZLs/mHLsbx6BFDACN+E86ovTyEzUgn+tfaq7u4o4pvRryupjkud20P/901uQraBoiqE9WIcL9dbUK+e8Zz8GrKAKXEN23Z9BQ5bdq9MpOjZFJHG+icTvL5j45E8hUIa5blS2bSZ6v6WE76C1ZYRteitrk5jOAZs/khAUF5NV9KNd2gTDy0GjrOWbCcb+JbxvDtShUWrC/0fmhpmJmjTJGOde9DaG1ZxfDnGIXRv8GmZFvv76H0uyzvPf2HwRZpEYJ+SweMda+5EruZYRqZq8A7MAH7cqilT8A7yU4cEH4B3wNlboZWe4DZznsEHqrwFUM0rXG70j511x9zzHPX+BiCsnn1jPsJL7x7V7XGUxKpM/5QkRzFvauPn94sl8Zt78qOagHUZWZ0bUWvYCgNT/U/kQnOTtVo2FC5gNag4jwED2DlYz48dYHraieoVLAhUIkJJU3MWYOC4j3HKFNV5LMRdkToNko4x8NYF6gOC86g0gzaR8Z9YkCIzCDegKEan0ph/OdRdeIqp7mXhzpVETmvsgWrjdO7KFL/7EgaUGpZ8yeP8wVW+htENXR4YT/lfqBVAUH/g/407z1hIvNHkklxLwP+S4mfgRJlGApJMAGhTMRNNshw70dq0xiYNphL40A/GUF+EQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AC3063B4CB11D244BEC1EBE2C1ADD3FE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 h38BrT5WTqquslR6Qj5ax14CU3Hw2nUFI2CQH1xRWf5d0vnHncOG00ytHGL30yWmpq/XVkmvFQg11jFDbqCWnOl9S77ASPCEyRbnX4hfn9IfvyArcLkVjTD8RnIUm3htgKNPs2xB9iTaeW49Fxqq85bHblSI51kgUKXVmX009QmNRHcIjIuS3MUd3oJTT93xfDeKss4kWiMyC2KGAShfbS9GYeyAkT3/mVVU1LcnE069CW1zRapzbV27wYUYRdZNwD1o2jW8Cqrb/DiW22+2ZgLz28bZju8inPWRkNQR3P4DjimaTYlCUx2KrGveJOD2O9V7KVD3koukqOet1uoPXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9917
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b307e6ce-e3b3-45c7-3a1b-08de9653ab0e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|14060799003|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	nhuttdrDOQRM46mJZdxL3jzosOBYt9cygyKl8DK27TOK0JlbZCuhryRWYnEhjd/GJ5OtuaAp/89nizQJKnvUW+rsa3g+nP/d2tRrs/tAdFq1lLK7L8WmuuOd/3Q5JoFQWtxpyhGEDG4+wxqHJ+p2blGFEYcbDX0RjXTRgTlVZQ/wM/Jm93fS+a/yxPXFaGUOWBTS6pSIU0nOTSwR25uV59emMXQNpruxrP99rdfEJ5ogcgVpvvwCDjGqSK3Rvl8p4ZxRhzxPL38C2CaPAx2P5wYPcd1m4Yy4SE3I5y1lZzDUxssaVSdc8WtcPTawImbtyKNo4rF7ChRJD16Mq3b2T9uqYGIGjREPXe8vdTDdWunlB+Cjw+IoGK7XLX2bpxqpcwFHKqWcs+BxIwezD307dVXRz3ZLms21NzaeO6K9uYp4Ad1OgxraIiPZwMYOXDoc2GpvUPb+t1Nzhg3NcrLYnskaGBBnp8CvUv/yMhTqieEUQ4h3ITLbRNlbxS1OyQB9cjxWRO9Soqm8sl/+esYRfxJJxfK2chM3x+E1ZJmIQyjATt8cjGflJXaSgGvkb3oIdOBStNUxMx0DLV//mGaxZb/1/tXsnytJhM5ucp2wL/FT6Oy58WkVuT4wG0PjRsMtGioQqaz4ksigdRTZi6JGk4v97ZE+Yx6fFffqf0wVi4tI8sgWkBXi1N5NMZvMI+8lMWdn4O9UPij/loh+v3AeMcNMweQu3kwLWOyKf/GGufrCZF1fIsGvalfJ+CcidIBazplGc3KSqLhO8oAJrJ7cKA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(14060799003)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MPeuZjq94f/Hj5Z4LJhpCnnlyL+rAnNjxkYuLZI952vuQY941T9DyQVb5XnyCy/Ory9lVHY+FpEQ0iqlSrRbs+zh+4Kc0FD4qm9jhvSWo0druvj767ZHkrBkSTj5lw5lsiGaU6bElRQEP90amlcmKpNZepRd9lN/bPaVW+5TnsmBGYbci10bw+snsRbg8+atcc1GRD72fwdYqwiV601SbPVv5mTY8SgCIobMGqNvuX8ZG8VQD4LfqaEjPQ4UGm0MAuAMKsXSJtGh5By5G4WSvFajQIuQ8DCla2/Kx2SScHb8W7c9JIsKdtjSOtZwRK+JRaO12SXbN3gv58yGNK/2YPeToOr9D9bsN0/hgtKc8uDB4+sCqJGBDviBq8/pWg1ZJMKr6PHwrgDPOxf6DlRu6AyOgGby6TKqjJ7TLqu/SlJtT2bNXPruXojYQB4K2ruH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 16:19:53.7819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec985b5-2020-45b0-2f56-08de9653d556
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234932

On 2 Apr 2026, at 17:21, Mohammad Rafi Shaik via lists.openembedded.org <mo=
hammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> +# pactl is a client tool; it requires libpulse and a PulseAudio-compatib=
le server
> +RDEPENDS:${PN}-pactl =3D "libpulse"

Why is this needed, surely the automatic library dependencies create this f=
or you?

Ross


