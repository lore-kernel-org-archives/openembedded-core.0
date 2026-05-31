Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051D9CD6E56
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16956.1780186695885241586
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OmO1k1TN;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf20f6be6bso10658895ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186695; x=1780791495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICRqI/yHgr3+AQ3hmdhFrw6BgQKFMbHmGmi2gltUaII=;
        b=OmO1k1TNWju44zEjYm0AJh5TCpLTMYBcZIFyzX25KIgtcqPPh+lLP1LgiR4RfoGQ6w
         z9TAaUCy+GCLdw3OrfgHIff3d/17ZeHc6e8kYsBm8JwDLCgsksFrgeM2IiL4GYSD/0y+
         3/dZtm38th802hI1OSIPMcbq8PZDBAKkPd+9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186695; x=1780791495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ICRqI/yHgr3+AQ3hmdhFrw6BgQKFMbHmGmi2gltUaII=;
        b=ZV/xyEGQOqwgHHEKuxg2N1h4aPRf03Y/+eRxhXcd4fdTgKS9UTKCHbpdrNxePzkTd9
         LlV4d1bjs1L1fvTWbTyfjY1aLfF4TV0yhB2sH8AXRxi2tVNIRPstoY9Rt3JI5yc0k93j
         q7fzesvbK6QR+HjAb5yk1/DgnpSjVAlHCnAK+ei9eEuZOza7vjZDLTDcNpZy0YYafptY
         3OL8n30IV9cM8jJZRmftHfmexf+2OVxA4ikehmO4uTuyTB1vO/2fHokt1idDFOF4/TXx
         32y8FilY8TKky0M/uRqCWE4Yj6NxdqyiPB2HPU0cIOJW5p51F/VEvi0no2Sxwq2jcvSZ
         cyTA==
X-Gm-Message-State: AOJu0YySizhwbfd9faHmaefLicNLhXC29DUJywatwSvDUBeNrUhSdSPM
	w4ZAtaQO2uUMSD5bmGy0/Ra9R3NkC0Cw4aBP88K4oBvlbuMSuc1R9ezsC2sjDdIbcRH5ovFgy6P
	Qk67a
X-Gm-Gg: Acq92OGfKelIAi0xxJn0wnR9abiBv/Un5cFIRefDZI1dFgs7ZEY1ls0cXvLh8Ge4lbA
	5acUc1M74w0E8DldbcoKruqcQk529W3mV5lIC01w+NDU9kg8J2thEJp+mi5wADgwatgM+FUT4Li
	bKm3s38uy8xRSFHAG2eMsg97x6juAyhqM5HSvg2fINksyiWU6z8ahntBh6D0qg2+6FrepY5KLtX
	2qa6dCJqTSKVxQ4gPG9tEurQ5FyII8H374zatlPz5lGphx1cbzwEDLigb/ivJKO2dIRLXxcfvjM
	aegPZAhYzw29Y4i/wL1PGmuZmsVEX9gFTMulXy0oQlFD3sO4z1Sprn9cIxeDjC8NTrbJQ7TyXy0
	rqpGWhS8iunEnEmtxF+fpCG5nY4qajPxhxwKDgiBoIZBGoCjVLs/x0N2vIN2pZi/Mv0HlwkixPq
	wSeY+okA4Kcxr3SFsn3C6mE4QbIcOR33eZKS2xnnzJ9AuPKZx5l9mV5pPmI6kVyU/uMENlt5Hmz
	A==
X-Received: by 2002:a17:902:e887:b0:2c0:a746:7aff with SMTP id d9443c01a7336-2c0a7467f47mr45699925ad.24.1780186695270;
        Sat, 30 May 2026 17:18:15 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm80447015ad.10.2026.05.30.17.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:14 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 5/9] python3-pytz: upgrade 2026.1 -> 2026.2
Date: Sat, 30 May 2026 17:17:52 -0700
Message-ID: <20260531001756.1582306-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531001756.1582306-1-tim.orling@konsulko.com>
References: <20260531001756.1582306-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237784

From: Tim Orling <tim.orling@konsulko.com>

git shortlog:

Fullchee Zhang (1):
      fix typo

Shaun Walbridge (1):
      try to access resource using `importlib.resources`

Stuart Bishop (6):
      Bump version number to 2026.1.post1
      Update test runners for new Pythons and github actions
      Squashed 'tz/' changes from dd6be6d155..8be0d5483d
      IANA 2026b
      Bump version numbers to 2026.2 (IANA 2026b)
      Bump github actions/checkout to @v6

Stub (2):
      Try to access resource using `importlib.resources`
      Fix typo in README

For a full comparison, see [1].

[1] https://github.com/stub42/pytz/compare/release_2026.1...release_2026.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytz_2026.1.bb => python3-pytz_2026.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2026.1.bb => python3-pytz_2026.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.1.bb b/meta/recipes-devtools/python/python3-pytz_2026.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2026.1.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.2.bb
index 0c9e1e7a4c..1365897d85 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.1.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "10413c35476919b4c07bda6b9810c6e24d914378c430070bdb1869e18a37eee5"
+SRC_URI[sha256sum] = "0e60b47b29f21574376f218fe21abc009894a2321ea16c6754f3cad6eb7cdd6a"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.43.0


