Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.9933.1596642180469536653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 08:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JKsM90ca;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id t23so30855414qto.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 08:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TzxOjm5WWPzh7L7bn33yoCWemArcspoV9qDBUi47uFQ=;
        b=JKsM90cagaCPM3n1OZFi63vf/ax55RPLvefgkHYwEUnB30BI0e45GQX9Ndfl9zQ7tn
         qR7Nq+Xb0Qw+Qzy5BfZf2v1+8vxmYsIc4F4cMwMQYoM7SH7+/HRGDvSSq5E+eHd0zwQS
         OIIxQNynfOpqB69pBbZ3ptKAZUG+6bbs0uQ5VcoXxq60WnlqRlVOceSzOaJux/F3woOn
         ALI+zp4GcJJuyibSm7LpCplsEZwdUHrtvLiJIjYMfEn3kQG/vhikGiL257Ve5ZvLjGcW
         1NRNgXqrAAD6cHCLlsI/1y52Qxa2fc69qGat+meXn1wKhKvFcjUcZToZnyY33qsYNHnt
         LX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TzxOjm5WWPzh7L7bn33yoCWemArcspoV9qDBUi47uFQ=;
        b=HMaRP0WjZUyEEu1tYCtTYbN7M3A5fYIVRH9N4jypHoVbPUHkSV3Uz47T8RrgfqsOPe
         WpEr0HZDB3dLOPoBa1CfhaMGZkEpNoHzltDQdV+urSfiq8Jt3c1lUxe8rJi2gjIrsHVG
         Vv8ukHggmHwk/v7CjchXsILZSY3qiqb75jQDOPUKXF+b+aq3mcq9gv/lJBVKr721o/UL
         MxTHMQXE4v4kLxjHFzYGiMv8C4YTdvhBp5Vo2jlYSm1LYPgwUuCSj/zFdu+CYUFMPwD7
         RPR9u78EXZPv8Ae8XJF0zTuGWEb8vOpatT28YTe1+NTIC2mN5QufGPy66bqN6IaAp889
         Zglg==
X-Gm-Message-State: AOAM533giyOzVgUw1T1b4G5pu7Smr8xNa1VxHO53AnRCO2Ng9SIViGZ5
	rEV0iPY3QHrVvqGnWT2CroE=
X-Google-Smtp-Source: ABdhPJxqlAUUqxjjHgQAYCC8McO5XjNpw3zJ5nZGcNXxoUUQRA6TTc0atCi3hf3srAY+jP+QeNxHSw==
X-Received: by 2002:ac8:180b:: with SMTP id q11mr3835162qtj.389.1596642179557;
        Wed, 05 Aug 2020 08:42:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o48sm2480731qtf.14.2020.08.05.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 08:42:58 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: fix x86 (32bit) on target module build
Date: Wed,  5 Aug 2020 11:42:57 -0400
Message-Id: <20200805154257.850-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The previous devsrc v5.8 on target build fixup [532ae127c
kernel-devsrc: fix on-target module build for v5.8+], missed
on condition: the defconfig

On 32bit x86 the arch can be queried differently on the host
and target. We aren't building against the defconfig, so we
remove it from auto.conf.cmd and we can again prepare to build
modules on target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 2f20ca25b3..6c49b4891f 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -277,6 +277,8 @@ do_install() {
         sed -i 's/ifneq "$(LD)" ".*-linux-ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(srctree)" ".*"/ifneq "$(srctree)" "."/' "$kerneldir/build/include/config/auto.conf.cmd"
+        # we don't build against the defconfig, so make sure it isn't the trigger for syncconfig
+        sed -i 's/ifneq "$(KBUILD_DEFCONFIG)".*"\(.*\)"/ifneq "\1" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
     fi
 
     # make the scripts python3 safe. We won't be running these, and if they are
-- 
2.19.1

