Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211C0C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:28:07 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.20177.1703075283264206213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GhDD2jn+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3367632ce7bso1146605f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 04:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703075281; x=1703680081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDOFynE8RojLtpMb9dLOvsEKUq01O+zx/ZaGNk2miD4=;
        b=GhDD2jn+T7bAtu3X0NXsGnuOnWQK1b5mnfm1h9Ru0jr+JXZMYmMONdRBU0EKXrWNd7
         IDJ5PsIWReNJMXMR9ADyW0yByZzDZZ3nvANWYWfWj87qUz1Pog3RqrvvLwrKUp8jjBCZ
         GHvzyHGXw/UWBQZ/HWdj7068J9wvF7KbVeUkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703075281; x=1703680081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDOFynE8RojLtpMb9dLOvsEKUq01O+zx/ZaGNk2miD4=;
        b=tiffMeoaKbFVLgS+fWfYraO0coQi7BDuAUaH707n1UdPJbvKFDFLO79aR6pDSkxoIP
         KYgYnFP9ySGsSOxixzrJyqr6LE/kyXhaKtzHJNO+UBVbu79ixPPIf1TyVBkw8VFqY8Gx
         WkKr6o7Zp8x9vNdeCVYdlHGTwCxh+aVmNVCjPBDFEZg9DmTc3+AKOJEKmlmN2iLxKPOD
         /h8lNN5b8MUH0v86jM99NBG48KAW8ZXkfdxJRGwU4M+xZSawVf1C9ioT9wdAUMs3H9vF
         ww0ZgLBC0vhIzauHy2d+6pYLtQXF3AoBY23Q5FCrf7T9sJhevQwEAyB2KqRQ+RXu5xoE
         P7Tg==
X-Gm-Message-State: AOJu0Yznayd6q5Va3hcropjwiCKdw3N+pv/ucO1Iwknc2RWG/IwxnEGB
	NSeMDdgNxeTTZ0wZ9JPHP/HY36sei08KwTD+3NQ=
X-Google-Smtp-Source: AGHT+IFND4CUl2CiDSkiDziLk8t4hJqc5ob4Zzxf+6tCgjVBDrFrvQrcs3SpRZG3pZyzsW1M/02nbQ==
X-Received: by 2002:adf:f4c5:0:b0:336:6102:9c04 with SMTP id h5-20020adff4c5000000b0033661029c04mr3644091wrp.125.1703075281516;
        Wed, 20 Dec 2023 04:28:01 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b0033642a9a1eesm19170000wrq.21.2023.12.20.04.28.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 04:28:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Ensure pip and the python venv aren't used for meson
Date: Wed, 20 Dec 2023 12:27:59 +0000
Message-Id: <20231220122759.3639685-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231220122759.3639685-1-richard.purdie@linuxfoundation.org>
References: <20231220122759.3639685-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192797

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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc          |  1 +
 meta/recipes-devtools/qemu/qemu/no-pip.patch | 45 ++++++++++++++++++++
 2 files changed, 46 insertions(+)
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
index 00000000000..64d6c8a77bd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/no-pip.patch
@@ -0,0 +1,45 @@
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


