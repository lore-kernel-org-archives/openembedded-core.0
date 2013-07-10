Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 90F3660592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 10:52:47 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6AAqhnI026620; 
	Wed, 10 Jul 2013 05:52:45 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 15:53:13 +0500
Message-Id: <1373453593-13957-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] rpcbind: Add systemd support
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
X-List-Received-Date: Wed, 10 Jul 2013 10:52:47 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Adds systemd support in rpcbind
- Install 'sysv' related files only if distro has this feature
- Set PR to 'r0'

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../rpcbind/rpcbind/rpcbind.service                |   13 ++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   26 ++++++++++++++------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
new file mode 100644
index 0000000..a028ace
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=RPC Bind
+After=network.target
+Wants=rpcbind.target
+Before=rpcbind.target
+
+[Service]
+Type=forking
+ExecStart=/usr/sbin/rpcbind
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index f4a0367..ab25edf 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://fix_host_path.patch \
            file://obsolete_automake_macros.patch \
            ${UCLIBCPATCHES} \
+           file://rpcbind.service \
           "
 
 UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
@@ -25,9 +26,9 @@ UCLIBCPATCHES ?= ""
 SRC_URI[md5sum] = "1a77ddb1aaea8099ab19c351eeb26316"
 SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497a00de3"
 
-PR = "r4"
+PR = "r0"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
@@ -35,12 +36,23 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
 
+SYSTEMD_SERVICE_${PN} = "rpcbind.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 do_install_append () {
     mv ${D}${bindir} ${D}${sbindir}
 
-    install -d ${D}${sysconfdir}/init.d
-    sed -e 's,/etc/,${sysconfdir}/,g' \
-        -e 's,/sbin/,${sbindir}/,g' \
-        ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
-    chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+    if ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        sed -e 's,/etc/,${sysconfdir}/,g' \
+            -e 's,/sbin/,${sbindir}/,g' \
+            ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
+        chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+    fi
+
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
+        sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/rpcbind.service
+    fi
 }
-- 
1.7.9.5


