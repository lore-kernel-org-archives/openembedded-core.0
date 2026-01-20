Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52459D2ED19
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4238.1768908269472261090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E90MN611;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4358fb60802so304465f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908267; x=1769513067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hkz7Dio3/ObY/XQ91Chi2v3BC4f0tVxlbubtOBy2m0=;
        b=E90MN611kMqPR2ZTIXVkQw4f6IJ3PetpKUidQned66tM4U/AG4zmkvCWkti2uCfxH5
         IM+P/dVanidsTOZCP8clLsn3EB/70ujuIU5wnkjp1p375V5WkV9E8n6EWI4yXtIwMUcL
         gkImVfbVeHCINz5oGEpyGE4KX1vPqCh24nZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908267; x=1769513067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/hkz7Dio3/ObY/XQ91Chi2v3BC4f0tVxlbubtOBy2m0=;
        b=RYeBs+Ynp0jVtwWjDTnfGSW6g8uE9mxOniNYV3TRXTsLOnpcIueTuSYatmBavZVP7h
         2cPRu4o6ITJl+xFdhOw/BjE9FlZ7VWODcrD2JJr38xfUtZiqlGJKMaK17mtX4Rg08x5F
         7td4C1pLDAal6g8JjpAumoumaqCX+m28FZ/ET3DppUnmUNqUJBpq6r0iNa5X0DHEsu3j
         KiYrUgwQf7gkcfBBXmVD7LoUHfQvmtMCZvJUux0L1GahYqiEnub/BNoyoFihVC4mbB6g
         LtA1Rk8Gf3i/CQSD/BvM6GdyrLn/yfAclQsffFlNFEoCLycs4EQKAnArDeqVDbtxDt9j
         W5tQ==
X-Gm-Message-State: AOJu0YzZ+NBM5Sf6sxyYiO9kw6Uexh7bbyJniLfjRVvOkvlS/1GFzpWy
	8szeV1HO0QnwgizjdyGPg7eJDkqfr27DK4fIk7j50ppOfW/sIyRGOP9ggSqXYttZqeQqpiSXOxe
	eaIwU
X-Gm-Gg: AZuq6aIMMoLxSXEOxNPshawfWZWhqei//HRFAPdmC43ONci2FEAGhAi5ijX8knHMjZS
	xbYb+32NGVcUdtKSN5AmKER8sHeyqE+WoVpUvDci0G0gzYB8NBeG4lSLOhZ/YOZd9XZgIGXRfdK
	CC8kAPHeqYTE+e/Z/5amfuqZg6I+62uHL5+kss0oVGegG61yXAZX+a6ARtgax0uhUL08F+D8BCA
	MPjKWZDqAnAB3PSihlaDcz68+QavbGDAHbR7wn7VO3TWxuduHUQxUWhx9AfsEq4YsrOTS5zmcsJ
	2bsXELd2U2aYE+01PC6+dwV0KgT6uX82MmP420o/4mnouBxcJ85MUqKRETA2qnJdFUBwhW/5ze0
	K0CnypEBJjy/sAs/av1pzA+h3NhFh5u/lgD+ieRgIl4aBQDsiou8GJufMFvAB1OR3NP8SG3nyy5
	+Z6j232RcR77g0WuxJbQ107cCVDTZBPOcV53DVmM8Q65NcCalRCrXO3ZqrMzpqmQ3hrqhSRJdpO
	RtuGLKnqiJCrclJN4RkBxwGhSk2hlg/
X-Received: by 2002:a05:6000:1843:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-435695655a9mr20037653f8f.25.1768908267569;
        Tue, 20 Jan 2026 03:24:27 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:27 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/15] pseudo: Update to pull in openat2 and efault return code changes
Date: Tue, 20 Jan 2026 12:23:49 +0100
Message-ID: <815c15ce5c8046718cadd82cdd5cd3d394d6987b.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229664

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in the following fixes:

 * makewrappers: Enable a new efault option
 * ports/linux/openat2: Add dummy wrapper
 * test-syscall: Add a syscall test
 * ports/linux/pseudo_wrappers: Avoid openat2 usage via syscall

which should fix issues with the tar CVE fix on Centos/Alma/Rocky 9 distros
that uses openat2 as well as the efault issue breaking rust based uutils.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51f1388dd1679a28ec3ca468cf16aa0ea32bccf9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c18318bd53..a1a00d1a95 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
+SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
 PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

