Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.10049.1598494373520926611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 19:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07R2CpDY009757
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 19:12:52 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 26 Aug 2020
 19:12:51 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysstat: fix installed-vs-shipped QA Issue in systemd
Date: Wed, 26 Aug 2020 19:12:51 -0700
Message-ID: <20200827021251.14310-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While enabling systemd, there is QA issue:
...
|ERROR: sysstat-12.4.0-r0 do_package: QA Issue: sysstat: Files/directories
were installed but not shipped in any package:
|  /lib/systemd/system-sleep
|  /lib/systemd/system-sleep/sysstat.sleep
...

Set --with-systemdsleepdir to fix

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 8fd87b943b..f19be51872 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -19,7 +19,7 @@ inherit autotools-brokensep gettext systemd upstream-version-is-even
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir} --with-systemdsleepdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
-- 
2.21.0

