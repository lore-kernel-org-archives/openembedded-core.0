Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7173C87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 19:19:40 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.32302.1754853577457942238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 12:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qiYM8m7S;
 spf=pass (domain: konsulko.com, ip: 209.85.215.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b34c068faf8so3486688a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 12:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1754853576; x=1755458376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3YwdI4yrlNqDDbG5D7drKuRB8rUYREuXryMsohl9ow=;
        b=qiYM8m7S7MM9TkJuynw80J8tSZcg1b0OgCtu+kF+MhzleN6yTSFfPLyMf8vZOJEAwo
         v0y3AOPv5t0wd5p6BNUKAIH8USaouKO6PKvg4PnjdWTDnKyR0zQJF5r3/O/ebV8BH5Zn
         tBOzmG+C5UjfhatJY+jDAwvSX7a7r2RsVP5q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754853576; x=1755458376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3YwdI4yrlNqDDbG5D7drKuRB8rUYREuXryMsohl9ow=;
        b=prHVDxJyrRBvBVuc7aUp48NMTJeyn1/JTv/QFo82T66v919lFhprQm4GqUZ49z57qa
         8X+ldaeWzsUGA7bumxjtndnF+lBVIoRIDwZjFesjW+2Rb9Q+IVeCmnwrC2OzlQqKEjg2
         texYP2YFLvu4AGzuER8hXg++fpPXBnU53NXGJJoSJENU7TzzXC2pQZ/NqtGzOyQe8SfL
         WggmaLQR6xvJ5e+loq9L86TkgQE9lpkSVNB5klgoCRU4QdIXn7URRovnhnFQ9pgFwnoq
         nBj6aQ8pFwl4TmjyL880Y7iEBXJIRlTYFqvlwRn7SbkBfrd4iFHVCD4GFhftApozhy+i
         54Zw==
X-Gm-Message-State: AOJu0Yxfjz+e/slVGENL6G3toBnw8afGXEZVOCmGXSmWKLZleKivY8X5
	fAexbVXqQMa1jxpHJuxjTHyxljTHGlixEdqFO3fFD8f0IQL9g3LEEAn40Rn+C9/R3vQ9q2CrWXN
	blIsRyng=
X-Gm-Gg: ASbGncvpCpMCRRqGP3C6HmBKCzQrzzz5QdWbmS1TdHNrq7SOelb5fAjKvfmhXYl4kVE
	QEAxSkyTjEn4LvwXLLqvoEJEFu17oU9KG30YKkqXROnbskemItCT9YoYAoe1wa3sQvGKyNPPQ1K
	yN1JM+9RTTgXs1yGiRhaxNnhQFjSzMiA8nq6QK5Ttg7oL/yr9HE2+dTk+eR+nDth9sRVkl2xhwR
	aG78TxIr5OzRwDgTsoTnLN6zo9FtZZ1dk/MsDw4jw3GIwM/Udd+qZCpSMEzFIDyHdzN115Jz6Y2
	Kk1whc71NL+me47ah+ls0Nm30h690a7MLr6xN9gqM9WyfhFtrmtESslop2UdvABtgvIa6JQp1Kx
	nIRz/VDsW5jUBdbnOjRdaHVSVy3ZJdX98IRQlv/BOpTtNlEtFYIkav6PwsWJMfg==
X-Google-Smtp-Source: AGHT+IH3uFa/GF8gsze1VB1RQiOgWrBmNKc5ccFs5OF5qctI8iCvuUXntgYeIhPrgDIFfPkbciLv/g==
X-Received: by 2002:a17:902:ebc6:b0:238:120:134a with SMTP id d9443c01a7336-242c201056amr179278735ad.22.1754853576207;
        Sun, 10 Aug 2025 12:19:36 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm256975175ad.7.2025.08.10.12.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 12:19:35 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-zipp: upgrade 3.21.0 -> 3.23.0
Date: Sun, 10 Aug 2025 12:18:50 -0700
Message-ID: <20250810191918.78773-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810191918.78773-1-tim.orling@konsulko.com>
References: <20250810191918.78773-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 19:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221703

From: Tim Orling <tim.orling@konsulko.com>

* Add python3-coherent-licensed-native to DEPENDS

License-Update: add copyright year; update to match SPDX license text

v3.23.0
* Features
  - Add a compatibility shim for Python 3.13 and earlier. (#145)

v3.22.0
* Features
  - Backported simplified tests from python/cpython#123424. (#142)
* Bugfixes
  - Fixed .name, .stem, and other basename-based properties on Windows when
    working with a zipfile on disk. (#133)

https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3230
https://github.com/jaraco/zipp/blob/main/NEWS.rst#v3220

Comparing changes:
https://github.com/jaraco/zipp/compare/v3.21.0...v3.23.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.21.0.bb => python3-zipp_3.23.0.bb} (54%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-zipp_3.21.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.23.0.bb
index 135a1ae5337..31420dcb831 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.21.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.23.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Backport of pathlib-compatible object wrapper for zip files"
 HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1aeae65f25a15b1e46d4381f2f094e0a"
 
-SRC_URI[sha256sum] = "2c9958f6430a2040341a52eb608ed6dd93ef4392e02ffe219417c1b28b5dd1f4"
+SRC_URI[sha256sum] = "a07157588a12518c9d4034df3fbbee09c814741a33ff63c05fa29d26a2404166"
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


