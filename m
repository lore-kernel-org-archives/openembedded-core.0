Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A4AC04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:23:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.209.1715962986701360570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=586761ae34=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H7KJN0002879
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:23:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn56hv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:23:05 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44HGN5EQ026042
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:23:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yn56hux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 16:23:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kX0aphXc8dr2lrv3QmrTPCMsrY7AEdvazVMKRyRc/lGjkRhGJ3AWCc5vghMuGhaCuLc8fnR6zmfgU/fdkCi4bvendVOceg7jv480YnIF6mZ7K1ZRFKY9zU9YH+hJMmloW/NRxP8psuIT20A84V+WhBzqahMGEEfQvLPtJ8y0pt8cXqQPIm6f7Mgj5nnvTypPyK/MVUVbiHxKfioobZfw8eTZysh+HMmKey0zsat8izApuRiRSpLYRG52R/AQsOIOGhddV9o2yblYO4x4HewtauT7XeQUGk9r7hkUBsbWRkas7FDmFMarYb3/6zJ2slBoMWcne9kHKv/NNmmpk+dhPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjoRQZHz0756N0UuGhyomFD27CldxvvZ+npkWyto0Rc=;
 b=FXSws3eb4f04UxhXIzdcAxWj1T+Hyb0H89qgNSQn4g4b8VIQQCoG2uZxxGZKFLt9eHZiyjW1IDpzEseqVWxY+7T1UOw0lBiv2XkC+E38ELCsUgYEJTve4TWScB8xXQlV4nItScJ1z4UkbTTPnI8Y+15Ss7PNga8M4uxg69P/yToCWs9ZEczG5O5nJMkxuio5TV1uf92jIrtkC4ajM760rrt/PE6zjpgpFMpnnmB41J34lZMRZmUswCmfjZGRQtOPZg+86wvdvG2XQ3IvTVFX9AFMpUKdGlXjfsETgUrr5/f5hVcgBxGy4mg58esr27GKoiuoJGbI0DNvbTokCmwfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 16:22:59 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 16:22:57 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com, steve@sakoman.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates.
