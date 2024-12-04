Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80090E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8154.1733294985022052804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8HeVVsN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385df8815fcso3213690f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294983; x=1733899783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n1qv+obL5bJjJhpgfPS7aEeMQ9fQihT6D4sDPVCNJ4=;
        b=U8HeVVsNluM+X5sfv5Zi90GyFMXYiM5AVXnKPzgajQRxkaavzQ1E90Q1JPwsxQgKeG
         ht8rXgLS67OgjPbO8zFodeExed0iW9RSdioaZaWEYb+QMIrIWii0kkDkyICzAPSY5GLD
         54JO6CRqD55vax67H5Dnnf/FRxdMQhP+nxmWaUTBJZaEu/hCB3X/3esxUSbfBykeLJJC
         upTASHrphiraW2+980ZcCVouQ1p4jqFfbrGH2pMQx2LuBjyxqCGaEXrfjnJ1qjFRHUgv
         c3FhMZuDmrs/YKs2mq0Zo9GbUCZSAzTRv8MN8Re9Jzl7sjEch0Hj5GtFpeQsMTjohjpi
         rEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294983; x=1733899783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n1qv+obL5bJjJhpgfPS7aEeMQ9fQihT6D4sDPVCNJ4=;
        b=d+oeE0bMQQqQ0CaxVFWizLfegmFSsjMgXKluzCtPftXqxhn967+AJ1QZqaWqtbbVlt
         unvLVPybanqxsrG7ll1y89WX5pNUWvF5YzlQ5cG9PrxSVctc7FQP5n/2YJwQCkAf1zAv
         zwROYJASpgChnqBQt6mxjb9amp7BBV4h9pW7TtaP8iheQviMUB52CQ6ZizK/aU8rT03+
         DWe5OSGdwLwuCW6s506H5WJAhq0QDgzkvXbCDVA7MrRAcubKe4nw+qx+DVlYYZLYVTRJ
         tafywoCoyhOEzXTBzjjuqXTctPwsv4tVAHtwj1QHW9x6qbibPxFGMK8iKs3Q+CbRF+Ei
         o6lQ==
X-Gm-Message-State: AOJu0YwzEIAwy6/QDJpa4CFx6j8karxCAJPbG+OqQ4sKPGUJZTUZ7vbv
	DIl6YhW+V99/0nmDg2+VqFG6OgcWS+wMqJBknTmo0PFFMO7TVnCafIof0g==
X-Gm-Gg: ASbGnctJ2SH4M5X2MdI1i0Fv0jXmiMMr6zhmJdI53HROJEJKT9KECn2GT7xEFP86zsV
	r/y11OZhDexmeAAjcdblWR4vlBZdnMLOJ3mXWuL5fhDwGlAatumHLIt4R5rHVBbZxszctposEH9
	zYGO/h0zEXhbIqLYFEw2pIHsaEYkk64nx6lmvrJlHG/hIAGwbxmFyKsP+JLw/s8m9q8MgfISZ5T
	v0SmlqQX4FCLyKh0g6CRCXNQHPU1FopSjzPFJmlQQr+BgQQt5yMZARKWG7wWQxWcl3yYR0E4kGs
	6IAtqnYqHTQ=
X-Google-Smtp-Source: AGHT+IFrWcNhCDGvJSTzi/sNIDx7hidrH/WX3d0M9h7VrVJa1xu6feohWM4KoSj3dWN4B7Tp9rxCOA==
X-Received: by 2002:a5d:6487:0:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-385fd3ce954mr4246082f8f.1.1733294983283;
        Tue, 03 Dec 2024 22:49:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/37] dtc: upgrade 1.7.0 -> 1.7.2
Date: Wed,  4 Dec 2024 07:48:57 +0100
Message-Id: <20241204064920.817016-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208243

From: Alexander Kanavin <alex@linutronix.de>

Remove patches (both applied upstream).

Add a tests option that is disabled by default
(as previously it was inside a is_cross() condition and
so was always disabled).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-meson.build-bump-version-to-1.7.0.patch | 29 --------------
 ...n-allow-building-from-shallow-clones.patch | 38 -------------------
 .../dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb}        |  5 +--
 3 files changed, 2 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
 rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb} (86%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
deleted file mode 100644
index 79a3b92b448..00000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-meson.build-bump-version-to-1.7.0.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9153522103bd4ed7e3299c4d073f66bb37cb2d42 Mon Sep 17 00:00:00 2001
-From: Nikolay Letov <letov.nikolay@gmail.com>
-Date: Wed, 22 Feb 2023 13:36:07 +0300
-Subject: [PATCH 1/2] meson.build: bump version to 1.7.0
-
-[This was botched in the actual 1.7.0 release :( - David Gibson]
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=64a907f08b9bedd89833c1eee674148cff2343c6]
-
-Signed-off-by: Nikolay Letov <letov.nikolay@gmail.com>
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 78251eb..d88cd9f 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,5 +1,5 @@
- project('dtc', 'c',
--  version: '1.6.0',
-+  version: '1.7.0',
-   license: ['GPL2+', 'BSD-2'],
-   default_options: 'werror=true',
- )
--- 
-2.30.2
-
diff --git a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch b/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
deleted file mode 100644
index 0284905913a..00000000000
--- a/meta/recipes-kernel/dtc/dtc/0002-meson-allow-building-from-shallow-clones.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4415b0baece3c4351a6d3637c2754abbefd4795d Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Sat, 16 Dec 2023 18:58:31 +0100
-Subject: [PATCH 2/2] meson: allow building from shallow clones
-
-When building from shallow clone, tag is not available
-and version defaults to git hash.
-Problem is that some builds check DTC version and fail the comparison.
-Example is https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
-Which fails to build with following error:
-dtc version too old (039a994), you need at least version 1.4.4
-
-Drop --always from git describe command, see
-https://github.com/mesonbuild/meson/blob/1.3.0/mesonbuild/utils/universal.py#L773
-This will make it more closer to build via Makefile.
-
-Upstream-Status: Submitted [https://github.com/dgibson/dtc/pull/122]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 78251eb..fc0c92a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -56,6 +56,7 @@ py = py.find_installation(required: get_option('python'))
- swig = find_program('swig', required: get_option('python'))
- 
- version_gen_h = vcs_tag(
-+  command: ['git', 'describe', '--dirty=+'],
-   input: 'version_gen.h.in',
-   output: 'version_gen.h',
- )
--- 
-2.30.2
-
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
similarity index 86%
rename from meta/recipes-kernel/dtc/dtc_1.7.0.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 0702fc16dfa..b17cfa85e79 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,10 +10,8 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
-    file://0001-meson.build-bump-version-to-1.7.0.patch \
-    file://0002-meson-allow-building-from-shallow-clones.patch \
 "
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
@@ -24,6 +22,7 @@ inherit meson pkgconfig
 EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
 
 PACKAGECONFIG ??= "tools"
+PACKAGECONFIG[tests] = "-Dtestss=true,-Dtests=false,"
 PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native bison-native"
 PACKAGECONFIG[yaml] = "-Dyaml=enabled,-Dyaml=disabled,libyaml"
 
-- 
2.39.5


