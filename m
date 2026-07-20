Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F16C44533
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2870.1784568219126788617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LnDnzUPP;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f6de72faso28434545e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568217; x=1785173017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BIlr+IYMMMmiNQ7BvA8ua5eFwJmEM+wH7ghMyOFCurs=;
        b=LnDnzUPPI8w0WLXPQr/A9MG5eBbwDdzxt8Lxky9hbKbNMhnPaNUYTDNoto0Wgtoju6
         T7Pvj5ZzFxp/4122fidRcBOWbwhdtGemrO4n2P1g6MH3q0pX0VeDIps0fkbKpQJ5n7KN
         x/r+aOfTqptGrAEx4fZH2ORz2d0GzefNnK/AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568217; x=1785173017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BIlr+IYMMMmiNQ7BvA8ua5eFwJmEM+wH7ghMyOFCurs=;
        b=Ef/wpFnVDw78alREFenu56p3w/ki+mtToqv1lxrbekbj5QRyfk3EgJHbe+jSwPA05I
         ElDvH7fwxSy6Hg+gUUEKcPPjNSE7vvKxe/TfqMd9GFQ94Rh+WUA/MswdV4E+xZJU4QWs
         w5lqsrluZlOsZSyY9QqR1MgopbRALibSQS4/vH/r3WYoeQtNu3vjPlQEWgBft+QnAjI/
         iD5iQtq8FM2Vq9PhhKW7h5JGskP/xdnDpD2M3shgCg7nnUCVsphQF32CgBxDPWOfGEgt
         v4rZwcdjg1vG7lT41fiJ7q/igIsIoKpbkKwyB+ZQvtZFksv9FkhPSU9k2wAXQpQrgaXT
         T2oA==
X-Gm-Message-State: AOJu0Yxzep55swGyV8txK17Z+4oIs4FMGfuas4KuR0cPtRzYYIWBlWdb
	u1uWut1juPsHxaAuLG24K5MTSC2LOLRC/0iYOWaofgCc1XFnmRf1vRtl+jAev2P2Ke0H1QA9Y7c
	V8JqI5qE=
X-Gm-Gg: AfdE7cn2r8CWk0vJ1zp7YbmU7R6kZxXhcVsaosYduuQVAvHWLiLz+9e6s3qx/wrkq/T
	/BGjGnk4GfzsRHkJGgmbLyIj9U6Zvma+8qoqL1GGmr95ZuR8/1C+pYgV3jDIVozXZU5VFKRO4VW
	J5VP6vhlxJ92OnnYFTtbi2i2Q0A1MVPuqnZ/rMYUgsr0ab9xUw4J3RaXLuJduYwwOuTtZd6QsU3
	Fmm2b8G63zntPVAw+iIMN7CKkX+Y263WRMqSnfBs0KEDJqG9d832P0CuVPXwsSsJzgHagrvQLe7
	xMB1gpvcjToDpiJejKBXeaF6EpX8yu8cG5ZfhNErAnyHVDCDmsB4lNv/Vi6LjAUj3nG6DFsSq9I
	2fyoWCjtKET70DlMOauNeLvIGyqeBOPY47c65lG1+WFZ0kC6qWr7UEDy+2NggBVr305XVMJtkEj
	ahGKPlpB6erC1KCHMVb3DVmUvrnTe/MhdI1uM7d+YnMoKL9JqXRKbK4s27AONNeGg9mvUi9KJTK
	NuPk2Au
X-Received: by 2002:a05:600c:3b88:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4954a3391femr167251765e9.12.1784568217437;
        Mon, 20 Jul 2026 10:23:37 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/33] vex: remove obsolete semicolon
Date: Mon, 20 Jul 2026 19:22:48 +0200
Message-ID: <c79f6eb35b817c823be5eefcec41981f459022fa.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241449

From: Peter Marko <peter.marko@siemens.com>

Usage of semicolon as separator in ROOTFS/IMAGE_*COMMAND was deprecated
long time ago.
Remove it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 311d418d22a609fb54b87bfc909bdd1861892228)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes/vex.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 45a15348724..eac68ca6289 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -229,7 +229,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

