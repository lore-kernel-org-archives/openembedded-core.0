Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F135C55196
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4378.1785794576532324649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RgcK6lng;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026080322025436d350ff5f000207a5-kdvrzv@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026080322025436d350ff5f000207a5
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:02:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BTR8JfofwhniYvsUjbiH/kkKYOxh2SCwGWDURJVwhL8=;
 b=RgcK6lngX+WKODn2syBY/bQxa9fSvzWilFXy9FyrfR/9RJir6Uhha4k70gGQh5UFhr7Kkp
 Vy1WZrbHzaNz6xwNac5svCKakPXNZzf5YNUN1qbKSVE1WslLDhY6UxBPaNds2fg9hgsFOMcp
 ryMFXaYKfqIX9ys890crf9swFaHvxIm4BDalu4EJwcrYxFF5Lc5ywWIaD4MmOXMV/uuyfkcd
 tVeYJxQPAkwTwjCd1WxsJonAgQrh/oS1EM4alpmow0FpJOl8gg76807uAMnKOuceb+8gZAva
 ozUZJ+psVr01JzFbBFU4anfCz+wYdv3ya93r0ZRNFUSChYeTswdlcbbw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 09/15] python3-pyasn1: upgrade 0.6.3 -> 0.6.4
Date: Tue,  4 Aug 2026 00:01:49 +0200
Message-ID: <20260803220157.1520377-9-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242665

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
 

