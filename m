Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A18AC44507
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:33 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1279.1783747472160211393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=FPqd1PyA;
 spf=pass (domain: underview.tech, ip: 74.125.224.45, mailfrom: vince@underview.tech)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-667b0ced2d3so2400084d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747471; x=1784352271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zhm0a97fNiBt0Fn9CQEK8a/AjsWILAXNwwJiR5ee8SM=;
        b=FPqd1PyANcVkyCsaMLBmOrhG7U+nr7YVHrpQVx5cLxqZckXqr2b189+vsEk6+SjHsR
         TWp0T0ClSQNxOAcd15Nef3xr0UiWEB3CHX/McsAGI/oJHqZP1Hk7YpDufsRW8eRz4Jnj
         8fE/4O2IqFsHiYwIGuBZLT2ThkWq5aRwXDzDfGuQCsJ7PK2FfRCPZxR3FZBhcAwi8N/r
         4dKNbcYL7P0e7/hq4wIAFuy4mvxRr0gjKyoRbIKTVCIEoAwKPo3ukrtCWL6leAsTnPBN
         mzo1wcwyf4mJ+S+wEXCu8PmRU5e3hsRUTlY6Y4uX/oN8AKtyadXieeTIqsiBFEkAb0hI
         nPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747471; x=1784352271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zhm0a97fNiBt0Fn9CQEK8a/AjsWILAXNwwJiR5ee8SM=;
        b=pdxh8iM9UIe62lpM0jYQKTdQwjUprV8u3ZfRAOJd1pshyfc433kpyCogChFidvSdKK
         1COcxrtg/fN4wTN8B1xq3CWn3gJw90ehJkR19Re+YJMKZZu8f9JF/UgUeOpSe8LwgSLZ
         mHShk3rU4Stoih0hqMApThPeHeG8HydQwcu5CgeW+R8MUAZypCN7gwFLgpCJlrX0g43v
         IFGND0Os2Q5M4viQ2uG6DZyo40wDZ5Cx+/yX/Fe7Bcu0s7Vmh4+FRKwvaK6eZiXfwdaL
         sn+bgD9yAPTyNpE+i+M7mQrrVfdayQ7og5T0g6jj43Lmn24vx1OcEeVrzAWvsm74pesI
         zyXA==
X-Gm-Message-State: AOJu0Yysm9921EZ9yFzAt1CyAOx7D5bdVur7YqDWHWbuCHU/IEUn6jhf
	VIWMQLdooCOrg8R4XipL68jgIFlZLTWKySh8ckIES0vJxoDEH5ysH831mil6SrYoeIxs6PtXacA
	Sf27F
X-Gm-Gg: AfdE7ckRH1U3jUA5bCGFFcd1DrcR8f5rlEZI5yxfMpSrx23Ie/tBAxfA1KspUzFtdX/
	W5S4HbHvYwuUCjDLlDfOeO9na0W488nonoAxHSTvEavzmRtv3XszqWbvOHnWygq5piwQAO8dp7/
	UPeQbLIOZqsFYnT29aKlMCPcjezo+AsJZ82j4cOKWjEQPDX7mpA9Uqe6cjxycw1jG6ns2MpLPpi
	igw+Tpf7Ra9iiyZcpqUZ/LGme9/Csb3kbHK7wKw90RrMXKQnWvOulzOIt7/0RghPt8ZOFtQU5Xs
	JxVBfpz1FNQYPv9Uu22vocM4Pw+O2phY1mAMP8JVu4OmTfkKI02bnivByVGUb/hUkzqHS74PZ/3
	gsZF8qJtsLh2uq+3avnRgbYsA0MaDvhBqG3SCTcy4Dn7PtYwaIhoZ/NC+Ojw0UjlEBnmgUOGWPI
	So7n+A3hZ3CsBy2w==
X-Received: by 2002:a53:a208:0:b0:660:68ac:21d7 with SMTP id 956f58d0204a3-667d7b8d428mr1142767d50.35.1783747471195;
        Fri, 10 Jul 2026 22:24:31 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:29 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 03/19] packagegroup-self-hosted: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:47 -0400
Message-ID: <20260711052403.1292286-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240684

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../packagegroups/packagegroup-self-hosted.bb      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index c386267781..2ef59a5ac8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Packages required to run the build system"
 
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 
-inherit packagegroup  features_check
+inherit packagegroup kernel-vars features_check
 # rdepends on libx11-dev
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -51,12 +51,12 @@ PSEUDO = "pseudo"
 PSEUDO:libc-musl = ""
 
 RRECOMMENDS:packagegroup-self-hosted-host-tools = "\
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
-	"
+    ${KERNEL_PACKAGE_NAME}-module-tun \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-raw \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-mangle \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    "
 
 RDEPENDS:packagegroup-self-hosted-sdk = "\
     autoconf \
-- 
2.43.0


