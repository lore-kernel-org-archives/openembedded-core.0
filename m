Return-Path: <otavio.salvador@gmail.com>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 20:38:10 UTC
Received: from mail-yk0-f173.google.com (unknown [209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A202765DBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 20:38:10 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so97478ykq.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:organization;
	bh=fONYNQY3nRWctieDGHJXjhIDd+ihDmkwEyHwwZrHm3s=;
	b=EoiU+R9I7kReElli7HVROnpCtkNNDpxHAsYuE3vc6Aj7kh9HEtZEISiUJnonHZAw0H
	A4Ceyyj2e/pheUckdNVp1U3MmX0qD1VEyuSqyAbJMpoyQCuR+dXQ4utPD+aIbKY9vI4u
	84DHq8rDbDbuXLs0som0NuB0OgPeL2qppUHQXVoI4Txx3geWoWlkFz/rw0ifXENP3eE5
	qlxOZvsPX3jSrsHMJuLT3mnVoAk6fQ2/7br145TtXAmghAJTvOEbX+jqIZJ+FZUTI3r2
	qkLj3w5+TJlfIp1T/1W7nr+Z3b46AXHjzbNNiBVg1XmRj0jg+1Is8xsp3OXqFXyrzB87
	s9Qw==
X-Received: by 10.236.87.139 with SMTP id y11mr8641179yhe.27.1400099439567;
	Wed, 14 May 2014 13:30:39 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id r27sm4132709yhk.17.2014.05.14.13.30.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 May 2014 13:30:38 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 1B6401ACE5DA0; Wed, 14 May 2014 17:30:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 17:30:31 -0300
Message-Id: <1400099434-22527-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
Organization: O.S. Systems Software LTDA.
Subject: [daisy][PATCH 1/4] tcf-agent: add systemd support
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
X-List-Received-Date: Wed, 14 May 2014 20:38:15 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd unit file tcf-agent.service.

(From OE-Core rev: 1a4feebf98780f586bf2e81cf9844e6805a50799)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service | 10 ++++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb            |  8 +++++++-
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
2.0.0.rc2


