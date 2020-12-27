Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.39239.1609112929199032311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 15:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J/32EhvB;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id b26so20452921lff.9
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 15:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRI2opDIIwV6oEDF+S9Km8QS3cP3MJg4fqRVQ8NJJwc=;
        b=J/32EhvBPeKtEo4+X9G0DACs3kgKCk83T1aA0Fq4rdj+EjQW6eUoLkj4ylxhAZEcSp
         LlhCuSb5JkvWEuAE9WOgXLd2cwLcByxWFeSfpLFC4y4iGlXTYrtl/q0jM70BIU/338y6
         CAwJcG2x6qJy6GpA+86uvVuBHGkOWSGPz7hS/OGoSPoHJcavKrnbNuXDLBq3CbsaM37/
         FlxfSq9U/LMSeQR/XDsuRGcbUXXaWWSAb78VzMYX4+paNHWAX1b1wOvmcmExwZ8lLvTf
         IL+4i8p4sGXwsnlyDaCLKjeWPSE7efboqbJqa2UpyGVz9aNpI9p0Nmhny/5WeZf7HBEo
         H5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FRI2opDIIwV6oEDF+S9Km8QS3cP3MJg4fqRVQ8NJJwc=;
        b=bldzNgcK6otk23I5XdvhOnbLXK9hwLttGY2wG32snUQIUsg52dYb3XyGYM66vxb+QS
         09VePzxxfbplO17XIt3fKOY8V5RX2eapX3j8HrLSyaYdmdHJyMAGhwwdCd449+eB7PC9
         qxgMlKA1dNF6l5A99Zon+s+prwEr7J5NuD71HPVN9FCpnCtyB/fFOP9lo1cJIILy0Av4
         sDDa1WacN5VHm9B9NySHai7+7aX6g/hkPiiBIw2gTAv92HfF1Zbmv//UOi8scGLsXk8h
         KgQdEB7lblBzIqckTSFd/5Aikqt8pzNIsSk/AsXZJQOnAi4ilZv1mL+djq2p33Sap+Hp
         62JA==
X-Gm-Message-State: AOAM531gE479DxbfTZGVidrIvtaRsVA+EX4O6eak69G9DgXI/VH6CoLk
	dsf/vDFEfdVfAe0GY74KmrYe9ls/MvVFyw==
X-Google-Smtp-Source: ABdhPJweANAzCYZz44iXx8zzvDq5KlmAkTE/el1DRr0Riae1sjbBydsAlkC+v0jo99TmmGw4XE2N8Q==
X-Received: by 2002:a2e:87cb:: with SMTP id v11mr20231050ljj.218.1609112926966;
        Sun, 27 Dec 2020 15:48:46 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id r81sm5153204lff.215.2020.12.27.15.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 15:48:46 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rxvt-unicode: use RPROVIDES instead of just PROVIDES
Date: Mon, 28 Dec 2020 02:48:44 +0300
Message-Id: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change rxvt-unicode from using PROVIDES to RPROVIDES for
x-terminal-emulator, since the package provides x-terminal-emulator
functionality at runtime rather than at build time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index b064a63caa66..6ebd3afcb939 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -14,7 +14,7 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 
 inherit autotools pkgconfig update-alternatives
 
-PROVIDES = "virtual/x-terminal-emulator"
+RPROVIDES_${PN} = "virtual/x-terminal-emulator"
 ALTERNATIVE_${PN} = "x-terminal-emulator"
 ALTERNATIVE_TARGET[x-terminal-emulator] = "${bindir}/rxvt"
 
-- 
2.29.2

