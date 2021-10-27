Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8D4C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.9299.1635325671586691213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VblfYHZK;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id i9so2900797wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IiSMmMqh4PzdCRUFlkaVK446Y7LLw4wG/f4g2PtZy8U=;
        b=VblfYHZKXW4yi8dEU6hkL7wUkscpx6pcAtOw7LwGQqmd8gDhuw2HokARaRpHhdRERQ
         PAU+E5UOldu+mYIiZwcqMxDeh9C5p1J7YTQtN9JeP7Zuh6TNbgnzkZzBoBRRTQ4ofJ9C
         nqyeRQ+z2ioi6in5c8jMnHJ1F6U/Mk6eqgZDzK28lsYHF8Xvt7QzHYEu7dH5PdTgBGy3
         4Q6xkyHVTbn2vegwGTs9Iq9BFWDayJe/0Z5klFyhwnbjAqEYaGJaYy0cofD5+I2+SkXw
         VheG14nF5zlc9DsPCJNT0P7T565f9KldZ9w5fFyrPSY1WPd2j3/XW2lkC83YMSyQf+Ne
         qSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IiSMmMqh4PzdCRUFlkaVK446Y7LLw4wG/f4g2PtZy8U=;
        b=RMkjQBWAOtBTMTlHPleFRdSKytx6WLBRN90rY3++mshJUipZspeZYoirVSk9rhE+0u
         xkYyHZjueoKJGZdbkq9Ixw0fDvh6yNtbvaEcS1aZRVKC4RPwUHgBjF9jD+0u6gdl0ghb
         kGv1hlgFywhtIdmIstAdtV/cgopC3gwDDZa1mvBCEkU6rlTLjfa5WbkaZ+wvA0oPM9gr
         zHNgMymy87d0EL5EcYgxcPvafAXgKNEti2kVBlMYE5CBIBsLujv4JOGCn/Knb31J6PW6
         QANXKEGyIQ3IdHjkKYZ7Hh0iSUDNJFMI+Jckyojbt1lKhuUmaHCwbIrbAOLZsfycMtYv
         KMTQ==
X-Gm-Message-State: AOAM532db2l0hFsGIOaBA3TEsBsgD4oH49qOelbf+0sRyp8iQDT/Kg6k
	e8V6f2NT3I0sZQJfZppHDNDyfXMknmw=
X-Google-Smtp-Source: 
 ABdhPJzAB4SmnEDHQwmGJCDeLoWEVEW3g/02W9D5JpEOdHY5iSqK7MweHrNh8vPKhlbVlvVZl0+oSg==
X-Received: by 2002:adf:f04e:: with SMTP id
 t14mr34067126wro.267.1635325670242;
        Wed, 27 Oct 2021 02:07:50 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/30] vte: upgrade 0.64.2 -> 0.66.0
Date: Wed, 27 Oct 2021 11:07:24 +0200
Message-Id: <20211027090736.2546759-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157494

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...rrectly-substitute-gtkdoc-qemu-wrapp.patch | 24 +++++++++++++++++++
 .../vte/{vte_0.64.2.bb => vte_0.66.0.bb}      |  5 ++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
 rename meta/recipes-support/vte/{vte_0.64.2.bb => vte_0.66.0.bb} (91%)

diff --git a/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch b/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
new file mode 100644
index 0000000000..c69a52e5d0
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch
@@ -0,0 +1,24 @@
+From daa30d0039397a735d49ea535305ed0bc5f9d73b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 26 Oct 2021 09:38:42 +0200
+Subject: [PATCH] Makefile.docs: correctly substitute gtkdoc qemu wrapper
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ doc/reference/Makefile.docs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/reference/Makefile.docs b/doc/reference/Makefile.docs
+index b18f0a4..da18440 100644
+--- a/doc/reference/Makefile.docs
++++ b/doc/reference/Makefile.docs
+@@ -233,7 +233,7 @@ INSTALL_DATA = $(INSTALL) -m 644
+ 
+ GTKDOC_CC = $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(CPPFLAGS) $(CFLAGS)
+ GTKDOC_LD = $(CC) $(GTKDOC_DEPS_LIBS) $(CFLAGS) $(LDFLAGS)
+-GTKDOC_RUN =
++GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
+ 
+ GTKDOC_CHECK_PATH = gtkdoc-check
+ GTKDOC_REBASE = gtkdoc-rebase
diff --git a/meta/recipes-support/vte/vte_0.64.2.bb b/meta/recipes-support/vte/vte_0.66.0.bb
similarity index 91%
rename from meta/recipes-support/vte/vte_0.64.2.bb
rename to meta/recipes-support/vte/vte_0.66.0.bb
index a79f2e4451..6676b7feeb 100644
--- a/meta/recipes-support/vte/vte_0.64.2.bb
+++ b/meta/recipes-support/vte/vte_0.66.0.bb
@@ -19,8 +19,9 @@ GIR_MESON_OPTION = 'gir'
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "2b3c820b65a667c1d8859ba20478be626d1519cc3159dac25f703330c6d07e18"
+SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
+            file://0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch"
+SRC_URI[archive.sha256sum] = "d0813ac00fb1d74d88851e765f755d496c83e097097358ea1baadb38b37b7b33"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.20.1


