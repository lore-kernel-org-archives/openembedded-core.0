Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F102C10A3D98
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47396.1774529479998828366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=njjj9Par;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso697931f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529478; x=1775134278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+wQPEZ/aPyo4ac6MkfSzatAYKbKNJUDrL1qA8sPCvPo=;
        b=njjj9Par7FVbydPi2PFK3YuI22QB6w+jhzw3B07tYMuo8jk5byMbvGZLxOXpktEQBM
         gO/RYYkdUY4/qxeOC5624GYVkLaBviigUFLntyUxufbsF1fmHIf8zRCIsc6Rim2a0nOE
         evdpoGbuUTHlCxnM8mp+t2UlTKQ09nxsQX3MCSUTyAuvK34qCmy49vN4OywrFyz6U/wC
         T2Yzv0qs7u8Yp4yGkcYjuYjaDvYBa2YC8IgwyqDtZwHycV6aQnKM47VTfvAiLuyIX+Hi
         qKKW6bVeqPKSTDLaLj5d/VOOuMDfqtRpEUQMKwyN/QNFtGFIA0UeS8uMzMF/kiX0IiPK
         K5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529478; x=1775134278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wQPEZ/aPyo4ac6MkfSzatAYKbKNJUDrL1qA8sPCvPo=;
        b=MQ9A4e8VISCWJy14ljZsOakry0zqjsA2pdp5REt1QgUpzxp1fMY8po4ep2z6Aw0eEy
         mlp/NNgT4+2e5y2DDue8GVc9Yo0LB8JtpBgyDvvfuTiKPxNrmKhQKq07DgYOaPb1Rhqn
         /9dlttkMoLC3+469rfm4IkFkSCqB6Bn4pYz1vpKqh9jzskQguL2fo91Cqk3IApV4xasm
         K7346ykryPcxoPf9KA7FlHZLKfJ3B8MIhbsdNTZ5Na8ZqnVZHyazJopZXoR8G2rBx+/P
         54pUQy3C/cGKuNxq8wLAktRdSszGJ/HFFQx/S5qrkzRNqUStDIGqbnpbvRAUDHZQufu7
         rYZA==
X-Gm-Message-State: AOJu0YwG7QBEJC5+Ng3F7MoHFsjvLBtfrue2Qd4xq2Ev3DgBPcx8TNVk
	a0+BQhlbnDaUFnzMwnrMAuZmxAZPfwO2wwIdDjE9j+kTG9RAJf4taRsPLT+Bgg==
X-Gm-Gg: ATEYQzxLAUeHN+7aKa7l7zyqogWoHljhnbB7L4hjwqnb56URRdloqQm1qTi+GQQYvqB
	jrjXs2BOZWTH/u03+d4XSMTgL3fUxXP3NT0e1vbX1Dhstz9nOdwo4e4hnJOXnlaghsnsNXk53/I
	Od9BrvQ4E1SukPl+skgsM7BBfrn3T2iwjlnGNDU1cpz/wn6DmPCCX2JQyhrPU+RRwZtU3vDg/EO
	ehIFADRM+nwc9QF0fT4XvFPB/6O5rCamyuRTRhVbUIJ+tNPfQ5wh+susxY683yYWSOtnHeYg264
	wQLvjpfZblQmCsyaZBdamcTuSeqV89wYR2PlDfKW08ZU+Zvm6Y8RHz7/7LkhU0bj9Soe2vYrY9P
	eBwnLsiSuCjPIlm+4/VRN9epQG8bh3EMYMjKuIeJELZeTQnGvjiwRxLs1L6/9+NcK5/XrVgPS3T
	zhnB/inEG0z16pvQ==
X-Received: by 2002:a05:6000:2481:b0:439:b791:f914 with SMTP id ffacd0b85a97d-43b889a4a5fmr10927969f8f.18.1774529477898;
        Thu, 26 Mar 2026 05:51:17 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:17 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Use PYTHON_DIR consistently
Date: Thu, 26 Mar 2026 13:42:21 +0100
Message-ID: <20260326125113.1853869-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233984

The Python main version includes the ABI flag, which can be either "t"
for 3.13 or newer if free-threading[1] is enabled, or an empty string.

Previously, the PYTHON_DIR setting in python3-dir.bbclass was not
suffixed with the ABI flag, a.k.a the PYTHON_ABI setting.

Since PYTHON_ABI was always and still is an empty string, many recipes
used "${PYTHON_DIR}" and "${PYTHON_DIR}${PYTHON_ABI}" interchangeably.

Add the ABI flag as a suffix in PYTHON_DIR and use that in recipes
that were either using PYTHON_ABI, or manually constructed the
PYTHON_DIR value from PYTHON_BASEVERSION.

This is a preparation step before adding the (still higly experimental)
Python free-threading support in Yocto.

As is, this series is a NOP since PYTHON_ABI is set to an empty string.
This series does not effect other recipes.

Another cleanup series will be coming for openembedded-core that
will also be a NOP with or without this series.

[1] https://docs.python.org/3/howto/free-threading-python.html


