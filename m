Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72106C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.31701.1742141535711973378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f+511ko1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15230495e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141533; x=1742746333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmqPAnpQM1Tzr2Br/XcPpAudczAyG+mrjqVJCnY/pRA=;
        b=f+511ko17eg5llfTFrMZsvgBjswp8aKNQTCwDIAX8oj2W4SP2mRyrfzltUa7OVoJPe
         eXLo1Pxt2hWD/DDhqR0lbuAUMsMgZHN2Gk9SIC41SbdAyM7QF6WZgA9y80xMb1qA5AZs
         rBX1ic2fGweqwHY7555n5ysaMxHJByNOrw1RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141533; x=1742746333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmqPAnpQM1Tzr2Br/XcPpAudczAyG+mrjqVJCnY/pRA=;
        b=vckIc6EHmL09fLayFmMvlJ2d0xMHedsqCxpt6eCz7JX6ATfkfxFTd5CJvMnZTJnDsA
         /qeUkbS2163A9HdvhBuiJNEE3BsisPVvbmX6Wb0OJs/v8tm5u/CIn01pnDq+JuWqB52H
         Sy6CMeuqB/+pA8jMdplKLIx5oovxoXxUH51pwu7uIrWxEYLp6FnlhGWPprZ07rYUKuXa
         buKWSqClnEIbvQNJOdLjKb8PgXJx0HoxaBPvDMu1qit6XSob+Qi4biTtKjQGK5gpTQ/D
         NdjhFquuU1v7KglppgefyyI6YblCVrjWKRHuBSmfkU2GetyZqfvnvGh2OQeQG8sNxi4u
         uBRA==
X-Gm-Message-State: AOJu0YyZeOv9IqfdFvO4DVpa/DrZdMyKTOu6l18GEgexjiYrDt9cpWP3
	qv+AkVhet+PauJR4aJW/myhKA8eLwFBy3olqk930WYaOFOlsB9LGMpMVpYMDt0FNMlbWLUDTHoX
	/
X-Gm-Gg: ASbGncsyyd4x9nCDP2XQ2WT+MTEP7G4FI1Qku+OqlQl7AP4COY4A1VzXye6Y+rCU3Qq
	7xtBAnEoh4GxtzUH6ABijHJQbBpKT1v96j1DUIKsBXS4Aa1R+H2tsYTyVo60eirl1HNZVOkXZ1g
	GWWoyibN5PBhmRxpVsapLdpUat1xXsTqvWmekZpidHfPmk0Mh9VdjN5ZWyZQdWDOfDd4HHwEgRq
	8/EhLP9NXygO/1ntVOLrVD+bDF1fsfq9cLAGkfoafq9DAH2sHOsxkdxpEY2jVy3juTcZf4vny1d
	Gi+dsNxs9IeKH7szEGAa2mfZ5lePqKOv9X7Qjmcrf3jMei9NIRacCJtp9XyEkO306rD4qhIH/w=
	=
X-Google-Smtp-Source: AGHT+IHtGB8BL18IM9/hqcSE5rEFn0i9BWTVmXt+frIuKMF5Q/J2EsrLd17Oy7QAxHYdGKx7ov0pGQ==
X-Received: by 2002:a05:600c:cc4:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43d23cb506bmr76660685e9.7.1742141533411;
        Sun, 16 Mar 2025 09:12:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/43] diffoscope: upgrade 287 -> 289
Date: Sun, 16 Mar 2025 16:11:29 +0000
Message-ID: <20250316161209.3629986-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213006

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_287.bb => diffoscope_289.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_287.bb => diffoscope_289.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_287.bb b/meta/recipes-support/diffoscope/diffoscope_289.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_287.bb
rename to meta/recipes-support/diffoscope/diffoscope_289.bb
index 8f8f114054f..af7d6b5d73e 100644
--- a/meta/recipes-support/diffoscope/diffoscope_287.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_289.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
+SRC_URI[sha256sum] = "b9b2e598e62eb2220376e252692ac534d8d921d4314ec288d8c7415d3041dd9d"
 
 RDEPENDS:${PN} += "\
         binutils \

