Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC33C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 08:38:14 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.6420.1633682293859097500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HARfzq/2;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id m26so8843672qtn.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgRustdhMUpEEio0bO7YAV0qSBuejxMJ9SdZAazG5e0=;
        b=HARfzq/2bhb020t8rp/XCGQoaLtAPWkfc0Dm0JDn9llJr64z3bA48hhIGHWzg9TMct
         llQ4cAMeIHgcZvk9nLE7qCm8hNWFtXkXAM3oef6sYwLF3lBgjGPY70OK49qmnHvQccsW
         +gHJ1UqwEhjezR8t4W4l8/f3tUV73RyJmHmqbk90raNB+tNH5A5EGEPqYXwOuRNwLfyR
         DrNGzDtDbBjacxxzjkQTzxWA8n3xJ/Wo8ts6GiovJGJLQJgNDl7U6fXaFBdroMC2Jquw
         osOhOfz8odot3Wv4OWgY3qgFXM3rY66muByVmsv0Xe20hboubW9BEpZ22lFRnPEPcXT+
         hYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RgRustdhMUpEEio0bO7YAV0qSBuejxMJ9SdZAazG5e0=;
        b=uzFdpygOTdZbor4htxSyTkplmcZng19jOnE7I7eJpX5TCCrcN02dlE6mIOg6t9qo3J
         AbDQj6hlUjymbwAJ2m0LBIqLLvT1BRjxpV2k1ODtFISpM5YqZZGPx8he+8vAg7PpnkHC
         8eFKtoFQxA13N8mTW3QCSDytcsfgjy49WFMtZd/M/LzcJAgPblYdavxJdSn9RHiv/xIu
         2hw+nqYgH6Yi5uPZVBKE5lGW0YFP3Kq3IL9KwjempS826+DK0A/HhFx0VjH7+CcSApv+
         tO92iiaSRCOolHMbNMLkQSMWxivm3smAu8cmXqVOd/pF1a5vDIF1lHGZORYblyi6R3xo
         HTOA==
X-Gm-Message-State: AOAM533y+06naZiPKmJfpEvBN6PSsKMsG/vwO0zFT37Qs3oYktb8aTZ+
	PUY9+nqYOfTP3YG7E1TlTCfdGWQTSTdJnw==
X-Google-Smtp-Source: 
 ABdhPJx2SEL+abKhwSKMwv6OiDLeEcbMiun2m/BSFgheB0hc0L95KryMKE9DGCPwVqxEFyMJT83FNQ==
X-Received: by 2002:ac8:59c8:: with SMTP id f8mr10407555qtf.362.1633682292891;
        Fri, 08 Oct 2021 01:38:12 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 p187sm1569516qkd.101.2021.10.08.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:38:12 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	alex.kanavin@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] oeqa/selftest/reproducibile: Include rust packages
Date: Fri,  8 Oct 2021 01:37:58 -0700
Message-Id: <20211008083758.156759-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 08:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156772

rust-llvm-liblto and rust-llvm-staticdev have been tested and generates
same ipk, rpm and deb files for reproducibleA and reproducibleB in
debain environment.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index e4582cb82a..a147e933cc 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -27,8 +27,6 @@ import datetime
 
 # ruby-ri-docs, meson:
 #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
-# rust-llvm:
-#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
 exclude_packages = [
 	'glide',
 	'go-helloworld',
@@ -36,8 +34,6 @@ exclude_packages = [
 	'go_',
 	'go-',
 	'ruby-ri-docs',
-	'rust-llvm-liblto',
-	'rust-llvm-staticdev'
 	]
 
 def is_excluded(package):
-- 
2.31.1


