Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C00C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 19:49:16 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4858.1700250553655452717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 11:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vAJH1LaZ;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67572f4b17cso13615926d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 11:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700250552; x=1700855352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6uu49nxQ5kkjBpO7q60cJpWkqs7knyw8IzGk0iFoOw=;
        b=vAJH1LaZBmBkvqFG4ZIFn+7ckZzWBNvS4/9U4joMEhm7XlkHNuCL0PjMirBpEham8w
         opW1+kzEYd0lifjKsa8TunNHt20TjaoSEpYi6WOeMTU7BGb+5OXA8WPH7mAVzv5jSEOR
         VnuZeTIzV3Ymppg1tclEUcXU5coG9SwE34NjhwDfUTzelblEIVXo8+qUBcU6gqY69DvW
         1IChArQkuybd49A5dvrJUlwhFQRphUEKQbchH4aExr5yi+NhEoonps8SA36nS091qEBb
         Imms78jvf/W94vs9FYpEjteGPIkiJvvtzPmwF8fhRKOgT7OFakXLu7jxRNCWrhJZwF9v
         1JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700250552; x=1700855352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6uu49nxQ5kkjBpO7q60cJpWkqs7knyw8IzGk0iFoOw=;
        b=WNwGDp35OiU7OxGEZtHo6KbUJRhPQE0BgYNaIe0vCKy2BzGCkwsK4SQFykkRdnRjVs
         s4IJOcRrQP+Lz46TEdPJSlG0FSHpek1ugrOHtUg+R8tmAt9/N2ZGciczAZ3EWYVthLTT
         wtgIRuE/DYDJ/uQFU6MQjBbeRIwl72Sv3QpdVhdKVUsUxRoDg5AFELUxcnWF5qyT/9N/
         zQS9/DLn+eyo2XqNY5Yc44D62B3DJxr+XonAu3R3Q315m5sNpl3qMv32Xx2gopWVvtgz
         C1UsY2mjlEh/q4/lSOlzGChjbiIHkXUwHHd/EDnT/hDOi9UoubHGsjCtZ2rNiHu0FUJm
         SkQQ==
X-Gm-Message-State: AOJu0YwFX4qhlztIGkO+K4Q/tI33FRhsFTBVST8Hy8ZVAzLUHQNyrBAh
	j+RUF4OJhC8ny2q4somgWfjBIWRCPzKbQoWimqxywA==
X-Google-Smtp-Source: AGHT+IGXR9niPUo1k2QQsohxZRKmk/s/KHskrx8Sr+8lFl+nXhDdZuAmhIOzxXC6cLGSLHc4tkTs3Q==
X-Received: by 2002:a05:6214:20c5:b0:672:e2d5:7a7e with SMTP id 5-20020a05621420c500b00672e2d57a7emr85743qve.50.1700250552139;
        Fri, 17 Nov 2023 11:49:12 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id j10-20020a0cc34a000000b00677f8d80f76sm533481qvi.90.2023.11.17.11.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 11:49:11 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/4] python3-mako: upgrade 1.2.4 -> 1.3.0
Date: Fri, 17 Nov 2023 14:49:02 -0500
Message-ID: <20231117194905.2080320-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 19:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190857

License-Update: Updated copyright year

Changelog: https://docs.makotemplates.org/en/latest/changelog.html#change-1.3.0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-mako_1.2.4.bb => python3-mako_1.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.2.4.bb => python3-mako_1.3.0.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.2.4.bb b/meta/recipes-devtools/python/python3-mako_1.3.0.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-mako_1.2.4.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.0.bb
index 9860058723c..d180e05ceac 100644
--- a/meta/recipes-devtools/python/python3-mako_1.2.4.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.0.bb
@@ -2,13 +2,13 @@ SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad08dd28df88e64b35bcac27c822ee34"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcc01df649aee6c59dcb254c894ea0d4"
 
 PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d60a3903dc3bb01a18ad6a89cdbe2e4eadc69c0bc8ef1e3773ba53d44c3f7a34"
+SRC_URI[sha256sum] = "e3a9d388fd00e87043edbe8792f45880ac0114e9c4adc69f6e9bfb2c55e3b11b"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-markupsafe \
-- 
2.42.0


