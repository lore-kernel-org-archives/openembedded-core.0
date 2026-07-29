Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883CFC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 19:50:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20039.1785354652333266591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 12:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YpRrdlQM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f75f7172so10787145e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 12:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785354650; x=1785959450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXHvFEsu4ESabMY3L/wciiWQYv4pbMtiS7pnoaRQygs=;
        b=YpRrdlQMbeWr+KBkipIUNYipUWlmsTiAtz0UGkrkrCAP6kdjqMoUM0oWeWoUQlYqWe
         Vvn7xJWtHQMb69uH9zczt7PsJdyHCGQfTpuP4yOT7W2gBRDyU6/S+3YQxOfbZpz29x/X
         craVGScnmnxrjOc0msDXYN7RIidOv4VXjtHko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785354650; x=1785959450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXHvFEsu4ESabMY3L/wciiWQYv4pbMtiS7pnoaRQygs=;
        b=lD07M/UeZgWQoKLLTqjqFG1EusAsGd6WxsjWrWP+HFBc/akhoo/7X4bXaxfyacrtsX
         +THYYZZQ1L+Xcel6n4VaY5x/A0pwU9yjMtKJ+gCB186TCM0XKCNqW14dhVVndSVBRv7I
         UcWLsNuGnTNWwXHENaKA7LU7rKgPpm6BDncq3b0/m5uqEbjzmHZskaOJbevWagTX/DN1
         K4duYpwt5RaGf37s6DaoZp8+wXOmXyfvxh0R1G99W2BCbGF3InCki77RMf/6NcP584Mv
         Q2pNGn9eEk6hmfTH0gQvZDgAAMDHxh+wKrJEhvg0BnMwIBbZiVRlalD5OEFVgRuNz022
         1lzg==
X-Gm-Message-State: AOJu0Yzb6/H9OL9uJnii5NupKnYKR7NZQ09s2D9fIMRaSJPZGXybiWQJ
	x8ogCQIPzHdtBgcgPepxGrOZg/JwfMu7q9zqBzLYsslgAczD46c8uhC+5TFiplSoLVzuYhBsLvZ
	rhMqUg9A=
X-Gm-Gg: AR+sD12BXe1SKY+Db21J2QP1ftKkPaXAayGcFbXbH8+hUJf+DU/7cCxLOakMg7q+Jc/
	+KFXpuXAct6SEkzqRib/I1mrvl7bb+n2cmonQptlbn0w8/zjdjpWaXJUjxorIRQcgNJReBJUWup
	eSV8SJGWrDjt4IHc6eN3LfOOaosiz3cZWh/e44e3qcnKlB1Q8G/q5X8JxKzGxyyR+Npn7kBdYIm
	WD624CUdYP8dV6SmAteT1x6pG9tmLgfXLuL4doC4KTHTO/yg2HOyqz/jHDhmnTLxunGXXf8yFRB
	WRvmoRUUsVhirThr4yE4vYrOx1BTWvmoxLKVqi+G/eC6trtq6e1BHbVAL2Drkn/S/swOIvd/KaN
	FKqdryVtq+NALS/8MCpUCnS6V+q+lH692XZ1fROV4LERsRuaU9WkJSA56AA0VweIAgoXek7fJnq
	UpXYTxmjIU0id3Ifwe8I4GRUSGmZWBsRKvvE2hsZ0wwn+zhoaQqzH4p/Xwcq2Jito+XE2PYht8p
	RBJ3o/NSn5QVnU1uw==
X-Received: by 2002:a05:600c:c48e:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-496c641f388mr85136185e9.7.1785354650547;
        Wed, 29 Jul 2026 12:50:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6abd0a6sm8864768f8f.10.2026.07.29.12.50.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 12:50:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to 1.9.10
Date: Wed, 29 Jul 2026 20:50:48 +0100
Message-ID: <20260729195048.3170959-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 19:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242284

Pulls in various important fixes:

Makefile.in: Bump to 1.9.10
test: various: Move to makefile compilation
test-bash-exec-env: Add bash env test case
test/test-openat2-func.c: Remove unusuaed saved_errno
pseudo_util.c: strchr now returns const char
pseudo_client: remove the unused pseudo_prefix_dir_fd
pseudo_client: step around all of pseudo's own fds in closefrom
pseudo_client: step fully past pseudo's own fds when computing startfd
makewrappers: Avoid efault workaround if using AT_EMPTY_PATH
ports/linux/guts: Add __open64_2 wrapper
Makefile.in: Bump to 1.9.9

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9f02d905681..d0559f6c9f3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;branch=master \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ca47829825f297d7bf83665c0541a9de4aa78009"
-PV = "1.9.8+git"
+SRCREV = "2a5521e9573049864e07907415f1fee28232d90c"
+PV = "1.9.10"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

