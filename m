Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 960A7770C5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 16:58:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u36GwZr3011461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 09:58:35 -0700 (PDT)
Received: from obsrwr.corp.ad.wrs.com (128.224.124.191) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 6 Apr 2016 09:58:34 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 20:01:12 +0300
Message-ID: <1459962072-11756-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] STIG: The system default umask in /etc/login.defs must be 077
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
X-List-Received-Date: Wed, 06 Apr 2016 16:58:39 -0000
Content-Type: text/plain

The umask value influences the permissions assigned to files when they
are created. A misconfigured umask value could result in files with
excessive permissions that can be read and/or written to by unauthorized
users.

Also modify /etc/profile in base-files because the /etc/profile file
overloads the behavior of /etc/login.defs, so if we desire the
functionality provided by setting umask to 077 we should set it in
login.defs to adhere to STIG but also set it in /etc/profile to have the
intended functionality.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 meta/recipes-core/base-files/base-files/profile    |  2 +-
 ...stem-default-umask-in-etc-login.defs-to-0.patch | 29 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 53c2680..f48a3c0 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -32,5 +32,5 @@ fi
 
 export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
 
-umask 022
+umask 077
 
diff --git a/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch b/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch
new file mode 100644
index 0000000..c0d6ee7
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch
@@ -0,0 +1,29 @@
+From dd2295715fabd823f01656cef0393cedc5a4bc34 Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <alexandru.moise@windriver.com>
+Date: Wed, 6 Apr 2016 05:45:58 +0000
+Subject: [PATCH] STIG: set system default umask in /etc/login.defs to 077
+
+Conform to STIG standard:
+https://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2015-05-26/finding/V-38645
+
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+---
+ etc/login.defs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/login.defs b/etc/login.defs
+index 8dd7c44..e2a8a65 100644
+--- a/etc/login.defs
++++ b/etc/login.defs
+@@ -190,7 +190,7 @@ KILLCHAR	025
+ # 022 is the default value, but 027, or even 077, could be considered
+ # for increased privacy. There is no One True Answer here: each sysadmin
+ # must make up his/her mind.
+-UMASK		022
++UMASK		077
+ 
+ #
+ # Password aging controls:
+-- 
+2.5.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4313ffe..9337493 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-installation-failure-with-subids-disabled.patch \
            file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
+	   file://0001-STIG-set-system-default-umask-in-etc-login.defs-to-0.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.7.4


