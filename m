Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66E976C655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:10:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN2AiHN010174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 18:10:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 18:10:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 10:16:30 +0800
Message-ID: <ca825909838f05544cf2c2e214a572144d22fd9c.1542939066.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1542939066.git.Qi.Chen@windriver.com>
References: <cover.1542939066.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/9] busybox: check CONFIG_DESKTOP before using 'od -t' in test case
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
X-List-Received-Date: Fri, 23 Nov 2018 02:10:43 -0000
Content-Type: text/plain

The '-t' option support for 'od' is enabled by CONFIG_DESKTOP.
So check it before using it in test cases.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.29.2.bb        |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch b/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
new file mode 100644
index 0000000..9b96eee
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch
@@ -0,0 +1,83 @@
+From b09db631e77c63ebe733c69b00108f043f1f1d85 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 21 Nov 2018 10:00:29 +0800
+Subject: [PATCH] testsuite: check CONFIG_DESKTOP before using 'od -t'
+
+The '-t' option for od is enabled by CONFIG_DESKTOP. So
+check this config before using 'od -t' in test cases.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2018-November/086895.html]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ testsuite/echo/echo-prints-dash        | 1 +
+ testsuite/echo/echo-prints-non-opts    | 1 +
+ testsuite/echo/echo-prints-slash-zero  | 2 +-
+ testsuite/echo/echo-prints-slash_00041 | 2 +-
+ testsuite/echo/echo-prints-slash_0041  | 2 +-
+ testsuite/echo/echo-prints-slash_041   | 2 +-
+ testsuite/echo/echo-prints-slash_41    | 2 +-
+ 7 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/testsuite/echo/echo-prints-dash b/testsuite/echo/echo-prints-dash
+index ddcdbad..f1f31a0 100644
+--- a/testsuite/echo/echo-prints-dash
++++ b/testsuite/echo/echo-prints-dash
+@@ -1 +1,2 @@
++# FEATURE: CONFIG_DESKTOP
+ test "`busybox echo - | od -t x1 | head -n 1`" = "0000000 2d 0a"
+diff --git a/testsuite/echo/echo-prints-non-opts b/testsuite/echo/echo-prints-non-opts
+index c7d1e20..4e642a1 100644
+--- a/testsuite/echo/echo-prints-non-opts
++++ b/testsuite/echo/echo-prints-non-opts
+@@ -1 +1,2 @@
++# FEATURE: CONFIG_DESKTOP
+ test "`busybox echo -neEZ | od -t x1 | head -n 1`" = "0000000 2d 6e 65 45 5a 0a"
+diff --git a/testsuite/echo/echo-prints-slash-zero b/testsuite/echo/echo-prints-slash-zero
+index d97ed8e..948f899 100644
+--- a/testsuite/echo/echo-prints-slash-zero
++++ b/testsuite/echo/echo-prints-slash-zero
+@@ -1,3 +1,3 @@
+-# FEATURE: CONFIG_FEATURE_FANCY_ECHO
++# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
+ 
+ test "`busybox echo -e -n 'msg\n\0' | od -t x1 | head -n 1`" = "0000000 6d 73 67 0a 00"
+diff --git a/testsuite/echo/echo-prints-slash_00041 b/testsuite/echo/echo-prints-slash_00041
+index 9cffabd..7ea217b 100644
+--- a/testsuite/echo/echo-prints-slash_00041
++++ b/testsuite/echo/echo-prints-slash_00041
+@@ -1,3 +1,3 @@
+-# FEATURE: CONFIG_FEATURE_FANCY_ECHO
++# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
+ 
+ test "`busybox echo -ne '\00041z' | od -t x1 | head -n 1`" = "0000000 04 31 7a"
+diff --git a/testsuite/echo/echo-prints-slash_0041 b/testsuite/echo/echo-prints-slash_0041
+index b07429d..941faca 100644
+--- a/testsuite/echo/echo-prints-slash_0041
++++ b/testsuite/echo/echo-prints-slash_0041
+@@ -1,3 +1,3 @@
+-# FEATURE: CONFIG_FEATURE_FANCY_ECHO
++# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
+ 
+ test "`busybox echo -ne '\0041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
+diff --git a/testsuite/echo/echo-prints-slash_041 b/testsuite/echo/echo-prints-slash_041
+index 1d70cec..60cbfca 100644
+--- a/testsuite/echo/echo-prints-slash_041
++++ b/testsuite/echo/echo-prints-slash_041
+@@ -1,3 +1,3 @@
+-# FEATURE: CONFIG_FEATURE_FANCY_ECHO
++# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
+ 
+ test "`busybox echo -ne '\041z' | od -t x1 | head -n 1`" = "0000000 21 7a"
+diff --git a/testsuite/echo/echo-prints-slash_41 b/testsuite/echo/echo-prints-slash_41
+index 6d8999b..afd7c36 100644
+--- a/testsuite/echo/echo-prints-slash_41
++++ b/testsuite/echo/echo-prints-slash_41
+@@ -1,3 +1,3 @@
+-# FEATURE: CONFIG_FEATURE_FANCY_ECHO
++# FEATURE: CONFIG_FEATURE_FANCY_ECHO CONFIG_DESKTOP
+ 
+ test "`busybox echo -ne '\41z' | od -t x1 | head -n 1`" = "0000000 21 7a"
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.29.2.bb b/meta/recipes-core/busybox/busybox_1.29.2.bb
index f38db2a..66049bd 100644
--- a/meta/recipes-core/busybox/busybox_1.29.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.29.2.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-check-uudecode-before-using-it.patch \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
+           file://0001-testsuite-check-CONFIG_DESKTOP-before-using-od-t.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


