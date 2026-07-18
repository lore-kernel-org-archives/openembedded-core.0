Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C96C4451B
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 17:48:22 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.767.1784396897024574598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 10:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MFvbaVZU;
 spf=pass (domain: konsulko.com, ip: 209.85.214.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf52d15d88so2566975ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784396896; x=1785001696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlZ+HW6IwiLkHzCgqF8hdepG5DOIc4k4M9fu85BC55U=;
        b=MFvbaVZUr9RldedtZjXgrtr8FRTxotxjFgujK9iL/Sn+g8UwLZLR2oz3cBOdGd5em3
         ZSot4ABz0St14xeLpyFDeJcpT6MNZqDIARdxWAsg4VYN1PIhl1B6ZG2oLmY5Z0X52Q6v
         Q23rfqnG2dz2zdmzGKHsSIfWdWgvv5B1kCbn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784396896; x=1785001696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlZ+HW6IwiLkHzCgqF8hdepG5DOIc4k4M9fu85BC55U=;
        b=UXezGjA8p6xqWhJMy4O3uP3MdV/SE4mz0ibNlrwyBNE34Dt6y8B7DDqISMCoPj2hfs
         oMf/iixvCcb1c4AYmmKR07vTbul2LQJ8ez0OcAwlmJuidC1m8mjgMWHazofOmvSh7232
         1MoHxFideRabztaahgrkS5cAZThBd240U9g7yKAfHWn/mdEyFgGq89kDQ3ainoWN8nga
         Q20JvzX4Qx5cbtVhqfWpDSgtqyUTeqGFrAQV5UeLQzhwA4Y8PN/85zW7ADGhcB12Taas
         uzR8oPNl/NnzMl5SBiOqmCCYK3scZkT+//oS4D+WwH2dtq8cSnsMEuPos7A3TuFvfvSO
         0u0w==
X-Gm-Message-State: AOJu0Yx/r3OqtIF5T06D61UoH6Dl5mxX2KI4kBdKuN5/fZE6MctnvAdT
	kRwde24fJVQpUSMCe2rcvOy2i6GsCjm6NnrixpFWq2LpUBEYLrQLdJKw/WftshYCqsQ3Mpx47hS
	UwqpK
X-Gm-Gg: AfdE7clZO7HLEjDcHzBMXHBFrYmKZMbibpjqAaJCa/+DzHE9tKivzm2vfEvOlooVuCG
	6joJf/reweGuytH4j2qesEDHALXOIdyq9o+EoggDY05cMLnxHhIsRxmo3DzQgMFxtN+4J8ms4Mr
	cP6OK9uwWa6JGdnWGfhceTH9bNaKT7arbPn84/uM3w27oph+HDZdDtbdul8aYHLj2AiNw1Qrxzw
	ZF2Aq3t113yQJwsJZzLZhmPfzaRoa2Bcp/9rbSzLODPbnWxl+VZ4KJaYxoC0lR/4K7E6TqFas6e
	XBnGO8cbCk8r5fdQwC0nvyYoePz71tLljCUq2G8FEIeVZEy6uz/9i5O1rtf9J2yhDtZpm7yCSDq
	ZxNxFMY7SUlA7JFEW5hjIfxEmzV9cXtduLQ/YZgsWQfbjnHdVo5OeSYSXjtxlKvYdIQmVIeQKCR
	fR4BADVOZFvJqxwgw2kH4EIkd6Sz9odA==
X-Received: by 2002:a17:903:1a2e:b0:2c9:97a8:aff0 with SMTP id d9443c01a7336-2cf349f5bfcmr82321995ad.41.1784396896360;
        Sat, 18 Jul 2026 10:48:16 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:ab5e:7eee:9312:fd2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3474d305sm29581335ad.72.2026.07.18.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:48:15 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pyasn1: upgrade 0.6.3 -> 0.6.4
Date: Sat, 18 Jul 2026 10:48:10 -0700
Message-ID: <20260718174810.1890741-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 17:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241268

From: Tim Orling <tim.orling@konsulko.com>

Upstream release notes:
https://github.com/pyasn1/pyasn1/blob/main/CHANGES.rst#revision-064-released-08-07-2026

Revision 0.6.4, released 08-07-2026
* CVE-2026-59885 (GHSA-8ppf-4f7h-5ppj): Fixed quadratic time complexity
  in the OBJECT IDENTIFIER and RELATIVE-OID decoders. A small crafted
  substrate encoding many arcs could consume excessive CPU. Arcs are now
  accumulated in linear time; decoded values are unchanged (thanks for
  reporting, tynus2)
* CVE-2026-59884 (GHSA-m4p7-r5rc-7g4j): Limited BER long-form tag IDs to
  20 octets (140 bits), matching the OID arc limit introduced in 0.6.2.
  Unbounded tag IDs allowed a crafted substrate to consume excessive CPU
  and memory; longer tag IDs are now rejected with PyAsn1Error. Also fixed
  Tag and TagSet repr() failing on huge tag (thanks for reporting,
  mikeappsec) IDs due to the integer-to-string conversion limit (Python
  3.11+)
* CVE-2026-59886 (GHSA-hm4w-wwcw-mr6r): Fixed excessive memory and CPU
  consumption in Real.__float__() for values with large base-10 exponents.
  Conversion no longer materializes huge intermediate integers; values too
  large to represent as a Python float raise OverflowError promptly, and
  prettyPrint() renders them as '<overflow>' as before. Also fixed base-10
  mantissa normalization to use exact integer arithmetic; mantissas larger
  than 2**53 could previously lose precision through float division (thanks
  for reporting, gvozdila)
* Pinned PyPI publish GitHub Action to an immutable commit

For full comparison of changes, see:
https://github.com/pyasn1/pyasn1/compare/v0.6.3...v0.6.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
index 60b38c57c5..086a21ffe8 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
+SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


