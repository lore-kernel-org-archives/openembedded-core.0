Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 22ADE77807
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:12:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Mar 2017 12:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,258,1486454400"; d="scan'208";a="832039563"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.196.145])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2017 12:12:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  7 Mar 2017 12:12:09 -0800
Message-Id: <1488917530-26968-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] systemtap: Add patch to remove quotes
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
X-List-Received-Date: Tue, 07 Mar 2017 20:12:17 -0000

This fixes the -I include lines that are getting passed to the
kernel macros

[YOCTO #10990]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ldrun-remove-quotes-around-I-include-line.patch | 38 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch b/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch
new file mode 100644
index 0000000..7996fdd
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-buildrun-remove-quotes-around-I-include-line.patch
@@ -0,0 +1,38 @@
+From 75c4aec6de3a615909f3283eac585760de101b8c Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Tue, 7 Mar 2017 10:46:12 -0800
+Subject: [PATCH] buildrun: remove quotes around -I include line
+
+By having the quotes, the kernel Makefile addtree macro adds the
+kernel $srctree directory as a prefix and causes compilation failures.
+Removing the quotes resolves the issue.
+
+This is trimmed from the verbose output of the GCC command line
+Before:
+ -I/srv/sdb/builds/4.9/tmp/work-shared/qemux86-64/kernel-source/"/srv/sdb/releases/jethro/builds/4.1/tmp/sysroots/x86_64-linux/usr/share/systemtap/runtime"
+
+After:
+ -I/srv/sdb/builds/4.9/tmp/sysroots/x86_64-linux/usr/share/systemtap/runtime
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ buildrun.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildrun.cxx b/buildrun.cxx
+index aaea64c..8a8ee9f 100644
+--- a/buildrun.cxx
++++ b/buildrun.cxx
+@@ -495,7 +495,7 @@ compile_pass (systemtap_session& s)
+   #if CHECK_POINTER_ARITH_PR5947
+   o << "EXTRA_CFLAGS += -Wpointer-arith" << endl;
+   #endif
+-  o << "EXTRA_CFLAGS += -I\"" << s.runtime_path << "\"" << endl;
++  o << "EXTRA_CFLAGS += -I" << s.runtime_path << endl;
+   // XXX: this may help ppc toc overflow
+   // o << "CFLAGS := $(subst -Os,-O2,$(CFLAGS)) -fminimal-toc" << endl;
+   o << "obj-m := " << s.module_name << ".o" << endl;
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c961230..a6aedd3 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -11,6 +11,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://no-msgfmt-check.patch \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
+           file://0001-buildrun-remove-quotes-around-I-include-line.patch \
           "
 
 # systemtap doesn't support mips
-- 
2.7.4


