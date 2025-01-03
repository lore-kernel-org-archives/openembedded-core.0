Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839D8C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.28160.1735901136654706771
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/PXEaxp;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so6725888f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901135; x=1736505935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbcjbTY+Qr7PdplF0hkSPc40Rb8o6CRy0HuIEW/Mb7o=;
        b=a/PXEaxpeg7w0/rSuLmUUFQ4gmlyjJQXa6ijlxupClsgs5I/u/jHAakFr5vRyhh32q
         J80b1b7rQfj9chgNdbIUqEQAWr5d47ZMtFYFnTHNVJW4bE+5/ajMJ9XGLdW1QZ0GQ39i
         7TpFOdQqsVPW9ysBkE0BAEcBGQB5/++7zTmur+mEuXYMXX7K6uqy+Wp5TqpKCjsxvLfW
         sI3X2wP/FlB5kPhT84OnQS+lARNtAd1ikbRqL6lWev0h7l7britMGlFtWiMkedsnKR76
         3emqWZV7aGyio+5id542tNwulq/nzseQjTdrGK2ZvbMDp4HRbAH78mBs6u4H7gj+flTI
         Fm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901135; x=1736505935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbcjbTY+Qr7PdplF0hkSPc40Rb8o6CRy0HuIEW/Mb7o=;
        b=WMdRc5P2JDv0Gb+bXXqyH9kjxoNFIfcGNnGCwPEwmemmVukmvGtNsfiM5TeqB4qSJC
         WDXrwU0gejugDb/FraINbxdyCiVcuxwHTbAN93nWNy4K1B4BoSGpNWIn8xo6qVG1Ain4
         OZQoyYPN90La9HBpyDQYkZgKseukh5qW5WqCSI0D5rsCtggMkg18X12/n8aXX6pxFDsW
         6k+NvC6qlCo1JDzDc9c+3HHpp0EKz1v2ZXdPMh0VFUPXCmyJyL7DV1LKNjrOMBC41Kq5
         S+uJrLPy1fhz1F9y4wUJD53kU82FKzydeMEiK1Ti6pWF2ILXsCzcLndtVzlCnwAP94FV
         tTBA==
X-Gm-Message-State: AOJu0YzWaw2rkbjkGEmXn6x839rLWX5AAIz1ji62wKddGlaLz9Nomw3Z
	idHBRM0kaRDT0kJT2gJ29/5MuIth5QsVnzonSJD04nF4RQ5KrBQfbtJ1aw==
X-Gm-Gg: ASbGncvT2vg1LVGWyE2pRX9FDal4IB2Ap3S0AFZ03h8ca/WlFP61wBbLlyrm6FTgxcs
	H6d4GNdWOIKuO1drGKRsELZGviVUxXg4XL4VQq3spD8r5jS3HctwhOMP5ZIx2qYclcFPqudfI7f
	TVphgqT9kovfEQ1WDzE+L0lJ9foGWOKXxMIiEfy2XtwRFgBdqFqhJTvceTwuA7oDZ8mzUyAFyWn
	5U1aVJggvlCGNdVuVZxI1OpGdYGZwBUoZQxiG6JaPJcfPzCHfYtjG8UcgLtmPQP7aElpaOffhqI
	MmrswPM5L5QXPDlYKg==
X-Google-Smtp-Source: AGHT+IH3PWnNcOe+6zkRcoEWwSEAsrI1Mzs/pyYj/0tjGBlGFqLvfrZ3yoVphsP7leltNy4WHPwC0w==
X-Received: by 2002:a5d:5986:0:b0:385:f47b:1501 with SMTP id ffacd0b85a97d-38a221fa8fbmr38114333f8f.32.1735901134758;
        Fri, 03 Jan 2025 02:45:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/11] kbd: update 2.6.4 -> 2.7.1
Date: Fri,  3 Jan 2025 11:45:19 +0100
Message-Id: <20250103104524.4053846-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209337

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Remove-non-free-Agafari-fonts.patch  | 73 -------------------
 .../kbd/{kbd_2.6.4.bb => kbd_2.7.1.bb}        | 12 +--
 2 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch
 rename meta/recipes-core/kbd/{kbd_2.6.4.bb => kbd_2.7.1.bb} (84%)

