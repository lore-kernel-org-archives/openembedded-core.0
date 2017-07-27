Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA07565D00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 04:19:02 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id y129so19262399pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 21:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k1bbvo1NHS46U+IgFga6M7mX20ctNi2Aq8Hf+V4uXRQ=;
	b=JGjjqSM8yUN3JPARCW4iVl/snlDST3q5dI6laQbqe2KNm7A+44GR+HCBgcsz7YufNO
	qN1ZVb8kA9K67IUd8vMob3xxKsgXVUM74OczKWIlg3gxDEgWDGsz6F8pCHneR7P7dMkf
	WdbthfaR1haOCf/cUjJw9fZGDBhOJYB1JtHTrPiX9t4vqw08/YMQ3/U7M3JwvaxQrMAD
	2/rqlnCMgcXt5lJ+zvUZ52TauVuhdILeaz7It/3MU0NvfK6TaATcNrRtOML3TTbbepQq
	Uc5ZLui0FdAHeQCMukaOPu2qEpiHWxnKWLCzVb702lUxNrxI89JDSSn0KVtt3kLWx90I
	d/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k1bbvo1NHS46U+IgFga6M7mX20ctNi2Aq8Hf+V4uXRQ=;
	b=Y716zRUZIAiP3v7TxDw8C1TUFXYp5UVcf3oHbJoAPb4ETom9iSCwtUuvvlifnuqvot
	CwqcHqW+V3g9EUpdTzrOC1YWoVjwFJeQyPfwFafVSNFPRZlJWHrnGO66iRyHaInIkHQv
	uepUud6RlZa8+0dWPiMo9Afcin8YLilDwVEXTBWvI/HXY8TA7R7eR0ILtS/ghkknAQoM
	NvDksQ4c/3mEPRuVWvUlDlQEMwTbLoN4mcwFc2OIMxGUkUJOYr5tKJq7nVXJWmDwyG1Z
	ymK7+/XKIdlVC1nQ4mo1zSsYGWNKkT1D+H/y3B7Z2MmRoJcyyt0cSezOwI9ExfNd4IN+
	2gPA==
X-Gm-Message-State: AIVw11032ISMXSs/oInOzJleo2HuTQ6kNgJ/cIV8eurux5F3Ilxiq7v5
	WNm2nw8mePuVNzNF
X-Received: by 10.98.64.92 with SMTP id n89mr2893589pfa.257.1501129143494;
	Wed, 26 Jul 2017 21:19:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3dd4])
	by smtp.gmail.com with ESMTPSA id
	f2sm30227024pgc.17.2017.07.26.21.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 21:19:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2017 21:18:51 -0700
Message-Id: <20170727041851.14407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] automake: Add missing libtool tag for cppasm language
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
X-List-Received-Date: Thu, 27 Jul 2017 04:19:02 -0000

This is highlighted when CC is passing flags like -fPIE
which are stripped by libtool when building shared libs
and replaced with -fPIC, this actually results in CC
not matching the CC computed from cmdline created for
compiling and as a result libtool heuristic to compute
tags auotmatically fails.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...utomake-Add-default-libtool_tag-to-cppasm.patch | 27 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.1.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch

diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch b/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch
new file mode 100644
index 0000000000..1221f13067
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch
@@ -0,0 +1,27 @@
+From 25a8ac30486798d23f516722d73eb622e6264f28 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jul 2017 11:19:56 -0700
+Subject: [PATCH] automake: Add default libtool_tag to cppasm.
+
+    * bin/automake.in (register_language): Define default libtool tag to be CC
+    since CPPASCOMPILE is using CC to call assembler
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ bin/automake.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: automake-1.15.1/bin/automake.in
+===================================================================
+--- automake-1.15.1.orig/bin/automake.in
++++ automake-1.15.1/bin/automake.in
+@@ -831,6 +831,7 @@ register_language ('name' => 'cppasm',
+ 		   'compiler' => 'CPPASCOMPILE',
+ 		   'compile_flag' => '-c',
+ 		   'output_flag' => '-o',
++		   'libtool_tag' => 'CC',
+ 		   'extensions' => ['.S', '.sx']);
+ 
+ # Fortran 77
diff --git a/meta/recipes-devtools/automake/automake_1.15.1.bb b/meta/recipes-devtools/automake/automake_1.15.1.bb
index 481234185e..4f9b616b66 100644
--- a/meta/recipes-devtools/automake/automake_1.15.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.1.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://python-libdir.patch \
             file://performance.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
+            file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
             "
 
 SRC_URI[md5sum] = "95df3f2d6eb8f81e70b8cb63a93c8853"
-- 
2.13.3


