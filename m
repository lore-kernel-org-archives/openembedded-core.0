Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.54094.1600060895420672177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 22:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08E5LU1I000403
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 22:21:31 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 13 Sep 2020
 22:21:30 -0700
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH V2] procps: fix the top command crash issue
Date: Sun, 13 Sep 2020 22:21:30 -0700
Message-ID: <20200914052130.118133-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Avoid a potential SEGV during program termination.
Backported the patch form:
https://gitlab.com/procps-ng/procps.git
commit d37f85c269fbb6e905802ffdbce0ba4173ba21a9
commit ed34b1228ed08fbfdbf6f1a61ca7ca62448ccd86

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ntial-SEGV-during-program-terminatio.patch | 61 +++++++++++++++++++
 ...-line-of-code-to-sig_endpgm-function.patch | 38 ++++++++++++
 meta/recipes-extended/procps/procps_3.3.15.bb |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-restore-one-line-of-code-to-sig_endpgm-function.patch

diff --git a/meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch b/meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch
new file mode 100644
index 0000000000..4f7a01e41b
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch
@@ -0,0 +1,61 @@
+From d37f85c269fbb6e905802ffdbce0ba4173ba21a9 Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Tue, 6 Aug 2019 00:00:00 -0500
+Subject: [PATCH] top: avoid a potential SEGV during program termination
+
+The backtrace shown in the bug report referenced below
+illustrates a 'normal' program termination interrupted
+with some signal, ultimately then causing a top crash.
+
+So this commit just rearranges a little code such that
+all signals will be blocked during that rather lengthy
+end of program processing regardless of how initiated.
+
+[ in that report, ignore the assertion regarding the ]
+[ '-n' option. it obviously was not '1' since do_key ]
+[ had been called, which otherwise wouldn't be true. ]
+
+[ and when it is '1' the -d option would be ignored. ]
+
+Reference(s):
+https://bugzilla.redhat.com/show_bug.cgi?id=1737552
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+Upstream-Status: Backport[https://gitlab.com/procps-ng/procps.git]
+Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ top/top.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/top/top.c b/top/top.c
+index b01907a..73598e2 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -404,6 +404,11 @@ static void at_eoj (void) {
+          * The real program end */
+ static void bye_bye (const char *str) NORETURN;
+ static void bye_bye (const char *str) {
++   sigset_t ss;
++
++// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
++   sigfillset(&ss);
++   sigprocmask(SIG_BLOCK, &ss, NULL);
+    at_eoj();                 // restore tty in preparation for exit
+ #ifdef ATEOJ_RPTSTD
+ {  proc_t *p;
+@@ -595,12 +600,6 @@ static void sig_abexit (int sig) {
+          *    SIGUSR1 and SIGUSR2 */
+ static void sig_endpgm (int dont_care_sig) NORETURN;
+ static void sig_endpgm (int dont_care_sig) {
+-   sigset_t ss;
+-
+-// POSIX.1-2004 async-signal-safe: sigfillset, sigprocmask
+-   sigfillset(&ss);
+-   sigprocmask(SIG_BLOCK, &ss, NULL);
+-   Frames_signal = BREAK_sig;
+    bye_bye(NULL);
+    (void)dont_care_sig;
+ } // end: sig_endpgm
+-- 
+GitLab
diff --git a/meta/recipes-extended/procps/procps/0001-top-restore-one-line-of-code-to-sig_endpgm-function.patch b/meta/recipes-extended/procps/procps/0001-top-restore-one-line-of-code-to-sig_endpgm-function.patch
new file mode 100644
index 0000000000..9fe11b898d
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-restore-one-line-of-code-to-sig_endpgm-function.patch
@@ -0,0 +1,38 @@
+From ed34b1228ed08fbfdbf6f1a61ca7ca62448ccd86 Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Wed, 22 Jan 2020 00:00:00 -0600
+Subject: [PATCH] top: restore one line of code to sig_endpgm() function
+
+When that potential abend at program end was addressed
+in the patch shown below, one line of code was removed
+in error. That line served to suppress some end-of-job
+reports should ATEOJ_RPTSTD or ATEOJ_RPTHSH be active.
+
+So, this patch restores that previously deleted logic.
+
+Reference(s):
+. potential SEGV fix, master branch
+commit d37f85c269fbb6e905802ffdbce0ba4173ba21a9
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+Upstream-Status: Backport[https://gitlab.com/procps-ng/procps.git]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ top/top.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/top/top.c b/top/top.c
+index 8e8c7d9..63ec5fe 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -604,6 +604,7 @@ static void sig_abexit (int sig) {
+          *    SIGUSR1 and SIGUSR2 */
+ static void sig_endpgm (int dont_care_sig) NORETURN;
+ static void sig_endpgm (int dont_care_sig) {
++   Frames_signal = BREAK_sig;
+    bye_bye(NULL);
+    (void)dont_care_sig;
+ } // end: sig_endpgm
+-- 
+2.17.0
+
diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index f240e54fd8..bf7ee63775 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -15,6 +15,8 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
            file://0001-Fix-out-of-tree-builds.patch \
+           file://0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch \
+           file://0001-top-restore-one-line-of-code-to-sig_endpgm-function.patch \
            "
 
 SRC_URI[md5sum] = "2b0717a7cb474b3d6dfdeedfbad2eccc"
-- 
2.17.1

