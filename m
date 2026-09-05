Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2308C79FA0
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2480.1788641118856386337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H4+8zg+M;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48589798dbbso1758495f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641117; x=1789245917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w8Gq1byPeolX1gs0hZzV1XaLJ3QL9UqQZiP1qyGzU7o=;
        b=H4+8zg+MDeJEfGcEVtAqJMKWceeiM3RqaEn5Xv6jhxpBWXgs9Pnzqr2qaTrhVUUefL
         LWiadLXFStHAMfjh+SLsKmwnf91dI/3KEvF4Vm5U00G/jeXoIW5UT6G8f3ZAFf68/gXW
         SKR4Ihpvqf+Bv9QDX67JQSAG/d8ae5xdP50gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641117; x=1789245917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w8Gq1byPeolX1gs0hZzV1XaLJ3QL9UqQZiP1qyGzU7o=;
        b=P+3xqMQ99jrOQG3M2G813kCWqOrTfmjwtlgi+va240Lm1eFERLwrUVJXRRCpBTiZS7
         7hNzXryeb/7H490SfRt/bBbda100o01VPtddj2L0fTo1emBpOhBTHmDBlurWqagWGtxe
         SNaN314U3CI17X9MaA08bk+wLB0pBS6yXaz2Syt5VFbmNbkh6xWP5IrpXwL2s/X8ZV2C
         pAkOyyP+iqVD5X12GWCMfBfzKNGQvNux3mlg2XmPAgDeGeqk6566dQUM8WK6APBWoQ46
         +wt2VC8pFfuxWGfB9jRvSr5drGG9OTsnsYVB2wloC+lotUqwcUG8+oC9Hn67c+Zy/oL5
         9Nfw==
X-Gm-Message-State: AFuF++k2aZpwjbTESETIVbskt4xKB2vg/cUYr6OFUe2g3ZTpwrxwEUIK
	2AFZNCDai+Qzzu+e2tg+B+2El7WvQQgOPeknN35KPA9etZDn2FBNx2XQ1uAbExaR3eZoWvFzcLx
	AI4VuxqM=
X-Gm-Gg: AYBFou3BV5Nsvcl36zHPQbAskCWCkJwCYWuRVWHzir0RsOk9sCodpTs4miPsC99HP/s
	+4oJ66lIOL1+aQm+fH5cxHfD8Y3xgK0o1p5SgKi1lanRxr8K1OaQNpLePEK2WhlBCEISO9/OzVS
	uD4ML+39aP5lmwOUvFymUOL4OoRxsVsS12tWvj0Lm9zMrCNo5/DeHJe29fGBfwXxgAsWySjt9Vi
	6dTmUdpsCsq9tSkvnqfbPDf/T/qWsFXmaTvok1tQJjvlvoSrv855g2hS6OSb8b8cglECFiOyXe8
	/ilJONNbhUXOX7oYPMc2mtQHkHBKA0YhBTwg2bylpfjzaDKmH0ghHlafhLlX5rQjTQuvr2uqxpy
	uOsPZBa2cqiZumEyTmstHMBT91u2VcN5izLqi91mit1vgziZsQsV9grnLsqXcr3G2UiaYfre1pS
	NXpcQJcnmaXD6EbaUgd6aqrQDoxM3E8WVmCXEQ+4ys3KpBWsgmvWNXRQpqnZK8cAsJeeHpSJhPg
	J9i7hNxjnalK5nASQfGozwdmB9G5IN8hkefR98nGeKa7RpDSvF2u2vepBciRo1a+g==
X-Received: by 2002:a05:6000:2f87:b0:485:8a46:705b with SMTP id ffacd0b85a97d-4858a4671c3mr12942642f8f.45.1788641117152;
        Sat, 05 Sep 2026 13:45:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 12/40] python3-attrs: fix CVE_PRODUCT
Date: Sat,  5 Sep 2026 22:44:13 +0200
Message-ID: <ae5b2d427c0e1ec1781e4efda67a01b24c12213b.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245164

From: Tim Orling <tim.orling@konsulko.com>

No new CVEs are caught, but attrs_project:attrs matches the upstream
NVD dictionary CPE. The pypi.bbclass default "python:attrs" generates
the wrong product identity for the packaged attrs source.

This changes the generated product identity, but the Wrynose
sbom-cve-check database snapshot has no current CVE report delta.

Note: The original commit targeted python3-attrs_26.1.0.bb. This is
adjusted for Wrynose, where the recipe version is 25.4.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc07eddb82fe42ecf86e685450ec0b5c9d3a9ce1)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-attrs_25.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
index 7bc581b8759..c3f5a155ca0 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35
 
 inherit pypi ptest-python-pytest python_hatchling
 
+CVE_PRODUCT = "attrs_project:attrs"
+
 DEPENDS += " \
     python3-hatch-vcs-native \
     python3-hatch-fancy-pypi-readme-native \

