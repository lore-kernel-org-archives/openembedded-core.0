Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.16374.1592223336596082246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 32hR+fmPcBbexYwc0AYkoE5R4vq0dvzAYCoAIXs1PFeGz7Bvy2dexCp+EZXDtDFxJ+cr08KLsA
 0VHSLWAZzI3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 05:15:35 -0700
IronPort-SDR: 1WsGycN745CIP19mMKNl2sLIe8+xZ01dkTZoMf5g0FvEv5cqQc/sg6qiStRgjSUzdMf/TrQeQA
 QPoueid9Xvgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="476010643"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2020 05:15:34 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] dbus: fix CVE-2020-12049
Date: Mon, 15 Jun 2020 20:15:32 +0800
Message-Id: <1592223333-84769-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch | 78 ++++++++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.16.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch

diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch b/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
new file mode 100644
index 0000000..ac7a4b7
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
@@ -0,0 +1,78 @@
+From 872b085f12f56da25a2dbd9bd0b2dff31d5aea63 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 16 Apr 2020 14:45:11 +0100
+Subject: [PATCH] sysdeps-unix: On MSG_CTRUNC, close the fds we did receive
+
+MSG_CTRUNC indicates that we have received fewer fds that we should
+have done because the buffer was too small, but we were treating it
+as though it indicated that we received *no* fds. If we received any,
+we still have to make sure we close them, otherwise they will be leaked.
+
+On the system bus, if an attacker can induce us to leak fds in this
+way, that's a local denial of service via resource exhaustion.
+
+Reported-by: Kevin Backhouse, GitHub Security Lab
+Fixes: dbus#294
+Fixes: CVE-2020-12049
+Fixes: GHSL-2020-057
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/dbus/dbus/-/commit/872b085f12f56da25a2dbd9bd0b2dff31d5aea63]
+CVE: CVE-2020-12049
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ dbus/dbus-sysdeps-unix.c | 32 ++++++++++++++++++++------------
+ 1 file changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/dbus/dbus-sysdeps-unix.c b/dbus/dbus-sysdeps-unix.c
+index b5fc2466..b176dae1 100644
+--- a/dbus/dbus-sysdeps-unix.c
++++ b/dbus/dbus-sysdeps-unix.c
+@@ -435,18 +435,6 @@ _dbus_read_socket_with_unix_fds (DBusSocket        fd,
+       struct cmsghdr *cm;
+       dbus_bool_t found = FALSE;
+ 
+-      if (m.msg_flags & MSG_CTRUNC)
+-        {
+-          /* Hmm, apparently the control data was truncated. The bad
+-             thing is that we might have completely lost a couple of fds
+-             without chance to recover them. Hence let's treat this as a
+-             serious error. */
+-
+-          errno = ENOSPC;
+-          _dbus_string_set_length (buffer, start);
+-          return -1;
+-        }
+-
+       for (cm = CMSG_FIRSTHDR(&m); cm; cm = CMSG_NXTHDR(&m, cm))
+         if (cm->cmsg_level == SOL_SOCKET && cm->cmsg_type == SCM_RIGHTS)
+           {
+@@ -501,6 +489,26 @@ _dbus_read_socket_with_unix_fds (DBusSocket        fd,
+       if (!found)
+         *n_fds = 0;
+ 
++      if (m.msg_flags & MSG_CTRUNC)
++        {
++          unsigned int i;
++
++          /* Hmm, apparently the control data was truncated. The bad
++             thing is that we might have completely lost a couple of fds
++             without chance to recover them. Hence let's treat this as a
++             serious error. */
++
++          /* We still need to close whatever fds we *did* receive,
++           * otherwise they'll never get closed. (CVE-2020-12049) */
++          for (i = 0; i < *n_fds; i++)
++            close (fds[i]);
++
++          *n_fds = 0;
++          errno = ENOSPC;
++          _dbus_string_set_length (buffer, start);
++          return -1;
++        }
++
+       /* put length back (doesn't actually realloc) */
+       _dbus_string_set_length (buffer, start + bytes_read);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
index 82bb753..10d1b34 100644
--- a/meta/recipes-core/dbus/dbus_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://CVE-2020-12049.patch \
 "
 
 SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
-- 
2.7.4

