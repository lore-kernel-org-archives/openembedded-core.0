Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86F1EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 15:09:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.550.1687878551817152189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 08:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZIuC4OQc;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-98e39784a85so495620166b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687878550; x=1690470550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib6pcEANslq3P9lrzRhSBt2Im1RCoJNzxjNL+huJEEE=;
        b=ZIuC4OQcEqf3xZPR2Lkfn4XrzJZKb/OlhQo5yeIgBXMfTcRRyRbJGqJUrsHeDPDPxC
         e8nPqn5DWhnJuXcWeTJ2Z3JNBeYdOxSgPIUA12aOVSwVWHmgHNJNIDRyw9p229nyiuQT
         6JchTvzS/pDRHp0agDSTjlNzKjf1Q3GyeLgm1pzflFfNqQTSyvWtKrJ2T9ZWiPpjcdk1
         AJsCLfxW9hBKPvSRw6FRttUOCCBFd4atbQJzZC9m98Nrx5L5ROMgPOZCcfEEASVY+kHG
         lDBT19SUqh6kRWzNev8hJNckLn0jTOa6SXkTz0wkUrjEbJ/mOMMjC9hPqLO+NI1uxXBI
         l/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687878550; x=1690470550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ib6pcEANslq3P9lrzRhSBt2Im1RCoJNzxjNL+huJEEE=;
        b=YnR0/8nW9jYr9X4efjzp1TZC9TfLjzCNUksHxyjh1qk4JM7ax+5KkB9vuPZEOIztbQ
         GxmNAgHHKCxpIpdtaRw9c/5Qtvfy30RLkP9zD1MbJgDinxYRj9ylpDqjat6uPJRvvRI0
         jlJHl8CJFPoOaSMLNxQCvS0haWMenXg3todd2K2w2CSehpmdWh/usvI+4l4GrltDZ997
         3Pz73bkcptRE/zPdTzEHVb4gBynIVZlW0jky1hSTg4qxmd8gWpaYBJ88xy45e3t/moie
         jdZ7sfrDtUSuzTOL76X50Kpy+6MNOlWgCQ5qYASL0eaaOnENYP3KiLdHBrHK1PBCQKlw
         +f3g==
X-Gm-Message-State: AC+VfDzfjA73Sg6eF4blV/a/Fn48n++Tuf6yJKaZETnGjGOiGWI044Rs
	pQGkl96qAZ94hsNi9r6qW2sN05q1boaeiw==
X-Google-Smtp-Source: ACHHUZ6XgTOzYoDZyC4Er8xXbzKVtIQDbmVGDNMhqnWu7kxOYOgIqBy9WcwDqRNd/9JIz/rpoq/JdQ==
X-Received: by 2002:a17:907:6e18:b0:98f:450e:fc20 with SMTP id sd24-20020a1709076e1800b0098f450efc20mr6684431ejc.17.1687878549616;
        Tue, 27 Jun 2023 08:09:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z18-20020a1709067e5200b0096f7500502csm4626373ejr.199.2023.06.27.08.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 08:09:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] time64.inc: annotate and clean up recipe-specific Y2038 exceptions
Date: Tue, 27 Jun 2023 17:08:59 +0200
Message-Id: <20230627150859.1895109-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183491

Additionally:
- drop pseudo from INSANE_SKIP for 32bit time API check
(pseudo passes the check; it's not clear where the issue may have been)

- move rust exceptions to the cargo class, as the problem
is common across the ecosystem, and needs to be fixed in the
libc crate.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/cargo_common.bbclass |  4 ++++
 meta/conf/distro/include/time64.inc      | 26 ++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 82ab25b59c5..dea03a004ba 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -170,3 +170,7 @@ oe_cargo_fix_env () {
 EXTRA_OECARGO_PATHS ??= ""
 
 EXPORT_FUNCTIONS do_configure
+
+# Please check the comment in meta/conf/distro/include/time64.inc
+# for information about the Y2038 situation in rust and this setting
+INSANE_SKIP:append = " 32bit-time"
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index a0cee4fad67..4edd6d87308 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -27,22 +27,32 @@ GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
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
+# gets the same INSANE_SKIP setting. The culprit is the libc crate,
+# which as of Jun 2023 calls directly into 32 bit time functions in glibc,
+# bypassing all of glibc provisions to choose the right Y2038-safe functions. As
+# rust components statically link with that crate, pretty much everything
+# is affected, and so there's no point trying to have recipe-specific
+# INSANE_SKIP entries.
+#
+# Upstream ticket and PR:
+# https://github.com/rust-lang/libc/issues/3223
+# https://github.com/rust-lang/libc/pull/3175
-- 
2.30.2


