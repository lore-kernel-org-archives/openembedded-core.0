Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.9694.1592190414730666212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2020 20:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: haiqing.bai@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05F36rAo021708
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2020 20:06:54 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Sun, 14 Jun 2020
 20:06:35 -0700
From: "haiqing" <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <haiqing.bai@windriver.com>
Subject: [OE-core][master][zeus][PATCH] libpam: Remove option 'obscure' from common-password
Date: Mon, 15 Jun 2020 11:05:57 +0800
Message-ID: <1592190358-171985-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain

libpam does not support 'obscure' checks to password,
there are the same checks in pam_cracklib module.
And this fix can remove the below error message while
updating password with 'passwd':
pam_unix(passwd:chauthtok):unrecognized option[obscure]

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-extended/pam/libpam/pam.d/common-password | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-password b/meta/recipes-extended/pam/libpam/pam.d/common-password
index 3896057328..52478dae77 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/common-password
+++ b/meta/recipes-extended/pam/libpam/pam.d/common-password
@@ -10,13 +10,10 @@
 # The "sha512" option enables salted SHA512 passwords.  Without this option,
 # the default is Unix crypt.  Prior releases used the option "md5".
 #
-# The "obscure" option replaces the old `OBSCURE_CHECKS_ENAB' option in
-# login.defs.
-#
 # See the pam_unix manpage for other options.
 
 # here are the per-package modules (the "Primary" block)
-password	[success=1 default=ignore]	pam_unix.so obscure sha512
+password	[success=1 default=ignore]	pam_unix.so sha512
 # here's the fallback if no module succeeds
 password	requisite			pam_deny.so
 # prime the stack with a positive return value if there isn't one already;
-- 
2.17.1

