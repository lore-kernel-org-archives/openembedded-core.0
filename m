Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.7849.1604774485277203837
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 10:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qNyDaGuD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id z1so2511695plo.12
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 10:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ren6+Xz38piYvir7bCxTr5GhTu7jbH26ln5PLnKeZOk=;
        b=qNyDaGuD+UCefRCtHzZhZ59iZjNO6+UoySyna62wBgXS7BOPxZssCheCsy/bpQ6H11
         cVUrsGmTizxMWuVjDG9F9pI8+64OYRJG0mAX8BPi6C1mkqAfW+oy+qoUx/3TZ7UfrE9b
         qu5WaO6H+nGj2equzZPVfb7mxaypcjjPr8qZ0V8ReEsZqcD1949biWunZj0C2RP+b1xA
         6jXgShZIKxxgZnfYcGYN3VHxWW4UO4T1EXJshPVZLUBHK9OPTymORDRzEfc8tSBBaNmL
         mSQNUC+HGwAXznhhr4FeWzV7bwwLhGuZVKNrPfYRxiu0fxesJ5sfAWuM7CwrH9OXPdQL
         aN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ren6+Xz38piYvir7bCxTr5GhTu7jbH26ln5PLnKeZOk=;
        b=mbz6ciefkMbniOwBisMtgGulqw7Ha6jmfY76cYaTPFwcHguSB1A/KgYfukd1NDE0Pf
         mmrdA8w5cgrtv+XnZe07bnq+wK4UXEoN8eQOmBGUbXAA7XWCA+/xNAbGz1kdjKUqPdlF
         wf80kYR/NNmTRg6QOgzh3CEqg2C2vKfsXh6aKbU6C8F9IFEt57rXyvp1WaNfQpWBwJwd
         h/17fDxXlaBX1FICIa2avqVf2DlMAlvpBq4W5iTZNhWLU22zvdLrlzifKDkGQiGCoHkr
         ymRR6nDpdEovhykGt7UgcfH7J87GazxDoSemJichDciCMpdVbZHIjtxwhxboaBfiKdlC
         hq+w==
X-Gm-Message-State: AOAM533qOQniAnJb2U6xHJJ9KFKs8PEmQYGnd12toKV7xvjH912y7O/X
	CqDk554hlohmmqazbOmzk4Wki27lTUHRZg==
X-Google-Smtp-Source: ABdhPJwFXU+S2Jv4Zb7FC29mDH23QmtBeVk3yRAZ0FoF8hwEOIiN0VX6bN/eyp5/uHomvyHFsGFFzg==
X-Received: by 2002:a17:902:8685:b029:d7:bb:aa2 with SMTP id g5-20020a1709028685b02900d700bb0aa2mr6354067plo.13.1604774484383;
        Sat, 07 Nov 2020 10:41:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c12sm6218955pgi.14.2020.11.07.10.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 10:41:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 1/2] lto: Add global LTO distro policy file
Date: Sat,  7 Nov 2020 10:41:18 -0800
Message-Id: <20201107184119.3033956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros which want to enable LTO can utilize this file, it only covers
packages from OE-Core, other layers should include there own exclusion
list for recipe which dont work with LTO

Document the needed changes in local.conf.extended

debug file generator does  not generate debugsrc packages when lto is
enabled therefore disable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Include feeedback for adding DISTRO_FEATURE knob

 meta/conf/distro/include/lto.inc     | 30 ++++++++++++++++++++++++++++
 meta/conf/local.conf.sample.extended |  4 ++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/conf/distro/include/lto.inc

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
new file mode 100644
index 0000000000..1f76ec7c16
--- /dev/null
+++ b/meta/conf/distro/include/lto.inc
@@ -0,0 +1,30 @@
+# To enable LTO, add following in local.conf
+# require conf/distro/include/lto.inc
+# DISTRO_FEATURES_append = " lto"
+#
+
+# Disable LTO for following packages
+LTO_pn-glibc = ""
+LTO_pn-gcc-runtime = ""
+LTO_pn-libgcc-initial = ""
+LTO_pn-libgcc = ""
+LTO_pn-libpam = ""
+LTO_pn-elfutils = ""
+LTO_pn-perl = ""
+LTO_pn-busybox = ""
+LTO_pn-libxcrypt = ""
+LTO_pn-curl = ""
+LTO_pn-libcap = ""
+LTO_pn-libproxy = ""
+LTO_pn-libbsd = ""
+
+# Override it for additional or different options if needed e.g.
+# with clang thin-lto might be better for compile speed
+LTO ?= "-flto"
+
+SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
+TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
+
+SELECTED_OPTIMIZATION[vardeps] += "LTO"
+
+PACKAGE_DEBUG_SPLIT_STYLE_lto = "debug-without-src"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 9aa226a2d0..2c4b8ad8cb 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -417,3 +417,7 @@
 # ERR_REPORT_UPLOAD_ALL = "1"
 #
 # INHERIT += "report-error"
+
+# Enable LTO Distro-wide
+# require conf/distro/include/lto.inc
+# DISTRO_FEATURES_append = " lto"
-- 
2.29.2

