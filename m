Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.367.1592442996325655808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 18:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05I1GZ9X023305
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 18:16:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 17 Jun 2020 18:16:16 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] mime.bbclass: fix post install scriptlet error
Date: Thu, 18 Jun 2020 09:14:27 +0800
Message-ID: <20200618011427.1861691-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error during post uninstall:
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): execv(/bin/sh) pid 78
+ '[' 0 = 0 ']'
+ set -e
+ '[' x '!=' x ']'
+ echo 'Updating MIME database... this may take a while.'
Updating MIME database... this may take a while.
+ update-mime-database /usr/share/mime
Directory '/usr/share/mime/packages' does not exist!
%postun(shared-mime-info-data-2.0-r0.4.corei7_64): waitpid(78) rc 78 status 100
warning: %postun(shared-mime-info-data-2.0-r0.4.corei7_64) scriptlet failed, exit status 1

when run post uninstall scriptlet, /usr/share/mime/packages has been
removed during unintall, while update-mime-database will check xml under
/usr/share/mime/packages.

workaround by create this dir before update, then remove it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/mime.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..728fba1d94 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -24,7 +24,13 @@ if [ "x$D" != "x" ]; then
 		mimedir=${MIMEDIR}
 else
 	echo "Updating MIME database... this may take a while."
-	update-mime-database $D${MIMEDIR}
+       if [ ! -d $D${MIMEDIR}/packages ]; then
+               mkdir $D${MIMEDIR}/packages
+               update-mime-database $D${MIMEDIR}
+               rmdir $D${MIMEDIR}/packages
+       else
+               update-mime-database $D${MIMEDIR}
+       fi
 fi
 }
 
-- 
2.17.1

