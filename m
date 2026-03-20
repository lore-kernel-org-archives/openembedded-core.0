Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C23A1088E74
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2629.1773966515053897700
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dre9iHKz;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fb14227cso13601505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966513; x=1774571313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tqn6qc6TWnhdqWOpPDIQUgD7qCGtt+ZIMcgv73AylGo=;
        b=Dre9iHKzCYdyRgByZLs5yC4yNQnqabJq0BG6NUbawpYnkRbm1Mmka9lgHNmZGG9DRd
         j3x33rmKRXcu60GY8RDBlLXjf/u7sNdWLrJ6YThdCJYDqXpolvZmQQXvLEI8dhT3KjKd
         LyO85XQ0MW4o/4JPE/EvGEmr9tTT0V6Bb8jBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966513; x=1774571313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tqn6qc6TWnhdqWOpPDIQUgD7qCGtt+ZIMcgv73AylGo=;
        b=lbrue2YYJMxgGJCFS17ihUJ1/7AmtM2kh21VCN/Tj0mgKaT/XUIyK/JhvOMtoQ9sI8
         LfriwWKzJFF/vCwaX3sO0kacj/jVw7KCQ1Waw5pzgFIq7KNcYwZqpHUMGazvwuAv897k
         eG4c5bifFH1p33QsTnacN3gXlxZHcA3iF4uHOKr40+bV3eDueeBzJ7wTfuz1Mt2hVu5L
         JfBYYGgsCmGmgy6dGGcbCL8e5Ze/ugkarAa2Agykm7ftKjssgw/bsLtKPTVybzfVE1FM
         sfsg5kWZgJKKJ7rlP3ONmkdGwD3TM2nU6kQ5oypHEuHCR39T4/75xNeLORBeUnRQ4ydM
         lNTA==
X-Gm-Message-State: AOJu0YxrDMmBEVdcSGsxfcBIjPV1jcB0sUEtfd3pi37opBZybogHxl2J
	3sYeKxvDoetUVUickD0GvYruqd+Aaj40wMAzr3/D3lXEWehKuA7cgw5PyxChYjQJCSQkZTT1LMy
	xT2CH
X-Gm-Gg: ATEYQzxPmylGZz7KnHS5ymFAdDdys//AjJ+JhrgNOIJMcuwURw0T8ycaoKIHYw96sbJ
	ysOO2c012gpIDbhsmh58TdWESQoJZYPLz7t91qXydNFcc4F2Pu96NyEsE+OKZ1hXf2UrwqnUuUf
	TiFx0sXOyClYlJvOOCWbE+yiDCfG78yh1BQMpe6yy5GKx4BkvpMMII6CazCFMmgtsC3YAQwemS3
	ryVVW0d+ptYT52trI8/lvnZJuJRxtCYgl68i+cVmV7QAbrZR089CuQHeGA/X6WwVZ+ZOAsBp6oN
	63+JEYyOQEALj+ApPszWS9R2LSBv3FxsHDyFoynMh2GVog6e342LpY4BjiCMUGsfgCyKxTEerY6
	G0KuT537XqeGj1t1+4THW2gD/1VfyS/yiI2lMzKSgOWFgabpwmMfJl7YiskBlxuGlOMDc9ZrfGn
	c4KCXMF+9Q4HUwaUMRFQDQxKYqzRhga6y5iZ2g+I0ifdNtEXXu74Lqsf0zqhb1E74yVox4CXl+z
	nkFk5ev84HnqBus1rcUtORkZkY=
X-Received: by 2002:a05:600c:c167:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-486fedc3843mr13926065e9.11.1773966513161;
        Thu, 19 Mar 2026 17:28:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/15] python3-pip: Fix CVE-2026-1703
Date: Fri, 20 Mar 2026 01:28:17 +0100
Message-ID: <d39069d89c3f17123e9161ca3f870ad5e353a717.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233571

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-1703
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-1703
[3] https://github.com/pypa/pip/pull/13777

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 37 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 00000000000..1470b7c541f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,37 @@
+From 4c651b70d60ed91b13663bcda9b3ed41748d0124 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Fri, 30 Jan 2026 09:49:11 -0600
+Subject: [PATCH] Use os.path.commonpath() instead of commonprefix()
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/4c651b70d60ed91b13663bcda9b3ed41748d0124]
+CVE: CVE-2026-1703
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 0000000..edb1b32
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/utils/unpacking.py
+index 78b5c13..0b26525 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> bool:
+     abs_directory = os.path.abspath(directory)
+     abs_target = os.path.abspath(target)
+ 
+-    prefix = os.path.commonprefix([abs_directory, abs_target])
++    prefix = os.path.commonpath([abs_directory, abs_target])
+     return prefix == abs_directory
+ 
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipes-devtools/python/python3-pip_24.0.bb
index be4a29500a5..12a5e1cc3cf 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI += "file://no_shebang_mangling.patch"
+SRC_URI += "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+           "
 
 SRC_URI[sha256sum] = "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b718fe6f593aba2"
 

