Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.394.1614289131421571750
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Agi5l+NQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id q85so7171965qke.8
        for <Openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vm/V00lE0cfJNiLyucuC3pf5SnVGcjg0aR3e6NoRAlw=;
        b=Agi5l+NQEwGC8j0tFpXE5W6eye8/9s7Ax/Y3PGF7DkUwUZX3Or5YP68lLeI1rCRWD1
         rdUdZJpmCKZZD9jj3R734JjnhChW0c+ybC67nXnxc/G9nD7UPhhLbCrOTuszGtTJ6NSW
         bKlCeucjPupDiCTA0frb7nuTdQ6eEjbWCvfD+M82sjT6nDAO2DPNg8CPAI8z1z2GgjOZ
         uA9jBUkto3QH8kW0BhyxLmrG6ir2OG4mfwIfLDrPkz4ubjXweT0+VS6Cni07Fu+qN28J
         qp0hTNxMnfe3skQYtcYUDBWenDlnDFbyxI8Spv7Lz9Rz9apTyudFqPXH3rhN9OCjd0cX
         cSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vm/V00lE0cfJNiLyucuC3pf5SnVGcjg0aR3e6NoRAlw=;
        b=c2OsJpOaskWoZQqMyUTwudoFJoqXvP88OpIa4/dlbd0w0UtJaxLzxPE+cCvvthFK5T
         IEnnXuFbNXdKP47E9hWkMrXBUb8/9gt/HlVwpQ4L64+XkUcm7GnfjCWONxV3TecZR8hD
         htPsldin95l5IzkVpZxtkOgYUi4cq5zSqi16uSqGHZyM2VIKzj2UjSSIhTEw+PPJQj7w
         ErfLsMjVkZb59f2tmUyvJk+o8VcwOl39rKTAeX2+Ad7zhjaR6fTeTQTIA5WKvisZ+Iim
         sJoY8KjlbK+Sm0bZpOPxEbQQwIM1t32gD+231FTewZWGqIRK4cCuogfkqJldqg4saBEv
         beYA==
X-Gm-Message-State: AOAM531HNEEYwc0mJfxnMLj/hssbPC6mVxNPWaolAd9q/Kv3ffkXjfiK
	ZuQc2c6w02iC9m/FeU2O6ORqGKwUFv4=
X-Google-Smtp-Source: ABdhPJxQcNF8UU5WqewKGAd+RMfSEdMt8R2pcUAON5NNENjkrON67CTqbRnAYFIaa1KDO14LiZ22zA==
X-Received: by 2002:a37:5841:: with SMTP id m62mr4709609qkb.452.1614289130225;
        Thu, 25 Feb 2021 13:38:50 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id m7sm4456705qti.33.2021.02.25.13.38.49
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:38:50 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] systemd-container: recommend tar
Date: Thu, 25 Feb 2021 16:38:47 -0500
Message-Id: <20210225213848.2744615-2-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210225213848.2744615-1-vdidelot@pbsc.com>
References: <20210225213848.2744615-1-vdidelot@pbsc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If systemd is configured with importd, "machinectl import-*" can be
used to add container trees under /var/lib/machines.

But "machinectl import-tar" makes use of "tar --numeric-owner" which
is not supported by the busybox binary, as shown below:

    # machinectl import-tar /tmp/container.tar.xz
    Enqueued transfer job 1. Press C-c to continue download in background.
    Importing '/tmp/container.tar.xz', saving as 'container'.
    Imported 0%.
    tar: unrecognized option '--numeric-owner'
    BusyBox v1.31.1 () multi-call binary.
    Usage: tar c|x|t [-ZzJjahmvokO] [-f TARFILE] [-C DIR] [-T FILE] [-X FILE] [FILE]...
    Failed to decode and write: Broken pipe
    Exiting.

To fix this, recommend the standard tar package.

Cc: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index aaed047e63..8a30d7d795 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -446,10 +446,12 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
+# "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
 RRECOMMENDS_${PN}-container += "\
                          ${PN}-journal-gatewayd \
                          ${PN}-journal-remote \
                          ${PN}-journal-upload \
+                         tar \
                         "
 
 FILES_${PN}-extra-utils = "\
-- 
2.30.1

