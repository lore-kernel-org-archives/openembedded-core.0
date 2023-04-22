Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C50C77B7C
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:55:09 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.10298.1682178900648142951
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=10I6vNPZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b73203e0aso19660151b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178900; x=1684770900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTLWl2pHVib6XJG3fOALlLGD3BkwUCGUQrMv1qNfcZg=;
        b=10I6vNPZj1pcIyMfL8BEfo1qVMXiJEe9h430Yw2T/xkwoOSidyx6zSr7h/ATPiXq3B
         SprOj0KpZBFFUTpINDJk0htO8wxJeN/h+EzeyNY4ro354mP7Jqgug6WXe6NBqKSFeUZo
         56semXUqIodtN3eKYaPIuSKiDy9DHywIT5bqcAYk6p7qHsFSORETIAhxeE7nudqo1CDx
         F3vuSocqfZXiE/zcxNVYHLrtVuajemvQ7X6ufETd/5jVbDgUyGYujYhOW8N+AXMoIZYo
         k2mBxuy1cDYY6t5JUmhhGZEU2DVS1BGqc1/8QjmtBb9jG3PwX9eZF6PoP43IKkhRDLx8
         93kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178900; x=1684770900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTLWl2pHVib6XJG3fOALlLGD3BkwUCGUQrMv1qNfcZg=;
        b=Pg4GXPVLaQn+l5xA9wGksf0V/GtvSNkQ8wPAF2zRUFNh7x0OaRdhpu2aMCkmPsUdIQ
         Iq/10ou8CDRdNsx3KyBmOKytdEllDutwj7RtYwwsD9I+F3+7BHCUvJ8XJh1WZaE66sJp
         X6jgChP60fhnNI7xOd3zdNUJB0j2JJRzkV6dSQ9DBYYqEda+yeqj0YudPUTlS2dv9b2z
         ZFvnjWQtc2DQFsIHY7/pourRaWTDkXe+CGJ/NF2qxp5pXuyT7S8x8LmCe1cOpurQwlgU
         Nm6RNmaEGrjvGSpokAaz0RXcfO81RyEUYpGSltHWwO2OR04aGF82WbyNLpUvr5IiwMMX
         S4xQ==
X-Gm-Message-State: AAQBX9e21/jTygJaD/MJNXKSIq0aoTLNHpz+p0FNC7pZbl5c2EV6Ci8O
	3DbBTVySML+mkk8Lgp1ZM6nRn5Rz5aFPl5dQUZs=
X-Google-Smtp-Source: AKy350Y5MIf6131GOITiV89zv71AJ/Gm22bkYi0uG5Oep4kKiEYGT7T+6xxWEFvbVKQAad2VFM/nzQ==
X-Received: by 2002:a17:902:cecb:b0:1a6:8527:8e0f with SMTP id d11-20020a170902cecb00b001a685278e0fmr9186319plg.10.1682178899518;
        Sat, 22 Apr 2023 08:54:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] shadow: backport patch to fix CVE-2023-29383
Date: Sat, 22 Apr 2023 05:54:37 -1000
Message-Id: <ab48ab23de6f6bb1f05689c97724140d4bef8faa.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180307

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The fix of CVE-2023-29383.patch contains a bug that it rejects all
characters that are not control ones, so backup another patch named
"0001-Overhaul-valid_field.patch" from upstream to fix it.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-Overhaul-valid_field.patch     | 65 +++++++++++++++++++
 .../shadow/files/CVE-2023-29383.patch         | 53 +++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 +
 3 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
new file mode 100644
index 0000000000..ac08be515b
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
@@ -0,0 +1,65 @@
+From 2eaea70111f65b16d55998386e4ceb4273c19eb4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Fri, 31 Mar 2023 14:46:50 +0200
+Subject: [PATCH] Overhaul valid_field()
+
+e5905c4b ("Added control character check") introduced checking for
+control characters but had the logic inverted, so it rejects all
+characters that are not control ones.
+
+Cast the character to `unsigned char` before passing to the character
+checking functions to avoid UB.
+
+Use strpbrk(3) for the illegal character test and return early.
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 24 ++++++++++--------------
+ 1 file changed, 10 insertions(+), 14 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index fb51b582..53929248 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -37,26 +37,22 @@ int valid_field (const char *field, const char *illegal)
+ 
+ 	/* For each character of field, search if it appears in the list
+ 	 * of illegal characters. */
++	if (illegal && NULL != strpbrk (field, illegal)) {
++		return -1;
++	}
++
++	/* Search if there are non-printable or control characters */
+ 	for (cp = field; '\0' != *cp; cp++) {
+-		if (strchr (illegal, *cp) != NULL) {
++		unsigned char c = *cp;
++		if (!isprint (c)) {
++			err = 1;
++		}
++		if (iscntrl (c)) {
+ 			err = -1;
+ 			break;
+ 		}
+ 	}
+ 
+-	if (0 == err) {
+-		/* Search if there are non-printable or control characters */
+-		for (cp = field; '\0' != *cp; cp++) {
+-			if (!isprint (*cp)) {
+-				err = 1;
+-			}
+-			if (!iscntrl (*cp)) {
+-				err = -1;
+-				break;
+-			}
+-		}
+-	}
+-
+ 	return err;
+ }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/files/CVE-2023-29383.patch b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
new file mode 100644
index 0000000000..f53341d3fc
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
@@ -0,0 +1,53 @@
+From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
+From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
+Date: Thu, 23 Mar 2023 23:39:38 +0000
+Subject: [PATCH] Added control character check
+
+Added control character check, returning -1 (to "err") if control characters are present.
+
+CVE: CVE-2023-29383
+Upstream-Status: Backport
+
+Reference to upstream:
+https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index 640be931..fb51b582 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -21,9 +21,9 @@
+  *
+  * The supplied field is scanned for non-printable and other illegal
+  * characters.
+- *  + -1 is returned if an illegal character is present.
+- *  +  1 is returned if no illegal characters are present, but the field
+- *       contains a non-printable character.
++ *  + -1 is returned if an illegal or control character is present.
++ *  +  1 is returned if no illegal or control characters are present,
++ *       but the field contains a non-printable character.
+  *  +  0 is returned otherwise.
+  */
+ int valid_field (const char *field, const char *illegal)
+@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
+ 	}
+ 
+ 	if (0 == err) {
+-		/* Search if there are some non-printable characters */
++		/* Search if there are non-printable or control characters */
+ 		for (cp = field; '\0' != *cp; cp++) {
+ 			if (!isprint (*cp)) {
+ 				err = 1;
++			}
++			if (!iscntrl (*cp)) {
++				err = -1;
+ 				break;
+ 			}
+ 		}
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5106b95571..3c1dd2f98e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,8 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
            file://useradd \
+           file://CVE-2023-29383.patch \
+           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


