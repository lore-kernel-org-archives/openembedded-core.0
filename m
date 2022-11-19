Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3CAC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.26038.1668880078112827127
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:47:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I1+45Yvh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id j12so7200666plj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciUKVu1vAmiJHvYNTKTXNLF5pwVQJCAkhblRAsjOjQo=;
        b=I1+45Yvh1yaTluuZL6aUfX7Q/MMhrZO8fDpfjjFD2yhQ1ZzjHijCzUuC6wJBjj65kl
         lkIOoLY7zjhNFjvp5/oEPoaRGjBUfEP7KXAed9I9T88dIRxDhcowuzqT59lPb2TN5BwM
         ZxM9h9kXrEnYBglKnlLk+piNXgR5KSeHZD7jztedodNNb+5gqelS8zx8BoEZAbuRj9OI
         11ZQo1Gmzj4lh26bAiRPqNd3Wrd9nGT9+gb6PJUZ086wxPSIzrmGgHrzgSASfNaKHsoP
         fdGzbqlb03AMahpEs0SBeR96nWhcH0fp8L6p9LCJ5GaVOAEwNF0tz3gs1DGyncC/9IwT
         X/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciUKVu1vAmiJHvYNTKTXNLF5pwVQJCAkhblRAsjOjQo=;
        b=h7RKNUVMDDCWaa+21OB5YrN02oGWGQTAAn2zzDuGSuIR0YclZS3garNY1IEyN4mQab
         r0f5mSIPw5HR/ea5YQ+ohmsp5Qfa+iGydbsJWe0Mgg4/IDF1OGV7tCow396aYOUguCHJ
         RUsTzyWdDPBmPznoH84W0nd+8T6sLWd9gaIS1meQMuhz+2xgJLcQEzEQYCDkKI24LpVX
         zFbfdjiApRfRhPPO31OE5DZc8r2K3DJ3jRcpy59n1AMzjzW8B4hmkZ7IiKMFU0fuTB1c
         E+3gvKeAXIGRRzpQ2t8AtEPf8j+L8Luwi2r6hE5ERZiIslBhkqx6e7fkJLagrHA54Ou4
         YOJQ==
X-Gm-Message-State: ANoB5pkNhlSHky9jMEpzIWK6Y/e9gZ45TuSp82xyP3+C0d/Fbv6MTuIx
	qGQ71EV86kPwaRh81JslM6dOrsyQ/dnIb6o0T8c=
X-Google-Smtp-Source: AA0mqf5N+7iMTn9UU10ON0Ap9nRLEgjLfoqXf3MZWThs7PAM0QX8DSimVHGAZ+ZR8nFfl0aoP6/Fkg==
X-Received: by 2002:a17:903:1342:b0:186:90a7:6b75 with SMTP id jl2-20020a170903134200b0018690a76b75mr4674847plb.23.1668880077071;
        Sat, 19 Nov 2022 09:47:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.47.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:47:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/21] sudo: CVE-2022-43995 heap-based overflow with very small passwords
Date: Sat, 19 Nov 2022 07:47:29 -1000
Message-Id: <acb78be935d1447184daea6fb037f224872eba67.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173519

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/sudo/CVE-2022-43995.patch            | 59 +++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch b/meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch
new file mode 100644
index 0000000000..1336c7701d
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch
@@ -0,0 +1,59 @@
+From e1554d7996a59bf69544f3d8dd4ae683027948f9 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 15 Nov 2022 09:17:18 +0530
+Subject: [PATCH] CVE-2022-43995
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/bd209b9f16fcd1270c13db27ae3329c677d48050]
+CVE: CVE-2022-43995
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Potential heap overflow for passwords < 8
+characters. Starting with sudo 1.8.0 the plaintext password buffer is
+dynamically sized so it is not safe to assume that it is at least 9 bytes in
+size.
+Found by Hugo Lefeuvre (University of Manchester) with ConfFuzz.
+---
+ plugins/sudoers/auth/passwd.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/sudoers/auth/passwd.c b/plugins/sudoers/auth/passwd.c
+index 03c7a16..76a7824 100644
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
+2.25.1
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.32.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
index 8d16ec2538..10785beedf 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.32.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -4,6 +4,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            file://0001-Fix-includes-when-building-with-musl.patch \
+           file://CVE-2022-43995.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.25.1


