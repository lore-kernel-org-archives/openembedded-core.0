Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D858D44D6A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:50:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.45914.1730900998065482061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WfaZXIUG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso5131076a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900997; x=1731505797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjSVLGz3qZ7dLV97m10InE1Bc2dWhIjDbGTpkNvTc84=;
        b=WfaZXIUGOv8zn9bdC84cloEhZpMO6b6A0Eq8yjkKFlRR2MIPBmaYMg3ORj6DEaFSEQ
         C/mY/VUMTTXjd0oQORNlMhLxd/B9lwGqZtKITPSob5UQqqS6kqSsbhSynrcUqhsMBd4K
         EXK013RoXfA4JvHJ0vtLn0MzkAcyL/gKkb/FXZ1fQ8TuwFN7zsPwlybpx9wT+DgfV0nC
         VE6dMt2lmQsLNIVGQAlC0V/vyxO29L4w0/KuT12kP7D1/E6V0rez5b2YmQR4S9DW2j80
         2/L34H9HfUO0JikrbcQR1mho2DSiOyKqPWd/RB8Lh95zJWA2iRcq60je4qClaIRbwE6o
         BAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900997; x=1731505797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjSVLGz3qZ7dLV97m10InE1Bc2dWhIjDbGTpkNvTc84=;
        b=Il0BGIbKuLnaY7+OKzC0Z2y4f3Wxk71Jp7vr/oZ9gqbpn+fEy6x28gZDMpa0W0ALIA
         GbfVp63ze/P2coSJKAykf/ILJtfMPSmr/2O1pu8MxZ4pUYOn6PAroYCCDVj45S9cLnWv
         p1PwC54sbuftBvJg+MPJfAZXUCThXnshyHuxA1cQN0tljwBeMwGq+LfCpJpn25XC6Nl4
         RUjYnxxaR3LK66+piajxbGzAzTq6I2G2RkyeZ9HspKLSHasZRQCbgcR1oTnTuUybnVhq
         RnPxtjs0Boz3Sc4//ixxxxqUIL2VjO7nWq8Jm3KiCvN4ZqY6Ntk4R4x1DaPhF+1/xJA7
         5pJw==
X-Gm-Message-State: AOJu0Yy3TYWKQIqer40irPn7U7dBySKwStqGYHQL6jUAwgQQo6fPEZK3
	dn5BfkBWfXRClPWEiD6PxPDKbQr61EP6mULyEcrNzpr3d0UNoKV3UV1yTp3PEmjmgMyaFRZWsh/
	I
X-Google-Smtp-Source: AGHT+IE6Mwx4HEo9HT7XMNO7Lda45rbVNJXXaH8Y3agKrdTl0QWMEYBE1KModx/iecNuKXLn+NzNCg==
X-Received: by 2002:a17:90b:3755:b0:2e2:de27:db09 with SMTP id 98e67ed59e1d1-2e8f1078c4dmr41116296a91.19.1730900997217;
        Wed, 06 Nov 2024 05:49:57 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 7/7] glibc: Fix missing randomness in __gen_tempname
Date: Wed,  6 Nov 2024 05:49:37 -0800
Message-Id: <92cc48d51c763249b2eb8b4181bc20056fc72264.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730900782.git.steve@sakoman.com>
References: <cover.1730900782.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206780

From: Ola x Nilsson <olani@axis.com>

Backport the fix for glibc bug 32214.

The missing randomness in early boot may cause some systemd services
to fail when they occasionally try to create tempdirs like
/run/systemd/namespace-aaaaaa at the same time.
The error messages can contain things like
"Failed to set up mount namespacing".

Signed-off-by: Ola x Nilsson <olani@axis.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ndomness-in-__gen_tempname-bug-32214.patch | 29 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.40.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
new file mode 100644
index 0000000000..c9f3e32f58
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
@@ -0,0 +1,29 @@
+From 9d30d58c32fe9d5f8ec6cda79fb11159e6789bcf Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Wed, 25 Sep 2024 11:49:30 +0200
+Subject: [PATCH] Fix missing randomness in __gen_tempname (bug 32214)
+
+Make sure to update the random value also if getrandom fails.
+
+Fixes: 686d542025 ("posix: Sync tempname with gnulib")
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5f62cf88c4530c11904482775b7582bd7f6d80d2]
+
+Signed-off-by: Ola x Nilsson <olani@axis.com>
+---
+ sysdeps/posix/tempname.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sysdeps/posix/tempname.c b/sysdeps/posix/tempname.c
+index c00fe0c181..fc30958a0c 100644
+--- a/sysdeps/posix/tempname.c
++++ b/sysdeps/posix/tempname.c
+@@ -117,6 +117,8 @@ random_bits (random_value *r, random_value s)
+      succeed.  */
+ #if !_LIBC
+   *r = mix_random_values (v, clock ());
++#else
++  *r = v;
+ #endif
+   return false;
+ }
diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glibc/glibc_2.40.bb
index 71b89ac9ff..3e855b19d8 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -53,6 +53,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
+           file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


