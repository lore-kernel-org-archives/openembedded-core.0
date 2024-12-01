Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D772D49763
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:42:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.149101.1733049766150430335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6BNXPe1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a8640763so27616895e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 02:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733049764; x=1733654564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ke341aMazlQQPkKA9NBo2me06BiqhDzhBkYLzkydLVo=;
        b=Z6BNXPe17d17in9Bdx5MCRJjpYnNxIrxmltCJiIuWM3e3QN7PDs5/397cwDlrS/pIh
         mGf9j739VXQ6tqYRigw9t1pxAoTgQa7y6opsXHeKfIeueTEUIHyYN7h7ScMX/j5Fm6li
         o1YOAgZB18JvpOR7sRThaBqq7fg8Q/DyJS+kWX4r1bQ8hn1WwdQ0GMoHHjGur/x4jP2S
         xA/3w4WwY/d1ncEoL63vkGS6uVzI19UVbM/j6/uXWQxXjWDJnpoJeFkJqnh8q2Qt2vRM
         l8OnzQWH2DW1o6rk7B020sfGkyey/tmIuXEfYua+z18zgE5W/WVA+qhY9KChk7Qc8qMq
         qD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733049764; x=1733654564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke341aMazlQQPkKA9NBo2me06BiqhDzhBkYLzkydLVo=;
        b=G3dhtFzcir574WfE9oDxBYMUsG4pHyKg9MnK7iZvjXpfQfzCvLL6SpWjVOZjCqojcu
         Mj04Wf38sbydUBTwrLHZjMxtGGM1cUTsC3drcC1IFeKR630xo0VlG59x0yjCUtOlLrgz
         exSWbrWhvtqarWErmTCl5J9dvEUD6sf9+p/J/ZfCa13nsBWpZnTS0Jb+VADHrYkk6fJN
         roi7wApdlSkOJJ+zn0c3EpiFyfMwJeWwH4Sn/sidnSdUo9dB1flDmtqurWiKeierIeX2
         dIfxjLH2npVqhyUansDEfZVZbMOgJdRSHxt4S/STggbmCdki9A8YxorrOEq4TLMJ6xNQ
         pTMg==
X-Gm-Message-State: AOJu0YwaazdyPe24Su2wdXvBclOEbhSoFNOafteXNTCZv+MCWCNmgr1/
	wwt8fF+GXhuB3xSyu8YFZqOgfTZpP2XEBeQdSbKi6IQjPlmjekTnAqum6Q==
X-Gm-Gg: ASbGncvJ2BR9F3W4BgO5vgi/XkKNGbL5sIXA5kUxPraTmILo/uhnZ7UMlTBZY3t2Gwl
	H1jKwD/VVHwafqCpBuf3qmyS3rSxM5HxfiTyipzick7lfrIs3W+BMaiexArazw2s3V0eloi7a6R
	nme8oYbTyIBdSGAnOcG2kj2E5+Hga5QEapdVhC9iGj7JHDILluvsgpJLywbfUiGY+6S/b+aQRKD
	BriND/tbPi9oNQDTo2EeT5fIhVwRqt8ItKxOTEopIMCAuzoTcpv5cSKkQkS5gsWXDdYyqBzbKo=
X-Google-Smtp-Source: AGHT+IHweY7cRw3KmQ9UaUWW0uIQCGdccid967KgQ3TnQmtHHA9uXGtyCWwwxSf+PilcCMCU9iC0Gg==
X-Received: by 2002:a05:600c:198c:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-434a9db7cf7mr158455875e9.7.1733049763761;
        Sun, 01 Dec 2024 02:42:43 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76a8e0sm144300065e9.15.2024.12.01.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 02:42:42 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-urllib3: upgrade 2.2.2 -> 2.2.3
Date: Sun,  1 Dec 2024 10:42:08 +0000
Message-ID: <20241201104208.3878-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208110

* The package now requires python3-hatch-vcs-native at build-time
* Updated HOMEPAGE to point to the correct Github repository. The old link re-directs to the same link.

2.2.3 (2024-09-12)
==================
Features
--------
- Added support for Python 3.13.

Bugfixes
--------
- Fixed the default encoding of chunked request bodies to be UTF-8 instead of ISO-8859-1. All other methods of supplying a request body already use UTF-8 starting in urllib3 v2.0.
- Fixed ResourceWarning on CONNECT with Python < 3.11.4 by backporting https://github.com/python/cpython/issues/103472
- Adjust tolerance for floating-point comparison on Windows to avoid flakiness in CI
- Fixed a crash where certain standard library hash functions were absent in restricted environments.
- Fixed mypy error when adding to ``HTTPConnection.default_socket_options``.

HTTP/2 (experimental)
---------------------
See details: https://github.com/urllib3/urllib3/releases/tag/2.2.3

Deprecations and Removals
-------------------------
- Note for downstream distributors: the ``_version.py`` file has been removed and is now created at build time by hatch-vcs.
- Drop support for end-of-life PyPy3.8 and PyPy3.9

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 ...{python3-urllib3_2.2.2.bb => python3-urllib3_2.2.3.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.2.2.bb => python3-urllib3_2.2.3.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
index 31a03a60b3..35b0786fba 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
@@ -1,12 +1,16 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
-HOMEPAGE = "https://github.com/shazow/urllib3"
+HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
+SRC_URI[sha256sum] = "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
 
 inherit pypi python_hatchling
 
+DEPENDS += " \
+    python3-hatch-vcs-native \
+"
+
 RDEPENDS:${PN} += "\
     python3-certifi \
     python3-cryptography \
-- 
2.43.0


