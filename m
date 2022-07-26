Return-Path: <limon.anibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "An?bal Lim?n" <limon.anibal@gmail.com>
Subject: [PATCHv2]] recipes-support: rng-tools change systemd service name
Date: Tue, 26 Jul 2022 14:33:22 -0500
Message-Id: <20220726193322.1569574-1-limon.anibal@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br, richard.purdie@linuxfoundation.org, =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>

From: Aníbal Limón <limon.anibal@gmail.com>

Change systemd service name from rngd -> rng-tools to avoid load twice
the service when sysvinit compatibility is enabled,

...
root@:~# ps  | grep rng
   23 root         0 SW   [hwrng]
13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
13117 root      2348 S    grep rng
29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
...

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 .../rng-tools/{rngd.service => rng-tools.service}    |  0
 meta/recipes-support/rng-tools/rng-tools_6.15.bb     | 12 ++++++------
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/rng-tools/rng-tools/{rngd.service => rng-tools.service} (100%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
similarity index 100%
rename from meta/recipes-support/rng-tools/rng-tools/rngd.service
rename to meta/recipes-support/rng-tools/rng-tools/rng-tools.service
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index 0696351903..efc08b5e0a 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -11,7 +11,7 @@ DEPENDS = "sysfsutils openssl"
 SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
-           file://rngd.service \
+           file://rng-tools.service \
            "
 SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
@@ -32,7 +32,7 @@ PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2
 INITSCRIPT_NAME = "rng-tools"
 INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
-SYSTEMD_SERVICE:${PN} = "rngd.service"
+SYSTEMD_SERVICE:${PN} = "rng-tools.service"
 
 CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
 
@@ -44,18 +44,18 @@ do_configure:prepend() {
 do_install:append() {
     install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
     install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
-    install -Dm 0644 ${WORKDIR}/rngd.service \
-                     ${D}${systemd_system_unitdir}/rngd.service
+    install -Dm 0644 ${WORKDIR}/rng-tools.service \
+                     ${D}${systemd_system_unitdir}/rng-tools.service
     sed -i \
         -e 's,@SYSCONFDIR@,${sysconfdir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
         ${D}${sysconfdir}/init.d/rng-tools \
-        ${D}${systemd_system_unitdir}/rngd.service
+        ${D}${systemd_system_unitdir}/rng-tools.service
 
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}" = "yes" ]; then
         sed -i \
             -e '/^IPAddressDeny=any/d' \
             -e '/^RestrictAddressFamilies=/ s/$/ AF_INET AF_INET6/' \
-            ${D}${systemd_system_unitdir}/rngd.service
+            ${D}${systemd_system_unitdir}/rng-tools.service
     fi
 }
-- 
2.36.1

