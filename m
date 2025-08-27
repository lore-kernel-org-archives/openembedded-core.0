Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BA1CA0FED
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:49 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.6651.1756330246135133116
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oH5/XOXi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49cfd967b9so219770a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330245; x=1756935045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsJU1duKP3pFXtbs32K+zcWEL8T1/ccyAphMtH3J0zU=;
        b=oH5/XOXiamff6IViBGW7A1SB9Q2DuYaf72oUlI/VBrNap95Wl8hbfcZUvCzKN7i7iK
         jooxGZLOuxaEzMcgHY52AnSBhPqOUtBnHRnpdN4L6GsplSbKGNWYNP1wm38XQMnduoKJ
         AZAMHEcFBOQnThsxcur/Mu9gyywopgwt+XpVsUY1yvuDZvnGe2xOa+mivGjZ1cKBxy3P
         CeGhLSNYduXf4iNNa3j1sz0QebsFSdsgT+x5OWFby+x1OHk/7bdEN7GBcseBAVmBurVy
         6osZJm0fGGbhOAlMXDNhpUNjzW9E8rm+voM3ZqUVuuEWf4ayFO7UcDWE9kqFHEvhW/k0
         tGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330245; x=1756935045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsJU1duKP3pFXtbs32K+zcWEL8T1/ccyAphMtH3J0zU=;
        b=bus16wVagUpTN1Lfl6QrGL+fuu+cde7EYGcCX96X6FI2O4nTKv1E9augVJybiextU+
         pGH3lgmOIaApo+QgCsqGcedmjX7BBEFiN6CAwhyOeBunsYF3lo7etbZukJCMjuROM410
         Po1F3gmMKghK9to9XsLgypTgVNEVKNUl8bye7WvdTKM5R+FAiJRH2zWtkF3f/Xnusjdg
         IeoqsteV0F6X9ibOLEh/NVhpBN0p5Np2ljTcViP3d3pKLWOsqxhzCTKKyN4/ISWZH5Y4
         yxnMJTiqBMhG5ea75sF7dcXEezyOllrcLdUoGIK2neO9uy9URj3CoJ8SrWnILYdDZtvP
         leTQ==
X-Gm-Message-State: AOJu0Yw+AkgdONVdz7Myyw7D3sdmQ7OKUCxBGLDAVyTDCJ8ZS4JHgz2B
	tyolE4X+7NpV67szBO48Wjj6OLunh/WzQmi6JFhdFBdWpCiomkseOTwp5uAHSXz4ISrFP/7/gTz
	ig8+B
X-Gm-Gg: ASbGncsCfjp2c4Mc9ec5/P//NBZEmbH44GdirgiMcZpkPcQbxMfHdbHrRCb9qD+MJVc
	g0qav67JYJs30EDebnfLBXC8mPpP7XDaHMeDYbki8Y+2emh3pDPfITlwFd9syhsyHnqL49UOF9G
	Oo3kTNE09b86Oi228Kf0mIjTW99rTl6wXZSuOqOOFL1FzY/RvJvxNsugPEeUVXz6PcoeSqMFY0e
	Nqgi0WhjQ54PsFc2MLVNgA3ob1nFtHlUcUODxMUIzaBUau48jdbt35qDqCXUd6VBMSQYX0GwXIj
	3bGe3g25b2NP6PIg2UdWskAPOWgbrV5+21G0E6WxGjfNXNlfh/m03vlkMAtl/Xh2V1FV4+HXLfY
	5OwnalrofFJ/5XNgZ6DrCAEwF
X-Google-Smtp-Source: AGHT+IHL26blkLAhQUONWVWS/AYCEXv8xZk/3ySUjzqANf8IBGVlpqcq4kLmhGY15LsVMIl7tcvI4Q==
X-Received: by 2002:a17:90b:3ec9:b0:327:5360:5b0e with SMTP id 98e67ed59e1d1-3275360615cmr7749804a91.30.1756330245374;
        Wed, 27 Aug 2025 14:30:45 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/33] yocto-uninative: Update to 4.9 for glibc 2.42
Date: Wed, 27 Aug 2025 14:29:37 -0700
Message-ID: <9f0cc5fe65f71cf1d28b7a34272f29db03dc6778.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222538

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index dabd604e8e..3ced03d477 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.8"
+UNINATIVE_MAXGLIBCVERSION = "2.42"
+UNINATIVE_VERSION = "4.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
-UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
-UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
+UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
+UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
+UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
-- 
2.43.0


