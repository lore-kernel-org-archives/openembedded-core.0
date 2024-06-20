Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF6BC27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 10:23:49 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.81])
 by mx.groups.io with SMTP id smtpd.web11.44225.1718879026799539523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 03:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=OmQ2dEIZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.247.81, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfEnrzSIkkJwZptX9xJ9l2YApGIEcKa//eibBA8FCybY9bdfQZCn9oPagK+LRKyzrPW1vqNDG5DwEMb9eLhXEpbEIhWZcmkxtACi53DxmnxG3VdgPzILikql7Bd+nvlSAT8xisGXU/oktv46X7GBDRF6kg74EcgmCC7Wp7Eh9uhrZvpOOmf3R8QIFs/5eHdLXHe+t1Yrl97+eiYFBpA9b0lde/n/jo6PZn3ZpEScyT3oeOiDZXfdO+zD1k5J1HR+32Jbbuy+qbkjxbuRDGYesxyrPJQzJW0jPbI4F1+FCfPXqU4Rmzg4aRZwkbYPu9aB2MGFWtmn/TMgfYKI4P+w3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5Rlb+XkNaA1vuJvmrpnRMhJTdqyh/h0JKa2dxA0B2g=;
 b=UwxRNTipRGeIcAZ+Wy32N8zeNV+D9kG2lGXAU12baxlkjg7NRq0e6oluoOmvsjGqD0CxLFM2dX6aEhS3wrvqChQNVwK53TUwxAlZK+jHXdn4rCZCSbKbkQiz6oecFhluoQTvgq29TNyXAZ7/L5sWirj6kX3sU1QBmmHvVsYHBb0KEDHOSGbYjIv+PudtOsU4YMdxq9L5nTTQtIupj4Dfl08oIDWEZh7RiGQFKzIA4owh20Ektk8T/cLYyiDrDKisXQvAmMW+uSkK3x30hW6FHkWOU79iFMO+ZoGYReq9KgceTSmykFBsDI29fSPqglEU+JcfD+Ei8A38CIbcWirNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Rlb+XkNaA1vuJvmrpnRMhJTdqyh/h0JKa2dxA0B2g=;
 b=OmQ2dEIZ2SscRhsitDcgkkXxEs9x3BVhL6UJhZbTM8cKzT4YUP/DKrvjYh2IbAa30pC28ANoKM3PuPjMVk1AdWO+qVtAXFjcdVp/m2FkpP+js37EeYrlIzT6bzKDmvzeITQVQeqCs1V7pDwSpaBbtYljztMHojuLXhZgcfPjUCs=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PR3PR06MB7051.eurprd06.prod.outlook.com (2603:10a6:102:83::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 10:23:44 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%7]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 10:23:43 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Topic: [OE-core] [PATCH v1 2/2] systemd: bpf-framework: pass
 STAGING_INCDIR to eBPF compiler
Thread-Index: AQHaukkXl8w5/Cnsx0a1rkA156IDE7HNzJAAgAAgpwCAApVifg==
Date: Thu, 20 Jun 2024 10:23:43 +0000
Message-ID: 
 <AM8PR06MB7521C6F1832FD8715F71A193BCC82@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20240609084321.1070686-1-johannes.schneider@leica-geosystems.com>
 <9E1C8B14-8015-4691-9BB0-B02F401895E5@arm.com>
 <651F4B44-70FD-422E-8F10-559D118AB389@arm.com>
