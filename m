Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC06C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:45 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.163.1686329679460272823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=WFHoOeRd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64d44b198baso1544405b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329678; x=1688921678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJ9thQ+1fKepM94O9nD7jhODh8jVznIHv021LCLi1AQ=;
        b=WFHoOeRdkLja5pgWpIuFmBkAerkq9U0CVUoJgdtCR460guL6LkyXxwufTwhMvA0fVd
         wvDFFJq5AIMFMsBClyZqnhEcaW+feCa4vUi55hoVs2THUJ6s2vUKnul8cK/ONypsQ4oD
         ngQZxDhSbnlcWUfXSjG2hPJ4eq2/0xqJC3ei5VcyKSTmvcbOGv4af2aB2dsuCh96IITp
         oRRnTnpZnKfU8H2fJAI86Q0NgHqPFoGvwalny+qoYk5t/oyib7UJo/t2Tigan8VOgW11
         8hqiuQsf+f3nKd/Qa4alFyDc+KV/mcgET06+iWEd8ilh/BfEYCP8EZXB+lIQRYUGTGL4
         BAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329678; x=1688921678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ9thQ+1fKepM94O9nD7jhODh8jVznIHv021LCLi1AQ=;
        b=ixASP48H5W6KMq+IOhYyBnOCRwMyWoTqp3Fv9vehpqflP2m5HIz/ijRyk8iifSETgg
         P3YiAWMh2XqU7ItTVx2Sk4b/u33IC2LSgmg28zoXslQR1tM8ussrBl5gAp3T63JXFI4S
         eVEAPid4Je1uxQnNJmq0jvvjd/QSfKXuWpHnD9IMgV3f0TvXZBXn32KHQoMB73Iq10oV
         mplDOAx6okrV/ILyBTL2hdpvyHxhbE/BaFpvkjB4D7FNky5llhfBAwYRIvnaPBh2DFRT
         Y+CSszX8H/7LnYUAmS77TN+/iZoKB2VlcFYrYgrMAZ7384I328UN7t9OLZlXGCNmJnkd
         4Iaw==
X-Gm-Message-State: AC+VfDwozmsLcNGcfYxOjHQq82fjhXwv7RFj0mbgxVdo5FV4xlRH6IGU
	RCjvGkitVUB1W8u66sJYbZjqgZf5DmOscbqO0nM=
X-Google-Smtp-Source: ACHHUZ61dRmXe473Rd5iJ31nEtD8BV3t3eKZqCgFnC4bd+a0M9Hkx9eDH2NNFz9eVnKxs5nbjNhUew==
X-Received: by 2002:a05:6a00:892:b0:650:1a64:d8d3 with SMTP id q18-20020a056a00089200b006501a64d8d3mr2601832pfj.14.1686329678572;
        Fri, 09 Jun 2023 09:54:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/30] oeqa/selftest/cases/devtool.py: skip all tests require folder a git repo
Date: Fri,  9 Jun 2023 06:53:48 -1000
Message-Id: <5b913494b472ef03435cabf984361b43c3d813f4.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182587

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
index 94873fd19f..f51de8efe0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -10,6 +10,7 @@ import shutil
 import tempfile
 import glob
 import fnmatch
+import unittest
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
@@ -40,6 +41,13 @@ def setUpModule():
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


