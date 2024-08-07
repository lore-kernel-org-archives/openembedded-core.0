Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4833FC52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:40 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.36820.1723045418263416435
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UfrI7Mm/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fe9aa3bfaso166341cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045417; x=1723650217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddb6arLpPqaHhe6JapVJ7lYvm9tbCWIVocjyF44TB/s=;
        b=UfrI7Mm/3TvLEMMQEyYl3xm4nPQye/AuKDaLJujNTJJFHcSh0h7We3ZH2JZOKj6V9W
         N5Z9SVaSsSmjlpfcbWmo0kGOsS02ZYaJOVgLd+KgS0Ubrsy8tCHYdMOiJrBrJDxhf+RD
         ja+rvYyyyK6D+jpSEnN9q9wK2J09tNovkMDJVG1xQCz8VoNDAmdZladN7j3ppukjtp8J
         fRxU/3Zxr8cZEzJ7E21KRmjcyQd8KNqSIqjs2zzFkxyF5Ym7nfEmUY3PGY0kRTI0R4a8
         XbEv/xoq9HEsR+wSUGQZdOrQPBnx0zp5UBMqvGdrh+5sgzmVoVNiT13g1IDFk9669qyT
         LWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045417; x=1723650217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ddb6arLpPqaHhe6JapVJ7lYvm9tbCWIVocjyF44TB/s=;
        b=nfYDrG0ElevrmA6G/7Ra/aJ+XJfUd6IpD5nRcYUxej4htMJ143Xeu+qOOfoyKQ3ceY
         H7IT5WDVAilvKeaK76+bnIb3mSxTYoKLAyYCZ03TpdikD0ml02ftOfjQFFC0XjzOjgtP
         ODsw0MzqOQQcI0cYoKpYRPO10a2ajwZHtph6QpA2gUIlliK7g8IO5Cz+tj10+Yxo83ha
         2lZcRB+3IdJavB1ezjifVc2LY+kxGHLeuaJb7svmF9fDoyd8y/VRDGwpzXOc9czApui9
         2UCqK62lofmJK/ot5vg3S0DpFxhwCogUBYRuPhiR+MWRZ4+4p4SBwPt4fAXMQwr3FEFo
         p3QA==
X-Gm-Message-State: AOJu0YwK8dZi8Y8jKut+/AaGciyOSC1qSkCZlhwaWgIjKp0VNIwDUIoe
	QmC7M1WWD4Wfhi5trsVvMBSlyDOT4xTOBd/BAPj1NQKgqYD2TOqcIYBPu4ZaczNXAtvOlj1EueJ
	t
X-Google-Smtp-Source: AGHT+IFGHKgKPBSxMhg4RJLEc1+7j1jvkRkJg+FsSHOPGjFlkbyCWKMpAe9K+xRSOI1KxAgjcc3Cag==
X-Received: by 2002:a05:622a:38f:b0:447:e787:1d47 with SMTP id d75a77b69052e-45189246a54mr245611431cf.32.1723045417060;
        Wed, 07 Aug 2024 08:43:37 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 1/9] python3-sphinx: upgrade 7.4.7 -> 8.0.2
Date: Wed,  7 Aug 2024 11:43:25 -0400
Message-Id: <20240807154333.533180-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203080

Changelog: https://github.com/sphinx-doc/sphinx/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-sphinx_7.4.7.bb => python3-sphinx_8.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.4.7.bb => python3-sphinx_8.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.4.7.bb b/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.4.7.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
index e713852385..94ea56c4fd 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.4.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
 
-SRC_URI[sha256sum] = "242f92a7ea7e6c5b406fdc2615413890ba9f699114a9c09192d7dfead2ee9cfe"
+SRC_URI[sha256sum] = "0cce1ddcc4fd3532cf1dd283bc7d886758362c5c1de6598696579ce96d8ffa5b"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.39.2


