Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F6CC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.4556.1741809372941143880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=O7veqJhd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224191d92e4so4660565ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809372; x=1742414172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e51UW24XYR+n17o67gk7ZtywxYcOoCqo/ZkymCj1Fs=;
        b=O7veqJhdu8M5eX6qgYqnoczbwPEgw/yVMdrBDa/UgwtdwGvuMA8sk8nAzyLT9QLvT3
         kj4iuzkC7LUS8yJcJeDZzcsGWbS+PULB4oy4Uugtm+vMtCgzgSrpemzZBwnYg21lL9/9
         GH8Que9XUSC92T4XAF1HVt7O2zY7c9FP9uXmLnbewckshDNk063KIPwvXp1q1gVt/tab
         LcOdxRA0rpKM7VWfEqGhmUuSzYgmfaRxqf5/riuRtwQF2GSM2rKY0BRT56tyJoejD1IT
         JbIVRTeAyaKQBbVF4iiMBn0cMbVqYexa/gBrDhbW5//GrjOIPnRGRRlC4XJJ/FMg9dQW
         yrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809372; x=1742414172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e51UW24XYR+n17o67gk7ZtywxYcOoCqo/ZkymCj1Fs=;
        b=j5cBba4lVpccovRuXHhJJyALd/Xq15i4Nqm5p0sy6SusE7buZb2MxyC07Y9RVv/SUj
         b9GWNyk+IPSDjHMkWt95aWTHJhu+zkWUsNGqia5s2e94TT1tNayU0XWfrAfsJAw8WSUd
         hGLYrhMyqybGQqQO2xTh9ZKo4/Nf81uTpWW2Le1Yarl2golamVUy6n9eai0lZ25xYi6A
         ZrVtuIKVgWFqw1b2OqYQAU2jXZ4kreDKUCvMrV9vAaClqp+2vB0+ntyDK5kg2/NDZvsQ
         e2iez/pOIJh27ZGv/sNLccQ9Jal6DCf0w25v6cWHbblNwaVSHaUAKS8Mf+DBo0AsiUqf
         LSZw==
X-Gm-Message-State: AOJu0Yx6TH16rQU1wWBvGvk7LxXHKJLj+/pFh72Ao8i6kF0RaMuoW0DN
	FTjKtm1U5y0ecgFiLUUFS+1tquqDgV6ZGA7josOo2zfLMpLP9MCFWB3YgIBxzNl613fUrlUAPvo
	J
X-Gm-Gg: ASbGncs5zisZ5X5tXSvk+XWOWvpQB4W1oUT5iQXrNpRKKiGLmxyMzgG198GIqrZSFmg
	p7ZbLua8/XgF0Jr1O98rwJ+6cUKzhxWSL1bqMmJi1GyBGLhieKk/D55KfYfLr9l5jjc3u0oDPBz
	xPQCVoHO4CT4Jmqty1yZYCJlDVHAg1w+MjfuynFTEM0cEjYaRcVcNRIjfhlbNDjXcCaNUnZIhnq
	WhSgkFKGt+sqBU1ReVxFe7Ib8tsX/cCShAkjdwVxKyvTYvw986qMVloTq3CbCXRPlBGQX2QdPiS
	AIlo5qk+o4vkRNrbPD3fu9rWgJCIT/hv4c8=
X-Google-Smtp-Source: AGHT+IEWhs7g/ikY2eFvVyFl6WFNupo2FvmmeEngaFvn8kv/IoYonpOJLYK3mjahX9T7TcCIgRuerQ==
X-Received: by 2002:a05:6a21:6f07:b0:1f5:79c4:5da2 with SMTP id adf61e73a8af0-1f579c473bdmr22610462637.31.1741809372254;
        Wed, 12 Mar 2025 12:56:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/28] grub: patch CVE-2024-45783
Date: Wed, 12 Mar 2025 12:55:31 -0700
Message-ID: <70a15bc790025e3241274d3e92674928c41537b6.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212704

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45783.patch           | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45783.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45783.patch b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
new file mode 100644
index 0000000000..99c769961b
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45783.patch
@@ -0,0 +1,39 @@
+From f7c070a2e28dfab7137db0739fb8db1dc02d8898 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 06:22:51 +0100
+Subject: [PATCH] fs/hfsplus: Set a grub_errno if mount fails
+
+It was possible for mount to fail but not set grub_errno. This led to
+a possible double decrement of the module reference count if the NULL
+page was mapped.
+
+Fixing in general as a similar bug was fixed in commit 61b13c187
+(fs/hfsplus: Set grub_errno to prevent NULL pointer access) and there
+are likely more variants around.
+
+Fixes: CVE-2024-45783
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45783
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=f7c070a2e28dfab7137db0739fb8db1dc02d8898]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/hfsplus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index 295822f69..de71fd486 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -405,7 +405,7 @@ grub_hfsplus_mount (grub_disk_t disk)
+ 
+  fail:
+ 
+-  if (grub_errno == GRUB_ERR_OUT_OF_RANGE)
++  if (grub_errno == GRUB_ERR_OUT_OF_RANGE || grub_errno == GRUB_ERR_NONE)
+     grub_error (GRUB_ERR_BAD_FS, "not a HFS+ filesystem");
+ 
+   grub_free (data);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6fa096c57b..604c2fe568 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
+           file://CVE-2024-45783.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


