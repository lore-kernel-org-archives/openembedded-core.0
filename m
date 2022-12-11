Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725C5C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 17:37:54 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.22174.1670780270538655946
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 09:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ty7SmdEj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso3303293wmo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 09:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOZLBYHq0rEpvdJ0XSkSKfn1/ywI/BBwpvwPL2gE7Uk=;
        b=Ty7SmdEjvoAzpOutWrpKZPE6mw+uZlzIo/eEWQIlietrr1br1K1prmpniMK2uPhlRc
         f+NXQc/ub5CG7+iBfpKCWUko1OxhMSKoxjULLe7PchkNedEaSfHcJ9eCmfYpDx5AuisM
         FLgfj5/IFsYRGhETJd1R1N18i7fbgGjZnIl7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOZLBYHq0rEpvdJ0XSkSKfn1/ywI/BBwpvwPL2gE7Uk=;
        b=66cgAo3JWdveKe3lgGB+aSvrxtsx4zhPWAuxwNU7gDe6sDbnaadW+667e+G5dwnR8p
         NZoUQ9MB/O1Wrw/q3a9orXu6BFFdgXygoIXVHBgmSlywju7eA20GKS2I4DTHiRWf7ASy
         b8Ek18L3DojT0t0WzmlJorIMaU9t6o4vv+tHs8B1SXg9tc7y2iRmwIDfu/ve68xdIO7R
         g4NKVhJA29AkFEUoU1j+nHoCxNFD5rGucWFhiUUvcCOa9+L4uNFoLI1VXQVsvfZkmHKO
         9UKkdHGnfVTL03xRDSDmw8O51/QKAunWOD70Q4b5Sc0AdngXU2KCCvNhtZz745FI0jTD
         TVwg==
X-Gm-Message-State: ANoB5pl+i0j88leErkS2GR7/YYgdOlTK1L8Vd/x6+Z5ama3pO7Zk4YJp
	EzMmGiBIW4gDUcWZKTXxrx3y2D/mYpicg4Zz
X-Google-Smtp-Source: AA0mqf7TkIKzEW3cY0KM0D2Ezx452SfsozKvjHqmR+8XjRY87OuuV1SLvUBTfIKMbt5Lt6B0J7c+UQ==
X-Received: by 2002:a7b:c4d2:0:b0:3d1:f270:a81e with SMTP id g18-20020a7bc4d2000000b003d1f270a81emr10581883wmk.17.1670780268456;
        Sun, 11 Dec 2022 09:37:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:db5:b2f0:a022:4502])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003c71358a42dsm8433732wmq.18.2022.12.11.09.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 09:37:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Update minimum python version to 3.8
Date: Sun, 11 Dec 2022 17:37:46 +0000
Message-Id: <20221211173746.22513-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 17:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174477

Bitbake is moving to a minimum python version of 3.8, update OE-Core
to match to make things consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 6cb0d6cf882..8dfd59f457e 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -759,10 +759,10 @@ def check_sanity_everybuild(status, d):
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", d)
 
-    # Check the Python version, we now have a minimum of Python 3.6
+    # Check the Python version, we now have a minimum of Python 3.8
     import sys
-    if sys.hexversion < 0x030600F0:
-        status.addresult('The system requires at least Python 3.6 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x030800F0:
+        status.addresult('The system requires at least Python 3.8 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     minversion = d.getVar('BB_MIN_VERSION')
-- 
2.37.2


