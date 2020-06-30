Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.11927.1593510832164128722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 02:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05U9rKgO013543
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 02:53:40 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 02:53:21 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] initscripts: update postinst
Date: Tue, 30 Jun 2020 17:50:53 +0800
Message-ID: <20200630095053.1396415-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

in container image, it don't have init system,
install package initscripts will report error:
systemctl: command not found

fix by use same way as systemd.bbclass to decide if systemctl
mask will run

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 4080c4a495..32c527799e 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -170,7 +170,7 @@ MASKED_SCRIPTS = " \
   urandom"
 
 pkg_postinst_${PN} () {
-	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	if type systemctl >/dev/null 2>/dev/null; then
 		if [ -n "$D" ]; then
 			OPTS="--root=$D"
 		fi
-- 
2.17.1

