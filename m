Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEF9C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 10:04:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10239.1753265064740048636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 03:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9299e969a9=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N5Z5pf1754768
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 10:04:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqu9yj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 10:04:23 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 23 Jul 2025 03:04:09 -0700
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 23 Jul 2025 03:04:08 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ltp: Skip semctl08 when __USE_TIME64_REDIRECTS is defined
Date: Wed, 23 Jul 2025 18:04:07 +0800
Message-ID: <20250723100407.3258594-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CHVv5fbeau4fB7-YSR4MkjYHjNLYiiY4
X-Proofpoint-ORIG-GUID: CHVv5fbeau4fB7-YSR4MkjYHjNLYiiY4
X-Authority-Analysis: v=2.4 cv=AbqxH2XG c=1 sm=1 tr=0 ts=6880b3a7 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=0Ni6rV8TAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=gp6BvuPKRHSpB9iQfUAA:9 a=bsv8rZKICMoA:10 a=MEv8DOuCJPEGjlO0Qob3:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX6sv7PIyQzn0c
 LFGDKD4eItfpaH7/GHOc/+9jiNoWXRhW3DseBRLz+/KRmE2EcQDMDJ/XXYodoN3mnwDE2wlHVhs
 KN/E/i0xNWARlfpIBx0BiOHMwGKb7CcCaKMqxqY3PBB/5ddO2gqJJp5x1YmuhZ4m4mciNLnmNUo
 76fml/z5adt6jFBEzDQpkWiNYixQ+R869WpTX+e9T3AS8rpwpzIIs5v4XDAApmJk3G4Pr67GZR2
 LdSFikrwMK8bqSOSnJpjfgkW5kx+Bqn9tbiFIxqQELdsiX1ltp4ZGmYU/NYgOhV7glGvi+EjYIw
 hHr5Rw7QwNeZgHaOAoaFDTR687mWbBcGKLvpip1CvchxSMLl9Qmy4XZnJSOC+ozNgo28X2UmbGl
 tKuRHBQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 10:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220798

From: Jiaying Song <jiaying.song.cn@windriver.com>

When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds
to a 64-bit time-safe version that omits the sem_otime_high and
sem_ctime_high fields. As a result, the case becomes invalid, leading to
incorrect behavior.

This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
defined, ensuring the test only runs when the semid_ds structurally
matches semid64_ds and the *_high fields are accessible.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...8-Skip-semctl08-when-__USE_TIME64_RE.patch | 48 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20250130.bb     |  3 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
new file mode 100644
index 0000000000..b4859a6f0a
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -0,0 +1,48 @@
+From 55b48d66857a43c2609fc351293b5601e2eb955d Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Fri, 23 May 2025 15:17:49 +0800
+Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
+ is defined
+
+When __USE_TIME64_REDIRECTS is defined, glibc redirects struct semid_ds to a
+64-bit time-safe version that omits the sem_otime_high and sem_ctime_high
+fields. As a result, the case becomes invalid and leads to incorrect behavior.
+
+This patch adds a check to skip the test when __USE_TIME64_REDIRECTS is
+defined, ensuring the test only runs when semid_ds structurally matches
+semid64_ds and the *_high fields are accessible.
+
+Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2025-May/043647.html]
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ testcases/kernel/syscalls/ipc/semctl/semctl08.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+index 1878bd4..3b799fa 100644
+--- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
++++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
+@@ -10,7 +10,11 @@
+ #include "tst_test.h"
+ #include "libnewipc.h"
+ 
+-#ifdef HAVE_SEMID64_DS_TIME_HIGH
++#if !defined(HAVE_SEMID64_DS_TIME_HIGH)
++TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
++#elif defined(__USE_TIME64_REDIRECTS)
++TST_TEST_TCONF("test requires __USE_TIME64_REDIRECTS to be undefined");
++#else
+ 
+ static void run(void)
+ {
+@@ -47,6 +51,4 @@ static struct tst_test test = {
+ 	.test_all = run,
+ 	.needs_tmpdir = 1,
+ };
+-#else
+-TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20250130.bb b/meta/recipes-extended/ltp/ltp_20250130.bb
index fc643c2ab9..8de13c6000 100644
--- a/meta/recipes-extended/ltp/ltp_20250130.bb
+++ b/meta/recipes-extended/ltp/ltp_20250130.bb
@@ -31,7 +31,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=ht
            file://0001-Add-__clear_cache-declaration-for-clang.patch \
            file://0001-kernel-kvm-don-t-hardcode-objcopy.patch \
            file://0001-cve-2015-3290-Disable-AVX-for-x86_64.patch \
-           "
+           file://0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch \ 
+          "
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.34.1


