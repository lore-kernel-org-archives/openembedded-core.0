Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8966C61DE4
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2989.1787945906452566699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aRMujyeF;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12677925e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945905; x=1788550705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xy2QrYVs37Jyb+QvuFh8md+cNfgIISqOv19SwwKpblI=;
        b=aRMujyeFelCH+DJMtsaP+iBmz8WzxwpbXqj6CW4StcFHoYdVDDcIw7lrz5ZDF9A+SM
         Ox4Gto+jJHyTbeH6dOXOQEFqlNU+psoEjNJt4ikchrI0CHkF+uaR4kpLJ9W1uZWlzBVW
         ivJscBVLJ9ZOE9omLabxjHGMJtPwOt9Wphu+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945905; x=1788550705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xy2QrYVs37Jyb+QvuFh8md+cNfgIISqOv19SwwKpblI=;
        b=oA1g1y7L7kfn1iWVQvpWSnKC6ixdIQeIlY5pMqRidyJpFaaEPv4G0CBDX5vfrqNFvr
         UsZr5YlVqqetKzmVOAOdqbOYE10kHMIgxyPzxq+bht0tauVqsyX2BDFZo7dUa8LAKGY9
         uteIW7ljvTzGHRIom8nlEKg3v9rfkGgKhkgHv7EPb1fUL3bcw1k9MSm9Onw1AxShcRRj
         1Mr/QwIcGG13ayoKJYDN0ua3epSJx+WmhoUZCmtgmZoLx2zQT+lU4bElYo+lL5QYc4EG
         VVTweE2txvbQFpT517FMNzTQgT5zQ9pMCTMgt2f7/R6TbXH/41D7ZPhCGjXill1RBmy1
         vdPw==
X-Gm-Message-State: AFuF++mXYeoV157JtuTkgDtnbXCRo7oCWb8e0INaGJVRcpJl0xLT+czR
	pFgKWr5jqBS2r4iXSvOxJd8JcV2GyQCnxxj6JtEzCQRsQoPvjLIk6gHEZ8NY/E+yNXdtVLKp/KV
	1iX7/8e8=
X-Gm-Gg: AR+sD10KhXorU0R8c1KGWh7bdQuSNhgpY8lUjcFgcgTzKtKtMGsNx8lUdaZOPIou4Bu
	mLutlChD/7N8FQA86tdzcuzuREIsx/O6sqCMNPgMRtyYXzOEUutsudLon8KF0iIVt8dbFRDlPok
	VQRuYjJn8T7dKVFmqVl1MuoIVLVHAY+Ro1wOyU2saQa8TlnrqArUf2qKwv42zepVtQghef5LUNQ
	5DNd4TBjed2TtQdQioFFqVQya2EphzZUMdYBT2awoF0UyUThfdbXqFHOhund/H6BuF+lopoj95n
	2YjjNsp720Vw/bd0AZngZmBXisc+2XYyjd7qbFkqB3TN17HVn+qsFeGDpMoDGpdbjL9mu4dmN4N
	AyabguWjD5wf2FOCPBjo0PgvVVfy6aWv6UO0k/SvS7fwUYHR0a4bkNJ9aI0sjVetiZGQiJ6YlGa
	aGs40xuzF758Cx8Sms7egKlOWya3RND9vjUYtjTZTf36XJT49rNw+oJc+ij8sYLvU32Qw2NtLN4
	1OIBl9SapfutqSgKWqwda2BwLA4pjxzpinOGNKLL9vrPqrgZh8qHI6CvhNGL+mD
X-Received: by 2002:a05:600c:1c02:b0:499:8ff5:8ec4 with SMTP id 5b1f17b1804b1-49b91c2e11dmr154363425e9.3.1787945904714;
        Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/56] python3-pyasn1: upgrade 0.6.3 -> 0.6.4
Date: Fri, 28 Aug 2026 21:35:46 +0200
Message-ID: <a37fb17794a9f79977f4ebcc6e7228bcce7b32cb.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244597

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3654efbe3e732b0ae0f44e4c71c2473e719f83ef)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.3.bb => python3-pyasn1_0.6.4.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
index 60b38c57c55..086a21ffe87 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.3.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "697a8ecd6d98891189184ca1fa05d1bb00e2f84b5977c481452050549c8a72cf"
+SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

