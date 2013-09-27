Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4B84E6CA7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 05:52:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8R5qTPL017938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 22:52:29 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 26 Sep 2013 22:52:28 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2013 13:52:27 +0800
Message-ID: <1380261147-21348-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] systemd-compat-units: do not create runlevel command
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
X-List-Received-Date: Fri, 27 Sep 2013 05:52:28 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

It seems strange that runlevel always returns 1, The comment says it is
related to sysvinit, but if we enable systemd, sysvinit will not be
installed. and we have created a link for runlevel to systemctl if 
systemd is installed.
 
Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 9b4a8a4..c47c14b 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -21,11 +21,6 @@ do_install() {
 	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/system
 	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
 	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.wants/
-
-	# hack to make old style sysvinit postinsts succeed
-	install -d ${D}${bindir}
-	echo "echo 1" > ${D}${bindir}/runlevel
-	chmod 0755 ${D}${bindir}/runlevel
 }
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
-- 
1.7.10.4


