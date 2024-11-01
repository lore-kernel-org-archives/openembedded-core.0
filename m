Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3C2E6B27D
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 14:14:55 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.38991.1730470492100695654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 07:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G0GLVK1s;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: hiagofranco@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2890f273296so903174fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730470491; x=1731075291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ymrlopzJGpZCOiHuacPYoKudvkUsM3UniaX649Z9xg=;
        b=G0GLVK1sFfqNhFaJQ/hOroCSWE1wvIBgb8bW104eTxYfOGXQLw1dKZk8VlZwC3gmql
         7XliJeHDoQGMpZRK+aU5z4trrhKgTh5R42xDGI1I7JbfBwbxx3watfWYIL7uaMnW0KT6
         Ofi0gfu3SzreBM0sbOXvCG4Sd86UZdSQvZEVOIq0oGJNHsGssmPFHm6IDMlvCa2fph5o
         m032PV966PhvaTpuAHlMmMX3uCoWIDXa1tSe3nSps56UGKXEbnpBiY/dv6NgRwUnspiz
         46UDa5T0jANiSowGJOqRMSLK/NpwfyNTpZKblehEG8vU0qvJS3Z7otsmhGWQ9Jaxl8kr
         VXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730470491; x=1731075291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ymrlopzJGpZCOiHuacPYoKudvkUsM3UniaX649Z9xg=;
        b=kEWMR7V52ICJJwKQSpRIzjbyFHYmjL9lqGoBeU7SFZ01IT86UqoOG3Q3554Ke+QAhr
         9Pa3NGqwya58BtpVFNeJZtgAS2JLTYGPdWxZ2RF7GlFmytuXs0ZNgCvBv0o2LArqFuI/
         6ThdgbPjj+5TB4mbjUCAnjkbDwAEaqpaa+FnogsBKKcXRoi2QH+pM51MSQRoJV2uuzE7
         z+EZj5/1Rt/TTOpVrfpmPAHQRcx4ktGmacWtb71bM1NLAAg3De0be7F4l28dwhsJuvcp
         jg0+IC3EEGFnoTkj8nhE2rfsA+lWvMMYIG0YaUuk9X5lTf+mIdAhyS906AaKVnzpkyy0
         139w==
X-Gm-Message-State: AOJu0YysJIrol0Xs6vvOufTrPZ/8B4L7nKkF2Vi56siKzxVhTnJ1ygvd
	i8dKpbevu0/CBvDTU6FtuzH7bq3A3x0cZZwJI8gejviIPxbnrK+W7891IBS5
X-Google-Smtp-Source: AGHT+IH85Ko71FNdaFnS3ExfO/pJLl/g8YnqHbvtzgOVFKjbzeh6XO2JDi+GPT3xx9RhtjmyBejjgw==
X-Received: by 2002:a05:6870:e0ca:b0:261:16da:decb with SMTP id 586e51a60fabf-29051b6bbefmr21188534fac.11.1730470490690;
        Fri, 01 Nov 2024 07:14:50 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee6b2953d7sm374787a12.29.2024.11.01.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:14:50 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [oe-core] [PATCH] weston: backport patch to allow neatvnc < v0.9.0
Date: Fri,  1 Nov 2024 11:13:54 -0300
Message-Id: <20241101141354.44546-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 14:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206622

From: Hiago De Franco <hiago.franco@toradex.com>

Currently weston 13.0.3 with neatvnc 0.8.1 does not compile when using
VNC:

| Dependency neatvnc found: NO found 0.8.1 but need: '< 0.8.0' ;
matched: '>= 0.7.0'

However weston upstream already increased the allowed version to 0.9.0,
since neatvnc 0.8.0 does not introduce any changes that breaks API used
by the VNC backend. Therefore, backport this patch.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_13.0.3.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
new file mode 100644
index 000000000000..4ac1c075fdce
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
@@ -0,0 +1,27 @@
+From 534cfa08ea0a0c2646b4aec20b16bf95f6d0aae6 Mon Sep 17 00:00:00 2001
+From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
+Date: Mon, 3 Jun 2024 13:39:27 +0200
+Subject: [PATCH] vnc: Allow neatvnc in version 0.8.0
+
+Neat VNC 0.8.0 does not introduce any changes that breaks API used
+by VNC backend, so it is safe to extend compatibility.
+
+Upstream-Status: Backport [05e5405651054c580b248c4ab2791ed8d66369e3]
+Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
+---
+ libweston/backend-vnc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
+index b7b6916..39b15cf 100644
+--- a/libweston/backend-vnc/meson.build
++++ b/libweston/backend-vnc/meson.build
+@@ -3,7 +3,7 @@ if not get_option('backend-vnc')
+ endif
+ 
+ config_h.set('BUILD_VNC_COMPOSITOR', '1')
+-dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.8.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
++dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.9.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
+ if not dep_neatvnc.found()
+ 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
+ endif
diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
index dd5b2e2b2700..471dc52bb361 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
+           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \

