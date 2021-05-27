Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.5119.1622112873878234299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 03:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lboo/weh;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ss26so7081359ejb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qfjgl51BpqkVUDP4sPRdtLspJtL9uYPpbOKQUDZnR2k=;
        b=Lboo/weh/9CDHzOqafEhkX1OEQjk3Bb2BpGMDxf1I0h1cc+2HEziAvNV+FyNbvec4P
         f9cy7pWHSAd5kFcQ5atlTcKewdq+PYnK07GPe3KBIpt/DFYpfpuNXGY+k+pGHiKTHQ/B
         O2f8foNe+tf3Trstu68PF85WGzw9AA+/F1L9zbfbQa0LSgkt6WimZkJsE2SQcpvSX1Mh
         rSpUHr/QKVyO63Ok2g5I94FXmD0otjwUeF+m+18ObQjsop7EhUbvw2mkfIR4Yy/a4rFU
         xCkUwC+o0HuDJ17Cf+sFQhkLKYqDNnUgg02zgSaDrCTUDm0tRXw0aQ/c8XnsXdixu0un
         5HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qfjgl51BpqkVUDP4sPRdtLspJtL9uYPpbOKQUDZnR2k=;
        b=ABXrz1mcs+f99G/pz51WzSTRyI9VyIAfIyP+gtrmZ4U/rYfgkLSxCkKx92h2+lbQ+u
         8yZ1t2DnqD/vnSygsWNgWaWGRgy9r94JB3v5mZIplMEm0f4Xnh6aIhS11uXPN6o9SKNI
         nJX/OdhjdS631uUIcDkHQzsOk/ELqJzzzJeYE7258YIppRgm9tuNtOjLBIwJxd/vFYyO
         3Y7LhQwY9PL/KzUV596TYruv4sP7JAi1MhNYpNSf4QOXuytaRoTTszps9RiUPRvZh+6k
         B418aQB+lQsA8b61gpNWHWQfzintVWbpzjT9oNV9B2i562lcsbTO0HUQeM35fPMNlVMi
         sipw==
X-Gm-Message-State: AOAM533DiG7sWUk/FzqlwQfFs7huoPgXZimPjL5LpbqTTjADiFMKCfps
	McVS8q7J9RQceFvNXkw5t70Dvmh9eNw=
X-Google-Smtp-Source: ABdhPJw1FUw01slAZvycmv0YHKQBNSAzcpPwHGhQF3tVz9vGNw0SdMzBUGPad7MtFUMuKNXnfrblsg==
X-Received: by 2002:a17:906:8049:: with SMTP id x9mr3179040ejw.13.1622112872496;
        Thu, 27 May 2021 03:54:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n13sm803037ejk.97.2021.05.27.03.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 03:54:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/4] images: add ptest images based on core-image-minimal
Date: Thu, 27 May 2021 12:54:25 +0200
Message-Id: <20210527105426.515519-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527105426.515519-1-alex.kanavin@gmail.com>
References: <20210527105426.515519-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This greatly reduces build times needed for those images, as
they no longer need anything graphical, or -dev packages for
everything.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../images/core-image-ptest-all.bb            | 25 +++++++++++++++++++
 .../images/core-image-ptest-fast.bb           | 24 ++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/images/core-image-ptest-all.bb
 create mode 100644 meta/recipes-core/images/core-image-ptest-fast.bb

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
new file mode 100644
index 0000000000..c1d6aa28a9
--- /dev/null
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -0,0 +1,25 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require core-image-minimal.bb
+require conf/distro/include/ptest-packagelists.inc
+
+DESCRIPTION += "Also includes ptest packages."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+# Include the full set of ptests
+IMAGE_INSTALL += "${PTESTS_FAST} ${PTESTS_SLOW}"
+
+# This image is sufficiently large (~1.8GB) that we need to be careful that it fits in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 1100MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
+
+# ptests need more memory than standard to avoid the OOM killer
+# also lttng-tools needs /tmp that has at least 1G
+QB_MEM = "-m 2048"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
new file mode 100644
index 0000000000..40df274c4c
--- /dev/null
+++ b/meta/recipes-core/images/core-image-ptest-fast.bb
@@ -0,0 +1,24 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
+require core-image-minimal.bb
+require conf/distro/include/ptest-packagelists.inc
+
+# Include only fast (< 30 sec) ptests
+IMAGE_INSTALL += "${PTESTS_FAST}"
+
+DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
+HOMEPAGE = "https://www.yoctoproject.org/"
+
+# This image is sufficiently large (~1.8GB) that it can't actually fit in a live
+# image (which has a 4GB limit), so nullify the overhead factor (1.3x out of the
+# box) and explicitly add just 1500MB.
+# strace-ptest in particular needs more than 500MB
+IMAGE_OVERHEAD_FACTOR = "1.0"
+IMAGE_ROOTFS_EXTRA_SPACE = "1524288"
+
+# ptests need more memory than standard to avoid the OOM killer
+QB_MEM = "-m 1024"
+
+# Sadly at the moment the fast set of ptests is not robust enough and sporadically fails in a couple of places
+PTEST_EXPECT_FAILURE = "1"
-- 
2.31.1

