Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11616.1793367238058986846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=l4fVqvQn;
 spf=pass (domain: est.tech, ip: 52.101.84.65, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqg1wBDPIu3PUro/H91Tfg9yGAaQzbKGupNB3ffXxBTTX7BcunepgaoBFKpjT+3AyokAGUxFzZPnq6D241bD/m2khy3va9Ti6GcIXhcpT9o5wQIH0uVjMgPHqNpdwzYwOX7qHv82myJOkiMjo7dqijUBXrY/xlUrLCR0eJ0/oV2hD/Dzvxu76hruEfo2ruaX4KW6J1jpar4wFhYoJgj8RvBFAuGIe7d6QcqPwS2mjJ5aQ2YPOkgCkMVHiupuQkI1DngDYU4Mwc7QVzdcmJlxWtsGgHsk33EAP/Eb8dY4rQvbDyPPg0r7Ux7Oli7Iqc6ScT1txcptQnFmaA+Wfdbclg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JesokFH3caFWmGt6226VM9amkDWPRRHwdWULRHfd19g=;
 b=LZYHGvawMtB09HG1+b0lhafkAP7rSlW3Ua5HwW4i3XSfU+OOIvFmiT1k08FI814YlBsYu/TK/6By8FOxHVEewAE9JEBnfWAkjpqaJpyG0c+iSBMMcAniX880Iyca6KosZeI+FUiUl87LrkMLr3qiWauLiDRYY3ACHGJfeR4mHZ3kbsKkXG/o0D2Yoo2qfga1G8HRUZKFo3rvy596rq4uE+4d6Ab8LpweVpm3O+0szN81jHkn92CHbLYT/+DW4W8Vl02EJAQtucsFq4Sx2lVz+2mKykzjowiWSsZxqnaSObxL7YAj6VerN9XTGrwWpVMxbPjMMypwXkU3PUBc1ExMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JesokFH3caFWmGt6226VM9amkDWPRRHwdWULRHfd19g=;
 b=l4fVqvQnTM4hec9e0zNzEUlpy/fjNhejd7obF9k3QFZKd5O/0FRElbXgClQ/tKmBeRht2kNa+B2LAgXSzI89OT62Corb+B+YcsLzLEtVkKZSSX1HoU284IqcETKlsey4C5X+HWlCuPYICZxenCsH6dcmV0pBXYD2196UTuDD/FOOyvnzYgBtxiuxC+f4jzjLGpOVeU5w/G3iCRI2wFJjSbGsJmnu4ztOIxCtG1keF7X5a0VEsWwZGpvBbpmjNjONfLVAONlqtcwkVE8GiXI0tO2kKiKqvaaWF2qsg5+qKpplwf100bEsgvawstyZTNYm+VThxrb5qqXrCjz1nzW6eg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB2279.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:586::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 13:33:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 13:33:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] elfutils: skip run-stackprof-system.sh ptest under qemu
