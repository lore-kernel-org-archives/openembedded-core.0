Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F67AC531F9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:18:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6958.1785053885039661003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YP3teyLK;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f75f7172so15399945e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785053883; x=1785658683; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6us02M3FjHHXjtUTALpI0IwBudD9f3XyPJfbaNNu9Os=;
        b=YP3teyLKzmVF7fix+HjjNziqkDn5G3fbFrC14RLLOxoaKHMbTtta3L6u7CEYPT8qZv
         ZQDPF42LjO5KkwINFd/Kwnbm59BamdqyUjdIrrQif7ZV5B2hmxQUx3x449PGR7n9v9nV
         tDbTrQ+k6UM06ptP7rZjzhmkjLXyT++jwV47Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785053883; x=1785658683;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6us02M3FjHHXjtUTALpI0IwBudD9f3XyPJfbaNNu9Os=;
        b=bnqwfo4CsRC+wC9RFOfLWJin1XupCOuDQQwQIlHlU+LV/f6571H7hhQhLYGaczQA3+
         Su+satMPLv4kvvNwaXw0iqukZDyNio5K5FAeRzaQJ1fi1it8V3JJYbGPdK7ViRAMuMdc
         XaeRip1k/IJ4WZYrNRdQOLw8cShfEQCm7OIM7GK+w6+PFLixOZiCSAdOkJ1VeM4y0fo1
         vt6CvUMuxG0Gu0V7xzwKCG4vaVJvrMBKj0mslrgq3S0Wy2iwAt0+1z49oC1+L70cWZPy
         rMGOBywfNdf+2OrhEDkSvd59mDenKRdykfj6GZqhsT9iVL3vHvynyu5Omu7Ld4bzfyzG
         KM8A==
X-Gm-Message-State: AOJu0Yxskq2TS6gjTF2xMKynXEsXoeWgJT/BUn62ETmox8SYAKMZq6y4
	eAxOOXUhSPm+CoEBdN3b37x+uLRaBFxpTi9qtqPrtHsASW5DPNK44Nl7PxvyZs7+Jz2rdvPzDO+
	50/kTutU=
X-Gm-Gg: AR+sD13WMuONM/xxD/LYDzRIA3QlJNPgNTg0t0siFCSOet+QwABtyECwJL+3skg5rnT
	j9Ifw9YRKTWTWtrQLig8ZEWXjU7HQXz+I4R5aFs4KoDqXYJxvrT4y9ca1DVx9LWvJCLuTvOqvYh
	4KL6hmWMLuIiBERtVEaORr+Yy6J18AQ1EJTuIieq4XNYNakh+WlEnEZFsP4tZpnKacDW8quS3Rg
	bxlSNGenDZXh53mnHNHG4UtcM9DeDDS9yCe2JOWqR7eQ6uGjChUZIwTkluG3pI/LOtuVng1+4QR
	hBKkhfWq/43mbD+xo5EVU3r+TrfH0OfB9VFGbgOBHELZd0aGlXbDTxg8Zc+22Bf6tUe6N/n+9a/
	eBSS+88THZ46WYnFMeecEXLEqnmizwaVsrFg3y2Kk+EFmWA9h54IRFNMxTfGiwbjJJBHVIC5ZJc
	wqkKOVGfmVm7TnxBwGiJuPSThsmSXlHUQmS6+W4a7HBdRJuBZH0rfJLPO2JPJEKQ8T+Fp8FK4St
	jyP6w==
X-Received: by 2002:a05:600c:6d83:b0:495:7d78:7fb2 with SMTP id 5b1f17b1804b1-496b570027amr35249605e9.27.1785053883207;
        Sun, 26 Jul 2026 01:18:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f30126sm122274165e9.13.2026.07.26.01.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:18:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/27] Pull request (cover letter only)
Date: Sun, 26 Jul 2026 10:17:39 +0200
Message-ID: <cover.1785049139.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241981

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1784740870.git.yoann.congal@smile.fr/
No review, no change

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4288
meta-intel built with incompatible master branch:
* Green with proper branch: https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/4037
* Patch sent to change default:
  [yocto-autobuilder2][PATCH] schedulers: setup wrynose branch for meta-intel
  https://lore.kernel.org/yocto-patches/20260726065438.3170266-2-yoann.congal@smile.fr/T/#u
meta-qcom still broken: https://github.com/qualcomm-linux/meta-qcom/issues/2457#issuecomment-5081571633

