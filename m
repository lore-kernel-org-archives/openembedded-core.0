Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A32E66886
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 00:16:07 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71430.1766362551410549502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 16:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jhv7WtBJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64d2c50f0d6so1359456a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 16:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766362549; x=1766967349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFkXrCNmjtc/Qvikos8ab+h7n2UNRImdQyAYGMTsd6c=;
        b=Jhv7WtBJQcWaZ58dR/kPLnKGxshyvTqn3zZVietmyiHQR6ByhpSi2c1EwlJw4AdscA
         6yqmbKa7/QLj5iRr4I65hva0V77qsqAP7I0qyL7d12AY4DBDU97PmemV0zRWYbfmkgwy
         9vmhURuetAhni2dQOJcCs/ol0Us9ya2oVy3off/jOH9tXqoHdc9cTSFXZWtNaeAjN3Jl
         Wt+/wckC/A+vWX/2l1JejGlghBSoJAfmtsVJlFQJh+uAnb+y2ajDLgblcZvNKE9oGGws
         rt0iHMED/qaIky4Mw/TvQA6DKH/GszvBN6X7xSPKTlTt9+lIPcB9TgRz8DAEso4cGfna
         dFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766362549; x=1766967349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFkXrCNmjtc/Qvikos8ab+h7n2UNRImdQyAYGMTsd6c=;
        b=i6Ca6Rr0wngvQXBHkFkPCTiukfFlfqZOcgJ5KvpxtHj5B6K7OHaAyXntKQtA+9S326
         ETLhxmw02XwgDpJ23IehW0WgvwlXgOY9cmcssPWlkV2cHzNVo5/A1R9byRy0RLsNDEHR
         ri9rDzdjOqZ4/p/bPSB6zCa2qVeRny4prvSrj5XP2d9WBMdvX53lk+PEoeq4eccH901y
         bYchpEe5vJuzXhUmgyIJ5dx6xB+PhNI4wtQPIAhm9fs5p9qlPbIEvauPPPcdoeYOUUgZ
         F42pgw+ucWjH+Z6nnldQKHhg3TbKAaHsC7rd8S+V5TvuvRppCSY2yfcQ1ag0Xd4M8Xzh
         SMiw==
X-Gm-Message-State: AOJu0YxxOYn4CRnWsCzged4nVQfoRjiy+n/0QipwOryZEUyDYgMHTR9i
	nMQOStew6QoWSqvYXIKfU4bLd1ajdVURweTK+QKQS/aqrjH8HYsGci6qy749jQ==
X-Gm-Gg: AY/fxX6h+YEeV3pUaKYfaV7BctdDXHjIDovjriQC0t9V8Oq1Ejhblf4QbfNiv95cgqq
	rFSgNJV43EG0uA3SE1RDnRZcyJ5Ln2DMtaYxkrw2Fuhg5Ir3aJgWmMAMpppSYnzFLRr8gJOlpAW
	uoLVTmlBPTY25MvcYwbrcs60EjfHYUdVCKjGxP81pNygus0n+aIop+mCvMtnpI3l3Xb8J38XeAM
	2XSAKAi/hB9ZMsbF6qO+AKzTU5LgMwwNMGUUUlJ5N73WpdTYr+4SvRztZpFgCdovGNfTGeqDk2D
	vl9iieBq8hWaKLOyVK3WAxurphS0pNpeKFdXx7u6bc3Jio+cEI9JLccTkctTaqy3kkcNXYg0w5Q
	Fty8g+iljl7PNoHfV4E4ijNd5l3nEra9qVDWjvsJeOiFeEjcmJZsh666LgRIN+wMDUz4dZvrsxF
	jcsmj8Fz+I/e1D+35wKsYdb3dovDIr85jkuH3JkTQ898JDCHBeEddi4iDQE6DVDQdq
X-Google-Smtp-Source: AGHT+IFT9TQzrhEOsYdjExPkCukqyLnpkQ2Tz1MrfRcDFBs4ZRuY1/RGJrlPKumdn8PzvSs5rXSlyg==
X-Received: by 2002:a17:906:c14b:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b8037197467mr1106714966b.49.1766362548848;
        Sun, 21 Dec 2025 16:15:48 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0b7bcsm922660566b.49.2025.12.21.16.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 16:15:48 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH] python3-poetry-core: upgrade 2.1.3 -> 2.2.1:
Date: Mon, 22 Dec 2025 01:15:38 +0100
Message-ID: <20251222001537.2376679-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 00:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228278

Changelog 2.2.0: https://github.com/python-poetry/poetry-core/releases/tag/2.2.0
Changelog 2.2.1: https://github.com/python-poetry/poetry-core/releases/tag/2.2.1

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ython3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.1.3.bb => python3-poetry-core_2.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
index 12c4751de8..45af8768e9 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.2.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "0522a015477ed622c89aad56a477a57813cace0c8e7ff2a2906b7ef4a2e296a4"
+SRC_URI[sha256sum] = "97e50d8593c8729d3f49364b428583e044087ee3def1e010c6496db76bd65ac5"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


