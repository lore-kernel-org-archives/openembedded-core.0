Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C81C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 21:48:59 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.8403.1710366537511623034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 14:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fHmlUOBN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e6ca8c8be2so103401b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710366537; x=1710971337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGSWks4Y6+Z906KQpu3c1m3Gz8kmCpIXHIXvHbhj1aY=;
        b=fHmlUOBNMo6whCEKFFZ2G6Eor0K2039b8olVjPld7ubjkmtVqFCJLmcehZs4Aci32u
         q2pU/JylbwUZs147QDaL6EodSpAmvXAvUjPtqjybghvt40czyucr5ZOeEr8/3gR96ZEu
         LBxDmE3uHomsUQQvBUDGbA6HoEU2f7lB+kk50YW4Kvf8LDNjyNQVbhff74iwTvpQI0r2
         YdTagcG7voufnyebuINxy+GiZBHIBbFTsK43ND6hiA4gu1TB5fl9WP856fm4u+E0iCPB
         iTsHt7nzwqNgwjpC5SjGH4MG9RWg6VhjFQdAOptW+nOnraThAVn+Y0xOggGxQGcQj7g1
         Vcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710366537; x=1710971337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGSWks4Y6+Z906KQpu3c1m3Gz8kmCpIXHIXvHbhj1aY=;
        b=gBgM+IH/ZnepXEty7fLaXLVM78AT87NBKtfBq7I2/41/JQNoUVHzBTg/xavc/rJ9+V
         M8UDUFilQCK5WVSPX9wQnCf9XoLdYJnR7w3F00Ca9xCeK2eGDaPEJbJVFlUy+DbFj5bb
         sQov2fMW3O9s7w0CeOh6gw7W3sgvgE9wWNlgqNIPof4lIsIc0jbV86bs0G+Y1/VzMZcf
         1exSNL0lPGH5bOznCYz50BZ8jGnrpzZtgJEEqEvP9EUcUdZli6Ht21mYLX7RoPoRrgCk
         Fe3TcDTgm+YIQFkkrvc1qDVXCdJT8GH+xEgPAebWz0emjk6FE0i7ZEcPqQDiah7+n3Ho
         1YHQ==
X-Gm-Message-State: AOJu0YyJpJXMIqyGc/WFM+LVJanijv1i1m0R+lamJUOeMCf8aFBSOqvj
	gbvauTxiDXjlDcq9M2E/CL1M+4vIETZuFSRkNB43/UvqSisW7CuEd5T7Qwrs7FgaSX32jgGuJPM
	cS6k=
X-Google-Smtp-Source: AGHT+IFiboiYMFmfEqwDYeNN4vW/ZBKXtU1d+SLSl4n08vE8RdOTZhxaTVXFnB1QrMUz6yAlyZ54rw==
X-Received: by 2002:a05:6a00:9388:b0:6e6:9ac4:bc17 with SMTP id ka8-20020a056a00938800b006e69ac4bc17mr4067658pfb.5.1710366536707;
        Wed, 13 Mar 2024 14:48:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id it17-20020a056a00459100b006e6b2beb030sm87226pfb.48.2024.03.13.14.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 14:48:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 3/7] python3-jinja2: upgrade 3.1.2 -> 3.1.3
Date: Wed, 13 Mar 2024 11:48:41 -1000
Message-Id: <f8f89b901e3f8db3a9e61ab49976beeb9531d1c2.1710366394.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710366394.git.steve@sakoman.com>
References: <cover.1710366394.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 21:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197087

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix compiler error when checking if required blocks in parent templates are empty.
-xmlattr filter does not allow keys with spaces.
-Make error messages stemming from invalid nesting of {% trans %} blocks more helpful

upgrade include fix for CVE-2024-22195.
(cherry-pick from Oe-Core rev 8a0524464583d69df7746253f5020c2c125a8e1f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.2.bb => python3-jinja2_3.1.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
index fa6d930a9c..18057809c8 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
+SRC_URI[sha256sum] = "ac8bd6544d4bb2c9792bf3a159e80bba8fda7f07e81bc3aed565432d5925ba90"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.34.1


