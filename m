Return-Path: <cengiz@kernel.wtf>
X-Greylist: delayed 1614 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Nov 2019 14:15:59 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8827B7D70B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 14:15:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 5A6B13B2CDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 13:39:47 +0000 (UTC)
X-Originating-IP: 84.44.14.226
Received: from nexussix.ar.arcelik (unknown [84.44.14.226])
	(Authenticated sender: cengiz@kernel.wtf)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4822EFF80F;
	Tue, 26 Nov 2019 13:39:45 +0000 (UTC)
From: Cengiz Can <cengiz@kernel.wtf>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 16:39:43 +0300
Message-Id: <20191126133943.124402-1-cengiz@kernel.wtf>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] systemd-conf: add timesyncd.conf
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
X-List-Received-Date: Tue, 26 Nov 2019 14:15:59 -0000
Content-Transfer-Encoding: 8bit

Currently OE-Core's systemd-timesyncd defaults to Google's time servers.

However those servers are not always reachable.

```
systemd-timesyncd[242]:
  Timed out waiting for reply from 216.239.35.12:123 (time4.google.com).
systemd-timesyncd[242]:
  Timed out waiting for reply from 216.239.35.0:123 (time1.google.com).
systemd-timesyncd[242]:
  Timed out waiting for reply from 216.239.35.4:123 (time2.google.com).
systemd-timesyncd[242]:
  Timed out waiting for reply from 216.239.35.8:123 (time3.google.com).
systemd-timesyncd[242]:
  Timed out waiting for reply from 216.239.35.12:123 (time4.google.com).
```

Even if they are, it is much more sensible to use pool servers from
ntp.org.

This patch adds a default timesyncd.conf with Google's time servers
moved to Fallback and pool.ntp.org as primary time servers.

Signed-off-by: Cengiz Can <cengiz@kernel.wtf>
---
 .../systemd/systemd-conf/timesyncd.conf         | 17 +++++++++++++++++
 meta/recipes-core/systemd/systemd-conf_243.bb   |  3 +++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/timesyncd.conf

diff --git a/meta/recipes-core/systemd/systemd-conf/timesyncd.conf b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
new file mode 100644
index 0000000000..84fdc354b8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-conf/timesyncd.conf
@@ -0,0 +1,17 @@
+#  This file is part of systemd.
+#
+#  systemd is free software; you can redistribute it and/or modify it
+#  under the terms of the GNU Lesser General Public License as published by
+#  the Free Software Foundation; either version 2.1 of the License, or
+#  (at your option) any later version.
+#
+# Entries in this file show the compile time defaults.
+# You can change settings by editing this file.
+# Defaults can be restored by simply deleting this file.
+#
+# See timesyncd.conf(5) for details.
+
+[Time]
+NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
+FallbackNTP=time1.google.com time2.google.com time3.google.com time4.google.com
+
diff --git a/meta/recipes-core/systemd/systemd-conf_243.bb b/meta/recipes-core/systemd/systemd-conf_243.bb
index d9ec023bfd..238bca9373 100644
--- a/meta/recipes-core/systemd/systemd-conf_243.bb
+++ b/meta/recipes-core/systemd/systemd-conf_243.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
     file://system.conf \
     file://system.conf-qemuall \
     file://wired.network \
+    file://timesyncd.conf \
 "
 
 do_install() {
@@ -18,6 +19,7 @@ do_install() {
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
+	install -D -m0644 ${WORKDIR}/timesyncd.conf ${D}${sysconfdir}/systemd/timesyncd.conf
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
@@ -35,4 +37,5 @@ FILES_${PN} = "\
     ${systemd_unitdir}/logind.conf.d/ \
     ${systemd_unitdir}/system.conf.d/ \
     ${systemd_unitdir}/network/ \
+    ${sysconfdir}/systemd/timesyncd.conf \
 "
-- 
2.24.0


