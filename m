Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87FC76BAAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:02:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBS92BoJ010039
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 01:02:11 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 01:02:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 01:01:48 -0800
Message-ID: <9d76d528a82a49e0d524475c4a02c701b43eed3c.1545987662.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1545987662.git.liezhi.yang@windriver.com>
References: <cover.1545987662.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bluez5: Fix a race issue for tools
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
X-List-Received-Date: Fri, 28 Dec 2018 09:02:10 -0000
Content-Type: text/plain

Fixed:
cp ../bluez-5.50/tools/hid2hci.rules tools/97-hid2hci.rules
cp: cannot create regular file tools/97-hid2hci.rules: No such file or directory
make[1]: *** [tools/97-hid2hci.rules] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...01-Makefile.am-Fix-a-race-issue-for-tools.patch | 32 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7708e7c..6d62f52 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
     file://0001-test-gatt-Fix-hung-issue.patch \
+    file://0001-Makefile.am-Fix-a-race-issue-for-tools.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
new file mode 100644
index 0000000..3c227a8
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Makefile.am-Fix-a-race-issue-for-tools.patch
@@ -0,0 +1,32 @@
+From 048e1844092cb4b3afd23f16fc2cc70dd2e122b7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 24 Dec 2018 17:57:14 -0800
+Subject: [PATCH] Makefile.am: Fix a race issue for tools
+
+Fixed:
+cp ../bluez-5.50/tools/hid2hci.rules tools/97-hid2hci.rules
+cp: cannot create regular file tools/97-hid2hci.rules: No such file or directory
+make[1]: *** [tools/97-hid2hci.rules] Error 1
+
+Upstream-Status: Submitted[https://www.spinics.net/lists/linux-bluetooth/msg78361.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6d1ff11..35a01f2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -504,6 +504,7 @@ src/builtin.h: src/genbuiltin $(builtin_sources)
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
+ 
+ tools/%.rules:
++	[ -e tools ] || $(MKDIR_P) tools
+ 	$(AM_V_GEN)cp $(srcdir)/$(subst 97-,,$@) $@
+ 
+ $(lib_libbluetooth_la_OBJECTS): $(local_headers)
+-- 
+2.10.2
+
-- 
2.10.2


