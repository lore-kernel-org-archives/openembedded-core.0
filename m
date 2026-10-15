Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AEDCC6B2E
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32813.1792040619465163971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=20VoBm7n;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso25874415e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040618; x=1792645418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=37qGsYNqk4JrjGWFblWN2ZgDuVFH8YnuUkWq8mWgbiI=;
        b=20VoBm7nPx/N3rCasf0C41oeiBfFY620tlmbRhR3Yb5iET4d1hYv3lDpbzX2sEwytM
         ExpzvDOSe7RDuRdkSWvpQ1RNalAKyRkfys3W/iuqqioFu349wzeMA79h26ayd72NZzln
         KtA7hVK0YUpXfeabvsrFDmi79gMyfF7682fG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040618; x=1792645418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=37qGsYNqk4JrjGWFblWN2ZgDuVFH8YnuUkWq8mWgbiI=;
        b=gace/HSbwEhyw+7dIvyfHIW2qBzgAsaxj1jPoAbUFobxtmifKla/X+dZJecmdjJcSx
         BpjZixAaTDjSjYx07EWjBk0Ag/MkScrnFIpsbOIGEhAbHbmxHSPH9/6izkuwr76nl0/9
         7Y66i3thUYXep5acoMtMqhyzAwG1SEDxIdtuS11MuIh1/d/KpqyDn14jlZcUvkyO2ds8
         ESf+IxpQqHDHpIeqTD0JydRsTgh7A/LenA6Ku8Y2n9AJjy8Rcc9Cs35/znwo5O5rBzyh
         h26veA30UkBSIG0QhMAqbAkcjJopN6GqNPeQbwiZXO5WYZEi2dL+F0dj188i08pEiAW/
         wZRQ==
X-Gm-Message-State: AFq9FYKp51/3dT9THrBoykY3WvDCUrFe92o+dYlNFC7E5hNXAEkUCsVJ
	4RIohIdTrBewX9BtAC+vbt0+TlMWasuliuxalOxviUpv7pf4rbMLzJaWK9YP6SOzeVQwSGzrWSN
	HpuRplB4=
X-Gm-Gg: AYBFou2YDeNRMaIZinxyUFDLm+IVrsns7kQaA36BruiLjnH5peeNUK5tzJ4/rnPSmBB
	DImwll95wDFh3W2NZy5SN332vOK+qpUIDqVF0mIcDQKAYCJnwTVblJKRGaFBqAENIVtTkLmJGuw
	WHM11sMLFDd7RLda4k4mf3yvRosTCOcV4iD+rAJv4fwLnFWvttJKr90K/+CcxWSqinUZ2wHyxxZ
	LRM4xGAATfbJpjlKJmh83vAPCERpKSKl9Rf4ohYmwezPMAepjDUibTksn0j9SqhulMRIB90mwcI
	+B9EuLwqwsrxrblrUJ88SPS7kl/NmW/LT7r68uAdkMCIEfLPNA9P0AjsH21WktL8DeG6R/BIdV8
	ht7n9trUBVLKiqzbKkZNYb01FBiMeS9/JhQ3xyHxiUi6EKSzLT+f25NdI8gj43ANey8Coddnj/B
	xltGCIn1gFqWhbRqJotcdau2lPCMs0IwIklYXr9AoFRfk5kMz6uam1aB24EBRUWpKU8chTjMrp+
	bhKrqMMHrZPeqnlNcAZi3i5v39DobAngr5qup7pQWAOpPU4Hq6N4EVEkSqwZrf/+mDM8L1b1Q==
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr372017055e9.19.1792040617493;
        Wed, 14 Oct 2026 22:03:37 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:37 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/55] libaio: update SRC_URI
Date: Thu, 15 Oct 2026 07:02:24 +0200
Message-ID: <30151c54ac1d729e5ec0778861fb3d843a260d99.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247798

From: Ross Burton <ross.burton@arm.com>

libaio has moved to Codeberg as pagure.io will be closed down shortly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 237c32e181cd47194c3877d220360d6e6fbb2af8)

[YC: dropped the tag= SRC_URI parameter which does not mean the same
thing as in master. In bitbake=2.8/scarthgap, "tag=" conflicts with
SRCREV instead of checking it against the remote tag. ]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 87ab22ed176..733002cb90d 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/jmoyer/libaio.git;protocol=https;branch=master \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \

