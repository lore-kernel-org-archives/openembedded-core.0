Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09A2C25B0E
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.22257.1659940989751943997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D2xJHeYr;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id b96so10171308edf.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RCUlpYq8gvF0/H0IiigddJ0bedxcuc0+4ExvZ+l+Mqk=;
        b=D2xJHeYrGCzHSOU0aZX/3LX7UZiaZwmQjQ2L6EwxNAxNx2OjUa0JfguPee1rnt2Q4S
         nVzmpHba+GoBlXzf9f04nV59ObDUp3K5EGb8IVyCM4mypogwnle5fn/3u+NDeu36Vekv
         391lf8VtpXKSgDcrlRm0KqEbIoDgtdZumTpV7PPeCMYYo47+p1fD5f53ZiCmwj68qBlx
         MHk1VTiD3cPzhXIhRZFv3+psfq80RxS2mffAl+G49USxjz5+wE1el++ve3jiUMGGwBIS
         rpCrq1BM7FfEdvzdEMu6+Q2Sf2XKl9s/Qn3pnnjxAnjWZ8z6S7wgsXiSIOzMiMagnjb7
         3A0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCUlpYq8gvF0/H0IiigddJ0bedxcuc0+4ExvZ+l+Mqk=;
        b=J5KjRzzOLOVpjdetiwuNtDgzpYEph8NB0ZdhJc+FCrCtgi8E+Y7Mm6x/6Lf1QQuCt2
         2gZjsM45Iuy5M0SL/kKvcIsU9uzVddEr7db7fqNGD6/+2pQcT9F0eWZUPb6K4nnkE9gv
         xRbG1VZfcT1jswX4O1Gz2m5ab4jE2K1reif0Lw5k253MM+8/hGUp3beo7Yrnu6IMnAtR
         V12/vST/wGIrKtf1KrnM7hcrCE6IOaY1FXxiYx9I83mJTkCqKfXB2YKpZe0l2rHHMgwa
         syQErW85acEIpR1Io2Lxp/7Av2pFUvxJQPhkAs9rFRxF/ihiX+NlZNsNelKPHVrm46Je
         CVXw==
X-Gm-Message-State: ACgBeo1hEEdBdc1Bk+RpveBfgCOi2zKQu6tJrJZBGonCXkYNUE/eLAGu
	VpYODhtTRbfNRkcqsK5Aj3VWntUIcVE=
X-Google-Smtp-Source: 
 AA6agR7Dei2dC+h8x1Kh+jY3U3oKhon+TKumcn2JhfgW/Cg+NVkem9ofRhYOp/7b+kNV4J7p+OunDA==
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id
 fi16-20020a056402551000b0043a76ffb044mr17005400edb.197.1659940988406;
        Sun, 07 Aug 2022 23:43:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 31/44] puzzles: upgrade to latest revision
Date: Mon,  8 Aug 2022 08:42:24 +0200
Message-Id: <20220808064237.3975347-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169055

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 68bdee8b52..9e9bcd2eef 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "387d323dd8d579db2c90b499b3b19f746cbdbce5"
+SRCREV = "8399cff6a3b9bf15c6d1d9e0c905d1411f25f9b8"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.30.2


