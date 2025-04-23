Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54545C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:44:05 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.3880.1745397842786371227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dhipqklJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.44, mailfrom: skulkarni@mvista.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bff73ce3bso1013614a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1745397841; x=1746002641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dTO+rvtw2bu+y4DQNMpkR4JHyEO0R5lgBPEcWGwcBfc=;
        b=dhipqklJgJW8oIe8VdCrQ9lsS/7XY5zm5fXuUO0smPrG6fAgO9nnYztIpFh94yYRde
         srniq1kZAYuLgkbAmFi4yi4ROPVy5kkFWSP6DeUJod+YH3nUWzEplPwbDeXiycYj422m
         VnYdZQyhIGEgWOmJhJheSPTCLx+izrcN86IoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397841; x=1746002641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTO+rvtw2bu+y4DQNMpkR4JHyEO0R5lgBPEcWGwcBfc=;
        b=gGoWqTKXAFs/sxK1vwVNaaqp9pPyTzhUocjuEN47IkonLvQ7aGWUsbteu3FWF+fOJR
         pb1VhaToHpr7OPEjkpCbRV6TlC7k0k983v+JOXHii1OvobE2OW5K6/FiCVA7ts6W7rjg
         pjIZe6EtXIlt3TLeKgGXUyt60NC+9qZHkgGBtLY5fW/RGvSB8yZOiWbNWddm5AzxpIev
         ZrT+qcHly7KNAW2KbvoDwE6y9ZuLQRU9YX/Gef7LGSsqy91o63Dxf5nzwNO2l6LFykRl
         +aDUCA9r6OiK4XdSDxYRBxUVGD2nbzacxIHT0b/gfTZ9L/1wHZHHNPgtjw/2qUZATmyI
         sR3Q==
X-Gm-Message-State: AOJu0Yzm7q6QD1HP/ZgCdbLMrIHOMvQ6gjz6+JPgPi9VArbqV/b4Ciyv
	UtbhRIelOQUQG16BUofwttGwehiUUV2rD532HLFKKmMBEqXksJdcjX7/EkhmXY0fEn6Kp1nVw2M
	EsRI=
X-Gm-Gg: ASbGncuR4Ne6rkeWpguzKBEWdbCibO/qUNqw+fN3Dl6t5p2s4OBhDgjM3W7RnzS33qT
	OfgWWHKBXWsDjjLA4GkYiddcuO8DNwa8+uDMpeqhbwwEMCoVnyeG4qxbMvFKTvTnhy6K4n/YGK/
	cQkx0iwFeCjVPp0bm7mbsi25TbT4sm+HUgx/e2TaOUzeS/wCkL0sIfeRtof9DmJ3/PAaKc+od3v
	2e9XqxJziP3HQIUWBGAe+sbwWPjMUAjGy2bkU3+epfrr96de1y5WwMg1Ppjcbr09AeI+UR6hiVe
	PJ950TAuIFwGfhQwm7BNtM2P9x2ers9JChZggU+1hME2Vnitvyla
X-Google-Smtp-Source: AGHT+IGUOnzbUP1sbOg5P9D1Yd8+3ospcPxzQth+up6+OqbdXP9djple5TFK0J/pQVrJQiSJcYuFHQ==
X-Received: by 2002:a05:6820:c211:b0:602:24e0:a098 with SMTP id 006d021491bc7-606354af9a1mr316484eaf.2.1745397841351;
        Wed, 23 Apr 2025 01:44:01 -0700 (PDT)
Received: from MVIN00025.mvista.com ([157.50.7.8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff5d8ec7sm2523092eaf.2.2025.04.23.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:43:59 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libpam: Update fix for CVE-2024-10041
Date: Wed, 23 Apr 2025 14:13:43 +0530
Message-Id: <20250423084343.3149319-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215272

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
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  3 +-
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
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 05fe232f6a..567f9741cb 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -27,7 +27,8 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://CVE-2022-28321-0002.patch \
            file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
            file://CVE-2024-22365.patch \
-           file://CVE-2024-10041.patch \
+           file://CVE-2024-10041-1.patch \
+           file://CVE-2024-10041-2.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.34.1


