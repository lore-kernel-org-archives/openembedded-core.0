Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web09.8731.1604779314586963185
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 12:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iu9gwv8L;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id w11so2575182pll.8
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 12:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OiBuafB49aSCxsDvdVgj27CAVgvRYW/2pjJNPZZ74BU=;
        b=iu9gwv8LDvsx36nQIFCwTlgAAYQ1p4nhVZ2BTJwI1HuVfc0rB/YYLyvO53aXIOCVAy
         8LTsgx4x1TthOwByZTPxu3VU7N+TvbNzx7uXp0BrE6eCrmWU2jOCmyBq2M0y2J7pEuK3
         JiNmrSMSdYFZRSqfHVHqukq/3RsWH+gP6DaUzc3ymEEfQBTImQXJs+gWrnMy0eEXQmec
         33UtCEKY05MRZoqEcYySuz75m2C2frjVfyWdWbD/cMNHvJ1W7uMZg3mKDgBglAxy5q54
         /O2NejQ39wiP2B7hbvNMggwk+KeFAg+If7DZyCVSTPa9Swcnx2naSTHIDzgCkohwM3Wr
         csvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OiBuafB49aSCxsDvdVgj27CAVgvRYW/2pjJNPZZ74BU=;
        b=EcmP11N+NTKiATRQd/iOryiLuv6X/v8rmrdUDV9MB9NTuFvk0srnbuPFQggh+CtJAv
         Z80n5UAADxeolNnCubsADzHy18nYVVDuIDXOngGkw/3hCsy8XC9vz74TD5n5gk5uBbiu
         HoF5VNmZzG4Y9Y1z5NJDYS8nv1p8kGbspJd22MyVKArwV9H7Y95HWbLN9bA9X5r1arWt
         mMcyspfmbM56OQHaPNfVSx7tl2G3oQtPb6tVNFPivbYbir8KRgVgNkj8wxQQmZkn+hbM
         7fW0SlJvqosRz/x/NzNn68hwln4p0d/s+XG8wQMIKyF9Esncuh0saR0LKq2XyyW7jODQ
         kZFQ==
X-Gm-Message-State: AOAM530sdpmjb7klyKSOg52CpwJ13LxY2N/F4kXObnJaeCSwrP+ifqVu
	Q4UoLAt8/zwcH11twyH+OMCNOgxiB3Ke3A==
X-Google-Smtp-Source: ABdhPJyXEn+VugVqUs5snZQVLHOnyvH5s2GGC3qarlddHA+L3hit7ZsqcDH1IR2wnyDQqD7qCobqtA==
X-Received: by 2002:a17:90a:678a:: with SMTP id o10mr5334955pjj.180.1604779313890;
        Sat, 07 Nov 2020 12:01:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id q18sm6335958pfs.150.2020.11.07.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 12:01:53 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/2] python3: Enable lto if its in DISTRO_FEATURES
Date: Sat,  7 Nov 2020 12:01:41 -0800
Message-Id: <20201107200141.3608814-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107200141.3608814-1-raj.khem@gmail.com>
References: <20201107200141.3608814-1-raj.khem@gmail.com>
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

