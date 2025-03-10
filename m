Return-Path: <c137.marques@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015E7C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 15:04:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.40071.1741619062532391778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 08:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+5u5Iyg;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: c137.marques@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso26425165e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741619061; x=1742223861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XgXBBOYIK22jnDbrMmQ5gGdAeG3x6osRxjo+XnCNcmg=;
        b=I+5u5IygUaS90ikqgO9jOAyXeoXQUy/3uv9b56jpNh4NrHXIABf6cIWEJBtyFeQF8U
         xq8XRQ0KB3YZ2SVza2mGh5E0P3tflovE4Gg6HAwRIH7RdCnsIFJEwFhLQXRANTYnHGIS
         9GoqJiKbru1qrrags+Wnk+2mR+4wOq6fHCi46BEoliiTjUUGa6DC43aKXX0BUyCinDBU
         9GoSf1sWK7goBr9lrxzjGLLfMApS2isedTG0+zUwf5rVqPLasgrmKK0BAeIiQVv6TaxN
         RDxtOEDaVxWAC8/3+LLjQyJ3cKARAA7sUyCQPI5FCv0e7HlF7Le2YhZ55wvWX1EOoRFT
         LZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619061; x=1742223861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgXBBOYIK22jnDbrMmQ5gGdAeG3x6osRxjo+XnCNcmg=;
        b=rBpIzANRBKLGOw1KUZA3UjN1D+6Fj2M11vjrx0X2S899OhaCuX+1ghYI/QlMqfAwqP
         T+ZsGahN5LDQXTE0s2Y1Ioc8X2nzd2clTg5Df0z72tE9udzjl+LfZvA6wE7RTjbsHrZo
         wDOPz4XnW1fAOvw4/DRYHq8OtXhTFJKVk5QTqwfzWBO8Sq5GA+4hFT4KaNnVA1vC/aSG
         ID/lS65Y2ZfqxrPAv6Kqrxj6FOgEeOceBGl3f0ah1XLR66YC6yjsZT28YkXA8yj6ug1Z
         fqCclyNkrfWbYc0FxdxryQA36v79l7La06flPHRW1jBQ6gDUOZ7wcg7psGMwJj0YTRsb
         DV4g==
X-Gm-Message-State: AOJu0YzUBHqOgzhGea+IJlLPKOwLX2CG4v2aBg8ceiqouxlYvp+firFT
	CnHrjl7KLZbUCFZxPA3RQWdvKvCRCILD0WyO9uCpz9AWOVVp6nQ/6oH6Gg==
X-Gm-Gg: ASbGncv0k7d8eAk1qm4jF31/vuO8qdlSepGLUBq3JCMeWMC7QiTt3RoeS7o+LDMXRHt
	xdNpPJo8dYfs6o1CzKc6dF71FrZNGDNOkkMCf2OjwmjZI/2NqViIeXzIcaz4gXkIh6dh3hgAKZr
	GWu0LxycJ2sMReSx4Z0hO1U40RufWm/xsN0LCjQjCieW7M+nZ16fn0ip3XrXVh9gDjmD4cVFbfZ
	jzYajdtq2h1AircG5RVDSFLou9nVc9D/Bxx5OCcjQd4yaS1Bi08KuFzePJeCFc2BZPsWuBq+sCU
	t9SUNPHK+j90l2PibUw9ubZTAg5F3UcHtYidkFStmzCq4NUYjjTzxdUvSn5c07NLGT+Z8McRNL/
	vMGyxCf7utzQGGHba0COFrQY=
X-Google-Smtp-Source: AGHT+IExVon9NhkkKh4zYiRZI0sTX3IcBRZoCBHSk8oF5NJNmLWyKzIesSkkPFxRJw8n1qqGuQ9F7Q==
X-Received: by 2002:a05:600c:3b1c:b0:43b:c309:da40 with SMTP id 5b1f17b1804b1-43c601cfd73mr90735255e9.4.1741619059794;
        Mon, 10 Mar 2025 08:04:19 -0700 (PDT)
Received: from ctw-bre-003.bmw.criticaltechworks.com ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceaac390bsm79754555e9.35.2025.03.10.08.04.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:04:18 -0700 (PDT)
From: Alexandre Marques <c137.marques@gmail.com>
X-Google-Original-From: Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Add new script to clean hash equivalence db
Date: Mon, 10 Mar 2025 15:04:12 +0000
Message-Id: <20250310150413.2654942-1-alexandre.marques@ctw.bmwgroup.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 15:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212528

This comes in the sequence of [1], and relates to the new hashclient
command added in [2].

1 - https://lists.openembedded.org/g/bitbake-devel/topic/clarification_on_cleaning_up/111382632
2 - https://lists.openembedded.org/g/bitbake-devel/topic/patch_v2_1_1_hashserv_add/111620044

Alexandre Marques (1):
  scripts: Add clean-hashserver-database script

 scripts/clean-hashserver-database | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100755 scripts/clean-hashserver-database

-- 
2.25.1


