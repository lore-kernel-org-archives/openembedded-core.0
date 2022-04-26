Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B370C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 09:52:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.4251.1650966718653435019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 02:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hIIKrN3q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id i5so5593693wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OZYMXR7zEKv4aycntarSYQ/hJS+YoirpELdBykKnl4=;
        b=hIIKrN3qvnrAW9W2oln0Pwox68zNFuSNSQhS7qUAXXqoxuYGIwaxMq2Ax9es2q8GCf
         rRdPhhnL6ymS+++bJm2953AxYHwRutQM3zaoqI7w9V0d07FCySnTB1TdoEl4Wqsjn+RH
         SEfrUks0oHqzA99MAkq9sMiBEUEvn+GOPMQnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OZYMXR7zEKv4aycntarSYQ/hJS+YoirpELdBykKnl4=;
        b=esLsAsJM+AkfE3p4tHL1rzvCEx+clGKOBgTmvQMW45hH0BloGCC1ejyxkfZUYF3k3n
         XbA7PucFOuiff0D17pmt6UXJ6FWgv6ZQ6O79ntBr/9ClEluldtxLJGoid48WSaN0HOO2
         DWbqzBIjctj4uATJM4J3XxSAVD+XkVWV6OpMv7OQSWLDrrAIjgZbz2VAOgIp0aK+bC7w
         KgfB1nYKEMy1RZbNoOJQMnjKEebDFDRqWbr4+PK+9cDETMYvprhkaOOHq1PQmmX3C7dw
         syED+1OCEqJ+Vphdql1IL6LUSHxWbhuwdiIktpz5iEghiDPn+2cyhZaoaR2q5+l84QCs
         O9Rg==
X-Gm-Message-State: AOAM533ea2GLLYBxznL48Jk8FCgYD1MxIHv30YGQBS9gkunRX9FMK2K5
	+9MYKwBDAbatlFY6zvaQWVgPlPfiMROmXA==
X-Google-Smtp-Source: 
 ABdhPJzgV9q1UkdKzRNHeFshtd3oflroKWHeFqUvjy05eOJMQ3AJkH+Czz3WHfBpTpBROShRD4lM8Q==
X-Received: by 2002:a5d:610b:0:b0:20a:e00b:5e46 with SMTP id
 v11-20020a5d610b000000b0020ae00b5e46mr5002302wrt.293.1650966716409;
        Tue, 26 Apr 2022 02:51:56 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8d4:bce8:ef63:7bc2])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a5d64e3000000b0020aaa0fea8bsm11246130wri.49.2022.04.26.02.51.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:51:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/git: Ensure we don't have circular references
Date: Tue, 26 Apr 2022 10:51:55 +0100
Message-Id: <20220426095155.2773858-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 09:52:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164865

This is horrible but I'm running out of better ideas. We hit circular reference
issues which we were trying to avoid in the core HOSTTOOLS code. When building
the eSDK, there can be two copies of the script.

Therefore assume git will never be in a directory called scripts. This
fixes eSDK build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/git | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/git b/scripts/git
index 8adf5c9ecb7..644055e5401 100755
--- a/scripts/git
+++ b/scripts/git
@@ -10,7 +10,14 @@ os.environ['PSEUDO_UNLOAD'] = '1'
 
 # calculate path to the real 'git'
 path = os.environ['PATH']
-path = path.replace(os.path.dirname(sys.argv[0]), '')
+# we need to remove our path but also any other copy of this script which
+# may be present, e.g. eSDK.
+replacements = [os.path.dirname(sys.argv[0])]
+for p in path.split(":"):
+    if p.endswith("/scripts"):
+        replacements.append(p)
+for r in replacements:
+    path = path.replace(r, '/ignoreme')
 real_git = shutil.which('git', path=path)
 
 if len(sys.argv) == 1:
-- 
2.32.0


