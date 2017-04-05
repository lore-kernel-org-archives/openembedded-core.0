Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5E49577BC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 080FF2E467
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Eg+8tcqQo7qf
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 85FD62E465
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 652241E068
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A0081E04F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 4E1975E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:46:45 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v35DkjTB013112
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Apr 2017 15:46:45 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v35Dkjv9013107
	for openembedded-core@lists.openembedded.org;
	Wed, 5 Apr 2017 15:46:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:46:41 +0200
Message-Id: <20170405134642.12572-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170405134642.12572-1-pkj@axis.com>
References: <20170405134642.12572-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 2/3] base-files: profile: Do not assume that the tty command exists
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
X-List-Received-Date: Wed, 05 Apr 2017 13:46:50 -0000

This avoids the following error when logging in to a host that does
not have the tty command:

-sh: tty: not found

Reported-by: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile   | 6 +++---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 22dfb4f219..ceaf15f799 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -22,12 +22,12 @@ if [ -d /etc/profile.d ]; then
 	unset i
 fi
 
-if [ -x /usr/bin/resize ] && termpath="`tty`"; then
+if command -v resize >/dev/null && command -v tty >/dev/null; then
 	# Make sure we are on a serial console (i.e. the device used starts with
 	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
 	# tries do use ssh
-	case "$termpath" in
-		/dev/tty[A-z]*) resize >/dev/null
+	case $(tty) in
+		/dev/tty[A-z]*) resize >/dev/null;;
 	esac
 fi
 
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index f56969c52e..ca7bf06353 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -128,10 +128,6 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
-	if [ "/usr/bin" != "${bindir}" ]; then
-		sed -i "s,/usr/bin/resize,${bindir}/resize," ${D}${sysconfdir}/profile
-	fi
-
 	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
 }
 
-- 
2.12.0


