Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FA3CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:27:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.59])
 by mx.groups.io with SMTP id smtpd.web10.18382.1761924443669980969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=r9SDawJt;
 spf=pass (domain: siemens.com, ip: 52.101.83.59, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtYg7ABp4HomdUjAry9X7cDHPfc46gtFQlp5QD5IY5TkZjw4tsDko+J6G6yfSdVThE5fGyB5vuE5pFzafXl38ij4n3EbmfO29L+okjdzX+5f5G6t/fm0wbGK2AdNgcI8G4BiKrNB77hBMe7BUqkWs+C9VCu882ZdOaStu2R+WEBkEUg6h590jeBqqIO9Lyyri53xG7r7dK8zazXllok+17ukNs6pjoRecuO82iQllyw/FBs/Gpq2z3sd7M7RheB2xG8ZT/04Ji36kTkATnG9D8Th/Xztzn3b4brbHUPSeyr76nHyplGBeyG1CHFjNbAD41Gj02unVWmjcflypl8C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrJ5eETprxtGTmJdpRjjHD8F8xx5Xeq4MFTOL2pWJXI=;
 b=cLRSighUVh7v+54d4q6Pm5eHztr5bP2Jr9L+5LubYYfimaqnt69bMaNlXVb/rFtaY3r+sYcI6VlWV5cXVEpIyJV14luPEbiR6WX/ViI32iA+ESjmb/4Pjvr2pNEEC3Q7Nl2VhPaLypkI/9uQfAuVO+JKxGq5XSYzZb3nVpGivOFoJRRrTCE1mMxRHtZNVnQtwlyjrvU55jh4HqT84hPOC6GogpXeSwlHcZ9g20NPC9WJe3NWljyLm6JT2RoeHWkB5sfPSOS211PDcY0fgfLdeabAy63nWgcSatEpfmQ86evtXrjDoON0jArt+Gs/bYqDGl1gbotmKEZqovtzxmnGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrJ5eETprxtGTmJdpRjjHD8F8xx5Xeq4MFTOL2pWJXI=;
 b=r9SDawJtEyFKzebkvnQW7MnR6INUnp9plR4WMT6954BhIArQDYPcF8MNGVUEgP0qLspQQlBG034ua+yIRercLI41YNSC6j6PyF/CxHyw+Qtt6FkvYFULGk+MPSv4uqsfn7zp0JrpnnI4jqxLsMhWgU6sW6GgODtmlbbAfMMvcVqRnEy3HNr6k6LNkV6VpqEMtMja16pmIigXw765OPMVQhSajUWyd4b7kM1M/0fcGWFYas1Ov/vdo/T9bzi+8kq/w99XXG+l+6fpjgi3PFq5+MmXvIhCaJQq3cQ3I7Cxh2K4np/Mlhs9h+DjGYFoM5rGuz98eD7B4wsYCErc98vg3g==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by PA4PR10MB7963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 15:27:19 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5f0e:551b:a85b:ce7]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5f0e:551b:a85b:ce7%7]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 15:27:19 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Topic: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Index: AQHcRyyLu+jKnv3BeUm10W+ojPiVjLTcWt+AgAADauA=
Date: Fri, 31 Oct 2025 15:27:18 +0000
Message-ID: 
 <AS2PR10MB73474B34B80ACDA904F1045FDBF8A@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
 <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
 <6BBAB12C-61DC-428B-9C3B-422EC35F114E@arm.com>
