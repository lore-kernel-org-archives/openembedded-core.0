Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F462EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 03:34:46 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.68.1689651278690252924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 20:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=H/0XIS3k;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-403b36a4226so27061671cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689651278; x=1692243278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMHgzJlFmx6DaoAnRccylg986zhFhEEwws/OtUu7W/g=;
        b=H/0XIS3knulPqxhdDso9LfpK3CoE8NcYfisfqURqzx4wP3mFnkvIZYgob/a3DeZdnN
         PkS8MZVdRTsmwPyfLy+pxjGYbTQKrr/J8/Lu7E1BTRVMB0Szm8OBW6LEUmadW2bQT/CU
         Jzajft4VUM/pWRQw6r0kppk1NPhJdzioKosBnY6OqDFj4wv/kGWWo8XabPoIu90nW36W
         1WfycHJfYN+dSbY+dTJ2Dwkr5Q2RuvRwgoBkveyx3yeYyPhjv5h/YvF4rDcreG74ROwd
         DZR+pAkmqiYkW6zRwlVPKlcdsMAEr0rOxkj2ntM/5Dw3aWpfOdsIcv9+/j8VxmQ+Tj4B
         Soyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689651278; x=1692243278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMHgzJlFmx6DaoAnRccylg986zhFhEEwws/OtUu7W/g=;
        b=MeK8yOuxcF+De0ntAxwV8ePnTxOaNu/uAB9IH89Slo3EeesRwEM9AOfGHBoiQd47/8
         xvaq4/4WuVPJYtT233+vrArad7oY8BSrr0BzfxwZCUGCSiTPQBAj3T0m4lX9UxEY52oW
         VbnS3dBcxwfKuATUpIv0KjNj/2PEQN2QfFFxq/3RoD4zUEjp1IDbEsJKeolgj51tP2PU
         s2tnSFNbeDPBoVAB3MzRvBAISF0l7yECrIQubT10NT6KeEWPMSg6nHz7/Wxn5cDf+0JZ
         C+F1c9DjT2zWWKlqmNg8qI02zumFhRPZZISiH5Gi7fIT51RyrmNPqh7q/bwn6XlXV1ur
         aFlA==
X-Gm-Message-State: ABy/qLbNyy2rW1n8k/Gv9tHOd01ejRFAdNzu36YQY4YKfiT4SK71vt8P
	QDfUFtX4Y1C4u1KYMY3B3k0hW8el0nGo6A==
X-Google-Smtp-Source: APBJJlGlH4QMYQtGrFGwcBc9QjgbNMD4i5Lvae9nTigVcSSv6GFELoU/UbIDwzBdkokCP3YQYlid+g==
X-Received: by 2002:ac8:5815:0:b0:403:a485:636f with SMTP id g21-20020ac85815000000b00403a485636fmr13884837qtg.14.1689651277691;
        Mon, 17 Jul 2023 20:34:37 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80745000000b00403715e4cb7sm356633qth.79.2023.07.17.20.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 20:34:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel: consolidated pull request
Date: Mon, 17 Jul 2023 23:34:32 -0400
Message-Id: <cover.1689651113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 03:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184489

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's a 4-pack of patches I've been testing. I don't expect any
significant issues, in particular since 6.4 isn't yet the default
kernel :)

The main part of this series is to fix menuconfig for 6.4+. A patch
I created years ago to work around pkg-config use in the kernel needed
to be tweaked. Which i've done.

I've also started the process of dropping that patch, as there's
a variable we can use to point pkg-config to our -native variant. Once
all supported kernels are new enough, I'll drop my kernel patch and
the manipulation of the PKG_CONFIG* variables.

Bruce

The following changes since commit dcdfbd3b45c7442210a49f5db989fb188a329c2d:

  libnss-nis: upgrade 3.1 -> 3.2 (2023-07-17 15:30:04 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/6.x: cfg: update ima.cfg to match current meta-integrity
  linux-yocto/6.4: update to v6.4.3
  kernel: set HOSTPKG_CONFIG to use pkg-config-native
  linux-yocto/6.4: fix menuconfig

 meta/classes-recipe/kernel.bbclass            |  3 ++
 .../linux/linux-yocto-rt_6.1.bb               |  2 +-
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  2 +-
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 7 files changed, 26 insertions(+), 23 deletions(-)

-- 
2.34.1


