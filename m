Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A477C25B7D
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 17:04:57 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.1255.1716311094792553868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 10:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uPqkR5by;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-792ecce9522so29989085a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716311093; x=1716915893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reLGP6PFbFcfY0fxcU39bLBT1EOQsNgSE2cwbqUMT6k=;
        b=uPqkR5byGjpQfDW/E/eS8w0F9ei8jUt8NPl79O9p7hktYBMXn+0W2jfEOfrLFW0IH3
         Uxaga4KxEv153+HdpUwcd6l+I0Ie5MSiJJ2ZFZrv+jT1Ri6ThNXw240ehLbzrsJ+C3W/
         Zam/hE7HJqJA0msyzM7wK0jLucfReEgQ+eaPgoBEyUXVtQy/cGipy9Vv8KZ1sNiz/+gv
         aDtE2Bgbc5prfTbaWqihmQ0ixutrYA04ydJnopUxQoGKbOy2lzTROeheq6Zh6yvW9kOd
         e/swWB87pw3HAN6rFfkoBzT9Y6OlUtLBiLMoO611MJzXvMarrdoT0tQ2lPj9mhv/xBYC
         RdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716311093; x=1716915893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reLGP6PFbFcfY0fxcU39bLBT1EOQsNgSE2cwbqUMT6k=;
        b=Mm5eqrFWSPxA28iltA3v5wqBhHRIccb1a1HfKMFTi6ZRkg8U2sFQ6ipzlXvC9paimf
         56wdflDKbqVDT5fG+ABfwRHn5MMq1JfAZHBdyR+fwy9x8cNUQEbDPwk38Zerc2o0yeHt
         RTRBkEgDB6VE9yb5lnGwKP3DvWEJF9HJ8tUwbPwmNM+wGbWB2VsA0tyj/p1ItH5ygD5B
         1aUsv8wlqDdf2IZYLS8EwzDIWAGYHex9sTX2uUge7YE17u8XQZAvtt9NOuWHPldCIqKY
         7/XHNm1eLCisnwnRDG6PYz+yA/i06KLShJONMYThGJifWXrS5Hi1BvK9a8pePO078C+y
         ATEA==
X-Gm-Message-State: AOJu0YzkcWcvD4UzZwHVW06puA0FxcrA3zenc2l9SjSZ0q3ffY3MEPrI
	4cgsUe+GLKGNFBLWDZQvSJvidVsM9lIsgRhJLPoMBYoaSauKFKZCyo7U9LpWSmCSgYieCaOqDEx
	N
X-Google-Smtp-Source: AGHT+IFQo/BJx5mYdatHjZD2xMui6RyMmueb2j9hP635sIIwIPIqOAAZFq4HxC3oRAUrzOHWGTFWvw==
X-Received: by 2002:a05:620a:2118:b0:792:ef10:3ab9 with SMTP id af79cd13be357-792ef103bb1mr2160019085a.31.1716311093448;
        Tue, 21 May 2024 10:04:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2972cdsm1292833685a.54.2024.05.21.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 10:04:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com
Subject: [OE-core][PATCH 09/10] python3-trove-classifiers: upgrade 2024.4.10 -> 2024.5.17
Date: Tue, 21 May 2024 13:04:44 -0400
Message-ID: <20240521170445.1892398-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521170445.1892398-1-tgamblin@baylibre.com>
References: <20240521170445.1892398-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199665

PYPI_PACKAGE is added since the upstream now uses an underscore in the
package name.

Changelog (https://github.com/pypa/trove-classifiers/releases):

- Add Trove classifier for Python 3.14 (#178)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...rs_2024.4.10.bb => python3-trove-classifiers_2024.5.17.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2024.4.10.bb => python3-trove-classifiers_2024.5.17.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
index 357b4289832..94c48ed102a 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2024.4.10.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.5.17.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "49f40bb6a746b72a1cba4f8d55ee8252169cda0f70802e3fd24f04b7fb25a492"
+SRC_URI[sha256sum] = "d47a6f1c48803091c3fc81f535fecfeef65b558f2b9e4e83df7a79d17bce8bbf"
+
+PYPI_PACKAGE = "trove_classifiers"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.45.1


