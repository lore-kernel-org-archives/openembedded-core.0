Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 450 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Dec 2017 10:35:43 UTC
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id F2C727814B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id 3DC384E479B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:28:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dey1y-sWqPjs; Wed,  6 Dec 2017 12:28:12 +0200 (IST)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-1.inango.com (Postfix) with ESMTPSA id E6435457A2A;
	Wed,  6 Dec 2017 11:28:11 +0100 (CET)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 15:28:15 +0500
Message-Id: <20171206102815.20287-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] sudo: provide sudo paths through EXTRA_OECONF
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
X-List-Received-Date: Wed, 06 Dec 2017 10:35:44 -0000

Configure script for a sudo utility trying to figure out "vardir",
"iologdir", "rundir" and "logpath" from directory structure on build
machine. If none of a standart paths present on a build machine then
variables will be set to empty string and sudo build will fail with
"Installed but not shipped" error.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 meta/recipes-extended/sudo/sudo_1.8.21p2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.21p2.bb b/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
index acd0025abc..7a50f1e522 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
@@ -17,6 +17,10 @@ EXTRA_OECONF += " \
              ac_cv_type_rsize_t=no \
              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
              ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-tmpfiles.d=${libdir}/tmpfiles.d', '--disable-tmpfiles.d', d)} \
+	     --with-vardir=/var/lib/sudo \
+	     --with-iologdir=/var/log/sudo-io \
+	     --with-rundir=/var/run/sudo \
+	     --with-logpath=/var/log/sudo.log \
              "
 
 do_install_append () {
-- 
2.14.1


