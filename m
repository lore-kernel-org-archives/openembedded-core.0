Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8302F71387
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:09:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8379E4F005192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Sep 2014 00:09:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Sep 2014 00:09:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 15:09:00 +0800
Message-ID: <82768c5d4661c6b968910284cc173e3eda02c48c.1409728004.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409728004.git.Qi.Chen@windriver.com>
References: <cover.1409728004.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/25] systemd: make runlevel work in non-runlevel targets
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
X-List-Received-Date: Wed, 03 Sep 2014 07:09:13 -0000
Content-Type: text/plain

Previously, after booting into the targets like multi-user.target or
graphical.target, the output of `runlevel' command is 'unknown'.

This is confusing for users. Normally, we would expect mutli-user.target
would have a `runlevel' output of 'N 3'.
This is the behaviour of Fedora20.

This patch installs symlinks for systemd-update-utmp-runlevel.service
in do_install task to fix the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index f88a9a9..28456dd 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -130,6 +130,18 @@ do_install() {
 
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
+
+	# Create symlinks for systemd-update-utmp-runlevel.service
+	install -d ${D}${systemd_unitdir}/system/graphical.target.wants
+	install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
+	install -d ${D}${systemd_unitdir}/system/poweroff.target.wants
+	install -d ${D}${systemd_unitdir}/system/reboot.target.wants
+	install -d ${D}${systemd_unitdir}/system/rescue.target.wants
+	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/graphical.target.wants/systemd-update-utmp-runlevel.service
+	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/multi-user.target.wants/systemd-update-utmp-runlevel.service
+	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/poweroff.target.wants/systemd-update-utmp-runlevel.service
+	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/reboot.target.wants/systemd-update-utmp-runlevel.service
+	ln -sf ../systemd-update-utmp-runlevel.service ${D}${systemd_unitdir}/system/rescue.target.wants/systemd-update-utmp-runlevel.service
 }
 
 do_install_ptest () {
-- 
1.9.1


