Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D88C98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:23 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2910.1790154679081539472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z2o23hPM;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5648285e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154677; x=1790759477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p1k89c+HjF1r8L1YEfsDallpilPWI6ndc4Xy6xccvEc=;
        b=z2o23hPMVaqUSuhboHR2GkZwRGHst1npaVleaO4w8iI7k2zeo6bXiWwsRaNn8zTt37
         yXoOMcxFXAv7Yc3hjRNTT0u7H2sVij8skAKOJ9hWgLucgIw/E1Fc6CzA86UnjWGnNmg1
         aQTLjL1J2BnvTH4hiy626/Fz/i/gND9HsWdyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154677; x=1790759477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p1k89c+HjF1r8L1YEfsDallpilPWI6ndc4Xy6xccvEc=;
        b=LRfEeoJ49TikL3l1RSgrBHPLBB4QEJ+wsC5dg2xPOjkJPmeXxoNYlJuRcannQcE5ta
         8ExCpkw2UHCZBCjjRoowij/VeycYXFuDtDtrhQfFxS4agjxEqKcBNBsUV5FEamIJbhuL
         CzT+gfH5wb4Jzn7JS10pS8Hc+HzpLA2yenAY0upe0VfZc3H3Dx2TN5K3yJhU2/ngjzYj
         yfyV4+zI+X/yxSL2faaqNf2MqCATEEdRebpHtZK8dcFbs4j/I9mxfdjKF2l1XJErTPHc
         ubN+slBZiAr1EiJe4UyUIM9RlHvA65Hx3DJe1f32IHSM3U2D8mqsp1HXWGrRO5IPSLoU
         jYAg==
X-Gm-Message-State: AFuF++nIyE/kxrc5k7Fs6dwZS6m1cowSwOY9QAhc5h76+azo60WbdD4a
	O9Jrc6FQaZHLOuipadQ21Q4MjoYdxE+82l+PLv7mxvrR11RvSAnNncGIhGB5JORCDCMuvTJSyMN
	GePCpUPQ=
X-Gm-Gg: AYBFou2hrmoOWhrE3w1aJ7vWzP2tS/H3d22pOSogKVUWN/P7rVr9VXGHvEr4HMWAoZ6
	kBif+NW/8sY0enDHvseYNnFhD8ZciwTbjw3nJr3vYP3U10qEyCwlkBl1FNVNO3HVeBCew6iRdla
	MefDgFlqp9plC0z29zSM8kWm8SU3xkT+Z3cWAByDXi5wI9LMz60Y8QkM+04H31hDkct1fK6AMG3
	BQNnjrAz9xjg0+Q6/xNfICnYBjCY2cXA2mjR6rn/lPEn84VtJgN3DyWeuTajShq4UwqsSXjRHOy
	HYZ8JXu9Z4YhXanfmaWBd8vBxemxi/sWLwCkCIaRusZAWURV9NkXeRq4faftpLvDA+Hvrf1J9lM
	rxQjKsoiEDkcbnuVmE3wcZMlTVM+FI6Y9PcObwkBD+7F+hcZ528BVVibCOfz+BfYpHd66JtXI5W
	Tf2zuXGvRBYC4WypamxLwK4Eocyg71+1xrdZtnrYpL3H89WEKz1mrzurFoxz+lMnGuFvQeTPDLe
	OmVO1CophTjoo3h6ZQaX/b6zulV3HrGKlpYGk8h8Heny86MA5r3eVlEQQPHxb/7qqSTHWtU
X-Received: by 2002:a05:600c:3ba4:b0:49f:ce72:dfe7 with SMTP id 5b1f17b1804b1-49fdf253077mr30607695e9.35.1790154677171;
        Wed, 23 Sep 2026 02:11:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/48] wireless-regdb: upgrade 2026.05.30 -> 2026.09.03
Date: Wed, 23 Sep 2026 11:10:03 +0200
Message-ID: <4e12e3df374a64df09145656986f151656a47ab5.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246463

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e92e1fe36a5767a7b31d96b9897357e0aa28cec)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.05.30.bb => wireless-regdb_2026.09.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
index e544b729656..ad84208f6e9 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.09.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
+SRC_URI[sha256sum] = "b22e0901227b820cd1c280abe681a15b773a5103a5e10dc442e94ebb34cbf58d"
 
 inherit bin_package allarch
 

