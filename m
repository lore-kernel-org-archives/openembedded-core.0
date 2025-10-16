Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CF6CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 20:45:24 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.841.1760647524002317591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 13:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CoVn7HMO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.52, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-87c103928ffso17105956d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760647522; x=1761252322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ3wklVujxaOzX7+bJ1F/ckWlugQum1qKiEB85euA2g=;
        b=CoVn7HMOvfMDy0cnt0a/aSfDqC+xfnHJtRmk77Oju3JRUs2E6MYHK1ZJAxPX4NL8Yt
         J7nsdRF9l3BMgsjm+JA4qodBd/UItFnCd1D1HwnJjlPBWqYaLuXwaDDbw4z+g1LZKkZO
         99SSrOYNv+5PgvJxrfBzdYOXRD4phanMxay8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647522; x=1761252322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZ3wklVujxaOzX7+bJ1F/ckWlugQum1qKiEB85euA2g=;
        b=s/sAy9n+w4XbWIDOoyi96gwHH5bCzjdrZTtqTbavs+BwzIzzYI3pXnFm9IdcdvsLia
         ZsloeVtC3QRo7Ivk29csnf8Gi+CozdpSJl02Bns/LcZgPRPQopEAHTuYsaRpwOpfMyg3
         a4K+0e6/yPltb3OQEwvDSPQWbLutLHocnMt1/Eu9/jKU6CO09EiXumrsOss7EGrqWzYf
         2RNRZEojUjY9ALVVsQLvp375Uc4rJ3bFDtpzvuRjTA419OUh2jkFy76YfQpxW3TX4c/S
         nlPORRSt/O+QrqIw69K3jldycvg9Fmh86IgAq+0vrb3AnO4DZN6NEy1tkUFEZ/dkv/Lm
         K5WA==
X-Gm-Message-State: AOJu0YwT/nrKY5KQMtS17yMP1zowuQ0mhgOTrht84T8eB8OY5uL78qjr
	cqI4MwHE77+paKj0oTlrUgaiOlURiFfQJHiX7tTXqTEi6tZgT+Ta7fw/KkXolMZfm/aBsSGDvWe
	PI0a4kvE/kg==
X-Gm-Gg: ASbGncvByi9KyBGMRMul54cIJIAfHLC2oucY8EMVLHJ13CFXPakBEkddvSqo7C2Wail
	Qen0BE/TLSoLp9vYSDf9M7K+FRIiX+G3W0XhSDPaKehyuRBUHZd43ekKO1ZhsSKqt7D7M3mjZJp
	owsaN3yPVM9MPkkwHcECayGJKlOwDIZNTvxmvHnEUItLBmnfx1A+GGT3IksyOI+IeXzzB4+54s2
	lybKuhNbkU3r1I7u9Q0yy70txrXKG4zRke5shbzyOPLbsSUwQboDNk5QOoPjwV7u/41VxYeBjgP
	FNwHkWTpdSfE/dA8cqsRTigTrn9KjV4wKQo9eoxAfo7DHtO8whAEVgf+Da0bP5dgukp2YuNlLDC
	529vrWZc70jbEsB9lSj3yno3X+Z2gqRNsji0fvrY8iDYqamfAEufRCPtpOqDfdzd8r7vwBRo0st
	sr3o8jdaZakZVkDbBygYEOmyQZrXBuL6+WZskiF+lFuKkEW7af1xuifpwYXMsXyOT9luA=
X-Google-Smtp-Source: AGHT+IGe1fpKL11mEblBRJSc2i9q0J9HtO+bt/XplRsT6KXFJRWzBv4FzIbv9yyaFL92QVWpFl9O/A==
X-Received: by 2002:a05:6214:2345:b0:7e7:8c87:9e0e with SMTP id 6a1803df08f44-87c2061d50fmr22039386d6.42.1760647522389;
        Thu, 16 Oct 2025 13:45:22 -0700 (PDT)
Received: from yoctolap.taild15c8.ts.net (static-23-234-86-38.cust.tzulo.com. [23.234.86.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c78dsm47338076d6.41.2025.10.16.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:45:21 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 0/1] Uninative 5.0 for patchelf updates
Date: Thu, 16 Oct 2025 13:44:40 -0700
Message-ID: <20251016204441.51589-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 20:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224982

Built from
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/43/builds/2640.

Michael Halstead (1):
  meta/conf/distro/include/yocto-uninative.inc

 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.51.0


