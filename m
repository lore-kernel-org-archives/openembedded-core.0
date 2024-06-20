Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E26C2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 14:08:11 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.48410.1718892487453732246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 07:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=oBFgZ6rE;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-79bb8dc530cso71490385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718892486; x=1719497286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9haWDI9m+bKSdmZWwo2QRvEYTXmBG720bgySh2TEbOk=;
        b=oBFgZ6rEs6wrAFybyEmNCUoV4iaL5MNhaSqkoEFfL/TEd/T6iFRKx3Vj1P4uKLvm2a
         YupxhFcatxNbhleRJ5QI01VEyCrRevxLKvW3XXp5H+7rnUsBujyCGVMRurfokMAmdoGu
         NOLtuTCl2wbXaz2RiQJkeDV2xpZRlCpLVflscVPVrJvqfCPp1ZFUpp0Sd2DBU+f0wRd3
         u2qFdMUyIHxps4TkDtuR45c6EgTiyyOunxmaJ7hqsW5qxM06C3ttScTfP1dz+f3bPo1K
         KK+5jgRDbNN0xOBM6z0lQTqV3LImO9dVGivVws/VeURVJ6rjtMElw/teK0KrHGvUCAH+
         NLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718892486; x=1719497286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9haWDI9m+bKSdmZWwo2QRvEYTXmBG720bgySh2TEbOk=;
        b=ovMlftjQLZqo5qNpJMWWpebtqD37yNMHRGp91ryKRIdxiXg426yVvVkKVLf/m8jCZe
         7t8/6nBOYZtUXJpN7QOcqtQG4pHxSgKjsA8M6Z44YG+SASNGrSwSrY418dDVmtyWnGGj
         7RqK4rhEmjBuk6DiJ4W7Y/rZXbYOMnXy+/uXa4BXVE+wavE6MbSkjgJWJUEcFmYjOC7r
         02PLOzuhqfkf3dSoLl06kFXs4wDxKYGCYxkIilBusMm55UHuGPAesLzkSBVez2KieQiI
         Niqj+v2rfSNKBDS55a5HfEqHQY23pyHmBefY8BfLjWv4tjt2kLCRl/k4GxNt7oSYwyIZ
         1D1Q==
X-Gm-Message-State: AOJu0YycAcM3PZQJHZOPTtu6t7stGUl9mty6P3ZJINTknpL0FHP2sHSK
	Sq8p4KbxtVHGstA5g6jvIN2g0/TFWqwJ+BWBOclR3Kc3dLbKLChDnqspni3ymQjX9ieAi9Pr8SC
	j
X-Google-Smtp-Source: AGHT+IGq29/hVVauOMa9ON+wvlrhEnj5do0yZgB4tzVOI3B/lC6/hStJPzRu81HIhNagZDwC/Toshw==
X-Received: by 2002:a05:620a:2702:b0:79b:b9a4:a0d3 with SMTP id af79cd13be357-79bb9a4a742mr637794785a.29.1718892486177;
        Thu, 20 Jun 2024 07:08:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798abe6efc7sm691579185a.131.2024.06.20.07.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 07:08:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 3/6] python3-testtools: upgrade 2.7.1 -> 2.7.2
Date: Thu, 20 Jun 2024 10:07:50 -0400
Message-ID: <20240620140753.392220-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620140753.392220-1-tgamblin@baylibre.com>
References: <20240620140753.392220-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 14:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200958

Also add python3-json and python3-compression to RDEPENDS so that the
module imports correctly.

Changelog (https://github.com/testing-cabal/testtools/blob/master/NEWS):

- Treat methodName="runTest" similar to unittest.TestCase,
  fixes compatibility with pytest 8.3. (Natanael Copa, #372)
- Format with ``ruff format``. (Jelmer Vernooĳ)
- Use ruff for linting. (Jelmer Vernooĳ)
- Fix compatibility with Python 3.12.1. (Matthew Treinish)
- Deprecate SkippedTest exception. (Stephen Finucane)
- Drop support for Python 3.7. (Jelmer Vernooĳ)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-testtools_2.7.1.bb => python3-testtools_2.7.2.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.7.1.bb => python3-testtools_2.7.2.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb b/meta/recipes-devtools/python/python3-testtools_2.7.2.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-testtools_2.7.1.bb
rename to meta/recipes-devtools/python/python3-testtools_2.7.2.bb
index cc7e055632..8d7759b4a7 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.7.1.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.7.2.bb
@@ -8,11 +8,13 @@ DEPENDS += "python3-hatch-vcs-native"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "df6de96010e29ee21f637a147eabf30d50b25e3841dd1d68f93ee89ce77e366c"
+SRC_URI[sha256sum] = "5be5bbc1f0fa0f8b60aca6ceec07845d41d0c475cf445bfadb4d2c45ec397ea3"
 
 RDEPENDS:${PN} += "\
+    python3-compression \
     python3-doctest \
     python3-extras \
+    python3-json \
     python3-six \
     "
 
-- 
2.45.2


