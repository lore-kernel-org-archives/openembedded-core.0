Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97640C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.7529.1653489050340705117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GrEbDFip;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id r71so19074287pgr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ARa+iOkgyOnIa/d+3ScfCK1nRAdoM8AMx32ifEDVRbs=;
        b=GrEbDFipluqs4tjct6gYFG4I4/9td1iuLD9zcLLZaB4f9khCli/2SuUKWjVNpRTqXy
         eLKNYGQ2cTp1P1b+OLzvaa9/t/9n0TLS+VsbvLRhU0jnN3zoq93O481n2wsCu0lyL/ZW
         PdRr6JffztQD11kXgM8DHgHSI1dgrA8OoNjeGqPx03A5/zMmEZFhMRe9VTiE1mMHGz9Z
         h8Efsuv4i6HVUWDwjHyK+YsMWdYSvB+JrY1im/ANg7VVwYFFLa/KRzht5cf5QMsalr13
         aJMNvCjhLBufMq0UojKJmlR8ozuuGHziUxUxbPUHllcFgYT68ch5ybv+rjol6cA02Wq0
         8fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ARa+iOkgyOnIa/d+3ScfCK1nRAdoM8AMx32ifEDVRbs=;
        b=GFbSt8PDGN6VyyLYvh3LITU9cSyX21AsoR5YTkW4LR2Pwo+ArVu/CriqmSO/GfnyWc
         0dmzZj05eyD0+PY74rvNDl0z7JBROP6mtNloQbQUTfcVFX3Po34Hhzary4Shmw8TkvF/
         6dfogfUfMXA3xcH5en9PztmrZVu03m15QUThhvfmVZpUEUkgCgUrsOiLoU/8cJKludy6
         3XebhUzxU9taeP7+q6pww+UzL+s9lhVWnlmsSy4z6sH8cbcklX2cYQh7JJWXlwkWm3e2
         Kcwsdy5HNtvrT5j4B+oO72kHHlToeO0R0WLnwKFM44j9Maf0d00F2WUBQ3sEAb6ZSanv
         i6JQ==
X-Gm-Message-State: AOAM530/FY5Pt68KLOj0MycLOHpIJSQIvii6v/B4UC4IWhCVFUwnOZFk
	MJzhpNUmAxPM7aJXoq47oqkg5843YQm9k3cf
X-Google-Smtp-Source: 
 ABdhPJweCGPQH/MG0NtcnjseaG4fOz5TTsrBIIxN8PmNA4AyzMeUaEDw4tqz0CkfZnekFhFUQpLnww==
X-Received: by 2002:a63:7c4e:0:b0:380:8ae9:c975 with SMTP id
 l14-20020a637c4e000000b003808ae9c975mr29659645pgn.25.1653489049263;
        Wed, 25 May 2022 07:30:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] license_image.bbclass: Make QA errors fail
 the build
Date: Wed, 25 May 2022 04:29:47 -1000
Message-Id: 
 <72aa42425e456ab0210129df01d829465acadb6d.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166145

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

If, e.g., license-file-missing is added to ERROR_QA, then the build
should fail if any licenses are missing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd91c4bec8335cab2bbd0b33caf50d314ca72bdc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license_image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 7e1d0e08a9..3213ea758e 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -104,6 +104,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
                                        "The license listed %s was not in the "\
                                        "licenses collected for recipe %s"
                                        % (lic, pkg_dic[pkg]["PN"]), d)
+    oe.qa.exit_if_errors(d)
+
     # Two options here:
     # - Just copy the manifest
     # - Copy the manifest and the license directories
-- 
2.25.1


