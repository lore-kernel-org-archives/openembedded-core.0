Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2DCC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9191.1645178825979286016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YqKLlQOP;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u1so13615186wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3acWfQv3/xRAAUnl3FzY4sJA23B38zezFyuagC4OG1U=;
        b=YqKLlQOP2VRJzzT7upCd1CPga/0D4H+Sp8bouXmb/ggn6r2QPlXW6aBZPooMcE1iYe
         548bHiGG9mRPdO+6fj9aF0LzHWCXBssYh39AIs03sWsRjWNvpkF5Tf7jsQXtJSQHCDWV
         uzWFjmdjQXnZdYC/gccLiPxOlkFKE9f3JbK/WFwTaaS6mq1tj7i6u9QRHCLNy8lrJxky
         tYSUve+7uDIGNsExRrUeVQ/ifenz1+2bmNJuDAFRJpYcf3mbgLHDS/f4nVq7nG5U0yYF
         HwvG57X5HpaLjAcvjK8esPrd2BYAfhN6G830wZjdfmoxVv49Qi0ubl2SuXODqpZ2fIBf
         BcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3acWfQv3/xRAAUnl3FzY4sJA23B38zezFyuagC4OG1U=;
        b=pqo0EObgyGWtKCX9uAPsRuLIQewq7l4Moy4WeRnww+c+UWqKh6tn+55BigB0XYfL7H
         Ic/RsxVuJTAc5y9qvJ++r8tJUy7fWMLInUDSUeQElOeDnwmacO8k8S9X5yLPuR59vGNm
         r3raqdEe2RnpjrRNjV7wIp5htxnoTVBJT5PHtQ7/q4TTuqKTf51VfO8bdZbu1FeeQ4el
         aWG0GO9PStbdX1rL1oIdm8RIynRfjH1EqFhLz5//hBPfqKNohJ48iLHC8Nnn2VQ2e9wG
         ayvcS6hAJJkcMidQUh14JXYUvRZlgsiGRHskShIupJsYcpoT9/p2OSOUC27In4Algl76
         nJ2g==
X-Gm-Message-State: AOAM532IGoV6ICMUHjR2rrYFSjYfJ1aWx2Np6J/k9OkpjI83fxNCWPEc
	FBaVdAM+67i/Q/XvSi2/sCY=
X-Google-Smtp-Source: 
 ABdhPJyOM6icoYghc3/KEREOR9q3fWd8gB02FkvBFcZhfCeTKItBwtKlzPnLqelsVIcMGYUoRB6Svg==
X-Received: by 2002:a5d:4534:0:b0:1e4:9d38:2d4f with SMTP id
 j20-20020a5d4534000000b001e49d382d4fmr5630524wra.2.1645178824547;
        Fri, 18 Feb 2022 02:07:04 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:07:04 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 46/46][dunfell] grub: add a fix for a crash in scripts
Date: Fri, 18 Feb 2022 11:05:54 +0100
Message-Id: <20220218100554.1315511-47-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161934

This patch adds a fix for a crash in grub's script handling. It is
a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...void-crash-when-using-outside-a-func.patch | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch

diff --git a/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch b/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch
new file mode 100644
index 0000000000..84117a9073
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch
@@ -0,0 +1,37 @@
+From df2505c4c3cf42b0c419c99a5f9e1ce63e5a5938 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 11 Jan 2021 17:30:42 +1100
+Subject: [PATCH] script/execute: Avoid crash when using "$#" outside a
+ function scope
+
+"$#" represents the number of arguments to a function. It is only
+defined in a function scope, where "scope" is non-NULL. Currently,
+if we attempt to evaluate "$#" outside a function scope, "scope" will
+be NULL and we will crash with a NULL pointer dereference.
+
+Do not attempt to count arguments for "$#" if "scope" is NULL. This
+will result in "$#" being interpreted as an empty string if evaluated
+outside a function scope.
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=fe0586347ee46f927ae27bb9673532da9f5dead5]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/script/execute.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index 5ea2aef..23d34bd 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -485,7 +485,7 @@ gettext_putvar (const char *str, grub_size_t len,
+     return 0;
+ 
+   /* Enough for any number.  */
+-  if (len == 1 && str[0] == '#')
++  if (len == 1 && str[0] == '#' && scope != NULL)
+     {
+       grub_snprintf (*ptr, 30, "%u", scope->argv.argc);
+       *ptr += grub_strlen (*ptr);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0454b09d52..75ef31f249 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -92,6 +92,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
+           file://0046-script-execute-Avoid-crash-when-using-outside-a-func.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


