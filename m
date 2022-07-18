Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EA7CCA482
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.28262.1658155811083518262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PxKnav6t;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso12594138pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9tXR2qLZYHvikC9xA/SgkOiQqxHwESjdGYzyY8Z/8dI=;
        b=PxKnav6tit/lAOJ+OvbXM+10g63ZvihQUDHKE24p3e4wvU+Hv4oikxaBlPHYwUa7A/
         Q7+u28KP/zr3bx59y/eVHUSjXdyxSk8zfK7ocUF69qqRm0gsh7zkrERYqJawAwCk2B93
         dalhKPkRLRHNbFPYebGZ+76j0jZdqmKVes5QPvMVlLFipZDoReDEy3LWylE5K3Nfmrp6
         zqX+5ngCqjHdH3KKpG5dDf5Tk1snEKdLXQ2ZePdRI0tx3laJ3ILFyz27ir4KZcOCSMBi
         notLuaU+MYEguM3L7wfkNCfVZ7NNyvBQdUB3Adjrssl944VszZX8noEXIZb2S3ZGY39n
         aPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9tXR2qLZYHvikC9xA/SgkOiQqxHwESjdGYzyY8Z/8dI=;
        b=mqVKGBngBNqTCnGLIX/0LyA0tfoXxX0xxTaZ8UQ1t/D265p3xfThgspu5fyjYRW+eQ
         +w79N9Wx3yQiI0HqvpmeGBNOV20acQTQ/mFaCJjdRVcELMOdRY3mEu6fBF8LYU0HJ9Z9
         XdGLcPMBNIVWv+calnGWqm6C8GRmQbk3ERl8hvDwWrXgfMJtEne4KTSF6zhgQvPZW1bp
         zmUlzswPYUDI44FNQRFq+RIxeVouab3M48Ky/+RyDuLcKOM/XRg86eM7AyTcM+jKpsHo
         GxsiEVIuEyqdwHYUt2vY8osFBl/HBVBIEql7M1h68uSclm9oYX61HBKogKynGCUI8yWF
         KVRQ==
X-Gm-Message-State: AJIora9gPxmTp2YcBbJXdFoua3AkLgZCyZv6c3wB8fpSED/N01xp5TuT
	5ySiua3HncjgFDgCJxvJBqQiHeZwbQj1azln
X-Google-Smtp-Source: 
 AGRyM1sBIZVBtPTcEjIeNOIGqsqdiNViDmiMPgCEbFDYzpZLKdCn7JmwkzzY4y79WkOr1lG+xIvEzQ==
X-Received: by 2002:a17:902:eb89:b0:16c:6337:b9b4 with SMTP id
 q9-20020a170902eb8900b0016c6337b9b4mr28466904plg.27.1658155809952;
        Mon, 18 Jul 2022 07:50:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/35] vala: Fix on target wrapper buildpaths
 issue
Date: Mon, 18 Jul 2022 04:48:44 -1000
Message-Id: 
 <cd3821fd52115d0eacdad4ba37f5c51a49b6990e.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168219

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The on target wrapper contains paths from the host build. Remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10980ae59f18679413f2d3fd428a9386e4d6fc3a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index 90e0b77de0..974baa33f5 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -60,3 +60,9 @@ vapigen_sysroot_preprocess() {
 }
 
 SSTATE_SCAN_FILES += "vapigen-wrapper"
+
+PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
+
+vala_package_preprocess () {
+	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir}/vapigen-wrapper
+}
-- 
2.25.1


