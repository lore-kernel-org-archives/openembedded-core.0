Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76B626FD28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:20:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8P1Kgr4004837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 18:20:42 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 24 Sep 2014 18:20:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Sep 2014 09:20:41 +0800
Message-ID: <1411608042-30726-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH v2] ltp: add PACKAGECONFIG for numactrl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Sep 2014 01:20:46 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../ltp/ltp/add-knob-for-numa.patch                |   39 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    3 ++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch

diff --git a/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch b/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
new file mode 100644
index 0000000..ccbb0c4
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
@@ -0,0 +1,39 @@
+[PATCH] add knob to control whether numa support should be checked
+
+Upstream-Status: Pending
+
+otherwise the random dependency will be generated
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ configure.ac                                       |   10 +-
+diff --git a/configure.ac b/configure.ac
+index 9f397e7..1357256 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -142,6 +142,12 @@ else
+     AC_SUBST([WITH_REALTIME_TESTSUITE],["no"])
+ fi
+ 
++AC_ARG_WITH([numa],
++  [AC_HELP_STRING([--with-numa],
++    [have the numa support (default=no)])],
++  [with_numa="${withval}"],
++)
++
+ AC_CONFIG_SUBDIRS([utils/ffsb-6.0-rc2])
+ 
+ # END testsuites knobs
+@@ -159,7 +165,9 @@ LTP_CHECK_SIGNAL
+ LTP_CHECK_SYSCALL_EVENTFD
+ LTP_CHECK_SYSCALL_KEYCTL
+ LTP_CHECK_SYSCALL_MODIFY_LDT
++if test "x$with_numa" = xyes; then
+ LTP_CHECK_SYSCALL_NUMA
++fi
+ LTP_CHECK_SYSCALL_QUOTACTL
+ LTP_CHECK_SYSCALL_SIGNALFD
+ LTP_CHECK_SYSCALL_UNSHARE
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index c658bc0..66b600c 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
     file://ltp-Do-not-link-against-libfl.patch \
     file://automake-foreign.patch \
+    file://add-knob-for-numa.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -39,6 +40,8 @@ export exec_prefix = "/opt/ltp"
 
 EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
 
+PACKAGECONFIG[numa] = "--with-numa=yes, --with-numa=no, numactl,"
+
 # ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
 # we explicitly force regeneration of that directory and pass configure options.
 do_configure_append() {
-- 
1.7.10.4


