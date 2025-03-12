Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD7DC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.4558.1741809374415301518
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vd29Bkp7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22355618fd9so4853795ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809374; x=1742414174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmSZqAgK1aEc974gYVMnErfQQO9yEgayfV/lf5Fud6w=;
        b=Vd29Bkp7+Cz0zYCPl5KDk5r52SInfUl+wcMhOcS428LS/xSoPTw2gAHYl5r/5vHxNK
         L9+edcxuoP9zlyutZbuW0ETwtOJjkEQvIZt0LM9016f8XYxkL9POooSp4WZjYFYAnHwu
         mhUJzIU+lwh/3k9mZrmDV6KRWUjK+k7YlijMfWz4VFTJn5ghPTNQ10vI3DQA28yB+dC6
         tzkseiWMfTrTzHFCjXZL984f11S90SfreS/GCrd/Y6Hly+jYwQ3IIL+VljJ/D8BMb6jf
         Big07sUd34f2a/2G2zZLHobrUp9ooJplJZh1q6yTz50UZlo9zwuU+vmWV5WqGqscZsmn
         vqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809374; x=1742414174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmSZqAgK1aEc974gYVMnErfQQO9yEgayfV/lf5Fud6w=;
        b=EwM3acUI2hPYkTlgHr48w/3aNHrDV1nHLRFSaLLWNr2opK/LKk2l/XcerADvHvuSib
         jHzyHg4XKg0o6sL2HRHUm7/mE6VPTTIJP4eoVQ71TWN/GhM6CxeZ1GwANPjYOFdV8tH7
         Dm6r67tolZobjA+p2wuwVnhyH80pphtsOhJ5oQKOzTPa6HwlyoiZZ1KpV+LhCK4xV/Hc
         cYrVooVlxIhCNP3g50uk4MvWIejGP9JLBnmpHdlTO8hVX0WRIxLB3mE3duGlc+Z/6VTE
         KS63crIfkjTH5BnsmNcun+64h0P5UxEcHtmdkvTkigQByJ0cvfn9QlYluLiRnDi5spCF
         I4uw==
X-Gm-Message-State: AOJu0YzfxIWJxvhcmLLHma4fwoCPZv2g/OAWulpj1WJnPBDHx5foHXuI
	2hkEN/UAfHPFRV9Yd9PL1EkagfY1SRNT/se6wclIcJboxorp2PXKninIwDrm/MDuX6tK89TFWRo
	J
X-Gm-Gg: ASbGncsugAOoCGycG1MhUV5AOuPWWDeCJXBVhvMm4NfOzKQeoNcvOph8mrcSfdpUlIS
	EN2oScfgVkMjaa4HaMVe0QQIAihGuGBfV18rF7Z3uYnDwKMK5B/lgagAukwctCzdmI89Ug4oV99
	8aUPsna8nhwoiowyYpobEKaP6qgOHX3eU2W3aEu7ttqR4LB/9H9e1VDtaEPxCQA+6ITf+qmlACR
	pOLV9Ily6ZGSk8yafQ/KekTbNG6uTMQaScZIUi8jWreV0VDC+HXzj8627GOAWiDA0Wj364fUQl5
	V7AZVNNTVnvq2H+oALgkqZFY67E6nNxeong=
X-Google-Smtp-Source: AGHT+IEfQLL2p2ZSb4dqjsgjGDKq/GSYAVO6MbSNtIX3ddR5+ELz3tgBFJMkfFMIOU9rzncfxBHvXQ==
X-Received: by 2002:a05:6a21:3a85:b0:1f3:40a9:2c36 with SMTP id adf61e73a8af0-1f58cb20502mr13596415637.10.1741809373747;
        Wed, 12 Mar 2025 12:56:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/28] grub: patch CVE-2025-0624
Date: Wed, 12 Mar 2025 12:55:32 -0700
Message-ID: <0c860bf1765b49a7540ae3cb206ce09cf25f30a7.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212705

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
index 604c2fe568..9e037e953e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45782_CVE-2024-56737.patch \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
+           file://CVE-2025-0624.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


