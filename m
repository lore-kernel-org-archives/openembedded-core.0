Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BDFC369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 03:48:15 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3973.1744429694489679080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 20:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jhLX3cnl;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b03bc416962so1906090a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744429693; x=1745034493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cq8ShYKWYRBcERsx0XX/6KGwC0ag+oy5bSO63oKEl7o=;
        b=jhLX3cnlu23wDhJNxtCYZCS5P9Ijku6GD7N7UoYuL858K6ZpwacWp+tPxtR4KlJOdi
         IJ3cQbus/c1doSDEn9YLhb6DP6yjtsuUH05ljNv2FjWZJtk1fkGpOG29HGbwY4DWhzPN
         weShofiGxj8xiADLT2VPZii4YZZWsqiVN1ooM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744429693; x=1745034493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cq8ShYKWYRBcERsx0XX/6KGwC0ag+oy5bSO63oKEl7o=;
        b=FJOyO6N2rxAQO7UpV5qbJhroELNsZugZJZm9ZI0w4sfiesWfCcwiTTFae8dwI8MMaF
         +KNvedxuGLZO3uMJB7RVECLwk7zPPlADvS4IBlJNLoDNQ5Px4uRHvZBH9HJj/A8tRkDy
         gkhxaVat8bJFMW1Sndk2haeSkdre3t5HJwvVEgfPjQkLBI2gSaqY3OFDLdd1IYZ5QuYA
         0TSbBmY2oUrUBtKpqXMzr4EN53Npntv9BXVhfT2ANNaFG/xnhUyU6TWeO/YydXv+SZfb
         ZeD0u+T8l9ju7dWT2lh91pLnutRsqd0relw68tcfbKXBoWM+GLaVUTThhp2AjIHSeySm
         haiQ==
X-Gm-Message-State: AOJu0YwEQ6c351sHTzRfqMxIr/U4StbVUhoAsEakl44qZ/794ZyoJPnU
	mWK21j6yWx0Nc2yJuLq/vBq0wXefXdZdj8aJ6pNunitZW3SyC1JT9jGxgur8LFB59dedjRqe/nE
	qhHM=
X-Gm-Gg: ASbGncvF0q80Rp3Onw7tVr5erdqS7cvJeBSnYeQbl63gnEq+FgfsCfw2lCqmHZ4U8Gr
	708YAzq4r9cyNxFYNJ/rovKczZ4wWenvOOlBEt7KlQiB/N/6QnRWgHvaw7gVJDAEP0LHLfAVFnF
	4WjmkB5pDzbnRbjGPjfDSGsJ1sT76l0VM5nAdXM1yf+jk6g+2zKmPadG+mO0RVTle4mAPrB9+Wb
	Rle+9P3XkbFQtiZAB9VHXR4e84Fqiieki83U1LUxTRrptfnDOIDaTkmmoeLBEnp9OxbI4+Hv05y
	kd7DLV8IRGwkdxT+nAHtwlIOrJB5GCtqh6CZkEHWcKyLKInWPiY=
X-Google-Smtp-Source: AGHT+IHd6yDR0n/1GK2UjRjaRk+8Mprv+z3Ta3q/GaFjH9H90JDeNFgUpEBxat1gaD9qz0NTQjVxvA==
X-Received: by 2002:a17:90b:17ce:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-308237a833emr8398535a91.24.1744429692934;
        Fri, 11 Apr 2025 20:48:12 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.233.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df401ab2sm7288167a91.48.2025.04.11.20.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 20:48:12 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH v2] openssh: upgrade 9.9p2 -> 10.0p1
Date: Sat, 12 Apr 2025 09:17:56 +0530
Message-Id: <20250412034756.24846-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 03:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214771

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2025-32728

Release Notes: https://www.openssh.com/txt/release-10.0

LINK: https://www.openwall.com/lists/oss-security/2025/04/09/6

Regarding the Portable OpenSSH 10.0 release:

Due to an error in the release process, the recent Portable OpenSSH
release identifies itself as 10.0p2 rather than the intended 10.0p1.

We do not intend to make a new release to fix this mistake. This
portable OpenSSH release will henceforth be knows as 10.0p2 and no
release numbered 10.0p1 will be made.

Sorry for the confusion,
Damien Miller

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb => openssh_10.0p1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
index 5191725796..21e1e50759 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
            "
-SRC_URI[sha256sum] = "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
+SRC_URI[sha256sum] = "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.25.1


