Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C41C44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:37 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.892.1783881813969783603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=YciKPhfj;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664d78637f8so4378000d50.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881813; x=1784486613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=YciKPhfjyGBnLMp6rV2rxhnQrgXh14an+lCKVe6f7lHlrxNrtW6VPE6SBrhYg/k2J1
         VjYeWvr5n0Lvuee9rMxwdFUTjcbldN613Si9nbySeKEqqtzMT36U4ycIS7DmM93h7p10
         pZcAVzF/8Gh3aKik206+udXsVwll9enNtk33VojoNldSZIg4w7EuL7FRin87g9t1zhwQ
         n4/jmyEHSW1JPow4AqzyjKQDShI2lsuQqGRC+V7XjYWrJhOXs2h2Pr8PA2F2CR9TK/21
         3d/Fba9BEB2wAQtlO/CJHNILxSiu6xRPbaXd2oA1vsqYngxO5zMtkLq50oofvmdRxqvw
         VmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881813; x=1784486613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccqQOmdDM/FxPbN/f6xcWjhryokDDB53Pag5RvW67tg=;
        b=BAKX5pDrVPt7sy3uGXScEgVbs/lKusqRuRdenAlWwgVUTFqbMmDKpDtMaFSzmPeYK6
         bNOy/U5PafONdLL0hto7H96cZ9GZx1WKUGVw/ynAtLa8l022ig6sycvoRzkWVcpsLVRN
         nt5npNuJJGV8WHlN8ybsZPC9FQz3m4DYXR4XBqUI5YfArG1pl9M/N38dE9sFr1cwpPqA
         jaf20oxtemhRIKkFUFHeU0OHWUR5UD6F74TVj8ifxYQ/ny5RkAcpgHYE3JzZxe1nNCxA
         ZjFpRCNweUKbomyK6luWLJp4PEkFXGRDNtRU38GnRpwAu2OD/1t9U7oxakwul2CyzoPE
         9AWQ==
X-Gm-Message-State: AOJu0YyhfJkxZRAh9wY4ZUOgK5neFK8cgZl0fMLA7HcuKOzKHEv9KL+/
	vGOYlCv/62OAYLwKugBYqlHrQPjoxMRitS+wW7Q+ZgOEgmDVJ8GfwX3k3dp9thWJEjOeiSvehTQ
	BdtLmp6w=
X-Gm-Gg: AfdE7cngDoRsQHaAPkVz3g1gRmDOJotiGKyKVDYt+qlMJ4DRPmTlmxlbnWTgKd+vQpf
	Y58P2xmN04WupLvgjmCVUeL0GxJ3cXflteeLmZxcZt3xsHJr4P3aP7ELj3VcFbhJYkjiQVhvTeQ
	8V3MkrL64jTkI2iQDyq0RF1ZZPEf4GtmoeB3xRZ9qun/sdYceGYXEBs2XReacpaRemnWMiDTnm2
	tJH/4QRmrKXHglWOU/uEobhjqAyNBDbqtvce4IPKNizwWUkg52As8eTQXTT+5+3qo4YuwjTPEBv
	hKbY3Fo3EbC0VgsrQwhjlcgmqfmoY/J4Zruc7Zjc6QGf/XsOWMrwEfeDEeKwXVEPFvVfoGMNyDy
	AbDbvukHZJpJMj946dhuUg8m9SUaXMkOOYbC7sc9IabImT6QzgWO3icz64SG5uTjbRUjDboTAN+
	12RZ4hCf0Br2/3pA==
X-Received: by 2002:a53:ab12:0:b0:664:ae6b:b499 with SMTP id 956f58d0204a3-667d7c9dedemr3768342d50.78.1783881813089;
        Sun, 12 Jul 2026 11:43:33 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:32 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 18/27] v86d: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:58 -0400
Message-ID: <20260712184307.3259642-18-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240808

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 3bc9b24487..66dc3b177e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-RRECOMMENDS:${PN} = "kernel-module-uvesafb"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-uvesafb"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
-- 
2.43.0


