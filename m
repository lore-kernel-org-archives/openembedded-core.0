Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.5943.1589007703211796552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 00:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04971f6F027312
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 9 May 2020 00:01:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 9 May 2020 00:01:40 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] lib/oe/package_manager: update default rpm config %_prefer_color
Date: Sat, 9 May 2020 15:01:20 +0800
Message-ID: <20200509070121.57173-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200509070121.57173-1-changqing.li@windriver.com>
References: <20200509070121.57173-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

* %_prefer_color is used by rpm to determine which color's ELF file
is preferred to be installed.

Here are file colors:
0 is unknown or other
1 is Elf32
2 is Elf64
4 is MIPS64 n32 (this color is added by oe-core's patch)

if default value set to 7, all colors are preferred color, always
be last-in-wins.

For this scenario, when we have 64bits python3 installed first,
then install 32bits python3 later, 64bits python3 will be overwrited,
and sys.path will point to /usr/lib, not /usr/lib64, this may cause
some python3 modules not work. so fixed by remove setting of default
value 7, and use default value 2 of rpm

* other distro like fedora also use the default %_prefer_color 2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/lib/oe/package_manager.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index b0660411ea..c055d2b0f7 100644
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
2.24.1

