Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD161D2CE07
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 16:58:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.23736.1729616293124676823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 09:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lm1ss6Cc;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b1511697a5so374812185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 09:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729616292; x=1730221092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEceLEEZwmlPKJ+HWeEWiqJVnhz52MR5aNzxq8jcm70=;
        b=lm1ss6CcImgROB7C5QzrRLlCmI5Nh9/AgtE1zix+tZydPepLaUpBK7knfjQm7RKpv7
         6rC0qzG3m9ltbSLOsXdlddxLANTeZspcNg6IXNr4mIBUBf0eqhe3X/Mh7jBZDixLrxDN
         bBh5zrDrNFifl36HcyOxmbmVZLA46JBG6LAbRpOkCmivPT2dgszcWHRzyxRqUNeh5QpV
         cqCL8q3Q6re3R3yF9zPGPHIXA8jXZdrww9GJKWiIxmLXy8Jb7W0iHuod+IkiRCGpfY09
         YoY1RqJJD2hKKxcVSyBYovkV/WQLUCbAr3B0cFrrltWJg72+mwyRQhVxand7Un/CUY0h
         RrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729616292; x=1730221092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEceLEEZwmlPKJ+HWeEWiqJVnhz52MR5aNzxq8jcm70=;
        b=BDt/CguBzy2gzsyZBk+DFlVZfKdrwfrhVT7AYXWQuIos/eV4jKqgJgZd6jm14psDiA
         K4SChHAqwLmpmGIhRl/QDhTmZhVquvqGpyBn7reuh7l2K4PJFgJMBZsT0f189DcPi1ya
         f+lb7qBbLDwlR5v9lo7X6zaaSpCIP1FvbpFJ4sY3twNiTgPxs4alivSdfvwl+wA4/jFC
         g/Xy/0YJu7DTTK4rCuB+z0tKzPv8H3bFcuDN8DJugHxmWojufUzSen+ThrOhV8AKIdnA
         h2ZktdXTMv2r9yFqh3P4uVv/PgAUSBmyaTybVaam2JZM2QjY12sEi2Xc/Ztbm0hUDk9Z
         66ew==
X-Gm-Message-State: AOJu0YwgKg/NR5p0xJYY6TaMjYYUHNjO8BPJqSeGI0z+P3RKR8zfNruu
	q16m6+undd/0VumJmHifAhBgUIeG7TGOwsmZKxZA+jM/I01tQaN8EeR7KBR+uJjyfhgARiNvlho
	7
X-Google-Smtp-Source: AGHT+IHT94buWvXZ8QiVNT93WTY8tASWrg3+9ju2NYenQavTJTjs8SYS8SzSvT2l+rd97CYWZcJo7w==
X-Received: by 2002:a05:620a:4512:b0:7b1:54ad:453f with SMTP id af79cd13be357-7b157bf2251mr2056142385a.61.1729616292017;
        Tue, 22 Oct 2024 09:58:12 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659b97f5sm297130985a.6.2024.10.22.09.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:58:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] python3-sphinx: upgrade 8.0.2 -> 8.1.3
Date: Tue, 22 Oct 2024 12:58:07 -0400
Message-Id: <20241022165807.2601020-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022165807.2601020-1-tgamblin@baylibre.com>
References: <20241022165807.2601020-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 16:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206166

Changelog: https://github.com/sphinx-doc/sphinx/releases

License-Update: moved "Licenses for incorporated software" section from
LICENSE.rst to sphinx/ext/napoleon/docstring.py

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-sphinx_8.0.2.bb => python3-sphinx_8.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.0.2.bb => python3-sphinx_8.1.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
index 94ea56c4fd4..da4e23a1879 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4ab44940eeb9c0ec044da326d904a683"
 
-SRC_URI[sha256sum] = "0cce1ddcc4fd3532cf1dd283bc7d886758362c5c1de6598696579ce96d8ffa5b"
+SRC_URI[sha256sum] = "43c1911eecb0d3e161ad78611bc905d1ad0e523e4ddc202a58a821773dc4c927"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.39.5


