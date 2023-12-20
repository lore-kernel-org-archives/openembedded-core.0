Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F952C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:39:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.19059.1703068767004235449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 02:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N091XSIH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d2e5e8d1dso12371325e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703068765; x=1703673565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uIpZpuqA38IPFZRuiUczrWwrspcnVdMKNM9clwiEp+g=;
        b=N091XSIHzTBHx9SKI5kRRKevX/2v9MFz9XvHjUbzUrB34PbBZnnxC/AT5/V0LakY/s
         GfTtjNY3GS4iotpikDJnJIX6fxRxTBlQlP4+sEgPTc0H3KgvaBF0ocbZQiTryUtqjZvz
         jTi/EqVEHAhaOu7wwpB53lwnx65LHlZMvROP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068765; x=1703673565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIpZpuqA38IPFZRuiUczrWwrspcnVdMKNM9clwiEp+g=;
        b=nrGPocHiV5BP92YD+fcJz7EGRJuqDdXZtp2yk+DWGLevYE/clbcNzt76Vm0TfzoeQr
         ZkBVouqvfr38PDSRX3opc+jgyc2KXCYfbkusJl3g6d01EhkqPatZKXMCsPRMe2+geNHI
         zapMPMGMrGdaZ6723OHTI8WbtLEVDdCReEBONgyD16Rlgaf3J/fcgLeoH/yI38kSbw/R
         E7ccHhyNW24ZjTJGBmM6PAjVQbYHJXNxRwXHBij4/+5NdMLo2ZnF1WZmgbf8KE8iMDQ+
         hXZazcmHsGniTG1FWmtPvZoEL659FXiTYnaPg7twXl3BQwkdgUi+r2lMw4cmW0kr3fMY
         cN9Q==
X-Gm-Message-State: AOJu0YwicGKhIOyPf9m705s5a6tHN8sWc5Zx01opdsUOeOgXoPprXhTB
	PobqAS9ucIUuXuzWQFWaPjtPtxfXfUef4df5Mio=
X-Google-Smtp-Source: AGHT+IFUJpIw5k+1hGM96kUpdO38Phd/kXVYn+9JbvULi8s7WR+TyS9SfBliAgJbTk1LpaUF4OZcNA==
X-Received: by 2002:a05:600c:4e86:b0:40c:6d37:8344 with SMTP id f6-20020a05600c4e8600b0040c6d378344mr3048997wmq.279.1703068764972;
        Wed, 20 Dec 2023 02:39:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c3b8b00b0040b3d8907fesm6054265wms.29.2023.12.20.02.39.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:39:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Ensure pip and the python venv aren't used for meson
Date: Wed, 20 Dec 2023 10:39:23 +0000
Message-Id: <20231220103923.3624311-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220103923.3624311-1-richard.purdie@linuxfoundation.org>
References: <20231220103923.3624311-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192788

Qemu wants to use a supported python verison and a specific meson version
to "help" users and uses pip and creates a venv to do this. This is a nightmare
for us. Our versions stay up to date and should be supported so we don't
really need/want this wrapping. Tweak things to disable it.

There was breakage from the wrapper shown by:

bitbake qemu-system-native
<add DISTRO_FEATURES:remove = "opengl" to local.conf>
bitbake qemu-system-native -c configure

which would crash. The issue is the change in configuration removes pieces
from the sysroot but pyc files remainm as do pieces of pip which causes
problems.

pip usage is likely accessing the network outside of do_fetch meaning license
manifest issues too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc          |  1 +
 meta/recipes-devtools/qemu/qemu/no-pip.patch | 48 ++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-pip.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9e187a09958..70515d980e7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fixedmeson.patch \
            file://fixmips.patch \
            file://0001-vfio-Include-libgen.h-for-basename-API.patch \
+           file://no-pip.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/no-pip.patch b/meta/recipes-devtools/qemu/qemu/no-pip.patch
new file mode 100644
index 00000000000..4eaa8dc3092
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/no-pip.patch
@@ -0,0 +1,48 @@
+qemu: Ensure pip and the python venv aren't used for meson
+
+Qemu wants to use a supported python verison and a specific meson version
+to "help" users and uses pip and creates a venv to do this. This is a nightmare
+for us. Our versions stay up to date and should be supported so we don't
+really need/want this wrapping. Tweak things to disable it.
+
+There was breakage from the wrapper shown by:
+
+bitbake qemu-system-native
+<add DISTRO_FEATURES:remove = "opengl" to local.conf>
+bitbake qemu-system-native -c configure
+
+which would crash. The issue is the change in configuration removes pieces
+from the sysroot but pyc files remainm as do pieces of pip which causes
+problems.
+
+pip usage is likely accessing the network outside of do_fetch meaning license
+manifest issues too.
+
+Ideally we'd convince upstream to allow some way to disable the venv on
+the understanding that if/when it breaks, we keep the pieces. The patch
+as it stands is a workaround.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+diff --git a/configure b/configure
+index 133f4e3235..e4c144b4e2 100755
+--- a/configure
++++ b/configure
+@@ -1009,7 +1009,7 @@ python="$(command -v "$python")"
+ echo "python determined to be '$python'"
+ echo "python version: $($python --version)"
+ 
+-python="$($python -B "${source_path}/python/scripts/mkvenv.py" create pyvenv)"
++python=python3
+ if test "$?" -ne 0 ; then
+     error_exit "python venv creation failed"
+ fi
+@@ -1017,6 +1017,7 @@ fi
+ # Suppress writing compiled files
+ python="$python -B"
+ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
++mkvenv=true
+ 
+ mkvenv_flags=""
+ if test "$download" = "enabled" ; then
-- 
2.39.2


