Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF00D2ED16
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6484.1768916302094279641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u3tGsnyA;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so42597765e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916300; x=1769521100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APiuQhKOmgPihr/ovs4gB/ei0IAq9h+zfvTFvpNb6uY=;
        b=u3tGsnyAZgwjBaIiMPll3pJkXbphUF4qodzwlY0sFNejCJ3MyUjzLl86Yy03F1XXDB
         QF+Y4iF0d7lOPX3QCEwmEXslAovtxbD1HhSRV3h2tx1by43sKJLMhn111/Cfr78pt/7S
         MKHa6eQT6qUM2VeULkOJzasSrw+7iG2AxxDTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916300; x=1769521100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APiuQhKOmgPihr/ovs4gB/ei0IAq9h+zfvTFvpNb6uY=;
        b=TlDT2iY8RqmDa9d8ZGklMUUStBBGmgeUFCAGO39ji4rLmXfO+NWVhYHcF4cX1+3Pk7
         Waox3UD1QjUG4WnmRkkbhlAeXkNTZxaoxnZAH4KZ+iR3E8TQU0KrrYdiPUojbBWOIr97
         6xVfGltdAcKtyuHhEscJ+tQ4OtmxOCoftdcUPPs1TAcxTkBUDnyIhjgRyLPpElD3vcRb
         6S0gVXktXyQbs/sVNk9BZXzCsygga0QgawcS17SF8+K3dRhaawOe/SrtIO4zVVO84du3
         ldMr9fbGUDuwlkYknKbZsT4W250XaZZtOkG9jqqlWvVrkkBum7Lsu3j5Kjipe+NdYK+o
         TDkw==
X-Gm-Message-State: AOJu0Yyq+AxANIrhLGZQ5kdIHPLaklUeB43enLqkmRIrbi1O7OgaEVD1
	4PakCGWbbC8ZYvJQ4S9RCAJBTysH3HdwP2YjWEz1jGthAZVcR+QIQ46DwUSFMIOmtobO06zvTcI
	4HG6d
X-Gm-Gg: AY/fxX4t4PIWGFkS6E5nnG9nyqqn4LWQhzb9K6uJW8e/pPafw2JLMi+5Msc91K75JtT
	hcxfy5uk2HVBfW8kQgSIEnyTS9kJ3izLr9OU5hm8kQOsbnTO5nP1EFJkZQV/SOFPhTx8odWK/aR
	brjMrsfnBnvfIxLQcCvKDGLJrLT8w7T/3VTSi/AsKWmzZV03w64QwEHWbDDDraRMh3STKsTmTEq
	n850pPKqKboEvxIoQXWiLxWsgmg+jRGXrXJkRCr6g2wHq6exvvC/K7SpLfc2Wi+ZZC7/FnhhPCk
	okfI52cMI4A0UL2PHFAo7mvQqXBPwZqtZ9WzKSvnrhTGgfr3AVBULYb07Y4Q902uzQuSmT7XG8u
	6Ilh29iDBughf79uL3HoxaIJmAQmjcUwf8scguus1i8zUCKMsN4LdO/ipHfjEqVZgkxy9110WMr
	nOteHzLlAWyhegDIwTBYg8Ckd3KzNLxe8Vz4KDayVd4fZ6Ddyk+Zzo7EtOszT/xXlaE5vlE/Trz
	UuPUjeBi1RCy/XDNfYufA==
X-Received: by 2002:a05:600c:3e0e:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-4803e7e8592mr25572485e9.24.1768916300171;
        Tue, 20 Jan 2026 05:38:20 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/26] pseudo: Update to pull in openat2 and efault return code changes
Date: Tue, 20 Jan 2026 14:37:46 +0100
Message-ID: <771c70fe0d68302a006ddb4be5a30771f5d0f1eb.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229730

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
index 4e31748cc4..31d473cf67 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
+SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
 S = "${WORKDIR}/git"
 PV = "1.9.2+git"
 

