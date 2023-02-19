Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939C6C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3863.1676835091665533881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HoTjYpXg;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id bg33so1180784wmb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIngh+mZ0726iQcQ+6btK+jnHcK3XaVnrSxaq0au6JA=;
        b=HoTjYpXgIun0fltkPo2GA8eViGr8A59DBMJgTtMb+t+xsZTUR1jTlEFfIo2zXtDrp8
         30iw4cPjlrzjdNfh2hNp04jAC0lxYgX0SEC9Xbw7uciGCUdNsAn+RmKQVG2NzhPmbtnj
         z1WPZVTKwEelfOQad9U3AQfzSgjOoVN7xTL8opgWLWJObE7waiHvEW0yf7igEBL83RSM
         LebTfFTLvJhS6/sNapKmxkoeRwbokTDWTns01pgcCaGghtO9mEdhBs9SRaQpsVMtgPGH
         162Pw7t2Lj4LYGBfMNcE5ub2sjZUReMmAUP2hwDcGYlVpFpfv5ZmqRx9rkLVWXbe7vkS
         bCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIngh+mZ0726iQcQ+6btK+jnHcK3XaVnrSxaq0au6JA=;
        b=hIcFrVv4uG2nxyPMFEY8MqeSfkjwXbKKDA+uAmJi6JYEhZSwXk4RljBcqq7O19q/IR
         uNI3k6UJB0qmLRo144Juor6NPVnAWnRJ3rnK2GvupeVhKU0dCY0Q4tEaMtH28IRbQuEo
         Z98sZOsFfsQFK7lvqDvcIj6GzqrVQyRCA47ZYPFejUKJCHRNLRInDwKW5ipyFsGfOOED
         Ci4JzOTTDJCb5FbF/rWA6XAl3nLAOIAkcdbP7J5DNkcHBN3TLlTSHVH+kJ6upnT1lvDx
         iesH8alvWwnl9r0U5VzQ97W4X68mJC3ozN+S++wQ6f7PtQKwLhRxEEaD5k16Ohc+nXJL
         aW0w==
X-Gm-Message-State: AO0yUKXJDBJAEGiMxA9kzb9P2JavW+2vGivjTHY9jB1V+VGfz133hxIP
	TphApkZRQhAr4Qxg0YoPbZd04FzAoQ0=
X-Google-Smtp-Source: AK7set+6JkADbwFqw+kUbdtBswlqUsh/tzJgKMyFHhZG8oXVCrVx2pQ6cNMRSWQ+WYp6lVuDLXD+cg==
X-Received: by 2002:a05:600c:4496:b0:3df:b5ae:5289 with SMTP id e22-20020a05600c449600b003dfb5ae5289mr5022665wmo.8.1676835090189;
        Sun, 19 Feb 2023 11:31:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/39] piglit: upgrade to latest revision
Date: Sun, 19 Feb 2023 20:31:00 +0100
Message-Id: <20230219193101.338397-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177382

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index b12dd46ea0..edbca69413 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "acc0e009d0f7e843148205d03fda53ad5f1b7c8c"
+SRCREV = "590d81bb5fa219353104980108e9f1aa2b1d1b6b"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


