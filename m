Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4902EEA4E2D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:36 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163873.1772467286391815476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kpfJfMYK;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483abed83b6so38588245e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467284; x=1773072084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvIeISWAh2SxVbK+wBCjCkSuXJeaD8nUhaJJU38nS4I=;
        b=kpfJfMYKIID4sBz1l8jShq0P4KZ8lCrwEK77jGFF6fehZ09Xqt2oQlNySa3JaX/ECs
         u4CabsPmZFhwEPFZn0edO8JllcFG/mpYyU9Hegag95FXf/kZ5rzH2vpGtflu0XTrjiIN
         iHJilmmkHa/jBkPxFH2XlYDy1fzZhaheWLyuGeQqPwAeOhpJtHhBHpK5O/ZL5T/mPfsN
         HE1JdoDU/tFtbDrfAUylUdBSDK+9E3sMk9oWOgX0N+hqkkRPYWDPBwG3RxrZjNzGk7Hm
         +Ixyv1rdjAzT7bAsUNUCR39O66iT4onWMT3LP4ff++NtGJLlXwrkU4QTqKehFmcCokBw
         ewaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467284; x=1773072084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvIeISWAh2SxVbK+wBCjCkSuXJeaD8nUhaJJU38nS4I=;
        b=ns/Hc32QMWwm+Ncz7Lo3dBX7uULsH05WXG/CkIB2xADCNUad4On8ZLt/T0YJIf8SxP
         ry6uGGNn3/rhngO+orfr+Oi803TOe0y/ysYTfar0Hw8Yw+xWiqZzlvfEkV5KOtpbgJLi
         psBgR8JS8cCnwM8TbIbiQyXB9uwatDEj/Je6rfie3wMgnbVAowLf0ZhZyIfqeNXwKjfH
         AOovpW7vLJj57KMLlrw+s4O8odseH1d2dXte7bZNB6efQIKkUhQIdsWV1KMlkxA+q8cX
         T203KOJxjAYLjQ5oAGZLUz2TEBFPAId+0oyKRyFVzFQELxkd0ANa2Gtn8olyvqqNoEOP
         6JBw==
X-Gm-Message-State: AOJu0Yw2kk+akPW2UVGdEGb5aemWIeTci1nHOaPa8zqoO++sIVEQ9HM8
	3MbPsLOdGLtnc1vT/IXNhFfVbZf2sQr7g+jsEauXevU54O7uCpvUklPHMCpBkA==
X-Gm-Gg: ATEYQzz2ELonNRy5x37+0RyR+4tGW7pE7HzXG3tf+61xu3XXJV/uHdFqyexLIOpm/h9
	5I8cw3SgyYBzLkEZDH2ySoQsDVasqO0URGAyVcuEWW9zaIEpoFRaXXWTg+Y0oh59SWSY86Qe6I+
	ZIaxlx96YAZWwlQ1hO7VESDywXCM5iBiFMnV91yFdLMkneAX/A///3nvnesIuNTs2xZskhkGvV4
	lp3nP2bcziB/StPthcGvHK/KykFtR23BqjIa1/FdIWNEosFQXhkFoSElE6YUvdH9JDo7l81/N6C
	eatyjNzU1GQoXzz5bQkEdqIKCFJkZSifD3CZN7glGfRQ7J0naB5tHLFqzttwgOClcq129x/QMOc
	ODSpPf/vOFVzIc5IZ8HCb28C0lUhzGKo/SyhhU4PF2iPp1D3zvBRBhYvQKxLkI1YAHlZTcttoX8
	Mey0rPHVEItEo+FWdqTLSlZ18T4bP3fGnwou4Dp6++PhKRHMCAIpDsbV/VV/1aNalhR7pTSXJUt
	GjaTHX+HD0eAZybk4+W
X-Received: by 2002:a05:600c:548f:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-483c9ba7c15mr217207145e9.9.1772467283762;
        Mon, 02 Mar 2026 08:01:23 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:22 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 00/10] spdx30: SBOM enrichment and documentation
Date: Mon,  2 Mar 2026 17:01:04 +0100
Message-ID: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232209

This v5 drops patch 07/11 ("spdx30: Include recipe base PURL in package
external identifiers") from the v4 series, as it is now superseded by
Joshua Watt's commit 874b2d301d ("spdx: Add yocto PURLs") which already
includes oe.purl.get_base_purl(d) in the default SPDX_PACKAGE_URLS value,
making the separate patch redundant.

All other v4 patches are unchanged. See v4 cover letter for full context.

Changes since v4:
  - Dropped 07/11: "spdx30: Include recipe base PURL in package external
    identifiers" — superseded by 874b2d301d (spdx: Add yocto PURLs,
    Joshua Watt, merged to master Jan 8 2026)

Stefano Tondo (10):
  spdx30: Add configurable file filtering support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Add ecosystem-specific PURL generation
  spdx30: Add version extraction from SRCREV for Git source components
  spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
  spdx30: Enrich source downloads with external refs and PURLs
  oeqa/selftest: Add test for download_location defensive handling
  spdx.py: Add test for version extraction patterns
  cve_check: Escape special characters in CPE 2.3 formatted strings
  spdx-common: Add documentation for undocumented SPDX variables

 meta/classes/create-spdx-3.0.bbclass |  20 ++
 meta/classes/spdx-common.bbclass     |  63 +++++
 meta/lib/oe/cve_check.py             |  37 ++-
 meta/lib/oe/spdx30_tasks.py          | 329 ++++++++++++++++++++++++++-
 meta/lib/oeqa/selftest/cases/spdx.py |  75 ++++++
 5 files changed, 518 insertions(+), 6 deletions(-)

-- 
2.53.0


