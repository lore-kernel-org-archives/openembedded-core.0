Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2783.1599807497745313689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 23:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhixiong.chi@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08B6wFTs002911
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 23:58:16 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 23:58:13 -0700
From: "Zhixiong Chi" <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] procps: fix the top command crash issue
Date: Thu, 10 Sep 2020 23:58:13 -0700
Message-ID: <20200911065813.85856-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Avoid a potential SEGV during program termination.
Backported the patch form:
https://gitlab.com/procps-ng/procps/-/commit/d37f85c269fbb6e905802ffdbce0ba4173ba21a9

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ntial-SEGV-during-program-terminatio.patch | 61 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.15.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch

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
diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index f240e54fd8..b299779253 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
            file://0001-Fix-out-of-tree-builds.patch \
+           file://0001-top-avoid-a-potential-SEGV-during-program-terminatio.patch \
            "
 
 SRC_URI[md5sum] = "2b0717a7cb474b3d6dfdeedfbad2eccc"
-- 
2.17.1

