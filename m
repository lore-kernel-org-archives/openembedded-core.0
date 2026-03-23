Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60BFF46101
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:04:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16987.1774271039803083249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NJSRgfqi;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fe655187so37214375e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271037; x=1774875837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LePNr52mOEX9tKmVFPBx+wtMgouldDccOhS3+j3bV+E=;
        b=NJSRgfqiUUEpuFXNYpm+FJH0nncwBZZ9Uh7YwC6fHzp6uxV2HGp4m/p8HpbTxpNkpt
         2irQ4c2ucN1ZQbZ6J66RgoX2EOQqHrSSCoOwmI0tQwy05dE8T/yenQUF+rpufmIV7mIX
         1BYD5QqXaVjsROcGN4O6MbUv2Mw79HW4jn61TKYvkAcgf90eGNCY5fUFvHR/Z5YeFbrn
         Mbf9/nP5tZw3U8TxJMNm5NlWXnvbRR1VIUl8hvLpWw/nmybLavw1+aBtlC1kXO4popcE
         lzhiwKDS+8CRzO36UVcORDjgmoZwcKSKBm3SCD5X/sy7uf4NRd5v8Tlc8Atl4qSFDG4v
         uFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271037; x=1774875837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LePNr52mOEX9tKmVFPBx+wtMgouldDccOhS3+j3bV+E=;
        b=qYdS/x49K0KigKBR7iD69X+pyWmYpqCo/QzCIdoo13p465XgsJPsEnPwWLBOzjk/YY
         4EcRc0tAft/sGlXcQvGz480ilIJn3acEbIXPvL1vJWVx6vM+dW5JCnc1VD3SAx8AD3bd
         emWPkLGQcmAS2K8q77hfxY+Br9pctgekjJSESSP+ps295ZvpafdB96cxAVLMKhFj+EB8
         5Z1lmYn3yDBhM6VRxmZdz0G+U6YygANkHPSWLTnVV7qe0TESa3+uPpIjFL3izNQjJYT4
         qx0ZSO/NDOBAFuEq5L346Ticyfft6DsHgLI6xjWHGNYu2dArqkM7txeuIPn/wChhgD6I
         BTqg==
X-Gm-Message-State: AOJu0YzTqyEutcMNmxNdTg8j+YYgI6nO6kvtQaY9H10893LAXbv7o4bx
	ru4XiHCyPuZHL2S5slfXpHHZlsWujdVuFjyDwzIB6ek80iaippX12GPMor8oP+zY
X-Gm-Gg: ATEYQzyNAardqQv08ep/agw9b45vH6An/8HPhBLPXnGdGyoApJhveZy7N3VO/44kGOi
	1puGqgSoPe2LJcqyHtHAsnZ7zW1KKYvFm99HJqhDPDgRcSFFPn0qafr02obKtQkPUpG+XvmHdnh
	M5gAJSaOWZeUteMvkNX5wLMRRXnPN4+NwfNMp1bKAfMlffDLDggZ9pvyIAoUfbyKF8EKn1o9x1/
	uvACgn2qraOnn7E7kHCZAQ5PTAsDNZYTPpft15gajK5rvCOmZcNlHrJQR1nejGLYkOZb1JdSBlK
	mYij9AMDHXTMUW/69VDDDpi1BLD1ap+d8ZMwKZNLUAVtyaI16W5z1zZJueXlZpArebEAznyBetR
	8+B40kgwXjYKygQEG8xxtRdDEaFBm0hnDSleQGQbwnoHLDKJn+hbNO1MtMmiZ+W8WKhKc2xYiCx
	9loxdgQq2YfAPaKZOBm377vgl5e6f9fu+bscurPw6aRPTNNSbR2sBZ
X-Received: by 2002:a05:600c:8207:b0:485:3ff1:d5c3 with SMTP id 5b1f17b1804b1-486febb449bmr164779515e9.5.1774271036897;
        Mon, 23 Mar 2026 06:03:56 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm324609665e9.6.2026.03.23.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:03:55 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v12 0/4] SPDX 3.0 SBOM enrichment and compliance improvements
Date: Mon, 23 Mar 2026 14:03:46 +0100
Message-ID: <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321131826.1401671-1-stondo@gmail.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233713

This series enhances SPDX 3.0 SBOM generation with enriched
metadata and compliance-oriented controls for current master.

Compared with v11, this reroll fixes the follow-up issues reported in
review while keeping the series content otherwise unchanged.

Changes since v11:

  - Fixed the rebased collect_build_package_inputs() provider lookup to
    pass direct_deps to collect_package_providers().
  - Converted the new cpan.bbclass Python helper to 4-space indentation
    to avoid parser warnings.

Validated with:

  oe-selftest -r \
    spdx.SPDX30Check.test_packageconfig_spdx \
    spdx.SPDX30Check.test_download_location_defensive_handling \
    spdx.SPDX30Check.test_version_extraction_patterns

Stefano Tondo (4):
  spdx30: Add configurable file exclusion pattern support
  spdx30: Add supplier support for image and SDK SBOMs
  spdx30: Enrich source downloads with version and PURL
  oeqa/selftest: Add tests for source download enrichment

 meta/classes-recipe/cargo_common.bbclass |   3 +
 meta/classes-recipe/cpan.bbclass         |  11 +
 meta/classes-recipe/go-mod.bbclass       |   6 +
 meta/classes-recipe/npm.bbclass          |   7 +
 meta/classes-recipe/pypi.bbclass         |   6 +-
 meta/classes/create-spdx-3.0.bbclass     |  17 ++
 meta/classes/spdx-common.bbclass         |   7 +
 meta/lib/oe/spdx30_tasks.py              | 278 +++++++++++++++++------
 meta/lib/oeqa/selftest/cases/spdx.py     | 104 +++++++--
 9 files changed, 345 insertions(+), 94 deletions(-)

-- 
2.53.0


