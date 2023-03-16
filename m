Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB76CC61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2189.1678928596771057735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=goAFHFUi;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id ja10so106476plb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOUehPerahjyMEOjSLYLVPPoIo4AhwC1GNiYj656nHE=;
        b=goAFHFUiAhSsLg4bhQ3PMzK4oJwZB7nAS//q0oPoAluNA0HzCgj2EjMq/MFY9bO9Dh
         1gGdAgauhBn9OIFwsne4VVxxe+41ogl1bsEAVbupFfIOyRA7IqjITUu3JF8CUr2Cs15m
         FtTkKZ7ml5jvabqrgh5Q5rSA2BFVGTXJPKuOphSuaGhBAm1Xi4SrOBstP4Xg3v0QXSY6
         seefU/fCMOC3pGEbS9q6tx9fHYMbBWCT8QLVFrN1gwTaufDFq31W2BmP29vLjhDigs51
         Xeima1VEs9RZ/O4dcJV3ussFxOOz9d1k4cyFeKUXBi1A0E5Ulj7i4YTlIteYwiqQuXc5
         m8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOUehPerahjyMEOjSLYLVPPoIo4AhwC1GNiYj656nHE=;
        b=SmmffQsXkkManbNKqc6p/sKAsqNDnyYCmNyhKrZKjFVAie4qp0YPmP3f3d35ryrtES
         fb2dQmN4FXjWfG9EPjZxO1gyPW5SlvqyHbdkXPWXUolrq7IZJkBW1LzwsI6pCb5xxzp0
         QpcresP7z8ZFgSiVMomGbLLerbmTGeYd4A8c4O8ORSQ3l/PIb1FegAAf2wxN6mzj/0Ox
         NKRgX4K1UQabJfROwyKjn3Mc4UfrYXTaj/nybs/ETTxce2sMHItDY+i0exeGQPjW/M+3
         81oFWJ867MhoZ4dDfWR0KwpGugpLRCbTqwHeuXrDzZvdH5GZGGQ9FeCcMTSPFVHLxUnQ
         k6Qw==
X-Gm-Message-State: AO0yUKVrSHUzmO//GInfFbdRtefCBdDhzcP2k7ZOso8mU+tNm0PU91Do
	JQjrNA4f4hv88CST13c8WJZhnwwDXOY=
X-Google-Smtp-Source: AK7set/bLoq6fpt4PX5Lx92ujP39d57PIpEPuJMBeZduh4jWiaTyMGaywxSMceWRZghDR5g6l23d9g==
X-Received: by 2002:a17:903:1c9:b0:19d:1725:a655 with SMTP id e9-20020a17090301c900b0019d1725a655mr1787717plh.13.1678928595791;
        Wed, 15 Mar 2023 18:03:15 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] python3-pytest: upgrade 7.2.1 -> 7.2.2
Date: Wed, 15 Mar 2023 18:02:57 -0700
Message-Id: <c252a5adbac333a3415b2d7155add777edbba7bf.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1678928363.git.tim.orling@konsulko.com>
References: <cover.1678928363.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178666

https://docs.pytest.org/en/stable/changelog.html#pytest-7-2-2-2023-03-03

pytest 7.2.2 (2023-03-03)

Bug Fixes
10533: Fixed pytest.approx() handling of dictionaries containing one or
        more values of 0.0.
10592: Fixed crash if --cache-show and --help are passed at the same time.
10597: Fixed bug where a fixture method named teardown would be called as
       part of nose teardown stage.
10626: Fixed crash if --fixtures and --help are passed at the same time.
10660: Fixed pytest.raises() to return a ‘ContextManager’ so that type-
       checkers could narrow pytest.raises(...) if ... else nullcontext()
       down to ‘ContextManager’ rather than ‘object’.

Improved Documentation
10690: Added CI and BUILD_NUMBER environment variables to the documentation.
10721: Fixed entry-points declaration in the documentation example using
       Hatch.
10753: Changed wording of the module level skip to be very explicit about
       not collecting tests and not executing the rest of the module.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytest_7.2.1.bb => python3-pytest_7.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.1.bb => python3-pytest_7.2.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb b/meta/recipes-devtools/python/python3-pytest_7.2.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_7.2.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.2.2.bb
index c7610d440c1..4e2c86f641d 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "d45e0952f3727241918b8fd0f376f5ff6b301cc0777c6f9a556935c92d8a7d42"
+SRC_URI[sha256sum] = "c99ab0c73aceb050f68929bc93af19ab6db0558791c6a0715723abe9d0ade9d4"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.30.2


