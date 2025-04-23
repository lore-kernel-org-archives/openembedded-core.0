Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F19FC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:41:25 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.3853.1745397682877619773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UuybZ7fC;
 spf=pass (domain: mvista.com, ip: 209.85.167.178, mailfrom: skulkarni@mvista.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3fae28eb034so213536b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1745397681; x=1746002481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4RI92GySWes4I9RXhuyEpgCNGHUNABIjb1VYyCWVtY=;
        b=UuybZ7fC+cj3uDUwgSkVhmAeL8r0MaPonGfxMbV2phkp4Y0RfUU2Q9DQHIhSPkEbcY
         eW/y/dM6gguVf1u0vnpu9sl8M7IYMgEltdTaXJIjJy3NL483/WpRwcyIn9xFFfpCEnpR
         NZp+ybpzJE3vZXYcuXhdSQ04tUYD0t0KW5bCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397681; x=1746002481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4RI92GySWes4I9RXhuyEpgCNGHUNABIjb1VYyCWVtY=;
        b=wK95ot3H3Uhvh4s7nTn6vrN7p3txzaIpzgmjFyqNr1hSFTc44j9lh0nlM2ieMcqS4Y
         77aQtLbHHTgdtXxvquGhiV8zMQEQKqTuTwNlE8DGXvTFZ6GBMR+a0jc75IDoCb7LvuPZ
         b88GwFNZ5uM3+2CrzQl0Wh3aaWVs7E44wI32+LjD2CEfJcV/kIrbl4N2j14IYcp6Ixul
         3j26PWFthLmOKPiwU05U3s/XMYwp4BZmvWOFWjHW8V6T888ifVzE49aCsm2oip8tWGT+
         fk57QMKmMnzfN6LOGx1s9mBpRsbV5zW+Xgb4Yblo20fhvGG5y13ZZzTBIASBO3vZ/Y9Y
         llnA==
X-Gm-Message-State: AOJu0YzX0H2KiJhoiget9MYYtkOUah5X/cff3q6B9wH8pa3k5OJuv2CT
	iNl7pQc2VQImffT2xBCmSz8pFK7mHwSo/RzrdrMZL5NCsaXD6rf0+nFQkZugFf9sbbdm603Mzij
	CIUE=
X-Gm-Gg: ASbGncsmZrbgoN+aGYNeM5qtSuMCC2e8Kh+eC+qw8/Evbn+eAgP/9WiO8DgiQbHIayK
	sjQi3wQcYVmBwbCWIbQvCNINDVVbk49q8lsCNXPZSKuSyo5DFF2PKzBICdaZi8n5yXhJRczMaaU
	+iLwz7F2bczZaH5bYMfEwZQQKo47DRqf/bDnrdwRx9FTVmaqsTl1+PGTQTp+wNPNJL3TSFkM7BN
	gDnFljvR0ID4nGC7U5MDQn6azfTW2iaui3T6z6ZZHiPEXTI/Q0K8FG/eBzdDjh+vOaf/uwLoPQY
	5IIDcr5TKd23v+5CokjL8RhBVECaeEREuuB0kGM9OuincmOSel2y
X-Google-Smtp-Source: AGHT+IHVGBErIzwtCDDLNvpbAGo+Qs8vjT0A6+leeOej3/IxNvZnx5+IfHlRJXrK2nlgKVxf9RaByA==
X-Received: by 2002:a05:6870:184b:b0:297:2643:fa18 with SMTP id 586e51a60fabf-2d526e52950mr4073630fac.13.1745397681412;
        Wed, 23 Apr 2025 01:41:21 -0700 (PDT)
Received: from MVIN00025.mvista.com ([157.50.7.8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm3113959fac.47.2025.04.23.01.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:41:20 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libpam: Update fix for CVE-2024-10041
Date: Wed, 23 Apr 2025 14:10:56 +0530
Message-Id: <20250423084056.3149244-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215271

From: Shubham Kulkarni <skulkarni@mvista.com>

Initially, PAM community fixed CVE-2024-10041 in the version v1.6.0 via commit b3020da.
But not all cases were covered with this fix and issues were reported after the release.
In the v1.6.1 release, PAM community fixed these issues via commit b7b9636.
Backport this commit b7b9636, which
Fixes: b3020da ("pam_unix/passverify: always run the helper to obtain shadow password file entries")

Backport from https://github.com/linux-pam/linux-pam/commit/b7b96362087414e52524d3d9d9b3faa21e1db620

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
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
2.34.1


