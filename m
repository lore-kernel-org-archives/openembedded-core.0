Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F7FC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 05:50:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.15687.1705643401640377184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 21:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TKFwZVvR;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d720c7fc04so1179905ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 21:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705643401; x=1706248201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fF4MT2VaB3CfAHgmmyqzezcgRB0xrNccavtV8KvubOA=;
        b=TKFwZVvRAGxgs8O8pNRZU3kwE5bPFBxQlGbM4kP7rnAB7XjejHgpMw/7BfejBV5wDt
         ZU4pbJWNOPydh/fXyVEtu+lv//+HM7VC3UYRc2Ef/6m2pEvDZo2mx8AYbLJgwtqPef4m
         7+qIn/+1/EJpm+IzZJur0Tc4BJFAf8nvScJl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705643401; x=1706248201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fF4MT2VaB3CfAHgmmyqzezcgRB0xrNccavtV8KvubOA=;
        b=O3lj8Y45hg5ApC8tkyKc/9iazP0KqwvNW466BmKm9R3jrc4iiL/CZYmQe6KBioXfwg
         sWZ+SWSF/qTduVpXTlPhbEQsD7AgXqNdNdv9kuCqt3ByOyRJhAQFF72Xi9JWgUINavSX
         u2+q8yAqEAmE8C7ywrc+L3OGjQWb/y7jkZnLc4zENvYGOweKSPX+yMPuFkq9GBhAMSUF
         z7Wm4UaS8geQueJL3G6I31b8bIXEP57nBNlOt4ffayt/thcCkeuWzZdzWjFEt541iyLx
         yWtU5qJbYSo9tqbGywcsjVQFYswzjruvCr+cv6O9HZ+oITgU8fcHnR7a0VgdMonStPDe
         qWTQ==
X-Gm-Message-State: AOJu0YyPCJm+FidRopnDKdFqrPhlwRmjDVJaqV5WXrEAspmLr1BexNg7
	GWVuB+RA5cI9KOIZxpE7JMrzI1UERrcBgeOsKRnPZJo3jZitK2W6pN9z1wc5gqZr1uAC/1/ceHQ
	rZco=
X-Google-Smtp-Source: AGHT+IFpmcdQASvYprPFWbiNsA0ILJhdYbCai46tQoYezJl7svv18vOYrHs8xLo83oTFKP8Q7VzoeQ==
X-Received: by 2002:a17:903:8d0:b0:1d3:77c4:59db with SMTP id lk16-20020a17090308d000b001d377c459dbmr2202796plb.139.1705643400778;
        Thu, 18 Jan 2024 21:50:00 -0800 (PST)
Received: from MVIN00016.mvista.com ([150.129.170.246])
        by smtp.gmail.com with ESMTPSA id ku15-20020a170903288f00b001d5ebb95329sm2228540plb.271.2024.01.18.21.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 21:50:00 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] pam: fix CVE-2024-22365 pam_namespace misses
Date: Fri, 19 Jan 2024 11:19:54 +0530
Message-Id: <20240119054954.146655-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194009

Upstream-Status: Backport from https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../pam/libpam/CVE-2024-22365.patch           | 62 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-22365.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
new file mode 100644
index 0000000000..e9e3a078e0
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-22365.patch
@@ -0,0 +1,62 @@
+From 031bb5a5d0d950253b68138b498dc93be69a64cb Mon Sep 17 00:00:00 2001
+From: Matthias Gerstner <matthias.gerstner@suse.de>
+Date: Wed, 27 Dec 2023 14:01:59 +0100
+Subject: [PATCH] pam_namespace: protect_dir(): use O_DIRECTORY to prevent
+ local DoS situations
+
+Without O_DIRECTORY the path crawling logic is subject to e.g. FIFOs
+being placed in user controlled directories, causing the PAM module to
+block indefinitely during `openat()`.
+
+Pass O_DIRECTORY to cause the `openat()` to fail if the path does not
+refer to a directory.
+
+With this the check whether the final path element is a directory
+becomes unnecessary, drop it.
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/031bb5a5d0d950253b68138b498dc93be69a64cb]
+CVE: CVE-2024-22365
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ modules/pam_namespace/pam_namespace.c      | 18 +-----------------
+ 1 file changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/modules/pam_namespace/pam_namespace.c b/modules/pam_namespace/pam_namespace.c
+index 4d4188d..d6b1d3c 100644
+--- a/modules/pam_namespace/pam_namespace.c
++++ b/modules/pam_namespace/pam_namespace.c
+@@ -1103,7 +1103,7 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 	int dfd = AT_FDCWD;
+ 	int dfd_next;
+ 	int save_errno;
+-	int flags = O_RDONLY;
++	int flags = O_RDONLY | O_DIRECTORY;
+ 	int rv = -1;
+ 	struct stat st;
+ 
+@@ -1157,22 +1157,6 @@ static int protect_dir(const char *path, mode_t mode, int do_mkdir,
+ 		rv = openat(dfd, dir, flags);
+ 	}
+ 
+-	if (rv != -1) {
+-		if (fstat(rv, &st) != 0) {
+-			save_errno = errno;
+-			close(rv);
+-			rv = -1;
+-			errno = save_errno;
+-			goto error;
+-		}
+-		if (!S_ISDIR(st.st_mode)) {
+-			close(rv);
+-			errno = ENOTDIR;
+-			rv = -1;
+-			goto error;
+-		}
+-	}
+-
+ 	if (flags & O_NOFOLLOW) {
+ 		/* we are inside user-owned dir - protect */
+ 		if (protect_mount(rv, p, idata) == -1) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 0799102f8e..20745aa837 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam-volatiles.conf \
            file://CVE-2022-28321-0002.patch \
            file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
+           file://CVE-2024-22365.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.25.1