In-Reply-To: <651F4B44-70FD-422E-8F10-559D118AB389@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PR3PR06MB7051:EE_
x-ms-office365-filtering-correlation-id: 658b13e4-378d-41b8-6717-08dc91130ffb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?6Ke+8oFW9sbCqUlqB7XaC5l2J1+Rzt7G+9PFicdEFLOia08jSW85qnMn?=
 =?Windows-1252?Q?dIK7YpttUTeVcjFtbjLgX88Gt+7TzIh9TupdgkmIW9g09RZsMz8NZUHS?=
 =?Windows-1252?Q?01BL3N9cT1G+Ig3ktKiyfxHm0z1vzxmx27ueWb0jpCltAJOXnTVXADva?=
 =?Windows-1252?Q?9z2zM80jPdqYzsOKYnoSDHkhzsJgtHvj8qTjwjzVPHNdcRn8Rxc+hk9d?=
 =?Windows-1252?Q?F6Bx7zul34zWQVmAaEWjuV0LcM9ZWbJ2H+EEONpf1pRRPfybdzFA/xr+?=
 =?Windows-1252?Q?9NiCrYENxlZBjALf5lvz9q2Y5qc8jz+izrwpNZFhZ50/n+b9pVoB9i3n?=
 =?Windows-1252?Q?tQq2LOcMQa8oy48KmFWNl4zkxCbw1F4qgFF58uBecIzRhbrXzIjHg+td?=
 =?Windows-1252?Q?ESC2TEarhCNSankApMXkR/U3baBqfPfzR/JobRC/G10aV/0eQrKXti/j?=
 =?Windows-1252?Q?SpGv75uaj2fIH8UWQP71e0vC0584m1BT5trI/5seP91BfOfe3eE5j40q?=
 =?Windows-1252?Q?ggNNUx0mp8kQVa7zRMLJvuqHzT5vgGbgV0hHlNm5LV0H954CrbJw3uyS?=
 =?Windows-1252?Q?7EkwH240YfJGVn+XPy6CaTN/mdQW6aWTD6otAM9AER0+Lyj5VySCWm25?=
 =?Windows-1252?Q?oTzNraUUBxEOdCN9CZ4a+9vA1T3ewqqxXc6tS4pr8vv1kGnvrL7Gpyd0?=
 =?Windows-1252?Q?Xu6YJCQxBgxCjep5bQtFIShzFuPLXzNgj3dQZUdq4TpDIShrK410bBgH?=
 =?Windows-1252?Q?4iI8YVtYIhXwT2fgi87Gm0dEnR8yGU6SbXLjSVJNLZbB+IUU8RftBM+a?=
 =?Windows-1252?Q?zfL87zsaW4DXxhGdiokk5805VwvE+bcsp3BbH97ajoXGDvs9f4Y/2Br5?=
 =?Windows-1252?Q?9wXA/YHvjoMDtqus9wVM4G9n2fcu9T1EpTlgVKU61o873nlUfAuPLjDe?=
 =?Windows-1252?Q?1aO+tkGW6oMJTEvUxMhNe4W04AUgDQoGfLNSoXHr623RI42dVocMjL8b?=
 =?Windows-1252?Q?w+d2MTJfvqHrQZDuOm/g/kq7Z3l45UaldUAsqdHmnp3s58bEaW2+DOz1?=
 =?Windows-1252?Q?qJ5+6DmzUVhaFkgcWSuEUY0JJ4qWMLCadKAYueOxZrVB/LDcg/27CJGE?=
 =?Windows-1252?Q?fbMKrWbkkd89RNJcXwFD0vBrClNLo0f+NNamjrc5ewePm5hLazElNTNL?=
 =?Windows-1252?Q?49h7YVoKA55TicMKfV15qLTI0is5NpPE2k4gYZg6wlr0uJz1DYqmrA1O?=
 =?Windows-1252?Q?al1WA+tTQscMAWmJIbM1QEMZhP3W1XLx9FGWtgnYhspcgDFEgNZjNktq?=
 =?Windows-1252?Q?phfqHtx7AuHblG9ptUdY4fzf/G8ZSPNvMfT7ZImfUUchrCk3Lzc3V3u9?=
 =?Windows-1252?Q?j0/5/cDL/m9nUPaQKaUE4uNMfNmmjhBeQv06525YIZXPDF52UfQE0Qrd?=
 =?Windows-1252?Q?cWOtZ4AQ9uAiBfixA5itf4KmAWA58Q/Iq7PNyracfyI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?Lkuzy9jpPcYYZaFqcoa4RMmBYuUkl86Kyf96AcRvgooWhAdLw+S2/aVG?=
 =?Windows-1252?Q?lET6/Ic95f26V5Eev0y/Fgc7ez91D6x86Np0mRzNRkRwuLWfEB4mt94s?=
 =?Windows-1252?Q?Vx2+obavPjXHAYfVibkawjYMQJ1WeYUqu6XKGVXLHtEeL0EfqeyDBQks?=
 =?Windows-1252?Q?3rL71duwHGaawkUmS8vf8FtlS+HcqeP2muNZItdBfFsqY2zlJosTw8Xr?=
 =?Windows-1252?Q?NdlC2u509n/TZU8ejwlhq55fS4URaSL6NjpwXPgEhLBvpTQOwEnqplUH?=
 =?Windows-1252?Q?HFDts1X9Uf/pGrWjff/1TOQkk526nNpoitfEovkx2loehuifh5TJJ/a7?=
 =?Windows-1252?Q?HdOi1L1rzUVC1U9DKrxamcpIWWRL233psEuB9Cs0E2aNjGqsC0f7DV6s?=
 =?Windows-1252?Q?I9XkBFFwbYuwbNHmKHR60aHIsTVg/Oc075McqlDaxJYp2UI9WQlkRWvC?=
 =?Windows-1252?Q?jBI0hDWpr0Q2Va7V9a0p8CECO91kiwpmr4OBLsEsQVb/OpPiH5r8YWxr?=
 =?Windows-1252?Q?gfoK3sM8AiDvNwOCtiHNFHdZPj06xolFfTtbQF8azsPZCS519qPYRbln?=
 =?Windows-1252?Q?jFFSAXDIZeWBieXnqVWPdr79c+syPioAHj/gzkaUei7J2+OSMIhyZsHn?=
 =?Windows-1252?Q?0ac5I7PjetdWgpyTW1Yt98AHDK8Xta551b8YnJ0tAjkOrQYylsggsQ3Z?=
 =?Windows-1252?Q?RxATPmgH26zs+VLNuu5djJ4UeYIlTLulkdASzsOyMpR205pLyxt3fxgW?=
 =?Windows-1252?Q?UVUdVHFpLb5P3B7i2vbOCURvmgf6USOaQ3UVhc9rpTcNw6B2Jlh22Z0h?=
 =?Windows-1252?Q?fzczkt0hRmSVy1zXgDdmUm7t5xhjgWU/+VXYFXc78qrHi3O51jjxeWn+?=
 =?Windows-1252?Q?cWyy/SCXlZs6kDhfGetKJA+wfQJnmqrn2flCXlIG7gNUHAi2xGpIrsT1?=
 =?Windows-1252?Q?j+pj360xNdsfa+E3/lZpcHuuCnVKXpLmjJ/0d3hH8EsUMFSn/IiP/7I9?=
 =?Windows-1252?Q?DJJbdqVDoUPabeAnoSoLvEwxjkYLEeAj6qavj4VXyGPZgRGaujqDtfXN?=
 =?Windows-1252?Q?VSPiOOgMJ90RfBXnlc4YaPX0E5zOq0vg40TT1xgMuNrVQRsr1dorMkPv?=
 =?Windows-1252?Q?dkanL3E/cPAVy05gVE37lMJoDCpUmCAFwrVWCQFQYQcGNWZaMc8gTqfi?=
 =?Windows-1252?Q?KTHHYdJP0Q+fBpK3ehyVyNcFcb/ue7yI7CKheY2LLAEQppRaaFXsG4Nw?=
 =?Windows-1252?Q?y/Smum7g1KSkwSStdgeJDW8w/ETSq7i3G9se7OhTxoZ2ouMimtuNG3rA?=
 =?Windows-1252?Q?hZVeWD62irCMisUisT1PRsXE4/tb9OYmbj6cEduZ7o4aHQKbk910esL0?=
 =?Windows-1252?Q?Uc6q3RtFqu5zErJxWHPPlC7QnWC2P9OsJefPsa4Bp8Gsvyp6xLVV6tW3?=
 =?Windows-1252?Q?CjRFhcRrCgMYKjjdkxW049RiTu3SVT3BhBnMGq/5BEYnYvoUiaQ0Ueje?=
 =?Windows-1252?Q?5GHSX0cVddGYJFy2IOBhlJwTvIMKjaVwIeJACWj4SphJaDTxPYNxlQBv?=
 =?Windows-1252?Q?o08oHqf5/s8JUsB9239PSCziffwUN4biH8MmqHfUQ6N+4Wh1VEclBltC?=
 =?Windows-1252?Q?RcSTEZOnT7J4/h52niluIbBINcpRDfPuK5V4l0m8iSRt8ew7tTuEgBsi?=
 =?Windows-1252?Q?Xf+L1nKld4x8Xj//fEprhguM5bnSdXgDva5eB76ItBah8UKpdWDaRXPY?=
 =?Windows-1252?Q?z/+syGorNaJ9ShJj63aTaHdtlQtDKoIM9cqwRum2t06q56ZAQVQ78IoI?=
 =?Windows-1252?Q?0B9NxwcgYmZMxW5esGjeXF0OweE=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 658b13e4-378d-41b8-6717-08dc91130ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 10:23:43.7923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZEYXG4Y7eBY0ALav80D4+FdafkUxf5I1q3XcFjFBIYfseTZCoPN3cXq4/ZiNeoesb8Mg1DpPfU9Cg2JSYdQThn1KogMcnUpfEHv6u3yW2ca9peD8/mRC3UZ623WDwaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200944

