Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web09.4519.1604880142935425591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ramBDzIW;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id e21so5307073pgr.11
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s4+DdXtXcOkfd3syIfCgyJ8C87e+Q7xoExs/gSrlgz0=;
        b=ramBDzIWY1MX3QT7tMskzEl4dMLZpC3qdeU7lH5tYvzjlTKZ/vedoUt9aFv76MF22N
         t3625ev71HOnitzVxFQnAfeMmU0JjkidU9kXLB3B5g8ckkw+5UkJxVgCB3WxKrDZV/fF
         5KtZBG8UAb6CI8y8nPN1ehjfD37EYuYaFJL9PiuZTHVmZJkFZX2E1xdbUdQB4JNS5Dj6
         v3wG05rG12QH/TXIjWU5HLrxdWQudTHmGWNEQxrpJcAJCnmu3p+nuAWbBL9CPD3NjnV1
         PpeibKKdGJN6XptatT5UHQH3yamwtIbSN8BZPv423GdULYiqnM08TeSpu74biGsE2DbP
         Qc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s4+DdXtXcOkfd3syIfCgyJ8C87e+Q7xoExs/gSrlgz0=;
        b=VyKJid1Gsx/PTJpUbACbitqDMA+uDtZj/5m3AH6qfCbZ8iR7GTXh1LE7oYxV8zR0Zs
         /JaWm2XcFXu1sqy4gl4xs3L593zXgi6lb64FfWlX1HBg+foprJTjbLywseMcdPKW0isg
         zv22DqvFe3xDXKxyIjSeCixZvXGc75e8Yx6OFJ0iia0agB8z4Y5t/lNheD/frFjs03LU
         NbEZ6GU39dnSYJfa4eDz70j/godXChhcoOSv1HxWQU3+y7pqrR4ZE/VBU98QGOlb07YQ
         0jfPfYX5vUUQww2wBFyH0TnM7D2IHnx1JCJUtixRFzn2KVklbVmFaVVu5tr4HfEjfs9v
         q33g==
X-Gm-Message-State: AOAM532VC/IcSLSJGSSc56hMC0e0VLYA690aG5NYahuyDTpAEMetqOZC
	tY10YpmnH8yXh2mWnAZNx3J2bn+ZyP9NnA==
X-Google-Smtp-Source: ABdhPJwssPXBf2kRftF7IqksTmNCTCtUZR/Bka+Y6edk8ropYJ04Rl81azt0+Jex9P0gHhjAOfQhcQ==
X-Received: by 2002:a17:90b:80e:: with SMTP id bk14mr10211434pjb.109.1604880142201;
        Sun, 08 Nov 2020 16:02:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 02/11] python3: Enable lto if its in DISTRO_FEATURES
Date: Sun,  8 Nov 2020 16:02:08 -0800
Message-Id: <20201109000217.3008448-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3 configure compiles on object file and then greps for strings in
it for endianness for target ,when using LTO the .o files are not nomal
ELF onjects so this test fails, since we are using --enable-lto to
enable this here we dont need to inject extra paths via bitbake anyway
therefore reset LTO variable for target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python/python3_3.9.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
index 6402760a1b..8fe60ea016 100644
--- a/meta/recipes-devtools/python/python3_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3_3.9.0.bb
@@ -74,6 +74,9 @@ export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynl
 
 EXTRANATIVEPATH += "python3-native"
 
+# LTO will be enabled via packageconfig depending upong distro features
+LTO_class-target = ""
+
 CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptmx=yes \
                 ac_cv_file__dev_ptc=no \
@@ -88,7 +91,7 @@ def possibly_include_pgo(d):
     
     return ''
 
-PACKAGECONFIG_class-target ??= "readline ${@possibly_include_pgo(d)} gdbm"
+PACKAGECONFIG_class-target ??= "readline ${@possibly_include_pgo(d)} gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
 PACKAGECONFIG_class-native ??= "readline gdbm"
 PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
@@ -96,6 +99,7 @@ PACKAGECONFIG[readline] = ",,readline"
 PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
 PACKAGECONFIG[gdbm] = ",,gdbm"
+PACKAGECONFIG[lto] = "--with-lto,,"
 
 do_configure_prepend () {
     mkdir -p ${B}/Modules
-- 
2.29.2

