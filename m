Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.8726.1604910705549414348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qowrQ3ps;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id k9so7779536edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ss5M6imL4LoQ7cBDTYQtHFl9OcE4NyqjkAqN3mQKNE=;
        b=qowrQ3psf41TIzN/08htgmqEBcZvn2J9PQIu+NeLmd4tTchGhZ08jrBoY3qpyn/M8/
         e9OR0lsiXZLXv6zZ0wRHZfRHbFGSpb3tqSPhWgeDWat25/BG0Tox6VK/36vxuSR+Y3uZ
         MhDNJGRkh+YGtGbRP3XJ/1BVl9sF1s1clCF98NK45xXwj4PH390KkB9qFSqiSeK/t+zc
         rh1Nuc1tZsJlko517ZaG+1c9JDmv2YIJm8YQGVbq/GDL3xoWq3nA706ECcj/c1H6mVYe
         HJYHPYwfa9qJA0YwIW/UoqjV9naAu4b4gRNIaJJn1vX2U33m+pLE8fVpxyikN6f9Vx53
         eOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ss5M6imL4LoQ7cBDTYQtHFl9OcE4NyqjkAqN3mQKNE=;
        b=E7zLF4V48mUixd5oghClyqVRudaCYzpmmw2ovXpB3DrpnsQ5EeYyJ8ZjLWhJLyd0Jj
         gV5Bz3XRfPW/P/RbKr+6k+F4DOYmbgUb1c6cDMMpJyhTwhctpeks5kFbrMMi1jCt4RTq
         EH2XPNAmpx2ZS8vEHP3VHl17EjxejrW+mAySaej459qssXQYdXyUlXMRbWBlMNNkMGdB
         84ot17zLIJJOmZrrG/ZbILrkjOGIBcjLbGQ3MiKDRVuDbCdzECZRHay/mMCEfxI/e3Ts
         EfC9inHRaXL7tV9drhge1vStlNuM0PPwM+EmeY+PNNzWqIjJEnYDhJSonyHvWx2jqtQZ
         bwXw==
X-Gm-Message-State: AOAM532woT4D59mfA5BOPv1JEZu4et2lyrtp4iAnYmm2dHXcx4dtqOPb
	7Lb+I8YT7g7DgkY4HN2DNZ/TWSAttC3LiQ==
X-Google-Smtp-Source: ABdhPJw1jepJkzFkWnE7/55kCy5Xer3mwITfdmuHJdnmUvbSKr1o/j4a5NArqAqt6Ab19ZangTJIQA==
X-Received: by 2002:a05:6402:17c2:: with SMTP id s2mr14908690edy.40.1604910703763;
        Mon, 09 Nov 2020 00:31:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 01/12] core-image-weston: add sdk/ptest images
Date: Mon,  9 Nov 2020 09:31:22 +0100
Message-Id: <20201109083133.16503-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the first step towards rebasing the AB matrix from sato to
weston; the eventual goal is to keep sato only in core-image-sato
image.

The broader rationale is that X11 is effectively deprecated technology
at this point with only minimal maintenance; standalone X server will not
be developed any further, and all attention currently is towards making
it work well under Wayland.

I believe YP should be defaulting to Wayland and not X11.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  3 +++
 .../images/core-image-weston-ptest-all.bb     | 21 +++++++++++++++++++
 .../images/core-image-weston-ptest-fast.bb    | 20 ++++++++++++++++++
 .../images/core-image-weston-sdk.bb           | 11 ++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-graphics/images/core-image-weston-ptest-all.bb
 create mode 100644 meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
 create mode 100644 meta/recipes-graphics/images/core-image-weston-sdk.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3df5a0434a..ae04ef07c1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -117,6 +117,9 @@ RECIPE_MAINTAINER_pn-core-image-testmaster-initramfs = "Richard Purdie <richard.
 RECIPE_MAINTAINER_pn-core-image-testmaster = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-clutter = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-weston = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-weston-ptest-all = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-weston-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-core-image-weston-sdk = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-sato-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-sato-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-graphics/images/core-image-weston-ptest-all.bb b/meta/recipes-graphics/images/core-image-weston-ptest-all.bb
new file mode 100644
index 0000000000..a622779e6a
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-weston-ptest-all.bb
@@ -0,0 +1,21 @@
+require core-image-weston-sdk.bb
+require conf/distro/include/ptest-packagelists.inc
+
+DESCRIPTION += "Also includes ptest packages."
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
diff --git a/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb b/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
new file mode 100644
index 0000000000..df02befb66
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-weston-ptest-fast.bb
@@ -0,0 +1,20 @@
+require core-image-weston-sdk.bb
+require conf/distro/include/ptest-packagelists.inc
+
+# Include only fast (< 30 sec) ptests
+IMAGE_INSTALL += "${PTESTS_FAST}"
+
+DESCRIPTION += "Also includes ptest packages with fast execution times to allow for more automated QA."
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
diff --git a/meta/recipes-graphics/images/core-image-weston-sdk.bb b/meta/recipes-graphics/images/core-image-weston-sdk.bb
new file mode 100644
index 0000000000..f5f7dade54
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-weston-sdk.bb
@@ -0,0 +1,11 @@
+require core-image-weston.bb
+
+DESCRIPTION = "Image with Weston support that includes everything within \
+core-image-weston plus meta-toolchain, development headers and libraries to \
+form a standalone SDK."
+
+IMAGE_FEATURES += "dev-pkgs tools-sdk \
+	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh-server-openssh"
+
+IMAGE_INSTALL += "kernel-devsrc"
+
-- 
2.29.1

