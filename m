Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.45676.1624274221049215143
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 04:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l13LA15P;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a21so19661619ljj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 04:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BQYrDMZEt0LlHTtQjb3ZBNch3HWzcCY1/qj0HrXkmA=;
        b=l13LA15PZK+dpFE2FN4P8xhr7NvVlV/twfks1hIwe9/6HeYiFlbo1+ZSNYVO6ctynX
         Sq5Joo8bh5brg8DZMozQfO/vIxNorAaYF8hLHRw0LJOT3IL3h2MSJekjDqDfdwMDDpTe
         vGeQOo57aAohTpT6q82dNPgXTM0sxclgtu+TeCYfg5duMBmusG6kN54c5aY0y4hdTqGb
         pniwlTYbzgHefmj7Ngy0ZmCh7G5f0FgrUcCeDZswb2Nf3Q/R+mCJUoseK0s80mpBlp85
         haO8fJYQPd95AIyqC+VAy3PuFo8f52V+pQd0gKfEuWtHCwpFJKt/WhCsM/VgmT1XLGFg
         rZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BQYrDMZEt0LlHTtQjb3ZBNch3HWzcCY1/qj0HrXkmA=;
        b=LrOG05miHP49mqTtVSN6ysttaw7DPMbVJNFsp46cy0lRRVjXqDfVH2SXj/MKorPNvw
         bKUfJEAPhvvT/GqRYyGwh9tEraob0/VJHHAxCeNyBiE7bLOVK1iXKQc/XgTrorfP2AmA
         43p+szUY2ckVBQGdwAnALtg4hc/5HfwNiDbWs5BghDzw6QzIoQpRVrM8DaQRByMFv1Xv
         4gsxcoQynzlUc2OivV+s/sVZf1oZutBN1K2uLXZNnmwN/oTJ3UtGDg8C0m5y8fJEt4Vn
         UwSIa+2yIGgBCGePXugLGUo2pjbZJ5SkkUj+mkZxErzySjE0hstIzhqH0spN4lD3yGdz
         XMdw==
X-Gm-Message-State: AOAM532aNlS6EZtIB8qQ+SSCofVHmK1b8hv4AJNzf5Vjm88NJ3a3Z7vV
	tjO5Nn9uhp+f+Y9GIV7LYSEAkO+Tglg=
X-Google-Smtp-Source: ABdhPJwnlGhvbTuQVSnw7/TYxk/vFC1LJvcBv6WVbNYWznrjz0AQcSD+cezvIGFc+p+RkC3LhutJBA==
X-Received: by 2002:a2e:9214:: with SMTP id k20mr22260360ljg.353.1624274218745;
        Mon, 21 Jun 2021 04:16:58 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.198.108])
        by smtp.gmail.com with ESMTPSA id 14sm2012833lfq.130.2021.06.21.04.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 04:16:58 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [REDEND] [ OE-core] [PATCH] u-boot-tools: fix a mkimage signature issue
Date: Mon, 21 Jun 2021 13:16:47 +0200
Message-Id: <20210621111647.240520-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

A following error was observed:
| Can't write signature for 'signature@1' signature node in 'conf@imx6ull-colibri-wifi-eval-v3.dtb' conf node: <unknown error>
| uboot-mkimage Can't add hashes to FIT blob: -1

This is caused by a wrong return value being used in uboot source.

The return value '-ENOSPC' of fit_set_timestamp function does not match
the caller fit_image_write_sig's expection which is '-FDT_ERR_NOSPACE'.

Fix it by not calling fit_set_timestamp, but call fdt_setprop instead.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...ls-image-host-fix-wrong-return-value.patch | 41 +++++++++++++++++++
 .../u-boot/u-boot-tools_2021.04.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch b/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch
new file mode 100644
index 0000000000..81687203e4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-tools-image-host-fix-wrong-return-value.patch
@@ -0,0 +1,41 @@
+From 77fe3ad2ab2953ccdf6e9417cbecc060b45d3e55 Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sun, 30 May 2021 10:32:08 +0200
+Subject: [PATCH] tools: image-host: fix wrong return value
+
+The return value '-ENOSPC' of fit_set_timestamp function does not match
+the caller fit_image_write_sig's expection which is '-FDT_ERR_NOSPACE'.
+
+Fix it by not calling fit_set_timestamp, but call fdt_setprop instead.
+
+This fixes a following mkimage error:
+| Can't write signature for 'signature@1' signature node in
+| 'conf@imx6ull-colibri-wifi-eval-v3.dtb' conf node: <unknown error>
+| mkimage Can't add hashes to FIT blob: -1
+
+Upstream-Status: Submitted [ https://patchwork.ozlabs.org/project/uboot/patch/20210531070451.6561-1-liu.ming50@gmail.com ]
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ tools/image-host.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tools/image-host.c b/tools/image-host.c
+index 270d36fe45..73095461a7 100644
+--- a/tools/image-host.c
++++ b/tools/image-host.c
+@@ -132,8 +132,10 @@ static int fit_image_write_sig(void *fit, int noffset, uint8_t *value,
+ 	if (!ret) {
+ 		time_t timestamp = imagetool_get_source_date(cmdname,
+ 							     time(NULL));
++		uint32_t t = cpu_to_uimage(timestamp);
+ 
+-		ret = fit_set_timestamp(fit, noffset, timestamp);
++		ret = fdt_setprop(fit, noffset, FIT_TIMESTAMP_PROP, &t,
++			sizeof(uint32_t));
+ 	}
+ 	if (region_prop && !ret) {
+ 		uint32_t strdata[2];
+-- 
+2.29.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
index ef386f76e6..4e90081911 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2021.04.bb
@@ -1,3 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
 
+SRC_URI_append = " file://0001-tools-image-host-fix-wrong-return-value.patch"
-- 
2.29.0