Date: Fri, 30 Oct 2026 14:33:50 +0100
Message-ID: <20261030133350.20515-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB2279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db041b3-494a-48d2-60c1-08df368a7061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: IbOI3de67w8V6RTzvWtAXeUKNgbv1zExyJ37colDvLVjtvdvmLTKZhEkuShW5yZabWuSGlzFwcGAKV4TBBj5LXgaA2utMqOEA4iUyLv0oi341z1rSewjxX+91C3faWL3BXVYzEEA0phX7SCEXf0CvxOXGHwSAZ9au9L/FrOg4qEhp2YhCJoI91irqHM8ti5uvO0vpTvHfm461yyjZuoqJgel99hnkaNGpJRNYosh9D8DNyCUk6ZJwRapnowtFeWRLv2Ho7rfytnVlgruJHNeauoMTLCkS1T2ZBgBB+6EKVCl7vdgBEqbLfZWDH+3icEhdAcqk9nC4VpTwvIo0fNVSQD/7+itTZLuVq/QABXDxLEx3lJ7oAlblqyY2SM+HBJl2d/7y0tGEDsAiotCWdsXXDdbtHVshFoPrwB6PBGFNVxHxvLQ3Ei19K0qK9kuPw2mT92GxAAB7d/5EzvTKbyh7BzVvNWc21DsFQJahEvTv8+C4QwMzRH9jX/CEJyv8rN7lZKMxbGdjTt6tVPQ0qb4xpQnkIyAB0ZEwCBwXSWIzININR3IndcZ8JelHkfoDFguDKs7cY968Sdcq8wjA7EVwe1hx1y/BXWMQ+ExWaMB/Uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1r7vj6QZAVAzA1e/Q2deWGBXqt1eJbmydeEH0ZVDmRHPvMKdguNDiXwzAPkA?=
 =?us-ascii?Q?lSPxRLgLu0E46ufXfqpXnwMTbezBX9+AixqlfcJ0m4koMn0pasZls/2pVN88?=
 =?us-ascii?Q?uH2f0gX3rJdJUJQFqcmjPm1CjicN0MV3PysYpQp8c1hAX96mK2mU+7BvOeuB?=
 =?us-ascii?Q?48jD5z6rdAxKDodeL3pE5OP2Gl0PPpaWAsXETleJ4F7Mqpyxsup3xR//Hc9+?=
 =?us-ascii?Q?kUF0OFBEeCCQG3jzPsLiUti8SRkPaOdFmwAKR8mIoNQ6OINX5Lwu/pLGa8mk?=
 =?us-ascii?Q?jRGaKnhcgxkXZPca9N85vY31zD4IIrrEPgCTz2Ll1cHfY7HIDSeP1bMKb1b8?=
 =?us-ascii?Q?YsWwgk0KdPLRXPmnP11YADaV69+P2AjDKtauGxSQJwaTprCY7cjfagKsvJu2?=
 =?us-ascii?Q?lXHlQtpwgwWVkXwN/xGbF2pWOXhNEokVSt0cus1mRWLtGlU/wqZ6mjyCmojk?=
 =?us-ascii?Q?B433Ofuyl5F73fmnUPRZyFxJnxy30HRfqLvMwOnoBRf/6LHtix2nTUNnCfES?=
 =?us-ascii?Q?+Er+8Ri6nBwBbknQs9/ABFtA0CECL41ZBzscmph8WwWhEh/9Bqt8S6kA4Lf7?=
 =?us-ascii?Q?h3ObFMctfBH5Hd7/fdYmTbSz3JbLcudZO9RG3B3mLFOha8i34KEIJNDnFV7n?=
 =?us-ascii?Q?j6SUpflNiusKQ+mcX9JNaDNy4dS4JCSqSPbofp7Gp3CldOeKnke/HA/N3cNe?=
 =?us-ascii?Q?floc39PdSB316+vAiNhMgMcAjvWwziKxxerb/errOSStYTjtoc6b8SAskHia?=
 =?us-ascii?Q?zLHwKDr1drC3v8SC6kmI+nDB490hRV0/R40ZHAeQz/yBa/75KpYEzZRmTSR+?=
 =?us-ascii?Q?p766WKRYKvV+mueL7YqZkVnqj0ds/kmbEXT/IHpNuYSi0yJjVymXkKNA0CAa?=
 =?us-ascii?Q?TWtenJGPqcSNW2mvR+bHLirZ02/shfiz9BXjcd2fEyqc35zSsmcwyibPhFSe?=
 =?us-ascii?Q?vLk5TTARvSbPMUlvJnTD1EKRtI3NZJ97OF6Ai+ffoo0RJO3Wfbz7MSRyuFV6?=
 =?us-ascii?Q?PEDnIOWlZ6CWFo0A9gYYSyxM1wx3vPyXBZD7lFYKqfnnND7VrELm1Gq9Ln8q?=
 =?us-ascii?Q?L0frUU0Qt6+BisMuWJlQJO7NTJSVOYp1xLTbo6vnlKn/BWcoh9oexbKxtM1n?=
 =?us-ascii?Q?3oKBuLNyboXPm3mUqz2sl9jOZzexOWqbqNEjUAmykVrgF9B30xnv4v+UYxM0?=
 =?us-ascii?Q?RJ8zqo/trAp9Y7Y0By1V7MjUkYXPalAk+MnEAI5OzqLdZsHkExDrZiQaWyYl?=
 =?us-ascii?Q?nA03BlfIdp07OYXD6GU67il44bNnLVQy0QbUukF9IJsnSoT7rFN4PGSK0H3P?=
 =?us-ascii?Q?yEXo5M2dJRYEtlrEEtEJU3bXEiT5HUZNyck71BJADlhwsOt+Mhs24qcNqcN/?=
 =?us-ascii?Q?a7znT1qiTuqiyWqo5Q6hmH84DnCOxzHbRwFjyl2G5DYOu2OET6gvtSHADFCL?=
 =?us-ascii?Q?wjp0HLhMlRKq13oklD7lTylloAG5OSdNPQq7LU40DolNDWTu4PGxE4sHBhzK?=
 =?us-ascii?Q?3YpEzzoJBRkuC2aaUQYmsutqWNcH7S8Rrb+snS3DwkWdODKmAUTdwzwUlHSu?=
 =?us-ascii?Q?zayvK5SUH5VhGYcSSdYjNTO4+7ljtNUMC5MU6gg2YIvOZ1AoSW+OPIWFKb/6?=
 =?us-ascii?Q?RKbFVbM8qcWo7kN+1KAs7PvLngS6VfbRHc5wCru/gHrbcLA0b4Uq1ZLq/9CJ?=
 =?us-ascii?Q?ALqcpoF9aSlqcu7nO1kgL3mTqcg0kK4qwUge19sq1cIb1eXbqq5uOPMye3Tp?=
 =?us-ascii?Q?ctQrDyixpYiWSiv8Fj8ESoQ9SXalzpE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db041b3-494a-48d2-60c1-08df368a7061
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:33:53.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuXHLq2p/erZQppTsYMs33vnd23kGo42oAEg8AOegdlL2Oog0Fus27beFpl2JJf2v8KQDGJsTvDtmUx6EXAHrU+R9t3T27G/UkGTuEFgW0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249041
Content-Type: text/plain; charset="utf-8"

