Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4071FC77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:48:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.14765.1682671714166724930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 01:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DHqpioN+;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-2fde2879eabso8739608f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682671712; x=1685263712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkO8wCSGqy+4cmIo7R8klIgbf0gIdKAEC0s38h3406g=;
        b=DHqpioN+ZoQ8Bw6/+AhA6ygLdByyTp58UpigxiPGb53S8h7K5XfaJbXhOBGkQ18lLq
         ezmanzjbCucntf4xNJgidJDOz9LDofbSVm32I2NAk+oYxd7sPF4mxCXRwwiMchlZMKLs
         g9kiNajFSgVDIqqFb63OoVqF4I4+DIJVr+haN5fumpaqSrBNCUB4wD7PcEbSccZvsjpx
         VACz/f3umLDslBfFUdhJQucBaOVngb/BD85Ot44e23xqwrbui6WKQxyGnthCQV37O1NY
         h9g1cbuUj8Gn77nZKOF1inkGfpH6h7rSp+pF73J5cJD5bYP4sz1gOu42QvQPhJlulsC+
         6OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682671712; x=1685263712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SkO8wCSGqy+4cmIo7R8klIgbf0gIdKAEC0s38h3406g=;
        b=Zc0OrP66AzyZSzsQG31oeFpdQaoOfKhbjAAshfFOzDxA5PDtpxYnrukl67Gnocycp7
         iQUyJz6EF4bp0R88NAbgeqOzdGz59FkCkOcw64dDBp//KuL5Q7pzc+Tma9EnLezB/sl8
         codCMTjzJJhqoB7H3r/7A/Y7rXyObnV+yK9qJpyz4kawcPxymmBPiswQ+YYkTyUcfgzS
         93oVOneg+09kLQvD8py2ySL3YTLO1OBltmiOnMc6OcoK4WNSc0fxeMWKUfyWbNj9NQVC
         bV7+TGq4bR/i4hq5lK39OXxyIlXWc2cES7dPLTikoOsE4brZxxOcQawNJk45hHgYNZgK
         6REQ==
X-Gm-Message-State: AC+VfDzyBhj0suGujEN0M9qWMkmCkGAPMT2J5Q4LydSGbCJD5WKbqbdH
	KKo61Pqw599DxM29ksl30GQHeOTBsLA=
X-Google-Smtp-Source: ACHHUZ767twZ2tIZemj3aTlVUJ3Msc1HmtOrAqaYv1atGulPW8dKcQMTjv2+MRgL7ywFdKdfuNrHWg==
X-Received: by 2002:a5d:618c:0:b0:2fe:c0ea:18a5 with SMTP id j12-20020a5d618c000000b002fec0ea18a5mr3154571wru.58.1682671712553;
        Fri, 28 Apr 2023 01:48:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j8-20020adff008000000b002f6176cc6desm20563375wro.110.2023.04.28.01.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 01:48:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 10/11] insane.bbclass: simplify exceptions for 32 bit time API check
Date: Fri, 28 Apr 2023 10:43:51 +0200
Message-Id: <20230428084352.836515-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428084352.836515-1-alex@linutronix.de>
References: <20230428084352.836515-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180521

Existing implementation required to list both specific problematic apis, and files that
use them: neither is necessary as both are seen in package_qa error messages, and
can cause excessive amount of exception lines, if there are too many files, or
they are installed in arch-specific locations. Also, the value of INSANE_SKIP
should be the test that needs to be skipped, and in this case it wasn't.

Also, all problematic recipes are now correctly listed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>

---
v2: add pseudo to exception list
---
 meta/classes-global/insane.bbclass  | 14 +++-----------
 meta/conf/distro/include/time64.inc | 19 +++++++++++++------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ee34d5208d1..8788f58fc5b 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
             # At this point, any symbol information is stripped into the debug
             # package, so that is the only place we will find them.
             elfpath = elfpath.replace('.debug/', '')
-            allowed = (
-                d.getVarFlag(
-                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.replace('/', '_')
-                ) or ''
-            ).split()
-            usedapis -= set(allowed)
-            if usedapis:
+            allowed = "32bit-time" in (d.getVar('INSANE_SKIP') or '').split()
+            if not allowed:
                 msgformat = elfpath + " uses 32-bit api '%s'"
                 for sym in usedapis:
                     oe.qa.add_message(messages, '32bit-time', msgformat % sym)
                 oe.qa.add_message(
                     messages, '32bit-time',
-                    'Suppress with INSANE_SKIP:%s[%s] = "%s"' % (
-                        d.getVar('PN'), elfpath.replace('/', '_'),
-                        ' '.join(usedapis)
-                    )
+                    'Suppress with INSANE_SKIP = "32bit-time"'
                 )
 
 # Check license variables
diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 7474f0fd7a0..78569de4337 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -30,10 +30,17 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
 GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
 
-INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so] = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
-INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
-INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
-
-# libpulsedsp.so is a preload-library that hooks libc functions
-INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
+INSANE_SKIP:append:pn-cargo = " 32bit-time"
+INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
+INSANE_SKIP:append:pn-glibc = " 32bit-time"
+INSANE_SKIP:append:pn-glibc-tests = " 32bit-time"
+INSANE_SKIP:append:pn-librsvg = " 32bit-time"
+INSANE_SKIP:append:pn-libstd-rs = " 32bit-time"
+INSANE_SKIP:append:pn-pseudo = " 32bit-time"
+INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
+INSANE_SKIP:append:pn-python3-bcrypt = " 32bit-time"
+INSANE_SKIP:append:pn-python3-cryptography = " 32bit-time"
+INSANE_SKIP:append:pn-rust = " 32bit-time"
+INSANE_SKIP:append:pn-rust-hello-world = " 32bit-time"
+INSANE_SKIP:append:pn-strace = " 32bit-time"
 
-- 
2.30.2


