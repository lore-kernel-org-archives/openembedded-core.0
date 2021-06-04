Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2830.1622771109982538549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 18:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1541j9Zs005478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 18:45:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 3 Jun 2021 18:45:09 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 3 Jun 2021 18:45:08 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysstat: make the service start automatically
Date: Fri, 4 Jun 2021 09:43:12 +0800
Message-ID: <20210604014312.31000-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Make sysstat start automatically during bootup.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index e5e134c038..f97b88d493 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -23,6 +23,10 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "sysstat.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
 do_configure_prepend() {
     export sa_lib_dir=${libexecdir}/sa
 }
-- 
2.17.1

