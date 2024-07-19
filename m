Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6859C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 08:30:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14548.1721377787609378627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jul 2024 01:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7930018dd3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J6Rgc2030719
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:29:46 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40ergc9cj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:29:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neCeA+LSauchT54Edea+SMsFgzWZ16M5/AmxPEBzSyidDqLqAXswc1KYmuKQVsRXN3BADyZ55FzoC0jdLt5kDEJXFEt8isz0HoQo1pbNvf+hefg+6T/pLtLLdleiIQsRsTSiWB7MOXKrnW9CntJg36yMapOQmzKdlHroxrE9Yg6b6wCm4g2yrQ1NR8V4+wxD49gKN0eHZ7HGgqeRapPZF8v/XyIYl5kfUnW/13dg0MWJ6sY2A4NuMwCGFGAXGmitQxJnWtyflDHPTm90/24LwVyVaU0n1Msy8hsoYb5ZHwAhhUXfzOZozZPa7QkMU7IqJ5G/mYZIyQE3g4Sj+xM1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVcbSBAEBLpYBh/anX7eyqhz9ULXY6lZl/f81vmjBpY=;
 b=etUAWPCRlgghFfT+cEGtVnRdSzg3vCNygMZtGhfx6K87uxvXND47RQ2OknySsTe6jFRjYHBMX8LW+OBzFYEFc/Wm5u2Y/LrRjoPpHtAwpjUsFxfRJ6ub+nS2K/X325iOJVxWNvuHxjE+5TCjALWnCQOkQfopwqsbmWvwsSqeaTkcaFYgLADzF6fCSOF8h3RcmSw7LOoLm93PHEhlHtv0WP0DGSTYSavV9jSu6W/Rnn3WLVYqvyf2M+3CMbi3tOpD+7nmyUi9gDIf0c+3cjgD7WhoPM0QRFfdeUChcnBukrwCEAeBeY4rQo2P6tlgZT+Z6ZZ59H/VmY6pCaSHNjz7QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 08:29:41 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%5]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 08:29:40 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Subject: [scarthgap][PATCH] glibc: stable 2.39 branch updates
