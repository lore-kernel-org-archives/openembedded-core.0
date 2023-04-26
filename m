Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58A6C77B60
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:50:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3970.1682502649438201476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YP8Yv4aA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-2f7c281a015so4219985f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682502648; x=1685094648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jHIMz8o25cNaD07lYa5F+G7CROl0X33hps2nLl3h40=;
        b=YP8Yv4aAAjkzEyHGblSNL/M9DljcmOqfAd0C199VWve+EIBE99noxLzo403I3dALzU
         5StNsoAnCai6B+7VQuTBzNObYRn+VWG73NgnPKr18Zx1Qo3vFvoi2kdkuj+8XmavEjkL
         sifNEnEYF67Sa90zfv0EyHU5/vdWK/+M0Kfka45jYapM3ZBGSlFwfWVZi4LiSd9rtP/y
         YYPmX9mtX8VtYBMjMX0O31nAwhNRnBZmKNWaje3EM3TNico0bYugbT31S5To+6rc2toX
         vDdzimyiU10ZoNlE7LTPSBpapooAAIMWhi1aE7XouFrJfuDQkCCAADCodXYz8aPpkdqr
         5FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502648; x=1685094648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jHIMz8o25cNaD07lYa5F+G7CROl0X33hps2nLl3h40=;
        b=bCfXS8aoqqecOxCUd3ku0iRx/AEgipr2+/G2EoI2QtViALVmxohHoYFLY20SQCvhKh
         QzboflHrAUtngzftCdmw9qV2pdSBCl8SZIASL8ebH6LuhSsfANmzb7wi7oD0b0PcjKka
         FWqH8CDykI+FZ8CECo+ELhWM1Ut2zd5alvHgoCEc1g9GpXPoQoZpaj02kgf9M6tWQz33
         95lq3ccPnSh3lnMA9gwGf1nMfV6Q+paQZpakOIV+kccDohq5weo98MNtd7PTQM4Q3e3D
         dmO3CFCaWObSBfWuoF5o4zscyRn370AUg3UPMwQqu/zC+DrqnooRF100GDC1ZREmbGBE
         RwmQ==
X-Gm-Message-State: AAQBX9emEm9DypeQ30ZKX15WUJkPNcK+sigTyWCfWHYobvqhuyGHzZ3a
	WiKfchUcyho+hqrHWeub5/Tubp5XHKI=
X-Google-Smtp-Source: AKy350bypQKNKPB7JQuFfVSGMiU4yeFgHjht83NHTgy/RywdH1esMSaOxOdVGbquozX758+ojfsTLA==
X-Received: by 2002:a5d:4d52:0:b0:2f2:8de9:f744 with SMTP id a18-20020a5d4d52000000b002f28de9f744mr13617575wru.31.1682502647986;
        Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id o22-20020a1c7516000000b003f18372d540sm17242867wmc.14.2023.04.26.02.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:50:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/11] insane.bbclass: simplify exceptions for 32 bit time API check
Date: Wed, 26 Apr 2023 11:50:35 +0200
Message-Id: <20230426095036.2632847-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230426095036.2632847-1-alex@linutronix.de>
References: <20230426095036.2632847-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180428

Existing implementation required to list both specific problematic apis, and files that
use them: neither is necessary as both are seen in package_qa error messages, and
can cause excessive amount of exception lines, if there are too many files, or
they are installed in arch-specific locations. Also, the value of INSANE_SKIP
should be the test that needs to be skipped, and in this case it wasn't.

Also, all problematic recipes are now correctly listed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass  | 14 +++-----------
 meta/conf/distro/include/time64.inc | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 17 deletions(-)

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
index f3bdfba4acf..1a3399bc5e6 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
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
+INSANE_SKIP:append:pn-pulseaudio = " 32bit-time"
+INSANE_SKIP:append:pn-python3-bcrypt = " 32bit-time"
+INSANE_SKIP:append:pn-python3-cryptography = " 32bit-time"
+INSANE_SKIP:append:pn-rust = " 32bit-time"
+INSANE_SKIP:append:pn-rust-hello-world = " 32bit-time"
+INSANE_SKIP:append:pn-strace = " 32bit-time"
 
-- 
2.30.2


