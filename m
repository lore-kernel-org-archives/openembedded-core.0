Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DB6C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:10:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.20814.1676236251420016690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lqqt7PVq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id w14-20020a17090a5e0e00b00233d3b9650eso2600004pjf.4
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sUt1wOVbwFBzqvGKOUrLNYtB4N1FrMR186IKWokqUU=;
        b=lqqt7PVqemUyh3CFImVwdQwC6nTBcz1JiJLU/axDbR1i9R1mK3bHEgrcPR2hwoQTuD
         MZoOy4rEV9VzT79GQCkZjEH38RIgfmisPboeMeyWazj1tRtkOGag2y0Q+zO3YHlUk9ko
         rxFsg+yb5otSAK4RDHh21o4rX7+5uBFYau6JrkQvm02DagzGR2IqTRjNFsiZg1MNseiC
         VtVuOKWGtuYKRNMN0BDZ9H6yxubnliJqyjPb2vySn/6QEyQMdtzyAqEjkxSoK3YKUq7V
         jRofw8K5MOoxBVbMVezhsuxEpbA3wzUscPeYHeD2qJO4zCadc81Wa0+sAZTLkpWNNWBF
         E0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sUt1wOVbwFBzqvGKOUrLNYtB4N1FrMR186IKWokqUU=;
        b=yePC53ujNatY+QIcEEVwiO/hvlksBmuAO5TL4MWBjv60ev0wcERqJHfdTon4CGyUhn
         VViEweLXsaTdpuL1ifLBuh+lOaPrrpcUtCI4Kxq0X4EFJkyrnXfE4s6h5QT0YM5lmAhn
         +pE1+GF2aNY1hOuKn5ZXYMNRbVmbWGMbg0EWU66Ys2xmp9Nrb5y7CmwHoPjCBJn/lpti
         vE/GJ0vITVfEnSnroGWaeNqHXuq52UOGX5VC+UUMohMHr+2ovg6lqSGw/gl/laHiuB6l
         ZXEbldD8PpD+Es80l+MJFpsNDkTauqyf4X4cI10u1f7xAcxrsXAMqdSrUjJZsf5+oRKT
         8gyA==
X-Gm-Message-State: AO0yUKXJUWXe3QkRiuy5aP293jYhsG6ZeF500BeoBhSRBENaE8wGeJAt
	PXJKUVapQWxQcUZJCDD96DXEO/Ac95zp8BiY3Zk=
X-Google-Smtp-Source: AK7set+s5hhCXdaN1AfTmKODBjw5F9lx6lvtS+4HRBj0G/s+WEbjhqHccBfPWuX54pVvn7PPlcXFhQ==
X-Received: by 2002:a17:902:e5c9:b0:19a:9864:2887 with SMTP id u9-20020a170902e5c900b0019a98642887mr3452849plf.7.1676236252251;
        Sun, 12 Feb 2023 13:10:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.10.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:10:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/27] python3-pytest: depend on python3-tomli instead of python3-toml
Date: Sun, 12 Feb 2023 11:10:18 -1000
Message-Id: <e5e590ed9e118283ad67bcfb059b3375cf847b33.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177046

From: Arnout Vandecappelle <arnout@mind.be>

Since version 7.0.0 [1], pytest switched from the toml package to the
tomli package for parsing pyproject.toml configuration files [2].

This change is not immediately noticable during tests, because the
toml/tomli module is only important if a pyproject.toml is actually
present in a project.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-0-0rc1-2021-12-06
[2] https://github.com/pytest-dev/pytest/issues/8789

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pytest_7.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
index 1cb2fb01c0..90a4787c17 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
@@ -26,7 +26,7 @@ RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-tomli \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.34.1


