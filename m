Return-Path: <niko.mauno@iki.fi>
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net
	[83.102.40.154])
	by mail.openembedded.org (Postfix) with ESMTP id EB5807F88B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 47AEE14BA4;
	Thu,  5 Dec 2019 22:07:49 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.653
X-Spam-Level: 
X-Spam-Status: No, score=0.653 tagged_above=-9999 required=6
	tests=[SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id 6xVV49oQ2F3G; Thu,  5 Dec 2019 22:07:48 +0200 (EET)
Received: from luumupuu2.dnainternet.net (luumupuu2.dnainternet.net
	[83.102.40.55])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id CC7B714B16;
	Thu,  5 Dec 2019 22:07:48 +0200 (EET)
Received: from localhost.localdomain (62-78-161-185.bb.dnainternet.fi
	[62.78.161.185])
	by luumupuu2.dnainternet.net (Postfix) with ESMTP id B0DA074;
	Thu,  5 Dec 2019 22:07:42 +0200 (EET)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 22:05:17 +0200
Message-Id: <20191205200518.82007-2-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191205200518.82007-1-niko.mauno@iki.fi>
References: <20191205200518.82007-1-niko.mauno@iki.fi>
MIME-Version: 1.0
Subject: [zeus][PATCH 2/3] iptables: Allow overriding rules file location
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
X-List-Received-Date: Thu, 05 Dec 2019 20:07:49 -0000
Content-Transfer-Encoding: 8bit

In some cases a distribution may want to install rules file into a
location other than /etc/iptables/ so introduce custom recipe-level
IPTABLES_RULES_DIR parameter which allows conveniently overriding
the rules directory location.

(From OE-Core rev: 64eeedcdc586c221e3684861ba85e8e4bc9c5dd1)

Signed-off-by: Niko Mauno <niko.mauno@iki.fi>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../iptables/iptables/iptables.service                |  4 ++--
 meta/recipes-extended/iptables/iptables_1.8.3.bb      | 11 ++++++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables/iptables.service b/meta/recipes-extended/iptables/iptables/iptables.service
index 041316e457..5a8aa3f298 100644
--- a/meta/recipes-extended/iptables/iptables/iptables.service
+++ b/meta/recipes-extended/iptables/iptables/iptables.service
@@ -5,8 +5,8 @@ Wants=network-pre.target
 
 [Service]
 Type=oneshot
-ExecStart=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
-ExecReload=@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
+ExecStart=@SBINDIR@/iptables-restore @RULESDIR@/iptables.rules
+ExecReload=@SBINDIR@/iptables-restore @RULESDIR@/iptables.rules
 RemainAfterExit=yes
 
 [Install]
diff --git a/meta/recipes-extended/iptables/iptables_1.8.3.bb b/meta/recipes-extended/iptables/iptables_1.8.3.bb
index 563c8ae354..73680207b4 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.3.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.3.bb
@@ -38,14 +38,19 @@ do_configure_prepend() {
     rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
 
+IPTABLES_RULES_DIR ?= "${sysconfdir}/${BPN}"
+
 do_install_append() {
-    install -d ${D}${sysconfdir}/iptables
-    install -m 0644 ${WORKDIR}/iptables.rules ${D}${sysconfdir}/iptables
+    install -d ${D}${IPTABLES_RULES_DIR}
+    install -m 0644 ${WORKDIR}/iptables.rules ${D}${IPTABLES_RULES_DIR}
 
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 ${WORKDIR}/iptables.service ${D}${systemd_system_unitdir}
 
-    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/iptables.service
+    sed -i \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -e 's,@RULESDIR@,${IPTABLES_RULES_DIR},g' \
+        ${D}${systemd_system_unitdir}/iptables.service
 }
 
 PACKAGES += "${PN}-modules"
-- 
2.20.1


