Return-Path: <pedro.miguel.baptista@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF6BC6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 11:49:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.40551.1676980180838941283
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 03:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nllFJfKP;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: pedro.miguel.baptista@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bo30so3556259wrb.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 03:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFb8lGv+9etn3GAUlVygSNfq7aEWvMUdVOojJjPuug4=;
        b=nllFJfKP/vE7Fk6aK/Qt5UKkbE8T4EBv6PcamX5b21BHlogznjPomorZs1wev+fDla
         ju6Gs9ZdficH1jUHc7NClQFI65n6dAwmQbcejqmv5AQ0yzY8jDgdi+SlaujACitOt9xm
         gRu6s4Jn6Zi4UCY0pkdwi8k3jSe0kWHIDN7GoyzvxsXqOIIRvzpz2gnL32j0GRxsRlaz
         PVFBx7hjSM8j4uLFf1dAz4gi4QYbO/pnFpIWvT+h2NBh8mWMdMJv7hhusjq0Ucavfw38
         EECYKrI0UoPFEUMm/cB/W5s61DvTABAwzP866c896MsQBGpDTebUJ9Pb/2bhCIVuFO9F
         RqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFb8lGv+9etn3GAUlVygSNfq7aEWvMUdVOojJjPuug4=;
        b=RqMpC5mCWr9twyAB16sGyEe55Rw6vBjCx+XvsyAHHPaTvbR6iqAzyC0PqvfV6pyM6I
         LImw4TuYrPydZ09MfiTwBQx7c8g+dIFyeMYwZ4tBh4On4K+8Z6SC4j1zvI5a5bABY7OJ
         BsqifNeWDp5uxoOvLCXcI20qRAAgbANcnIWO6tA9EJy6TeDM8oB7CxrhnqlPN0wBKuCc
         sOyb0+Ps216CZXb/oh4opAgj7wZhnGnF9Q8I6DPPch5FBfnrowvXReYNQtC9O+DkQVA+
         LWlspMG1Kl8jm3vxwDpNxSEiUtRccpgFtqF6+UG9S1RGWmXxmOaEOG2ECN2eTQ+VCrYH
         2Y/w==
X-Gm-Message-State: AO0yUKUO/noT983uheG9Up9T4yj7zPHQFV83qnyTGihzTyNKSgy8MF6p
	GRRbICk4rbDk+OtjQuHgN3iG3Y7dq5k=
X-Google-Smtp-Source: AK7set+fB6CQ+kus1SS3nwUr6sgmpq3gWnOr4BXxQ/9B46n3Gke/wyEVFKSTsvDnbq9YPvt8HTBlww==
X-Received: by 2002:a05:6000:617:b0:2c5:5822:96d4 with SMTP id bn23-20020a056000061700b002c5582296d4mr2968571wrb.30.1676980179023;
        Tue, 21 Feb 2023 03:49:39 -0800 (PST)
Received: from localhost.localdomain ([213.13.226.153])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d678f000000b002c6e84cadcbsm2524703wru.72.2023.02.21.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 03:49:38 -0800 (PST)
From: pedro.miguel.baptista@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Pedro Baptista <pedro.miguel.baptista@gmail.com>
Subject: [PATCH] create.py: add command arg to add layer to bblayers.conf
Date: Tue, 21 Feb 2023 11:49:21 +0000
Message-Id: <20230221114921.2792-1-pedro.miguel.baptista@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 11:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177494

From: Pedro Baptista <pedro.miguel.baptista@gmail.com>

Add command arg `--add-layer` which enables the create
and add layer in a single step.

Signed-off-by: Pedro Baptista <pedro.miguel.baptista@gmail.com>
---
 meta/lib/bblayers/create.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index c8f3f1b370..517554c587 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -12,6 +12,7 @@ import shutil
 import bb.utils
 
 from bblayers.common import LayerPlugin
+from bblayers.action import ActionPlugin
 
 logger = logging.getLogger('bitbake-layers')
 
@@ -69,11 +70,19 @@ class CreatePlugin(LayerPlugin):
         with open(os.path.join(example, args.examplerecipe + '_%s.bb') % args.version, 'w') as fd:
             fd.write(example_template)
 
-        logger.plain('Add your new layer with \'bitbake-layers add-layer %s\'' % args.layerdir)
+        if args.add_layer:
+            # Add the layer to bblayers.conf
+            args.layerdir = [layerdir]
+            ActionPlugin.do_add_layer(self, args)
+            logger.plain('Layer added %s' % args.layerdir)
+
+        else:
+            logger.plain('Add your new layer with \'bitbake-layers add-layer %s\'' % args.layerdir)
 
     def register_commands(self, sp):
         parser_create_layer = self.add_command(sp, 'create-layer', self.do_create_layer, parserecipes=False)
         parser_create_layer.add_argument('layerdir', help='Layer directory to create')
+        parser_create_layer.add_argument('--add-layer', '-a', action='store_true', help='Add the layer to bblayers.conf after creation')
         parser_create_layer.add_argument('--layerid', '-i', help='Layer id to use if different from layername')
         parser_create_layer.add_argument('--priority', '-p', default=6, help='Priority of recipes in layer')
         parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
-- 
2.34.1


