Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FD9F4384C
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:33:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22123.1776267217329649882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ek7JfA/w;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Ek7JfA/w;
 spf=pass (domain: arm.com, ip: 40.107.162.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YI+LZFRmNVGCN05nIzCixWqJoEjHce9vhCC4OmdaEvVm1S8fgXDd19L+FTcQb030yjI6uazC5oqrozLWKHXvDeH9HQcGr9uQttEjQayMKmeNZa2y2k8o5JyRMb3lhZ1Fe/2jqIZJ/FU8TYcL3hhG2HdNYlY2YveBFvyzKJBuXwK8RrNUcfepgsq2WU6df0ALgKCEzXWuZ6cQSe1K+eOMT0fyANNjZU8QjZhwMQWohAveU4JH+lHZTZpQYDWYcJ5a5oMGnRqPnRxGLWWdlwsdUxMVeecauv0dC4m6II9sR41eAZSIVrwcHuG18jFu/qDUNMfDvTBW23FbfNcN7Wcj5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA32ahlKcxdVep3RWTMBITYcyI2MehfoQhRl6O9O+uA=;
 b=jPR8Mei8lrwq/EYdcwxqXCbXPthgx2V+z8eLc9LtxVevEKqCO6YvKnQ6ImPLbrtNdv+ijZ9H6KZPrxODKgLKCnPc89FJmnj4dQmOkBJUw5CB380gcgl7q/YEVxUPKw6ryiNDjt/ZVShj7agxVxIGjhSl/1WrVMuUu83uPNTZpQoow2bg6mphrzHGQtNa94tkzKJEzo2wNBwVqyyhcad7reNy96MZUktMfcar9YQ33HatV/j/S9Q/DRHu1L1OfE9xTUjq282mo8qHDunjwsQwX5avknUQ0gpfjWGKKus9S61uCvfZsvmM4KH5x+iNqIk49hThsx8JyZ4iQ1kDh+AeeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA32ahlKcxdVep3RWTMBITYcyI2MehfoQhRl6O9O+uA=;
 b=Ek7JfA/w7fAbd3t4iagDdZCnDjlQEPk6bHp2XMJ1YfeGFehNMavyRyhciap76JahXzKvcGvbj23sk97N8P3uJ07YM6l/paS3isfrx6zhvFJ05oAeZaI3/LcC/oS2f6JttPkIt5sRnS6nioyhNEN328tnKweJGS7ruzd42zmEz6Y=
Received: from DU7P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::12)
 by AM8PR08MB5571.eurprd08.prod.outlook.com (2603:10a6:20b:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:33:30 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::1b) by DU7P250CA0019.outlook.office365.com
 (2603:10a6:10:54f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 15:33:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 15:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN0T1M2Sd0njyJ++wq9bBouw/bmmvU+hOmlrxjZK/MpQJcm4xkadf+CbCWMn+CArhUUkt4UmaGMvgBAT0V8xOxlJm9MZlVsztsviRhCjeFUvvKpW7lez7pf3NIDijtmcojZZLjTg4V6azCVeTDIAc8LTE2k2yLbBWLyVJ0hKAmFGlJhzOzSJmPHUsEdT4UlHDbColp9/tbh5bxmIEsb/NdDt4wvzD3FrHaZd0mS8KLxvWxubGfO0NAau7VclMYsHvpMWf2IjvOLjg4lCnB9+cpc5EPf1ktE+w/QKM5pw/wmgpfOEptLMTvBwt+AvyCJbVpxy0ocsXVE7miE7/CGcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA32ahlKcxdVep3RWTMBITYcyI2MehfoQhRl6O9O+uA=;
 b=gH8+7FiEZIzR+Gd2WqbGtPQ2WENZlzBuosCuGjG5HUGNgAGcYSDuD5Ws336RTIp5bcG9lLQT5AgogxB/UJp0h4hrC958eWAiHZwHCeJUH3DhTui8NQ9lj5Hc64Qbmje4gY8/Cvfa/1PVXhoqSzqJEedLCJ8lW5RV2wg0ZCiPyQRpLkV4RT97sp9ufDlt/vmAi380nOgWEMF2ywQNm12QBkJKaguOugSaeIzQ/y+m5rLgAimuqr0d5YuZIYJc799ZX1ygPIcPRHSntjli4EBDrMiq5kL9tThTP9DB4mR1YiOnHgSY/4gVfDjBhnHh6JIUgjlVRsR+kaOYFymTLk48Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA32ahlKcxdVep3RWTMBITYcyI2MehfoQhRl6O9O+uA=;
 b=Ek7JfA/w7fAbd3t4iagDdZCnDjlQEPk6bHp2XMJ1YfeGFehNMavyRyhciap76JahXzKvcGvbj23sk97N8P3uJ07YM6l/paS3isfrx6zhvFJ05oAeZaI3/LcC/oS2f6JttPkIt5sRnS6nioyhNEN328tnKweJGS7ruzd42zmEz6Y=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU0PR08MB8397.eurprd08.prod.outlook.com (2603:10a6:10:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:32:28 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::9c90:b612:8e37:fe68%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:32:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] u-boot-tools: Add dependency on libyaml for
 dtschema validation
Thread-Topic: [OE-core] [PATCH v2] u-boot-tools: Add dependency on libyaml for
 dtschema validation
Thread-Index: AQHcyjCWzk50FPrwREaOp4ro6GLhwrXgRbOA
Date: Wed, 15 Apr 2026 15:32:27 +0000
Message-ID: <E0CF1B73-5076-498B-8FF1-26E0F519FF01@arm.com>
References: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260412035757.134385-1-khem.raj@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU0PR08MB8397:EE_|DB3PEPF00008860:EE_|AM8PR08MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 914acad3-db0e-4970-27ca-08de9b0458d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|18002099003|38070700021|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 
 TsAS2U2L+IishkKejw6GSrWsRpbUmIa6oSgqzBwMdv2VVMs0Yut0FzNvOCxmnA5LbPGuJ+AzLq2tVcs8VH2vMfqavQaAKUt5fOpNXf//0u+c1vxT6Ml2MKPEVIHQfkL+pDcZXgIo7kLn/q8HATh7I5SMDCG0hmU3n/foiioTQXD1uDRswrU/4yl75qHa0NQWf1SrOvjeT9BOekg5+SbZSNcrNJDvUJHTCdoZcTtNRxPLnlxZMUU/6bIBz0cqNpEo3i5klOGA804CcOUYGIQE6s4/6oPTnBboHCagdQgKOGy655glFbxHjMWYMF2534uG2SywMIa/KXVJ+mf5Ce90+h0GQ7g/1Ph4U8XHCUXXujtnwVgEMtfLkl03MUJ4aTJdW4RAmGcaH0rjGpk6HLO3oQ0bYjEWYGyelNSkG1CZMxAQOwLirWvzOUn25Gvfb8wYE/HO4IPgnHyvBMqPlbUb2D6PrXz1w61wN4b4r4GTuaPq8eAQVez4D0Sw65q/9Zg7yTicQAiupQZ5HWc4CJaghMcr+klt3n9Tggyk4jkrNMZkWQ01g5BUrt7hQ8QzdsO6NK2DnE1K5LGzfYGhJK4j5G9MAdJXCAzpeTBDyWAsaIF5X7MtN9QU+9bcmir52XC0eR38orK6SnNFFv95VhqKEVIGPCXcfzhZVuSqarJSjTNJsHynvOTkTVAsE9u5j0n/+snrokz7qAdyW7m+PYWUrJaXPfXGeNgMlJW4n8i6M085/RvoUGyRcKwaJViX6rca
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(18002099003)(38070700021)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D6AC95CEA8E0E42B023395D0FA171E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 CZ1ugFVFRVES115wt0MoKPMkdYjgrOVgTmb+tsZew6I+XGvOS7nXPw5YYGzwbhIVns4/z6BxNGP5cxveo5PoC9vk2Ul+7WDr2Ep0hWyq0Q5SH/kUWADAP01g9jR8iqenRJHeDnekDYzzERuS9wlSD54t/rwoMaZVU1C2AYkLDsUB3fiiyfnLNnDBbZNAYZ15ClDXTvBHRkltDQAAjO6ngVoi+o+NTbk7VmARSRjo5rT0sw0qn7t0cs7Ugr8jO+GCo1E7nrslZrjgTbwNCF6bWw3ROwzl/RxgpX2p0GB/vW4YFaY/2BaNlw+iHMZPJJi4Wc6SPASA98vxWh/+yfxIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8397
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d257974-785d-41b9-3053-08de9b04338b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|35042699022|36860700016|4022899009|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XC6g8mNj1LEZ3yVgedg0lD1g/JHt+CXql5F0MVcYsO4037NkrrVs0WDS51jRW4gwcCxgBNFZ1UjMM5njP14gdv/UpX3LTyNs+nUNoycgn0s846Pp2B8Ur0VU1aPDUuKIIfKckbiNprD3atKuPMVVA9B68d7p/dfwECoAoei9Nq3Xlu6R7hmRfh1E1/UZZFGElQparIZMaDsL7I7EG4N+9l2cnXJ1mejb2fbdv8n8aHzXXLuPC+Qfta/lKXH7uXc9oy8gvYbzVRlQ+wwJDOS44yI8OAoRnhf1gCJ42GOiYQNlFAToxc9XKgc/t45BMfr1MXRbdC7XfEHVHDJop0Lttc85792v8/Y49lj7s+KASEbClEAQylAKogbprjBvEuNCZ09g5/qbYMxoAewxjIWaPRE8P0A1z+Hy184rRtSW1h6AgoDct9pAFD7Wsu6M0iZmFQnSwc6LMoN0EbVt9Cgphgw0BQl0gKZIWrCophYKj5QSizBzavwasPubSDeNj3RzzuOFZWczD4eVb5SEb4OMhNE8bP48W55DMXyfMEfFdJmqu00V/1sRuMFIp/aig7SXddUqf5Imv/Iy/0MPFhHSx8lRN7kElYdGkghQxwGHYLlIogDXYi9Gfp/gdluW8qAz26Eq6dDlHArkdnfKZGpgwiORVyjBDHmlbHJcm5pbzFXYhNW6ZMNir1GNPkxLSRS3bo+zzPN6TVLuk+hwca7vifkNQh0HDflwJhMaYpHwbIw=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(35042699022)(36860700016)(4022899009)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2X4yjC94hFC2FITcl+QR7avuWYb4xi2k1jMp44Nt6JqDuN+DPcvcEo2KxAELi8E+olQrUWxZWEtRS1Jc0EoaZGZDdO7h4DJertTosotAr639tK6+rns1FxtsFdwJUTRu5CKW8VmOr3zWbLuiEeTmSeeXmKVjHl/kG8+IWZ7iqrXDPegwHW40hG4ENZ4dLHxjT+og3c3cvpk6JSe1p+ydZkG697xPU+2idqS5x0O47ggwbskfgbC2K3Ywi56VGgZESwOjzTlmMTZr+CrsXxDiDQA61G0vIvl8FiCVKo1Q+9zclP0VT57qjaRSSx/bAx6gwAPzRnwp0UpNS2jDpMbN98bBnyApjSXerOVimfClFtZRL9tw3EF/YR2OeXol83IeKaagLFGFXZzESZtKMht7TF4nvScAGV9RvaDrIcF4HBAAlg43kZfYlJa9IHsMe3Wu
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:33:30.5327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914acad3-db0e-4970-27ca-08de9b0458d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 15:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235311

Is this specific to the 2026.04 upgrade or does it apply to 2026.01 too?

Ross

> On 12 Apr 2026, at 04:57, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> yamltree host tool, used to emit YAML from the DT, is now
> built as part of the normal u-boot-tools build to support
> the schema infrastructure
>=20
> Fixes link errors like
>=20
> | /usr/bin/ld: scripts/dtc/yamltree.o: in function `dt_to_yaml':
> | yamltree.c:(.text+0x91b): undefined reference to `yaml_emitter_initiali=
ze'
> | /usr/bin/ld: yamltree.c:(.text+0x926): undefined reference to `yaml_emi=
tter_set_output_file'
> | /usr/bin/ld: yamltree.c:(.text+0x933): undefined reference to `yaml_str=
eam_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x93e): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x957): undefined reference to `yaml_doc=
ument_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x962): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x983): undefined reference to `yaml_seq=
uence_start_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x98e): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9ab): undefined reference to `yaml_seq=
uence_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9b6): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9c8): undefined reference to `yaml_doc=
ument_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9d3): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9e3): undefined reference to `yaml_str=
eam_end_event_initialize'
> | /usr/bin/ld: yamltree.c:(.text+0x9ee): undefined reference to `yaml_emi=
tter_emit'
> | /usr/bin/ld: yamltree.c:(.text+0x9fa): undefined reference to `yaml_emi=
tter_delete'
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> v2: Add dep on native libyalm alone
>=20
> meta/recipes-bsp/u-boot/u-boot-tools.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
> index 4e4f7fa092..a055409c2c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> @@ -1,5 +1,5 @@
> SUMMARY =3D "U-Boot bootloader tools"
> -DEPENDS +=3D "gnutls openssl util-linux swig-native"
> +DEPENDS +=3D "gnutls openssl util-linux swig-native libyaml-native"
>=20
> inherit python3native
> export STAGING_INCDIR =3D "${STAGING_INCDIR_NATIVE}"
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235052): https://lists.openembedded.org/g/openembedde=
d-core/message/235052
> Mute This Topic: https://lists.openembedded.org/mt/118784443/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


