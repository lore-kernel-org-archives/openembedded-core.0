Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08061C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:44:31 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.54751.1745862260977539184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ZO3T9ikj;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c542ffec37so603316685a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745862259; x=1746467059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dJxG+sAYdQ0egmVARQxBln11w+uz82yf3rOJi9uVZM=;
        b=ZO3T9ikjilnqQ5PJ6sSWjDABV7/q5tdcIgvk8WVm646AuL4FJ2Uk93x2OJk4hvsI9j
         UZF181bRznjFtXuJVsAvb0UF6FTf8JeKQy9PtcE6kLENJGrsOxoS4/U4yXDQAR3hWZFa
         B0pKWAbJIYwoIHS5SkCRTZ6nQHcrpk2km7W9fW7x60UnuB+76Ia1gpO4eX45T2F40Nzl
         G1Z7Nm2ig02ydw7oEvVjWIprj5ul/WuCZ8cDYBbbOn/oduuq306S16Dt9/pAoDSuo3Cd
         UT1rrWeUSHnRqEU573tJnmVx7fEfufPponURQTodJcK8gW/6y7J3XY8y8y2qH2pIKQuq
         4Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862259; x=1746467059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dJxG+sAYdQ0egmVARQxBln11w+uz82yf3rOJi9uVZM=;
        b=NivC2bqvF1HV/pJXg6Cl/AOqAnSaSP95emgNDaw1P5PLaOu5T/AY5KBdtMuHYeNHaY
         ygtYyHfZnqB96c7hSexOQ1CLhCgYB6cXHIcCZUbFDci5mycp2djFNsxUZ3YF51uB3Egy
         xkneDfj/+5kNEZNMvCdK2oNuQTgE69kgNFJ/AaFBHkJffvluC50yw2HYH5dJQz2M+Nt/
         +TYSAQdHXQKJotbKMTEM4U6nBpD6Pm5ybUi8r7lUSBWSCkqMzP/gMEYiaMGDFl2WO2O9
         JTjTfo4NGegPzy44sdkcdLP+D1D7geERsPryIWz9JWQ41Eb5Amo1EH5K8c1/ptscN9U8
         ZE3A==
X-Gm-Message-State: AOJu0Yx1f42aFycJE4RSag6SR1zjR4d/oxpczRfmlTE3uq+UYPgWSWf5
	qLvftTHIberJjdp0VvQ8BeXXyHrNzXoaIImzoMKWVvLgZDkZIzUu5Xn925PODR331m4W80Phefa
	hpvI=
X-Gm-Gg: ASbGncvsjbd7vXdPA9PLbka6FsrZrxYd/wpc3wqhun01tIZ9RXlXvhIrZtqSvLTQUT4
	T7Koi4YE0q9rQXBrHiwp2LZN/nBKES5HOraivsn/ssB6ZxeEINcsxrH0NHDawWk7EIxr/dKmJQb
	V576FVR2lXglMTRTisO5s7vkNtVVfIVSflellV5v3CZVXrTtkGc0+Df90ImXbiB2E/AAs5xxtcq
	pKmjGi7QOXiVB6RJesLBwpNFAeW5dhUc9ZesQh2kTaVXnMCygiyxv60W1eNMSeFldFiJzle8rGy
	rSOMzpzgk2w+sqp+qKVaiBe3+jRW+3t9lLzHhXPqFQUioAjI34fQ3UAywBt25TNIRgQvjuU4bb0
	k
X-Google-Smtp-Source: AGHT+IEszIQhqENVPkMrr+l7mG4R/A7omqkXN65AB5jW+meNY/gkX5eldsiSRstbSGW++yKcCYruEQ==
X-Received: by 2002:a05:6214:529a:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f4f1c6f3e3mr1356506d6.38.1745862258800;
        Mon, 28 Apr 2025 10:44:18 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aae6a2sm63649676d6.103.2025.04.28.10.44.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:44:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/2 v4] python3-numpy: upgrade and ptest fix
Date: Mon, 28 Apr 2025 13:44:14 -0400
Message-Id: <20250428174416.379821-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215624

v4 tweaks the run-ptest script to use `pytest --automake` and adds the
corresponding python-unittest-automake-output module to ptest RDEPENDS.

v3 includes the patch to disable a consistently-failing ptest - this was
mentioned in the previous series and the numpy recipe file, but was missed
during final commit.

v2 was re-sent with a few cleanups compared to the previous version (which
didn't have a cover letter).

With the introduction of patch 2/2, numpy ptests should work (they're listed in
PTESTS_SLOW instead of PTESTS_PROBLEMS, so the recipe-specific ptest image can
also be built). gcc is required for ~10 of the ptests to pass, which is a
relatively small number overall but seems to be enough to justify adding it to
RDEPENDS. Further detail on the changes to make this possible are found in that
commit log.

Trevor Gamblin (2):
  python3-numpy: upgrade 2.2.4 -> 2.2.5
  python3-numpy: fix ptests

 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 ...b-tests-test_io-skip-test_big_arrays.patch | 34 ++++++++++++++++++
 .../python/python3-numpy/run-ptest            | 15 +++++---
 ...-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} | 36 +++++++++++--------
 5 files changed, 71 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (85%)

-- 
2.39.5


