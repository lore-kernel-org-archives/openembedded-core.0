Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.41342.1622445957334623542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 00:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SqhnEZNZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 131so13792949ljj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 00:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLr6pmJRHmV7zC+rbA9tBL4C1JcOIJS0180gvtWPDfA=;
        b=SqhnEZNZcqg8v3OQPhTqIOfQU1IUDjlFC4wgApRtPCn37FggdDGuRYWizydfIwAjV+
         R+bU+wayVexALnlYjtsYHLu1Jj2yhmaJr08rbLBu3I1DdPTqYNHMaiUv6vTNMn1FZ6oj
         8fjhKGdwZ0vNTopYutAuCJrmjDaxSrq7HqXub5rxw7q158UMqI9w7xl3WchX5ns2ba+H
         EFtTBv/GVBIWzlWkaLj+iIpREpv6SuhDgnSXZ+4sorVD763e53dz7eEtWHwK1H9wog5W
         4cZ/qXqrCHh3tpZOyf+jk4VK0+ZicsghTGWfHIje4aZ7/YYILt/TC7nnTXJKINmyOlN4
         ndyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wLr6pmJRHmV7zC+rbA9tBL4C1JcOIJS0180gvtWPDfA=;
        b=e3TnfKIFdUEdPp/zM/ZKKaNDqdgNgm0IdMi6V3rIX4AEzPatB7QskzwWvLLxzAT1+A
         CQHg/SmSqWJc9Ih0dKYfXP1KJfPHqImnGqKFIqo29iTfUB51ny3q7MHnUJbFnilqcQ2c
         pMLr/KXfE9JYhx6YBULoIR3N79/E22WLwe7E6oQ6GSfnp4RVMtW30ZpWV9ym+u4r5Clt
         zoiOzB4OnstQMQWmO21guGonZhrfLvbdXvucchO8kkgyVM6rGgdj4ehRg4HU1u07qGbN
         eECvLGkJeeOSynRsy122J9rJ6DG78OHYfRrlgZvb918bEho81P3w5OZ5DADBkBQzKECP
         KqOg==
X-Gm-Message-State: AOAM5306Wb2cp31sGmTeAK05SC7uJ2gYU5LtsZDp4+RtdUm8sUo+if5c
	gH4NLENN0aP5ElmJwLYdNxYgIVTAjYQ=
X-Google-Smtp-Source: ABdhPJzQXQ0ABTnCtm2KGnBFL7G248eqVw9VUU1ce51W/SMdZtRJEtuDCmXr/0tbAEjMllS7SPpbYw==
X-Received: by 2002:a05:651c:118c:: with SMTP id w12mr15532127ljo.405.1622445954974;
        Mon, 31 May 2021 00:25:54 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.201.30])
        by smtp.gmail.com with ESMTPSA id u11sm1245759lfg.243.2021.05.31.00.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 00:25:54 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: sergio.prado@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] u-boot-tools: fix a mkimage signature issue
Date: Mon, 31 May 2021 09:25:37 +0200
Message-Id: <20210531072537.19247-1-liu.ming50@gmail.com>
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
index 0000000000..c665c81b61
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
+Upstream-Status: Submitted [ Sent to u-boot@lists.denx.de on 2021-05-31 ]
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

