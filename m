Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CD0C61CE7
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 14:35:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.19539.1749306927875867938
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jun 2025 07:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=FYZfdEpv;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so23763465e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1749306926; x=1749911726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XYP0+WNIWcOaZEkujwbdiCzRnP6QdAevGFjHP1fhfE=;
        b=FYZfdEpv7Hf/PQ3+P1heWUXz2g/FQFdIazVOHE9F1phl97rOHmHYvdELIBatDaV+bZ
         rOfy0oZ22wLPyBgkxZJeEjlJAAmq6VyA/FhgGg3zCOXjhjCWQe5Feoo6TTOq1sR7kuMj
         QYTiSDdldMDI5f2vWZbBVKqWZGQa2ej18OquY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749306926; x=1749911726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XYP0+WNIWcOaZEkujwbdiCzRnP6QdAevGFjHP1fhfE=;
        b=i0Qv14+v5jNUeIAXKIVonelN3wUKrFobMQEylPmfH4w3o+66rPVg0FhrOaugDDoDyM
         cFNpivVSN8CvgzMvtdtc8riRgH8LZ2ycwqpkmp8UZpKubR13jcVUOYHo2X0Gnm68IpDQ
         hpZ9NEzz7nsPntkXG5RRsq/izi/pO1Xzdk8OdqzJga8FRY7G1ACCgT2FPVZG5tbA1rx3
         FcFRk7JpNSKZS2yZAjLBzp5BPq+JwCx0TQGs+WoYufQLeyLlrVg9a6W95EQaOya0SpPX
         5Pwfg96v6C6K/im/xxRAPiCKlbRmZ7XQ+fuU/ukq/0AF1dHt8ezvYlPZfTQ7FwtDbQe9
         erkQ==
X-Gm-Message-State: AOJu0YzfT/tHMtOR98AXWPVMtsKAJMKi9Dl8osjnGDj26/Vw3gfjDjv5
	d0yJ7r3QfkFunjfYxYMiMhBg7Gyosbarcdij7ejpaDoe/ZlLAF5bvTnh46w3JF3WgwEiM4N6dji
	zhovBcKg=
X-Gm-Gg: ASbGncu2gK5Kt/DeGty+WFMx9Gm2ZThrtoC2hlldPeFKro6q7EB4fTrsGBKThyVTmZf
	8PpMEa70zpjwBvW03c8CJdsjGWEZ5UrD9TbqFUZACH0p3EUkIuMZdr8KlCm3rSQcA0otVeRyQqx
	2aC8l2SDcQurN7aRmOo0spT+NiXmdAQGQcSYYzByGtYbDxY8j/22I2n4QIi4QauOAVQvb9VFO0V
	TM4wWumRO5hxLJ8NfAzWGW0tcOkq4QtWDt22gEhAxWejZ8W2iTGEduDv8oj9KV6HbCeRd2wEjx2
	7zrz0mIZf4tw+THnjNbUuw3Pj6lsAeD1pwRw9xJ7BXJJNnTFiSe/x6Z7ifd0EFhFUYoXdSQlFFe
	RWCDVNi8KjIrRYhf0z5fxE/9BrzzB8w==
X-Google-Smtp-Source: AGHT+IGOgXllLVRqB6HoSc4vw0b0crGeOTrzbhr8oXHEoIIQ8eqgstxYjWaEUNa21/MW7lX7Cci/PQ==
X-Received: by 2002:a05:600c:464f:b0:450:ce44:b7 with SMTP id 5b1f17b1804b1-451f8469acbmr75960865e9.5.1749306925999;
        Sat, 07 Jun 2025 07:35:25 -0700 (PDT)
Received: from localhost.localdomain (80-108-196-96.cable.dynamic.surfer.at. [80.108.196.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm57862725e9.22.2025.06.07.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:35:25 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 1/3] findutils: remove tabs
Date: Sat,  7 Jun 2025 16:35:10 +0200
Message-ID: <20250607143512.484259-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jun 2025 14:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218196

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-extended/findutils/findutils_4.10.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.10.0.bb b/meta/recipes-extended/findutils/findutils_4.10.0.bb
index 57f77de16f..508485bcd3 100644
--- a/meta/recipes-extended/findutils/findutils_4.10.0.bb
+++ b/meta/recipes-extended/findutils/findutils_4.10.0.bb
@@ -18,10 +18,10 @@ EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
 RDEPENDS:${PN}-ptest += "bash sed grep coreutils coreutils-getlimits"
 
 do_install_ptest:class-target() {
-	mkdir -p ${D}${PTEST_PATH}/tests/
-	cp ${S}/init.cfg ${D}${PTEST_PATH}
-	cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    mkdir -p ${D}${PTEST_PATH}/tests/
+    cp ${S}/init.cfg ${D}${PTEST_PATH}
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
 
-	# substitute value in run-ptest with actual version
-	sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
+    # substitute value in run-ptest with actual version
+    sed -i -e 's/__run_ptest_version__/${PV}/' ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.43.0


