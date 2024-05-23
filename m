Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC66FC25B7E
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 07:58:29 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.10244.1716451102793714187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 00:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EfZ086OJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e73359b979so37048411fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716451101; x=1717055901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vDOkAKNM/iL2Ky8X0exm1aiRzzzUvaypMItnvbde+w=;
        b=EfZ086OJNsNDrFbVtbLn/3Iah1QacxgJYCbRGGcyznhfPOEP0t+FWq2SAOp+OjmbJ8
         jUufce3aXtqo0+mLoIJUEiuN/xtGh/bJhKPjFY210z8Rc34zPtKsiSnPSAidHGDOkyot
         6VDe5Wqd7laBhASoY9LcgzKp97IsgCR2m9rcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451101; x=1717055901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vDOkAKNM/iL2Ky8X0exm1aiRzzzUvaypMItnvbde+w=;
        b=IWtXp6N67AGdWE+FloUfCc2TYEeRnv033SA/7tpVA7GO+Djj1Odcv03MbL+pQGdcDn
         JCdlhDLFKLRQLgQhUbAnPasOPbhulg2EOSlTfqfAJ/9fl3allWLYplu3ninccG8s0zru
         rHtSjqc+yGgvpojN0eXf/akZtkke/jQJCQ/CVvQnzeR++iTDnvPu6ZCtnOhlbLTbMjVi
         p90b2vlzb5nJLoJhG+yi/O9dN7MU43wguYPtERi2q1YT2nWdWOf6II89aeA8hoHBtBdr
         Btn8LlbXEt4Pr0R6HWB11M6+dGQYXn4GcggzETvsCcpvS0RKpeLyk48kssJEmmqnPO20
         2NEQ==
X-Gm-Message-State: AOJu0YxBT/wACuUibIDKcIqUCj5lcDQnxyrsB9CpQPP4U/4pp384//J0
	6BDRClqPxZkUePnU28kBGofUZBgAOgSQLublAviopvhSBAGeZ++gi0DAiC6CuoraN7apAAVyNzE
	T
X-Google-Smtp-Source: AGHT+IHRCvhL0GLq4eadMkbgirBUsNX8xVnIIzOVZOm2mP6Ed1afONt3VRVNv1apz36jrOPL8iOMsQ==
X-Received: by 2002:a2e:8388:0:b0:2da:736d:3cf5 with SMTP id 38308e7fff4ca-2e9495afd88mr25571581fa.41.1716451100669;
        Thu, 23 May 2024 00:58:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f75acesm17120265e9.27.2024.05.23.00.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:58:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] insane: Add error for B = WORKDIR
Date: Thu, 23 May 2024 08:58:15 +0100
Message-Id: <20240523075818.2307756-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
References: <20240523075818.2307756-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 07:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199780

This was never a good idea and would have mostly happened from S = WORKDIR
however explictly disallow it and error if anyone tries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index eeef43d00e2..42ed1a24a74 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1603,9 +1603,12 @@ python () {
         oe.qa.handle_error("uppercase-pn", 'PN: %s is upper case, this can result in unexpected behavior.' % pn, d)
 
     sourcedir = d.getVar("S")
+    builddir = d.getVar("B")
     workdir = d.getVar("WORKDIR")
     if sourcedir == workdir:
         bb.fatal("Using S = ${WORKDIR} is no longer supported")
+    if builddir == workdir:
+        bb.fatal("Using B = ${WORKDIR} is no longer supported")
 
     # Some people mistakenly use DEPENDS:${PN} instead of DEPENDS and wonder
     # why it doesn't work.
-- 
2.40.1


