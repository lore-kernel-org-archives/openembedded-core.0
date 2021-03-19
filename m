Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.1772.1616180327226498277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=alGq9Qee;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id g24so7559081qts.6
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iVmtNh8LS3FkJk5yodwvmBFMzGf529ozV/L52ByXNN4=;
        b=alGq9QeeYBqx5+FQe5fIvH9ZB+0to41NJD0Y5Di7OxvufoGOJ7IZEaByFixZ6fJnPi
         yJJWBctWh2zkzub/del95Ql0/Z84ZcblRT966DtCRQjn6x3hP911meqNoGkOieXdd4aR
         AEEuSgDJGxnsYIlO9nef1+eMG/+AmVvCJJreMNLXVCD9C7LCG4Kn3Ugd/exrk2aJHI9A
         22Ku7S5rt5uCGfAui5wAZgzVQpbsTlPzNFb67hMg3CpwtB7uyOKrVyGGstVfLnEXfMDB
         LRXDgnCjollMExmA9qhn5jA1GOLBpFGMdOkgFfljtZhA+Py5tE4/rAJ++gP9tytMuWTv
         jy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iVmtNh8LS3FkJk5yodwvmBFMzGf529ozV/L52ByXNN4=;
        b=OHRY1qVHyOujcHV7/UDin7hdpxRWLVcFuOK4KFmdS+4/mP+YaYPX/PYtVOoqnyfGRL
         HFr7ip4B44jC7mbNIdYfv5VCUutUZlD5S1DQw0yXWr370nVxnpbI9+CPvCl/7xVacEsT
         FTRoohJy8rHdNelCg95Uh0q4ZHMHuvJmdcYosbYTF4a72IN9xw0tTbvtePe91COFJkZp
         JkZaMXfkG+CQymKUodLjS9UtspFHsl4MHIeckgT5gBlXz7aRhHDD9LfVNMYTOV3717DH
         +T06GvbK12mIuwjq6i7qwIoDaCUQaD1N0Fwk+f7UOUGpBz6Evr5C1PxDbr4+Lx026upp
         AtPg==
X-Gm-Message-State: AOAM532PFnZ5XI6um44OtznEdSEuyUe6Dg9Prko4JxwMCY3dVOQxcJ5Q
	mFgyKrvBvTDQh1r5QrfBcjo=
X-Google-Smtp-Source: ABdhPJwenoT4tk9xREbE2tPWMZi0m1NtlizJLop5QFg9Yp2c+P14nc+9XfJc7R0rwWX7gxkrCLtDYQ==
X-Received: by 2002:ac8:7089:: with SMTP id y9mr53752qto.264.1616180326273;
        Fri, 19 Mar 2021 11:58:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] kernel-devsrc: fix on-target scripts/prepare for v5.12+
Date: Fri, 19 Mar 2021 14:58:37 -0400
Message-Id: <8510af46870b71b919d1b132b8e5ec02be5a4a28.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

AR is now captured are part of the build environment. If we don't
subtitute our on-target variant for the cross version, we'll end
up getting a prompted configure when preparing to build modules.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index dadeade3aa..455c836527 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -271,6 +271,7 @@ do_install() {
     if [ -e "$kerneldir/build/include/config/auto.conf.cmd" ]; then
         sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(AR)" ".*-linux-.*ar.*$/ifneq "$(AR)" "ar"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCXX)" ".*$/ifneq "$(HOSTCXX)" "g++"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCC)" ".*$/ifneq "$(HOSTCC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
-- 
2.19.1