Date: Fri, 17 May 2024 09:22:37 -0700
Message-ID: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:a03:338::9) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|SJ1PR11MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e02b32-5c0f-4a36-2ce4-08dc768d9c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jDLjLhFhjDYkzaIQVLI1uWfoFTtW/Hpx8JKBe9z3ehnjhGUD3BD5RQjkcGB1?=
 =?us-ascii?Q?V24lJEE0JfOm+XaoWHxcL/56svMhxx9oCDhFuMOwSM8cegqj6WwCZpyxx7ae?=
 =?us-ascii?Q?/qYBBoxSgs6VT013zWxWuD9Ue5PLHWcYW5DbTsZsnHGvcYbt5OonzGPcLpyv?=
 =?us-ascii?Q?ASTfbbUK6seppHjed02N9NezE4LR6TtINrf1FX8qFLE7p3knrY4QBfmLs5So?=
 =?us-ascii?Q?5DjRGcQETIL65n8nsbg1DCw+gzmUUvziqouSFD/ZtuZJDxVhaStcFiR7aO3N?=
 =?us-ascii?Q?VT6jlMj+9fTr6PJgOjLqIPyETiC7PxEMmnIzZHAwY6sBfrGeDdx+pphrbyzm?=
 =?us-ascii?Q?v+eGAycg8muiiIASl3Mg+bDpKJ+i+6KPgja98hONiIYxZ5fUkQEqfUPCLPUX?=
 =?us-ascii?Q?laZ5Kngb8svEou2qRA4/neSQkjBOXCdJb2CArEQjq9KSz/7n9ruru2C4miP7?=
 =?us-ascii?Q?hD18xA73kv1amKzI1j5BPzGy82mEZaTzrjPfAvQa8Bn8AdcmrTUulxoXqSnN?=
 =?us-ascii?Q?YV0p0QHxuM/NheCIBqR6CSsXELsfTrFyq9r099BJKK2VmCj13JhK+Hn7wdv8?=
 =?us-ascii?Q?kxrBYzOcZrWCLNKfEiKNk7vqtj9btGlQvUdGSLjv1FeAn0fxByv9z3CJkyXf?=
 =?us-ascii?Q?A13e2sNa42ooPw2pLlKQGGgO3CUOFuRXB3sqTm42W/TwVk3V/1oRlxNbEczD?=
 =?us-ascii?Q?3WweFsgzukZPFs5CbWXvSFf/nCJm0nP2CFp9+I1ZR7KHpxWo61G0mZbjjq1t?=
 =?us-ascii?Q?2uDMqNAyfWZ6e9h+cVFMMmargTcgBsxpqO1GOCRUPqKOe0mSi2foF4CIH2hA?=
 =?us-ascii?Q?A2JqHKNPe0EYPhAb3Z6vadNs8lMYgpdBCZNiHzQxa35WCEil2HZRwOqLzXCC?=
 =?us-ascii?Q?bdNGIFNzznnJ1abtqJFL0xnorQaU3BZ/X9InpgnJZjqDZIJrit/Fn6c/p8MX?=
 =?us-ascii?Q?KwFUT6ddsG7UYTLS41QAMrM3zHaEYE9MtP7ruk34DY/4utEMhs8yerNgvdc+?=
 =?us-ascii?Q?a5TKAt0ggWMWsonlN3UaM2+05t2tkb/BJ0mu21MBdbq4FT/rvfWNOqX7pkrC?=
 =?us-ascii?Q?gR5W0ujaemeRWd1GfAhy+br+dNlIjaCcG00Tf6IC1LsCvtevGh62Yg9vJF1j?=
 =?us-ascii?Q?y/TjP1l+JxiwBOIA+4uzaD9tarnmjnqgTZ8OxFygZ0SYRSKg4b0HcnM37VO3?=
 =?us-ascii?Q?h49jbc2XkGSB4cNPRN9BtGXIQaezSb/HvFQft4ByiHr8CTBMfBQtBhAR7rZH?=
 =?us-ascii?Q?fC8KSupTSvbfr+GygfO1D4zEdozxBdzjm970+nYFGQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FCNSY1npCFlS/6IXgKkLDE8EEoollZOJb5DLLfO2qaGyRpX4Wl1Ea1WbGygH?=
 =?us-ascii?Q?ZgQecrG2/m/ulJegxTMuG98UgubexbIfEbEpmBh50Lda6B1xeY4lP2q8O9T+?=
 =?us-ascii?Q?tgDjQfvaswy1NS/o8UmlAfricD3s+KG3N5GfJLOyL7mheZqDbrE/5Nv9B2G4?=
 =?us-ascii?Q?V7ZsaWhhja/upzdocSR9jAs/ux6RQ6C4ibGNYBzH0IOAklVBGH4tav0UhMc1?=
 =?us-ascii?Q?bB7oopULkJ05j/BH0ZC0xC3ZsTDlmuDW+6FyMbsYcKg2meGi5YCrihqTQIgq?=
 =?us-ascii?Q?XL8UeFzOCqPBVM5X6s5hxCB/IDgcpVbzx71yd+AzaOXPE1fUhSQmK4QzgGH3?=
 =?us-ascii?Q?v2HJw0NTMaCON3zMCxVlSgbqUnclLYH8O7g7TlWILtQCj8gugyi077i8EdkA?=
 =?us-ascii?Q?REkg0VfrjY+B7qvPylFhdyMeg8TAnix+q6od0fvgocun4f+lJOXlpWSu52AD?=
 =?us-ascii?Q?xljUp0vCGvlWeSs829liJ59LjsYWJnPclXvtn82zZRbz9swwEztiOSmwqk83?=
 =?us-ascii?Q?OyXyr3MwG638y40Dnbs0DPgUDw/ieOuIAqW+hQ2vjnuji0EwMgMsbixb+ldl?=
 =?us-ascii?Q?dH1lVCOE5i6NVFfGDOReR3IBUAWRu6NvgumDf6ZVD5IiU+gRSkwTkCR/HpRS?=
 =?us-ascii?Q?BmEj9JJ/2mG/Jjj0XU+AgzfjItaObwn04NykwE9hHuXd+LyGbf39SCv1nt4x?=
 =?us-ascii?Q?rTUgpLOEhFS3vxwLR9O7IyizsEqWTw5U63rZiZoOcsltePdirKno8ve4A8pE?=
 =?us-ascii?Q?46HpJFC6w71nX0rWrP0HRLio0eoqpITEhymkdNqrAWklHSQpvfu85squLTiJ?=
 =?us-ascii?Q?AHpe3YCdRFgDRBb4ZgKWZUNQ1f2mzkQLBs7I7eT5XrdcL1guAg2ZWLwNyLdx?=
 =?us-ascii?Q?BXOi9BmSMuUplo0y2P2n+sXOW7EXk2nFqUIuqydnhJVpkSif58PgvVQrgSCO?=
 =?us-ascii?Q?v/fY6EieMe7m4iBlFTiXIE3otitT/ijJzDfV6piHK2Wja/9BgqRRA+JGfbSj?=
 =?us-ascii?Q?xGtlwHFLYlwtncHbsMEFh8Up3aCBpCLEABXIz530c0eB3Jor5waL4dWfKdx5?=
 =?us-ascii?Q?N43uFbIBCxaoj0+a5M1Sf8xWbDoH5pJLLiSiBZdZ231o0MiGn+3PEAoPLuPl?=
 =?us-ascii?Q?FjP28eq8aDPGhuCl89cRn5Q/CUXOBF03GmkUz5Nfd/tZ5BIz1MaFNGgTvgR6?=
 =?us-ascii?Q?aJ67JykVHcV4gpdYHEHGji50nwZJys8dG54H2giYw1LBDGlWMiWtvjeMLgVh?=
 =?us-ascii?Q?9agrV1zyPAoJd8B1LiAfeR3EDxYBvs4j3WKqD+vK4R2owwKsSpHma+TsgzKQ?=
 =?us-ascii?Q?WAljz3g5DT/nrbhia+xDHsUH73jH8xIOohuDUkZ4FQhVm/cXj3AKrXuXec61?=
 =?us-ascii?Q?lmLnTYHlOWRp3RUfqzWPjNwJUJ87OX5q5Ma3ZoHqohapiwx762nK1HvJONnv?=
 =?us-ascii?Q?YR7gO3ANHDmcwKoCe/vvXb5xNPRW/BcvAuFIF5OwgAVstuyjONYEoLdrRjZ8?=
 =?us-ascii?Q?DT5938Wj4RMUseZ4BUOr+AVqQpCz1PjNHzCmPXPcDt+YzRkGgIggYeoO5JBy?=
 =?us-ascii?Q?8UOpSY4h9+4EhzNDZZ+snBDrfiXYq6YALlPYV+H56DVqe2m2y1pAmqysrJYh?=
 =?us-ascii?Q?FsfcL+QvrH6meeyGH/RbAro=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e02b32-5c0f-4a36-2ce4-08dc768d9c9e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:22:57.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAebL8HyNiaxe3Ka+JsyhpXTJOmE3HBbgNz9u4RRHRQoZVFhmSl1o4tMEillmGN4vItypzvW8Aj/OYbEKmBW8jsFb7wudd+BFL3AJHW6alk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6129
