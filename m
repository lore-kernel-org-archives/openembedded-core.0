Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD14F88096
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7591.1776322126252432599
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BPlWFS/H;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43cfbd17589so5389068f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322124; x=1776926924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x20e9wxeDlAXdEuZpXs2g/DEGuOIR/2HUSKnMHglAo=;
        b=BPlWFS/HLU/c1GMzqWAJUkwjDZHYuhuw0gnogFvpVuXDI3vXvgAKnKA2QYDRpDWgxg
         mVQJmi1WlAd/ZFLhQ4Nol60AlEpZ8Jz+Npl+49FvU4qacqYkrdvgCVem4dlbqVMjl/Zc
         P6Yxdp3Io7+xr8znpEi3vhiEphLW8Ejfp4Quo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322124; x=1776926924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8x20e9wxeDlAXdEuZpXs2g/DEGuOIR/2HUSKnMHglAo=;
        b=bBwmETiNo4iNetP4Oiv29PNW3YP0gC49EYmfBDaUDOHYbZWlp+4x3zKBsVw7SEMh3v
         ST0XNaLrFpVhWL5dGDAmEqw5mRNW3lk+dM4w6Vg33qbHac72YvvY7kL/aHcn4JB2+01Q
         DDanBuo886Rm8P7mPD0MZ6EZL4i6LRuMVI00J/AlnOaWTLxpDPhUT1jKS0yqslI+oNJg
         mxTQJKeHMYPMWRzYw5EnUsHgR1spZ/F/j/8EzK0TMnNkTZd+yGtCEldRG8RUbeC2/oby
         Xm6OrKPRFylVKhoY+ZHiXxrPi1Cq8mxUtxJkB92X348EJukKvz5kddRbuFz4aTlDUgKm
         ylew==
X-Gm-Message-State: AOJu0Yzq91OHFSQzWb/KgCkdAtM1cdFgsHsEuRP/fKaHDJA9xpr1sT56
	hTM9UrRuAs/QTEwT9SGLeR224PSEVnNSFt9059LbbGbhUNhNY22f/iQBqZWvI3JWwR0oWiyQDVc
	UFG4GJOBGmSyD
X-Gm-Gg: AeBDieuUvRvD+w2m6lmEnfT7a/o0JXcCY8qX3SMl7KQfmhRHCr7tuGFBXjFdnXFryxh
	5PIS322uzxikPBlWONMsIE1LHY5EAFkWTlozyXk/uuMxEAsdm20EPNkoop8WQHEaDMM+BKBJkn4
	BO8maYiHDUk+POjlsxeS9Cm4xru3+dhZCm5hXFXE7dsP0tMzD7rAdYZzKwg9Y/sdNOBiDjVlRYA
	tkAkc68JrLw72PPO7VdKUzyncV0z3BASRskVdpy+0q8r5XozgL4xwyEBaISz/0k3myJhdVmzsm9
	0CdNtkrNGDsWUjLzMM9+OfKqAYukx31FbjcCvYCljTpanyZeuz3Ct4kS2AFVu0jERS1ns55aNv0
	GtXJPkV2dqPWGZyN9ywZuFih8H/d6i/HzIolw2cGyeNNPp9sNFSTYILcrjuhAIHOqzVumz0zUwd
	Ne0brJZ2zlXQaP88Cm6BHygQUtaglTiyAM3rzAMSm1itAPW/Z2IYUUlruz4iPLgqJVH8BBgBsS6
	lm7gkwOaylS4XMCRSI+uxjLh5i2zWdysUlijzNpMe9XiuYV
X-Received: by 2002:a05:6000:2583:b0:43d:7d24:b506 with SMTP id ffacd0b85a97d-43d7d24b82bmr19545639f8f.38.1776322124333;
        Wed, 15 Apr 2026 23:48:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 39/47] selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
Date: Thu, 16 Apr 2026 08:47:40 +0200
Message-ID: <2a9d7bc66aafb111413331f5c510935b14a86c9b.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235381

From: Alexander Kanavin <alex@linutronix.de>

This is a followup to
https://lists.openembedded.org/g/openembedded-core/message/233609
as the same issue happened in a different selftest.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7468e70c238b056acbe06ef722b62b02626db8f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 1c713331900..fe1fa6dac1f 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -7,6 +7,7 @@ import os
 import time
 import tempfile
 import shutil
+import tarfile
 import concurrent.futures
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -41,7 +42,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
-            shutil.unpack_archive(filename, debugfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/kmod", path=debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
                 status, output = qemu.run_serial("kmod --help")

