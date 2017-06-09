Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1676E78311
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4321B2E6DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 33Nqlaet1WYk
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:45 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 02A472E6E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFD1E1A090
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEC281A08B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B32B12C64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v59JYhEG010995
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 21:34:43 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v59JYh7J010994
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Jun 2017 21:34:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 21:34:33 +0200
Message-Id: <8a12c4d729fd4c1583e35e012fde72e2aefc247b.1497036762.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497036762.git.pkj@axis.com>
References: <cover.1497036762.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 11/13] rpm: Use conditional to access %{_docdir} in macros.in
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
X-List-Received-Date: Fri, 09 Jun 2017 19:34:45 -0000

This avoids the following warning:

warning: Ignoring invalid regex %{_docdir}

when runing `rpmdeps -R <file>`, since %{_docdir} is only defined when
parsing a spec file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...onditional-to-access-_docdir-in-macros.in.patch | 36 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch

diff --git a/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch b/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
new file mode 100644
index 0000000000..996da90d43
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
@@ -0,0 +1,36 @@
+From 77808db4036dc4a012c47aca36255549ed764a6a Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Tue, 16 May 2017 10:58:18 +0200
+Subject: [PATCH 12/13] Use conditional to access %{_docdir} in macros.in
+
+This avoids the following warning:
+
+warning: Ignoring invalid regex %{_docdir}
+
+when runing `rpmdeps -R <file>`, since %{_docdir} is only defined when
+parsing a spec file (in parseSpec()).
+
+Upstream-Status: Accepted [https://github.com/rpm-software-management/rpm/pull/216]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ macros.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/macros.in b/macros.in
+index 84ae25275..cca67a500 100644
+--- a/macros.in
++++ b/macros.in
+@@ -200,8 +200,8 @@ package or when debugging this package.\
+ # Their purpouse is to set up global filtering for all packages. If you need
+ # to set up specific filtering for your package use %__requires_exclude_from
+ # and %__provides_exclude_from instead.
+-%__global_requires_exclude_from		%{_docdir}
+-%__global_provides_exclude_from		%{_docdir}
++%__global_requires_exclude_from		%{?_docdir:%{_docdir}}
++%__global_provides_exclude_from		%{?_docdir:%{_docdir}}
+ 
+ #	The path to the gzip executable (legacy, use %{__gzip} instead).
+ %_gzipbin		%{__gzip}
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 15880377b8..7c5f649a8b 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0001-Add-a-color-setting-for-mips64_n32-binaries.patch \
            file://0001-Add-PYTHON_ABI-when-searching-for-python-libraries.patch \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
+           file://0012-Use-conditional-to-access-_docdir-in-macros.in.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
2.12.0


