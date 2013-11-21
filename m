Return-Path: <Qiang.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 461146D6FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 09:14:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL9EdcE020640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 01:14:39 -0800 (PST)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 01:14:38 -0800
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 17:14:51 +0800
Message-ID: <1385025291-14853-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] shadow: remove reference to locale env files from su
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
X-List-Received-Date: Thu, 21 Nov 2013 09:14:43 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

The /etc/default/locale missing message appears when running su <user>

root@qemu0:/var/log# su root
root@qemu0:/var/log# tail auth.log
Oct  8 07:47:54 qemu0 login[983]: pam_unix(login:session): session opened for user root by LOGIN(uid=0)
Oct  8 07:47:55 qemu0 login[995]: ROOT LOGIN  on '/dev/console'
Oct  8 07:48:21 qemu0 su[999]: Successful su for root by root
Oct  8 07:48:21 qemu0 su[999]: + /dev/console root:root
Oct  8 07:48:21 qemu0 su[999]: pam_env(su:session): Unable to open env file: /etc/default/locale: No such file or directory
Oct  8 07:48:21 qemu0 su[999]: pam_unix(su:session): session opened for user root by root(uid=0)

This commit remove reference from pam.d/su to /etc/default/locale
env file to avoid the error messages.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 meta/recipes-extended/shadow/files/pam.d/su |    3 ---
 meta/recipes-extended/shadow/shadow.inc     |    2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/pam.d/su b/meta/recipes-extended/shadow/files/pam.d/su
index 8e35137..8d590a3 100644
--- a/meta/recipes-extended/shadow/files/pam.d/su
+++ b/meta/recipes-extended/shadow/files/pam.d/su
@@ -34,9 +34,6 @@ auth       sufficient pam_rootok.so
 # 
 # parsing /etc/environment needs "readenv=1"
 session       required   pam_env.so readenv=1
-# locale variables are also kept into /etc/default/locale in etch
-# reading this file *in addition to /etc/environment* does not hurt
-session       required   pam_env.so readenv=1 envfile=/etc/default/locale
 
 # Defines the MAIL environment variable
 # However, userdel also needs MAIL_DIR and MAIL_FILE variables
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5ab978a..572c3bc 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -44,7 +44,7 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
 
-PR = "r13"
+PR = "r14"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
-- 
1.7.9.5


