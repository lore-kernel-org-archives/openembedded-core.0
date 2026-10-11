Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36576CA9ED3
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23581.1791708093797545806
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R/X77V4n;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4be28b82so869626f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708092; x=1792312892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8JT4plW57wsD//XFDoB+0kiDGKejYZxeW6h9BQXPE5M=;
        b=R/X77V4n30nHSO1j9BrG5eJYMbs9KaK4BAgNVBUayafWgBybu77lAEeKeyG07wGzKg
         uUnl8a66SCwMLISllVA3SqD2qwNWBrnGwBS5c2fw3Ou6Rq8Y3hFMICDWExDIpT1jxf0W
         KoLr1OPkT/1KW4TlwD0OnqJkB3P2qzPt1wuG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708092; x=1792312892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8JT4plW57wsD//XFDoB+0kiDGKejYZxeW6h9BQXPE5M=;
        b=YXGyT93HwSDKHkXJruHdow2pBha9e0ODVnz/Nn/JvxkevXVfqpAYwN0mMDk7zV1uPa
         YONPmKHsoHCXIm4nitwDpJMpkP7ae2Msm/02PXwt9+o3GgGdSjzwdaxKlrs0sL4VLpP+
         MAbZ0XKLL5Xe988bucrghCkVes0Cj5TSkGuGO3oMOBF/MYQc3UpQD4ojT41RTUlF3c5O
         6R6gvENuLpxPjnRuT/Hnqv4VIKj5OKUd7itPJPuXgqOvRQ7WdADBUNy0G2vsQDdgzile
         Ifyrufo/wox3iU1fUad9+qYXnRtmpRfQ4q9yyEgpI1xHC0r3jsdUa8AOwm+zkaxSFWzp
         PmvA==
X-Gm-Message-State: AFq9FYJGDg3964T20ITRd81yQVqlWnp3dKjiME74NNMTXvfuxL+nRhsX
	/XinZ5MePQZuIP7eAkHxL5spgxwF8ioIb1VshJskwxfy40aWwWlmR4Xf9Q2wb1XoNvAglG+3yur
	pYrTEq8M=
X-Gm-Gg: AYBFou2+vgH8VB2spVFlHTALPLO0lUW1miFI+vgSMA/He1jK5In62BteiRSYSTSanQU
	7xrqHJVVd/ifJgXEx1QJvhv2TRmQ2zzqHxS2Fu9YzarLqdjO0B7vKUE3Z4m9JeCpfgXktQXEQWx
	kja5TDNeuNq8ObmS32o/vZWfy1gKThZUH90KMEHCYjhdjcPShRyT8z1VbSvbQbTy7ZdLxhVCY1X
	/Cl9HkAnk4l5HtK9OnNIfbp4ae5DI4jQsrKU4P82xbj1uGzJU7q6mIendxdLnvxk1CBQCAMOzTg
	ykmZFYkLX4muUvmz9dyHZE51ifs/52rFsl02XsR7q+Wyt2G+mLMP+Huewnm3n7H4x0ft9uBRvXf
	SkRqVIPEp7jWXukSqkvvp5ruyWf9/ahhrz7mGOumZ5oVE8pYEi2Q6nhZiWJV6DKKYruHecNsT3e
	xb4G35JiHx3lbgL8xANPMGPaK6WU61YaN1JcBP/5c3t+6uRaKvm2HVSahfzAVStzUM+gHLPi6ei
	cA4oJGp20/d4DjFaGJW34kKKE0F0NDAwEDw8unfUby1aih6ec/gGB0VSzkhOW/8ywgDIa60Bg==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr7723655f8f.28.1791708091991;
        Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 48/60] libaio: update SRC_URI
Date: Sun, 11 Oct 2026 10:40:21 +0200
Message-ID: <e26f5a0b486034c5907d30ad42b79feb0defd940.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247557

From: Ross Burton <ross.burton@arm.com>

libaio has moved to Codeberg as pagure.io will be closed down shortly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 237c32e181cd47194c3877d220360d6e6fbb2af8)
Suggested-by: Preeti Sachan <preeti.sachan@intel.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 2392fd5db23..5f4c5547a11 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/jmoyer/libaio.git;protocol=https;branch=master;tag=${BP} \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \

