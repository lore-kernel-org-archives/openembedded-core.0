Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57132C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.8285.1745981642696756617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2w8vNM7a;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30863b48553so513503a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981642; x=1746586442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8AObFzL2BA1m/HRpC5rtWdX84Cr2FLra/sd8k9G1z4=;
        b=2w8vNM7aRR28OJcYiuR/tL3y1jz29sRbD7WjFvX/qQTk2XnhDWqMBuPGJcQKtJp5Lf
         XdWPpRPBc2K09ttpnl+6CAJJr2C/Fvsw87aGcRslPeschYgzwsTQCjU7khxhphKj88d0
         rYgzplg8fRdkBd22f29lupKANyW7n8Q5MlVaMopokvbbmQNGlvDmG3hig0276xE2yRAX
         02xWH0uvVIrBZafjTbeHP6ekOXftlmdOzv47yJwoPMQXQguBM9kzzptN/fZBhYanI/Z+
         TUffpDVPmOEQe2EIzdV9AAzKLBOB1ST9HbN3gm1A2ot2uim/eJnqkf+YFayc6RYTEWIe
         z5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981642; x=1746586442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8AObFzL2BA1m/HRpC5rtWdX84Cr2FLra/sd8k9G1z4=;
        b=PyKFWRTHZx03DFtuKdCiN6otGkh/fvcrcLxKZpl0XdBez42dQpwvdfLW7oEp4ogcE7
         Cm4hsySJJMvUOXDQft2p/fc/yI8AeXGDOQb2gVee5ZKVj2TzLtTJaU8J3UCdvzyeaTt5
         qCAhTxaEp3+Bw48HRvOSXA3hM6AAIsRF/DwmEktDUE2qc3+PXgsrR4RBHnE7Y8ZINKXz
         JbffbQTFIBJkL753fPc4QxWPvR/FNcP4ql/qGrVLcrku3usV8T2R5mtGJopIggdvmjDn
         TpZK3yEaExY95OTREwmuwznXolfL9+spZxBK5DCRdrZfeeQxvRq4bfo1ArnLYz87mpyv
         UAZw==
X-Gm-Message-State: AOJu0YzvPgr3aBMIIIKmIc6mr8aq1CSG22gijY7x7fViekhvJKdDDF4C
	Oyx4EvTPrENkdnGExRW+NNW7cfTPjQjqrKsb9LyJuRqbtq1RtZ9/L33+uCCPeE5nYzQdTsfsr2X
	t
X-Gm-Gg: ASbGncvIXzQH5IZDKrh+ivgQK5e/w9QqdxhwNqNgoU1ptItDL8Xr13XzEFrfdE6cwLZ
	BZZyOv9eZJXWXzf+TXEi1S301Hl649b4c+sYEphIdL6NDYH9shbrtuqfQbnWrGQe+G2zttiiyXJ
	QZvogIpGPcJ2F9XmtLiwf8GG7FFzH4jIqM9iM53LwWr/AiSr06h+0q0udz8HrXeBrzZEJQoDRs2
	HJ+c6AbRrKiUioHmmx/SF3DpJjdDBW2nPAY27MnDJhfVzzp0GSiTifehurBY+/8bM20xo1j2siz
	bw/uXB+7knaI9WmrkWUXmJ07cImfaxk=
X-Google-Smtp-Source: AGHT+IFawb4kuyKLjOP6V6srI4tAS5EHptua1asSEV5b2UTYHu8r0QYtkl0BIgebG5MVs76dfqoVuQ==
X-Received: by 2002:a17:90b:2c8d:b0:2e2:c2b0:d03e with SMTP id 98e67ed59e1d1-30a33cb4785mr1657023a91.5.1745981641699;
        Tue, 29 Apr 2025 19:54:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/14] libpam: Update fix for CVE-2024-10041
Date: Tue, 29 Apr 2025 19:53:27 -0700
Message-ID: <71035c8c5907f7103ce40b92490a10bd3dde7226.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215696

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
2.43.0


