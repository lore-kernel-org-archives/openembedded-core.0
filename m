Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB49C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 00:32:28 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.21814.1658104339249107440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KzdJBZBx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id o12so9334119pfp.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fHAI6YWYr5bOVBCiu7kqO1qcft1vuD5HCkGAxmikkik=;
        b=KzdJBZBxkK1TDVNQQAanhWWdjzQJ8fkeZRKCpPi++SgllXi5YvfhN2EQ7Rg2HvJ3bx
         mciTnYuBBrPTujtpAkFw3l4vT013D2lKiW7e/NHGUdjFQlRJUPA+KI/FqjCcKxPUtFpj
         0lcPWFt8BqHPlAwb3jP/Qr9ASJYXzYOARNl11klEZjBAfGld5fQJmm/6nXcd6ZHODb5d
         kPS8ncmHjORE+gnNp9Dodnvmrn6LMCrD9jq85yWC35z/E0sjtWs2/YkbmD1yO+8jK908
         pJCRECGYLX4nqr2c2vkA0d35GIndzLYlYh5p2CasHKLtzDHe/J2vBIMR3CiOgjBvCUVx
         g9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fHAI6YWYr5bOVBCiu7kqO1qcft1vuD5HCkGAxmikkik=;
        b=bItyGAD+b4SXlIr4xeczDs+XotM97jSdm8GDrtuL5AiZARH81oqV2qJNmuoRaM5zbD
         Fbyb6PV1yWDbrBKiCJzCLXw95Sgz260cK6vjJdPgQEuvaghl2c1yuoKRZbP9SCFHcK4+
         LIY+s2zMVhSfgM5QqTKE+pzhk2tQA1ndkPEXa8IDP1dws2GRrd5Y/KOhM6qGtSEYFdk1
         qAZ3cLTdy1atgtaBUCAfpCUarU8Y0cgQduLVM8Lv0lrOk6JlZ//GVWOZGQMpA5YWW2Ko
         mewx8vH9QFTj26zXKeTOmbFDkgs9pheDRorDptYnpZ2hgrKpNMm1ekPUXhKn7ACZ/LDS
         nV5w==
X-Gm-Message-State: AJIora+pAdEXxguaEbTN+W/jI4oltLgoRWfryBVnFQaCoGqbqKgpCrOg
	LfpaQB3aOyPV4o1e74r11nXZzFgRPcjK/pIr
X-Google-Smtp-Source: 
 AGRyM1tbFiV992xmulepRC7Z9BcaQGpEmf5uN/JyVwM0m/a3wPEI1PW1+p2Z3H1+WADIyU3b6Te01A==
X-Received: by 2002:a63:1a18:0:b0:419:aa0d:4f9c with SMTP id
 a24-20020a631a18000000b00419aa0d4f9cmr18658640pga.389.1658104338253;
        Sun, 17 Jul 2022 17:32:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s30-20020a17090a2f2100b001ef831a2015sm9958183pjd.22.2022.07.17.17.32.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:32:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/23] perf: fix reproducibility in 5.19+
Date: Sun, 17 Jul 2022 14:30:24 -1000
Message-Id: 
 <171415e38e526033a0423f4dc39e9d8e9dc4e5f6.1658093505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658093505.git.steve@sakoman.com>
References: <cover.1658093505.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 00:32:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168188

From: Bruce Ashfield <bruce.ashfield@gmail.com>

kernels with upstream commit 630af16eee495f583db5202c3613d1b191f10694
[perf tools: Use Python devtools for version autodetection rather than
runtime], or -stable backports of that commmit, evade our substitutions
for reproducibility.

We add a second sed expression to ensure that our definition of python
is used, as we have the proper environement setup and don't need the
full path of python, which eventually will be captured by the perf
binaries.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b24e73fb34049061ea03a6f2b6a54cdbee7b406b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index adefc44eaa..603d3f9eee 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -228,6 +228,12 @@ do_configure:prepend () {
         sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO))),g' \
             ${S}/tools/perf/Makefile.config
 
+	# likewise with this substitution. Kernels with commit 18f2967418d031a39
+	# [perf tools: Use Python devtools for version autodetection rather than runtime]
+	# need this substitution for reproducibility.
+	sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(subst -config\,\,$(PYTHON_AUTO))),$(notdir $(call get-executable-or-default\,PYTHON\,$(subst -config\,\,$(PYTHON_AUTO)))),g' \
+	    ${S}/tools/perf/Makefile.config
+
         # The following line:
         #     srcdir_SQ = $(patsubst %tools/perf,tools/perf,$(subst ','\'',$(srcdir))),
         # Captures the full src path of perf, which of course makes it not
-- 
2.25.1


