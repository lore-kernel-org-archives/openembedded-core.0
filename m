Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB808718F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Oct 2014 20:31:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Oct 2014 13:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,705,1406617200"; d="scan'208";a="604214971"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2014 13:31:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Oct 2014 21:31:27 +0100
Message-Id: <59e7817b6e1d1dd90668083cf34f1650a84430c0.1413145831.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1413145831.git.paul.eggleton@linux.intel.com>
References: <cover.1413145831.git.paul.eggleton@linux.intel.com>
Subject: [dylan][PATCH 2/6] bash: Fix CVE-2014-7169
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
X-List-Received-Date: Sun, 12 Oct 2014 20:31:54 -0000

From: Khem Raj <raj.khem@gmail.com>

This is a followup patch to incomplete CVE-2014-6271 fix
code execution via specially-crafted environment

Change-Id: Ibb0a587ee6e09b8174e92d005356e822ad40d4ed
(From OE-Core master rev: 76a2d6b83472995edbe967aed80f0fcbb784b3fc)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../bash/bash-3.2.48/cve-2014-7169.patch                 | 16 ++++++++++++++++
 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch  | 16 ++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb                |  1 +
 meta/recipes-extended/bash/bash_4.2.bb                   |  1 +
 4 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
new file mode 100644
index 0000000..2e734de
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-3.2.48/parse.y
+===================================================================
+--- bash-3.2.48.orig/parse.y	2008-04-29 18:24:55.000000000 -0700
++++ bash-3.2.48/parse.y	2014-09-26 13:07:31.956080056 -0700
+@@ -2503,6 +2503,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   last_read_token = '\n';
+   token_to_read = '\n';
+ }
diff --git a/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch b/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch
new file mode 100644
index 0000000..3c69121
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-4.2/cve-2014-7169.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-4.3/parse.y
+===================================================================
+--- bash-4.3.orig/parse.y	2014-09-26 13:10:44.340080056 -0700
++++ bash-4.3/parse.y	2014-09-26 13:11:44.764080056 -0700
+@@ -2953,6 +2953,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   current_token = '\n';		/* XXX */
+   last_read_token = '\n';
+   token_to_read = '\n';
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index cbe1ee6..8362c27 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch003 \
            file://mkbuiltins_have_stringize.patch \
            file://cve-2014-6271.patch;striplevel=0 \
+           file://cve-2014-7169.patch \
           "
 
 SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index 83294b0..67b1924 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://cve-2014-6271.patch;striplevel=0 \
+           file://cve-2014-7169.patch \
            file://build-tests.patch \
            file://test-output.patch \
            file://run-ptest \
-- 
1.9.3


