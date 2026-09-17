Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61027C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 08:46:30 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34934.1789634781024881152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 01:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=C04eWca5;
 spf=pass (domain: siemens.com, ip: 52.101.72.43, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iThWO4034gI6zCPV4KYAuf9OoPjRevDfCDT6ZNWbT2l2PH7jX3Q4H8/JQbPlKrYd/Bi9prwCSg6cluBkdn47BUqlm8gJdzDni908/dfiQuG+klnDlX4+bVRBiztf/FtOK2I4z2i83PLl53hlJ0orEIV1DyZJR7j6tr1AnlypjcKehqKS/f2qw3gJcSFPUhDsujrTt42iBIIBv0P79AL/QTEp1B39eur8fvLULp4m3ew8yvjyY3miEn6Thl78gg39syjtpXcw6LAwym7HkSqlNhaanQJhCrtAXAHrrT/F/Y3WJ/Zj80uHUU/NBJJjC3z//tJcRfwaWPUCRtctgh6pUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH75tleMkEHr6B5BNkzt/0qmhL0uClrmN6S0JhRGjUA=;
 b=LGGv7w/K8sQe156BfR0Yapgp+9OAeqUoVkZt53UBq5TnQQedHcNOATd7gnwJvmZYBxzKinE6jvXabCUUDHClpP31MibOsy6ziNyVjTm2BB75YHhbQe2D5NSwNBb6Nzk/GPBmQ2dnj29jnMhy/0Dks144xNtLygCHReKwmLW4m4nbUwdo2HCuQlY2yAxqR2fFnh0hoOpBwRX3cSZ6YitUt1y2CZ3UXDic9rOIN2zgVOJs0qCQOIIsNenFeeMK7G9qj8uZO3ecl+GI7Hvqim963edxyLxjQmsf/EcFCpG3KaaZZlMld0n+24/7w7EcdTA5OJ3R0nwKBG80DtHDkkOEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH75tleMkEHr6B5BNkzt/0qmhL0uClrmN6S0JhRGjUA=;
 b=C04eWca5jEat96V6EH6313i6UGCJxZP33hUZted5mT9yaKVt4YKF8qErTGO4Ys5kFURqWX3GCFxxejL82/E60FK1bdTeV75ufecJwdyXlBC1AOe2Z15gxgwmDvq0bFgs3Wq21emIPlADraZrARhBb01Vj2eHfmgfJETAFQXiEE0oDwSZOiInsAWpp9y1rizfevvSR78HFw6Q/N+Yd9eeWpcFeBvDyloHaX8wNUNg1wl1gV3wQgQf1PyTsTWGyhWvyTm7sVVyPs4oSTEpxOfscRxBKgCeDw/208uEC1Q7EUsz7KQXcGyEbXq1Ut3mDDj75DyOpXiKdP+W+m7QxJBbAw==
Received: from DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::12)
 by AS8PR10MB6628.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:562::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 08:46:16 +0000
