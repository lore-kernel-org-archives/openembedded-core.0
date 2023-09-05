Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D08CA0FE2
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 17:30:54 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.28127.1693935052486837761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 10:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UuCmb53R;
 spf=pass (domain: baylibre.com, ip: 209.85.167.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a812843f0fso1539617b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693935051; x=1694539851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw5XOqHxREF9jPHDgJVUjV8UDJFED7pqEOFQxdopITQ=;
        b=UuCmb53RQITd3sgZgr0Yjt5K0tX6DxIs3REbBJqfFQbA1SWljGW1khBfROrxyf2jZG
         TU6fkNHPzM1fNDqmtxTArMUq4pf1tYyo6piw0P19d4HlMakLaMP1UIF7AHRrWnY0htXA
         pKLQ1hCtqAyoZEZuQ85ADWIsSc/al7vFWNvR+Z6TqNlvD3YOJGxUUsLFX4JsBSlfVEhY
         0x7C+M1M63eHfAtc2Ve6BbwQsM0SZrRjxpfJoPNrc+/bLRqmtRlf/bc/azo2P5V2+HDF
         jCfbv64drc8AaknZKYDzFDjv1wYDrk6aQu1DmxgLSkEtmMqlJd7X+dO0BWhLjp3OB7LO
         Ueaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693935051; x=1694539851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bw5XOqHxREF9jPHDgJVUjV8UDJFED7pqEOFQxdopITQ=;
        b=QLfBwz168ODXbwiDTnGUONrJhholKq/sRziZ8k/EBeHS22WdBOSSOIFRDIRFxgGUHR
         AxIfCNDtWoqh9fpgHAZp1NSSZrjwI6Mc7rXTnO6FHi+q1zAi7LTiy+VVLTFLKO5Mvg60
         EJ4sehIE+lfKCoeYpNxlNvN1l2O5xFML5EvhQt+tufOnHYeAXSP/KevzD3Y8aP4coXZt
         HmopTSZZJ5lMC59C1Vyp17Jb+25og8e6YpIQizd3cJI6OKPHNnL1z5Po2b9F1LVZjibb
         zS8at3NYWgbItRrBDSOxKjA/RtwaaT3/XxPaoGNXfljqvW1RQBiIH1DZM1OAbml+/d2J
         3pqg==
X-Gm-Message-State: AOJu0Yy3xpKpJO0ZdmaQsP71VH4oKvy7W5kMBdf4NpuouISzfhESYQbq
	yvz1hOTgamm7pEYlOd+qpvAvSVDteFd1mqDmWn0=
X-Google-Smtp-Source: AGHT+IFxk/IOCJfRliqQgJce18Q8Ndw4GvPgLRYaYPf1dGmt+XbbdAoTt1fbpzWow1nYgsEmt769lg==
X-Received: by 2002:a05:6808:2394:b0:3a8:5fd6:f4d0 with SMTP id bp20-20020a056808239400b003a85fd6f4d0mr14344518oib.49.1693935051742;
        Tue, 05 Sep 2023 10:30:51 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id t15-20020ac8760f000000b00411fcc18cc1sm4479430qtq.64.2023.09.05.10.30.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 10:30:51 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-git: upgrade 3.1.32 -> 3.1.34
Date: Tue,  5 Sep 2023 13:30:48 -0400
Message-ID: <20230905173049.2449088-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905173049.2449088-1-tgamblin@baylibre.com>
References: <20230905173049.2449088-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 17:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187248

Changelog: https://github.com/gitpython-developers/GitPython/blob/main/doc/source/changes.rst

3.1.34 fixes a resource leak by properly closing a lockfile after
opening.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-git_3.1.32.bb => python3-git_3.1.34.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.32.bb => python3-git_3.1.34.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.32.bb b/meta/recipes-devtools/python/python3-git_3.1.34.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.32.bb
rename to meta/recipes-devtools/python/python3-git_3.1.34.bb
index f217577eb8..308c787c2d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.32.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.34.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8d9b8cb1e80b9735e8717c9362079d3ce4c6e5ddeebedd0361b228c3a67a62f6"
+SRC_URI[sha256sum] = "85f7d365d1f6bf677ae51039c1ef67ca59091c7ebd5a3509aa399d4eda02d6dd"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.41.0


