Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE01C46CCD
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:35:40 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.15007.1702996536963126552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cuBF/X9X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c39e936b4so52992125e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 06:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702996535; x=1703601335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjYSuiliGnom0jflKC4XX/meK062ruYw+E4D8oNNlRc=;
        b=cuBF/X9XkrBmNO7oauRiygnm1zVQhKyMZ+Wxr3paF92/HPWOhXUKdB/i5i0WeNJuip
         LFWKxk3QeG7TUbCe8BCFJMFUvbAW6liRAsQzsKszGE5ZTZCHwm7CfNzOSWW/FuqZiPTI
         0rs5QGHk/FR3QgkdsCycdPVTCoEjP26LSOiaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996535; x=1703601335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjYSuiliGnom0jflKC4XX/meK062ruYw+E4D8oNNlRc=;
        b=Ca4IOkjWqJw58MHcHJDvigZCupt/eUJhAkP7+T19ttS0Vli+wK/XqAoodvamPxby9A
         4CiHELMOWv2ySl7A99hokigJplYE5arBpdCe+HbQ4Ib4PCtHgyaubnhsB0vl+M12BZqj
         qeptX/9MI64rjRjUdehOgUL75yYFAmfCNHCZ5U2QK7t7eHjkTghTl05b/XJj6wWdWiRB
         XndLbRuV4Jqy+DZUx4pbepJLFuzYiSElCn4yY8m2vWqJaQ5FOZVTFMgy898/tO6IQtHH
         J8g5bqbvs/fsNF8pP/wmik6w0h1301gHHuNRu6935db05zVkrSCssfTjMiO6CL9euf4O
         tROQ==
X-Gm-Message-State: AOJu0YxbhrD9cE5pyvs90tJuSM/UD+A+jovYm+Q1C5qpDvtE2cBaBy5r
	wIKLT22n0tQ25FzGfK/SxL2PEMZofczsTdEM3is=
X-Google-Smtp-Source: AGHT+IHZB301jpGbP7A+BBiIkINJ/3i7CdzPQCfxZsYXu/2DZeK2C0w1J18XAFK5oyr+5iIET9T3/w==
X-Received: by 2002:a05:600c:44c7:b0:40b:5f03:b3cc with SMTP id f7-20020a05600c44c700b0040b5f03b3ccmr4594554wmo.238.1702996535328;
        Tue, 19 Dec 2023 06:35:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040c57e4ea28sm3168889wmq.17.2023.12.19.06.35.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:35:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] sstatesig: Ensure spdx dependencies update when abisafe recipes change
Date: Tue, 19 Dec 2023 14:35:30 +0000
Message-Id: <20231219143531.3514266-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192743

If you build openssh, bump the version of base-passwd, then rerun openssh:do_create_spdx,
it will fail due to references to the old version of base-passwd. This is due to
base-passwd being listed in SIGGEN_EXCLUDERECIPES_ABISAFE.

Ignore these recipes for the purposes of create_spdx and force rebuilds when things change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0342bcdc87a..1434690f1d1 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -63,7 +63,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in siggen.abisaferecipes and not isImage(mc, fn):
+    if depname in siggen.abisaferecipes and not isImage(mc, fn) and deptaskname != "do_create_spdx":
         return False
 
     # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
-- 
2.39.2


