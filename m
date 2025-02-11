Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8797CC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:57:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.746.1739311069874529547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oecmeO+o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f818a980cso52652435ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739311069; x=1739915869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvnsNq8UpKROkIPV/STDes4zcDOuP0INuQ1q+hG7xtk=;
        b=oecmeO+oyqblkmplsfC290WqE115b98rB+enKEJtgU1jBlsyiTKqLbDdYzogQbIcXQ
         2NubqhkT/OZ+PrDdIjtz/pNElRIebdUHBzlD1zD+lei+dfATdBxdLswBJT+nnWg76146
         u3lK1haSMkTTgnq/u2iJAbtn9TERm8hL8JVcodNunV+BXTM4up1yXk3Bdwi75ENNwBe5
         NtSp1RQIWCxiWWk0pCQIzCjPMHmsKN8xQpp+MG3duiEK3MKOb+1tuk4d56OHnHmskAiI
         mmNU/egPn7fmlaAyPW3RY/P/T283cj5mLEz7B8FPT/kDDhP+jSsT6EzkgopFsS/bdah8
         8dUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739311069; x=1739915869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvnsNq8UpKROkIPV/STDes4zcDOuP0INuQ1q+hG7xtk=;
        b=sM6DdPO55pQ1xyCgMZypb8l5MkjkU4gsA7Acx+iBR8vttw6DXtfuXGrSdU7PhIp8L4
         mUB+0UHvs/XQ8+QpQaAu9tG3C/u5E6qPTbE4N++/gCiLk6KtPz9i65KUOvuW1KpNyE0a
         bgriXGbZ+3JmJC0Tc7lNd/pHE/BlYUPys26+YEUHoN3zMMLiTMdeyy2yQkWkiX51/XHJ
         xaC2JCj+klmzcZvlfiU47nuoBacO+i+VhbJc/6nI3iWk9msKCL9bZwagIkea0LuKnqhF
         tki3xrCy8e+NyLNrwlVhwQ4zu46V/tqZ5/jGeTpstxB3vfTphX6WmsKVs4mWo6YtbiRV
         pciw==
X-Gm-Message-State: AOJu0YzGoWTbmKExFmZb6b5pUQkU5ePTNFbwDSvL2psfVyS1l1nvbzAo
	njLxdd5dCiJjr/4c4/J5YFrxdKK2/zsH6cboAFrigRedmB8fI8dIz2qVF9XXwd07iIvxHHBtnLh
	V
X-Gm-Gg: ASbGncute1ttFlQDUMUMqq7reAMCjcmhogRnY01fne5mYeYEaPMXRW7NlOx16DCYIJ7
	cYMA4qtbSE229yUUwFS/p5yGmVxZlt31E6slF5Q8mu3+XA+a2i0CwQaUncDGZYgUhsPp7Ooht3I
	bFD9trh87xdITWqYZyIkmhO3stDNHC+sZiTAqr0Eio+noDkb71cg1A0mZIfLfwTqQg9vZZliSXS
	1+VUprHoau2Rhn5Oasn25Yc70vIt/9P5xHltnfo7tOioGJbRh4x2kVK+kHZaSToWRUNXqlcoIUB
	q4u3
X-Google-Smtp-Source: AGHT+IFYRECLn8+mYErwAR2nTB+V0DYrQfEO8olvG+PUXjh8BgL20bTIWKTCVuiwIY77/Pk/UUOvBg==
X-Received: by 2002:a17:902:cccc:b0:21f:5b1e:11ef with SMTP id d9443c01a7336-220bbc64587mr16377545ad.32.1739311069137;
        Tue, 11 Feb 2025 13:57:49 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6aasm100210495ad.12.2025.02.11.13.57.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:57:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 4/4] cmake: apply parallel build settings to ptest tasks
Date: Tue, 11 Feb 2025 13:57:35 -0800
Message-ID: <8270433b138284df77ed9eb21557922498663c51.1739310940.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739310940.git.steve@sakoman.com>
References: <cover.1739310940.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211193

From: Peter Marko <peter.marko@siemens.com>

ptest compile and install tasks do not have parallel build settings for
cmake. On powerful build machines this can cause overload situations
and oomkills.
Observed when building qtgrpc with ptest generally enabled in distro.

Having this in ptest class is suboptimal, but creating ptest-cmake class
just for these two variables is probably overkill.

(From OE-Core rev: 3c311fbf0c2090268e9b83123d762b05b61b4074)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e1c3d7ddb5..e79f8a7435 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -67,6 +67,8 @@ EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-compile-ptest-base = "${@oe.utils.parallel_make(d, False)}"
+CMAKE_BUILD_PARALLEL_LEVEL:task-install-ptest-base = "${@oe.utils.parallel_make(d, True)}"
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
-- 
2.43.0


