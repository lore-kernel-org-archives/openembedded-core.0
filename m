Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42164C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.4761.1645478655899762335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdQtNZ6y;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so387024pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=UdQtNZ6ybvfa4OIvCaqf18miKlUngwZoXyYuUlv1hBMfUgWRiaQfm4yZosVpoV5GCp
         mEFdfL1PotHMU9oGJOiaPPC7SohGVwjtfEEqGCUq8duNj7L8srl1UeH6i3nKEdxFJgsb
         PEI/u6ZHJZyiZBuCTs2PE+Yc8hLF/UQhvgkqhSUaJggAArKmTyjj9sgeEdtz1dtLQOAf
         aiZUQ+KKzwgIufh3P4+Nmjmx6gMqzgYnPYnvpWMtDL3vCcZdWqMW1YKJQxX15XuwAiW5
         Q9WdMjzLpEk67OECo4Mx1YoTSoIQUK7xcLw7db5rqhaASu/Sey0SjUU7qS0ubWfPgWFn
         zLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJCncBKA5qbLLBPKiBc4Tm+G6oyg4F90VBwS2JXToE4=;
        b=RS+SLWPMAE+dcTKFDakVuXBLUQnUI0LzFowMTxttGLohl5pG2vEv2Xt1ieodWONhPH
         zj2ewl0p66ysOaGYr4p5KAoggcs07tVSSaeOkEVK89q7yoGRTvNjiWx/20c3YTNVN74Q
         IJJhXn4U4VG4xVa/PAM3qt0/waQ5GuCUhcVlz5AV7orV2e4mWelLwyCCXA9kQ92QElor
         IYUXsAYjjnPwTJdO83Kx9sV8Fv5hahSL0Q0JB7nqp9bxGOAgdrQh9EhKliORupTQfSIi
         /KbKFzg/WD6c7jzsLGu3kHVa2EvhD87tfihryzSNqVLeDZ12WLqWqlT55u0bgNIO905K
         kiOA==
X-Gm-Message-State: AOAM533/g9P/WRl1CC3o84m3jzIdeIjmUy/knLhixGxUcgsiur0qhIhn
	n1tz24cVJxH0ABVvA//kGVbVoRvlmzdNew==
X-Google-Smtp-Source: 
 ABdhPJxPHqQHKtd5LPV3dVkmw+dUQy1hbA7zIsmfTYmSOpFMJypzsE8V20JJQeUL3IT4dyzioSS+iA==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr20867238plh.156.1645478653992;
        Mon, 21 Feb 2022 13:24:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 09/32] python3-git: inherit setuptools_build_meta
Date: Mon, 21 Feb 2022 13:23:24 -0800
Message-Id: 
 <40a6f45f9fd4b6776c26aadb25b5758c9cbc7536.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162085

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-git_3.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.26.bb b/meta/recipes-devtools/python/python3-git_3.1.26.bb
index b6171a0e4d1..8f4b13cc15d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.26.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.26.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8b8d26c37c1d5a04f9b0186edbebc183"
 
 PYPI_PACKAGE = "GitPython"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI[sha256sum] = "fc8868f63a2e6d268fb25f481995ba185a85a66fcad126f039323ff6635669ee"
 
-- 
2.30.2


