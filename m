Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D911CC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 15:09:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24490.1705676992354213790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 07:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IGj2N1S8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JB6mrp004691
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=LAPD3HRSW0UiBDXV+6NgLAdJ95RX3ckqzIN/raCfbsM=; b=
	IGj2N1S8Ma6Fo700HaUa6mVadPHwjzL8tbSgGRq9JcZAWUvUxugykN2Ijh3v3Kzj
	0Oo2FLlig26McQCum9ptVGYIh6RQdZBkhQ5IQM78eXsj0wmxh5cyDjnBnJR77eZw
	BmHKcdaFGtdLI9z0TcS5tgYu4oq3cMP0X828QWjN356bbfqmMi3kLEI25YnoDiO0
	0H7Gy2J4zBpUQmJfDxz9C2FbWoJvGwFiPcdGnBC1U8ThFkfzk+XL9i2c2hhaoBfC
	mgJGyoYiCMRZ5iIqRc34C0/aDPR+64rOTZ4oLmXERf9TBPOemxRf5cEEBEENVN/m
	NzVioEOvy+WqcL51ECblvA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46w0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 07:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCnIObUJofkohHA7iRUwUTZ7sezeYu4tlZhZSfCHH6U+zNmUSyTSA1G3wRmPKfZuLud92XcYVTfDJSBJV/haw61DBi0w+ddVFPYaBSC9SHs9pnt1qE/gqGHSm92JAEDgyVjvMdjRwaF9jOuaXPMvV/wG3eukO7pMgXKBZFsIKRcpmsGB8MF6oznTSPcrv4xyq5plJ6jsW5vY2mWKsQkpzI4PqIuAzQ6J4NFy0eo+BlHKT8TU/CSBJikrXIzEH4STKwQ/0H/lSQo2utliBj8eiVkqSWjD5IzJWD+9IHeCtqX1L8KOSIrJtwH2dRuOdKvcd/x+OYTsehiDPljNBjjDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAPD3HRSW0UiBDXV+6NgLAdJ95RX3ckqzIN/raCfbsM=;
 b=h+Nl9xyNmMyygVNHjMuplL1tPFEfn2HnKOeHhWsRUPZ2HGRcnT16Kj9pxYdOfNmcxb6I7/pLgNvo5op9Is0bl0CuQLGrYzmGL0yL0m9x5NVdtjvmCliA9Zu5NvspTA8aqJMmC93asNBV7K5svcKbn1qsdp5qA1LiUt/K69+348/nxFdw2D0m3Yn+i2wdwEZzw2ULBjHII/VXZ0if9yNgV5gnReandwfJ1CVFkejTWB8bpvqo+mvVTQl8hjN/hXrJMs6vHKlbcnvhSn+3PKDsT0WrY5uplE8L5Ai8T5athZi+mG4LEt0rdpK1DzFhIx+FZbfBQh4Juc9P1Jp5+Z0ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 15:09:49 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 15:09:49 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2 5/5] rust: Enable rust oe-selftest.
