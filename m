Return-Path: <Qiang.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E87546D5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 04:59:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAM4xVhs008110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 20:59:31 -0800 (PST)
Received: from optiplex-780.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 20:59:31 -0800
From: <qiang.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 12:59:46 +0800
Message-ID: <1385096386-26320-1-git-send-email-qiang.chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] shadow: remove reference to locale env files from login and su
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
X-List-Received-Date: Fri, 22 Nov 2013 04:59:32 -0000
Content-Type: text/plain

From: Qiang Chen <qiang.chen@windriver.com>

/etc/default/locale missing message appears when login
and running su <user>

qemu0 login[4189]: pam_env(login:session): Unable to open env file: /etc/default/locale: No such file or directory
qemu0 login[4189]: pam_unix(login:session): session opened for user root by LOGIN(uid=0)

qemu0 su[999]: pam_env(su:session): Unable to open env file: /etc/default/locale: No such file or directory
qemu0 su[999]: pam_unix(su:session): session opened for user root by root(uid=0)

This commit remove reference from pam.d/login and pam.d/su
to /etc/default/locale env file to avoid the error messages
as RHEL, fedora does.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
---
 meta/recipes-extended/shadow/files/pam.d/login |    3 ---
 meta/recipes-extended/shadow/files/pam.d/su    |    3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/pam.d/login b/meta/recipes-extended/shadow/files/pam.d/login
index e4dacc2..b340058 100644
--- a/meta/recipes-extended/shadow/files/pam.d/login
+++ b/meta/recipes-extended/shadow/files/pam.d/login
@@ -32,9 +32,6 @@ auth       requisite  pam_nologin.so
 # 
 # parsing /etc/environment needs "readenv=1"
 session       required   pam_env.so readenv=1
-# locale variables are also kept into /etc/default/locale in etch
-# reading this file *in addition to /etc/environment* does not hurt
-session       required   pam_env.so readenv=1 envfile=/etc/default/locale
 
 # Standard Un*x authentication.
 auth       include      common-auth
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
-- 
1.7.9.5


