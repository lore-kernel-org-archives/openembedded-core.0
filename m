Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8AEF47CD1
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64681.1772781781314431746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Sb8miqhq;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48069a48629so93016135e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781779; x=1773386579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bLPa5jY4pi+3Y6AVIFMHps4m5gKi3qzllo2uEN40RU=;
        b=Sb8miqhqRK7wm4NWn8wdtn1OEds3bmx2qbfun8o4aBsjpfOBVOYT4pYkADknmnIS4N
         9LpFquzfsBcgnkGyvsZ8ZHsLrti0UJicLQspXglIzptCEFeMpk5JoDlDwZVcCafTVtm7
         VLcPE/jaGfhLT/PCN10NdYb7s2KO0riV7Tybg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781779; x=1773386579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1bLPa5jY4pi+3Y6AVIFMHps4m5gKi3qzllo2uEN40RU=;
        b=MzCNVInhqeRJEn8jGXNwokh4uP5a5O2RQuFhpdy93KCZLCklPDnK8eB03Cm+Q6xJ/O
         6SkUElNuM3UwWWvokKXM9BTA1kNOB61yObMdhZAfYwsE+QFlYhQ8iAAYFvHSP9C5vRAA
         26iAsOVtOpC1kW8mkZ/5x/rHuTJpBp/VsVTcinHbymtRZDhIaEyyupKeTeemKAKb+Jtu
         QJg71hyhY3W5zBsWRy2LMCno8zY5pm0hkG939YaB8HL1pgOswveC+XvatZ/IXq2b0c+P
         SMTPYudqdS1KxfSKjwp8ahoMvwuiyIMIJW6+shGkMbjjGrtu8wOh1lvBfbyLSrFvMOV/
         F4ow==
X-Gm-Message-State: AOJu0Yx+xTCB9PqeJheN+cau0EQq9ZN6HnwF46kHqzwH6lb0kSxgOK/r
	GLkB/jzU2Y1MMhzVIUp1JxYotEg59oLnL/Rp2nyJJL78tKeMN3Nzg8z8V0pL43QpU4vBbV9INE9
	6JFrd
X-Gm-Gg: ATEYQzx/rSyRDr60tq+mySgMCFlxzzl57d/EtN1UrADs88VRvOIp6l+kHtJYJjv8K+8
	K6ONXkxJTwO8sVg6yHrQbTjOHYm6cFZx1j+5Asi+sIw3UJ2Rok8iAaf8YpFj2UaejUZfAKIBTE7
	xf44I3TODoxbQhlPGYZbPEwQ5mKlKyTz702llq2gqocvG9mojuRFhzrOx0evCFXEi9GG6TFD7Tv
	N/xBOQvLN4IMhQ6V7/urBE97I1b/4h1vEVa94zyDKChVsADRlQZkRKzl1w5Fo1rE61S614diKpP
	lbqdcWukk4dstjK3TOsv0POx4iY3tPxdBlrb4OFNmirP1/uauqrsxU3cFcCrXgFNteGSXHR71DS
	XYxrcqPqZp1p+sLbxebOI+rvbWUEkd4m2qykNFmQi1ps69rifWXFwGQ04HKx6X2svtuRfSn2yCf
	ZtFpbLvyyeoFS6KITOvxFTVDfiIL9duDv7jedwX2vrHXxLH1qa3jlXsnD0mSCCXO5Ijgv75A1IE
	Q1ejnICpFR33SApGgVlUBVA+st7
X-Received: by 2002:a05:600c:3e08:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-485269675a7mr15047675e9.23.1772781779452;
        Thu, 05 Mar 2026 23:22:59 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:22:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 01/16] python3-pip: Backport fix CVE-2026-1703
Date: Fri,  6 Mar 2026 08:22:01 +0100
Message-ID: <6fed4496c22058b0cce06e18eab67457a7873b10.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232540

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 41 +++++++++++++++++++
 .../python/python3-pip_25.2.bb                |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 00000000000..826f483ea21
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,41 @@
+From abce61e230c47598ce836157d075608595216a4c Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v4] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 0ad3129ac..7cb3de3c4 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonprefix([abs_directory, abs_target])
++    prefix = os.path.commonpath([abs_directory, abs_target])
+     return prefix == abs_directory
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipes-devtools/python/python3-pip_25.2.bb
index 350092d9ad0..496eff1f15d 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
 
 SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
 

