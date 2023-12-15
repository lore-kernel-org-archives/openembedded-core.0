Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DE4C4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.58166.1702626740830272828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JczGe+lo;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-552d4e2f344so169496a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626739; x=1703231539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ih655nhOkwkLaX+6JpyfgpWwV6rAsWDEvPc95+hIP4=;
        b=JczGe+lo3JCVwxqp0Ilj18m7uWQwu2smC4JRtPLN1D1WfoX+FGNcYuDsFYJTEb45Ta
         /5HcdgVLPJ/pJzIFK/HkbCtSL74HJWkUZH0nrXVtMmdIlUrkz8aEi2bJAb8QGkaSbwaN
         VZr12psf6wbvd4immt/doik39Y11lXRKdJbB6PN2W4szXxWdSHOmUf6vkpwIVLh+ZR56
         /2lDs89FiG7m6yraNZI9kq2Weh8W5qarfjmlNACzKXWN/fYRBF7T5mxtzSL/d2YimdYQ
         fV9JaMNWnsNkR8IrlVgiSiHNONxMJzlvJeYwY7nZHarDnsNftDFn8q0ofaOfPIyomPJi
         IrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626739; x=1703231539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ih655nhOkwkLaX+6JpyfgpWwV6rAsWDEvPc95+hIP4=;
        b=Msao9tt0apkRll6iu6aQu3nuQ4plSMX4dZcoTknXCjKRYuy6H04kgEgeTejL8nHQuP
         oqO2otYd+xVXfswvx01MzhmaXoPH15o4wWoJigLwy872Mdsbp7D9zjAIFju6PJEOHh0m
         0oLx+vNsPkdyxSYf/oMwMRStzjfMd1DV1TEjmIw+An/hy/alvI23fdarml2tjwpX/ujU
         vjueHiPAf7VIiU53lVkqNoDyQpkiVWqKWeM87p9nBMk5qXk1N9ccD1vPzoBqju7ZHDWM
         t3fIMA2PewVPUaf0Ume0IUaSdBkMPT62qmQ9WBGPTggN0lKmyVTzUX3+Z2JLlV2rY9xs
         fIJw==
X-Gm-Message-State: AOJu0Yzuyh/kG7ThPEdZxmAxnhDl5dEgmoE4uGk3/VRy6gLfh9qMTzaX
	Arv7bN6EZxTE2cbpXlugglFAukgTD3U=
X-Google-Smtp-Source: AGHT+IHsmf+mnmUooteHoXjoplP8Zyi+uzWSBZH3w5ZgJNIOIbBJUsbgJO7oEtFYnsjneRoratTLiQ==
X-Received: by 2002:a50:d51c:0:b0:552:2600:5406 with SMTP id u28-20020a50d51c000000b0055226005406mr1221939edi.44.1702626739313;
        Thu, 14 Dec 2023 23:52:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/10] python3-pytest-runner: remove distutils dependency
Date: Fri, 15 Dec 2023 08:52:09 +0100
Message-Id: <20231215075210.3049785-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192421

I couldn't find any evidence of it actually being
required at build or run time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb b/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
index f7a2c1bb957..2e2d750e175 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
@@ -11,6 +11,6 @@ DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
-                  ${PYTHON_PN}-io ${PYTHON_PN}-distutils"
+                  ${PYTHON_PN}-io"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


