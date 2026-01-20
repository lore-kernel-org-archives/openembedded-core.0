Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EF3D2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5036.1768910969439376007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=geyXALQL;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d28870ddso2925347f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910968; x=1769515768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCC8XFgDP8Y6TuusrjN86nJ8/jzfdj1ZtX+Y3Hg7g2M=;
        b=geyXALQLr1r+HZyplc+qP22ku+5R/DLsAI3tZD8uNnMOm4BpUSug82n16GdXt14/6C
         phey8mCp7Z3DiwjwiLe7XEjl61B9MYHwhgjD4Eh/WWnjXb7GnOLJD3+oN4aotEg1Iuao
         //6gguL/XMKfMZmPQTuHaUy3DOyVjfKiBkaWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910968; x=1769515768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCC8XFgDP8Y6TuusrjN86nJ8/jzfdj1ZtX+Y3Hg7g2M=;
        b=sajEJX6kngeAAyVjCAk5r4t1NXR9mMUQmjlK5DAtpPlLSLxur1GyAE6BrwuIUZSuIn
         5x7H6mAVk0NGgao/vs3vwN4SQPwh0E4N0SjMzRfPNgfgwayQ4wOl+mdzGscfMCq746Uk
         XnbI+Y/ZolMLAoxmaWcnJoWbqyxH6LgCrZ/Gurp1z6EIZgVFZTSSLxNVKqs5pBxs4s6P
         R3qPYbGI1cooJOcVNSPHJV1wnhzfkPRXBJKL4XXJZ4EJebQbtnOIHRj7y9Rs2ZG4C+Aa
         bS+AAISBr7XhVOS8fYsiTMUCHTfaJZqV0BOA9Oz2KXrv68NT4gy9YRJutevVLebm3TpX
         sR/w==
X-Gm-Message-State: AOJu0Yzksk0ZIRA04fNkHEDH+KaQcwFjapc8MO4yHcCva2Pcen1KLxzh
	+0ZlzZkSgYat/0Qko4eJ5mpRmUZpgHE+/6Zt/omSZ3WFnuToD8fBtqvE2FdPhuQlTKduZfapUcG
	TdKhP
X-Gm-Gg: AZuq6aL0Np2+ZtU3oD6hlGoDJDQqI90DfOTxUrQ0oQDlOtz/bUu9bwNCEtQHqabItIz
	bVL1Sc4GZ1tYejExrW3HBCp5Dd4diMrD9KAMQJBUcTHLM5KpmZGUusCHH/cdtb4haMkzO3FPbgC
	JhnoSQodvTlxebxWcYKXakXAv9rm+dCqSFWrAsWoOAqS7np1t4x0H5PBhy51NXno4D0P/GB85Le
	GekMOyN490q01s3DXa1Fn7Q7aQ4PzWBER+DKwHtGwlORyAhc8pWMRFsXsLP+XREEE/0j/nZo6Ls
	Vv0l6tekAXnGgKfkyHon1bmZbiTmap/WF0b8ObIugFOZfUYEiWZwC0Jfel4t1bZpeLtSscLDrFi
	GzTfxjHTyrjtke2Cp0/dzjhkt13n2Wa38GUAJD6LGYDfy4CNq2EnMOs4z0nNwcv52vrLhQURnzZ
	5XsOPVcKQdFwDo93WqcHbvSOEOvfdjMxzMaQ64e1huQwh9N9lGkao/0spYLFQU6plvLG6MJVHSF
	ZUFw+MAYYuO3LSwpTrc4I4nhRPluQTS
X-Received: by 2002:a5d:64c3:0:b0:42b:3131:5437 with SMTP id ffacd0b85a97d-43569bc17f6mr16765166f8f.34.1768910967619;
        Tue, 20 Jan 2026 04:09:27 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/22] pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
Date: Tue, 20 Jan 2026 13:08:36 +0100
Message-ID: <199c6518f5e363a2d8648bdfe14233afd9b0ba6e.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229700

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The pseudo update was causing hangs in builds, pull in the fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8acdbefd0a148c8b7713f46066ae8489984c5d2d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 19da3d4e08..c78f1ab724 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
+SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
 S = "${WORKDIR}/git"
 PV = "1.9.2+git"
 