Received: from DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::182f:6c2a:62bb:9509]) by DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::182f:6c2a:62bb:9509%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 08:46:16 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Subject: RE: [OE-core] [PATCH 0/3 v7] Oe-selftest for Clang, LLVM, LLD
Thread-Topic: [OE-core] [PATCH 0/3 v7] Oe-selftest for Clang, LLVM, LLD
Thread-Index: AQHdIv8vu3oGOS6rJ0qYcmsIWklQLLbSooBw
Date: Thu, 17 Sep 2026 08:46:16 +0000
Message-ID: 
 <DB8PR10MB357753630876B4588389D372DBB82@DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM>
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=6134db7c-45f5-4911-b385-1eb6f86728ae;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-17T07:14:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3577:EE_|AS8PR10MB6628:EE_
x-ms-office365-filtering-correlation-id: 1238f4ee-61b1-4e63-b5c7-08df149822d8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|56012099006|3023799007|38070700021|10067099003|55112099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 
 AK/0D1Wlzk+0464P2L0fh5xQFKQu6zMnE4cAofN8xYcTXyWeLkHXkelYk+2dT4fJrgb4CFY356XJB5MfCepMCnk4xih/yCYQQnlyjOZ+AW1bdPwL2k1Yv7w7IBi8+azN+2EwvHIljW4V1Dn+ufjVTG/1tCpaDXgknR78hQQFquC9K52vwhLF4rfLJUNmXXYC3yGoBp5ZwbMkD7yZNI1MbIN4Tkbp3SaA24ZDLU9W75qDBBxJSpEiVcOZbbhk1mnPZfVaKoam7pyx7gSh2dqqBm70jy8ngIerBelTbhqGRGanzbPtmxS5JS2TTdOUkmeS2Ic56b+0ANIrc7IXsswfdE+Jr274eqo2bo9HmqFRN9P3+FnynvapnmxUGwlrZ52ovHduZWOptEmSlD+s1aDjDThqqDRUGj8AdX3XqzUgQZXDa8/qzFTzBkSZ9Y82te6RYHfwQUdEKJ+i5H/2T3aBonEtGTbkaQH5fz2vo6LVCSnIgXTp/uNdpNknHRAadKNb9MZy5G6tCAbfNaw9Ua4Gf+B0O/erhbj+lYabXry0Cyhb9LhyQMiIB7lsugjBIJOXFqvPIA7LkDwb19kTpde8+hVwFs8m3Z3h+xNfKQdzjBdoKcmRPxo6+Ex91fbqmaV4dHCo9WW2RND8Nk7k0wBJrBYyIta49HlDe7yzOrT9tg4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(56012099006)(3023799007)(38070700021)(10067099003)(55112099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Qq3oGBUSgaYq+tkBOMS+UIrHgpylaZfL4HIaAxtFR6AxQfGcV4QGu2majF?=
 =?iso-8859-1?Q?DT7MrmtdDk4NOpg30YmxuSg10YHeeW9G6oMPEFihTqmSLm0zRmqcGRayWj?=
 =?iso-8859-1?Q?VoaErp2QbWv8ASVkgjwLXY9yiY+OtYtfNJe/PS1ykc7sbkMGU5yBJND3x2?=
 =?iso-8859-1?Q?a+oC5NpQkswa3tD74lFgI8s3hO21ScyU9vrLXug2Oj80PN53EMDijfF441?=
 =?iso-8859-1?Q?qT1Xf3TPXB+RPwAWqzLwnfj6DG+VL25M2/NMWaw72ClsLGrGsReEzwTKlp?=
 =?iso-8859-1?Q?9DSq+v0QEqtBPYIKgLwra8MjOfmxn07uFPIACp7ahwegs1tSH9Rpc+5fjI?=
 =?iso-8859-1?Q?ucmak8ZxY9kBGAEiVjg6qBm6CdtYdf3nJ5EVbiHrjX+tLf6hHfNYh6Doc9?=
 =?iso-8859-1?Q?ZZlXD3h8lzQiuoqYq3IAbqx9Kk5yjem5TUdFB7lJcG+JcKYQTuooRhw2sw?=
 =?iso-8859-1?Q?6JubsyWxxSQhyYFYprk6krbiWH/LwZzUOEIJsD4K46lhWzKe15R4jvjtM9?=
 =?iso-8859-1?Q?rE9hfmRsocTW1EpD/tdHpXT4dxRzfqyoiF6pP+j+amNUzF6Cz2x1h7+S35?=
 =?iso-8859-1?Q?Uj9bDD9XrQvvWoaz8aLhXz/0ZWb8mIqWrgvB0z97kGTIEKMFomLuZP3Ssi?=
 =?iso-8859-1?Q?oSdgIn2i5IgtnXR+BIfaNjeda7z/3RQT9YBZjlDhXyjZsb/lW7KGCM/1Uo?=
 =?iso-8859-1?Q?L3lMwRbAYgtQNdyEI0mD1bRsysiJlhhLDU3wWw1gr46YpiTN/fbSQnWEH7?=
 =?iso-8859-1?Q?UaMd8HsHA/6f4iBfN9vJngNjRiT0TpgzPh3TsmmYCfX+0oGHEXHXDQNtUa?=
 =?iso-8859-1?Q?I94+kIoPSzSV7O3Z1qakV92KddHcxHzztwkMlCCydorfycysgxW10h8z0O?=
 =?iso-8859-1?Q?W990q0Ux8nkX1o9kMvaOk8Dz0/fMypmZEInJBmjonC6sP8BC89gRPJwPLU?=
 =?iso-8859-1?Q?f53WDrfhUm56B/Bp4CZ81+7lhx0apH7wYbmlKPOJJLgkx/ShgkS89LTtIq?=
 =?iso-8859-1?Q?kC2Cr35UvN/a0lKFdpDNfHO9R9p1K6kgVrW/LQbyoP43Uuho74xIm2p8pU?=
 =?iso-8859-1?Q?2Me2NHF6BtqKhhuYXTssOj3oaJiKoKC8MSWq3zCKWFq8vAoAVPam5Csjv3?=
 =?iso-8859-1?Q?nTYk57CLE1ecMbLpBzuqby4vQjX2ka4oU3JiBf/S0xiWpUWh/fUu4qWPuI?=
 =?iso-8859-1?Q?Lxu5R3YbzlkXOpP9wUPJ6p/CWYbyXjfQaWbNHsTkRDN+p97qUQcm+ocRlX?=
 =?iso-8859-1?Q?bfLQwIHt8G0lCpl2pyJBihn/U2fHqSFLep/UOGQKvyt+8HfSEMfBjFjxmF?=
 =?iso-8859-1?Q?RHwzxxadUuryoU265QNmsZ7UOMr2E4AOnmeFIchY9/PHE+6ml7pCsfIsJJ?=
 =?iso-8859-1?Q?5GjN86CjSo5VoFctB58X79bj5hlgJdEKAorAhurEPGe3B03kHP2s4BYL4K?=
 =?iso-8859-1?Q?j5lwSE/xSqpH0uXUACs59SAWVM/Xmek+EQslfpLHOevFlPDxMRD0LkStEF?=
 =?iso-8859-1?Q?Sq+Db1fn1ScHk4NZWuAQN8wZOQqVBT7KooNREAI3lJ0ZQgNd4zoF5A3yNL?=
 =?iso-8859-1?Q?3bN85gZYyVrbmyykOaEZG4j02McT1vgQ8Fpd0CsJfuHp2m/9/KwVlCMxa+?=
 =?iso-8859-1?Q?4iTc/CMljOJ+ScXi5ANjlN0lAf48WAaEHoPgW3IHTzqJ4w5gg7VWKd0RHe?=
 =?iso-8859-1?Q?NKlsVpwbd76hWYSgGfwPwDgpG6QgkXBAQqzDddZjO6Ttk2KhWIc7ceXTA/?=
 =?iso-8859-1?Q?OItlr5fk1TgEaQehDRQxEpBs+KdUV1Fs1/y1eLbEGoHoknJrxfegTz5jKx?=
 =?iso-8859-1?Q?M/ypHlGvyA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1238f4ee-61b1-4e63-b5c7-08df149822d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 08:46:16.1493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WSscXorSUsGKa7Z6i3DXxGovo3V+LOQo66WTszpobw5saqVt4oSfM7rvCKStdfqveGr8IllES0tGhbHSf2p+r7+dQ39WbqdiFyYfym44y3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6628
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 08:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246047

> From: Deepesh Varatharajan <Deepesh.Varatharajan@...>
>=20
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.

Hi Deepesh,

I ran into several issues specifically on 32-bit PowerPC (MACHINE=3Dqemuppc=
, TUNE=3Dppc7400)
that I'd like to report:

1. QEMU boot fails outright with the hardcoded =A0-smp 4=A0:
        qemu-system-ppc: Invalid SMP CPUs 4. The max CPUs supported by mach=
ine 'mac99' is 1

    The "mac99" QEMU machine model used for qemuppc only supports a single =
vCPU, so,
    start_qemu_nfs()=A0needs to special-case the CPU (and RAM, mac99 also c=
aps at 2GiB)
    count per target arch instead of hardcoding -m 8192 -smp 4=A0.

2. Building clang with the default PACKAGECONFIG (which includes "clangd") =
fails on ppc32
    while compiling clang-tools-extra/clangd's CompletionModel.cpp:
       {standard input}:177591: Error: operand out of range (0x81f8 is not =
between 0xffffffffffff8000 and 0x7fff)
  =20
    CompletionModel.cpp embeds a large static ML-model lookup table; codege=
n the compiler emits
    displacement relocations exceeding the assembler's 16-bit signed immedi=
ate range. This is
    a long-standing, unresolved LLVM/GCC ppc32 codegen issue, not specific =
to this recipe:
        https://bugs.gentoo.org/829602
        https://reviews.llvm.org/D136283
        https://reviews.llvm.org/D139107

    All of them resolve it the same way: don't build clangd on ppc32. I'll =
send this as a separate patch
    against clang_git.bb (disabling "clangd" in PACKAGECONFIG for the power=
pc/powerpcle overrides),
    since it's independent of the selftest changes and affects the recipe r=
egardless of whether these tests
    are run.

3. Even once the above are fixed and the test suite runs on qemuppc
    ClangSelfTestSystemEmulated.test_clang takes about 16 hours (Testing Ti=
me: 59358.78s).
    That's a very long pole for a CI job on this target.

4. With the above fixed, the run still reports the following consistent fai=
lures on qemuppc:

Failed Tests (11):
  LLVM :: ExecutionEngine/Orc/global-ctor-order.ll
  LLVM :: ExecutionEngine/Orc/global-ctor-with-cast.ll
  LLVM :: ExecutionEngine/Orc/global-variable-alignment.ll
  LLVM :: ExecutionEngine/Orc/trivial-call-to-function.ll
  LLVM :: ExecutionEngine/Orc/trivial-call-to-internal-function.ll
  LLVM :: ExecutionEngine/Orc/trivial-reference-to-global-variable.ll
  LLVM :: ExecutionEngine/Orc/trivial-reference-to-internal-variable-nonzer=
oinit.ll
  LLVM :: ExecutionEngine/Orc/trivial-reference-to-internal-variable-zeroin=
it.ll
  LLVM :: ExecutionEngine/Orc/trivial-return-zero.ll
  LLVM :: ExecutionEngine/Orc/weak-comdat.ll
  LLVM-Unit :: ExecutionEngine/Orc/./OrcJITTests/0/1

Failed Tests (21):
  Clang :: Interpreter/access.cpp
  Clang :: Interpreter/assignment-with-implicit-ctor.cpp
  Clang :: Interpreter/bad_percent_command.cpp
  Clang :: Interpreter/code-undo.cpp
  Clang :: Interpreter/const.cpp
  Clang :: Interpreter/dynamic-library-bad-args.cpp
  Clang :: Interpreter/execute-pch.cpp
  Clang :: Interpreter/execute-stmts.cpp
  Clang :: Interpreter/execute-weak.cpp
  Clang :: Interpreter/execute.c
  Clang :: Interpreter/execute.cpp
  Clang :: Interpreter/fail.cpp
  Clang :: Interpreter/global-dtor.cpp
  Clang :: Interpreter/help.cpp
  Clang :: Interpreter/incremental-mode.cpp
  Clang :: Interpreter/inline-virtual.cpp
  Clang :: Interpreter/lambda.cpp
  Clang :: Interpreter/multiline.cpp
  Clang :: Interpreter/pretty-print.c
  Clang :: Interpreter/pretty-print.cpp
  Clang :: Interpreter/simple-exception.cpp

  All of these are clang-repl / ORC JIT related, which suggests the JIT bac=
kend may simply
  not support ppc32 (or not reliably in this emulated environment).

Given the combination of (3) the very long runtime and (4) a consistent set=
 of JIT-related failures,
I'd like to ask: would it be acceptable to disable this test suite entirely=
 for 32-bit PowerPC, or
would you prefer patches that make the tests pass on ppc32?

Regards, Peter

