Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82625783DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:36:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9atfs008507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:37:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 Aug 2017 23:14:30 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 02:14:28 -0400
Message-ID: <549af7239f1b656a8966164a219699fbbe5d80a2.1503641622.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503641622.git.dengke.du@windriver.com>
References: <cover.1503641622.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rng-tools: add systemd service file
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
X-List-Received-Date: Fri, 25 Aug 2017 09:36:58 -0000
Content-Type: text/plain

Add systemd service file for rng-tools.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-support/rng-tools/rng-tools/rngd.service |  9 +++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb         | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
new file mode 100644
index 0000000..b94ad50
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Hardware RNG Entropy Gatherer Daemon
+
+[Service]
+ExecStart=@SBINDIR@/rngd -f -r /dev/urandom
+SuccessExitStatus=66
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index de6e5f9..4a66bed 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -8,7 +8,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
            file://underquote.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
            file://init \
-           file://default"
+           file://default \
+           file://rngd.service \
+"
 
 SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
 SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
@@ -20,7 +22,7 @@ python () {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 PACKAGECONFIG = "libgcrypt"
 PACKAGECONFIG_libc-musl = "libargp"
@@ -38,7 +40,15 @@ do_install_append() {
         install -d "${D}${sysconfdir}/default"
         install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
     fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
+    fi
 }
 
 INITSCRIPT_NAME = "rng-tools"
 INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
+
+SYSTEMD_SERVICE_${PN} = "rngd.service"
-- 
2.8.1


