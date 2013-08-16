Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id DD13C6B7EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:26:56 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7GHQg7Q007660; 
	Fri, 16 Aug 2013 12:26:56 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2013 22:27:43 +0500
Message-Id: <1376674064-14468-3-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376674064-14468-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 3/4] [v3] rpcbind: Add systemd support
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
X-List-Received-Date: Fri, 16 Aug 2013 17:26:57 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

- Remove dependency on meta-systemd

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf |    3 +++
 .../rpcbind/rpcbind/rpcbind.service                |   14 ++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |   15 ++++++++++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
new file mode 100644
index 0000000..2a4dfbc
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.conf
@@ -0,0 +1,3 @@
+# Optional arguments passed to rpcbind.
+#
+RPCBIND_OPTS=""
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
new file mode 100644
index 0000000..fa217b9
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=RPC Bind
+After=network.target
+Wants=rpcbind.target
+Before=rpcbind.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/rpcbind.conf
+ExecStart=/usr/sbin/rpcbind -w $RPCBIND_OPTS
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index be2897c..b65c7aa 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://fix_host_path.patch \
            file://obsolete_automake_macros.patch \
            ${UCLIBCPATCHES} \
+           file://rpcbind.conf \
+           file://rpcbind.service \
           "
 
 UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
@@ -27,7 +29,7 @@ SRC_URI[sha256sum] = "c92f263e0353887f16379d7708ef1fb4c7eedcf20448bc1e4838f59497
 
 PR = "r4"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
@@ -35,6 +37,11 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
 
+SYSTEMD_SERVICE_${PN} = "rpcbind.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+EXTRA_OECONF += " --enable-warmstarts "
+
 do_install_append () {
 	mv ${D}${bindir} ${D}${sbindir}
 
@@ -43,4 +50,10 @@ do_install_append () {
 		-e 's,/sbin/,${sbindir}/,g' \
 		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+
+	install -m 0755 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
+	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/rpcbind.service
+	sed -i 's,/etc/,${sysconfdir}/,g' ${D}${systemd_unitdir}/system/rpcbind.service
 }
-- 
1.7.9.5


