Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAF4C761AF
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 21:05:02 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.85124.1679605500694393812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 14:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DzQzV6Dk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id z19so100598plo.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 14:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679605500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW7wNNAWR0Fr34lVIxKK60TKG9wYmaMrYam0Ves1xLc=;
        b=DzQzV6DkbTL8/R46srr+DLozAIzDJA0u4v5a1TNfURVqgi9JW4edARseqMwjFGJhbz
         oy02k/LorLCiVDMezUWqXwsboFQzgVeTuyEjOSyNi0sKIdH14UclVA8+kc+h3532v5w5
         2dEgqpmyyS005mUzNJl4l1AMBDHxImZiu1z70Ku4ENwR1/Rk7zLZsdLarExpm8iPham5
         gli2qxD2x+Sao0k9DXs910fGKeZN+BVLDkiBdEDUTXLlfUhry2WXdEDp6YMRVrzAkyZ9
         yihOJ1+Bn68uQDkfyD1Xqhs+Gvzf1Hw2UAzD2hBE+ZUPBbmyWGluOGt0NLXeB7u5LGbO
         UcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679605500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iW7wNNAWR0Fr34lVIxKK60TKG9wYmaMrYam0Ves1xLc=;
        b=FSjCIabcS3J0NQAZf85lTIyJfxfqIBxERZzP3fXSDiDI47ofUNX2KM05v216jFdOtH
         cEyuT2GHITRLcIhDf9nq0RQsa7Fdv0miILS246hqfihXrmXGvbLFkTdET8O1FFvW+85g
         tUj5Gq9ZX0MgBWtau29PCRR+8Bo1Zcsze5IugO/6GUIPRNRFuWC+fqH4vPI4KV3jPSHN
         x+AjA9HGvRc7Xfk+yfzHlkYZtJ5elWpKBCgqUjJ8kOfeL6o9+RSg3uPrsVTsxCb/PPwk
         /BVmXEFtIFv96PSVRH2kRoXYVWpiopKc30nBdqtr5oqi+0vnkItCOFeI8SzB8Xs6Lq5V
         ZsDQ==
X-Gm-Message-State: AAQBX9fkP3mn4fqMGOzF4bk84zKM5SpuwsoSS3X2xHspzam651Kk/G+X
	UAePAVsdevwoJ5ZTFnRUbmmqj/RsLAIM9+dDIS8=
X-Google-Smtp-Source: AKy350arnKaEfKBXCeZE4lvVFp6w967b9yfGDkyPdh0+K8jWJ/peNfxMjQ5/ocSs7BU1rFPTYpDSgg==
X-Received: by 2002:a17:902:ea0d:b0:1a1:f6d9:2c26 with SMTP id s13-20020a170902ea0d00b001a1f6d92c26mr188312plg.61.1679605499799;
        Thu, 23 Mar 2023 14:04:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001a198adb190sm12760417pll.88.2023.03.23.14.04.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:04:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/14] devtool/upgrade: do not delete the workspace/recipes directory
Date: Thu, 23 Mar 2023 11:04:32 -1000
Message-Id: <4ad488d2453525b7196e6d2406ac526412e3c560.1679605352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679605352.git.steve@sakoman.com>
References: <cover.1679605352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 21:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178998

From: Alexander Kanavin <alex.kanavin@gmail.com>

If it exists, there is no need to delete it, and if it does not,
devtool prints an ugly traceback.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit af82e59e8f08369aabd5fa6eb43022982d4e59a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/upgrade.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 967d157077..6c4a62b558 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -125,11 +125,8 @@ def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, rev, copied,
     return af
 
 def _cleanup_on_error(rd, srctree):
-    rdp = os.path.split(rd)[0] # recipes folder
     if os.path.exists(rd):
         shutil.rmtree(rd)
-    if not len(os.listdir(rdp)):
-        os.rmdir(rdp)
     srctree = os.path.abspath(srctree)
     if os.path.exists(srctree):
         shutil.rmtree(srctree)
-- 
2.34.1


