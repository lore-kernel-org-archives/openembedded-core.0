Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516E7EB64DD
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:00:58 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.18764.1687964452259133807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hHI7f5Ic;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9922d6f003cso244549466b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687964450; x=1690556450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQgZZj9XfmIv9OcWKwJssj/pcKNFVXhHB9IZhYH7e6g=;
        b=hHI7f5IcJ3lwQ1/NBpNFwXSdtHfjCVIjbweYbFe4e8bp0igptmLMCAjA8NG16wmkYX
         KEI/1pndV0JGJgJOFddpND5g21PCf4Tbj81Tb8eFz+tbLmY9I+QHRpTVdGyWHhFmIuSf
         BWIE8imPaAw8AA/v5PEyH3sFA98SWLojF1zq/Hqnqtjg7CwlDgjmGOdfdomCnRlVCTpq
         /K94Z6Aqq4QmX5A0BtY6koXsC+FzczMbzJqlgvH+DLELnElQMtBgYDHZ9s7F7cGXY386
         jC0p91W8FSds/WweJWm1HcHeZyqyaeYGkX1P4wiubAa0sa00R7mOZWgOQBUZpO6JxX1X
         h28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964450; x=1690556450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQgZZj9XfmIv9OcWKwJssj/pcKNFVXhHB9IZhYH7e6g=;
        b=lwGnmQNUHBQJsx1oUA+4R9/DNYUshVh+FT8oV6FXrnHv+XObdc8k09wNu/mHsqzDCE
         qyBu3MqWS3rWCjGe+z4kixV8DwavMQRBtha09os4DxkOGh09pjA83EuKVLzVrrTpLsox
         SIqLbX79AcYlaoc0f9MR2ebROVVUZqHc2KXOgveJlZrkcRGs/miqIMxAiBVSZsk0Wgei
         AudQS7T4cecJvhEpQntXzqLJE/yQpjq9FwYfTJFzHbnDe/h6iTcpyyNQrqS5yRVno5Sw
         PGyB2sotVBhWOzd/5/0H3qxnT3jLT5B5PQVyYMGBME6bVx/iaA91a5B1T3aUdFoRznlv
         rVIg==
X-Gm-Message-State: AC+VfDylu1F5FrF1NUOlo79r5EAyK1XlIgFHFFsoVP6316jAVVxhx0J8
	JuqJme5NGZLosXAOvYlXtoDcQ2lBx7BV1A==
X-Google-Smtp-Source: ACHHUZ6d61IZZyyaw8H1YIETRWH9xbcmaxspaK+A+DnNDXAJ8Vmtr4pCeO3seoHy6CpG8SKkZmwhGQ==
X-Received: by 2002:a17:907:3683:b0:987:9823:b9f with SMTP id bi3-20020a170907368300b0098798230b9fmr28555726ejc.28.1687964450528;
        Wed, 28 Jun 2023 08:00:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906720300b009926928d486sm969433ejk.35.2023.06.28.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:00:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] time64.inc: annotate and clean up recipe-specific Y2038 exceptions
Date: Wed, 28 Jun 2023 17:00:43 +0200
Message-Id: <20230628150043.70814-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230628150043.70814-1-alex@linutronix.de>
References: <20230628150043.70814-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183591

Additionally:
- drop pseudo from INSANE_SKIP for 32bit time API check
(pseudo passes the check; it's not clear where the issue may have been)

- move rust exceptions to the cargo class, as the problem
is common across the ecosystem, and needs to be fixed in the
libc crate.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/cargo_common.bbclass | 12 ++++++++++++
 meta/conf/distro/include/time64.inc      | 19 +++++++++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 1ca0be471ce..db54826ddb6 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -174,3 +174,15 @@ oe_cargo_fix_env () {
 EXTRA_OECARGO_PATHS ??= ""
 
 EXPORT_FUNCTIONS do_configure
+
+# The culprit for this setting is the libc crate,
+# which as of Jun 2023 calls directly into 32 bit time functions in glibc,
+# bypassing all of glibc provisions to choose the right Y2038-safe functions. As
+# rust components statically link with that crate, pretty much everything
+# is affected, and so there's no point trying to have recipe-specific
+# INSANE_SKIP entries.
+#
+# Upstream ticket and PR:
+# https://github.com/rust-lang/libc/issues/3223
+# https://github.com/rust-lang/libc/pull/3175
+INSANE_SKIP:append = " 32bit-time"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index a0cee4fad67..bc0c72226ba 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -27,22 +27,25 @@ GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
 GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
 # Pulseaudio override certain LFS64 functions e.g. open64 and intentionally
 # undefines _FILE_OFFSET_BITS, which wont work when _TIME_BITS=64 is set
+# See https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3770
 GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
+# Undefines _FILE_OFFSET_BITS on purpose in
+# libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 # https://github.com/strace/strace/issues/250
 GLIBC_64BIT_TIME_FLAGS:pn-strace = ""
 
-INSANE_SKIP:append:pn-cargo = " 32bit-time"
+# Caused by the flags exceptions above
 INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
 INSANE_SKIP:append:pn-glibc-tests = " 32bit-time"
-INSANE_SKIP:append:pn-librsvg = " 32bit-time"
-INSANE_SKIP:append:pn-libstd-rs = " 32bit-time"
-INSANE_SKIP:append:pn-pseudo = " 32bit-time"
 INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
-INSANE_SKIP:append:pn-python3-bcrypt = " 32bit-time"
-INSANE_SKIP:append:pn-python3-cryptography = " 32bit-time"
-INSANE_SKIP:append:pn-rust = " 32bit-time"
-INSANE_SKIP:append:pn-rust-hello-world = " 32bit-time"
+
+# Strace has tests that call 32 bit API directly, which is fair enough, e.g.
+# /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
 INSANE_SKIP:append:pn-strace = " 32bit-time"
 
+# Additionally cargo_common class (i.e. everything written in rust)
+# has the same INSANE_SKIP setting.
+# Please check the comment in meta/classes-recipe/cargo_common.bbclass
+# for information about why, and the overall Y2038 situation in rust.
-- 
2.30.2


