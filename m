Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71405C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:25:20 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8902.1784193908140197318
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 02:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UgqZb4gZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceaf8a1265so57823215ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1784193907; x=1784798707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTQEp/NwWIP1z5JBPly07O6iEb6thRi6yk7DJsmS1fw=;
        b=UgqZb4gZ2EHO72Mrna1VS6bmNhS6IhTp5CEGm8dujxkNTJE5Bo6oCnNECfklJ/9Tc3
         czbfBM1TwUtwJbPd1SbvZUJR1F3LPUt0Uy0uNq1UVJR+cn8+gEaIe6gN8tP+xsWWcmWL
         p8ezmB8iDPjnaU92IAqZ9Pj7EUrBmRcmNBN7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193907; x=1784798707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTQEp/NwWIP1z5JBPly07O6iEb6thRi6yk7DJsmS1fw=;
        b=cgdZKYvi0VtuPbBR/7j78OV80OTpdHLMUrluG5UlepXg/e6d4hRtRRtQz6FuFB7y0m
         4atvAbh5n7KDHmXu/4Z+qIjCKRUVql929gszFk/Ifqv5Aq7lJb09DI3Nf6n4kUXLvg6z
         BRIgY6cjMj9G0Cq7ou0N/ZwpAm2AeIVOzaj3dhn9+zCKgfdllKywf2XN8F21260ze3YA
         BFNd4WSElFWiO/XFCnKdtaadeuEgTb0eoH53OVgvELMKC6ZgmzIOuecLYEwSELBBbhWO
         y67qmacvRPkFGhZzxmrdjGaD5Mkg7+e7lAxjBXfStdXLSRewAcawSnZRfRiExJYrkrky
         iomw==
X-Gm-Message-State: AOJu0YwLJOV6JCmiL8rGG3VuXUDBMbO/qq0wJ8NVqK5fKTx4epjNljw2
	RVpA9IMPiJULou+Pvl444je+1+MyMqowrLBEIRBryd1wAN41amot2czp9/vNWzUOCgqGbXe6Xn9
	5fyabYY4=
X-Gm-Gg: AfdE7cmajXllMv4VefeBzE0NhBCi21phDgikGZAv51kNFvER401pv5c8ue0fGT1sc5N
	ZiEwN44KhLC1wjDaj0eKuBZBaVh8x+a+H4PpVkV69gsqIiZ6r47XtjRmtXMPlFsDGgaQFZCKs0k
	yiC/xPxxxKOPoS3DZMetQbL2jCFH54pQkDaP4fxBHjG/0ef9J99BTR9W2Dyx1nkyGezmIXhgBj0
	7z0xlKsMGSnTJAcyp54Ei9HW5Bihq3Ai2b/rtlQfhX2p+HcnSWqqJKNJ07JvaoAhorkIB6uYdUA
	qE1Y5SN9trKzCvYbYMBG4wfai6Az+6LQbRxH8J9ZYEi0lKnkoeilNgvpuIl+OJ7jg7hFBBX3mz0
	4dhqCUmR8oWT+p06GGHHk//eOeVU17uu5lFGkmdD+VqNGLs6jU31DoYD5iEtY/GOK5i1neUiUKq
	DHLQrdo0AvSsE=
X-Received: by 2002:a05:6a21:329d:b0:3bf:a638:4371 with SMTP id adf61e73a8af0-3c357313267mr11934271637.10.1784193907329;
        Thu, 16 Jul 2026 02:25:07 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.44.47])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e530689sm9073309eec.10.2026.07.16.02.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:25:06 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCHv2] pinentry: upgrade 1.3.2 -> 1.3.3
Date: Thu, 16 Jul 2026 14:52:56 +0530
Message-Id: <20260716092256.10353-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241073

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
[1] https://github.com/gpg/pinentry/compare/pinentry-1.3.2...pinentry-1.3.3
[2] https://github.com/gpg/pinentry/blob/pinentry-1.3.3/NEWS

Note: small modification to libassuan_pkgconf.patch

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py                    | 2 +-
 .../pinentry/pinentry/libassuan_pkgconf.patch                | 5 +++--
 .../pinentry/{pinentry_1.3.2.bb => pinentry_1.3.3.bb}        | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-support/pinentry/{pinentry_1.3.2.bb => pinentry_1.3.3.bb} (93%)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index ebaf01f777..3e0bd6f4ec 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -155,7 +155,7 @@ class OEListPackageconfigTests(OESelftestTestCase):
     def test_packageconfig_flags_option_all(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
         expected_endlines = []
-        expected_endlines.append("pinentry-1.3.2")
+        expected_endlines.append("pinentry-1.3.3")
         expected_endlines.append("PACKAGECONFIG ncurses")
         expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
         expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
diff --git a/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
index fbd370d9fd..4ae7641c48 100644
--- a/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
+++ b/meta/recipes-support/pinentry/pinentry/libassuan_pkgconf.patch
@@ -1,5 +1,5 @@
 From 1bf04756b90832494020c39661ea944a0b11204f Mon Sep 17 00:00:00 2001
-From: Armin Kuster <akuster@mvista.com>
+From: Siddharth Doshi <sdoshi@mvista.com>
 Date: Thu, 22 May 2014 10:50:00 +0100
 Subject: [PATCH] libassuan: Improve pkgconfig support
 
@@ -9,6 +9,7 @@ the libassuan recipe for libassuan.pc generation.
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
  configure.ac    |  4 +--
  m4/libassuan.m4 | 94 ++++---------------------------------------------
@@ -51,7 +52,7 @@ index a2eb5d9..897f407 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libassuan --exists; then
 -      LIBASSUAN_CONFIG="$GPGRT_CONFIG libassuan"
 -      AC_MSG_NOTICE([Use gpgrt-config as libassuan-config])
diff --git a/meta/recipes-support/pinentry/pinentry_1.3.2.bb b/meta/recipes-support/pinentry/pinentry_1.3.3.bb
similarity index 93%
rename from meta/recipes-support/pinentry/pinentry_1.3.2.bb
rename to meta/recipes-support/pinentry/pinentry_1.3.3.bb
index a5c8d2258a..325a75a7cb 100644
--- a/meta/recipes-support/pinentry/pinentry_1.3.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.3.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-find-gpg-error-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "8e986ed88561b4da6e9efe0c54fa4ca8923035c99264df0b0464497c5fb94e9e"
+SRC_URI[sha256sum] = "c2970f16d6afb66ecddfca767d743936c86239bff936eed7fd7597a678414b63"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


