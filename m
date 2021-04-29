Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.3917.1619735172018604264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f8Yx7nys;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id h11so7494774pfn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 15:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRxpO/3V0sHHM8udmI3oluBM64/WhlNWkesJfUgFyB8=;
        b=f8Yx7nysUij/R0FIAJHK/mR/I+fZWojRl5N5VSzPwt0qy+cXoKwTmkriAkEWn1qqCV
         ii+hFGEdU21l/tb0ZAPlgRt2TqsTVfxiIdC8gZ4J4Waj4Kv/13NEo3tesbNa/37iW9CD
         4UbH3l7elj5LMJgd5hHk+HqHxC9WxXPZuqQk4qAWqRypG2+H+40c+jN0IGg5dXARVnq4
         w+ijSkjLAYkwnGS0qcHzDfiCp1NiuUQdzZ8FPLQ3CIL+RZHsBM2VZ1GIeN9ANkjo3xa4
         xnAazHqUl+X6CRWlH+NCPwjvLQYK/R5X8Kpo2Kt9q8PtsBpyIBRjisSMPUZM7CosfZ88
         JVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRxpO/3V0sHHM8udmI3oluBM64/WhlNWkesJfUgFyB8=;
        b=q6OIhd5E2k9LpZ0CiLXas0RFy9z5l9eNuz35byswhhR2nY3BwyV4w8QME6GUecJk5b
         FUNGRlSVJ4a6T4CHtNskcu+Lr3RpzeVr7OEg73osQsO+qCany0xCtfV/KfIMo+rvV3M+
         DxCwRzUNfU0AsOlP4NIGithwuPJTvELWUsx9W8+bBip8e1nMpolSDDPIYD0fUVJbvlZe
         gt72A2Sc+P7Lm4AdEc/rKh6WjNlEPqXLjJWZrocBe3Tgp8FKhUQFQEEbKaBBRoxrHwTS
         R26D17HOCyrnWAMYP6QWvAymaYN8jh0xrItEosPKLMeTY4sXUuXo5k4ZlloTl8sgdnhD
         aryg==
X-Gm-Message-State: AOAM532mzztwtwwpdtL9JG/SzgT5mdiUCZHAvmx6rJgx6xd9AQ0CqrIL
	TnLsWC8TYnkslwb8tl5cchWpGzUHJRpXWw==
X-Google-Smtp-Source: ABdhPJxqNYPJ0J/LYsY34iiVhJD21C6S60z8hh0L6CkzyPDKdDVzyRfFiAIBK1Wl5Ofvdctr2j3WjA==
X-Received: by 2002:aa7:8e52:0:b029:23e:5c6e:61f8 with SMTP id d18-20020aa78e520000b029023e5c6e61f8mr2243651pfr.16.1619735171282;
        Thu, 29 Apr 2021 15:26:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id l10sm3189211pjy.42.2021.04.29.15.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 15:26:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] busybox: Enable long options for enabled applets
Date: Thu, 29 Apr 2021 15:26:09 -0700
Message-Id: <20210429222609.1842847-1-raj.khem@gmail.com>
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

 meta/recipes-core/busybox/busybox/getopts.cfg | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
index 8db0a4a8f2..b9dacf8f70 100644
--- a/meta/recipes-core/busybox/busybox/getopts.cfg
+++ b/meta/recipes-core/busybox/busybox/getopts.cfg
@@ -1,3 +1,18 @@
 CONFIG_GETOPT=y
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_GETOPT_LONG=y
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
-- 
2.31.1

