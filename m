Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC78CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.9190.1760038283182034574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0sfxnC67;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-796f9a8a088so1070937b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038282; x=1760643082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiRL46nVUvHg0caXtwjBFLYypKA99nBaKsISxmjEmBQ=;
        b=0sfxnC6704/PJ4yE08urEYpawv4l0fcIe5v4QWaol0AByGB2GJTsqlUznEiwOnbdWe
         nnSXM2MPLwQu/WRQ4Uo9LqkqM9FUqKT1TdGNGhCIlpyaBn5fDmaS35kJJXEk05YdmmAk
         aESUsTImNaPyOMd+9jJlESZTJMAvdlxBMhhL67knEWA9/+8M4GjITuivNRxmXdSMpCIv
         ZRB3qvUWQydJ5bEM+D/ScOSsozPmKlFD+rRSSw0QTYlNE/1bSdJ9wjUjnUcblIhj0nLq
         2FLIb+PFi8JfeJyDHdA4BtSJ0dLtCIbzkIEmcbopCrM6jq1XNPpjgWkYHeT99nkiVoau
         k3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038282; x=1760643082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiRL46nVUvHg0caXtwjBFLYypKA99nBaKsISxmjEmBQ=;
        b=mFUGLvlz2DRDVFOwWGbbkwXQgn7Vke+IT0KQ3uIQv3Zk/ZZMVdL4NkWny9nd5sau6u
         SY5YhEHMQH6J1UX4GXO4bg29t6dRnMnuxfJv2aRR7FHxEcM7vYbFUPk3w77m+p+d/FEA
         fnHX079GamZ9QWpPtwW77xhowl4GE+R8HEbwH30lsNORw/3Ya5Tl1CozrcGu+gWW/W/h
         iCaXy0Ja5SiHSfvwxx4QikyVC/v2ajUFpMNgVGhOpvUbSj4ngZHrxO2QxGWMTeJEdENE
         8I1+3WU68fvDOxxxAYMRi6exH6e8L426liEgRi3uCN+l2l6xDq2QsZq1ms6KNZDhHljD
         yizw==
X-Gm-Message-State: AOJu0YwA33u9kQeWTFzk0Q7LqGLic5JaB+mkPHS+0SGaHiimnUwpAG7r
	oOvaTx8umE6sQ6RgtfhicFKTg5uUdLi1oi+NCk972UOsK6sN9LJ/Ky/wSZNoKgvKlAtUrVncmOT
	hxVNA
X-Gm-Gg: ASbGnct9sOGLTZrx5GRO1atOHYchu/sX/12G+Ko7P9inAdmiOf+3aau+GTAEdo2x4SZ
	ZZBWoIPzmWbeB0lJFll9AUvCt751WIW3Vj4Wl4qAQ5Vt33iJkXG5cmTFKBtXtG+mqe0Q1LlUT1N
	qA6gPSgwLe5AO2GieL2WJcv9Ne+XNES/tgBvB2q3Rh/OhcbLgJCq+T+rSQo4DP9N1zb3fk9inIy
	9hecfL90EN8ecaZjySJ9TS6styryGEmkQ0tCYz3RyIDq+IY3eO90UPBSaXTZ+OSgT/Y6pus0qVF
	ge6CPvMXXRUP2mWHB2vJN5eS+NYS216UFrQBtBPLBxSBx3riPld5M/X+MsaJhNojIQbYEE+RwiX
	pYSbAoj1ViTIC2SduoLXNcGnXJ83GH80j6AB+DQ==
X-Google-Smtp-Source: AGHT+IGtXitu/lZsvpHah7XRxlSBxOnmaZnKGEyGVMbkE3UpXEQpvU6ZZVo9VdYAOMzx51ZpbsUocg==
X-Received: by 2002:a05:6a00:8d5:b0:793:1b79:ee61 with SMTP id d2e1a72fcca58-79387434292mr9650263b3a.22.1760038282171;
        Thu, 09 Oct 2025 12:31:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/24] busybox: patch CVE-2025-46394
Date: Thu,  9 Oct 2025 12:30:47 -0700
Message-ID: <137299edbc47e8a57173ef3c22bcb719d48d5302.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224622

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioning this CVE.
Additionally fix test broken by the CVE fix.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2025-46394-01.patch   | 57 +++++++++++++++++++
 .../busybox/busybox/CVE-2025-46394-02.patch   | 32 +++++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
new file mode 100644
index 0000000000..c95cba3c33
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
@@ -0,0 +1,57 @@
+From f5e1bf966b19ea1821f00a8c9ecd7774598689b4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Wed, 24 Sep 2025 03:28:47 +0200
+Subject: [PATCH] archival/libarchive: sanitize filenames on output (prevent
+ control sequence attacks
+
+This fixes CVE-2025-46394 (terminal escape sequence injection)
+
+Original credit: Ian.Norton at entrust.com
+
+function                                             old     new   delta
+header_list                                            9      15      +6
+header_verbose_list                                  239     244      +5
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 11/0)               Total: 11 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=f5e1bf966b19ea1821f00a8c9ecd7774598689b4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ archival/libarchive/header_list.c         | 2 +-
+ archival/libarchive/header_verbose_list.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/archival/libarchive/header_list.c b/archival/libarchive/header_list.c
+index 0621aa406..9490b3635 100644
+--- a/archival/libarchive/header_list.c
++++ b/archival/libarchive/header_list.c
+@@ -8,5 +8,5 @@
+ void FAST_FUNC header_list(const file_header_t *file_header)
+ {
+ //TODO: cpio -vp DIR should output "DIR/NAME", not just "NAME" */
+-	puts(file_header->name);
++	puts(printable_string(file_header->name));
+ }
+diff --git a/archival/libarchive/header_verbose_list.c b/archival/libarchive/header_verbose_list.c
+index a575a08a0..e7a09430d 100644
+--- a/archival/libarchive/header_verbose_list.c
++++ b/archival/libarchive/header_verbose_list.c
+@@ -57,13 +57,13 @@ void FAST_FUNC header_verbose_list(const file_header_t *file_header)
+ 		ptm->tm_hour,
+ 		ptm->tm_min,
+ 		ptm->tm_sec,
+-		file_header->name);
++		printable_string(file_header->name));
+ 
+ #endif /* FEATURE_TAR_UNAME_GNAME */
+ 
+ 	/* NB: GNU tar shows "->" for symlinks and "link to" for hardlinks */
+ 	if (file_header->link_target) {
+-		printf(" -> %s", file_header->link_target);
++		printf(" -> %s", printable_string(file_header->link_target));
+ 	}
+ 	bb_putchar('\n');
+ }
diff --git a/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
new file mode 100644
index 0000000000..ec17b9285a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
@@ -0,0 +1,32 @@
+From 7378db981d87b4a2264e14d60340a7fb5c67ae59 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Fri, 3 Oct 2025 16:12:56 +0200
+Subject: [PATCH] testsuite/tar.tests: fix test after CVE-2025-46394
+
+tar now sanitizes output and this test needs to expect that.
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+CVE: CVE-2025-46394
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2025-October/091743.html]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ testsuite/tar.tests | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 0f2e89112..48fc38114 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -325,9 +325,9 @@ unset LANG
+ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+-etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.pem
+ etc/ssl/certs/f80cc7f6.0
+-usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
++usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sa??lay??c??s??.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index 1886410dd2..57a5747a48 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -59,6 +59,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42366.patch \
            file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            file://CVE-2023-39810.patch \
+           file://CVE-2025-46394-01.patch \
+           file://CVE-2025-46394-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.43.0


