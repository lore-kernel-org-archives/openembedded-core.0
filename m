Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DEBE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 08:57:40 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.148472.1734685052216370786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 00:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZI3NWKML;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54024aa9febso1776247e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 00:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734685050; x=1735289850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjey3dQZqIgZv111LfLZ7I2Rf1SvseQm3+rkGxnAboM=;
        b=ZI3NWKML9HpSITuQAjgG8UvdLQtVVjtiEVbMOP1i8aI4D/1Kquc8/z9DsJbrYkhT0o
         PS2kHFhb+C1WkrRasGX3IXlXR91A43MVuAKC2r4E0LZ4Gq9DiK3192xs+md+wMFQC0TR
         6Dk9f8INNyZFjdw/llsxw9IeHhAH2LJpZRwfJnw0xaeypcDWHHId0wpOuMtpCWjcSozp
         e8Z/+UTQA2/7cYk6/GWFeUnJ+W293uBpCYLRcae/N5pG3OuNWHNhZDZ8WpHqb1QmICsd
         L90uOPVT4SUybPNb9wkOddD5UtXvdlLUoa0e/1njkxEvX6wBpMnIJqtgPn1fB3yvcfY2
         LzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685050; x=1735289850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjey3dQZqIgZv111LfLZ7I2Rf1SvseQm3+rkGxnAboM=;
        b=Jmca/ftkhCD1zqQYiKWyyJASWP5ONu9/R6PAVwUYJxO3bvvLvi/9mcI59ATuW/vp1E
         EACQKyq+TP2R6UhPoztWj8V81GDdgLhnjgWECNhu7ZeSi0m0g6gELRnKqqOQfdobiW9P
         SQcuak7AXIqDOKrHlrbBl1wy5QFxhuU0BU1ZVZHLyuzC/5D2Y8GLbp5fh/iYHKUcj5ZL
         xJzUL39Iys06mqA09xdg8/3BBNbU1SXB8ZON7zRwlS+9BvyQZ+/oWmYDhLMdR+xYEK0c
         426QovHyolfnfZnLORWJR1/w6UcgpYAaIXDst8qnk5A6KuQ8G0rjvum1BsPnrts7fTT8
         trSw==
X-Gm-Message-State: AOJu0Yyn9C3kdwEGDkGescJZq8WGAkcJ+JiqTbuhzbIFhVp+ixDxb2PS
	iejmGY+7mp+IkWN25oKUbZYPPaVILYq9XJ/NFNXGCGSdqsTlzuOR4I2oGf6bVgS6pC/C57lZCnB
	q8BU=
X-Gm-Gg: ASbGncs6I+jTr454CQgINmF0Zy21fYglP2nQNBsCtof1IJyry/6sQbOJETllbDLdv0x
	qpKLGHB+foX4AiKk1oRrcTlya9fGAkMtVjif0sQa3q3AzQAdUz2S4k51ZWyukfZhkwFXYuiVer8
	L0YCRL04A5TTmoMJRDj8FUNES4QcTglqt5e6KNkxcq9DMrVESKnXLhyYNNBMd1JMiwRUgsbjsu4
	7WpPyQ2ZgA08v3iYqu7/R+nYIAJzucnHvflaF2GLhmKK8NBfFK0uyq7hd/dKDpFjt7TLgAlRUGI
	xvd+GjcF8qA1a4880r6VouSEGQ==
X-Google-Smtp-Source: AGHT+IGHpmZBIb3UZQajmeEKABMpoHoFm6PSW05dgYil+G4xJaMvrljivcQUHf6yBWMEZL8VcydlYg==
X-Received: by 2002:a05:6512:1114:b0:540:2567:469b with SMTP id 2adb3069b0e04-54229533e5amr644394e87.16.1734685050250;
        Fri, 20 Dec 2024 00:57:30 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54228744c06sm218186e87.219.2024.12.20.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:57:28 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] systemd: add apparmor PACKAGECONFIG support
Date: Fri, 20 Dec 2024 10:56:59 +0200
Message-ID: <20241220085700.228006-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 08:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208969

For meta-security to enable with "apparmor" in DISTRO_FEATURES.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_256.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-core/systemd/systemd_256.9.bb
index a9224915c6..c047964953 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_256.9.bb
@@ -69,7 +69,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -132,6 +132,7 @@ PACKAGECONFIG[serial-getty-generator] = ""
 
 PACKAGECONFIG[acl] = "-Dacl=enabled,-Dacl=disabled,acl"
 PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
+PACKAGECONFIG[apparmor] = "-Dapparmor=enabled,-Dapparmor=disabled,apparmor"
 PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
 PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
 PACKAGECONFIG[bpf-framework] = "-Dbpf-framework=enabled,-Dbpf-framework=disabled,clang-native bpftool-native libbpf,libbpf"
-- 
2.43.0


