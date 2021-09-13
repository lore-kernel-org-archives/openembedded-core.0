Received: from vale.hankala.org (vale.hankala.org [164.138.26.161])
 by mx.groups.io with SMTP id smtpd.web11.29027.1631537885096916158
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 05:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: hankala.org, ip: 164.138.26.161, mailfrom: visa@hankala.org)
Received: 
	by vale.hankala.org (OpenSMTPD) with ESMTPS id 2d63eb65 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Sep 2021 12:58:00 +0000 (UTC)
Date: Mon, 13 Sep 2021 12:57:59 +0000
From: visa@hankala.org
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] iputils: Fix regression of arp table update
Message-ID: <20210913125043.vMiwhe9oqBTeeCKt@hankala.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Backport a fix from iputils 20210202 to make arp table updating
work again.

Fixes: 77c5792aa5e7 ("iputils: fix various arping regressions")
Signed-off-by: Visa Hankala <visa@hankala.org>
---
 ...ng-make-update-neighbours-work-again.patch | 79 +++++++++++++++++++
 .../iputils/iputils_s20190709.bb              |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch

diff --git a/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch b/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
new file mode 100644
index 0000000000..bf86115843
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
@@ -0,0 +1,79 @@
+From 86ed08936d49e2c81ef49dfbd02aca1c74d0c098 Mon Sep 17 00:00:00 2001
+From: lac-0073 <61903197+lac-0073@users.noreply.github.com>
+Date: Mon, 26 Oct 2020 09:45:42 +0800
+Subject: [PATCH] arpping: make update neighbours work again
+
+The arping is using inconsistent sender_ip_addr and target_ip_addr in
+messages.  This causes the client receiving the arp message not to update
+the arp table entries.
+
+The specific performance is as follows:
+
+There is a machine 2 with IP 10.20.30.3 configured on eth0:0 that is in the
+same IP subnet as eth0.  This IP was originally used on another machine 1,
+and th IP needs to be changed back to the machine 1.  When using the arping
+command to announce what ethernet address has IP 10.20.30.3, the arp table
+on machine 3 is not updated.
+
+Machine 3 original arp table:
+
+    10.20.30.3  machine 2 eth0:0    00:00:00:00:00:02
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Create interface eth0:0 on machine 1, and use the arping command to send arp
+packets.  Expected outcome on machine 3:
+
+    10.20.30.3  machine 1 eth0:0    00:00:00:00:00:01
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Actual results on machine 3:
+
+    10.20.30.3  machine 2 eth0:0    00:00:00:00:00:02
+    10.20.30.2  machine 2 eth0      00:00:00:00:00:02
+    10.20.30.1  machine 1 eth0      00:00:00:00:00:01
+
+Fixes: https://github.com/iputils/iputils/issues/298
+Fixes: 68f12fc4a0dbef4ae4c404da24040d22c5a14339
+Signed-off-by: Aichun Li <liaichun@huawei.com>
+Upstream-Status: Backport [https://github.com/iputils/iputils/commit/86ed08936d49e2c81ef49dfbd02aca1c74d0c098]
+Signed-off-by: Visa Hankala <visa@hankala.org>
+---
+ arping.c | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/arping.c b/arping.c
+index a002786..53fdbb4 100644
+--- a/arping.c
++++ b/arping.c
+@@ -968,7 +968,7 @@ int main(int argc, char **argv)
+ 		}
+ 		memset(&saddr, 0, sizeof(saddr));
+ 		saddr.sin_family = AF_INET;
+-		if (!ctl.unsolicited && (ctl.source || ctl.gsrc.s_addr)) {
++		if (ctl.source || ctl.gsrc.s_addr) {
+ 			saddr.sin_addr = ctl.gsrc;
+ 			if (bind(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
+ 				error(2, errno, "bind");
+@@ -979,12 +979,14 @@ int main(int argc, char **argv)
+ 			saddr.sin_port = htons(1025);
+ 			saddr.sin_addr = ctl.gdst;
+ 
+-			if (setsockopt(probe_fd, SOL_SOCKET, SO_DONTROUTE, (char *)&on, sizeof(on)) == -1)
+-				error(0, errno, _("WARNING: setsockopt(SO_DONTROUTE)"));
+-			if (connect(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
+-				error(2, errno, "connect");
+-			if (getsockname(probe_fd, (struct sockaddr *)&saddr, &alen) == -1)
+-				error(2, errno, "getsockname");
++			if (!ctl.unsolicited) {
++				if (setsockopt(probe_fd, SOL_SOCKET, SO_DONTROUTE, (char *)&on, sizeof(on)) == -1)
++					error(0, errno, _("WARNING: setsockopt(SO_DONTROUTE)"));
++				if (connect(probe_fd, (struct sockaddr *)&saddr, sizeof(saddr)) == -1)
++					error(2, errno, "connect");
++				if (getsockname(probe_fd, (struct sockaddr *)&saddr, &alen) == -1)
++					error(2, errno, "getsockname");
++			}
+ 			ctl.gsrc = saddr.sin_addr;
+ 		}
+ 		close(probe_fd);
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index d652bfcaad..b33b913817 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/iputils/iputils \
            file://0003-arping-Fix-comparison-of-different-signedness-warnin.patch \
            file://0004-arping-return-success-when-unsolicited-ARP-mode-dest.patch \
            file://0005-arping-use-additional-timerfd-to-control-when-timeou.patch \
+           file://0001-arping-make-update-neighbours-work-again.patch \
            "
 SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
 
