Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036FEC55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 23:26:50 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5782.1785799610444887119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 16:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aO+/jvLw;
 spf=pass (domain: konsulko.com, ip: 209.85.214.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d02b4c3601so43838525ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785799610; x=1786404410; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxVsgKbjllgAusfxCFt7gDQA7/jDAdIzvnm6vZFARXA=;
        b=aO+/jvLw1UyqTo+eCzm+4p4LDNFKfCEcmLMHr1YFHNQzBLLLLOwyyQZVRiOp8bvCCM
         fB19TnLGTByKB+GORuEKK1raanQzBx6cR9J+idnASTHk/wR23E5J96Bxmp4eK1UqwELI
         b1dGaoR1aTpyp9Hs8TFbSyL7XOtt3E72H02hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799610; x=1786404410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxVsgKbjllgAusfxCFt7gDQA7/jDAdIzvnm6vZFARXA=;
        b=LnY/U6Aa+EAQDH4tLJIyfYgetqpPWSzkEBfzkHUq9r4THevGBPCWmH5EdLa5gkIJWn
         jkGrqWodGUF72YvPDQWKQu8iEC9OTa1lfGL2stkAiJbZTfVddLrw5QSKtAeMIEsY2ND+
         yEXo9wC8xhAJjrc2zZVqkLbt4WBrqJFXSW/i/2cWtH4Mu4Rz1tI2oOT7UTewvwjgxOQp
         WYkV86pVQDPwYiRKz6MowxSxaaqcKv0IVjqiFKhkxJ6Qva86VqM+yujFVXzToS2pL9tW
         OfQD4m+XlQx8fhWmxuwXmovOBxeM1d+S48H+fI8C39l+jeahrbJ3zBCS5m6uV3bKTbqd
         6dYQ==
X-Gm-Message-State: AOJu0YxRX5eWbVAvqsx5/3Mug8PS6FL4RBPk7z/t8Yk8AItXXB3G0HPH
	kaLuYhS8d2fM3BCAu7USSwjRD4JlEiC+O6nxcMdCuuuTGB2skdzd6GDha/i0SJ3EzDHZ24U/ofP
	0pEmn
X-Gm-Gg: AR+sD114ECArsKX7l1TFGAnMtYmzyzWn/yPwKZ430tWcFfpIq3tarfRdExjVI7y5E0W
	kzSIiPMMqs1QL212X8n96elNWIJxTmUw4Z3YXLKbhAgKab4OHlw7XQuYX9ZaZFsqM6YY4JirWeg
	W1g1riyzfp0D6kRREFA9/6pnql/NlRo74AbuAU8/E7EA4/Uo2xUBy/S8WeQgVdXNGIqpFiRY3DC
	tjQ0M+buEg27ciUwegNXnn8+PGk5AbiNlwfJHSa18cIL+dJR2ATo54zA3zvGycXcxNOkf3Dswos
	6hNQh1GMnQGNc8nchM6urXoFd9yl8BGLsd5FycuLQQhkgjheCNnmjDm61KI85Uo8ZDXvWboD0T/
	inDJTOQMl9kGgc1qqhXUEfZIYZ0+l+tEkQCzn926KYRsfg8RxijV0ivTxn7bKEAlE22Y/rEhQDj
	eASG8//HUCub5pYb9zqMSC11ia0StSWkUGQ8fuE9LI9I238Zdz+FOKSbJduUVjb/3n6+VXJzcM8
	xkkWw==
X-Received: by 2002:a17:902:fd8b:b0:2cf:b68a:8b5 with SMTP id d9443c01a7336-2d05222b928mr119633785ad.14.1785799609438;
        Mon, 03 Aug 2026 16:26:49 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b11f99csm44342545ad.58.2026.08.03.16.26.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:26:49 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Upgrades for 2026-08-03
Date: Mon,  3 Aug 2026 16:26:37 -0700
Message-ID: <cover.1785799308.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 23:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242672

From: Tim Orling <tim.orling@konsulko.com>

* Upgrade python3-cryptography,-vectors to 50.0.0
  - all ptests pass in local core-image-ptest-python3-crytpography run
    on qemux86-64
* Upgrade python3-uv-build to 0.12.1
  - No issues seen in building for qemux86-64
* Upgrade python3-webosckets to 17.0.1
* Revert enabling ptest for python3-websockets, the tests/ are no longer
  packaged in the sdist and this is intentional. The upstream docs
  directly warn against packagers running the tests.

The following changes since commit fca8500024b7d3470fb046aaa5c7fef311ea018d:

  libssh2: fix CVE-2026-66035 (2026-08-03 18:04:08 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib timo/upgrades-20260803
  https://git.openembedded.org/openembedded-core-contrib/log/?h=timo/upgrades-20260803

for you to fetch changes up to 67b03cb15e4d75bced1c4837a0cf391105a2a379:

  Revert "python3-websockets: enable ptest" (2026-08-03 16:18:14 -0700)

----------------------------------------------------------------

Tim Orling (4):
  python3-cryptography{-vectors}: upgrade 49.0.0 -> 50.0.0
  python3-uv-build: upgrade 0.11.32 -> 0.12.1
  python3-websockets: upgrade 16.1.1 -> 17.0.1
  Revert "python3-websockets: enable ptest"

 .../distro/include/ptest-packagelists.inc     |   1 -
 .../python/python3-cryptography-common.inc    |   2 +-
 .../python/python3-cryptography-crates.inc    |  40 ++---
 .../python/python3-cryptography-vectors.bb    |   2 +-
 .../python/python3-cryptography.bb            |   2 +-
 ...toml-remove-benchmark-disable-option.patch |  12 +-
 .../python/python3-uv-build-crates.inc        | 170 ++++++++++--------
 ..._0.11.32.bb => python3-uv-build_0.12.1.bb} |   2 +-
 .../python/python3-websockets/run-ptest       |   7 -
 .../python/python3-websockets_16.1.1.bb       |  29 ---
 .../python/python3-websockets_17.0.1.bb       |  15 ++
 11 files changed, 140 insertions(+), 142 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.32.bb => python3-uv-build_0.12.1.bb} (92%)
 delete mode 100644 meta/recipes-devtools/python/python3-websockets/run-ptest
 delete mode 100644 meta/recipes-devtools/python/python3-websockets_16.1.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-websockets_17.0.1.bb

-- 
2.47.3


