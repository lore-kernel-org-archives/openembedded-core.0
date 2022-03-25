Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54034C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 20:54:20 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.319.1648241659912366860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WMdS+jnp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id e5so9423823pls.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uexQZRYHhlJkb+xcq6gbJaGDgUDmEJcBx/RQmWYtoQ8=;
        b=WMdS+jnpse3xfkIvnw8QnQry6liPrZGaTzPH+enXi3jAWVjK97Qx/UEmtHb6V+D0yq
         oEgn16a59mV6vQQH0MprTZtLZZv2mfZDsOalwpFAHjoTNP1wI94YwqUK9aNDF2pDtCxc
         UEf+X6xPoqvfRYqVt8c4bxEpdwgJ5C/6boD+exF+9dYIgDwwTy0b53mNSneJvslvkkN6
         KA191VRUNoUfT5+YL1kG5yRPedDD44aP7NjUZcbPU4orj3HTvGhejDJPQFcVTvtnOJRw
         rEUP1nbbslv8rDWady3lOE4rXiIHfHoTOhzoOIz8TAFQfu8w4fBflj28EQ6ebBqM1wfj
         46Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uexQZRYHhlJkb+xcq6gbJaGDgUDmEJcBx/RQmWYtoQ8=;
        b=NcJDzB2U6oZAkNtbQk+lldar4bPHDAx8DkbhSfhuc/aY+Iva+iO03tpcUkH/lFX9Bj
         PkcTHJl8ilHcCnKLf48q7BdSu9+Pw8b1NYSR0bPPs4nwzZVl3mpO0a9ua0GHgy/In/M7
         VBKjfYLBPEzQCx0ns4RefVZr7LNXjdXGlSWduw5xeuV7xcrKwLnKTx+hvKHFzAty5MZy
         bgfMJbKMNehb/DmvNQnNtte7DUaFi+EF/0V6NRUvOn53gV0XzAqQklGJY9ommaMM4pep
         RLSo22HTnX4hbzFqJPC0XzwCUk1w8FaDi9sIaPjapNqWwFlO5+kO1HLqUI+XNpdeozA+
         ilGQ==
X-Gm-Message-State: AOAM533y40i0iSVnBurOHiMuaBU0t5pOVyhyddwEVc4rJBNm6tMhSia3
	GlOMRGXRCQIGPWJQrk0q2D1hIVVxm1w=
X-Google-Smtp-Source: 
 ABdhPJxbg7K7+kNX4KzKx5ZVJP9/Id78vfmDMYpHbDFyP91Tn6CblBZmRK51exaZwwHvaFqc7c8f4g==
X-Received: by 2002:a17:902:e80e:b0:154:1e0a:ca3f with SMTP id
 u14-20020a170902e80e00b001541e0aca3fmr13738689plg.64.1648241659135;
        Fri, 25 Mar 2022 13:54:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm8869763pfh.143.2022.03.25.13.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 13:54:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] grep: Fix build on ppc/musl
Date: Fri, 25 Mar 2022 13:54:15 -0700
Message-Id: <20220325205415.486594-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325205415.486594-1-raj.khem@gmail.com>
References: <20220325205415.486594-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 20:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163655

Backport a patch from libsigsegv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...a-standard-layout-so-glibc-and-musl-.patch | 32 +++++++++++++++++++
 meta/recipes-extended/grep/grep_3.7.bb        |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch

diff --git a/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch b/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
new file mode 100644
index 00000000000..d8283d31b16
--- /dev/null
+++ b/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
@@ -0,0 +1,32 @@
+From 981385237834bdf3e468421147eece68d9bfc7e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Mar 2022 13:34:26 -0700
+Subject: [PATCH] mcontext is not a standard layout so glibc and musl differ
+
+This is already applied to libsigsegv upstream, hopefully next version
+of grep will update its internal copy and we can drop this patch
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/sigsegv.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c
+index 998c827..b6f4841 100644
+--- a/lib/sigsegv.c
++++ b/lib/sigsegv.c
+@@ -219,8 +219,8 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
+ #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #  else /* 32-bit */
+ /* both should be equivalent */
+-#   if 0
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#   if ! defined __GLIBC__
++#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
+ #   else
+ #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
+ #   endif
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/grep/grep_3.7.bb b/meta/recipes-extended/grep/grep_3.7.bb
index 40390c25d93..7005cbe164c 100644
--- a/meta/recipes-extended/grep/grep_3.7.bb
+++ b/meta/recipes-extended/grep/grep_3.7.bb
@@ -6,7 +6,9 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
+           file://0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch \
+          "
 
 SRC_URI[sha256sum] = "5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c"
 
-- 
2.35.1


