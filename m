Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127A0C35FF4
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:57 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4459.1741809174763333376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SgCKC6Hb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so451291a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809174; x=1742413974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9h3w1n4dTXRsS3q6DuGnKpWjnxncpjsVoXXnGIgB5g=;
        b=SgCKC6HbhM6ntjKICDDx6+1igYbhjidgSuIHKUv/PQ7z69nxv0U7Sa9FGBO28w+rz1
         l7rcee3cSVIfdedbtvJ/aEThKyzK7o9IWWSqdTPWRFGOxKsJmdVxJDqa6YZq0qV80FyE
         msWWXELkaa70CmwgA0OMU4ANWX6uTUlKEtlYvPyvDBYzkbnngJsnDhQE+c5CVjGnLZON
         1sJeMhTXJ0bBM7CK9W860us/mBeC2eToV7Au6hAlZz85f4ejt9YISWMeO+1uqAY6aNKV
         bK00gLBpHYst2oyuU7+eeXWZPUbL6KV1IfItcjX3CyB9KoAIFpD68ZeZA7+3wfRIPFpI
         KGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809174; x=1742413974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9h3w1n4dTXRsS3q6DuGnKpWjnxncpjsVoXXnGIgB5g=;
        b=wWaZ0tw38XKNXZFYrLgPkvua93yYPZ8B/wQhQGA54RFm1JSX5/q1tdJM85v9GWUnDj
         2UVB2wolXcOEEIxG/6EYABlW4yUcRN+Am5IP/NhDyn9rWYAUZzJTZyi7tSHsiLVBrbkl
         jlEP09VJusgAxVjoN8ChmzHpg7gRSXobXSnPacvBo+EQ4PddvtK0KCIWc5IvMORfNrs4
         bpPJwyypuwVBarMOWCFDTWIYQOGNxNx5UoyU8UuFjFXYGixpkIjHTRjWybA2JL1R5SBF
         ITgs2KtBhOjBSSwvufwojEHyG4gBcD9dzIAlXZVuvNeWSOLqi07s0keJF4LYxdRsSKQu
         jsJw==
X-Gm-Message-State: AOJu0YyIuitnaXlSDraNuPDOWglGL6whea8cnWJRaUEjNQy82YoM5+Aa
	mtnO7bqbJ4niwthPxe6GOBmWhSwqaCiH+f/fb4GQeI0REnMt8vS4ZmCwag8n5XMzk32jJq6r/RW
	x
X-Gm-Gg: ASbGncvIq1pEbgJSiS1LV9yu6FJ2RM/RuJZ+LSk4UdEcXfF+prgV97qDurliawKQuUf
	mvE287Ip2Tccb2uwqur7xvuEWT5bzQ0SDPB2Km2/qgHNFPbwO4Sz1Lb7sqDl84HIjyekAgTuWIj
	/cLqURTU4s21lURoruWMCqvj2f2vioLg2L1ybP6rzcfNp1KxI6ykWQrJK+05HEHpeWYU76WlaIU
	QeVbo6pjDzTTi5Olt4O8/uXRaCrEMFhS6T5UHRV0S7v7X8NN6znQ9mQRa9Bpx0C/huT0R37IEqp
	gBT+vplJEo3LUWqaoUiD3/bwCU+d5oNJlLU=
X-Google-Smtp-Source: AGHT+IEremucqM9seze57Dvhx8Q1Uc2IYNjpaZsjnE2zk6Q2+Dfp9cZzBjgD34ybdWlaOkJu/omE+A==
X-Received: by 2002:a05:6a21:6014:b0:1f5:8dea:bb93 with SMTP id adf61e73a8af0-1f58dfa02ecmr13972049637.7.1741809173992;
        Wed, 12 Mar 2025 12:52:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/25] grub: patch CVE-2025-0624
Date: Wed, 12 Mar 2025 12:52:17 -0700
Message-ID: <29778ceddd775c47d722ecf1cc587c6526202d0b.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212676

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-0624.patch            | 84 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0624.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0624.patch b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
new file mode 100644
index 0000000000..229fe6399e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0624.patch
@@ -0,0 +1,84 @@
+From 5eef88152833062a3f7e017535372d64ac8ef7e1 Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Fri, 15 Nov 2024 13:12:09 +0000
+Subject: [PATCH] net: Fix OOB write in grub_net_search_config_file()
+
+The function included a call to grub_strcpy() which copied data from an
+environment variable to a buffer allocated in grub_cmd_normal(). The
+grub_cmd_normal() didn't consider the length of the environment variable.
+So, the copy operation could exceed the allocation and lead to an OOB
+write. Fix the issue by replacing grub_strcpy() with grub_strlcpy() and
+pass the underlying buffers size to the grub_net_search_config_file().
+
+Fixes: CVE-2025-0624
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0624
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5eef88152833062a3f7e017535372d64ac8ef7e1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/net/net.c     | 7 ++++---
+ grub-core/normal/main.c | 2 +-
+ include/grub/net.h      | 2 +-
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index 0e41e21a5..9939ff601 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -1909,14 +1909,15 @@ grub_config_search_through (char *config, char *suffix,
+ }
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config)
++grub_net_search_config_file (char *config, grub_size_t config_buf_len)
+ {
+-  grub_size_t config_len;
++  grub_size_t config_len, suffix_len;
+   char *suffix;
+ 
+   config_len = grub_strlen (config);
+   config[config_len] = '-';
+   suffix = config + config_len + 1;
++  suffix_len = config_buf_len - (config_len + 1);
+ 
+   struct grub_net_network_level_interface *inf;
+   FOR_NET_NETWORK_LEVEL_INTERFACES (inf)
+@@ -1942,7 +1943,7 @@ grub_net_search_config_file (char *config)
+ 
+       if (client_uuid)
+         {
+-          grub_strcpy (suffix, client_uuid);
++          grub_strlcpy (suffix, client_uuid, suffix_len);
+           if (grub_config_search_through (config, suffix, 1, 0) == 0)
+             return GRUB_ERR_NONE;
+         }
+diff --git a/grub-core/normal/main.c b/grub-core/normal/main.c
+index 90879dc21..838f57fa5 100644
+--- a/grub-core/normal/main.c
++++ b/grub-core/normal/main.c
+@@ -344,7 +344,7 @@ grub_cmd_normal (struct grub_command *cmd __attribute__ ((unused)),
+ 
+           if (grub_strncmp (prefix + 1, "tftp", sizeof ("tftp") - 1) == 0 &&
+               !disable_net_search)
+-            grub_net_search_config_file (config);
++            grub_net_search_config_file (config, config_len);
+ 
+ 	  grub_enter_normal_mode (config);
+ 	  grub_free (config);
+diff --git a/include/grub/net.h b/include/grub/net.h
+index 228d04963..58a4f83fc 100644
+--- a/include/grub/net.h
++++ b/include/grub/net.h
+@@ -579,7 +579,7 @@ void
+ grub_net_remove_dns_server (const struct grub_net_network_level_address *s);
+ 
+ grub_err_t
+-grub_net_search_config_file (char *config);
++grub_net_search_config_file (char *config, grub_size_t config_buf_len);
+ 
+ extern char *grub_net_default_server;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 05aea4cc6a..3526c43835 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
+           file://CVE-2025-0624.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


