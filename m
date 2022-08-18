Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892B1C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 07:53:10 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.39361.1660809187075230215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 00:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EKqZv81n;
 spf=pass (domain: mvista.com, ip: 209.85.214.178,
 mailfrom: skulkarni@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id jl18so889279plb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=apG+HGPDZGk9KOHFPUk/LjVMGN67oVvEWc9icfLbAlk=;
        b=EKqZv81ndZmRiu4FiqNwdveKco6wHQNiGJPzBbwJCDnJnECe6yBcEl3CM0hAFKfiEB
         byoH5hhP/fthV8yvN3bxs9GaDqOjIiR50u6zCJg9oyk8xrHkiMFa2xF1gHBICosvFulh
         7uyqA5opEHBINjjZOapoaDPhXzFIVkG+Wk6mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=apG+HGPDZGk9KOHFPUk/LjVMGN67oVvEWc9icfLbAlk=;
        b=xvoTHnycndLTtu1FEnsUIKg1hXdMSYNeTg99rApvxXV/uK/k2blrFoI8eU9IuFsjJ4
         nSwVIUrR6Ufpvjw3Ou6fyu+ufvKEmIlQZAsfNsomtKys2u8dduLoeYgQGSB78uqeBTXA
         tIvDgWjBGohMcdhFwz87HC307H6uXx0DKsphuTeVFnHKZ/WonwBS00HsBXtrlbbKjMLs
         aWywfiVvVGLVuVSQtdCkzPFxlyI1w/GTraDS2dOzfXMZUJ66IGyVttwvXmkrsZ7LFSwz
         hEwwTvMiCDX7m1cyXR1ww8xyw1ZjKzX3ZnbBPenq/4VmogZYiMvI5bTj2c6kfQPpCPd9
         WQDg==
X-Gm-Message-State: ACgBeo3iPgZ4HCQunERZuVB045EK3Zt6dJ1XJB7v2HnioIMGIuC0oB2U
	JII+k1Ppl5nO89EUq5JH8TQKHEtlpAHw1w==
X-Google-Smtp-Source: 
 AA6agR7uUG1r7YJ0Feq0JlPqFIusqh5RXRtTdLmIH+URAI7jzw0r6zc/sfUm+BWqk5U1YoKtCQ+Rlg==
X-Received: by 2002:a17:90b:4a4e:b0:1f5:431c:54f8 with SMTP id
 lb14-20020a17090b4a4e00b001f5431c54f8mr7711567pjb.161.1660809186173;
        Thu, 18 Aug 2022 00:53:06 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id
 t4-20020a625f04000000b005323a1ba20fsm889811pfb.42.2022.08.18.00.53.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:53:05 -0700 (PDT)
From: Shubham Kulkarni <skulkarni@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][PATCH] docs: add a comment to ensure
 CONNECTIVITY_CHECK_URIS is correct
Date: Thu, 18 Aug 2022 13:22:38 +0530
Message-Id: <1660809158-31798-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 07:53:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169515

In sanity.bbclass, in function check_connectivity :
Connectivity is tested by fetching URIs in variable CONNECTIVITY_CHECK_URIS.
If none is accessible, the status error is ambiguous.

It says to ensure the host's network is correctly configured but
never if the remote is available.

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/classes-global/sanity.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 4104694..4a403a2 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -357,6 +357,7 @@ def check_connectivity(d):
             if len(msg) == 0:
                 msg = "%s.\n" % err
                 msg += "    Please ensure your host's network is configured correctly.\n"
+                msg += "    Please ensure CONNECTIVITY_CHECK_URIS is correct and specified URIs are available.\n"
                 msg += "    If your ISP or network is blocking the above URL,\n"
                 msg += "    try with another domain name, for example by setting:\n"
                 msg += "    CONNECTIVITY_CHECK_URIS = \"https://www.example.com/\""
-- 
2.7.4


