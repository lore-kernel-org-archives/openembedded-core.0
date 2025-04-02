Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E31C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.2160.1743577909561406081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ObEmdsA2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so57075015e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577907; x=1744182707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qtv7cn74J6EV3WP/k2AQ0EO1M3jtMiIujiNPaKJDxqE=;
        b=ObEmdsA2LuV4Dx4ndd5upmH2CW/4+gvBrhNx2LzQzEidSFRJfkZvOfIkkqD7edmuFr
         i7gec0ih0D3MM68niC5cI7X5kAodue8LhQSZMy6UXuk5Ig9vCJJJifTIsQ4X4pqAWKnB
         iiSqow958VIqAP5SD7wVIHsuBiLdupNilpwQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577907; x=1744182707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qtv7cn74J6EV3WP/k2AQ0EO1M3jtMiIujiNPaKJDxqE=;
        b=BcS0qizBmsrrPK89J1m3SGV4Xc2WHP3r7R0srOAaVMA+BJR3MV12Rr9QMd1WNoZAjs
         L76o7W4KDddQutftLsDoIvJoWb3aw8pe9lQRmAUMsFlTGVLkcdjY1ghi2johN6nWq38q
         iSkh/wFq7VvnoHdPmUyQUIXXpzB9ff09WbKC1MWrx8hWWl1PqmZvqhF4JkDwXkvoY5pX
         YMHuZMFGdPkrVtD2td0sP63l47wfBHMbro2jOmXKCODttWzg1rambpAQXkBgcjZThWrV
         ROthkQYE5tg+SGiKyQN3rayFp6yzUTUbOq7PHRHt8O1rOVzg9fXrrB/WmnuCyCwoWmch
         WFcQ==
X-Gm-Message-State: AOJu0YxcEk21Q3wWxjZLtCvxf8e0ro3DJaI6PiogGDcBco7RTtE7Jesd
	w1NEo5NLXb7i3ERnUsKr3DgfGhShUoYrR69zb5tE1xSfrPAWnqN+gsqA459rAbBpEPdC8cKVuvB
	T
X-Gm-Gg: ASbGncvK90MaTiJw6K77+ogErp1E1MSHoQ0Ck0CGU6C0tnn0IV1NVlSltwPEybnC00K
	Jr73ida0sKVxcMjPVOooTipjKvVykvCtz8g7cvbWdlpRNCKAKkGyjtt259MaxFx++qBlWIEDBZI
	gstRbEdXsaEkWuzIWRUS5x2Gaoz1/0EkEDUPmqgvka2livbK0NLlIaFYNR14dGMOmlidr3BFFjN
	1lV90MOrq+lqXD5hLGoR/U/X+CdsJINRVLj8dX5bljFz7lH/v9neN8fFid00W6EbDx7s2kXaCL+
	t3LxC/yjctOfNbMDOTZBWiQQQLCcbzXBbLqRJFhi2cyPDyLS7pqnyLOiGoYGpH6wvW3F2shXIg=
	=
X-Google-Smtp-Source: AGHT+IFdWPeqOIoHKC4mPCaGvEj6gwxdI493XXZqT+yIS4Z9ia0H5QKI+NNpTV6w3VQ/2E115hVz4w==
X-Received: by 2002:a05:600c:4e0b:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43e9deccc8bmr83910175e9.21.1743577907084;
        Wed, 02 Apr 2025 00:11:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:44 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 34/48] python3-pytz: upgrade 2025.1 -> 2025.2
Date: Wed,  2 Apr 2025 08:10:03 +0100
Message-ID: <20250402071017.2157620-34-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214207

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pytz_2025.1.bb => python3-pytz_2025.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2025.1.bb => python3-pytz_2025.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2025.1.bb b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2025.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2025.2.bb
index 6d1861fbd56..86bfceadc8e 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "c2db42be2a2518b28e65f9207c4d05e6ff547d1efa4086469ef855e4ab70178e"
+SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \

