Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.62.1619200982596936960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P/SAjwqO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id r20so25379063ejo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZ/JsLxpj3HXcVgURhkGu2E9VxVmIa0YTUbp68okH98=;
        b=P/SAjwqOr6cOnZuyDKeT79w+APLU56xOxN3shjG1NgCOzNgE1ukpYyVmXAwxKxpWu4
         KroxEkM1NTWje5gbKpyR4Y+DlDf7O6og57dYXHv5rjp8amOgtVTEc5rN8yqF1S5UdCL0
         qZSX3Qh00YIuc5dRw3PnXYP7XldQsjiWw6dYVn1ePF1ggv0qK/duvbqenysczpDP0jyn
         JahStri6AvVecm6tPpv/93++GU5WrbWFd/M4AzgD2GLjde7ospoQwHI01TzUPS4K/Lrp
         /0UyoZVqKkMuH7+k8GKnxmYd2tR4uP+DLD4ttTginCOiIKNpvpoxfYBboGNjNeOhRzfU
         OVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZ/JsLxpj3HXcVgURhkGu2E9VxVmIa0YTUbp68okH98=;
        b=Av+OHmfcfssjlqMkMvZRo+XGQs6XP5kH6sZFbzXV/em2Wsa0VhfuY4Ha+xztNm+B8Z
         /+ieucPQNsFEkWevvz2ef1bJ23aRHCUy4fQZSgeK5mICGW/1Bq4Tflrk0QQolILunLPc
         7CWXL7T79wzsDTKfMcoObYIAKAuE+teg/f23IyzQW2txvC4j+Jy9/mMUDRmjnwFP9Uvo
         1GaHnxUIdFXnsmcogH7GIQ5tC9ZQyZCwQ/+fk/AYx7Exp69mWCtdiJxGpn5W81v9Jj2x
         hX+6USeRRZLtlGnNK4JZ2yuuqGe6u6ci4Bfl2hMdu7C8y/R2dtv7WpePROSWLaX3oPLc
         UC2A==
X-Gm-Message-State: AOAM533iTMoails0pmezSjahVpDh3h0QWsBolrqsWYxmJH30QOIiWoWX
	SIU3msLe/gT0jHQOAh7b2aiApCsiQHVi8w==
X-Google-Smtp-Source: ABdhPJzEzhuLcrSxY2yWF3KWlJzUZQ2p8d996E+CEJf8DA0Psj5npAp8Vqp0+vrNqAsYfuRIyq2qRw==
X-Received: by 2002:a17:906:b191:: with SMTP id w17mr5607250ejy.200.1619200981148;
        Fri, 23 Apr 2021 11:03:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/7] core-image-weston: add sdk/ptest images
Date: Fri, 23 Apr 2021 20:02:48 +0200
Message-Id: <20210423180254.706537-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
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
index 0973633f58..ead3384561 100644
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
2.30.2

