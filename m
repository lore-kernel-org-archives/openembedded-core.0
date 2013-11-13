Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1BDB6D997
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:23:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6NBoi001354
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:11 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:09 +0800
Message-ID: <c8bcdcb0710cefe498d8943adccdfe4eda7055f5.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384323613.git.Qi.Chen@windriver.com>
References: <cover.1384323613.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 7/7] busybox: install ping6 into bindir by default
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Install `ping6' provided by busybox into /usr/bin to sync with the
iputils package.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox-install-ping6-to-usr-bin.patch         |   25 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |    1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
new file mode 100644
index 0000000..b99f47f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.21.1/busybox-install-ping6-to-usr-bin.patch
@@ -0,0 +1,25 @@
+Subject: [PATCH] busybox: install ping6 to /usr/bin by default
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/ping.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/ping.c b/networking/ping.c
+index 5e4771f..471c347 100644
+--- a/networking/ping.c
++++ b/networking/ping.c
+@@ -70,7 +70,7 @@
+ 
+ /* Needs socket(AF_INET, SOCK_RAW, IPPROTO_ICMP), therefore BB_SUID_MAYBE: */
+ //applet:IF_PING(APPLET(ping, BB_DIR_BIN, BB_SUID_MAYBE))
+-//applet:IF_PING6(APPLET(ping6, BB_DIR_BIN, BB_SUID_MAYBE))
++//applet:IF_PING6(APPLET(ping6, BB_DIR_USR_BIN, BB_SUID_MAYBE))
+ 
+ //kbuild:lib-$(CONFIG_PING)  += ping.o
+ //kbuild:lib-$(CONFIG_PING6) += ping.o
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index 8b91e63..35e2b69 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://busybox-list-suid-and-non-suid-app-configs.patch \
            file://busybox-sed-fix-sed-clusternewline-testcase.patch \
+           file://busybox-install-ping6-to-usr-bin.patch \
 "
 
 SRC_URI[tarball.md5sum] = "795394f83903b5eec6567d51eebb417e"
-- 
1.7.9.5


