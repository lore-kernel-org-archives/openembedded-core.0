Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1596165DCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:06:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3O26TPn028433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:06:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 19:06:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:07:29 +0800
Message-ID: <1f5d422fd7507dc915b7d22275d6549fdb4ab095.1398305029.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398305029.git.Qi.Chen@windriver.com>
References: <cover.1398305029.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/4] tcf-agent: add systemd support
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
X-List-Received-Date: Thu, 24 Apr 2014 02:06:29 -0000
Content-Type: text/plain

Add systemd unit file tcf-agent.service.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../tcf-agent/tcf-agent/tcf-agent.service          |   10 ++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
new file mode 100644
index 0000000..5d7a586
--- /dev/null
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Target Communication Framework agent
+After=network.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/tcf-agent -d -L- -l0
+
+[Install]
+WantedBy=multi-user.target
\ No newline at end of file
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 1eb0021..616a6a7 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -12,6 +12,7 @@ PR = "r2"
 SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
            file://fix_ranlib.patch \
            file://tcf-agent.init \
+           file://tcf-agent.service \
           "
 
 DEPENDS = "util-linux openssl"
@@ -19,7 +20,9 @@ RDEPENDS_${PN} = "bash"
 
 S = "${WORKDIR}/git"
 
-inherit update-rc.d
+inherit update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "tcf-agent.service"
 
 INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."
@@ -44,5 +47,8 @@ do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/tcf-agent.init ${D}${sysconfdir}/init.d/tcf-agent
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/tcf-agent.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tcf-agent.service
 }
 
-- 
1.7.9.5


