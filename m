Return-Path: <juro.bystricky@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6956FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 21:33:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2018 14:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,378,1517904000"; d="scan'208";a="30047654"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga006.jf.intel.com with ESMTP; 29 Mar 2018 14:33:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 14:33:18 -0700
Message-Id: <1522359198-13341-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] libc6-dbg: improve reproducibility
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
X-List-Received-Date: Thu, 29 Mar 2018 21:33:15 -0000

Prevent bison from generating #line comments containing build
host paths references.

[YOCTO #12625]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../glibc/0030-plural_c_no_preprocessor_lines.patch | 21 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.27.bb               |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch b/meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch
new file mode 100644
index 0000000..6f03e1c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-plural_c_no_preprocessor_lines.patch
@@ -0,0 +1,21 @@
+Improve reproducibility:
+Do not put any #line preprocessor commands in bison generated files.
+These lines contain absolute paths containing file locations on
+the host build machine.
+
+Upstream-Status: Pending
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/intl/Makefile b/intl/Makefile
+index 2219717..a203780 100644
+--- a/intl/Makefile
++++ b/intl/Makefile
+@@ -151,7 +151,7 @@ $(objpfx)tst-gettext6.out: $(objpfx)tst-gettext.out
+ 
+ CPPFLAGS += -D'LOCALEDIR="$(localedir)"' \
+ 	    -D'LOCALE_ALIAS_PATH="$(localedir)"'
+-BISONFLAGS = --yacc --name-prefix=__gettext --output
++BISONFLAGS = --yacc --no-lines --name-prefix=__gettext --output
+ 
+ $(inst_localedir)/locale.alias: locale.alias $(+force)
+ 	$(do-install)
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index 4a461ab..772351a 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
+           file://0030-plural_c_no_preprocessor_lines.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.7.4


