Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF3FC44503
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140041.1783291395174905941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hBpXA2l3;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so11849615e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291393; x=1783896193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IuDhw5n5waWRnthmHu21Upl/cVhitH9pHLWdLtm1rao=;
        b=hBpXA2l3DAorRS7wvTbwwB1lPq177T50bFrm41vsphmQ2BvG9kKgy4RXDzu3u0QHJ9
         VdxOuirLtUPNVRAYZYUJAL1FlycB/XP3qV6Jd77Po32Bap9FNH5tbLuEpH2HSaZeQEIf
         dVutJDgePWia6iZ1xypvctJP+92bIDU9/Rymo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291393; x=1783896193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IuDhw5n5waWRnthmHu21Upl/cVhitH9pHLWdLtm1rao=;
        b=dCGuf20E2VaeocrFAeVI7rZGXNRla2UyAdJu0tx/tMZjo3Pesx+/337+SlOSM0+3Fm
         gLivRx6Imtg23SB27VheEdWA5oR3eSouAlO4CHEd89RkzmlkZ134eQMQZ4GZhx7caHul
         tD2GrXNkC10alyfvEWavINV3OAAKkmpFMAxoB/p1OYn3xiUHYht/hwGDUARjyfWK2Nmi
         Zje8BJPYnLGC3FpqjRfcGXG4JYcI+BFMN/tIaD9YBvrgRJhaQzbhMRkTY7txBYxkylD1
         SbTEZ53LaW8MfRO494ek2FZbgTGHeSIa0xu1plu6PhXM5DfhlrQtLn/FMhT+/LOvYRRT
         uOkw==
X-Gm-Message-State: AOJu0YyG/WewUnNXzLLChR/xaAnOnq5jsqc9rKe7ImRKB3ntlJ260eWM
	A3QIXosL7HUGIJMbXJQJ5yAR4/vLE6Z2/wFpeqto+18C1Isfkr5vv9GT03/Fwzc+kh5rcp52Qak
	RpkjPohg=
X-Gm-Gg: AfdE7cnjYbJ7WFIRtzQoOCy4g5y77Ate82XI2ly5ZtWK+E2KLDApJGb1ccwBTezZx4E
	v+j8MXQ7rNL0K/2dVHMbmTGVKBmWSX1XCSVzqEuAuFNJECYqzHWHYrhKBoL91uNdJMFlg7f1vsN
	JGxpADN8WNWMdldYHMF/LGr2/WYhkBxE0qFgCSPKmmB/5NDMIKMk3e+ljheGqJDZ00blWcd2zQj
	0GOp3DpvGSLxNL+edD23RG8E6CbQVOJuq/86DriuhfHpYn02wg5yIA5THQ/Z1KGFmN6qTUkYlOD
	K8CpffS7WS2X2LDx4UImbzR5Eug2hNRcvug3dylYzdCAJUngv6RMZEbwwp3yLLIpsmCyCDWhz+3
	cPUlbF5noMYdMxeMFQwrX1R0O68tAWcidIu7wCXB1GP3cymhG+wBK6cMxrDDVn3pzydtfupFmgJ
	FArTuaz9Rk/HJFPEnJ3lpzWW4r6Q==
X-Received: by 2002:a05:600c:870c:b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-493d11db13cmr86051195e9.10.1783291393351;
        Sun, 05 Jul 2026 15:43:13 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 50/55] qemuboot.bbclass: add missing task dependency on kernel deploy
Date: Mon,  6 Jul 2026 00:41:40 +0200
Message-ID: <b68223b54813fdbe9b7b2f6b4037e4145391d887.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240204

From: Siva Balasubramanian <sivakumar.bs@gmail.com>

do_write_qemuboot_conf had no dependency on the kernel deploy task,
so if the kernel was rebuilt without invalidating the rootfs sstate,
the task was skipped and .qemuboot.conf was left stale while new
image artifacts were deployed with a new timestamp suffix.

Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
Python inline expression that skips the dependency when
INITRAMFS_IMAGE_BUNDLE=1. When the initramfs is bundled into the
kernel, linux-yocto:do_deploy depends on the initramfs image
completing first, so an unconditional kernel deploy dependency on
do_write_qemuboot_conf would create a circular dependency.

KERNEL_DEPLOY_DEPEND is defined with ?= in image.bbclass and is
already used by do_build[depends] for the same reason.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14520
Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed97056104ed2b97a687f956b49be7241862be53)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/qemuboot.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 56106b19581..d1794c7899d 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -128,6 +128,7 @@ inherit image-artifact-names
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
+do_write_qemuboot_conf[depends] += "${@ '' if bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')) else (d.getVar('KERNEL_DEPLOY_DEPEND') or '')}"
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',

