Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2064.1586399991008229271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 19:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0392crxU006406
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 8 Apr 2020 19:39:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 19:38:42 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <seebs@seebs.net>,
        <randy.macleod@windriver.com>
CC: <pavelmn@axis.com>
Subject: [pseudo][PATCH] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Date: Thu, 9 Apr 2020 10:38:41 +0800
Message-ID: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Pavel Modilaynen <pavelmn@axis.com>

Use close-on-exec (O_CLOEXEC) flag when open log file to
make sure its file descriptor is not leaked to parent
process on fork/exec.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 pseudo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index c867ed6..0ec527b 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -1594,7 +1594,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
 		}
 		free(filename);
 	}	
-	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
+	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
 	if (fd == -1) {
 		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
 	} else {
-- 
2.7.4

