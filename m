Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A880C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 19:08:28 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.3085.1685560101163557056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 12:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=KtgPOR9m;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f8115ca685so33334661cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 12:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685560100; x=1688152100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDeQ/iwNkpxtt5HdcHleNCgENBIL17kOE70CRVN+b78=;
        b=KtgPOR9mlgApTtAs72UkfyINsH0knRt+2KzrzUW91ShwKEw48O2ocW5vhmVWa8ACkL
         CnU6RtCKKbto3hh8ajKFNEhgihE4/4BZTmQ1Z2irF0zrtvv4fvvgnx2Y2Y0yzWaaCyBF
         i58HEVQCYV8+uvl83C+tBH69+TOag42s8Jlhaao+0wqv9NWuRVVrgKqZA/GbKEvMf46y
         9KCbqUcJAqEVUFrxsjRgGjaAZMuxehDPLEAKOf09Z4PIVT5A4gGGFzI7ngBWaZ+MB19o
         EzyaZTJG/Cj0DzDPm/0kB8kPmOmpMicDhMXFsiINn0//ZlgRaT7+aP4pqbqGCYAP0smg
         lMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685560100; x=1688152100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDeQ/iwNkpxtt5HdcHleNCgENBIL17kOE70CRVN+b78=;
        b=AUczqrFRzE8OV1qY66NxUUxDQ4H5sGdTchvE6xYHFtQ+UJS1Ss38fmW7BumrOfDjBu
         Zpw5LhLczKXpax/WP+Q4PQseszUOLjvzYiQzIOrEkvmUfqW7Fi6qcxevacRQCnJZ3FQQ
         npUANzdZaV7qtYSBW1P4qh68uA6z06SajlgHI71UjxYUAdzq9opi8FoIDM03MAuqBNu7
         B5tXoclVTiSlU5Khmo3FdTMbt/EslMDItKWFigjV+JzuvhjQqSrkvZDwOxJB8kPFxZq+
         xEvPGrYjNCOdId/Rd67I1ur9i56x9rd7VRP97jfYhjjS2UrHHLJG4lJGeyU8UZS9if4i
         Q9TA==
X-Gm-Message-State: AC+VfDxN3bLCXLpD5suksf56nnNH2VZh8VdifHcqH3OTkMNbA/tb251h
	cR1VkuAxtcE5+c6Zj1Q6HuItvFRwPYzptUUtYAc=
X-Google-Smtp-Source: ACHHUZ4a15DktPrr1w8XiIn9nC6KP5MydkmBm+H6YFoa4T+itNqG26L4CMHFTkLcNtilP4vPNb8v0g==
X-Received: by 2002:ac8:57d3:0:b0:3ef:5d8c:20d8 with SMTP id w19-20020ac857d3000000b003ef5d8c20d8mr6436530qta.6.1685560099871;
        Wed, 31 May 2023 12:08:19 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z11-20020a05622a124b00b003f6b22de8f8sm6338462qtx.91.2023.05.31.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 12:08:19 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python_hatchling: remove empty python sysroot dirs
Date: Wed, 31 May 2023 15:08:16 -0400
Message-Id: <20230531190816.1656739-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 19:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182035

In some cases, empty versioned directories are being left behind in
sysroots from previous versions of packages. This appears to be found
with recipes relying on hatchling, and causes errors at the do_compile
step:

|   File "/workspace/yocto/manual/openembedded-core/build/tmp-glibc/work/core2-64-oe-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packaging/version.py", line 197, in __init__
|     match = self._regex.search(version)
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: expected string or bytes-like object, got 'NoneType'

To fix this error, add a do_prepare_recipe_sysroot postfunc in the
python_hatchling class that removes any nested empty directories from
the sysroots during build, so that dependent recipes don't get caught
on them.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python_hatchling.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-recipe/python_hatchling.bbclass b/meta/classes-recipe/python_hatchling.bbclass
index b9e6582eb5..a20e243161 100644
--- a/meta/classes-recipe/python_hatchling.bbclass
+++ b/meta/classes-recipe/python_hatchling.bbclass
@@ -7,3 +7,12 @@
 inherit python_pep517 python3native python3-dir setuptools3-base
 
 DEPENDS += "python3-hatchling-native"
+
+# delete nested, empty directories from the python site-packages path. We don't use 
+# ${PYTHON_SITEPACKAGES_DIR} in the path specification so that python3-hatchling 
+# still builds OK
+hatchling_rm_emptydirs () {
+        find ${RECIPE_SYSROOT_NATIVE}/usr/lib/${PYTHON_DIR}/site-packages/* -depth -type d -empty -delete
+}
+
+do_prepare_recipe_sysroot[postfuncs] += " hatchling_rm_emptydirs"
-- 
2.40.1


