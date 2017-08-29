Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id CEA6378346
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 083882E2F6;
	Tue, 29 Aug 2017 23:21:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id vrhKAtAe32oj; Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 68B6A2E357;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFBAD1E096;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E48F41E094;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id D7CEF2144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLfg6030231;
	Tue, 29 Aug 2017 23:21:41 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLf12030230;
	Tue, 29 Aug 2017 23:21:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:08 +0200
Message-Id: <0c2d4e7691ed8965055bb858ebeeb12b3eb237e8.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 12/25] rpm: Do not require that ELF binaries are executable to be identifiable
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:50 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

There is nothing that requires, e.g., a DSO to be executable, but it
is still an ELF binary and should be identified as such.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ire-that-ELF-binaries-are-executable-to-b.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch

diff --git a/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch b/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
new file mode 100644
index 0000000000..c910a478ee
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
@@ -0,0 +1,32 @@
+From d65d6e8760afbd7f70b22a1f3297a037bc475fea Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Mon, 15 May 2017 10:21:08 +0200
+Subject: [PATCH 11/13] Do not require that ELF binaries are executable to be
+ identifiable
+
+There is nothing that requires, e.g., a DSO to be executable, but it
+is still an ELF binary and should be identified as such.
+
+Upstream probably expects all ELF binaries to be marked as executable,
+but rather than imposing such a limitation for OE, allow any file to
+be identified as an ELF binary regardless of whether it is executable
+or not.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ fileattrs/elf.attr | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/fileattrs/elf.attr b/fileattrs/elf.attr
+index 595b33e09..bac52649d 100644
+--- a/fileattrs/elf.attr
++++ b/fileattrs/elf.attr
+@@ -1,4 +1,3 @@
+ %__elf_provides		%{_rpmconfigdir}/elfdeps --provides %{?__filter_GLIBC_PRIVATE:--filter-private}
+ %__elf_requires		%{_rpmconfigdir}/elfdeps --requires %{?__filter_GLIBC_PRIVATE:--filter-private}
+ %__elf_magic		^(setuid )?(setgid )?(sticky )?ELF (32|64)-bit.*$
+-%__elf_flags		exeonly
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 7665d54cdc..15880377b8 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0001-Fix-build-with-musl-C-library.patch \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
            file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
+           file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
2.12.0