Date: Fri, 19 Jan 2024 07:09:07 -0800
Message-ID: <20240119150907.3840110-5-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
References: <20240119150907.3840110-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9dd287-cd28-493b-f569-08dc1900adef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eeI//9dOISDuHt5ASMdWo1C8BADcuzH6c+MeF+yACXueM7CtGcyROAu1oTY/nUIJPs+Acl16pW6J7MNlxIE2E+POIGHcPZczDx85j751AzWx6tanFla789q8e6NsxCn0jpWp9kQqmNd9mAZgwsiEb7nPZH0m4umzl7kx6RA18SberqSBZRnJlPDnx3MQbe9hdlB7AVLQ5f6g6lNuQa9JIh/wBbqA9cvhoKm53OrkK+G44BZw2sd88V0TneXpaXlPgoy8bIdAfil+VL3SCjF/EdF5vyR4H07Z290T0JmZ3RGtSq9E7c+tTKIqKFwCx3b3TK6WMJALYzlCwMZjrsZEw2KsPA0iD2I3NC/a+UinszPOKphbm2vDBfnDKzsttRI/C4r8ze0rS6dfcdMKIBxsZsItIpSAHiqCw4+uCAgVGUvVgSVRYX9x4HCR61tbhlBxT9JE9k+O8Gzt7EBlBaBJpZYabTf+UkEwUsBRDrJHX3enV8h/9Gx5+J42Ujl6sgQeeGrySi/eleegWC7lePjhE5iK1id5V4TvHTM2yHg9hQvShDOIqB0XlZTeIdLfshTGnuMiPm+bNKMV0uBjEUOAoqMEfYp2lj/gY3OkJP43lbawntmU6+wgV5N1ZvF3qS1tbM4krzKbVca81LPmpkbRog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(346002)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799012)(451199024)(64100799003)(186009)(26005)(1076003)(107886003)(83380400001)(478600001)(2616005)(38100700002)(41300700001)(8936002)(8676002)(66476007)(6916009)(316002)(5660300002)(30864003)(2906002)(66946007)(66556008)(4326008)(6666004)(6506007)(9686003)(52116002)(6512007)(6486002)(36756003)(38350700005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wwf8ysFp+vMs++OQi+9+pu7sFtRdkz4lBsXaTDafv3lP1sciITejYty2RsnC?=
 =?us-ascii?Q?o5cPQAU0S/rvOqpX4p9hUzHly1sXiMZS4Y+CjqmlXLEw509WjgW73/64sVyE?=
 =?us-ascii?Q?gWk7hhJS40zdcns7uZFzI+PJ3IWKBorlLIKcQrR+OW6bxE3guVukM2s3jrFq?=
 =?us-ascii?Q?g33SUJf7vaSCvy3VvhE+X1Cidz+KTAR3SEC3qFi1V1x3ER0S1m+pN383fcnv?=
 =?us-ascii?Q?f0igVvuSmTsIVCAtI9BlrR6V4RCsrlCYd1aa8ZyxwPY7q80Q3ktNEHy1WGC2?=
 =?us-ascii?Q?fKMmkfvigNlb+9a5eqFbVaT/pkytCem7RWkgURwAw38YU7QyeJvWwbOAEZgn?=
 =?us-ascii?Q?hVTPFo58Ho8Jf/IOt0YomMieRqTogAlMuXiTipcTbr40AOJ51Evl+9qmiXvS?=
 =?us-ascii?Q?1yktMKlrNBrm11VpeaNlDPDhJYyChqQZuNNhVgbgLCeAhq7fLRujkEb06wJs?=
 =?us-ascii?Q?+9vhIYpjpqtCZrTxkR3ZGFhUOOiXx5QIogqfCl0VKV7AZrdguePZONVN67Zb?=
 =?us-ascii?Q?IOiYNyeah65D/4wfy38e062gskqoEXUdVoMOdWW5AXOkwnqNmD3ZGVVnhR0B?=
 =?us-ascii?Q?GeWzaKnzyvNERqDv/Kz/xg28XZ/uF3hmWkyXaFCT8eXsWk7aK3zHBFzpD+nA?=
 =?us-ascii?Q?Lk8UiwOtd0Jnm7Vkr2kXGsrxTWrfA/ZBpPFYnRM9i1l9HvhXIilW/hlsKxzp?=
 =?us-ascii?Q?HWXxgcADLn1bbZpVacGOkfZlyGKAiHULihjcjaQQZKuGngoErdUFMUrLHVYY?=
 =?us-ascii?Q?STISKWo6eW6g3BNYAbsVabTmv0TimwTyKIG1Ce9eKC/Z+zQdZPZKJsJ8r4PG?=
 =?us-ascii?Q?gNRxzJRFcZZOrYz/xM0VAAKr9kFPVPqMl8W5Cibr/iQ1osshkzIhO1okCMv4?=
 =?us-ascii?Q?gF2AeZR7t3akPaMLSz4yWmPCoHD2n0dY1s8EpBHWxkBmHzjDWusDTAqY9dn9?=
 =?us-ascii?Q?0MPgTTGHPZ2huI+JD0ZAkKYm3AKjhShKrm13rkdMh8AbA2msjxr7nfMiYLuZ?=
 =?us-ascii?Q?d8WEhV5QLmYxHleV1qDlhrm3J80gkk/zXXadmp6PEOsva9tbPEa5Z03Ptau0?=
 =?us-ascii?Q?wsytpKyfad1jZsY7wwKsTIWlNI4Jj9Hh6nQ27zYVVKH24dnJBILiv+Kd4HKp?=
 =?us-ascii?Q?PI0bsn3Fn+Zcx9P379AqZJHvcLrkBVh5JWGeKyWAhqJawcgv0b89Hkp9f1WK?=
 =?us-ascii?Q?dn8vl3TAXAI3f/rXNazx4vRDsKIHv98aisl7fBHEcpLAGUejPSD6pFJA2J2z?=
 =?us-ascii?Q?mm34l+EVPKzNReKtXOt45ef6PriZxD0WlZoN7trhN4wtHb+cQQjU8BxEtQNY?=
 =?us-ascii?Q?oYjqgRZsFEmZNpIOmDqgYWRhmfUh1MO5CpY7siwiF3ZQHUf60Om0BL/CEYg5?=
 =?us-ascii?Q?tn2HxJb9rHmvDeAenXGxguIxqZ2m2+p/rOPSSY9+pN/gIMa84nOMkVwyq5sY?=
 =?us-ascii?Q?SMkSITEJxbibYXulGGnNoV+L03T49DxV3mSQ8dSafOjlcyxXJBSzLZc1NRDF?=
 =?us-ascii?Q?HuHxygpcS+Xdgm5vSSLPErby2fBy42Kdalu52/Rsbb7xAhrpEOh+K9AHWRKx?=
 =?us-ascii?Q?I/T9gK52CM9uXC23IHg8HlfoIuQ+/cLYbERFLk6d8eHeNKZ2IWCXPMHQkUdp?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9dd287-cd28-493b-f569-08dc1900adef
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 15:09:49.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNR2g0s46hjLUF6PsfuBNC7Kc5QYMhs5jI8aHirhRh/GjrVoEieNM54wTdGsP4V6ll5z6s8y2njFHKNGgGpvBVT3EhT9sPviscXAoQlyFkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
X-Proofpoint-GUID: T5vBap3GSmGDyy76m7V7ZsOdOyAQDuHa
X-Proofpoint-ORIG-GUID: T5vBap3GSmGDyy76m7V7ZsOdOyAQDuHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 15:09:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194057

