Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4379.1629836297812890864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 13:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=H9cPGd5P;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3870d3f41e=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17OK0fAR017794
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 20:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=PPS06212021; bh=oOz/SQGO4nqX5TUyVKlmSSOuiwbSwdsLppAKUJTJAMQ=;
 b=H9cPGd5PIZEVBcwcsIH8Mpxsao1QQGn0W22VGod+MAEbQw9EBacPpkEsxPTPAqajzS91
 8qtduz6iKqNjQVgo3KS29vw7b7yowvOe/NO28Fe+usqbXFkOQktN48mVb43V+Fu1dnu8
 MoQVxCDReKadoI1F5ByB/N/vNSt9pZAnYICBxg6alenj/a6zFujqfduzwpU309x6qkX9
 McLgU6axKuwNFFaRsRFs7xMwT9rt3z+3upPsEOInjTAwIOXxmSpOerguWSYJEVkDY1g0
 4cXckzqARqNI6t+pq45iONTg4B9AMnLjxMYLxwu0jzihxJJ4xLx2X6jsklStkkkV0rfg IA== 
Received: from ala-smtp01.corp.ad.wrs.com (unknown-146-56.windriver.com [147.11.146.56])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an7e4g0b9-1
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 20:18:16 +0000
Received: from yow-lpggp3.wrs.com ([128.224.137.13]) by ala-smtp01.corp.ad.wrs.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 24 Aug 2021 13:18:16 -0700
From: "Paul Gortmaker" <paul.gortmaker@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: backport ioctl_ns05 fix from upstream
Date: Tue, 24 Aug 2021 16:18:15 -0400
Message-Id: <20210824201815.4124-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Aug 2021 20:18:16.0106 (UTC) FILETIME=[2BF560A0:01D79925]
X-Proofpoint-GUID: YqbpvR_XYnuAebPWiaY1cQWJCYdKwSVT
X-Proofpoint-ORIG-GUID: YqbpvR_XYnuAebPWiaY1cQWJCYdKwSVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-24_06,2021-08-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240129
Content-Transfer-Encoding: 8bit

This false positive keeps showing up in our testing but the fix isn't
yet a part of a tagged release, and it is probably too late for doing
an uprev for the fall release anyway.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
new file mode 100644
index 000000000000..08b88a38f3ac
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
@@ -0,0 +1,59 @@
+From af2b6f5ee6b171078b18246dd73f71cf6e350859 Mon Sep 17 00:00:00 2001
+From: Marius Hillenbrand <mhillen@linux.ibm.com>
+Date: Mon, 19 Jul 2021 13:58:35 +0800
+Subject: [PATCH] syscalls/ioctl_ns05.c, ioctl_ns06.c: Fix too small buffer for
+ path
+
+commit af2b6f5ee6b171078b18246dd73f71cf6e350859 upstream.
+
+Resize the buffer used for paths into /proc/ to grant enough space
+for long PIDs. While at it, replace sprintf with snprintf to avoid
+buffer overflows if we ever ran out of space again.
+
+Fixes: #847
+Signed-off-by: Marius Hillenbrand <mhillen@linux.ibm.com>
+Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
+Upstream-Status: Backport
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+
+diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
+index a67ddbe2c66f..52613810c7ce 100644
+--- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
++++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
+@@ -59,10 +59,10 @@ static void run(void)
+ 	if (pid == -1)
+ 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
+ 
+-	char child_namespace[20];
++	char child_namespace[30];
+ 	int my_fd, child_fd, parent_fd;
+ 
+-	sprintf(child_namespace, "/proc/%i/ns/pid", pid);
++	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/pid", pid);
+ 	my_fd = SAFE_OPEN("/proc/self/ns/pid", O_RDONLY);
+ 	child_fd = SAFE_OPEN(child_namespace, O_RDONLY);
+ 	parent_fd = ioctl(child_fd, NS_GET_PARENT);
+diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
+index b6ac80208d02..c30f7de91e09 100644
+--- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
++++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
+@@ -51,14 +51,14 @@ static int child(void *arg LTP_ATTRIBUTE_UNUSED)
+ 
+ static void run(void)
+ {
+-	char child_namespace[20];
++	char child_namespace[30];
+ 
+ 	pid_t pid = ltp_clone(CLONE_NEWUSER | SIGCHLD, &child, 0,
+ 		STACK_SIZE, child_stack);
+ 	if (pid == -1)
+ 		tst_brk(TBROK | TERRNO, "ltp_clone failed");
+ 
+-	sprintf(child_namespace, "/proc/%i/ns/user", pid);
++	snprintf(child_namespace, sizeof(child_namespace), "/proc/%i/ns/user", pid);
+ 	int my_fd, child_fd, parent_fd;
+ 
+ 	my_fd = SAFE_OPEN("/proc/self/ns/user", O_RDONLY);
+-- 
+2.32.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-extended/ltp/ltp_20210524.bb
index 702fa62b660d..20e2deffa5aa 100644
--- a/meta/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta/recipes-extended/ltp/ltp_20210524.bb
@@ -31,6 +31,7 @@ SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
+           file://0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.32.0

