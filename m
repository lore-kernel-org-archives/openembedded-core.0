Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D13BC52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 12:36:15 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.82860.1723206972295012656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 05:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=wpL23zuw;
 spf=pass (domain: baylibre.com, ip: 209.85.221.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ef33a09a3aso753887e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723206971; x=1723811771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u4mVavkB8nSAGIKXCF5L8P7wY/watCMsZvUtMdFBhKY=;
        b=wpL23zuwFOc0PswVBIXVo4HtST/e5JwhjGeLx7ldR4ROQsAahY38n2yKy8viHSmPe5
         5o+CF313H3q65ClIuOPL78i6mdNRe0wyRW/D80x7/U0rya+KyuiK7wtsciQSz5DiDxW7
         PTDsCoXTeSTJ8kZ//Bw0VGt1E3bc/1IjOQu7jmE1Yhj1hH6AZ7qX6UuNvbY/rHAFf5/m
         8uYXEfPvtbbBw0jmAhjA0nFV4S+PRCyWpoSwr+0g7L5xZgRo5WoD9cV8KAUy2KklN1FT
         kPaed+CD9YAOSkkc/Z3B6fQDq3vHQgoIb8+KKEhq4xvU087InOFIvKSDhY0PTd+KxywI
         dK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206971; x=1723811771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4mVavkB8nSAGIKXCF5L8P7wY/watCMsZvUtMdFBhKY=;
        b=gELZKZ9ZOJSOR657oUmFa6MZo8up3DsuKZk0uF4Gtb6oFwzQ0PGzm90EFEhsosNIuE
         J96l8IbY+4SYE3mNcKnRs5Gbgi5N1MOj5GiGkOHovpEHQxLGk7Qx8E4yf+llPt/fbuun
         rNTl1Tt6bDdNeUF409UVvRlkYwLkG/wtn95RCEgc3ZFZeSPGbrHOkC56vm1EmoR58vdK
         EhQOjJtegyOtE5jF6wvLRNN6dJj1qQRpkvOC160paJ58xjjGWm4d7ropx39lAA0w6q9j
         jWM1NN7ql76brfdUOjeWY47S+CTnVoIIX5Z6XRxoZoVHOMZDfsJIuUNE/Lb1MaEymH9M
         IR9g==
X-Gm-Message-State: AOJu0Yy89USqtZff53flE5DlOupxWtn4/FhFFVG7RSXWG4JgCVoTPnOM
	bhA17/I5Q0Bl3GoYUYrH9kzCJYRAn0Zlh3E2nUECs2D3eIHzPolypOoTSK3Jt2NNk71rKPlia6x
	y
X-Google-Smtp-Source: AGHT+IHD0SQ92ZWFUvMkFmgbCuewy4ZAgARcX/oUd4BNMBW36sgBQMjLWp7qtCV8hFBJbQFFb7lnyA==
X-Received: by 2002:a05:6122:507:b0:4f5:2276:1366 with SMTP id 71dfb90a1353d-4f912bd9997mr1393902e0c.3.1723206970968;
        Fri, 09 Aug 2024 05:36:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785ed053sm255862785a.54.2024.08.09.05.36.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:36:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-cython: upgrade 3.0.10 -> 3.0.11
Date: Fri,  9 Aug 2024 08:36:09 -0400
Message-Id: <20240809123609.4107749-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 12:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203171

The upstream package changed from uppercase to lowercase in "Cython", so
adjust PYPI_PACKAGE and the sed call in cython_fix_sources to match.

Changelog (https://github.com/cython/cython/releases/tag/3.0.11-1):

Features added
--------------

* The C++11 ``emplace*`` methods were added to ``libcpp.deque``.
  Patch by Somin An.  (Github issue :issue:`6159`)

Bugs fixed
----------

* The exception check value of functions declared in pxd files was not always applied in 3.0.10.
  (Github issue :issue:`6122`)

* A crash on exception deallocations was fixed.
  (Github issue :issue:`6022`)

* A crash was fixed when assigning a zero-length slice to a memoryview.
  Patch by Michael Man.  (Github issue :issue:`6227`)

* ``libcpp.optional.value()`` could crash if it raised a C++ exception.
  Patch by Alexander Condello.  (Github issue :issue:`6190`)

* The return type of ``str()`` was mishandled, leading to crashes with ``language_level=3``.
  (Github issue :issue:`6166`)

* ``bytes.startswith/endswith()`` failed for non-bytes substrings (e.g. ``bytearray``).
  (Github issue :issue:`6168`)

* Fused ctuples crashed Cython.
  (Github issue :issue:`6068`)

* A compiler crash was fixed when using extension types in fused types.
  (Github issue :issue:`6204`)

* The module cleanup code was incorrect for globally defined memory view slices.
  (Github issue :issue:`6276`)

* Some adaptations were made to enable compilation in Python 3.13.
  (Github issues :issue:`5997`, :issue:`6182`, :issue:`6251`)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-cython_3.0.10.bb => python3-cython_3.0.11.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.10.bb => python3-cython_3.0.11.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.10.bb b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.0.10.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.11.bb
index 86ae5f25e9..6e1f599aa7 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -6,9 +6,9 @@ and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
-PYPI_PACKAGE = "Cython"
+PYPI_PACKAGE = "cython"
 
-SRC_URI[sha256sum] = "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
+SRC_URI[sha256sum] = "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
 
 inherit pypi setuptools3
 
@@ -45,7 +45,7 @@ cython_fix_sources () {
 		${PKGD}${TARGET_DBGSRC_DIR}/Cython/Tempita/_tempita.c \
 		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
 		if [ -e $f ]; then
-			sed -i -e 's#${WORKDIR}/Cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
+			sed -i -e 's#${WORKDIR}/cython-${PV}#${TARGET_DBGSRC_DIR}#g' $f
 		fi
 	done
 }
-- 
2.39.2


