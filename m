Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tDJFbxLOe56+RLDoEvItdSPb9BTZqb6qaoycWqqB16LBMTUqI0z+nrIlRCAb4zTGfCgp3FE25o
 PEn23iK1n14A==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014102"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014102"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:10 -0700
IronPort-SDR: eZw5S3ezvE0zeWKecvnpM67sR9Hn8V+0JJGXI5mHyF4H7kiofAMct2ZjQ9j3lUe4MaTMJwaXu/
 rY75iYaBjcEA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260087"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:08 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/13] avahi: apply fix for CVE-2021-3468
Date: Tue, 22 Jun 2021 17:50:31 +0800
Message-Id: <e18f7db2c7159da2d82dc6557edead8bb40ac09f.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This patch isn't yet upstream but it has been submitted and other distros
are shipping it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea33a4a2df4600a55b268e9d57e7396c30f3d123)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/handle-hup.patch              | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/handle-hup.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index 23c0e8d823..a07cdbd03c 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
            file://99avahi-autoipd \
            file://initscript.patch \
            file://0001-Fix-opening-etc-resolv.conf-error.patch \
+           file://handle-hup.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/lathiat/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/handle-hup.patch b/meta/recipes-connectivity/avahi/files/handle-hup.patch
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
+Subject: [PATCH] Avoid infinite-loop in avahi-daemon by handling HUP event in
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
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984938
+---
+ avahi-daemon/simple-protocol.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-daemon/simple-protocol.c b/avahi-daemon/simple-protocol.c
+index 3e0ebb11..6c0274d6 100644
+--- a/avahi-daemon/simple-protocol.c
++++ b/avahi-daemon/simple-protocol.c
+@@ -424,6 +424,11 @@ static void client_work(AvahiWatch *watch, AVAHI_GCC_UNUSED int fd, AvahiWatchEv
+         }
+     }
+ 
++    if (events & AVAHI_WATCH_HUP) {
++        client_free(c);
++        return;
++    }
++
+     c->server->poll_api->watch_update(
+         watch,
+         (c->outbuf_length > 0 ? AVAHI_WATCH_OUT : 0) |
-- 
2.31.1

