Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F31DC7EE45
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.189.1686329684295221557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=I6LeP6at;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-652328c18d5so1590230b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329683; x=1688921683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBo5PeCt9SIaJpH9so7UYVHYogr4IZzAUfBl9rIMMLs=;
        b=I6LeP6atOOOrvpF7HVHfg5ebUs5QXssLbWHDaNpM70NysA2frkkWJK3GGWRRmMkuPE
         w96pG1PCE4Tz6S5hOjgvzs5WETrr+45DT4oZwdeW8Cwh3od3H/+LEQC8dmoNfrue2VkR
         XZeafD781dsdQS2W39hEIG37jZRPHuFyBiqofxdKSjrmgecIiJrAE+2YvMmcjPJe7bVh
         7BOYsW1K9IuSFGS4BkoTdpQq42AklZSDjq1duwK7+qsokYRlPbPpxR9GCVGTbEEXnkSL
         ++49gibTBWCvBkKJkwsUKcOjVzOU2BA8uPZpaKbyc19sp+yeH7qUAk5yzIZ/9BMQ+6i6
         /PUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329683; x=1688921683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBo5PeCt9SIaJpH9so7UYVHYogr4IZzAUfBl9rIMMLs=;
        b=dvXmzB7xBGPFa2I3OeKMUOrYwJdRB8ZYKaNtWmZ4c3+Ok/NZgEmrd789SXxqU3te0S
         pWmirmMbvwLPsbYiM20SWDcvgq1Wf9oew6QSQTShB8nEnMZOZapxjIuD7EmbnLgkSsiT
         dFb18kwmOtkuHDDok/RATFe0HGT0mClDiNzHJB/D8Zz3cgKQ2bDlb/aKgauxdIcExBFG
         fiuwYmAoLSknU/3OAlBDIzbm5I+ULo/VxypHIocL/Z/dil2dAaXzJ7piBLTXkvisRTUb
         QXVAGONfj/jLyjPDeMrVFh1TAHERLaaxSaunlTaPtM2L4ASaHy3+PtXUMl+qTiByr/hW
         LsGg==
X-Gm-Message-State: AC+VfDwbRaE2maVB+n6Nvemwq4g38oxttdUNG4l+igw62WvCo3WWiYfp
	6XlVw6czAd7FS73Gt1B9PF6uljMER7tQE0yC7ug=
X-Google-Smtp-Source: ACHHUZ56PCUVNyDKoXpfsbps3onjoQfmSG1/SN0uw+2n89MDV5r0n8qOdRT2dpRuOMXokeJfcsh8uQ==
X-Received: by 2002:a05:6a00:148d:b0:64a:5cde:3a7d with SMTP id v13-20020a056a00148d00b0064a5cde3a7dmr1985010pfu.27.1686329683401;
        Fri, 09 Jun 2023 09:54:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 24/30] staging.bbclass: do not add extend_recipe_sysroot to prefuncs of prepare_recipe_sysroot
Date: Fri,  9 Jun 2023 06:53:51 -1000
Message-Id: <08e561035255e765e4293d4031115ea308cc29d3.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182590

From: Chen Qi <Qi.Chen@windriver.com>

When running prepare_recipe_sysroot task, the extend_recipe_sysroot
is run twice.

What prepare_recipe_sysroot does is executing extend_recipe_sysroot,
there's no need to add extend_recipe_sysroot to its prefuncs.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf7584a2ac16ee46ff5b41536b06bb46d0cbada7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index a058d344fd..664a9c59b5 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -654,7 +654,7 @@ python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if task == "do_configure" or (deps and "populate_sysroot" in deps):
+        if task != 'do_prepare_recipe_sysroot' and (task == "do_configure" or (deps and "populate_sysroot" in deps)):
             d.prependVarFlag(task, "prefuncs", "extend_recipe_sysroot ")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.34.1


