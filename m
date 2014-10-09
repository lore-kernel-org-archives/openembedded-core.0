Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B5C89712FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 05:34:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s995Y3fX013151
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Oct 2014 22:34:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 8 Oct 2014 22:34:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 13:35:07 +0800
Message-ID: <501986bdf16acfbfa6917d42bfdfe5bda1698f24.1412832836.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412832836.git.Qi.Chen@windriver.com>
References: <cover.1412832836.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpcbind: make service socket activated
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
X-List-Received-Date: Thu, 09 Oct 2014 05:34:07 -0000
Content-Type: text/plain

Instead of setting 'Restart=always' in the service file, we should
make the service socket activated, just like what Fedora does.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 9 +++------
 meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket  | 8 ++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb        | 5 +++--
 3 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket

diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
index 33ee268..b3ae254 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
@@ -1,15 +1,12 @@
 [Unit]
-Description=RPC Bind
-After=network.target
-Wants=rpcbind.target
-Before=rpcbind.target
+Description=RPC Bind Service
+Requires=rpcbind.socket
 
 [Service]
 Type=forking
 EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
 ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
-Restart=always
 SuccessExitStatus=2
 
 [Install]
-WantedBy=multi-user.target
+Also=rpcbind.socket
diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket
new file mode 100644
index 0000000..d63c1d9
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=RPCbind Server Activation Socket
+
+[Socket]
+ListenStream=/var/run/rpcbind.sock
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
index 4a5562b..b732476 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            ${UCLIBCPATCHES} \
            file://rpcbind.conf \
+           file://rpcbind.socket \
            file://rpcbind.service \
           "
 
@@ -34,8 +35,7 @@ PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
 INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 12 2 3 4 5 . stop 60 0 1 6 ."
 
-SYSTEMD_SERVICE_${PN} = "rpcbind.service"
-SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "rpcbind.service rpcbind.socket"
 
 inherit useradd
 
@@ -56,6 +56,7 @@ do_install_append () {
 
 	install -m 0755 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}
 	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/rpcbind.socket ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
-- 
1.9.1


