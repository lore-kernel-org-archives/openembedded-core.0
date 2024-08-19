Return-Path: <aoifepowerIris@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B9C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 14:52:08 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.212320.1724079124534070069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 07:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUweGVME;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: aoifepoweriris@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bf009cf4c0so915342a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724079123; x=1724683923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G94sXs7C8tJS5Wp3qeh1MxTcK9dC2dx1YBLhwXqwQuw=;
        b=IUweGVME9lIXQQdey2ddrvXq+4b4oHNd5zDwdU1o9hdS78cfwAdqnlHwUiQ4HzIfEx
         Y6SHhXZpEn5SbLw1HiBuL8P5fIBOoiT7evjq1n0uofaqqkp/ERcDTbgQCj03I+hQkJNm
         UZrpzuXhbR+2Ynt/st+zmZxvgjol2r5g1m4u1zKa5bfAZsKRit4yF7lclG/e1DQxVhwF
         BwaXZvgpFApjvuek1AIIiRa+YVphcdUHUpilIuisxW4Xs4IMnrR2U0qDTpnXNJms4I3t
         w4ppuplxn9aSNjNv/xI+eJTMGvVS3EP6l6EkgEIrIlIY2r+xHafzWaChJXi9lfAzlRzO
         IBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724079123; x=1724683923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G94sXs7C8tJS5Wp3qeh1MxTcK9dC2dx1YBLhwXqwQuw=;
        b=l/pPAWFjYAGCfx+X4uRd0r6IFEkbQ0+eJsbabMQ7C/uSh6xActMwqRHdyGdde0ejcu
         c7JovrUpU8AAHMuSAP2sZ6nfeKRqzDigCaBTE0drMJCgTIQc1jPhhI6IejQLBaYXK8ME
         bGderbM+IfNO5rPhqdpIOQl0pFLSXwtekJ2rOjWLXL0u/DE9zo3aULAUNr7cgJbN5DTP
         t/3ofLKa+NHKpaIC3zF0CpFRtCiE4+nFi6wDdtBoOxxfE68UYm1o+sWBfQLwVvVjcl5r
         d27Zhl7MM2Sl0TijLdIRAq1kC41mhsDxcvK/OYJIPVBX6LzG5hoygxUv1moP0CRQc7pv
         ckJw==
X-Gm-Message-State: AOJu0YyM4UwzqQc18h4iSFtzDZmjbcmr6DxibvYKT7b0mlyVKALZ5cYv
	9alXyLOsVkqjgodiyOXe4NWH7WojLbpIRTJcz4eAi6mb0TesW8JhhQ3rQSLB
X-Google-Smtp-Source: AGHT+IHNbEEIDB/calRJ3lMiPOI6ck126y/NF+vBCiCxNUeymitFR+lstJEGqxxppKkEuZ0wPezX8Q==
X-Received: by 2002:a17:907:2d10:b0:a7a:a3f7:389f with SMTP id a640c23a62f3a-a8392a49534mr736628166b.66.1724079122599;
        Mon, 19 Aug 2024 07:52:02 -0700 (PDT)
Received: from aoife-21fa0006ge.fritz.box (p200300ed6708c8005d3e7aaa00dbdb4e.dip0.t-ipconnect.de. [2003:ed:6708:c800:5d3e:7aaa:db:db4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86430b859fsm5676266b.36.2024.08.19.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 07:52:02 -0700 (PDT)
From: Aoife Power <aoifepoweriris@gmail.com>
X-Google-Original-From: Aoife Power <aoifepowerIris@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jasper@fancydomain.eu,
	Aoife Power <aoifepowerIris@gmail.com>
Subject: [PATCH] Util-linux: Adding missing ptest dependencies
Date: Mon, 19 Aug 2024 16:51:40 +0200
Message-ID: <20240819145140.582935-1-aoifepowerIris@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 14:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203508

Missing adduser and eudev to RDEPENDS dependencies for ptest

Signed-off-by: Aoife Power <aoifepowerIris@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
index a1aab94055..f1c200c28b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
@@ -139,7 +139,7 @@ RDEPENDS:${PN}-dev += " util-linux-libuuid-dev"
 RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz diffutils"
+RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat which xz diffutils adduser eudev"
 RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
-- 
2.46.0


