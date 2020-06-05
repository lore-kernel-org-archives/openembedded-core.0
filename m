Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7316.1591350009032248849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 02:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=t1IS5ynN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id f185so8432026wmf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYiFJyYFieLsRXADskXrZN09FcsTq0CM9oL2Q9Bo42A=;
        b=t1IS5ynNhrndvZSzSWblUEOqLGbriQpcfTNSKNNajBi8rhllYpEHOJib9X3WySVrUJ
         eMOCLlFtbzzAMPvGvSIMS9fESQ3bQw8unzc0V4bCNyjm96BgFtubDr37yhvGfCpOkdUL
         zSeKesCnR/keY4OBQ+1SDfQXE+XUtzN/dKWEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nYiFJyYFieLsRXADskXrZN09FcsTq0CM9oL2Q9Bo42A=;
        b=cSoicxGdgLJ2zi2zQxDE6RkXsUD0KcdNaiMxbjntyTAz0TL8oK3IwSCHiq17QNb+8o
         20rIpqc3dU48N3fvRPRCZi9aUghKhoCtHHUGuyUBc3EjTk08CCObKlnBeA4qZ6kwKd7+
         ynDJoz+BcQZg/rqSZf6+VKWc0T/deafcdSqgwDzaTYxzJfH5IC26LX11JiUphfZpsojp
         UN3L4C60HsEpYsLA0OqeopTPjdLMhU0r8AnNc0ePn+cm7uUqlJErf0Y3WtL5NVul8uaU
         5P+aKRGL71P/gV/aGBuvg9MSjQ5E+11DjJZ1dtRPa91wQBp4iF/WBxmuYNKUhmz8r41v
         fTtA==
X-Gm-Message-State: AOAM533rbmbSoDBfVgmt9jSvHpB3o01SbLN4QOq6Xy4mA8AKipJoTMjs
	t4GgG2f6fqqsvlGpR20m8gDhoTtBcS0HIA==
X-Google-Smtp-Source: ABdhPJyI9eOfgOw/BwVNCmBrlmOKONWQ/hpFahHmoAfx0+Z+/qg07VOtQcbUxiumfv0riyT4yX1QcQ==
X-Received: by 2002:a05:600c:2385:: with SMTP id m5mr1334838wma.106.1591350007215;
        Fri, 05 Jun 2020 02:40:07 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j5sm11283493wrq.39.2020.06.05.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:40:06 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 1/3] selftest-ed: Support native builds
Date: Fri,  5 Jun 2020 10:39:54 +0100
Message-Id: <20200605093956.6385-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows tests to switch to selftest-ed-native which has far fewer
dependencies than selftest-ed.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb    | 2 ++
 meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
index 8e0d1cdd8e..4f713f5c0e 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_0.5.bb
@@ -20,3 +20,5 @@ EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}
 CONFIGUREOPTS_remove = "--disable-dependency-tracking"
 CONFIGUREOPTS_remove = "--disable-silent-rules"
 EXTRA_OECONF_remove = "--disable-static"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
index 8a2b565ce5..08fb415d9d 100644
--- a/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
+++ b/meta-selftest/recipes-test/selftest-ed/selftest-ed_1.14.1.bb
@@ -34,3 +34,5 @@ do_install() {
 		rm -f ${D}${infodir}/dir
 	fi
 }
+
+BBCLASSEXTEND = "native"
-- 
2.26.2

