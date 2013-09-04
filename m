Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED906BDAA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 06:56:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r846uiaR010079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 23:56:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 23:56:44 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:56:40 +0800
Message-ID: <c4888f2e74ac1e1a20ea6907d982f208a0bd556d.1378276893.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378276893.git.rongqing.li@windriver.com>
References: <cover.1378276893.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd-compat-units: do not create runlevel command
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
X-List-Received-Date: Wed, 04 Sep 2013 06:56:43 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

It seems strange that runlevel always returns 1, we should create
a runlevel link to systemctl if systemd is installed.

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


