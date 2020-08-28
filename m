Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.34227.1598579222171841873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 18:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07S1kDDH019412
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 27 Aug 2020 18:46:34 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 18:46:11 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] sysstat: fix installed-vs-shipped QA Issue in systemd
Date: Thu, 27 Aug 2020 18:46:10 -0700
Message-ID: <20200828014610.118949-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAAnfSTv6VvF9nZPojVWNHw5RfZgZj4aL=PWZ5zdbMGMfxJhKZw@mail.gmail.com>
References: <CAAnfSTv6VvF9nZPojVWNHw5RfZgZj4aL=PWZ5zdbMGMfxJhKZw@mail.gmail.com>
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

https://www.freedesktop.org/software/systemd/man/systemd-sleep.html
says the files should be dropped into /usr/lib/systemd/system-sleep
(that would be /lib/systemd/system-sleep in our configuration).  By
moving the files to another directory they'll be packaged but not
loaded by systemd.

Suggested-by Ross Burton <ross@burtonini.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 8fd87b943b..e5e134c038 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -62,6 +62,6 @@ pkg_postinst_${PN} () {
 	fi
 }
 
-FILES_${PN} += "${systemd_system_unitdir}"
+FILES_${PN} += "${systemd_system_unitdir} ${nonarch_base_libdir}/systemd"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.21.0

