Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2506.1591323018240275584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 19:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05529vmD007677
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2020 19:10:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 4 Jun 2020 19:09:46 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] db: do not install db_verify if 'verify' is not enabled
Date: Fri, 5 Jun 2020 10:09:45 +0800
Message-ID: <20200605020945.7799-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

On target, when running `db_verify /var/lib/rpm/Packages', we get
the following error.

  db_verify: BDB0571 library build did not include support for database verification

This is because db_verify is installed but 'verify' PACKAGECONFIG is
not enabled. So fix it by not installing do_verify in such case.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 3a0923ae36..318efcb61d 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -109,6 +109,9 @@ do_install_append() {
 	fi
 
 	chown -R root:root ${D}
+	if ${@bb.utils.contains('PACKAGECONFIG', 'verify', 'false', 'true', d)}; then
+		rm -f ${D}${bindir}/db_verify
+	fi
 }
 
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.17.1

