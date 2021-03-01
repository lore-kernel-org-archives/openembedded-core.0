Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.85.1614617608118631480
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 08:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j4ok+QOW;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id s15so12511557qtq.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LMYPviDXeZC4+E0px/NF5z3B8zYvbyFC/QMJ2cjhd7g=;
        b=j4ok+QOWY66WZJ24GZnxiT6AYb606CBi/pgi2BQqA9Sp8mTHrOMwpoTTDKUGABSWE6
         U+kW8/Me5MCftPwXxyEs6y7sDNSbl7lsm3mjitEontq05wmVw3baNCWMO/lEZQ2fCLg7
         dx13S+HcaUNba+MB0/AYJLtikXqzL4i15ctt997nUisPzIXmi6V96ETy3ogBsKn19wTo
         Y8DQGPAF1pDKYyuIuVPPf+wPUkna4nubZgzNXx/BR45HJtdhvBZqOWE/CI/H4BX4jK+A
         nRrqXRicj5CGTDjDvC+aIrN8zCfWiYzcZ5X9VDeHo/rmCJSkl0KiNIbvTKESkvtPnHtS
         Mdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LMYPviDXeZC4+E0px/NF5z3B8zYvbyFC/QMJ2cjhd7g=;
        b=IwKRodn3nSwizFoH6fzb6wMdi0eL+zzWeKJw2V0g4gbqcOwRyyP97lBfVzc8RWB+5L
         rZ/vY35sJKkHg9Q/fJHiW7kXfepHBeJNe71PjJGoJq35rL4MD7L6z19fwF6LjsLFzika
         xd2LfYJNwX9Crjj02Rge/xQW6Vd6Da8VSqkyY4M6+DqkUF9Y+2qzDOFgdQSIra5fuIdv
         LkBNik2v6xpWlQlv6gx+r03lRKpnVEU4kBzWPtk9u2xS/9Wj2COpl02/PujdBKBElnmZ
         SWV9DENlHGCOpymbAxz7UkAKbiBOWURcATjBPukRDJ2Uh2qDG6uRrfbxxqwm2J8rYzCk
         aBPQ==
X-Gm-Message-State: AOAM533xXSAVOr79KPli3ZXJWsVGXyf+SqOgXr2R3AaxuEGiWLGYgXXM
	Fmegylje4484XlKi62N7efbPp+QFIM4=
X-Google-Smtp-Source: ABdhPJyORsdFR1dGWadLbQqtmntVK0FyVXAHSiZjvcU0Fmqf2SI8/jC5+cCaSGTLmPFOZun+X0wcsQ==
X-Received: by 2002:a05:622a:18d:: with SMTP id s13mr14312360qtw.52.1614617606988;
        Mon, 01 Mar 2021 08:53:26 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id f136sm4992649qke.24.2021.03.01.08.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 08:53:26 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Cc: Chen Qi <Qi.Chen@windriver.com>
Subject: [PATCH 2/3] systemd-container: recommend tar
Date: Mon,  1 Mar 2021 11:53:24 -0500
Message-Id: <20210301165325.3987311-2-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301165325.3987311-1-vdidelot@pbsc.com>
References: <20210301165325.3987311-1-vdidelot@pbsc.com>
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
 meta/recipes-core/systemd/systemd_247.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.3.bb b/meta/recipes-core/systemd/systemd_247.3.bb
index 1aac754cfc..3454085e5f 100644
--- a/meta/recipes-core/systemd/systemd_247.3.bb
+++ b/meta/recipes-core/systemd/systemd_247.3.bb
@@ -484,10 +484,12 @@ FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
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

