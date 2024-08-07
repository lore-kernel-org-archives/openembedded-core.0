Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB04C52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:43:50 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.36822.1723045423373630886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zaSq1hI+;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-79ef72bb8c8so1243285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723045422; x=1723650222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIvZy/pQoOw4PkJJDy6BLY+ysX0KCEOUv+Um+SA3IGo=;
        b=zaSq1hI+8nVQ60E9MdfZoDoO6kBS6MuiC2dEu5enADxoxHhUzSsdDXNYtOjOqeJD9O
         lHa6d9h9WY0HIj6cVI/XBZbmzZ/+yX171n509YG8GCjwYj65YkxYmFJ0/+DD1sRPkUgi
         C0ymDSorJID6seby8BXIvXKmBeF1o+UbSggrk7/+r5HsrcY8ki9ei4EmARriAaTbd0Rc
         g7t9Jmk4ZAixGLyKeC4YGMYWnyhnivQiYKeoLKCtKN8k4M09pL3FYEnYj3Op8LyHQY3q
         zZ6bEyKWr5g3armz5diqQW/ecJ8xXINIPEiXZBlEoZEckL69+f/r8m32vcI/Cm8cLwx6
         lYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723045422; x=1723650222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIvZy/pQoOw4PkJJDy6BLY+ysX0KCEOUv+Um+SA3IGo=;
        b=rDtnHrybDYkJ0AEBmlY3/OD2J+xDrcZzCSVYQEA0DuRzIKrqBcvpfjj/CeDEHBIRr0
         yVH/T4e8mwcVaWVd1D2dFIzMCyDXfMyfKkB6ip0kezOMbckLs5dt2u/1vMfsY8qEPy2J
         7C4Y0KC/L+EOlmED3A6SlAWQCa5Z8r/KtHjyXMVyD6AXtAgHzDeSKQfnYb0SbkgGstKn
         yWfhqpvJly1jRaGeD+V0Fn06BovuYDKp8s2pFxOswv+qnDDj/Jm5YRpdkaOSLs2U0sVT
         zLk88CgOxQ7jdnW1pKZV0JoBlCo9HDmA9KWbngm1L2YIHQ/WiWsRHqofbk6kg1KxZkqF
         kluQ==
X-Gm-Message-State: AOJu0YyMHsEJT3w42HjmjJ0Gso4ESp/O3iWftfmTzUkBd2MUiM+6thon
	AUlV3UpPcw7U00UWO4Wh1l13NMLfutuWzyKZAZU0MmOrflllODt/PyAF3M/T100DdBrR6S6D7PM
	F
X-Google-Smtp-Source: AGHT+IFIyfT746h81l+aKA/EPAZNi6qDZVF22zOr4dKKTRUyPpqGsSUkiXT9BZxh3Mcng2Rcsym58g==
X-Received: by 2002:a05:620a:4047:b0:7a1:c40c:2f7b with SMTP id af79cd13be357-7a34ef46017mr2278614585a.30.1723045422266;
        Wed, 07 Aug 2024 08:43:42 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c86ffe9asm5770661cf.3.2024.08.07.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:43:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 7/9] python3-sphinxcontrib-qthelp: upgrade 1.0.8 -> 2.0.0
Date: Wed,  7 Aug 2024 11:43:31 -0400
Message-Id: <20240807154333.533180-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240807154333.533180-1-tgamblin@baylibre.com>
References: <20240807154333.533180-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203086

License-Update: Rename LICENSE to LICENCE.rst

Changelog (https://github.com/sphinx-doc/sphinxcontrib-qthelp/blob/master/CHANGES.rst):

Release 2.0.0 (2024-07-28)

- Adopt Ruff
- Tighten MyPy settings
- Update GitHub actions versions

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-qthelp_1.0.8.bb => python3-sphinxcontrib-qthelp_2.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.8.bb => python3-sphinxcontrib-qthelp_2.0.0.bb} (58%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
index 0b4a2eb2e1..f51a0ba64b 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.8.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Is a sphinx extension which outputs QtHelp document."
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f7a83b72ea86d04827575ec0b63430eb"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=f7a83b72ea86d04827575ec0b63430eb"
 
-SRC_URI[sha256sum] = "db3f8fa10789c7a8e76d173c23364bdf0ebcd9449969a9e6a3dd31b8b7469f03"
+SRC_URI[sha256sum] = "4fe7d0ac8fc171045be623aba3e2a8f613f8682731f9153bb2e40ece16b9bbab"
 
 PYPI_PACKAGE = "sphinxcontrib_qthelp"
 
-- 
2.39.2


