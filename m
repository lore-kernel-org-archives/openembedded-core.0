Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E59EB64DD
	for <webhook@archiver.kernel.org>; Thu, 13 Jul 2023 11:03:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5626.1689246190367777934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jul 2023 04:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kx0ZNGex;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso5309795e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689246188; x=1691838188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZVpIQkGbaodD4b68RszU5EnKFYMbvvDHd7tqr6FDtQ=;
        b=kx0ZNGexAF1VrAOqQfACo3xqj0kDPVpNu6w0wFtcNqYsNx8JsqOkAtxTuV7y5JUHUY
         e5+JQ4SfLYlf3aIlR6DVEUI5wFzXs2R2NfWSB/WKci4BQF5N20bINunOgfx2Krr3uiwP
         N90nSiWIhmWvR8ehsxvr8GreDRzEcp/+F6m21jA6CSvvZjtBT2hp9KTlM1+vXLePEq1Q
         w1mfFpWowrcHFVrlDoEa2ogrWaZesdP4HGBkCXuQGpZbS+eigIr8fcV3puR1IGBO4Kz+
         EeS4DdpNbi0VTWT3ScxEzWIb7z6Jj8zFnkks6ExhPkCLPXL++yyBFw8B/BLFg+ah2T32
         j4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689246188; x=1691838188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZVpIQkGbaodD4b68RszU5EnKFYMbvvDHd7tqr6FDtQ=;
        b=kLiSAqH05mSJ8l4POJZbKbdB3J4ZPUKPIuJtIldHZweNprSNKcz84zR3nxg2tLW0O0
         wZwXgR2m1WRnXOLWdRF54YSysUa10Up8EOxbia/4URl6JSCXKz5qLqyD3CwQ4/DM5acp
         RLTIkFpcfG2S4BHlMBPL9cZ2bxyLt6SFFsOnGTvGQqvl43henZQCaodrADK7xiDEtn5Q
         RSH6ImuVe+SSiQkIJRTQ9Q+RvYfNrLlo4UutXdnk5garZ3jsRDFp+tM+2xNGf2CW5/76
         u44ZVonPaXatUjoiJmUcw8ht72TKH8TJyv4LBWRJcfywTrQdAXu7KvzaN8+ZX15u2tg1
         cMJA==
X-Gm-Message-State: ABy/qLbbUibDMoYAk1aU0lKseTfQ5Elr4l4xSfyf8JKARgqNNwq+FZ8g
	sSWq8VLE8ixdkTMNPbNIgpnKb2yrcCo=
X-Google-Smtp-Source: APBJJlE1IDYKE9/j13DfT4FoXF6yQJJwXO0zGVlosE2ReFPfixlypEqpLhg6r2rPC/+HKWRBF1lNXQ==
X-Received: by 2002:a05:6000:11c3:b0:313:f29f:5eb3 with SMTP id i3-20020a05600011c300b00313f29f5eb3mr1246725wrx.32.1689246188382;
        Thu, 13 Jul 2023 04:03:08 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id i17-20020adff311000000b003143853590csm7623038wro.104.2023.07.13.04.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:03:08 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH 2/2] sstatesig: do_image_complete needs to run with pseudo disbale
Date: Thu, 13 Jul 2023 11:02:44 +0000
Message-Id: <20230713110244.3169513-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713110244.3169513-1-jose.quaresma@foundries.io>
References: <20230713110244.3169513-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jul 2023 11:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184241

sstate_report_unihash function from sstate.bbclass needs to
run with pseudo disbaled when running do_image_complete task.
This is because it have the deploy content with uid and gid
of the user that run bitbake on the build machine.

By default the creation of sstate is skiped in the task do_image_complete
in the image.bbclass using SSTATE_SKIP_CREATION:task-image-complete=1
so the issue is not triggered.

There are some situation when is useful to store the image artifacts on the
sstate cache for future reuse and speedup the build without need to pruduce
the same image again. These cases are especially useful in the case of the
initramfs images used by the kernel.

The issue can be reproduced in oe-core with:
 echo "SSTATE_SKIP_CREATION:task-image-complete = '0'" >> meta/recipes-core/images/core-image-minimal-initramfs.bb
 bitbake core-image-minimal-initramfs -C do_image_complete

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4a886215b2..cbf551889c 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -503,7 +503,7 @@ def OEOuthashBasic(path, sigfile, task, d):
     corebase = d.getVar("COREBASE")
     tmpdir = d.getVar("TMPDIR")
     include_owners = os.environ.get('PSEUDO_DISABLED') == '0'
-    if "package_write_" in task or task == "package_qa":
+    if "package_write_" in task or task == "package_qa" or task == "image_complete":
         include_owners = False
     include_timestamps = False
     include_root = True
-- 
2.34.1


