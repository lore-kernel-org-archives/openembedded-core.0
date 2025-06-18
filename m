Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109FCC7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:59:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.8074.1750255176846916571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 06:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=h+bsbLf1;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faf66905baso97146406d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750255175; x=1750859975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kiq2HW9jUkH4hadxO2i5EeR7rL+n8+vGAu28c/MctE=;
        b=h+bsbLf1PIa/KiWgLDMZ5TRaM1iUHxaBxm4rcl5OXAOF9mWUC15QgiTABK88+LL93a
         ARHiFQSyvUHKqgcBXv3eFJKXeeIXuvzi+P1DM8jqfVYDMVUmlwvL0j855yCzhXYSP06k
         IaOn/SH+r4kC9zB00oANr0lw5GiK2wmRPMv1XTSVkSPtWbc4eSUm3LRlyhAGMpWZ6QSe
         WxCGw6uRP7lLf9ycuV/7zsDTKdD9Fci5uPVVz4oFhDGjMiLhVrcMZcMLpNZmfNDBSLCa
         sGyjlcdiSJHOh+PRAavDjaXrkYxqqlUcdYh+ZtuiZwSAH14d7/EYoAJeWQZkigXNCZuh
         9rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255175; x=1750859975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Kiq2HW9jUkH4hadxO2i5EeR7rL+n8+vGAu28c/MctE=;
        b=AFltT0t8DK3ogpVyyjYplvjggFB/WDjSl6ibWHqpEmPya1MFHwppR9T3XsCzbeGEpH
         gbmpKDJGVgBky0W6E3VDGwAc10xjIcWaqb5rzRlaIIe45U/LPg+jHL378N6c6js7cIk9
         /h2+5Mad3h3kidCIA2aFEpmubJ1uGK0LckAL+nV6Awgwel+5/PDQZ5fWl0WnOaf/5F7C
         dOjPMM3JIik0uN8orbkUCcmkCE56fGcRGlQmxNst8yn3hDNcZ2gtbj/SB8zy/mWZ38pT
         H0sTrRIr/w4ruGCAKa2A2LDFTu0G5I3bQMeLIVpFo6ToZs2OJK3Q3cFfBUP4j7js3UMs
         AW3g==
X-Gm-Message-State: AOJu0YwWbYFawGHKJbOzrEqWs8M4sMbj+dpnHKmCjXA7iSxoGXsYj/ND
	XNhdHAefOlEu2/9nnyPxC+EToPaf6CIgKyGd45WEC3kyfkgvv7g2XvqkZ0/vaS3lSaIYo7BxSCO
	PCTADWkQ=
X-Gm-Gg: ASbGncvDvndhGeYw/g4sXkCrxAruEdJ0Ag6OIMbHBufcKJ1Mtd/f/mTwB00+mZa5fk7
	gPpLotbNxOAbGmq3/o0EGZvR4lQhKGrvwgKwOWjjXhhzhs/RdBlaHrV2+4MGfIs/EfTcjzhwd/A
	7sz2KfPVEs/yZdxlv3Gs/kh/aka0i6JBhMPCamMzY8Vzju8CPzErKZDSUhOVGAYZ+7FOeQb8tM2
	Bg4IZtdKj8/02uTpGA6SaDIC1fceDmuEAUzEqje7Ptaf0v91pfLQU7L7Yv/O87SwFFExH/FHGud
	Q5vMM2D15z0+cyJC1d7zfr1kB2oWiXMq3m91+l1cs5acImuxw8FIqUWhrsprur6kHupo7IzESOp
	3Gt4TWJmBbJ8Fkormne8jqA==
X-Google-Smtp-Source: AGHT+IGOpy/OHDohx4/rkMlYQFJGxxAwFUJZdP/kQPtmKAXbwiBOUA2utnUtanK7f0ofstMNVgJ49A==
X-Received: by 2002:a05:6214:5b0e:b0:6fa:fda5:1966 with SMTP id 6a1803df08f44-6fb47777b82mr289714256d6.33.1750255175229;
        Wed, 18 Jun 2025 06:59:35 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb565052b0sm32486636d6.37.2025.06.18.06.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:59:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH] python3-pytest: upgrade 8.3.5 -> 8.4.1
Date: Wed, 18 Jun 2025 09:59:33 -0400
Message-ID: <20250618135933.4178060-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219013

Changelog for 8.4.0: https://docs.pytest.org/en/stable/changelog.html#pytest-8-4-0-2025-06-02

Add colorama (moved to oe-core from meta-python) and pygments to
RDEPENDS.

Note that 8.4.0 accidentally removed pytest.PytestReturnNotNoneWarning,
which seems to have broken some tests (e.g. python3-pytz). See:
https://github.com/pytest-dev/pytest/releases/tag/8.4.1

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-pytest_8.3.5.bb => python3-pytest_8.4.1.bb}    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.5.bb => python3-pytest_8.4.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb b/meta/recipes-devtools/python/python3-pytest_8.4.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytest_8.3.5.bb
rename to meta/recipes-devtools/python/python3-pytest_8.4.1.bb
index 4d4e8b8511..1f98b6d87e 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.5.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.4.1.bb
@@ -5,21 +5,23 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "f4efe70cc14e511565ac476b57c279e12a855b11f48f212af1080ef2263d3845"
+SRC_URI[sha256sum] = "7c67fd69174877359ed9371ec3af8a3d2b04741818c51e5e99cc1742251fa93c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
 inherit update-alternatives pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
-    python3-xml \
+    python3-colorama \
     python3-debugger \
     python3-doctest \
     python3-iniconfig \
     python3-json \
     python3-packaging \
     python3-pluggy \
+    python3-pygments \
     python3-tomllib \
+    python3-xml \
 "
 
 ALTERNATIVE:${PN} += "py.test pytest"
-- 
2.49.0


