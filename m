Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F46C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 10:00:32 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.17319.1752832822985388010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 03:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JF24YMhH;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3a604b43bso320768566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752832821; x=1753437621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjKVeqFCsmft5QmYT4bfvqC/YtxHkVTVIAnogcbmo/g=;
        b=JF24YMhH4ncie3wgOO98sXtjF5VO2VjcIKl26kQGmJNTVCjhnnzCjzDsQ4yC3fkG0w
         vC9hz0481h/YhrAQLG4Adhw2fZjcoTfS7usQr8K1XSaYub7JPs7utFuJIPVFGJHQksFw
         FJD1sHDfQTrz1KpYp0twB71UQH0vKMB49UWNKXycUY5V9Ap5nZFUBinihDA66Q7iXUDZ
         BS2MULh7cVgo4AjFHIdqOywzkdNa8obI5GJVFL5axsKwCZcsntQHapiyQdrGZ6PGB4Ih
         5OAw7fOHNrYrA6V3+xUvLXMfmydppqd9mceWzxVNSnVRLt9/Mcq+5EJLDGIZdcwRvQGp
         JTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752832821; x=1753437621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjKVeqFCsmft5QmYT4bfvqC/YtxHkVTVIAnogcbmo/g=;
        b=tI4gB/wtP6Yd2EVkqfAeUVSBAMTmvJLRF18LzwGF49qD7IwjQvkrS4M09/Mizx8sJw
         Y0TDIQWmwsA/gCzFhBOyrJgnnrE+ZKXajW0PG8r+H0teImqIqwAEywd6WOmS9u2uSSf/
         K3/RIri2HFWQurXoPDBJAe5z/F81OHPemRbC2yY7oCA+GwKbPN/xNY/r7VYxV+B+yaIi
         5KyRwec7tw3b3t85xIZj1lEjZYiaMNj3NuelOfBmaCsKZ0Q3z41WvDPhFqnClhgDnZ2L
         LTEqW2PrfHSC5ALlaVIo4G6gOWDtTrUZcaa9eFNzzQ6e/esJstityQnwVIAnx8Wiu+Ek
         Zq1w==
X-Gm-Message-State: AOJu0YzV1bQLW7LxcHh1GFUVppFX36+GjdnkjMSybxvMEqFev91GO//a
	jChdZqpYRHoGXVtUlp2IChxnbKrQUQc/copDdgx6Gpq4KgDRMFbFG3F/rhqPtA==
X-Gm-Gg: ASbGncsJ6FrphnNw7bd6AJU3JIxkkHMKcGN2Rnhnja4zvuo8L1jTsqGtWiA+HaPHfM+
	kn2rvhsjUUoc14UEmyu/sgvilYK/G9I7oHGYwRvg8a9apdGTjc50lhiFY0JykTYTuwfcatrYskN
	U+l8l/uwOMKD7nyhXYVNc254MNBTO3F02qHmmyT7RqTJtmN9UJ99vYBEwoahJ1iumJiJ5GeJxYP
	Evv+M0cuPF1YIKu2lIVvsaPzbhHGlbaQcOLigLGEMAe3rTbUF7b3+U1mu4sOVXJz1MTM+Nbbyhd
	mNqoczk3seDSLhdp8lXYkwvcgt/z0UoRdmF6Hz9lhB3APJpo5JQa4+xGUwK+fcGkSS/04IF1dfy
	w0zgWNKJcxLZwEr9oI+A=
X-Google-Smtp-Source: AGHT+IH73p67xw7K6ztVwPRfaXE/M9oSDCwWMMKgRy4OgLW6Tl52l23T8XTKYg8nQbrkazGcg5n71w==
X-Received: by 2002:a17:907:e2e8:b0:ae6:df9e:736c with SMTP id a640c23a62f3a-ae9cde02cbfmr851069466b.21.1752832820525;
        Fri, 18 Jul 2025 03:00:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8909sm92488266b.60.2025.07.18.03.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:00:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] stress-ng: upgrade 0.18.12 -> 0.19.02
Date: Fri, 18 Jul 2025 12:00:19 +0200
Message-ID: <20250718100019.285465-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 10:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220592

Changelog:
https://github.com/ColinIanKing/stress-ng/blob/master/debian/changelog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.02.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.02.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb
index 85a0d6a709..dd8d3a8406 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb
@@ -5,9 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
-           "
-SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
+SRCREV = "8d5399b282225f758606cd2b522382f65d947a8d"
 
 DEPENDS = "coreutils-native libbsd"
 

