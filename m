Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C761C35FFB
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 13:00:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7270.1742389196591446895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Or13UtNL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so45023445e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742389195; x=1742993995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8mFBaIbJIXXpVsPcrYHv881uoqPLcCjvS/an2REsRs=;
        b=Or13UtNLVtwXCA/Xf7RJZOCMGbexowe8GXeQLCUrFOvafAUdUl5mbPMHrPOkSMsCI2
         dvWHLTOp6mgJXMv6Nwo4CcQHj6sNRnFjhtF94blI9hGK4kFKESWAy1tmdpoQ3ma/Gyua
         ufHyZcu6fs92uTVLT0XvB/kBEIplP+7G9d7VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742389195; x=1742993995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8mFBaIbJIXXpVsPcrYHv881uoqPLcCjvS/an2REsRs=;
        b=T6coFhmMQcRCEvOVTd6lqpFlheAP7VhpYPODcNZCldwxlKQs3bVE4BmeejpcaevMob
         evQcbFkhIC7N4e1VHUoQVn0zQH8hgiFLn+uHmiQ3BSKd7StBqPHQOJnS0QvKTRAzM+2C
         fvjnQMbh9HxbhGyJwksV0GwQoD3/BP3yVo8zockTPAsj/xeDOzQ1JNdqq7NNVpaJTiSW
         qO3LjyvLBvrwSix87m+4uAYKSPyKg29opaN4DAMEwmunDVBOGcbwLXKXovxFaNMAFgMX
         yOIc13joBZg++DQ+BzKHpBpWW7JGNGJU0iVnUeeUmEN0ykNkrcjoeaq188f2YA0/S0Ul
         14/Q==
X-Gm-Message-State: AOJu0YwuylnAlXprqNljcHvu2RFWrBbTMW/6OVJ6l8ePgVsrQBefUuVO
	N2Byvw73pLhk5Dey3REHjZMydOBQ4Frboy5ZZJBHWCWuxCBAkzXP+43EF0+rjoOfET0vtkfgY69
	r
X-Gm-Gg: ASbGnct4tqcgGORLQsTVMFtS8M+eoxNXLnvSmgB5kyzXtQpT2HNxbAeLZQHFyl4/9gt
	dGMYK2fx2ppPbHPuzncLK1eY895JfLjEDbcgAtklt8yOPaGKkZrBgVofMWv0gK+mpnTxo/U8bnu
	lXka1GBKRH+EhnD27bS66N+0vZNGrib5UjlLUM7LrBPRxYHCpXm5CqHxPEdjQU8VwPmI2aFbWeL
	bLMj/OMOMV9hEsZ4TibQzt4jynBtSH/H48U3cw847UbjtIW5yrQhLDZrkKxy/QNmVb5momrs40J
	Fs7V+4yRjtNGjkq++UR+xB8HD57oBZReCHO3dR+/vYJT2wJ94y8ru4U6ylAZlBLzVoWazIBa
X-Google-Smtp-Source: AGHT+IGmBjwk9K312ykZjJu0YgGc32BfBPT2rjYGZdSNOK7yoWSED3Pd2NGlSiXroKwLkHzTdq1d9g==
X-Received: by 2002:a05:600c:b8f:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-43d4379505amr27144225e9.12.1742389194330;
        Wed, 19 Mar 2025 05:59:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm21325868f8f.51.2025.03.19.05.59.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 05:59:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libmatchbox: Upgrade 1.12 -> 1.13
Date: Wed, 19 Mar 2025 12:59:52 +0000
Message-ID: <20250319125952.646746-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213329

This includes fixes for gcc 15.

License fixes were also made in the repository. The license being referred to
as MIT was in fact HPND so fix the LICENSE on the recipe accordingly.

Use the new bitbake tag functionality to verify the commit matches the tagged
version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmatchbox_1.12.bb => libmatchbox_1.13.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.12.bb => libmatchbox_1.13.bb} (91%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
similarity index 91%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
index bf3f5c005d9..6ee30097542 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
@@ -7,7 +7,7 @@ SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
 
-LICENSE = "LGPL-2.0-or-later & MIT"
+LICENSE = "LGPL-2.0-or-later & HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://COPYING.MIT;md5=f45ed9332b4f50a35adf2065adde4ca7 \
                     file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
@@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
+SRCREV = "5cd78efa3120efc46497f55c04382be960d1864"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
 S = "${WORKDIR}/git"
 

