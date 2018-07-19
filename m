Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE0378A9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 58DA51840C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id P55tcUfK1mrZ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 33E2A185DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6F711E076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B91F71E07C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id AD224FA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6JIJnoM007510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:19:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6JIJnBR007509
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2018 20:19:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 20:19:39 +0200
Message-Id: <84bd4feaa4ea04e4d6a5efefac643fbfc81096eb.1532024250.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1532024250.git.pkj@axis.com>
References: <cover.1532024250.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/3] logrotate: Improve configurability of the installed systemd service files
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
X-List-Received-Date: Thu, 19 Jul 2018 18:20:10 -0000

This makes it possible to add extra options to the logrotate
application (via ${LOGROTATE_OPTIONS}), and it allows the Persistent
option in logrotate.timer to be configured via
${LOGROTATE_SYSTEMD_TIMER_PERSISTENT}.

It also changes the sed expressions to allow for
${LOGROTATE_SYSTEMD_TIMER_BASIS} to contain commas without having to
prefix them with backslahes, e.g.:
LOGROTATE_SYSTEMD_TIMER_BASIS = "*-*-* *:00,30:00"

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/logrotate/logrotate_3.14.0.bb | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.14.0.bb b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
index d48539f84f..ccc68ad3ac 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.14.0.bb
@@ -34,9 +34,9 @@ PACKAGECONFIG[acl] = ",,acl"
 PACKAGECONFIG[selinux] = ",,libselinux"
 
 CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
-		    ${sysconfdir}/logrotate.conf \
-		    ${sysconfdir}/logrotate.d/btmp \
-		    ${sysconfdir}/logrotate.d/wtmp"
+                    ${sysconfdir}/logrotate.conf \
+                    ${sysconfdir}/logrotate.d/btmp \
+                    ${sysconfdir}/logrotate.d/wtmp"
 
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
@@ -62,8 +62,11 @@ SYSTEMD_SERVICE_${PN} = "\
     ${BPN}.timer \
 "
 
+LOGROTATE_OPTIONS ?= ""
+
 LOGROTATE_SYSTEMD_TIMER_BASIS ?= "daily"
 LOGROTATE_SYSTEMD_TIMER_ACCURACY ?= "12h"
+LOGROTATE_SYSTEMD_TIMER_PERSISTENT ?= "true"
 
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
@@ -78,8 +81,15 @@ do_install(){
         install -d ${D}${systemd_system_unitdir}
         install -m 0644 ${S}/examples/logrotate.service ${D}${systemd_system_unitdir}/logrotate.service
         install -m 0644 ${S}/examples/logrotate.timer ${D}${systemd_system_unitdir}/logrotate.timer
-        sed -i -e 's,OnCalendar=.*$,OnCalendar=${LOGROTATE_SYSTEMD_TIMER_BASIS},g' ${D}${systemd_system_unitdir}/logrotate.timer
-        sed -i -e 's,AccuracySec=.*$,AccuracySec=${LOGROTATE_SYSTEMD_TIMER_ACCURACY},g' ${D}${systemd_system_unitdir}/logrotate.timer
+        [ -z "${LOGROTATE_OPTIONS}" ] ||
+            sed -ri \
+                -e 's|(ExecStart=.*/logrotate.*)$|\1 ${LOGROTATE_OPTIONS}|g' \
+                ${D}${systemd_system_unitdir}/logrotate.service
+        sed -ri \
+            -e 's|(OnCalendar=).*$|\1${LOGROTATE_SYSTEMD_TIMER_BASIS}|g' \
+            -e 's|(AccuracySec=).*$|\1${LOGROTATE_SYSTEMD_TIMER_ACCURACY}|g' \
+            -e 's|(Persistent=).*$|\1${LOGROTATE_SYSTEMD_TIMER_PERSISTENT}|g' \
+            ${D}${systemd_system_unitdir}/logrotate.timer
     fi
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-- 
2.12.0


