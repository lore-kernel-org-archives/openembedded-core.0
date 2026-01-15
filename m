Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D52D46612
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:37 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2541.1768503814751737794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aElxDwAI;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c532f0c317so27792985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503814; x=1769108614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vlsOtX0XOCKrVE6inW2WecUQm3m+/C3YrVMp2WUQTqM=;
        b=aElxDwAIJDyBDF8RgLUFEcEOT0jOvx9PzTZwWbfYN+/9zV18o27aIl3yJLGO+vjVZY
         CZvOrYfT7oyp8kNqP24bzYKEPSlr4i4bVBJb+GsfhBCD03bFP3sAxKmtQnpLInigm/QZ
         xlnanKG8+a4QHU1loarDYO+S8UfeF80PTdi0TEg+zl8GA7OSzTCQMtvzxeiffjstrYBg
         eYQld8pM9bYLgfHX0uh8Y5jyVU9yvnwkhkykUzJwuDrMVo0afEKFWzOqRDnbo+W+ngIp
         HB3fJMKUh49IsdWmPfpmKxRxyGNN1NRWi7jFJBAdaKu6ZghIz8G2bvq15+Su9+FGsgSW
         f+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503814; x=1769108614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlsOtX0XOCKrVE6inW2WecUQm3m+/C3YrVMp2WUQTqM=;
        b=Ia5AOXrR54me1fA9WjXacJlYwf+YnsDJH6hWKbkjzzx+2F/RipqAmX9d5/M4Z48Cdc
         OaNgEJmqAJYaRRtB1fQkCfJNltp9Fq8NrWCGsMpFthfhjxfO3gl5bdbc7OjEqQNQFs6q
         kYQh/lDYnxUy4FZkQ1wSeQSjaWLetoOb4iHZ8pV4pw75Nbbo/OqhLZ885tS1AMM7jNDj
         lHGMJRgN5R31uCyz7AXwHEkQImc9Npw53Xdc1eWbg3GiX76OBPfZf1H0jATQ2xjuuT4s
         pSR7SqiVnXuv/qWJztrPKk2GG2iHWarN6b9oEqNbQP46cdmPath9gw+AKscddrGK7INi
         ms9g==
X-Gm-Message-State: AOJu0YyRFZffUC7uUJJoJZa86ITtDpWOW4mlIPSjZIpkazOR6uGBQQMi
	H31tQMlyxPWCKiQ7cS4dw5RjwhwB7ymh5XN2DsAj3gq8ZoT43wYsnsiVHBcOz4xCPjSW7w==
X-Gm-Gg: AY/fxX53eXFFOmxjdOIY0SVjQGJY0BtXTy0pt8zUJ+7OjIcBa6FHUlEAXk2yuJH7X2R
	kNoKBqC1jspV7EN/fg9m1DRXjpYQRYKZVwtf1NFvfKBKJgqghemHLsdJOeia51+b2LLU61syGje
	bgw5It74CGZ65FVdG3sQLwTutjdTNCzEp7vXne8mxp7mxnefbEhLfGqbtcTxfVA9NJzNOv+j7Xg
	m04dZvInpAdrwYe/ewk3DiQ15WlpJTdInYngg0KAkiEV1T0x/sVJ/9kX5+icP5XiGuvEg+kLTR9
	xVem5WZNZJD3Batnm/2HuhsjbEYu6aX1LyKWUT+g+KmMwoBCpPZgyYQG2VLk1zBHkG6/FBcpPib
	TZQSSmwcenJyb5H4b1TAEOg/B3ufjoGZ6anUrn+wSxX2dVFRjXks4zfaa9X4b1u5ik1CbeZWErm
	wRn92vFmxM+YzsaVB7Tb3hykI9SjW8yvOtBNcf4X2E0KzRWMLCcuHyVkE=
X-Received: by 2002:a05:620a:1a1d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c6a6784196mr51452485a.6.1768503813610;
        Thu, 15 Jan 2026 11:03:33 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm17016385a.16.2026.01.15.11.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:03:33 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 0/4] generate-cve-exclusions: Add a new bbclass
Date: Thu, 15 Jan 2026 14:03:26 -0500
Message-ID: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229427

Changes since v3:
- Patch 2/4:
  * Add variables to control offline mode, source URI and
  SRCREV for deterministic testing (GENERATE_CVE_EXCLUSIONS_SRC_URI,
  GENERATE_CVE_EXCLUSIONS_SRCREV, GENERATE_CVE_EXCLUSIONS_NETWORK).
  * Updated generate_cve_exclusions task scheduling to be executed before
  do_cve_check.

Changes since v2:
- Patch 4/4: Inherit the new bbclass in linux-yocto.inc instead of
  individual recipes.

Changes since v1:
- Patch 2/4: Removed the mandatory execution of the
  generate-cve-exclusions class on every build. It now needs to be
  manually run using:
    bitbake -c generate-cve-exclusions <kernel-recipe>

ValentinBoudevin (4):
  generate-cve-exclusions: Add --output-json option
  generate-cve-exclusions: Add a .bbclass
  generate-cve-exclusions: Move python script
  linux: Add inherit on generate-cve-exclusions

 meta/classes/generate-cve-exclusions.bbclass  | 97 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     |  3 +
 .../contrib}/generate-cve-exclusions.py       | 64 +++++++++---
 3 files changed, 150 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/generate-cve-exclusions.bbclass
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (71%)


