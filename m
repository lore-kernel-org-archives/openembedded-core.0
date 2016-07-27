Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD356FFE8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:40:04 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 15:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="146562685"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.54])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 15:40:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:40:39 -0500
Message-Id: <1469659242-12350-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] busybox-syslog.default: When systemd is enabled don't use circular buffer
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
X-List-Received-Date: Wed, 27 Jul 2016 22:40:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Busybox syslog uses a shmmem circular buffer [1][2] when launch with -C option
when systemd (is enabled) takes the control of syslog messages and then forward
the messages to busybox syslog daemon, systemd journald don't usage of shmmem
circular buffer.

If -C is specified busybox-syslog never be able to read the forwarded
messages from systemd journald and don't wrote it to /var/log/messages.

This file is only installed when systemd is enabled [3].

[1] https://git.busybox.net/busybox/tree/sysklogd/syslogd.c?h=1_24_stable#n464
[2] https://git.busybox.net/busybox/tree/sysklogd/logread.c?h=1_24_stable#n82
[3] http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core/busybox/busybox.inc#n295

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-core/busybox/files/busybox-syslog.default | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/busybox-syslog.default b/meta/recipes-core/busybox/files/busybox-syslog.default
index e516caf..2dced80 100644
--- a/meta/recipes-core/busybox/files/busybox-syslog.default
+++ b/meta/recipes-core/busybox/files/busybox-syslog.default
@@ -1,4 +1,4 @@
-OPTIONS="-C"
+#OPTIONS="-C"
 # The above option means syslogd will log to 16K shm circular buffer.
 # You could use `logread' to read it.
 
-- 
2.1.4


