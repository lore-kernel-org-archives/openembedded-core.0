Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B61BECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 11:56:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.5147.1663415812926592085
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 04:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y1Tka7Wd;
 spf=pass (domain: linaro.org, ip: 209.85.208.182,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id h3so20335665lja.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 04:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=CbYUf7ccNAlwMf4pwWyAM1KOqjn6Sz1F+9nAwyRhA0E=;
        b=Y1Tka7Wdp/S9eMd7spB46t9wWcktbCm94+Y/82FoJ4lDXpfKUsMKeSV/LcZxdXO+7z
         1kLAv0G14LDHZl2AVv/ZPIr5ki8yxIv5xUsSlU9mnJTvsCpakQHdPYuO0Mb88vGFMOzH
         Td5r0lzt8HhFMmzIagPQTyjLivx9/9Ujn9JP5Gjs2NC/lBdciT+fsx4o2+7AHQtGC9nA
         pkdPocR5U8Q7fAqQ4nrQt4T/QluwdHjXTJtsZXZ4voGYh4ig+WeRoEquwp8+t61eDb/t
         YIoOWHIxZ2U0Wxu3f78X0C3s3WSE3JVt8oDq8HV2mlzSJNdGfAh1r3eutNEJnjiRYNyH
         bf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=CbYUf7ccNAlwMf4pwWyAM1KOqjn6Sz1F+9nAwyRhA0E=;
        b=5g1ca9Z3lnXDtGhtRDhbOWz2VxZZVeLTPrEt0C8y7Hk7ezfLN4MDxY/+dK9JtKG8c1
         3tpP3u4RsVX3NgSVscwz0gQ9Yg9hjCb5EGy4DYGZx+BRqvwyBrgM4mHOyQaj6dTJRU9E
         ET9PapfT7Skd8Ot/Jn2bgVzo7OYLXyhbLsVyg/JygUvV0vItzlIXMhobW3NPvH0xQXmQ
         V5Xit8SXZpDP7/hj5fcSh14spVb2A0F4u0hhfcRbjEKgB8wqa89eThx/UamUf829ODop
         K+0qD53cV0aYd0m0X1l75Fzmt5uWV47SXGOGdlfgLi/+SPna5bvzntWlvEw6d6gZQsVd
         qAAA==
X-Gm-Message-State: ACrzQf01Sa1VZv7iIqm9kXVOpRxgBmBgc8v82MM6yE2gUG3pRkjFSetY
	vIRkOANPTsy6o7OYC2Rf+U44Jah+yOs5xQ==
X-Google-Smtp-Source: 
 AMsMyM4qYL08dvjieLyXYuoEVJElwVkGDLEYYZiDXozGXme1DAsSE6jYgBA3QCe5+SjObDjVV1iKaQ==
X-Received: by 2002:a2e:9cce:0:b0:26b:e2a8:d137 with SMTP id
 g14-20020a2e9cce000000b0026be2a8d137mr2826906ljj.356.1663415810971;
        Sat, 17 Sep 2022 04:56:50 -0700 (PDT)
Received: from localhost.localdomain (128-69-252-44.broadband.corbina.ru.
 [128.69.252.44])
        by smtp.googlemail.com with ESMTPSA id
 y24-20020a199158000000b00492c017de43sm4077663lfj.127.2022.09.17.04.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 04:56:50 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC][PATCH 0/1] mesa: clover | Microsoft/Intel CLC: fix building
 OpenCL programs
Date: Sat, 17 Sep 2022 14:56:41 +0300
Message-Id: <20220917115642.766941-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 11:56:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170827

This fixes the errors like:

-----8<-----
dragonboard-845c:~$ clinfo
<snip>
   Max work group size                             1024
=== CL_PROGRAM_BUILD_LOG ===
<built-in>:1:10: fatal error: 'opencl-c.h' file not found
   Preferred work group size multiple (kernel)     <getWGsizes:1504: create ker>
   Preferred / native vector sizes
     char                                                16 / 16
<snip>
-----8<----- 

Here clinfo runs on target board and produces correct output except for
the "Preferred work group size multiple (kernel)" item. This is the only
item which requires clinfo to build and run a small OpenCL kernel. But
building OpenCL program fails as clover can't find the include file.

The reason is that the include search path is set at mesa build time by
setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something" and
passing it in cpp args. This results in path to sysroot included into
CLANG_RESOURCE_DIR:

-----8<-----
dragonboard-845c:~$ strace clinfo 2>&1|grep include
newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
newfstatat(AT_FDCWD, "/usr/local/include", 0xfffffc3bad68, 0) = -1 ENOENT (No s>
newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
newfstatat(AT_FDCWD, "/usr/include", {st_mode=S_IFDIR|0755, st_size=12288, ...}>
openat(AT_FDCWD, "/usr/include/opencl-c.h", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No>
-----8<----- 

Hence clover fails to locate /usr/lib/clang/14.0.6/include/opencl-c.h.

Microsoft/Intel CLC *should* have the same problem, as the code in
compiler/clc/clc_helpers.cpp is pretty close to the one in
gallium/frontends/clover/llvm/invocation.cpp. Except for the case when 
the contents of opencl-c.h is compiled into the CLC library (seems to be 
the most common configuration for Windows), and the problem with locating
the include file on the target fs doesn't exist.

This patch is RFC for two reasons:
* I am not sure if using hardcoded "/usr/lib" is good enough
* The compiler/clc/clc_helpers.cpp part is not tested. Maybe splitting
  the patch into two - the clover and the Microsoft/Intel CLC parts separated -
  would make more sense.

Last note for those to try reproducing the build with clover:
clover uses libclc from meta-clang. meta-clang master branch has moved to
clang 15.0.0 recently, which breaks mesa build as the mesa fixes to account
for clang 15.0.0 changes have been merged into mesa main branch, but have not
yet made it into the last mesa release.
My temporary solution is rolling meta-clang back to the commit just before the
14.0.6 -> 15.0.0 update, and cherry-picking "llvm-config: Replace TARGET_*
flags with normal equivalent flags". The latter is not required in my case,
it just makes llvm-config wrapper from meta-clang (the one used in this build)
to look closer to the llvm-config wrapper from oe-core.

Andrey Konovalov (1):
  mesa: fix building OpenCL programs

 ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch

-- 
2.25.1


