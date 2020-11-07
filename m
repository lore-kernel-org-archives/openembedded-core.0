Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.8768.1604779310238487382
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 12:01:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IsQ+s5O5;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id m26so218648pgd.9
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjDvTvcyPoKXKYFhkIOBS/ZhGUbfI6BCKDqVp2s/AvU=;
        b=IsQ+s5O57ctv/9svsNo59b0Ci+QU/ITb0/1/tfZj6A5L+qjPOcEJZqFewbOlMN/hRa
         VoozU4afc83dDwAF81HIyB8fhi/h2SmSxWWSzRq8eyEHxTbYKnVrMept5SMzXedKU5jf
         xGz7Urop0DQPpDZnC5vs+Kb4n7KvWUh8LbxC/0qaVyRErQEPnoV65OFK9HNvvrgLvYPb
         8Lwk3DcoO0RxU1pCfveRub+40PGvwlwDohlT3qVJLMgHZ6Riz3vwvUQrex25p56L/ohu
         0dEmOf/cHFkj0Oc8DvjLDRRexM61KoQgHCxGM5vQ5vDJF5cQjqeq06qgZ1EQLHwATGII
         boBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjDvTvcyPoKXKYFhkIOBS/ZhGUbfI6BCKDqVp2s/AvU=;
        b=Lhq+ip3FuKfsft2VkMKRWNwTdJc+NaPhciAILfRMaBrXxEYAyMeF+r7EZn8V2zhAcd
         oDGba6pQhW0rg7zxc7R4E0Sx6elkkr3pkTJkcb/RDGQRgJoUG/YoscgU90C+onY36Uq9
         ipqKNKkdfZOEyuOlRK/GuRzjdzpNRwZ5by1SlvUGozC0vXD9SAi7vqiNjQmNQrQXDQy/
         /tNpD2p6e8UvoNUM7m8wERLQ1KJWb286QOhlKLYxTiA6gyHPFyLambN4H3ngeTwaKXX3
         R2l5ua35eEr2o6h/zqmxzvw2GYrh1wT0BI7na8UGy57QQPcPjyg3JenRxOP+8RaZK9UQ
         7Khw==
X-Gm-Message-State: AOAM53371VukfZfZ5aMxYJognyx7NPNKE+iwPWzIrj9uhuRBye8bU/ft
	vqdWUBmI0xF38J8JoyLWmOZ92iCDVLGvng==
X-Google-Smtp-Source: ABdhPJwIadP7tHs4uDWmdn0EUQiQkGKPRavhzhKSTwaaHWONn8UJYtvpF5UOzvdrM0VFUGH6d4OagA==
X-Received: by 2002:a05:6a00:a8b:b029:18a:b1e4:b0e4 with SMTP id b11-20020a056a000a8bb029018ab1e4b0e4mr7187042pfl.36.1604779309117;
        Sat, 07 Nov 2020 12:01:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id q18sm6335958pfs.150.2020.11.07.12.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 12:01:48 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/2] lto: Add global LTO distro policy file
Date: Sat,  7 Nov 2020 12:01:40 -0800
Message-Id: <20201107200141.3608814-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Distros which want to enable LTO can utilize this file, it only covers
packages from OE-Core, other layers should include there own exclusion
list for recipe which dont work with LTO

Document the needed changes in local.conf.extended

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Include feeedback for adding DISTRO_FEATURE knob
v3: Drop unused PACKAGE_DEBUG_SPLIT_STYLE settings

 meta/conf/distro/include/lto.inc     | 28 ++++++++++++++++++++++++++++
 meta/conf/local.conf.sample.extended |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/conf/distro/include/lto.inc

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
new file mode 100644
index 0000000000..fe0f6c9f44
--- /dev/null
+++ b/meta/conf/distro/include/lto.inc
@@ -0,0 +1,28 @@
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

