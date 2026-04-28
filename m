Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75092FF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:00:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8386.1777363917725715950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 01:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AgvkS12O;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44509921fbcso1141986f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777363916; x=1777968716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDfjOQnev1Asg51z+/dHXX9xja56Ee5asHyvcHil5s4=;
        b=AgvkS12OvSm1tG5E7niL8EsTstD95jA10o6y9mWbUVT2JMFGVi+bYFNPIimLITxfav
         d60Gdya4hSX1x8l7ddm/CYFF06GdyS9IjERK6DlaRdvf3PRWn0oC57gjAvweXUNf5xQg
         0njCh+ySvRTGAdSLwMeFj1sHKsoIVcqNGKARLAOdXVw0uiyLkeR7WlCgUFLAuV8YDpVO
         Vt/kSg7Us2Y4cOMTXWCDVJcTLoIDt2Ioq4w1N0yS3CXrwJr41UQq/9Sr0cybZNLDL8g2
         Ez+oM4gO1gAs4syOzlAGh9HUu0DznUOlcqRVRNenAde8uq0DRVntOqp0H2oN8jaa7FEB
         onkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777363916; x=1777968716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDfjOQnev1Asg51z+/dHXX9xja56Ee5asHyvcHil5s4=;
        b=ea2IwPnqZtCt7P5gWGSmd3//MzDm0eRYrjQpD7tIH0HnyRYvneotXr4SWzEPF1TDbo
         rufW17ARFPqVDEQ3BgvVwD3oAdIkkE0BNG1uQapSySOuvo92nylF8ZR8jlw3JWLhERtc
         2MGn0pSfTDMjKgLK8V8wXPQvkKXsVsZUfutEoFm5i/D0l0ryciB1H9XvG3eyEDbyelKc
         6K8G4ejxYLU9lJWyejWAtEaMcaMx1soXRmyOktQcFnRo2UUm7/dlRGA+1+lQyyRZu6BG
         QI7s861uEKyPeeZDMvHyu9I6OFSbr4rMzQPt7ruabnNKaJHfBp84+Jk2Fq966rVZYVpm
         LZEg==
X-Gm-Message-State: AOJu0Yym4MtAANu82wQG8Hx3ukj7my7/FzHiY4OUTwcNXpdZKU+vHK8Y
	8/PLxT17FoOLfGYw5TBdtFzgbzm3Re/8hsPJ9GFX06i2WQfDlw/nDuh3e0OMhg0Ofxg=
X-Gm-Gg: AeBDievh9NNuARjNNt9drSYJpxT6dGf7pgm1CUr7l1O3wxHs2wbcgJDiseqakMAEieN
	x8Nbh0RRVImvomCdOEHesU7+PZ10JcyctQl0ugk8IW5UnfI810Jni4UTgZhoZo5SAiF/H25f7x5
	jPIBl9cV6UcdWLOZgfwGEAQ6J5NFA4mP4hZmO8k+DAAT/MJHhBsQxsvq82U17DGMeyJUSDE0QtA
	o0XpFFBQ8aaUlRqz6vb+b8BDtdpExef9dYV+Bn5+Uj+oZ9Vk2OcWDl9fiwNcoOsSjuHz3sGsbMV
	1qi6LkEv2DOp9xVD9gtppfZWehjK8pj8zEETMMZ1kyJu9kFUu/42NU801x81vIGihOakKYG3lG8
	BrIxswTgDkqdJ/h+oreFlqQ+3mijhJHwXPupwe0TjaBs1xJjb6sOR4TLgP7TK3iH+w5fvH2vzMV
	zshNOK8xHSqzOSltMOVokkxwf8QQ/jf8rQ2yxeelOz7M9hVe50q+rkzPHISyoBknbRRPF/KPDkj
	PNeVks=
X-Received: by 2002:a05:6000:4283:b0:43d:e31:68d1 with SMTP id ffacd0b85a97d-4464839c12bmr3898796f8f.21.1777363915555;
        Tue, 28 Apr 2026 01:11:55 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4588351f8f.20.2026.04.28.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:11:55 -0700 (PDT)
From: "Sam Kent" <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v2 0/3] Fix .ko file pre-filter to use endswith instead of string contains
Date: Tue, 28 Apr 2026 09:10:43 +0100
Message-Id: <20260428081046.1660101-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 09:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236048


Sam Kent (3):
  package.py: fix kernel module file pre-filter and document strip
    asymmetry
  oe/package: add unit tests for kernel module detection helpers
  oeqa/selftest: add oe-selftest for kernel module pre-filter

 .../selftest-ko-filter/files/module.c         |   3 +
 .../selftest-ko-filter/selftest-ko-filter.bb  |  29 +++++
 meta/lib/oe/package.py                        |   5 +-
 meta/lib/oe/tests/__init__.py                 |   0
 meta/lib/oe/tests/test_package.py             | 121 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/package.py       |  22 ++++
 6 files changed, 178 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/files/module.c
 create mode 100644 meta-selftest/recipes-test/selftest-ko-filter/selftest-ko-filter.bb
 create mode 100644 meta/lib/oe/tests/__init__.py
 create mode 100644 meta/lib/oe/tests/test_package.py

-- 
2.34.1


