Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.4795.1594242492001973882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=VhbjMLMr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjQ1S8Hz7s
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242490;
	bh=UcIfrQqxx1x+fkBpN90ccKc+Mpcmkr+a5wz2WcYZdwY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VhbjMLMr58YSkvIR9Da/CeBa6R4GohzrCEKmbYWEr4Ob/885HgEROHrU7saj8Phkv
	 JYiN9bmuyS2solVbRmIBpa/hc4SMmp8nq+A8UwS2ptClhtp+4DO9X32m5lF3cQIv4Q
	 t6WjlFaHN1q53UOmBP8Jgw++vE5oclivc5f+MRINXLlrM/0PfYVnhbtsJiyEgs9dZr
	 hCdL/winijmUK1bK0bLibsfmG974vQeSlsB+PIe76HzbFebgc+rmgA4mtBBv4rrCy0
	 /q0zMGFj2qgKo93y2bTASEzHWzQig7+1ewbFZTY22Wp6IMeeErNAGAHgGhuy+EJCOy
	 YHRsV4La1v7+dBzgBoaxvxDBBDUz48aB3xW03Hh7TBlK2zYp6/53+hhLWEWX5QTrg2
	 wVh9r+NzJcwkL/ENtCN5Q1je+abyw6m3RT8OrriPZu7KSzXKmTRTJ2HKYNAhbvOjAa
	 73xzH2N/jKouNPcodkXAvzv3GDUdD5nsRzv8VirFznWZYPHErK8zg8Vil1RSawQYut
	 mJ8wI0PXmFL1DaK1ObMhlNBbc7Db6ILlELw3jsju22njcZuVrSzUeQUbefjZlhod/B
	 zXdhZ70H1SGn4c5d6l+ZIqG+4z5Caw7hcNj2+qz/Lu1fxi6c1cFVSTkSxMrDrtwNdY
	 ooSnLaqzyc62rfITjHIg8aSk=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 17/19] dbus: fix CVE-2020-12049
Date: Thu,  9 Jul 2020 00:07:59 +0300
Message-Id: <20200708210801.5553-17-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: 3f69946c6159fa359bc5800ee72ef6151d9ecd36)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
2.17.1

