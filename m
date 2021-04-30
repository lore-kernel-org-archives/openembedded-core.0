Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.6614.1619750762424621908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 19:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rdbeoyVi;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id s20so19996169plr.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 19:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EetSUhrLiHnPzh2upnxxqpRp+QViNGczqwu0l05ka3E=;
        b=rdbeoyVi3jgXkisZjx5LnTdEnXSXzIRxuk+fIOHJ+bZKId228HlM7pI7GkR/zrx8Og
         rL8DjHLZapi2F9FjVPuvTRJXcYwsstKS1/D1usV2j8ahdfgE2XSp9Ep12CEhuZG6Jq2C
         1Fl5hSmGSJbuZl+p0KgNDCX+WJG8Sz2QmUvPuhe/MBx5c9Lmbi6qd5UC7NErmcdRBQar
         EnI1MhYjl2rhh6g4g87sHOlsxHbUBuotK8ecHt75k1Tta2MWPk4wf4F+B47S+sojU4tP
         WeIrW5krZbUWPUVhKHjcxHGk2TVtl/t0su2BRZnFCZHjvh0dgOiX3LYern6zcWVlqcOr
         sQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EetSUhrLiHnPzh2upnxxqpRp+QViNGczqwu0l05ka3E=;
        b=ukub62Ox/6ANvgr1e7tBQDzrtx7y/8WzsrW1OYUUMhQ+OEofSU2LrH/tDuwCsIpvBz
         uhH+KZekMqIrUYNS8T9GGX6Pxyuu08j3Bx+63vIheBTyTLRHJdmPeHBeG8BXK5lK6Y6y
         jfcbKmqME42FqCxikTn4gSGEqBLUFKa5HX2l363CNn+uAxamV+6hyWFnRPj3MAHM7O5a
         ScP4eX8Y4cDj6Zlj76+ry6k7ErXwUgSJ9bvhnJCf0bM0OkgQhP9Cs8fxIkQrqMKY9Ule
         yJjbEOnbeq/T6+AXKELf9VkP3t9GO6+tWP3o8A+3iB4Be6PQSGqokOhnfaaGn2KMQJTJ
         ZphQ==
X-Gm-Message-State: AOAM532Ce3EMhNopXkJpFBZbkoLQM8fQh9QP6T7KRxkhhiVpsUVxZ6X0
	jVBdd4lxDuxh0b39V3cM45ugzIdlF179GQ==
X-Google-Smtp-Source: ABdhPJzUpdFTb9joF0Ci+WSAZ0spDsy8FI/25HZx1RDyEzkNVye8b/mnwR2wa/7fAiZv5RpEOS9rAA==
X-Received: by 2002:a17:902:8486:b029:ec:c4bb:57d3 with SMTP id c6-20020a1709028486b02900ecc4bb57d3mr2993664plo.24.1619750761657;
        Thu, 29 Apr 2021 19:46:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id n27sm401679pfv.142.2021.04.29.19.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 19:46:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] busybox: Enable long options for enabled applets
Date: Thu, 29 Apr 2021 19:45:59 -0700
Message-Id: <20210430024559.2352123-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

certain applets are enabled but the long options are not enabled for
them, it results in subtle failures in ptests where its expecting these
options e.g. gzip --best is commonly used in many package tests e.g.

root@qemux86-64:/usr/lib# grep -r "\-\-best" *
acl/ptest/Makefile:GZIP_ENV = --best
attr/ptest/Makefile:GZIP_ENV = --best
coreutils/ptest/Makefile:GZIP_ENV = --best
ethtool/ptest/Makefile:GZIP_ENV = --best
libxml2/ptest/Makefile:GZIP_ENV = --best
lttng-tools/ptest/Makefile:GZIP_ENV = --best
opkg/ptest/Makefile:GZIP_ENV = --best
perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm:    COMPRESS     ('gzip --best')
python3.9/test/test_gzip.py:        for compress_level in ('--fast', '--best'):
...

this ensures that these options are enabled by default, which makes them more
compatible than now with coreutils provided utilities

busybox size grows by 4K which perhaps is acceptable

--rwxr-xr-x root       root           817704 ./bin/busybox.nosuid
+-rwxr-xr-x root       root           821800 ./bin/busybox.nosuid

This makes autopoint-3/gettext pass

This patch add all the long options to this fragment. The long options
for a tool will only get enabled if the corresponding tool/feature is
enabled in main defconfig, otherwise it will be ignored in final .config

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add all *_LONG_OPTIONS, so they can be enabled if main tool/applet
    is enabled
v3: Move the long options to a dedicated cfg and enable it by default

 meta/recipes-core/busybox/busybox/longopts.cfg | 15 +++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.0.bb    |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/longopts.cfg

diff --git a/meta/recipes-core/busybox/busybox/longopts.cfg b/meta/recipes-core/busybox/busybox/longopts.cfg
new file mode 100644
index 0000000000..dcfab99919
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/longopts.cfg
@@ -0,0 +1,15 @@
+CONFIG_FEATURE_GUNZIP_LONG_OPTIONS=y
+CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
+CONFIG_FEATURE_CP_LONG_OPTIONS=y
+CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
+CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
+CONFIG_FEATURE_RUN_PARTS_LONG_OPTIONS=y
+CONFIG_FEATURE_START_STOP_DAEMON_LONG_OPTIONS=y
+CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
+CONFIG_FEATURE_BC_LONG_OPTIONS=y
+CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS=y
+CONFIG_FEATURE_IPCALC_LONG_OPTIONS=y
+CONFIG_FEATURE_NSLOOKUP_LONG_OPTIONS=y
+CONFIG_FEATURE_WGET_LONG_OPTIONS=y
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index 58e9cf7fce..a92fa2fe5f 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
            file://getopts.cfg \
+           file://longopts.cfg \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://rcS.default"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-- 
2.31.1

