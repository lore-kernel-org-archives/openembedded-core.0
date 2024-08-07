Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCAAC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:40:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.32310.1723034444645677173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KbdjQosY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428163f7635so12707035e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723034443; x=1723639243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhjCqr6f4ep4hC3iYsvVgOCFvS7NbFJD3H5GQ7vqjI0=;
        b=KbdjQosYoeqEz9Vi9RR21rYyHKOW5mFiJWP2mftds59hFuCsDW8V6qeGhcEoAfr3cr
         0RzzcGiU5IZaIHHqHNRVL+vcQv6pyCnX3mh0+aTgbIli1NjRaEfrdYPQO/UZgKEBKFNi
         YPEbIp7FkOHWx2k9z1T+ea1hFcp8z/lm2s5jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034443; x=1723639243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhjCqr6f4ep4hC3iYsvVgOCFvS7NbFJD3H5GQ7vqjI0=;
        b=SONnCqQgR41ATFaK9Ajt4C710mW+lfOTcA8/9c4QxIqaM5FCQjhXOd+4V2+r8hrHZa
         Xa95h26KCQr519MzAWjG89Ej96UIuz+qUZrZbH3i5KEKJBdraVRoCD6GmdBNtLiCLC2q
         rXUB1mz7+lj3qF+vBVWZbgf1JtClvQK4lbCa2egPVDQ+gGV/bSEQ/ipULIUQ4JknGt9T
         YfMsvb66uKwSqv36kGDVOU/DT9mlkAAo74nQkB8e5R3ngbdoMNI7wvhK+42ltrvYX/yC
         SBRgf2177b+XE9CiKayp+oCOjZ0jxCktDoGRZwOzWRWnNNa0j6YkUj6ThmXTgX9rOUA0
         WkYA==
X-Gm-Message-State: AOJu0YwZSqZfUxee/Dw4JJA2Gi9k7vXsu4ZXVMoxCN3K09pLuh2IUMOb
	H1QtqR4MHuUFj3ABw3kvEs/bwMYSnSsw1dAu+f0w2O1cGPMJQ8yw83R/yIXSVJVUGofL4kMWxHJ
	qRzk=
X-Google-Smtp-Source: AGHT+IGe45nVI4DjHHCQGWJ8snC+hEowN9WfD+QtebjLezeYb722gumpfHRLtCFnD9/LJdT/QrEWaQ==
X-Received: by 2002:a05:600c:198f:b0:426:5c34:b19b with SMTP id 5b1f17b1804b1-428e6b00c7dmr133747125e9.20.1723034442694;
        Wed, 07 Aug 2024 05:40:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff8:c4ec:1a07:92b6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cf83dsm26061425e9.47.2024.08.07.05.40.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:40:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glibc-y2038-tests: Don't force distro policy
Date: Wed,  7 Aug 2024 13:40:40 +0100
Message-ID: <20240807124040.187526-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807124040.187526-1-richard.purdie@linuxfoundation.org>
References: <20240807124040.187526-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203071

How debugging is laid out is for the distro to decide, not the recipe. If the user
wants this, they can set this. This recipe isn't special.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
index 5a799196346..8ed94386d26 100644
--- a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
+++ b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
@@ -102,12 +102,6 @@ FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
 
 EXCLUDE_FROM_SHLIBS = "1"
 
-# Install debug data in .debug and sources in /usr/src/debug
-# It is more handy to have _all_ the sources and symbols in one
-# place (package) as this recipe will be used for validation and
-# debugging.
-PACKAGE_DEBUG_SPLIT_STYLE = ".debug"
-
 deltask do_stash_locale
 do_install[noexec] = "1"
 do_populate_sysroot[noexec] = "1"

