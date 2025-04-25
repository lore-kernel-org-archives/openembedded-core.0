Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A27C369D8
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:37:12 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.12266.1745602625617797068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XOSpTKL6;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47690a4ec97so29420211cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745602624; x=1746207424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3UVr0AucQE1HlPOKVP0MJ0Dc8zeYpwxCrxM1+zUVywo=;
        b=XOSpTKL6OZH4veR6f1mwcL08LZMIwC0vdcUt7n94PG+NaOqubCaUWFeyBM1p8omSOA
         i6uUF2DIANNvp9Ceri+qyBKi4ff8WjNVhD+ZSiMkO3Zi2GJL5wwyo/qWWcucR2g8OF1i
         UDfZozqDpNUbBtB47gHNSRaRjQESRHaEHw0EJtQP1iefQgVXJxNFAB2PQ33QV8IOBFdx
         ABOIdCRRMQtot/5VcSGIFad3a/66ykNIbvbq98ezZ8ptW1IJv7f/ajtT8KYg8t5Sq5dk
         yf8GyRIEuBeVcB4qMVQu2L/PLTEO6/6/T/gTDy06o6NwdoXdV9e2Ws+5er9FbxI5ci8h
         PQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602624; x=1746207424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UVr0AucQE1HlPOKVP0MJ0Dc8zeYpwxCrxM1+zUVywo=;
        b=DMdHYBeNmdCP2pwukzvY0MEKJAvTBfFO3qQkRtTbohwgmnx5znykkXqPlQamAp21zy
         esxiYQb6Lq65ISDPrSJMk7t2pePJyc105amIBHfBfLEUi53k8vtNADf37mOmAOfDRZIs
         oUAwhqtp6h7VNdm8TsuUMp1hFMi7eCyrL2gHpTjSQrPokNFyMpiyTaDik2yjLyeKPp72
         AYSJlLABpg248SnGn6NlwbZQlHAxTwFgO8QkKgqhhJ7WU4o7aQfJ5ycwGNCihlR+cdv9
         4Ewrmsq+zqPcoZgErok8YE80pZQpmZU8+kVVzGL4KVwvcGs55nZp1qnaspSkqw2gFXMU
         4tJw==
X-Gm-Message-State: AOJu0Yyo0xU0GmzXnoNozoVuUoxXIjsmosLOdXkET+O8hVuGs3Oiz7A7
	Rr8zeW8Gl2QtZUfUatnpSbcWcHRS0e8CNTLzia320p868i8KzbTOKxmowRuVivJ6w5jLlxJif17
	2Ao4=
X-Gm-Gg: ASbGnctQC63vmljZ2Ziy6EfdJFREFVYrylOv/ML3rpZN/kXw/tLF3mj4XP25Legb45s
	TSZwKNbfym8zjumF917cZKs5/9hBytvVmf5/461pCK2uA8FA3znaYZDD8P9eW9vF5zny3vWV/Ex
	5Ydf7x1HDc8EG3zPeYyVJXcoX+J9dtcnjgryq/1tN5Ms5MaXTG26SUHoDe7VMm9PlPTaCvC0l05
	yqCLRtJdqvNq7ou7ML7TcjlhNWFRfaYLsuwiP6QYDQo7PDhoFDYtGM+qGSEEYjgjgDT/kc6unAf
	iA+tLMBxvJ7R+MAk8toBi34Gum8qKz9sJRiHUX+SLXCzhbYT/Wb9/LLPiOjJzmEAa+z1wHgIhta
	5
X-Google-Smtp-Source: AGHT+IE3aLtG41MnXLkFwjSo/9oD8uyyoGjDhpsI9htz3arpkC0QK9oTOiCM4NLfsSZo/lPrHXnyiw==
X-Received: by 2002:a05:622a:198e:b0:477:ca3:4b66 with SMTP id d75a77b69052e-4802311ef3bmr46841531cf.12.1745602624100;
        Fri, 25 Apr 2025 10:37:04 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf948sm24372946d6.110.2025.04.25.10.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:37:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/2 v3] python3-numpy: upgrade and ptest fix
Date: Fri, 25 Apr 2025 13:36:59 -0400
Message-Id: <20250425173701.3216403-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215490

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
 ...-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} | 35 +++++++++++--------
 5 files changed, 70 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (87%)

-- 
2.39.5


