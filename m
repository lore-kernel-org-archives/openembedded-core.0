Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.42149.1585533991235222493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 19:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02U26Txl018395
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 19:06:30 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 29 Mar 2020 19:06:29 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] Revert "ifupdown: create file interfaces if not exist"
Date: Mon, 30 Mar 2020 10:06:27 +0800
Message-ID: <20200330020627.5080-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This reverts commit 4e692daf66d2c9d51d418706e20f4527505dc0bd.

The patch did not take into consideration of read-only rootfs, causing
the following regression.

  ERROR "The following packages could not be configured offline and rootfs is read-only: ['100-ifupdown']"

The original patch was added to resolve problem running `ifup eth1' on
a systemd based rootfs. However, when using systemd, we do not use ifup
to manage our network interfaces.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index a8913e6e29..53cb971d33 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -48,13 +48,6 @@ do_install_ptest () {
     cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
 }
 
-pkg_postinst_ontarget_${PN} () {
-    if [ ! -f /etc/network/interfaces ]; then
-        mkdir -p /etc/network
-        touch /etc/network/interfaces
-    fi
-}
-
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "ifup ifdown"
 
-- 
2.17.1

