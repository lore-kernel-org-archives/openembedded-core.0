Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD3AC761A6
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 03:11:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.121729.1680664280473188731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 20:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9jCJjTS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id w4so33159180plg.9
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 20:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680664280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBThP8hEAfg+n9oqXfAlAR1Cx8hb+BL0cq6KS4Mjivw=;
        b=Q9jCJjTS4FezTmUsLEKeMw/EANNmEnfL1OICZYg135SJc3LM3j982qLN/Q1RyI+ufw
         uCCeyUWQfgZfLM8PeX1u5Ifr9qvx4xvH/NDxXzwgUvgZDGM9zJ2aV33Vr3Zg1T8tda2w
         mC6sjEYnwSQyUkxI5HnHsTPLc4QJnhOYgojq0hUJzw9jtGJP8YBYx0Zon/LSyj4Suq7Q
         drpIpv0iDjdw3wxpt/Z5QAgSStiII1eXZnCCMulj55Pus81iBDJzPZ/KhbddhbDXYOaS
         hORd9Hqyo9yvZ/zQchYUrOiQq5uz+uvWBCeZp24aI4CJMvw53ABE4ajVrUX+TSxEp8s+
         UfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680664280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBThP8hEAfg+n9oqXfAlAR1Cx8hb+BL0cq6KS4Mjivw=;
        b=OxdcPMabzSGlazsSPSYNuOFQ0ZUASKd0d2A8GtRXDakDk+MKL06VtQG0ghcz+htlvg
         WDQSF1DOREu0TY9tvNh7nHp3n8kbPz1hF01hl1n+qAAR/4/50LLKCMEdecy4FUmV+gO+
         o6zwINAWJxThK31cw6AReavg/W2AiXjjJvhXogZO15bSWidbmnfLeMJjibM6EhSU5BM2
         8tztHgn6D8DlygeqBNOuTHpejr8cb29nRRCIzCj6uNSOVzWPjp7xMFNugH4JpjVPahHN
         h7iRgM3XzM+fWCMb4LDpfk5LxKj0qqAI6MCqXMTAeGMJ31ilC01A8u2Mo4cAsrZkN46x
         zdcQ==
X-Gm-Message-State: AAQBX9fwd0t0O4F8azMg5aH4M9o8jJnwh6zVLSmi4eeP+s8y7iJcY0Vc
	DeWkbf6tCu+lY86AIg8XPXlSalSOnGi/2g==
X-Google-Smtp-Source: AKy350Y1Fxw2M2znnpZBVtAea6fRi2Uc0dtsKdFPtAC6bbYnLrf0aQ8uwEH/ZTiJQvUtzAypUTZorQ==
X-Received: by 2002:a17:903:64f:b0:1a1:c2cb:f44e with SMTP id kh15-20020a170903064f00b001a1c2cbf44emr4001361plb.53.1680664279440;
        Tue, 04 Apr 2023 20:11:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902d70b00b00186a2274382sm8986295ply.76.2023.04.04.20.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 20:11:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gpgme: Reset ac_cv_sys_file_offset_bits on musl
Date: Tue,  4 Apr 2023 20:11:16 -0700
Message-Id: <20230405031117.2576191-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 03:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179720

This is required to nullify whats passed from cached site file
musl-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index 1a7a21f7cc..6ec3090cf9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -70,6 +70,8 @@ FILES:python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
 CFLAGS:append:libc-musl = " -D__error_t_defined "
+CACHED_CONFIGUREVARS:libc-musl = "ac_cv_sys_file_offset_bits=no"
+
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/gpg-error.m4
-- 
2.40.0


