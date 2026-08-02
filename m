Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C6C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21341.1785666553662793956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HX0Zlg87;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so10320625e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666552; x=1786271352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pP1BxnE+RW+MLZbFW7bJq/AT5vxkhzgwGh6P+CjiMRw=;
        b=HX0Zlg87ZiepED9sSotlgo5B0t/R1FzSN2EEt/zmYdjKij1SlsGWHkEWRuCmaB4Oxr
         gcg6T8RoplP2kvl2M9BLpXgiKPtU+HR1/UgJH0oi/J31Y0rBbuWvg5WO9wzYEFdmxIls
         XvegX0RMElZLULsElxR8HWklLiWsPlHGhLL/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666552; x=1786271352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pP1BxnE+RW+MLZbFW7bJq/AT5vxkhzgwGh6P+CjiMRw=;
        b=ojOKhT1rSLwiSoh1pw9/kPRehcWoR3FLJsTQJREy4Jx98j62iD4A5z2ejZVMUMAdxF
         IvelqxDDm5s0GSdYfYrVf0PibaBXhHUyKbMb3QXGwTwUXHrGnIvtEVEqJfcAheTWbpB0
         u7L5G3KDHe6rluE4gbGGOCFYLwKEiwHx3iRqcdxl5JZQgam7sdsrJGid/nwA9VAMhOad
         uvyEjf3HxYFznRcdT30ATqvRVp5o96Wnk3eYU+OTaHjH7/4CAEZJLbpCyT5CmHLHyBC8
         /epvA8CZzTibxLmS+hp5a2zKi+r+Xe6J6g3dolAWzWDCazzVZrYjbA19ywgEez3ktKmE
         OaGw==
X-Gm-Message-State: AOJu0Yx43mK9ers8MYb30fMZHNUwcY2XYtH5tFkYW8GXg5uds0StPZQY
	N3n7ZPonER4QLBX3skamUyB6oYSQVRwjnjUN0CVaYZQriAddW/jk7gnc9iada3pGEDsOuoUVlMo
	EuiaDXgg=
X-Gm-Gg: AR+sD10EHMTftUGFbGdMD7NomV/vPdYvITAgFyTxsOF6PRCM/Iwkxy3Ii/M9uHXsnRV
	zn58DXFwzSnePG0zdSCZ0uwDSuBn9kwyxNNvuHt9L84mq+lE+1km3ElYY1ka/K3bnLSOAaeuhXy
	moRrnzsurYxre3Ia+TNhz05zb/p1Bv4QZEoymK0V6I449zPdvPxBExugghuF5kKTVg3QB1tt1sp
	OIKhH3XzTbmj5rRqoHwDbsC6RDhaEApp2DNPbF5kjEyDql3Y8VZcH5jCNShNLbub888dBn+0Heq
	8u5MKBFX6XdLj8pThYOIy+pm7H1Jz8pAOAFLmqp+Y2i6zqWZKI03WSN5WJkSV3nCORqrt8PtpNr
	zzzlE0stgEpTA2y95B4X6QIoYASGUkjZ0ltjnbPn8vfo/Vup3Ss8VEuKYEt7L1m9z6CQvPW887i
	qliYxhQXweDnQUUB3/sfJFuN1hQApRjM+RH/k4kGo6AfwvgNx40a3mFYW0B4DjQrJST4MjoGRA6
	pomTYbzssWo78cqcA==
X-Received: by 2002:a05:600c:3150:b0:495:3c6f:7c18 with SMTP id 5b1f17b1804b1-4980eb8c4c9mr88315255e9.3.1785666551916;
        Sun, 02 Aug 2026 03:29:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/25] kernel-fit-image: Swap UBOOT_ARCH for oe.kernel.map_uboot_arch call
Date: Sun,  2 Aug 2026 11:28:41 +0100
Message-ID: <20260802102854.3952760-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242537

We can just call the function directly, no need to use the inherit and
variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 3ace09ef5c9..7b2bcd46737 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -1,5 +1,5 @@
 
-inherit kernel-arch kernel-artifact-names uboot-config deploy
+inherit kernel-artifact-names uboot-config deploy
 require conf/image-fitimage.conf
 
 S = "${UNPACKDIR}"
@@ -76,7 +76,7 @@ python do_compile() {
     # Collect all the its nodes before the its file is generated and mkimage gets executed
     root_node = oe.fitimage.ItsNodeRootKernel(
         d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
-        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'), d.getVar('FIT_OS'),
+        d.getVar('HOST_PREFIX'), oe.kernel.map_uboot_arch(d), d.getVar('FIT_OS'),
         d.getVar("FIT_CONF_PREFIX"),
         oe.types.boolean(d.getVar('FIT_KERNEL_SIGN_ENABLE')), d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
         d.getVar("UBOOT_MKIMAGE"), d.getVar("UBOOT_MKIMAGE_DTCOPTS"),

