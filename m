Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE58C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 05:54:47 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.3217.1660197281386598816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJoKD6GO;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id 17so6771128pli.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Rv7o+BS0ozzYJ6RRUo/hzv/MB+nqMiPUBIZNHOQZrfk=;
        b=gJoKD6GOGacfzPFOAebns4T6IsKEzy0dUDM11LV6pG6drtHq194uljDDcyfPRm3pBb
         l4jnob7AriofDyz1u/MIQp+39l8TKA7KVXVF1P2vCm/okMmyAPojyMlMtn6BBvp+6UZP
         /wcRP3M3ZRpbgZc8iwkIYNTWn72b2aruANwflH47t5idym5XyBkaMNuaeXfi1AXMmssk
         YtWRVvDqwJ9HvKhZX/U5zOsdo5l/cQB1W2VsExgD/2+YZmh3H7LuictyOyttR2RmEoHD
         UWJbYtFpCG4VQxSDHB6sxE6ugu5Wq0XH0x2djQMjzpSunOmGMFBQ/aHydSAVj2BZcoDt
         ajtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Rv7o+BS0ozzYJ6RRUo/hzv/MB+nqMiPUBIZNHOQZrfk=;
        b=vNOVp8h1K6MF7W6e2k5AcEih01xUhhDvcP87lIi9hv6t8R6ruUEeTQAcfrM9fR8m+G
         hYtmUsj1gFVeEf+rkwP7ImOZa4Nx3+RBLIJeI8bSDk4fof7TQypo5RB3P93Bujoiq6Oi
         1mzYjikC2GvmGkaDIl+Woz1XhgAkScpZDI/tYazOgCGYiOIi1TT4BsQeK2NldbwcUrrk
         9rRreR81amxUquXBTIheQpf8l2Nhst8yxIoZo6yIttcvAeKhFV49+y9jooErJfm9DqKc
         2F1pm9+DGRNTYix1T/jn0uTQjR2U2b6sCyXfesohwdUvF1V4zLVjVwbgen4YDy5qyoqM
         G/xw==
X-Gm-Message-State: ACgBeo1JxdZxjKrJExuBPJBtwpGLMcVOvEfi7/eyPc5yBOCJjZ6Udng+
	Wh123A4WJ8sdySm8tj+7wjBeq96qcrY=
X-Google-Smtp-Source: 
 AA6agR72RPvG/7gJB7Y11nhUTTzHMUzM/h3g//S+eCu0gv0NRfH6o+LfmypMIAMx1k7Z5pvYCMnQPQ==
X-Received: by 2002:a17:902:b214:b0:171:2e1f:6d1a with SMTP id
 t20-20020a170902b21400b001712e1f6d1amr8013115plr.147.1660197280261;
        Wed, 10 Aug 2022 22:54:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b0016db6bd77f4sm14290483plh.117.2022.08.10.22.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 22:54:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] unzip: Enable largefile support when enabled in distro
Date: Wed, 10 Aug 2022 22:54:32 -0700
Message-Id: <20220811055433.819522-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811055433.819522-1-raj.khem@gmail.com>
References: <20220811055433.819522-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 05:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169230

The test to determine largefile support is a runtime test which wont
work during cross-compile, therefore override the test result from
recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 15235540890..96068eefdd2 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -46,6 +46,8 @@ UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
 S = "${WORKDIR}/unzip60"
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"
+
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
 # Makefile and add CFLAGS.  Optimization will be overriden by unzip
 # configure to be -O3.
-- 
2.37.1


