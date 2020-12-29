Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.68])
 by mx.groups.io with SMTP id smtpd.web09.7265.1609209410772330503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 18:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cdJJz4k2;
 spf=pass (domain: windriver.com, ip: 40.107.236.68, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHgekQz/a8vURiFnA4amHpf6iYtDCcaQO2sI9Wa2Zf2L9vlcP3nAatCcRbXauhX17c9Nv61ly32Thvl3kAEYvdneIecq50ZsgnEnJV2oBthbI96q7xepECFUHV5ftIz3ZS00iZDjvF8LalGdqinMVYDwsr0C6XG/0w2DWag9not9lgZdzBCfklKwM/KGz8NOV3d2R1OxdbVTxKq0vHp9tB2s8E/vQzs7KtG6SCeEwnJsAVhSxYRuAX0s2eUj+aZfoNUF+bZUYh/ok8tEZLdJ0pnwOQpU2F3iBT1zLBpXwOsa5Ij1lskuLQ2Z3WjxVuGS5F0VxTDQkSSFkyIGQ9ODxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYM2YgPSyhnx2t2EqdcYkW2inxABdM92UnzvbzSOev8=;
 b=cg9hp7WmQufcCYfGBJ6J3s2OczOJhl5zBOOg/izs4erBCywumHMqYlZHHUZ/EFqapxQHa74MqpV324cHEV3+zEdgryfkpNRfbgh1Llhwkgte1AZ8T4NVlEAmW5uTLijHqUrTy/5fAOWcNzZdg1m3vpN1zWSgXMkPX6wPmssUcOwf1p0sOKlbAkT1hvlRnMzu7UKuKM9MN2Bl4slMykqbGPOhoEtOL4/nPF9OOpl9Ae0Udqq6KGvo8fiKUN8Z/CJby1h+kAMO1BLpTSFcTVd+pbgDSGvWU6ZlycMFPRY4FGW1U+aRKAhrb2D4u1iNPEHskth3dAnaKd61b3yMUj6QgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYM2YgPSyhnx2t2EqdcYkW2inxABdM92UnzvbzSOev8=;
 b=cdJJz4k22z2YeyKc4vj5EqT+ynh3QtfDEy0YoAuCHBPirRLM9yM/53V9J210OqmFHc6GaRYXeMeQPQV9AqbIUtxqWV0SP8D1prTU5YElhuNKb4iLGyPivscZ3hurj5oxc1YnJ3HOwZ26uhOIBM02sg3ygQvJenLx7T6NAxqc+ds=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1440.namprd11.prod.outlook.com (2603:10b6:301:7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.28; Tue, 29 Dec
 2020 02:36:48 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:36:48 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pulseaudio: define -mfloat-abi=softfp for CC on armv5
Date: Tue, 29 Dec 2020 10:36:26 +0800
Message-ID: <20201229023626.14834-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::22) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SL2PR01CA0010.apcprd01.prod.exchangelabs.com (2603:1096:100:41::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:36:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f5b35c6-0f4c-4932-1d5b-08d8aba29749
X-MS-TrafficTypeDiagnostic: MWHPR11MB1440:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1440C712D2C1663570C5E013F1D80@MWHPR11MB1440.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JySiLRgHaelo32B0HJD6Xf3cCeaoqfc3ds283cjdcDm82UXDt5eoL3OqBSkDWaMUjXoUArD7zyTdUHMxHYfpLDL9a9lx6jrNi+zJfeqg+1cUsg60oy5SSdPWw7XLD62axghJ9cC+1Wieme2f/3k9AAq0Vdfc9LSdUTMRXfULPfrYEfHj3Dji+uQYBFiMoDJTNzCO7jAnbMZHz1pG/94iyZgTIrBV3Yt5a+j3Rf82921CJvsXjyvOM1YV5OAHx9p+AWXs1E02HSgEjlG/vsncqbj4bViBDwSPzbe5a8Tiq7PPkTBrpKik9Mgh94OzI8lGNpwlwbEPmGgdJUVnlRdAHCCV0/QxlXuSYV783Z/C5NHjxhWKSKg67l4Fd2Z81NxHDQWYDoDEBLo527efNmeKCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(346002)(136003)(396003)(1076003)(6512007)(5660300002)(6916009)(66946007)(36756003)(2906002)(66556008)(478600001)(66476007)(9686003)(86362001)(26005)(6506007)(6486002)(8676002)(16526019)(8936002)(316002)(6666004)(83380400001)(186003)(52116002)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fiZz+pvJ0+VdqnNl0j517x2Yr6kJqAzMWfRGfLkDVN7EctktIBlmJlYpiVjA?=
 =?us-ascii?Q?q7xeAX58jo3EJsnaoluFpJvuVHvNmj4eS7W6yftfRpr3aXl10mjn62iqJxA7?=
 =?us-ascii?Q?KZ/K0m8IGs7C8sh5CHOpQ98VPeruh+K4R6zMlYR+ASj8Lo7c9gyrXeXpCIhy?=
 =?us-ascii?Q?Eaoxddf2IeW/jdp9Lbvtq4duYRs2+z2o6nRuNWUs6c+XBVtvp5n4Itd9cOgl?=
 =?us-ascii?Q?x1x4xaQQm8a7j3k+1jH/+06a239ZZgeu8zmRw6TmBVEltgX21S/Q/1MXbic/?=
 =?us-ascii?Q?thWdQ3z0sWEWID68cVjHa5CP8AwiRr5xZ5YsWY+fAS2toGUtGZKmqQAGHW3k?=
 =?us-ascii?Q?7Ij8OcdZY5VeKfppqmRtdCkbpiDGiBI9UBAGmJkFzFwoOmJW5Q7NCV1jZeTf?=
 =?us-ascii?Q?nT+0kLtMQA/3AZqrSNMTPbHiGxS+VolMDHFAyiibS1X8F4wpyAKYmJoz9uds?=
 =?us-ascii?Q?RtfnAeKvgLASXzVcAkeIsw4AHJO9tjEeZSZNLD9xNX5rke6Pn6peAdY4Vy0t?=
 =?us-ascii?Q?zjFLQTpVST2LljscOWbYOw8O8jjG+f+XSalKWEKxIVHZkI2wRgWbdS5Cdwz0?=
 =?us-ascii?Q?4ZocJQt7ncprkGUXdVs09OtFpUHFERUy/BgcwfRDQKi5WurFw1UW0Zmio48Z?=
 =?us-ascii?Q?UV9gE4xUcFixOvVWtm3g3P/D5IVCpwu+j0+kVFxgxR9X+UJepWi7fRqQ3IzL?=
 =?us-ascii?Q?7LZYsoIgMJionfgRRDHTAyeucGlbcJiZ6E+6HQKzs7iEFkvY7h0SX9x12rjd?=
 =?us-ascii?Q?DGXaSlkZNYG/HtfiGKKi15vLt3BEuLJillylo9A4XaBuCvaaK7S+n/GdfIPf?=
 =?us-ascii?Q?DaGSuZ5ZF6mVrpuxg4GQW2vtIsM3ORtMnrmEFwQ1ERRt9OJLlPZMaFXqNQlM?=
 =?us-ascii?Q?V0JRmol50Uy716EPDi7Av1aBmZnDqt79QltPMtPm9WqPp+/ZywT97YQjf+nu?=
 =?us-ascii?Q?NZOpK3vlpXQDGLC/vFGxuJtf9rU0LvOzmgAG4ytVgWQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:36:48.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5b35c6-0f4c-4932-1d5b-08d8aba29749
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2xQyRfBjfS6VHjUPCFTGkCB1uVHaPaQAVOzhCe+LK87p+J3QPWMHKcjlB6LD0hI3pH9hRexs37uF5h9AlD2Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1440
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After pulseaudio upgrades from 13.0 to 14.0, it also switches from autotool=
s
to meson and there's no option for disabling Neon optimizations with meson.
And the build system adds -mfpu=3Dneon at the end of the compiler command l=
ine
which overrids any earlier -mfpu options and result below build failure:

| /prj/tmp-glibc/work/armv5e-wrs-linux-gnueabi/pulseaudio/14.0-r0/recipe-sy=
sroot-native/usr/lib/arm-wrs-linux-gnueabi/gcc/arm-wrs-linux-gnueabi/10.2.0=
/include/arm_neon.h:31:2: error: #error "NEON intrinsics not available with=
 the soft-float ABI.  Please use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard=
"
|  31 | #error "NEON intrinsics not available with the soft-float ABI.  Ple=
ase use -mfloat-abi=3Dsoftfp or -mfloat-abi=3Dhard"
      |  ^~~~~
| ../pulseaudio-14.0/src/pulsecore/mix_neon.c: In function 'pa_mix_ch2_s16n=
e_neon':
| ../pulseaudio-14.0/src/pulsecore/mix_neon.c:38:9: error: unknown type nam=
e 'int32x4_t'; did you mean 'int32_t'?
|   38 |         int32x4_t sum0, sum1;

Define -mfloat-abi=3Dsoftfp for CC on armv5 to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc
index e40b8c1c40..44a6a3055e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -123,6 +123,7 @@ PACKAGECONFIG[ipv6] =3D "-Dipv6=3Dtrue,-Dipv6=3Dfalse,"
 PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,"
=20
 export TARGET_PFPU =3D "${TARGET_FPU}"
+export CC_append_armv5 =3D " -mfloat-abi=3Dsoftfp"
=20
 set_cfg_value () {
 	sed -i -e "s/\(; *\)\?$2 =3D.*/$2 =3D $3/" "$1"
--=20
2.26.2

