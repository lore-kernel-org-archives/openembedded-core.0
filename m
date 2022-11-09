Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC523C43217
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 14:21:00 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.3847.1668003656162736447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 06:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OHNVb4Z3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id z26so16836894pff.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml5lwkJzna8vHSLYneRri7QrseEqzLWhqsjJA2R/KKk=;
        b=OHNVb4Z3irYcjcLQpoYwzoVFfBpVGRq7FUZsTF+aJE80WEGT7u9E9TrnKHVoNeOTGO
         SnBoesJg86FX15bu0IyX4wKjb+4iiHrxB1JyrEl1tYSgUi0vaBVHL2Ov6jLFRxeJrJWp
         hmFVag2xrqQZsp//ingPCdlqh4zPCaWCtXIYsH0kDXg7GeXLGg4iPjEPxlrQlO2CoyIZ
         f/hEjo4W9ndt/Dxi7bILZaAjgggC1l0gs+ROPL298rvspC8CUdIWrLRg49DzNKYavlH6
         ky0NjuQiCKXJ7Vhmpg+t4TU+D2Q9WZpJdKYEkvOkCET5RqgCjEmkbqr6Tw4RkeRVzw9A
         TCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml5lwkJzna8vHSLYneRri7QrseEqzLWhqsjJA2R/KKk=;
        b=ca8hFInPQTHnEcY9pNm6aCXwFgwHIyxktrpe5tNw15SAqrTbtXZGer12sS4B/bMEAn
         PzVVEJl5S8/mdYoOw1JNNfgLtBElLJi5VT0tRth1YkpvXHTMDvCPRG/rfUo7DqfI3Sdu
         +q8UB5xj6SaoJ2EXS3S8G/jXucz6siGO+Expo8ZbY70rbpewi0djvNWU6quQPlkrS3fp
         ktv/TtLr3tuq9uBakNt0/pWZ8nI5fxoBnAqtwrxK7u0FAX2mEAOk+hn4bCQWPXL0rMqi
         nl992eFD1kLPa7/uQoipUCoZ1ZcJps70HZkDIU48WGMClcRNKZwfrSnKGrmcWkpFhNSy
         2nOA==
X-Gm-Message-State: ACrzQf20RYyEhsivFbENQJEoObWpzG2ezeJgKROeuHW7xBw5XX7wF/7h
	ZvwBeCtWQacuVmKrB/XEmnsohl+sHm7+nbeB
X-Google-Smtp-Source: AMsMyM7qhs9j3C4nmdl1CHyIpaLKAC2Aa/r1vlufI0Y9m9aUQrQLqc48MAnGc+hEqG5j9l4WhkKjvg==
X-Received: by 2002:a63:e641:0:b0:46f:b6e1:195d with SMTP id p1-20020a63e641000000b0046fb6e1195dmr44382014pgj.587.1668003655136;
        Wed, 09 Nov 2022 06:20:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902a51100b001822121c45asm9059337plq.28.2022.11.09.06.20.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:20:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/10] sudo: backport fix for CVE-2022-43995
Date: Wed,  9 Nov 2022 04:20:33 -1000
Message-Id: <a41a5f310246dcd9dbdb4537d59bc0579c3b1052.1668003427.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668003427.git.steve@sakoman.com>
References: <cover.1668003427.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 14:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173022

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/files/CVE-2022-43995.patch           | 54 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch

diff --git a/meta/recipes-extended/sudo/files/CVE-2022-43995.patch b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
new file mode 100644
index 0000000000..64dca8c9c6
--- /dev/null
+++ b/meta/recipes-extended/sudo/files/CVE-2022-43995.patch
@@ -0,0 +1,54 @@
+CVE: CVE-2022-43995
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From bd209b9f16fcd1270c13db27ae3329c677d48050 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Fri, 28 Oct 2022 07:29:55 -0600
+Subject: [PATCH] Fix CVE-2022-43995, potential heap overflow for passwords < 8
+ characters. Starting with sudo 1.8.0 the plaintext password buffer is
+ dynamically sized so it is not safe to assume that it is at least 9 bytes in
+ size. Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
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
2.25.1


