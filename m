Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15050E77197
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5189.1735810869948246637
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cPD77f7U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361c705434so81095725e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810868; x=1736415668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLDny0CO/gotCnCW3YPK9aTVIdbs9ovJO1W3PiiqvQY=;
        b=cPD77f7Ur65M4tCrC2aTJ5mLJX1eNsyyXbOSAca0OezqTitJu5VrUvexc/1YjEQvPg
         TtRioa5kHXqNXctTGojbHJkfjjIPaG2ayuyuhVmv9xKkQj4vCmY1SQaPyCMEwx+1//ki
         9vWU1gF7+MziNFPe3d82v44aQ68OTcSZlZnrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810868; x=1736415668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLDny0CO/gotCnCW3YPK9aTVIdbs9ovJO1W3PiiqvQY=;
        b=i894cmiNFNPOveQSnCy1/ED7ddg6wWhJ/LotdjxZjbcPKZeZZU99eJvM3x/9/c2kwH
         23p0c/+tdsTQyH0jlQ63UJZYOs4SHx24epvt7mB0ljIC1B6pWwkkZZt4+p8ldsnoXWZm
         ujal/H2ZbCFpgXE1i6Bjjsf5xJ8p8XvzJ87Txp90BAvQVbI8snA9nC/+Tdr3UvCiTIfZ
         UJ5uPeiIHexvTQrJsvkSEj2R1VGAEGTZF1wksRM+NiqyhFrYmg9aoTrMbzJ4r1MnR05j
         +8296Zhsjn/9OAlO3rBMoAbKL8Hme5fsksCSDrVSG5caXGsgQSyKZOqBkWd8HmTpkUlr
         3Eiw==
X-Gm-Message-State: AOJu0YxwG1ug58/Ho6GIWkH0HSz+6xIqv3pNxtdDNk2QX5tII81AkDzM
	GnSCPOPYy0zhOaFPyTBQdtLvuo+FriUTEOOLY3ToQARzSEhYwfOPCkk4fAYxGGEFKS57Ey+/WMz
	IU9Y=
X-Gm-Gg: ASbGncsMmIkW0d0YKSARf0fYR2FCQgZLtwKavO5+QLVm9ItHIVfWSthOvs3rxXzV86l
	xkFwVbqCbNsC28w/pR3FYiUKTOJeeFpS3qXzpUDSOqwS1SkST2P4wJwsaRCzjsgCj4DNAiFDbgS
	Gv1/naTJfKr9kMu7EyX68hhqTyGtS/MkDhJSYuPuQZVsAlWYOieFBM4C2ydAWaXpEJ+X8IuJVA6
	8Yc1Dms87XufaT5TBbMxymcXVX2epRsDf9WGH7Iv9RHBAGe9+N1rF/NfGSSjfru1W04x5xZDg3H
	YvTZic6a3A==
X-Google-Smtp-Source: AGHT+IGv5O9KhQruTWk9eFic0NR4BiwEYXLYdlgEuRpdnxXKRYLNlFgocFxfxN/JQBpNT/VFsWsD3A==
X-Received: by 2002:a05:600c:3554:b0:434:9934:575 with SMTP id 5b1f17b1804b1-436686461d6mr394532885e9.16.1735810867898;
        Thu, 02 Jan 2025 01:41:07 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/21] debianutils: upgrade 5.20 -> 5.21
Date: Thu,  2 Jan 2025 09:40:37 +0000
Message-ID: <20250102094059.322187-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209266

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../debianutils/{debianutils_5.20.bb => debianutils_5.21.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.20.bb => debianutils_5.21.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.20.bb b/meta/recipes-support/debianutils/debianutils_5.21.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.20.bb
rename to meta/recipes-support/debianutils/debianutils_5.21.bb
index 61438121dad..e0485b24a35 100644
--- a/meta/recipes-support/debianutils/debianutils_5.20.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.21.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9f3d6fa6b8d91849a78d681294fa8ea7bfa9086f"
+SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
 
 inherit autotools update-alternatives
 

