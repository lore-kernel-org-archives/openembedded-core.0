Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B283DC369DC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:27:30 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.15643.1746016047732212340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 05:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nf1MJHVx;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3106217268dso67787241fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746016046; x=1746620846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7A6LkBJ6pzWSqKsptVVhaHnMuIBYY0jp/MqNyzysu/M=;
        b=nf1MJHVxZBD0jP0Zpt27yciZnHDSSdluKFyQrDX878D1A/7LrkZRZbXCdS67lnGuJ6
         UpIPzaCd8tF0U7jHFE3JPg1r+JpS6hHIGceqS3ofY2n7MMzp+q+ODlVOwo6o5fNDIvbo
         OAEQ07bwL9Sbphz4zF2ALBirW8VUf0GikQ2lmzco6FpzgoGVujA0BDoP28jH5T0RC+sN
         fmGj2hMQh8+Kx3tGRUmfRqlscbAqRcHGZa/214dVYT0XB83PR26m0WJlXro2c+HzOUQK
         xkuBAAaYJ6q8fej21vvKOIcPR6s/G7bVVzLOIzO/d5UhyvC4Gdg//I8qlcLSmUIao+LK
         SMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746016046; x=1746620846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A6LkBJ6pzWSqKsptVVhaHnMuIBYY0jp/MqNyzysu/M=;
        b=LlL44Ctr6BVfZlofphsk8+mfaL2sIEWLN+95V+xqVQoaZzuH+Yl6caP1q0veyALta1
         As7l8W1i6WgzbaC4CpBVP3e2GndYEc17FQ0kh8myPVITaW43xnQYiI0xtnL/E9VX8npS
         CZqt43S5AvwMOgGyfe7ZwXchUkX0iyBqxQ+VK4jaiLS9RyF1o4mgBXnzuVBAhO/K6hw6
         gIrNBzMhIFaHetZ40WAYRXhKsj1+R1pkP3xx+C+j8oW2V6xPlpqjZvlvpLEGVpFmS2ew
         3Jrs+Mm/SSI2Jt2ac0xAedTxHmI5cB3wnXHHofJ/PGJkozUr+x118G97iK7sRbrG6OKO
         b5UA==
X-Gm-Message-State: AOJu0YwDvzV7gMIKleMwcQENuVa14LB1jrq5MkbXdtEtflq612qRPUL8
	ZZ/t0ustT+ZVTGoPc8P5aNtiiihIfNqusF5XlOUunXxdjM8tQos6hHkEaQbSqKaNpBv2M/jupdo
	qrBk=
X-Gm-Gg: ASbGncvX0jx+NnaT41pgQKj2ZRlAm61gIYlasVKVjEt77NhLGlMBpmDWKH9m6XU/0lC
	4+3QKw9WQWaURkvaGPgA6UOmmrx2aZG/CSvIEbCQMhE40+MBLyFGXBzNBA4JW4cbw7cVS69QXxp
	DpwCWUkdZCKtBXD8zq4+Il+0BZbZX3RMRGAYDx53K4O8VlPhUTupZxGfss6rk8/qtN+FBzb+yZt
	07VvIYc69Ttd11bVepGyltPGbFBiyDOd2ppCXQTZv7G5ySUgDAFWATZmRn9GzxucQRqusKhTZvZ
	yC6cDxJeJ01lErRYRsPYJRQMe46JSuoitx+LxDs5wvjfMKnkeWun1Be5rOo4LMkGQf6VmN+s3Tg
	6yqFVuTM9R/2I94hCcA==
X-Google-Smtp-Source: AGHT+IG6m2ddn2IRu7v8YNQ2G7T/Fitt8GjuG++42NdU8+lf6K4LF4UocEuCpOLLWVIW8FCV1fbIcg==
X-Received: by 2002:a05:651c:242:b0:30d:e104:9ad4 with SMTP id 38308e7fff4ca-31e6bf64fd4mr9003061fa.41.1746016045728;
        Wed, 30 Apr 2025 05:27:25 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31e95ee3750sm2314491fa.80.2025.04.30.05.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:27:25 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/2] Fix wic oeqa selftests on genericarm64
Date: Wed, 30 Apr 2025 15:26:59 +0300
Message-ID: <20250430122701.747803-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 12:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215742

Two wic oeqa selftests are currently failing on genericarm64
so fix them. With these applied the tests pass. Makes my life
easier when I can run the tests on genericarm64 builds.

Mikko Rapeli (2):
  oeqa selftest wic.py: increase rootfs size in test_offset
  oeqa selftest wic.py: add ext4 to IMAGE_FSTYPES in
    test_exclude_path_with_extra_space

 meta/lib/oeqa/selftest/cases/wic.py | 44 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 22 deletions(-)

-- 
2.43.0


