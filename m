Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83264EB8FCD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.7698.1694004530723811755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=knvwj9Bb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c06f6f98c0so28422725ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004530; x=1694609330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8kk28tD3z5Uft0SDauK1drvzexz0cR5JeNYV9LpIgk=;
        b=knvwj9BbykKO2+o7axhsL0aAp7dCMNnr9gB20xer5yOgmdvyJMfPYh0m/kMYfzh12Q
         aSEqfDQcrqzB14meo9uVOhKV0ZmcQwXhtXSkl++t+kcXwHryr0TaxjJmdKxau44tmtkP
         nsmamAdDa6wqeZbPlsPb93GKK9Ir6PZc2Bfck6nQ221mwPgbQ3vRnT9jkcKGxMMVTc4Q
         Xb+y6yJ+qnsaKOs9PnGNpgBeK+kty3Rd1YVxOsVIWUH65vfEmkumGn+e+KGE6k8MmQRx
         xW0XvS7F+hw94CCCEngkt81G2q9a6RkFmtRKb/sQCuoVHu9iS0IuOxr6sWKnyN24xZJM
         3ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004530; x=1694609330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8kk28tD3z5Uft0SDauK1drvzexz0cR5JeNYV9LpIgk=;
        b=lBhmyhr1zK2eCim/OWneSqmosAofmvsPlplQMOKfCEmtTw5Q992WylPvvkTSskHRE1
         b414uZUrJzVRuN2sET0+ZVrlsyGYm3N3++sVUZUUcXBLCBNkVuCsP5l1Em0yFdCQHndb
         G1JG0B0L+0oYgy+rUcP3lvIxRLGa3Q0Ddy7z/cJRyTvogiqzdeXiqriYEG/JV65BKc1O
         QaxBhe5f4po1gAWBDt2NwgHJ0FdI3Jo7xStbFy7Qz3kMFKDBS5d2BfGOt5KVtDFlqYsL
         HgF0owOOQrmvmXqQUaG3YjSo+ekKBrR6eS3DvLJRqJTXCC3Q9RSxtateJSXSp25aSx0Y
         RWcA==
X-Gm-Message-State: AOJu0YzRc9fSUV2jPqQToDJyAldDIpAy+wYM/83NzMKlitBcuu4poFHb
	lifJz4XzI4Greq1R1g+Y4mNsdCPUImUDbvlOuAc=
X-Google-Smtp-Source: AGHT+IFnpqITbuzI4PD8MY7cJRoJNlI1j2SmFBNV2rayp0djuTZG85YmOv7Qf530kMYlGGZWoUIoKQ==
X-Received: by 2002:a17:90b:1a8b:b0:25b:c454:a366 with SMTP id ng11-20020a17090b1a8b00b0025bc454a366mr15779445pjb.5.1694004529791;
        Wed, 06 Sep 2023 05:48:49 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/14] python3: upgrade to 3.10.13
Date: Wed,  6 Sep 2023 02:48:18 -1000
Message-Id: <a30e51b8d13912f0d68bfffcd2d8ae6431d2b863.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187307

From: Chee Yang Lee <chee.yang.lee@intel.com>

Release date: 2023-08-24

Security
gh-108310: Fixed an issue where instances of ssl.SSLSocket were
vulnerable to a bypass of the TLS handshake and included protections
(like certificate verification) and treating sent unencrypted data as if
it were post-handshake TLS encrypted data. Security issue reported as
CVE-2023-40217 by Aapo Oksman. Patch by Gregory P. Smith.

Library
gh-107845: tarfile.data_filter() now takes the location of symlinks into
account when determining their target, so it will no longer reject some
valid tarballs with LinkOutsideDestinationError.

Tools/Demos
gh-107565: Update multissltests and GitHub CI workflows to use OpenSSL
1.1.1v, 3.0.10, and 3.1.2.

C API
gh-99612: Fix PyUnicode_DecodeUTF8Stateful() for ASCII-only data:
*consumed was not set.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.10.12.bb => python3_3.10.13.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.12.bb => python3_3.10.13.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.12.bb b/meta/recipes-devtools/python/python3_3.10.13.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.12.bb
rename to meta/recipes-devtools/python/python3_3.10.13.bb
index 74f1defc95..ba53a09ef5 100644
--- a/meta/recipes-devtools/python/python3_3.10.12.bb
+++ b/meta/recipes-devtools/python/python3_3.10.13.bb
@@ -43,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "afb74bf19130e7a47d10312c8f5e784f24e0527981eab68e20546cfb865830b8"
+SRC_URI[sha256sum] = "5c88848668640d3e152b35b4536ef1c23b2ca4bd2c957ef1ecbb053f571dd3f6"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


