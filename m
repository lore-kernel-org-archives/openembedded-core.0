Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BDDC35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:05:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.5203.1741687507657256826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gnHAFIil;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso8125154a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741687506; x=1742292306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKQvyATHzVOM5pxZSA6TX3Mp5nu3HcqpuLagRI2sgxI=;
        b=gnHAFIilB7sz5wMhrZeVuOwARXswtoGp6ZoNmtCOWnp6qeKYZjH0KHxaPnjAmAqWcO
         uN0PJ7Swk6iJjqRFax+Lunyzi42auFfsQmChiCPAA2pn6rA8G8F0WZHJcsFp/5KYmkRR
         CmAfHpBHrwuJ2vAfnRSABpGHxery/krRoRBHXBsmS4j6SllfZ4eAL8KlDQBe7eqesHH1
         o6Ach/sV35M9JIPVRg6J0B/Ui0SGH6rVy8RABZK16InllPu3HmXqALIka4hAU0YkDZ9j
         ZKV6SopUDAVp9Y5Vz6IcjOkhNV4une8oZf+5nnXXrZ8QdhYgWakTGx/papMGo14+wdDU
         UEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687506; x=1742292306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKQvyATHzVOM5pxZSA6TX3Mp5nu3HcqpuLagRI2sgxI=;
        b=WU5lz7C0/kHsx7txlSZeTqRgVUezaRpQetFU0pK3yP41tNw9LfI0by9ItJO65EbJ0K
         k/IBcUOB8qS6XePA7nDryRVDVpxppDuPv9//Rh693PVZDeF3s3AbN08gAvuEXRvOPW4O
         JqWN4dQnnX+Tw1YwDiW9aCHEz0lcIEjmrLIO4Eg9tmoYO57kBtYX8JPFIPQQ+QnL+7CU
         xMDg/5S2m0Yxoe41VSVnv8S0JCY3+WXUzhYYbVGB8bWFQntfNXCrQ5xb2LmE9rhGr1yh
         vVhRLQQLtGzIiZkakBo3uu447kSzrl5zVjkAc20qWqhmDT8HI4GxOdYzqaRXal9c3lzk
         2/gQ==
X-Gm-Message-State: AOJu0Ywj6dgKTXTHyodDWJx2VPde31DimGhWg0tLK3K7RGDYc7xauvhs
	YuJkuY22CALPw7xisz2tILli13GrpMOdPo0e7/TR5f2g26LfJvmoEJRhvg==
X-Gm-Gg: ASbGnctIrbY4RK3Dk0/q/Fu9RXRTlQXKSxxuUoYZJnL7L2fNGFvnuZen/XzSo9v2e0i
	scsVh3jvakIzEKw+MuCx2TSekwpvfXgGl8CW25bp1jnfD7PWuv67Pfo+Fr0dn7h6apWAVmIvVRn
	l56G11D0UtP85FIt+ASZFha6LgFx+xI1BgsiJBWJfIEJKLJJ0bx76vLaBRtEsvDUvjj8G/DmzjT
	lwiutoohIVUd4HRqQDBU28yaXFH+KQAnw98bx8sHRusyXInfNL3HCSx7vYg4aiISEw1qrxdFTLS
	Ncdi4fRYZMHe0v8o5t4Cqh/1xagfKLFYp/zMNTkM3WxlyGmFxUzT8HGU49lm1NKFZzH5NcFMW6f
	xkVy2aQ==
X-Google-Smtp-Source: AGHT+IFG2ZgEgozCbSiE/h0LsbzzWS7ufIIdiOODWWbEf7P5FNQRekqgshRVOVpMmLKTdFqN0jJQ4g==
X-Received: by 2002:a05:6402:1ed2:b0:5dc:7823:e7e4 with SMTP id 4fb4d7f45d1cf-5e5e22bf5abmr21221669a12.12.1741687505703;
        Tue, 11 Mar 2025 03:05:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8074949a12.23.2025.03.11.03.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:05:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] gnupg: follow odd-even scheme in upstream version checks
Date: Tue, 11 Mar 2025 11:04:59 +0100
Message-Id: <20250311100500.355914-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311100500.355914-1-alex.kanavin@gmail.com>
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212552

From: Alexander Kanavin <alex@linutronix.de>

Unfortunately this has been overlooked, and resulted in
erroneous updates to testing/development releases.

The check will report an 'unknown' latest version until 2.6.0
is released.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/gnupg/gnupg_2.5.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
index e6a7e3fb407..0001631d2c5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
 
 DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
-inherit autotools gettext texinfo pkgconfig
+inherit autotools gettext texinfo pkgconfig upstream-version-is-even
 
-UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+UPSTREAM_CHECK_URI = "https://gnupg.org/ftp/gcrypt/gnupg/"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
-- 
2.39.5


