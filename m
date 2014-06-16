Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 781756FD72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:29:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5G3Toqi008816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jun 2014 20:29:51 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 15 Jun 2014 20:29:50 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Jun 2014 23:29:48 -0400
Message-ID: <1402889389-835-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Yue.Tao@windriver.com
Subject: [PATCH] Security Advisory - pam - CVE-2014-2583
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
X-List-Received-Date: Mon, 16 Jun 2014 03:29:51 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Multiple directory traversal vulnerabilities in pam_timestamp.c in the
pam_timestamp module for Linux-PAM (aka pam) 1.1.8 allow local users to
create aribitrary files or possibly bypass authentication via a .. (dot
dot) in the (1) PAM_RUSER value to the get_ruser function or (2) PAM_TTY
value to the check_tty funtion, which is used by the
format_timestamp_name function.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2583

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 ...mp-fix-potential-directory-traversal-issu.patch |   58 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/0001-pam_timestamp-fix-potential-directory-traversal-issu.patch

diff --git a/meta/recipes-extended/pam/libpam/0001-pam_timestamp-fix-potential-directory-traversal-issu.patch b/meta/recipes-extended/pam/libpam/0001-pam_timestamp-fix-potential-directory-traversal-issu.patch
new file mode 100644
index 0000000..e9e9990
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/0001-pam_timestamp-fix-potential-directory-traversal-issu.patch
@@ -0,0 +1,58 @@
+From 9dcead87e6d7f66d34e7a56d11a30daca367dffb Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Wed, 26 Mar 2014 22:17:23 +0000
+Subject: [PATCH] pam_timestamp: fix potential directory traversal issue
+ (ticket #27)
+
+commit 9dcead87e6d7f66d34e7a56d11a30daca367dffb upstream
+
+pam_timestamp uses values of PAM_RUSER and PAM_TTY as components of
+the timestamp pathname it creates, so extra care should be taken to
+avoid potential directory traversal issues.
+
+* modules/pam_timestamp/pam_timestamp.c (check_tty): Treat
+"." and ".." tty values as invalid.
+(get_ruser): Treat "." and ".." ruser values, as well as any ruser
+value containing '/', as invalid.
+
+Fixes CVE-2014-2583.
+
+Reported-by: Sebastian Krahmer <krahmer@suse.de>
+---
+ modules/pam_timestamp/pam_timestamp.c |   13 ++++++++++++-
+ 1 files changed, 12 insertions(+), 1 deletions(-)
+
+diff --git a/modules/pam_timestamp/pam_timestamp.c b/modules/pam_timestamp/pam_timestamp.c
+index 5193733..b3f08b1 100644
+--- a/modules/pam_timestamp/pam_timestamp.c
++++ b/modules/pam_timestamp/pam_timestamp.c
+@@ -158,7 +158,7 @@ check_tty(const char *tty)
+ 		tty = strrchr(tty, '/') + 1;
+ 	}
+ 	/* Make sure the tty wasn't actually a directory (no basename). */
+-	if (strlen(tty) == 0) {
++	if (!strlen(tty) || !strcmp(tty, ".") || !strcmp(tty, "..")) {
+ 		return NULL;
+ 	}
+ 	return tty;
+@@ -243,6 +243,17 @@ get_ruser(pam_handle_t *pamh, char *ruserbuf, size_t ruserbuflen)
+ 		if (pwd != NULL) {
+ 			ruser = pwd->pw_name;
+ 		}
++	} else {
++		/*
++		 * This ruser is used by format_timestamp_name as a component
++		 * of constructed timestamp pathname, so ".", "..", and '/'
++		 * are disallowed to avoid potential path traversal issues.
++		 */
++		if (!strcmp(ruser, ".") ||
++		    !strcmp(ruser, "..") ||
++		    strchr(ruser, '/')) {
++			ruser = NULL;
++		}
+ 	}
+ 	if (ruser == NULL || strlen(ruser) >= ruserbuflen) {
+ 		*ruserbuf = '\0';
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 7e55adf..4ca6063 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://libpam-fix-for-CVE-2010-4708.patch \
            file://pam-security-abstract-securetty-handling.patch \
            file://pam-unix-nullok-secure.patch \
+           file://0001-pam_timestamp-fix-potential-directory-traversal-issu.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
-- 
1.7.9.5


