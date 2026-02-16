Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F42E63F15
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 13:34:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19365.1771248853713698892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 05:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUZaA+s7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48371bb515eso35603655e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771248852; x=1771853652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93aZ4TYQQ6VIQvMiDO1i3QgxAW/Cv5XOS7aSoFtM0do=;
        b=bUZaA+s70Edmn/e2OJwAJIfMGTCZ1NqLH62DVLL9lSxc3Hbn+EcJsRZR0HykNjbo8H
         oD72OtbV1RImoRMOLC4EurJ/WPFnN8kZ7Qdhz/daMwTQEpgJmmlfCfH7WS7VBTojX1BJ
         36+8sMm2I0ht+qDIBHYZPwpebGZHQ9xXlbrLWoClV1LCDQuEkrB7l+R5giukc599MBN9
         sltQHB8IcrXKCpqFKxApu+pCAkeUwR8brOC7WSJGDdyzkCxMeTvdXppYha+hRUdlLAFM
         VQ8nSAm2Kok3kkPofVRCpe1s5ETQ8XCZ8Ollc2B4BH7UVcw4puYwv5sg3/js7CVSPBRY
         Wt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771248852; x=1771853652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=93aZ4TYQQ6VIQvMiDO1i3QgxAW/Cv5XOS7aSoFtM0do=;
        b=mAkWopNmV5deOOcQni1FMAQi7eENRJgjlw6PYr4itpEpj15Dhv7FcvZZAgKLm3gr4B
         0a2cCIiBqtjN+HT7cfey6ckhO44ALqlRF1DmSFOml17xHDdnXmUzRpGO1ourlq2o5W/i
         U465E4cnzj+F5isiPvAlHhbql7msIZhV8A+orqCkNf5s2lXkqZmK30Qz1OYNqZ6Mzwuu
         SMELXb8y4iIOUQO1jZ+l3TT9RfYTTYPlp2jYxtiqnrHaNqOILBC5QVBcTGkiqvk9HEW6
         GSmyGU38lD1O2t8SR12wON3nN08emPPcRrHxrVfqsduyseTtCLfevu0uCbILpCnGLkEm
         xcqg==
X-Gm-Message-State: AOJu0YztSzP0o1J0qZxRG1HGPSprN/SshuQ04B6KYzwDpkC0NZrTneab
	8xCXoK/djIFnZ3gVRHYqRuExxJ+1wBui6RzFQC0k0aCS1hGzzIsxl+Y1ebUulA==
X-Gm-Gg: AZuq6aLKEjYijxb8gTRyiDvXJGn3VSE2lUJ780UcZMEWzwN9mW5y+gK+kSSQwC23bX1
	PWv+cF38LkX5XsvoJeiKTKqyCWbdRxkmIWWjPOUFDQqcTzcuY5KeNlO1iGl7ZspsohuteQSz2qy
	SjWnbvLxWuG8GEMAQ6emSNumUUZ7fP69ksOV/vXFmRD0Qdifv1ZKA04bJk/Xa/DBIOhs+Om/pEh
	pkiljrsKA727P7u8NTluILgRmLv29nQrMqQ7j6npNZT0vIjpDee6klwgL8lE7riAWyHzxVK/XYA
	dJe5smC1PU3PJxbVtLC8tMwKIrwjqmoxrHrGLGBr8QSNB3b6anPPnRuqeRBUcu3BvMopVM8Ovdo
	n4/M3LuKn1sPD6GbAJp2Ww3vStI2rGnzJEv6o+HClf2Y+Om0INIao4B9fjBF+N5T4FH+2fHB1jk
	uZ2Jhpr3U9ILVanrEg+3aktG1kdmwJbWnUzdu/RbIlJazZB5OQtFeuuxWrsqobnM7ufuXebw==
X-Received: by 2002:a05:600c:c8d:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-48373a7b3f1mr157273785e9.37.1771248851898;
        Mon, 16 Feb 2026 05:34:11 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm340037485e9.4.2026.02.16.05.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:34:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/5] time64.inc: clean up and add upstream tickets where issues remain
