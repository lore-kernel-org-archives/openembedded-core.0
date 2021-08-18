Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.57334.1629305436364591391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 09:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bD5kq2US;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id u16so4531516wrn.5
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 09:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4lmrhF5oLS8Pw4fPJXtKpo+VlUMn7zz6+s5wRfDuV14=;
        b=bD5kq2USl0U8LNSO+OLfrYxwofd42Au7DWyO6Dyllg/CTIl7xua10qHz750iofYp5T
         47XN52pEEy5LIcO2Y9FShJ1eWfAdpvdXDPAv4HosCwQWxR0RvQNcbrFhNhIWbOjQVgjX
         Qr4jX30qPyBl7L2dWla1iqf2u+6FtCj42fKpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4lmrhF5oLS8Pw4fPJXtKpo+VlUMn7zz6+s5wRfDuV14=;
        b=eN07GojmePUOKq5is2dbmezGBPDaLWGRP+CedgKAZd7IRerr5tC+5MRY8mgWr1e6OE
         mSTf0FUVQI1OAcITgpK4ycvvHS5Uodmp7TSVu1i2a+df49DBxP4LNBOcZwE7knAjRR5X
         EOX6ExiTyf+XzGceXjySqumIQaTC5imjjom9CREHiav0tAFfoiWDlLlL4tPMLMpe8EUQ
         BfM1GQ3/m12VNtJUxMmP1VU/1hNvis5dmDQQGuIIcEQEpltHn0jj320i9hy2RWmwrrF1
         UswWSy4FqXeXZOvoOWl8UHdvsachxIPzBUZJO1IbGqmsKYgRewcI4TJI2yRD2PDYk8hk
         sf0Q==
X-Gm-Message-State: AOAM532XFnOEMkE76dZhse1Z/7wa4Lrog6lR4Q6GAo6dGlBxmNkPZ0wQ
	TEbSFyBXJ/CG1Io9EejHRE3yps4aRPo2hA==
X-Google-Smtp-Source: ABdhPJxF1Ws4Sx+05jaCuzFRfWEoHwdP5NUnvn524ruiFeQoqozp0ex3lziVpgkrWkA9u5c9f5TSlw==
X-Received: by 2002:a05:6000:25a:: with SMTP id m26mr11888957wrz.262.1629305434684;
        Wed, 18 Aug 2021 09:50:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2c5b:67f4:375e:5ae2])
        by smtp.gmail.com with ESMTPSA id z126sm343363wmc.11.2021.08.18.09.50.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 09:50:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] gcc: Fix nativesdk builds and multilib fixes with gcc 11
Date: Wed, 18 Aug 2021 17:50:30 +0100
Message-Id: <20210818165033.3935964-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In newer gcc versions the headers changed locations and our multiconfig
and nativesdk tweaks to loader paths wasn't working. The broke
buildtools-extended-tarball, particularly on arm. Update to fix this.

Ultimately we should dump the gcc specs and check for hardcoded paths.
This isn't possible quite yet as this patch doesn't fix the musl ones
as we don't use that in mutlilib or nativesdk scenarios at present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gcc/gcc-multilib-config.inc               | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index e90580d1cdb..33bcbbfa246 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -31,7 +31,9 @@ python gcc_multilib_setup() {
                 '%s/*/linux64.h' % src_conf_dir,
                 '%s/aarch64/t-aarch64' % src_conf_dir,
                 '%s/aarch64/aarch64.h' % src_conf_dir,
+                '%s/aarch64/aarch64-linux.h' % src_conf_dir,
                 '%s/aarch64/aarch64-cores.def' % src_conf_dir,
+                '%s/arm/linux-eabi.h' % src_conf_dir,
                 '%s/*/linux.h' % src_conf_dir,
                 '%s/linux.h' % src_conf_dir)
 
@@ -102,6 +104,8 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdir64) + r'\3'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*\"\S+\"\s*)(\S+)(\s*\"\S+\"\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir64) + r'\3' + wrap_libdir(libdir64) + r'\5'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
@@ -112,6 +116,8 @@ python gcc_multilib_setup() {
                         r'\1' + wrap_libdir(libdir64) + r'\3'),
                     (r'^(#define\s*UCLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdirn32) + r'\3'),
+                    (r'^(#define\s*UCLIBC_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirx32) + r'\3'),
                     (r'^(#define\s*UCLIBC_DYNAMIC_LINKER\b\s*)(\S+)(\s*\".*\")$',
                         r'\1' + wrap_libdir(libdir32) + r'\3'),
                 ]
@@ -138,15 +144,15 @@ python gcc_multilib_setup() {
     }
 
     gcc_header_config_files = {
-        'x86_64'    : ['gcc/config/i386/linux64.h'],
-        'i586'      : ['gcc/config/i386/linux64.h'],
-        'i686'      : ['gcc/config/i386/linux64.h'],
-        'mips'      : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
-        'mips64'    : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
-        'powerpc'   : ['gcc/config/rs6000/linux64.h'],
-        'powerpc64' : ['gcc/config/rs6000/linux64.h'],
-        'aarch64'   : ['gcc/config/aarch64/aarch64.h'],
-        'arm'       : ['gcc/config/aarch64/aarch64.h'],
+        'x86_64'    : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
+        'i586'      : ['gcc/config/linux.h', 'gcc/config/i386/linux.h', 'gcc/config/i386/linux64.h'],
+        'i686'      : ['gcc/config/linux.h', 'gcc/config/i386/linux64.h'],
+        'mips'      : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
+        'mips64'    : ['gcc/config/linux.h', 'gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
+        'powerpc'   : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
+        'powerpc64' : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
+        'aarch64'   : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
+        'arm'       : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
     }
 
     libdir32 = 'SYSTEMLIBS_DIR'
-- 
2.30.2