diff --git a/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch b/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch
deleted file mode 100644
index de279b55f9e..00000000000
--- a/meta/recipes-core/kbd/kbd/0001-Remove-non-free-Agafari-fonts.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From b757e6842f9631757f0d1a6b3833aabffa9ffeee Mon Sep 17 00:00:00 2001
-From: Alexey Gladkov <legion@kernel.org>
-Date: Thu, 29 Feb 2024 17:38:37 +0100
-Subject: [PATCH] Remove non-free Agafari fonts
-
-Based on legal analysis, we are removing non-free fonts for now. If we
-can change the license of these fonts, we will return them back.
-
-From: Stanislav Brabec <sbrabec@suse.com>
-Date: Wed, 28 Feb 2024 16:47:54 +0100
-Subject: kbd: Legal problems of Agafari fonts
-
-    The data/consolefonts/README.Ethiopic contains a notice:
-    Agafari:
-      Donated by the Ethiopian Science and Technology Commission
-      <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistributed
-      for non-commercial use under Unix environments only.
-
-    According to our legal review, it makes impossible to distribute these
-    fonts as part of any commercial products, and even makes it impossible to
-    distribute kbd sources as part of any commercial product services.
-
-    Additionally, it makes the whole kbd package incompatible with GPL, so the
-    COPYING file (created during build of the tarball) cannot declare GPL
-    version 2. It also violates section 6 of GPL (no further restrictions).
-
-    That is why several GNU/Linux distributions exclude Agafari from the
-    release. To be on a safe side, SUSE even decided to repack any source
-    tarballs before putting it to their servers.
-
-    This was probably reported to the former kbd maintainer about 20 years ago,
-    but nothing changed over years.
-
-    That is why I recommend removing Agafari fonts and removing the reference
-    to them from README.Ethiopic. Alternatively, you can ask the Ethiopian
-    Science and Technology Commission for re-licensing.
-
-Signed-off-by: Alexey Gladkov <legion@kernel.org>
-
-Upstream-Status: Backport [https://github.com/legionus/kbd/commit/b757e6842f9631757f0d1a6b3833aabffa9ffeee]
-
-[do_configure prepend added to remove binary files]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- data/consolefonts/Agafari-12.psfu | Bin 7989 -> 0 bytes
- data/consolefonts/Agafari-14.psfu | Bin 9013 -> 0 bytes
- data/consolefonts/Agafari-16.psfu | Bin 10037 -> 0 bytes
- data/consolefonts/README.Ethiopic |   5 -----
- 4 files changed, 5 deletions(-)
- delete mode 100644 data/consolefonts/Agafari-12.psfu
- delete mode 100644 data/consolefonts/Agafari-14.psfu
- delete mode 100644 data/consolefonts/Agafari-16.psfu
-
-diff --git a/data/consolefonts/README.Ethiopic b/data/consolefonts/README.Ethiopic
-index 7502722..2810797 100644
---- a/data/consolefonts/README.Ethiopic
-+++ b/data/consolefonts/README.Ethiopic
-@@ -14,11 +14,6 @@ Ethiopic fonts:
-      restrictions below:
- 
- 
--Agafari:
--  Donated by the Ethiopian Science and Technology Commission 
--  <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistributed
--  for non-commercial use under Unix environments only.
--
- Goha and GohaClassic:
-   Donated by Yitna Firdyiwek <ybf2u@virgina.edu> of GohaTibeb Associates
-   and may be redistributed without restriction under the GNU GPL 2.0.
--- 
-2.30.2
-
diff --git a/meta/recipes-core/kbd/kbd_2.6.4.bb b/meta/recipes-core/kbd/kbd_2.7.1.bb
similarity index 84%
rename from meta/recipes-core/kbd/kbd_2.6.4.bb
rename to meta/recipes-core/kbd/kbd_2.7.1.bb
index 2331b51e595..9cff855b28c 100644
--- a/meta/recipes-core/kbd/kbd_2.6.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.7.1.bb
@@ -24,12 +24,12 @@ RPROVIDES:${PN} = "console-tools"
 RCONFLICTS:${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
-           file://0001-Remove-non-free-Agafari-fonts.patch \
            "
 
-SRC_URI[sha256sum] = "519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926"
+SRC_URI[sha256sum] = "f167d899d92b56ccf12f6f49355173f93870a95f15d8aeebf5fdcd28a621aca8"
 
-EXTRA_OECONF = "--disable-tests"
+# 'gzip -n' is set due to https://github.com/legionus/kbd/issues/124
+EXTRA_OECONF = "--disable-tests --enable-compress='gzip -n'"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
 
@@ -45,12 +45,6 @@ FILES:${PN}-unimaps = "${datadir}/unimaps"
 
 RRECOMMENDS:${PN}-keymaps = "${PN}-keymaps-pine"
 
-# remove this when upgrading to newer version which has integrated
-# https://github.com/legionus/kbd/commit/b757e6842f9631757f0d1a6b3833aabffa9ffeee
-do_configure:prepend() {
-    rm -rf ${S}/data/consolefonts/Agafari-1*
-}
-
 do_install:append () {
     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)}" = "yes" ] \
     && [ -f ${D}${sysconfdir}/pam.d/vlock ]; then
-- 
2.39.5


