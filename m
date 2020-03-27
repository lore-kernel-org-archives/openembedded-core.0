Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7020.1585294407959349943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 00:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: zhe.he@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02R7XQZ7026192
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 00:33:26 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 00:33:13 -0700
From: "He Zhe" <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] runqemu: Change nfs to mount via TCP
Date: Fri, 27 Mar 2020 15:33:11 +0800
Message-ID: <1585294391-261174-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Since kernel commit b24ee6c64ca7 ("NFS: allow deprecation of NFS UDP protocol"),
NFS UDP has been disabled by default due to the potential data corruption caused
by fragmentation during high loads. So now we cannot boot up with nfs mode and
default kernel.

We'd better turn to use TCP accordingly.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6f24093d77..6a77e3db9a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -990,7 +990,7 @@ class BaseConfig(object):
             # Use '%s' since they are integers
             os.putenv(k, '%s' % v)
 
-        self.unfs_opts="nfsvers=3,port=%s,udp,mountport=%s" % (nfsd_port, mountd_port)
+        self.unfs_opts="nfsvers=3,port=%s,tcp,mountport=%s" % (nfsd_port, mountd_port)
 
         # Extract .tar.bz2 or .tar.bz if no nfs dir
         if not (self.rootfs and os.path.isdir(self.rootfs)):
-- 
2.24.1

