Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0240FFA3747
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 11:47:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.8161.1667216868006867171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 04:47:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C+5s/0Oi;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id h9so15641852wrt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3PRdCpxlPVOux084kD5BTVD7VzycqoHyk3J1lFrfDM=;
        b=C+5s/0OiGO34ZY+yBGFiBzUWIZsikf0Tl9R8hS9TPh9VA/GsfniLvarcFw/nNPbwHm
         jZ5C7NPUZY9PBIUOSqIEDqs7/XjP5ybt9A2VefhAENNAPFLAnkZDvF8HlQPgETlHL8no
         MC9JYOlGCy67p1c4PYHB6n0IQbeYXwnPLbEIuXepJUfcjBeGnsHZQIQrRD05vInu0eOP
         QA3OiSIMlUYsoh/61c60gsflG4WW85fA7e8jHa7Ym04QwR8f8IWkBlK2N4yYQknpxOA9
         o1jpaWb9cuHk5IlGqZPD160AvSOYLdwI9yvB4HWYgeFyTPkdp0Q7bs9nIfUOPzNFlsB9
         QYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3PRdCpxlPVOux084kD5BTVD7VzycqoHyk3J1lFrfDM=;
        b=nXumuTju5zZE1OUE6K41R/WTS3UG/8phXWocdW9LwG0Rrga3ghrhzVyspFYYN6k4AA
         ausBXByb8kMPNwueXldZ76yQqoewYTMd8m97STbYQJzwYVOIoVLltVTr1xgKeHRQdRqm
         tbVdhavzcyBf/a4l+eFLtUZ8cegPq6LQVjITPJXI+OkYId6A4Pq742QecfA1rH4QqMzz
         i2rdb6uhkXktgjBiZvYz4etGTuMJlmGnhKqPWGoS7HmMPRkOpbHo2jVRJC+mtpXlWiXr
         J+rDKhUeyLwZ5yckP+W3X1Lk05vidhatPlpCmPqiU2wG7q3RL935Ke2PxRg9ONvUbahe
         LfPg==
X-Gm-Message-State: ACrzQf2roVc5XRoB74vgk6+yjRcFSbWIDHmlyzOteDiGhhY8ouo3a00t
	+rwbXZuaEmydO+jtZaIfHmQQTL+LfHs=
X-Google-Smtp-Source: AMsMyM4xaL4V4PGyc4DxxbRIghgDmKv10D4xwin5PF92bubib0ZNKsOdnLBDlX5xY78GIWh/8zasGA==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id u9-20020a5d6da9000000b0022e53bd31c1mr8404784wrs.358.1667216866503;
        Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m11-20020adfa3cb000000b002366e3f1497sm7017965wrb.6.2022.10.31.04.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/13] go: submit patch upstream
Date: Mon, 31 Oct 2022 12:47:18 +0100
Message-Id: <20221031114719.2725967-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031114719.2725967-1-alex@linutronix.de>
References: <20221031114719.2725967-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 11:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172314

Note: it will not be reviewed until RP signs the google CLA
(link in the PR).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/go/filter-build-paths.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/recipes-devtools/go/go/filter-build-paths.patch
index a1aa37c2a4..a036f177e0 100644
--- a/meta/recipes-devtools/go/go/filter-build-paths.patch
+++ b/meta/recipes-devtools/go/go/filter-build-paths.patch
@@ -8,7 +8,9 @@ embedded in the go binary so that builds are reproducible regardless of build
 location. This codepath is hit for statically linked go binaries such as those
 on mips/ppc.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
+Note: RP needs to sign Google CLA for the PR to proceed.
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
-- 
2.30.2


