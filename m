Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93380EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.7303.1687919428812375800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FVxha/P0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso2863208b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919428; x=1690511428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqbcmbCBYAp+zhG9717TcnTFy9vDhEQDYEueVcWP4dA=;
        b=FVxha/P0jZ2vKbqv8KGlFYFaRT6vl1Kwcj17DV0HK3Ruf2sgcAr7qp0k3R/VX5UsTF
         oowmdHvtW65piJrXoyCwS6gvLztgcFdtjay6VQFFSZHEGfiS3zI95t1mw6tf5qiVgZ+l
         r7GMT0FxgvZ3jTbBhG+poqs2OlQr0hjsouSJI52F0HLCCTXjD70fuTeuChsb0de2BIMx
         up1PYB2kPrUKVL0RE7SFBfEci/1soAazuuW8y/ysJ5aa2IP6FE+VC0tw+GhvTrhDyaDt
         mQdFeLnK065PGWcPg+UWoKYfoXD+qJg4bjvixL9L02ESxSWKzAdFrNZn6EZ8AIhQbubJ
         Fp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919428; x=1690511428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqbcmbCBYAp+zhG9717TcnTFy9vDhEQDYEueVcWP4dA=;
        b=C++hbRkBrdlGFvEmGTCVlREe6gGnAN8iAtI6WduoAWiOPMrCWSYMg9WwLXQ2KKQCGN
         lLNK+xKlUNM/FpSdAaaVv3lRV65jyshOB5XCKSJT8DdHTK+FbAV7UJGN1ord2pcWuKz6
         y2YBEfDMmqjRVjsI8zEN19qeS0xsWssPoy6SSde3Z/r/D65XReOa7rnxxfRvVZhbA8Nr
         VVJO8jUT5LXd4ey1MIivKSmzFkpENw80gej1HrUcyhXfwEzRoXVhkPQrTkIcnJlMivBW
         k4+PBwIE+4o4fOFq1RSk7qN0AQWkTUVQRjLKZX2jHcFT4E52aKSw+I4Hew5ukeaGQ/6m
         SStw==
X-Gm-Message-State: AC+VfDyIKfFuC0MYBsZgW1jJzriyZCuomTgBYU8ltJaiLxQP8NdaNWjI
	RxNeF3SuSz3lb21OKj5v7pEfMUqyioWy43F9JzieFA==
X-Google-Smtp-Source: ACHHUZ6OO8/TS45puKCKlUUM17Lm3Q7rNsC9UUykr67a2DfFduyD84m9HwsNrrDdK7p+6sCJiaHSSA==
X-Received: by 2002:a05:6a00:1823:b0:679:bc89:e45 with SMTP id y35-20020a056a00182300b00679bc890e45mr6672439pfa.6.1687919427819;
        Tue, 27 Jun 2023 19:30:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/30] v86d: Improve kernel dependency
Date: Tue, 27 Jun 2023 16:29:36 -1000
Message-Id: <4250a456e3aad41bab1793258b29e96c4a9fe5bb.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183529

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Working with enabling SPDX, an issue was observerd where v86d wasn't rebuilding
when the kernel was changed from linux-yocto to linux-yocto-rt.

This is due to the code in sstatesig.py which was seeing the RRECOMMENDS on a
kernel module and ignoring the DEPENDS. The v86d is technically a kernel module
since it uses kernel header files.

There are two ways to address this, we could inherit the module-base class and
the dependency code does the correct thing. It appears the code doesn't look into
STAGING_KERNEL_DIR though and doesn't use the kernel sources. We can therefore drop
the DEPENDS and the code will the do the correct thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37ccd11cb0b89416b8e23160445186269b6c0c8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 5f342b1120..b4fe362f8e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,6 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-DEPENDS = "virtual/kernel"
 RRECOMMENDS:${PN} = "kernel-module-uvesafb"
 PR = "r2"
 
-- 
2.34.1


