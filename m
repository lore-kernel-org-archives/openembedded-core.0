Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8835CA5FF7
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 21:43:20 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13635.1791063795112725309
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 14:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b1MXqglT;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso397326f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 14:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791063793; x=1791668593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bm5kTm/hHfED9+6LfUaz8gBiKKW9RArPGy4MyVeytEs=;
        b=b1MXqglTKXi7IPvEvFCOv7B0ib9LAm1zTrBaUfPgN8dfVeicWsedhn8S6bR9CcUFIf
         4VJRgn7byExPIkVNh8lEo4113z7cl1dKXmINCFc7Mxaq4nMc165+Tf3SW3wCMLM7h4j8
         Ce0v9ORXT0S3F9nbrCUWGZHMmNn+awNR1Q7e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063793; x=1791668593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bm5kTm/hHfED9+6LfUaz8gBiKKW9RArPGy4MyVeytEs=;
        b=ZKP3XAn0ksExy2V6No1my9vU//mRNCgRb3/D+VH1qF56S74AdOGEeX9h0R/LyDo9A3
         6BhPR23YzuQD1dbN5dIb3E2rgrAcnaEVndnDjHAjGwfleGldC5gsr94zNU4lZSx8TnRl
         YE2Rx9CPgYR9bF3+yxNXEUB7LvyY/HaEsVoTxtcV86yDhSICQWT3OiumwyyqSKEldK+a
         u2skTY/zr6YdgrTB7tSCP6KXd1gdIs03h5QZzO/RVaZDv2vMGJXltwdJZf71QWhO1ORb
         U0PkNPrkfm9KCbCauG1Zb9Ys922JMc3XUGCHGDFzPhxRCnYbAJfDYmX8dFWqJ76lCqrO
         /KfA==
X-Gm-Message-State: AFq9FYILIP3eTH9ZpDI1AYX0E+kXpQMBXwdmVwP1EmSq6PxEKo0FN94B
	Y8ZUsLSwe5hdvCs5fJ0LYW8H/qVd4C6D8L9oaCs/jlgjjjZB1sBbU6vK1QtpEBM/MgA7bYJdB8l
	9v1K7Pw8=
X-Gm-Gg: AYBFou3JYenubVM/T5NCR4rJ25521XPm0v/H7Fi2LOqXjIZlZ3BKOcV5+5fUTsg/9e3
	8ISAgnhKajSj1TwwaEBQSGoQEpLQSfQZ+llbntk85zZaTm8eWHOAYdb6SgTm0hfKXLfe1oVGLHt
	j1lG8iYOryLiGlPFd56avqm5Mem7JPnYPAA/Z8CBgJPYA+cbq+r1i09CWjEc9+ubR6yvwTfrLWj
	pAp1LCQEiHFBzhphtO8yQ08S7Eg0EUXBvfM3+qofdU1bnRNjg9WUwlra3uVamjTEWfJOvd7vevX
	HppRu6TUFM4tyylNypNgIuy0wVZL2fi2nGTuvuMLumNoH4KtCSgosOvVXh0QMgiNyatEBHpjKSl
	DALSk+IZ2YwS7tpl6VW/U9LfFE4uVDxOYmWcW964KVSzf7PL8ZdXL9yQpFLXc8AXaxXeMNBOhKf
	yJ8+odCWIFz85v/BgGcVTywm08iC8qgxQ7nmjFPo13NWVSeT64IfYS8zctXjhIK3eowacDBkq3f
	Ld3aoaUWurCVCgtCDsi8y/KWMBmK+bzcPBXJKyAl3rLaXQrnTr6p0bn4dEnspVjVAA=
X-Received: by 2002:a05:6000:401f:b0:48c:4485:3357 with SMTP id ffacd0b85a97d-48c448533f4mr8219401f8f.57.1791063793374;
        Sat, 03 Oct 2026 14:43:13 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f04e2sm12832952f8f.15.2026.10.03.14.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 14:43:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 4/8] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sat,  3 Oct 2026 23:42:12 +0200
Message-ID: <aa1eed0b7320124b2151949d7411a92ca64b8a00.1791061402.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791061402.git.yoann.congal@smile.fr>
References: <cover.1791061402.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 21:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247179

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb1b8a5338201a2163fcdb5d46550f46da716d8b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/atk/at-spi2-core_2.50.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
index 6996ebebcd6..e63eb13e724 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
@@ -25,6 +25,8 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit meson gi-docgen gettext systemd pkgconfig upstream-version-is-even gobject-introspection
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \

