Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E56A7002B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:42:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u785gibj029107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 22:42:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 7 Aug 2016 22:42:42 -0700
From: Mingli Yu <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2016 13:42:24 +0800
Message-ID: <1470634944-24686-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] tmpfiles.d: don't create the symbol link
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
X-List-Received-Date: Mon, 08 Aug 2016 05:42:44 -0000
Content-Type: text/plain

Don't create symbol link for existing file
/etc/os-release and /etc/localtime exist in our
system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf
L /etc/os-release - - - - ../usr/lib/os-release
L /etc/localtime - - - - ../usr/share/zoneinfo/UTC

* The os-release is shipped by base-files in other distributions.
  Recently, the base-files changed the os-release directory from
  /etc/os-release to /usr/lib/os-release, which causes systemd boot
  up failed, so a fix was added into systemd is

  ln -s /usr/lib/os-release /etc/os-release

  However, the os-release file shipped by os-release in Yocto project.
  The location is still /etc/os-release, so systemd doesn't
  need to create the symbol link.

* /etc/localtime file shipped by tzdata-2016e in Yocto project, so
  no need to create symbol link as:
  ln -s /usr/share/zoneinfo/UTC /etc/localtime

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...1-tmpfiles.d-don-t-create-the-symbol-link.patch | 51 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbol-link.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbol-link.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbol-link.patch
new file mode 100644
index 0000000..72cd9f8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbol-link.patch
@@ -0,0 +1,51 @@
+From 6f7977d79fd464f8615d68476583f4b1732865b1 Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Wed, 27 Jul 2016 05:20:24 +0000
+Subject: [PATCH] tmpfiles.d: don't create the symbol link
+
+Don't create symbol link for existing file
+/etc/os-release and /etc/localtime exist in our
+system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf
+L /etc/os-release - - - - ../usr/lib/os-release
+L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
+
+* The os-release is shipped by base-files in other distributions.
+  Recently, the base-files changed the os-release directory from
+  /etc/os-release to /usr/lib/os-release, which causes systemd boot
+  up failed, so a fix was added into systemd is
+
+  ln -s /usr/lib/os-release /etc/os-release
+
+  However, the os-release file shipped by os-release in Yocto project.
+  The location is still /etc/os-release, so systemd doesn't need
+  to create the symbol link.
+
+* /etc/localtime file shipped by tzdata-2016e in Yocto project, so
+  no need to create symbol link as:
+  ln -s /usr/share/zoneinfo/UTC /etc/localtime
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tmpfiles.d/etc.conf.m4 | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tmpfiles.d/etc.conf.m4 b/tmpfiles.d/etc.conf.m4
+index ef7b9b9..5691a07 100644
+--- a/tmpfiles.d/etc.conf.m4
++++ b/tmpfiles.d/etc.conf.m4
+@@ -7,8 +7,6 @@
+ 
+ # See tmpfiles.d(5) for details
+ 
+-L /etc/os-release - - - - ../usr/lib/os-release
+-L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
+ L+ /etc/mtab - - - - ../proc/self/mounts
+ m4_ifdef(`HAVE_SMACK_RUN_LABEL',
+ t /etc/mtab - - - - security.SMACK64=_
+-- 
+2.8.2
+
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index 374a197..55af780 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -36,6 +36,7 @@ SRC_URI += " \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
+           file://0001-tmpfiles.d-don-t-create-the-symbol-link.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.8.1


