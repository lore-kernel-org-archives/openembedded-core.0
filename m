Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.39691.1597042670354665567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07A6vntv024273
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2020 23:57:49 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 9 Aug 2020 23:57:30 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] runqemu: fix permission check of /dev/vhost-net
Date: Mon, 10 Aug 2020 14:57:29 +0800
Message-ID: <20200810065729.35180-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

The code should check /dev/vhost-net instead of /dev/kvm. And
the permission check logically belongs to the part when kvm-vhost
is enabled. Also fix the URL to point to the correct wiki page.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f2168c18a3..c40acc4a86 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -585,10 +585,10 @@ class BaseConfig(object):
                 logger.error("For further help see:")
                 raise RunQemuError(yocto_paravirt_kvm_wiki)
 
-        if not os.access(dev_kvm, os.W_OK|os.R_OK):
+            if not os.access(dev_vhost, os.W_OK|os.R_OK):
                 logger.error("You have no read or write permission on /dev/vhost-net.")
                 logger.error("Please change the ownership of this file as described at:")
-                raise RunQemuError(yocto_kvm_wiki)
+                raise RunQemuError(yocto_paravirt_kvm_wiki)
 
     def check_fstype(self):
         """Check and setup FSTYPE"""
-- 
2.17.1

