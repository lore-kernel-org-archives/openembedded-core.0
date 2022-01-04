Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99704C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 14:16:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7063.1641305789037293848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gb2llZo3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id e5so22931124wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HDZRqmWdFmzsm1BhLd9rHj578AGsi4YQP+y9Q4lgeIU=;
        b=Gb2llZo3hZQP5FQ3eE1MXYN7XebdYdGurwRR3gdBdov/HeArtJuQ4EfxCObZsZR83R
         VIn/E018xQ+lBcqDeOVdtrc698emcCNQ+hFH1tdlRwCdT0H0kcIe/bcNLg+XHYHKTNwn
         UxHmocY6+6OYB4loIk2Vf1IAesKbqYfqsKsB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HDZRqmWdFmzsm1BhLd9rHj578AGsi4YQP+y9Q4lgeIU=;
        b=K3XPojGXVUf4JX0YJJ9/EfQZCzDO1K61X4oW58eZaB6XJCVdfYJ2MWDzyIoEM88gQU
         W1OvywD0blqdfL5+MEO1PSdWlgR5hmUdQFt87b5ru1YhgG2HmZ9mJjdLtd8hWzy6G+A/
         KuFAfycGdrhCrXUawSLbkaIQtdEffAf2/mWaPIbjhW6sDyme2A0/7uovducuzUJd4lBS
         aXuLNmlecquH8zX9Y4YeFZCM5lL3v/sHn6S/RS59nnREmQyYRuV1sPzEZWyq0Txpnp9G
         MhynLCPN+GMzm4jLeYz7rPgT+5Va/S/whXZYC/zIBgpJlcVi0FnRtMgsCbS6nx8XEw2o
         E9Cg==
X-Gm-Message-State: AOAM532UwPw9AkrXE7EQOqt9JM/TsQE6QH3SLj/sLdDEG1oel7chHgsi
	tKsTCS8MwP6u5jOJpnmoxifFJwywbpc2zQ==
X-Google-Smtp-Source: 
 ABdhPJzj/A+Q6wyNwvNJhRu0Qht/Pf4ou41LtyBr21qsxVjhrCyGgHcXxLsd0ZtfzYuJSUtz3vzpdA==
X-Received: by 2002:a1c:1b15:: with SMTP id
 b21mr42686763wmb.174.1641305787454;
        Tue, 04 Jan 2022 06:16:27 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 h204sm38270838wmh.33.2022.01.04.06.16.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 06:16:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] webkitgtk: Add reproducibility fix
Date: Tue,  4 Jan 2022 14:16:25 +0000
Message-Id: <20220104141625.1369719-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
References: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 14:16:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160165

When the date rolled from one year to another this highlighted a reproducibility
issue. This could be better fixed by using SOURCE_DATE_EPOCH from the environment
but I'm not sure how you do that in ruby. Help from someone with that knowledge
to submit that upstream very welcome.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../webkit/webkitgtk/reproducibility.patch    | 22 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.34.2.bb  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
new file mode 100644
index 00000000000..e866a1a193a
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -0,0 +1,22 @@
+Injection a year based on the current date isn't reproducible. Hack this
+to a specific year for now for reproducibilty and to avoid autobuilder failures.
+
+The correct fix would be to use SOURCE_DATE_EPOCH from the environment and
+then this could be submitted upstream, sadly my ruby isn't up to that.
+
+Upstream-Status: Pending [could be reworked]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+===================================================================
+--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+@@ -25,7 +25,7 @@ require 'date'
+ require 'digest'
+ 
+ $LICENSE = <<-EOF
+-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
++Copyright (C) 2021 Apple Inc. All rights reserved.
+ 
+ Redistribution and use in source and binary forms, with or without
+ modification, are permitted provided that the following conditions
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
index a9b151e3c3c..aa071395227 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
+           file://reproducibility.patch \
            "
 
 SRC_URI[sha256sum] = "584677d6e7cae12e27cdcc8e05b4cf73b54849a24afc3d7a40cec91016deff00"
-- 
2.32.0


