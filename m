Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44157FB3CF1
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:40:28 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47243.1774863622967247618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=HRV1BR+H;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b97a9044741so48817066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774863621; x=1775468421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGwRXem5HXLAUKq99a+Vv/5j50/ia6ZLK5Kr/f+yvAw=;
        b=HRV1BR+HlRwPL733/QX+YVdjcsMKmvI3EAtoSgHXF1m4BMYV4PAip5K4Ue2PFWK298
         0DuSKt3ct9IV+OGCuZobAeJYMEobRotk+080XuN8sc0O5L7aCnD0gxGW+8H8aRtJna/4
         taH6Rf+EIKqfWLdF+/fKHayfDzh7Na8EnYkPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863621; x=1775468421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGwRXem5HXLAUKq99a+Vv/5j50/ia6ZLK5Kr/f+yvAw=;
        b=T7ute9MWwIX80nZ3mBmIxcpawFMbF1nAzM0fENTQCHcQ9BP4NyIcZVUngUAurjsG7N
         mBQ29w3u69bxiGwZKkYa2RdUqWjjJQDfYKRDhu9wC8c6HgrhPwMY4/vFxM5Bc6dsiqlC
         vFvjfHJv2Hsqusyes3DNTIvZVGTOnF806K+BUscRcWgziLPkPzzPPQmkmPwgIcMxpvkQ
         nQMBmUz4YhtoUtyfUcMXIBXrljE/8VGIKgSAcRJ1YMiToG7U8xaUL81KyUiT/Yyl3VZ2
         7DeJbzqZhry5qiPvZCaepPmsBgmXxgs0G64JVAUj9kcMd74ctUUDAA59aNeUibh+mpY1
         oGuQ==
X-Gm-Message-State: AOJu0YxzhT1tH4EKTa8Eym6AddvKLtRHe+sLYnTAd9IrxJDEvgWuh9p8
	Z+59EY2hf0dxsVS450JZ4qoQTSGiqz6X3/FHkgjl9NBW64B1BgwRSVXWjWzBpHSrth17b78FStf
	/yWwnONQ0uw==
X-Gm-Gg: ATEYQzwRWQEjqgTDhoeXQ7at5oIz1NG0gVRH7NBSLcfnIm0FouPfp/JFB6UPu9HyDOz
	gqR56C7R5BtMbyKnSyo6it3uBg7yHVsc/nTSqEDApT1Y+nA1OpfF2vRI11awSr2B7Yo0mAx56nn
	BmfOgnnLIvVD/7PFCFTcH2URU7mQtnaRbLDJmN/rF7tlUUpvM8jgKewexQmSAp+YVO+io1NkTGs
	l35nfNX/zIF82vQFdrdm5Amj0mGyEq/ZV8G3/Fe1usB/3oneAGQ62rFbeKYE9zJTkhnrsH2kalX
	xuw5wzhRwb8rdt5tmL7R/1itB9MVkhBqc111Hixl/axGUXnDBj3/jDJ0de5Rb6uA95AzgMZ+kFk
	uSMHXGg3oEogfJjRSAvuSO15GrABxmSyz157xIqp8M+VyoklOCCWyWCF1w0GGvvMjLnBBy3zYoo
	G8FTQTUOn9+rZSIGvm12nnMOIcmIH3mPiiCqshqXsh2x03AuNM4B35yVY9T7ZdlCmg5K/IRGrQp
	rhu70hRqHipkKw1H1Bv+CcbN2YAvrrgbYrrUIXNDFR7QJQILB2/MqkY/LmAfvOGlBp8znxTv2Gv
X-Received: by 2002:a17:907:60ca:b0:b99:1070:763b with SMTP id a640c23a62f3a-b9b508d64d4mr292615666b.5.1774863621219;
        Mon, 30 Mar 2026 02:40:21 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225327sm266108666b.58.2026.03.30.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:40:20 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v6 4/7] librepo: upgrade 1.20.0 -> 1.21.0
Date: Mon, 30 Mar 2026 11:40:13 +0200
Message-ID: <20260330094016.102637-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
References: <20260330094016.102637-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234210

