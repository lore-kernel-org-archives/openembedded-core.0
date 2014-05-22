Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (unknown [209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id CCACC6B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 18:27:58 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 19so3137933ykq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=fONYNQY3nRWctieDGHJXjhIDd+ihDmkwEyHwwZrHm3s=;
	b=IPMvZAduwZGJvBq3JysiTAydR8iCus09pVZQ/eJWtAqc74pg4BP+4IC89kPCwwHpUj
	NKkWLXvK4+osTb7cT90Ub4BIyfm4T9yiY/QHXtXVp7/gOKQ0BUtvqMhcvrkUx+cstng2
	wKNb67bzE6e+Z0R3re7+H0Nx7PQc3dcoKYJWQBcChBZr9I1uVdK08fiiR6/d6e37FbDN
	ipowEYB369IOR+V/0xsvThj5EidDgIMsG0Fb61tgd6snHrQX7o4RnRXode6WNWJqJ5eo
	thfqyH5+CL3iPojoviA10a6XWn7V9si4R7Ezrgn1JvB5xk11cmUTkGwzyYTSg4zHYELj
	PJAQ==
X-Received: by 10.236.20.19 with SMTP id o19mr66843122yho.41.1400783279388;
	Thu, 22 May 2014 11:27:59 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id q66sm815555yhj.44.2014.05.22.11.27.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 11:27:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id CD6DE1B13ADB7; Thu, 22 May 2014 15:27:54 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 15:27:49 -0300
Message-Id: <1400783274-7258-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0.rc2
In-Reply-To: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
References: <1400783274-7258-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [daisy-backport][PATCH 1/6] tcf-agent: add systemd support
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
X-List-Received-Date: Thu, 22 May 2014 18:28:01 -0000

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


