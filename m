Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF54F88089
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:43 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7726.1776322118319205369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y0RFOjoH;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d73352cf2so3798801f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322116; x=1776926916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MxhVmaE7zOkp6+PRpkOk7YIy8FhadmSy8TPi6WlO+KI=;
        b=Y0RFOjoHn+zOSMfe6Ms/K/bfh1VumFLj25+UxlTL3qe36CwsjalCruKVmnoV17no4o
         iys2mfcP+XgtiNlRlS4EFJ/coIl6cdHkZqx9PyezUEs3pqpWDslbf+T67x4czYphxv1Z
         1kuzf+VU3s+o4vT9xX3vpfvt8hmBiuIE4YSGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322116; x=1776926916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MxhVmaE7zOkp6+PRpkOk7YIy8FhadmSy8TPi6WlO+KI=;
        b=hUXgsxS3LuYx5SMJZ59EHEzx9pgAmecqcVcJ1m8rIbgR4GgO0Nvm8YNWmzf9DiRrZt
         2cP4JQ1iKdewmhvdmlK31qM8Qy/S62efGPP7/AUd5qcjLfEPnbY8dFnN634v0TWN5cwM
         K3+mZDaU5pay3YHzBsH4PVu4T54Mjy0pa9kDzVmRuN/8X7JAvc/fEDPB1Qw4+732hgXb
         obOkoRkPRRWP1/V666+UO+EV1pUbkSZvBRQveFgCoxkHj4C5+m8wBEJuMm29uQm/xt27
         Hpvu5EDCDxdGurYjEC4fujgy9mefakr+u45VuDdcYtofcd40inx8ifqIORj8XrkddReP
         siWQ==
X-Gm-Message-State: AOJu0YzSTZAam7N4338l5EjjvcYgT5syDO91LFfEansf7jnm+zyH6voI
	7BEEan3Cl/V9JvV2/9Itt79fyq4OXcICEYn0mZY25Qp0c33lL5qQWkF03G1kVhyNdwqKXY1a0N1
	E1KDat+cGug==
X-Gm-Gg: AeBDiesV7r130XM/UijohL++0muNUeKcRICsNF9U8z2my/BaN+N+C0TCUIs3SV6zfNC
	X3KDLQimwRinFcQlM00PISIEUD0Mv7jyK2/cw6kMExFXNbcG1g0OH05nVo7MOh09DwFDmepGgXC
	hjYAxUsFHTB9pTbcCR4Z/0YL8yUAqzByADJ4YSFM38Sna+LSa0DGNLWeV37YytqLfPIgUFc0IxI
	1JoozjmaYPbc06dCliTP8mONt2bRTd7orbffgiYvWPAJFIlhZxte5fCff7O1wx5FVS+LEyl6xPP
	51SQRDMOOTY+XOOTEKRrLGwROGuwMlAtuw4F9P/EBIQHBp9XAz22n7mTuLpA7lshFEpmegZ4X5R
	wlbISQZq7w5pZFXM8VZBsnu4j8APaQaz+bW3rt5O/EEIPK/1YzfrHNllxkbvIBfiGAhPo0fbK03
	XPS7zfJgTk8FwCHwTmShn55BuvDr3nOqJZIDTG3jlTq2yN/OsFmOsQT8apmHzM8nwWFbnqEK0qM
	FFLLkbr+nGkjvK3Emb/Rs+TbGkdhsxk+RCMFA==
X-Received: by 2002:a5d:5d11:0:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-43d642a26d9mr37159142f8f.22.1776322116366;
        Wed, 15 Apr 2026 23:48:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 28/47] libxcrypt: Use configure knob to disable warnings as errors
Date: Thu, 16 Apr 2026 08:47:29 +0200
Message-ID: <87b9e62a9e2d984d957ed89c773f349559185c1b.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235370

From: Khem Raj <raj.khem@gmail.com>

Passing Wno-error via environment flags for target and nativesdk
is intended but is not effective due to command line ordering and
as a result some patches have been added to disable particular kind
of warning as error. Given the scenario, warnings as errors should
be disabled for all builds, this makes it portable across hosts and
across compilers ( gcc, clang ) and glibc versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 25f26861ddc8d71af5381d1acc883ad948bddace)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index d84cbc9db39..25cb7f6178c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -18,9 +18,9 @@ SRCBRANCH ?= "master"
 PROVIDES = "virtual/crypt"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
-CPPFLAGS:append:class-nativesdk = " -Wno-error"
-CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+
+EXTRA_OECONF += "--disable-werror"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

