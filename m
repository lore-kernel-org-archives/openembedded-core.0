Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 977E47002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 08:16:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5N8GPL2018694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 01:16:28 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 23 Jun 2016 01:16:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jun 2016 16:16:28 +0800
Message-ID: <3d5d7cc1d96241bcfbddcea22b111cf4ed209b68.1466669684.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466669684.git.Qi.Chen@windriver.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] dbus/dbus-test: upgrade to 1.10.8
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
X-List-Received-Date: Thu, 23 Jun 2016 08:16:29 -0000
Content-Type: text/plain

0001-configure.ac-support-large-file-for-stat64.patch is removed as it's
a backported patch and is already in the latest codes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb}   |  4 +-
 ...onfigure.ac-support-large-file-for-stat64.patch | 53 ----------------------
 .../dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb}        |  5 +-
 3 files changed, 4 insertions(+), 58 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.10.6.bb => dbus-test_1.10.8.bb} (93%)
 delete mode 100644 meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
 rename meta/recipes-core/dbus/{dbus_1.10.6.bb => dbus_1.10.8.bb} (96%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.6.bb b/meta/recipes-core/dbus/dbus-test_1.10.8.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.10.6.bb
rename to meta/recipes-core/dbus/dbus-test_1.10.8.bb
index af99976..87dcd37 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.6.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.8.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "26d0cf3a1c9782cb0e342101f0450440"
-SRC_URI[sha256sum] = "b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f"
+SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
+SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
diff --git a/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch b/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
deleted file mode 100644
index c6eac2b..0000000
--- a/meta/recipes-core/dbus/dbus/0001-configure.ac-support-large-file-for-stat64.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e18bd3a571be716d90bedc835a014472470ae7bd Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 30 Dec 2015 10:58:39 +0800
-Subject: [PATCH] configure.ac: support large-file for stat64
-
-While starting dbus-daemon on a 32-bit linux host and it invokes
-fstat to load /etc/dbus-1/system.conf through NFS. If system.conf
-was created with a large indoe number on 64-bit host. The above
-fstat invoking failed. Here is the log of strace:
-............
-$ ls -i /etc/dbus-1/system.conf
-53778558109 /etc/dbus-1/system.conf
-
-$ strace /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
-|open("/etc/dbus-1/system.conf", O_RDONLY) = 4
-|fstat64(4, {st_mode=S_IFREG|0644, st_size=3340, ...}) = 0
-|close(4) = 0
-|close(3) = 0
-|write(2, "Failed to start message bus: Fai"..., 109Failed to start message bus:
-Failed to stat "/etc/dbus-1/system.conf": Value too large for defined data type
-|) = 109
-|exit_group(1) = ?
-|+++ exited with 1 +++
-............
-
-In this situation, we should support large-file for stat64. Add marco
-AC_SYS_LARGEFILE to do the detection at configure time. It can be disabled
-by configuring with the `--disable-largefile' option.
-
-Upstream-Status: Backport
-
-Bug: https://bugs.freedesktop.org/show_bug.cgi?id=93545
-https://bugs.freedesktop.org/attachment.cgi?id=120747
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index 82806ba..cb5a60b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,6 +64,7 @@ AC_SUBST(DBUS_VERSION)
- AC_PROG_CC
- AM_PROG_CC_C_O
- AC_PROG_CXX
- AC_USE_SYSTEM_EXTENSIONS
-+AC_SYS_LARGEFILE
- AC_ISC_POSIX
- AC_HEADER_STDC
--- 
-1.9.1
-
diff --git a/meta/recipes-core/dbus/dbus_1.10.6.bb b/meta/recipes-core/dbus/dbus_1.10.8.bb
similarity index 96%
rename from meta/recipes-core/dbus/dbus_1.10.6.bb
rename to meta/recipes-core/dbus/dbus_1.10.8.bb
index 245798a..bfaf65a 100644
--- a/meta/recipes-core/dbus/dbus_1.10.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.8.bb
@@ -17,11 +17,10 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
-           file://0001-configure.ac-support-large-file-for-stat64.patch \
 "
 
-SRC_URI[md5sum] = "26d0cf3a1c9782cb0e342101f0450440"
-SRC_URI[sha256sum] = "b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f"
+SRC_URI[md5sum] = "e912e930f249454752512aa7ac864d43"
+SRC_URI[sha256sum] = "baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014"
 
 inherit useradd autotools pkgconfig gettext update-rc.d upstream-version-is-even
 
-- 
1.9.1


