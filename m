Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.28094.1623668082846343581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 03:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E723A6D
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 03:54:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90D413F694
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 03:54:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] avahi: apply fix for CVE-2021-3468
Date: Mon, 14 Jun 2021 11:54:36 +0100
Message-Id: <20210614105437.3035507-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch isn't yet upstream but it has been submitted and other distros
are shipping it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/handle-hup.patch              | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patc=
h

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
index 5c46bbf58e..4302310888 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://github.com/lathiat/avahi/releases/=
download/v${PV}/avahi-${PV}
            file://99avahi-autoipd \
            file://initscript.patch \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
+           file://handle-hup.patch \
            "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/handle-hup.patch b/met=
a/recipes-connectivity/avahi/files/handle-hup.patch
new file mode 100644
index 0000000000..26632e5443
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/handle-hup.patch
@@ -0,0 +1,41 @@
+CVE: CVE-2021-3468
+Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/330]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 447affe29991ee99c6b9732fc5f2c1048a611d3b Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <sirmy15@gmail.com>
+Date: Fri, 26 Mar 2021 11:50:24 +0100
+Subject: [PATCH] Avoid infinite-loop in avahi-daemon by handling HUP eve=
nt in
+ client_work
+
+If a client fills the input buffer, client_work() disables the
+AVAHI_WATCH_IN event, thus preventing the function from executing the
+`read` syscall the next times it is called. However, if the client then
+terminates the connection, the socket file descriptor receives a HUP
+event, which is not handled, thus the kernel keeps marking the HUP event
+as occurring. While iterating over the file descriptors that triggered
+an event, the client file descriptor will keep having the HUP event and
+the client_work() function is always called with AVAHI_WATCH_HUP but
+without nothing being done, thus entering an infinite loop.
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D984938
+---
+ avahi-daemon/simple-protocol.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-daemon/simple-protocol.c b/avahi-daemon/simple-protoc=
ol.c
+index 3e0ebb11..6c0274d6 100644
+--- a/avahi-daemon/simple-protocol.c
++++ b/avahi-daemon/simple-protocol.c
+@@ -424,6 +424,11 @@ static void client_work(AvahiWatch *watch, AVAHI_GC=
C_UNUSED int fd, AvahiWatchEv
+         }
+     }
+=20
++    if (events & AVAHI_WATCH_HUP) {
++        client_free(c);
++        return;
++    }
++
+     c->server->poll_api->watch_update(
+         watch,
+         (c->outbuf_length > 0 ? AVAHI_WATCH_OUT : 0) |
--=20
2.25.1

