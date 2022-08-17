Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC9EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:37:34 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.27446.1660736253150143242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NMAHlm53;
 spf=pass (domain: mvista.com, ip: 209.85.216.49,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso1603839pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qYmdcxEt1O4EIHgBqg6f/f6l83A2iV47N7sZzSbnzJg=;
        b=NMAHlm5329SB6nKGi12CtILos+oPgzevKp8BTqExzHpn/Kz0iOcZbxR6WSIdI7+Cgx
         OCdHsgI0d0ddRaGfk/YGlr086VaIrwxCFQLhbUWCQS+4/Ope8B/XImlGiyBRelkod6Ty
         nG9nCHF1CW+Do0p+3yPlasMTjNGqEU3JpcVSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qYmdcxEt1O4EIHgBqg6f/f6l83A2iV47N7sZzSbnzJg=;
        b=il+kFVIpHsb81W3ivhPyPNjhQBrmWKxJ41lrFWbbi1o1UVpZvhDR6HNSSE9AqyvLJm
         OE3ZvjH0S+E8icNi1X/sJy3pPHTrgHSK4bjAdtMoWLt/mFBS3NqjWI+Tz2VMVrFSHYe4
         XiErXCfcuUe22nCacXu2Jfc2Uf8KNRfTL0QO7g0ihzmCxR+V7CcbNDYpdQg8KUt9P/b4
         VZX66TKIK/PWr1WaTRsqXlrH07+ue+7FSm74Luhfe2b1wmRJuWxQczBY6jc/cG/OtE+Y
         /p9iwRPW4YJA/HpD4IGERo1gOlNC0vGkDk/AsoEVcFhw7lgq5UTIj6XCKuF+2REE1JEl
         ncWg==
X-Gm-Message-State: ACgBeo0Bnk20ik37QEYReEQUkpIptT+GwdAY2UAHm1y0fNc1BK/XNsgm
	ahmZmYBVy5BK+toy6da2oYwErWXx2Kb5Qw==
X-Google-Smtp-Source: 
 AA6agR7XYGrgGnL1GlJ2rjyPuT+foaFuXes9K3qnb6IFfWcRo0ylDEgjZ0Ri1gS1x5Jf3n5aXKz6WA==
X-Received: by 2002:a17:90b:2789:b0:1fa:c17c:92fa with SMTP id
 pw9-20020a17090b278900b001fac17c92famr78478pjb.197.1660736252447;
        Wed, 17 Aug 2022 04:37:32 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.165])
        by smtp.gmail.com with ESMTPSA id
 b189-20020a62cfc6000000b0052d1275a570sm10238034pfg.64.2022.08.17.04.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 04:37:32 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 17:07:26 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] zlib: CVE-2022-37434 a heap-based buffer over-read
Date: Wed, 17 Aug 2022 17:07:25 +0530
Message-Id: <20220817113725.2012263-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 11:37:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169477

Source: https://github.com/madler/zlib
MR: 120525
Type: Security Fix
Disposition: Backport from https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
ChangeID: 94d9b7d372b83cc1022c0a15046c5449d39208c3
Description:
          CVE-2022-37434 zlib: a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../zlib/zlib/CVE-2022-37434.patch            | 44 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
new file mode 100644
index 0000000000..d29e6e0f1f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
@@ -0,0 +1,44 @@
+From 8617d83d6939754ae3a04fc2d22daa18eeea2a43 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 17 Aug 2022 10:15:57 +0530
+Subject: [PATCH] CVE-2022-37434
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166bece1 & https://github.com/madler/zlib/commit/1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d]
+CVE: CVE-2022-37434
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Fix a bug when getting a gzip header extra field with inflate().
+
+If the extra field was larger than the space the user provided with
+inflateGetHeader(), and if multiple calls of inflate() delivered
+the extra header data, then there could be a buffer overflow of the
+provided space. This commit assures that provided space is not
+exceeded.
+
+ Fix extra field processing bug that dereferences NULL state->head.
+
+The recent commit to fix a gzip header extra field processing bug
+introduced the new bug fixed here.
+---
+ inflate.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/inflate.c b/inflate.c
+index ac333e8..cd01857 100644
+--- a/inflate.c
++++ b/inflate.c
+@@ -759,8 +759,9 @@ int flush;
+                 if (copy > have) copy = have;
+                 if (copy) {
+                     if (state->head != Z_NULL &&
+-                        state->head->extra != Z_NULL) {
+-                        len = state->head->extra_len - state->length;
++                        state->head->extra != Z_NULL &&
++                        (len = state->head->extra_len - state->length) <
++                            state->head->extra_max) {
+                         zmemcpy(state->head->extra + len, next,
+                                 len + copy > state->head->extra_max ?
+                                 state->head->extra_max - len : copy);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index f8bcc0abcf..f768b41988 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://CVE-2018-25032.patch \
            file://run-ptest \
+	    file://CVE-2022-37434.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.25.1


