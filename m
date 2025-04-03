Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A909C3601B
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.10507.1743677591521274791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCiQBMC3;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso442397f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677589; x=1744282389; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJxisqNQD3uRyUisk1LVJdnlITdG5xfPbCOGJhmhyX8=;
        b=NCiQBMC3RH9yQnfNd2JU2bodrO3cTNZO7/lJ4SMEZROPQ85Bm8ASS1TgfMF3wJxRoV
         PU2PhVt8aMkWZw4jP7/IbCLk/4T+2sXN0Gbm+pPrA6Vh7M+SlkH1XqCpFmSUU0UxjcVX
         QVQgV8FhYU5f3r/UvdqgZhL33DdaK/01pdl5QmLTvPJja2ntEHGCb1T/JWfbTiIT2/WV
         8bCdueYghB5VHkGhvgkjKoixbu2ozs9VBkO+ndA1ABi26+AVLFgrrKvAO/EIPEjmJotM
         PuRR91Y5eEtpOgtkYO4GcMFX+qbd2bhsHfvvc8lRHqZZZytQJR6/1acQbllzXvMxk6Tq
         k5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677589; x=1744282389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJxisqNQD3uRyUisk1LVJdnlITdG5xfPbCOGJhmhyX8=;
        b=Aoy7j1uth+Jq9PPDaeSnxV/9MZsYf9DVeAdYxKAGEg3Hgto8F1YXQ0w45nWrCsvbls
         38MDIzWtjJPvQIA5jaZkqya1I4rymhApaP25VQWFvTI8EQKtCYqtPYS1N8zSPIow0H4M
         VOOrcwc7ovRt1co6010wRWpwA8ItBC5/m5O/+yDnDBjN7MiVo0NuCGuoHG6qHkAtQPMp
         vHohFGkVYA01G2x4m+T08n45oFoul/UZwnAnHEwCFu+9NUo5PxxI6A/45pP3yNodC1oO
         kH5CiRcNWZtmfLtNBKs94QamuHe4ftxWofIdH4DC1wJGtnr1zidDIhdiXzJJ/UfnhRSN
         C0DQ==
X-Gm-Message-State: AOJu0YxMsojd+kBomu/26G6J0yF1CRHX1R6Q56R0ZdGaWw9wvIPL9Jcd
	LJ7bVozB4Fb6DHZFzGH0q5+NIXsq7U8EigHDpri8wA+H5bdopX/PuUqFualG
X-Gm-Gg: ASbGncv8Z/E59WWItj7+pKkioYGCuVJg54jjsyT6oJ0SHVGEPBAiD8/XeUn6du6k60k
	T2IgtWEXqUwhastE0LyyM2K/QrBUAPY84Lt3Qac3JGtNN1NPYqQsUJ/4daTij25XpKAJkayKBBq
	87dm9xXArRUIl6RQ+1HykBzaJkPsxfMTy6i/oM3g5u7VKyHA2q2fSzny+DG8qfM/67wrqZTlqi5
	bZD6oN1NF/TqIlffNA3vaCrLVmph5B3Aaz8IDX/wuLBAO4d9Zf4V/iDpkTjJJvVCWjIvlnLVZ3+
	1zFMHR2ktXNH8W8oT321mv2+zMAFqJKVwVBnh6yqdM217dTdUlWtRoOdUzxKA6+7++WvLNM4nhb
	KsOSctqVTl4xwMlpS+a6WxQ==
X-Google-Smtp-Source: AGHT+IHI4oZeMMpSAbHGmP64CNM/3v6j+3K5EL+W0jCd0Ne0uLWbj6mjdghFUz/2ynuf9izv2pGNdQ==
X-Received: by 2002:a05:6000:1889:b0:39c:11a1:21d6 with SMTP id ffacd0b85a97d-39c2e62276amr2319741f8f.17.1743677588927;
        Thu, 03 Apr 2025 03:53:08 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:08 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core v2 0/6] connman: Update for all PACKAGECONFIG
 options, clean up legacy
Date: Thu, 03 Apr 2025 10:52:53 +0000
Message-Id: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIVo7mcC/z3M0QrCIBiG4VsZ/3GGU9ewo+4jdqBOtx9Sh4YUw
 3vPFnT4fnw8O2Sb0Ga4djskWzBjDC3YqQOzqrBYgnNrYJQNlPOemBiCV4HIcRacXwYpmID23pJ
 1+Dqk+9R6xfyM6X3Apf+uP0NQ9jdKTyhhVjit9WiUk7fFK3ycTfQw1Vo/v2Fm0Z4AAAA=
X-Change-ID: 20250331-connman-97d433659424
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214311

connman has a legacy style, this patch set adds in all the PACKAGECONFIG
options which the upstream pacakge supports, removes patches which are no
longer required, explicitly supports operation alongside systemd-resolved and
reworks the packaging so that PACKAGECONFIG and explicit package selection for
every VPN is no longer required.

Everything up to the final patch should be backward compatible cleanup of the
existing recipe, with only the final patch reworking the packaging.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Changes in v2:
- Remove connman-plugin-ethernet from build-appliance-image
- Add missing `,` so that PACKAGECONFIG[iptables] is marked incompatible with
  nftables, not RRECOMMENDS
- Reinstate `--with-firewall=...` lost during rebasing
- Move `iptables` RDEPENDS to connman-tests where it's actually required for
  iptables-save. connman picks the library dependencies automatically.
- Make CONNMAN_STATS_MAX_FILE_SIZE a weak default
- Link to v1: https://lore.kernel.org/r/20250402-connman-v1-0-2e4fbbb7caf9@gmail.com

---
Alex Kiernan (6):
      connman: Merge .inc into .bb
      connman: Delete patches for gold and MIPS binutils fix
      connman: Move ppp from DEPENDS to PACKAGECONFIG
      connman: Add all build options as PACKAGECONFIG
      build-appliance-image: Drop connman-plugin-ethernet
      connman: Rework to avoid splitting into many single binary packages

 meta/recipes-connectivity/connman/connman.inc      | 221 ---------------------
 ...vice-stop-systemd-resolved-when-we-use-co.patch |  26 ---
 ...ange-visibility-to-default-for-debug-symb.patch |  31 ---
 .../connman/connman/no-version-scripts.patch       |  47 -----
 meta/recipes-connectivity/connman/connman_1.44.bb  | 156 ++++++++++++++-
 .../images/build-appliance-image_15.0.0.bb         |   2 +-
 6 files changed, 150 insertions(+), 333 deletions(-)
---
base-commit: 8b8b53acc73d1a7b47d032708b0bf4268ef51548
change-id: 20250331-connman-97d433659424

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


