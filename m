Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.1220.1588219853965222588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 21:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 03U4Apa2008035
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 21:10:52 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Apr 2020 21:10:38 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lib/oe/package_manager: update default rpm config %_prefer_color
Date: Thu, 30 Apr 2020 12:10:37 +0800
Message-ID: <1588219837-337689-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* %_prefer_color is used by rpm to determine which color's ELF file
is preferred to be installed.

Here are file colors:
0 is unknown or other
1 is Elf32
2 is Elf64
3 is (contains) both

if default value set to 7, both 32 and 64 bits's ELF will be installed,
in this condition, when we have 64bits python3 installed first,
then install lib32-python3 later, 64bits python3 will be overwrited,

file /usr/bin/python3 will be 32bits ELF
and sys.path will point to /usr/lib, not /usr/lib64, this may cause
some python3 modules not work. so fixed by remove setting of default
value 7, and use default value 2 of rpm.

* other distro like fedora also use the default %_prefer_color 2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oe/package_manager.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b066041..c055d2b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -805,8 +805,6 @@ class RpmPM(PackageManager):
         open(platformconfdir + "macros", 'w').write("%_transaction_color 7\n")
         if self.d.getVar('RPM_PREFER_ELF_ARCH'):
             open(platformconfdir + "macros", 'a').write("%%_prefer_color %s" % (self.d.getVar('RPM_PREFER_ELF_ARCH')))
-        else:
-            open(platformconfdir + "macros", 'a').write("%_prefer_color 7")
 
         if self.d.getVar('RPM_SIGN_PACKAGES') == '1':
             signer = get_signer(self.d, self.d.getVar('RPM_GPG_BACKEND'))
-- 
2.7.4

