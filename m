Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788AEC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8286.1745982015965080456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FR2oYaaG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224341bbc1dso73118385ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982015; x=1746586815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NboXSzfMy1GcYp6hXejCZvNztLrTwmin7Og8LOuEQw=;
        b=FR2oYaaGtvsS36A2XRZhaql1yxgBVSqglIyQUTq6oLkwB6sFDkrAWEtqArh2t3iHSe
         O0Eu9LYyYP7o+sW2D6Ti7wqx1ocEUT8hKojbCi6mz3JkwfvJ69HCKZPN1w6+bvC/7fmr
         gWNOo7IGMuhg5hYFb2xvrlTPtwVxqFfAKfz9gXTv7EwuJW3+jMxf+FQbzu8zUimnc8mi
         1FZXRd0E1jRDSigWS03dJ7a1895oSvEo6C5FmvC8MbWxFjRYOsfbfniGgou6ReRCgl6s
         AUM5hzJGVfwRcKLTSJ+1WIwXMuIVdQeG2eVps66obJyE60n1IA9MCpq6FN4qIlyKVWvf
         RHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982015; x=1746586815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NboXSzfMy1GcYp6hXejCZvNztLrTwmin7Og8LOuEQw=;
        b=GrMq9um4KjFzFE/gj+GfmvKSuk94iUUwLI8w9t5XYuk7mNyDlh/u9gG3+EKpriEwtj
         7XoGU9QKpY1r2dEy6pY9VYOcKSqZ/lwZYS6woPRw8eRXGjhp4r+6z969aoGE9f8cdaz/
         7JJkcO3fbIwLuX59ETI3rWOFWybhogMtzlSHNRA/UgRe0XPApA+QsHqM5eWfyHaBsohP
         /8pNflP5MJN+5UcD3mnYplAqq3hZOzam/3QZ3GN0l6QZ2iYwd2dIpRUf49Vbflbun5gK
         hFtCoqH8gAiMnFl9TjLCwYh9uFo0+MkiAit4QHy2gW9wWP+zydwz6zNHeLfcL5YcFSvc
         ztLg==
X-Gm-Message-State: AOJu0YweoBHZuM8UxSd+VB5PopREGwOjYDhJo7k8mBFe/e/8GebjovUS
	JC72W7DIf1k4ioM9Mnn4u5eeQ/e6ZRZJU9oH0am3ev0MvOXZt5Vn7Vn2eXsXBizVIiZlcLbKFiR
	I
X-Gm-Gg: ASbGncs8Zs4eEdZq9BM2v+UQIvGR31EzUw76/+vMfGiUwr9NbbirflrAl+YmmmQvbsF
	4n8MPafUdvhU2GFkZflYe5WpNC1joKuQztNnNsG9orfWamZPy3pAAyjD6zC1c/ii6kmTEiBNT5+
	6vckfxYBIckoLSNfBwNyPsQ5cpoW59zW8tWAMSSo21w2PumLcrhXCHabm0Qyuritcd4eBk7ggop
	Zr+0rt9TELGss8F9/X39XkKx6L0WN8YkSsD5Xl18LHr6I5W/Hg0z8jkb2f+tNBCzQZO1oUkCt4W
	bhD0gy8opgJMADe+nWkQfCvWyAklBg4=
X-Google-Smtp-Source: AGHT+IEftvjWKMRyMzChTY6GI/8mVQP3XCcaI2XQym9+aun8KYOMLJOJgTrXy6NGnd99rFeMTfKQKQ==
X-Received: by 2002:a17:902:e785:b0:220:c63b:d93c with SMTP id d9443c01a7336-22df35bb0fcmr27405975ad.44.1745982015094;
        Tue, 29 Apr 2025 20:00:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/15] libpam: Update fix for CVE-2024-10041
Date: Tue, 29 Apr 2025 19:59:49 -0700
Message-ID: <78a04ce17e7d828c0cf8cae2164882683d46275e.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215707

From: Shubham Kulkarni <skulkarni@mvista.com>

Initially, PAM community fixed CVE-2024-10041 in the version v1.6.0 via commit b3020da.
But not all cases were covered with this fix and issues were reported after the release.
In the v1.6.1 release, PAM community fixed these issues via commit b7b9636.
Backport this commit b7b9636, which
Fixes: b3020da ("pam_unix/passverify: always run the helper to obtain shadow password file entries")

