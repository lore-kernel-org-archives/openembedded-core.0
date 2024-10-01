Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A295CE7CEB
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 08:28:48 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.76273.1727771327117359965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 01:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=R/6lrw9S;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2facf48166bso19511781fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727771325; x=1728376125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wqoqd7msuLgMdcy5pk4TzN5OOomlS/s2Wl4roxejQjM=;
        b=R/6lrw9SSLZFp9tx5Vxt2meI17DsInIfzpgTdiWS3yt7/j4q9Gol9AG0zi0ZwyZblt
         b9r9126j+bMvD6hR0kEDKHVrrGbjQv0HJNd6ZHu9fKoZI6iMO7zze4pAZnicHXvNuFvU
         nQVZacbZRWPNyrPusatl4uhcoEQIlS5RxKjvEmDg2ZP1LIJaPb2g4eDIT5CZTC7ll4i2
         bd80n+Vw3iZqChpRkRgz0Q+07LsiBBtsgLgIbdVo/dzu72oWun8DyxJtnkkV9O8FF5SI
         5nV6p5qPqZ/Lg1/8kEgiwzGIM+gjPwzr4+BzbSPCzBVNUxAq+EG3IBVwT9ZYAnIf06Uj
         kz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771325; x=1728376125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wqoqd7msuLgMdcy5pk4TzN5OOomlS/s2Wl4roxejQjM=;
        b=MmOfVBjiUkXvi/xWPe4SAMOHTt/Gk9r1ca1SyyXNfsrTN/51WQRSOtKis69xNXS/09
         MlCZD/F1moSSrmMr10WKZDifaNshlGBNyANfgMsP+EfK/E3wbugBlQzMgYrqkU6LMo8E
         2vfEgQ6C2aimh3m1nnS4n9LSaRuF8/U/v3wDMfebrBqjE8OWmechUkNWg0CslT0SdXtP
         MlPo9CTQKIS0Dc5Jynbc848u9MQvGeE0g+i20sjgBaEpr5kr1rrZ6t1pUTJ3SXEL7yo4
         nVcCyfEGMd5nb+1EJGwYK2rjIw2AVIxQ6MLAXyUhxlP0Q597/Qlgrlw4qh3gTDOo8p9u
         k1Pg==
X-Gm-Message-State: AOJu0Yx6vCL3qyFkfB+Saz13XLo0W2qJBr2S4p83iiO6bcvSBIk/ZtAH
	TdA2VSmEPjx0pYtk82/ChMbC+SrOA8h4pQnjq44N8Fe6MaMQ//y2lhZCMI0fTKFgF9BIluH+nxq
	jzVs=
X-Google-Smtp-Source: AGHT+IF3LgbIM/aYSQ2vuc0JEIu8qNbcbWPRy8IczEihiLiClovY+Wb9MA2G8uIGpyMRjpGEjNS3yA==
X-Received: by 2002:a05:651c:4ca:b0:2fa:d67a:ada7 with SMTP id 38308e7fff4ca-2fad67ab1d6mr21350001fa.23.1727771325058;
        Tue, 01 Oct 2024 01:28:45 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2facb2ce928sm7734221fa.76.2024.10.01.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:28:43 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 03/11] systemd-boot-native: add runtime dependency to python3-pefile-native
Date: Tue,  1 Oct 2024 11:28:13 +0300
Message-ID: <20241001082821.26115-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001082821.26115-1-mikko.rapeli@linaro.org>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 08:28:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205137

It's needed to run the ukify script.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_256.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.6.bb b/meta/recipes-core/systemd/systemd-boot-native_256.6.bb
index 73db59b14e..58db408dcf 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_256.6.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_256.6.bb
@@ -13,3 +13,5 @@ addtask install after do_unpack
 PACKAGES = "${PN}"
 
 FILES:${PN} = "${bindir}/ukify"
+
+RDEPENDS:${PN} += "python3-pefile-native"
-- 
2.34.1