The following changes since commit b5a6cada82d7ffb362bda9081c354dcc0b6ee264:

  openssh: set status for CVE-2026-3497 (2026-07-20 17:24:44 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 0dfe86a27167689ded394d72ebb5e22157fb9184:

  gzip: Fix CVE-2026-41991 (2026-07-21 17:06:45 +0200)

----------------------------------------------------------------

Darsh Kelaiya (1):
  gzip: Fix CVE-2026-41991

David Nyström (1):
  libssh2: Fix CVE-2025-15661

Deepak Rathore (17):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132
  gnutls: Fix CVE-2026-3832
  gnutls: Fix CVE-2026-42009
  curl: ignore CVE-2026-4873
  curl: fix CVE-2026-5545
  curl: fix CVE-2026-6253
  curl: fix CVE-2026-6429
  libpng: fix CVE-2026-34757

Devansh Patel (7):
  openssh: Fix CVE-2026-59999
  openssh: Fix CVE-2026-59997
  openssh: Fix CVE-2026-59996
  openssh: Fix CVE-2026-59995
  openssh: Fix CVE-2026-60001
  openssh: Fix CVE-2026-60002
  openssh: Fix CVE-2026-60000

Peter Marko (1):
  glib-2.0: upgrade 2.88.0 -> 2.88.2

 .../openssh/openssh/CVE-2026-59995.patch      |  44 ++
 .../openssh/openssh/CVE-2026-59996.patch      |  39 ++
 .../openssh/openssh/CVE-2026-59997.patch      |  60 ++
 .../openssh/openssh/CVE-2026-59999.patch      |  38 ++
 .../openssh/openssh/CVE-2026-60000.patch      | 140 +++++
 .../openssh/openssh/CVE-2026-60001.patch      | 130 +++++
 .../openssh/openssh/CVE-2026-60002.patch      | 225 ++++++++
 .../openssh/openssh_10.3p1.bb                 |   7 +
 .../expat/expat/CVE-2026-56132_p1.patch       |  90 +++
 .../expat/expat/CVE-2026-56132_p2.patch       |  63 +++
 .../expat/expat/CVE-2026-56132_p3.patch       |  77 +++
 .../expat/expat/CVE-2026-56132_p4.patch       |  63 +++
 .../expat/expat/CVE-2026-56132_p5.patch       |  58 ++
 .../expat/expat/CVE-2026-56403_p1.patch       |  83 +++
 .../expat/expat/CVE-2026-56403_p2.patch       |  40 ++
 .../expat/expat/CVE-2026-56404.patch          |  47 ++
 .../expat/expat/CVE-2026-56405.patch          |  32 ++
 .../expat/CVE-2026-56406-dependent.patch      |  58 ++
 .../expat/expat/CVE-2026-56406.patch          |  37 ++
 .../expat/expat/CVE-2026-56407.patch          |  44 ++
 .../expat/expat/CVE-2026-56408.patch          |  36 ++
 .../expat/expat/CVE-2026-56409.patch          |  53 ++
 .../expat/expat/CVE-2026-56410_p1.patch       |  40 ++
 .../expat/expat/CVE-2026-56410_p2.patch       |  41 ++
 .../expat/expat/CVE-2026-56411.patch          |  47 ++
 meta/recipes-core/expat/expat_2.7.5.bb        |  17 +
 .../glib-2.0/files/CVE-2026-58016-1.patch     |  12 +-
 .../glib-2.0/files/CVE-2026-58016-2.patch     |  30 +-
 ...l_2.88.0.bb => glib-2.0-initial_2.88.2.bb} |   0
 ...{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../gzip/gzip-1.14/CVE-2026-41991.patch       |  75 +++
 meta/recipes-extended/gzip/gzip_1.14.bb       |   1 +
 .../libpng/files/CVE-2026-34757_p1.patch      | 518 ++++++++++++++++++
 .../libpng/files/CVE-2026-34757_p2.patch      | 481 ++++++++++++++++
 .../libpng/libpng_1.6.56.bb                   |   4 +-
 .../curl/curl/CVE-2026-5545.patch             |  43 ++
 .../curl/curl/CVE-2026-6253.patch             | 389 +++++++++++++
 .../curl/curl/CVE-2026-6429-dependent.patch   |  81 +++
 .../curl/curl/CVE-2026-6429.patch             | 325 +++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   5 +
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ++
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 ++++
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     |  62 +++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     |  48 ++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   4 +
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 +++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   3 +
 50 files changed, 4068 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} (100%)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch


