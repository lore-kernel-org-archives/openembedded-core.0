Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D78EEA87C
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 17:46:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77634.1771004762065618120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 09:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Leu3RrPB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483770e0b25so6348825e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 09:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771004760; x=1771609560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NSVLdKyI50XPWA2fOG55omxQFCO/rXcG82FDDlaSvDQ=;
        b=Leu3RrPBLxuwa6AovsMPgxrbYoYhRCiuTXA/zDn6XELNRF4yLTs0ITh5RFrZ7+r8aN
         t/EntwpQwoXNGDoslJco83vSxQTIHnnuoMvy+AKCgt023kayQVcTEiAyeX/6VIyrhkNX
         eyVhUoHQNvsV74Xd8b8LU5sQx7/lRcW4tdzG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771004760; x=1771609560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSVLdKyI50XPWA2fOG55omxQFCO/rXcG82FDDlaSvDQ=;
        b=YqhgkeD0+L7alg1RlS6l6cbVPsduogrfcEcGG06NM5aziNjevNWeI29R5AOKvppMDZ
         76BX7f5i9ZGfwOiYwp12TgmWLhtzPIvhjgcegtR6OkXWaJ33GPZnq2jy/+6qcDJFkA+m
         s6iY4V8zNtWd5zLMXoQKkv+D6OyoX7fMIomHGgQla5n/1sET4pznAEw029XOACYBJtAM
         LW+fRS5LAD8VE3lXZJdLfvzmyoKlO5DSPL1Q0hdED8nr5v+RgTst0290UXwcqSHU2NyB
         XYDTY3cMvN1FYfD7rKWA3pB7AC2VoPFf4Dw1PV5ydW+S+gtHcFN6udJxbfa5k3PRCZSi
         +EDg==
X-Gm-Message-State: AOJu0YwzkgQ2qNmj5dApXO9+Pm59oLN1r1tbE0OYAR/jINN0d7bMVidI
	ePpxXggl6WWQJiBjj94V7n8Y0QtYkAgmZnfsbmtrzaVNpzkDO3fVDy5+pIX18nZKtnu3uJIqlix
	rU4fn0pw=
X-Gm-Gg: AZuq6aJA3JUFOcmjN6RKS6nC77lTp9pK/K/UDuNi313bdRTXcVoPhUm1fN/3BSjheet
	w4f7gTIjR6ptee6uBsIc+zEz8qaC0CKfQwOGJgWBPD3SXRm9csCel8kd5oQ5D118WE6uXiz8tsW
	yn7yxALJ7lFJ2qRP7i1GPguKHatmHcqDAXqbw1xSQZUiVorkTK4L3xLCmIkBBQgRnLlvAEZHOaw
	wtCZcyFNqrPxpV+JtZewjruG/uWYewYh7ztDodjl5EkQ86YmRwi/Hto77hmfr8jupZvzavNNvs9
	4d1THKw3fAZMUguVpDVSrucJLNO4EVNP8sOQ+mLgsdpdbPAbSYpc74emfyDa/kRVMF1h7+GHgxX
	OPArMyDXyu5CT0SUe7DFCyjOHxscfs+wcyU/kaEOInOw3bSXMnx6+aNHBgPb3eSvGa7oytbNIJd
	cLoFiMhYn0QC91PgRL/X20AWZEfp+9A7/jitov0eAbTx7Z9V9cFa8=
X-Received: by 2002:a05:600c:8b4c:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-4837106152cmr59515455e9.16.1771004759488;
        Fri, 13 Feb 2026 09:45:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e20e:afdc:37ec:38d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483709f6935sm36502655e9.0.2026.02.13.09.45.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:45:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mirrors: Drop obsolete/inappropriate OE/YP mirror entries
Date: Fri, 13 Feb 2026 17:45:55 +0000
Message-ID: <20260213174558.1799136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 17:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231129

These fetchers aren't used by code that would end up on these mirrors and are about
to be removed anyway in some cases. Drop the pointless/obsolete entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/mirrors.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 75a0003ce55..c8ceb9f5c4f 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -29,25 +29,17 @@ ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \
 ftp://sourceware.org/pub http://mirrors.edge.kernel.org/sourceware \
 ftp://sourceware.org/pub http://gd.tuwien.ac.at/gnu/sourceware \
 ftp://sourceware.org/pub http://ftp.gwdg.de/pub/linux/sources.redhat.com/sourceware \
-cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 gitsm://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \
 hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
-bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
-p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \
-osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 https?://.*/.*  http://downloads.yoctoproject.org/mirror/sources/ \
 ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \
 npm://.*/?.*    http://downloads.yoctoproject.org/mirror/sources/ \
-cvs://.*/.*     http://sources.openembedded.org/ \
 svn://.*/.*     http://sources.openembedded.org/ \
 git://.*/.*     http://sources.openembedded.org/ \
 gitsm://.*/.*   http://sources.openembedded.org/ \
 hg://.*/.*      http://sources.openembedded.org/ \
-bzr://.*/.*     http://sources.openembedded.org/ \
-p4://.*/.*      http://sources.openembedded.org/ \
-osc://.*/.*     http://sources.openembedded.org/ \
 https?://.*/.*  http://sources.openembedded.org/ \
 ftp://.*/.*     http://sources.openembedded.org/ \
 npm://.*/?.*    http://sources.openembedded.org/ \

