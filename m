Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.9716.1604473704095170521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 23:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vQiq91iT;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id f38so15807641pgm.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 23:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k214nCcQOt/SOPUWYu04K21xI23c+GEhMKMV1PMPjCo=;
        b=vQiq91iT4/rBpgm6SklpqFF/eVXKS2f0PSy18dTN0VBUdS0ewwTqQ/PqgyClOAcEQN
         +82ITupm3P04/ZyU74sGqQ6jlDQVeM1b1+v3Y2UlGn3iRbQecs6eQEsVeflXZQMbgyMS
         KcHuG8vCvTFElFEE2mwCGjxhjRWO0td+KA8RME3BmMSml30uKN0bbIci0YirXHd9xErW
         WYsHytnUUHg9GFb5R+m8eJiO+zvqNmEtj91MRughDs8HvNHZzpmLeriK7kLQWDQhOTLc
         3jtz6mIzs4/qoCSU05JdITBkpzhPM6tgWRbnqZMW15tbaUPnhitJKpNPmA1uBHZQhRTp
         WLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k214nCcQOt/SOPUWYu04K21xI23c+GEhMKMV1PMPjCo=;
        b=T+EteBB17hBFf9gyM2OUNttUVM8hkcC/+G4n7QS+pCzZClViJ6ozQNgAKkcs3VVCyP
         imLsi4tBSqBWRdrRqRyJ5w1syBCLSxyluEaIFCHoEnAScxHR3ERmXaM0qYWdCgHlMA39
         mhVOPUZDoukviSvyqLjyhaQe/SQa1ioNvAn3FuxrJboI13gX88rTqtv9D7vR2qNmgB2e
         aqh2Hv7j2CvBTOnQNioCWeCt3ywFwjJRn1yTXd8p/GHrXVyFQ1zoDotWv/yixu+AXXCN
         Zs655NloNfXMFQVQ4+DW9BpfZSH4Q9A1XSDpQZBqOc445Ch8fUFbQEIl8PTIaMZWxZTO
         lQ/w==
X-Gm-Message-State: AOAM530kHBQyaNnKoYVvQyLQqlOKXwlxf56bwIU02cM0o9xAZRWvpUL6
	wPrBVDoyUsAoH280YwrkKCh47ALFOuy1qw==
X-Google-Smtp-Source: ABdhPJxLkIV4wkoznc+8F+ZCqmdwBX+LMq12CcQIrpVFbhBr0nJ7yiSiV21yoNF88unGSkFUPG7YsQ==
X-Received: by 2002:a63:2022:: with SMTP id g34mr20525042pgg.144.1604473703377;
        Tue, 03 Nov 2020 23:08:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id i130sm1187314pgc.7.2020.11.03.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 23:08:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gstreamer: Fix build on 32bit arches with 64bit time_t
Date: Tue,  3 Nov 2020 23:08:20 -0800
Message-Id: <20201104070820.1802206-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

| ../gstreamer-1.18.1/gst/gstsystemclock.c:330:1: error: static_assert failed due to requirement 'size
of(struct _GstClockEntryPThread) <= sizeof(struct _GstClockEntryImpl)' "Expression evaluates to false"
| G_STATIC_ASSERT (sizeof (GstClockEntryImpl) <=                                                      | ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...crese-padding-in-struct-_GstClockEnt.patch | 34 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.18.1.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
new file mode 100644
index 0000000000..a2d215d72d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
@@ -0,0 +1,34 @@
+From 4449246a8d788e71dfe4679fba95955cec5894c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Nov 2020 22:58:26 -0800
+Subject: [PATCH] gst_private.h: increse padding in struct _GstClockEntryImpl
+
+When compiling for 32bit architectures with 64bit time_t e.g. riscv32,
+the static assert that the GstClockEntryImpl smaller or
+equal to the struct _GstClockEntryImpl triggered.
+(they were 12bytes off).
+
+To fix this, the padding is increased by 8 bytes (on 32bit).
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/694]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gst/gst_private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/gst_private.h b/gst/gst_private.h
+index a8897e1..8252ede 100644
+--- a/gst/gst_private.h
++++ b/gst/gst_private.h
+@@ -522,7 +522,7 @@ struct _GstClockEntryImpl
+   GstClockEntry entry;
+   GWeakRef clock;
+   GDestroyNotify destroy_entry;
+-  gpointer padding[19];                 /* padding for allowing e.g. systemclock
++  gpointer padding[21];                 /* padding for allowing e.g. systemclock
+                                          * to add data in lieu of overridable
+                                          * virtual functions on the clock */
+ };
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
index d989eefd97..d55b2871e7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
+           file://0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch \
            "
 SRC_URI[sha256sum] = "79df8de21f284a105a5c1568527f8c559c583c85c0f2bd7bdb5b0372b8beecba"
 
-- 
2.29.2

