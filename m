Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51529C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11526.1634657692168908814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lk8QXqmb;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id g39so8335635wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALPPIjTRYVD5Hn7n4N+XzkLi93lpZqPzytfNsZfoLjo=;
        b=lk8QXqmbkrv0ZqsWEG8vFKOnTJWsrzNzgcJg5H9TiIbjHHc6QDZRr57GmgF0KkIA75
         kxdQDQxrmcPOOMw6BbDEpUgoEZoxmimIxY1llB7EqjivRHXVYQr7RavjeBJjY0MJo/Rt
         52ieQuHlFjs9jBUY3IDBoNU9zLnsVnEIKGcuw0ih1sRYCrFSnv2hoicwjoStZWCNtIea
         5zPfYvWUhlf4eyxMgMLquUjdVe3HFzMLCn0Al150nB5RcuZ/SYPOBsMaTsMTPSxvBGID
         2wy2ezY1QoAqKjCZ/cutaGseLHzzyMts1oB1xq12JbqH2qvjgigogIXxLnZHdqEM6JTr
         Au2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALPPIjTRYVD5Hn7n4N+XzkLi93lpZqPzytfNsZfoLjo=;
        b=umccSAQQyXiqcFEYS5pXnbKE2C47tJLI3YGGbnAEKarePjB1Rlm5ciJIrNSO1j8a2v
         YOaSES+Y5dLI1NuOdCcWDQTrnPQ0T5RH6vElUFSyipIyDGMuJ6nmJF53wfMLS8kgJPvF
         RbKpbuuRidVuppnRA/p2cTsfLbp4wbgbeuYgJt7mSI5f65AtgtHPc1eeE15RSHepl/P0
         52nT7JLxTJCEpqh+WXzk3W/Jzp43CKvq59rWwvRneK9P4ksVGdyiqzo/SQuta2JB4B3P
         gH0VOQCXB0uKfzEl8CIiJxbOCNv/3s+qtEl6p0GKwahZYqXaOn5/DfEew2dwbWUEE4Bd
         I71Q==
X-Gm-Message-State: AOAM533S+3mwPqGI22HQM4BXBOenqV1fVHDIcerLfgx6Q7A3zUnnRbNg
	mq+wyZt4p/5QKXJw+RjuPHP5Nc7fcIs=
X-Google-Smtp-Source: 
 ABdhPJy01cqkRAoFg4BFHY1ZIAAowrvXoZ7b3h+T58wv9LoQcYHAyuzlmi6AW84Td7+m1HJKbK+lgA==
X-Received: by 2002:a05:600c:2044:: with SMTP id
 p4mr6835827wmg.53.1634657690773;
        Tue, 19 Oct 2021 08:34:50 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/65] acpica: upgrade 20210730 -> 20210930
Date: Tue, 19 Oct 2021 17:33:52 +0200
Message-Id: <20211019153419.3319802-38-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157157

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20210730.bb => acpica_20210930.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20210730.bb => acpica_20210930.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20210730.bb b/meta/recipes-extended/acpica/acpica_20210930.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20210730.bb
rename to meta/recipes-extended/acpica/acpica_20210930.bb
index b66e605f8b..47f1b629ed 100644
--- a/meta/recipes-extended/acpica/acpica_20210730.bb
+++ b/meta/recipes-extended/acpica/acpica_20210930.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "4a0c14d5148666612aa0555c5179eaa86230602394fd1bc3d16b506fcf49b5de"
+SRC_URI[sha256sum] = "3cd82a281a16bc70c2708665668f138c4fc606c31161d46ce77230454ec04821"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.20.1