Non-deterministic under qemu as needs userspace perf samples in a fixed win=
dow
Issue already reported upstream and updated ticket with details

Reported upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=3D34544

Skip test case via ELFUTILS_PTEST_SKIP

ptest results:
Before:
glibc: 263 PASSED, 45 SKIPPED, 0 FAILED
musl: 255 PASSED, 44 SKIPPED, 0 FAILED
clang: 263 PASSED, 45 SKIPPED, 0 FAILED

with change:
glibc: 262 PASSED, 46 SKIPPED, 0 FAILED
musl: 254 PASSED, 45 SKIPPED, 0 FAILED,
clang: 262 PASSED, 46 SKIPPED, 0 FAILED

[YOCTO #16473]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/elfutils/elfutils_0.197.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.197.bb b/meta/recipe=
s-devtools/elfutils/elfutils_0.197.bb
index 6e58afb2745..f309a3643fe 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.197.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -65,6 +65,9 @@ PTEST_XFAILS ?=3D ""
 PTEST_XFAILS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-ll=
d', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-r=
everse-sections-self.sh', '', d)}"
 PTEST_XFAILS:append:libc-musl =3D " run-large-elf-file.sh run-backtrace-da=
ta.sh run-backtrace-native.sh run-backtrace-native-core.sh run-stack-d-test=
.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-comp=
ress-test.sh"
=20
+ELFUTILS_PTEST_SKIP ?=3D ""
+ELFUTILS_PTEST_SKIP:append:qemuall =3D " run-stackprof-system.sh"
+
 do_install_ptest() {
 	# copy the files which needed by the cases
 	TEST_FILES=3D"strip strip.o addr2line elfcmp objdump readelf size.o nm.o =
nm elflint elfcompress elfclassify stack unstrip srcfiles stackprof"
@@ -106,6 +109,13 @@ do_install_ptest() {
 	sed -i -e 's|@XFAIL_TESTS@|${PTEST_XFAILS}|' ${D}${PTEST_PATH}/run-ptest
 }
=20
+do_install_ptest:append() {
+	for t in ${ELFUTILS_PTEST_SKIP}; do
+		sed -i -e '\|stackprof-subr.sh|a echo "unreliable under qemu, skipping (=
PR34544)"; exit 77' \
+			${D}${PTEST_PATH}/tests/$t
+	done
+}
+
 EXTRA_OEMAKE:class-native =3D ""
 EXTRA_OEMAKE:class-nativesdk =3D ""
=20
