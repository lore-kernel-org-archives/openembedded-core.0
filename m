Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.11569.1595300976619288025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 20:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06L39Y5N016358
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 20:09:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 20 Jul 2020 20:09:34 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gtk-immodules-cache.bbclass: fix post install scriptlet error
Date: Tue, 21 Jul 2020 11:06:03 +0800
Message-ID: <20200721030603.3206539-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

package libgtk-3.0 don't install dir /usr/lib/gtk-3.0/3.0.0/ by default.
when install package gtk-immodule-xim, it is possible met below error:

/var/tmp/rpm-tmp.tlfoeo: line 17: /usr/lib/gtk-3.0/3.0.0/immodules.cache: No such file or directory
warning: %post(gtk-immodule-xim-2.24.32-r0.0.cortexa72) scriptlet failed, exit status 1

fix by create the dir when try to write to /usr/lib/gtk-3.0/3.0.0/immodules.cache

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/gtk-immodules-cache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 9bb0af8b26..8e783fb493 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -22,6 +22,7 @@ else
         gtk-query-immodules-2.0 > ${libdir}/gtk-2.0/2.10.0/immodules.cache
     fi
     if [ ! -z `which gtk-query-immodules-3.0` ]; then
+        mkdir -p ${libdir}/gtk-3.0/3.0.0
         gtk-query-immodules-3.0 > ${libdir}/gtk-3.0/3.0.0/immodules.cache
     fi
 fi
-- 
2.17.1

