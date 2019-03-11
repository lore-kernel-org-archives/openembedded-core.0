Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 550057CE6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:31:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2B3VBw1021549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:31:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 10 Mar 2019 20:31:10 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2019 11:40:43 +0800
Message-ID: <9f6154d3cbe750f77022b4f769128e3b55f1fd3a.1552275615.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1552275615.git.Qi.Chen@windriver.com>
References: <cover.1552275615.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: backport one more patch to fix version.h parallel build failure
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
X-List-Received-Date: Mon, 11 Mar 2019 03:31:11 -0000
Content-Type: text/plain

We backported a patch to fix parallel build failure about version.h. But
that is not enough. We need one more patch to really fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...clare-version.h-as-dependency-for-systemd.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch
new file mode 100644
index 0000000..8874dff
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch
@@ -0,0 +1,32 @@
+From e14d724a932a255eec4d60b08e128519c33e88ee Mon Sep 17 00:00:00 2001
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Date: Mon, 25 Feb 2019 11:59:23 +0100
+Subject: [PATCH] meson: declare version.h as dependency for systemd
+
+This is a followup to #11815 and adds the last missing dependency.
+With this #11565 is hopefully really fixed.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 232f3e1..70148be 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1618,7 +1618,8 @@ executable('systemd',
+            include_directories : includes,
+            link_with : [libcore,
+                         libshared],
+-           dependencies : [threads,
++           dependencies : [versiondep,
++                           threads,
+                            librt,
+                            libseccomp,
+                            libselinux,
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 47492c9..76668b7 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
+           file://0001-meson-declare-version.h-as-dependency-for-systemd.patch \
            "
 
 # patches needed by musl
-- 
1.9.1


