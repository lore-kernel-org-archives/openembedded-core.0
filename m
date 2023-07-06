Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0915EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 11:25:59 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.19674.1688642759017605788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 04:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=VUHDSx+d;
 spf=pass (domain: mvista.com, ip: 209.85.215.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so461639a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 04:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688642758; x=1691234758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVncvvUes+I1R5qCsNonCv7uUyiZGTNza6wc9l61Oa4=;
        b=VUHDSx+dznil6TwcX0lEFKIIcRMwk/camRbHcbfpOLwPTY8wsMMbo9bOL+j/877H+D
         YqScGeYw7C5zGWHJkjBWmeYRpwqpUkNxHmEmXpgXdQHjWNxaxt2wJ47PkIJOet/pimvE
         wN2YrDNLGpL8Qx5ISIN3ZxRRx/D07S2lOfOoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642758; x=1691234758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVncvvUes+I1R5qCsNonCv7uUyiZGTNza6wc9l61Oa4=;
        b=gaVmXlvyovHBGWHA50e9bgpT7bybgX++FQSO3sJVpeU4kZvw6Dv2Ygbe7U59VunhYX
         maiglAPuqecUgU0x67shsJRq8K4Ft/pQG3tFyOmP/X8pOfYvKCLCWfEjnJ8sajhade5O
         sdSibH9Eg/Rcm8wMsMmWn4c0VFSdmTmTW/ur2lmrvEu+BTtiMiLM7NKKx9kJnivO3MGR
         e5CQ2P4UYME39vdgy8uhguze8P1syyZLDlMSfl9X5dUib0PojENulE4Pk8N6hLTspc1a
         dEmzMIi+x6XsHNfAwzvH4gpOypcsQjET1dOYVonOpcftyh/DF1+emQ8MgYkPNyy/i6nG
         TEMA==
X-Gm-Message-State: ABy/qLYrbxMaRFHHbC1AD0Hi0rEljQW4k/xn+YmqMPuK8IVzv3ABa4iZ
	+etCdibykMT0sv0PSx0xOeH3W5CmHktQmAon8KsUWg==
X-Google-Smtp-Source: APBJJlEUq3nOsepUhM7Zw3J8FveHZWFZGQHX+XN+KXw/FYsja2meQETxSZcBDXG/NkS52hWhff8Xvw==
X-Received: by 2002:a17:90a:ac0d:b0:261:38ca:3c48 with SMTP id o13-20020a17090aac0d00b0026138ca3c48mr1420799pjq.11.1688642758118;
        Thu, 06 Jul 2023 04:25:58 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b001b392bf9192sm1200918plb.145.2023.07.06.04.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 04:25:57 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 06 Jul 2023 16:55:52 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] grub2: fix CVE-2021-20233 Heap out-of-bounds write error
Date: Thu,  6 Jul 2023 16:55:51 +0530
Message-Id: <20230706112551.126583-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 11:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183928

Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.02+dfsg1-20+deb10u4/]

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2021-20233.patch           | 50 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-20233.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-20233.patch b/meta/recipes-bsp/grub/files/CVE-2021-20233.patch
new file mode 100644
index 0000000000..f001be4bf1
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-20233.patch
@@ -0,0 +1,50 @@
+From c38a6f3b02357f5a8626acb08a92b29aee95d25c Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 22 Jan 2021 17:10:48 +1100
+Subject: commands/menuentry: Fix quoting in setparams_prefix()
+
+Commit 9acdcbf32542 (use single quotes in menuentry setparams command)
+says that expressing a quoted single quote will require 3 characters. It
+actually requires (and always did require!) 4 characters:
+
+  str: a'b => a'\''b
+  len:  3  => 6 (2 for the letters + 4 for the quote)
+
+This leads to not allocating enough memory and thus out of bounds writes
+that have been observed to cause heap corruption.
+
+Allocate 4 bytes for each single quote.
+
+Commit 22e7dbb2bb81 (Fix quoting in legacy parser.) does the same
+quoting, but it adds 3 as extra overhead on top of the single byte that
+the quote already needs. So it's correct.
+
+Fixes: CVE-2021-20233
+Fixes: 9acdcbf32542 (use single quotes in menuentry setparams command)
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://launchpad.net/debian/+source/grub2/2.02+dfsg1-20+deb10u4/]
+CVE: CVE-2021-20233
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ grub-core/commands/menuentry.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/commands/menuentry.c b/grub-core/commands/menuentry.c
+index 9164df7..720e6d8 100644
+--- a/grub-core/commands/menuentry.c
++++ b/grub-core/commands/menuentry.c
+@@ -230,7 +230,7 @@ setparams_prefix (int argc, char **args)
+       len += 3; /* 3 = 1 space + 2 quotes */
+       p = args[i];
+       while (*p)
+-	len += (*p++ == '\'' ? 3 : 1);
++	len += (*p++ == '\'' ? 4 : 1);
+     }
+ 
+   result = grub_malloc (len + 2);
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 9da18a2adc..5a6e213936 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -108,6 +108,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-3775.patch \
            file://CVE-2020-27749.patch \
            file://CVE-2021-20225.patch \
+           file://CVE-2021-20233.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


