Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF444C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:44:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.10072.1749019480355672748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EPTJqdK8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so56671735e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749019478; x=1749624278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajR4Aa9Ly99JCOY8rSkT+VdSHc5e3V0hsDcrxlrj4wM=;
        b=EPTJqdK8R10zUebqqLDJwOaGN/xy1XesrEFZBAYtQLemzCwcYNhgrGNGkzlFg8+Ebg
         E05LfDTV6QY9v45eKst6uvZvLT6jaVxMimgeCwLDMct0MulJhjLFOPTLZecMTAPepRz2
         EQ20PmwvvCVkFZlc9gZsRRsfIXmCUGeL7XfM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019478; x=1749624278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajR4Aa9Ly99JCOY8rSkT+VdSHc5e3V0hsDcrxlrj4wM=;
        b=FffI3cv0ucGMyRHfA0MlqJC7H7bwMw6QZhIERfbg0TYMfy1xmXq+BvuOt0N57DrfOH
         yrVjxYiZhnb7n7KHkT/VyRo7oWDrkng5Je1bvE0k4zjjbDL/T5PoPYE9HTwZk0q7ac2H
         S0Hvp6Qz1VJalptb5Na408oCayq2mWBCB9YSQaTxHMk/eykBQ9s+QK1EpeRr6zMnviDF
         F1NwYc2eBykM88fFSRBUE0dGsEs66v1UCAo/LDRZCMsG1PhbO9cT+t4W6XYOEDNcmZGh
         R99syxtkcjbA9dK1RKZCO5dKq3ccg/YbfKrLl2hX+zKWNVUvYqAqEB5Lq5STSI+1hLeo
         NAfA==
X-Gm-Message-State: AOJu0YzvUH2GkBG4ep7YQpLYn9Y+GFSFlHFQb5LDUUAdoU6YeuPUoBT+
	5pxrbnlUNjbk6/Cw4RGWJAdsGu7osP30TADsGIGdDzgWj1qGiQ/zldJRt+4GeqNFcbarOPRiRu4
	m95LgdUI=
X-Gm-Gg: ASbGncuTd4K9tApY8aQmYs3HINKaEemWt00T6f7UV2IG5lPMYB74YQwpSYdYTIVZt1K
	NskkxC2iqzQuAzQeGAVvDOOR7vs53XS0wxOhSbDRedNv76PXxSmyyVl2F9ZlKxfxjyziT6vKvmA
	yCRGwFactlXkZLsFhGrRQJ8zwQn7819uq1io/n5AM4iILDnCAGsdHVSKBI0AJXxos0vKJzySCag
	QiFexxc56UsnbaBhWO08KMEvqhIeEoC8YXZGHC2hCuCZ7H2VPm+kGz8RD4/JRv7Xnd05XwQz+lo
	sM314qmoFnaKCltNtmQ3AMr4au9qXuhiGNHZ2qR5dMh7D4SLpR8rEWuxh7nZTi8RUsxsemHM0Ap
	znHKpwmCB/g7nLHz34f3hq01w6A==
X-Google-Smtp-Source: AGHT+IFWVHHGdAaL3hnLgH6JZaARmBHmfxTngS2KCcW4KLfS0eo5rXuSfc9WWYxPW5HHx8X/FTE1HA==
X-Received: by 2002:a05:600c:530d:b0:450:d3b9:4ba2 with SMTP id 5b1f17b1804b1-451f0b3ce5bmr10700585e9.24.1749019478088;
        Tue, 03 Jun 2025 23:44:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb86d2sm188561905e9.30.2025.06.03.23.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:44:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/maturin/guessing-game: Bump dependencies to avoid security warning
Date: Wed,  4 Jun 2025 07:44:33 +0100
Message-ID: <20250604064433.3765706-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217837

The Cargo.toml lock for guessing-game, used to test maturin has a minor security
advisory which keeps tripping up github's automated security analysis, "PyO3
Risk of buffer overflow in `PyString::from_object`".

Bump the minimum version requirement for pyo3 to avoid this warning even if it
isn't anything critical and just automated tests.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
index de95025e863..a78ada2593d 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
+++ b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
@@ -14,7 +14,7 @@ crate-type = ["cdylib"]
 rand = "0.8.4"
 
 [dependencies.pyo3]
-version = "0.19.0"
+version = "0.24.1"
 # "abi3-py38" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.8
 features = ["abi3-py38"]
 

