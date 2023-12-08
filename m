Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB584C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.11139.1702002815925041324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rphJJlML;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d2e6e14865so6009385ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002815; x=1702607615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7VFDBjtjaVmrJ6UjzV2T4LIHWf7mIqdBLMiLsb0Sm4=;
        b=rphJJlMLDZLmMNPl7uCboJFqYc8hkjiZ5/JJn83xogLf1vkNt25pgF6t9eiaCUNfDm
         kfdw2VViDw9kwXK5WtSr4724lZXK9irEq3pfzphGegCDvhbx3BE9mnY0DfRDC3FBKcdo
         Ymxu+JxFGcZzJHy7wsxXa6u2tvyfdUSFgYOwS79z/CTMIehjyt03GuH+tQ2K41d5psia
         dCeMXGZ3IpV/h4seOSuWXnRfNti1vIx4nlU+mKwfB/lfI3rpcMmJ9rNO0cVeKVveP9zq
         OegD6FmLRa+nPROsRo4QD62ArOYFiDQdwcgQW/Bs0KmdrhBy+6XdUxWxuUV66XGGz8Tp
         6Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002815; x=1702607615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7VFDBjtjaVmrJ6UjzV2T4LIHWf7mIqdBLMiLsb0Sm4=;
        b=TzqGdsy0cfv1c7DtV1MPBMUINwXQd2BQCrZ/szKoqFkqRJ9rP2Z66ppgQknbemtPd0
         wZ8xpD5p9lbPVr5AfiOroiCTVTnEtxNi7kQAtpHGScDk26k11anyCAFW7DplyMLKOSHk
         FxnEqqLy4fuB1YGbv7yYeO/+c+/qz+iND5CUJow0UWYJr227UU5uhc9ug4/LRamGOFa4
         TuCHH7vcTU9vV/7LJGNc+ms1Kk89MWu6/FpME4RYH6TFjflG+tVAmcRthv/p+z77d3h0
         hFx+AyApFR44SbJOLJFlbi2154URvGbgIGppaEOY6aXiu37reqRNQSsmTkpFg9OeJFDO
         qS7w==
X-Gm-Message-State: AOJu0Yx5fE9HUwrQXufGDlJl0DmmFJ7knW4iVwbrAOk7ompyP0TpkuK6
	zK+Iv9NWZwdPVUSv27PImFd0SDoX8zwtvpXg7Lo=
X-Google-Smtp-Source: AGHT+IGU7MQFSheWUrSVeb/uAH95N/QTyYTlqOPDGlYytBx29Ine21S99DeGJEoJPpcV0brVR1Cvqg==
X-Received: by 2002:a17:903:555:b0:1d0:6ffd:6e53 with SMTP id jo21-20020a170903055500b001d06ffd6e53mr3093249plb.75.1702002815067;
        Thu, 07 Dec 2023 18:33:35 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c
Date: Thu,  7 Dec 2023 16:33:07 -1000
Message-Id: <0dc086b37b1c333adf99c01ce4ecb717df48d6f9.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191993

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2022-33065.patch          | 46 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
new file mode 100644
index 0000000000..c5fba4d6b5
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
@@ -0,0 +1,46 @@
+From 0754562e13d2e63a248a1c82f90b30bc0ffe307c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -100663296 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c]
+CVE: CVE-2022-33065
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 0b1b414..575683b 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames * psf->bytewidth) ;
+		}
+	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->sf.frames * psf->bytewidth)
+-		psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend = psf->dataoffset + (sf_count_t) rows * (sf_count_t) cols * psf->bytewidth ;
+
+	psf->datalength = psf->filelength - psf->dataoffset - psf->dataend ;
+
+--
+2.40.1
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index f6ea585e34..0c654fd853 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -11,6 +11,7 @@ LICENSE = "LGPL-2.1-only"
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
            file://noopus.patch \
            file://0001-flac-Fix-improper-buffer-reusing-732.patch \
+           file://CVE-2022-33065.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.34.1


