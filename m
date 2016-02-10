Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 927B6731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:33:15 +0000 (UTC)
Received: from comp_016_pc_buildenv.localdomain (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 4A6DB1AA3E7;
	Wed, 10 Feb 2016 13:33:15 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Christopher Larson <chris_larson@mentor.com>,
	Ross Burton <ross.burton@intel.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Randy MacLeod <randy.macleod@windriver.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Wed, 10 Feb 2016 13:32:55 +0100
Message-Id: <1455107576-8931-7-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455107576-8931-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 6/7] systemd: tighten timesyncd and journal-gateway user accounts
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
X-List-Received-Date: Wed, 10 Feb 2016 12:33:15 -0000

Make sure that systemd-timesync and systemd-journal-gateway are created
without dedicated home directories, home set to / and /bin/nologin as
shell. This makes us in sync with what systemd-sysusers sets when
adding users during startup.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
---
 meta/recipes-core/systemd/systemd_228.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 4788d8680329d4a43cf8c6749f89422419f20901..72c7e0db122cf8fca370c76801a80fd6c188f613 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -304,8 +304,8 @@ SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system systemd-journal-gateway;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
2.5.0