Backport from https://github.com/linux-pam/linux-pam/commit/b7b96362087414e52524d3d9d9b3faa21e1db620

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...024-10041.patch => CVE-2024-10041-1.patch} |  0
 .../pam/libpam/CVE-2024-10041-2.patch         | 77 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  3 +-
 3 files changed, 79 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/pam/libpam/{CVE-2024-10041.patch => CVE-2024-10041-1.patch} (100%)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10041-1.patch
similarity index 100%
rename from meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
rename to meta/recipes-extended/pam/libpam/CVE-2024-10041-1.patch
diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch
new file mode 100644
index 0000000000..6070a26266
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10041-2.patch
@@ -0,0 +1,77 @@
+From b7b96362087414e52524d3d9d9b3faa21e1db620 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Wed, 24 Jan 2024 18:57:42 +0100
+Subject: [PATCH] pam_unix: try to set uid to 0 for unix_chkpwd
+
+The geteuid check does not cover all cases. If a program runs with
+elevated capabilities like CAP_SETUID then we can still check
+credentials of other users.
+
+Keep logging for future analysis though.
+
+Resolves: https://github.com/linux-pam/linux-pam/issues/747
+Fixes: b3020da7da38 ("pam_unix/passverify: always run the helper to obtain shadow password file entries")
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/b7b96362087414e52524d3d9d9b3faa21e1db620]
+CVE: CVE-2024-10041
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ modules/pam_unix/pam_unix_acct.c | 17 +++++++++--------
+ modules/pam_unix/support.c       | 14 +++++++-------
+ 2 files changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/modules/pam_unix/pam_unix_acct.c b/modules/pam_unix/pam_unix_acct.c
+index 8f5ed3e0df..7ffcb9e3f2 100644
+--- a/modules/pam_unix/pam_unix_acct.c
++++ b/modules/pam_unix/pam_unix_acct.c
+@@ -110,14 +110,15 @@ int _unix_run_verify_binary(pam_handle_t *pamh, unsigned long long ctrl,
+       _exit(PAM_AUTHINFO_UNAVAIL);
+     }
+
+-    if (geteuid() == 0) {
+-      /* must set the real uid to 0 so the helper will not error
+-         out if pam is called from setuid binary (su, sudo...) */
+-      if (setuid(0) == -1) {
+-          pam_syslog(pamh, LOG_ERR, "setuid failed: %m");
+-          printf("-1\n");
+-          fflush(stdout);
+-          _exit(PAM_AUTHINFO_UNAVAIL);
++    /* must set the real uid to 0 so the helper will not error
++       out if pam is called from setuid binary (su, sudo...) */
++    if (setuid(0) == -1) {
++      uid_t euid = geteuid();
++      pam_syslog(pamh, euid == 0 ? LOG_ERR : LOG_DEBUG, "setuid failed: %m");
++      if (euid == 0) {
++	printf("-1\n");
++	fflush(stdout);
++	_exit(PAM_AUTHINFO_UNAVAIL);
+       }
+     }
+
+diff --git a/modules/pam_unix/support.c b/modules/pam_unix/support.c
+index d391973f95..69811048e6 100644
+--- a/modules/pam_unix/support.c
++++ b/modules/pam_unix/support.c
+@@ -562,13 +562,13 @@ static int _unix_run_helper_binary(pam_handle_t *pamh, const char *passwd,
+		_exit(PAM_AUTHINFO_UNAVAIL);
+	}
+
+-	if (geteuid() == 0) {
+-          /* must set the real uid to 0 so the helper will not error
+-	     out if pam is called from setuid binary (su, sudo...) */
+-	  if (setuid(0) == -1) {
+-             D(("setuid failed"));
+-	     _exit(PAM_AUTHINFO_UNAVAIL);
+-          }
++	/* must set the real uid to 0 so the helper will not error
++	   out if pam is called from setuid binary (su, sudo...) */
++	if (setuid(0) == -1) {
++	   D(("setuid failed"));
++	   if (geteuid() == 0) {
++	      _exit(PAM_AUTHINFO_UNAVAIL);
++	   }
+	}
+
+	/* exec binary helper */
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index 55b4dd7ee1..714cdb6552 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -27,7 +27,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://0001-pam_namespace-include-stdint-h.patch \
            file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
            file://CVE-2024-22365.patch \
-           file://CVE-2024-10041.patch \
+           file://CVE-2024-10041-1.patch \
+           file://CVE-2024-10041-2.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.43.0


