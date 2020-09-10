Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.12268.1599703453975457360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 19:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lvWEK9Ah;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id q5so4570062qkc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 19:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wo7BRVxVvxgaN+Ud2fNgHHw21yfkYJC6m2W1BufW2pw=;
        b=lvWEK9Ah6lgofMyN65f0sM/y2MpTopbd2K5AjKhEJXVz0sqW9cI3RbZwf2c41pOahf
         RXX6FNcvAlv7A+24c1FTx7OTTxtKn3buEkF1FTNK9KDGcqnMr6eVlVhe6oz9bDZuQlTG
         AW7lE8pfHjtlRL9OKHCJ4LIBf1O7ezDzR+5uYS0/T+Z26WXaSQUeZrJn4DkIT8A6ywrk
         4Q9e7B0LG/q6MU2xL5cfEfzFKsXVRnwL/HOW9EWSr4VxhtiPTTKraqx3tEvd6BB6sLNR
         ab2YAJ9UVUFNOlRexOIOdCQPOM9yZFoGvIqmVDD4dy8WqFuva0U/W7K18mkIS+vd02ms
         /F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wo7BRVxVvxgaN+Ud2fNgHHw21yfkYJC6m2W1BufW2pw=;
        b=ayftw3Au13VV4Pti+YHisEkP2JnyLoc6S1H3D75lSKKUHe3J+gfsegP8fcYk8mgIXt
         DkxYQuOEm7FOomNKVL4S7ol2ljJozpJXAb/2Mi+sXIzxqpKTYUXmf16M3L/coI+9POH6
         +75XZpdMRFLyczh6L6ZSOS3n3WitoYppieNg/PrYdIRcKH+wV6wNs6uZMbdY1DNONSDA
         hVoGf7u/KT/iwobkdJSmmuMiuRHf4LqX8EYLmjYWFaZYzByAc1JQScFAtdx+9cuxIPR1
         mEeLne6KNotJwoEsmkbYEbUNTFn+moZVaybk387ec8SXqbVgWKeKa0Ix+bOvnkrexvGm
         Xrlw==
X-Gm-Message-State: AOAM533QtJc2GpqJdUz7V3cSxYnGQFnax2geCdPjNBSZ46NLfR9GU5Qn
	PIzUrj+HUu24pSx8V3yfMVQ=
X-Google-Smtp-Source: ABdhPJyl5qExQWcWC9v2cahMKZ+o0pRbHaUyF/mjpBf5PYtL9ckFbk16PAw6AwO8qm8ZKQj+8npRAg==
X-Received: by 2002:a05:620a:145:: with SMTP id e5mr5796318qkn.479.1599703452994;
        Wed, 09 Sep 2020 19:04:12 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f76sm4530568qke.19.2020.09.09.19.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 19:04:12 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: account for HOSTCC and HOSTCXX
Date: Wed,  9 Sep 2020 22:04:10 -0400
Message-Id: <20200910020410.41095-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Since commit 740d87766cb87f75c477 [kernel.bbclass: Configuration
for environment with HOSTCXX], both HOSTCC and HOSTCXX are pickedup
by the kernel build system as triggers to reconfigure if changed.

As with previous changes to devsrc, we replace the cross build
variant, with what will be on target, so operations such as
'make scripts prepare' won't trigger a reconfiguration.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 1482faa3be..81b1e36041 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -275,6 +275,8 @@ do_install() {
     if [ -e "$kerneldir/build/include/config/auto.conf.cmd" ]; then
         sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(HOSTCXX)" ".*$/ifneq "$(HOSTCXX)" "g++"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(HOSTCC)" ".*$/ifneq "$(HOSTCC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(srctree)" ".*"/ifneq "$(srctree)" "."/' "$kerneldir/build/include/config/auto.conf.cmd"
         # we don't build against the defconfig, so make sure it isn't the trigger for syncconfig
-- 
2.19.1

