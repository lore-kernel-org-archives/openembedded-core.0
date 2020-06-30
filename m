Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.7464.1593486231249164376
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pLUNrMnH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id g67so8355131pgc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/foUniIDGcO1kEjqz6NFK9y5f2gH39OOM8ylSXOarQI=;
        b=pLUNrMnHFkf2W5EZ6GsPNN16ZD3/WGFxgfMpcuG/SHul7ULC6az/6OgCXT+foBNsIT
         88QYe7Ndjq6xaJC5C0AdmBAbB5FjgChRU2ER0rob/XOXgrlSkByD5u6EKSuINlANUf5K
         QNTjBp7QA0e8QApB7CXfAEtrEfVF6qLDcr3nafC+ZLRp3ZEM67DarlaSrMcOdlyQXAGV
         k8FFr4P05DAoI/U4JrVZqqoiqR8a68W9EoOXY83Uw7qLb7isZ5mL7EXcIF0PYcQk4KYX
         FAlNCQA8TSmaKFRX36ykd8aZk2EdaofAZFSsTrmSUNAJu5J9K3nXP9IHK1VYr0qRUZjO
         BrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/foUniIDGcO1kEjqz6NFK9y5f2gH39OOM8ylSXOarQI=;
        b=bgsKWV1NKR1jnXKqwgy6lcYuWCZnbsfFlZ+gt0FrnHXJ6V2ONOzwLpLMYMjrc/I65J
         rFzXIAUPBGusQR58bLzm19WaVop2ZVxv3gF8Zk6TcUdJYEOC87gGz4yLopCvifqnXszS
         /zpAJLptYDuNXL9FekbUKK7ei+tn0b2/BrOyLBf6R0cyN0MgWRxbpEQo0MEn89PNb9RA
         02igtrBv5juCTfg9k5hLf6GfZACP+Hq+Tgktwyh+LFrSPP6rxiQo3WxY8BrdcViVLmY0
         EyJN549zdQui7GuSNoyyRriKWUNo7JhY43obeRQyV4yQG4oaI5z07VCs6hGer2T2liu2
         QLag==
X-Gm-Message-State: AOAM531ZGmugfma8is0OhZTIOJjyoLetin77w0NAiNhov/GnP83qRRMO
	qN522DgzyQ7kBaukg7zKGm5HtE/2J2g1SA==
X-Google-Smtp-Source: ABdhPJyA8gocNlBnonI4wUHI46Bc6Rk44O6PKRoMpCEF8b34fqKxCqR3fOiSWuhrjj7p8+877LhtXQ==
X-Received: by 2002:a62:158d:: with SMTP id 135mr7492704pfv.254.1593486229903;
        Mon, 29 Jun 2020 20:03:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:03:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/22] dbus: fix CVE-2020-12049
Date: Mon, 29 Jun 2020 17:02:59 -1000
Message-Id: <3f69946c6159fa359bc5800ee72ef6151d9ecd36.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 82bb753731..10d1b34448 100644
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

