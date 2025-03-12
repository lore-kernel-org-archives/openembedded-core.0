Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2CEC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.4660.1741809174026750961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w8N7lc3A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so645909a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809173; x=1742413973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d5hdTCGswwiCmn4HnFusHBjChRqmLo0ccJexye7IxZg=;
        b=w8N7lc3ATAyyIx8zuJoDYEJXKopUvmUIVAMKQAqJVGO8HSdKGuxLz7ZyfgOcgVAi8J
         IF87xhK00HoDBImJQEvcFeklZcHjI7pUIANR8BQUwheSdy5qAkC8cpGqxTQTT5evumH1
         pMfmDECgDplUI0E88j4c+qoZ0b+h6Ar+00xgoIoPD4G195CnFAIq6y26Wgvqr8x6bbgx
         YYewJGhLJB0TvsVeMiyWG5WVVGsAcaf6rKNxxIB7jjg8p1ihZQ1wFle/KWktqinHzTos
         v8YAzIgzDjF6mS4BaTNJDmZ9eZDGmzfDkymdKFEJsVl5FRvckidXWwZzEahN4QoftEJT
         xYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809173; x=1742413973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5hdTCGswwiCmn4HnFusHBjChRqmLo0ccJexye7IxZg=;
        b=B9x6dhB1F0HbAPFf6qNMFB04xnzQdLGwwL/waFbyFdHcSIT6tyWxr3bievdGXkedGi
         Y3Am5K0XOr/e17yy0TbtGNUJrNvrRxiyXS8bUyiC7cA9N4CmJWAOUVzMEDZj99dkFwZA
         596NIlpvVN9bUTtZAXzc/XbUjHCVJqzsYZDeyR9ItA7DDSp8nFDLUn9MT5JAyQHK3ZjZ
         QDUEexQxHZMZuxJtJOSNrfw/wbaVPf4X0k3Bex1WSNraN+4Ud4Q69QJxNd4pXojGsAXa
         88B0p2N2qVJKz+14/KYU/6oNgPNrs44kE1vqtC+S83dPCbbhzcvKlTnYH84aXmkW+kcW
         3xCQ==
X-Gm-Message-State: AOJu0YzlsSkT+Npy6Vs3n48rm2DUCd0tEBVCj9bg5ieDZiRA3dmDWYta
	5NOq1LtR4ciifxXdgp8xF0FEUa6+oiFhTAhCoulWJyCzvP3f7L4EjgXDcnuk4jIgqH/WfE2QQxj
	H
X-Gm-Gg: ASbGncvmnWQWwmlFVYSlQJpf2VCSqRXfFhQXzS6PD9I3qzkHrwv/bDtz9JDnDEmFoAB
	8s8X1z6Q8oMW5aus5dniNKR8HAP3xLonElHaKefir5z2ATT4aGjp56iPDqnTGNVf9knoR9xvBSM
	YUxUCAgKbGxNUtt+NhLpmqQvduhKki4j9g7KpoGHXDCl+p3hRaEpj0KX4apg8uWQAze7VKXKFcg
	iL8BZ4BmYfONIpz5kIh2bEBa2lgWfXisbVPidiMxaHhjfab7M9QBQcNj4TvQ/6HiVHL5KB93igg
	d2gdU7Z55ZdoRBDg0rN77Vqi+Rv+li7lMBM=
X-Google-Smtp-Source: AGHT+IHnJtiprZmnIAf41lRWIMgmiRrzPgH0mfjrXk7cqQdiShx0qSfdpXzxFiX+fkas81RyuyN+hg==
X-Received: by 2002:a05:6a21:516:b0:1f5:709d:e0c6 with SMTP id adf61e73a8af0-1f5709de3e1mr20573949637.42.1741809172256;
        Wed, 12 Mar 2025 12:52:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/25] grub: patch CVE-2024-45783
Date: Wed, 12 Mar 2025 12:52:16 -0700
Message-ID: <7c18697372444ef9e4df03b7c9de7b8da7f4f600.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212675

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
index 01d9be6bc2..05aea4cc6a 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45781.patch \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
+           file://CVE-2024-45783.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