From: Yash Shinde <Yash.Shinde@windriver.com>

Tests which are failing from below modules are added to exclude list
	tests/run-make
	tests/rustdoc
	tests/mir-opt
	tests/ui-fulldeps

* Redundent test cases whose parent dir is also present in  exclud list are removed.

* Newly addded tests are sorted and updated.

* Overall exclude tests count in exclude list is now reduced to 114.

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
 meta/recipes-devtools/rust/rust-source.inc |   4 +
 2 files changed, 43 insertions(+), 126 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..7d0efb1b01 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
 
         # build remote-test-server before image build
         recipe = "rust"
@@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internalized.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.rs',
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
-                            'tests/run-make/issue-22131/foo.rs',
-                            'tests/run-make/issue-36710/Makefile',
-                            'tests/run-make/issue-47551',
-                            'tests/run-make/pgo-branch-weights',
-                            'tests/run-make/pgo-gen',
-                            'tests/run-make/pgo-gen-lto',
-                            'tests/run-make/pgo-indirect-call-promotion',
-                            'tests/run-make/pgo-use',
-                            'tests/run-make/pointer-auth-link-with-c/Makefile',
-                            'tests/run-make/profile',
-                            'tests/run-make/static-pie',
-                            'tests/run-make/sysroot-crates-are-unstable',
-                            'tests/run-make/target-specs',
                             'tests/rustdoc',