Date: Fri, 19 Jul 2024 01:28:42 -0700
Message-ID: <20240719082842.3916170-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 55805cc5-4ea7-4f04-85b5-08dca7ccef24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kBHsRDgeHF+zv9lzp2GSFODJVNlazHhIefcFlSIvOwpVogVEz5/j9mN/Cuv3?=
 =?us-ascii?Q?vCSr5+szz0fyg4ZpKatv5tYN3mDfXLGUbUT5ZhFQiEGYdbYRKu7VsHe2Pymi?=
 =?us-ascii?Q?4mzzTdr5GcNEZnxqHa/ePDfqAkR0ITYvy28LqtuHq4pGgum/F/Nza29/IK0Z?=
 =?us-ascii?Q?+QwnHA8tgpUMsRLU07ht0S13fRKL2ACf0P7OSHcBgjBtOIoZs8e3Z8Rj2S1d?=
 =?us-ascii?Q?d4NI2zYZd215rU1xpfnEzGTSRQc45lwUASzhTulPZk247aHPtBjN45nltzG6?=
 =?us-ascii?Q?zNVruGRrb9zvTMYPQapMVwATzqiyweZCCBF5vYpTv2oEVxBiXqrYjNdAQIwh?=
 =?us-ascii?Q?HefGdG3BDJbtJy+CyVj6UsF1Z0Ts87QHGpW6zAgqVFdr7noUt9fpKnmWjODB?=
 =?us-ascii?Q?MAW3egYnTckkKus56fM51mDjZpdDnZXhsW4/GlrC/g/UctCWYjKjgKeI9CuZ?=
 =?us-ascii?Q?VZO+H8g+8xbzlKpTLZaNisHezqHRa4fR3Si5CDVB3LEuG0RJos+gqxHfgNnA?=
 =?us-ascii?Q?smLIpnWkrLG336hLUsI74GBIuvn71+ffjbCnJ5pYcqzJlkjxOvgtlSA2pxKD?=
 =?us-ascii?Q?uJf49NhkMXalqzZkOqPEktsaCiYQwRhhlgyndVdMMs1lBUFVvw6AUKdEa2rM?=
 =?us-ascii?Q?551ttPCceyaOVaerotDi85H2EtoxDC4YkuldM8JLRAYmnJGKrr+D6ynUBHcI?=
 =?us-ascii?Q?m42bybuPLYwYJizY5p725gnFMfiMqpJlzMkP8uu1562ZwjRTNJUgRx4k6p88?=
 =?us-ascii?Q?gfifopEmmZSBZpWzYkh7j11HWDxOAGa76oLhPs1j0K1hW3EvAyQE4MnL37eG?=
 =?us-ascii?Q?a6sFAAxLz7mCrfkd70Jo3zhOYqPHkffz9Yu+larbmYhLsu+wJ0n1018aU7t4?=
 =?us-ascii?Q?PkekL2gjcA8Y9x11JCFdAkhl8QNVkjYF3+biPDc7OO5GYCkpyRgzB+1KZQq1?=
 =?us-ascii?Q?5jk32gwS+k6TiSXFXepz6By1OjYtaa/xvWmXgKitCiFf5sO3Tp6eIcR8DUsX?=
 =?us-ascii?Q?kAWScKfq3GaIinr0ehEu/HBZ4WGYvpCG7g5NmYE4LNmTw/Kc+fnhC0afseJ3?=
 =?us-ascii?Q?hCua2tPgbvwVhowoHtAShyzmMIrruu49C4Q4sLxyZ7cUkNRw9jXbh1rrh50w?=
 =?us-ascii?Q?ouKn2iS2PeVkDpmd2jcoPZ4SYcF1YhI8v6oGdbDhzaLCRE9ZbguYK46XULav?=
 =?us-ascii?Q?SYlSBSVMlmMiYB8lumQyAUgJ3kF+ebLPw9zltK/6dZ3xQSWTiHz7qF4MWxN8?=
 =?us-ascii?Q?WWA4WowsmABPf2hmQgU8Bhd1/rqTul7ptFYoeQlTwn756T7rwiUc+8oZ09Pv?=
 =?us-ascii?Q?fv1iudzdXgxvxkPbvgICT7pIHWDjKgPa2twRQtxC++E3wbIn3RJyCU6aMXEs?=
 =?us-ascii?Q?xDezGkFQUDNqbU6I4uRK9TJYXPI9z24uYbN0dEObzsdiGVwJfA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vAcFPivyN8ElZYSdJqfuVMRlHqnKyG9YUHe+d59yr7maabyoY1XmbD1A7KBP?=
 =?us-ascii?Q?aC0wY9Oi/S9IVISVsggI5Kb7MSfH4rsm9nC9zqFR3LdaekiKY+j3+O7qL+xf?=
 =?us-ascii?Q?phSyqw78fgty4BrD8SjdF05yjqimGmup9sEmmfKVUQnfDfCUojp/Ouc3aPVc?=
 =?us-ascii?Q?KXBAUucqyRd4gfMvRh1+TY6Vom546Yl6xUz1xawo1eba0q9+I8d40sOLF257?=
 =?us-ascii?Q?cCeAdl+50rNqMH9pI2919yLqqHkcxpSA+88T0Xz8qfcrbj8648Mst5LEXgBt?=
 =?us-ascii?Q?vHabRYyGhkaUtrw5bjuqH/TTPJ7uSGO5PJavwvPRZVz/A1OW+hiIKqDjlpL1?=
 =?us-ascii?Q?V6nwOh6lL3vttS6cQFfoiK9reH28mUHA5UjreAgxbVyVlmdsKhw7I/Xb+pQS?=
 =?us-ascii?Q?386pP17iUafrL8rre00GidEefv2pgHHRwyhE1YCPniNcUNdiZLhC6msTsGfi?=
 =?us-ascii?Q?SiZKUH+nNXUFOi2loIJBe8DYQRsGmpeR6aWEMy8tVE1W2Xw2G5odn9X5QsIS?=
 =?us-ascii?Q?lXLv/RK5fcZqWpvCWc4J8TzZsSBqWYoRiEvNiE4N/CW9EgstNyOF629kHm0g?=
 =?us-ascii?Q?KzwbsuRe6XAGSI6U0QVj+r0I0NMmJZ0+vFlq/XM7LzXmSivW/7w7BmpiL8lN?=
 =?us-ascii?Q?8RWZXaw9JpZl7xnbpOZRoaCnpHn4pkojRcH68jMY63r6p6bxw3afr78QXyrC?=
 =?us-ascii?Q?yc6mrStClpBc1orNplr2qSdQxq39k6N2/xtZV96GppM52KkgYbnzw1XE/p7a?=
 =?us-ascii?Q?x8hj2e/NO9LRKak8PE6531IAGkg5iV3Ga6oJVVBfQm717dWLGU3bEEe2I2gU?=
 =?us-ascii?Q?r8Yi/czCjhLQgaraT1qjoyiu9oqyenl87zGTb4zbVPkzSDbFamKWBYKQye0Z?=
 =?us-ascii?Q?8BMGUccs0S3wtEEOMclQfx7xuizVWBlPllhAL5r8wn/Cx/7EBunUbhlMa2Z0?=
 =?us-ascii?Q?3fTwgBINJfSdg0vGj8Fd9B67FbLq+XS3b+/zO7SOtYZJ9dKyUj4QVODlFbXr?=
 =?us-ascii?Q?h2trgDHUxj9sD9F1kOwTBNJSCRLWbLWp+XFJVbA1rd9znTZtmtD5pLmEOpKh?=
 =?us-ascii?Q?vGK3HjPAcyWxHEhixV5Ygfs8RZwSIOCz5u5nmtlsiJgAMf2wwt49EP2LdYC9?=
 =?us-ascii?Q?QJ+9nxMmWGEdgDvNgql76pva9YmDVnFxGPxAwfE1dvsc94af+ULvor8IiKEZ?=
 =?us-ascii?Q?8nXHrS0Fv4xnogB4BDj6WcJi+hXZu5dfC9kTzwipiU6y7o4CsYLncmRiM+eA?=
 =?us-ascii?Q?HitjkU5bningjjJwX+cdo71e2l0fTZ6JKZVYL4vZteGQ11lAy0qQKtKWrM2y?=
 =?us-ascii?Q?/FzbUAyS6bCECRBMdUVWCG7GrKrq6W1vjCdmDMhs5nEwsXb++lWQydWht102?=
 =?us-ascii?Q?k8gdA+XVoWUmLx+EAt4b7ql1pVPLbjiJ3MqKgChxSmrlSFPe78eJR5Ie7LX4?=
 =?us-ascii?Q?Pn+G7TcFS6CXONBoT4/HgPZeZ1gejztpvqTHVBCxR1qWFn6Nsz1H4RLaEVaO?=
 =?us-ascii?Q?uoCO5mhaI1D4BKzbiClzW+vwu+6b+OR3NBmkwOeZO3Nay6b67LQkQ267glSQ?=
 =?us-ascii?Q?5VbvqUWZT2W4CcL2dm8o/FgzRvVzTuiVTDBHJOhfWTs/X1d+KMglmrAwE6uk?=
 =?us-ascii?Q?rA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55805cc5-4ea7-4f04-85b5-08dca7ccef24
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 08:29:40.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wu2xvZ1dBUPaVgu7IkPcF6wchqnuLw92rwrrAaSiOBuyS5OJDQeqMUE8j+rl3x+S/WHAYQBTzNr99A+vgVV2Wi2vR+c18j6+5hF0hY+OHS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
X-Proofpoint-GUID: wg9RJ6TMQoedlqWkRjwdI-QOrIc52KTl
X-Proofpoint-ORIG-GUID: wg9RJ6TMQoedlqWkRjwdI-QOrIc52KTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_04,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407190065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 08:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202256

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
e8f5217097 Linux: Make __rseq_size useful for feature detection (bug 31965)
143a7a0623 elf: Make dl-rseq-symbols Linux only
1062ebbd19 nptl: fix potential merge of __rseq_* relro symbols
5c46e6b666 s390x: Fix segfault in wcsncmp [BZ #31934]
a036311246 stdlib: fix arc4random fallback to /dev/urandom (BZ 31612)
d2cbfcf1d9 math: Provide missing math symbols on libc.a (BZ 31781)
d473c9bb3b math: Fix isnanf128 static build (BZ 31774)
3950cbd7a1 math: Fix i386 and m68k exp10 on static build (BZ 31775)
6cb25aff85 math: Fix i386 and m68k fmod/fmodf on static build (BZ 31488)
74630b1bb7 posix: Fix pidfd_spawn/pidfd_spawnp leak if execve fails (BZ 31695)
7f9f25f255 Linux: Include <dl-symbol-redir-ifunc.h> in dl-sysdep.c
198632a05f NEWS: update list of fixed CVEs in 2.39
77bb3c7154 NEWS: update list of fixed bugs in 2.39
f05638731e x86: Properly set x86 minimum ISA level [BZ #31883]
b7f5b0a711 x86: Properly set MINIMUM_X86_ISA_LEVEL for i386 [BZ #31867]
e1d0040a6d localedata: ssy_ER: Fix syntax error
9de9cd17e7 malloc: New test to check malloc alternate path using memory obstruction
a2da98aa2a malloc: Improve aligned_alloc and calloc test coverage.
305ee48826 malloc/Makefile: Split and sort tests
00899eba26 x86/cet: fix shadow stack test scripts
6ade91c211 elf: Avoid some free (NULL) calls in _dl_update_slotinfo
70f560fc22 misc: Add support for Linux uio.h RWF_NOAPPEND flag
c9d8534406 i386: Disable Intel Xeon Phi tests for GCC 15 and above (BZ 31782)
aee37de299 Reinstate generic features-time64.h
dd535f4f19 Always define __USE_TIME_BITS64 when 64 bit time_t is used
26e7005728 socket: Use may_alias on sockaddr structs (bug 19622)
9f2b100d67 parse_fdinfo: Don't advance pointer twice [BZ #31798]
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

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1e4a323d64..ad58bebcf1 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "273a835fe7c685cc54266bb8b502787bad5e9bae"
+SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


