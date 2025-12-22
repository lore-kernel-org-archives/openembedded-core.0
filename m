Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8144E6ADF1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87833.1766434127453617484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YYizY/9A;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b736ffc531fso770555866b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434126; x=1767038926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PmCDsqWpGPfRE8nY+X5MAqEF/GTja93IO3wkfZ2PoQ=;
        b=YYizY/9AyJpnzrScb3RFwD1HsFJOZUkgcRdX0Ip5khpkuz7pAmfl2HJcYN7b94c/wV
         yc1Nq8sFYxt46fxpH9dFQ5jA/KuF06G537WbZ4278WiGRRXwXPTtI1E+1M3H/Q1NZwre
         QBRyM27I2joEXdxyjCSPzVKxEbIB5QpZr7pU8Bi4DYA1mZdhZD8cSlWBl7TIv7qZ6Kb1
         35v77sy7VGDaRkV4l3qAAAzQMrX6h7xsdEpJff6uWUrNpQQP4avMuir7Rmtvu2sOjH7Q
         DtBBQ4Tybmw3wBCV1pA9AaMclQAa3L0L5wJRajNMU3YB24SkLFaOqFUVM1AQRSiZzfwN
         RDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434126; x=1767038926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0PmCDsqWpGPfRE8nY+X5MAqEF/GTja93IO3wkfZ2PoQ=;
        b=qsNwxQ6n4CEuuTltSUvZ6OqTAREN2kXDKKFzfYCXj4u+L0/RyROIepitUr4XFZgzTr
         twe28xlSHabfE82LQf9NxyujrplvsYp9VpIcqoGFZj6ajMiCAAyL2xglPtyMp+5usuMB
         CXDyElqEw4nYqMkmQ8/w6MHhPp+ZMe/WnzUTS7jkKZkA14b9KuBodvaA0ISjiwcCEi6/
         f86xsdYh3e7a1XrtdZQiCBgxBaCeYmCfWlNrUFSNAlKRLZ6IsFmpKzWy+cVJPT5lzFKH
         MDiph2G3/xaTpiWLgSzQwuP6VyvN3x669PvDjlmw9pJY5C/d6wgQK6ca+tbsYDrKRtq7
         JD+g==
X-Gm-Message-State: AOJu0Yw1G/FajsdONrrwTMaZ3WP6r1lq4M3RodEzVVYsFm7R3bNl0TVF
	HgunUdb/wArLofvZbTfjohLdE4PNk68Yn60ahJTt5eLsliQwqzn5yXFVvcPrbg==
X-Gm-Gg: AY/fxX64C9nU0uM6TfWZAxs0FfeB5H/w2qcmCURXqoRHLdfiOcf0ivjdBIQKWpfVNFE
	SRF8EeK3UCwGEiUbR456V0Y5XJiDioY7/DZqpGxYv0SGZK2KdE14ydT+v//tHVFLC+tB0De8aqi
	v5OF7eWi2GQq6q4SjNpCEAkoG7mC3TOeYA7VzjqoYsjtPDgLBWFEVl0wTq5pa1Vj8fVIfDy4PB5
	sd11M/7SXmw+1iaBi0QOc2F1W1mVovWd8hdoUPSTKjNZrwrFCTsayzO+SsGoBWJxpSh15BYt0fv
	J8MFdE2OnPzRiRdXSKZ+nvilRkLGCQ1qg3i+nK9HolArslgkbbe4nLoC7LPtTb+yWaInATCnnQu
	a3i+ol9m9mFLmr99DyQZXneplEjWwPU8UhWbYXuNwbxgh4ZZlVvANbbcZtv5DybYIMeYR3qFZV/
	0PAlzcryhtdpXxVSMy2WmkY9xrDRKBUtSVqKXoL0KkXEqFXpE=
X-Google-Smtp-Source: AGHT+IEsGhNrFiHOMWWwHTHTJyzHVOb0RIJrh2vyNDXTDLDzICcMBjXqkYcA0Afu1XQSRLrAdVaRLw==
X-Received: by 2002:a17:907:6d06:b0:b7f:e703:fd77 with SMTP id a640c23a62f3a-b8036ebf29bmr1205249966b.11.1766434125605;
        Mon, 22 Dec 2025 12:08:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 088/114] python3-xmltodict: upgrade 0.15.1 -> 1.0.2
Date: Mon, 22 Dec 2025 21:07:10 +0100
Message-ID: <20251222200739.2278706-88-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228413

From: Alexander Kanavin <alex@linutronix.de>

Convert to python_setuptools_build_meta.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.2.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
index a1d1bb47e4..e58e32e338 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "3d8d49127f3ce6979d40a36dbcad96f8bab106d232d24b49efdd4bd21716983c"
+SRC_URI[sha256sum] = "54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649"
 
 PYPI_PACKAGE = "xmltodict"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
 	python3-core \
-- 
2.47.3


