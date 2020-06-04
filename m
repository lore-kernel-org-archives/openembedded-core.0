Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6744.1591241392443839862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 20:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0543TUtJ026781
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jun 2020 20:29:41 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 3 Jun 2020 20:29:20 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cups.inc: remove template service from SYSTEMD_SERVICE
Date: Thu, 4 Jun 2020 11:28:12 +0800
Message-ID: <20200604032812.1402472-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

this template service need to triggered by org.cups.cups-lpd.socket,
which will assigned an instance id for org.cups.cups-lpd@.service,
like org.cups.cups-lpd@0.service. add this in SYSTEMD_SERVICE will
cause post scriptlet fail as:
Failed to start org.cups.cups-lpd@.service: Unit name org.cups.cups-lpd@.service is missing the instance name.
See system logs and 'systemctl status org.cups.cups-lpd@.service' for details.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e389d8a2da..1765944568 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -29,7 +29,7 @@ inherit autotools-brokensep binconfig useradd systemd pkgconfig multilib_script
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system lpadmin"
 
-SYSTEMD_SERVICE_${PN} = "org.cups.cupsd.socket org.cups.cupsd.path org.cups.cupsd.service org.cups.cups-lpd.socket org.cups.cups-lpd@.service"
+SYSTEMD_SERVICE_${PN} = "org.cups.cupsd.socket org.cups.cupsd.path org.cups.cupsd.service org.cups.cups-lpd.socket"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)}"
-- 
2.17.1

