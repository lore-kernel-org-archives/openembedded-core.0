Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id CA7106C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 11:29:16 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so287878eak.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=gHqHodrjsQ0JOJizylk81YxbdqVrm5nZ93WXrUGX8Zs=;
	b=S3e1m9PYe4hIp0VlWfyLyyCtv0zsITxyoY8alIlFLE8htt4+99PTPgas+ldb0hEyyg
	prXxyt+UkJDHEIXjCXRarMGfUuLsRwGXtDGe8098McsPGFbdZMbD+CQYafliCdvAgSNw
	RnovC+D+StO2pftoEOrwIcHNmReVGJvWhA1lz0pBSw7zhWUxh3qs8xp7A7iDz6YzFlPk
	M+cP3jkxr8bA+QiUhIz09Yxi9mdwTYcJgKiOXGj2gNP0fPm3fAjZ8DReguNeY+AUx3bx
	IojrkBq9TrYD7/YlD5P/+FUAgUAkh3/gmhTeWpSsJ/twkYwt8PPg5WabGunker+E+fbq
	jtog==
X-Received: by 10.15.61.137 with SMTP id i9mr3891027eex.50.1381922957883;
	Wed, 16 Oct 2013 04:29:17 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59]) by mx.google.com with ESMTPSA id
	z12sm178475827eev.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 16 Oct 2013 04:29:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 13:27:55 +0200
Message-Id: <1381922875-4261-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] systemd-compat-units: run-postinsts fix script link
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
X-List-Received-Date: Wed, 16 Oct 2013 11:29:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

in

commit fe039170236080291c0220476a5809774f82ee5c
Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Date:   Wed Oct 2 10:55:32 2013 +0000

    systemd-compat-units: Use correct run-postinsts script link

    OE-Core commit 75a14923da1ba91eddde47f0907345c19c82d6f0 has moved
    run-postinsts script execution from S98 to S99 in rcS.d. run-postinsts.service
    should check for this script and run it on first boot rather than
    S98run-postinsts, which is for opkg/dpkg.

the link was corrected but the mentioned commit is not available. Instead of
reverting, we use the same variable as opkg for init script ordering and drop
a note in case somebody wants to change default.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb                 | 8 +++++++-
 .../systemd/systemd-compat-units/run-postinsts.service            | 4 ++--
 meta/recipes-devtools/opkg/opkg.inc                               | 2 ++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index c47c14b..6eb5ffd 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,6 +14,8 @@ SRC_URI = "file://*.service"
 do_install() {
 	install -d ${D}${systemd_unitdir}/system/basic.target.wants
 	install -d ${D}${systemd_unitdir}/system/sysinit.target.wants/
+	sed -i -e 's,@POSTINSTALL_INITPOSITION@,${POSTINSTALL_INITPOSITION},g' \
+			${WORKDIR}/run-postinsts.service
 	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
@@ -53,4 +55,8 @@ pkg_postinst_${PN} () {
 FILES_${PN} = "${systemd_unitdir}/system ${bindir}"
 RDPEPENDS_${PN} = "systemd"
 
-
+# Define a variable to allow distros to run configure earlier.
+# (for example, to enable loading of ethernet kernel modules before networking starts)
+# note: modifying name or default value for POSTINSTALL_INITPOSITION requires
+# changes in opkg.inc
+POSTINSTALL_INITPOSITION ?= "98"
diff --git a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
index 4ebc234..35cf3d3 100644
--- a/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
+++ b/meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
@@ -1,12 +1,12 @@
 [Unit]
 Description=Run pending postinsts
 DefaultDependencies=no
-ConditionPathExists=|/etc/rcS.d/S99run-postinsts
+ConditionPathExists=|/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
 After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
 Before=sysinit.target
 
 [Service]
-ExecStart=/etc/rcS.d/S99run-postinsts
+ExecStart=/etc/rcS.d/S@POSTINSTALL_INITPOSITION@run-postinsts
 RemainAfterExit=No
 Type=oneshot
 StandardOutput=syslog
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 3d56886..78724f3 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -104,4 +104,6 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Define a variable to allow distros to run configure earlier.
 # (for example, to enable loading of ethernet kernel modules before networking starts)
+# note: modifying name or default value for POSTINSTALL_INITPOSITION requires
+# changes in systemd-compat-units.bb
 POSTINSTALL_INITPOSITION ?= "98"
-- 
1.8.3.1


