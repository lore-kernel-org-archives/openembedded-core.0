Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.7624.1619586349136360127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 22:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gbtojeTM;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y1so16488590plg.11
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 22:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wk3212knbnFmvA9mdhW33UU7Dt8rDydmwJkPoCXcxtg=;
        b=gbtojeTMzh0mMwI3y9n/FMpSI0wtZaaA1dpnMSEw3wn01I+NIvli0ETSSsru7jtEuh
         ksHg0xnVsKYHaH5RyR/5u8CYrPnBIqKa9sIlkHsOEm86ndjGBUuN0xkSyGdAYs1UhytP
         /PS0nse2IZ+8oXjy9YcWQEgRb3YJO8woEtBLqMSHHGqjldNxGaBkV0l2KT6/o47wWJwW
         tei7frxMPIdQXtrg2dG4QAg8NTnzVq2kf8Hs2siz/saENeFL4AojVd4n3UQdPnNQmw9e
         6PXl9OODlmlmXSVg9gbFy9BSD7F/P6p/M22DpoetKCArjS0kfmDIt9DsphvC5o6zR4kP
         1K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wk3212knbnFmvA9mdhW33UU7Dt8rDydmwJkPoCXcxtg=;
        b=lZYI3Ia+i8b85/fmG163g27y8LVreps8/REFk0+oFf8n4KkvEC2QY4z8WlS18eUwMt
         GwQJt01VRJRZvdUhGwxLxI3dwWKk+a/QwkGyGdxeSerTn6tblGou1DkLamdTPXLckoYg
         hoxyr5NHK4eZ94d7GpopmmM9eJF4APo8e1I3eT8xVIVdbVOgkNEDdg/A4XM6Vd8Lqnvd
         ATPOTfUIp/8izMTuaE/AuadjRm6cp3unF4duwX5USvOwLNTtzZoyvvTKWNUGnmL/p2yT
         8mbK847lYibhlQSdxZADYET0IkPRHssRVRH4k/bHL+8VP2MPuI1vVJ/9m/ZOMcl5Clqd
         M08Q==
X-Gm-Message-State: AOAM5308bPqRkWhqyHd4h4hJW8E3cllXUdwBFK6meUz2RsD0u6hsjS5s
	fpqCJ/xG4o3E4ji6QXC2hcD0bu42zjcDCg==
X-Google-Smtp-Source: ABdhPJzj/AypyQT5z66t+Tuf57XPFBNDYvbCWTDl9OwMQ6vmkI0iAzg/xz0kUIlNAwE7j+MKzfCFoA==
X-Received: by 2002:a17:90b:184:: with SMTP id t4mr1947809pjs.223.1619586348380;
        Tue, 27 Apr 2021 22:05:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id ir3sm3443787pjb.42.2021.04.27.22.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 22:05:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Enable long options for enabled applets
Date: Tue, 27 Apr 2021 22:05:46 -0700
Message-Id: <20210428050546.1708751-1-raj.khem@gmail.com>
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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox/getopts.cfg | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
index 8db0a4a8f2..aeb5ac691f 100644
--- a/meta/recipes-core/busybox/busybox/getopts.cfg
+++ b/meta/recipes-core/busybox/busybox/getopts.cfg
@@ -1,3 +1,10 @@
 CONFIG_GETOPT=y
 CONFIG_LONG_OPTS=y
 CONFIG_FEATURE_GETOPT_LONG=y
+CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
+CONFIG_FEATURE_TAR_LONG_OPTIONS=y
+CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
+CONFIG_FEATURE_CP_LONG_OPTIONS=y
+CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
+CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
+CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
-- 
2.31.1

