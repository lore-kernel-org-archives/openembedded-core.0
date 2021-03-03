Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.6285.1614777090890152769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bcyvYiQh;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id c10so15573578ejx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 05:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jo+LNdiquaTGL3hCO9Nw/J89pRRO35ARDc+mJmFFdiA=;
        b=bcyvYiQh0jqnQFHo9LKfK5VB80S+kZOeUaF60lGE3veHoxiFm+yqTHTB9Pc+8jU1/m
         PV+Xtr1NKEjQivf7X68w/DxbyUxFJVYTpng8WCCzWWMnVLYpD1sWwRYS6i2/GKBlVFfp
         5c1G/B4x3CY0S3jUdGziLSbC/if2r2WFHuNUQdN0sXyFBpRjpxhu26o8z8KBXe/ILGkY
         ArSs2yuOfHFrPtTIZS+/veyoRrrtlCbgjtMeTTqpC4hXcOZrYowQpUgEpx2ZgmU1tY9/
         Gr8+eccFdyxBnarnwXEjDZfZE/02lL6ULAmpVxSm5AoaaKQ5B+0jEQ5qHS+ahElhKVVv
         1i4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jo+LNdiquaTGL3hCO9Nw/J89pRRO35ARDc+mJmFFdiA=;
        b=kDN3D9nAy7bY7fiD2Wu4351OOOTBdneJmt/KaqzgE5531L24t+Ro1FBUzzJlOiGQkD
         Vv8kdwZcLwhRa67m+ub0gqfYeq8PFmSHMeLuS8leEi/Kx2krpx7qKebvuMF5JosEdyg8
         l803eq/bGwGJEPwGJJDgIVGFlOj7Y6Dju0kZygqvKi0lxbs7DEJPbjvydU0BHBNUJMhR
         l1xm6MaM0OaXqqYIhCN+1wJv3Tu6l+66p1fsvBq9QZwjXxC1FAYKCf8Vlmvv8OuBbU10
         MKk2i6yc/1fZXlW3mX6yQCvr/Ea7sTQ0nGgUdOLaXPPIRyEQP2L9X8K+jmUkWuHkWDf7
         YYdA==
X-Gm-Message-State: AOAM531pKmOyQruZP/pskqlxykV6KSYy6DO53UQEfJENQ9quasqOoUby
	uMdbvZBvJ16dSaqp/B8IihxUELFo+LyZjA==
X-Google-Smtp-Source: ABdhPJxy1ugQdrh0Hr8F67hQGuDbcr3tMIQfAqwBnqsdznOWz72ztbBtgShYPlQe5I5Gk7EivqaUjw==
X-Received: by 2002:a17:906:a106:: with SMTP id t6mr25920019ejy.63.1614777089346;
        Wed, 03 Mar 2021 05:11:29 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([5.28.91.120])
        by smtp.gmail.com with ESMTPSA id w18sm19472472ejn.23.2021.03.03.05.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:11:28 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] core-image.bbclass: add a weston IMAGE_FEATURE, similar to x11-base
Date: Wed,  3 Mar 2021 14:06:39 +0100
Message-Id: <20210303130641.604699-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/core-image.bbclass                     |  2 ++
 meta/recipes-graphics/images/core-image-weston.bb   |  8 +++-----
 .../packagegroups/packagegroup-core-weston.bb       | 13 +++++++++++++
 3 files changed, 18 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 88ca272145..d81f68bd2e 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -9,6 +9,7 @@
 #
 # Available IMAGE_FEATURES:
 #
+# - weston              - Weston Wayland compositor
 # - x11                 - X server
 # - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
@@ -37,6 +38,7 @@
 # - stateless-rootfs    - systemctl-native not run, image populated by systemd at runtime
 # - splash              - bootup splash screen
 #
+FEATURE_PACKAGES_weston = "packagegroup-core-weston"
 FEATURE_PACKAGES_x11 = "packagegroup-core-x11"
 FEATURE_PACKAGES_x11-base = "packagegroup-core-x11-base"
 FEATURE_PACKAGES_x11-sato = "packagegroup-core-x11-sato"
diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 8d88e3bc0c..e82e4fbb3f 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -1,14 +1,12 @@
 SUMMARY = "A very basic Wayland image with a terminal"
 
-IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"
+IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs weston"
 
 LICENSE = "MIT"
 
-inherit core-image features_check
+inherit core-image
 
-REQUIRED_DISTRO_FEATURES = "wayland"
-
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples wayland-utils gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "gtk+3-demo clutter-1.0-examples"
 CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
 
 QB_MEM = "-m 512"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
new file mode 100644
index 0000000000..340c8e75ed
--- /dev/null
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Basic Weston compositor setup"
+DESCRIPTION = "Packages required to set up a basic working Weston session"
+PR = "r1"
+
+inherit packagegroup features_check
+REQUIRED_DISTRO_FEATURES = "wayland"
+
+RDEPENDS_${PN} = "\
+    weston \
+    weston-init \
+    weston-examples \
+    wayland-utils \
+    "
-- 
2.29.2

