Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0580BE6897D
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:07:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10717.1730376420750928021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 05:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LfRAYRlr;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so7002595e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730376419; x=1730981219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZdYrEre+PHKophHDq/ApTAaFkR218yVUcgfNzMUY2g=;
        b=LfRAYRlrtesOPaA+gB8Y7jys9gaNwdyLkUV/5Wy/klmcOC4GrB5F1vJkl2tTaVCHYh
         Fh4wNo4JY1xjNi7aOM2PVUyq/Xd3Z7N/1lIPZ5NqvGlPxEm4x8IbSAIrrdiICXVDQkvB
         xdxQZ/b0oivUc7x7S/pnOMvpd5GX6tXeL/YrnP4eL8zebNoB19mDwmrc4GmLvbKI2BkT
         5Ii2iIYxMGamaH+Cj1o1IZW861hFFSLOelVNTlMwSreSNuAxsedhc58TPZEfDl/U18L7
         MKdU0UOzeQWc3Wy4E1a+jS+aiz1nLOLWEn1PD+BvDv77dRC8M/D3uDPQsD4l6CWbtDJC
         pljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730376419; x=1730981219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZdYrEre+PHKophHDq/ApTAaFkR218yVUcgfNzMUY2g=;
        b=HlR5j0OI3rRlXUHBFOUAgheWyqYhp0SdLRBY4PD+DXMPOsUwYktumLOa5D/E1Vyy5R
         zv2nKE3KbJ814M3tTYa/WvrXpi5MO3ayakVkyq4LJ68NID/XzFWSb5LdCO4FGc1/L6Z8
         K77o10r8tXFk9Xg44yzDfmct5uhvjvvGMG7AK/KxMx1i9GVV9727UmhGCBc3smThNt6n
         +NUWxIClvPijpp6ty7oArnrXArmI0EpYs346I1k+vYh60cm+HIEAzaGcHyhDifr+eB4/
         OwwXlmttU13OBobhrmdtZYZcTWnk599oaFchb0GR6r/69Fw9dahu4u5iUBEJsJU8tWAf
         IZfg==
X-Gm-Message-State: AOJu0YyCYy0RaJJLY0dUS9GvQQ0zgeXzC04wAp/npueoDnIk/44q+ltQ
	u96mmR0HLgEQhr+q07WzDCpM0DNEIrjqiLkInRIVOhMA8GNmyAHrKP9RPKh/
X-Google-Smtp-Source: AGHT+IFVfaKjocEIQWL5mUKbl/cDHDnQXesB2/gkX1IItJUtfuiPLHfb3ZStAZVvkSVbz/qdOPNO6Q==
X-Received: by 2002:a05:600c:3d05:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-4319acb8f59mr172167455e9.21.1730376418745;
        Thu, 31 Oct 2024 05:06:58 -0700 (PDT)
Received: from fio.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bb793e51sm59422815e9.1.2024.10.31.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:06:58 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] oeqa/selftest: Update the BB_HASHSERVE_UPSTREAM
Date: Thu, 31 Oct 2024 12:06:45 +0000
Message-ID: <20241031120645.3652636-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 12:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206580

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/lib/oeqa/selftest/cases/devtool.py     | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 1739c84853..8d80501bec 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -317,7 +317,7 @@ class DevtoolBase(DevtoolTestCase):
         cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
         cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                             % cls.original_sstate)
-        cls.sstate_conf += ('BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"\n')
+        cls.sstate_conf += ('BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"\n')
 
     @classmethod
     def tearDownClass(cls):
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index ae295bef5f..faaf7f6b0c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -963,7 +963,7 @@ class SStateMirrors(SStateCheckObjectPresence):
             self.config_sstate(True)
             self.append_config("""
 MACHINE = "{}"
-BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
+BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
 SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
 """.format(machine))
         else:
-- 
2.47.0


