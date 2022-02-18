Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7651CC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.9184.1645178807635822398
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k14QpTHe;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so8238786wml.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4s3h89m1SJF9TsNpnven9S3EZCTgmxVIuajVP1V+F0=;
        b=k14QpTHelT4S8+Oy6P/q8uI2xmMTJ3hFESbUxJAkZmaSZmSFKYsSjFuUDqnZJnv0LY
         9DtPO1zzdheVDZoxhsgXRqY0EZm2t0vO6YoDjHlT0/dNPW14xBKjMD3mo+YDr3SOUgGj
         U4/z+kHgBTyAuAsJ5r4R7wbNZ27OF/v7puSemIn8ITg5lUjOWmoMC3Yx/VUgfB5XD+kX
         LASwPhMhNkSWG6aylVrVnMU0QgaNEjKTa/TBIu+5iCwMu0RaZeHMc9icIbjFTYbuANBW
         CbZiHCI+XapxA9ccANLSqLEjjHDTzmEtpYnilRQplRasb8uuvcCulkP4vd+KYlbEcNn4
         6TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4s3h89m1SJF9TsNpnven9S3EZCTgmxVIuajVP1V+F0=;
        b=TLlpQY2Pek7vbsCoeG54MJDkqz11c0zqJyZ7Wm2kEypGMbxjDO1k+mRP5ZHrUqyAf7
         vqrSyO/TAqTiZzyD4hAGVGnR3zT5qT/Hqtirtir1+27LrzT+BzMTWIYT35Bv0fz5ZJsY
         aPQbcmn1BB82SpU8uEJ8biJPcNx7opsxD+x5aKbulG9DhM4eussRPm5mfe9g7tBQtjf4
         /Bhd0V2MTUKqJtyXXTqL51fJtenYqODzS6RQ5yr+lJxBN+281CnsGbKwk9ntwuLX29gP
         YWo9gwvdlzjz8RgzzHAUfCF2w6fKjsFM62NPyRdTqmk+JF25XYqQSA8qs4XPDrJq70fc
         fb0Q==
X-Gm-Message-State: AOAM533HKhNA7ZXT8cHa3iIAOQ3un4v9luaDu59pkJKohB08glt4jY0v
	0lc2AxkYXN37Km26VyuL3OY=
X-Google-Smtp-Source: 
 ABdhPJz7x89i9oEyKcU5vwLKneZGj8kbgyRWijH6Ic0q+oNHH94+IMyKWTexMhicPzqc2Ap+wA8JQA==
X-Received: by 2002:a05:600c:ad0:b0:37b:b989:faaf with SMTP id
 c16-20020a05600c0ad000b0037bb989faafmr9819000wmr.167.1645178806234;
        Fri, 18 Feb 2022 02:06:46 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:45 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 28/46][dunfell] grub: add a fix for a memory leak
Date: Fri, 18 Feb 2022 11:05:36 +0100
Message-Id: <20220218100554.1315511-29-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161916

This patch fixes a memory leak in grub's syslinux parsing. It is a part of
a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...slinux-Fix-memory-leak-while-parsing.patch | 43 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch

diff --git a/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch b/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
new file mode 100644
index 0000000000..d8c21d88f7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
@@ -0,0 +1,43 @@
+From ea12feb69b6af93c7e2fa03df7ac3bd1f4edd599 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 26 Nov 2020 15:31:53 +0000
+Subject: [PATCH] syslinux: Fix memory leak while parsing
+
+In syslinux_parse_real() the 2 points where return is being called
+didn't release the memory stored in buf which is no longer required.
+
+Fixes: CID 176634
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=95bc016dba94cab3d398dd74160665915cd08ad6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/lib/syslinux_parse.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/lib/syslinux_parse.c b/grub-core/lib/syslinux_parse.c
+index 4afa992..3acc6b4 100644
+--- a/grub-core/lib/syslinux_parse.c
++++ b/grub-core/lib/syslinux_parse.c
+@@ -737,7 +737,10 @@ syslinux_parse_real (struct syslinux_menu *menu)
+ 		  && grub_strncasecmp ("help", ptr3, ptr4 - ptr3) == 0))
+ 	    {
+ 	      if (helptext (ptr5, file, menu))
+-		return 1;
++		{
++		  grub_free (buf);
++		  return 1;
++		}
+ 	      continue;
+ 	    }
+ 
+@@ -757,6 +760,7 @@ syslinux_parse_real (struct syslinux_menu *menu)
+     }
+  fail:
+   grub_file_close (file);
++  grub_free (buf);
+   return err;
+ }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index ef409bdd6a..c965f0fd15 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -74,6 +74,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0025-affs-Fix-memory-leaks.patch \
            file://0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch \
            file://0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch \
+           file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


