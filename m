Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474C4FB3CFA
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:58:59 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47441.1774864734713507792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=Z2i/pb9r;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-66bb3766125so186138a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774864733; x=1775469533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=Z2i/pb9rcEfosaiYfej43XsPoGMZpZ0LkurrZkuTmL/Z6X5Rk1MG7B5vrzT+CmGY2/
         tSGoGRTP5PTle9T4w90I70SB0JQ9JUGQrAWakyZqaK1x8YF4kK8/Bzz6EzPTIneCzuuT
         b7U32FJbBFbsck56k0M8WDhavk12s7k9vJKTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864733; x=1775469533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NZ3nXGmf+Q49K3GqIIhzZrcjandGLr+2Z2qvJUPWcpI=;
        b=hmlafWSMLKQjF47aZxa161AmFdx2dw0YnO+rs3yR4ZDXRk0wB/semnZJC0RJkijWxr
         9f6A4PHcUS+0eufXfriy2WW0nzFN4SzNj1EjpQ1cuEUquXHbD05YVKnMsZV6Z6cfrj1A
         0imKk2o/emqrN1wGwbIoQWF4vo4Nz7W3mRA2AoL1iFiuqstjp4hZRGv7ymReh0mGjckV
         mo4/yjl8Zd5t1+y3iTj8xVqu98yfCetiUv/1Bm6titXUZYYtY+pNEBUyWMrLwacnrAoQ
         Dp09EVZ+6shx9Bly5OerFsvvwbQIQ+x3mpSRNEvzRnT/fRUM0C5swwuGspBcZvzZfTvF
         qaSg==
X-Gm-Message-State: AOJu0YxJN31vGadqgfNdY0KOdg2tELai8mgjFGagQpdgqDQVXFP8B3I6
	PLyl9F5hkhXZgX85oTLBnEAhhMuvEHQFdr7PAhd9CPsLW39xe0T8dn4TF4QmuiqNyrP2rrAK4Nx
	GSvWTEnUGuQ==
X-Gm-Gg: ATEYQzwqvOCyefrN2m5j+7dvJsomWZupxRh3sanu+w01ghylzsT/B7WlhZv9sBeY9v7
	Dr2qp0R+yjGaX+9udZRHcgDxCwwsdySHXxpg3zjxPyZwD9aplzK1JzBV6Uy0oTLuRpZSpFaLN/M
	5N9pQxvvvvPRbbgDxmsSW1J417L2OdXyPmXo8GzSVMOl8AVhIXlm8hWQZjnY5XMRDa2LKP9DXQJ
	8/Yawwq6uyLkHHruY1HIOU12BHzk8IQABR90N43B8s6Q7gUsbtHjud3kYo1ngnvJSBxvO+EWlOj
	4JGPjOWLxxNcSkPi8Ed12Ypxef9tREpUXucAE5jDpZCIqcwlC8nqcN9WUxAiWCDukRZmIdaXs39
	9RNfmLjtgRCTPoqGB4vviSuI2zlcyeMBFbWcBFvpG4N0VrK1F09qUkdlbGaRyNrliipCHDPxyjW
	gPZBMA/ldnGuixP3L+cnT2xf5UpJskILp7/xaoiEBkTlBuXnPzrdkvplRdH5hUjCV0T3Hf4XPID
	3MSTlJ3yYslt9Dh40pb5QBK76HqZuc+PoT7gpwQw5EL/X/7zTg2fhtDY22pLsgAIA==
X-Received: by 2002:a05:6402:354f:b0:66b:eb42:79fa with SMTP id 4fb4d7f45d1cf-66beb427adfmr731309a12.4.1774864733099;
        Mon, 30 Mar 2026 02:58:53 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f0dsm272839366b.11.2026.03.30.02.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:58:52 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v7 3/6] libsolv: explicitly enable comps for rpm packageconfig
Date: Mon, 30 Mar 2026 11:58:46 +0200
Message-ID: <20260330095849.119621-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
References: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234216

dnf5 requires solv/repo_comps.h

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index 852e79c45e..8a941ce4b8 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -20,7 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 inherit cmake ptest
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
-PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
+PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON -DENABLE_COMPS=ON,,rpm"
 
 EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON -DENABLE_STATIC=ON"
 
-- 
2.53.0


