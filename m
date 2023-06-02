Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A5CC7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 16:48:28 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web11.591.1685724505989782999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 09:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=CMo1gl9D;
 spf=pass (domain: baylibre.com, ip: 209.85.217.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-43b2c2947ceso142317137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685724505; x=1688316505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6sB8l+GdizAWqwhxxe7qGYtl0fKJumSJjW7RM4P6wZY=;
        b=CMo1gl9DCr/lAaVXX934i/6ipBNXyy8qLIJqRAMUaXy0Nq5iVPl+AGdgQcZNxcxkVD
         2zEiMZLXIkJPoUeWPlItZdlEsg91gs8lrl4ivP26dWSD4KwdXwsyBTSDBh9QWnJEJoY5
         6E8CUp69EZqOhrm1CezyjtEBIIuddOxnTSADhtzrpAfel2n9OOPI13QUsSXIIP0/YkmH
         Lblv0fdQT77U8bnuyBuAlt6vSOE91APkZqRxnUqj8ZXQiD2UmBxg3V14O5RPq7tQ+pk0
         4ytyU6jFdvqClqPINozy3plVYUhsWcPDhFPePGv8CeI5YSd53lAq/Jnxa8frcY8Jqi5T
         JLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685724505; x=1688316505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sB8l+GdizAWqwhxxe7qGYtl0fKJumSJjW7RM4P6wZY=;
        b=W/HogES2T1+YIgIS91ptTQIKkbu6X0DOqlFz7pdFyPzXyKIph8SzXyySMKFqQ0Z8G3
         dg0JDuQEbs65pVAw7VARQ9KrZLtUKlLdYtv1v8daRnc4YqSQl0fUjsb7zSpOLCYCbcfC
         K9mZjowzLasHtQRbOmtcO9J8rIUXBOFAA9dDnaXb5eFax+ajQ9tIVNv9oihEStYlKtC+
         CS4u5UZWOOw45oV3LZ2os9j5JdZ8bLC4WtEcoZXEd7Q6eeBbwTAXnGSlIQI09l5F26Wa
         8BE88IGRvgnJEQJLEs6hac7fNmSDSkXW73IWhJTBETxc+HBS67yEvsIR64kz4UCkqsVY
         5mcg==
X-Gm-Message-State: AC+VfDyvEzzN2aVSQdi4/deIfJsT47Fh8hovD94ECs/dngDnRBKTXAPD
	PlEcGz9fhHPBwFyt1aaAP8pIkzLzpEkWnADdqEs=
X-Google-Smtp-Source: ACHHUZ7EzcPprvjjT/R3b62kucUb/EbT47kBlbVKoMbFRE3G92+iYnE8HAcvDqEg7sdy+P2qDfDUNA==
X-Received: by 2002:a05:6102:316f:b0:439:3b69:3960 with SMTP id l15-20020a056102316f00b004393b693960mr3895856vsm.26.1685724504734;
        Fri, 02 Jun 2023 09:48:24 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id 22-20020a05620a06d600b007596a2359f7sm803996qky.120.2023.06.02.09.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:48:24 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-webcolors: upgrade 1.12 -> 1.13
Date: Fri,  2 Jun 2023 12:48:22 -0400
Message-Id: <20230602164822.2223543-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 16:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182335

Replaced the inherit of setuptools3 with python_setuptools_build_meta to
make the new version build.

Changelog (see https://webcolors.readthedocs.io/en/latest/changelog.html):

- Supported Python versions are now 3.7, 3.8, 3.9, 3.10, and 3.11
- The codebase was significantly reorganized and modernized. Public API
  is unchanged. Imports should continue to be directly from the
  top-level webcolors module; attempting to import from submodules is not
  supported.
- Now packaging declaratively via pyproject.toml with PEP 517 support
  from setuptools.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-webcolors_1.12.bb => python3-webcolors_1.13.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-webcolors_1.12.bb => python3-webcolors_1.13.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_1.12.bb b/meta/recipes-devtools/python/python3-webcolors_1.13.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-webcolors_1.12.bb
rename to meta/recipes-devtools/python/python3-webcolors_1.13.bb
index 02f6c9fed8..2a6be3f9cb 100644
--- a/meta/recipes-devtools/python/python3-webcolors_1.12.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_1.13.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
 HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bcf737478d2fa8af5bc954231df056c6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=702b1ef12cf66832a88f24c8f2ee9c19"
 
-SRC_URI[sha256sum] = "16d043d3a08fd6a1b1b7e3e9e62640d09790dce80d2bdd4792a175b35fe794a9"
+SRC_URI[sha256sum] = "c225b674c83fa923be93d235330ce0300373d02885cef23238813b0d5668304a"
 
-inherit pypi setuptools3 ptest
+inherit pypi python_setuptools_build_meta ptest
 
 RDEPENDS:${PN}:class-target = "\
     ${PYTHON_PN}-stringold \
-- 
2.40.1


