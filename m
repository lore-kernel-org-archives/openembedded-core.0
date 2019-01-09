Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B2CC17C06E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 07:20:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x097Kb9D021901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2019 23:20:37 -0800 (PST)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 23:20:36 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Jan 2019 15:19:38 +0800
Message-ID: <1547018383-19134-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
References: <1547018383-19134-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH 4/9] libcap: upgrade 2.25 -> 2.26
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
X-List-Received-Date: Wed, 09 Jan 2019 07:20:35 -0000
Content-Type: text/plain

Drop 0001-Fix-build-with-gperf-3.1.patch as it had been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../files/0001-Fix-build-with-gperf-3.1.patch      | 41 ----------------------
 .../libcap/{libcap_2.25.bb => libcap_2.26.bb}      |  5 ++-
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
 rename meta/recipes-support/libcap/{libcap_2.25.bb => libcap_2.26.bb} (90%)

diff --git a/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch b/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
deleted file mode 100644
index 110ef90..0000000
--- a/meta/recipes-support/libcap/files/0001-Fix-build-with-gperf-3.1.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From a05eba68c42222f02465d7ba376015926433c531 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Jul 2017 13:37:49 +0300
-Subject: [PATCH] Fix build with gperf 3.1
-
-The generated gperf file refers to size_t which needs to be
-provided by stddef.h include. Also, adjust the makefile
-to match the declaration in the gperf file.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- libcap/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index d189777..1a57206 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -22,7 +22,7 @@ all: $(MINLIBNAME) $(STALIBNAME) libcap.pc
- 
- ifeq ($(BUILD_GPERF),yes)
- USE_GPERF_OUTPUT = $(GPERF_OUTPUT)
--INCLUDE_GPERF_OUTPUT = -include $(GPERF_OUTPUT)
-+INCLUDE_GPERF_OUTPUT = -include stddef.h -include $(GPERF_OUTPUT)
- endif
- 
- libcap.pc: libcap.pc.in
-@@ -41,7 +41,7 @@ cap_names.h: _makenames
- 	./_makenames > cap_names.h
- 
- $(GPERF_OUTPUT): cap_names.list.h
--	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, unsigned int);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
-+	perl -e 'print "struct __cap_token_s { const char *name; int index; };\n%{\nconst struct __cap_token_s *__cap_lookup_name(const char *, register size_t);\n%}\n%%\n"; while ($$l = <>) { $$l =~ s/[\{\"]//g; $$l =~ s/\}.*// ; print $$l; }' < $< | gperf --ignore-case --language=ANSI-C --readonly --null-strings --global-table --hash-function-name=__cap_hash_name --lookup-function-name="__cap_lookup_name" -c -t -m20 $(INDENT) > $@
- 
- cap_names.list.h: Makefile $(KERNEL_HEADERS)/linux/capability.h
- 	@echo "=> making $@ from $(KERNEL_HEADERS)/linux/capability.h"
--- 
-2.13.2
-
diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.26.bb
similarity index 90%
rename from meta/recipes-support/libcap/libcap_2.25.bb
rename to meta/recipes-support/libcap/libcap_2.26.bb
index 6df6745..14841de 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.26.bb
@@ -9,10 +9,9 @@ DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
-           file://0001-Fix-build-with-gperf-3.1.patch \
            "
-SRC_URI[md5sum] = "6666b839e5d46c2ad33fc8aa2ceb5f77"
-SRC_URI[sha256sum] = "693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162"
+SRC_URI[md5sum] = "968ac4d42a1a71754313527be2ab5df3"
+SRC_URI[sha256sum] = "b630b7c484271b3ba867680d6a14b10a86cfa67247a14631b14c06731d5a458b"
 
 inherit lib_package
 
-- 
2.7.4


