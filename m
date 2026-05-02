Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C15CD3431
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:10 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9371.1777739408456864418
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q2xulp6F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso282362f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739406; x=1778344206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EsuNuAPmEOA8AMqTjvz926Lsms4tdt1MMxQZiQNEYA=;
        b=Q2xulp6F0goAcY2bcAPXG3VWy15u55bzhprrRjFfJb8lYZTvCqcvn3TInh4jvvhEiV
         qmoX4jnk4U+VV4KgDZSMLqE/7sNuVcEoimveUPY01v4ijPrfa7KGAmmOBHY37w9LuHEa
         uvaMzUtOUmv1qwhy8124ieN5Wqs5VglcJcGJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739406; x=1778344206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2EsuNuAPmEOA8AMqTjvz926Lsms4tdt1MMxQZiQNEYA=;
        b=r2aN8V4ta/4ozmsZ4QOUUzDIV38jFvT0XCPpmKushRaEUn8uKpMvX6tIQhCu7tryaK
         g4Bl9woxsFuavf+9yVvYV7xipPjbzv/KFpFAjhhQsobmIGr+KOpZ3xtt/mYPH/xd0DHV
         LFPMJ8Z/j1iYlz2bmISxn3OmJcdilUiYkKPk++gP51LS0u2eW+IS9Ji3+tr17EaJs8+y
         srt1ZHet+ntdifkjdYH7n4wrO9tklI3qgOcqQLM3Lzx3IPN+8FgFrPNtopw6Cwo5AV0y
         816DEJuluFauekEKS5Krq28M8H6Yqhnkpwjh2TYwep8Bwzh695UKD0zqIVoRxINXSU4/
         zHAA==
X-Gm-Message-State: AOJu0YxoeeS8JDcQWdDl73ipO1KrgBRjTKCxTeE0GZQ51/wVx5JiiNJt
	aOS8reKc8q4qbBk1mdh7YCvUYdaDuAWnH+8N2x+XHNB0gR9LOPGEmm/BiYxGEPRDAi/nGRKFwHr
	woXdjt2T/3OqtChbJYvu4GO7ghwsJpBVzahOh3EiVmDObbUIFy9AP4sxdm7wQI6D7Vg5Uzi5udU
	34P9xvg5xqlGZbK8w=
X-Gm-Gg: AeBDieuQvTXwqPdKXbujQkdh3RdrL8WfqU+oZcGL1EdmcXeeQDSMyBGPikaP7XaNmaY
	5bOF/rFmKfgFgW5urVonvhdNvpzSGqtE2+t1LMuf0O99gHrhIqsSAgcn0QKRWkFUNmkWzJ7LGCj
	BmEgm7Rbn0YYdrPT/mmqyp56PZlj3bFza3+IqDK2DrvSEoRuQGv4UDBixMn1bIS4mnOQRKR7PmT
	muZl3jP9Cd7NCUnuENudwGVeOwsIdUWeVqqxwzK+HfZI3o4M8GE2v9+x34Lyjm395czC2AvmdC/
	I0Al6+aDV1F2fnsXXdVqlqBbfWCramsjZQyfho5Qr/qZpeQQgGFEo7t0z9bSg8Wc5lnN2N+pM2G
	MZEFiA+794OoswGwbDBQ198IXeUZOBb7uaf/trrzcAAuxiPYj3XYm4c7Yrqs2h5qHOL3MYXyBrf
	4JDLET+GP5Ifwmuf43mpHfMSpOc0z5PxZsV+4RgMoAY+yym3FUm1B1nnMtZ7rsv1KYP4MkfEd4a
	w==
X-Received: by 2002:a5d:54c9:0:b0:44b:db60:5592 with SMTP id ffacd0b85a97d-44bdb6055b4mr3826616f8f.1.1777739406449;
        Sat, 02 May 2026 09:30:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/62] libpng: upgrade 1.6.56 -> 1.6.58
Date: Sat,  2 May 2026 17:28:40 +0100
Message-ID: <20260502162929.1377831-20-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236329

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.56.bb => libpng_1.6.58.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.56.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 7ede0a6c8b7..7a8a524043f 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
+SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

