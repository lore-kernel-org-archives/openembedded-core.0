Return-Path: <ezhilarasanx.s@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D31C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 08:29:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.5569.1667896164316695280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 00:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=SAie+D4O;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: ezhilarasanx.s@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667896164; x=1699432164;
  h=from:to:subject:date:message-id;
  bh=b1EfDsWVNrUZScZ6KWmxdzVbpUnlLelhRcVOsKlw7G8=;
  b=SAie+D4OEKuz49aVHKq7vo6DJ/9ZQIhHNqT9IyPluS60cuIx1eYTH1nK
   lz3agE2u7rNJzGS+5YFRBfwTCOThOAVmsg5NydHwr4ShCr6D07nu6KMtM
   do9B8K7HLPucAMS/d+0w7y7/7MsAlmsp0SGsroJ9oEUokzRJxygv9AU7v
   lVVWsz9rud5VycVvNJo84zvSjneXthNxTA76Cqbcb+inJ0Wz4NI0vH+Eg
   r9rpca5JYSupYseAQMUDQxgqL16FGwLEpvZHQ3a8l/dUY5XkqYJvipnP2
   JHntma84Wl3hcRx9f3CQ+WYpHpR/zELHAygOEc1hkhT+0nhSkivz5ue1Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337366059"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="337366059"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:29:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="699837435"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="699837435"
Received: from inlubt0314.iind.intel.com ([10.67.198.223])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 00:29:23 -0800
From: Ezhilarasan <ezhilarasanx.s@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sudo: backport fix for CVE-2022-43995
Date: Tue,  8 Nov 2022 13:59:12 +0530
Message-Id: <20221108082912.32560-1-ezhilarasanx.s@intel.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172953

Reference to upstream patch:
https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050

Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>
---
 .../sudo/files/CVE-2022-43995.patch           | 60 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
new file mode 100644
index 0000000000..3929f32e9e
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
@@ -0,0 +1,60 @@
+From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 28 Oct 2022 07:29:55 -0600
+Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
+ characters. Starting with sudo 1.8.0 the plaintext password buffer is
+ dynamically sized so it is not safe to assume that it is at least 9 bytes in
+ size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
+
+Upstream-Status: Backport
+CVE: CVE-2022-43995
+
+Reference to upstream patch:
+https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050
+
+Signed-off-by: Ravula AdhityaX Siddartha <adhityax.siddartha.ravula@intel.com>
+
+---
+ plugins/sudoers/auth/passwd.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
+index b2046eca2..0416861e9 100644
+--- a/plugins/sudoers/auth/passwd.c
++++ b/plugins/sudoers/auth/passwd.c
+@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
+ int
+ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
+ {
+-    char sav, *epass;
++    char des_pass[9], *epass;
+     char *pw_epasswd = auth->data;
+     size_t pw_len;
+     int matched = 0;
+@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+ 
+     /*
+      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
+-     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
+      */
+-    sav = pass[8];
+     pw_len = strlen(pw_epasswd);
+-    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
+-	pass[8] = '\0';
++    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
++	strlcpy(des_pass, pass, sizeof(des_pass));
++	pass = des_pass;
++    }
+ 
+     /*
+      * Normal UN*X password check.
+@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
+      * only compare the first DESLEN characters in that case.
+      */
+     epass = (char *) crypt(pass, pw_epasswd);
+-    pass[8] = sav;
+     if (epass != NULL) {
+ 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
+ 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
+--
+2.17.1
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
index ba610ee2e7..fa9cf48196 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
+           file://CVE-2022-43995.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.17.1