X-Proofpoint-GUID: IGrjwvKXQJehq91G-F-GF8BLp_XvMptX
X-Proofpoint-ORIG-GUID: UkME6ixXs7EcCnbJOoLV5qxXt3WKlgXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199518

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

c7c3f5bf80 LoongArch: Fix undefined `__memset_aligned` reference in ld.so linking.
32969a2b36 socket: Add new test for connect
2db79c96ba libsupport: Add xgetpeername
ab4ef4421f x86_64: Fix missing wcsncat function definition without multiarch (x86-64-v4)
97bb89668d Force DT_RPATH for --enable-hardcoded-path-in-tests
71149c2a2e elf: Only process multiple tunable once (BZ 31686)
f8e4623421 Add a test to check for duplicate definitions in the static library
8b005d7869 i686: Fix multiple definitions of __memmove_chk and __memset_chk
8323a83abd i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk
5141d4d83c Revert "i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk"
c16871e662 Revert "i686: Fix multiple definitions of __memmove_chk and __memset_chk"
fa616ea373 Revert "Add a test to check for duplicate definitions in the static library"
ff110b2591 Add a test to check for duplicate definitions in the static library
ad92c483a4 i686: Fix multiple definitions of __memmove_chk and __memset_chk
3148714ab6 i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk
273a835fe7 time: Allow later version licensing.
acc56074b0 nscd: Use time_t for return type of addgetnetgrentX
836d43b989 login: structs utmp, utmpx, lastlog _TIME_BITS independence (bug 30701)
9831f98c26 login: Check default sizes of structs utmp, utmpx, lastlog
fd658f026f elf: Also compile dl-misc.os with $(rtld-early-cflags)
a9a8d3eebb CVE-2024-33601, CVE-2024-33602: nscd: netgroup: Use two buffers in addgetnetgrentX (bug 31680)
c99f886de5 CVE-2024-33600: nscd: Avoid null pointer crashes after notfound response (bug 31678)
5a508e0b50 CVE-2024-33600: nscd: Do not send missing not-found response in addgetnetgrentX (bug 31678)
1263d583d2 CVE-2024-33599: nscd: Stack-based buffer overflow in netgroup cache (bug 31677)
2f8f157eb0 x86: Define MINIMUM_X86_ISA_LEVEL in config.h [BZ #31676]
e701c7d761 i386: ulp update for SSE2 --disable-multi-arch configurations
e828914cf9 nptl: Fix tst-cancel30 on kernels without ppoll_time64 support
31da30f23c iconv: ISO-2022-CN-EXT: fix out-of-bound writes when writing escape sequence (CVE-2024-2961)
423099a032 x86_64: Exclude SSE, AVX and FMA4 variants in libm multiarch
04df8652eb Apply the Makefile sorting fix
edb9a76e30 powerpc: Fix ld.so address determination for PCREL mode (bug 31640)
7b92f46f04 x86-64: Simplify minimum ISA check ifdef conditional with if
9883f4304c x86-64: Don't use SSE resolvers for ISA level 3 or above
9d92452c70 AArch64: Check kernel version for SVE ifuncs
395a89f61e aarch64: fix check for SVE support in assembler
b0e0a07018 aarch64/fpu: Sync libmvec routines from 2.39 and before with AOR
31c7d69af5 i386: Use generic memrchr in libc (bug 31316)
5d070d12b3 x86: Expand the comment on when REP STOSB is used on memset
6484a92698 x86: Do not prefer ERMS for memset on Zen3+
aa4249266e x86: Fix Zen3/Zen4 ERMS selection (BZ 30994)
5a461f2949 Add tst-gnu2-tls2mod1 to test-internal-extras
aded2fc004 elf: Enable TLS descriptor tests on aarch64
a8ba52bde5 arm: Update _dl_tlsdesc_dynamic to preserve caller-saved registers (BZ 31372)
15aebdbada Ignore undefined symbols for -mtls-dialect=gnu2
354cabcb26 x86-64: Allocate state buffer space for RDI, RSI and RBX
853e915fdd x86-64: Update _dl_tlsdesc_dynamic to preserve AMX registers
a364304718 x86: Update _dl_tlsdesc_dynamic to preserve caller-saved registers
7fc8242bf8 x86-64: Save APX registers in ld.so trampoline
983f34a125 LoongArch: Correct {__ieee754, _}_scalb -> {__ieee754, _}_scalbf
aad45c8ac3 <feff>powerpc: Placeholder and infrastructure/build support to add Power11 related changes.
ee7f4c54e1 <feff>powerpc: Add HWCAP3/HWCAP4 data to TCB for Power Architecture.
71fcdba577 linux: Use rseq area unconditionally in sched_getcpu (bug 31479)

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...y-the-header-between-arm-and-aarch64.patch |  8 ---
 ...e-Pass-mcpu-along-with-march-to-dete.patch | 62 -------------------
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 -
 4 files changed, 1 insertion(+), 72 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 618a574566..20125e4339 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "1b9c1a0047fb26a65a9b2a7b8cd977243f7d353c"
+SRCREV_glibc ?= "c7c3f5bf80ae86b34501f473f1a9fc545c911b7f"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 066c3b1ea2..80c6ea89b5 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -39,11 +39,3 @@ index 118e59172d..b4b0692eb5 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
-diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-new file mode 120000
-index 0000000000..4c4a788ec2
---- /dev/null
-+++ b/sysdeps/arm/bits/wordsize.h
-@@ -0,0 +1 @@
-+../../aarch64/bits/wordsize.h
-\ No newline at end of file
diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
deleted file mode 100644
index f6523c5498..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 73c26018ed0ecd9c807bb363cc2c2ab4aca66a82 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <szabolcs.nagy@arm.com>
-Date: Wed, 13 Mar 2024 14:34:14 +0000
-Subject: [PATCH] aarch64: fix check for SVE support in assembler
-
-Due to GCC bug 110901 -mcpu can override -march setting when compiling
-asm code and thus a compiler targetting a specific cpu can fail the
-configure check even when binutils gas supports SVE.
-
-The workaround is that explicit .arch directive overrides both -mcpu
-and -march, and since that's what the actual SVE memcpy uses the
-configure check should use that too even if the GCC issue is fixed
-independently.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=73c26018ed0ecd9c807bb363cc2c2ab4aca66a82]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-by: Florian Weimer <fweimer@redhat.com>
----
- sysdeps/aarch64/configure    | 5 +++--
- sysdeps/aarch64/configure.ac | 5 +++--
- 2 files changed, 6 insertions(+), 4 deletions(-)
- mode change 100644 => 100755 sysdeps/aarch64/configure
-
-diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-old mode 100644
-new mode 100755
-index ca57edce47..9606137e8d
---- a/sysdeps/aarch64/configure
-+++ b/sysdeps/aarch64/configure
-@@ -325,9 +325,10 @@ then :
-   printf %s "(cached) " >&6
- else $as_nop
-   cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
-+if { ac_try='${CC-cc} -c conftest.s 1>&5'
-   { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
-   (eval $ac_try) 2>&5
-   ac_status=$?
-diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 27874eceb4..56d12d661d 100644
---- a/sysdeps/aarch64/configure.ac
-+++ b/sysdeps/aarch64/configure.ac
-@@ -90,9 +90,10 @@ LIBC_CONFIG_VAR([aarch64-variant-pcs], [$libc_cv_aarch64_variant_pcs])
- # Check if asm support armv8.2-a+sve
- AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
- cat > conftest.s <<\EOF
--        ptrue p0.b
-+	.arch armv8.2-a+sve
-+	ptrue p0.b
- EOF
--if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
-+if AC_TRY_COMMAND(${CC-cc} -c conftest.s 1>&AS_MESSAGE_LOG_FD); then
-   libc_cv_aarch64_sve_asm=yes
- else
-   libc_cv_aarch64_sve_asm=no
--- 
-2.44.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 9122472689..dce6febc11 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -48,7 +48,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
            file://0024-qemu-stale-process.patch \
 "
 S = "${WORKDIR}/git"
-- 
2.43.0


