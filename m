Return-Path: <limon.anibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "An?bal Lim?n" <limon.anibal@gmail.com>
Subject: [PATCH] rng-tools: Only install one set of init scripts
Date: Sat,  9 Jul 2022 15:13:07 -0500
Message-Id: <20220709201307.2194050-1-limon.anibal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: matthew@rzerosystems.com, aleksandar@rzerosystems.com, wangmy@fujitsu.com, richard.purdie@linuxfoundation.org, h@denx.de, alex.kanavin@gmail.com, =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>, =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal@rzerosystems.com>

From: Aníbal Limón <limon.anibal@gmail.com>

Check if systemd is enabled to install .service file only instead of
service and sysvinit files because it will to rngd service twice by
systemd compatibility.

One called rng-tools.service (sysv compat) and another rngd.service.

...
root@:~# ps  | grep rng
   23 root         0 SW   [hwrng]
13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
13117 root      2348 S    grep rng
29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
...

Signed-off-by: Aníbal Limón <anibal@rzerosystems.com>
---
 .../rng-tools/rng-tools_6.15.bb               | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index 0696351903..2e4c0a126b 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -17,7 +17,12 @@ SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
 S = "${WORKDIR}/git"
 
-inherit autotools update-rc.d systemd pkgconfig
+inherit autotools pkgconfig
+
+inherit ${@bb.utils.contains('VIRTUAL-RUNTIME_init_manager', 'systemd', 'systemd', 'update-rc.d', d)}
+SYSTEMD_SERVICE:${PN} = "rngd.service"
+INITSCRIPT_NAME = "rng-tools"
+INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
 EXTRA_OECONF = "--without-rtlsdr"
 
@@ -29,11 +34,6 @@ PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentrop
 PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
 
-INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
-
-SYSTEMD_SERVICE:${PN} = "rngd.service"
-
 CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
 
 # Refer autogen.sh in rng-tools
@@ -43,14 +43,21 @@ do_configure:prepend() {
 
 do_install:append() {
     install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
-    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    install -Dm 0644 ${WORKDIR}/rngd.service \
-                     ${D}${systemd_system_unitdir}/rngd.service
-    sed -i \
-        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-        -e 's,@SBINDIR@,${sbindir},g' \
-        ${D}${sysconfdir}/init.d/rng-tools \
-        ${D}${systemd_system_unitdir}/rngd.service
+
+    if [ "${VIRTUAL-RUNTIME_init_manager}" = "systemd" ]; then
+        install -Dm 0644 ${WORKDIR}/rngd.service \
+                         ${D}${systemd_system_unitdir}/rngd.service
+        sed -i \
+            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            -e 's,@SBINDIR@,${sbindir},g' \
+            ${D}${systemd_system_unitdir}/rngd.service
+    else
+        install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+        sed -i \
+            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            -e 's,@SBINDIR@,${sbindir},g' \
+            ${D}${sysconfdir}/init.d/rng-tools 
+    fi
 
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}" = "yes" ]; then
         sed -i \
-- 
2.36.1