While librepo does not have a 1.21.0 tag, commit
be788e8bb0c1dc53167e9e0fbe465ec14dac3eb1 bumps 1.20.0 to 1.21.0 in both the
VERSION.cmake and librepo.spec files. An issue is raised here to officially
tag the release: https://github.com/rpm-software-management/librepo/issues/368

Other changes:
  - Rename patches to be in the order they are applied
  - Add backported 0002-Fix-creating-run-gnupg-user.patch

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...ain-PYTHON_INSTALL_DIR-by-running-p.patch} |  0
 .../0002-Fix-creating-run-gnupg-user.patch    | 44 +++++++++++++++++++
 .../{librepo_1.20.0.bb => librepo_1.21.0.bb}  |  7 +--
 3 files changed, 48 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/librepo/librepo/{0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch => 0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch} (100%)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
 rename meta/recipes-devtools/librepo/{librepo_1.20.0.bb => librepo_1.21.0.bb} (78%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
similarity index 100%
rename from meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
rename to meta/recipes-devtools/librepo/librepo/0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
diff --git a/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch b/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
new file mode 100644
index 0000000000..03d3032678
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0002-Fix-creating-run-gnupg-user.patch
@@ -0,0 +1,44 @@
+From 9eff2fc7097bb2de44c258e8ce82f81cbab7f23c Mon Sep 17 00:00:00 2001
+From: Petr Pisar <ppisar@redhat.com>
+Date: Thu, 27 Nov 2025 17:31:25 +0100
+Subject: [PATCH] PGP: Fix creating /run/gnupg/user
+
+e206603a18a6ca8eaa82caedf02004ea3cca2969 commit ("PGP: Enable creating
+a UID directory for GnuGP agent socket in /run/gnupg/user") added
+a non-default -DUSE_RUN_GNUPG_USER_SOCKET=ON CMake option to create
+GnuPG agent socket in /run/gnupg/user directory.
+
+However, because of a typo in preprocessor condition, the the option
+had no effect and librepo always created /run/user/$UID.
+
+This patch fixes it.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/librepo/commit/9eff2fc7097bb2de44c258e8ce82f81cbab7f23c]
+Signed-off-by: Petr Pisar <ppisar@redhat.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ librepo/gpg_gpgme.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
+index 136f25e5..89b1b98a 100644
+--- a/librepo/gpg_gpgme.c
++++ b/librepo/gpg_gpgme.c
+@@ -57,7 +57,7 @@
+  *
+  * We remedy it by choosing the label according to a default file context
+  * policy (ENABLE_SELINUX macro) or by using a different path supported by
+- * some GnuPG configurations (DUSE_RUN_GNUPG_USER_SOCKET macro).
++ * some GnuPG configurations (USE_RUN_GNUPG_USER_SOCKET macro).
+  *
+  * Since the agent doesn't clean up its sockets properly, by creating this
+  * directory we make sure they are in a place that is not causing trouble with
+@@ -71,7 +71,7 @@
+ static void
+ lr_gpg_ensure_socket_dir_exists()
+ {
+-#ifdef DUSE_RUN_GNUPG_USER_SOCKET
++#ifdef USE_RUN_GNUPG_USER_SOCKET
+     const char *templates[] = { "/run/gnupg", "/run/gnupg/user", "/run/gnupg/user/%ju", NULL };
+     const mode_t modes[] = { 0755, 0755, 0700, 0 };
+ #else
diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
similarity index 78%
rename from meta/recipes-devtools/librepo/librepo_1.20.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.21.0.bb
index 6557dda43a..d65567c14b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.21.0.bb
@@ -5,11 +5,12 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=${PV} \
-           file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
+           file://0001-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
+           file://0002-Fix-creating-run-gnupg-user.patch \
            "
 
-SRCREV = "363cb70c6548be900832bc9b18ced3e7569da15a"
+SRCREV = "be788e8bb0c1dc53167e9e0fbe465ec14dac3eb1"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.53.0


