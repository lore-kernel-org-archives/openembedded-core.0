Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BFF271A30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 09:35:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6E9Z2BG020092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Jul 2017 02:35:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Jul 2017 02:35:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 14 Jul 2017 05:34:59 -0400
Message-ID: <1500024899-6398-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [V2 PATCH] shadow.inc: remove pam.d/chpasswd and pam.d/newusers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jul 2017 09:35:02 -0000
Content-Type: text/plain

* Problem:
While pam is enabled:
...
DISTRO_FEATURES_append = " pam"
...

Fix below errors on target:
...
  root@qemux86:~# newusers
  newusers: PAM: Authentication failure
  root@qemux86:~# chpasswd
  chpasswd: PAM: Authentication failure
...

* Analysis:
The pam.d/chpasswd and pam.d/newusers were added since OE-Classic:
...
https://github.com/openembedded/openembedded.git
commit 4677a67913c5ec376eb016e6aac21f9a7ad5e9c4
Author: David-John Willis <John.Willis@Distant-earth.com>
Date:   Mon Nov 9 07:54:07 2009 +0000

    shadow: Add version 4.1.4.2 and checksum.
...

And they were debian similar, but debian works well.
Becuase debian built shadow with option `--disable-account-tools-setuid'
...
   * debian/patches/504_undef_USE_PAM.nolibpam,
     debian/patches/504_undef_USE_PAM.dpatch, debian/rules: Patches removed.
     Replaced by the --disable-account-tools-setuid configure option.
...
https://tracker.debian.org/media/packages/s/shadow/rules-1%3A4.2-3%2Bdeb8u1
(In debian, if built shadow without --disable-account-tools-setuid,
it has the same issue)

And OE removed --disable-account-tools-setuid later:
...
commit f6535ea12ab7f4d99adbe78919a7ed252175565f
Author: Kevin Tian <kevin.tian@intel.com>
Date:   Fri Aug 6 10:34:29 2010 +0800

    shadow: add new recipe 4.1.4.2

    (borrow from OpenEmbedded with below tweaks)

    Enhance login_defs_pam.sed according to shadow source, to ensuer we don't
    leave any unknown definitions in /etc/login.defs when pam is enabled

    no need for --disable-account-tools-setuid which is detected upon pam
    automatically, and no specific CFLAGS append
...

* Solution
Remove the pam config files and use the one provided by shadow.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/shadow/files/pam.d/chpasswd | 4 ----
 meta/recipes-extended/shadow/files/pam.d/newusers | 4 ----
 meta/recipes-extended/shadow/shadow.inc           | 2 --
 3 files changed, 10 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/pam.d/chpasswd
 delete mode 100644 meta/recipes-extended/shadow/files/pam.d/newusers

diff --git a/meta/recipes-extended/shadow/files/pam.d/chpasswd b/meta/recipes-extended/shadow/files/pam.d/chpasswd
deleted file mode 100644
index 9e3efa6..0000000
--- a/meta/recipes-extended/shadow/files/pam.d/chpasswd
+++ /dev/null
@@ -1,4 +0,0 @@
-# The PAM configuration file for the Shadow 'chpasswd' service
-#
-
-password   include      common-password
diff --git a/meta/recipes-extended/shadow/files/pam.d/newusers b/meta/recipes-extended/shadow/files/pam.d/newusers
deleted file mode 100644
index 4aa3dde..0000000
--- a/meta/recipes-extended/shadow/files/pam.d/newusers
+++ /dev/null
@@ -1,4 +0,0 @@
-# The PAM configuration file for the Shadow 'newusers' service
-#
-
-password   include      common-password
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5e6b0bd..1770216 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -40,10 +40,8 @@ SRC_URI[sha256sum] = "3b0893d1476766868cd88920f4f1231c4795652aa407569faff802bcda
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
-               file://pam.d/chpasswd \
                file://pam.d/chsh \
                file://pam.d/login \
-               file://pam.d/newusers \
                file://pam.d/passwd \
                file://pam.d/su"
 
-- 
2.8.1


