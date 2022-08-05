Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9400DC25B0D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6587.1659705194196225206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9u6xHVx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z12so3198590wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=KD3zi5VPJTUIl7gf3YBtUk8udugvSm2OeCj9+Gfd9H8=;
        b=I9u6xHVxYi06hu3ueB4ZvGZCSfyt7W2evLKjC80kamjj6EI2mKOHiEGwi4ZpSZakYt
         kH0kpO+FjIOJF+lb6qLTamfScKZIDFCyhtz9qROtyGfnmSudzQEq6aOTStKHJxb+47uH
         Z6iALNlSG+bGOqhD3l4iv4sgawwI/4isG6zr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=KD3zi5VPJTUIl7gf3YBtUk8udugvSm2OeCj9+Gfd9H8=;
        b=BRE+O9xLm1JpeWfZ6+YeRuSEgrdDsv0GE8xlm9UAJAJfVGo4SBjuvkt5ItZi/ILvc8
         RhzR6h4/cAxLw767AZBUCzm43BMguj8QgMWFdf+5y8YwT0kocTNVpYjK9wb7PzqgQpF0
         WhxCJI58/CvcvqlqIqjPYqKWpoCeYSlGiRxL0nA976jGUYfJO02QvLdCNZAAHgtSk7ko
         iCOXc48CI+RCz9/US82rOzsFe9nSq9uk0ORAb3kK3PON0neYxH3VxQalS40tp+Ue+skL
         R+QG4c/Hq4yTbufx+pLhpRGbBWcaN6+r57svioIoTEA1A1qAJKTK0n/QYSQVeBNDBrSU
         sc2g==
X-Gm-Message-State: ACgBeo3r6M01UUF73l1jB1ONX8ChFD9UddtqRvlYuocpZItdcYAt5XnG
	Mm8TkWf31Ppiw2tktNIZFynZ5r8Y6bzUgg==
X-Google-Smtp-Source: 
 AA6agR6A9WIPcR2ejmgUa5PM5dYCWORaLOm0cRtIt17KFVANTBgQEGU15Fs4VaFE0KOR3u05qHF2uQ==
X-Received: by 2002:a05:6000:18ab:b0:220:6c0d:8157 with SMTP id
 b11-20020a05600018ab00b002206c0d8157mr4410699wri.438.1659705194792;
        Fri, 05 Aug 2022 06:13:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/29] rust-target-config: Make target workaround generic
Date: Fri,  5 Aug 2022 14:12:44 +0100
Message-Id: <20220805131252.3706794-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168955

Ensure the 'target' data is set for both HOST and TARGET queries
as appropriate to work correctly in cross configurations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-target-config.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index bc6bd77abbf..b3c738f02a4 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -290,6 +290,10 @@ llvm_cpu[vardepvalue] = "${@llvm_cpu(d)}"
 
 def rust_gen_target(d, thing, wd, arch):
     import json
+
+    build_sys = d.getVar('BUILD_SYS')
+    target_sys = d.getVar('TARGET_SYS')
+
     sys = d.getVar('{}_SYS'.format(thing))
     prefix = d.getVar('{}_PREFIX'.format(thing))
     rustsys = d.getVar('RUST_{}_SYS'.format(thing))
@@ -298,7 +302,9 @@ def rust_gen_target(d, thing, wd, arch):
     cpu = "generic"
     features = ""
 
-    if thing == "TARGET":
+    # Need to apply the target tuning conssitently, only if the triplet applies to the target
+    # and not in the native case
+    if sys == target_sys and sys != build_sys:
         abi = d.getVar('ABIEXTENSION')
         cpu = llvm_cpu(d)
         if bb.data.inherits_class('native', d):
-- 
2.34.1


