Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2795.1592557988818437088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 02:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05J9D6CX004929
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 02:13:07 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Fri, 19 Jun 2020 02:13:06 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V3][PATCH] mime.bbclass: fix post install scriptlet error
Date: Fri, 19 Jun 2020 17:11:12 +0800
Message-ID: <20200619091112.3696178-1-changqing.li@windriver.com>
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
 meta/classes/mime.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index c9072adf3b..bb99bc35cb 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -24,7 +24,18 @@ if [ "x$D" != "x" ]; then
 		mimedir=${MIMEDIR}
 else
 	echo "Updating MIME database... this may take a while."
-	update-mime-database $D${MIMEDIR}
+	# $D${MIMEDIR}/packages belong to package shared-mime-info-data,
+	# packages like libfm-mime depend on shared-mime-info-data.
+	# after shared-mime-info-data uninstalled, $D${MIMEDIR}/packages
+	# is removed, but update-mime-database need this dir to update
+	# database, workaround to create one and remove it later
+	if [ ! -d $D${MIMEDIR}/packages ]; then
+		mkdir -p $D${MIMEDIR}/packages
+		update-mime-database $D${MIMEDIR}
+		rmdir --ignore-fail-on-non-empty $D${MIMEDIR}/packages
+	else
+		update-mime-database $D${MIMEDIR}
+fi
 fi
 }
 
-- 
2.17.1

