Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC5C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 13:27:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.31854.1654522021914133829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=2ZZwGUP0;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.53,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f53.google.com with SMTP id t13so19868212wrg.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 06:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=50pRB5/0P1rV0vrviwsYUcRm79oe6kwrCFcXzVo9uFY=;
        b=2ZZwGUP0/pvKV1oJFMC9ZhLpXBnBG4t2u5S7I/51YR+I5s4ivMsQmOcynUNuRl2sac
         5wyn/QdUWzhxUG8igDdWRAaa/U3ByP8vEWO+eSw2ZLAGtMKAj1KfJcOoONSWQSv8I3Y0
         7jW3pA5/vFwdxnc8FZHuYMgTK98t3tevnwcIPfPe/mMyWjc6gUHkGuTM0+qyHg0klccy
         a9ESEXlswe7i4g7sjxwks30ePoKefzyZN8/Q1JVIAhgLnUvsbTInLv2Wf4ZYbC1BVwCy
         ZNPaCaz5JB7oqkBBgq2snjCdu+B0F04hkDK/hu11gpZQRiB5EyjYcvEJXT2/0rL6davQ
         eCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=50pRB5/0P1rV0vrviwsYUcRm79oe6kwrCFcXzVo9uFY=;
        b=Pk5ktTP4iiSJfyQDB8qZjk8eyggkIGzf66xxAh6IFGGjCU6LnrwisV937uXm92URR4
         xQ5So5blAT9WdoR9CoCKFYtZuCve/8hjqy/J0Utoq1aywSG75JhOma204bLOiRXkdMe5
         RQMI4Xfg5PIN7sxq9E/Qen8qGyr1yFSsFknqGpgIQi/JOHrDhEf2+2vAPI0mddDNQzIh
         zQidSnbrsjmVv00Jf9ES4k220X8RZfS8vrEn0mko2bhCQneuq8ae4OuZh2anCq+UyBj4
         u6n8IKTPjn7wNWyZo85IOufPHdA6csmqI0KSvuIVZ4ed9dNa5Fy8c/TqfqBL5/nwrS+d
         c9hQ==
X-Gm-Message-State: AOAM530H5LnHNHKCfzG31mjAaU5LUnOx75n9dRsZNfrVuevdX+U2wD5n
	vyCtFJDGXXyRlIh1NheswSo8Ew==
X-Google-Smtp-Source: 
 ABdhPJw3fNpPjxCw5kMtgUe/I/D1X5zd/Vvr+LLaCmqjOB+ewtZO0K2WHgiztgD/9IqCZVzJ69bPww==
X-Received: by 2002:a5d:6dc6:0:b0:20f:bf64:c9fc with SMTP id
 d6-20020a5d6dc6000000b0020fbf64c9fcmr21845427wrz.648.1654522020307;
        Mon, 06 Jun 2022 06:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:46fe:49d5:2ab9:ca49])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a1ca101000000b0039c4ff5e0a7sm2840911wme.38.2022.06.06.06.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:26:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [OE-core][PATCH 2/4] cargo: run in --offline mode
Date: Mon,  6 Jun 2022 15:26:51 +0200
Message-Id: <20220606132653.60232-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606132653.60232-1-brgl@bgdev.pl>
References: <20220606132653.60232-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 13:27:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166629

We fetch sources ourselves in do_fetch, don't let cargo fetch anything
else on its own during the build stage.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta/classes/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 4a780a501f..7cfd4a2666 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -32,7 +32,7 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH} --offline"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
-- 
2.34.1


