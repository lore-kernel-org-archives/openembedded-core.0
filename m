Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86547C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:52:57 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.10161.1701211976968546919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MjsJ8n7Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c604b092a6so92327a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701211975; x=1701816775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRM1H9H1O2N3FbjXXpZX8MNum0qtZ4+mntoYbE0DEIw=;
        b=MjsJ8n7ZqeEOoF0d5Gjvp69Xw4AuNscRJauDctLZIQyvas+wM2NbiGaldW0HbDPsBN
         JW+DPOyYpP1ncRdhMU67DZ/tPA7aBD5npYYUv1a8YHjSUOwqffYXuyDVv7hAiid1bjmt
         brHOHKme9C0kpzLjUKNaiZ2yGUI1+fyVPrwVLxuZx+7mg3C3s6ZxE5/4PHDFCKQl9GAC
         NEWPXZoj0V9ELjU47Xgwe9FeD6ZxcWi+axy1cygwanGF945vG5+8Ivx141TnWkA9wzTX
         GtLY3hQj5iQ8kroW81nLDGljhcOj9yyZjMbWFIcuOi/UxPO0PjguAwmmDpDRLnbISJR/
         JlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211975; x=1701816775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRM1H9H1O2N3FbjXXpZX8MNum0qtZ4+mntoYbE0DEIw=;
        b=ijI8NA4OYuay6yvW0vS5J7t5D/drQ3HMgjX2Q6uhVrz1wlRiRKAaSHPurOr91mtpMa
         +4hKujcqZfuAcLuzUG9UkK3iJOiZU7X6NBAnZxXYOv04OMvGCH3xOUn5igSjWcVOAiJ2
         /JjIJymgapsFj9ncG1IvK5PMvCMtCe5ZYbQKHnKwRrj+MrevFpafRrDejWWRP6ZA4/If
         FVIVYlrgSKgQpFqYA5CwntN3e4GJmI7jVqOWUORYBGeElXC/5qQzfs1MoG3MhBPkL1fL
         GXPITJ4z9e2/eKl0XS7kCnODNcC4VSwuNuuGd/aiLL8Oon8yKV0bujw/Fe4x9os/TbEU
         5rdg==
X-Gm-Message-State: AOJu0Yz0x3Km7WtkioU6sgSVyvlBYT+zS/pa3zaJApvo8G2R6hPsQyj4
	3JaKZsVBd88kzxcw3MyEaZlknGl9aqqKCfUx72xkNA==
X-Google-Smtp-Source: AGHT+IFW0pRC67tATmc+0A+d9gIKLQX0Zc07anTiD3+Ao30vbneSrXKs9BJkABmz0VawKWKjVhsCpA==
X-Received: by 2002:a17:90b:3a90:b0:285:8cb6:6153 with SMTP id om16-20020a17090b3a9000b002858cb66153mr21968170pjb.17.1701211975407;
        Tue, 28 Nov 2023 14:52:55 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id cu20-20020a17090afa9400b00282ecb631a9sm9621898pjb.25.2023.11.28.14.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:52:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/13] shadow: backport patch to fix CVE-2023-29383
Date: Tue, 28 Nov 2023 12:52:31 -1000
Message-Id: <a53d446c289f07854e286479cd7e4843ddd0ee8c.1701210903.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701210903.git.steve@sakoman.com>
References: <cover.1701210903.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191399

From: Vijay Anusuri <vanusuri@mvista.com>

The fix of CVE-2023-29383.patch contains a bug that it rejects all
characters that are not control ones, so backup another patch named
"0001-Overhaul-valid_field.patch" from upstream to fix it.

(From OE-Core rev: ab48ab23de6f6bb1f05689c97724140d4bef8faa)

Upstream-Status: Backport
[https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
&
https://github.com/shadow-maint/shadow/commit/2eaea70111f65b16d55998386e4ceb4273c19eb4]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/0001-Overhaul-valid_field.patch     | 66 +++++++++++++++++++
 .../shadow/files/CVE-2023-29383.patch         | 54 +++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  2 +
 3 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
 create mode 100644 meta/recipes-extended/shadow/files/CVE-2023-29383.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
new file mode 100644
index 0000000000..aea07ff361
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Overhaul-valid_field.patch
@@ -0,0 +1,66 @@
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index 0000000000..dbf4a508e9
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/CVE-2023-29383.patch
@@ -0,0 +1,54 @@
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index bfe50c18f6..2ecab5073d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,8 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
+           file://CVE-2023-29383.patch \
+           file://0001-Overhaul-valid_field.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.34.1


