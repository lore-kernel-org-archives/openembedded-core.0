Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C92AC41513
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:19:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.8527.1717658370520167490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=x71XxyKf;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.54, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4215b0bffe1so3113215e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 00:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1717658369; x=1718263169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUryif227ikcbYCWw7qqEX/i7poCBhznAmdOpN5gqpY=;
        b=x71XxyKfubUXqVKCNnFHMYTInnGeR3W6H6MyFKuLgT/A24w6Z6hy+RusDVyTCF5Dhn
         aG/pyeBXV4rZ21iLEGuUjTc1gkQOcc9eVYzq9uJjLIxv2o9k0mU+guI1QmIx/xThmoOw
         rfYMPM/h710QmPPTqUwhcKgVw3MDj48d++CmyUqofGMGvmMdlQ1YKpa9xvsWkDzlf/Gm
         9zKmGljE+CT+0wabYrOD52QiKpMMI/2uW0q6Gr2r/BlJVIw0cqg6RQNUexmhBG2mHDpZ
         yTOhlsaXpW1umx0eLjdNawNkpWlWYidOFKT7/9qNq8tAC+gxbKS+PszjiSByvwyK3i9a
         hZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658369; x=1718263169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUryif227ikcbYCWw7qqEX/i7poCBhznAmdOpN5gqpY=;
        b=jMrqXOTIRAVBgtnxQwZWE7G5x3nDLB+OSG1K1wQEUnc+z29hGHqZ3OgolPVQuQO8vc
         VqM3h8Dc0gc9Ru4+oWHXFHO+DjgzF1j29PI+7hJgOaPAgtEvkviBi/yeyEsfuK/I4bnF
         2PnEF+BJ7lo1N3Cz7BxmQ0ikq6M0CpT/MqrHSxsMfDbZYuawMWBm/m8u/PTo41SgFehU
         xxVKivBaEG1o4vw6gPU2exRruMCHd0pFMnmDtSMK2B9mKL77FMmj2uUEGv4IV+NAMuLB
         Nu4ds+yelgiHDhIr0Y5JyApv35HksN8/FKrRiIkTkPP4RAidw/aUGbGK2ykxiAUhRfSV
         UHPw==
X-Gm-Message-State: AOJu0Yx51QlDFfeD+tjbpj2uO3wfOxIV4wcBgc+/Sgkb8be9LZY2QO9E
	VpNxSXUZjZzETbONXU/ricwayiTLLakgjKPohK2KfoE/EJyd2h+qWSpS/r3dVdm00ls2Q6ioGMU
	nUgJpZmZeRpa42R07yVQlpy7d1Ub6zwnL99UjrwYX0kr6PC6+qhrXhwt3tiDHBwGyc+FOJ1BjrP
	eTnBMsefgm
X-Google-Smtp-Source: AGHT+IEXr0iVvC7IOyzQW1Czoax+7x0XGQki9MauApEE+/ra7ZGwA2vBR6mQzTswgMRdhc7RGLfLEg==
X-Received: by 2002:a05:6000:4008:b0:34d:8ed4:ca3b with SMTP id ffacd0b85a97d-35ef0932620mr1984565f8f.0.1717658368492;
        Thu, 06 Jun 2024 00:19:28 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d69e71sm766505f8f.65.2024.06.06.00.19.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:19:28 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 0/2] man-pages: backport libxcrypt conflict fixes
Date: Thu,  6 Jun 2024 09:19:14 +0200
Message-ID: <20240606071916.23943-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 07:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200384

Currently trying to include doc-pkgs in a kirkstone based image fails
due to a file conflict in the crypt_r.3 man page between man-pages and
libxcrypt.

This was already fixed a while ago in master, so backport the
appropriate fixes to kirkstone. After applying doc-pkgs now works fine.

Changqing Li (1):
  man-pages: remove conflict pages

Thomas Perrot (1):
  man-pages: add an alternative link name for crypt_r.3

 meta/recipes-extended/man-pages/man-pages_5.13.bb | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