Date: Mon, 16 Feb 2026 14:33:50 +0100
Message-ID: <20260216133351.1034740-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216133351.1034740-1-alex.kanavin@gmail.com>
References: <20260216133351.1034740-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 13:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231201

From: Alexander Kanavin <alex@linutronix.de>

Most issues were resolved via upstream version updates that bring in
needed fixes:

glib-2.0 update to 2.78.0 that includes:
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3547
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3550

curl update to 8.3.0 that includes
https://github.com/curl/curl/pull/11610

util-linux update to 2.39 that includes
https://github.com/util-linux/util-linux/pull/2430
https://github.com/util-linux/util-linux/commit/3ab9e699a8d90f55e0447516b7e05a8686180467
https://github.com/util-linux/util-linux/pull/2435

glib-networking update to 2.78.0 that includes
https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/241

python3-cryptography update to 42.0.0 which resolves
https://github.com/pyca/cryptography/issues/9370 via
https://github.com/pyca/cryptography/pull/9964

perl update to 5.40.0 which includes
https://github.com/Perl/perl5/pull/21379

python3 update to 3.13.0 which includes
https://github.com/python/cpython/pull/118425
python3 update to 3.13.1 which includes
https://github.com/python/cpython/pull/124972
python3 update to 3.14.0 which includes
https://github.com/python/cpython/pull/119401
https://github.com/python/cpython/pull/125045
https://github.com/python/cpython/pull/107594
https://github.com/python/cpython/pull/125104

tcl update to 9.0.0 which includes
https://github.com/tcltk/tcl/commit/4ca61724c554f02d90a0655da81372bfbb34f70d
(tcl8 recipe has a simple backport of this)

dbus update to 1.16.0 which includes
https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/444
https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/289

openssh update to 10.0p1 which includes
https://github.com/openssh/openssh-portable/pull/425
https://bugzilla.mindrot.org/show_bug.cgi?id=3684
https://marc.info/?l=openbsd-bugs&m=172561736524815&w=2
https://lists.mindrot.org/pipermail/openssh-unix-dev/2024-October/041621.html
(all reporting the same issue)

gcc update to 15.1 which includes
https://github.com/llvm/llvm-project/pull/99699
via https://github.com/gcc-mirror/gcc/commit/fa321004f3f6288d3ee2eefa6b02177131882dca
and allows dropping special flags and exceptions for gcc-sanitizers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/time64.inc | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 3ed0a4253d..5a2a3fbe81 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -2,11 +2,22 @@
 # QB_OPT_APPEND:append = " -rtc base=2040-02-02"
 #
 # Note that this does result in ptest failures on qemux86:
-# perl python3 dbus openssl glibc-tests openssh curl glib-2.0 tcl libmodule-build-perl
-# and a subset of those occurs in qemux86-64 as well:
-# curl python3 openssl openssl tcl python3-cryptography
+#
+#   (none known at this point)
+#
+# and some ptest failures appear in qemux86-64 as well:
+#
+#   openssl https://github.com/openssl/openssl/issues/21671
 #
 # Working to address those (before Y2038 rolls in) will be appreciated.
+#
+# Note: some issues occur on 32 bit regardless of the date set:
+#
+#   lttng-tools:
+#   https://bugs.lttng.org/issues/1436
+#   FAIL: tests.serial 59 - Test script 'ust/blocking/test_blocking' returned code 255.
+#   (due to lack of space on /tmp, which is due to a non-highmem kernel, which allocates only 800M of RAM to userspace)
+#
 
 GLIBC_64BIT_TIME_FLAGS = "${GLIBC_64BIT_TIME_FLAGS_WHEN_NEEDED}"
 
@@ -21,12 +32,8 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
-# Undefines _FILE_OFFSET_BITS on purpose in
-# libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
-GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
 # Caused by the flags exceptions above
-INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
 INSANE_SKIP:append:pn-glibc = " 32bit-time"
 
 # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
-- 
2.47.3