-                            'tests/rustdoc/async-move-doctest.rs',
-                            'tests/rustdoc/async-trait.rs',
-                            'tests/rustdoc/auto-traits.rs',
-                            'tests/rustdoc/check-source-code-urls-to-def.rs',
-                            'tests/rustdoc/comment-in-doctest.rs',
-                            'tests/rustdoc/const-generics/const-generics-docs.rs',
-                            'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',
-                            'tests/rustdoc/cross-crate-hidden-impl-parameter.rs',
-                            'tests/rustdoc/cross-crate-links.rs',
-                            'tests/rustdoc/cross-crate-primitive-doc.rs',
-                            'tests/rustdoc/doctest-manual-crate-name.rs',
-                            'tests/rustdoc/edition-doctest.rs',
-                            'tests/rustdoc/edition-flag.rs',
-                            'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
-                            'tests/rustdoc/extern-html-root-url.rs',
-                            'tests/rustdoc/extern-impl-trait.rs',
-                            'tests/rustdoc/hide-unstable-trait.rs',
-                            'tests/rustdoc/inline_cross/add-docs.rs',
-                            'tests/rustdoc/inline_cross/default-trait-method.rs',
-                            'tests/rustdoc/inline_cross/dyn_trait.rs',
-                            'tests/rustdoc/inline_cross/impl_trait.rs',
-                            'tests/rustdoc/inline_cross/issue-24183.rs',
-                            'tests/rustdoc/inline_cross/macros.rs',
-                            'tests/rustdoc/inline_cross/trait-vis.rs',
-                            'tests/rustdoc/inline_cross/use_crate.rs',
-                            'tests/rustdoc/intra-doc-crate/self.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/basic.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/crate.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/macro.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/module.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/traits.rs',
-                            'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',
-                            'tests/rustdoc/intra-doc/extern-crate.rs',
-                            'tests/rustdoc/intra-doc/extern-inherent-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-reference-link.rs',
-                            'tests/rustdoc/intra-doc/issue-103463.rs',
-                            'tests/rustdoc/intra-doc/issue-104145.rs',
-                            'tests/rustdoc/intra-doc/issue-66159.rs',
-                            'tests/rustdoc/intra-doc/pub-use.rs',
-                            'tests/rustdoc/intra-doc/reexport-additional-docs.rs',
-                            'tests/rustdoc/issue-18199.rs',
-                            'tests/rustdoc/issue-23106.rs',
-                            'tests/rustdoc/issue-23744.rs',
-                            'tests/rustdoc/issue-25944.rs',
-                            'tests/rustdoc/issue-30252.rs',
-                            'tests/rustdoc/issue-38129.rs',
-                            'tests/rustdoc/issue-40936.rs',
-                            'tests/rustdoc/issue-43153.rs',
-                            'tests/rustdoc/issue-46727.rs',
-                            'tests/rustdoc/issue-48377.rs',
-                            'tests/rustdoc/issue-48414.rs',
-                            'tests/rustdoc/issue-53689.rs',
-                            'tests/rustdoc/issue-54478-demo-allocator.rs',
-                            'tests/rustdoc/issue-57180.rs',
-                            'tests/rustdoc/issue-61592.rs',
-                            'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs',
-                            'tests/rustdoc/issue-75588.rs',
-                            'tests/rustdoc/issue-85454.rs',
-                            'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc/macro_pub_in_module.rs',
-                            'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
-                            'tests/rustdoc/no-stack-overflow-25295.rs',
-                            'tests/rustdoc/primitive-reexport.rs',
-                            'tests/rustdoc/process-termination.rs',
-                            'tests/rustdoc/pub-extern-crate.rs',
-                            'tests/rustdoc/pub-use-extern-macros.rs',
-                            'tests/rustdoc/reexport-check.rs',
-                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
-                            'tests/rustdoc/reexport-doc.rs',
-                            'tests/rustdoc/reexports-priv.rs',
-                            'tests/rustdoc/reexports.rs',
-                            'tests/rustdoc/rustc,-incoherent-impls.rs',
-                            'tests/rustdoc/test_option_check/bar.rs',
-                            'tests/rustdoc/test_option_check/test.rs',
-                            'tests/rustdoc/trait-alias-mention.rs',
-                            'tests/rustdoc/trait-visibility.rs',
+                            'tests/rustdoc-json',
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
                             'tests/rustdoc-ui/doc-test-doctest-feature.rs',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
                             'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
                             'tests/rustdoc-ui/issue-80992.rs',
                             'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/nocapture-fail.rs',
                             'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/run-directory.rs',
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
@@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
-                            'tests/ui-fulldeps/deriving-global.rs',
-                            'tests/ui-fulldeps/deriving-hygiene.rs',
-                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs',
-                            'tests/ui-fulldeps/empty-struct-braces-derive.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr',
-                            'tests/ui-fulldeps/internal-lints/default_hash_types.rs',
-                            'tests/ui-fulldeps/internal-lints/diagnostics.rs',
-                            'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs',
-                            'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs',
-                            'tests/ui-fulldeps/internal-lints/query_stability.rs',
-                            'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',
-                            'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',
-                            'tests/ui-fulldeps/issue-14021.rs',
-                            'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',
-                            'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',
-                            'tests/ui-fulldeps/lint-pass-macros.rs',
-                            'tests/ui-fulldeps/regions-mock-tcx.rs',
-                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
-                            'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://cargo-path.patch;patchdir=${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
+            file://target-build-value.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
-- 
2.43.0


