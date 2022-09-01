Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26A8C65C0D
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9412.1662016898077871631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HYbVz7pM;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u17so1827426wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dj7Jkf5Lbw46toBptwnUvCJDSQR+7mgidoRkvsooImE=;
        b=HYbVz7pMPhdD3crPtmHSv4BvvfC4QwI+cdXgbKd7p41XjqET6mxcOlPtzRCNUN4cur
         6YAJyBesvWRbCy7DXPUuURew0RxB8ZkSoq9kflNV5QpvVwj51XDFtuelcoJ33MisDYA4
         XsAk+82dp41JILRDCyc6TDKwuSmzm6+IqZo7ujKjQK3Ay4KpLAqPjBHtX/t4Si/gMAAV
         Aisq0bPP68Xrrg+U3lsmEE1w/TMX1q29XMWXfuJtT0vfWRsiti2oXCY7lUrotDGf6ULv
         4jmAsGQczAXzF22w3FfpN+sltzcNhOqoC6YwSCO6ny9cS7gUerBLcPbgmgvfcqImINu3
         q8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dj7Jkf5Lbw46toBptwnUvCJDSQR+7mgidoRkvsooImE=;
        b=dj+1kQUpfe4wy6qa0sjZ+a7COUbUWmLUKAxX7vnkOAIxKgtZBnPfItb3ykpXU24D/5
         soCFnOf8O8PS5LvJTd7W+ulUoCSxMKvRVv16bbfNQeh+M/P1k9xYu0i+RtIKRXsHSZig
         w9DBa7CLJu2QP5i6FhIuNyY9SAZCW844XRp9NWIuypGL975f+aM04GdmMQuJ4wA7MnHa
         MEjU1m0fjmTvQu3JDruWOu8qZ2c4AmhmX4D3vkKlBH2VLKQoHXboM+Jc5amtciQhp0+7
         RenQ0Jq0Mh0xOMEbDAZTCB+D3w9NnhrK3TBKdyWMbSyU3IuTsiqeyG7Y3NkDOxZfuXPk
         F0EA==
X-Gm-Message-State: ACgBeo21ok0QaNOQGESu59+iicwnXjWhqveJSHyS5dL9+FUHY8wD9bWb
	KklK352cU0/3Ek2PKsL9x4icX6hp24A=
X-Google-Smtp-Source: 
 AA6agR5ye1TWAo8OYzI/UAmx5WGNv8RkfSxKFAOO1meBwV6F/gUdbEGew+qd4A7ru5wFy8/7WgvhHQ==
X-Received: by 2002:adf:ed0c:0:b0:225:50ce:eff8 with SMTP id
 a12-20020adfed0c000000b0022550ceeff8mr14177549wro.157.1662016906519;
        Thu, 01 Sep 2022 00:21:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/14] gdk-pixbuf: submit fatal-loader.patch upstream
Date: Thu,  1 Sep 2022 09:21:22 +0200
Message-Id: <20220901072125.3366367-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170153

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index dd580f8162..23c68a0923 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
 If an environment variable is specified set the return value from main() to
 non-zero if the loader had errors (missing libraries, generally).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/144]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
-- 
2.30.2


