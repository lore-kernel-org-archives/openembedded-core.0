Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.979.1611706281497299782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 16:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b2J7BL08;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id y187so78515wmd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 16:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mjaw32X93+VEZNQRI0ITzD24HQnXqMRP5Sbhike1+MA=;
        b=b2J7BL08Pw5KmgdIwoblVN4u6/zLn/mouxj8IZ7N6s90LGaGZjgbfiO3ZEAJkjc8n2
         dR51WLe4CY9NPgZ4tof/Oy4ali0Qdmy9Rt+fxMTqCrCDdilLuPtSrQyrWYSIiwJqXTic
         K99umnMFvgTzLXDiCBhchiBmEcgnU48jtU6HUz26yALbY4p5u1mtPlEUZuxVO8wdiwdR
         h0jZELOU+8sxDnb36LvzHiGnW1UZ1b7jp08+BWsvwet01qXS1DdUm0QIhSRam2Sy7G/R
         SObivLV3fVoIct616DNXNQSeHXzu5BTTYpRJdxXdnHPZm49eKufiQao0attJ6ntFMJv6
         JDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mjaw32X93+VEZNQRI0ITzD24HQnXqMRP5Sbhike1+MA=;
        b=VGkmvV4Z6PoCVjz3+KrnfcbF/HLStLSHpof7Lfk49m6dQocuFiLo++39JB1dhHZJfX
         6bPwEbNp7fU2NywF4721CQi882VGu4kFs2wdiP5TOnUSdJmBQw1WrWgRjNT8pb+iDI5i
         20KP3kYR4CW/Ck7KFsL5QaYhMm5r05tzQ5Ib4s4Ztonnelw0NlvOx6sqhLKSQfekdSIb
         +E2msWUeIbyCH8gXza4mAmRkI7kXBD/fRfDLaQ94wn18IceXFzIUrHjWVTaDvaG/nhUF
         YyduNSBFKovFOBBqZFgxj6LxYij41lRGv30dQgot6uZ7CzSmwvXH5jryFPAHI7q5S1I0
         5H3A==
X-Gm-Message-State: AOAM532Sue3KQ8FfJrp0i1aMWl45Fh0vvDT8d9jfYiyVW3nR1vapJu6j
	WLgPnzSmbfgQ76m/AzN5pEIkE0mvTz+szQ==
X-Google-Smtp-Source: ABdhPJzdezq0/k7xFn/0ODc9lnQ5XcVBri2jVPdVMco/czVyo8gggm1zGjBumrDzwNprOuVZLMgE7Q==
X-Received: by 2002:a05:600c:3591:: with SMTP id p17mr987491wmq.153.1611706279740;
        Tue, 26 Jan 2021 16:11:19 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([105.112.33.220])
        by smtp.gmail.com with ESMTPSA id b13sm509208wrt.31.2021.01.26.16.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:11:19 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH v3 3/3] elfutils: add support for ipkg
Date: Wed, 27 Jan 2021 01:10:45 +0100
Message-Id: <20210127001045.6686-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127001045.6686-1-dorindabassey@gmail.com>
References: <20210127001045.6686-1-dorindabassey@gmail.com>

debuginfod scanner 0.182 could only support RPM and scan .debs, it can now scan .ipk

[YOCTO #13807]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 .../elfutils/elfutils_0.182.bb                |  1 +
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 79cd84a8a2..49b6ac8231 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
new file mode 100644
index 0000000000..f15eacbe72
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
@@ -0,0 +1,32 @@
+From b647d1df55c20772a9cc7ce96fcf323c500481bf Mon Sep 17 00:00:00 2001
+From: dorindabassey <dorindabassey@gmail.com>
+Date: Sat, 19 Dec 2020 01:11:46 +0100
+Subject: [PATCH] add support for ipkg to debuginfod.cxx
+
+added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
+
+Upstream-status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html]
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

