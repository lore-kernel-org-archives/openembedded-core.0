Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7F4C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.30655.1668892544634684878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5sUMB2YC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k7so7425362pll.6
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCA9/ccSb7rBrevnRB5Mv2KFcShfi4O/LgUNfbLRDcM=;
        b=5sUMB2YCskCxgCUKySsCj8AKl2mHSw7fLeTyWfzQjT1Mtrfw248AHKyvaLIGeKAxZ8
         Ko5JFT1Phuq4i0/HIov8ZM8nUv138pK5CfN+OwKPFPGJQosrgo6DGAAxNLom7xs/fbpm
         uazu7nt7H+Mi4BIqobWsKCXOCkgbcO/Og06XWBfN72Xsk0fZZKiCVkGoIofSBUWVwEPm
         hPA+qM/o+tQlXd5Ar03hh52lxdlg5yy1VqTjJ90mL/WZnr3CRhNz2uoD3+6aU+lvhyZR
         7Rxj3KugepDr711SoIKuVTsAIQgV41I83IPb/23IhgHA+2dcjvb+CRoVTQDLZWfxq/uI
         wBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCA9/ccSb7rBrevnRB5Mv2KFcShfi4O/LgUNfbLRDcM=;
        b=ktmAPK6lh7+8Rwsabjn5mhwoa6jVi9kSXHAwx20FEaZ+2LWvPGAmLhGEOCdKzHaHRv
         4PDHMLwSLrQX2W82V51cxkpQtXh+zC2luqhlmn8pwDBjcCZR8fsFmWol9jQPTGi6qE9G
         VflTPau6PAAU5UY8Qt8y5HYp/L3XAyl8NQ1oI9Ng7PcJau80/LN9UsxSUt2JVclTY7Pb
         oByhaB56VE7tu9xLUsJSujjz0hdbmh567dMDR2NdbpFPEe7AE3aEvzb9moVMIpXilu7o
         cg4s/6CqMCFqfpEGH80/M9dortC3NsbT7Wi9/nU1Pn0PFxA+GR/7XganXDdCYRxOPKMe
         nWkQ==
X-Gm-Message-State: ANoB5pkzT14xXopSZQQQlanogmW8e3Z9EYq/V+0XOcNQ8A7Bdxqz8h2E
	4wSABbjiWMkrmObxIy/vhrercz4VWJ6WdUlrU9M=
X-Google-Smtp-Source: AA0mqf7Uh+3MnIH3ZyXk/8NVYY57OYkY5tGuaw/LZQ/JB+Gr04wc966B1bzyAMBjiL5qorVFbr7cqw==
X-Received: by 2002:a17:90b:507:b0:213:7030:f6c1 with SMTP id r7-20020a17090b050700b002137030f6c1mr19349705pjz.184.1668892543501;
        Sat, 19 Nov 2022 13:15:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/35] Revert "sudo: backport fix for CVE-2022-43995"
Date: Sat, 19 Nov 2022 11:14:50 -1000
Message-Id: <231c073f577cd4aa1899c9adb34003a06466b054.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173551

Prepare for version bump

This reverts commit a41a5f310246dcd9dbdb4537d59bc0579c3b1052.
---
 .../sudo/files/CVE-2022-43995.patch           | 54 -------------------
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |  1 -
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
deleted file mode 100644
index 64dca8c9c6..0000000000
--- a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-CVE: CVE-2022-43995
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Fri, 28 Oct 2022 07:29:55 -0600
-Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
- characters. Starting with sudo 1.8.0 the plaintext password buffer is
- dynamically sized so it is not safe to assume that it is at least 9 bytes in
- size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
-
----
- plugins/sudoers/auth/passwd.c | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
-index b2046eca2..0416861e9 100644
---- a/plugins/sudoers/auth/passwd.c
-+++ b/plugins/sudoers/auth/passwd.c
-@@ -63,7 +63,7 @@ sudo_passwd_init(struct passwd *pw, sudo_auth *auth)
- int
- sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_conv_callback *callback)
- {
--    char sav, *epass;
-+    char des_pass[9], *epass;
-     char *pw_epasswd = auth->data;
-     size_t pw_len;
-     int matched = 0;
-@@ -75,12 +75,12 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
- 
-     /*
-      * Truncate to 8 chars if standard DES since not all crypt()'s do this.
--     * If this turns out not to be safe we will have to use OS #ifdef's (sigh).
-      */
--    sav = pass[8];
-     pw_len = strlen(pw_epasswd);
--    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len))
--	pass[8] = '\0';
-+    if (pw_len == DESLEN || HAS_AGEINFO(pw_epasswd, pw_len)) {
-+	strlcpy(des_pass, pass, sizeof(des_pass));
-+	pass = des_pass;
-+    }
- 
-     /*
-      * Normal UN*X password check.
-@@ -88,7 +88,6 @@ sudo_passwd_verify(struct passwd *pw, char *pass, sudo_auth *auth, struct sudo_c
-      * only compare the first DESLEN characters in that case.
-      */
-     epass = (char *) crypt(pass, pw_epasswd);
--    pass[8] = sav;
-     if (epass != NULL) {
- 	if (HAS_AGEINFO(pw_epasswd, pw_len) && strlen(epass) == DESLEN)
- 	    matched = !strncmp(pw_epasswd, epass, DESLEN);
diff --git a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
index fa9cf48196..ba610ee2e7 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11p3.bb
@@ -4,7 +4,6 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
            file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
-           file://CVE-2022-43995.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.25.1


