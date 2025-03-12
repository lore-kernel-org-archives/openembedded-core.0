Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B0FC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.4666.1741809177536164049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v7TeWPcK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2feb96064e4so600287a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809177; x=1742413977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8J104HOb/aP/AJNsB/VMz2RQhM7dmQtTS492wc4eP8=;
        b=v7TeWPcK8nbBXk+h+29w9VXKi1zD1GOxtcLJF3XWWYIRSqDTJ2rHa3rMSh+57en8lX
         +xGK3RIoxmpBGtjMhF0xg00P0QwCMF/bkRfgPhJXjpgYdKCR5+rT3PK1CPhwa3yfYCnu
         QdAK209eFV7mKeVkAOeIiO59qegzDngfMIKPadfkXT9pItgKJjwERyxjUMEqAfJP9O9F
         r9GuE210j7B8eweugMLgPkwJciicDb1+mM2SPzuWRI9ZEwo3r79x+O4fIr7bpbCgK5CL
         Fx59XBPIh9VfczncT2nQ5RH9XhUYajabWEKywQ7Iwe1jA0LvshGA1he0ycRr+GcjBBPk
         /siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809177; x=1742413977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8J104HOb/aP/AJNsB/VMz2RQhM7dmQtTS492wc4eP8=;
        b=W+bKRcYlNwrFdDj9pmiRwtBOVi76252o5CpLo3O6N6Kf7Fad04jXL8jeBs+FmHzO8e
         nQsLsKRLVSZNXDgYZU86dstOlr23K6exkA/oehELoXymWXiAILx2jqwD552hgk0BLlbg
         I4ikPrz0NKdxblBIX/vcbWF0A7xwhBpWr3t+xVCpraZpy4AaqLOs5gFX7ue6Vlz+tJG/
         5Sadun+gfiw0QS9HgJw/+oQDHyGEWAx4wcheArdXN9+XAp38Xju7a5H0zoBQeVPs925p
         xBf9BRvF90iZE8BHnZV8xiYZOtygP5k6OJ0P8j6GpttDd71uytNCesnVJlD75H7/zfwb
         e9Iw==
X-Gm-Message-State: AOJu0YwP3v7+YtYPSXZBSWm99VVojncHaaKLQDfd34V5+vDIZFPzeSQY
	IQd7v1xeEHbUT8EXsuvPbaXOvFrn4GO86JiOyVRI/IxhwzIpIrzHGsa/eDnT+8p7iIEzxBpE37w
	V
X-Gm-Gg: ASbGncu3Ml6E2PynyX+viLRDGxQGxbH5D2iJmFQncYaaX9XESskpyKgb6rU5wWRTnvP
	ZvAl/MXd+tppDjVOpoSPr7LzpR2xH8VvBBRb1BT29Pc+AWWVCRKfOJxrgkT+MLw5CpooR364AHo
	doUe2mcPI/c/WRYAi9xhDwXkEJsO3vxH3SAlT2UD66pIq1tjH3ACPjJeHmnRXXhFX94WdsSbUzh
	AGjimKpiAEDv/g5VD9LclZ1WzArpzWQFwdT5JQzEko7sRN/MLJ+S2hj9PIUurUi9VUqYU0U/vHa
	TK9sTTMVBbkoR5Gq/U1qwX9UcUpX+yW1ACI=
X-Google-Smtp-Source: AGHT+IFyVkHp135oE2vviUjQ4aJhFKuOOtGlCQMC+ZI3kOgazfwPoMOA47izn9j+f/FU9WwtoMshQA==
X-Received: by 2002:a05:6a21:7a44:b0:1f5:8fe3:4e29 with SMTP id adf61e73a8af0-1f58fe38bacmr11616420637.3.1741809176753;
        Wed, 12 Mar 2025 12:52:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 11/25] grub: patch CVE-2024-45775
Date: Wed, 12 Mar 2025 12:52:19 -0700
Message-ID: <0ae686de6aefb10d961cd8965dba8a02d1c977c6.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212678

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45775.patch           | 38 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45775.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45775.patch b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
new file mode 100644
index 0000000000..70492b8c2e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45775.patch
@@ -0,0 +1,38 @@
+From 05be856a8c3aae41f5df90cab7796ab7ee34b872 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:55 +0000
+Subject: [PATCH] commands/extcmd: Missing check for failed allocation
+
+The grub_extcmd_dispatcher() calls grub_arg_list_alloc() to allocate
+a grub_arg_list struct but it does not verify the allocation was successful.
+In case of failed allocation the NULL state pointer can be accessed in
+parse_option() through grub_arg_parse() which may lead to a security issue.
+
+Fixes: CVE-2024-45775
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45775
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=05be856a8c3aae41f5df90cab7796ab7ee34b872]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/extcmd.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/grub-core/commands/extcmd.c b/grub-core/commands/extcmd.c
+index 90a5ca24a..c236be13a 100644
+--- a/grub-core/commands/extcmd.c
++++ b/grub-core/commands/extcmd.c
+@@ -49,6 +49,9 @@ grub_extcmd_dispatcher (struct grub_command *cmd, int argc, char **args,
+     }
+ 
+   state = grub_arg_list_alloc (ext, argc, args);
++  if (state == NULL)
++    return grub_errno;
++
+   if (grub_arg_parse (ext, argc, args, state, &new_args, &new_argc))
+     {
+       context.state = state;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ea6e19072e..b9b9d37637 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
            file://CVE-2024-45774.patch \
+           file://CVE-2024-45775.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


