Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62A096DFD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwJ7X014001
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:19 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:20 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:41 -0600
Message-ID: <aaaa4a96002148ed300f7d71a3447cb9f1ea7abb.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386283669.git.mark.hatle@windriver.com>
References: <cover.1386283669.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 2/7][dora] nss: workaround multilib build on 32bit host
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:20 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

-- Sent for YP compliance --

The nsinstall is a tool that only runs on host to install built files.
It was not included in native tools somehow, while building lib64-nss
on 32bit host, it will fail with errors:

1) On OpenSUSE 11.x 32bit:
* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled

Since host gcc doesn't configured to support '-m64' option.

2) On Ubuntu 13.x 32bit:
* gcc -o Linux3.4_ppc_glibc_PTH_64_OPT.OBJ/nsinstall.o -c -m64 ...
  nsinstall.c
  In file included from /usr/include/features.h:341:0,
                  from /usr/include/stdio.h:27,
                  from nsinstall.c:8:
  /usr/include/stdc-predef.h:30:26: fatal error: bits/predefs.h: \
  No such file or directory

The nsinstall was built first while nss starting to build, it doesn't
need any cross-compling or multilib build options. We could workaround
this by clean the ARCHFLAG and LDFLAGS from nsinstall's Makefile. But
the correct approach would be pulling the tool into the -native build
and then using the tool for the target build.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../nss/files/nss-fix-nsinstall-build.patch        | 35 ++++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-fix-nsinstall-build.patch

diff --git a/meta/recipes-support/nss/files/nss-fix-nsinstall-build.patch b/meta/recipes-support/nss/files/nss-fix-nsinstall-build.patch
new file mode 100644
index 0000000..866de07
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-fix-nsinstall-build.patch
@@ -0,0 +1,35 @@
+Fix nss multilib build on openSUSE 11.x 32bit
+
+While building lib64-nss on openSUSE 11.x 32bit, the nsinstall will
+fail with error:
+
+* nsinstall.c:1:0: sorry, unimplemented: 64-bit mode not compiled
+
+It caused by the '-m64' option which passed to host gcc.
+
+The nsinstall was built first while nss starting to build, it only runs
+on host to install built files, it doesn't need any cross-compling or
+multilib build options. Just clean the ARCHFLAG and LDFLAGS to fix this
+error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+===================================================
+diff --git a/nss/coreconf/nsinstall/Makefile b/nss/coreconf/nsinstall/Makefile
+index 1850bcb..5aee84f 100644
+--- a/nss/coreconf/nsinstall/Makefile
++++ b/nss/coreconf/nsinstall/Makefile
+@@ -18,6 +18,12 @@ INTERNAL_TOOLS  = 1
+ 
+ include $(DEPTH)/coreconf/config.mk
+ 
++# nsinstall is unfit for cross-compiling/multilib-build since it was
++# always run on local host to install built files. This change intends
++# to clean the '-m64' from ARCHFLAG and LDFLAGS.
++ARCHFLAG =
++LDFLAGS =
++
+ ifeq (,$(filter-out OS2 WIN%,$(OS_TARGET)))
+ PROGRAM		=
+ else
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 2b2b668..82d6bc5 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -20,6 +20,7 @@ SRC_URI = "\
 SRC_URI_append_class-target += "\
     file://nss.pc.in \
     file://signlibs.sh \
+    file://nss-fix-nsinstall-build.patch \
 "
 inherit siteinfo
 PR = "r0"
-- 
1.8.1.2.545.g2f19ada