In-Reply-To: <6BBAB12C-61DC-428B-9C3B-422EC35F114E@arm.com>
Accept-Language: sk-SK, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=d4e65582-fad6-46d4-ba91-d0ba992f9d52;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-10-31T14:54:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|PA4PR10MB7963:EE_
x-ms-office365-filtering-correlation-id: 68759493-6b32-4800-c4a5-08de1891fac6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hBAeUndU8STKYKs+jVDC21Ll3VsDEqyLHwnfbP8Zxltu+b/WtGOCMfVnZJq+?=
 =?us-ascii?Q?S/U3Ja9qmg5ImPH702D5E+2TXmbjnMbMBM6kArmlxT6ZKYoL5IH44CCFszpk?=
 =?us-ascii?Q?cE5vTH9NuZzxvXl3DTtq7Rc6UO4ahpmHJPYQ2/yK9db9SbD6po4q5PKbK4Zz?=
 =?us-ascii?Q?V0N1AUynVOcBv1512OVDawEUhEuWmEWIDvRcF59PcWJfMWg6IjNBnF9ZuQUh?=
 =?us-ascii?Q?94cP3GuLVoyFNjUj8I8+bv/vnAsyy7oJNvWiWiTNuq++I7kq3eS5R2MijubQ?=
 =?us-ascii?Q?8nnpDp+VFCCYDwNOF4lWXqiGDFP0Z5oBck6Y06uIScL6NdxPX1UKMmOOE3BX?=
 =?us-ascii?Q?oAZkBeLb995LQhMbyqNPkuT9Z1KFV3yH74TNAJQ5/XpaWYoIRu5GlOrOXDCn?=
 =?us-ascii?Q?RCfIUwwM3s08hUQ1Sje/JaN21xldCnUl26HkDKghS/gzwH57gt/PmTF6j8Aj?=
 =?us-ascii?Q?Oxej4HH5pAbN36ALUrdIElhK9Rq1W3g73zC7fcTFUXUnwHIKemwAwmndZNip?=
 =?us-ascii?Q?bIWKhcwe+PdEjpUzKNbAtDGxxi6IX0+y+QiCKEHZoiow86kFyaOAlcLj6ob7?=
 =?us-ascii?Q?6aF7V8ZThil+SIxdMTXjcaKD4jBcKFTfJRWZiKnxV7DYtr6+1FlntRACfEkR?=
 =?us-ascii?Q?9BQ72ao7PAuFXgDalGDrYOnaKaliZLRe41gtbwlMvQRcIaty+nmy9Jhxsey5?=
 =?us-ascii?Q?bQVPXhyT3tGc5efSKlZWpkAAl0V6AU/3SmGN+t4i6/Od0PrzBMNQETwOACTh?=
 =?us-ascii?Q?tKXATwvHzOfkApRNm0guDnmNth0099oOQyEZhQLiYi0ghM3OAM4ycA4RFttI?=
 =?us-ascii?Q?r21GAIyNzbZUE6hPhyMdAkcJ6bA9d/19XB5qC4kX+wQ5hXHnf++tBGetBzbt?=
 =?us-ascii?Q?CfcHtWg/UWWVg9c30ZQreogOE+5i6/ATMkyNNvbm8fy/btfHDEElnSpFKynn?=
 =?us-ascii?Q?DCSWh7U6/sEwctUUXDiflJVpFlBq6tdbC5Ebk6pmrIeaIrA5YskieAjMOFvy?=
 =?us-ascii?Q?rqzuB4n+SsN6w/yMvfwjXnediWSp37+8/ofX+sV//olEZaw0fAwfO04w7Ufw?=
 =?us-ascii?Q?ARXkTtGQBi/z34FDwfyS3ZwCZ/WB1orCF0NDnnrfrDTtSBv6EHd/5BiUDpz4?=
 =?us-ascii?Q?QeGBAwM+DWzwmawIj9Mszlqt963wnqxXjFD6pGTHBEnaFnv8tFaICVKvwFNX?=
 =?us-ascii?Q?PqY187qqqM9Jfisqae+v/TvW+t2R0DkXzABN1RCzBiJWX4QOk+2AcvCP3mZh?=
 =?us-ascii?Q?P3gZD6EOs6qFqDwe0Q/a4gUBsBO/d0Bp4kv9qzLlZetW8CsULSSBPz+t/sQj?=
 =?us-ascii?Q?1ItykGXivg9v98Eh2hjtySYkXWDEW0JMWlaL6jE/tahNgNrHlbpsxvj+cP5J?=
 =?us-ascii?Q?IN4ntprCc/XejT+mdzFJlQ55Hvzh1mRfYTWYVTfYgm9//ET3OHrYxw5OMfIM?=
 =?us-ascii?Q?xIn7Ci/uXeS/xxf6VTy0iwKEkaWHDSddnc/wkB8V8hy5oJ3XkESmfGqjowQK?=
 =?us-ascii?Q?dEqadtUqi3PK2pHDUaXdEIORs6hh3nfuuGIJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dDheVCZs3ydO9lbgGs36dTIMaRA82bh5YI8lM0an48+DLZQbRbOF1B5R3UQ0?=
 =?us-ascii?Q?ZL+Rvlm4K93ZDiVmxLagaBtdLwbZuMfmLOSxwJjMdrsM6AVrBRo7SjEuunut?=
 =?us-ascii?Q?FrnTvF0EQnXztQ4n+kG3Keo0uCsIE0URZnh0DHAHtG8DQ6Iq6GGrTMSDv8Sn?=
 =?us-ascii?Q?iwNp7Uu2j97fh/KTd2uPSvzuwSv8Muhd90jw050SiwkYFzTXLZV76ZGVTEcD?=
 =?us-ascii?Q?hiwFv/EKGW/qK9ZS2zxAXc/HktS7UXXvcvaFnoSN2OkiCULxH04eVsI4utg6?=
 =?us-ascii?Q?HXe+ah4HRCxBSK+IRY3GviHefL+XhVZHcKxO+FWo3A3lrzwCK9bPYRJ2AY+y?=
 =?us-ascii?Q?ClhQfix9XOlsnPeBkQ+LP0LErvODPFJvquMuPW6rKiXBSli+G0wh/pMF4Zlo?=
 =?us-ascii?Q?BGd4A8aDRN+uupqDLcYoYJG3IslJFONAuTxM/8vNOvt//INjMrp9j4P9kBnN?=
 =?us-ascii?Q?8MamFjsLn/cnrhGFJQgCnVqhRa0Vfy8lx1Th19Xhpbhy47BQZrH4PKCdxWvN?=
 =?us-ascii?Q?z+VkKHjz50geOQmtm1w/e37/JeMKbx3q/Ze0VPBw38rRa5PI+4fdQkLg9HsK?=
 =?us-ascii?Q?UDj4nS7gMUm1WpsBg7vbc49HAmw3DPeEBB1wQr6NFXnAYzi7dPgm3cUrNb/D?=
 =?us-ascii?Q?DDChf1vFFxSmAIPG+Yg6ht5NEvP01BEYJcmB4ebWf0TD7SjCU8NQT3guXn38?=
 =?us-ascii?Q?8KxOAW/ezW1GwfvU+//eeegGSo+4r/h+1njZzV32Ep39gJyjpYXEzWJdmKhG?=
 =?us-ascii?Q?xwzkP6tQgR3XHc1ASXv3Yk3mepp4Hjcj+urhGgaqhTrr4YNgmAJdqvNogZrt?=
 =?us-ascii?Q?C0XrJcMLJMGYa+1wcETzh1zQYcYf4cX6P3iO6aaFkbagt4Xg8G5UuMw83MFR?=
 =?us-ascii?Q?gQLCni3/nWisbCLP5F/C68dsO/lZG5pjX84ZRM2sdkAnTqmM0013jdvSPfZB?=
 =?us-ascii?Q?Qv8DZ2vYQsNyRUejdJ/Ip3Atn/MKETaEuy+KAL6/bkjXPEh4TkyeEQnVbxUe?=
 =?us-ascii?Q?5683P549zBrrMWgim80m0jqWzeTbEfvdc4VPgjbq0+ndxvw2RZrnmONvI4vr?=
 =?us-ascii?Q?spBlxCNcxQosoiHpVv4uSmzqWfsh6g1YTfTwxOqD+cYKcVF69to+PV3rmD5u?=
 =?us-ascii?Q?yOgkbsmelbYoPRDaf293ujx+fSSLLbqTAuU2BC84aSbds0jj/j78fKWLsmMV?=
 =?us-ascii?Q?0XTZE8iLhfbmfyo9jEoKksGoYnPaAZ+wflcDSFoZWKehMqGv7MRqyZzw0S+5?=
 =?us-ascii?Q?+5bW0E7JUc7VCLHkdVJRpkRhLTm+G6YBzU4GfxoImkdGELGlOvnogeZYqUB8?=
 =?us-ascii?Q?sNw7kFipViYgBjo2f7aQvNIb23jz5jqnpEvsyNn/BUJj72emrCAi42kB0HR+?=
 =?us-ascii?Q?S2ZpHy9gjyY+Dv39uYuXWhtisjDjwrQn3ow5CXJr6BEyruRtHEwiVoPCl0TB?=
 =?us-ascii?Q?ezr3RNiBSKrzglevI2gDjxKLn5pl33r4rYg3HmEW624zHEhqcqNhB5PQ6DrE?=
 =?us-ascii?Q?tk27rvFc+3FMvnOWaDCg9PpX8KUNLRURtNSjc9/EksusWmJld/+4wwEuBiQ1?=
 =?us-ascii?Q?na1TE+Vc8dkUXcYx8KjDklrj+iW1ztfmpFGKdFMeSUnuJQp8oxJP6IOY0U9F?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 68759493-6b32-4800-c4a5-08de1891fac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 15:27:18.9544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0JMchwuvh/xn+b1x2HDlYY7uXiztd2ijnyP2iQQ7xATeSM+A9zIgKU40+5ZlO3xTUPJvcHr1ACXBi6LWnIw0zfaHDJteTLmrBMEkI1wp+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB7963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 15:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225543

> > Rust's internal LLVM requires zlib and zstd compression libraries when=
=20
> > building rustc_codegen_llvm and other compiler components.
> > Without these dependencies, building Rust for PowerPC target fails=20
> > with linker errors:

> Is this still the case after we dropped rust-llvm and now use the same ll=
vm as clang?

Dropping rust-llvm has introduced this issue. It worked before because rust=
-llvm was configured with "-DLLVM_ENABLE_ZLIB=3DOFF -DLLVM_ENABLE_ZSTD=3DOF=
F"

> Notably, the patch to switch from rust-llvm to llvm included this:

> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-arg=
=3D-lzstd"

These arguments don't help when compiling test binaries. Providing -lz -lzs=
td works. Also notable is that on other platforms, it's not needed to add l=
ibz and libzstd .so files into the qemu image used for testing.

Peter.

