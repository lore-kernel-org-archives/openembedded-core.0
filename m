Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OJrTaMajkTo20/OtdTlMlM3hrK7Ac4YBXYztCutMzYVMXJxp63DbXUnE22UDD2904uaIs8S883
 0SIKadyafiyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699730"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:06 -0700
IronPort-SDR: Wje+Lz7LTObLEDj4tOfPyeDXi52Uc2qWbwFsqDUFDoh64hAlh22gQkfJigy1biT7wKG2yOMdqm
 P4hboUToSHog==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245842"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 16/32] dbus: fix CVE-2020-12049
Date: Tue, 28 Jul 2020 16:51:17 +0800
Message-Id: <b5c66309b776b9228fc1d9dbfaec9ccc6f48f0e7.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: 3f69946c6159fa359bc5800ee72ef6151d9ecd36)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../dbus/dbus/CVE-2020-12049.patch            | 78 +++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.16.bb        |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch

diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch b/meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
new file mode 100644
index 0000000000..ac7a4b7a71
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
index cfdbec09d0..92508cbeb8 100644
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
2.25.4

