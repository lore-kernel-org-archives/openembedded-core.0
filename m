Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E8DC87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 13:42:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.81741.1753710166447893920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 06:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0304a478bb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56SBp0x52066936;
	Mon, 28 Jul 2025 06:42:41 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1sge0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Jul 2025 06:42:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 28 Jul 2025 06:42:40 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 28 Jul 2025 06:42:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH] util-linux: correct test case kill/decode for bash 5.3
Date: Mon, 28 Jul 2025 21:42:38 +0800
Message-ID: <20250728134238.3455854-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2oSHYemeinYM9C6dtiiyvufiNYuECccB
X-Proofpoint-GUID: 2oSHYemeinYM9C6dtiiyvufiNYuECccB
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=68877e51 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=9UbBDLfmnCaAdjE3OuMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEwMSBTYWx0ZWRfXzN1nYAjFHLTl
 qxvK+EaG89Dphc39E0I1AMNGxp78xN8dRr3+XWZivCzWe9TabkT2gt8zqJd9qCRmzB21SrZkwqW
 M+WlIsBseTziz/wlIB3M8zXUqZb+taQJWhOwLP2DTWCzNr4hOt3z0qJGhsuMEPwNMpfNp6AggC3
 QDKuBUK3lWIbNGGuk8S253s3QDG/k+rGOlry3GXwYW2pcw7MPadQgvIDviOLUmj2pE1D2o/lbiX
 npE15mrhlcW7mASqBWU4vI2lVcj5/f25vFxkkRkzDL5SH3vxDJxpBQbYM/fnwBoG3qi2E/zR2Xh
 091YhdgA8pU5R+4I8sDlHaUhBkjVnBL0HmGD7OX3RJqlR/nKo23os0au/dWOSZ2G4Vu+6duvIau
 9pd0GM/e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 13:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221006

After upgrading bash to 5.3 to contain commit [1], if SIGINT was trapped in
asynchronous subshell, bash called set_signal_async_ignored to make sure
processes that are created by this asynchronous subshell to ignore SIGINT.

And it caused test case `kill/decode' failed, the signal INT was existed in
both of Blocked and Ignored

root@qemux86-64:~# cd /usr/lib/util-linux/ptest/
root@qemux86-64:/usr/lib/util-linux/ptest# ./run-ptest
...
diff-{{{
|--- /usr/lib/util-linux/ptest/tests/expected/kill/decode        2011-04-05 23:00:00.000000000 +0000
|+++ /usr/lib/util-linux/ptest/tests/output/kill/decode  2025-07-28 12:09:46.279000000 +0000
@@ -16,5 +16,5 @@
 Pending (thread): INT ILL
 Pending (process): USR1
 Blocked: INT ILL ABRT FPE USR1 SEGV TERM
-Ignored: HUP QUIT TRAP PIPE ALRM
+Ignored: HUP INT QUIT TRAP PIPE ALRM
 Caught: ILL USR1
}}}-diff
...

Explicitly reset SIGINT to default action after trapping, then the
test case `kill/decode' works on both of old (<5.3) and new (>=5.3) bash

[1] https://cgit.git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=a5d2617c7a7e602ace1f4149987cdfd075c4e762

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...st_sigstate.c-explicitly-reset-SIGIN.patch | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 111f29cb928..7d6759a2c0e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
+           file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            "
 
 SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
new file mode 100644
index 00000000000..324798cfd58
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
@@ -0,0 +1,55 @@
+From 383efe26a2a61b420d369cd2c23f03d1d690d425 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 28 Jul 2025 20:35:13 +0800
+Subject: [PATCH] tests/helpers/test_sigstate.c: explicitly reset SIGINT to
+ default action after trapping
+
+After upgrading bash to 5.3 to contain commit [1], if SIGINT was trapped in
+asynchronous subshell, bash called set_signal_async_ignored to make sure
+processes that are created by this asynchronous subshell to ignore SIGINT.
+
+And it caused test case `kill/decode' failed, the signal INT was existed in
+both of Blocked and Ignored
+
+$ ./tests/run.sh --use-system-commands --parsable --show-diff   kill/decode
+...
+diff-{{{
+|--- /usr/lib/util-linux/ptest/tests/expected/kill/decode        2011-04-05 23:00:00.000000000 +0000
+|+++ /usr/lib/util-linux/ptest/tests/output/kill/decode  2025-07-28 12:09:46.279000000 +0000
+@@ -16,5 +16,5 @@
+ Pending (thread): INT ILL
+ Pending (process): USR1
+ Blocked: INT ILL ABRT FPE USR1 SEGV TERM
+-Ignored: HUP QUIT TRAP PIPE ALRM
++Ignored: HUP INT QUIT TRAP PIPE ALRM
+ Caught: ILL USR1
+}}}-diff
+...
+
+Explicitly reset SIGINT to default action after trapping, then the
+test case `kill/decode' works on both of old (<5.3) and new (>=5.3) bash
+
+[1] https://cgit.git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=a5d2617c7a7e602ace1f4149987cdfd075c4e762
+
+Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3666]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/helpers/test_sigstate.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/helpers/test_sigstate.c b/tests/helpers/test_sigstate.c
+index 52c7dcb..b631ec2 100644
+--- a/tests/helpers/test_sigstate.c
++++ b/tests/helpers/test_sigstate.c
+@@ -68,6 +68,7 @@ int main(int argc _U_, char **argv _U_)
+ 	sigignore(SIGPIPE);
+ 	sigignore(SIGALRM);
+ 
++	signal(SIGINT, SIG_DFL);
+ 	signal(SIGBUS, SIG_DFL);
+ 	signal(SIGFPE, SIG_DFL);
+ 	signal(SIGSEGV, SIG_DFL);
+-- 
+2.34.1
+
-- 
2.34.1


