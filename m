Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D5AC678D5
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 00:10:37 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.1344.1678320627080020910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 16:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=godbTabQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.172, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f172.google.com with SMTP id h31so86788pgl.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 16:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678320626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykr3omyzEhntWo9a4vLN4HEnSzjihfEFN9E5neiC62E=;
        b=godbTabQYWYbPOEtiFTArZdh30XPBYl0RE2SDvn9++eXacvMpYHUK7PqpuJkapLXU5
         DR6AdU4bHo5S8LrfE78kfzY7TdUDpeXEIkoKw1nZ6Nb5srf/drq93vSkLMeKk9GAX9VG
         wyEYfb6Kjrhu27N/qV2qW7tEySAch2oYwxdF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678320626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykr3omyzEhntWo9a4vLN4HEnSzjihfEFN9E5neiC62E=;
        b=ydgV/V5GTISBU1AcwA0AqSOzZwhbLCnQt50/zp4fKLsHjY6cA15bUswkjAzM17QInl
         WHQy1MDNb6O4xhDCE3PDW+BC+z47nUaOm/5+IYYK0skrUbwlM0SJSGv+az2zkpFoytyz
         P3dxOkV2ea0hrazveCA1SfY6IZhEPQF/utfWpEFN2uD+bTSKDWuPoAXcj/xeD3B63gAw
         iW+aLfNaMLMwrgw2SASPEcpZY7sAYx+QV9F5cUCTla6p0X1pSajmUvdULR3+BW9sMbei
         /AMPy7JtMs7UyIP3e5YO227L81FFwATFkuqNkjfSrVPiL4BZDkTSueCmGPir/Di4g4kd
         KVDw==
X-Gm-Message-State: AO0yUKVLRdOxWqbBrz5YFuuEsXCqr07tFVbBPyTNfLn7riRf91KWYqPt
	4VwvDcll6yfDQLjMHlOY7fdB/Q==
X-Google-Smtp-Source: AK7set+o9UpGfag/mj1F1HMexT53bdHI7pgXEQTayYImQvuv/zPmGjuGOmyASfUD4ZFou1HF7NkRew==
X-Received: by 2002:a62:1948:0:b0:5a8:47e5:bbb2 with SMTP id 69-20020a621948000000b005a847e5bbb2mr15107758pfz.0.1678320626179;
        Wed, 08 Mar 2023 16:10:26 -0800 (PST)
Received: from hd-yct-laptop.pdx.yoctoproject.org (97-115-103-103.ptld.qwest.net. [97.115.103.103])
        by smtp.gmail.com with ESMTPSA id b4-20020aa78704000000b005a8c60ce93bsm10254823pfo.149.2023.03.08.16.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 16:10:25 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] selftest/runtime_test/virgl: Disable for all Rocky Linux
Date: Wed,  8 Mar 2023 16:09:31 -0800
Message-Id: <20230309000930.306411-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 00:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178205

RHEL compatible kernels do not support vgem so we disable virgl headless
testing.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index e32c4aff85..81b8d056cc 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -257,7 +257,8 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
+            distro.startswith('almalinux') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.39.2


