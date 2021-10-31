Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D5AC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:35 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.32837.1635699514771042402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BvqrVzgK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id t7so15039713pgl.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IOYv6XVf+MYDLM/NLRDlgru7oNT6WKIbtZr/I8yZ0fc=;
        b=BvqrVzgKYjAUvI/VQi+RDtNE+2rYR7A3JS7pFIiH5aTVFyGh3sZ61lK7bRhzMpEeFH
         QEvWA55VjO5RUPU1bd9vGdtEqxGIKjW2ZROowHHnEeoW/QYtbAWqnrjLk0T/lzkjpk/t
         R+JQeHZIDbzlQYmV0B4qEu9kE1Y0O5dVvAZNR/OWPAhEzeyTX6lBzErMs6LScqRe6rwN
         2RQ86n57X7As1VQxLp1iKgVuz6TxWeI8ofcLYwRnMwk0L6PmBJf8XpLgBK1qKZmCX3i2
         SviVReRzAYZI6oZ//nK9n5D0Rn9J0zs0+wcZKNRa2qwuuSS5+vPvS5GGouQmYnA9d6A9
         h3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOYv6XVf+MYDLM/NLRDlgru7oNT6WKIbtZr/I8yZ0fc=;
        b=EVEhsrlQthfJ4YNfATKbmsOmx9CiL53RhlZqGRt/nfmZ3t8eehbortrlnuNABhKPVF
         ghSKlBJaHDvdrU8blW9UZ7NCaMyAd013KTEPRt5y240ZgQOZuxYOTCnAuKzzKVCqvYMk
         8ZQmg6QbsfshsyfHynESboKbDUe3hVW2KlK4FotWoj5nAW/JzdvzLXnsvFAjCOloN3OX
         SqZbSo0GYYVV8tpus/f/PUkiRG+PxRsDdKHzl/WobXsdilLG9ofidopYHEaDDctAWWwJ
         i3g6HFtxnhGGM5+vngNROB6yhpoodFbOpi69wCvn/162x1no72rmld2Q5ZtBY+hEcQws
         Yfig==
X-Gm-Message-State: AOAM530yjV9rmONeDNjiPl81q9EhB8ZeFUPlbBK4ohfhNdcT0T0g5ABt
	I6RZA49D3w6OphAKOK9EwtP5bZYCN7pMET5LV+w=
X-Google-Smtp-Source: 
 ABdhPJxUXLrMBKhRhRBCpOb5UwzKnesj7WlLpQf4kTYnQpKnmUnJKbTbfFW9QO6c033pcPxYyL3PZA==
X-Received: by 2002:a63:84c7:: with SMTP id
 k190mr6009882pgd.120.1635699513864;
        Sun, 31 Oct 2021 09:58:33 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/29] oeqa/runtime: search sys.path explicitly for
 modules
Date: Sun, 31 Oct 2021 06:57:35 -1000
Message-Id: 
 <998a7b4a064215c94994797fcff309d8b04f5754.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157674

From: Ross Burton <ross@burtonini.com>

The controller module loading code needs to be told what directories
to search for modules via the target_modules_path keyword argument, which
is set to BBPATH.

However, as the actual module loading is done via importlib this relies
on the paths being on sys.path, which it is as base.bbclass puts each
layer's lib/ in sys.path.

Simplify the code by removing this indirection, and simply search
sys.path directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 570a19581f582f77e04d6892adb647cd649a6943)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/context.py | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 7908ce1fd4..d707ab263a 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -5,6 +5,7 @@
 #
 
 import os
+import sys
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
@@ -119,8 +120,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
             # XXX: Don't base your targets on this code it will be refactored
             # in the near future.
             # Custom target module loading
-            target_modules_path = kwargs.get('target_modules_path', '')
-            controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
+            controller = OERuntimeTestContextExecutor.getControllerModule(target_type)
             target = controller(logger, target_ip, server_ip, **kwargs)
 
         return target
@@ -130,15 +130,15 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     # AttributeError raised if not found.
     # ImportError raised if a provided module can not be imported.
     @staticmethod
-    def getControllerModule(target, target_modules_path):
-        controllerslist = OERuntimeTestContextExecutor._getControllerModulenames(target_modules_path)
+    def getControllerModule(target):
+        controllerslist = OERuntimeTestContextExecutor._getControllerModulenames()
         controller = OERuntimeTestContextExecutor._loadControllerFromName(target, controllerslist)
         return controller
 
     # Return a list of all python modules in lib/oeqa/controllers for each
     # layer in bbpath
     @staticmethod
-    def _getControllerModulenames(target_modules_path):
+    def _getControllerModulenames():
 
         controllerslist = []
 
@@ -153,9 +153,8 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 else:
                     raise RuntimeError("Duplicate controller module found for %s. Layers should create unique controller module names" % module)
 
-        extpath = target_modules_path.split(':')
-        for p in extpath:
-            controllerpath = os.path.join(p, 'lib', 'oeqa', 'controllers')
+        for p in sys.path:
+            controllerpath = os.path.join(p, 'oeqa', 'controllers')
             if os.path.exists(controllerpath):
                 add_controller_list(controllerpath)
         return controllerslist
-- 
2.25.1


