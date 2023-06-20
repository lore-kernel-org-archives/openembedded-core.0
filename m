Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A389EB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:15 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.799.1687275610719143089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=owgytW7P;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b52864b701so37854755ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275609; x=1689867609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfWvnopzSRZ95lgZ1tyj20TX4aACXRkbl2HQ8oKb2zI=;
        b=owgytW7PKyZ+zlp6hXrfc03Wt2f9TJxpkwQ61vQppydzqwSoSLcimD4U0Pf/cA9nMj
         +6akQCdpsmP4YDo5F5SyrdOulPsk6O0bFduuqb7DF+IGRJis85FrMS0Vbx6NoD76rHo0
         BAMxh2iQyK6lpEYMHWbcsHP2SecibPynbHP//+biokVXoGVAL87EOYHJfGLVQcKgpJo5
         Fg4KOqrUI0gY3tSE1wa/lg0sRrKQfYUmHaVgAI95CHvLWP6d/oJklu1IL6kdOM1IIQam
         U8LbVy4NIt5zrRByB/CWVJkMKENgSFT+EJ6o8/jqZoxQ2SrypUwCJdZb8/toRgcJt4pK
         s0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275609; x=1689867609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfWvnopzSRZ95lgZ1tyj20TX4aACXRkbl2HQ8oKb2zI=;
        b=B/IIFMYC/ZFjmexlpThdDIHzJSmzfgtf7D7nEI+7lCI1nZRoOWNd+mKEWty1+jYFG/
         kiL/SHClQfDPQ86iBTqtd6r/oBVnCyCm0gBfYnoxU5DJozyOCZDooKsBIQ363YYGvWO3
         zPdeDz/5Cq+kxBltSOn3fZB/ayhdehpAKP9qi85jMtQ+Fd1FKGXfSClPB22GFXczTWsk
         x9+emymORyEqAoioEiVmgDeWnUNBCOIoIpvXx80S3RY8W/2fs/9UU08AdyarKP4ZimD8
         f4/LUx+LA07CtvsT5zFQVPbfY0z3JpOdZhfYpwZ0Gr2Q4gOBxqWlR34b25AzrL2QuoTl
         0FHQ==
X-Gm-Message-State: AC+VfDxK8vjnGf5MWOcw/Y8dUrUmAegVOI1NXLuUcKyyFtanfL4BJ9ex
	0heEcIZYdVLVc429mW9ogceEKnFYHo9yOs9bV6A=
X-Google-Smtp-Source: ACHHUZ719leCjiSoHCKLd9+/6L5Z8qIO2RDu1G+78zsE4SMXQFuLDdPTe+3hIyi1GcngkxJ9cgNX6Q==
X-Received: by 2002:a17:902:c255:b0:1a9:21bc:65f8 with SMTP id 21-20020a170902c25500b001a921bc65f8mr12179018plg.11.1687275609374;
        Tue, 20 Jun 2023 08:40:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.40.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:40:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/9] oeqa/selftest/cases/devtool.py: skip all tests require folder a git repo
Date: Tue, 20 Jun 2023 05:37:26 -1000
Message-Id: <9ce30faa488ea905292b9944fb3c1b471019f28c.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183150

From: Thomas Roos <throos@amazon.de>

Devtool selftests require poky dir a git repo, when downloading poky as a tar,
this is not the case. Those tests will now skipped.

[YOCTO #12389]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95a5bc130dc51ea9de95c64dbf0e9c7892415d50)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f512ebc0a0..64179d4004 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -8,6 +8,7 @@ import shutil
 import tempfile
 import glob
 import fnmatch
+import unittest
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -38,6 +39,13 @@ def setUpModule():
             canonical_layerpath = os.path.realpath(canonical_layerpath) + '/'
             edited_layers.append(layerpath)
             oldmetapath = os.path.realpath(layerpath)
+
+            # when downloading poky from tar.gz some tests will be skipped (BUG 12389)
+            try:
+                runCmd('git rev-parse --is-inside-work-tree', cwd=canonical_layerpath)
+            except:
+                raise unittest.SkipTest("devtool tests require folder to be a git repo")
+
             result = runCmd('git rev-parse --show-toplevel', cwd=canonical_layerpath)
             oldreporoot = result.output.rstrip()
             newmetapath = os.path.join(corecopydir, os.path.relpath(oldmetapath, oldreporoot))
-- 
2.34.1


