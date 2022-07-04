Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBB9C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 15:14:01 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.72864.1656947639115455038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 08:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C+ByX219;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id g14so10223251qto.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 08:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O/GJX2cea2cvzJdLhkKCsrW05hdJNJ7QvMk/95V12A=;
        b=C+ByX219ktI0hSztdEhtu8hC7DBkk2MZxWX8yx/YgxACpFkSgYVWdQnNwsJ0Z3e59W
         2AvcyKz2q1IfZIP0OfgasT6vhhJ8DQEGCtjCcUMBtwJYr4kuGd0pkt05N2+zRPXeKoRF
         8+xFiW1syirMPYhLZXWP8oTOzu+V62VkVljz6EgMxtYc7FXFLe8SoQ4q0egpnMM3XI5l
         F5ohIkPYhtWygJ6UYA+ghXie+sOp0COBDQL3DEmL8vLnqVDeCQm24uZ0GXMDbws4B9ts
         tuqH/jJEdBnNs7kPwxleKeydijtMhhyvPDCQltFv4fRyzAHid/NnTJqiIJTkRO0OWRoE
         MwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8O/GJX2cea2cvzJdLhkKCsrW05hdJNJ7QvMk/95V12A=;
        b=U0lKVvzaCG1x7gaLpt2ecSHgY4wQ4rznEmOSSqAeaRsqY8vHXq1ydlRVnaoqKK1taT
         qd8NYY67R0v854c14FqDDhAXmggpZlbsWnqeCB7VBOeguBtvU9+utFninVv63Z33NSs4
         /BjGWp7yvIchynAPJcVxvCAZi1bAcfB8LJ0qEbUC0qc0MOqMNj9QUQd6T+3T+HNx3d/p
         1N8U+mS9E3DCsQDa8/Fb27bwgE3AyOOGw0QhRq1ho+tBBAPNrlTawWwVMzGa6A4yFLcW
         vhQUeN8upx7SZufBUO+iX9nHuC6LrIKvr10IjFO7DKyQV5DiEWqk5fUFjntf/CDNk+qS
         Lz7g==
X-Gm-Message-State: AJIora9s2neKY7GLd1903f6+wtocOvynz5FZk0YOn4sgF2F1I5A7Or1s
	uCC/EVKQFJotIlrC+ANwRlz1ZTYGuDzcbQ==
X-Google-Smtp-Source: 
 AGRyM1uEB2WGKKv4gy7evcSPJ/2OmUjzFTMdbRYK/W7lDbJTmoMd2xpGFfNXhDdw25A49f+G/60PAQ==
X-Received: by 2002:a05:622a:40a:b0:31d:2947:4756 with SMTP id
 n10-20020a05622a040a00b0031d29474756mr23201773qtx.183.1656947637927;
        Mon, 04 Jul 2022 08:13:57 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm20464220qkb.89.2022.07.04.08.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:13:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: fix reproducibility in 5.19+
Date: Mon,  4 Jul 2022 11:13:55 -0400
Message-Id: <20220704151355.58401-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 15:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167622

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
2.19.1


