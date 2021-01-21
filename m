Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.2282.1611261598229259528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 12:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLFXsips;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id a9so3041749wrt.5
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 12:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/tU2y9BF8cZdGpXZmp405PsbYJWiTIPshRZZt40bXwc=;
        b=fLFXsips1Na0wGi2OxGMVDUsTNTTH6b+i2MIFcdsjGDLVukYSU60B2R9fvWa21P2fi
         7nAlwh/gaxhdBBNylOcMA3CcGFQGO5kkXeUSpEY1MPUs/1YuXjl7trTsooIvkMBgxy0U
         Jk7XsTxt+DUUCxmrkA1d9P6mrq34EA1018WQBMK+Uzx8vv5DrO288qjF/YpmMxSBsxB6
         wyd9AKCZ+25cTlMQA7LhwJNt1XOMli3fiHs72JWFCkac717Y4WmRRG/DDD7WabQGVSqF
         gWniOp2Gz9FaY212tOo8QK8yzrBID0IoV5YLoUl8XwmkyHfjCNT3pb1eU54NaWXVEkOx
         kWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/tU2y9BF8cZdGpXZmp405PsbYJWiTIPshRZZt40bXwc=;
        b=eWmFqBBRqbdff6wuyXArB/amduU0yaxEz5kqGg2Tbe98TN6pq5dhlkPnTJpR644MLg
         0lJGqnn2ED0beQBqyZOZpJWkc0XqMsRrJ4BIsXb5Be7sSBoA1A8VTI2nOpgMTKGzoQq+
         XxoOI0viDdYFqbbF/JXgKeF4dx4x5/kLfO7lYrMgwyYSytknA1q7JxrdbdttFDMlFZL8
         crhRWpA+qrVtcv6UCiBSlmW1RsGtTNxOaamguSDMKx+ZgrpgdcHmnroqyJ9cNH1UBhl8
         w7fJntak+xZN7TFjMUN5aB/50SV7OJ3kaYzilHQzykBNDaacMsTQKFOeXXXBPPQsF1/4
         ptjA==
X-Gm-Message-State: AOAM531xwizS+PJa5XxU5X3aEB8IkSTbT4zbQ4l3fteIkFGGkWS6F012
	hSR2bD5JvzeoPhKfc1+KoE8a+Ps2x+G8kA==
X-Google-Smtp-Source: ABdhPJx2Nm2nzYV0e1WA+sUmptLJhrs6mTGQXlHdLwrGP4t+gfcJ5e4owpADOaYmuqDE9fFWuBAx2w==
X-Received: by 2002:adf:ecc1:: with SMTP id s1mr1290469wro.146.1611261596633;
        Thu, 21 Jan 2021 12:39:56 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.157])
        by smtp.gmail.com with ESMTPSA id o124sm9782456wmb.5.2021.01.21.12.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:39:55 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 3/3] elfutils: add support for ipkg
Date: Thu, 21 Jan 2021 21:38:53 +0100
Message-Id: <20210121203853.1461-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121203853.1461-1-dorindabassey@gmail.com>
References: <20210121203853.1461-1-dorindabassey@gmail.com>

debuginfod scanner 0.181 could only support RPM and scan .debs, it can now scan .ipk

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 .../elfutils/elfutils_0.181.bb                |  1 +
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
index c18de53b1e..ee97f06b87 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.181.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            "
 
 SRC_URI_append_libc-musl = " \
diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
new file mode 100644
index 0000000000..4bb39c91e8
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
@@ -0,0 +1,32 @@
+From b647d1df55c20772a9cc7ce96fcf323c500481bf Mon Sep 17 00:00:00 2001
+From: dorindabassey <dorindabassey@gmail.com>
+Date: Sat, 19 Dec 2020 01:11:46 +0100
+Subject: [PATCH] add support for ipkg to debuginfod.cxx
+
+added support for ipkg to the debuginfod scanner. 0.181 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
+
+Upstream-status: Pending
+
+Signed-off-by: dorindabassey <dorindabassey@gmail.com>
+---
+ debuginfod/debuginfod.cxx | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
+index 5621030..cc78c93 100644
+--- a/debuginfod/debuginfod.cxx
++++ b/debuginfod/debuginfod.cxx
+@@ -442,11 +442,13 @@ parse_opt (int key, char *arg,
+         {
+           scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
+           scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
++          scan_archives[".ipk"]="dpkg-deb --fsys-tarfile";
+         }
+       else
+         {
+           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)<";
+           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)<";
++          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)<";
+         }
+       // .udeb too?
+       break;
-- 
2.17.1

