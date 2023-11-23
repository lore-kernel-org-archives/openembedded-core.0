Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D75C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 03:39:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.84332.1700710759555186281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 19:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MHN0g4Z/;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6b709048f32so461482b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 19:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700710758; x=1701315558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KViEiJfBRowOllFx7FcTnfuqN8oNoYEBoADK/tjIIes=;
        b=MHN0g4Z/hIZulcksKGqS3O4ETsXLlePhuf3YL6SA6wYoUYeDcgoBz7o+gO26MpaGZZ
         qSrxzZDNQRN9JQXmPX5TjVavjxCzE/Qxytd562sapHWLRQSs/v3LlcPFrIB8luuISKKc
         lCJnzIfrrIxdWWrVf5TxWeFwSBiTNyHGCPrQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700710758; x=1701315558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KViEiJfBRowOllFx7FcTnfuqN8oNoYEBoADK/tjIIes=;
        b=IfdJZhTTvaHIrtNJabG83BNnjkHc1Tsnm4BK455TKLa3A7aAM5oOSH1aCP1D6CYMBx
         8HVOHyIP/y6R6kBy11iRfSowxiffRl21JZ/DWQ7AwZPPWeYHZSqIFoHmYWRkUNAaw6Ri
         7SmARbXht2+tqcv5ovwCcIPtMOlwKKD+EDfX+CexPWkGcOV4udcp9FZJ8XpNwOHws1Ks
         eG1sK9sczHNKj89VfIOzUIL8iwNfYZUXMTmuAtfE1rTxERLKRpxzUzT3mTvUpvXQq8GJ
         KlYxmCsEhnm+oe6wPR+blaUnTG9std7IItmw8VuGxm7PwToh1yqfINTiegDbkuCbS3LY
         MX4Q==
X-Gm-Message-State: AOJu0YxIXXNcYXFU8Il1l4C6TcdD2bbUA3kAR85xErJOrNYOUS+z6wOf
	6/knwG7yl/OhhOhoAUNMuD1o8Q6U3V2Ao3diS7A=
X-Google-Smtp-Source: AGHT+IHRRtbHqNwi2riYKsmdhr0PCVKpCd0V+aFix7bY18GsvoXWpEUydkaeaT4G123LaReRjE5R6w==
X-Received: by 2002:a05:6a00:1952:b0:6bd:b7c5:f777 with SMTP id s18-20020a056a00195200b006bdb7c5f777mr5021138pfk.16.1700710758052;
        Wed, 22 Nov 2023 19:39:18 -0800 (PST)
Received: from MVIN00020.mvista.com ([136.185.83.141])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b0068fece2c190sm222292pfe.70.2023.11.22.19.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 19:39:17 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] shadow: backport patch to fix CVE-2023-29383
Date: Thu, 23 Nov 2023 09:07:05 +0530
Message-Id: <20231123033705.36270-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 03:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191133

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
2.25.1


