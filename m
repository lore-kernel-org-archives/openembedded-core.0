Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD21C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 17:09:41 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.59788.1699290578327081757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 09:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecYhOOFu;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6c10f098a27so3528789b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 09:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699290577; x=1699895377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAjcuaTv15TOKcvnSMwwVMz87DqqVfdp0hUhkjexXDQ=;
        b=ecYhOOFu3Em+5UG7cc7GIaLupkE4rhthf0vO4TLlxEjuXQz05nEdTKIbnMePhd8Xri
         I23WqrdhGm9aiFXqaxnrk33L8F9LDaQDvhQMx2c0szPc2GAOKzAgXYzpdt4F0ubiOb3q
         TwF0A082+rcaDUzVLwC4/vxp5A5FJfNf+8fa0yEI45MO92U6+IU6J72veWakqrpdruoK
         E/Q9KXJSI4kr6cfyd+s1kLxsP/FD1wYppDxmo99Wc/nTt/K7hfSeSgzviExXWNIFF3Wz
         3O8LAxiEXmRFo+mt6eTDP68+z5NBMv6OzKModA4iW7efU/hc7UBtgfRl3/Oavmil6F/t
         oSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699290577; x=1699895377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAjcuaTv15TOKcvnSMwwVMz87DqqVfdp0hUhkjexXDQ=;
        b=LwRSqm/fZEDwZlYlYJMo9YLKO7mcP3e6K/yj4O9KwNG931ZLRQNUsqrQhG9k14Vpqo
         D//BRfVBDIY6ZmNYHLQ0xlnPsgDU/VBpbDp2OfgIG/IE2xKJsZaXPolLej5QkgByiCXz
         g6P8+YqKVG5x5MqxaklnipedkJS8cDCjF+fJliHCwidLyXUrkoe/rYRkYJuvN2OyrC6F
         jX9oHBb3sGGh+XRNu0cz4UDhemgeOYyo8Ms0ty4dEiDGSerUilJR5Odnz161P3h6j2lG
         Nros5G6LNAwb81CwLCUinNPpPnBJaDHvjxaVkiEFXCbNd9WlEL/EBlAP5ohy8bELGa6a
         I2AQ==
X-Gm-Message-State: AOJu0YykoaLxupAVvh38HYBpttoWeSsLCsYGTqmL9tssVQ7fwmLzyeb0
	VvHfVGIr7BGoiGGvFIz2ti2T6Ht0w91i7Q==
X-Google-Smtp-Source: AGHT+IEjQ0ifWygJebrm7/gzJtlQRKrNE/Pyk+81PYlCHKHTVExQpi5WjbZ7TuzJi/ix1bBkPPObFQ==
X-Received: by 2002:a05:6a20:1608:b0:17b:1f75:e3f2 with SMTP id l8-20020a056a20160800b0017b1f75e3f2mr26896221pzj.39.1699290577256;
        Mon, 06 Nov 2023 09:09:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id d11-20020a63fd0b000000b005b82611378bsm40704pgh.52.2023.11.06.09.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 09:09:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Florian Wickert <fw@ferncast.de>
Subject: [PATCH] systemd: Make libnss-mymachines conditional upon packageconfig
Date: Mon,  6 Nov 2023 09:09:34 -0800
Message-ID: <20231106170934.3738696-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 17:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190239

nss-mymachines packageconfig controls this features therefore add this
dependency only when it is enabled.

Fixes
    ERROR: systemd-1_254.4-r0 do_package_qa: QA Issue: systemd-container rdepends on libnss-mymachines, but it isn't a build dependency? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Florian Wickert <fw@ferncast.de>
---
 meta/recipes-core/systemd/systemd_254.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
index 8a8ff545995..f22e5bfd059 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_254.4.bb
@@ -542,7 +542,7 @@ FILES:${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
                         "
 
-RDEPENDS:${PN}-container = "libnss-mymachines"
+$RDEPENDS:${PN}-container = "{@bb.utils.contains('PACKAGECONFIG', 'nss-mymachines', 'libnss-mymachines', '', d)}"
 
 # "machinectl import-tar" uses "tar --numeric-owner", not supported by busybox.
 RRECOMMENDS:${PN}-container += "\
-- 
2.42.1


