Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E496AEE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 17:38:45 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.1002.1692639523916806882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 10:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=jhtLAvg/;
 spf=pass (domain: baylibre.com, ip: 209.85.160.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4106b6aa94bso24557981cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692639522; x=1693244322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67nU0RbW3Ua2VJNfQAeEky8u/lObEUAUSQS9/z5UWgk=;
        b=jhtLAvg/ypHHq13kvL2q+Wpzsl6QJ8v/LUZ0EAYPHv9Cl9GlIj8MNgLZR0+cdfZ/JT
         nReNjWKIn9Dbbat23mzUyWl5aUDF/bdMh2dzZQo8Eq9BqGNqVyVwq1XnmHlDQJDcOp1D
         jMeX8q2uqUoZMd77+vZ/fAVW3ws6O6Mty+0goOxVh1VAMAadLn8Sr3ybEFEv8zxUGcD8
         M1mIW+FLxiw8zPyR+LZ+SA5EBklK8hfhoYXd8f4/nMDVX4YYZCjMlLb6aJkqwXUXFcgi
         XVpPOtE1uuRefY/74DKiqUsamcO6+iDVdcOXBAVNeiK4NcL40WzWlLcwn3mpO73RzsEP
         qDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692639522; x=1693244322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67nU0RbW3Ua2VJNfQAeEky8u/lObEUAUSQS9/z5UWgk=;
        b=DCwf42ZwzQcR6lmjjfHZdWWJ0ibpLJf2SK7V/YKkyXjsntgC1PDH/wahtBHIMyrJhy
         KlCQZarPvvW5050X53ReRQvawsLxk4hT9AdTZ+J4e+zGTonQi+yfELnAGsZNJCcT2yS5
         a3c4LXv4Bc9poZmVMn852Egc5SIHXpGTDRfVv1pOtf6fb3zshx0uiCks7pweO9wt4KrK
         mMwooR5SEv3DZHb7/15kdZxOjfb2IcXBiAKUm2bnxMjs3bg/CvAlBuB2tCvZOmBHxzn7
         WhTmY0YcMdszRy86L9B8AbHvQBeOCUZL2pFGeClNdmumYltJqzaeYgcf0uOxYApz7/B5
         3HmQ==
X-Gm-Message-State: AOJu0Ywg7SffYJrCr61HPXUCgujrXBL8HJvrMC7KQ+pHclRyKNnTcSrP
	SxrJmwDd9xMT5BXkN+jjUe0sHycSL2zn5y2GbVk=
X-Google-Smtp-Source: AGHT+IE2+ZKTWF9Fl3uBk22aCx1Dn9t+LN1ZQ7j2b7q4Y17YqC3JXhMS11lOI6uNHG3PDMjSMGTZOw==
X-Received: by 2002:a05:622a:130e:b0:400:9666:4349 with SMTP id v14-20020a05622a130e00b0040096664349mr10094140qtk.46.1692639522770;
        Mon, 21 Aug 2023 10:38:42 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a5-20020ac84345000000b003f7fd3ce69fsm2513347qtn.59.2023.08.21.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 10:38:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: tim.orling@konsulko.com,
	raj.khem@gmail.com
Subject: [OE-core][PATCH 1/2] python3-cython: upgrade 0.29.36 -> 3.0.0
Date: Mon, 21 Aug 2023 13:38:39 -0400
Message-ID: <20230821173840.1337747-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821173840.1337747-1-tgamblin@baylibre.com>
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 17:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186480

Changelog: https://github.com/cython/cython/blob/master/CHANGES.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python-cython.inc                | 4 ++--
 .../{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 6aec6b012f..01829b9f33 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
+SRC_URI[sha256sum] = "350b18f9673e63101dbbfcf774ee2f57c20ac4636d255741d76ca79016b1bd82"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.0.bb
-- 
2.41.0


