Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275C8C43219
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:34 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.6491.1646731952950361403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ftD0Oz8V;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w4so21070611edc.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMbFSoILk1h1G/SmpgvCUyHZwLzFAYDC2vXX5DLB+co=;
        b=ftD0Oz8VIb0Bww2gAu+2Bd7rvpA+8Kvpa4MbursVcIf9O5VT16w6uXd62a2TD/zwTu
         aBeLWJlioWL11EXHJDUQZd+tmQVJ+KDnXPhDyI0F7gVDH9aoCmcSfGXgpdM4cSH/4HlU
         qoi2hH4sxoilQF0TFgPOVLWrG4xRC5jJOZBe6dOD23z6EJkXxg70/hkq5XboYxuKFv8Z
         wUCml6ZebPJ0rwb9IzMOqVKrWu3oH/f7M5E+YleRoz0AUeoNYHPxPbnFzksSSbkGIkMQ
         DcLDeEo3D4O8sas8c0Ywht9Zn/WHTwYRQdl2Eh+OuaulY6t7JOFlljydB89Hx63eb72a
         64zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMbFSoILk1h1G/SmpgvCUyHZwLzFAYDC2vXX5DLB+co=;
        b=WPVeI7jeLBTHPkwwaZlHXV5ZJQqZ5/qhi8/F+Ogj+D5OeKycmu1aSF5Z0B41VUlh1O
         abGAwOfp8rIensqj81sffP8QVf4o3sSyKmKviDZCb0oen8mlZigL+nZKBG1Cxu9dl/pc
         wVaO+9ifMOw4qxeGVCsAiYbybjN7CXw/odGxSSHsLwJ2zEllwWIkcN89qKDWbeVe0h9p
         shND4BoOV3cGmDZixhN/I6eG9B6egMkXso0xQjOTzOb0oYZIoD6Ohu4uEyfJm/gE4Brj
         UEtUOZmIp0hV30R9IIo3+AJ9BPoy4tNMX1yUAnTozWdRzOo/NqLEtf66Jh2u//lLqH/o
         dXpw==
X-Gm-Message-State: AOAM531Ld/JcdcXe7QY98UCDrd2Ns6a8qyRbSskerT/Oa0k+NKblkrxK
	55JLcJhJQ8xnCbUmhpUvxgcz/8KtIsw=
X-Google-Smtp-Source: 
 ABdhPJx81H9SXuNrclUcbgYvk9YbmCrc3IgJgmzUJ2+DyXSd2vL74xI29sLw8ceJ0GoWOy+QSLeFFg==
X-Received: by 2002:aa7:d80f:0:b0:410:d5c3:f770 with SMTP id
 v15-20020aa7d80f000000b00410d5c3f770mr15087977edq.279.1646731951482;
        Tue, 08 Mar 2022 01:32:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/16] apt: upgrade 2.2.4 -> 2.4.0
Date: Tue,  8 Mar 2022 10:32:13 +0100
Message-Id: <20220308093224.3436483-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162882

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  8 ++--
 ...vrec-Keep-support-for-older-resolver.patch | 44 -------------------
 .../apt/{apt_2.2.4.bb => apt_2.4.0.bb}        |  3 +-
 4 files changed, 6 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
 rename meta/recipes-devtools/apt/{apt_2.2.4.bb => apt_2.4.0.bb} (96%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 72713c3b1a..59b9cd190f 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From c7a79e753e50f1a5f248ba5812c61616f2f524f0 Mon Sep 17 00:00:00 2001
+From 11ba49594ae9d11f0070198c146b5e437fa83022 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 1517b47858..593ed7d096 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 393ac20efc66bfc000a2457e093e369b934c5a50 Mon Sep 17 00:00:00 2001
+From 47c2b42af60ceefd8ed52b32a3a365facf0e05b8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 46a6dee..8617a9e 100644
+index 93effa9..4375781 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1211,12 +1211,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 }
        }
     }
@@ -36,7 +36,7 @@ index 46a6dee..8617a9e 100644
  }
                                                                          /*}}}*/
  void pkgDPkgPM::StartPtyMagic()						/*{{{*/
-@@ -1710,7 +1704,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
        // support subpressing of triggers processing for special
        // cases like d-i that runs the triggers handling manually
diff --git a/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch b/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
deleted file mode 100644
index 94d67a87ac..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-srvrec-Keep-support-for-older-resolver.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f98c12b9f04ef3a9daec822c210044095b41a0ac Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 Mar 2021 12:33:34 -0700
-Subject: [PATCH] srvrec: Keep support for older resolver
-
-Some C libraries e.g. musl do not implement the new res_n* APIs
-therefore keep the old implementation as fallback and check __RES
-version macro to determine the API level
-
-Upstream-Status: Submitted [https://github.com/Debian/apt/pull/129]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Julian Andres Klode <julian.klode@canonical.com>
----
- apt-pkg/contrib/srvrec.cc | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/apt-pkg/contrib/srvrec.cc b/apt-pkg/contrib/srvrec.cc
-index 4ca208273..3eb5f1d4c 100644
---- a/apt-pkg/contrib/srvrec.cc
-+++ b/apt-pkg/contrib/srvrec.cc
-@@ -62,6 +62,7 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
-    unsigned char answer[PACKETSZ];
-    int answer_len, compressed_name_len;
-    int answer_count;
-+#if __RES >= 19991006
-    struct __res_state res;
- 
-    if (res_ninit(&res) != 0)
-@@ -71,6 +72,12 @@ bool GetSrvRecords(std::string name, std::vector<SrvRec> &Result)
-    std::shared_ptr<void> guard(&res, res_nclose);
- 
-    answer_len = res_nquery(&res, name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
-+#else
-+   if (res_init() != 0)
-+      return _error->Errno("res_init", "Failed to init resolver");
-+
-+   answer_len = res_query(name.c_str(), C_IN, T_SRV, answer, sizeof(answer));
-+#endif //__RES >= 19991006
-    if (answer_len == -1)
-       return false;
-    if (answer_len < (int)sizeof(HEADER))
--- 
-2.31.0
-
diff --git a/meta/recipes-devtools/apt/apt_2.2.4.bb b/meta/recipes-devtools/apt/apt_2.4.0.bb
similarity index 96%
rename from meta/recipes-devtools/apt/apt_2.2.4.bb
rename to meta/recipes-devtools/apt/apt_2.4.0.bb
index aef309840b..c95e36e3d0 100644
--- a/meta/recipes-devtools/apt/apt_2.2.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
-           file://0001-srvrec-Keep-support-for-older-resolver.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
@@ -26,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "6eecd04a4979bd2040b22a14571c15d342c4e1802b2023acb5aa19649b1f64ea"
+SRC_URI[sha256sum] = "728c69df369cbc4a55f91fc2817fe9832c1a2f39de4142e7ef222c5158f234af"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.30.2


