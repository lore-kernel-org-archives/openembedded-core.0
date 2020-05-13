Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2712.1589363390936626861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04D9noah003273
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 02:49:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 13 May 2020 02:49:49 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/6] systemd: respect VOLATILE_DIR
Date: Wed, 13 May 2020 17:48:46 +0800
Message-ID: <20200513094847.14326-6-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513094847.14326-1-changqing.li@windriver.com>
References: <20200513094847.14326-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

respect VOLATILE_DIR to support persistent /var/tmp too

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_245.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_245.5.bb b/meta/recipes-core/systemd/systemd_245.5.bb
index ece4220987..a2aed13f4a 100644
--- a/meta/recipes-core/systemd/systemd_245.5.bb
+++ b/meta/recipes-core/systemd/systemd_245.5.bb
@@ -230,7 +230,9 @@ do_install() {
 	install -d ${D}${sysconfdir}/tmpfiles.d
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
-- 
2.17.1

