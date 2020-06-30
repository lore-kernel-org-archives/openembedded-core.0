Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.12086.1593510724125758436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 02:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05U9q2Yv025528
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 02:52:03 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 02:51:44 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] modutils-initscripts: update postinst
Date: Tue, 30 Jun 2020 17:49:16 +0800
Message-ID: <20200630094916.1396344-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

in container image, it don't have init system,
install package modutils-initscripts will report error:

+ systemctl mask modutils.service
/var/tmp/rpm-tmp.DYK3Pm: line 8: systemctl: command not found
%post(modutils-initscripts-1.0-r7.3.cortexa72): waitpid(823) rc 823 status 7f00
warning: %post(modutils-initscripts-1.0-r7.3.cortexa72) scriptlet failed, exit status 127

fix by use same way as systemd.bbclass to decide if systemctl mask will run

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-kernel/modutils-initscripts/modutils-initscripts.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 0f3df5577b..881b7db92e 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -24,7 +24,7 @@ do_install () {
 
 PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if type systemctl >/dev/null 2>/dev/null; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
-- 
2.17.1

