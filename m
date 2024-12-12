Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B14C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.20324.1734012499162582125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F/TVaqRt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166022c5caso5504975ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012498; x=1734617298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f9ptlUFoRe1QiRPepnyuOy7m19kqWz5mm8Go+5u3KI=;
        b=F/TVaqRt7pkQfAPi9Nf3fawUmSWuxoUmW2FB9cCua2aBm8RnTI7qYQfLfydyD0pFtC
         SuQgYndV13ByELVMhrr80IBWpD3n4ucKE7bTDnUefETeKz92IGGWfVkwqtGloOJ2Cb+q
         /Ugj6aZ8VeLW2uF7/uizCRu4xFjsEQ6pMCr9S+4UofZAVdfasnFMhMW0igJLHTEfz3GR
         CPXy+FlR6Xmpgw/hbO58DA4RchD4J8CWjqilzc64/8Km+/5e0i+HupCe58UMaYS5+6hY
         eHp/t36/TbqyBAuKRpfbwT4BydGetNiLj90NKdHbkXyCozmsUw0UDN3jrxnnCTzc4drc
         7tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012498; x=1734617298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4f9ptlUFoRe1QiRPepnyuOy7m19kqWz5mm8Go+5u3KI=;
        b=h9gC1bWLqyGliD5k9S57Znt4XYmrCsDSOnb3rjiNGK71jxzWl7ECqPDzv28OX0VIGy
         P5Z8PBGE5fkMOVl5/+8PXeHOYbX2QNNEEmxOqioLd8lVsEXjc2/xdGllUrkn8M2rntuh
         bZvZ6V95wn0hsnrJTKng2xJwviCy6lKRDUTU/eR70bUmz7YO/08vopz41BVX8jJZm2K4
         RKVDsLMdE73ZBSEGUhJoh2k2wcDozZjtoYDConCwOqCirasQBSM7Qs4T7VodOS+X2gpm
         vII0rMRWqCEu+x7lvEY/lOME/ggtW+zRP50I112MFm5jjs3dfDqlrhQKCzupL4wKUJH5
         20MA==
X-Gm-Message-State: AOJu0YyHtnDjY6ci+yuYgw09zyT/NSHg0c/bQg3ocSLGDcOZHMiu5JSy
	o8L8RnzwXucoNAbT/5t+VtBcKjGuk0fEobPfs0leXYBxFnjJMXrR4iK2shaqUZYATSQ2CVPxOVH
	7
X-Gm-Gg: ASbGncsrqwCXl4CRsseCPSCccVcG2b39FEk7FPv+mFBr1fyzPKH0RdXm4QqTJtR5uJo
	hFUukiOAZ3Cn89WNG7iZF5BJH/ykQeFhXbZga75ZT/W/fvtJgkpe9KJyGRNq4gSqOwPHEQKoPPV
	8Ld9y/k8PFcBsFoOQ2qMPDBoP21Jcq74TbnFxUVxRqls2x0NwgsdYFsc0j76FieMNbHfRUmqg0D
	1u8pIKtADI8ffbRx1iNEnxABlqUOKHHR4bum9cmJkayfA==
X-Google-Smtp-Source: AGHT+IGhbZkhdm/jpX4BLRheaKj/cVwwdbmCcE1N8itl/fPJnj/2fm4m20HfXDKvYQjVFv+VGDZSEg==
X-Received: by 2002:a17:902:c40c:b0:216:682f:175 with SMTP id d9443c01a7336-2178aee86d4mr63690745ad.49.1734012498199;
        Thu, 12 Dec 2024 06:08:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/12] systemd-boot: drop intltool-native from DEPENDS
Date: Thu, 12 Dec 2024 06:07:55 -0800
Message-Id: <0df327ea64ec6a9e99c8f96e1dab52d3db3711b3.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208643

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-boot_256.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_256.5.bb b/meta/recipes-core/systemd/systemd-boot_256.5.bb
index 9a6d8e9d6e..1fbe4ef884 100644
--- a/meta/recipes-core/systemd/systemd-boot_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot_256.5.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS = "libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
-- 
2.34.1


