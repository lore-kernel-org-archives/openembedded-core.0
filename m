Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F4FEED60B
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 15:34:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.23529.1694792060868289966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 08:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RhCqdPxn;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c1ff5b741cso20891375ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694792060; x=1695396860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEYqBvKXqtoADmwSlKlnYwFCpGWC8xbkQzGDMS7GC3I=;
        b=RhCqdPxnzBVvnBWkhbiQnitMfvMs4+7desZKiVhBpKkDqOmnmNzC8JwBZSITpI9DnK
         7gVy7EsNDADhPq+R7iPVJA7S3sNYGj9V5A+Z0Iy9Gw+GSNUr+YdA31oBKse6HAqoaOwt
         4VaTUMBUe6Skmm6KSWoKktdpwbI29EVTPP9zmiGPfnqVMknQuYxlebk3QaM0vUzZ80w7
         QliZY4zBL+Kfmao6ETnkFlGl36jiQT9V7n1YSbXyyhKu32N6jmj/syhvxIGjxIFxdzFg
         gMJ1A7HEO8gBzHNXi9zKOw8NV84MDG7pXg5g74e23eaVvr5GVgmt8VgC5dAuO8ifzjMC
         BlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694792060; x=1695396860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEYqBvKXqtoADmwSlKlnYwFCpGWC8xbkQzGDMS7GC3I=;
        b=Y8z3oMJnHds+foFnPljXWwpEgAMmjX8G+Fuu7EmH2H867t8QR6fS1S23rRCPCkBKSt
         zyS277ep6qM2zLUQsg9R9lKRXLZ2ONR8UpbrtmOpL5Ks/S0JH2mxq6cJ920f5m8ZA7ox
         jzkmLHkB2/eOrP4WVY0+nrLruPQGU3c/FjJOXBzE95gPHC/sGc/snFWtOZRoxMRqRkMx
         fcHP+nHuENMAB8lrmtcW+W1lMVuQVMPZrLFh12L037HOnoO17VMAXuqUtea2CLKZ7DPB
         Fg4MZ+y+7AnuDdA4BMoERIAu5NSfGLXv1R9b+RhcSTP2NiXbOGItePh0vgmssOxSu5Fp
         S//w==
X-Gm-Message-State: AOJu0YzSdNH9UGJ0c24adK3SmsnvpXtWF90w52QyMlIp/PfVfQms8w/O
	xAAeqCq7MYNBdPqap6R+Y+sziMwCzTA=
X-Google-Smtp-Source: AGHT+IEZ98/hOY6KeCXDhahbD18+riwk0q972C9cdw3pWHsrJP1l0vuZ3e5An8oFHhyoHZWM833ySA==
X-Received: by 2002:a17:902:b943:b0:1bc:61d6:5fcc with SMTP id h3-20020a170902b94300b001bc61d65fccmr1761781pls.51.1694792060061;
        Fri, 15 Sep 2023 08:34:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::4880])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902b94300b001b66a71a4a0sm3647309pls.32.2023.09.15.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 08:34:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] Revert "util-linux: scanf_cv_alloc_modifier changed from 'as' -> 'ms'"
Date: Fri, 15 Sep 2023 08:34:15 -0700
Message-ID: <20230915153415.3241307-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915153415.3241307-1-raj.khem@gmail.com>
References: <20230915153415.3241307-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 15:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187680

This was needed for uclibc, which is long gone in OE

This reverts commit d3ffa39e2edcf68583fa85c191f59a54c4722abd.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.1.bb b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
index 821a44a1453..927037a3429 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.1.bb
@@ -62,7 +62,6 @@ PACKAGESPLITFUNCS =+ "util_linux_libpackages"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
-CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 UTIL_LINUX_LIBDIR = "${libdir}"
 UTIL_LINUX_LIBDIR:class-target = "${base_libdir}"
 EXTRA_OECONF = "\
-- 
2.42.0


