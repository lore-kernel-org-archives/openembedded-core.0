Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53966D2ED16
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5048.1768910968482532316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B/WfKTOq;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430fbb6012bso4488750f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910967; x=1769515767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssKNyiz0ZjrqhCBfTlWsXYUT9yH9KEVoJfVrHOs7zYk=;
        b=B/WfKTOq00X9SCh/5jH4gWFXqG3uy0stmylsUwGx7hkc4jczI5GLOPEtbutF6uFsW/
         GRP3uM9FhXbV4fJhC92lCesgjGO/7ZrogkYeuCFwSCpEPeXQjYE3MwJUSbRdI0Po4ttZ
         MKe0vpPciG0Qh4XkcYufdT4fahGMfqnnfiiPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910967; x=1769515767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssKNyiz0ZjrqhCBfTlWsXYUT9yH9KEVoJfVrHOs7zYk=;
        b=ulE+QQWVjEOzPgAFQ+EM3jh+oC+hESvl3NWoLQg+D7tcmhGvii23myLqbr0iNXZbzR
         CyTJMpj4e3VZ1vCbEg0IwJ7Xrmi5qqnzekQv8QzrsiBIB+rVYsjJ0PxIm+RZGhW+sTk9
         hy3OmLBqkU+R6NmbjQjYkaOxG6Ve8PoyyMift48ghwl+8056gLrXQxtdYrPq+CFONxtI
         gXIXn7eMlmjAMa71BSLw2Hc0wmAD+w4qrQZ5PTWsX1Qc7YP8Bofs6YUe14IOV1geK8SZ
         YK0sS0Bub0wrKzZYQxRZHhqAZKGPWkpV3jM7sohB+bj9PDtJy5TL1s8QoVV+DEwKHK7u
         YI0Q==
X-Gm-Message-State: AOJu0Yz8LWYIsb12/udkOzBUcst38SInFZJgI5f/m2TsI7eaBp/esuXr
	a/wjwROWuRk2OhHZoaQlKvoklHuH6/hOzPq89K71ciFXMcHxns4epoYs6f2wGw9OIlaBUOMhnJR
	zvZi3
X-Gm-Gg: AZuq6aK8NhwWijMCOrbmKBMcoLqPCw5PVOsFkX0wDWcV+tZfdG8PNRmCTGeIAkP2aTE
	rjw3HA5zOZ0iQWvJKV3toEcRK7oqzanlpnnxFLgC3Jru2w1FegGQDQUM1oQ9nqIIM8mAHG4039H
	jKwJPO6Ob3Jf7PQvhfyBZcocAnyfYSLV9DIoI2LDpFGkL97jtJCM81jiZclYByTPq1QkBHKUruo
	3Nan/dFV3NBt88TgJGHzY+zdR2szHqAeCAqj19dK6FowRHGe5AFOhmcnbhXDfVO87KCmZJ0j3kx
	x5fqwArFNV4+//FswWuUgZ2iQ0iVEQF1s/OywtT2w4dafmyYteCwnRVMgqXYkW5E/9LeltWeRwN
	BBgD9AXEMg8PJptCm/mbyBeWXhI0RjgYllRqI0m179o3gN22p/zb02SVY0pAfjfV2ewJAFnMeXW
	Y+C/loZq5nEFl6PulIATlatxFtE0wdGh3OHH+cgHbd71Jlv9QowSUr2/D/VhIGQPmsFFb9Vb9yD
	GsTLveKKKpvR0ZWIZKPow==
X-Received: by 2002:a05:6000:1a8e:b0:430:f463:b6ac with SMTP id ffacd0b85a97d-4358ff300a5mr2370412f8f.44.1768910966575;
        Tue, 20 Jan 2026 04:09:26 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/22] pseudo: Update to pull in openat2 and efault return code changes
Date: Tue, 20 Jan 2026 13:08:35 +0100
Message-ID: <8e7ac4224ca7d271c6ee4e06700f8c8af7ef753b.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229699

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
index 87730511a9..19da3d4e08 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
+SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
 S = "${WORKDIR}/git"
 PV = "1.9.2+git"
 

