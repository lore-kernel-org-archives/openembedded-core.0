Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2385BC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.478.1679092986955304937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=3qIj+UhF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id v21so6808620ple.9
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZbJkY1Y/7N4G1U/awNmY6LRciK7vtX3k2r2iQ6CJ8M=;
        b=3qIj+UhFQMLYVG+tjyzvQUH+dxtXIxr4VdlMll2IgkTZuOqvJEv1D1SEuZEE3PH118
         y6ihbv8fFDKFZm8uphLCtJ1U3bZ3RI/JG4oVvLhdwhA10bwKbf94kiFjdse8juVZHnbs
         JARstlJhY8dtL2vL/9CdVinYaavwtBUQZNe2c1JQvaxeiN7IWIc5ekrtSHgR4sp8yKAQ
         9negFqoUhUirph6YXkvC7a1k1gh6Z8L9A41hBikmBrwm6QULJ9uKpaVV1fxhi+6zdCDs
         j3FYJLSx+tP6ksfpQwjIJt0Y9T/+0Fguo6Me7L0j+zpEoTuFoqYe8RDmGHuX/rtVj6Bp
         8fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZbJkY1Y/7N4G1U/awNmY6LRciK7vtX3k2r2iQ6CJ8M=;
        b=16uQNoR7NWJbfK97GAX7BM1zdljBfQsBf6dTAcF1O9oa/oD6+RQO6EqjQOvsoqTivv
         bx3Kaq3AK/W1HlDA30Zu7kUODYe206WSJrKGh1ppBhIRnZFRd4zv5tLeeFGIGpuPWWX3
         nTdLrZS93dOeWqBa9/R+ri1/AIAk8CDZaZqlMjIp+Avyc9YBuBjcO0PN9SVlv6F9R2mp
         nVJh9W6ssPmUGlh6QusgLGtokbLlsX54iMBcXPLPoPR5jQy9TsmtTIsl2lvcscQ6Rf4d
         2k2XmcUOKyPzmiD8XCDEs51o4Q0K/KwBrHBe/XuKOlwYknvUlcKtmcYwoIpJsGDU7VPh
         yu/Q==
X-Gm-Message-State: AO0yUKWxXQ1nW3rD4fA8z+lXb16Bpjv/qsxzGFAbYCJFNJ5DQgIA/tBY
	71aoW9uLo5U24I+H7ZSHN60UwfPfvF0Ws13q2hg=
X-Google-Smtp-Source: AK7set+4yYWtwc5hW+RZHJXzuhmjpyEp1E/v5VRsXR4QGMq4ux5fH6kgtruuqgxJHxPqAecvXwHGIw==
X-Received: by 2002:a17:903:187:b0:19a:f02c:a05b with SMTP id z7-20020a170903018700b0019af02ca05bmr10587121plg.3.1679092985931;
        Fri, 17 Mar 2023 15:43:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/21] selftest/recipetool: Stop test corrupting tinfoil class
Date: Fri, 17 Mar 2023 12:42:27 -1000
Message-Id: <af73a79f6d4e18e8cc81da19882b7125b92d2523.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178774

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Running recipetool.RecipetoolTests.test_recipetool_handle_license_vars
followed by wic.Wic2.test_biosplusefi_plugin_qemu would show a failure of:

  File "/media/build/poky/meta/lib/oeqa/utils/commands.py", line 351, in runqemu
    qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
  File "/media/build/poky/meta/lib/oeqa/targetcontrol.py", line 116, in __init__
    use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
  File "/media/build/poky/meta/lib/oe/types.py", line 182, in qemu_use_kvm
    if kvm and boolean(kvm):
  File "/media/build/poky/meta/lib/oe/types.py", line 128, in boolean
    raise ValueError("Invalid boolean value '%s'" % value)
ValueError: Invalid boolean value '/media/build/poky/meta/files/common-licenses'

which made no sense until you realise the recipetool test is corrupting
the tinfoil class. Work on a copy instead to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7fe76fe17f67c1bbd108d02836692fed20d24771)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 510dae6bad..db8790b57b 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -579,7 +579,10 @@ class RecipetoolTests(RecipetoolBase):
 
         commonlicdir = get_bb_var('COMMON_LICENSE_DIR')
 
-        d = bb.tinfoil.TinfoilDataStoreConnector
+        class DataConnectorCopy(bb.tinfoil.TinfoilDataStoreConnector):
+            pass
+
+        d = DataConnectorCopy
         d.getVar = Mock(return_value=commonlicdir)
 
         srctree = tempfile.mkdtemp(prefix='recipetoolqa')
-- 
2.34.1


