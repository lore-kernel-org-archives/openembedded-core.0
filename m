Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD18CAC5AB
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:20 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1269.1758300498462453921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=D3zgSWn7;
 spf=pass (domain: baylibre.com, ip: 209.85.219.68, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-799572d92b0so11095526d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300496; x=1758905296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaZ8m7hwqv+x6xMNP9683+fwvagaelJH6kXgIzvTNsE=;
        b=D3zgSWn7Xcb0ejYG/aXzqrpiXPPFqnOqkC4uouAkKUTNDTEnt8Tjh2IYk3Wb2imKun
         OKDJgpTwuJjpt+C6UAjaElxb1IlejviJQZqAUZ4Jzuj1RB8gddur3il2m8eQGeqjotOD
         cyLcZZGxxuU+PcFQ2mPebVezIVdi93geYqkeY4vlY+lcOLey/4Cqw3hkNUDt8zenUatW
         H6J2YjnjSiZsJHP03Wz1xo2lOKJqzMXJaMWoBPLZbZ9MWeofb1CTISWxvfFW5pKZkoL+
         a7F2lYDn2if4DxyEQM2O4Nd8nmNU0yxmTB1lpzAAGRZ0Lzs0DSIDY4CBve/cw/oxkJX/
         Ulew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300497; x=1758905297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaZ8m7hwqv+x6xMNP9683+fwvagaelJH6kXgIzvTNsE=;
        b=MNgRr0Dc/BYSLAN/gBRZUowihl7cmhJbmfsTl/Wc8eVBc2H0QarD5kke5UC0bXe7U/
         cvSxVxjN3TrYvdGWSm1owmJFR2ojCBwgvmf1UFVcjyPtXhbDwB7MXuYz88HcC+7DgNC6
         503xRc5WpSi1pNXOgWb7DGrNNwM6SoIEqH9UbHFvxwDYM6xeMgUyPg6BX2iy0h2MM/p6
         rgYbGBkmloIEiaiDII9Oz5M6/obUnC5vjw3OfYhzgYglztccf7+gZ0suE/LUIkkP5AWO
         gmfTAtn9PDCXjuwm7Xd1/ZNkNSdf3UHZwjaqkzWVaOpAqEZXHzU8ifyKGCOlfW9a1d0P
         8q8g==
X-Gm-Message-State: AOJu0YwyAHavKg915wUnlDS1JxXYaxszIVhOPxf9o47+9F03fCY5kZv8
	Bt+QrjElzk90Ukxb9Lxp24BmPvt7lCbM0KQHogn673zDflim8o6dM9/1n5nYU0bjxxCAR16I9i5
	t+PjQCouJPg==
X-Gm-Gg: ASbGncsqEU0YxMpUmpefRfYN3dVosWY1NJg9RpgRC4ZeTL9/U82GgiPWZ8oB4sa9iDQ
	N2RruLEZFi0/TXCnQ4J3AJo0UN4m07+Fes6XrPpjOXQwN7wM1n1WtY3Y9wsf+7hqjlKyVas/7xY
	nYtro6jZRk6WN9TJkw1O6cgWvGz0uB4p8x8MNoAnb3Jyf0QtCLEZ8TRH2QAZKe6yAqMLj5la3U2
	MnJhvMW4rF0bAOchcV32bjspNUWNzQI5Nt16NPkcOEjY1J11ltjrm+vgPTMMbsc1/IGtrFL7uMy
	NMUyehtOBprVTqWvrFlZPAFnqlt8dY+L969vPahy3pUFW2szGGMD6glYw/L6a8dQ3GXM14nPNUv
	p9CUf5JkRdG9s+colhOcgcAnBHUhhHf4x8Wq+B6e4+QQS4x5OsFofJL99DTG0UD/hLaEs
X-Google-Smtp-Source: AGHT+IHDCovS3GeysteH92mPU+M14ra/kgtWS8uT6oyCHvYOnRGsimRP2Ub3B6TrnL6Ll4oDtWvSdA==
X-Received: by 2002:a05:6214:2466:b0:731:8886:1866 with SMTP id 6a1803df08f44-7991ddecademr40869676d6.61.1758300496351;
        Fri, 19 Sep 2025 09:48:16 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543fdd29sm31670366d6.55.2025.09.19.09.48.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] python3-pyparsing: upgrade 3.2.3 -> 3.2.4
Date: Fri, 19 Sep 2025 12:48:02 -0400
Message-ID: <20250919164803.3174518-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919164803.3174518-1-tgamblin@baylibre.com>
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223764

Release notes (https://github.com/pyparsing/pyparsing/releases):

- Barring any catastrophic bugs in this release, this will be the last
  release in the 3.2.x line. The next release, 3.3.0, will begin
  emitting DeprecationWarnings when the pre-PEP8 methods are used (see
  header notes above for more information, including available
  automation for converting any existing code using pyparsing with the
  old names).
- Fixed bug when using a copy of a Word expression (either by using the
  explicit copy() method, or attaching a results name), and setting a
  new expression name, a raised ParseException still used the original
  expression name. Also affected Regex expressions with as_match or
  as_group_list = True. Reported by Waqas Ilyas, in Issue #612 - good
  catch!
- Fixed type annotation for replace_with, to accept Any type. Fixes
  Issue #602, reported by esquonk.
- Added locking around potential race condition in
  ParserElement.reset_cache, as well as other cache-related methods.
  Fixes Issue #604, reported by CarlosDescalziIM.
- Substantial update to docstrings and doc generation in preparation for
  3.3.0, great effort by FeRD, thanks!
- Notable addition by FeRD to convert docstring examples to work with
  doctest! This was long overdue, thanks so much!

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pyparsing_3.2.3.bb => python3-pyparsing_3.2.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.3.bb => python3-pyparsing_3.2.4.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
index 459b01fd94..46556e6fb8 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.4.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
+SRC_URI[sha256sum] = "fff89494f45559d0f2ce46613b419f632bbb6afbdaed49696d322bcf98a58e99"
 
 inherit pypi python_flit_core
 
-- 
2.51.0


