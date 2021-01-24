Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21194.1611496604443541155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 05:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z/LrVLH+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id e15so8463770wme.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oqd1tMOu7Z/FkJuWzeKeqC4r1N/IBNREwtgvo5GOc0w=;
        b=Z/LrVLH+X3VU7OUwzXJVA6ChmAJoq83PhiqEII3g/ZZs+X0BsrHos4HZy1F/TZzPD1
         rmnMUVRCD9N1X5jPNtVVc+SX7ij1T+t2MdP31U9uDB3OiFjVm/0OiAnyuS0fLt/tvnvF
         pCjXRwgRYTAl/oACww1MVdPQ4ogxI73rC7XqjB1mucUDNIEHLDr/+X+04Hg0vpw9tGS+
         ncfR4r1X1SyeoQjqFwJm8YjhChaa5YxhrgXcOzz+zKVnxDt6/7hdJ5N24Yto8zoKuA3j
         XpLM+Zo1YzJh3Du55C3mPr37Yl1Kv+vA1rxHl3+G2m8paoupnYyoVj2kUjn/7df85Pbp
         OGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oqd1tMOu7Z/FkJuWzeKeqC4r1N/IBNREwtgvo5GOc0w=;
        b=p4s/tSsxHvTB7G/cnp9AL6iFw1G07I/fg1YyP0Oudf7tvyiIIHpNCLJYvmfHPZOP26
         hUBPgl1sxGngTXTd31vtXu8zuFQTC0PImg9tTLgFdTawIiYagQJaO+5fxv/daHw6cULv
         rUcn96UsuvLbKBcbOa8NBs9VUY1zevzIC5l6hvvJKNu6vwogF+JRKVno2umNucCwRVtw
         f6kod/dk5wK8C0c0vABsfROkXbKFNi/jjEVrzXT5f6twHxFSQ9ECGJyFW6WPr9dtgxQR
         aFh9SHV187XhTsAmLyxmhBiL1X2iwpxKOkVVWSylo7rtPa0Ssl/V5GMoqLD7V6CBy8bY
         pM7A==
X-Gm-Message-State: AOAM5335nWWIol1xYM5BUKnYMm3qhuJeyGafW1Wi8vcsnbKQgPQzIurm
	QJ1J19yizckLTxo4B02SSlQd+ArzN2qU8Q==
X-Google-Smtp-Source: ABdhPJx+axMofLFqwOV/urrCZ6U3Xv5lMVGFd3rcXpLxvdGru+sJJXgRt6c3apfYwrb+yV+FoBLzgQ==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr2808462wme.21.1611496602814;
        Sun, 24 Jan 2021 05:56:42 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.64.211])
        by smtp.gmail.com with ESMTPSA id x11sm17650186wmi.4.2021.01.24.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:42 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 3/5] elfutils: add support for ipkg
Date: Sun, 24 Jan 2021 14:55:57 +0100
Message-Id: <20210124135559.21894-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135559.21894-1-dorindabassey@gmail.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>

debuginfod scanner 0.181 could only support RPM and scan .debs, it can now scan .ipk

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 .../elfutils/elfutils_0.182.bb                |  1 +
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 7b829cc7d5..b3d8c8f8ac 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
+           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0001-musl-obstack-fts.patch \
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