Hoi,=0A=
=0A=
> >=0A=
> > I went to have a quick look at this but can=92t built bpftool:=0A=
> >=0A=
> > ERROR: bpftool-native-1.0-r0 do_compile: oe_runmake failed=0A=
> > ERROR: bpftool-native-1.0-r0 do_compile: ExecutionError('/work/ross/bui=
ld/tmp/work/aarch64-linux/bpftool-native/1.0/temp/run.do_compi)=0A=
> > ERROR: Logfile of failure stored in: /work/ross/build/tmp/work/aarch64-=
linux/bpftool-native/1.0/temp/log.do_compile.1052635=0A=
> > Log data follows:=0A=
> > | DEBUG: Executing shell function do_compile=0A=
> > | NOTE: make -j 64 V=3D1 -C /work/ross/build/tmp/work-shared/qemuarm64/=
kernel-source/tools/bpf/bpftool O=3D/work/ross/build/tmp/work/aarcn=0A=
> > | make: Entering directory '/work/ross/build/tmp/work-shared/qemuarm64/=
kernel-source/tools/bpf/bpftool'=0A=
> > | gcc: error: unrecognized command-line option =91-fcanon-prefix-map=92=
; did you mean =91-fmacro-prefix-map=3D=92?=0A=
> > |=0A=
> > | Auto-detecting system features:=0A=
> > | ...                         clang-bpf-co-re: [ OFF ]=0A=
> > | ...                                    llvm: [ OFF ]=0A=
> > | ...                                  libcap: [ OFF ]=0A=
> > | ...                                  libbfd: [ OFF ]=0A=
> > |=0A=
> > | make -C /work/ross/build/tmp/work-shared/qemuarm64/kernel-source/tool=
s/lib/bpf OUTPUT=3D/work/ross/build/tmp/work/aarch64-linux/bpfto\=0A=
> > | DESTDIR=3D/work/ross/build/tmp/work/aarch64-linux/bpftool-native/1.0/=
bpftool-1.0/libbpf prefix=3D /work/ross/build/tmp/work/aarchs=0A=
> > | make[1]: Entering directory '/work/ross/build/tmp/work-shared/qemuarm=
64/kernel-source/tools/lib/bpf'=0A=
> > | gcc: error: unrecognized command-line option =91-fcanon-prefix-map=92=
; did you mean =91-fmacro-prefix-map=3D=92?=0A=
> > | gcc: error: unrecognized command-line option =91-fcanon-prefix-map=92=
; did you mean =91-fmacro-prefix-map=3D=92?=0A=
> >=0A=
> > Looks like a problem with the host compiler being passed target flags. =
 Have you seen this?=0A=
>=0A=
> Yes, bpftool is passing DEBUG_PREFIX_MAP to the host compiler when buildi=
ng natively, which won=92t work.=0A=
>=0A=
> I worked around that and had a look.  A less ugly and probably upstreamab=
le solution might be to add =97sysroot to propagate_cflags in meson.build, =
and add the sysroot to CFLAGS directly in the recipe.  For historical reaso=
ns we pass the sysroot via CC, but specifying it twice won=92t hurt.=0A=
>=0A=
> Ross=0A=
>=0A=
=0A=
just tried out your hint with the '--sysroot=3D`, works wonderfully=0A=
-> i'll rework the patchset into v2 to use that instead=0A=
=0A=
=0A=
thanks!=0A=
=0A=
gru=DF=0A=
Johannes=0A=

