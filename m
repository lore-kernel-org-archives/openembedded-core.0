Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2229C88E41
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6318.1788939001494845588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1aIxBFcs;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba14so4610069f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939000; x=1789543800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GXUOn9P6PqAKl9PWdLtqI6TyHef18vdWeAX4h9P7/4s=;
        b=1aIxBFcsMh5olL9lgOHGwqRM+8h3UdnHkoJOkuagY0AG6XhLQ9cvqZdSMXh0lzoK4k
         4fXEkOYpbfipim7nBKMMJQchMUsm667WpykPdipSjLUJTjaecCTd3Ei1YgNMvnF3+9LI
         w9MjHpVlt0GQdfLR8ssoBZCujpxr0/ZERD8hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939000; x=1789543800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GXUOn9P6PqAKl9PWdLtqI6TyHef18vdWeAX4h9P7/4s=;
        b=Ognn0C5BjohjWmbAY/s66z+dHGqY1elRq3ymOGCXk4lZ90KuC+N6FnisM9BTA/y9ew
         ///w+wi0BGjn1gixuzBBXLiBkhvYbAZjfVAVCdE77OHF/ewUqxdiUm8QCfW1fqbcA2h4
         B6RAJr9WfFos+LZPdOoeWAuOvlW5cq5agGnHCQW9cKS67LBQlbsE/KXOyVmwe9XhFO0+
         4Ew+JqU3ZSgsR613qCFiGR+0lGy3efMU3p6n64NjHr7D0EropM5nyvpkuOejlbfNb7O8
         /UYqMQxAxq7TVP7NFh0+2n3FHumbc4pIwWhs48vkavSonVvXm0J8/PfsVesUUPBJgc7c
         kYlA==
X-Gm-Message-State: AFuF++nLNHoyWd3EJIdbAFijStX6DdNUKNapx/pXrc5sle8SvKxlJnN3
	+Okk6RdRssR/KLHDgfEDiRy275qmpXFTm5HT1840MV9ytqPpMbOxr5xbDGnPiaD/Xp80+UC7sqd
	3lY2Pcc0=
X-Gm-Gg: AYBFou2JjiIsQqj7ea0ujOPxCOmMgmrx3s3nz1GNm9PE2ZiWp++tY30a0coCCCPNGAN
	iD0tnr7GQOZAO2XU1l5QKJ0rlVYD9csWKiwbbmVKmOrysGoft6EruHBZoi99vxwHdRuF56hF/K8
	45Cm/QMGT2e9X5rE+0edGawotrhylXy2vHmpwckYxiqGT5Zkq+C1+zaiSJjyR/tc4gWQ5hiwOkg
	2gkCcnGprXOjFQHf1pxXqI8ELwjhAdZqZ8+BnnkGpirxLSXwPdhAPBhGipEvnP35bXrl0nNlOU7
	/MDtRn3oACYSGwYOKRf7iE2MyfcP06+RopYYvBx/1lDYrZ4xzJc2P/1pAUoMc8RQRUyFAa4VW3s
	5Xtb+njCPktUEKASGuMnBPUQezvdzT6PXRRGwr0Vgh3u1fmpPjW4FYRJEolTo94PWS0VuMZP+7r
	Kef4tAwUvKTZSkkTMcclQbMtdewK6G3Da8RARFYUTp0oobtaCvu7WBGdrQ+X68TXcE6QOUnE+V+
	KWcWFOcBm6R1EcAmEvbDVwFrVw+26wiECpJMIdK3ml+zOhCCX5mRfTC5gvCFql32xu6q/6xfI4=
X-Received: by 2002:a5d:64c6:0:b0:485:9373:d416 with SMTP id ffacd0b85a97d-4859373d58fmr26444100f8f.11.1788938999544;
        Wed, 09 Sep 2026 00:29:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/38] grub: disable grub-protect for native builds
Date: Wed,  9 Sep 2026 09:29:09 +0200
Message-ID: <b3e732e13a908e1b46e746d8bf4062d5df5d0fbc.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245419

From: Himanshu Jadon <hjadon@cisco.com>

grub-native fails on hosts where libtasn1 headers are not available
when configure tries to build grub-protect:

  util/grub-protect.c:25:10: fatal error:
  libtasn1.h: No such file or directory

grub-protect is an optional utility for sealing disk-encryption keys
using the TPM2 key protector. It is not used by the GRUB native tools
staged for Yocto recipe execution.

Disable grub-protect for class-native so grub-native does not depend on
libtasn1. This keeps the native build focused on the tools needed by
Yocto and avoids adding another native library dependency only for an
unused utility.

Target and nativesdk builds keep the upstream default, so image and SDK
behaviour is unchanged.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9290ca0517e5a8888ee8a695a87c0d7e7b5ea377)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0656489ead3..466c772e5bf 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -73,6 +73,8 @@ EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-werror \
 "
 
+EXTRA_OECONF:append:class-native = " --disable-grub-protect"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,libdevmapper"

