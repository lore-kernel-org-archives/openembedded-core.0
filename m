Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD20CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 14:25:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8412.1791901498608551111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 07:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xqhj9vqH;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16c399641so30684605e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 07:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791901497; x=1792506297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7VJUZucChJniw/zS+4q0bwzdTChRC1vMkm1d8k1UEI=;
        b=Xqhj9vqHoWszvcx8XLvL1JkZTl8NHKa37IfZ2IMrq2/Csb3w9Gliadu2cmOJ5rVv0X
         p8cC4l90Jvl2+dByOvPmerhPnPR6n929V9sL1zY92cHpXePqOkW6oairhReEIyeCSoMh
         hHUgj8t6SBEJTjMWKJ74Sev+/JzBSGLnROEqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901497; x=1792506297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G7VJUZucChJniw/zS+4q0bwzdTChRC1vMkm1d8k1UEI=;
        b=F1cF0cyMINIsUaHRqhjqVxKlgdz8+2pnpcjpzE8AA6nwXnugV299eWkN6yTK4sU2Bj
         shnkQG8OQAz38G0XpIc9mxDoU3gOuQ6+eoh3vCyQ+zYoz86byFrYpncKhd7GJ+j18WJE
         GZNpT8zIhEm4mkGaDR8vosrEa/+yD8P5tgh97ADOzuHxeT8HkJnGf2Ra0Pp3nm5l82Ot
         inPiWhZeFRYCGTYexcfNxL/udTYunYsCUIg/3XgPXIaDRLEe0PVDoaNN3qZ/QaW8VYSi
         UwZoTrXG4+n+2KR5VpwUqh7okhyG8xyxomGJHHDNUf4nF8fvSq/Uh6Fhl+KciQVzCuBV
         7EbA==
X-Gm-Message-State: AFq9FYK+rTpzEqEc+83dtB+v5FHBj3Y3vN0Er6P1pevjuYJHo2WKtGE/
	IRGcA9ue03jydmPPRfLKfOs8c2xqo4ibX6/b4eFbLfyUPQI2ZO6M8Y++pUSq/1R7gOuL7crCpY8
	UO/v7
X-Gm-Gg: AYBFou2+Bj1sVbEIhLbU9l8/c+vtgutS3/0V+kjAviyUGh9op7HGguOM81RfB5o+xNc
	8jFIhEilEC0Xkd5vQGcwxL0b3Foyq/E3Hu20ixPcd0DKk2VppiUbwBMDTZSescbF23i16hu6RGm
	I8SYSNx4kSxXJlqkkAf/SVJ689PF06HpKkaJn13nuj9xluRsP/cMzG24IY2dMUcErsoYRdagKud
	3upg/kIRWe0TTMWqaTbttpUf7UckfpwEGnTsFz8/paoKI9sqOUZpeqJneUB+4+d9QCVNqqOGslt
	Y0FmbNyYA6zBLF7PhSStf7/WySy0W3s7t+1ocrWhLnAi4kxVGDlA+sanfYSUfe/e3e/bHkCjY5g
	PPZBKBszJanvIu5O5Py6x1DLeXkif/ruH/2tjfZNLWRw2zfOoVBc1Jgec8LY3s8r4OtR2dAgDTU
	Ftt1RNtdACke76GpHjcy2RFwaRspsD7x88iVbDIY0DZd3bE+g8sIIRa5Q2y+Ewm7mcTQAKFktLe
	KLTjvl80jcW3oCVAh3ug6VilFskQMkRtHmz0YUI5R+CUI765+VaZxqEnuqMuZZltXKUCebbpvR9
	N9Ezqwuoazw8MW+WQGWg56IC
X-Received: by 2002:a05:600c:6097:b0:49f:bd3c:bc24 with SMTP id 5b1f17b1804b1-4a18e4b8885mr237203835e9.31.1791901496541;
        Tue, 13 Oct 2026 07:24:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm473009815e9.11.2026.10.13.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:24:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 2/2] python3-subunit: Upgrade 1.4.4 -> 1.4.6
Date: Tue, 13 Oct 2026 17:24:50 +0300
Message-ID: <20261013142450.2456130-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013142450.2456130-1-leon.anavi@konsulko.com>
References: <20261013142450.2456130-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 14:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247728

Upgrade to release 1.4.6:

- Fix compatibility with testtools 2.8.2
- Fix ExecTestCase to work without executable permissions on the
  test script.
- Fix ExecTestCase to properly handle shell scripts.
- Stop installing tests.
- Add subunit-combine script that runs multiple subunit-producing
  commands and merges their streams, optionally prefixing each
  command's test ids.
- subunit-combine supports testr-style $LISTOPT, $IDOPTION,
  $IDFILE and $IDLIST placeholders in command argv, along with
  --list, --load-list and positional test ids for per-command
    filtering.
- Add gojson2subunit script for converting go test -json streams
  to subunit.
- Add junitxml2subunit script for converting JUnit XML test reports
  to subunit.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-subunit_1.4.4.bb => python3-subunit_1.4.6.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-subunit_1.4.4.bb => python3-subunit_1.4.6.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb b/meta/recipes-devtools/python/python3-subunit_1.4.6.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-subunit_1.4.4.bb
rename to meta/recipes-devtools/python/python3-subunit_1.4.6.bb
index ff93d19df4..809aa7309a 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.6.bb
@@ -5,12 +5,13 @@ LICENSE = "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=1;endline=20;md5=b1121e68d06c8d9ea544fcd895df0d39"
 
 PYPI_PACKAGE = "python-subunit"
-PYPI_PACKAGE_SDIST = "python-subunit"
+PYPI_PACKAGE_SDIST = "python_subunit"
 
-SRC_URI[sha256sum] = "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e3d1d2558a2cdea34"
+SRC_URI[sha256sum] = "31fe6a7b35550b0d72da98caaa6ba64c547d9346c2846b845cb5c781849e2762"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-iso8601-native python3-testtools-native"
 RDEPENDS:${PN} = " python3-testtools python3-iso8601"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.47.3


