Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web09.10355.1604787842542230469
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 14:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZUXeOdUB;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id s35so620246pjd.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 14:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qpYgZaGw5iOlNgur2q/GzulB9W9KEH67iACfU5Hs3Pk=;
        b=ZUXeOdUBYyUsjSE6BwI7rb8YkkKCR7Yf/ZGb6yXsIKiBwfPDfjppZJ1eFBfAWZuaKN
         W5EG8yA3+ZgBOViyOSbFu7kmxHzs7vCPsgzCIQeW5yMTXIARXT6lR1Rf7/+ZDsNS9PbW
         AUoIGe6/HO3t4gKrQpIGALFs0LUsDW6d+NfQ7sq4P2j7Zm3WHw0mLgTHZSPYKxflw0jW
         zdMcu36f2+0ia/fg2w7ZjBAOdHc8lCyinZ+0MzLFZvldFstWjM9mCYaKlYRr50FDWZFx
         bvEvXMz6uJLRBbwCb8q7Hsc8pYnLzj6+w3GEEHrkjWolm2m96rNBtmd8mGB37S9D+Llo
         9K6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qpYgZaGw5iOlNgur2q/GzulB9W9KEH67iACfU5Hs3Pk=;
        b=LZP2ti9mc6a9+X4IMx9SZIRthnHwE0/5Ig13BsRRqgu6OCMxEJLuIbxtHoNY82I+Ja
         c8B7f2Gs8jw1w5IG8Ajnz/bIeOlinc6lJqLDSH4Gw+mvdLIw5wDhscVz+ffS8lVWyMHi
         e/i/HyaoiQvxG3kJ95w628UTIFbFOoitVyuBTepE8ne3/Jr5tElvNFEjKYrcS27C43bs
         44V3Y7p3TzPgkQuCFDtwiXVKi1K4z5Cvcb8NPOgZqCO4Geeu1y6gfFVPlvzRo2DtSo/g
         WYUbwHFctaQxHA94lhzM7/vK+SFeNlvdFHvMpCSo3mhTsmNF79z7rxW0Ry9ep6VrXOAU
         /YAA==
X-Gm-Message-State: AOAM533p4WDbsNmCKRHvYA6o4yxumoJl4PxKw6XNqbH9OGIHlBqwDM93
	EnOyl9T3dwJO9mtTNdsQwdJ6lnwZ6z3Q9g==
X-Google-Smtp-Source: ABdhPJwi1nl58jfoNsYG+JLhakPWIBNtoMWctEPXia/jVG4sIMhIBbq2eOr7yjHT+gvOB67lmjciSg==
X-Received: by 2002:a17:90a:fd08:: with SMTP id cv8mr5574636pjb.203.1604787841776;
        Sat, 07 Nov 2020 14:24:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s18sm6900725pfc.5.2020.11.07.14.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 14:24:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/4] python3: Enable lto if its in DISTRO_FEATURES
Date: Sat,  7 Nov 2020 14:23:55 -0800
Message-Id: <20201107222357.43102-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107222357.43102-1-raj.khem@gmail.com>
References: <20201107222357.43102-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python3 configure compiles on object file and then greps for strings in
it for endianness for target ,when using LTO the .o files are not nomal
ELF onjects so this test fails, since we are using --enable-lto to
enable this here we dont need to inject extra paths via bitbake anyway
therefore reset LTO variable for target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Reset LTO variable and use --with-lto instead of --enable-lto
v4: No change

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

