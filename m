Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4E7C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 13:53:16 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.84527.1723211590717115060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 06:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Y0izA7S7;
 spf=pass (domain: baylibre.com, ip: 209.85.128.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-65f9708c50dso21862497b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723211590; x=1723816390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cEOwfdT90eI9Jw+S//OGpoL9YxvcDy5BYAs1F3KD/bI=;
        b=Y0izA7S7fwO4TkKzGtFpaIYjC+zY7wp7r3hq1iqudhZfPsLyfFz1Oqt+iRQItHAQZB
         tq3gsZ1wfY6wE5i3SWu6arXtepHc1hLOIYd6OYVrdvIGpoqi2u7JrmHycMl36+5bspa5
         pF6No5N0ECVBfHcPmECOeoPXXoQfqn1HsPNSomXQH53X6rNd3aAyPqzIC0aDs63mmMlh
         0l2hiljbUpOM3LZ0coQVK6KL9n6+HTZ/kaWdCVvjFsDEgxGPGfHAjyCZjjEJEQJx18pF
         iKAjTg9bTSkyleKVo96pQe0xCdBJ4XyX4JMkBe+BaLQ3MD6GQyApZPjLTPjuzYrIB06c
         McCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211590; x=1723816390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEOwfdT90eI9Jw+S//OGpoL9YxvcDy5BYAs1F3KD/bI=;
        b=qa762BJuDcXZLSBMADyCH0AduJp0Pf3uXZ6xe3e2qx3mg+m5br8mzlkyL7sLXr5NHb
         7DVSceyf9FP3UCiplkscGYS7bX1mVFCwYsPsoDlO/IPq8yMr968OZHBs0uLlsolMupjv
         9Bt+hHxrQtOvIBJZ8AiK+KKOvGCSuL2RXCWlOOGRwuLjItD5deZU8AYukR50ms1ykafI
         X1Bf2SiY8/nI/OP7TP90DeNVuTG9KBANAyLnjWT0cIw1qh24NyxrevjvD/vC8N1ytfRv
         dcBFwCrehHSsk4Bb8DlUSk7tcD3pH7z0CRRsNsTxmaskC9D86tHoyGBJtUU1gqRU7Bx2
         FFzQ==
X-Gm-Message-State: AOJu0YxviG4Lkdl5TmUcutja8tMtzXLusX9RMGJyvYNhNUiVIEG4DL7p
	BQdl0Gn6EDiq0qxMM6Y2YkvZuXvmfVC9OeJOVhMX405ZmMhWVWGezsKQtVbM+RTBKwfRFadfJsB
	d
X-Google-Smtp-Source: AGHT+IHdF3xn+Gvq6AiTEu8/gDqamgu6O9I2jFM/cLb8mKg7Q66nu0RL6oXlDJhmprjAiEwVXfGyeQ==
X-Received: by 2002:a05:690c:2708:b0:665:b876:e35f with SMTP id 00721157ae682-69ec6220f8cmr16662157b3.22.1723211589520;
        Fri, 09 Aug 2024 06:53:09 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a378694e6bsm263616485a.79.2024.08.09.06.53.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 06:53:09 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-cython: upgrade 3.0.10 -> 3.0.11
Date: Fri,  9 Aug 2024 09:53:08 -0400
Message-Id: <20240809135308.4129075-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 13:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203174

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
v2 removes the PYPI_PACKAGE variable since it's not actually needed for
the new upstream package name.

 .../{python3-cython_3.0.10.bb => python3-cython_3.0.11.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.10.bb => python3-cython_3.0.11.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.10.bb b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.0.10.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.11.bb
index 86ae5f25e9..2923664641 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -6,9 +6,8 @@ and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
-PYPI_PACKAGE = "Cython"
 
-SRC_URI[sha256sum] = "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
+SRC_URI[sha256sum] = "7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff"
 
 inherit pypi setuptools3
 
@@ -45,7 +44,7 @@ cython_fix_sources () {
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


