Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECC7D5AE40
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 02:29:30 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.63346.1730946565219755134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 18:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+cFsJPP;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-460b04e4b1cso2780551cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730946564; x=1731551364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIO4irE747r3GxcQjQA2JhBAvs3Laya3pyhSP6IkXWM=;
        b=J+cFsJPPr4ZX9WF8XODtuA4Y1li7fRnYG4dL32STDutU01POUSuRCkTqUxTphgDWrI
         KW8ZmSE2Xgka4neAaZO+MZuKjFp8GafOPCQafRXQ/gydgi+F2rV1/FG7yRJOt8zhxO4R
         OoUeI9e13hEDKk45oOAhBYRnLtlpWUwzDpLqd8dgN9CehV0NM2ceH8lsJGz2y211S2vC
         HNOtn65Wgj/m+eMeQSjVJlY08Cl2xxw1CFdlnv/VkX5YS3SwFGNE62i3mPTzq0h5oy8O
         y6xeah1iD8/gHMUMDKsDF4GNnNV2VWFd5OWsSgBOFO4zUgLYJ/89ayZDzWhk2myIdI9a
         reVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730946564; x=1731551364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIO4irE747r3GxcQjQA2JhBAvs3Laya3pyhSP6IkXWM=;
        b=YUgWCHKweDr6o0DkhWerZmYcp7Vufj4jKS7PcI/wK0d0lNbBEnYpV62srSfgY6igPy
         8hNEjWCTujx8hThgBD+oIRpsdGl7e8XESQV6xVuWQnZw3pqa1jF0IGjzH06jV9y0aGhs
         x18zRgPxQhGL9SDHiF4gsIjbSP2yfYfR0OB3fxwo4tYNyxuJv1ylRZgbrvQ/0PjwKi08
         bgzbW5tGCJvYTPgB3n1ajO4SuX8TFsjhO8/X6e6TMeRYFSQA8iRZ+Ucg+7gtuQPkhCn7
         oBGKD7XM6D8S5xnafIViUd3r5gN48Yos1Z3ogg9FoDrXn1OAVWCHuXrt0GDBn3OayGf3
         UjdQ==
X-Gm-Message-State: AOJu0YwIjzpScQGkd6HMTH8JsJkIR9UISaqtMtcCMliGL6NEHYmYZWL/
	L2HnbRk9Od+AgDCAnA1U2tgKpL1/W7/GFBSpH7fW9e0SPyhazJvGWvUlojlF
X-Google-Smtp-Source: AGHT+IGNQ3V97yP9ORggonenA6CRlEqh8kKO1SxcTFihhKGX8bKcKqZDu1e/+isshMkzkHgTYadwmw==
X-Received: by 2002:a05:6214:33c4:b0:6d3:8285:af78 with SMTP id 6a1803df08f44-6d38285b06bmr100244116d6.36.1730946564196;
        Wed, 06 Nov 2024 18:29:24 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d396631aeesm2124286d6.120.2024.11.06.18.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 18:29:23 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] kernel-yocto: allow cfg fragments to be specified as required
Date: Wed,  6 Nov 2024 21:29:08 -0500
Message-Id: <fcedcceee3abc807cc85b20cf387cd69674966c1.1730946087.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1730946087.git.bruce.ashfield@gmail.com>
References: <cover.1730946087.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 02:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206807

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When .scc files are used, a configuration fragment can be declared
as "hardware" (required) or "non-hardware" (optional).

By default the configuration audit only warns about hardware
options. We can extend that default level of auditing to configuration
fragments that are on the SRC_URI or in KERNEL_FEATURES by
adding the ability to put a specifier after the fragment.

 i.e. KERNEL_FEATURES:append = 'hardening.config:required'

This is particular useful for fragments that are outside of
the kernel-cache (in a layer, in a kernel tree, etc)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 66602d3594..e73adcc725 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -271,6 +271,9 @@ do_kernel_metadata() {
 	KERNEL_FEATURES_FINAL=""
 	if [ -n "${KERNEL_FEATURES}" ]; then
 		for feature in ${KERNEL_FEATURES}; do
+			feature_as_specified="$feature"
+			feature="$(echo $feature_as_specified | cut -d: -f1)"
+			feature_specifier="$(echo $feature_as_specified | cut -d: -f2)"
 			feature_found=f
 			for d in $includes; do
 				path_to_check=$(echo $d | sed 's/^-I//')
@@ -288,7 +291,7 @@ do_kernel_metadata() {
 				    bbfatal_log "Set KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue"
 				fi
 			else
-				KERNEL_FEATURES_FINAL="$KERNEL_FEATURES_FINAL $feature"
+				KERNEL_FEATURES_FINAL="$KERNEL_FEATURES_FINAL $feature_as_specified"
 			fi
 		done
         fi
-- 
2.39.2


