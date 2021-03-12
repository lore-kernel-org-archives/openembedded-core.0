Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.5922.1615541519049384891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xl303V6u;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id r17so52033713ejy.13
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6erYx/0oH0ljjFrsiQxBuxJG3WcdjnCeF302YVHl60=;
        b=Xl303V6u4x83VAD9fp8rmRKiksnzQVxfDmCbehDHQfsWzEeI1bNPjoytHXKnf6B6DF
         kLB4bVxk9UThkGcwngXpbNUgLdFgUP/yY2fPRob9GEQ/ijRxqjIC4BKIme+qihN7/Eym
         BJkoJnr2OgNxAzvS+XpwiiY7Gg8YmYkBTszO5y6kuwD8RgpIt8emgrCgSDZRGSE80kzu
         1Bo54pjCiLGBjqTIz8lMD8sKwKMMImWCObzwVEKH/VV5nKGZ/m/qFDY1aF3yNTcRHdNn
         Zm52skVAaBplb2hmrSZzv9XI5mf3XJinBEBaIV7KBPLlAuTDwIK5iY9SIRXC1XVEZu3c
         LAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+6erYx/0oH0ljjFrsiQxBuxJG3WcdjnCeF302YVHl60=;
        b=sV1pups8SVVsVbmXcrG2lNaKVjr6KHTdA/fDWx2Qw/nG95cYCLrjlBpEtrgRczIkRb
         5UaY3ui3jiWgMlHPP/uSA4dazNN3T1kb3lMEy40P7DF7bPAy1QUK7U1p6BDhemrR34H6
         a8Wso3UaK+JDJ5H6xmoN71+x7YQk6QV3iKE4Yl6oMlY9OjFm3P656MIkpwKBXaqnV4u3
         c18zi5Xny4xGrcZj+4Rqib8XDHln3wsR++OUs3UaTgL+3urv7WAFh9AVpacFq1tlO1rH
         yEdetSiPfNn0dHybGetch66hn1wkrdhL/1lDqHalpk/+YQMWPpVBf5CbEIhfRzUbhz6r
         ijLA==
X-Gm-Message-State: AOAM533qKhazuI+0G7fiZxJ47wAHNNj4W6/gyFtWJyLrIWoO8L+Vl5mi
	QCXcOEAoGOkj00blc+37JIydHiNC8AzTvw==
X-Google-Smtp-Source: ABdhPJwjqxX0401CQX5dT9ZVxqhLwrmQhHij3/PPw9leCp+M2EK2wCTCMw6vP/DJJYen75Ek3hbvkQ==
X-Received: by 2002:a17:906:13c4:: with SMTP id g4mr7643481ejc.390.1615541517473;
        Fri, 12 Mar 2021 01:31:57 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:31:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 1/7] core-image-weston: add sdk/ptest images
Date: Fri, 12 Mar 2021 10:31:33 +0100
Message-Id: <20210312093139.318889-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
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
index 9093f2d7fd..eafbd5e56a 100644
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
2.29.2

